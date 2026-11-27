Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.221.43
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795745300;
	b=zMo5dz2v+FMDCPn3xGjRB+Fas4C1x0DxltwMVc38bHpoTLYfzis7LH28bWFUNJ+viBQP
	 JK41mYDiEavQghhVG5FWTTsLOnR/2Tp9JqazdY0uUfp24SRI+IvwmscK892XBtI1N6PYD
	 Xz5/wg/7zGg3WdYVGJc2wgRQZvwiQ8tRmS2ezFTq3ywa4ykkkiPHkuKcXyaytUnHuXsWh
	 k4S+ISw/w3k0pco97jyHds2b5Hs4dBvMy2rYVHpK2WEvpJheQAqHGR3N0t25nNKk/LQ7I
	 fleSbmMxISm7kUqxYIf8sE4a7/3zBn2lKtxEOD7AcFf+1tqUmyQJJY2R5J/BoYNBxdQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795745300;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Transfer-Encoding;
	bh=6KzTZReNBeJl6qCru1asKNz/QUPw2Qe74+6vA5RmLK4=;
	b=d5sLBksXkwKQxZjB5xHIGa+eKVngxYFc7RM5Bqb8jjP0vJo6R51Ispa5HWmUZJaRRv57
	 l7cUCccUq2toNCSMaxNXVNGaCytKoxVXlcy0C/MejNYHXK31xfroyI14evx6esMDUOsRB
	 NDH7jTc3g2MBODekQL1k4lv9YYIa16hZ7LhHT9w400afVx+30KXxul/HLxIVun6dUnJO7
	 gYS1ym7pQO/DxgQy8wLCeRpPzMtAeLtRYCIfzPElBO94fvBC96ep2pT+dKQs1ctA5pa5t
	 xJXJLALmrxVsfJ20p+WgHZHeo9CD52xbVd/x5wwDxvhLz3L/6ZLc+CZl46dOHV3Zmjw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=aJjiV8Eh;
	arc=none smtp.remote-ip=209.85.221.43
Received: from mail-wr1-f43.google.com (mail-wr1-f43.google.com [209.85.221.43])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F1A58606A32F
	for <sashiko-reviews@lists.linux.dev>; Fri, 27 Nov 2026 02:08:19 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org F1A58606A32F
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=aJjiV8Eh
Received: by mail-wr1-f43.google.com with SMTP id ffacd0b85a97d-4a34ffd3e39so4158456f8f.0
        for <sashiko-reviews@lists.linux.dev>; Thu, 26 Nov 2026 18:08:19 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1795745298; x=1796350098; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=6KzTZReNBeJl6qCru1asKNz/QUPw2Qe74+6vA5RmLK4=;
        b=aJjiV8EhZux5j52ViJcKPSIST7XIAyIf2uJdeXlUb4zbcsVHgpHkZ9h6PpyJ2VI5fU
         bprOYz0ooJDCWb5Vl1hSvYRCjlPeMnQ1EZJbK4a++aLYejkcuFXwFtZTt1/++oI6l/Ei
         5+XLBHlP0aFgtDJoCbRmFhLc84DpogZTF1J2N2yNTK42B83iFLs9JdVRsIiX2tUMP3O+
         NvXi9XhJRVSSM4lIopgBYZET2spu8FxOJl+dTzDh9Mg1YWDzVv4wG9KzGlBqutKdaY6X
         ImRBn9HvLtO1IPz/6BwrTXNMBQOphvEU5CfeC7gOL1vK5SnKQ5SVWh9dTlXsiiuaCpnh
         eAOA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795745298; x=1796350098;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=6KzTZReNBeJl6qCru1asKNz/QUPw2Qe74+6vA5RmLK4=;
        b=jtBabOqFE5w5tORj4Kyt/OAdtA1vQDZl3yXPZ+SIdLNTFS5G3cS99X8+IluvEAXigV
         jWMbdMC/YM2SiaRXoCsRdBS85ynJcsRlFEbsfdx6Gh297Hg0Sk21/BrfHPbZCb8sxDOz
         U9cADTxuFYFmqQC3xe2VO/gL8AdYlr/md9pRDNIQiGeNbG/YGUY4Cee3MwKrUmif3lEX
         55HKarDNNbV88Agq/LAPamksGwnHZEiAGnlwEFXt3sQm0WmBSaYOmSDq0m+oVN+IRoMz
         h+xToBxjZTzZS4lLOehtd9CFBXA0yumZaxxNSEDgfwhxFbEXBinCFrF8xKmsZLl5XwR6
         Ol2g==
X-Forwarded-Encrypted: i=1; AL+hErE/wKNS3qJm7AGwyq2qp5fT6j/1yyNUJhN9DNlHHLrW2cKIh9nEYBCn7RlY+lfHUqZKlx5FTys6BkwQ7CrRl0o=@lists.linux.dev
X-Gm-Message-State: APuU4Z+towkVQ3X7jcodS6t/W0f0eTn3HvtFDEbp43RV2+a88Yl/7ZR0
	75LRqxyCXgcbuq/yb8T1Xaf1Ly2Bzyr9Uu0Puc56IGYv9k0NRIgVYOGQ
X-Gm-Gg: AZFdTZepWGBjySnDrP9cGcD0odfyM3yR42sgS/a9FfASBmcmCEULEPoA38Be0+rM4m7
	Km68rQeRA7gnjdGA0sTmqegHrhNTToT995woJfzNaVf4+s7vP7BPpQSJ8dJqDTmQK04/rQnnJ8N
	384ciCzpvVL8AkajwnhAJ3AWtrkMpYO0PRiyB3DC0fPg+OXYUAJNG/+bCMWZzajp6g/lAAFc6EY
	fH+fs/1YEgIB70ohsFZEMtFnp/qbzs3du5Mlx2d7+NjFT1Xv6c9Yv++qtTqo8lnwrkD1d88mZH2
	gMto33jyj5HnL9FnJ5HpUFxZ67YZbCFV5Ea9GxsakIZFTUmm/b53cwf7BI250J7Z5oR7nLcYvkb
	u0e6bvJlwdWJXuZ9Ubx3FloNetrHbZbSEbM7BKj8S41ZD30IgKioaQfRBfQW4ItO4ps/00mHk1g
	0Ktx2z6KPrGTgWhgtSy7TT589HhxfkeiNnJgn6z//jYqth7HZuQHzH2aX5J5RlAmCKSCn8Swp7w
	uAYuA/vtaORmv592MY6aK0qQfBQ3T+d5R6s8ff4qmA+axxC+Go5eIxt+aKnUDUaJkEJ5Greg4ZA
	ABBXYxQ0NHunTnnG1dz8a6hPFg8ICQ1xdzZuNWmryhBiubMOLQfQ/NrIZdr1J1yhmcxvskxcA16
	EeHc5EgElDaA4bt2cycpvqFKk2n7NSc7TmQCHewKIWwmkJQ==
X-Received: by 2002:a05:6000:2482:b0:4bf:2f54:9818 with SMTP id ffacd0b85a97d-4bf2f5498f1mr939131f8f.34.1795745298260;
        Thu, 26 Nov 2026 18:08:18 -0800 (PST)
Received: from romain-ThinkPad-P14s-Gen-5-AMD.tail433d9c.ts.net ([2001:861:39c2:e340:1432:1241:93b7:7b4b])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-4ab6baa3882sm43390844f8f.49.2026.11.26.18.08.17
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 26 Nov 2026 18:08:17 -0800 (PST)
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
Subject: [PATCH 1/4] dt-bindings: display: panel: sitronix,st7701: make the port optional for DSI
Date: Fri, 27 Nov 2026 03:08:12 +0100
Message-ID: <20261127020815.1621790-2-romain.tisserand@gmail.com>
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

A MIPI-DSI panel is a child node of its DSI host and the driver does not
use a graph port for it. Commit 2f50e0a0f9d3 ("dt-bindings: display:
panel: Make DSI panels port optional") made the port optional in the DSI
panel bindings for that reason. sitronix,st7701 was not part of it, as
the binding also covers panels with an RGB input set up over SPI, which
do need the port to the display controller output.

Make the port optional, and keep it required for the SPI-controlled RGB
panel (anbernic,rg28xx-panel) only, as that commit does for
ilitek,ili9806e.

The Allwinner sun6i-a31-mipi-dsi host links its panel through the child
node and has no output port, so the Miyoo A30 panel added next needs
this.

Signed-off-by: Romain TISSERAND <romain.tisserand@gmail.com>
---
 .../bindings/display/panel/sitronix,st7701.yaml       | 11 ++++++++++-
 1 file changed, 10 insertions(+), 1 deletion(-)

diff --git a/Documentation/devicetree/bindings/display/panel/sitronix,st7701.yaml b/Documentation/devicetree/bindings/display/panel/sitronix,st7701.yaml
index 044b84d8638d..3ca9aa215b7f 100644
--- a/Documentation/devicetree/bindings/display/panel/sitronix,st7701.yaml
+++ b/Documentation/devicetree/bindings/display/panel/sitronix,st7701.yaml
@@ -54,7 +54,6 @@ required:
   - reg
   - VCC-supply
   - IOVCC-supply
-  - port
   - reset-gpios
 
 allOf:
@@ -69,6 +68,16 @@ allOf:
     then:
       $ref: /schemas/spi/spi-peripheral-props.yaml#
 
+  - if:
+      properties:
+        compatible:
+          contains:
+            # RGB input, controlled over SPI
+            const: anbernic,rg28xx-panel
+    then:
+      required:
+        - port
+
   - if:
       properties:
         compatible:
-- 
2.43.0

