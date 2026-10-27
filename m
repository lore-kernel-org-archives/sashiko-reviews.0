Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=195.135.223.130
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793108218;
	b=1yzfzu3TlQJDWKfY+yn/dLgYoD9MbTzVCvnJ6gkp8VP77rVaC/GijsQ7NCwb2cPJS/Xz
	 ZfpNOKtZRfTLYlXR6O7vwaxzWPQ9sCuZWiVBKV3+GvUHC4o/ydnFTfi37spc7+xRh75uL
	 ptKiVb6bJZCYpLfIwUTY/eRc+UH8gLoqUMssYL+oY6FPPFIkttn7wn+0DXfIaF5k6Ue6m
	 /kp1PaF8AMC3pb5qo0RF13r0vVz7jQAZNAaunhHx/a/KyFYwvrbxudpdwu+8nPL+o0Mtg
	 TYgyBPJfpJtmtgvkkBWIsP0e7CR2pM/Jx0i2oAYHMJikm9ZNLQzMmVyZ5kg5Q1Z8Fag==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793108218;
	h=DMARC-Filter:Received:Received:Received:From:To:Cc:Subject:Date:
	 Message-ID:X-Mailer:In-Reply-To:References:MIME-Version:
	 Content-Transfer-Encoding:X-Rspamd-Pre-Result:X-Rspamd-Queue-Id:
	 X-Rspamd-Pre-Result:X-Rspamd-Action:X-Rspamd-Server:X-Spam-Level:
	 X-Spamd-Result:X-Spam-Flag:X-Spam-Score;
	bh=JkITYfDOI3PSx7pGCq29t6+q24bRdNCLZL/xWLiSmVM=;
	b=zcGXyFacDY0bTt10Dz1nzRtQeV3uSwb6W2TzRQc5lPY6n4TaXbgcpuBvJFaq8kfyE6Pf
	 NmY9NvWkuLMh+q8Pv9xH+8OWtRKa+lSvmzma54jjyBxrtdnUqJ0PHsNP9nmZ3b9RUOLBK
	 Aeiol0ZulNvYZcuz8Snr9H7I5Gfz7poWY0kt7gc0iMVulg4G7Oi41TgIVIeC+Wazg44WJ
	 krbyVBKlGE1SKx4JBOHVeaf+qza+sGny9TRgYdrQbOFPG4yT7nVrKqtLmEHohS8flATX/
	 kDfc91hJETK7tXeFz3FoQg9MxAQaslaQlLgUXJqhslJzdr9Y9R7iV09nIV0OxcfT0AA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=suse.de;
	spf=pass smtp.mailfrom=suse.de;
	arc=none smtp.remote-ip=195.135.223.130
Received: from smtp-out1.suse.de (smtp-out1.suse.de [195.135.223.130])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0CD92606A31A
	for <sashiko-reviews@lists.linux.dev>; Tue, 27 Oct 2026 13:36:57 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 0CD92606A31A
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=suse.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=suse.de
Received: from imap1.dmz-prg2.suse.org (imap1.dmz-prg2.suse.org [IPv6:2a07:de40:b281:104:10:150:64:97])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by smtp-out1.suse.de (Postfix) with ESMTPS id E6FB721F2F;
	Tue, 27 Oct 2026 13:36:54 +0000 (UTC)
Authentication-Results: smtp-out1.suse.de;
	none
Received: from imap1.dmz-prg2.suse.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by imap1.dmz-prg2.suse.org (Postfix) with ESMTPS id 9B6E81342D;
	Tue, 27 Oct 2026 13:36:54 +0000 (UTC)
Received: from dovecot-director2.suse.de ([2a07:de40:b281:106:10:150:64:167])
	by imap1.dmz-prg2.suse.org with ESMTPSA
	id wbs7OfSo4GoWVAAAD6G6ig:T7
	(envelope-from <tzimmermann@suse.de>); Tue, 27 Oct 2026 13:36:54 +0000
From: Thomas Zimmermann <tzimmermann@suse.de>
To: deller@gmx.de,
	simona@ffwll.ch
Cc: dri-devel@lists.freedesktop.org,
	linux-fbdev@vger.kernel.org,
	sashiko-reviews@lists.linux.dev,
	Thomas Zimmermann <tzimmermann@suse.de>
Subject: [PATCH 6/6] fbcon: Handle characters with no glyph defined in a consistent way
Date: Tue, 27 Oct 2026 14:27:21 +0100
Message-ID: <20261027133646.297856-7-tzimmermann@suse.de>
X-Mailer: git-send-email 2.56.0
In-Reply-To: <20261027133646.297856-1-tzimmermann@suse.de>
References: <20261027133646.297856-1-tzimmermann@suse.de>
X-Mailing-List: sashiko-reviews@lists.linux.dev
List-Id: <sashiko-reviews.lists.linux.dev>
List-Post: <mailto:sashiko-reviews@lists.linux.dev>
List-Help: <mailto:sashiko-reviews+help@lists.linux.dev>
List-Subscribe: <mailto:sashiko-reviews+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:sashiko-reviews+unsubscribe@lists.linux.dev>
List-Owner: <mailto:sashiko-reviews+owner@lists.linux.dev>
Precedence: list
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Rspamd-Pre-Result: action=no action;
	module=replies;
	Message is reply to one we originated
X-Rspamd-Queue-Id: E6FB721F2F
X-Rspamd-Pre-Result: action=no action;
	module=replies;
	Message is reply to one we originated
X-Rspamd-Action: no action
X-Rspamd-Server: rspamd2.dmz-prg2.suse.org
X-Spam-Level: 
X-Spamd-Result: default: False [-4.00 / 50.00];
	REPLY(-4.00)[]
X-Spam-Flag: NO
X-Spam-Score: -4.00

Check the result of font_data_glyph_buf() for NULL when drawing the
screen. Fall back to a default value of '\0' for undefined glpyhs. Skip
the character if no fallback exists.

Error checking for fonts has been inconsistent or absent from fbcon.
Most of the drawing code relies on earlier validation in the font-import
code. Some code implements the glyph test by itself. At least all of
fbcon should be consistent in how it handles undefined glyphs.

Calls to font_data_glyph_buf() returning NULL for undefined glyphs make
it easy to handle this special case consistently across fbcon.

Signed-off-by: Thomas Zimmermann <tzimmermann@suse.de>
---
 drivers/video/fbdev/core/bitblit.c   | 27 +++++++++++++++++----------
 drivers/video/fbdev/core/fbcon_ccw.c | 12 +++++++++++-
 drivers/video/fbdev/core/fbcon_cw.c  | 13 +++++++++++--
 drivers/video/fbdev/core/fbcon_ud.c  | 18 +++++++++++++++++-
 4 files changed, 56 insertions(+), 14 deletions(-)

diff --git a/drivers/video/fbdev/core/bitblit.c b/drivers/video/fbdev/core/bitblit.c
index b1c90bc29648..e108cd50cb1d 100644
--- a/drivers/video/fbdev/core/bitblit.c
+++ b/drivers/video/fbdev/core/bitblit.c
@@ -80,7 +80,6 @@ static inline void bit_putcs_aligned(struct vc_data *vc, struct fb_info *info,
 				     unsigned char *buf, u8 *dst)
 {
 	u16 charmask = vc->vc_hi_font_mask ? 0x1ff : 0xff;
-	unsigned int charcnt = vc->vc_font.charcount;
 	u32 idx = vc->vc_font.width >> 3;
 	struct fbcon_par *par = info->fbcon_par;
 	u32 s_pitch = font_glyph_pitch(s_width);
@@ -89,9 +88,12 @@ static inline void bit_putcs_aligned(struct vc_data *vc, struct fb_info *info,
 	while (cnt--) {
 		u16 ch = scr_readw(s++) & charmask;
 
-		if (ch >= charcnt)
-			ch = 0;
 		src = font_data_glyph_buf(par->p->fontdata, s_width, s_vpitch, ch);
+		if (!src) {
+			src = font_data_glyph_buf(par->rotated.buf, s_width, s_vpitch, '\0');
+			if (!src)
+				goto next_char;
+		}
 
 		if (attr) {
 			update_attr(buf, src, attr, vc);
@@ -104,7 +106,7 @@ static inline void bit_putcs_aligned(struct vc_data *vc, struct fb_info *info,
 		else
 			fb_pad_aligned_buffer(dst, d_pitch, src, idx,
 					      image->height);
-
+next_char:
 		dst += s_pitch;
 	}
 
@@ -119,7 +121,6 @@ static inline void bit_putcs_unaligned(struct vc_data *vc,
 				       unsigned char *buf, u8 *dst)
 {
 	u16 charmask = vc->vc_hi_font_mask ? 0x1ff : 0xff;
-	unsigned int charcnt = vc->vc_font.charcount;
 	u32 shift_low = 0, mod = vc->vc_font.width % 8;
 	u32 shift_high = 8;
 	u32 idx = vc->vc_font.width >> 3;
@@ -130,9 +131,12 @@ static inline void bit_putcs_unaligned(struct vc_data *vc,
 	while (cnt--) {
 		u16 ch = scr_readw(s++) & charmask;
 
-		if (ch >= charcnt)
-			ch = 0;
 		src = font_data_glyph_buf(par->p->fontdata, s_width, s_vpitch, ch);
+		if (!src) {
+			src = font_data_glyph_buf(par->rotated.buf, s_width, s_vpitch, '\0');
+			if (!src)
+				goto next_char;
+		}
 
 		if (attr) {
 			update_attr(buf, src, attr, vc);
@@ -142,6 +146,7 @@ static inline void bit_putcs_unaligned(struct vc_data *vc,
 		fb_pad_unaligned_buffer(dst, d_pitch, src, idx,
 					image->height, shift_high,
 					shift_low, mod);
+next_char:
 		shift_low += mod;
 		dst += (shift_low >= 8) ? s_pitch : s_pitch - 1;
 		shift_low &= 7;
@@ -271,10 +276,12 @@ static void bit_cursor(struct vc_data *vc, struct fb_info *info, bool enable,
 	attribute = get_attribute(info, c);
 	c &= charmask;
 
-	/* Clamp to font size, same as bit_putcs_aligned() */
-	if (c >= vc->vc_font.charcount)
-		c = 0;
 	src = font_data_glyph_buf(par->p->fontdata, width, vpitch, c);
+	if (!src) {
+		src = font_data_glyph_buf(par->p->fontdata, width, vpitch, '\0');
+		if (!src)
+			return;
+	}
 
 	if (par->cursor_state.image.data != (const char *)src ||
 	    par->cursor_reset) {
diff --git a/drivers/video/fbdev/core/fbcon_ccw.c b/drivers/video/fbdev/core/fbcon_ccw.c
index 9da6c0e41e7a..cbaa75fc1cc1 100644
--- a/drivers/video/fbdev/core/fbcon_ccw.c
+++ b/drivers/video/fbdev/core/fbcon_ccw.c
@@ -109,6 +109,11 @@ static inline void ccw_putcs_aligned(struct vc_data *vc, struct fb_info *info,
 	while (cnt--) {
 		src = font_data_glyph_buf(par->rotated.buf, s_width, s_vpitch,
 					  scr_readw(s--) & charmask);
+		if (!src) {
+			src = font_data_glyph_buf(par->rotated.buf, s_width, s_vpitch, '\0');
+			if (!src)
+				goto next_char;
+		}
 
 		if (attr) {
 			ccw_update_attr(buf, src, attr, vc);
@@ -121,7 +126,7 @@ static inline void ccw_putcs_aligned(struct vc_data *vc, struct fb_info *info,
 		else
 			fb_pad_aligned_buffer(dst, d_pitch, src, idx,
 					      vc->vc_font.width);
-
+next_char:
 		dst += d_pitch * vc->vc_font.width;
 	}
 
@@ -246,6 +251,11 @@ static void ccw_cursor(struct vc_data *vc, struct fb_info *info, bool enable,
  	c = scr_readw((u16 *) vc->vc_pos);
 	attribute = get_attribute(info, c);
 	src = font_data_glyph_buf(par->rotated.buf, width, vpitch, c & charmask);
+	if (!src) {
+		src = font_data_glyph_buf(par->rotated.buf, width, vpitch, c & charmask);
+		if (!src)
+			return;
+	}
 
 	if (par->cursor_state.image.data != (const char *)src ||
 	    par->cursor_reset) {
diff --git a/drivers/video/fbdev/core/fbcon_cw.c b/drivers/video/fbdev/core/fbcon_cw.c
index 354f40f77bb4..7606ad38c269 100644
--- a/drivers/video/fbdev/core/fbcon_cw.c
+++ b/drivers/video/fbdev/core/fbcon_cw.c
@@ -94,7 +94,11 @@ static inline void cw_putcs_aligned(struct vc_data *vc, struct fb_info *info,
 	while (cnt--) {
 		src = font_data_glyph_buf(par->rotated.buf, s_width, s_vpitch,
 					  scr_readw(s++) & charmask);
-
+		if (!src) {
+			src = font_data_glyph_buf(par->rotated.buf, s_width, s_vpitch, '\0');
+			if (!src)
+				goto next_char;
+		}
 		if (attr) {
 			cw_update_attr(buf, src, attr, vc);
 			src = buf;
@@ -106,7 +110,7 @@ static inline void cw_putcs_aligned(struct vc_data *vc, struct fb_info *info,
 		else
 			fb_pad_aligned_buffer(dst, d_pitch, src, idx,
 					      vc->vc_font.width);
-
+next_char:
 		dst += d_pitch * vc->vc_font.width;
 	}
 
@@ -229,6 +233,11 @@ static void cw_cursor(struct vc_data *vc, struct fb_info *info, bool enable,
  	c = scr_readw((u16 *) vc->vc_pos);
 	attribute = get_attribute(info, c);
 	src = font_data_glyph_buf(par->rotated.buf, width, vpitch, c & charmask);
+	if (!src) {
+		src = font_data_glyph_buf(par->rotated.buf, width, vpitch, '\0');
+		if (!src)
+			return;
+	}
 
 	if (par->cursor_state.image.data != (const char *)src ||
 	    par->cursor_reset) {
diff --git a/drivers/video/fbdev/core/fbcon_ud.c b/drivers/video/fbdev/core/fbcon_ud.c
index 01f45eaa2013..bdba3a959d1e 100644
--- a/drivers/video/fbdev/core/fbcon_ud.c
+++ b/drivers/video/fbdev/core/fbcon_ud.c
@@ -96,6 +96,11 @@ static inline void ud_putcs_aligned(struct vc_data *vc, struct fb_info *info,
 	while (cnt--) {
 		src = font_data_glyph_buf(par->rotated.buf, s_width, s_vpitch,
 					  scr_readw(s--) & charmask);
+		if (!src) {
+			src = font_data_glyph_buf(par->rotated.buf, s_width, s_vpitch, '\0');
+			if (!src)
+				goto next_char;
+		}
 
 		if (attr) {
 			ud_update_attr(buf, src, attr, vc);
@@ -108,7 +113,7 @@ static inline void ud_putcs_aligned(struct vc_data *vc, struct fb_info *info,
 		else
 			fb_pad_aligned_buffer(dst, d_pitch, src, idx,
 					      image->height);
-
+next_char:
 		dst += s_pitch;
 	}
 
@@ -133,6 +138,11 @@ static inline void ud_putcs_unaligned(struct vc_data *vc,
 	while (cnt--) {
 		src = font_data_glyph_buf(par->rotated.buf, s_width, s_vpitch,
 					  scr_readw(s--) & charmask);
+		if (!src) {
+			src = font_data_glyph_buf(par->rotated.buf, s_width, s_vpitch, '\0');
+			if (!src)
+				goto next_char;
+		}
 
 		if (attr) {
 			ud_update_attr(buf, src, attr, vc);
@@ -142,6 +152,7 @@ static inline void ud_putcs_unaligned(struct vc_data *vc,
 		fb_pad_unaligned_buffer(dst, d_pitch, src, idx,
 					image->height, shift_high,
 					shift_low, mod);
+next_char:
 		shift_low += mod;
 		dst += (shift_low >= 8) ? s_pitch : s_pitch - 1;
 		shift_low &= 7;
@@ -279,6 +290,11 @@ static void ud_cursor(struct vc_data *vc, struct fb_info *info, bool enable,
  	c = scr_readw((u16 *) vc->vc_pos);
 	attribute = get_attribute(info, c);
 	src = font_data_glyph_buf(par->rotated.buf, width, vpitch, c & charmask);
+	if (!src) {
+		src = font_data_glyph_buf(par->rotated.buf, width, vpitch, '\0');
+		if (!src)
+			return;
+	}
 
 	if (par->cursor_state.image.data != (const char *)src ||
 	    par->cursor_reset) {
-- 
2.56.0

