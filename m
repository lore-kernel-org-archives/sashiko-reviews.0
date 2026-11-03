Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.128.47
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793703928;
	b=E/hiaBkZAX4k60azil+WYjczaGUgusPMIKQvuppLPdlexh4njR+n84HME3W/jRnltEOv
	 jEo11bEX9h9u5c+aVXVH1AqB1BqHvaohdMlMPYzL3T3SL4uyH2fvz5MHIMCbuwnPgkws1
	 Lx6UDD+RCvdVD2NujeQAFYe7HZ/umvP1BYDWY4/Np9AwKdMXXrUsvhRso5Z4ER6AIHkkG
	 BVZqmwDcggNvU0qVYHDNFbw3luePyOdgxwTEluyx7VV7ILZOLzGwp6aA1u4X0ZeItewpO
	 /g0MnSogFy3Oc5329c2q3XTNx4YHFAJe3RmPWf8DAmfAza5Seth6kewUw284WTlMd4g==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793703928;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Transfer-Encoding;
	bh=h5PxuAlAW6HHJw+w6VONBfKxYmNAlUHhklYCRR6Yodw=;
	b=PDntD+ocwWYgUuQUMjZzF7rYPjP7MgpA5FBa9atUPQGj1uQw+f2JZ27yb//4Sr4MyUBf
	 9OrSExxpGvAFDmRynwMV9xPGaWvN6inRqhAQQECQkOVrMTiw/BtGBVySQpTHavNtvgqLr
	 sMpi7rrDPhBF6Cm54KtXg01F/GxucqVubv3pptdAaKT48FxqdTT8nFUi3S7cf8G2MCZKA
	 4ncEpS7cvnhRarInkvTyd6BbB8zYquSAyZunok0+UmqOiQU8OfQpKLC3XNirz3R13v7td
	 /B7e5G9MzRAxpuTCqHdP/H8GtVjtigQGlVO1v+y3Z3n2XucU/7y1gsrglVOJHPMJynw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=E5s8snNn;
	arc=none smtp.remote-ip=209.85.128.47
Received: from mail-wm1-f47.google.com (mail-wm1-f47.google.com [209.85.128.47])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 98AF2606D832
	for <sashiko-reviews@lists.linux.dev>; Tue,  3 Nov 2026 11:05:28 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 98AF2606D832
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=E5s8snNn
Received: by mail-wm1-f47.google.com with SMTP id 5b1f17b1804b1-4afe2d546f9so23860045e9.3
        for <sashiko-reviews@lists.linux.dev>; Tue, 03 Nov 2026 03:05:28 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1793703927; x=1794308727; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=h5PxuAlAW6HHJw+w6VONBfKxYmNAlUHhklYCRR6Yodw=;
        b=E5s8snNnZDYtqOvDLqclh9dmUkXi3kRd61I4t7GGG86vU4gmGd5QM9MjgI1S/NiKbI
         C7EY1G7h7tbA+amXvQWpcRbzZO5k/wAGmIpM9CDhCh011zvHrFKwkyJEJlMbeGU/jY6s
         zzYFCEr2roXe268dIZLuPgUWpOLhwc0Wz4XySHZJfInqap9TXs+yKB0iAxsrszhCFXPx
         uGJSPEZrlym/ZEAJwLGoLEGPoer+dfk/ov1EaRJkco/bN285ZLlmcRCBDH7gp44AiTS6
         k9RHNivuxnzvM9+itS9vpks9vZYzEMQPJQ8QrxE5tl3OPksch1y3nZMHmPKmtGkDFEYb
         xlnQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793703927; x=1794308727;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=h5PxuAlAW6HHJw+w6VONBfKxYmNAlUHhklYCRR6Yodw=;
        b=pitl5hc5Lk1UWrMy+m81JH666ZFRlud3pdQdVzamlj6WBywIupHto9aR3Mmo81R9W1
         sQAGZM+rJhtJ8DBkDmEXAtI08U+pxL0B50+8bw5OVcQ9eMoGiHhWJSBr6zbcKOVqP2hE
         70Om9CEEI0gOl614AP9MqGw8akoymVIvnF2R9oWooQQSKThaq3ME6Kar/0FKlkIz5I9u
         UHsjApe+sk/REq7Tg6sSNYums13T4ZrM63X6AVwb1T0y4MURJ3YOXrSqvr1flpXrfwXC
         h7ORpHQw2TSiEvlN8hMuxar0MSA2q3E57hGrubQFfRi8rehfUITpiXe4pC0ADMHIvc4a
         oJPA==
X-Forwarded-Encrypted: i=1; AKwUvByemCYYRS5ui2V7UWcamAgzjstt4cs1vN79oWhnX8Q8H7PngioQhAVRpBQ2e+QYFY+9uakdsdJ5QMo4dJ3te04=@lists.linux.dev
X-Gm-Message-State: APuU4Z/aSsAbqouQf4CmDeBuL8GvofxwFPt6tiORcn9e4r6hA5UrIVcI
	st4fj6cXq9F58meDC81X6/wtGk/EPZaJxduXtEZbEwnCCLQND+4q5hIb
X-Gm-Gg: AYBFou0XQJe0bONoCdXkrFHP7H52U0hREMixYF4iCqLCdBxE6MZ+B7sMoepoDuAZbVW
	E2p7gGIORUPcE80Ubv//ffxurL+w9c5saUPYdpm95e4i+dT4VJ8KcvS0kkimkZEIy3SEXx3+eiL
	kcbpRLVixx13yHRa3Z4UQO0kP2ESWmJje7J7RlgoVLbUuxJpZVrhY2rRsUkDE9NH2qxQAXiC1mw
	aX85mMGnelsIPseK4s70Nt0SvbstNkAm12wo9GDEJRzB6nHbh4Jyj/iJt4ZZTqBWnJBK1GVnMsF
	VnOZJyukQQA1CLIlCTVSP2zpMrki+24UzbYoZkgTRlhDOmo6nn0BSmLZ3PBFdFjMfOx3AQAEPk2
	Fls+S40MuELEU5vDc2lza4xckAP3o04jdnorNxltNrRnw+l8VoTkItJqA23haogSnR9TC2nQXQa
	tH0K4pCZgB+YrM3R8uIywy9Tlbzy5t64W/CcUsc6/7X9z8TMPMxvy5+HJxyDcqgxlxgxcjxwpd+
	XlBX+q7ej08KbG5MFYi5Yt9GQ+NFFNgukuChK73iENzzJ7ThG/ptGFKkzvps9LKADXFqjYYMC+n
	q5Ov846z/AU9A8oQCC3FKtuWZIqbWP583GcAjV7pBHC8NUYQ2+oYwhi1Fful01WTJUFfF3T0tD7
	k1Gl7qVDJoKHfJGS/L6+Ew/vmuhc03r+nCbIXx+xuoSp8GQ==
X-Received: by 2002:a05:600c:46d1:b0:4a1:df52:3e36 with SMTP id 5b1f17b1804b1-4ac17b2cdc2mr290564575e9.27.1793703926851;
        Tue, 03 Nov 2026 03:05:26 -0800 (PST)
Received: from romain-ThinkPad-P14s-Gen-5-AMD.tail433d9c.ts.net ([2001:861:39c2:e340:14ec:7986:30c8:6bc6])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4b2afee292bsm53218155e9.4.2026.11.03.03.05.26
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 03 Nov 2026 03:05:26 -0800 (PST)
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
Subject: [PATCH 2/4] dt-bindings: display: panel: ilitek,ili9488: make the port optional
Date: Tue,  3 Nov 2026 12:05:22 +0100
Message-ID: <20261103110524.2812831-3-romain.tisserand@gmail.com>
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

The panel is a MIPI-DSI peripheral, a child node of its DSI host, and the
driver does not use a graph port. A port is only needed when the host
links its panel through the graph; other DSI hosts, such as the Allwinner
sun6i-a31-mipi-dsi one, link the child node and have no output port to
point at. The PinePhone panel is described that way on the same host,
without a port.

Keep the port allowed (panel-common) but no longer required, as for other
DSI panels such as ilitek,ili9881c.

Signed-off-by: Romain TISSERAND <romain.tisserand@gmail.com>
---
 .../devicetree/bindings/display/panel/ilitek,ili9488.yaml        | 1 -
 1 file changed, 1 deletion(-)

diff --git a/Documentation/devicetree/bindings/display/panel/ilitek,ili9488.yaml b/Documentation/devicetree/bindings/display/panel/ilitek,ili9488.yaml
index ea7449273022..016a573893b7 100644
--- a/Documentation/devicetree/bindings/display/panel/ilitek,ili9488.yaml
+++ b/Documentation/devicetree/bindings/display/panel/ilitek,ili9488.yaml
@@ -32,7 +32,6 @@ required:
   - iovcc-supply
   - reset-gpios
   - backlight
-  - port
 
 unevaluatedProperties: false
 
-- 
2.43.0

