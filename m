Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.128.43
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792941872;
	b=N+lolBtTFFDbASMS2kpOFPtwHvlP6VuQZnnemJZGZ6Vo2yN5K4dhWLwGQtlbArGmcBa8
	 lxfDD7FPbu2XBzo7iRoiwpdc9y0qgEmER63vZWT3CVJ1qFD640dpZ+vd7e1X8Ba7qnn0I
	 dDwGrWqjyeRpKAKkN1RrB+gjl64GSG2MvXg7szOdKTmMZRW1WqgBrU+rKn9yaQDm6zJqT
	 7dDkKUr3Z2EJEAogOZS/ryAUQ9C8ioCf/uS7TPZqDyypJdXp/Qj2gzWU9mKuKvxgy9fKp
	 JqJhWPi/cSqjYEoEqqxuLC85CYvN5mGUUcSZyQsRdPgRn44hWJ5TK5PpOl79gFbnC1A==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792941872;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:Received:From:To:Cc:Subject:
	 Date:Message-ID:In-Reply-To:References:Content-Type:
	 Content-Transfer-Encoding:MIME-Version;
	bh=gr7m8Jgx5qFfXx97jCHm/dv2wdINd/6dtVxf1769JNg=;
	b=1d1heh0Gg5px7DdOIc+C4FfaSL2FHkiK6z6RsOE627qRD+fFU+fsDl+W0ji7KkNtjMfe
	 rKbLywuDhhl1EV8aOdU4DGFmgcDiAlS0BEc9r4n0+bfPcXSRFn3RiHG73U6w6l8RMqLpf
	 Ye8160zqbEbnN1bvMZw2WOCyRkK93Vg9ZNG+VCyXkP5pNoSTN/coFCDL0znu1XleqBWCY
	 ICY6xly9p/O9A0sxyHWZc7lrRhr4PKEgLX8ckKmZo085cOrVEFDTQSo3yeFy/scvJoHsi
	 D0ZOVxdOM3AlqsSxH/ao7FZ0fKZGVXKvAW+M1WnCoVVkzKyrC+2v9NOayxXo2mb/eug==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b=AE+cEXEk;
	arc=none smtp.remote-ip=209.85.128.43
Received: from mail-wm1-f43.google.com (mail-wm1-f43.google.com [209.85.128.43])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3499D606A31B
	for <sashiko-reviews@lists.linux.dev>; Sun, 25 Oct 2026 15:24:32 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 3499D606A31B
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b=AE+cEXEk
Received: by mail-wm1-f43.google.com with SMTP id 5b1f17b1804b1-4a2000d5fb1so13831435e9.1
        for <sashiko-reviews@lists.linux.dev>; Sun, 25 Oct 2026 08:24:32 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1792941870; x=1793546670; darn=lists.linux.dev;
        h=mime-version:content-transfer-encoding:content-type:references
         :in-reply-to:message-id:date:subject:cc:to:from:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=gr7m8Jgx5qFfXx97jCHm/dv2wdINd/6dtVxf1769JNg=;
        b=AE+cEXEkDTVQ5Xidz/t2mgO0PRxmvYquGYR6supT6REukqF189LEWaYRwPAeXyrZYQ
         WviPWJ434woG1KqejachISTCVSE+iKymecFompgrmD3Wx4ASBYz/ZIQUI/iHUi/ZnUFT
         Z/zX3lqFuhWxRiHG9cfmj+GCCUvsCUZs05GFnv6LL+/pRfExv5Fo3LYl5irKhj5J+TPI
         nxfP6Q9YWEOWHRfoRF8CNdfnrparZxld7I1N9uuDVGhfikBcXrmYnH5p3rOR1AMqyXFJ
         k5mPFve/ySMD9C3CZMW4vilzpaQTsnRdXDTYDLnnle02Yj8P5kPEDcBUj+U2/ADqciFN
         O1Lg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792941870; x=1793546670;
        h=mime-version:content-transfer-encoding:content-type:references
         :in-reply-to:message-id:date:subject:cc:to:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=gr7m8Jgx5qFfXx97jCHm/dv2wdINd/6dtVxf1769JNg=;
        b=Vu0xtvQAQFfjBXR3RD5yOM5Uj/lT/t35TsMVRrp6GwVgW95ggA9tQzMGNAjq1kpeEO
         EI8nciCsoEDVsKprCGVQhge9v5g87GiRrFmtKGk7oa+jDJDATX9UmiPVq6xxGiL1O+XZ
         89MfEWZdat2vfnwDKDVG0XCTAU8D3mBA1hsW5tYgeGkfJFupLXlHApST2IhfmVPcWhGa
         ESRD+GeJ5Y1wVU+bC+1tBRpKjmIvSU5hoXW43yGC8zJcEtpmV3gg40nA0IU+l0HjZdt7
         drK+Og/xkaRkL8aYx4xck4MwTjPJI9Bnaj0jVQLiOaWjjEwkbg/5T7Lx8NIi0f19vy+8
         rLJg==
X-Gm-Message-State: AFq9FYL5p+yoSHNGt9RRrUsPuRjflJbfIagpf9XyC1IwOFIAWDWb++12
	9olx/rwlDUiBoy18MdLdGbTltOzJj7VSA7VvuTQ6SAyNsqsC+WyT4pmSR7a1vXqK
X-Gm-Gg: AYBFou2NHJCiG3ULSSLx1kM1YEC3t52SWkqaAUjT8sZnSzF3LN/R7fvhYYPn6tpEJQJ
	HPACyuuzkXjG8KvEdTKaty2DYhzx8nzkolzlsaAILx6Qa1/meIgQ+fSN/FHzIgVJQDhZmQNdG4S
	gFUKnQiswbkMoX8s32bV6vaoQeMBWEb05Oe8RWTu/odeeCRWnYPQuW+qDGMzsjF8t7o1xQqueOA
	cjq23FeGhVn8uZ+q2xpYGSj1xv+uW5PYxr2WAWe+C9lR0HhwVMAa8Pjnse8ujv/vGYAsKHSE+Z0
	OWhjs6/G9zs1aujw15nW6wbh0Y6kEo/beqrG/pNnJKJYA4pQVsutyRPMCCh0g3iiLbf6KSm1DvO
	G4kJovl6xwWw52+8ktfcDck6468rXxRgY1Ol1pUZSNlhpNJe9VpXfemKBJFv/FQXNJmwf0nOkjd
	uqVA8nkYgoVKESe/EqgffjP6qiFtPGfooJSjut/mmgv/+eus9YOo2QOpPj+6FQarEONllRtnKEt
	h50olufT92wAv2PJcj2cuQubrc+G5mZaNUn4ufhOWAN0yob3Vo2AUxakIsITLxmyPRRklCH7seB
	DCNMhS7wB5I4UWfVh5i70HdNOHdWZR9dLJ4XeDzs8zU=
X-Received: by 2002:a05:600c:c0c9:b0:4a5:87b3:ddc1 with SMTP id 5b1f17b1804b1-4a587b3e000mr20792825e9.13.1792941870382;
        Sun, 25 Oct 2026 08:24:30 -0700 (PDT)
Received: from [127.0.1.1] ([2001:861:39c2:e340:4c3:3a00:d533:9d50])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4a35a04ae28sm132982575e9.2.2026.10.25.08.24.29
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 25 Oct 2026 08:24:30 -0700 (PDT)
From: Romain TISSERAND <romain.tisserand@gmail.com>
To: sashiko-reviews@lists.linux.dev
Cc: Andrzej Hajda <andrzej.hajda@intel.com>,
 Neil Armstrong <neil.armstrong@linaro.org>, Robert Foss <rfoss@kernel.org>,
 Laurent Pinchart <Laurent.pinchart@ideasonboard.com>,
 Jonas Karlman <jonas@kwiboo.se>, Jernej Skrabec <jernej.skrabec@gmail.com>,
 Luca Ceresoli <luca.ceresoli@bootlin.com>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>,
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
 Heiko Stuebner <heiko@sntech.de>, Liu Ying <victor.liu@nxp.com>,
 dri-devel@lists.freedesktop.org, linux-rockchip@lists.infradead.org,
 linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH] drm/bridge: dw-mipi-dsi: use the lane rate for lbcc when
 lanes run faster
Date: Sun, 25 Oct 2026 16:24:29 +0100
Message-ID: <179294186960.4141843.10824416552753869438@gmail.com>
In-Reply-To: <sashiko-outbox-184251@kernel.org>
References: <20261025142639.3454322-1-romain.tisserand@gmail.com>
 <sashiko-outbox-184251@kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
X-Mailing-List: sashiko-reviews@lists.linux.dev
List-Id: <sashiko-reviews.lists.linux.dev>
List-Post: <mailto:sashiko-reviews@lists.linux.dev>
List-Help: <mailto:sashiko-reviews+help@lists.linux.dev>
List-Subscribe: <mailto:sashiko-reviews+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:sashiko-reviews+unsubscribe@lists.linux.dev>
List-Owner: <mailto:sashiko-reviews+owner@lists.linux.dev>
Precedence: list
MIME-Version: 1.0

On Sun, 25 Oct 2026 14:38:50 +0000, sashiko-bot@kernel.org wrote:
> For a 4-lane non-burst panel using MIPI_DSI_FMT_RGB666_PACKED (bpp = 18),
> (bpp / lanes) truncates from 4.5 to 4, giving a lane rate of 5 * mpclk Mbps.
> That is only 11.1% (1/9) above the 4.5 * mode->clock pixel bandwidth, rather
> than 25%.
[...]
> If the slack is only meant to ignore lane_mbps being rounded up to the next
> MHz, should the check compare dsi->lane_mbps against
> DIV_ROUND_UP_ULL(pixel_kbps, MSEC_PER_SEC) instead of adding pixel_kbps / 8?

Right, the 1/8 slack misses that case. v2 will use the lane rate when
lane_mbps is above the pixel bandwidth rounded up to the next MHz, which
keeps i.MX93, Meson and STM in non-burst mode on the pixel clock formula.

> Should pixel_kbps and the pixel-clock lbcc calculation divide by
> dw_mipi_dsi_get_lanes(dsi) instead of dsi->lanes to handle dual-DSI panels?

With dsi->lanes the patch doesn't change the timing of the dual-DSI Gru
Scarlet panel: its lane rate stays below the per-link pixel bandwidth, so
it keeps the current computation. Switching to the total lane count would
change that timing, and I can't test it, so I'll keep dsi->lanes in this
patch and leave the dual-DSI accounting to a separate one.

I'll send v2 in about a week.

Romain
