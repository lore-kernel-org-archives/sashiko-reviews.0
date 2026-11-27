Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.221.47
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795745301;
	b=eXqpNSDgdfa1WzoWEjJT+RVPIjZ2DuRSrz8ddCS3To8dEkmu5Yxwu6geEjVGdFK5c+6S
	 n9rEfN5ytcn5ti2uLMsHjTVh/ga0tbbIN/WuVXv8WgK0eoqEQSylD26d7JCGz62nTo5Fv
	 c6XRRZTTHls2iOpTh9v2AYQxvaX1uMe8xxwOeQnOgRMWvSU2FxJdCgY1qQF7QxlziZONy
	 oIPrjF9vVp4fMptN7OUEoO8PljyaWFKEbY3IJMs8u/sGLBQA3rAXj69ubJWfTGmIzP+E+
	 hej/NCsODl7FUOAbNIDX1DUrB9QSXtDADAazqYnQmilu61iz7wbGpaaHfFHLiKHj0rg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795745301;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Transfer-Encoding;
	bh=A5HReqGtLLp5CEvytgVMxYdO2cCkWTCzRi2iOsig/yc=;
	b=sAjdhPomI4RT6F/02Hf/cToCWSnf2kM/eNIqU+X6XWMn2enVIml81bn9RMaIIPNlQ4/v
	 cVDzq7hdaCUj4QPP2Sj4HL/R+mS8JVURqnm6X0eWkFkVwc0Nw669p3g/5EP5xBSfa2rJU
	 c9Ab+7WJAY5uQdXOtAdSjxjGTnKavbjbqr7dxKRNZR4tAFihKxrY+XUr0CGfwVEaqHdP0
	 K0kX/Mq/hOiEhkJEumA2o4SY7OkOEQmI5NSFPq5hAQMxXu2STVKpzhVTQSCs1v9vhpORK
	 bkruBvaOOG2Li+b84MVKH9Qf6AfIkmI3VZdUXgManG3Fg8hOtM0+GKPO2GQlXqFzzfw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=LzKJMXrV;
	arc=none smtp.remote-ip=209.85.221.47
Received: from mail-wr1-f47.google.com (mail-wr1-f47.google.com [209.85.221.47])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1FF5D606A337
	for <sashiko-reviews@lists.linux.dev>; Fri, 27 Nov 2026 02:08:21 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 1FF5D606A337
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=LzKJMXrV
Received: by mail-wr1-f47.google.com with SMTP id ffacd0b85a97d-492fcbfaa88so5121707f8f.3
        for <sashiko-reviews@lists.linux.dev>; Thu, 26 Nov 2026 18:08:20 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1795745299; x=1796350099; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=A5HReqGtLLp5CEvytgVMxYdO2cCkWTCzRi2iOsig/yc=;
        b=LzKJMXrVVM+wqPzIPTJ/F9bV3TsE3cE6kSFf8OkWldokfjDc1L/s3Hm/HzdX0t9aGH
         ZQFlBfCCgNFsYVtPHed6nh97yRD3ldEP/+gAsmFbkI0QnaJ/HVbOhPSPTNomS+gLXL/4
         Z672T4xc/EbMFhBQn0Pqs/zEgU7wTF3femRfCk+HnfznxgUG7eny/1GI7tkAf2H8eDIo
         82F+0OEYOg8ipykxuA+owUkNlbH61m0aWpbjrt/kw8zOTVQbLc3MIJEDYxjnzcBG69C6
         vVTtaWyUG8LVDQ8KUaPcmi0eQro9hs8/MkRp5IceoR/8n0XaJyAalUspsqb5V7RJ49tL
         ryYg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795745299; x=1796350099;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=A5HReqGtLLp5CEvytgVMxYdO2cCkWTCzRi2iOsig/yc=;
        b=Va6mVUuWqbD76sKaPhYoSql6YSpzJbY3h7yVvf20tPDqIG7WQmDbLT1vQQXU+PHkh5
         KAu2muBrMGNo2eu99KjmG/27NuQRNnnz7Kl/I+hN5Ytqf+o3NrvxxboAnRD5HS+uLpSh
         sQNuSpCiyzn1MNDQMwhPNy/dFM9u/LbL7OKytCasrBAu7vUgwOHPe5RwvM7sfh1LVn3i
         ZI1HeBoe47k9xoL/V9K8zW3YPP3TmDbQWxwss0EBTvW+MWfwhjVbtEhCKnQw4CB2iTW7
         5c+rzEKQpNZXU8Q2mF5iYQ7JVvBC3bVFLcBFD7pIIaC9ceDnlQ7IYH+nWMRkgsA8omKz
         0lug==
X-Forwarded-Encrypted: i=1; AL+hErFd+mWYKByw4gK5kkUQ1qkUR2am91yJSE7GbskDp9+ts2fvzP6K/sCBquS84rJfoncOzwwt14moXovHUwrTZXw=@lists.linux.dev
X-Gm-Message-State: APuU4Z8WRLzMNYsqO83OsskTY9NrxXlkJhktvEzNHXusdCAbnQLwEqPt
	G2JfePwrFNTbvg9Jg9W4kHCv4ZeqXnvk1ulL6D0qBucnxejEU97QAFbl
X-Gm-Gg: AZFdTZdQSH+NjVGYrGViq0PvxXYFleBgie+k8P0FEulrQ6hzDnbATFXUdwZJC9trmpF
	bys++gYcwF27BXaVAl9xPKDU/URySYFsBj0+2niI6J5miYFQW71ROn9COaf5d/GQEt5JvsMBAtz
	vxg0y8ZyrJGq6AgdtKAkYl0W2oIxB9FoWZqYJCOUM2l7Z+o82nI6C4cAD2A7uh6IICh1xjPT2Hs
	s5SazPcSOg/R90JE2EJKhnd28X50jFmfL4WtB9c8KJ6lcF8LGXsqT2AwIDhymVToh9tNIaBF9Ak
	BaOEurrhrRq9XT+0teyNBaXMOf1G2aAJWyoaD2nNJGhHPDGCE1HI5osMUi/5qfKns5jHqls2Y+x
	V6b2Am7rjaloB7CFBydAIYrspuvWV8/hKMSodIhyCCfE0FGptmXrbPmpeOreVBkW7MKS8U2CR8C
	Cyrcl/QnUiseoz1ORI8ZkOhzTCGJk9zsS1ZMAU2GIOOeuzd+NM3FxwV3lkt00uFAJU7kEFNlT24
	Nuh4BkJuLbWCbvwhi0MOawDVgghspJwbJNRGX+Nh3pyjboHS6Gox386CEB0oUmrzPn7xlFev1Kg
	Ku1DOk0S7fAR+QQ5WoBLAON4P3xzw54zNT5P7sTNM0luaTujmEVk1jaSV7v1TPCulQod40spL9t
	atA+rTjFFU27V1DKX1njgZNfd/c2+/icDzqaPZtzz5Pnkjg==
X-Received: by 2002:a05:6000:41cb:b0:4ba:a47a:f21d with SMTP id ffacd0b85a97d-4baa47af4fbmr12166998f8f.1.1795745299448;
        Thu, 26 Nov 2026 18:08:19 -0800 (PST)
Received: from romain-ThinkPad-P14s-Gen-5-AMD.tail433d9c.ts.net ([2001:861:39c2:e340:1432:1241:93b7:7b4b])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-4ab6baa3882sm43390844f8f.49.2026.11.26.18.08.18
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 26 Nov 2026 18:08:18 -0800 (PST)
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
Subject: [PATCH 2/4] dt-bindings: display: panel: sitronix,st7701: add the Miyoo A30 panel
Date: Fri, 27 Nov 2026 03:08:13 +0100
Message-ID: <20261127020815.1621790-3-romain.tisserand@gmail.com>
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

The Miyoo A30 handheld has a 480x640 2-lane MIPI-DSI panel driven by a
Sitronix ST7701S. It is connected over DSI, so it has no D/CX GPIO.

Signed-off-by: Romain TISSERAND <romain.tisserand@gmail.com>
---
 .../devicetree/bindings/display/panel/sitronix,st7701.yaml      | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/Documentation/devicetree/bindings/display/panel/sitronix,st7701.yaml b/Documentation/devicetree/bindings/display/panel/sitronix,st7701.yaml
index 3ca9aa215b7f..8d9bddc8118e 100644
--- a/Documentation/devicetree/bindings/display/panel/sitronix,st7701.yaml
+++ b/Documentation/devicetree/bindings/display/panel/sitronix,st7701.yaml
@@ -28,6 +28,7 @@ properties:
           - anbernic,rg28xx-panel
           - densitron,dmt028vghmcmi-1a
           - elida,kd50t048a
+          - miyoo,a30-panel
           - techstar,ts8550b
           - winstar,wf40eswaa6mnn0
       - const: sitronix,st7701
@@ -89,6 +90,7 @@ allOf:
                 - anbernic,rg28xx-panel
                 - densitron,dmt028vghmcmi-1a
                 - elida,kd50t048a
+                - miyoo,a30-panel
                 - techstar,ts8550b
     then:
       required:
-- 
2.43.0

