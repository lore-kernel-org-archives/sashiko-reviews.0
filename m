Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.221.43
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794240435;
	b=UbA4fo122yD0D0fRRLePjhO2KFtTnnH7+a0eO9esAZv2wVYllB1OVjVhPSFH1MsJMKg7
	 nADvM5cUqn6O1g9hrNHuho4vCZBs5ctCRXnHeb4cV3aT6M6boxviBEhR87KWQcrqWrwgH
	 tnX5KBsrQnIgWmg95p9OUIDGS1QNkLxHDEpneDVNPpOEgFIuOVB+xrNQyWBaY2k3EFY+M
	 J1/EvHOO3F/7Q21ta9zndHR6XUS7d1pHPlFYNsirgDxUkQ62nqvW4qkqRRgF5ZTou8zbW
	 zUa38lVU9q1lL79yOIZ+Mqi/FTXDOdXeGhPse/frKoJIP5bmetUWdbk4iA0tOPo4Bsg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794240435;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Transfer-Encoding;
	bh=+NgIZ94zuDgUp+uszh12oHM+e3kglPF/onpqBOfOj5g=;
	b=eEWJ527CemA1XZrfIdjVPOHWBynFwQ0tLKk8zcGJ2bTV1UMZb2ZlSKmIPINeIiihtUHx
	 ZGmgF7lJ3lCP9u0UGaEvxMhocYSwoV9RZggJ0/xJwwkwQ4miXTHBsxZZsTJWc9xUtqOmD
	 rXIIegGkSnGztsFcsusTNlg+c8xgGdosJB3T+oi9eXuZwZ+LJnneM4Lz8wyDHjH5fS2P5
	 g7Xx0ps+tnuOmoiIl1881ddZcoIg+kcDw9qBNgICrF09WfpGkJ2tj0V5KWmwtlmNYvQBo
	 gcJXyOVJnLEhdeePWnjkmm0yvwGcGDyQi//UXTzmuZExEDi1xzitj2BtUvMl57eAS6A==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=CAmwlg0s;
	arc=none smtp.remote-ip=209.85.221.43
Received: from mail-wr1-f43.google.com (mail-wr1-f43.google.com [209.85.221.43])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1164C606EE9B
	for <sashiko-reviews@lists.linux.dev>; Mon,  9 Nov 2026 16:07:14 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 1164C606EE9B
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=CAmwlg0s
Received: by mail-wr1-f43.google.com with SMTP id ffacd0b85a97d-492f563d1c6so387270f8f.3
        for <sashiko-reviews@lists.linux.dev>; Mon, 09 Nov 2026 08:07:14 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794240433; x=1794845233; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=+NgIZ94zuDgUp+uszh12oHM+e3kglPF/onpqBOfOj5g=;
        b=CAmwlg0samsD5P6N1orOp5TGp9+2oAsYt2EmDQv7AQqz+clOyhLIfK1oBX5JkkG7qs
         zzS5NWALVw3Agy/nMxUoL5yXSnCD+aU3oyzRNMCeMbyoJ9LsS8U7fuOaDS4zCsiy1Whu
         gJ2HMUx4zlv9PWSocBLecBgkz0U/xVf5gkfJEookQAGv0+2F6g88UmXiIz5VdSfNcI0A
         nWHSwQ3nNGR4YqmWIASvt24AJKu247bYRchjEjci5NXmrAlgFO53+mHkp4eshYSrfHOp
         tbve0cZRubSDBFK7FsBNwLA4qPPa1eCCcifUtXOpicX/1GIIEjp7zatF7AItr62+Nbe/
         EjCQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794240433; x=1794845233;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=+NgIZ94zuDgUp+uszh12oHM+e3kglPF/onpqBOfOj5g=;
        b=WhNSRnLJDAWB97t+VdAVpO7y2+TMUnRW9UKx3QD79VJJOB4/lfIfFbuzkKYIIFBlW9
         mTEVKf8XU9Ls8JvqEeE+pubwyZ3MyiRF+PFr8Yv5VRSLw/WJuWpQE9ElJDDohu54dcyp
         EtnCYidCLA+ntHeIWSvu8MelWaMYZQQCaaOGOkhx+9iItMBv+vOV9T3eJozbZSjPHygF
         14m8aQXbUa8ZLMqy0+d7JWpvUmnOUAfI5PyCd5M6C8jv+BuXL4VEVcv93QbpNJlneaco
         wqyi4fI1/Km8L+OI50IBAyKiXAcYnIJEH19b+FFhu8Htqcj2iBXTi0MrhHqtLc4Nzndz
         VvrA==
X-Forwarded-Encrypted: i=1; AL+hErGGNNYWz6mFkp8eNZDDuFQwRVKvoz9FEK1tr/ZqR7RYMnwp48eHROcZD5ptFliB/Hybzif74kotT+otZ/GHYF4=@lists.linux.dev
X-Gm-Message-State: APuU4Z++XwaShTuL0WrcbbrOFodqWLNXcw5r7n0nSggcKcacAm1m0gjd
	vs3iBbtQZ5RhJnxsX6BrVT3HqRmVczcdorENJ4FQOQEoud0MC2yCTQ6E
X-Gm-Gg: AYBFou3PoXbkWIoZ+XbJXR7VGgzsPrFHLeGlJdS3hW3pjR2lqdzuYer4X9HHf5SIeWq
	uvxMPVfAWg1zIqk/mCFQR+GJdChdJqXsVAysF0gWZt64hfM+P0tGcRNIHsA2epTnqJ8KwArmdSA
	AfzbLd+szzDRMb7INCCeCrmL/wZb/OJ9gJ74AExj/1hFvLIiLZB2yExdo36CXWRtG5YHr58ggD5
	uVfEIZQbCYOJVl32V1EjIWcDJm70+pBXZuhIVhNtu/BqUMgQlZTKpiH6aNyb6cZseiukyv8QXXG
	djK3S33bofnWC8XeSjaJY8fSN322Uz4sZ5SLjsMjjwox4mlgSdy3k5CoE9N4qK7Z1Gev9aiaZv6
	hYFqeJLe5wD5jb8F/AtvLgMfPxZwmNIrp8JrTZni9S96UGhgoiK6PT2/eCcxDEZUyuia97V5s5U
	w1Y8wVfd6r7DBz4Y8tEMBtpUfZaxF2OU6oIk4O8D3xTmPcBlnJ4iGae+WpraVHSKG74TH6M3lnw
	/UCvMszO34VaxJKkmr8L+3dE8yjhqOcOWnQm3Eub03Ln7mxEak8b7i4Ex1weIHylMpwPygHXtNV
	A0io4RRjadc2uZ/cA0Qu89aR+tGtRBN/ka5no5ep/HJNJuesU/uQ6xZVExJQZaKHGSifURn645H
	vowjs5uhrJnZ7aEIuFKqOEktTUCrqvHfBMPjuBHZFdNE800OZowz8TyCdf5tGUIA=
X-Received: by 2002:a05:600c:1d0a:b0:4b1:4017:c4f4 with SMTP id 5b1f17b1804b1-4b963c741f8mr77671625e9.20.1794240433343;
        Mon, 09 Nov 2026 08:07:13 -0800 (PST)
Received: from romain-ThinkPad-P14s-Gen-5-AMD.tail433d9c.ts.net ([2001:863:742:6109:ac9d:152:38c3:6463])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4b90f119b96sm159174245e9.15.2026.11.09.08.07.12
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 09 Nov 2026 08:07:13 -0800 (PST)
From: Romain TISSERAND <romain.tisserand@gmail.com>
To: Igor Reznichenko <igor@reznichenko.net>,
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
Subject: [PATCH v2 3/3] drm/panel: ilitek-ili9488: add the PocketGo S30 panel
Date: Mon,  9 Nov 2026 17:07:06 +0100
Message-ID: <20261109160706.2272332-4-romain.tisserand@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20261109160706.2272332-1-romain.tisserand@gmail.com>
References: <20261109160706.2272332-1-romain.tisserand@gmail.com>
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

The Miyoo PocketGo S30 handheld (Allwinner A33) has a 320x480 1-lane
MIPI-DSI panel built around an Ilitek ILI9488.

The init sequence is the stock kernel's, read back from the running
stock system. It differs from the E35GH-I-MW800CB sequence only in VCOM
(0x26 instead of 0x25), the display function control (2 parameters
instead of 3) and the position of the inversion command. The interface
pixel format (COLMOD) is kept at the stock value.

Timings and video mode are from the stock configuration: 12 MHz pixel
clock, htotal 382, vtotal 524, active low sync (lcd_hv_sync_polarity 0),
non-burst video mode with sync pulses and without EoT packets.

Reviewed-by: Igor Reznichenko <igor@reznichenko.net>
Signed-off-by: Romain TISSERAND <romain.tisserand@gmail.com>
---
 drivers/gpu/drm/panel/panel-ilitek-ili9488.c | 55 ++++++++++++++++++++
 1 file changed, 55 insertions(+)

diff --git a/drivers/gpu/drm/panel/panel-ilitek-ili9488.c b/drivers/gpu/drm/panel/panel-ilitek-ili9488.c
index 6ab8ae72abbf..29b869a6e909 100644
--- a/drivers/gpu/drm/panel/panel-ilitek-ili9488.c
+++ b/drivers/gpu/drm/panel/panel-ilitek-ili9488.c
@@ -86,6 +86,50 @@ static const struct drm_display_mode e35gh_i_mw800cb_display_mode = {
 	.type = DRM_MODE_TYPE_DRIVER | DRM_MODE_TYPE_PREFERRED,
 };
 
+static void pocketgo_s30_init(struct mipi_dsi_multi_context *ctx)
+{
+	/* Gamma control 1,2 */
+	mipi_dsi_dcs_write_seq_multi(ctx, 0xE0, 0x00, 0x10, 0x14, 0x01, 0x0E, 0x04, 0x33,
+				     0x56, 0x48, 0x03, 0x0C, 0x0B, 0x2B, 0x34, 0x0F);
+	mipi_dsi_dcs_write_seq_multi(ctx, 0xE1, 0x00, 0x12, 0x18, 0x05, 0x12, 0x06, 0x40,
+				     0x34, 0x57, 0x06, 0x10, 0x0C, 0x3B, 0x3F, 0x0F);
+	/* Power control 1,2 */
+	mipi_dsi_dcs_write_seq_multi(ctx, 0xC0, 0x0F, 0x0C);
+	mipi_dsi_dcs_write_seq_multi(ctx, 0xC1, 0x41);
+	/* VCOM Control */
+	mipi_dsi_dcs_write_seq_multi(ctx, 0xC5, 0x00, 0x26, 0x80);
+	mipi_dsi_dcs_write_seq_multi(ctx, 0x36, 0x48);
+	/* Interface pixel format 18bpp */
+	mipi_dsi_dcs_write_seq_multi(ctx, 0x3A, 0x66);
+	mipi_dsi_dcs_write_seq_multi(ctx, 0xB0, 0x00);
+	mipi_dsi_dcs_write_seq_multi(ctx, 0xB1, 0xA0);
+	mipi_dsi_dcs_write_seq_multi(ctx, 0xB4, 0x02);
+	mipi_dsi_dcs_write_seq_multi(ctx, 0xB6, 0x02, 0x02);
+	mipi_dsi_dcs_write_seq_multi(ctx, 0xE9, 0x00);
+	mipi_dsi_dcs_write_seq_multi(ctx, 0x21);
+	mipi_dsi_dcs_write_seq_multi(ctx, 0xF7, 0xA9, 0x51, 0x2C, 0x82);
+}
+
+static const struct drm_display_mode pocketgo_s30_display_mode = {
+	.clock = 12000,
+
+	.hdisplay = 320,
+	.hsync_start = 320 + 22,
+	.hsync_end = 320 + 22 + 12,
+	.htotal = 320 + 22 + 12 + 28,
+
+	.vdisplay = 480,
+	.vsync_start = 480 + 22,
+	.vsync_end = 480 + 22 + 4,
+	.vtotal = 480 + 22 + 4 + 18,
+
+	.width_mm = 49,
+	.height_mm = 74,
+
+	.flags = DRM_MODE_FLAG_NHSYNC | DRM_MODE_FLAG_NVSYNC,
+	.type = DRM_MODE_TYPE_DRIVER | DRM_MODE_TYPE_PREFERRED,
+};
+
 static inline struct ili9488 *panel_to_ili9488(struct drm_panel *panel)
 {
 	return container_of(panel, struct ili9488, panel);
@@ -269,8 +313,19 @@ static const struct ili9488_desc e35gh_i_mw800cb_desc = {
 	.bpc = 6,
 };
 
+static const struct ili9488_desc pocketgo_s30_desc = {
+	.init_sequence = pocketgo_s30_init,
+	.display_mode = &pocketgo_s30_display_mode,
+	.mode_flags = MIPI_DSI_MODE_VIDEO | MIPI_DSI_MODE_VIDEO_SYNC_PULSE |
+		      MIPI_DSI_MODE_LPM | MIPI_DSI_MODE_NO_EOT_PACKET,
+	.format = MIPI_DSI_FMT_RGB888,
+	.lanes = 1,
+	.bpc = 6,
+};
+
 static const struct of_device_id ili9488_of_match[] = {
 	{ .compatible = "focuslcds,e35gh-i-mw800cb", .data = &e35gh_i_mw800cb_desc },
+	{ .compatible = "miyoo,pocketgo-s30-panel", .data = &pocketgo_s30_desc },
 	{ }
 };
 
-- 
2.43.0

