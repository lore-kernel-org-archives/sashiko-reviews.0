Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.128.50
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793703928;
	b=MKpJg9FzmhxzWFHE6OQlofgbBnGyvBlr8tm49TMCcslVgvL2jXq4X5m177fEJqudRSuG
	 T6dhytixELtRF4O3iKykHDPgwcxr57BzFigcMk/fNo9br+NdYbFjYQG6AcellUP1kuzu/
	 Cn1UEPspvjuYGb5bGpTdwSW/KGESvcKk4UeGD5HgEdP6F3aIe8sB+yWuulFvEBsrXq8Sl
	 wP/JW41ok8rcnNR0B2AOmKw+0j7bORL8Gwvh5FzesRlGdUrTnK5sCYcQvAje+ZPGSi0Fb
	 KPpCkjsW86Kyh24CVhxItANq74gnK1MUOHLmmV2JsvMmnaUkdTxOsdzshEt+VAM65jA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793703928;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:MIME-Version:
	 Content-Transfer-Encoding;
	bh=LFiGU0wVYYFRIuNAq63PC6SLhwVIgqIMMPvA4Bls3qE=;
	b=Eo4XA8QLWnZkORFbYF6jMJ5xi6Z5uziUV3E3ll9e+0TkYGvr5nKNTcoSQwqdk7PTpTYM
	 h7mjvrltuTLBKiMB0WGoWVw8WoKrZKK1e4WrI/tV/P/2cAQYF3uD8LMYGTs0D7ho6u791
	 t1GUjxC33HeWmxgRKe6o32wj5KtzA/JN0dBy4XF6kh0yXa0Uhzy1SEquu+3b7IHWDUYqC
	 kLy+DvvWCdPgSz3TX9YQHQD3WDxLNn4ND2u7MrRluIsimu3OVVETnJrHR0MTy21V+LkF8
	 rXnl1xHf0KGN/UrTlWAP5D9ZtPsJsA+bkqEDaYANFJeVstxw9vqB20i7cHcxANGLfZA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=hbGbibxd;
	arc=none smtp.remote-ip=209.85.128.50
Received: from mail-wm1-f50.google.com (mail-wm1-f50.google.com [209.85.128.50])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 72D6D606D81C
	for <sashiko-reviews@lists.linux.dev>; Tue,  3 Nov 2026 11:05:27 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 72D6D606D81C
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=hbGbibxd
Received: by mail-wm1-f50.google.com with SMTP id 5b1f17b1804b1-4a2167bd087so33912725e9.3
        for <sashiko-reviews@lists.linux.dev>; Tue, 03 Nov 2026 03:05:27 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1793703926; x=1794308726; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=LFiGU0wVYYFRIuNAq63PC6SLhwVIgqIMMPvA4Bls3qE=;
        b=hbGbibxdBNs1pWTBpkATEWJYePLrM9MtiAvr6Ym6ctg0IUt2LqjShpIgDbva0b9vYQ
         HYtDXsfnDzOUnmTaEH+sDJZAljhE/NyHluKsz+MJOmL3Edf0poY/2sU++mwSqgq3USNH
         v7Q41zSsq8+Wj1Y6BaZgpIV3YsBUB4QFEuZo8cw2euzfLeUrmIRW66q5knvwPvB139KJ
         T1UR000JYOuDbILAaX9a3mgGoKSMAf9h6ZXXAfaws+gFa+SgFV2xfUjAY9a3SrOZZ05b
         SaZTMlnj1B+YlUdrZ317B/ngtfdfRJavhdBXVkdEvdJfxcCo3fM3BHeDT6HAKz85ldFH
         XBcg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793703926; x=1794308726;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=LFiGU0wVYYFRIuNAq63PC6SLhwVIgqIMMPvA4Bls3qE=;
        b=Re7KG7m3BjeX6EZ8bsUlU9VWRJh9EU4UO24a8OMVp9Q6nFuSeaOywOA5ncQATz9n/9
         vvqMPM3UDrUX2Vii6qoJfLrXLPtFAICZXI5tf6sprwnbJ/V9/LwJP9VusOW9CGsKzgL3
         YDvxBg3OnxNEid4Z7JgoJvzQSKhxD56iP9e6cECvULAW33qKM0oDyNiZTZUM0sURjRc2
         FnMmIHREVs+fc4X77bmlV4F7vU2rBGjmHP2TsOLkBaWiCF2pI98RbgngQPdgrWkLyUVa
         37SRd4d2e+Wxrovozy768l3wpXLboDq6nkRbIWlXVy1TEGWohnmMiPjHKQSSL01jcxxh
         sYIw==
X-Forwarded-Encrypted: i=1; AKwUvBywcRgYMaWSIBqufPX2KnonOq3LiYYh9JCMGEa3hQBfV37/gZRy5ua46ov306jcTph8HWKwC4HE5rzFWQB4lPo=@lists.linux.dev
X-Gm-Message-State: APuU4Z9eBSadPxwqU7wrXqdjJ7WeQwfzxxh0bV93A+0Kc9dsTto7amAN
	oFC+XtdUtNblSeDhwDfy8AUEZ0FqU3xUShgLa6vL0jcrtPEWNDOzFih7
X-Gm-Gg: AYBFou0j36a2A2q8PWajNXgnXWo5zVflt+Ip35ATQD87jn7fS8tNLFl2x+T5J6ovxvN
	xqgWsh7bjo+zF7dDLhGjhmQ5TzjIib+FodhCQMRdix3cyJIyMGVeOqhuI42DaQUdwfdVmFzhUHd
	zKKVT1we5gkukrHuEYaWnByH1Wcu7tj8pRB9rNBQBKiz4pCNskLnxoUzslkpj5QS95erMMK8oJB
	ki+wU0/+QYyHRLWMFXRWP6J9mI5RQSvH1LNDR1cTnHcN7BcKK+MubM3/R5hHC+u+vjQtQQr99+T
	QILk86zwwKOLbhbdTGbgNuwLKRGc5s39lJISCAerCzzg0zfBLlNHCRUnt4rF9oe7DXNf8elEST0
	M33pGi4fQonDzib97NCTLut1vXXE2OWojCat76ycHh5Ff+8AFvS5JjlBH7npz6lLfiyDrCne+89
	2zHIgnJiHwlwzdFfh+XalVe8KxqwRIDbccqq0dEq0I8M0HWHUQRkei4e5zZI+/SaCpo0sP1QKKU
	q6fATqfNYFtEQckHkNm8fTCEcWaxebwobUr3Rm6yIyF0LM6AtjFxJstgot8adzkz8/POwTojctM
	ercBCNlLwTqFbmsH1KDJOuiYNFrIJ1q6yZusNtzX8VVszwe27pd6dkcG9P4d6u6qAXj4v2ENIpE
	e3mNveCq84+ua7zhHH73VS/2w07IMBh31okravy5FWsuFFg==
X-Received: by 2002:a05:600c:3f14:b0:4a3:59ee:86b with SMTP id 5b1f17b1804b1-4ac14ec873emr282656675e9.4.1793703925515;
        Tue, 03 Nov 2026 03:05:25 -0800 (PST)
Received: from romain-ThinkPad-P14s-Gen-5-AMD.tail433d9c.ts.net ([2001:861:39c2:e340:14ec:7986:30c8:6bc6])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4b2afee292bsm53218155e9.4.2026.11.03.03.05.24
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 03 Nov 2026 03:05:25 -0800 (PST)
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
Subject: [PATCH 0/4] drm/panel: ilitek-ili9488: add the PocketGo S30 panel
Date: Tue,  3 Nov 2026 12:05:20 +0100
Message-ID: <20261103110524.2812831-1-romain.tisserand@gmail.com>
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

The PocketGo S30 is an Allwinner A33 handheld with a 320x480 1-lane
MIPI-DSI panel built around an Ilitek ILI9488. The panel uses the
existing ILI9488 DSI driver with its own init sequence (from the stock
kernel), timings and DSI mode; the sequence is close to the
E35GH-I-MW800CB one.

Patch 1 adds the vendor prefix. Patch 2 makes the binding's port
optional: the Allwinner sun6i DSI host links its panel as a child node
and has no output port, and the driver does not use one. Patch 3 adds
the compatible, patch 4 the panel. The board devicetree will be sent to
the sunxi tree separately.

Testing: each patch built with W=1 for arm (multi_v7_defconfig,
DRM_PANEL_ILITEK_ILI9488=y and =m) and arm64 (defconfig, =m), no
warnings; dt_binding_check clean for ilitek,ili9488.yaml and
vendor-prefixes.yaml. Tested on a PocketGo S30 on 7.3.1 with the final
version of this series (A33 sun6i DSI, one lane): the panel probes and
attaches to the DSI host, and the picture shows the right colors, size
and position.

Tool disclosure: this series was prepared with Claude Opus 5.5
(Anthropic) as a coding assistant, in an interactive session: it
extracted the stock init table and timings, wrote the code, the
bindings and the messages. I reviewed and understand it, and tested it
as described.

Romain TISSERAND (4):
  dt-bindings: vendor-prefixes: add PocketGo
  dt-bindings: display: panel: ilitek,ili9488: make the port optional
  dt-bindings: display: panel: ilitek,ili9488: add the PocketGo S30
    panel
  drm/panel: ilitek-ili9488: add the PocketGo S30 panel

 .../display/panel/ilitek,ili9488.yaml         |  2 +-
 .../devicetree/bindings/vendor-prefixes.yaml  |  2 +
 drivers/gpu/drm/panel/panel-ilitek-ili9488.c  | 55 +++++++++++++++++++
 3 files changed, 58 insertions(+), 1 deletion(-)


base-commit: a1e63ab695ad76850ab9787b9eb6aab695dc2965
-- 
2.43.0

