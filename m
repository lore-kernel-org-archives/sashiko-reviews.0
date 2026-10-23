Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=195.135.223.130
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792761895;
	b=QUdZDyPXMwfn6Ddla8UifNdLG5ftAjqUDej/UG/8JgHHf8RPQ5UFL310J50Il6IpsNi4
	 lCfAAZofxkomMy5j9QOKWX+RqZrbSlsycchKQyYr9AhQ8rrryc6AVc6/k78m04PAK7s9z
	 m/8UpfVn2e6GjOjaJ5WuGvDx9Q52ZlVKwavLwNGLrNEWs4MME+nwZe+3AF9T1LV9KVgMM
	 PvMaSG9UrXrSyi3K57B1B3aYTiuWKo0wQpfkwCKgBW5fV5x6RYAZxdo33mJLCMHdDVI3c
	 m9xhw496tfArKvIg1+DCo9bd+rx3k1WY2B+z71DyEpOJF9xprLAkQxWacWMh4OoSaww==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792761895;
	h=DMARC-Filter:Received:Received:Received:From:To:Cc:Subject:Date:
	 Message-ID:X-Mailer:In-Reply-To:References:MIME-Version:
	 Content-Transfer-Encoding:X-Rspamd-Pre-Result:X-Rspamd-Queue-Id:
	 X-Rspamd-Pre-Result:X-Rspamd-Action:X-Rspamd-Server:X-Spam-Level:
	 X-Spamd-Result:X-Spam-Flag:X-Spam-Score;
	bh=JFTfF/+dKodAINkeqFDJ9gdDQsEU1yKigXEy0qcWv7k=;
	b=PBVMMYFG638+YY+uotCyafgCEmZwnptXSsKfcD40Cfeeh/h474KnxZaNNnK2BEiGoCyi
	 Q3kvj9Xo3BE7OvB/G+nB5XdsJ0mLGBKEaGZPOXKGfTy6pFE/bzzgmFlfuYbWP+mMKwDle
	 0O0wTPwjVCFcT2Nvy7HM0F0SNUKQtRopjiVU7Cv8VyZSzntoZ45sihluISkzBpNkGs+vK
	 bcPgi/lvP0XGEpTOv8jte6UcEvn0G1pXz/YT6+R2thdHH611fXY+dC+1wdyd5XC9zEeNc
	 /Ekt2l9hn3duKahAkP0pAJOmsKO3KY2FrgrUX0UEDbVg/NABXA6R6ewppv0/k840GAw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=suse.de;
	spf=pass smtp.mailfrom=suse.de;
	arc=none smtp.remote-ip=195.135.223.130
Received: from smtp-out1.suse.de (smtp-out1.suse.de [195.135.223.130])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A8F00606A323
	for <sashiko-reviews@lists.linux.dev>; Fri, 23 Oct 2026 13:24:54 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org A8F00606A323
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=suse.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=suse.de
Received: from imap1.dmz-prg2.suse.org (imap1.dmz-prg2.suse.org [IPv6:2a07:de40:b281:104:10:150:64:97])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by smtp-out1.suse.de (Postfix) with ESMTPS id 3BDA2220A6;
	Fri, 23 Oct 2026 13:24:53 +0000 (UTC)
Authentication-Results: smtp-out1.suse.de;
	none
Received: from imap1.dmz-prg2.suse.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by imap1.dmz-prg2.suse.org (Postfix) with ESMTPS id CFED7134E6;
	Fri, 23 Oct 2026 13:24:52 +0000 (UTC)
Received: from dovecot-director2.suse.de ([2a07:de40:b281:106:10:150:64:167])
	by imap1.dmz-prg2.suse.org with ESMTPSA
	id kolmHiNg22qfRQAAD6G6ig:T4
	(envelope-from <tzimmermann@suse.de>); Fri, 23 Oct 2026 13:24:52 +0000
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
Subject: [PATCH v3 3/7] fbcon: Implement struct consw.con_unblank
Date: Fri, 23 Oct 2026 15:16:13 +0200
Message-ID: <20261023132448.115747-4-tzimmermann@suse.de>
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
X-Rspamd-Pre-Result: action=no action;
	module=replies;
	Message is reply to one we originated
X-Rspamd-Queue-Id: 3BDA2220A6
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

Implement con_unblank from struct consw with the !blank branches from
fbcon_blank(). The new function is called fbcon_unblank(). Remove the
duplicated code from fbcon_blank().

Fbcon tracks fbdev blank state in par->blank_state using fbdev's FB_BLANK
constants. In fbcon_unblank() the stored value is always FB_BLANK_UNBLANK.
In fbcon_blank(), the new blank state is 1 + plus the VESA blank mode
given in the parameter blank.

fbcon_blank() now disables the cursor worker unconditionally.

v3:
- take mode_switch from parameter

Signed-off-by: Thomas Zimmermann <tzimmermann@suse.de>
---
 drivers/video/fbdev/core/fbcon.c | 55 ++++++++++++++++++++++----------
 1 file changed, 38 insertions(+), 17 deletions(-)

diff --git a/drivers/video/fbdev/core/fbcon.c b/drivers/video/fbdev/core/fbcon.c
index d97d94bb8e99..f6139e3c26a2 100644
--- a/drivers/video/fbdev/core/fbcon.c
+++ b/drivers/video/fbdev/core/fbcon.c
@@ -2270,32 +2270,52 @@ static bool fbcon_blank(struct vc_data *vc, enum vesa_blank_mode blank,
 	struct fb_info *info = fbcon_info_from_console(vc->vc_num);
 	struct fbcon_par *par = info->fbcon_par;
 
-	if (mode_switch) {
-		struct fb_var_screeninfo var = info->var;
+	if (mode_switch)
+		par->graphics = true;
 
-		par->graphics = 1;
+	if (fbcon_is_active(vc, info)) {
+		int blank_state = 1 + blank; /* convert VESA to FB_BLANK constant */
 
-		if (!blank) {
-			var.activate = FB_ACTIVATE_NOW | FB_ACTIVATE_FORCE |
-				FB_ACTIVATE_KD_TEXT;
-			fb_set_var(info, &var);
-			par->graphics = 0;
-			par->var = info->var;
+		if (par->blank_state != blank_state) {
+			par->blank_state = blank_state;
+			fbcon_cursor(vc, false);
+			par->cursor_flash = false;
+
+			if (fb_blank(info, blank_state))
+				fbcon_generic_blank(vc, info, true);
 		}
 	}
 
+	fbcon_del_cursor_work(info);
+
+	return false;
+}
+
+static bool fbcon_unblank(struct vc_data *vc, bool mode_switch)
+{
+	struct fb_info *info = fbcon_info_from_console(vc->vc_num);
+	struct fbcon_par *par = info->fbcon_par;
+
+	if (mode_switch) {
+		struct fb_var_screeninfo var = info->var;
+
+		var.activate = FB_ACTIVATE_NOW | FB_ACTIVATE_FORCE | FB_ACTIVATE_KD_TEXT;
+		fb_set_var(info, &var);
+		par->graphics = false;
+		par->var = info->var;
+	}
+
 	if (fbcon_is_active(vc, info)) {
-		if (par->blank_state != blank) {
-			par->blank_state = blank;
-			fbcon_cursor(vc, !blank);
-			par->cursor_flash = (!blank);
+		if (par->blank_state != FB_BLANK_UNBLANK) {
+			par->blank_state = FB_BLANK_UNBLANK;
+			fbcon_cursor(vc, true);
+			par->cursor_flash = true;
 
-			if (fb_blank(info, blank))
-				fbcon_generic_blank(vc, info, blank);
+			if (fb_blank(info, FB_BLANK_UNBLANK))
+				fbcon_generic_blank(vc, info, false);
 		}
 
-		if (!blank)
-			update_screen(vc);
+		update_screen(vc);
 	}
 
 	if (mode_switch || !fbcon_is_active(vc, info) || par->blank_state != FB_BLANK_UNBLANK)
@@ -3145,6 +3165,7 @@ static const struct consw fb_con = {
 	.con_scroll 		= fbcon_scroll,
 	.con_switch 		= fbcon_switch,
 	.con_blank 		= fbcon_blank,
+	.con_unblank		= fbcon_unblank,
 	.con_font_set 		= fbcon_set_font,
 	.con_font_get 		= fbcon_get_font,
 	.con_font_default	= fbcon_set_def_font,
-- 
2.56.0

