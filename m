Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.128.43
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793703930;
	b=Y0n01RorWiIqYwEkUs56mwf2bgCL2mtaK8wZKLuQijmDY//QEEUtIfCWp/PDnqF5yzOM
	 6uWyY3VIEYM4nWCQvQWelGPGmpmt1RjdTQOnThdJHZAweYpHQ1PghmKTbBuH/B+s734ai
	 pc8sNzz4CS1n63nmphZTwOIf2OEWGR83QnQJoG02Xmki4wDg5C9NbN7Xfhpanjc53Axvf
	 VYgHi5OuXvz0RJfP9QmRx5F3hBTqZ/w7pF1lgbNUNS33DyFpEoRTSrAR0qVgRUeP97euX
	 iVh5B2s3L9RVX/47plN/gthxmLSBYRZR0Jh8zNBiM4QHE9pxWGXsmRKKXRWIAxgzksQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793703930;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Transfer-Encoding;
	bh=8uVawaux8sNeEnQ6GG0I15QjU4Tv1ysiOdcaZPwS+rA=;
	b=sNW4Ei6oenWjoq2e8IfNhhd6DYBEi2sJYme03FPMVR3eGo28bQVL9RyqOcCn4P6K0O2b
	 rQSCYfGd0YIUDBF9/BWhk96jWSrL61cQYrpKwL0u1/KNwQldehds70W+JzdrFfkAPa2qx
	 SwpI9M9vJ3GumLP+yxcRmFdg+8pzRbraI7z0N4NJ2oVT6czGjrCNFX9E8nE3sSwjDseWG
	 4/tuZ4GyNtdZgN32c6iJW+3JycBr/9zZOqtLb7rFH42o+7GIz5noc5yvsXP2MD9BYkpyh
	 sGpA+lguYwv/OeTVi7dy9fKNc7EgJ81a+6lw3TSTIvGeeVTpYnSKE6/ruVDMh15Qq8Q==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=MQ+Xab1Y;
	arc=none smtp.remote-ip=209.85.128.43
Received: from mail-wm1-f43.google.com (mail-wm1-f43.google.com [209.85.128.43])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 850CB606ED9D
	for <sashiko-reviews@lists.linux.dev>; Tue,  3 Nov 2026 11:05:30 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 850CB606ED9D
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=MQ+Xab1Y
Received: by mail-wm1-f43.google.com with SMTP id 5b1f17b1804b1-4a35ac4475dso28498825e9.2
        for <sashiko-reviews@lists.linux.dev>; Tue, 03 Nov 2026 03:05:30 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1793703929; x=1794308729; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=8uVawaux8sNeEnQ6GG0I15QjU4Tv1ysiOdcaZPwS+rA=;
        b=MQ+Xab1YXNQVVeb5+PbMMCxn9iyq3g4wjQSQaErW6D6qeHqxCBw+Bgn4vXxBe8mhEH
         5CoPKPBdCztgiA5MYtFT6tY/r1olhQxgg3eq+6IDdL2zdkhcnQEEc3k5PTBhSltH8s0v
         nimIEI3PRAifv5y2ND7V856DM+xtZajZeAgwgGO6I0vp3oxDSBm2n/hJgPdDBijolA0X
         EiQW9YPTVLz7ibqNqtoqcLuysCXnrPZfQqTzOPRmRejeU93Pbxv1IYtX1ojeby28305Y
         BC/vAhWESKV6UnEeDNZqthXWFMUcvOjkCCAo7jU/0IUEAVrpLgUrY3p2BRZpeTJ+OoaT
         IcQg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793703929; x=1794308729;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=8uVawaux8sNeEnQ6GG0I15QjU4Tv1ysiOdcaZPwS+rA=;
        b=UkDZs/jqIh/Fk5vbF1FbsqSEPLENb1RmzS3VVaYBaYHISwxNqg7V6S5wKCwXWO2z5F
         VYh9FKBMB7FDgnI/WKmwBYmO5UKtPrESwwHOvGQhukRtMULRC0LdYAszBN0eFrMIJn99
         jgeEaHSo+ZmlnsavC4RSN/VpniKDbHsyQSwSXbg8y99wPGoJ8yMIubs+H8+pBDrEZGFF
         PGSn2jW9sp2k21cNlHiOldm4ExUm5TLpIzH3oBeZrdN2lWjIq7ee3jSgigj3qK2hQw2Q
         BfHfBdqhhjvw+fOY0nXIdrV3AneUyvn0P0S3EH1FUxafz6kqhsTsrUv8Ui5YbbmzFWgL
         awDQ==
X-Forwarded-Encrypted: i=1; AKwUvBy0Jph4HEi63J843PxaqEYq6oKZ8Kff0Y25tDGqkWPl/W43t4sI/zg7wN1QsEl3vwwT51XbNcuBf91WyaJ4Nr4=@lists.linux.dev
X-Gm-Message-State: APuU4Z+KLv8EfcHovu8hlC5PLMysB3dZk9NXgFTxTAKolh+SF8009jC4
	RmsnRZVmV3dXa1iVtxo+4TJahxfErck+5fBR9tN4sn1qfzliifDjFrBI
X-Gm-Gg: AYBFou08p7aMVVPwfFlo+F6Zixhr4n6QmeBuDf67wIYBROnkQq1BXI7rL9ad3kLLtYN
	WnJEd6BPN4YVUuOMArhfPUgHVLeaPrQ7xX/8JWGt9KPLcKntJXQmE+Kvcs2dLnk74fswQg/rDmn
	jq5ZgL1zSEu6RvOJmxOhTGA0qGkEKupzlM6iy1wGbMeEAzopvn/dAziXmlmRtgC61mLs6/XKdap
	IE8HmM81qvgyP0jJwFkw8pvQ1ZWL+159iU6NLm0TtH6zNcdWyRgtJNFZqwlPVOqT0aqyz9mWpUX
	8Cn52DpIUtPGolUTuY/HZzWW+0r9O9iEXNni9ntATKnwlouAP5hiE6kpCn1tU6Zb4PZow+2C+BE
	36RU9cXpf/BvQHaXt+r4fM7uv/jQkwseT0h4EegLZcO48v8QritXwOWHZv+XBmIb2MngWWfX51g
	8cW56o3eIETaJ9fM6zZ9hJkCbZyHXaPZKhp0SODo6FgvMccLoqO5PYTvxCTMKSeaOlcjwEKIipb
	Sgn83BA8E6T1r5kCnD3vQcQSPVkMUq1VL36TCwCGBcfBE9ONH1a3DEt4fEoaFxe8cMnE0eBmEGH
	GDl0bWf3SPvtLGuJSpVF6/sNZTXoTwAzPStPSsX86aVx11yQLGycWYo+fstTv08gsf4QtRZncD9
	ngsu+Rz8GHNCLqHfepjqWDcTPo89Asu3TbHQGWwWmC7tT/Q==
X-Received: by 2002:a05:600c:638f:b0:4a3:59c2:b41e with SMTP id 5b1f17b1804b1-4ac150b304cmr286208485e9.4.1793703928755;
        Tue, 03 Nov 2026 03:05:28 -0800 (PST)
Received: from romain-ThinkPad-P14s-Gen-5-AMD.tail433d9c.ts.net ([2001:861:39c2:e340:14ec:7986:30c8:6bc6])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4b2afee292bsm53218155e9.4.2026.11.03.03.05.27
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 03 Nov 2026 03:05:28 -0800 (PST)
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
Subject: [PATCH 4/4] drm/panel: ilitek-ili9488: add the PocketGo S30 panel
Date: Tue,  3 Nov 2026 12:05:24 +0100
Message-ID: <20261103110524.2812831-5-romain.tisserand@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20261103110524.2812831-1-romain.tisserand@gmail.com>
References: <20261103110524.2812831-1-romain.tisserand@gmail.com>
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

The PocketGo S30 handheld (Allwinner A33) has a 320x480 1-lane MIPI-DSI
panel built around an Ilitek ILI9488.

The init sequence is the stock kernel's, read back from the running
stock system. It differs from the E35GH-I-MW800CB sequence only in VCOM
(0x26 instead of 0x25), the display function control (2 parameters
instead of 3) and the position of the inversion command. As on stock,
the panel is set to the 18 bpp interface pixel format while the DSI link
carries RGB888, so the panel shows 6 bits per color.

Timings and video mode are from the stock configuration: 12 MHz pixel
clock, htotal 382, vtotal 524, active low sync (lcd_hv_sync_polarity 0),
non-burst video mode with sync pulses and without EoT packets.

Signed-off-by: Romain TISSERAND <romain.tisserand@gmail.com>
---
 drivers/gpu/drm/panel/panel-ilitek-ili9488.c | 55 ++++++++++++++++++++
 1 file changed, 55 insertions(+)

diff --git a/drivers/gpu/drm/panel/panel-ilitek-ili9488.c b/drivers/gpu/drm/panel/panel-ilitek-ili9488.c
index 6ab8ae72abbf..4be3d22360da 100644
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
+	{ .compatible = "pocketgo,s30-panel", .data = &pocketgo_s30_desc },
 	{ }
 };
 
-- 
2.43.0

