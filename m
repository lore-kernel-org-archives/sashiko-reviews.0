Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795778122;
	b=bUHuDf3/w6qKOCTtX6cApVP31T4qkA6NxoVtbW21IeM0dgw9UGvEmd/D4GbWMX6zhfOI
	 OGpx5TBD5Z+9knfL+KTnVaV+VA7i9/Z+TFOiD3jE9F4KsyE9a1dskssGs6Is66+WA2baX
	 ZkdtFZ4MGwPJzHAj5Z/sNAKrvQl0KDvi+7bPYumHfRyb2z6FihNcatnPjgDA8Labqn2Ux
	 s6rGFsgs3hDLeSRQWUwKke4q/3hm7OpYV59Z2QlqILHcRVbbZ47vGL51cA9ExyNG8GDfe
	 8AnKpzwOYaU6Nkp7KAcVBqEUrknVyB8jIT0Z/GvsiwI6nAPevndZ4FDfGfetuNXIBLQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795778122;
	h=Received:DKIM-Signature:MIME-Version:Content-Type:
	 Content-Transfer-Encoding:Subject:From:To:Cc:In-Reply-To:References:
	 Date:Message-Id:X-Mailer:X-Developer-Signature:X-Developer-Key;
	bh=LCE10Qsj5G2u+2q00eF52SZK4gOAH00LXc8wenJC0Bc=;
	b=xfL0YjAu1bq0yBiUNCSu83pP03SzsB1sh5iy+eBxFbBD1/KDJSz+S6h8gnWTftwYLmLF
	 jyy3y308PIDq9xr+4scgJclpJ3aPNafaFbkR0MJFKBh7dOWTNT6EDyMD3ySVoD65qPcR0
	 /b6r0xDheYFIQc5S9MWrZEO9sGfnQlP0+ZUQlusrU96eTqzfB6/SGqxlseJQmPiPOq6Z8
	 rJrLsx7/RgNMYkDZpz8LllX9+A2+JLUskqzlLEhyUSDFoxWeF+EocnOhDKAgy/tGhVSU3
	 P6bo+WwMnXrzB0uHX59BJ61FpWgH8axJv+sXQcURcm+jgSLq5gLUvM160RgDifDvGHQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=oehkSI5M;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 909DC606A31E;
	Fri, 27 Nov 2026 11:15:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=oehkSI5M
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 9011E1F00898;
	Fri, 27 Nov 2026 11:15:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1795778121;
	bh=LCE10Qsj5G2u+2q00eF52SZK4gOAH00LXc8wenJC0Bc=;
	h=Subject:From:To:Cc:In-Reply-To:References:Date;
	b=oehkSI5MMTda/hSLPbSSrlr12IvPmFxje0sdJxTfimCdBu1cFwIg8+ahAEnKvN4gM
	 jdSsq/yc9aUqcPH8VNLZdIauf0gdu2sTCzLgEBsQk6/EXz8AOt2/lC8M6q7QDhwpxJ
	 gnitfxp6tFuDpCt9dW01uzwPTwoHNmbFIF/7zwAIZZSCCtfCB8HfgE2YpAK/Ee/G8l
	 9oLPzDtk8vp9zd49HZBHfYDRDMsVqQ4y7FftrbekbruRzlXpta4Iucf0xDqN6m9+f2
	 ayZ0ofXg/onKdVZc9jPGqQCdQom2XSsJM0mEBiRnuqmk72Y0mpuS9Twf3dnZBew/EL
	 AqidWZZQ9V9qA==
X-Mailing-List: sashiko-reviews@lists.linux.dev
List-Id: <sashiko-reviews.lists.linux.dev>
List-Post: <mailto:sashiko-reviews@lists.linux.dev>
List-Help: <mailto:sashiko-reviews+help@lists.linux.dev>
List-Subscribe: <mailto:sashiko-reviews+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:sashiko-reviews+unsubscribe@lists.linux.dev>
List-Owner: <mailto:sashiko-reviews+owner@lists.linux.dev>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Subject: Re: [PATCH v3 10/11] phy: qcom: edp: Add Nord-specific QSERDES COM
 register header
From: Manivannan Sadhasivam <mani@kernel.org>
To: sashiko-reviews@lists.linux.dev
Cc: Nabige Aala <nabige.aala@oss.qualcomm.com>, 
 linux-phy@lists.infradead.org, devicetree@vger.kernel.org, 
 dri-devel@lists.freedesktop.org, robh@kernel.org, conor+dt@kernel.org, 
 vkoul@kernel.org, neil.armstrong@linaro.org, olteanv@gmail.com
In-Reply-To: <sashiko-outbox-217079@kernel.org>
References: <20261116-nord-drv-dt-v3-0-e3d3bf0e2c49@oss.qualcomm.com>
 <20261116-nord-drv-dt-v3-10-e3d3bf0e2c49@oss.qualcomm.com>
 <sashiko-outbox-217079@kernel.org>
Date: Fri, 27 Nov 2026 16:45:14 +0530
Message-Id: <179577811449.3421.13458087961156967909.b4-reply@b4>
X-Mailer: b4 0.16.0
X-Developer-Signature: v=1; a=openpgp-sha256; l=4241; i=mani@kernel.org;
 h=from:subject:message-id; bh=fflklKk2bug0sMYkL2mzR4LbTYtS017AwbxNlnJWiUs=;
 b=owEBbQGS/pANAwAKAVWfEeb+kc71AcsmYgBrCWZFzS67zCIi1q6JW/VzOTKwQkvR3Bmo+U/kO
 RN6zO22aKyJATMEAAEKAB0WIQRnpUMqgUjL2KRYJ5dVnxHm/pHO9QUCawlmRQAKCRBVnxHm/pHO
 9f45CACDAHhsHoUnAO/walLa469Maue2A3w0bO1+WfFkco9ZhUDmdM4BUI6pdA3rocMil5rLkuu
 uuXNalKz7v9M44MpJabC5bs6SV4uJSatOTww4+ODb9W/xSrqvrDDLq2qx/gDLSbpamyqR7+9caa
 y1Vph1lS15XcbjDcQG3ehvfBPa3rRbr1EhlbIvojoRj+TNRx437SVFD2C92hrMCzeyXIeQqs3+T
 +UaLDBKjj4UuKOKCC3RkyRjopfEbijON45U8R50ZtdsZGx9BTo5rYfIglEb50XO6/j/6l6ur86I
 9nFJnIv2B1/sZwX8DEq6wLyJCVeW3lGwnSVWr36SmUK5gwRU
X-Developer-Key: i=mani@kernel.org; a=openpgp;
 fpr=C668AEC3C3188E4C611465E7488550E901166008

On 2026-11-16 13:30 +0000, sashiko-bot@kernel.org wrote:
> Thank you for your contribution! Sashiko AI review found 1 potential
> issue to consider:
> - [Low] phy: qcom: edp: duplicate QSERDES v6 COM register definitions in
>   v8-nord header
> --
> 
> commit 6ae0c395ca0665ea9d8f96120d2aff620150f574
> Author: Ritesh Kumar <ritesh.kumar@oss.qualcomm.com>
> 
> phy: qcom: edp: Add Nord-specific QSERDES COM register header
> 
> This commit adds a header defining the QSERDES COM register offsets for
> the Nord DisplayPort QMP PHY.
> 
> > diff --git a/drivers/phy/qualcomm/phy-qcom-qmp-qserdes-dp-com-v8-nord.h b/drivers/phy/qualcomm/phy-qcom-qmp-qserdes-dp-com-v8-nord.h
> > new file mode 100644
> > index 0000000000000..f38b48dae39e3
> > --- /dev/null
> > +++ b/drivers/phy/qualcomm/phy-qcom-qmp-qserdes-dp-com-v8-nord.h
> > @@ -0,0 +1,51 @@
> > +/* SPDX-License-Identifier: GPL-2.0 */
> > +/*
> > + * Copyright (c) 2026 Qualcomm Innovation Center, Inc. All rights reserved.
> > + */
> > +
> > +#ifndef QCOM_PHY_QMP_QSERDES_DP_COM_V8_NORD_H_
> > +#define QCOM_PHY_QMP_QSERDES_DP_COM_V8_NORD_H_
> > +
> > +/* Nord DP QMP PHY - QSERDES COM registers (relocated from v8 base offsets) */
> > +#define NORD_DP_QSERDES_COM_HSCLK_SEL_1			0x03c
> > +#define NORD_DP_QSERDES_COM_BIN_VCOCAL_CMP_CODE1_MODE0	0x058
> > +#define NORD_DP_QSERDES_COM_BIN_VCOCAL_CMP_CODE2_MODE0	0x05c
> > +#define NORD_DP_QSERDES_COM_SSC_STEP_SIZE1_MODE0	0x060
> > +#define NORD_DP_QSERDES_COM_SSC_STEP_SIZE2_MODE0	0x064
> > +#define NORD_DP_QSERDES_COM_CP_CTRL_MODE0		0x070
> > +#define NORD_DP_QSERDES_COM_PLL_RCTRL_MODE0		0x074
> > +#define NORD_DP_QSERDES_COM_PLL_CCTRL_MODE0		0x078
> > +#define NORD_DP_QSERDES_COM_CORECLK_DIV_MODE0		0x07c
> > +#define NORD_DP_QSERDES_COM_LOCK_CMP1_MODE0		0x080
> > +#define NORD_DP_QSERDES_COM_LOCK_CMP2_MODE0		0x084
> > +#define NORD_DP_QSERDES_COM_DEC_START_MODE0		0x088
> > +#define NORD_DP_QSERDES_COM_DIV_FRAC_START1_MODE0	0x090
> > +#define NORD_DP_QSERDES_COM_DIV_FRAC_START2_MODE0	0x094
> > +#define NORD_DP_QSERDES_COM_DIV_FRAC_START3_MODE0	0x098
> > +#define NORD_DP_QSERDES_COM_INTEGLOOP_GAIN0_MODE0	0x0a0
> > +#define NORD_DP_QSERDES_COM_INTEGLOOP_GAIN1_MODE0	0x0a4
> > +#define NORD_DP_QSERDES_COM_VCO_TUNE1_MODE0		0x0a8
> > +#define NORD_DP_QSERDES_COM_VCO_TUNE2_MODE0		0x0ac
> > +#define NORD_DP_QSERDES_COM_BG_TIMER			0x0bc
> > +#define NORD_DP_QSERDES_COM_SSC_EN_CENTER		0x0c0
> > +#define NORD_DP_QSERDES_COM_SSC_ADJ_PER1		0x0c4
> > +#define NORD_DP_QSERDES_COM_SSC_PER1			0x0cc
> > +#define NORD_DP_QSERDES_COM_SSC_PER2			0x0d0
> > +#define NORD_DP_QSERDES_COM_BIAS_EN_CLKBUFLR_EN	0x0dc
> > +#define NORD_DP_QSERDES_COM_CLK_ENABLE1			0x0e0
> > +#define NORD_DP_QSERDES_COM_SYS_CLK_CTRL		0x0e4
> > +#define NORD_DP_QSERDES_COM_SYSCLK_BUF_ENABLE		0x0e8
> > +#define NORD_DP_QSERDES_COM_PLL_IVCO			0x0f4
> > +#define NORD_DP_QSERDES_COM_SYSCLK_EN_SEL		0x110
> > +#define NORD_DP_QSERDES_COM_RESETSM_CNTRL		0x118
> > +#define NORD_DP_QSERDES_COM_LOCK_CMP_EN			0x120
> > +#define NORD_DP_QSERDES_COM_VCO_TUNE_CTRL		0x13c
> > +#define NORD_DP_QSERDES_COM_VCO_TUNE_MAP		0x140
> > +#define NORD_DP_QSERDES_COM_CLK_SELECT			0x164
> > +#define NORD_DP_QSERDES_COM_CORE_CLK_EN			0x170
> > +#define NORD_DP_QSERDES_COM_CMN_CONFIG_1		0x174
> > +#define NORD_DP_QSERDES_COM_SVS_MODE_CLK_SEL		0x17c
> > +#define NORD_DP_QSERDES_COM_CMN_STATUS			0x1d0
> > +#define NORD_DP_QSERDES_COM_C_READY_STATUS		0x1f8
> 
> [Severity: Low]
> Can Nord reuse the existing QSERDES_V6_COM_* definitions from
> drivers/phy/qualcomm/phy-qcom-qmp-qserdes-com-v6.h instead of introducing
> this SoC-specific header?
> 
> All 40 NORD_DP_QSERDES_COM_* register offsets defined here are identical to
> the existing QSERDES_V6_COM_* definitions.  Moreover,
> drivers/phy/qualcomm/phy-qcom-edp.c already includes
> phy-qcom-qmp-qserdes-com-v6.h and provides v6 COM helpers (such as
> qcom_edp_phy_power_on_v6(), qcom_edp_phy_com_resetsm_cntrl_v6(), and
> qcom_edp_com_bias_en_clkbuflr_v6()), and nord_usb3dpphy_cfg in
> drivers/phy/qualcomm/phy-qcom-qmp-combo.c already uses qmp_v6_dp_serdes_tbl
> with the QSERDES_V6_COM_* definitions.
> 

Fair question.

- Mani


