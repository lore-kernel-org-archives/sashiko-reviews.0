Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.221.42
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794240434;
	b=TGHQgWzfGx7IL3jvz2wHt0kDTPGpnp9jCD2QwikGYIqlDn2NWhEYoJ/Krj2oZ1ysRtIK
	 9/7WL1fKnAc1/KnjT7QeTcyLt5JFSLVKZWs0YxY3yVW9SY9aG7kGHXEWKsJCDpU3QsNB1
	 OGS9+FwWvWkB+O7WivxqSeT2yFzUSYc6hol5+I53zYqe7yVIQnTT7I7xv58DSIB9oAeUD
	 +w4FHVgdE1A6zrQH3GgpCkZtdp1qu8NEJOKcED43e6pAgSUNLIL9OFpAU+MzuWuwoIIAU
	 YbKQOibeTs9c9nopzMS+nE/fG6IxaiV8K7jDmMSYZEWBiL+z99q02NVvnKoZpjQv6iA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794240434;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Transfer-Encoding;
	bh=GMHTZUTZEeBhMzmR9yLS176DSNdNzj0orFiUqserfBc=;
	b=KytdKf7I33+v8riD2RUGJY++Fv4sOtBYF28dVYbOCl6n3w5c5pJFpozmhs+QZJnlsi+q
	 e3mfcad01eaMcdjClfkbijBF+3LR+9efxSafjfSjUjLcL/8iL/6P7X8V0wTtUfbwx62J5
	 jwI2PrU/3GqnybsFsjLUpimkffxSj4SDZq1Z2TwTjsrIppWvBkIup/FrH9LkyM8Gck0Kk
	 YchBdvz/k8VS4rMFrpw8UVzRMUP+feD6cgC+0k6rbDp1p9w26UoY7sn45N2fT+AzotgB5
	 F/KcddVvkB2u7MzeKcLAikBO/LV3rh8HYctSXUGMyYMJhH/gaZ1o1sE4sdtkHU5vPWA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=R3gLYADK;
	arc=none smtp.remote-ip=209.85.221.42
Received: from mail-wr1-f42.google.com (mail-wr1-f42.google.com [209.85.221.42])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CC52A606EE8B
	for <sashiko-reviews@lists.linux.dev>; Mon,  9 Nov 2026 16:07:13 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org CC52A606EE8B
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=R3gLYADK
Received: by mail-wr1-f42.google.com with SMTP id ffacd0b85a97d-4910b863b84so674097f8f.0
        for <sashiko-reviews@lists.linux.dev>; Mon, 09 Nov 2026 08:07:13 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794240432; x=1794845232; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=GMHTZUTZEeBhMzmR9yLS176DSNdNzj0orFiUqserfBc=;
        b=R3gLYADKE0g0utJO6IYbd38iPyvFxKHxsKCBKPUiBuX91uA7LgciYs68f31WMgQx37
         y65i4ZOJfpW/TeuuuzRPuRCQKFIx6yLzMoWKnMH5rpQ0Eql5AfI4ChobIO7n+SO16SUJ
         QNxhGiMBZCr9fC5Tuijnu/U6ClXmPziqznLoJfhLjWTmPmi98Lw/XKN/fuwPvu4RtUW1
         Mbzh+XeqDQUE0DZR+kEstHHDLTsdBWAAulehcRCbCyvUYn2YJZdxgIT47mNegime9eAY
         GQnt7pG42wIPgGzSO/zs5JAY1WEFBSDQDwpbNUv+kwh82wZ3Ia061RPjECpTBAODA4rj
         zTug==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794240432; x=1794845232;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=GMHTZUTZEeBhMzmR9yLS176DSNdNzj0orFiUqserfBc=;
        b=MS/JwvdJy/fKPhUywnXDEEEs2ofgMM7dnFT8S7GA9T8a9N6dC6bIzTsdmUUPCHTYHX
         bJXPmuIq3kh7b6kyfoANLwoUV9az5yC7YjUARsfkGzG1zpTMme4U4AnF3ybSNnBeFB5N
         5gC0aamLZnmAFI3dJaPoiFyXD6oMjQ5PeRciQGErxkzkqYufLa224k4c33kXvMS62ZJf
         bOZdfwLlA2F+xUDxqlBLWKU7RpDCJb3NgzclsOSTkHJD2KcQ3c5CLcNKuh0HERg1G28+
         GNHhJeSSYqZvIxCMU375R2CElDLFG1JzeH031Jl9BTXju8czBXdh8VgtcMUBiamJOATG
         jM5Q==
X-Forwarded-Encrypted: i=1; AL+hErF1/hOfIJOVvi+8wCbgcZjiZG4HPC4CCF22SAWW61VllUr2G1pNND98EaSH9z62mIpKAGw47K4D/SuJmoyDfbg=@lists.linux.dev
X-Gm-Message-State: APuU4Z8U2mE0UXT4sGXP/2zD7ZoLiDiXZI2KMZQxoNoFZPFrYZQtei99
	3oQsva5VDoKhK++2XtlGDxYsyPeczIgkYpiSOeXuSKNjCusqsPWoeGkUvCZAZV4CiUM=
X-Gm-Gg: AYBFou0c3PnHsGpwTRmnlkPmlZ7sgGIlwLvTMOH5PNEmyxdOCMazM9a4W/7ZEwWPJ/q
	e6s7rjYTuK02nGFZAGWnGRpsHunjrY/TDJTGiTnuyg6KjUjqcxEpRFAgQ2vu0yZ5AjOypc/Z0oO
	9K3DQTF1KFXYmazmXZdAdeMjK6FOSti3EIU0DVVfaV11oR3bCmlav+4iJnuI060bEnQcWNHbB3m
	q1ymA7ex7LcllpQqjddGulMaqXzjLMDzeXhpo8GQTnGcIZshtka+VZjK4pQQqZbRP6N22Dv+bwC
	EYM5uN2uIjS+BnXQCjAD0eXDulflVDy5oAR6fZ47RnFe4ANtHF63jnSha3HBIRKzrtEx+vYzljY
	EwBYuZXlV6dQINW0fCiNjOShQlv2XOPdanyrpggpxhY6IuSzyQvxMJg7UgN9hLrs1q7jTnp48Ri
	oP8iqUpVdhPwQAEOJaxLLIK9aKzKqSqeNrInUJsJ85MosAWtJd4HzLcT7ePutxJJFD9y3qT84hW
	fwWi2gTBUSZVQyFvPnr2Vn6zfZ7sCam+jTML0GZdx9sUCKgfJaaZj+5RISor9UN+eP6fNuBI+4j
	wG3/XPd0wxTSqMXIPnHdXv7rbAHNEeyClYCw4t8NOiYdxeX28eEUBGbzDr0oI01Dp7j2yjOHGsE
	3Cn9g6WEo2/yYCHrfwJ0PjVEdFbrgiPBMV75SSFnMrA==
X-Received: by 2002:a05:600c:34cd:b0:4b4:a551:681a with SMTP id 5b1f17b1804b1-4b960d9c587mr81960605e9.3.1794240432064;
        Mon, 09 Nov 2026 08:07:12 -0800 (PST)
Received: from romain-ThinkPad-P14s-Gen-5-AMD.tail433d9c.ts.net ([2001:863:742:6109:ac9d:152:38c3:6463])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4b90f119b96sm159174245e9.15.2026.11.09.08.07.10
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 09 Nov 2026 08:07:11 -0800 (PST)
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
Subject: [PATCH v2 2/3] dt-bindings: display: panel: ilitek,ili9488: add the PocketGo S30 panel
Date: Mon,  9 Nov 2026 17:07:05 +0100
Message-ID: <20261109160706.2272332-3-romain.tisserand@gmail.com>
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

The Miyoo PocketGo S30 handheld has a 320x480 1-lane MIPI-DSI panel
built around an Ilitek ILI9488.

Reviewed-by: Igor Reznichenko <igor@reznichenko.net>
Signed-off-by: Romain TISSERAND <romain.tisserand@gmail.com>
---
 .../devicetree/bindings/display/panel/ilitek,ili9488.yaml        | 1 +
 1 file changed, 1 insertion(+)

diff --git a/Documentation/devicetree/bindings/display/panel/ilitek,ili9488.yaml b/Documentation/devicetree/bindings/display/panel/ilitek,ili9488.yaml
index 016a573893b7..2908808393aa 100644
--- a/Documentation/devicetree/bindings/display/panel/ilitek,ili9488.yaml
+++ b/Documentation/devicetree/bindings/display/panel/ilitek,ili9488.yaml
@@ -17,6 +17,7 @@ properties:
     items:
       - enum:
           - focuslcds,e35gh-i-mw800cb
+          - miyoo,pocketgo-s30-panel
       - const: ilitek,ili9488
 
   reg:
-- 
2.43.0

