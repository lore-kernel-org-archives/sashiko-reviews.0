Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.128.47
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794240433;
	b=th/WTFQ7gkV+nGvRIk41Wif2qKU9kvLHyu/si+DUgPSTTaKyX6JdNw4dRZu4nZebdEtI
	 juQtpeZTU/uDEDKdIa7KpCSTw05XXyAOo/1dln143F0jxoRqcBzfVAt/zpIlx/y2pxf24
	 xYdwz7s50HJN2iH2ND2oxhwRuHFJc7iQ8Bnrps5JptaKBin1HEJ6+hTrTCszHEVgCHxE1
	 vXbmUXnMHg9gDlUQq1KuOpDVLamqiH0WLKs7kBmpNVNwqCk6MBTbdcodPm+5nsHFLRa2y
	 AlT7UJe1UAibE48lvvroKhqTpNpIUXKJw6zLg8ZwFXfCxRLzkga2Nhms7+Mazh4utQw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794240433;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Transfer-Encoding;
	bh=YeXOVU3Dlu3RGzoo7GptmhPvzHeqqfiDgx6SA9rp6Cg=;
	b=U20mYe66sHPNP/T64gOMwr4g6GkF4f8zPpPrmn0wj9jC85jrrwCudVkoC2bRKquPguve
	 Yt5Ybr7P6d09AnVvF+s/Q2J/u4efaY3FqhOm1byUIJL7fJJyUOjw/Itit5ckC3um7wxtX
	 5K92ETiOIBQiR/jKdqMUNfXVwt/c9/Qt5ZTj2AHpoFI7mrMSwnzHkkx2Us1RbqQLydT35
	 vmVh5+bZljU9af+zW6Oc2RM78BAZM8XzeirFobwcYpaGbSZFyQCfoYCDIaXtY6pCN/4OQ
	 3CDOBicI9orx/iEHBNT6vk/VNRD+MD8rIXBrK/beKO96sSDEQ7Izcl5JbOD6R0ZmzFw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=gpZG8jVS;
	arc=none smtp.remote-ip=209.85.128.47
Received: from mail-wm1-f47.google.com (mail-wm1-f47.google.com [209.85.128.47])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 07663606A335
	for <sashiko-reviews@lists.linux.dev>; Mon,  9 Nov 2026 16:07:12 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 07663606A335
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=gpZG8jVS
Received: by mail-wm1-f47.google.com with SMTP id 5b1f17b1804b1-4a5087a5348so9056005e9.0
        for <sashiko-reviews@lists.linux.dev>; Mon, 09 Nov 2026 08:07:12 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794240431; x=1794845231; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=YeXOVU3Dlu3RGzoo7GptmhPvzHeqqfiDgx6SA9rp6Cg=;
        b=gpZG8jVSBsgIQ17YviMS/hevR7ztW+tplXcy25CjSpLfyuUR0v17rpwGji2s2HUXzk
         EWPwYxPohii2AVPJHSMTSYPwM6LnWaZ+pv3t7XFJEnbmflA2a1W0Cbp0v7owfEEsqsne
         n7amlCTwfxYcuHOJmtyGptzSxT/Lzs8YpaczbskKlegjOkRapnFu05wUm6OpCMN9itvT
         YNssqylsMr55gq6Px+WUEJ6ioIE1GjWLUufXZjo1fVRq48RtqN4HUUlcNuVg/ZqyAbnS
         JeRVHR5m2ItPO4zHioCRuD8YeEK5c3/LzX9aJ5dz+D7QkmllblLXAdADc5cXmxoJl1gX
         lO2A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794240431; x=1794845231;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=YeXOVU3Dlu3RGzoo7GptmhPvzHeqqfiDgx6SA9rp6Cg=;
        b=MN5Gfp+N1c+Q9/1xFwXTfPqvIL8Gpj1ieiJddKvDt3aKCY/DDBWln133ZcNy8//Yjk
         mT/ao1xFXOnYq5pOtnw2rbAa7evbaXJ/MFhza5tsbK05sTxsAuMu4fHfUNMVYG99t9k4
         PCi2+3RQtgUwkhylEph30CEqeMxH0lvgp/vkYx4uWOWL3imulgvCt+utBn23n6EFMAX1
         Q2MzCjfFruVet5ehvXN3QJf1hR8Eixu+ajNBD8z/qvKieIU52gYHqLavkU2TwvfP9iDF
         IrkUKJwyFmor8t6pMDWi7mRMPyuXF9VBv3oaQQ375bjcubbIN9XiEeO8RUC71VNMOjOU
         pLjg==
X-Forwarded-Encrypted: i=1; AL+hErFi2eqtySiyr/yU3KjY/KrBz7PeYxNesb9kS+pr3SkzZC7JMHnVUJhm7MJHRo2c2KG9/8m9SnyUGqwgUSM9BGY=@lists.linux.dev
X-Gm-Message-State: APuU4Z9/Oy6rYVvyfoFJ/JSCOOPsI9Lb5rDWk8BaK79mNZP4xD1vSViR
	VT9nblX8vz9GrCNVFDfoHdOP0rTUEpI/uWQiqZ/qOIH2unDoz8lim0I8
X-Gm-Gg: AYBFou1HFj7+cQrQULBgvnk7DKN4MOlq4K9q6WzwFRR8OWZ49lYVBoCaVIKs8V7j3Sa
	//fXVeNBv5Hv+4oIg1qVNhyKEJ652C74sS1fXCLhud7B3iTZGaxdaUwW6p0JM3X49wvfn7btMCR
	kqvaxVyi5Y+WGHw3tITy7ggDaD2bnBpet3rpW6lJZ7KH9/0WEeqTSidfvwpwMz+B08TdYhH0u75
	oSWkADKDsLIEqt481/DPdie175PaSRgXyw3OEf6YKXah+ckSkyBZzJc1Yf9lSHgbV858Oidh2PZ
	CD1AyfU/Ug9klCc7Wp/DL/a1nudUejtqZ9KGDHmZGO9BQ81WwrsbSoRFChaKoOvlc3kUCNDuakv
	JKPvv1IA0nG2uLDL6txru86tXLbzYMStVLP4u6p+Sfm44+uy45T597m/McxXcolr1PHLmOnirpv
	AXRJdZ2k8KvyeirkDx5j2yQ/hL/aL+34BK5TNKcQivW7XBHVpKY4mUGzbVegTJajGKu1ScX6f+j
	j9pv9glOuRLOZNcAJ9UC5sc+t2y33YmSWmLMSGJL/P2Ibt2CRekCSy7pyfCxoNX12+QPy7rTndo
	AGGmhp6zXMj7L0c/HLwxDYCTVABSmGLScAgDpDk3RZChlUa5yrRzUmLG+OvbbHzTKTOHBvv2PMa
	m/0VTjM2arvFfJyGaIVbuDQKrx8fdVnJuQXfJiqCIeNzzpkqqDCZYPtlq/LAhHD8=
X-Received: by 2002:a05:600c:34cc:b0:4a1:de8a:603a with SMTP id 5b1f17b1804b1-4b960da49admr82912395e9.6.1794240430762;
        Mon, 09 Nov 2026 08:07:10 -0800 (PST)
Received: from romain-ThinkPad-P14s-Gen-5-AMD.tail433d9c.ts.net ([2001:863:742:6109:ac9d:152:38c3:6463])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4b90f119b96sm159174245e9.15.2026.11.09.08.07.09
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 09 Nov 2026 08:07:10 -0800 (PST)
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
Subject: [PATCH v2 1/3] dt-bindings: display: panel: ilitek,ili9488: make the port optional
Date: Mon,  9 Nov 2026 17:07:04 +0100
Message-ID: <20261109160706.2272332-2-romain.tisserand@gmail.com>
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

The panel is a MIPI-DSI peripheral, a child node of its DSI host, and the
driver does not use a graph port. A port is only needed when the host
links its panel through the graph; other DSI hosts, such as the Allwinner
sun6i-a31-mipi-dsi one, link the child node and have no output port to
point at. The PinePhone panel is described that way on the same host,
without a port.

Keep the port allowed (panel-common) but no longer required, as for other
DSI panels such as ilitek,ili9881c.

Reviewed-by: Igor Reznichenko <igor@reznichenko.net>
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

