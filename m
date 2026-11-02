Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.180.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793600301;
	b=QRT1xkM462nHHkBG9V2Q/cLk0VEZGeicHv1V0d4wELTXVgQZHGNVhCkoAgphWlLz1b3l
	 QgJ6luuK9wbwnajjwr1AoyKDTbndyYvMulSUjf1uUdPmzphbVmAcJW9KUMZx8N8hYZUo5
	 NEt0tPQrZ12/Oc0ZX3x1rQWfQEUEMfDlkGCqqwrrzkwz7C4c8Zr6HMKkf1UG/mbr73X6x
	 rmGX4I8oil7BQaGGf4cDp3W0XCcUtwWZuXZrqsnN9C/jnTZh3SQIhnISwK7znQwV0cJeb
	 WWVYVsYCl0BMWdQ4wsoVw77MFzSwpmSgBgXClAc46GtC3jU+qhvQBOppv2MahtgrEBg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793600301;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Gm-Message-State:X-Gm-Gg:
	 X-Received:X-Received:Received:Date:From:To:Cc:Subject:Message-ID:
	 References:MIME-Version:Content-Type:Content-Disposition:
	 Content-Transfer-Encoding:In-Reply-To:X-Authority-Analysis:
	 X-Proofpoint-ORIG-GUID:X-Proofpoint-GUID:
	 X-Proofpoint-Spam-Details-Enc:X-Proofpoint-Spam-Info:
	 X-Proofpoint-Virus-Version:X-Proofpoint-Spam-Details;
	bh=zdEZtuUjS8y1Tb3uKWqUvcb4x2mh1O+qRQPxC8ckET8=;
	b=iJeRkfbDFF6NjLQyeTVzNKVlczzquu5WI7KPlKCEiGQQAwq/r68oFuFhg5bxSRcGCCiS
	 Z4uut7coUdfebx4/hhQ9Gih+jZiuDiI9idBaSAJSSmazXlcKE+2Z/YPQyo94LKgXflvqQ
	 OwQEyJlI/zmpQtrIJlsdB1iHuIx1QDLxNEaWTVevraME/wSfGBUcX64LHF110+QAogqZO
	 1HSDM083BhVZrGs0sP6nFgGw+SMjTELHWtq2kWbSWXuYsHMJe718Hg6uDkjANw9vcJhT6
	 QvFkvWjNAhThwMTyjO0ohdcOB192Z8qR10MpovMPUKrNzV5EMZtLAwlhU8qkkSZHTqw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=PgQNqmsf;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=IUU3dGja;
	arc=none smtp.remote-ip=205.220.180.131
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 67391606A327
	for <sashiko-reviews@lists.linux.dev>; Mon,  2 Nov 2026 06:18:21 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 67391606A327
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=PgQNqmsf;
	dkim=pass (2048-bit key, unprotected) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=IUU3dGja
Received: from pps.filterd (m0279870.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6A23vOTe2745609
	for <sashiko-reviews@lists.linux.dev>; Mon, 2 Nov 2026 06:18:20 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	zdEZtuUjS8y1Tb3uKWqUvcb4x2mh1O+qRQPxC8ckET8=; b=PgQNqmsfPonVZmec
	n80aPct4TSGXGn28OH/qivlPXGnNMZF0baYme5WPQ4IZFswJ2l4tJlfHA1figs2B
	FPUXEM91nnVMBi5ICHrLnYRCuicttZOLPKwicBHAA/l2spK+t3ykjfjcdjYCh1dX
	FGnHLXr8PaJaf2FPzpTzErD/fKWlN64i4RPo53kONk6xBPal7vQqr0DQu2g7FB7g
	i16HTQBeLuu4IF3+IGYimPLpbuM5NKKRopKczY7wZJIAXHAHrgrmWGz/JVrGZRUm
	+wUeaQKro3zcao8VY7DGqq8fKL9b0TbwF+xxfAIUciMZm2Rkx6JiShnBaiybLw9e
	RjAXPA==
Received: from mail-pl1-f199.google.com (mail-pl1-f199.google.com [209.85.214.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hn8dudddd-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <sashiko-reviews@lists.linux.dev>; Mon, 02 Nov 2026 06:18:19 +0000 (GMT)
Received: by mail-pl1-f199.google.com with SMTP id d9443c01a7336-2e869e00005so43081045ad.2
        for <sashiko-reviews@lists.linux.dev>; Sun, 01 Nov 2026 22:18:19 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1793600299; x=1794205099; darn=lists.linux.dev;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :content-type:mime-version:references:message-id:subject:cc:to:from
         :date:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=zdEZtuUjS8y1Tb3uKWqUvcb4x2mh1O+qRQPxC8ckET8=;
        b=IUU3dGja1MzPX/XplwP45yl7jvW430oymAUkUPGHIQTu/fo428iIOqjOi7qkxHPM7L
         et0t+U494x1hAMReCKNC7cVj11FYy6AxQ22/UM194BgowycI3oV3w5pxfDdvbhAh9O6L
         H3xg656TctCWufiXOX3K8A4SN/cQpm2cW6oNO9WGkBmRoQIHIFZoflI2rJrck3RyuDoY
         sjMuidTz3t/P5jdUJ1WOfXHyak8WheAV3Y8Zf3SeyAslFy0iV+YvA+1Fmrz1TQ8HIM16
         Hva4X89hBTVBTjD0vcpXs2lcNdZ4G+LyRkwnho1W+O4bSkb7kyN7eBvYSOmAjN0VWyer
         GO4g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793600299; x=1794205099;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :content-type:mime-version:references:message-id:subject:cc:to:from
         :date:x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=zdEZtuUjS8y1Tb3uKWqUvcb4x2mh1O+qRQPxC8ckET8=;
        b=wVHZSTTKo3gMkJ+LFXd1vj5CuBOHBVpXLwF4+U3dYpq9hPq/jkajq0J5FSLxh0F7EH
         lWkov3myupsmJLEVCDwCIjw1SGpiQXuisgnnqmPf4Up2S76emfrpA5hZRu4XIuaKXig5
         +0cC4Y4PPRN+XSlFmgj331wTRQVbbOI8X8cuvlOEz5Z353BSr/9Tm2Ee62YmYwO1HS8L
         4gZb0isKqE61j1mmeUpgclmLCKemXD6sl4HS4d0rzQ23yxWVreGiMAAFdS1m5YiiAbbX
         L89mfB3fBHCFa3AhLuBEwrxrP1W4Z5iagbE3bCtloAtq6VyztAPQBkMnEKOUcWKPT5Rt
         dgIg==
X-Gm-Message-State: APuU4Z+JZvsEjZCOHpx6CmAU7QBCG/pWzmN859T+AnPSd/75Ysy3AFuO
	lcb1+28KuYv16DRb52xB+Sw/LwzJ4N6XfxySS6Aio309SB1Z66MeDUgzw4r99kFjaYIeep4G33O
	ApTWHfvOfoRJajHIxBJ1Iru2v2Wirngat7DnyBTWg8fWqHUBMQ8LwiZvu+ipQ1VbFj6CablJI0Y
	ds3iU=
X-Gm-Gg: AYBFou1nOG40WkZjMwcpHNcop1/PeOtyPbH06UIvWydXe7i8U85N3TccCnT4kKc1t9z
	8ryhBGHD2v2+/0d2W6fxR/LEDg6MaKOQVfE/HS85SweA+Neh/+alLFZf58H5hX3AKKTvCyrXgG7
	K6DyupRk8yEzXxi5B8l/DGuEaZ1owNOhxvL0KBTTQb0QoUGuW7eka05p8KJYfdNRWjCWCTCW0pE
	ZyBRmkrir5z48ORf6zEIPOSH7TosjZz7leXcDQKIVAMKvp85kDZz+xKHIojBkQGM9dMWLAxxssZ
	EzOqXiaLktnuq+/+RfV95uG44bKQyYsoJxCvtzuZwIWRoV/922gnZdzlW7AjXca9GfNYOPpszrP
	DKeghAzeEkqvg1Oo0g8jtJkCDo+r7DXlU9ec0TrzjFiERZnIHYAQSXqIGlhZLnCjCLmza4Nx/Hn
	h4MjYv
X-Received: by 2002:a17:903:2a87:b0:2e9:8535:5141 with SMTP id d9443c01a7336-2eb3647fd42mr89867555ad.50.1793600298831;
        Sun, 01 Nov 2026 22:18:18 -0800 (PST)
X-Received: by 2002:a17:903:2a87:b0:2e9:8535:5141 with SMTP id d9443c01a7336-2eb3647fd42mr89867365ad.50.1793600298326;
        Sun, 01 Nov 2026 22:18:18 -0800 (PST)
Received: from hu-anantiwa-hyd.qualcomm.com ([202.46.22.19])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2eb39230bbfsm22535525ad.19.2026.11.01.22.18.16
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 01 Nov 2026 22:18:18 -0800 (PST)
Date: Mon, 2 Nov 2026 11:48:14 +0530
From: Anand Tiwari <anand.tiwari@oss.qualcomm.com>
To: sashiko-reviews@lists.linux.dev
Cc: devicetree@vger.kernel.org, robh@kernel.org, conor+dt@kernel.org
Subject: Re: [PATCH v2 1/6] arm64: dts: qcom: talos-lyra-evk: Add LT9611UXD
 HDMI bridge support
Message-ID: <augrJqAg0jwM/Yuy@hu-anantiwa-hyd.qualcomm.com>
References: <20261030-lyra-display-upstream-post-v2-0-906302159392@oss.qualcomm.com>
 <20261030-lyra-display-upstream-post-v2-1-906302159392@oss.qualcomm.com>
 <sashiko-outbox-190777@kernel.org>
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
In-Reply-To: <sashiko-outbox-190777@kernel.org>
X-Authority-Analysis: v=2.4 cv=O6esLx9W c=1 sm=1 tr=0 ts=6ae82b2b cx=c_pps
 a=JL+w9abYAAE89/QcEU+0QA==:117 a=fChuTYTh2wq5r3m49p7fHw==:17
 a=8nJEP1OIZ-IA:10 a=zJRp6_cAMcgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=gowsoOTTUOVcmtlkKump:22
 a=c92rfblmAAAA:8 a=EUspDBNiAAAA:8 a=VwQbUJbxAAAA:8 a=DfhYv1hxhrLySWN8tNYA:9
 a=3ZKOabzyN94A:10 a=wPNLvfGTeEIA:10 a=324X-CrmTo6CU4MGRt3R:22
 a=GvGzcOZaWPEFPQC_NcjD:22
X-Proofpoint-ORIG-GUID: rF6JDOlBXJqQdMZ7hTuKZjG1d9uFNHWq
X-Proofpoint-GUID: rF6JDOlBXJqQdMZ7hTuKZjG1d9uFNHWq
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTAyMDAyNCBTYWx0ZWRfX887tgu0LuY8M
 RzNQfkHBUksYSjqGDYWcRInhO8W7k/oZIZxhvpilxD5XhI/NG0WqIA+mo/So/ofMBxjk9CQ5gWg
 w2bG+kKR3qethNCpFV9mMjT3jVYhiYFNovW9SgKx6+uJBGV0aZbpABUKxe43dkEzUo3m6uDog0/
 MF+s8TfMEy0Asx51xS1iaUxkSxtGH4WL0EfJoTTTUkhwTRgLyZqLuEqwhER2wx/C3I7JbqRninB
 uEjQOYuPjxsYbBCNqkJUtLZuZXfBo3fTWS7rCcRH9ja6+ono5XT0kF5WAyLXB8rcyBXcAllAyBY
 79gI/XnMM9FWkrVsI+PFRTmFllDBu6sb3/jkfD5OMWjXBRUEHj/BMMFPMAkZTIkd49kyxsih8GG
 O2Op5hF5aDNMbO5LG0yUxRzT66bCclCyvb+xHf7PvjhLv0Tpuy2QyQxoGkWdBmPbWnudOLnwgup
 Cu+qgHGUf+rCcQtO2pg==
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTAyMDAyNCBTYWx0ZWRfXz5/lHsKMYapk
 w3M38908EvMGiugkN4sUt0YdFRzDFOuaS+QkizZoJnFB41sZS0+90YNGstVSSm6omQhHmKIaeF5
 zAQkb497bT1DiBb7f0FOvfkanzcDjmM=
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-02_02,2026-10-21_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 suspectscore=0 phishscore=0 malwarescore=0 impostorscore=0 lowpriorityscore=0
 bulkscore=0 priorityscore=1501 adultscore=0 spamscore=0 clxscore=1015
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2610300000 definitions=main-2611020024

On Fri, Oct 30, 2026 at 09:49:28AM +0000, sashiko-bot@kernel.org wrote:
> Thank you for your contribution! Sashiko AI review found 2 potential issue(s) to consider:
> - [Medium] arm64: dts: qcom: talos-lyra-evk: swapped DSI supplies and invalid vdds-supply
> - [Low] arm64: dts: qcom: talos-lyra-evk: duplicate tlmm node and unused header
> --
> 
> commit 22e8de3b84d3ac4983c9f5f3821155bfe2321465
> Author: Mohit Dsor <mohit.dsor@oss.qualcomm.com>
> 
> arm64: dts: qcom: talos-lyra-evk: Add LT9611UXD HDMI bridge support
> 
> This commit adds device tree support for the Lontium LT9611UXD DSI-to-HDMI
> bridge on the Talos Lyra EVK carrier board, connected via I2C2 and MDSS
> DSI0.
> 
> > diff --git a/arch/arm64/boot/dts/qcom/talos-lyra-evk.dts b/arch/arm64/boot/dts/qcom/talos-lyra-evk.dts
> > index d4468e6099112..eeb8e903b03b1 100644
> > --- a/arch/arm64/boot/dts/qcom/talos-lyra-evk.dts
> > +++ b/arch/arm64/boot/dts/qcom/talos-lyra-evk.dts
> > @@ -4,6 +4,8 @@
> >   */
> >  /dts-v1/;
> >  
> > +#include <dt-bindings/gpio/gpio.h>
> > +#include <dt-bindings/pinctrl/qcom,pmic-gpio.h>
> >  #include "talos-lyra-evk-som.dtsi"
> 
> [ ... ]
> 
> > @@ -74,6 +139,23 @@ &mdss_dp0_out {
> >  	remote-endpoint = <&dp0_connector_in>;
> >  };
> >  
> > +&mdss_dsi0 {
> > +	vdda-supply = <&vreg_l5a>;
> > +
> > +	status = "okay";
> > +};
> > +
> > +&mdss_dsi0_out {
> > +	remote-endpoint = <&hdmi_bridge_in>;
> > +	data-lanes = <0 1 2 3>;
> > +};
> > +
> > +&mdss_dsi0_phy {
> > +	vdds-supply = <&vreg_l11a>;
> > +
> > +	status = "okay";
> > +};
> 
> [Severity: Medium]
> Are the regulator supplies for mdss_dsi0 and mdss_dsi0_phy swapped here, and
> should mdss_dsi0_phy use vcca-supply instead of vdds-supply?
> 
> In arch/arm64/boot/dts/qcom/talos.dtsi, mdss_dsi0_phy uses compatible
> qcom,sm6150-dsi-phy-14nm. The schema in
> Documentation/devicetree/bindings/phy/qcom,dsi-phy-14nm.yaml sets
> unevaluatedProperties: false and only defines vcca-supply, not vdds-supply:
> 
>   vcca-supply:
>     description: Phandle to vcca regulator device node.
> 
> In drivers/gpu/drm/msm/dsi/phy/dsi_phy_14nm.c, the 14nm PHY driver never
> requests vdds, so devm_regulator_bulk_get_const() in dsi_phy_driver_probe()
> ignores vdds-supply and falls back to a dummy regulator, leaving vreg_l11a
> with no consumers.
> 
> Furthermore, in arch/arm64/boot/dts/qcom/talos-lyra-evk-som.dtsi, vreg_l5a
> is the 0.88V LDO5 rail and vreg_l11a is the 1.2V LDO11 rail. In
> drivers/gpu/drm/msm/dsi/dsi_cfg.c (dsi_v2_4_regulators), the DSI controller
> expects vdda to be the 1.2V rail, and other QCS615/Talos boards such as
> arch/arm64/boot/dts/qcom/talos-evk-som.dtsi and
> arch/arm64/boot/dts/qcom/qcs615-ride.dts wire these as:
> 
> &mdss_dsi0 {
> 	vdda-supply = <&vreg_l11a>;
> 	status = "okay";
> };
> 
> &mdss_dsi0_phy {
> 	vcca-supply = <&vreg_l5a>;
> 	status = "okay";
> };
> 
> >  
> >  &pon_pwrkey {
> >  	status = "okay";
> >  };
> > @@ -113,3 +195,26 @@ &usb_2 {
> >  
> >  	status = "okay";
> >  };
> > +
> > +&tlmm {
> > +	lcd_bias_en: lcd-bias-en-state {
> > +		pins = "gpio3";
> > +		function = "gpio";
> > +		drive-strength = <8>;
> > +		bias-disable;
> > +	};
> > +
> > +	bridge_irq_pin: bridge-irq-state {
> > +		pins = "gpio60";
> > +		function = "gpio";
> > +		drive-strength = <2>;
> > +		bias-disable;
> > +	};
> > +
> > +	bridge_rst_pin: bridge-rst-state {
> > +		pins = "gpio61";
> > +		function = "gpio";
> > +		drive-strength = <8>;
> > +		bias-disable;
> > +	};
> > +};
> 
> [Severity: Low]
> This isn't a bug, but arch/arm64/boot/dts/qcom/talos-lyra-evk.dts already
> has a &tlmm node ordered alphabetically between &spi6 and &usb_1:
> 
> &tlmm {
> 	dp_hot_plug_det: dp-hot-plug-det-state {
> 		pins = "gpio104";
> 		function = "dp_hot";
> 		bias-disable;
> 	};
> };
> 
> Could lcd_bias_en, bridge_irq_pin, and bridge_rst_pin be merged into the
> existing &tlmm node rather than adding a second &tlmm block at the end of
> the file?
> 
> Also, the newly added dt-bindings/pinctrl/qcom,pmic-gpio.h include at the
> top of the file appears to be unused (and dt-bindings/gpio/gpio.h is already
> included via talos-lyra-evk-som.dtsi). Could the unused header be dropped?
> 
> -- 
> Sashiko AI review · https://sashiko.dev/#/patchset/20261030-lyra-display-upstream-post-v2-0-906302159392@oss.qualcomm.com?part=1
We will handle this.
