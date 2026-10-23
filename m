Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=195.135.223.130
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792761896;
	b=JPvGThLrZ4buw2Y0m1wXtbyqJj4kS2Byk6MnFHFj15ZzN4K9voohKjEjji+Qcyar+nKR
	 byak0QLLgimneM1TIybGgo9w9+EKY3R7o1/0KJ6uAZRDZXSaDbMKobQeb1j2XEoLZoB0t
	 6dKH9M8xXPUIWNppCu6WcdtqrrJFS2PfgtCHc1plWCYWKTLecuQ0w9VtaIJIWfQjMZ4gs
	 zGPzWyr9aHy5oyrvwyJigBaui4xJD65BoXUfRVxGYOns54JjaJ8QngTC7b8gbAJJjndlJ
	 bweu2yLaJsGbmieIemrOc0otBy54PW7MYIFTX6hhlLMzpuL/D7F1QOPrMg/l6m8ueoQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792761896;
	h=DMARC-Filter:Received:DKIM-Signature:DKIM-Signature:DKIM-Signature:
	 DKIM-Signature:Received:Received:From:To:Cc:Subject:Date:Message-ID:
	 X-Mailer:In-Reply-To:References:MIME-Version:
	 Content-Transfer-Encoding:X-Spamd-Result:X-Spam-Score:X-Spam-Level:
	 X-Spam-Flag;
	bh=dT92v6jst6Wn6VkhTX59BC8n5a2SVYmz9yZ1pZeV1IU=;
	b=Q3//RxqK93ZdJCVImHGcrCa7obqQNnHVCQxzs12ak+a0XBdht6y/JnpkEcjXPphdNaLN
	 qdb5fb2Fcu0jgur92tR1tqnQxGZKwQLX6x/PxnfK5ARNzNfDSKHnzrNDgtb604dXMTcnc
	 JEiDt1gUL2Bp+G0NeXMqI0lss3g+aoCBwzMf8YcI5q4rSJbZV1M5BKLl1K5k60BudUwYY
	 j2fsgmwca/PDPS/pS+0MEPNId16N4aIz1ThytcZpYH6qt/FadumyFuIHQbz5GK8alYoCJ
	 5PxbdhFF1fEYe/kPHL8iJftSTNafVFUGrMxSViD4bema4Gqv5rwhRPEHBpMUjqik2mg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=suse.de;
	spf=pass smtp.mailfrom=suse.de;
	dkim=pass header.d=suse.de header.i=@suse.de header.a=rsa-sha256 header.s=susede2_rsa header.b="yrKqnu6/";
	dkim=pass header.d=suse.de header.i=@suse.de header.a=ed25519-sha256 header.s=susede2_ed25519 header.b="4gCK0x0/";
	dkim=pass header.d=suse.de header.i=@suse.de header.a=rsa-sha256 header.s=susede2_rsa header.b="yrKqnu6/";
	dkim=neutral header.d=suse.de header.i=@suse.de header.a=ed25519-sha256 header.s=susede2_ed25519 header.b="4gCK0x0/";
	arc=none smtp.remote-ip=195.135.223.130
Received: from smtp-out1.suse.de (smtp-out1.suse.de [195.135.223.130])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7DF6960A260B
	for <sashiko-reviews@lists.linux.dev>; Fri, 23 Oct 2026 13:24:55 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 7DF6960A260B
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=suse.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=suse.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key, unprotected) header.d=suse.de header.i=@suse.de header.a=rsa-sha256 header.s=susede2_rsa header.b=yrKqnu6/;
	dkim=pass header.d=suse.de header.i=@suse.de header.a=ed25519-sha256 header.s=susede2_ed25519 header.b=4gCK0x0/;
	dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.a=rsa-sha256 header.s=susede2_rsa header.b=yrKqnu6/;
	dkim=neutral header.d=suse.de header.i=@suse.de header.a=ed25519-sha256 header.s=susede2_ed25519 header.b=4gCK0x0/
Received: from imap1.dmz-prg2.suse.org (unknown [10.150.64.97])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by smtp-out1.suse.de (Postfix) with ESMTPS id DBE0B2217D;
	Fri, 23 Oct 2026 13:24:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
	t=1792761893; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=dT92v6jst6Wn6VkhTX59BC8n5a2SVYmz9yZ1pZeV1IU=;
	b=yrKqnu6/iJrapFuBDMqWRVS2SUyL7aUbyKkWw00j+6N9m3urEHMjtMkvxP0o2T509Otztd
	6kVuKgbwVr36EXrjQXzlh0vUKHeaKNFotM5j8OtoLDXqps/d68LOaMg+xBMPLfArBWFb6U
	Rr5ucCLKs9ioJTHqGEDdtAEKH4+5z0A=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1792761893;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=dT92v6jst6Wn6VkhTX59BC8n5a2SVYmz9yZ1pZeV1IU=;
	b=4gCK0x0/2KOKqnAZfCOTwQ1sw2jAZkswkWJWlceNNU2ljLBkp106kw8Pm8J3RuBKBTfs5o
	ZlaTgnilMuWuW2DA==
Authentication-Results: smtp-out1.suse.de;
	none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
	t=1792761893; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=dT92v6jst6Wn6VkhTX59BC8n5a2SVYmz9yZ1pZeV1IU=;
	b=yrKqnu6/iJrapFuBDMqWRVS2SUyL7aUbyKkWw00j+6N9m3urEHMjtMkvxP0o2T509Otztd
	6kVuKgbwVr36EXrjQXzlh0vUKHeaKNFotM5j8OtoLDXqps/d68LOaMg+xBMPLfArBWFb6U
	Rr5ucCLKs9ioJTHqGEDdtAEKH4+5z0A=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1792761893;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=dT92v6jst6Wn6VkhTX59BC8n5a2SVYmz9yZ1pZeV1IU=;
	b=4gCK0x0/2KOKqnAZfCOTwQ1sw2jAZkswkWJWlceNNU2ljLBkp106kw8Pm8J3RuBKBTfs5o
	ZlaTgnilMuWuW2DA==
Received: from imap1.dmz-prg2.suse.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by imap1.dmz-prg2.suse.org (Postfix) with ESMTPS id 77EF8134E6;
	Fri, 23 Oct 2026 13:24:53 +0000 (UTC)
Received: from dovecot-director2.suse.de ([2a07:de40:b281:106:10:150:64:167])
	by imap1.dmz-prg2.suse.org with ESMTPSA
	id kolmHiNg22qfRQAAD6G6ig:T6
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
Subject: [PATCH v3 5/7] sticon: Implement struct consw.con_unblank
Date: Fri, 23 Oct 2026 15:16:15 +0200
Message-ID: <20261023132448.115747-6-tzimmermann@suse.de>
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
X-Spam-Level: 
X-Spam-Flag: NO

Implement con_unblank from struct consw. The new function is called
sticon_unblank(). Remove the related code from sticon_blank().

There is no display unblanking in sticon: only return true to redraw
the console.

v3:
- take mode_switch from parameter

Signed-off-by: Thomas Zimmermann <tzimmermann@suse.de>
---
 drivers/video/console/sticon.c | 20 ++++++++++++--------
 1 file changed, 12 insertions(+), 8 deletions(-)

diff --git a/drivers/video/console/sticon.c b/drivers/video/console/sticon.c
index 6f58e6a9e76a..d1b5e1e5594d 100644
--- a/drivers/video/console/sticon.c
+++ b/drivers/video/console/sticon.c
@@ -302,17 +302,20 @@ static bool sticon_switch(struct vc_data *conp)
 static bool sticon_blank(struct vc_data *c, enum vesa_blank_mode blank,
 			 bool mode_switch)
 {
-    if (blank == VESA_NO_BLANKING) {
+	sti_clear(sticon_sti, 0, 0, c->vc_rows, c->vc_cols, BLANK, font_data[c->vc_num]);
+
 	if (mode_switch)
-	    vga_is_gfx = 0;
+		vga_is_gfx = 1;
+
 	return true;
-    }
-    sti_clear(sticon_sti, 0, 0, c->vc_rows, c->vc_cols, BLANK,
-	      font_data[c->vc_num]);
-    if (mode_switch)
-	vga_is_gfx = 1;
+}
 
-    return true;
+static bool sticon_unblank(struct vc_data *c, bool mode_switch)
+{
+	if (mode_switch)
+		vga_is_gfx = 0;
+
+	return true;
 }
 
 static u8 sticon_build_attr(struct vc_data *conp, u8 color,
@@ -356,6 +359,7 @@ static const struct consw sti_con = {
 	.con_scroll		= sticon_scroll,
 	.con_switch		= sticon_switch,
 	.con_blank		= sticon_blank,
+	.con_unblank		= sticon_unblank,
 	.con_font_set		= sticon_font_set,
 	.con_font_default	= sticon_font_default,
 	.con_build_attr		= sticon_build_attr,
-- 
2.56.0

