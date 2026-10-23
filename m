Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=195.135.223.130
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792761911;
	b=vdseK7glrEcCeySbyXOYj2sAW627mUuyTglMnVc2HWhBOPUJXdluXqSpakMv3T+778Sa
	 NQO9yzcvcc+5PgJmdHbfrIEEBGYqLhGE308vESaYDNKmQx3njznQ8CCo+M7FA6TIuV4bK
	 sq6kvOGn1xQ6D0LEk+KeGuKb5ywAj0MkCn8PeLAYUjJcgUjj2h2iel4Jf/+jg9VMXURdK
	 s2i9ukuW6RM1YogqfjAO4Fb5sLqhGipDZzxqXhESc4ilIGNIIBvD7t6DgeUTUeVbWtaEP
	 x3fkcrc8mTlDCwTEUJdtBr+phFuJQsynVz95ZS8qJL2zDYw1X71RBWnMmY+zhpCY0Cw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792761911;
	h=DMARC-Filter:Received:DKIM-Signature:DKIM-Signature:DKIM-Signature:
	 DKIM-Signature:Received:Received:From:To:Cc:Subject:Date:Message-ID:
	 X-Mailer:In-Reply-To:References:MIME-Version:
	 Content-Transfer-Encoding:X-Spam-Flag:X-Spam-Level:X-Spamd-Result:
	 X-Spam-Score;
	bh=6yBWKtUnTAauVNFerCgzpT33VAK+P6r7R6dB6glewVY=;
	b=XImWdpm5YJzyu/KQERAyCrFYA0ZqldgGvOPPP4fEU8uCEc1dV684Ui8Oe8THgJfg+a31
	 ADzo86r294HoJKYXlXAJdiN2R4k60WZQ63HU45QYYTSDLs1uK8syR+U/+DK0ZvR5MtxMW
	 LaC1vX9ewmH0zhClEgZMSnK+QoDKo9MqF9/hg1uiI1at9lcJcUOQ2Mj4ODRAH8QHT9osL
	 ytIzH2O5yj0LzesZ0sfqvg4GtINBD7i2HRqLXCT6IiVloZiSCKhQqqnDXeVSpfbLls/Yn
	 ZEhQBv+SdKij7TGpwfLM3zQLu5fIwnhwvOhUQLG+DgxT5N7Tc1cG3o0GMNAvQOW51cQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=suse.de;
	spf=pass smtp.mailfrom=suse.de;
	dkim=pass header.d=suse.de header.i=@suse.de header.a=rsa-sha256 header.s=susede2_rsa header.b=d9Gdi8Ss;
	dkim=pass header.d=suse.de header.i=@suse.de header.a=ed25519-sha256 header.s=susede2_ed25519 header.b=+YBdS7Bt;
	dkim=pass header.d=suse.de header.i=@suse.de header.a=rsa-sha256 header.s=susede2_rsa header.b=d9Gdi8Ss;
	dkim=neutral header.d=suse.de header.i=@suse.de header.a=ed25519-sha256 header.s=susede2_ed25519 header.b=+YBdS7Bt;
	arc=none smtp.remote-ip=195.135.223.130
Received: from smtp-out1.suse.de (smtp-out1.suse.de [195.135.223.130])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6C61960A2629
	for <sashiko-reviews@lists.linux.dev>; Fri, 23 Oct 2026 13:24:56 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 6C61960A2629
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=suse.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=suse.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key, unprotected) header.d=suse.de header.i=@suse.de header.a=rsa-sha256 header.s=susede2_rsa header.b=d9Gdi8Ss;
	dkim=pass header.d=suse.de header.i=@suse.de header.a=ed25519-sha256 header.s=susede2_ed25519 header.b=+YBdS7Bt;
	dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.a=rsa-sha256 header.s=susede2_rsa header.b=d9Gdi8Ss;
	dkim=neutral header.d=suse.de header.i=@suse.de header.a=ed25519-sha256 header.s=susede2_ed25519 header.b=+YBdS7Bt
Received: from imap1.dmz-prg2.suse.org (unknown [10.150.64.97])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by smtp-out1.suse.de (Postfix) with ESMTPS id 331812216B;
	Fri, 23 Oct 2026 13:24:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
	t=1792761894; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=6yBWKtUnTAauVNFerCgzpT33VAK+P6r7R6dB6glewVY=;
	b=d9Gdi8SsFhhTJ8E/xXwj8HAHsJ5tkkDYy7aKpaSoSxxTCs2ZEUgcUpfV4fX11zs962XSda
	zX7hkO5KEbDy3hrpL35SDhJlhlqAq6occ8JAg6s3PytJKaNpKWzyk3/Cn+kqL9ANbZ5gQ7
	44QAbrRy/hlpJNw3YdmlRtuc+YeFKDc=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1792761894;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=6yBWKtUnTAauVNFerCgzpT33VAK+P6r7R6dB6glewVY=;
	b=+YBdS7Btox3FpUQgt4c/IaXCFzLigInRe/rQDj9o6/vWL1N0Ki1FG1u7tvWKTwDhnnTfHr
	IBvf1E2ZREA9sxDg==
Authentication-Results: smtp-out1.suse.de;
	none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
	t=1792761894; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=6yBWKtUnTAauVNFerCgzpT33VAK+P6r7R6dB6glewVY=;
	b=d9Gdi8SsFhhTJ8E/xXwj8HAHsJ5tkkDYy7aKpaSoSxxTCs2ZEUgcUpfV4fX11zs962XSda
	zX7hkO5KEbDy3hrpL35SDhJlhlqAq6occ8JAg6s3PytJKaNpKWzyk3/Cn+kqL9ANbZ5gQ7
	44QAbrRy/hlpJNw3YdmlRtuc+YeFKDc=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1792761894;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=6yBWKtUnTAauVNFerCgzpT33VAK+P6r7R6dB6glewVY=;
	b=+YBdS7Btox3FpUQgt4c/IaXCFzLigInRe/rQDj9o6/vWL1N0Ki1FG1u7tvWKTwDhnnTfHr
	IBvf1E2ZREA9sxDg==
Received: from imap1.dmz-prg2.suse.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by imap1.dmz-prg2.suse.org (Postfix) with ESMTPS id C722F133F6;
	Fri, 23 Oct 2026 13:24:53 +0000 (UTC)
Received: from dovecot-director2.suse.de ([2a07:de40:b281:106:10:150:64:167])
	by imap1.dmz-prg2.suse.org with ESMTPSA
	id kolmHiNg22qfRQAAD6G6ig:T7
	(envelope-from <tzimmermann@suse.de>); Fri, 23 Oct 2026 13:24:53 +0000
From: Thomas Zimmermann <tzimmermann@suse.de>
To: gregkh@linuxfoundation.org,
	jirislaby@kernel.org,
	deller@gmx.de,
	James.Bottomley@HansenPartnership.com,
	simona@ffwll.ch
Cc: linux-kernel@vger.kernel.org,
	linux-serial@vger.kernel.org,
	linux-fbdev@vger.kernel.org,
	linux-parisc@vger.kernel.org,
	sashiko-reviews@lists.linux.dev,
	Thomas Zimmermann <tzimmermann@suse.de>
Subject: [PATCH v3 6/7] vgacon: Implement struct consw.con_unblank
Date: Fri, 23 Oct 2026 15:16:16 +0200
Message-ID: <20261023132448.115747-7-tzimmermann@suse.de>
X-Mailer: git-send-email 2.56.0
In-Reply-To: <20261023132448.115747-1-tzimmermann@suse.de>
References: <20261023132448.115747-1-tzimmermann@suse.de>
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
X-Spam-Flag: NO
X-Spam-Level: 
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
	FREEMAIL_TO(0.00)[linuxfoundation.org,kernel.org,gmx.de,HansenPartnership.com,ffwll.ch];
	DBL_BLOCKED_OPENRESOLVER(0.00)[imap1.dmz-prg2.suse.org:helo,suse.de:email];
	RCVD_TLS_ALL(0.00)[];
	DKIM_SIGNED(0.00)[suse.de:s=susede2_rsa,suse.de:s=susede2_ed25519];
	RCPT_COUNT_SEVEN(0.00)[11];
	R_RATELIMIT(0.00)[to_ip_from(RLqirfcw6gnbcr9a9yhi49fhi6)];
	FREEMAIL_ENVRCPT(0.00)[gmx.de]
X-Spam-Score: -15.80

Implement con_unblank from struct consw with the VESA_NO_BLANKING
case from vgacon_blank(). The new function is called vgacon_unblank().
Remove the duplicated code from vgacon_blank().

v3:
- take mode_switch from parameter
- restore vga_is_gfx setting

Signed-off-by: Thomas Zimmermann <tzimmermann@suse.de>
---
 drivers/video/console/vgacon.c | 46 +++++++++++++++++++---------------
 1 file changed, 26 insertions(+), 20 deletions(-)

diff --git a/drivers/video/console/vgacon.c b/drivers/video/console/vgacon.c
index 2dcb1e38bd6b..e7e6750f1f87 100644
--- a/drivers/video/console/vgacon.c
+++ b/drivers/video/console/vgacon.c
@@ -778,38 +778,43 @@ static bool vgacon_blank(struct vc_data *c, enum vesa_blank_mode blank,
 			 bool mode_switch)
 {
 	switch (blank) {
-	case VESA_NO_BLANKING:		/* Unblank */
-		if (vga_vesa_blanked) {
-			vga_vesa_unblank(&vgastate);
-			vga_vesa_blanked = VESA_NO_BLANKING;
-		}
-		if (vga_palette_blanked) {
-			vga_set_palette(c, color_table);
-			vga_palette_blanked = false;
-			return 0;
-		}
-		vga_is_gfx = false;
-		/* Tell console.c that it has to restore the screen itself */
-		return 1;
-	case VESA_VSYNC_SUSPEND:	/* Normal blanking */
+	case VESA_NO_BLANKING:	/* Normal blanking */
 		if (!mode_switch && vga_video_type == VIDEO_TYPE_VGAC) {
 			vga_pal_blank(&vgastate);
 			vga_palette_blanked = true;
-			return 0;
+			return false;
 		}
 		vgacon_set_origin(c);
-		scr_memsetw((void *) vga_vram_base, BLANK,
-			    c->vc_screenbuf_size);
+		scr_memsetw((void *)vga_vram_base, BLANK, c->vc_screenbuf_size);
 		if (mode_switch)
 			vga_is_gfx = true;
-		return 1;
+		return true;
 	default:		/* VESA blanking */
 		if (vga_video_type == VIDEO_TYPE_VGAC) {
-			vga_vesa_blank(&vgastate, blank - 1);
+			vga_vesa_blank(&vgastate, blank);
 			vga_vesa_blanked = blank;
 		}
-		return 0;
+		return false;
+	}
+}
+
+static bool vgacon_unblank(struct vc_data *c, bool mode_switch)
+{
+	if (vga_vesa_blanked) {
+		vga_vesa_unblank(&vgastate);
+		vga_vesa_blanked = VESA_NO_BLANKING;
+	}
+
+	if (vga_palette_blanked) {
+		vga_set_palette(c, color_table);
+		vga_palette_blanked = false;
+		return false;
 	}
+
+	vga_is_gfx = false;
+
+	/* Tell console.c that it has to restore the screen itself */
+	return true;
 }
 
 /*
@@ -1178,6 +1183,7 @@ const struct consw vga_con = {
 	.con_scroll = vgacon_scroll,
 	.con_switch = vgacon_switch,
 	.con_blank = vgacon_blank,
+	.con_unblank = vgacon_unblank,
 	.con_font_set = vgacon_font_set,
 	.con_font_get = vgacon_font_get,
 	.con_resize = vgacon_resize,
-- 
2.56.0

