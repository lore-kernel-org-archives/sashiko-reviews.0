Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.168.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792739782;
	b=yvrtJZVTdCzSJJFcht/eQWMPc8SD7hHECehFenJufrjmuVO+N6hGlAan0lcHnHa2Zgjd
	 t9GYL60+LVkH5ANmeIzS2mWIGS0zbLozLcSEh9aa4AeZlBszlkOM1tdbAOitL+ZeLB28H
	 kv/HCVtpnQvrNiLtYmgMQBBqYGGRX/nYUaz4r5f0xw6y5tt1vWdf+ZW5gK2ghLK3CPyOQ
	 MIwxbtxJkJmL/EYYb8Zoa4W5VEIr4BPIiGiZiaXDzz5cn1/vxycgapmRmYYdcNIrHkU/B
	 8zHWmF+3Lvonqv24ScKEWMXOrHw/sBaQSsqtVL1fevTNr/wEYcmdquIJBDZeyggThHw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792739782;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Gm-Message-State:X-Gm-Gg:
	 X-Received:X-Received:Received:Date:From:To:Cc:Subject:Message-ID:
	 References:MIME-Version:Content-Type:Content-Disposition:
	 Content-Transfer-Encoding:In-Reply-To:X-Authority-Analysis:
	 X-Proofpoint-Spam-Info:X-Proofpoint-GUID:
	 X-Proofpoint-Spam-Details-Enc:X-Proofpoint-ORIG-GUID:
	 X-Proofpoint-Virus-Version:X-Proofpoint-Spam-Details;
	bh=s1VFXOjcBW1JC1Jk+DpwnlnF5IjL6XkaTgCWHMd/YBo=;
	b=UImoinAuWim4ph/VRPgjunWKcqzkHEwyin26Jsl/ZK9n0Iwfs6bv/NXIdc/mDVVUKY3u
	 HyLJFKRi8wPzL/7YaL7Z99hEhyZw2X3/A741EjhxGNZRxggVr3iX/ZMCU+AnOuqTq9n+n
	 5tQGTU/YeQElDZH/f7brRrWwQX0nLJb2RzbkKzYZh77lQ9jWW5L66qb1c2nRoi9k+hSyw
	 bDnKmO66ima1nI/Os1PHYgoagtquAgzQX38xFb/e6lENbnVNYrMBcaucgc18JZBZ1zF2p
	 EdyKa1meA9LDT6PkSxZJ5PWZ9pLnwB5OIGFR4pIcwFzxTHtGW1JVk6puWrS8Glm89uA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=hF3NcJlN;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=MQ2+yNxt;
	arc=none smtp.remote-ip=205.220.168.131
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E9536606A324
	for <sashiko-reviews@lists.linux.dev>; Fri, 23 Oct 2026 07:16:21 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org E9536606A324
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=hF3NcJlN;
	dkim=pass (2048-bit key, unprotected) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=MQ2+yNxt
Received: from pps.filterd (m0279864.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 69N7FUHB588023
	for <sashiko-reviews@lists.linux.dev>; Fri, 23 Oct 2026 07:16:21 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	s1VFXOjcBW1JC1Jk+DpwnlnF5IjL6XkaTgCWHMd/YBo=; b=hF3NcJlNDqUthbL5
	ZW/1kDZOUaJZmhocQARRnqq2OuNB8ImFH5IikM7iMes/OhGbFeuTK93i+f1KpRGN
	zTZQFoIaEqDhthC7d+IovQdq61y+5qHq0ZkdOWnpewPuxFvwjDv2UrcCbrcRalyn
	uOtUQ3JM5LE7Npy0hN11+mF/hafWZQXBoKFDQZOgOoTqcTUnY/k0KlUvjOYTwahW
	Pzz+GwX8xznBFbZ/wrucrsXzw1K/1kpIxAjZ2line9u3QWvB3tvSPxDohFMTGq8S
	44AMBIc9Qik7xhBs0kUeMl+ZHJX3ecfokGy7PMvoW1/fo2hu51QqNs1GYW0Rk+N2
	KKRzqA==
Received: from mail-pj1-f70.google.com (mail-pj1-f70.google.com [209.85.216.70])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hfsmaswvt-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <sashiko-reviews@lists.linux.dev>; Fri, 23 Oct 2026 07:16:21 +0000 (GMT)
Received: by mail-pj1-f70.google.com with SMTP id 98e67ed59e1d1-3ab27c28489so186908a91.1
        for <sashiko-reviews@lists.linux.dev>; Fri, 23 Oct 2026 00:16:20 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1792739780; x=1793344580; darn=lists.linux.dev;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :content-type:mime-version:references:message-id:subject:cc:to:from
         :date:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=s1VFXOjcBW1JC1Jk+DpwnlnF5IjL6XkaTgCWHMd/YBo=;
        b=MQ2+yNxt8gMA7fHClLlnXkRWsWcPOHK+ge0krQkS+9xpngpBm/7SrLGvSyfZ9CpoVe
         2b0o0ozMjc+8a3xCysOfe4H0rBTXlZxn1P2E0K3NGQkpYRK1QhSNBb+z4wnYxmN59/4m
         z3i8ysGvEbdY2qptvzt0bcrtpPXG56Ibwf5QgJOk9/vAWP6Uvy/IgTo9QMkMlgikSGrI
         D7NPW4SKMeFISoTZgFDsYK6WW2F8zEmtn72oTJFHv1bCR7GEQwFrtZYUpWrHe4f+YOjh
         J/gj/2qqANopFr1WiQRz39SPj7llPqYkHpgUN5DwRLeIqNX6VNdX2oUp52LOHXrDtwNv
         F9mg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792739780; x=1793344580;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :content-type:mime-version:references:message-id:subject:cc:to:from
         :date:x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=s1VFXOjcBW1JC1Jk+DpwnlnF5IjL6XkaTgCWHMd/YBo=;
        b=V3AhRlmhXB5OffuEatcbzi7mGc19zbx+5aMZTD7S7uUXfERdY8slYzo3GiG8rVppMK
         aPvV32yck+xfmMnXn9tljjjFI3AeGf1QcLbl49EPnRy3No1370PUEuOoUP4uSL1H6iHJ
         DRgNRcRmQ9vMFTbkCEEPZCvfROnCW2oOJX2C/MCr1hb0yj5nANLEWL+FDfhy/TJ3h9Vc
         ESEBibdgaw3Vkv7Pn6gcKW6L0wFpDbg34shawpgHQOymqGK1Kp2szafDZSQE6kpjl4ui
         pSe2O/RwXBelXl+pMbqoxaO2L9iwEZvzA7lVSZyH+Pf63Ps27+Uq9Bk4VxRZntDNbfyC
         GNfg==
X-Gm-Message-State: AFq9FYLvNmkrMOxEf+MJhc38IOrjREAZoi3Jal54O5ONNqHp51ggvU2S
	MwZyY+brnsn/f4tjVuIPnOex1l5pbpAeyj+dLVvkAmJU0iIna0W+1cTzGoWKpG+TBRhMxTpklkU
	asTTo1XuC8YBE/7LqrZp/XxRBYqcTMeCFLYHHDb/O7qpPJweM57w142BTXjUksmxQISTC+GUKve
	9NQ1Y=
X-Gm-Gg: AYBFou24AVxpFwR+y/2POgNc4/Dg7X/Pl4fPHDt4qq/b6VB/UnJ51/fjfZnix96Kyz2
	4I9mGHXabBfNfNBLx9Jy07f7+ti4TlUU3zGMcubuedJR8oLE5XdVeFijEneAj/uMdZnLZs9j9SC
	LUHv+hPjZIMm+GTgx7TocZ7HzDknRn68dnNrIVNm06/X9+XSicYuCaFElVSRr/r4HxUCDDug8OB
	+B0MASUrIm3vpcDDiltb3idbCORhTBFZJuEeP5Mj0zGpcQWp0l3hsVZoWKaFnNEGgLfEVAl7eZ7
	DV3js79uLy33m7mXiM5oC9C/PJci8W/4Lmv1iDjaGjauzAoA1mqaffIaZ8LMgIOW6/UsKRPH89C
	F6pIlq6szh2F1SklOGCiv6xRkyEh79MFwU/VMbBHCfTM18kxVvanKHelTeYohZxE5dGdpvcwNyI
	lfKOfNTDfcAToG16EG1rpYMV0jDl8k9qAX2f8sFH8Q4dguTcSuuzY=
X-Received: by 2002:a17:90b:2649:b0:3ab:a188:b898 with SMTP id 98e67ed59e1d1-3adce45eb95mr1975202a91.2.1792739780176;
        Fri, 23 Oct 2026 00:16:20 -0700 (PDT)
X-Received: by 2002:a17:90b:2649:b0:3ab:a188:b898 with SMTP id 98e67ed59e1d1-3adce45eb95mr1975148a91.2.1792739779579;
        Fri, 23 Oct 2026 00:16:19 -0700 (PDT)
Received: from hu-vishsain-blr.qualcomm.com (blr-bdr-fw-01_GlobalNAT_AllZones-Outside.qualcomm.com. [103.229.18.19])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3add2416e61sm525826a91.0.2026.10.23.00.16.17
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 23 Oct 2026 00:16:19 -0700 (PDT)
Date: Fri, 23 Oct 2026 12:46:14 +0530
From: Vishnu Saini <vishnu.saini@oss.qualcomm.com>
To: sashiko-reviews@lists.linux.dev
Cc: devicetree@vger.kernel.org, robh@kernel.org, conor+dt@kernel.org
Subject: Re: [PATCH 7/7] arm64: dts: qcom: shikra-iqs-evk: Add Waveshare
 8-inch DSI panel overlay
Message-ID: <atsJvlFjvunSZKiQ@hu-vishsain-blr.qualcomm.com>
References: <20261021-shikra_display_overlays-v1-0-adaea735999f@oss.qualcomm.com>
 <20261021-shikra_display_overlays-v1-7-adaea735999f@oss.qualcomm.com>
 <sashiko-outbox-180386@kernel.org>
X-Mailing-List: sashiko-reviews@lists.linux.dev
List-Id: <sashiko-reviews.lists.linux.dev>
List-Post: <mailto:sashiko-reviews@lists.linux.dev>
List-Help: <mailto:sashiko-reviews+help@lists.linux.dev>
List-Subscribe: <mailto:sashiko-reviews+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:sashiko-reviews+unsubscribe@lists.linux.dev>
List-Owner: <mailto:sashiko-reviews+owner@lists.linux.dev>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <sashiko-outbox-180386@kernel.org>
X-Authority-Analysis: v=2.4 cv=V7LoQuni c=1 sm=1 tr=0 ts=6adb09c5 cx=c_pps
 a=0uOsjrqzRL749jD1oC5vDA==:117 a=Ou0eQOY4+eZoSc0qltEV5Q==:17
 a=8nJEP1OIZ-IA:10 a=660iZSQnnn4A:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=DJpcGTmdVt4CTyJn9g5Z:22
 a=c92rfblmAAAA:8 a=EUspDBNiAAAA:8 a=VwQbUJbxAAAA:8 a=ExTeXEdhDUnX6soCXD0A:9
 a=3ZKOabzyN94A:10 a=wPNLvfGTeEIA:10 a=mQ_c8vxmzFEMiUWkPHU9:22
 a=GvGzcOZaWPEFPQC_NcjD:22
X-Proofpoint-Spam-Info: AW1haW4tMjYxMDIzMDAyOCBTYWx0ZWRfXxGqp0EEqwqDv
 AFcslt41cA6LWto3T/gMQCzTnFosl1E1N5qTVYjG+lMypbd0Hy6PaFrh2tbfIeFaqy66uxW7xSC
 XNkmumhBiu8CTP3W0B9b9/9lPkrzsqI=
X-Proofpoint-GUID: N96r582r8_ks00YDgcPHIALqTzXUi9m-
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMDIzMDAyOCBTYWx0ZWRfX2b/D9I0VUd3X
 0fUWMA1tmqTgWDiZsMTQA0hIZNsGKyFl70bE++Dx0t1lx0GvRPZB4YO6yPX7hezzQCjABv8swP1
 3xgBMFf7/24v+8SZdKuQjF2hSlxbJNLxX0SQ4nDbWN1gpGKDENc+PlvWGct75+XHjV8yYyZY7GD
 iHSZ3r2ex0wlSbi86nbZgGJGw9nM3hm0HHOnZXvYgkankv+93ECPGc4wTVKX8lMkUxZiL6h0HNA
 uuf+tY0aiV1PQGJ/4P8/lSQ0QXJZbUf0caW4BbnVsQRX61CTRlYL97icYc/tRBfq9TMBJtwHu+I
 n8nrDvo1EidMWCYWZvMMmaNphSutIsMQUitgoANoFVsxJ6z9MQyEhuuaphmTwXtQ1QDF9HJoZpr
 pGDmQCaN9yGkqd0BeCiXGT4Dyd7+7gMgoWM5CUE231SqK/+e6EvgE/aAHkVwM6su+IxHY8+e6v9
 nKUhn8nugSyGLVQ2J4w==
X-Proofpoint-ORIG-GUID: N96r582r8_ks00YDgcPHIALqTzXUi9m-
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-10-23_02,2026-10-21_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 suspectscore=0 adultscore=0 impostorscore=0 bulkscore=0 lowpriorityscore=0
 malwarescore=0 priorityscore=1501 phishscore=0 spamscore=0 clxscore=1015
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2610190000 definitions=main-2610230028

On Wed, Oct 21, 2026 at 02:37:07PM +0000, sashiko-bot@kernel.org wrote:
> Thank you for your contribution! Sashiko AI review found 1 potential issue(s) to consider:
> - [High] arm64: dts: qcom: missing panel_vcc regulator on wsgpio 8 in Waveshare overlay
> --
> 
> commit 8859b55c691118c8af80fdf98b5e594862815afd
> Author: Shashank Maurya <shashank.maurya@oss.qualcomm.com>
> 
> arm64: dts: qcom: shikra-iqs-evk: Add Waveshare 8-inch DSI panel overlay
> 
> This commit adds a devicetree overlay for the Waveshare 8-inch DSI panel on
> the Shikra IQS EVK carrier board, configuring the jadard,jd9365da-h3 panel,
> the waveshare,dsi-touch-gpio expander, and the goodix,gt9271 touchscreen
> while disabling the default hdmi output.
> 
> > diff --git a/arch/arm64/boot/dts/qcom/shikra-iqs-evk-waveshare-dsi-8inch.dtso b/arch/arm64/boot/dts/qcom/shikra-iqs-evk-waveshare-dsi-8inch.dtso
> > new file mode 100644
> > index 0000000000000..d0aa115681ffd
> > --- /dev/null
> > +++ b/arch/arm64/boot/dts/qcom/shikra-iqs-evk-waveshare-dsi-8inch.dtso
> > @@ -0,0 +1,77 @@
> > +// SPDX-License-Identifier: BSD-3-Clause
> > +/*
> > + * Copyright (c) Qualcomm Technologies, Inc. and/or its subsidiaries.
> > + */
> > +
> > +/dts-v1/;
> > +/plugin/;
> > +
> > +#include <dt-bindings/gpio/gpio.h>
> > +
> > +&{/} {
> > +	model = "Qualcomm Technologies, Inc. Shikra IQS EVK Waveshare 8inch DSI Panel";
> > +
> > +	panel_avdd: regulator-panel-avdd {
> > +		compatible = "regulator-fixed";
> > +		regulator-name = "panel-avdd";
> > +		gpios = <&wsgpio 0 GPIO_ACTIVE_HIGH>;
> > +		enable-active-high;
> > +	};
> > +
> > +	panel_iovcc: regulator-panel-iovcc {
> > +		compatible = "regulator-fixed";
> > +		regulator-name = "panel-iovcc";
> > +		gpios = <&wsgpio 4 GPIO_ACTIVE_HIGH>;
> > +		enable-active-high;
> > +	};
> > +};
> > +
> > +&hdmi_bridge {
> > +	status = "disabled";
> > +};
> > +
> > +&hdmi_connector {
> > +	status = "disabled";
> > +};
> > +
> > +&i2c4 {
> > +	#address-cells = <1>;
> > +	#size-cells = <0>;
> > +
> > +	wsgpio: gpio@45 {
> > +		compatible = "waveshare,dsi-touch-gpio";
> > +		reg = <0x45>;
> > +		gpio-controller;
> > +		#gpio-cells = <2>;
> > +	};
> > +
> > +	touchscreen@5d {
> > +		compatible = "goodix,gt9271";
> > +		reg = <0x5d>;
> > +		reset-gpios = <&wsgpio 9 GPIO_ACTIVE_HIGH>;
> > +	};
> > +};
> 
> [Severity: High]
> Does this leave the Waveshare vcc rail unpowered?
> 
> In drivers/gpio/gpio-waveshare-dsi.c, the expander maps offset 8 to the vcc
> rail and offset 9 to touchscreen reset:
> 
> enum {
> 	GPIO_AVDD = 0,
> 	GPIO_PANEL_RESET = 1,
> 	GPIO_BL_ENABLE = 2,
> 	GPIO_IOVCC = 4,
> 	GPIO_VCC = 8,
> 	GPIO_TS_RESET = 9,
> };
> 
> During waveshare_gpio_probe()->waveshare_gpio_set(), state->poweron_state
> starts at 0 and asserting offset 9 writes the upper byte of
> state->poweron_state to the touch register:
> 
> 	last_val = state->poweron_state;
> 	if (value)
> 		last_val |= BIT(offset);
> 	else
> 		last_val &= ~BIT(offset);
> 
> 	state->poweron_state = last_val;
> 
> 	err = regmap_write(state->regmap, REG_TP, last_val >> 8);
> 	if (!err)
> 		err = regmap_write(state->regmap, REG_LCD, last_val & 0xff);
> 
> Because the overlay only defines panel_avdd (offset 0) and panel_iovcc
> (offset 4) under &{/} and does not configure a regulator for wsgpio
> offset 8, bit 0 of the touch register is driven low on every
> waveshare_gpio_set() call and never enabled before goodix_ts_probe()
> accesses touchscreen@5d.
> 
> Should &{/} also define a panel_vcc regulator for wsgpio offset 8 (as in
> Documentation/devicetree/bindings/gpio/waveshare,dsi-touch-gpio.yaml, or
> wired to touchscreen@5d) so the vcc rail is enabled?

The panel was functional during my testing, touch and backlight control verified,
without explicitly configuring GPIO offset 8, so I did not notice the missing VCC regulator.

However, the Waveshare GPIO binding defines the VCC rail using offset 8 as an always-on fixed regulator.
I will add the panel_vcc regulator to ensure the VCC rail is explicitly enabled.

    panel_vcc: regulator-panel-vcc {
        compatible = "regulator-fixed";
        regulator-name = "panel-vcc";
        gpios = <&wsgpio 8 GPIO_ACTIVE_HIGH>;
        enable-active-high;
        regulator-always-on;
    };
 
> [ ... ]
> 
> -- 
> Sashiko AI review · https://sashiko.dev/#/patchset/20261021-shikra_display_overlays-v1-0-adaea735999f@oss.qualcomm.com?part=7
