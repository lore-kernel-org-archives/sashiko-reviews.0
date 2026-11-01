Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.128.41
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793565250;
	b=gxpNI3KvQLjUWT/qGVhb9eyGjaxkcKO5gTNkUxnLw3rIudAoqDN6OjZeRApcftuQYrsx
	 u1FOoLoflPXxkqxY2zrYqqK1GJJTnvbDZ/hfWL7ISKvAN5eBm/fPzNqt2lixxy+g31BsD
	 eezhM3Cq556/d/9QYTfU2zDmMSI6cvy2veRqFlxYjfzvBW1O7YhRVHn8li4tx7rh3R5Jy
	 8U3MMvld1W6B7btbYF4F4Wu2m/P1WHVigKKgganrbMBlZ2R40A16jasFBaI7Q3lH/E5Wr
	 Rtes+klRfzA+cAnQ0lhD9uYDiTVHF/rM1ab+MTjgeGG1ETDqfMmOBiKYakPuoeIF4Mw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793565250;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:MIME-Version:
	 Content-Transfer-Encoding;
	bh=F89725KkjE+kUI5LXBxmdgLNt89Tfm7tC84mMjTHCkI=;
	b=TGlG3eymhA+6wFnsANzUWgIlAHBRtsZS+EI6pO104/HEiODiBtLdxJ9pIl+24VT5PVXH
	 qtY37EVoHOquPUgEswchF6PQFuHNrXFY/2wWHhYXknteqJYyRDOBxexgNETyDpyK5+75k
	 BhvhiYOn0AE3rRtIJMH84hrAqv0cDsK2wbVTeYro4ncaa186wbHa1rOvsWQbWiRP1bAsx
	 xHM8hBeQlaZ5Et3ahjzpU01nYwsZ0RjfWXD/iKZAhMg7efN06F2evJzIFjA0yVfvw8RAd
	 Uriyu3WAzoGr9zoxNn7VKmRnavD+2E7R435yus/dXYevGWdJUM9r+ZRid8kTXKITyrA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=FSR6XuCr;
	arc=none smtp.remote-ip=209.85.128.41
Received: from mail-wm1-f41.google.com (mail-wm1-f41.google.com [209.85.128.41])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9C308606A325
	for <sashiko-reviews@lists.linux.dev>; Sun,  1 Nov 2026 20:34:09 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 9C308606A325
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=FSR6XuCr
Received: by mail-wm1-f41.google.com with SMTP id 5b1f17b1804b1-4a35db1f202so24482685e9.3
        for <sashiko-reviews@lists.linux.dev>; Sun, 01 Nov 2026 12:34:09 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1793565248; x=1794170048; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=F89725KkjE+kUI5LXBxmdgLNt89Tfm7tC84mMjTHCkI=;
        b=FSR6XuCrgDAmTHoBkoFAyYnqM78RNwGIRz0nHlzqWBqSsnlbvADPFrXEY0yN6j/MgX
         Xh2ksvEvIS0nHsaZx0ZWPDhhdgJr2ElGkELY1M+w1uHvWEz8pD1SFCW7ShjTQwvj+ga7
         M+shJ2o+PvT1meEzBK0nSluNRchp8FDedte76TbYZ4JXD+5132pwWOPw4kDnX5AK7eHF
         AtsvZr+0dSIx3Li6WyGDL9ttPdRH23iTmsWAZjuFYiqDsKWFhBtoZd4Nrq4RBbpTpWPE
         Z8iP3o9UAHWv33AMO7QsSLjfkT62jRzaPeFgbHRcng+276P5sHu334x4xDV2NG9MPKgz
         /iQA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793565248; x=1794170048;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=F89725KkjE+kUI5LXBxmdgLNt89Tfm7tC84mMjTHCkI=;
        b=MPZttkR2ERlqp1w4+giH+cascQ6P9j+OmfP/a864AYHjGvV8E875cE//ql/jnLlbaj
         DBwxbqj6gzS6SQK3/RFnCqms40vQUmDawaeBzMjW+8rgLReSu3qJLaJrVZ6A9XLoM/9u
         Oap/MH7f33Hte1+i6/yW+qweBeXvSM+u/z0p7xlI0FoyR6mFp56fcLjW++XDoSiy41VJ
         LjNC3jWyfA/X4T7r99BkSDw3zpDmJZ5NuShi7uGcAtrixpZZHGfu7LREi7iQwLJNpm+A
         4L4qstdNYElwx/JERjMwRczWcbEwiqQFM9cPI83zhN2klJv+5/e25gFTcA1Ar4aeGQ41
         5xVw==
X-Forwarded-Encrypted: i=1; AKwUvBxdu/PsGYt4EhwNe0Xh54I//brrbI4ECq5Z2di5afQDZnmKB/aKHhDjRcxQNvDczRo9V/oHslm/kjuXBPs7Qgc=@lists.linux.dev
X-Gm-Message-State: AFq9FYKPzqqtvR+ulgxoz+0k3SJt0cpE0aGbgJZncwGg9RnHwc+do21R
	M4qtlZ7j67tLxhHek/dl0ucBxpyNQuXskz16JTFpuzNdo2/5Me5XVYNJ
X-Gm-Gg: AYBFou01y92COA61cjgJwYrgdT9CCMiEMecmNKzCdeOaYblhjr+8uYX/XWPgyGDFx9S
	CBd5JL6m3KOC02ig2bPqMGJ549EjxWOP7dBqDGQ22ZjnA27MbiY+FF0YcObUdVRsCNrCVBwF+jZ
	4q0zM+u7BG3dh6ag1UiAffXrn4a7cCDD0O/8LeWGMAbXWUm4NWvS+2G3Y6xDvfJT5rp6A9AA0no
	iU7yLL0apBJcSapyPmL1KGbX648LEUXq9J3PlDyMQfFF3bI9BHDXAIDdegvtAEVujtjOgLHaQEe
	K++S6Vgd65Wsxngn3EnpKIH7le674uowpbczQ5oVTJ5XBohSn689mqcZlusfWWD8sBB7XIS7Nyx
	TXcPKHcO1QJYqzflmv7zUjraCHl+ANlkuxATCHQRpQ7rIZGgSOT/XCvC9AuLFcGXmP8UD/bcHEx
	ZCS6AeVsX36xrO2E5Are8xOjbcs4ez5ruKhzsMcPECc2A/lAGDo+GolW8dwsHArUuDPJU9sDPFY
	8QSG06LlnuAhsOKLdIDGOg+onVTKQTY6TXgyUBfy/rBdYLMx5VmLgR/meiwMs1lcSFA4dQxy7OX
	dIUFWjlrL2hM6iiyvyBsviOT4V19+KfqB5EzIZ3WkjOuVCMr9M8DIziLLruK5f1n9Jkfob0p+jm
	AfCn2+NIHlyaGZnLBKFQNyxMCom42F9TcbyjrX+e4fKGSXg==
X-Received: by 2002:a05:600c:1d07:b0:4a2:18d4:f9e0 with SMTP id 5b1f17b1804b1-4ac18c735b3mr192334605e9.25.1793565247854;
        Sun, 01 Nov 2026 12:34:07 -0800 (PST)
Received: from romain-ThinkPad-P14s-Gen-5-AMD.tail433d9c.ts.net ([2001:861:39c2:e340:849f:a468:4121:a85])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4ab61d8b9f4sm263946675e9.12.2026.11.01.12.34.07
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 01 Nov 2026 12:34:07 -0800 (PST)
From: Romain TISSERAND <romain.tisserand@gmail.com>
To: Chen-Yu Tsai <wens@kernel.org>,
	Maxime Ripard <mripard@kernel.org>,
	Jernej Skrabec <jernej.skrabec@gmail.com>,
	Samuel Holland <samuel@sholland.org>
Cc: Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
	Thomas Zimmermann <tzimmermann@suse.de>,
	David Airlie <airlied@gmail.com>,
	Simona Vetter <simona@ffwll.ch>,
	dri-devel@lists.freedesktop.org,
	linux-sunxi@lists.linux.dev,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	sashiko-reviews@lists.linux.dev
Subject: [PATCH] drm/sun4i: dsi: set the connector orientation from the panel node
Date: Sun,  1 Nov 2026 21:34:06 +0100
Message-ID: <20261101203406.1360656-1-romain.tisserand@gmail.com>
X-Mailer: git-send-email 2.43.0
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

sun6i_dsi_attach() only accepts the panel once the DRM device is
registered, and returns -EPROBE_DEFER until then. By that time the
connector can no longer get a "panel orientation" property: it has to be
attached before registration. The fbdev emulation is also set up from the
hotplug event of the attach, so it gets no rotation hint either.

As a result the rotation property of a DSI panel on these SoCs is ignored:
on the PocketGo S30 (A33, 320x480 panel mounted for landscape use,
rotation = <270>) the console and the boot splash stay in portrait.

The panel is a child node of the DSI host, so read its orientation from
the device tree when binding, before the device is registered, and set it
on the connector then.

Signed-off-by: Romain TISSERAND <romain.tisserand@gmail.com>
---
Notes:
- Testing: built with W=1 for arm (multi_v7_defconfig, DRM_SUN6I_DSI=y
  and =m) and arm64 (defconfig, =m), no warnings. Tested on a PocketGo
  S30 (A33, ILI9488 DSI panel, rotation = <270>): on 6.18.54 with the same
  change (6.18 still calls the helper of_drm_get_panel_orientation()) the
  console and plymouth come up in landscape, where they were in portrait;
  on 7.3.1 with this patch the DSI connector reports "panel orientation"
  = "Left Side Up".
  Not tested on other boards; boards without a rotation property keep the
  current behaviour (no property is attached).
- Tool disclosure: this patch was prepared with Claude Opus 5.5
  (Anthropic) as a coding assistant, in an interactive session where I
  asked it to fix the console orientation on the PocketGo S30. It traced
  why the connector never got the orientation, wrote the change and the
  message. I reviewed and understand it, and tested it as described.

 drivers/gpu/drm/sun4i/sun6i_mipi_dsi.c | 28 ++++++++++++++++++++++++++
 1 file changed, 28 insertions(+)

diff --git a/drivers/gpu/drm/sun4i/sun6i_mipi_dsi.c b/drivers/gpu/drm/sun4i/sun6i_mipi_dsi.c
index d504ae5832..1eb8a4cde0 100644
--- a/drivers/gpu/drm/sun4i/sun6i_mipi_dsi.c
+++ b/drivers/gpu/drm/sun4i/sun6i_mipi_dsi.c
@@ -22,6 +22,7 @@
 #include <drm/drm_atomic_helper.h>
 #include <drm/drm_encoder.h>
 #include <drm/drm_mipi_dsi.h>
+#include <drm/drm_of.h>
 #include <drm/drm_panel.h>
 #include <drm/drm_print.h>
 #include <drm/drm_probe_helper.h>
@@ -1055,6 +1056,31 @@ static const struct regmap_config sun6i_dsi_regmap_config = {
 	.name		= "mipi-dsi",
 };
 
+/*
+ * The panel only attaches once the DRM device is registered, too late to
+ * give the connector its orientation (the property cannot be added after
+ * registration), so fbcon and the boot splash would not rotate. Read the
+ * orientation from the panel node, a child of the DSI node, at bind time.
+ */
+static void sun6i_dsi_set_panel_orientation(struct sun6i_dsi *dsi)
+{
+	enum drm_panel_orientation orientation;
+	struct device_node *np;
+
+	for_each_available_child_of_node(dsi->dev->of_node, np) {
+		if (of_node_name_eq(np, "port") || of_node_name_eq(np, "ports"))
+			continue;
+
+		if (!drm_of_get_panel_orientation(np, &orientation) &&
+		    orientation != DRM_MODE_PANEL_ORIENTATION_UNKNOWN) {
+			drm_connector_set_panel_orientation(&dsi->connector,
+							    orientation);
+			of_node_put(np);
+			return;
+		}
+	}
+}
+
 static int sun6i_dsi_bind(struct device *dev, struct device *master,
 			 void *data)
 {
@@ -1085,6 +1111,8 @@ static int sun6i_dsi_bind(struct device *dev, struct device *master,
 
 	drm_connector_attach_encoder(&dsi->connector, &dsi->encoder);
 
+	sun6i_dsi_set_panel_orientation(dsi);
+
 	dsi->drm = drm;
 
 	return 0;

base-commit: a1e63ab695ad76850ab9787b9eb6aab695dc2965
-- 
2.43.0

