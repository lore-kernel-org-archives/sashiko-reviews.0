Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=195.135.223.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795175550;
	b=rtuBSGT2Bn4jYEjp3eQDg8MFJLusZRScnpmAwT1M3Aji5AFTTPO7bHpKGG32XOTuAnDZ
	 w8/Ec06miYPXzIU9F0YfYxr1TUUMx/0bG8GD25oky6lK6EhjyCI8QQ1RRF3oowMMz+ff9
	 hff2DRn2zXhNLdJ6oYwZxxWl01QX+K2XZXhqFOmE0WmHCe2oP/ovSTBeBQDHOMaQ3Lws+
	 2gf8riUBgNxuhFUwvonA0poO4nUfy4S4fUV29ZFYm88DpcdyCPIKa97TmFSbmBpo0E3hq
	 yMSzMWUObpgLiK686GSa7XGaPatfp6Xk9CEE9pKqeP22oJPCzvLKWc5WY4wFGvkxduQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795175550;
	h=DMARC-Filter:Received:DKIM-Signature:DKIM-Signature:DKIM-Signature:
	 DKIM-Signature:Received:Received:From:To:Cc:Subject:Date:Message-ID:
	 X-Mailer:In-Reply-To:References:MIME-Version:
	 Content-Transfer-Encoding:X-Spamd-Result:X-Spam-Score:X-Spam-Level:
	 X-Spam-Flag;
	bh=PudVGhLCUlPyWymquxbH/1V/3QTsc6MZYUQUBEgt4b4=;
	b=s50f8Ys4Lfw9Ik9FUTFIAyGf9WL8dlGXoC6h83aL5c/X9fdNVirOUu0bp7G9eJhWpKfC
	 PsTI/5KuTM1jaib77K1LDYGPPtwETF9ztr7N3bSsNiNuUOrRAupGkTnmURkVpmWTC/g8w
	 Y1GsYkppqVfPNw2rs8EeKFBzCM1bRhoyJQkiW2eTe/IfctsJxq/dkTP4b4iI/ooGQJyuV
	 ASyTGwYhkDY6IOqM93vXEScNwtl2+PYfuU+FdikiTjfwc95wZiMSWgojuBVd4naBAAWey
	 OSrhCGJ+xNcUi5nz08ID+wW6W8KQ1a9p9DoB+mJwHxzIjXgSI6hodkW5du1+JeMNf/Q==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=suse.de;
	spf=pass smtp.mailfrom=suse.de;
	dkim=pass header.d=suse.de header.i=@suse.de header.a=rsa-sha256 header.s=susede2_rsa header.b=CXnh3Hj2;
	dkim=pass header.d=suse.de header.i=@suse.de header.a=ed25519-sha256 header.s=susede2_ed25519 header.b=rF4Kt851;
	dkim=pass header.d=suse.de header.i=@suse.de header.a=rsa-sha256 header.s=susede2_rsa header.b=t4bRdPwa;
	dkim=neutral header.d=suse.de header.i=@suse.de header.a=ed25519-sha256 header.s=susede2_ed25519 header.b=goHcT8ke;
	arc=none smtp.remote-ip=195.135.223.131
Received: from smtp-out2.suse.de (smtp-out2.suse.de [195.135.223.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A45C460A2605
	for <sashiko-reviews@lists.linux.dev>; Fri, 20 Nov 2026 11:52:29 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org A45C460A2605
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=suse.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=suse.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.a=rsa-sha256 header.s=susede2_rsa header.b=CXnh3Hj2;
	dkim=pass header.d=suse.de header.i=@suse.de header.a=ed25519-sha256 header.s=susede2_ed25519 header.b=rF4Kt851;
	dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.a=rsa-sha256 header.s=susede2_rsa header.b=t4bRdPwa;
	dkim=neutral header.d=suse.de header.i=@suse.de header.a=ed25519-sha256 header.s=susede2_ed25519 header.b=goHcT8ke
Received: from imap1.dmz-prg2.suse.org (unknown [10.150.64.97])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by smtp-out2.suse.de (Postfix) with ESMTPS id DDA9E1F76C;
	Fri, 20 Nov 2026 11:52:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
	t=1795175548; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=PudVGhLCUlPyWymquxbH/1V/3QTsc6MZYUQUBEgt4b4=;
	b=CXnh3Hj2+g7I6uPPG2m8b00CD4AfQmN1SQPHsdyu618JuPpq0o6UqLDRzeSTO59mGVwku0
	3SBw5AbqNeUGVMkjz0zf8/Gy4BP/QGmBPe75nn2yc9AkoqraGHRsPzDE6Hxpq3pvKM9HXS
	+j/MBuBrydp4h1xJmANqIoSsvnBn2s4=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1795175548;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=PudVGhLCUlPyWymquxbH/1V/3QTsc6MZYUQUBEgt4b4=;
	b=rF4Kt851KVWb25toewwyO3oiGFV7rsKsKxIxNhpAhnyVDYLMckMJNkhVs/oTrEBoue7cFQ
	Ke0kZXwmgF0nj1BQ==
Authentication-Results: smtp-out2.suse.de;
	none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
	t=1795175547; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=PudVGhLCUlPyWymquxbH/1V/3QTsc6MZYUQUBEgt4b4=;
	b=t4bRdPwaAh+7emwQCMzmZi8Gm9B2ucVTfAKtVMXyyozaHXJiHhLf7KEhdlp6XEOxhNfOrM
	Bfl3h6UOtbPlAL37YFOPhSxLTbOgN5FklmXBR4dHOBomEHwIpZkDlMDnF5pE0C5w0o3g2X
	yyaIP/iMPaWUDooE8xhpou3gD4JJUr0=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1795175547;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=PudVGhLCUlPyWymquxbH/1V/3QTsc6MZYUQUBEgt4b4=;
	b=goHcT8kenXYkmjYM+FoEqhxTye6f6QsMBmN/1XwrBGE3ymLso0c186hP/uKrGh/9t45sH9
	DNkZDYxC9u6OU+BQ==
Received: from imap1.dmz-prg2.suse.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by imap1.dmz-prg2.suse.org (Postfix) with ESMTPS id 95C091348F;
	Fri, 20 Nov 2026 11:52:27 +0000 (UTC)
Received: from dovecot-director2.suse.de ([2a07:de40:b281:106:10:150:64:167])
	by imap1.dmz-prg2.suse.org with ESMTPSA
	id UE2UA3o0AGsbDAAAD6G6ig:T6
	(envelope-from <tzimmermann@suse.de>); Fri, 20 Nov 2026 11:52:27 +0000
From: Thomas Zimmermann <tzimmermann@suse.de>
To: deller@gmx.de,
	simona@ffwll.ch
Cc: dri-devel@lists.freedesktop.org,
	linux-fbdev@vger.kernel.org,
	sashiko-reviews@lists.linux.dev,
	Thomas Zimmermann <tzimmermann@suse.de>
Subject: [PATCH v2 5/6] fbcon: Look up glyphs using the font interface
Date: Fri, 20 Nov 2026 12:49:58 +0100
Message-ID: <20261120115215.52092-6-tzimmermann@suse.de>
X-Mailer: git-send-email 2.56.0
In-Reply-To: <20261120115215.52092-1-tzimmermann@suse.de>
References: <20261120115215.52092-1-tzimmermann@suse.de>
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
X-Spamd-Result: default: False [-15.80 / 50.00];
	SUSE_INTERNAL_BYPASS(-9.00)[];
	REPLY(-4.00)[];
	BAYES_HAM(-3.00)[100.00%];
	NEURAL_HAM_LONG(-1.00)[-1.000];
	MID_CONTAINS_FROM(1.00)[];
	R_MISSING_CHARSET(0.50)[];
	NEURAL_HAM_SHORT(-0.20)[-1.000];
	MIME_GOOD(-0.10)[text/plain];
	TO_MATCH_ENVRCPT_ALL(0.00)[];
	ARC_NA(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	FROM_HAS_DN(0.00)[];
	TO_DN_SOME(0.00)[];
	MIME_TRACE(0.00)[0:+];
	RCVD_COUNT_TWO(0.00)[2];
	FROM_EQ_ENVFROM(0.00)[];
	FREEMAIL_TO(0.00)[gmx.de,ffwll.ch];
	DKIM_SIGNED(0.00)[suse.de:s=susede2_rsa,suse.de:s=susede2_ed25519];
	RCVD_TLS_ALL(0.00)[];
	RCPT_COUNT_FIVE(0.00)[6];
	DBL_BLOCKED_OPENRESOLVER(0.00)[imap1.dmz-prg2.suse.org:helo,suse.de:email];
	FREEMAIL_ENVRCPT(0.00)[gmx.de]
X-Spam-Score: -15.80
X-Spam-Level: 
X-Spam-Flag: NO

Replace the open-coded glyph lookup with font_data_glyph_buf() in
implementations of putcs and cursor bitops. As rotated glyphs are
now stored as font_data_t, the regular lookup function for glyphs
works.

Also replace the open-coded size calculations with font-data helpers.

Note that with screen rotation enabled, width and height swap places
for CW and CCW implementations.

Signed-off-by: Thomas Zimmermann <tzimmermann@suse.de>
---
 drivers/video/fbdev/core/bitblit.c   | 23 ++++++++++++++---------
 drivers/video/fbdev/core/fbcon_ccw.c | 14 ++++++++------
 drivers/video/fbdev/core/fbcon_cw.c  | 14 ++++++++------
 drivers/video/fbdev/core/fbcon_ud.c  | 23 ++++++++++++++---------
 4 files changed, 44 insertions(+), 30 deletions(-)

diff --git a/drivers/video/fbdev/core/bitblit.c b/drivers/video/fbdev/core/bitblit.c
index 1cbfbe50bebf..c28329466f05 100644
--- a/drivers/video/fbdev/core/bitblit.c
+++ b/drivers/video/fbdev/core/bitblit.c
@@ -76,13 +76,15 @@ static void bit_clear(struct vc_data *vc, struct fb_info *info, int sy,
 
 static inline void bit_putcs_aligned(struct vc_data *vc, struct fb_info *info,
 				     const u16 *s, u32 attr, u32 cnt,
-				     u32 d_pitch, u32 s_pitch, u32 cellsize,
+				     u32 d_pitch, u32 s_width, u32 s_vpitch,
 				     struct fb_image *image,
 				     unsigned char *buf, u8 *dst)
 {
 	u16 charmask = vc->vc_hi_font_mask ? 0x1ff : 0xff;
 	unsigned int charcnt = vc->vc_font.charcount;
 	u32 idx = vc->vc_font.width >> 3;
+	struct fbcon_par *par = info->fbcon_par;
+	u32 s_pitch = font_glyph_pitch(s_width);
 	const unsigned char *src;
 
 	while (cnt--) {
@@ -90,7 +92,7 @@ static inline void bit_putcs_aligned(struct vc_data *vc, struct fb_info *info,
 
 		if (ch >= charcnt)
 			ch = 0;
-		src = vc->vc_font.data + (unsigned int)ch * cellsize;
+		src = font_data_glyph_buf(par->p->fontdata, s_width, s_vpitch, ch);
 
 		if (attr) {
 			update_attr(buf, src, attr, vc);
@@ -113,7 +115,7 @@ static inline void bit_putcs_aligned(struct vc_data *vc, struct fb_info *info,
 static inline void bit_putcs_unaligned(struct vc_data *vc,
 				       struct fb_info *info, const u16 *s,
 				       u32 attr, u32 cnt, u32 d_pitch,
-				       u32 s_pitch, u32 cellsize,
+				       u32 s_width, u32 s_vpitch,
 				       struct fb_image *image,
 				       unsigned char *buf, u8 *dst)
 {
@@ -122,6 +124,8 @@ static inline void bit_putcs_unaligned(struct vc_data *vc,
 	u32 shift_low = 0, mod = vc->vc_font.width % 8;
 	u32 shift_high = 8;
 	u32 idx = vc->vc_font.width >> 3;
+	struct fbcon_par *par = info->fbcon_par;
+	u32 s_pitch = font_glyph_pitch(s_width);
 	const unsigned char *src;
 
 	while (cnt--) {
@@ -129,7 +133,7 @@ static inline void bit_putcs_unaligned(struct vc_data *vc,
 
 		if (ch >= charcnt)
 			ch = 0;
-		src = vc->vc_font.data + (unsigned int)ch * cellsize;
+		src = font_data_glyph_buf(par->p->fontdata, s_width, s_vpitch, ch);
 
 		if (attr) {
 			update_attr(buf, src, attr, vc);
@@ -156,8 +160,9 @@ static void bit_putcs(struct vc_data *vc, struct fb_info *info,
 	struct fbcon_par *par = info->fbcon_par;
 	struct fb_image image;
 	u32 vyres = GETVYRES(par->p, info);
-	u32 width = DIV_ROUND_UP(vc->vc_font.width, 8);
-	u32 cellsize = width * vc->vc_font.height;
+	u32 width = vc->vc_font.width;
+	u32 vpitch = vc->vc_font.height;
+	u32 cellsize = font_glyph_size(width, vpitch);
 	u32 maxcnt = info->pixmap.size/cellsize;
 	u32 scan_align = info->pixmap.scan_align - 1;
 	u32 buf_align = info->pixmap.buf_align - 1;
@@ -212,10 +217,10 @@ static void bit_putcs(struct vc_data *vc, struct fb_info *info,
 
 		if (!mod)
 			bit_putcs_aligned(vc, info, s, attribute, cnt, pitch,
-					  width, cellsize, &image, buf, dst);
+					  width, vpitch, &image, buf, dst);
 		else
 			bit_putcs_unaligned(vc, info, s, attribute, cnt,
-					    pitch, width, cellsize, &image,
+					    pitch, width, vpitch, &image,
 					    buf, dst);
 
 		image.dx += cnt * vc->vc_font.width;
@@ -289,7 +294,7 @@ static void bit_cursor(struct vc_data *vc, struct fb_info *info, bool enable,
 	/* Clamp to font size, same as bit_putcs_aligned() */
 	if (c >= vc->vc_font.charcount)
 		c = 0;
-	src = vc->vc_font.data + (c * cellsize);
+	src = font_data_glyph_buf(par->p->fontdata, width, vpitch, c);
 
 	if (par->cursor_state.image.data != (const char *)src ||
 	    par->cursor_reset) {
diff --git a/drivers/video/fbdev/core/fbcon_ccw.c b/drivers/video/fbdev/core/fbcon_ccw.c
index 589291caed32..9da6c0e41e7a 100644
--- a/drivers/video/fbdev/core/fbcon_ccw.c
+++ b/drivers/video/fbdev/core/fbcon_ccw.c
@@ -97,7 +97,7 @@ static void ccw_clear(struct vc_data *vc, struct fb_info *info, int sy,
 
 static inline void ccw_putcs_aligned(struct vc_data *vc, struct fb_info *info,
 				    const u16 *s, u32 attr, u32 cnt,
-				    u32 d_pitch, u32 s_pitch, u32 cellsize,
+				    u32 d_pitch, u32 s_width, u32 s_vpitch,
 				    struct fb_image *image,
 				    unsigned char *buf, u8 *dst)
 {
@@ -107,7 +107,8 @@ static inline void ccw_putcs_aligned(struct vc_data *vc, struct fb_info *info,
 	const unsigned char *src;
 
 	while (cnt--) {
-		src = par->rotated.buf + (scr_readw(s--) & charmask) * cellsize;
+		src = font_data_glyph_buf(par->rotated.buf, s_width, s_vpitch,
+					  scr_readw(s--) & charmask);
 
 		if (attr) {
 			ccw_update_attr(buf, src, attr, vc);
@@ -133,8 +134,9 @@ static void ccw_putcs(struct vc_data *vc, struct fb_info *info,
 {
 	struct fb_image image;
 	struct fbcon_par *par = info->fbcon_par;
-	u32 width = font_glyph_pitch(vc->vc_font.height);
-	u32 cellsize = width * vc->vc_font.width;
+	u32 width = vc->vc_font.height;
+	u32 vpitch = vc->vc_font.width;
+	u32 cellsize = font_glyph_size(width, vpitch);
 	u32 maxcnt = info->pixmap.size/cellsize;
 	u32 scan_align = info->pixmap.scan_align - 1;
 	u32 buf_align = info->pixmap.buf_align - 1;
@@ -176,7 +178,7 @@ static void ccw_putcs(struct vc_data *vc, struct fb_info *info,
 		dst = fb_get_buffer_offset(info, &info->pixmap, size);
 		image.data = dst;
 		ccw_putcs_aligned(vc, info, s, attribute, cnt, pitch,
-				 width, cellsize, &image, buf, dst);
+				 width, vpitch, &image, buf, dst);
 		image.dy += image.height;
 		count -= cnt;
 		s -= cnt;
@@ -243,7 +245,7 @@ static void ccw_cursor(struct vc_data *vc, struct fb_info *info, bool enable,
 
  	c = scr_readw((u16 *) vc->vc_pos);
 	attribute = get_attribute(info, c);
-	src = par->rotated.buf + ((c & charmask) * cellsize);
+	src = font_data_glyph_buf(par->rotated.buf, width, vpitch, c & charmask);
 
 	if (par->cursor_state.image.data != (const char *)src ||
 	    par->cursor_reset) {
diff --git a/drivers/video/fbdev/core/fbcon_cw.c b/drivers/video/fbdev/core/fbcon_cw.c
index 87e9dd666953..354f40f77bb4 100644
--- a/drivers/video/fbdev/core/fbcon_cw.c
+++ b/drivers/video/fbdev/core/fbcon_cw.c
@@ -82,7 +82,7 @@ static void cw_clear(struct vc_data *vc, struct fb_info *info, int sy,
 
 static inline void cw_putcs_aligned(struct vc_data *vc, struct fb_info *info,
 				    const u16 *s, u32 attr, u32 cnt,
-				    u32 d_pitch, u32 s_pitch, u32 cellsize,
+				    u32 d_pitch, u32 s_width, u32 s_vpitch,
 				    struct fb_image *image,
 				    unsigned char *buf, u8 *dst)
 {
@@ -92,7 +92,8 @@ static inline void cw_putcs_aligned(struct vc_data *vc, struct fb_info *info,
 	const unsigned char *src;
 
 	while (cnt--) {
-		src = par->rotated.buf + (scr_readw(s++) & charmask) * cellsize;
+		src = font_data_glyph_buf(par->rotated.buf, s_width, s_vpitch,
+					  scr_readw(s++) & charmask);
 
 		if (attr) {
 			cw_update_attr(buf, src, attr, vc);
@@ -118,8 +119,9 @@ static void cw_putcs(struct vc_data *vc, struct fb_info *info,
 {
 	struct fb_image image;
 	struct fbcon_par *par = info->fbcon_par;
-	u32 width = font_glyph_pitch(vc->vc_font.height);
-	u32 cellsize = width * vc->vc_font.width;
+	u32 width = vc->vc_font.height;
+	u32 vpitch = vc->vc_font.width;
+	u32 cellsize = font_glyph_size(width, vpitch);
 	u32 maxcnt = info->pixmap.size/cellsize;
 	u32 scan_align = info->pixmap.scan_align - 1;
 	u32 buf_align = info->pixmap.buf_align - 1;
@@ -159,7 +161,7 @@ static void cw_putcs(struct vc_data *vc, struct fb_info *info,
 		dst = fb_get_buffer_offset(info, &info->pixmap, size);
 		image.data = dst;
 		cw_putcs_aligned(vc, info, s, attribute, cnt, pitch,
-				 width, cellsize, &image, buf, dst);
+				 width, vpitch, &image, buf, dst);
 		image.dy += image.height;
 		count -= cnt;
 		s += cnt;
@@ -226,7 +228,7 @@ static void cw_cursor(struct vc_data *vc, struct fb_info *info, bool enable,
 
  	c = scr_readw((u16 *) vc->vc_pos);
 	attribute = get_attribute(info, c);
-	src = par->rotated.buf + ((c & charmask) * (cellsize));
+	src = font_data_glyph_buf(par->rotated.buf, width, vpitch, c & charmask);
 
 	if (par->cursor_state.image.data != (const char *)src ||
 	    par->cursor_reset) {
diff --git a/drivers/video/fbdev/core/fbcon_ud.c b/drivers/video/fbdev/core/fbcon_ud.c
index a610af1023de..01f45eaa2013 100644
--- a/drivers/video/fbdev/core/fbcon_ud.c
+++ b/drivers/video/fbdev/core/fbcon_ud.c
@@ -83,17 +83,19 @@ static void ud_clear(struct vc_data *vc, struct fb_info *info, int sy,
 
 static inline void ud_putcs_aligned(struct vc_data *vc, struct fb_info *info,
 				    const u16 *s, u32 attr, u32 cnt,
-				    u32 d_pitch, u32 s_pitch, u32 cellsize,
+				    u32 d_pitch, u32 s_width, u32 s_vpitch,
 				    struct fb_image *image,
 				    unsigned char *buf, u8 *dst)
 {
 	struct fbcon_par *par = info->fbcon_par;
 	u16 charmask = vc->vc_hi_font_mask ? 0x1ff : 0xff;
 	u32 idx = vc->vc_font.width >> 3;
+	u32 s_pitch = font_glyph_pitch(s_width);
 	const unsigned char *src;
 
 	while (cnt--) {
-		src = par->rotated.buf + (scr_readw(s--) & charmask) * cellsize;
+		src = font_data_glyph_buf(par->rotated.buf, s_width, s_vpitch,
+					  scr_readw(s--) & charmask);
 
 		if (attr) {
 			ud_update_attr(buf, src, attr, vc);
@@ -116,7 +118,7 @@ static inline void ud_putcs_aligned(struct vc_data *vc, struct fb_info *info,
 static inline void ud_putcs_unaligned(struct vc_data *vc,
 				      struct fb_info *info, const u16 *s,
 				      u32 attr, u32 cnt, u32 d_pitch,
-				      u32 s_pitch, u32 cellsize,
+				      u32 s_width, u32 s_vpitch,
 				      struct fb_image *image,
 				      unsigned char *buf, u8 *dst)
 {
@@ -125,10 +127,12 @@ static inline void ud_putcs_unaligned(struct vc_data *vc,
 	u32 shift_low = 0, mod = vc->vc_font.width % 8;
 	u32 shift_high = 8;
 	u32 idx = vc->vc_font.width >> 3;
+	u32 s_pitch = font_glyph_pitch(s_width);
 	const unsigned char *src;
 
 	while (cnt--) {
-		src = par->rotated.buf + (scr_readw(s--) & charmask) * cellsize;
+		src = font_data_glyph_buf(par->rotated.buf, s_width, s_vpitch,
+					  scr_readw(s--) & charmask);
 
 		if (attr) {
 			ud_update_attr(buf, src, attr, vc);
@@ -154,8 +158,9 @@ static void ud_putcs(struct vc_data *vc, struct fb_info *info,
 {
 	struct fb_image image;
 	struct fbcon_par *par = info->fbcon_par;
-	u32 width = font_glyph_pitch(vc->vc_font.width);
-	u32 cellsize = width * vc->vc_font.height;
+	u32 width = vc->vc_font.width;
+	u32 vpitch = vc->vc_font.height;
+	u32 cellsize = font_glyph_size(width, vpitch);
 	u32 maxcnt = info->pixmap.size/cellsize;
 	u32 scan_align = info->pixmap.scan_align - 1;
 	u32 buf_align = info->pixmap.buf_align - 1;
@@ -200,10 +205,10 @@ static void ud_putcs(struct vc_data *vc, struct fb_info *info,
 
 		if (!mod)
 			ud_putcs_aligned(vc, info, s, attribute, cnt, pitch,
-					 width, cellsize, &image, buf, dst);
+					 width, vpitch, &image, buf, dst);
 		else
 			ud_putcs_unaligned(vc, info, s, attribute, cnt, pitch,
-					   width, cellsize, &image,
+					   width, vpitch, &image,
 					   buf, dst);
 
 		image.dx += image.width;
@@ -273,7 +278,7 @@ static void ud_cursor(struct vc_data *vc, struct fb_info *info, bool enable,
 
  	c = scr_readw((u16 *) vc->vc_pos);
 	attribute = get_attribute(info, c);
-	src = par->rotated.buf + ((c & charmask) * cellsize);
+	src = font_data_glyph_buf(par->rotated.buf, width, vpitch, c & charmask);
 
 	if (par->cursor_state.image.data != (const char *)src ||
 	    par->cursor_reset) {
-- 
2.56.0

