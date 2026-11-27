Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.221.50
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795745299;
	b=u+GCgt2RjmXdfCP8FN8vJEhUAtBhc80JXmJnAB2/unaqY9rUUHKLR3lrpaOAyR9xbaLZ
	 CZlORwTJtAc+uMhIy2r2yEAwK95S6/l55eMpQl1xvxU4NHMWSjHz+K5iv8RLje7VWXscC
	 Xyd8w3KTTnJw6kMIgT5+WWm90KXptrZEAKu7ruhedN1xrJOPpydsEUCkUurdIPg/f/f4S
	 IuZeJ8NwzjnjuDNwIbFYMJOjHAqv/wtgqy/qujjlm08xupCmV+P2RanP7E2CdC//kKN1z
	 HsW8/grDjNPaUZoL1KiGtsv7HpuWqSIrE1Uu1tGTE0fX+xSTIT/bqk+vxHYUcLZF9eQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795745299;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:MIME-Version:
	 Content-Transfer-Encoding;
	bh=w4DH6C+tDE1JFdLKzQpNer3JwD5m/dqh3XkJoVpVm9Y=;
	b=qRB3LA9veLbJga5+Mgz1/ffZ4y5EblEZj8m0rf9H49xg8YaGaQ0dhzaOxHjxpecXSTHX
	 S19vvWAhAMccapdOK1axggDSSUCwXeNXpVsk+XJviJoRkkgnrPJGlQg/IUaY4bxT8sHHu
	 hH+rNL3X6Qk8UUacsMAnfCYuc+ya4zbLXv6tB9bFUB1qRSyid32BzqsU2n3xzbS+JIPo+
	 /asPCRuzdamg1Sl281bABlvudvJqn/2KF6zVE6YfO9w7oJMZDfAqCt9JUKkX12KlITXxS
	 z7ez+ga047FqLxS2Wnc/ModHhRCjHUBo4srubY2m+A2om6cphK9WL7JGcKNNmPc45bg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=is8HGHiU;
	arc=none smtp.remote-ip=209.85.221.50
Received: from mail-wr1-f50.google.com (mail-wr1-f50.google.com [209.85.221.50])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EBEFA606A321
	for <sashiko-reviews@lists.linux.dev>; Fri, 27 Nov 2026 02:08:18 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org EBEFA606A321
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=is8HGHiU
Received: by mail-wr1-f50.google.com with SMTP id ffacd0b85a97d-492fcbfaa88so5121692f8f.3
        for <sashiko-reviews@lists.linux.dev>; Thu, 26 Nov 2026 18:08:18 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1795745297; x=1796350097; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=w4DH6C+tDE1JFdLKzQpNer3JwD5m/dqh3XkJoVpVm9Y=;
        b=is8HGHiUMw5Gvly3rBTGT2Ayu6S5lLx7k0H6ZXhRmik++RnhfJPDOjllF0l34OoKpG
         XJNN/1Dwmhxq2TIT+1E8y5w0+SrhdokLoWf05dZBTUnVRYife0Dl5p1zvqXxxWa8WAzz
         qx668uv/FTX4mq4SMrt3BQlKdlgznuDd3PjbROYUK27CjcbUMilWPXHIPMZXLydurIxD
         I/D1RJW0mqq+rKDg/p4m2HEGTh2D7VT+HW8QM37y25AL9qkptalPyRumC7ZOHcMnyust
         Luwc+sOWW3prBIHUWxgKvZUB8BbUVvxDSHR0FG+ZtXTmtRvKrZFuwBG9tj3JGsh5oxNt
         Da+g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795745297; x=1796350097;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=w4DH6C+tDE1JFdLKzQpNer3JwD5m/dqh3XkJoVpVm9Y=;
        b=oN7vMDEx9Kw4QCaUjiLqN8TUDDuTalpsIWYQvCxuNs0Hce94wFQnaEr6KYJPohHxcv
         OyD47db/nQNsimU/q4N2RbM/I8Sei9Uf+j3T8a/t87dlF65B7bsCFJqzAm8ty6tzUsaL
         ZSVpR09AW5HyiCZ/F4+JPfLsW2fXXHLIaC3sTaMiOdQKCn/GkaHLbTri0hMiHdg/P3cQ
         j7s7S6HrpXqvSnEDOp8/9taet8zv1ShtE+7KUrSvpm8fKRA7dttLZSauuP0LBWFU2Lok
         QlWzH91KabReAYi4YNsy0Pl9tjWVdZ1rwksixvdo/uPgIiJAW6157uUU2GqtYyof526j
         Jt9Q==
X-Forwarded-Encrypted: i=1; AL+hErFmftA5FdcxtRwB2pfKap+BeHiC+u0wkIq3MOBRE/Rf0UIDf1cSPrAZL6x0ektEZ71hkV5rMtCHqOvCSoYQn44=@lists.linux.dev
X-Gm-Message-State: APuU4Z8kyin1+QCC3Us+YJ+mrA9/McKbS/gTfKYdxg+YxnhhFZDXrp53
	tZVTJ81A4yhHUndoGPHD8hxzKEdh5iVTu+cp8R+zdsQ+SDzipvJ93BZe
X-Gm-Gg: AZFdTZfKga3y1454bdqV7bv9RrcAkrBeQ4OsTvu7h2zfROIajQyFRGP52GWHg47U9hC
	zRe47dZYs2hoFwDwh8qFZsEP41JRs0Pg82t403T+ZMmHiytd7Db9E4kjANtdqBdZKIDeVAIamX8
	3Gv0Ct/G07bwnHw60jTRs39SqINt1Sn+7BOkAPjM8YRNQtbKZX3XfGmtOSl71aWI2Zox77asKrj
	imRopxm7y1R2ZHeTKCGKyejMFIt1FfrFAdCVJW4VLUUSYL3NBjZIx8MevSV1AI+/qUMBf6ENTpK
	hsxAXsQny1KOCwL+ymNPxZEU0cSN1xw9HWyz6gVwncTUfd13GRETBaLVGmBn7aa1tpouJuH2v6f
	HPcNX6vYb7XRKti0Ox1eXOUx96frDJsNkzDiluTe7bGwGS4ayRbkNcKKkHsuvj3N8cUOgQcg5Fr
	nEEfC9Pxys7fQoRF4tB8vSjbOj8cvvh4r2MCbjI/DnXMO5QjBE3qqm8egmjzXvfKgCklNa3VBuV
	sdcQm4kdbWfzfoqBwuyXn/oBkKU1bqIw9JpILpn6zYcOscsKkR+pM/KUKknhAa15VIVFQtejK18
	8k7SZuxF1mj1ku61BarizGU/+B8vTdxI1pgdFaOWhslnGxHz72x+wdmBEEtZaptPekzQwqf06Xq
	xCMJtgidLpsFEbWogNA4mnLdfZZFZfKQBC6x1favRMd1eUw==
X-Received: by 2002:a05:6000:1863:b0:48d:b940:af7a with SMTP id ffacd0b85a97d-4abb665167bmr54566966f8f.55.1795745297215;
        Thu, 26 Nov 2026 18:08:17 -0800 (PST)
Received: from romain-ThinkPad-P14s-Gen-5-AMD.tail433d9c.ts.net ([2001:861:39c2:e340:1432:1241:93b7:7b4b])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-4ab6baa3882sm43390844f8f.49.2026.11.26.18.08.16
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 26 Nov 2026 18:08:16 -0800 (PST)
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
Subject: [PATCH 0/4] drm/panel: st7701: add the Miyoo A30 panel
Date: Fri, 27 Nov 2026 03:08:11 +0100
Message-ID: <20261127020815.1621790-1-romain.tisserand@gmail.com>
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

The Miyoo A30 is an Allwinner A33 handheld with a 480x640 2-lane
MIPI-DSI panel driven by a Sitronix ST7701S.

Its stock init table doesn't fit the encoding st7701_init_sequence()
derives from the panel descriptor, and the panel doesn't work in the
burst mode the driver always uses. Patch 3 adds two optional descriptor
fields for that, a complete init sequence and the DSI mode flags; the
existing panels set neither and are unchanged. Patch 4 adds the panel,
patch 2 its compatible.

Patch 1 does for sitronix,st7701 what commit 2f50e0a0f9d3
("dt-bindings: display: panel: Make DSI panels port optional") did for
the other DSI panel bindings: the port becomes optional, and stays
required for the panel with an RGB input set up over SPI. The Allwinner
sun6i DSI host links its panel as a child node and has no output port.

The board devicetree will be sent to the sunxi tree separately.

Testing: each patch built with W=1 for arm (multi_v7_defconfig,
DRM_PANEL_SITRONIX_ST7701=y and =m) and arm64 (defconfig, =m), no
warnings; dt_binding_check clean for sitronix,st7701.yaml. Tested on a
Miyoo A30 on 6.18.54 and again on 7.3.1 with the same driver change
(A33 sun6i DSI): the panel comes up with a stable picture and correct
colours. The other
panels of the driver were not tested on hardware.

checkpatch --strict reports "Alignment should match open parenthesis"
for the continuation lines of the init table: they follow the style of
the existing tables in the driver (46 such checks in the current file).

Tool disclosure: this series was prepared with Claude Opus 5.5
(Anthropic) as a coding assistant, in an interactive session: it
extracted the stock init table, wrote the code, the split and the
messages. I reviewed and understand it, and tested it as described.

Romain TISSERAND (4):
  dt-bindings: display: panel: sitronix,st7701: make the port optional
    for DSI
  dt-bindings: display: panel: sitronix,st7701: add the Miyoo A30 panel
  drm/panel: st7701: let a panel provide its own init sequence and DSI
    flags
  drm/panel: st7701: add the Miyoo A30 panel

 .../display/panel/sitronix,st7701.yaml        |  13 +-
 drivers/gpu/drm/panel/panel-sitronix-st7701.c | 115 +++++++++++++++++-
 2 files changed, 122 insertions(+), 6 deletions(-)


base-commit: 53063c88338aa6125d43a7ce3ff1e0cf5066bad1
-- 
2.43.0

