Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.215.180
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795742793;
	b=RK/sc7zRKUZyW0BBoQu8kW9T6yxLLtkJXY5zJ6BGaJjqttmfdjdItHqlso1r+yYZmGZV
	 v+nW2vbTqPRcj6VlaImze5JvS4vqn0jwvOQF6oG/q1jsyX+BY2PpKb8+qKlVNImn7S0jB
	 JSKxVft1eymy6LoicfoiuZGNBLQvEgDh1ErA9dRh738eftW7dBU5P57S+BSW/vf36lm+U
	 3iGWVRAbQi1pxIzw1SYoxOfkYAKXnA4TgCskXzERiAtFSrSsoOsz98iiMR+AlJ42L/E+l
	 El6a67H6D2JNMvNJUH+fLTbnV8Jefrnk/Gwtlo5LmlNH9HWVToKO+N6Ff5N4ZOi1IPw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795742793;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Transfer-Encoding;
	bh=4ZwWBrnn96TFtHdsd5bNIm5u9QIUQi8JSQL+RPU0pxg=;
	b=CvvvSkhi0FFjoioO6sxuhbMmFxaOV5qpdTz/8qkrLRScp/jTCBDeoIr6J74NiH7yyuh5
	 ahAIVPGVh46FUNv8GeArj/EoMAd2a4ejMgtK0keSV55JE1s4yFs4wBBnJpb7C7c2xaPAe
	 58Mo7Wnhta1H+oihcRoPSeqT1JWqTBcZigUADDBvWW7J2BhcbO823pwo0Uo6nRH6j2YTR
	 Qhyfql4Nnf2f6rS4495hB0h0/9AZ9ONVVOswMZXs8cRpLY9ccXtVCB75yfinBWBUIzYAz
	 NEtI9pwxvS3evVkOg0ojC5kZ8JfqHaAYgi+VrI0sAlVOsoGK7GyHsrfz1c/RjbqrIbA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b="F/32XpNJ";
	arc=none smtp.remote-ip=209.85.215.180
Received: from mail-pg1-f180.google.com (mail-pg1-f180.google.com [209.85.215.180])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6C085606A326
	for <sashiko-reviews@lists.linux.dev>; Fri, 27 Nov 2026 01:26:33 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 6C085606A326
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=F/32XpNJ
Received: by mail-pg1-f180.google.com with SMTP id 41be03b00d2f7-cddac941ed1so3376187a12.2
        for <sashiko-reviews@lists.linux.dev>; Thu, 26 Nov 2026 17:26:33 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1795742793; x=1796347593; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=4ZwWBrnn96TFtHdsd5bNIm5u9QIUQi8JSQL+RPU0pxg=;
        b=F/32XpNJVVGZkfa68cpDs3aPvoVBGVkMc3QHDXVvnzQSZ/d1x7JQa6GK8HcyyzoQvP
         WbPgmPd82Zth8PTjBI8chLDJoJEe+MsoiBGIuvmtQGWi5Uk+TTk6ZQH5iJdFjIp2QD8F
         UQZM7xU/4I2A3PoRzuDkcAnbxDqMxf2wcq6schRXjc2WjZtM444Z5OTJQZrb3E4UtEdy
         6cbWoEysc+G3t/AGPv6CRtCwm9SEgriagdHCe8t1pz9DYsq/2wIqn6GkKBKRYE+CtGZz
         n2w9c2SImleqOhxBC9TdqAJObWcANDKdga+C7BZpPSkfFT+tISoNqaDOcdgiSK4a/PGa
         P+Iw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795742793; x=1796347593;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=4ZwWBrnn96TFtHdsd5bNIm5u9QIUQi8JSQL+RPU0pxg=;
        b=z/rXtopdQGyQ0UtxOOb9cvxrgDPOifDtF/NbGuXPKTcEJmn7MKJjqa/krVsi9CMhXp
         kcnk+K4wVGEFwqhVoyNG8Zj7vJQRR62dYuYSz9U7/QLaaFCBlUcM0SMfUBsNtml3N+gi
         6NcoANPTt+JxKKtaKAWb6EpLiveGhIEzquZQJEYFl2stXxv14etcpeiur7PtQfYuf3L8
         oY3IAwValowPySPdrBnwR9+UwBPu91Okik4T/A+Cyry/DDRzNiyjXNzXhEIzAcrgNpD7
         rPzT5gSQrlspZDiKZz6BsP1Ysb4oLqe3FUpOhGntToNWpCt5On1t/f3kZqm15d6HmiED
         +S4Q==
X-Forwarded-Encrypted: i=1; AL+hErFTdKN0+pS1iD3KpC01RokdL5iUJvW/Pt16J/OX889CfLwdU9NlYQSRiNyGvGfzCc2/Z5Obd+CYFmmT1mrIS3c=@lists.linux.dev
X-Gm-Message-State: APuU4Z/XEbRQ6ZVYnu4DvM2pbQBgUbZCelMuohtkUEtcqQgbaVApDwZb
	Ugbu0mGWtk7h9HUZyVpeMnTlXyYVOvCCIa3l9yjtJpqd8KSOVM9frgbY
X-Gm-Gg: AZFdTZcURNWb2S0p/S9hYAnu8XIoFxuLaI8iBy1eM6ZoNB+9bYciOrTzIObtjoG4ZnW
	rHxnpX/htCiBgeCFs20hUze2M8SIYRniPxNPgA2MrulHUVBqh7Vf6e9i6tLnErJxCw1IxETcOxE
	zqH9E4T07hzV469UtYoFXzEbQOBzsZl7UuH+niuJ5KY8msH//aiiNam8zUS1UULNOzYBIt7gJ05
	/2gWLkFi+7kDXwNXd9cmY08+2z/A5rl3pJvbnMdTZ8kur0ywAdGC3y5voi5rEXYBil++VQHohdw
	GN4EgLdglZ9Xxt4TNUKuzeAHzONNcyEpHPcmxeyB7XXU6M2z4YgUsTJQGlQ2JwWfUGe0ZB7wwcI
	YK2sgQr2cHqKLPwpYrjVgF/Y8i2R+ooVEFcnn+VkWOWcDgfqq/hNSLBcY0guWmtNZfZ0Gn3C0gL
	HdGNDbD/o9MY961+OlvJO+d4z0UHqs0f8T7KhNRa5o5SfBQiYU8eqECO5/1tzUMmYukkbbhI4Br
	RdQunBlJAbhXgpzR2HB4Iapasi8PKvXpGJWJFcE9+TbpNYgO+kb+6QVhUZrvTzEsTjlmDq1hquJ
	l0/E5OAamXzEQqW2EhQwyKp8/ozSjzKpZqkOdwHSPwmdQHVH7iKw3gXYzmBzl+Wb2TxcbsH19Rg
	uNqN/JcuDL1cDiQQVppIfHaYzeuS60b9E1EF0ZfYd3mkP6Q==
X-Received: by 2002:a17:90b:2f8f:b0:3b0:ad59:7199 with SMTP id 98e67ed59e1d1-3b41c942629mr20023312a91.32.1795742792547;
        Thu, 26 Nov 2026 17:26:32 -0800 (PST)
Received: from romain-ThinkPad-P14s-Gen-5-AMD.tail433d9c.ts.net ([2001:861:39c2:e340:1432:1241:93b7:7b4b])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3b41ad0b2c4sm35042866a91.4.2026.11.26.17.26.25
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 26 Nov 2026 17:26:32 -0800 (PST)
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
Subject: [PATCH 1/4] dt-bindings: iio: adc: Add the Miyoo A30 analog stick MCU
Date: Fri, 27 Nov 2026 02:26:09 +0100
Message-ID: <20261127012612.1589039-2-romain.tisserand@gmail.com>
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

The Miyoo A30 handheld (Allwinner A33) reads its analog stick through a
microcontroller that samples the two stick potentiometers and streams
the raw 8-bit readings on a UART. Describe it as a serial device with two
IIO channels, X and Y, for adc-joystick.

Signed-off-by: Romain TISSERAND <romain.tisserand@gmail.com>
---
 .../bindings/iio/adc/miyoo,a30-stick.yaml     | 42 +++++++++++++++++++
 1 file changed, 42 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/iio/adc/miyoo,a30-stick.yaml

diff --git a/Documentation/devicetree/bindings/iio/adc/miyoo,a30-stick.yaml b/Documentation/devicetree/bindings/iio/adc/miyoo,a30-stick.yaml
new file mode 100644
index 000000000000..6c0e997d4ff0
--- /dev/null
+++ b/Documentation/devicetree/bindings/iio/adc/miyoo,a30-stick.yaml
@@ -0,0 +1,42 @@
+# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
+%YAML 1.2
+---
+$id: http://devicetree.org/schemas/iio/adc/miyoo,a30-stick.yaml#
+$schema: http://devicetree.org/meta-schemas/core.yaml#
+
+title: Miyoo A30 analog stick MCU
+
+maintainers:
+  - Romain TISSERAND <romain.tisserand@gmail.com>
+
+description:
+  The Miyoo A30 handheld reads its analog stick through a microcontroller
+  that samples the stick potentiometers and streams the raw readings on a
+  UART at 9600 baud. It provides two channels, X (0) and Y (1).
+
+allOf:
+  - $ref: /schemas/serial/serial-peripheral-props.yaml#
+
+properties:
+  compatible:
+    const: miyoo,a30-stick
+
+  "#io-channel-cells":
+    const: 1
+
+  vdd-supply: true
+
+required:
+  - compatible
+  - "#io-channel-cells"
+
+unevaluatedProperties: false
+
+examples:
+  - |
+    serial {
+        adc {
+            compatible = "miyoo,a30-stick";
+            #io-channel-cells = <1>;
+        };
+    };
-- 
2.43.0

