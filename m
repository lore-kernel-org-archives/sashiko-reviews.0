Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D0D2038B135;
	Thu,  2 Jul 2026 07:25:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1782977140; cv=none; b=cTI/v9Hf5oV6vr42YWKS/GzlAlbTVV5Iv79s7PARZwOK+dg52rlDeMshA1/TTwL9tLP+PnONdzQWnHE/QbRIvPHiR6zIQTBSOpIXvUrycGEkBCv8//7wG+mGeTRO98izcSrLBChkKL7rq7+6Q4o4abh2PNdl1zCzIry7rMxVUpU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1782977140; c=relaxed/simple;
	bh=0iiVKVZWDyomns5F+CK/MTgpBarFr0OL/0hjPk+/6E8=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=Ykpneu5nDPqpJAL6nguzzEuYEFh4dUX+0xXsXSdVQpz/zruvOYoDBgvrodkqw0FZNCsG4IB0G2cKkMxw3bSejh/w6T+nJ2gAz5ObozFKuOXy06ScP/8dvKy4lioBM+vR3DPQI8DOeGjCDa9XtdBN8Ti4CbPcwD9yyAIWVqs3uJs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=NT9EfwBM; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="NT9EfwBM"
Received: from pps.filterd (m0279873.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6621KF8p3009445;
	Thu, 2 Jul 2026 07:25:36 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=1KgI9KYgIHfDrgS6mLJj5Qx+
	J6n7/Xh9H91frP5TMXk=; b=NT9EfwBMIFsTkhUcTaoTrZaIh7Te9Kr00UpBhGkB
	OoSXklIbMbqYIgheYl4WfGLijZQBXkiSeW+mN0AqAoL2AnHS9iI0PRIyQjI02k0D
	DAmmS5RWg8hl9jtva6IGV6hcFNhOpdg/01jLQ7reOaxZ9vK3fLeCfoQwbZ4uhfAQ
	2r+2KZWWjj4KTTRIusvSVGprEFDstrOpVzReS1TtOT5dzNpL3LnPakFithPv+cQN
	nM5kdypDKwb59ckLVBZ/Z22M1zHlvWxsxyLQRJX2UzgRkVedQfaxy/3t8CeMCRHA
	Mm//NrPgXdeHfApDn3j8e/ur8fa1bIM9oWQ2rCMt6rByKA==
Received: from apblrppmta02.qualcomm.com (blr-bdr-fw-01_GlobalNAT_AllZones-Outside.qualcomm.com [103.229.18.19])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4f579rts50-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Thu, 02 Jul 2026 07:25:35 +0000 (GMT)
Received: from pps.filterd (APBLRPPMTA02.qualcomm.com [127.0.0.1])
	by APBLRPPMTA02.qualcomm.com (8.18.1.7/8.18.1.7) with ESMTP id 6627PWkl003794;
	Thu, 2 Jul 2026 07:25:32 GMT
Received: from pps.reinject (localhost [127.0.0.1])
	by APBLRPPMTA02.qualcomm.com (PPS) with ESMTPS id 4f27kknuc1-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Thu, 02 Jul 2026 07:25:32 +0000 (GMT)
Received: from APBLRPPMTA02.qualcomm.com (APBLRPPMTA02.qualcomm.com [127.0.0.1])
	by pps.reinject (8.18.1.12/8.18.1.12) with ESMTP id 6627PWNw003786;
	Thu, 2 Jul 2026 07:25:32 GMT
Received: from hu-devc-hyd-u22-c.qualcomm.com (hu-kotarake-hyd.qualcomm.com [10.213.97.140])
	by APBLRPPMTA02.qualcomm.com (PPS) with ESMTPS id 6627PWeS003785
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Thu, 02 Jul 2026 07:25:32 +0000 (GMT)
Received: by hu-devc-hyd-u22-c.qualcomm.com (Postfix, from userid 2389607)
	id 6B7D5B2B; Thu,  2 Jul 2026 12:55:31 +0530 (+0530)
Date: Thu, 2 Jul 2026 12:55:31 +0530
From: Rakesh Kota <rakesh.kota@oss.qualcomm.com>
To: sashiko-reviews@lists.linux.dev
Cc: conor+dt@kernel.org, robh@kernel.org, devicetree@vger.kernel.org,
        jishnu.prakash@oss.qualcomm.com, kamal.wadhwa@oss.qualcomm.com
Subject: Re: [PATCH v2 3/3] arm64: dts: qcom: Fix pm4125 vbus regulator
 compatible and constraints
Message-ID: <20260702072531.bs2242bgfcvpuyh7@hu-kotarake-hyd.qualcomm.com>
References: <20260701-add_pm4125-vbus-reg-v2-0-6bac2bac7131@oss.qualcomm.com>
 <20260701-add_pm4125-vbus-reg-v2-3-6bac2bac7131@oss.qualcomm.com>
 <20260701103457.73E251F00A3A@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: sashiko-reviews@lists.linux.dev
List-Id: <sashiko-reviews.lists.linux.dev>
List-Subscribe: <mailto:sashiko-reviews+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:sashiko-reviews+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260701103457.73E251F00A3A@smtp.kernel.org>
X-QCInternal: smtphost
X-QCInternal: smtphost
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNzAyMDA3NCBTYWx0ZWRfXwjL/P5oXaSNW
 TqTisV2CRtR0au+E9aj8OxPn4zMGAKL1O/JSn+rg6fdTgA70KSdAMPXVV4OvkAOwTq9Qgvf3e+m
 hH6vgcctYekBLwFd1k9eXYTzk0wPG1ANI11zqQ5FMB8f0prsvB9jCQBXPogqGmENzPG989zTQpp
 K4sGjXZraDLeXAbVDGWZmxHCu5XUmt25yx66t+55yvUJFrra/87PtEfy66UyfC8PbuW1lBl1dgm
 5co7Q8nzFe0Bb+6Ugu8Y+7qNczZSNg/fUeBgJ8Fu7wiFS2jBcBpiHcBJMdYq4UEQXKhmWO3jE24
 PWtzOYo1B9ccrl7w5Mk+TOBzl/2cjUamJgcMHDftBbiFP2ZWzd6mIDhzFkXUoXtVoNqYUzTbg5A
 ALcyKs2V/Z5XqoYsOfHlV4MxdpqVAVxf83nD1/NTia6ntU8NNJbquyhbgY4Mv3fZAVaLrw/uYqU
 u6zFVJUvl2kVddB6YAQ==
X-Authority-Analysis: v=2.4 cv=X8pi7mTe c=1 sm=1 tr=0 ts=6a46126f cx=c_pps
 a=Ou0eQOY4+eZoSc0qltEV5Q==:117 a=Ou0eQOY4+eZoSc0qltEV5Q==:17
 a=kj9zAlcOel0A:10 a=RAioF0-LDSMA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=rJkE3RaqiGZ5pbrm-msn:22 a=VwQbUJbxAAAA:8
 a=EUspDBNiAAAA:8 a=LV1d6kUfYfGFZ_KTQQsA:9 a=CjuIK1q_8ugA:10
X-Proofpoint-GUID: lu_KQoT83fvN7rQTuekGCn3jfE-n4rFK
X-Proofpoint-ORIG-GUID: lu_KQoT83fvN7rQTuekGCn3jfE-n4rFK
X-Proofpoint-Spam-Info: AW1haW4tMjYwNzAyMDA3NCBTYWx0ZWRfX6o5Ii8rnHl2h
 xhLaJnPu+cnRxFsjbYsPK/MWJ6TWkz8o+j4vWIwRJc9we/9cdSMxa9dzfwf0S3NvGiE1+NoNfrp
 GFHPDK/xoYaFbkyZIzOAEVVAEJpA8IQ=
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.125,FMLib:17.12.100.49
 definitions=2026-07-02_01,2026-06-26_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 clxscore=1015 priorityscore=1501 impostorscore=0 bulkscore=0
 lowpriorityscore=0 suspectscore=0 phishscore=0 malwarescore=0 adultscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2607020074

On Wed, Jul 01, 2026 at 10:34:56AM +0000, sashiko-bot@kernel.org wrote:
> Thank you for your contribution! Sashiko AI review found 1 potential issue(s) to consider:
> 
> Pre-existing issues:
> - [High] The `PM4125_VBOOST_CFG` macro is defined twice in the driver with different values, causing the voltage selector address to be shadowed by the OTG configuration address. This leads to register corruption when applying the new device tree constraints.
> --
> 
> commit ee5aeefd579f49a0fd9de6178216fb53f958a898
> Author: Rakesh Kota <rakesh.kota@oss.qualcomm.com>
> 
> arm64: dts: qcom: Fix pm4125 vbus regulator compatible and constraints
>     
> Remove pm8150b fallback compatible from pm4125_vbus and fix regulator
> constraints in qrb2210 DTS files to use microvolt instead of
> microamp.
> 
> > diff --git a/arch/arm64/boot/dts/qcom/qrb2210-arduino-imola.dts b/arch/arm64/boot/dts/qcom/qrb2210-arduino-imola.dts
> > --- a/arch/arm64/boot/dts/qcom/qrb2210-arduino-imola.dts
> > +++ b/arch/arm64/boot/dts/qcom/qrb2210-arduino-imola.dts
> [ ... ]
> > @@ -235,8 +235,8 @@ &mdss_dsi0_phy {
> >  };
> >  
> >  &pm4125_vbus {
> > -	regulator-min-microamp = <500000>;
> > -	regulator-max-microamp = <500000>;
> > +	regulator-min-microvolt = <4250000>;
> > +	regulator-max-microvolt = <5000000>;
> 
> [Severity: High]
> This is a pre-existing issue, but does adding these voltage constraints now
> trigger a hardware register corruption in the regulator driver?
> 
> Looking at the driver in drivers/regulator/qcom_usb_vbus-regulator.c,
> PM4125_VBOOST_CFG is defined twice with different values:
> 
> drivers/regulator/qcom_usb_vbus-regulator.c:
>     #define PM4125_VBOOST_CFG		0x52
>     #define PM4125_VBOOST_CFG_MASK		GENMASK(1, 0)
>     #define PM4125_VBOOST_CFG		0x56
> 
> Because of this shadowing, the pm4125_data struct initializes both .otg_cfg
> and .vsel_reg to 0x56:
>
> drivers/regulator/qcom_usb_vbus-regulator.c:
>     .otg_cfg = PM4125_VBOOST_CFG,
>     .otg_en_src_cfg = PM4125_OTG_EN_SRC_CFG,
>     .vsel_reg = PM4125_VBOOST_CFG,
> 
> With the new regulator-min-microvolt constraints added by this device tree
> change, the regulator core will now call .set_voltage_sel on this regulator.
> 
> Will this cause the driver to incorrectly write the voltage selector mask
> to the OTG config register at 0x56 instead of the intended voltage selector
> register at 0x52, thereby overwriting OTG configuration bits?
> 
Yes, you're correct, I will fix in the next patch by splitting the defines:

#define PM4125_VBOOST_OTG       0x50
#define PM4125_VBOOST_SEL       0x52
#define PM4125_VBOOST_CFG_MASK  GENMASK(1, 0)
#define PM4125_VBOOST_CFG       0x56

And updating pm4125_data to use PM4125_VBOOST_SEL for .vsel_reg so
.set_voltage_sel writes to the correct register.

regards
Rakesh Kota
