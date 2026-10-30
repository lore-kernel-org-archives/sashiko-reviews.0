Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.168.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793370667;
	b=MTE2VNPKbafM9f+VQNemjgn02Vz6OgaqA53iAahbDmhmSfbvT16iGiIju7RWUEPkzVEn
	 0E1m5NXHKzlBmySfJ2acgqjEh4pVrcKtJBAzQ90AXMeWRsZpS/ltN2DLZV+TeD/dSkV+O
	 LPrNVyiZFtVOHEktHpirtmzciktdgXrFDpYqxskRBKzSBR2KgWDYzob0IIS1oBqovqRVO
	 Zal2jlZhrh2W5wuKzCl/UpmuKJ7FRbMTpl9ZgeZhqIog0K3FrvkmvrAlGUO9oOdJvjOlN
	 /+H79k1zCpyyHrQDQ8Hsv/Lm+A/NeonnSKkMyt06IKfu2njawk6huFfnKuAs7C7xkww==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793370667;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Gm-Message-State:X-Gm-Gg:
	 X-Received:X-Received:Received:Date:From:To:Cc:Subject:Message-ID:
	 References:MIME-Version:Content-Type:Content-Disposition:
	 Content-Transfer-Encoding:In-Reply-To:X-Proofpoint-GUID:
	 X-Authority-Analysis:X-Proofpoint-Spam-Details-Enc:
	 X-Proofpoint-ORIG-GUID:X-Proofpoint-Spam-Info:
	 X-Proofpoint-Virus-Version:X-Proofpoint-Spam-Details;
	bh=0oPHy56QkcZEgYC9Z+yVB0occlet/28li9Be+vVQ3xI=;
	b=ZRLk1vyF1pv8vQGtdu2JVF1Ku1qHFMUjHIn/NwM61Ga4bM0fBoPIt+eAP6mRj0/BE3H4
	 vd/8Wh8Ef/nO5rjVpfxenEWrBgHhv9jV8/MdfNg/7hFtFdVC6acVq1qFjWMAkJWkj60lu
	 ofYIjogBr/unA4ksSVqof2VHikRKTxLizNl6nbBQpj9Zg5VdQC+aN4JOiNm0y2fKZDeFL
	 Rmk8DFr4iJcYZMwoT/20mimHUCzh8hJs/i3GQS7SN3KTVMwsIna14xNiuNLbpPAq/hE+T
	 82fQWjO2GbyknNbxpjltcFvDHkD3nkiH1J6zt0OPZUsat90N4Ue4X/JHjuLuNA7Zy+w==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=ZTAx3AFk;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=D4KJJRmb;
	arc=none smtp.remote-ip=205.220.168.131
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C0DB7606A31D
	for <sashiko-reviews@lists.linux.dev>; Fri, 30 Oct 2026 14:31:06 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org C0DB7606A31D
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=ZTAx3AFk;
	dkim=pass (2048-bit key, unprotected) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=D4KJJRmb
Received: from pps.filterd (m0279863.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 69UER1jd3515193
	for <sashiko-reviews@lists.linux.dev>; Fri, 30 Oct 2026 14:31:06 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	0oPHy56QkcZEgYC9Z+yVB0occlet/28li9Be+vVQ3xI=; b=ZTAx3AFkNOyF70Bt
	hUswdeYulFQe7uuS8tZkr6zKVWqmI6hwQN48p25dTOnYfhlZBqGUw6sihtm4TZ/K
	bSQjp6bK1Gx/aT6fg5fqgsGEtmUXjQsyrwKEDoXHyQg5rt1svezAA8+FQJ1OWnAW
	JhZJtreUsBJlfJk2t+7FZKfeBOcSGhXHfFkHJgnJ3VcJNWO603x2yB/t/DKxmNtG
	x8URvFLQ2OGtE+GgLtw28JoxDmG4bp4FztaeW6bHmeX1tCEwUcE2/a+lw/gR8aMM
	6HCotEXqaF9Ls+hgUbeoGvkmtm2U6Ngh5aOXnfv/landWJRwQqe22DfVjtyxzXNd
	QjHAMQ==
Received: from mail-pj1-f72.google.com (mail-pj1-f72.google.com [209.85.216.72])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hme6qkhn6-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <sashiko-reviews@lists.linux.dev>; Fri, 30 Oct 2026 14:31:05 +0000 (GMT)
Received: by mail-pj1-f72.google.com with SMTP id 98e67ed59e1d1-3ab27eb38d6so688789a91.2
        for <sashiko-reviews@lists.linux.dev>; Fri, 30 Oct 2026 07:31:05 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1793370665; x=1793975465; darn=lists.linux.dev;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :content-type:mime-version:references:message-id:subject:cc:to:from
         :date:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=0oPHy56QkcZEgYC9Z+yVB0occlet/28li9Be+vVQ3xI=;
        b=D4KJJRmb/ej1YSLVNNJdTmW7LiIwt/zgt7rPtoSs2tNLS1uixp9laYjc99E1wTJHnt
         0MuJGIUf0wh4iXdN5XjExl6ZO79qZVxtlLhDwUL/3zYoq5ZLlTrVEtNqqgpFrijYOIn2
         D5uEzuTl9mEM8XGWMKc3S7s+ZTs1QB2Zi68t4h7gQ2jpdkn8LOtxMwYsJN2y+ajX/4Rm
         3wno3aVMw57XrBxnN5imem0b4p0aYekfulU/vwn2ZsSTwYRZV7uC8x4etZ3s3GAe9JOV
         X3okPnYrtWOVzBCVGg0djEV7JjCqv+hgrWX2Jx7RuHVxIb/1fCjTVm+8VI/n54vmLa6d
         RmFg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793370665; x=1793975465;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :content-type:mime-version:references:message-id:subject:cc:to:from
         :date:x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=0oPHy56QkcZEgYC9Z+yVB0occlet/28li9Be+vVQ3xI=;
        b=E1T0XD8rPpNdVqpUEn/W3mNWW/NAsZkWxJ8LvE5I+1L3OKXf9NdF1Ch7uc3hhIPetx
         KQfZtXCuBB79aBbiHU91AwafSYbyr12nczF0ENb9tCpKl2tsT4dXqRtNwRHA/HDPAbe9
         9k+PXQiBwHfJPhKKllu7KkgIORQYeB8chy/V7uB/jbO6uXdBvGBNzEg5EigMzry2IaSZ
         i+fWIaVmV3juzUNRLboRRDuBmlRvumolj/Xv1T2muztcWWUWkXag4S3gcaY358I4liBz
         SRdkULLT7W+XN1MACpAJmRTTjH+RvGnf4agH/52LoYCzMb/rUYK8AMgwW1MbMIpMiDVq
         OHew==
X-Gm-Message-State: AFq9FYI+7tGugVgljYSMgZJPyDvIP1YoWynZt/8IljtVYxIgGJEJmQoI
	l+LJlTyH9q6euayenTmc9UvQgnG0q94ag19SG25Dcldpe/LAmgUrWZCrdyNr0wHz1GZ30+vw+7R
	rrD+RaPyXJVJnv8cajpfuBy5tqQ69Kkeg/5gpvOKhfayuC3CrqW+po94ANMjG2/yaDkpXPeay6Y
	Vo3TA=
X-Gm-Gg: AYBFou2A8BXrEwpIKrv33PXfignWw1nyTvwqCqiYL2F9+9HFipwJnoYRbB8mAMrEfKX
	Hwjj0OkgivPPxqbueHy87LCiX3QnUAwUtf5hOxLY7+UGdvhWkbWcJ8DVoyLtEO6oVCTQcTOMWLj
	rFHeSkfj8GTZyWCwTC2Zp+S7LQqR+yb3+IKz+N51hE5a9mDQ51MDSrbYuh6HZoV6cP+j2j/pUmx
	RKaXlbIbt4jtYKx47ZQ274hpCCsDs5OtAM/pDHetM4Tavta7lOmDehWmvCqMDhbPb7gQf4UWfU+
	NuhAx3WfPA5Gj3Iia0CV0zhNxZzBJ6UXR1QBEAkzW3sXxLm77X6ciGJ/VVo8RsnZriKM2ZNe4ic
	kASxoqwRlw9ZXIpl1G/17tNiFPYz/TPQsChyQAbfAgQdOVbgJb1HCzeNILPZiM1sWdiA7nHtZzP
	S86TcL1g==
X-Received: by 2002:a17:90b:4c52:b0:3a7:9adb:2a0d with SMTP id 98e67ed59e1d1-3ae89176b89mr2080928a91.0.1793370664606;
        Fri, 30 Oct 2026 07:31:04 -0700 (PDT)
X-Received: by 2002:a17:90b:4c52:b0:3a7:9adb:2a0d with SMTP id 98e67ed59e1d1-3ae89176b89mr2080911a91.0.1793370664069;
        Fri, 30 Oct 2026 07:31:04 -0700 (PDT)
Received: from hu-anantiwa-hyd.qualcomm.com ([202.46.22.19])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3ae84580a0esm4345472a91.8.2026.10.30.07.31.02
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 30 Oct 2026 07:31:03 -0700 (PDT)
Date: Fri, 30 Oct 2026 20:00:58 +0530
From: Anand Tiwari <anand.tiwari@oss.qualcomm.com>
To: sashiko-reviews@lists.linux.dev
Cc: devicetree@vger.kernel.org, robh@kernel.org, conor+dt@kernel.org
Subject: Re: [PATCH v2 1/6] arm64: dts: qcom: talos-lyra-evk: Add LT9611UXD
 HDMI bridge support
Message-ID: <auSqIra143IynR6t@hu-anantiwa-hyd.qualcomm.com>
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
X-Proofpoint-GUID: g6z_sizOlR_e_sKx5jbMaQadRvnBEdmj
X-Authority-Analysis: v=2.4 cv=KLzPn1Fo c=1 sm=1 tr=0 ts=6ae4aa29 cx=c_pps
 a=RP+M6JBNLl+fLTcSJhASfg==:117 a=fChuTYTh2wq5r3m49p7fHw==:17
 a=8nJEP1OIZ-IA:10 a=660iZSQnnn4A:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=yOCtJkima9RkubShWh1s:22
 a=c92rfblmAAAA:8 a=EUspDBNiAAAA:8 a=VwQbUJbxAAAA:8 a=DfhYv1hxhrLySWN8tNYA:9
 a=3ZKOabzyN94A:10 a=wPNLvfGTeEIA:10 a=iS9zxrgQBfv6-_F4QbHw:22
 a=GvGzcOZaWPEFPQC_NcjD:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMDMwMDA1NyBTYWx0ZWRfX9bntxxArXhlo
 lMhuYSixLQDXvEamyQcJT7OTGWcV8bvmM4pnuou3Z4VATdYmzPAAayOkRRhbWjo4WIYtIJ7h5ZW
 RcCnhCeIlZ7V/MvkkoWM2KMgmgFhm0n1pmT6+k+uPGL3DdtccLuXLi49WlMVanMhyWFHA+A+GUY
 qRpvtVd60Qffq94oZM2gYstlJkTw0NSNprIJCGfZKDCazVJKrUsbJ7pZk0uuXcfg3NBc/euuUwG
 ty9uTMDEsPYvfFPLac9NHhRE3L+TxbIp7mLNm84Co3zBq9ky2aly2cAU0Ri6iLLUKbwdD3DsNla
 I+npFDp69KfIiKnC8qkmwWxw0KLEkDnSFAcZeiw8oNlrMO/1DaFh9ta4dS8BNRmxfqncrEMOX3E
 LmzAbXQOudFnBN9t+9LquOb3ybOzdxw6Xfc7hrD3+6l6b4FDqp+ZltIIQfr9AyEMxad9phqmP7F
 y8JTOSWvOX+bmikJruw==
X-Proofpoint-ORIG-GUID: g6z_sizOlR_e_sKx5jbMaQadRvnBEdmj
X-Proofpoint-Spam-Info: AW1haW4tMjYxMDMwMDA1NyBTYWx0ZWRfX4lCwR/zXN0jk
 AGw2MED+QRWkX3Ix4/rX5UPu+hjq+47FnPsmmvQoFDjJvM5G0lMJvR8tja+vLKlQ9Y44M8g/aeS
 QOpbdSBCgFJ3LWLTmxQeylYfvgBoRvs=
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-10-30_05,2026-10-21_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 phishscore=0 adultscore=0 spamscore=0 malwarescore=0 impostorscore=0
 clxscore=1015 bulkscore=0 lowpriorityscore=0 suspectscore=0
 priorityscore=1501 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2610190000
 definitions=main-2610300057

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
We will add this in next patch.
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
It will be in same tlmm we will handle this in next patch. 
> -- 
> Sashiko AI review · https://sashiko.dev/#/patchset/20261030-lyra-display-upstream-post-v2-0-906302159392@oss.qualcomm.com?part=1
