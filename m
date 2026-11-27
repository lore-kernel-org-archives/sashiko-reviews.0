Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.128.45
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795745303;
	b=lqGGvm95DKChBLn6mpEHv6SEiXeeQKDI+LCo2h4oYfUPTVXWLLi2J3z+yWof5xYQd9Oj
	 M4o/zicpfOiq7BBOcGL6y3VhIMXF0RTFFjBJrWzcDuO8mCQvlexfTn/RBSjTrHhFnwhTY
	 USaY4SYIl7J3je6FYcz40MBx14066/yQROwYuGeKgV56Pms1n9XUjbjgfslb9wN50RjTY
	 QYLkUocPKUyp5KzvlY/WTxDvNd7tPAphNu8QpfJU5ZY8u/YRlsTp54C2MBOYVYpWkiuiY
	 7U8Bvp0S4ox/wGkwK2s04zRtiWACHARnQ/+sdcoCrnbM8g8pmcWZuo/c1kyRNITVhdg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795745303;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Transfer-Encoding;
	bh=XhodWS1aWkSeFvJLIKsGNbnaDQgoaSu4UhdyHeAK+6E=;
	b=blGctn0Njtn6+5eFsdRDnMrXJpImgLy81kp7hdEmqU/QSCNPsK712JpZZFuopGgxy0uE
	 CmrV5T/BEd3ReEvh9aImZfZr+v6nfjMyNiJsU2ElzOf6zQuv2Gwu9rKuLEhvf8S9BwmIW
	 UcJhYJHbIj2xJxcmsK/Qw+TOKO5mOUhFbau+EoO10KyYwNVX3BgHIraV8U/ASslaoKQew
	 tOzEnZ0Lg1lR0AFqR4zLmNPcG+1LvJuh4wMqrAo7qLrFbwb5a1GtShl1BpEdqvOHvdlo7
	 V8UnffrVojY7yQlbZGBVynqLymhmixWCrK/39M9CVUs0M8oLHZgO3ZkLIUrwOsxcnpw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=udpJc7Ne;
	arc=none smtp.remote-ip=209.85.128.45
Received: from mail-wm1-f45.google.com (mail-wm1-f45.google.com [209.85.128.45])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A91D4606A695
	for <sashiko-reviews@lists.linux.dev>; Fri, 27 Nov 2026 02:08:22 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org A91D4606A695
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=udpJc7Ne
Received: by mail-wm1-f45.google.com with SMTP id 5b1f17b1804b1-4a5177d78c7so76697405e9.2
        for <sashiko-reviews@lists.linux.dev>; Thu, 26 Nov 2026 18:08:22 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1795745301; x=1796350101; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=XhodWS1aWkSeFvJLIKsGNbnaDQgoaSu4UhdyHeAK+6E=;
        b=udpJc7NeXcegDh/Si4p43abPkyyuuw9/LtztUlvXUQkoVfpOjMZx9/gI0oGEN9Ekkl
         BSQFzpcsEP57fHgT4FntwuzmlFI8QY9Gwq0DttlRWe84mXxY0NLgROJirvV5dPCkHH9r
         eetDbKjjIJfVTRlmDhKLNKHMdAgQ4NkQb9c3bKH0yiRZPBCGJD6AfzjiYGnvjsjSSGVg
         WAcw1gr6v15LzVtfN7Bvf2kix5PA2wxjSahY93b3D6e+bx7wG8zNfNqmj4F00rizaYkp
         X9C+eZ7DM8DRIqitr0xAMK32oKiXEsBwdoPoKtt5zxMmKkOna8oyIQIc0yvcmicMjdmX
         OHhg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795745301; x=1796350101;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=XhodWS1aWkSeFvJLIKsGNbnaDQgoaSu4UhdyHeAK+6E=;
        b=UJgz1/OY7UxgEsp+lCCIL41ksxqTlTUBNXZu4zl9rZQM0F24YKsDvjdrx/LAxFY5vG
         OG7RVgzAh2yqm2HMeWWHGzsW8yJaXpchKc2UzHoPx19PLNdg5jvjsNa8MHMLnTM2TPT9
         nrPm2LHQXNX54zbez1e1NpEAJMP3tppFC6gWDD70LdEQbzV0c/HpZbV5coNRsWfwJosw
         KLI9qmR47CrgEGd0uMxK43dD3pE1B0LVBqhIXcjXp8QwejKbqm+V79NTJ1DotxMHhurC
         +8ifByXcpvZDNRWtjHpSR7qLcqThXpU0cZvPygCXMEOnhhbwnM/1aMu+0+u1DbNeIIAt
         2s/g==
X-Forwarded-Encrypted: i=1; AL+hErF3m8IUio8CgGcYvkC/VHF3RCa+84fuvlJXWntTMfvKfJFrpgaZ5nRYtlmD2ste+i8Ij3hgWmq4fLdsQeExvMA=@lists.linux.dev
X-Gm-Message-State: APuU4Z83QE8mikkZAGYydU7pkxpp2si1ZFCNG9aPB39ZeEIxHyAy8tId
	bRuj7hx5qXXp6WbUWHWz3RFO5SLPUsn995u0jXTVRwuArQ17DmfbjTJ5
X-Gm-Gg: AZFdTZeDuPZ+4mxeCRra4gpZ8uo7Arqrjcfwewtdk9dSvB4Oj2Xl8p5y0a4qcW7amre
	mJV/d/XXM8OV/N/YuSHm2C2je1VPY9IqSd6+GH4Un3nvWlDhanQebxA5z0UvNDEa/Bw1KExlPwr
	9KG14K4fuTYEd2K7BlRr90GA8/W/NbWtZl1aG+3Fx0hWNRUc5LqtBcw7aQ0Y0PhgLqytpqU/+qM
	WwJ4zZm/bASflep2FnyOyUCWAZdVHshyxjTB07arUKe6HRtIV+xMjzdS0nb3p9GxrHjPNGDDWzG
	u7jUuzJa90oUvB/YsQ/2I+N0KP2Emjdu8mRyHO+6t9XGAzKACOBfRQNS+oMDbpy/am5C9hTlwYG
	6N/SvviUPexTfPmwI9R0itJIfLzp5WeuO7gzzREz/Hvnc8dAjkQ/79yZRLrbPK1tz2x0WOJPD3c
	IXX+x55eTfYNQVt9+SWBQIY+niovGZvAXx3qu3WWRbPPze3hAmqMIIDevOIlxGp4usu1CGy/zRz
	aFFvNNGismO1AqWl7UvowhKGU3NO03gwQ/BTtA8XPIh0zY1Q5V9RLRY2at7IjSQbOoL/N8Rot1S
	kIKDmBH42ZKqPABM+bp6KInjUVXz8c+OPz3lHZn8R77ha0lu3dAd6H5vrWTBVmP32XHPEUjoCmY
	aqrOsdYKLzWplK1812F8+LzprM3U0NYQsaIc59mYA1ovVGvshjrANcnTkeEJD8F2tZNY=
X-Received: by 2002:a05:600d:8449:b0:4bb:8e95:8ce1 with SMTP id 5b1f17b1804b1-4bb8e958ce4mr325490295e9.23.1795745300965;
        Thu, 26 Nov 2026 18:08:20 -0800 (PST)
Received: from romain-ThinkPad-P14s-Gen-5-AMD.tail433d9c.ts.net ([2001:861:39c2:e340:1432:1241:93b7:7b4b])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-4ab6baa3882sm43390844f8f.49.2026.11.26.18.08.20
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
Subject: [PATCH 4/4] drm/panel: st7701: add the Miyoo A30 panel
Date: Fri, 27 Nov 2026 03:08:15 +0100
Message-ID: <20261127020815.1621790-5-romain.tisserand@gmail.com>
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

The Miyoo A30 handheld (Allwinner A33) has a 480x640 2-lane MIPI-DSI
panel driven by a Sitronix ST7701S.

Its init table, taken from the stock kernel, doesn't fit the encoding of
st7701_init_sequence(): byte 0 of C2 (INVSEL) lacks the 0x30 bits and
RTNI is not derived from htotal. Send it as-is through the new
init_sequence hook.

The stock configuration runs the panel in non-burst video mode with
sync pulses and without EoT packets; in burst mode the picture is
unstable and the colours are wrong.

Timings and size are from the stock configuration: 23 MHz pixel clock,
htotal 560, vtotal 684, 43x57 mm.

Signed-off-by: Romain TISSERAND <romain.tisserand@gmail.com>
---
 drivers/gpu/drm/panel/panel-sitronix-st7701.c | 88 +++++++++++++++++++
 1 file changed, 88 insertions(+)

diff --git a/drivers/gpu/drm/panel/panel-sitronix-st7701.c b/drivers/gpu/drm/panel/panel-sitronix-st7701.c
index f288c8c8aab8..a87da36dc60a 100644
--- a/drivers/gpu/drm/panel/panel-sitronix-st7701.c
+++ b/drivers/gpu/drm/panel/panel-sitronix-st7701.c
@@ -421,6 +421,64 @@ static void dmt028vghmcmi_1a_gip_sequence(struct st7701 *st7701)
 	ST7701_WRITE(st7701, 0x3A, 0x70);
 }
 
+static void miyoo_a30_init_sequence(struct st7701 *st7701)
+{
+	/* Vendor table, from the Miyoo A30 stock kernel (default_panel). */
+	msleep(200);
+
+	st7701_switch_cmd_bkx(st7701, true, 3);
+	ST7701_WRITE(st7701, 0xEF, 0x08);
+
+	st7701_switch_cmd_bkx(st7701, true, 0);
+	ST7701_WRITE(st7701, ST7701_CMD2_BK0_LNESET, 0x4F, 0x00);
+	ST7701_WRITE(st7701, ST7701_CMD2_BK0_PORCTRL, 0x10, 0x0C);
+	ST7701_WRITE(st7701, ST7701_CMD2_BK0_INVSEL, 0x01, 0x14);
+	ST7701_WRITE(st7701, 0xCC, 0x10);
+	ST7701_WRITE(st7701, ST7701_CMD2_BK0_PVGAMCTRL,
+		   0x0A, 0x18, 0x1E, 0x12, 0x16, 0x0C, 0x0E, 0x0D,
+		   0x0C, 0x29, 0x06, 0x14, 0x13, 0x29, 0x33, 0x1C);
+	ST7701_WRITE(st7701, ST7701_CMD2_BK0_NVGAMCTRL,
+		   0x0A, 0x19, 0x21, 0x0A, 0x0C, 0x00, 0x0C, 0x03,
+		   0x03, 0x23, 0x01, 0x0E, 0x0C, 0x27, 0x2B, 0x1C);
+
+	st7701_switch_cmd_bkx(st7701, true, 1);
+	ST7701_WRITE(st7701, ST7701_CMD2_BK1_VRHS, 0x5D);
+	ST7701_WRITE(st7701, ST7701_CMD2_BK1_VCOM, 0x71);
+	ST7701_WRITE(st7701, ST7701_CMD2_BK1_VGHSS, 0x8A);
+	ST7701_WRITE(st7701, ST7701_CMD2_BK1_TESTCMD, 0x80);
+	ST7701_WRITE(st7701, ST7701_CMD2_BK1_VGLS, 0x4D);
+	ST7701_WRITE(st7701, ST7701_CMD2_BK1_PWCTLR1, 0x85);
+	ST7701_WRITE(st7701, ST7701_CMD2_BK1_PWCTLR2, 0x20);
+	ST7701_WRITE(st7701, ST7701_CMD2_BK1_SPD1, 0x78);
+	ST7701_WRITE(st7701, ST7701_CMD2_BK1_SPD2, 0x78);
+	ST7701_WRITE(st7701, ST7701_CMD2_BK1_MIPISET1, 0x88);
+
+	ST7701_WRITE(st7701, 0xE0, 0x00, 0x00, 0x02);
+	ST7701_WRITE(st7701, 0xE1, 0x06, 0xA0, 0x08, 0xA0, 0x05, 0xA0, 0x07,
+		   0xA0, 0x00, 0x44, 0x44);
+	ST7701_WRITE(st7701, 0xE2, 0x20, 0x20, 0x44, 0x44, 0x96, 0xA0, 0x00,
+		   0x00, 0x96, 0xA0, 0x00, 0x00);
+	ST7701_WRITE(st7701, 0xE3, 0x00, 0x00, 0x22, 0x22);
+	ST7701_WRITE(st7701, 0xE4, 0x44, 0x44);
+	ST7701_WRITE(st7701, 0xE5, 0x0D, 0x91, 0x0A, 0xA0, 0x0F, 0x93, 0x0A,
+		   0xA0, 0x09, 0x8D, 0x0A, 0xA0, 0x0B, 0x8F, 0x0A, 0xA0);
+	ST7701_WRITE(st7701, 0xE6, 0x00, 0x00, 0x22, 0x22);
+	ST7701_WRITE(st7701, 0xE7, 0x44, 0x44);
+	ST7701_WRITE(st7701, 0xE8, 0x0C, 0x90, 0x0A, 0xA0, 0x0E, 0x92, 0x0A,
+		   0xA0, 0x08, 0x8C, 0x0A, 0xA0, 0x0A, 0x8E, 0x0A, 0xA0);
+	ST7701_WRITE(st7701, 0xE9, 0x36, 0x00);
+	ST7701_WRITE(st7701, 0xEB, 0x00, 0x01, 0xE4, 0xE4, 0x44, 0x88, 0x40);
+	ST7701_WRITE(st7701, 0xED, 0xFF, 0x45, 0x67, 0xFA, 0x01, 0x2B, 0xCF,
+		   0xFF, 0xFF, 0xFC, 0xB2, 0x10, 0xAF, 0x76, 0x54, 0xFF);
+	ST7701_WRITE(st7701, 0xEF, 0x10, 0x0D, 0x04, 0x08, 0x3F, 0x1F);
+
+	ST7701_WRITE(st7701, MIPI_DCS_EXIT_SLEEP_MODE);
+	msleep(200);
+
+	ST7701_WRITE(st7701, MIPI_DCS_SET_TEAR_ON, 0x00);
+	ST7701_WRITE(st7701, MIPI_DCS_SET_PIXEL_FORMAT, 0x77);
+}
+
 static void kd50t048a_gip_sequence(struct st7701 *st7701)
 {
 	/**
@@ -874,6 +932,35 @@ static const struct st7701_panel_desc dmt028vghmcmi_1a_desc = {
 	.gip_sequence = dmt028vghmcmi_1a_gip_sequence,
 };
 
+static const struct drm_display_mode miyoo_a30_mode = {
+	.clock		= 23000,
+
+	.hdisplay	= 480,
+	.hsync_start	= 480 + 48,
+	.hsync_end	= 480 + 48 + 10,
+	.htotal		= 480 + 48 + 10 + 22,
+
+	.vdisplay	= 640,
+	.vsync_start	= 640 + 26,
+	.vsync_end	= 640 + 26 + 4,
+	.vtotal		= 640 + 26 + 4 + 14,
+
+	.width_mm	= 43,
+	.height_mm	= 57,
+
+	.type = DRM_MODE_TYPE_DRIVER | DRM_MODE_TYPE_PREFERRED,
+};
+
+static const struct st7701_panel_desc miyoo_a30_desc = {
+	.mode = &miyoo_a30_mode,
+	.lanes = 2,
+	.format = MIPI_DSI_FMT_RGB888,
+	.init_sequence = miyoo_a30_init_sequence,
+	/* stock sys_config: lcd_dsi_if = 0 (non-burst video), lcd_dsi_eotp = 0 */
+	.mode_flags = MIPI_DSI_MODE_VIDEO | MIPI_DSI_MODE_VIDEO_SYNC_PULSE |
+		      MIPI_DSI_MODE_LPM | MIPI_DSI_MODE_NO_EOT_PACKET,
+};
+
 static const struct drm_display_mode kd50t048a_mode = {
 	.clock          = 27500,
 
@@ -1401,6 +1488,7 @@ static const struct of_device_id st7701_dsi_of_match[] = {
 	{ .compatible = "anbernic,rg-arc-panel", .data = &rg_arc_desc },
 	{ .compatible = "densitron,dmt028vghmcmi-1a", .data = &dmt028vghmcmi_1a_desc },
 	{ .compatible = "elida,kd50t048a", .data = &kd50t048a_desc },
+	{ .compatible = "miyoo,a30-panel", .data = &miyoo_a30_desc },
 	{ .compatible = "techstar,ts8550b", .data = &ts8550b_desc },
 	{ .compatible = "winstar,wf40eswaa6mnn0", .data = &wf40eswaa6mnn0_desc },
 	{ }
-- 
2.43.0

