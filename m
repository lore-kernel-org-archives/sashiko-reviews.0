Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.128.50
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794240431;
	b=l3qKTFkHIKxLa1t6Xlw3szm+sSN2ywnMDxg39D5JmxtBIENCocW/oSiJZpiLR6rh/RGS
	 MDuyCLF7BHAhB7TgyL5Q1alh9lWRqoYCMKcJdDo8vGKQPg7DOhw6G/zjB4kG0jy8GPDnu
	 zFxGrlVc5NJcTxEh5n36uglsaKaGmSTazQV7zn/NU+AolfrqBFgke2LTXtuHOuWoWMydY
	 pzzHbMC7UB/Ebs+yakgjpfMwXqjucf/gGYGKInm5yXcUdCFSSNki0GywLFAPYawQ4vi6z
	 kwnCIlxcbTe5vGIOqReX7aWAnC4NxpPABtqXi3k6zjVtI8Md7Dulh/oRUmTaEhRkVrA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794240431;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:MIME-Version:
	 Content-Transfer-Encoding;
	bh=PAVOiEo7yvU59/BVYzddko8QH5/O/35Z26C3YJ1MLT0=;
	b=ZYsxOOFSvZ9vVvmIRo1Bq3CgHRk8C6JhKr5Z13elzeiy3E1M0rMsXRei4AKIknB7RHMx
	 uhq0fBHcNpsmra431pTMF5qGnQnfdUTbEkOTrydiE4Yj+NGSNKhQeaSyduprLvSYu795d
	 D3ZCKpLIUWX6+JjuEl02HoNRV0kmqyntrOLMbiyXrQmTr5QB3sZYcCIxKKX943QNbTaly
	 PHhjDcq8NCUFebqQ6VrlwA564e/zRhcfpD9221/qN4DJThfhynmKaKzQImuYM/kH/52tm
	 oalec1PbRk25g1+XWblpl3Uk7Pmno/QCJc6nczPToch7aCMYPn3KzqjTlf6ptpDu4EA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=LCaK1eIK;
	arc=none smtp.remote-ip=209.85.128.50
Received: from mail-wm1-f50.google.com (mail-wm1-f50.google.com [209.85.128.50])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B3E11606A331
	for <sashiko-reviews@lists.linux.dev>; Mon,  9 Nov 2026 16:07:10 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org B3E11606A331
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=LCaK1eIK
Received: by mail-wm1-f50.google.com with SMTP id 5b1f17b1804b1-4afe2d546f9so15425235e9.3
        for <sashiko-reviews@lists.linux.dev>; Mon, 09 Nov 2026 08:07:10 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794240429; x=1794845229; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=PAVOiEo7yvU59/BVYzddko8QH5/O/35Z26C3YJ1MLT0=;
        b=LCaK1eIKUBEtOvs7dogUw4ugR8ozybfJ1vJFcbps2W19bcECXukyUD9XQ+8EaUWuM6
         /nNAcs14bZA+oeQox4hWLmXVSxWQdAYM+y+W5ItHm4Lw0W4xDFXeFWzS9suCdOYHH6q2
         SlDe+3f430KAN6pysxRKO6TorK4CmArBl7ANuouWVuYtWcPHim4OHScTszgo+m0bmKo6
         E5lR39DCQ2p/dISyvmW0tMQqasPQZAIiYH8rZ7eLC5l0EGU2XcUvB+o89WYrGQaGEH7D
         4J+RDLo90q5c+l/+EvgadqW4f1X8TYyN099AQLXdIWWbicai6QHaFeL3DgW71E1ojLNQ
         oLTg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794240429; x=1794845229;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=PAVOiEo7yvU59/BVYzddko8QH5/O/35Z26C3YJ1MLT0=;
        b=opvHOOgAGJHZ5wsGb+TROg5BcjXfPCO9aTIeLlHXX3GnR8XWIs4u8Sx195alMuXMXh
         7JeYo7KyRxu21hI4XXxLXD/5iEIEQNzA5ptuMB7ZkO3nvKEauX9VatZe/S0nt8gvtLHm
         fOpRb9M8rtjBXbhaUKcxtVHJOf3OzZB+5M3y/eHc2RuC8bY/Noat8G1M8yojuo628sJw
         JQibSz6iJOyhQcaut7ExTL2wIhn3Uqv3UAqrAdZo0fMIzhkFDeuHoJQ+IRenRDQ55bkS
         e8PPXyaya+AB2+Vfy2fDoBXk/s6CVkaWUd89iVz3J8QJ6xuRsoippWCF4h1+PR65LA4P
         s5Pw==
X-Forwarded-Encrypted: i=1; AL+hErGm1sVedaqXOSXSPtn6m1Fp2FT98md2wmtndV5+TGDN2sFRrMYyh69eMOEvPbOc6meB2mkrEUDMYI0jD7Ny2Jc=@lists.linux.dev
X-Gm-Message-State: APuU4Z9tLOiviVhL7A0RQkh1PBIAmR35dg92dCPPbJ4aDIQHItPZpVrT
	LotZDHz2eaCqqte1YB/bfsIATvApgsA1qQdw6f4sqUPnDLg0BejJkO7w
X-Gm-Gg: AYBFou0V/flaxY/bc7JeceoRz8CjctgBeW5PXDxOmlCkz6A7dIQCyPiVcam76s6BiFr
	0qbwjE18sFglNEHU9tJMriOGmtVQAxhjiD9Pqv3ZfnvVhqmsRNrPwXofFopL/w94jTA+IX/J0dk
	k+QoTfBfcprQFLjQg88Zm08gJ2hL/aRx8RXZ5I/K9GKFNFb24pxmsQI7bKXhXJVq8LxlPkfEGET
	YnttAH/Q0XcgfSdbDSqBw+a/QsB91knnW8JyHxRAj/m+nWmmfL5IBlGwOmjaKFKUmvkEmZlV1Pw
	+8UQxPwXdpt5OpagYEAVnM2w7qwyJ3HdKlL9M13GVCmehwi9lOCLcsxs4sqwbK0h8MqBO5fTuAR
	yuNY4fBqCZPQiC1wE8b3ygrQtYt1AhofeEwJgPqeaG6NwTjcVkkzff2RleNbYihefGx9uOkP70D
	JkAsIyHSxVgyb52HQK5USClFmMzCksIkxFM7taTA8pthOWa0uzQGqIP51EfV7G2aW38tVYEcjBi
	qdZuyt9N8jPG0yjC5zp3m/dVyA92hpzjbGjz282AhONA6jP+Sb2au4yfkkrnARIrI3ut3BkMi05
	KJ6Bw8yqqCK1zbeDqCH32yBX7NnoEzT8xxCzJkFRbcCn5I50bznWKeukCcsFOad95eSdvONXD2g
	Hs5vaJnucOyZzA4AQP7fbuz4VPPpHK4k56iYROWjJDw==
X-Received: by 2002:a05:600c:4f86:b0:4a1:fa21:fd90 with SMTP id 5b1f17b1804b1-4b960d9b17dmr83943565e9.9.1794240428927;
        Mon, 09 Nov 2026 08:07:08 -0800 (PST)
Received: from romain-ThinkPad-P14s-Gen-5-AMD.tail433d9c.ts.net ([2001:863:742:6109:ac9d:152:38c3:6463])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4b90f119b96sm159174245e9.15.2026.11.09.08.07.07
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 09 Nov 2026 08:07:08 -0800 (PST)
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
Subject: [PATCH v2 0/3] drm/panel: ilitek-ili9488: add the PocketGo S30 panel
Date: Mon,  9 Nov 2026 17:07:03 +0100
Message-ID: <20261109160706.2272332-1-romain.tisserand@gmail.com>
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

The Miyoo PocketGo S30 is an Allwinner A33 handheld with a 320x480
1-lane MIPI-DSI panel built around an Ilitek ILI9488. The panel uses the
existing ILI9488 DSI driver with its own init sequence (from the stock
kernel), timings and DSI mode; the sequence is close to the
E35GH-I-MW800CB one.

Patch 1 makes the binding's port optional: the Allwinner sun6i DSI host
links its panel as a child node and has no output port, and the driver
does not use one. Patch 2 adds the compatible, patch 3 the panel. The
board devicetree will be sent to the sunxi tree separately.

Testing: each patch built with W=1 for arm (multi_v7_defconfig,
DRM_PANEL_ILITEK_ILI9488=y and =m) and arm64 (defconfig, =m), no
warnings; dt_binding_check clean for ilitek,ili9488.yaml. Tested on a
PocketGo S30 on 7.3.1 with v1 (A33 sun6i DSI, one lane): the panel
probes and attaches to the DSI host, and the picture shows the right
colors, size and position. v2 only renames the compatible and edits a
commit message.

Changes in v2:
- Drop the "pocketgo" vendor prefix patch: PocketGo is a product line,
  not a company (Krzysztof). The S30 is made by Bittboy/Miyoo, so use
  the existing "miyoo" prefix: "miyoo,pocketgo-s30-panel".
- 3/3: drop the claim that COLMOD sets the panel to 6 bits per color
  over DSI, only say the stock value is kept (Igor).
- Add Igor's Reviewed-by. I kept it on 2/3 and 3/3 although their
  compatible changed from "pocketgo,s30-panel" to
  "miyoo,pocketgo-s30-panel"; nothing else changed in them.
- Link to v1: https://lore.kernel.org/all/20261103110524.2812831-1-romain.tisserand@gmail.com/

Tool disclosure: this series was prepared with Claude Opus 5.5
(Anthropic) as a coding assistant, in an interactive session: it
extracted the stock init table and timings, wrote the code, the
bindings and the messages. I reviewed and understand it, and tested it
as described.

Romain TISSERAND (3):
  dt-bindings: display: panel: ilitek,ili9488: make the port optional
  dt-bindings: display: panel: ilitek,ili9488: add the PocketGo S30
    panel
  drm/panel: ilitek-ili9488: add the PocketGo S30 panel

 .../display/panel/ilitek,ili9488.yaml         |  2 +-
 drivers/gpu/drm/panel/panel-ilitek-ili9488.c  | 55 +++++++++++++++++++
 2 files changed, 56 insertions(+), 1 deletion(-)


base-commit: a1e63ab695ad76850ab9787b9eb6aab695dc2965
-- 
2.43.0

