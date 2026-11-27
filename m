Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.215.175
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795742808;
	b=RYgqQ5u1wNSWHitr8b7bGUIm5MyA05/PYAP9byXrEgo8QGxxk1V/zxN940pTfcHwNtsz
	 UIYLbcYNzF3eQw4MDesmPoWj3q349NcE6d7YTRIuREx/a13Q+ZD0z7A4UMC9Nz1FS3mge
	 wLqNlO3OscJlejLN/BX9N1gaEttgDXsOSoAYg9tHhEmn4agSWOPUf6WYS6DtBPA221r0J
	 LCRwH5b6jIx6J/b1lWFnoNLKgGBBgMvWlyTIf+tJ/QtdtwCqAej7tNxsoxjhtsjQkb/4F
	 qPPzSxJjyABxcW7IUcFq1MLwUXuZ7I/Vj4/b+/BvdjKn4/GSWBxIeUFuoZU1HpKY8WA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795742808;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Transfer-Encoding;
	bh=aG/KagoNLB3jHRjeL3wtY+SAB/EDT6a7qyc/UcmRA5Y=;
	b=DwdIWm/sw1IQ31t5Xt/uBUyOQOMJiiHNJtwDKvHuSa3paFcYgB6oH8rXa7wYTmODDexH
	 hG0nKryLLMkHvsWW73F7suk3LecIaUCPngY9PnK3PPl/6G6pbhGu9A4sSYd3vGo4Ul0R4
	 FHJKYlpv/gO5BW84Hn7uervk8039LzEnLo/I0066TH8IGPZEdN1E/hwVtbVDO3bU4pUzr
	 nS1n2a+oShfCv8F47yrg60MfA2c7ndZ2WSCRteAdhaeM3NyAiHAeQ5B4aSX4f2/QLIoKv
	 b2knhRSIfr11WK2Ad5XH20RrnvkcttkZtxfsO9bfEHJoYKlgBxq4i6d5e9Sq2Mj6Rog==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=NoPKaa8B;
	arc=none smtp.remote-ip=209.85.215.175
Received: from mail-pg1-f175.google.com (mail-pg1-f175.google.com [209.85.215.175])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 56324606A31C
	for <sashiko-reviews@lists.linux.dev>; Fri, 27 Nov 2026 01:26:48 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 56324606A31C
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=NoPKaa8B
Received: by mail-pg1-f175.google.com with SMTP id 41be03b00d2f7-cdd9d0c9bbdso4344396a12.1
        for <sashiko-reviews@lists.linux.dev>; Thu, 26 Nov 2026 17:26:48 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1795742808; x=1796347608; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=aG/KagoNLB3jHRjeL3wtY+SAB/EDT6a7qyc/UcmRA5Y=;
        b=NoPKaa8BcjDqM5MCIS8zObcnTnrQz59bIfDSMhOnHKGZmEBpFaGv3irzDUmhuQT75/
         WCk09U+itT2vG12UQeCXoroSwiDNHwys8c7Q1K3R/2v0eXIp90dYdHuktt5vnPHDcPS+
         FroBysPyfi+mnTiq4CMNJPlc+bKyrnKP7I26QpMlIoXgnv4fPjks45FcVdT0yAGzEcEn
         +k6MFaKNsWoativ9N9R31taHkJq5mb7IRTxX/YncX++tYtBA0L3mvjC2eZROiAZap0jZ
         dKg6dwcKkNEVfyA54hitpzuF00qZVioHh0dmwdQ/L1+EjXpwapKxHMa0i1tHEP3oNsZ3
         eRWA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795742808; x=1796347608;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=aG/KagoNLB3jHRjeL3wtY+SAB/EDT6a7qyc/UcmRA5Y=;
        b=RwBftlu4S1YR9LGGlJiueBl9iPgyI7CwDY2Ump57GH2TCoOpk26NtgYKfMUeiz8Y5I
         PAxZa9cBnx5HatDvBLDmXo4bRy0rBOEiWiAeVX3hOl5kdk+zXKBBocgdosyqIpIcfWhy
         +H9uh+ZRYQpI3Df+mnj7T27nDUhz+3mXkdf1agsq4dtF8uSUlBnp5BWnP5M62gAd4Hdt
         Tw7Pushkll+/RsD6MeZe1ANpNQUt0i+s9ViL5n0z6NHI00/Zq1zF2usY5Y6+2IVfEZD9
         7TwYaV8WNTY1SGZCMvLjydbRl3faLt6cfj4lX3h6lWlw7SpgA5HlT8pHHlrkPoBNb0hX
         kyNg==
X-Forwarded-Encrypted: i=1; AL+hErEw14Y5dqd0x7/DkdGJWI0mg5pEoq5wQ19p9/aV3csKAK75I5EBudYumdpzTLC2Lp8knYfibUezIzKaE8uv4NQ=@lists.linux.dev
X-Gm-Message-State: APuU4Z8x+QXmKBkivpW6/GZvyWyynqcaZaIeXfHhDE1cY+b3BKpkiH7h
	bdJGWnqYPyYCFcAnPXpEsHc1wQcllt9UzGP8ZIedDv1FdWSrozt++oZAfKhViQpl53E=
X-Gm-Gg: AZFdTZeI3RaDBdAeC0W9ExB5d9/1ABbfdhax4nSpEtopMkGZaX8jhpExbOov8gNBWzJ
	lYJU3FhgQdvaSN5Gg/2da3WLwA3xZD3hVremkW/26ggDTGGQjUJjfLuWn2FwXL/ly9zEw6yYEs/
	6plPQcDWJOIMRe0vUWWT0sX7emWjfe6EqMP+2VPsU1Z/+ebBMyGo5EpcfW/l0AzPLahYeYpq61Q
	SA3pdhG8GE6XW4mWBQC+QUjJ9EDn3aRZplBLHB+gKQzyGrJ5xs3MUqvhrtoBWDpmBV/WTAjamuy
	Lw3bE8dGMHT6HYC3oQHHOJZbjz8wGsNfd9MzblWvJkehvYDyDRr5v22TvXhIXRg2Oe/+xuWwhvt
	atQijpLbO40r/9Tzs1sCRbevoAYEkfEKK/oE55sk+UJ3HAynQglz8VdZl0oXKLLAAP+Gmk1V765
	A0fQdQ4HvO+uyTsGpFdnKyWm8hHOOpb3uTO9mI4/qB/3vlqA4msgpXzsW2XHWGtufeU0YIndMpo
	7Xr1hP02T/btEHuuVrOu2X/g3Vh4WKIkTM5agBNNqJu4Q+877aknP+OK8oTDZW91zLMvd8ZDWYR
	oB6IzsgW+mv0YE1xFK/vSeOCrCbSQ97Wipx/fOuCynnsGe1gMmnQsWnxknLPrEJLSEzARgMQTTx
	GA3EiL7RnTWG+uFdZg8afF7Jsx4fqFyJyyKOL7Z1Nb044Pg==
X-Received: by 2002:a17:90b:1e4f:b0:3b5:35eb:5ea7 with SMTP id 98e67ed59e1d1-3b535eb6056mr549399a91.33.1795742807761;
        Thu, 26 Nov 2026 17:26:47 -0800 (PST)
Received: from romain-ThinkPad-P14s-Gen-5-AMD.tail433d9c.ts.net ([2001:861:39c2:e340:1432:1241:93b7:7b4b])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3b41ad0b2c4sm35042866a91.4.2026.11.26.17.26.40
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 26 Nov 2026 17:26:47 -0800 (PST)
From: Romain TISSERAND <romain.tisserand@gmail.com>
To: Jonathan Cameron <jic23@kernel.org>
Cc: David Lechner <dlechner@baylibre.com>,
	=?UTF-8?q?Nuno=20S=C3=A1?= <nuno.sa@analog.com>,
	Andy Shevchenko <andy@kernel.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	linux-iio@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-sunxi@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	sashiko-reviews@lists.linux.dev
Subject: [PATCH 3/4] dt-bindings: iio: adc: Add the PocketGo S30 analog stick MCU
Date: Fri, 27 Nov 2026 02:26:11 +0100
Message-ID: <20261127012612.1589039-4-romain.tisserand@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20261127012612.1589039-1-romain.tisserand@gmail.com>
References: <20261127012612.1589039-1-romain.tisserand@gmail.com>
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

The PocketGo S30 handheld (Allwinner A33) reads its analog stick through
a microcontroller on I2C that samples the two stick potentiometers and
returns the raw 8-bit readings. Describe it as an I2C device with two
IIO channels, for adc-joystick.

Signed-off-by: Romain TISSERAND <romain.tisserand@gmail.com>
---
 .../iio/adc/miyoo,pocketgo-s30-stick.yaml     | 48 +++++++++++++++++++
 1 file changed, 48 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/iio/adc/miyoo,pocketgo-s30-stick.yaml

diff --git a/Documentation/devicetree/bindings/iio/adc/miyoo,pocketgo-s30-stick.yaml b/Documentation/devicetree/bindings/iio/adc/miyoo,pocketgo-s30-stick.yaml
new file mode 100644
index 000000000000..103a11c96fbb
--- /dev/null
+++ b/Documentation/devicetree/bindings/iio/adc/miyoo,pocketgo-s30-stick.yaml
@@ -0,0 +1,48 @@
+# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
+%YAML 1.2
+---
+$id: http://devicetree.org/schemas/iio/adc/miyoo,pocketgo-s30-stick.yaml#
+$schema: http://devicetree.org/meta-schemas/core.yaml#
+
+title: PocketGo S30 analog stick MCU
+
+maintainers:
+  - Romain TISSERAND <romain.tisserand@gmail.com>
+
+description:
+  The PocketGo S30 handheld reads its analog stick through a microcontroller
+  on I2C that samples the stick potentiometers and returns the raw readings.
+  It provides two channels, one per potentiometer. As the stick is mounted,
+  channel 0 follows the vertical axis and channel 1 the horizontal one.
+
+properties:
+  compatible:
+    const: miyoo,pocketgo-s30-stick
+
+  reg:
+    maxItems: 1
+
+  "#io-channel-cells":
+    const: 1
+
+  vdd-supply: true
+
+required:
+  - compatible
+  - reg
+  - "#io-channel-cells"
+
+additionalProperties: false
+
+examples:
+  - |
+    i2c {
+        #address-cells = <1>;
+        #size-cells = <0>;
+
+        adc@60 {
+            compatible = "miyoo,pocketgo-s30-stick";
+            reg = <0x60>;
+            #io-channel-cells = <1>;
+        };
+    };
-- 
2.43.0

