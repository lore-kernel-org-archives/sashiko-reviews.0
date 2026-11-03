Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.128.51
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793703929;
	b=I6QJNNlx0wk0b2L+BQGa2vYpP23eANdlQqIEF5jtrcXBnkCtbRJ2ifbq1W2uyta10+9f
	 ZchHtz1V1BAonmUPyOZzZPDVXi8htYY9y2jxHC8j8UxXHg7JzxpFuBn3iGdkn7ECqeGlq
	 59dUNpNJhxZtQum+JIWF3ZqjoFAbbLAXB65fRSZ5nttrSy4GlVuVE6aWx7+sWZEBmz8yV
	 gzznZrxnfsCOqfJ0WBIxum3mWTT41bExJorpu8ONu6O6EbozHW/XJhptJuPsylFCNPrJk
	 Fvgkr4aI9caujxhwR5VlV3MzeHFphR2j/JskSH+DWH5yhCsnk48HqbGoj/iTq+xS75w==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793703929;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Transfer-Encoding;
	bh=2peUJ98OgTSEIArQaXah+YOCOAD/R5kMNJb0El9Mbi0=;
	b=K/L9GmNG/Zo4KQhzm6H4cDJbDP4rDW/1GiQayGmfCvmIzYlegWBPLZFEHDffjTJyH13N
	 7eslnKXQ0Uu153VGS57iUFYiTUFfM8RKzDONHPH0Rd+qvkxbBFyjjCToTJ7rYERMGoCNV
	 T4Wylbz8ZsQzrDyFauoOGYOYQMll9BI40VyeM4a4c+ryiupW1i14WDNLZ6Z7U/WuQ3V/9
	 kxTeE7/LoQ3ZwzxD/WZB3BtriUEgDOW2t11iv1u+gL+CtSlwJv9sfqGJsbHJgL+opp7mE
	 f7bwQReXz1kUWYHTupXjgYQ313toZvZwL6lpKdQi2aoc0bau/4eSb+mUkqUqZwjIKmw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=OlpmbPGd;
	arc=none smtp.remote-ip=209.85.128.51
Received: from mail-wm1-f51.google.com (mail-wm1-f51.google.com [209.85.128.51])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7F63D606ED86
	for <sashiko-reviews@lists.linux.dev>; Tue,  3 Nov 2026 11:05:29 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 7F63D606ED86
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=OlpmbPGd
Received: by mail-wm1-f51.google.com with SMTP id 5b1f17b1804b1-4a140e7405dso40474845e9.3
        for <sashiko-reviews@lists.linux.dev>; Tue, 03 Nov 2026 03:05:29 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1793703928; x=1794308728; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=2peUJ98OgTSEIArQaXah+YOCOAD/R5kMNJb0El9Mbi0=;
        b=OlpmbPGdUeHWH4Nextt6pJiY9TQZoNCDNpd1rvXfBGYrfXG8p98IZEDaYpjVCrBKZg
         PA85PpisXU4qF0Ku4eKLm9GzqJNP7yKiJvO/4wQYeqq3LRcZH+bMefIoa62YoK3gXlNc
         m3j0hE0d3yO4XUqoh0XtA6lk72s628itsmep4xRgDZKj9oTylLta8hMPHbHeNfX55yem
         uG4fcks66OoybG9oj69NzwQ0HNw9ydzd83T+veDT/56x0NBLC62r3MPHZrKHm0o4HVmZ
         R+LRattyzKJ9mooAOFCl6beKFquXaQpOzOK6WGAUyXycFk5NMlH18YRU4SL1k/jIx3Et
         KA+A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793703928; x=1794308728;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=2peUJ98OgTSEIArQaXah+YOCOAD/R5kMNJb0El9Mbi0=;
        b=e1x34AryBLP7FI6AEj9ytoX1e5AuSgDvblpIg4GzpfXkCNmM0PtMtVte5Qg4XL4mKG
         OzFBj3jRDfj6LB8maxMdDuhKeleLqYpWDYCwUhSFowUi/bitgwO48fueYRJwURaISC03
         WQCIhIRlwZNb63pNZrb00viDllvgIEgm6LpY3BeWL6MCBeN27rnzC8tPy7sBzwp8yzbo
         TLLPPwfZYLQmxLbsIb7KDJsEMfCzmg8t+fn9NvS2i0iBXOSjzGsjmbXx+DKWjECzo4TG
         C3SIRtPRWI0V6mJ0L3d9ImpPHrYMk+Dt1iW1smfv11i3xpf+FHgaggnOREYMqZV1l9kD
         PrXg==
X-Forwarded-Encrypted: i=1; AKwUvBz4VzgLvEGgXo41mAfQMqGJ+wLwdlfjte06H0v5Ynxa/ei/MptiPc58qQUWc3XBwCW7I+cvTocYwlPTu9n/HDA=@lists.linux.dev
X-Gm-Message-State: APuU4Z+hkavndx46RQ4Lu53SE2/R+MMV84iW4zMpR4XmqmjnAHffcM/c
	X+S/9t8qoCQKDpOixf5NnnXnXiI09WhAhnFKWthfBmgQu6telJr6BgYf
X-Gm-Gg: AYBFou3xcrJBUPDJ+6wm8+0eMEJUrwqTWeRkgLaWYtjlDVIShtFzl7TemTaQTOFjZvd
	/nvLzymZxYuqL85T4S/qS9KJa868I7zeJXc1WMs0gdXgljmDNAlIuKtK83oMrva3o3KFdtAbSr0
	dz9aiqROCVuBxrU7qQojQBIKFjKOxHjdDNIYQtmGEG8cQo4762W/4ErQJyjhj59XdA3ZGg94dvt
	dSoaKLLSOjlNcg+bIhe+UpPj9QGhDnpj5n5qzqBhYOUg1z8XkNVuozDTyeXHeahWhbl8EFJovj4
	fH1Q8jpKD9cFBrzBScA5+iL0fEIIuOonX3xR02MKnXQ25/52d12Mmy+PsL2WK+7qKCEzzQzaZN6
	zKbh09ky8rmp6szC/vehutQt7GW1cJMhFhMiyFJRfW3RAQfC3Zv41W4g+0bJyfsV6XWb3PrLQEs
	mAVt9KVgTGWPDNGs+Xsjf93OvKveFW7D38hVj5ZHfNMga4k2B22mzHDoOUHwF8SvxIkXGzhEaJX
	R9T2x73wpEC9wMAjadGNXEScmdUHyuAFDmC11mZUBWB5D8useSncDRNwv0ZoyGEFbxylc0IXCD4
	9nJ8DA4AAuyHN2/7ymp8I+D/rluWy/dSFpI1ZniGXuyPPZlXrHjJqttHdGx4LtwMvpXJ/cnMoCb
	s68AnW5/QR6YuJtxHdfFv8J8/4hCVOzABH5sDdGxkxSajEQ==
X-Received: by 2002:a05:600c:19c9:b0:4a1:f377:5c68 with SMTP id 5b1f17b1804b1-4ac18a8911amr292299845e9.34.1793703927676;
        Tue, 03 Nov 2026 03:05:27 -0800 (PST)
Received: from romain-ThinkPad-P14s-Gen-5-AMD.tail433d9c.ts.net ([2001:861:39c2:e340:14ec:7986:30c8:6bc6])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4b2afee292bsm53218155e9.4.2026.11.03.03.05.26
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 03 Nov 2026 03:05:27 -0800 (PST)
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
Subject: [PATCH 3/4] dt-bindings: display: panel: ilitek,ili9488: add the PocketGo S30 panel
Date: Tue,  3 Nov 2026 12:05:23 +0100
Message-ID: <20261103110524.2812831-4-romain.tisserand@gmail.com>
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

The PocketGo S30 handheld has a 320x480 1-lane MIPI-DSI panel built
around an Ilitek ILI9488.

Signed-off-by: Romain TISSERAND <romain.tisserand@gmail.com>
---
 .../devicetree/bindings/display/panel/ilitek,ili9488.yaml        | 1 +
 1 file changed, 1 insertion(+)

diff --git a/Documentation/devicetree/bindings/display/panel/ilitek,ili9488.yaml b/Documentation/devicetree/bindings/display/panel/ilitek,ili9488.yaml
index 016a573893b7..27f9aaa81582 100644
--- a/Documentation/devicetree/bindings/display/panel/ilitek,ili9488.yaml
+++ b/Documentation/devicetree/bindings/display/panel/ilitek,ili9488.yaml
@@ -17,6 +17,7 @@ properties:
     items:
       - enum:
           - focuslcds,e35gh-i-mw800cb
+          - pocketgo,s30-panel
       - const: ilitek,ili9488
 
   reg:
-- 
2.43.0

