Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.221.45
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795745302;
	b=SAJ3SMhZbxucFBSJzgDLKFTR4L/TpIwzvI9uAOjsCcVByfGzuR2aqCELM3KaNrssrALR
	 jlJhc5Fv1S9SDHcsRpFU6CQPChz6A8r6c58UNEZan5CLdnJCdNSqRRU+ay5FQQFvt3CFD
	 mvRGR11hNuZEfo80ml60Bgwhu8jPpQHw+d0hW491AsA7FDXIDdae+AxBuKVpEQUx6/di+
	 rdfgqY2JU4xlLQE+rwAFbUHZxXHdUTYiCkUr6InX8oN0jeaDgTpPcKt3nKDd9Y6V3NL5d
	 zzMiSYSm7Lylt0KbdVFEgW/meDqTuKohF7fnrx7sgELyAODtZp7ac48asBZV6csGSpg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795745302;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Transfer-Encoding;
	bh=Zyy33FAdfBAAQH0MmIGIDDo6N5QoH0VVbaF8njRBWYU=;
	b=haMsD7SSYRSbTUbc9urM03Qf82l1RKEFqkvPme/SyOP0qYHhzxVOjbrL7d2wutZXxoYZ
	 o2JNJzbyOi+A+LchwrrN4+TMtP9XUz+N9in6PlN9PzBg03TulpZ3VEJehl3a7WdMWDkAu
	 2mXMW10dnTPr4Xvj/e9Q0nAjL71jmBJW/qPOmeYFHwhWUHs4zCBz5ARvasfDrRiGtD5ae
	 rb9HiqxEd/r/0oeY7rn2BZtJsUKlamWT3jO0zPQJ71Q6pZ873ytDd0yDlgiD7uKjq/aDI
	 fP0MEQY8ChPM9x0YErib00r9uArU/TEoC+Q8pUl2Ou1vM/hVr4rwSYiEBkU/onV2UZA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=GhXV5EFT;
	arc=none smtp.remote-ip=209.85.221.45
Received: from mail-wr1-f45.google.com (mail-wr1-f45.google.com [209.85.221.45])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C1190606A324
	for <sashiko-reviews@lists.linux.dev>; Fri, 27 Nov 2026 02:08:21 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org C1190606A324
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=GhXV5EFT
Received: by mail-wr1-f45.google.com with SMTP id ffacd0b85a97d-4a3e706b5dfso4772879f8f.2
        for <sashiko-reviews@lists.linux.dev>; Thu, 26 Nov 2026 18:08:21 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1795745300; x=1796350100; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=Zyy33FAdfBAAQH0MmIGIDDo6N5QoH0VVbaF8njRBWYU=;
        b=GhXV5EFTnp17pg/gnD7Ttm5r6nLzn/llKGzpfrOMo8MREKaiHZ9GQsZXZRnNdpMX+V
         fF3xJdrcF71ZSlVEx1ioxu9Tq9OusMwmgDZiYBIo33CrK3Ift1u8BqmeKr4VsSKSuuGH
         F8ocwl/kuI7UVuQ3TDcFxp771oOux1Nif+ADoFPOnjubn3EiYF6ToSbJh0SoetDKqgNj
         U3eASLS/XXEE8MHeMuWpAZR+Ov/QYFbdpneIniOeAW2o5KTdX6ZEvfvsAiC8Ji6lsBza
         KcNQPFvTVOm0CIGojJc5mnq9om+4xZWCRtuegr5ROivfvDb0iqFI4DHNwGEZ8Yy86DzU
         j11w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795745300; x=1796350100;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=Zyy33FAdfBAAQH0MmIGIDDo6N5QoH0VVbaF8njRBWYU=;
        b=kkHMNboCfAnOopTGdsbIPqCuAQ9Cd6N2bBiFTWUex06N6qs8NXcaBHQyAujwcjLM3V
         dgJIHcIHmusmeTxtAhhW6LCbulOS8G57K+tC5XbN8IpanryVTv3GDRSnv/ccwBSsKqYB
         48et2LQR2Oi56c8IcZDgTxiYf31Oan4Ck4SgnQT9S907drN7DoDNPCRTuUMbbr3GC+Z9
         ZC7OBQ20Sx7sXAh0YsjmPFhdFdWsLE4XkRzQY7p34yi60lHPKVJTESEgsBps/G48ZMUI
         PzdI9EyjzVkXrg1aJ0W9g5WgLgI1JVsVzv6j4GGz1pCwowulkeuLFU5PcqjIiOFsXA/k
         NsNg==
X-Forwarded-Encrypted: i=1; AL+hErEVJpzvXDxXQzuaR60bUzJcfFaC5XvKzw4rIomviFG8eHtkYjY8+46g1GYvVXI55Nth/J3LPxYm+VAJbWEkc9A=@lists.linux.dev
X-Gm-Message-State: APuU4Z+B7oOZsuofvKS80jWptWIcOFbOJt9bOvyp4I+GBhOJlW5Z3Rk9
	mm2SzQ9NLP/mDuYfXwbI3LfhaBl+pNUPPLxZFUPZLUi2tBYrY0fkVJNo
X-Gm-Gg: AZFdTZcKPkcQnWmiLNvNj53OtUaja3T+lvI7y22cb4ykT04ZuJ3qjvzzIv8PQVC19Jb
	XqnjDXzGqQGMM0nAK8K2ZwxvNS4y5agb9kPzUC9uilb1qEh2aWtAhyXDBYd/Wuqs2BuOtrFsfNC
	+mYoNrmug+TVTsCOfeIAVSrWpnS5DmIBKXouZrC6o2NXrp3cTi4PZCmmAHsylokre8MvklU2LbX
	2ggK4dq16B81ILiKCiDWZtc+oTRUBaRFNSht2NkIPzLk1MUOg0+EB/joEK0atJRs44YmhIVmPg1
	QCVzgc1LaGmDSx6VEMUmGO+NG7Maj/vp92PYlh+I3jj7wBD+CXqSrj3YP3ecKfep9BM9ENEeT7V
	zdS33jUTbH+d/K7bkPrNGw11x/5YAaO/xWXZDkOkOQRbpCd+8/22Mzgk2F9D3AvNqu64+4xoBhj
	670jmf+UJJDJ8vrabkDlq4sPcLgYeid9hBJjyPm2CqQuGwof+QDMJekG855PET4mnjTpm/+4Mmj
	2E6zI1b5y3x1QCUFoCPp5phRPvquFu5SqoatPhmTpjrW3Jy/ht1xZTMeZT5wPNkEICB1Q0C/aUd
	aoqjReoxYF6UB0J0OwwHPVfX3JyHWhx12reDk7df6eRrARi+XvQhRdcHIp9lkm/DMJLPUqWLBol
	GdeZxvuaaN7rKf7WDRTagu6cR/776ltuTqdalUr7RZcKIoQ==
X-Received: by 2002:a05:6000:40ca:b0:4a3:976e:27a2 with SMTP id ffacd0b85a97d-4abb5146238mr44410235f8f.34.1795745300251;
        Thu, 26 Nov 2026 18:08:20 -0800 (PST)
Received: from romain-ThinkPad-P14s-Gen-5-AMD.tail433d9c.ts.net ([2001:861:39c2:e340:1432:1241:93b7:7b4b])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-4ab6baa3882sm43390844f8f.49.2026.11.26.18.08.19
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 26 Nov 2026 18:08:20 -0800 (PST)
From: Romain TISSERAND <romain.tisserand@gmail.com>
To: Jagan Teki <jagan@amarulasolutions.com>,
	Neil Armstrong <neil.armstrong@linaro.org>,
	Jessica Zhang <jesszhan0024@gmail.com>
Cc: Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
	Maxime Ripard <mripard@kernel.org>,
	Thomas Zimmermann <tzimmermann@suse.de>,
	David Airlie <airlied@gmail.com>,
	Simona Vetter <simona@ffwll.ch>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	dri-devel@lists.freedesktop.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	sashiko-reviews@lists.linux.dev
Subject: [PATCH 3/4] drm/panel: st7701: let a panel provide its own init sequence and DSI flags
Date: Fri, 27 Nov 2026 03:08:14 +0100
Message-ID: <20261127020815.1621790-4-romain.tisserand@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20261127020815.1621790-1-romain.tisserand@gmail.com>
References: <20261127020815.1621790-1-romain.tisserand@gmail.com>
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

Every DSI panel handled by the driver gets its init sequence from
st7701_init_sequence(), which encodes the Command2 BK0/BK1 settings from
the panel timings and descriptor fields, followed by a panel specific
GIP sequence. All of them also run in burst video mode.

Some vendor init tables don't fit that encoding, and some panels don't
work in burst mode. Add two optional descriptor fields:

- init_sequence: sent instead of the generic sequence and the GIP
  sequence;
- mode_flags: DSI mode flags to use instead of the default ones.

No change for the existing panels, which set neither.

Signed-off-by: Romain TISSERAND <romain.tisserand@gmail.com>
---
 drivers/gpu/drm/panel/panel-sitronix-st7701.c | 27 +++++++++++++++----
 1 file changed, 22 insertions(+), 5 deletions(-)

diff --git a/drivers/gpu/drm/panel/panel-sitronix-st7701.c b/drivers/gpu/drm/panel/panel-sitronix-st7701.c
index 31c56eadda12..f288c8c8aab8 100644
--- a/drivers/gpu/drm/panel/panel-sitronix-st7701.c
+++ b/drivers/gpu/drm/panel/panel-sitronix-st7701.c
@@ -128,6 +128,16 @@ struct st7701_panel_desc {
 
 	/* GIP sequence, fully custom and undocumented. */
 	void		(*gip_sequence)(struct st7701 *st7701);
+
+	/*
+	 * Complete vendor init sequence, sent instead of the generic one and
+	 * the GIP sequence, for panels whose vendor table does not fit the
+	 * generic encoding.
+	 */
+	void		(*init_sequence)(struct st7701 *st7701);
+
+	/* DSI mode flags, when the default burst mode does not suit the panel */
+	unsigned long	mode_flags;
 };
 
 struct st7701 {
@@ -559,10 +569,14 @@ static int st7701_prepare(struct drm_panel *panel)
 	gpiod_set_value(st7701->reset, 1);
 	msleep(150);
 
-	st7701_init_sequence(st7701);
+	if (st7701->desc->init_sequence) {
+		st7701->desc->init_sequence(st7701);
+	} else {
+		st7701_init_sequence(st7701);
 
-	if (st7701->desc->gip_sequence)
-		st7701->desc->gip_sequence(st7701);
+		if (st7701->desc->gip_sequence)
+			st7701->desc->gip_sequence(st7701);
+	}
 
 	/* Disable Command2 */
 	st7701_switch_cmd_bkx(st7701, false, 0);
@@ -1343,8 +1357,11 @@ static int st7701_dsi_probe(struct mipi_dsi_device *dsi)
 	if (!st7701->desc->lanes)
 		return dev_err_probe(&dsi->dev, -EINVAL, "This panel is not for MIPI DSI\n");
 
-	dsi->mode_flags = MIPI_DSI_MODE_VIDEO | MIPI_DSI_MODE_VIDEO_BURST |
-			  MIPI_DSI_MODE_LPM | MIPI_DSI_CLOCK_NON_CONTINUOUS;
+	if (st7701->desc->mode_flags)
+		dsi->mode_flags = st7701->desc->mode_flags;
+	else
+		dsi->mode_flags = MIPI_DSI_MODE_VIDEO | MIPI_DSI_MODE_VIDEO_BURST |
+				  MIPI_DSI_MODE_LPM | MIPI_DSI_CLOCK_NON_CONTINUOUS;
 	dsi->format = st7701->desc->format;
 	dsi->lanes = st7701->desc->lanes;
 
-- 
2.43.0

