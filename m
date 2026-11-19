Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=195.135.223.130
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795098106;
	b=ISTBDpmMPoFStn/rMRG7wxT3w8QhL92WSbf8eeUF+iDFeucMOU4joaha9K0zrYp5GtKx
	 QF8Cu5mhJC8Ef6fhDHvJGxknO9DiN7BFxPgu7KS8s4yehqTH50PHT6qcY17hoJHGShvtX
	 Q6gU8mYp/UopaKuW5/xfw/1nUlTTFLenddAaPlCHsKQmH1topFrpqmmDGCWo1bNRroa38
	 f2ghMmd6DgxSVkivXE1STLL8Fdr/kAYbLbfVjvOFxLwg1EIAF8/6blV0niTJOkQr/t9xM
	 7Cax5kgnpg+3kteTlehRb/0HdCGvoD3gEqUbLYCxQ1VEGNBYhae3yye29WEp5KfowHA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795098106;
	h=DMARC-Filter:Received:DKIM-Signature:DKIM-Signature:DKIM-Signature:
	 DKIM-Signature:Received:Received:From:To:Cc:Subject:Date:Message-ID:
	 X-Mailer:In-Reply-To:References:MIME-Version:
	 Content-Transfer-Encoding:X-Spamd-Result:X-Rspamd-Server:
	 X-Rspamd-Action:X-Spam-Flag:X-Spam-Score:X-Spam-Level:
	 X-Rspamd-Queue-Id;
	bh=yPLzsNYWPeXGg/1F+X0Wew3xP/kniKsV2r2RIizBsPI=;
	b=5GQHaBY5cP+0itVeiYMHXhuCGvX1RRskgn9d0Zh+urA1LLua5CSNA2KN/G7MXIEYk2BD
	 8Q0xxxZXB2UALOx2znh68Aolv2carnhLpo/wzxwR/xMMXhsirzRLrrRIzJ/UzeiUAuNbu
	 Z/6Q59O4L6bGjuvb1N90bhO53O9eSbgZPvFjGbA5JILfDHTDvwb3gHBGKVxoPYjZch4r4
	 hiSZJevZH1Snq6wkovKsrs2AN6MXQRQ5HHoKPUIfbH7xp459RMGnJAQezYOQL3aJjRJXe
	 NItjDGk8K+yPUfH4stYfQz3smt/Y9OIxc9qpbBUjbMfjL95r8g5DZGnnZkIX7xyXFlw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=suse.de;
	spf=pass smtp.mailfrom=suse.de;
	dkim=pass header.d=suse.de header.i=@suse.de header.a=rsa-sha256 header.s=susede2_rsa header.b=jHZLH9TL;
	dkim=pass header.d=suse.de header.i=@suse.de header.a=ed25519-sha256 header.s=susede2_ed25519 header.b=UproX6lJ;
	dkim=pass header.d=suse.de header.i=@suse.de header.a=rsa-sha256 header.s=susede2_rsa header.b=jHZLH9TL;
	dkim=neutral header.d=suse.de header.i=@suse.de header.a=ed25519-sha256 header.s=susede2_ed25519 header.b=UproX6lJ;
	arc=none smtp.remote-ip=195.135.223.130
Received: from smtp-out1.suse.de (smtp-out1.suse.de [195.135.223.130])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 899CF606A324
	for <sashiko-reviews@lists.linux.dev>; Thu, 19 Nov 2026 14:21:45 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 899CF606A324
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=suse.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=suse.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.a=rsa-sha256 header.s=susede2_rsa header.b=jHZLH9TL;
	dkim=pass header.d=suse.de header.i=@suse.de header.a=ed25519-sha256 header.s=susede2_ed25519 header.b=UproX6lJ;
	dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.a=rsa-sha256 header.s=susede2_rsa header.b=jHZLH9TL;
	dkim=neutral header.d=suse.de header.i=@suse.de header.a=ed25519-sha256 header.s=susede2_ed25519 header.b=UproX6lJ
Received: from imap1.dmz-prg2.suse.org (imap1.dmz-prg2.suse.org [IPv6:2a07:de40:b281:104:10:150:64:97])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by smtp-out1.suse.de (Postfix) with ESMTPS id CC7C422481;
	Thu, 19 Nov 2026 14:21:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
	t=1795098084; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=yPLzsNYWPeXGg/1F+X0Wew3xP/kniKsV2r2RIizBsPI=;
	b=jHZLH9TLrnxrQSHSrbgVsKPFAGtOfcqFIKlcXHrbHHZdvCOnAp/dmmauYWA/Y/4NLgBYY6
	6jcx0xKBXiBNPD8WgfHZrjhqzxLKaDBHRJ4t/Z94dZu3Lz670L0fcRImeC3k7vNWLJVbUv
	lk7YyPsDAv/jgc4tEv3DBH9Qk9+xOls=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1795098084;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=yPLzsNYWPeXGg/1F+X0Wew3xP/kniKsV2r2RIizBsPI=;
	b=UproX6lJxA2CrXcCpwoQlyiJwkvCpNacJTk4DceWwFPWtpPU1D1Hixm8IvqNVH1mm4SAEB
	nDerlgWxSr/o77Cg==
Authentication-Results: smtp-out1.suse.de;
	dkim=pass header.d=suse.de header.s=susede2_rsa header.b=jHZLH9TL;
	dkim=pass header.d=suse.de header.s=susede2_ed25519 header.b=UproX6lJ
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
	t=1795098084; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=yPLzsNYWPeXGg/1F+X0Wew3xP/kniKsV2r2RIizBsPI=;
	b=jHZLH9TLrnxrQSHSrbgVsKPFAGtOfcqFIKlcXHrbHHZdvCOnAp/dmmauYWA/Y/4NLgBYY6
	6jcx0xKBXiBNPD8WgfHZrjhqzxLKaDBHRJ4t/Z94dZu3Lz670L0fcRImeC3k7vNWLJVbUv
	lk7YyPsDAv/jgc4tEv3DBH9Qk9+xOls=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1795098084;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=yPLzsNYWPeXGg/1F+X0Wew3xP/kniKsV2r2RIizBsPI=;
	b=UproX6lJxA2CrXcCpwoQlyiJwkvCpNacJTk4DceWwFPWtpPU1D1Hixm8IvqNVH1mm4SAEB
	nDerlgWxSr/o77Cg==
Received: from imap1.dmz-prg2.suse.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by imap1.dmz-prg2.suse.org (Postfix) with ESMTPS id 576B71342D;
	Thu, 19 Nov 2026 14:21:24 +0000 (UTC)
Received: from dovecot-director2.suse.de ([2a07:de40:b281:106:10:150:64:167])
	by imap1.dmz-prg2.suse.org with ESMTPSA
	id RynyAeAF/2rJfgAAD6G6ig:T12
	(envelope-from <tzimmermann@suse.de>); Thu, 19 Nov 2026 14:21:24 +0000
From: Thomas Zimmermann <tzimmermann@suse.de>
To: airlied@redhat.com,
	sean@poorly.run,
	tiwai@suse.com,
	patrik.r.jakobsson@gmail.com,
	maarten.lankhorst@linux.intel.com,
	mripard@kernel.org,
	airlied@gmail.com,
	simona@ffwll.ch
Cc: dri-devel@lists.freedesktop.org,
	sashiko-reviews@lists.linux.dev,
	Thomas Zimmermann <tzimmermann@suse.de>
Subject: [PATCH 11/11] drm/udl: Implement URB cache as LIFO stack
Date: Thu, 19 Nov 2026 15:02:23 +0100
Message-ID: <20261119142114.152052-12-tzimmermann@suse.de>
X-Mailer: git-send-email 2.56.0
In-Reply-To: <20261119142114.152052-1-tzimmermann@suse.de>
References: <20261119142114.152052-1-tzimmermann@suse.de>
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
X-Spamd-Result: default: False [-10.51 / 50.00];
	SUSE_INTERNAL_BYPASS(-9.00)[];
	BAYES_HAM(-3.00)[100.00%];
	SUSPICIOUS_RECIPS(1.50)[];
	NEURAL_HAM_LONG(-1.00)[-1.000];
	MID_CONTAINS_FROM(1.00)[];
	R_MISSING_CHARSET(0.50)[];
	R_DKIM_ALLOW(-0.20)[suse.de:s=susede2_rsa,suse.de:s=susede2_ed25519];
	NEURAL_HAM_SHORT(-0.20)[-1.000];
	MIME_GOOD(-0.10)[text/plain];
	MX_GOOD(-0.01)[];
	MIME_TRACE(0.00)[0:+];
	ARC_NA(0.00)[];
	RBL_SPAMHAUS_BLOCKED_OPENRESOLVER(0.00)[2a07:de40:b281:104:10:150:64:97:from];
	TO_MATCH_ENVRCPT_ALL(0.00)[];
	DKIM_SIGNED(0.00)[suse.de:s=susede2_rsa,suse.de:s=susede2_ed25519];
	FREEMAIL_TO(0.00)[redhat.com,poorly.run,suse.com,gmail.com,linux.intel.com,kernel.org,ffwll.ch];
	RCVD_TLS_ALL(0.00)[];
	R_RATELIMIT(0.00)[to_ip_from(RLqtkr6cif1ebgurukgmwdm7xc)];
	TO_DN_SOME(0.00)[];
	RCVD_COUNT_TWO(0.00)[2];
	DBL_BLOCKED_OPENRESOLVER(0.00)[suse.de:email,suse.de:dkim,imap1.dmz-prg2.suse.org:rdns,imap1.dmz-prg2.suse.org:helo];
	FROM_EQ_ENVFROM(0.00)[];
	FROM_HAS_DN(0.00)[];
	DKIM_TRACE(0.00)[suse.de:+];
	DNSWL_BLOCKED(0.00)[2a07:de40:b281:104:10:150:64:97:from];
	RECEIVED_SPAMHAUS_BLOCKED_OPENRESOLVER(0.00)[2a07:de40:b281:106:10:150:64:167:received];
	RCPT_COUNT_SEVEN(0.00)[11];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[];
	FREEMAIL_ENVRCPT(0.00)[gmail.com]
X-Rspamd-Server: rspamd1.dmz-prg2.suse.org
X-Rspamd-Action: no action
X-Spam-Flag: NO
X-Spam-Score: -10.51
X-Spam-Level: 
X-Rspamd-Queue-Id: CC7C422481

Insert completed URBs at the list head of the URB cache instead of
the tail. Improves locality in the CPU cache.

Signed-off-by: Thomas Zimmermann <tzimmermann@suse.de>
---
 drivers/gpu/drm/udl/udl_main.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/udl/udl_main.c b/drivers/gpu/drm/udl/udl_main.c
index adddcf4b3451..ab4db42f71f4 100644
--- a/drivers/gpu/drm/udl/udl_main.c
+++ b/drivers/gpu/drm/udl/udl_main.c
@@ -305,7 +305,7 @@ void udl_put_urb(struct urb *urb)
 	urb->transfer_buffer_length = unode->alloc_size; /* reset to actual */
 
 	scoped_guard(spinlock_irqsave, &udl->urbs.lock) {
-		list_add_tail(&unode->entry, &udl->urbs.list);
+		list_add(&unode->entry, &udl->urbs.list);
 
 		if (!drm_WARN_ON_ONCE(drm, !udl->urbs.in_flight))
 			--udl->urbs.in_flight;
-- 
2.56.0

