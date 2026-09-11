Received: from smtp-out2.suse.de (smtp-out2.suse.de [195.135.223.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 66E32477E37;
	Fri, 11 Sep 2026 12:46:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=195.135.223.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789130777; cv=none; b=nd+YkuVJYW0rL8KKf6QhFatcXIuQaJFnz9VaAaPt/KRSElaecxNTUJ4rxEkeyM26+x1YlI16NpaOt7nIwsIfltH59AWTch7PcbRAv8l4kBEFP3cvlpvUS4TlzAd750ZsyBi1N1HMQKOut4JX57tWCL2cOmp3i22/CTkyWH/VO6U=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789130777; c=relaxed/simple;
	bh=odxnxmaAf2RV3ti0/nNL9HKMt/VzDj+O4M2J6w+83Kw=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=fsiVxWpSMd7Vp+I1jqEd/tWdguZ/LJRpXD50am05NsVRIF79/3VzYKHYDGm34q9scAfRm3OGrGJmh1U6CrXUTkboESDi3+Wso2f8bHgmqyunh3Lm/tGTm9+tGyHKNcWguA482b1LX6ZyFXX5834w5eg6spCzcyX9peWgJAX8IpE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=suse.de; spf=pass smtp.mailfrom=suse.de; dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b=PW8Tgfjv; dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b=6d0ixILu; arc=none smtp.client-ip=195.135.223.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=suse.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=suse.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b="PW8Tgfjv";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="6d0ixILu"
Received: from imap1.dmz-prg2.suse.org (imap1.dmz-prg2.suse.org [IPv6:2a07:de40:b281:104:10:150:64:97])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by smtp-out2.suse.de (Postfix) with ESMTPS id BEDD91FE76;
	Fri, 11 Sep 2026 12:45:47 +0000 (UTC)
Authentication-Results: smtp-out2.suse.de;
	none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
	t=1789130747; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=SnvK6SDSqRaczPeuHNPtlErQ77C4BU5i8ISwXQWL8II=;
	b=PW8TgfjvIstBD9399q7YSvx+2i/FGZUl3rJltk8jc8Lr+ufRqmThDu/eCIyPZenENvBx9s
	DH0TM+g3HHDMOY1y8L13rn3Pa/z1SqGdVQMxHCBC/ZptxRr4K/i7qXRLMJpS9sNT3wgp55
	VIIPPSW8m9eU9hATB0tE/LIA+GjJ/zM=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1789130747;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=SnvK6SDSqRaczPeuHNPtlErQ77C4BU5i8ISwXQWL8II=;
	b=6d0ixILuG3io/xxjsylDalXvRVdoUUZ8JX2BGO0WcTVPY9+P7JMONBsDWKueLA3cyeoAf2
	kKPhjiVx6ujhXHCg==
Received: from imap1.dmz-prg2.suse.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by imap1.dmz-prg2.suse.org (Postfix) with ESMTPS id 1AA2213794;
	Fri, 11 Sep 2026 12:45:47 +0000 (UTC)
Received: from dovecot-director2.suse.de ([2a07:de40:b281:106:10:150:64:167])
	by imap1.dmz-prg2.suse.org with ESMTPSA
	id 6G9NBfv3o2r8EQAAD6G6ig
	(envelope-from <tzimmermann@suse.de>); Fri, 11 Sep 2026 12:45:47 +0000
From: Thomas Zimmermann <tzimmermann@suse.de>
To: jfalempe@redhat.com,
	javierm@redhat.com,
	airlied@gmail.com,
	maarten.lankhorst@linux.intel.com,
	mripard@kernel.org,
	geert@linux-m68k.org,
	rdunlap@infradead.org
Cc: dri-devel@lists.freedesktop.org,
	linux-doc@vger.kernel.org,
	amd-gfx@lists.freedesktop.org,
	rust-for-linux@vger.kernel.org,
	linux-hyperv@vger.kernel.org,
	intel-gfx@lists.freedesktop.org,
	intel-xe@lists.freedesktop.org,
	imx@lists.linux.dev,
	linux-arm-kernel@lists.infradead.org,
	nouveau@lists.freedesktop.org,
	linux-renesas-soc@vger.kernel.org,
	virtualization@lists.linux.dev,
	sashiko-reviews@lists.linux.dev,
	Thomas Zimmermann <tzimmermann@suse.de>
Subject: [PATCH v5 03/14] drm/panic: Return -EINVAL if font is not available
Date: Fri, 11 Sep 2026 14:43:56 +0200
Message-ID: <20260911124540.279841-4-tzimmermann@suse.de>
X-Mailer: git-send-email 2.55.0
In-Reply-To: <20260911124540.279841-1-tzimmermann@suse.de>
References: <20260911124540.279841-1-tzimmermann@suse.de>
Precedence: bulk
X-Mailing-List: sashiko-reviews@lists.linux.dev
List-Id: <sashiko-reviews.lists.linux.dev>
List-Subscribe: <mailto:sashiko-reviews+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:sashiko-reviews+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Spam-Level: 
X-Rspamd-Server: rspamd2.dmz-prg2.suse.org
X-Rspamd-Queue-Id: BEDD91FE76
X-Rspamd-Pre-Result: action=no action;
	module=replies;
	Message is reply to one we originated
X-Spamd-Result: default: False [-4.00 / 50.00];
	REPLY(-4.00)[];
	R_RATELIMIT(0.00)[to_ip_from(RLo585esf9b7txaosbn5shab9z)]
X-Rspamd-Action: no action
X-Spam-Flag: NO
X-Spam-Score: -4.00

Font lookup does not allocate memory. Hence reporting ENOMEM on
failed lookups is misleading. Report EINVAL instead.

Signed-off-by: Thomas Zimmermann <tzimmermann@suse.de>
Reviewed-by: Jocelyn Falempe <jfalempe@redhat.com>
---
 drivers/gpu/drm/drm_panic.c | 4 +++-
 1 file changed, 3 insertions(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/drm_panic.c b/drivers/gpu/drm/drm_panic.c
index d28ce8878e05..62490d32019c 100644
--- a/drivers/gpu/drm/drm_panic.c
+++ b/drivers/gpu/drm/drm_panic.c
@@ -751,8 +751,10 @@ static int _draw_panic_screen_qr_code(struct drm_scanout_buffer *sb)
 	int qr_width, qr_canvas_width, qr_pitch, v_margin;
 	u8 *qr_image;
 
-	if (!font || !qrbuf1 || !qrbuf2 || !stream.workspace)
+	if (!qrbuf1 || !qrbuf2 || !stream.workspace)
 		return -ENOMEM;
+	if (!font)
+		return -EINVAL;
 
 	r_screen = DRM_RECT_INIT(0, 0, sb->width, sb->height);
 
-- 
2.55.0

