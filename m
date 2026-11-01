Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.128.43
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793543439;
	b=XT0fMvrCmjd/XfRVg3MfZMaVNux6ljhVJNJrGg3KG8/mjvbRcpGlH3065btM8qXtqDsw
	 87xJ+9I0DWFGzTuUpW0+0d95baWsms2BKzYvL051UfpjGvqSgABaXHXhjMrd4unQ6lusx
	 fWoLvpq0epezlgCyYrAUizYi7DCnNFdhbQf1jAgy7tOIDQ86kqqLq2JuHsneCZEeHLO1d
	 HvR8O7fyxyH4W9p8lGpTcRVl2GUTHiAMv41DrQEMIDXeK+hRm1Yw79jK81PN18/uIHOMI
	 0p+Zwd+egB+Dekk2RCBeHjgStc405Awm3BY6pm7JhBMFL4X5k/F1nkDF8GnI/3HWPYg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793543439;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Transfer-Encoding;
	bh=MwLKndDaWXaFJaXmWFWUgrFys43AjE+4hjbpyyuRG4A=;
	b=2rBX/emz7mgkMNQLpAgf+OQEjIW9d0DppjL7YpBjRBTHwuBJb3c6I9D0BMn0XOQm9flb
	 ctQ8wT3YtQaSMyjOk5JCoP6wF4A+d/Bx506NwrYz0E6y5Pr1c3Ar3rr9oVYFLLuFiOZo8
	 VMARSTamz4oLi9x3Il32NgaIedTTsEcOCmFFAf5i+zYHiy0cVVXw7kWz90bPKIZcJCLs0
	 gEVmYay5PSWGp9MA5wiU0nt1wgU52dKzT8+g2Njl5QXH6I+tngyUb5oUSp8UMyk+EKDfm
	 Xai4qf7dL3VswrAoh8Ml9ARijGGKZ0oz5fgjTm393QaLXVsEXsiaaw7syL632yf30rA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=KB+9LVis;
	arc=none smtp.remote-ip=209.85.128.43
Received: from mail-wm1-f43.google.com (mail-wm1-f43.google.com [209.85.128.43])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 74F15606A331
	for <sashiko-reviews@lists.linux.dev>; Sun,  1 Nov 2026 14:30:39 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 74F15606A331
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=KB+9LVis
Received: by mail-wm1-f43.google.com with SMTP id 5b1f17b1804b1-4a1b07c3c5fso18474355e9.1
        for <sashiko-reviews@lists.linux.dev>; Sun, 01 Nov 2026 06:30:39 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1793543438; x=1794148238; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=MwLKndDaWXaFJaXmWFWUgrFys43AjE+4hjbpyyuRG4A=;
        b=KB+9LVisvyzOzA1QkRB0NcSn6ae3rKW3D38JPmHD1JCyk1eMtH78HQ5JG+/5aNYbpT
         yJjellkOG6nAWpdzsyzz1PD6luqYwqKl1c1XTHzRQWE2BUw3olsQsavs35V0h1QkSrZD
         sBt7nDvZYSBnBRWi5iA/7sBjoFZ8dHXUEUvfcQcbpBCgTJE+nEn4gQa/icPyvYdvz7fc
         WDj3j+ZlC/wFa+VPBcNLNjCpU1W40djnBvm7JsjA4KdVvRQTJXEQ5e52FYM2IDm9ZZ3+
         tmZD+HAyHiV9WYFJ28b1u23NeeElbnnfBFOctoXlBEZV8bZFmOepzB5GZZ7uRqQVJ76g
         0ZFQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793543438; x=1794148238;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=MwLKndDaWXaFJaXmWFWUgrFys43AjE+4hjbpyyuRG4A=;
        b=teXH8Ewb5Q3hup7FBJR2m9YIyM7no9oy1QWPr+ajskRoPWLIk9ps+qladJmweqCZ5F
         VWjlXVlGBYW1aSM8d00MD8rzVNQ6U7KJhsp1cVUQjz+R3tFkIg6/mu9mP7Sw/JClV+cB
         5XuZpDyhkJPBwz/QR2rrSd4y6au9dLTJkKpF1v8cJ1FtKn+Aa38IE6OtGv269h4cYQEE
         jDQ7+kZ8kvac8za1Sxf7pTf6d+GULhvgiRQ8PqdRwqCWuhG5VaSpbsYj8DEuEMN8kCo5
         UQaNSx0kyvT/HxfcdTTlC4VLKWwJdpf7ZFn/PwkpA8CxDmflJYDzYQjJbM4mLjzF4Qsf
         RDgQ==
X-Forwarded-Encrypted: i=1; AKwUvBzNESRCkNRFFTnx0sGU9Iihl+Xt8UNP8h7WSxpus+S8T67CQK//Fn78UoeEOGmLXz45Yyo5M/Zeu9F3sYy4wT8=@lists.linux.dev
X-Gm-Message-State: AFq9FYIQYDLyjA0XnMwwHsBI2/RzmXiOduvURk5v7gvTzkBQWrN6cl/J
	Rchd4lP4tE0OyVKRD5Akr5LOuXntbQH43zSOKIUCQAMd/4EKXT4u/peJ
X-Gm-Gg: AYBFou2Sg6g8m6GzAPWt07qfalvFxfWO5CECSDrNolt/N75QGTlh7Yg8vcnCvfAhnpB
	xo+NxXMXUjfDSYSDQ2AIo3n7F4p9Wizd+yJF+MkRQVUVXm4/sRsX1UI4z0XZoqtVaXdjO2X7nhY
	foA4AdwggoYI5GvK9R8T1S8K/Pw5ZFm/2YnVD+H2SQLQMZGmzP2qOZ8j6T4xNvKC6w7iWUUOQkR
	0qLSd6/EG0LFvFzk3BknHG7k4leew+Q1KfV4sKC7Dzu4jPHu0fEOqhZt0DyItffKyhsS+gmRQlr
	QyUbyZ1S/2DsI28yY/PAUkjL9wbpANvb/vchAiE9eRYHaKsPd/MmYk4cjsdbganQ2/jwyGFf4s4
	DKfWrEescNk0fgrfjTjbVIQZkFpJASwNFX5whXD9WGbnPzunRxFJZDJOGiG+AtUKFHW318DuVNl
	l71zAfL2+SORWivcphkzfm1X+KePAJ6n4DhsS28AAOkQv8QgwtNf235trSLNEgKYcp21IwOX7rk
	CYmnzfhOjHGZdCH7sDNAhlsPu3ZlDcguyw/W5u14lu0EXst78uLxk5AKM8u47ZSu9dmqjTVz9bi
	6hpx5XA/pII3oa1cYdEq5xgH7zmBwq/kYmVLNtP/uvJIdzqAPW0EcWrU/8RaHy8IVA+HD2wkIWq
	pR4eiMbBphqA3RdGOL8OnfZO+vb/PqjLk8ckx74ourebF
X-Received: by 2002:a05:600c:848c:b0:4a1:d087:f6ab with SMTP id 5b1f17b1804b1-4ac17d19e0amr176697105e9.18.1793543437845;
        Sun, 01 Nov 2026 06:30:37 -0800 (PST)
Received: from romain-ThinkPad-P14s-Gen-5-AMD.tail433d9c.ts.net ([2001:861:39c2:e340:849f:a468:4121:a85])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4abe7706516sm138430595e9.0.2026.11.01.06.30.37
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 01 Nov 2026 06:30:37 -0800 (PST)
From: Romain TISSERAND <romain.tisserand@gmail.com>
To: Mark Brown <broonie@kernel.org>,
	Liam Girdwood <lgirdwood@gmail.com>
Cc: Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Oder Chiou <oder_chiou@realtek.com>,
	Jaroslav Kysela <perex@perex.cz>,
	Takashi Iwai <tiwai@suse.com>,
	Animesh Agarwal <animeshagarwal28@gmail.com>,
	linux-sound@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	sashiko-reviews@lists.linux.dev
Subject: [PATCH v2 1/2] ASoC: dt-bindings: realtek,rt5631: Add the optional MCLK
Date: Sun,  1 Nov 2026 15:30:34 +0100
Message-ID: <20261101143035.880469-2-romain.tisserand@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20261101143035.880469-1-romain.tisserand@gmail.com>
References: <20261101143035.880469-1-romain.tisserand@gmail.com>
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

The RT5631 runs from a master clock on its MCLK pin. On boards where that
clock comes from a SoC clock output, the codec node needs to name it so
the driver can keep it running while the codec is in use.

Document an optional "mclk" clock, as the realtek,rt5616 binding does.

Signed-off-by: Romain TISSERAND <romain.tisserand@gmail.com>
Reviewed-by: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
---
 .../devicetree/bindings/sound/realtek,rt5631.yaml         | 8 ++++++++
 1 file changed, 8 insertions(+)

diff --git a/Documentation/devicetree/bindings/sound/realtek,rt5631.yaml b/Documentation/devicetree/bindings/sound/realtek,rt5631.yaml
index 747a731c44..03ee25e1eb 100644
--- a/Documentation/devicetree/bindings/sound/realtek,rt5631.yaml
+++ b/Documentation/devicetree/bindings/sound/realtek,rt5631.yaml
@@ -45,6 +45,14 @@ properties:
   reg:
     maxItems: 1
 
+  clocks:
+    items:
+      - description: Master clock to the CODEC
+
+  clock-names:
+    items:
+      - const: mclk
+
   port:
     $ref: audio-graph-port.yaml#
     unevaluatedProperties: false
-- 
2.43.0

