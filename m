Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D696237CD53
	for <sashiko-reviews@lists.linux.dev>; Thu, 14 May 2026 10:39:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778755169; cv=none; b=NAbvOiecNNU7zOXxLEX/8GT+9iKk+wXIdqSUGdaxmqJXWqldDM2QGmoyRZe5OzNLsXYmWjlTznTgEFFjvzXdDYGluwSCX79pug5P6rAAjmjK0wOWwSl2KezOSxIxalXQkGFoarnb7sO3FD6Gt4HB8OjBJvE8h8HcX4B8M7qbAmg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778755169; c=relaxed/simple;
	bh=Omgvvs/zzQ9beUPBnfdtG5GwqD6xIoLj/ECfPcQfM9o=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=Cy/ThQd0XiDbeYXTNdNmJouslyLaQNAU9Fv5213FPibgeSftZGZKeQm445tPdHvvagjmjMcYskgVFSc1lBGt/admEri4aIF6tzr8nKc+sbCZX8E1PnTfcCJNYYVqIgbk572BEN4qVGp5frQlMsUWjzH+MCtIQ06byigC92t4kx4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=Pq1eVv+u; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=YtR9zXnL; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="Pq1eVv+u";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="YtR9zXnL"
Received: from pps.filterd (m0279868.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 64E9kBqo2305203
	for <sashiko-reviews@lists.linux.dev>; Thu, 14 May 2026 10:39:26 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=HmrqwqjjLktBPLYsegl1QVtQ
	/F4OqiSh8CElUELezGs=; b=Pq1eVv+uYkACUxAAq+FertIp211pok452vSq7QUl
	8hLtR6SCbpl3dVk1J9ukfBjMUar/my6laEM2bQJ6a7ABCqk8WCKljC5sMWs93+P5
	4LBOx2iXIi8dh/8g1d6NoD49zo3qJ1NVOuiRIzzhbtPDcUbRo/Cpr9fvy6SKz1vW
	3fHbhP9On7dP1dCd9eRSsxuKZMKAh1PpDq9KiYJmyH2zWI2g8yf599k5s5VCUJv3
	8sRAa/IBCS2zBFcvEcq7DDP+VcLg8BqLDa2RHzMXsZeHsKXQnVxOsL5DiWui2+zU
	fJNRWKJyt8g9euXxI5ibrMXH96LvzLe55t9zX/0TtAPyEw==
Received: from mail-pf1-f199.google.com (mail-pf1-f199.google.com [209.85.210.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4e5b0brdt5-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <sashiko-reviews@lists.linux.dev>; Thu, 14 May 2026 10:39:26 +0000 (GMT)
Received: by mail-pf1-f199.google.com with SMTP id d2e1a72fcca58-82f6a5b4f88so9798998b3a.2
        for <sashiko-reviews@lists.linux.dev>; Thu, 14 May 2026 03:39:26 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1778755166; x=1779359966; darn=lists.linux.dev;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=HmrqwqjjLktBPLYsegl1QVtQ/F4OqiSh8CElUELezGs=;
        b=YtR9zXnL6VTJOY7rAMKxfngoj3Mqc+44bd67F0FDqNLyXDfwNatj0hSi46ssZOaS7H
         qaaEPlKibbhd+XVpzEu0mVK4iEZIGYOxcHh8gnnekfOgGDmb0UtKSFr0NspBnEdCm4/6
         5GjjrNSo9hpTRusRmXpUHUHtEGLFYVs+1lkovzE6fDAgtr53EYtInLvdxGhGX3reQA0u
         aROVrgX1LIXFFJVa4tsh9fcOsQ93+tG+3nB4+BhftsSC77HKFkeeP87mSjKa+2Pv0LAn
         /QBvTGb3b9J9zccj+RcO7G/Vuk4fm0gts/q1pGTB0cCEZi+1WhWrl1qRDpR3JC633Wqi
         SDpA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1778755166; x=1779359966;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=HmrqwqjjLktBPLYsegl1QVtQ/F4OqiSh8CElUELezGs=;
        b=AYPiSeMAVvX/e2MKulpBDJ8efzHbL0aGD4T6DDamj1tC7ovRbqwFsvEtJdzzwQYgQd
         GQuRulDStbWuZ2Rl2Iu90Q7LMpyfzs8F5VHU+Yk2b/1jZK/cvRckAaNfSO70OMTXK4g6
         4uImmhOrzdmIhScP3wEDI/fm7x1Hxq6WiioqY6mN0tXsuRL/4GdheP7gDiFq5tUdg42q
         ajAzGXgSpMt2YCZt/csAD5nmhB6yHVQYphgwUFDLczakPv81AYquk2Jjfnn2mAMOAi+X
         29KNyD41V2jdCS/AIRK2n0LUlwUBDYvz38JSRlT14k64mpCFh+bvPI7mS4v7nsL9UMuh
         Uj/A==
X-Forwarded-Encrypted: i=1; AFNElJ9vt6W6qbbVQOMz3+7M4FUSLLYIw70S7nP4j2NZwgMAawG+agJ7p5wvCbIvA/xjdJqPLW/QfD95IHnmQLAuNi0=@lists.linux.dev
X-Gm-Message-State: AOJu0YzR6kxAr4gtCxMGSTYiLiRUA9C7M3CWRK6+VGbbYcRv2yU/bHGS
	UfFuI/duidKw4yi8iys1L9dMqXJiLUA22DqVnAzkvXw11dwjSBKETNxioG4TKvq+yqjCIbYEWw3
	npqVRoXcAYZFK0PwWN0OpePOSHyZcbwiM7WmsOucQgyCTjmVWW9GOxkY2KpoSE0YnwPyTwZY=
X-Gm-Gg: Acq92OGwc9wjqah6y3aQ789YTKnPdYh8OY6dyQNYJKo9j2aqNqs/WO92qzMN0DEQKML
	x9LV/ciBG8vi4TP84v8ZiuV+3M4KuAFizDv161k81Nr68FcjFH3/OyZ1lBth5MNvtiL3inAIAVH
	hf1BCln8zoOrL6GLlTO2V951y8bJEvnS/iCve2HHtD1kcmryGZzILBpQWQcenxcaWkQXlNsOzo5
	6qShNJ74DqEN+9s0ULEiJmhkCwnR3+4VgDN6xQedezf+6PO1hyeLeJO28fD4rxVkCBuWa/zKgsw
	0JrTZMuDPt2PRHiMMCcXQa9oYae5jAcP4588+0i4JwMbe6srJccMCmSo1yYP/vwO2L4BgRa4Lcp
	bBeU2Fohc/j7EX8FZTVdzsspxe5XBM74vekj6sxy65xNCGVan8ho=
X-Received: by 2002:a05:6a00:1c9c:b0:81f:3fa0:8c38 with SMTP id d2e1a72fcca58-83f03fcc4a4mr7790278b3a.20.1778755165606;
        Thu, 14 May 2026 03:39:25 -0700 (PDT)
X-Received: by 2002:a05:6a00:1c9c:b0:81f:3fa0:8c38 with SMTP id d2e1a72fcca58-83f03fcc4a4mr7790238b3a.20.1778755165039;
        Thu, 14 May 2026 03:39:25 -0700 (PDT)
Received: from hu-kamalw-hyd.qualcomm.com ([202.46.22.19])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-83f19f61e5dsm2300851b3a.51.2026.05.14.03.39.20
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 14 May 2026 03:39:24 -0700 (PDT)
Date: Thu, 14 May 2026 16:09:18 +0530
From: Kamal Wadhwa <kamal.wadhwa@oss.qualcomm.com>
To: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
Cc: Rakesh Kota <rakesh.kota@oss.qualcomm.com>,
        linux-arm-msm <linux-arm-msm@vger.kernel.org>,
        sashiko-reviews@lists.linux.dev,
        Komal Bajaj <komal.bajaj@oss.qualcomm.com>, robh@kernel.org,
        linux-phy@lists.infradead.org, neil.armstrong@linaro.org,
        vkoul@kernel.org, olteanv@gmail.com, krzk+dt@kernel.org,
        conor+dt@kernel.org, devicetree@vger.kernel.org
Subject: Re: [PATCH 3/4] arm64: dts: qcom: Add Shikra CQM SoM platform
Message-ID: <20260514103918.cs5m5kcxcrcgukvx@hu-kamalw-hyd.qualcomm.com>
References: <20260512-shikra-dt-v1-3-716438330dd0@oss.qualcomm.com>
 <20260513042836.073F9C2BCB7@smtp.kernel.org>
 <t2sw6owdxy5iyodjqsldbw6bfaqnezhgvc4hhylxuyrrbjkjto@iwf4dr5nmot3>
 <20260513142936.kauwa3czigfs7qs5@hu-kotarake-hyd.qualcomm.com>
 <0ac665bb-1a21-4077-aa9e-97162f7f4784@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: sashiko-reviews@lists.linux.dev
List-Id: <sashiko-reviews.lists.linux.dev>
List-Subscribe: <mailto:sashiko-reviews+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:sashiko-reviews+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <0ac665bb-1a21-4077-aa9e-97162f7f4784@oss.qualcomm.com>
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNTE0MDEwNSBTYWx0ZWRfX2Lik4/Dsx+L5
 507m+eFmyS5oKB900jJ3N0HXPAKABsev7/JSeQOSu0X030P0U1lQru2Bu1N2vs6p39NS7pUexmI
 uay5GLom5Q7mjpVI48DerGY7aiwCyrNP2jeMlmI+/TwTKr/6ttfE+uc3MGaEUUsZbUV0PSQUb53
 U+nZi+P6s7QxF6eYCrUSR7hy2Oxv/lvet9ab6SvCfgT5/NOdpufWPCvEwBzBSj8Mw8aqTQBVAkZ
 +3AXVf9MJfiClp9XzWVvY/oUmqdHrbSHHG3hYFOjyM1VBIKXbb8N8+N9fUMYGw88ZrU3e5oUMxR
 Dz9DXZpLhBAFEV90+kjCHFNxzBxOSDg60xxLBwS1hG2KPb8iBbwolIeMRxvCoLWBZ9ag5cNI3f4
 kcgvPc5XNUJupswdwWA/1UhckRAmHcQ1C30SCfMAsehOVIf5Flp8r0yd0mCoaMVsWSf70YGfUlu
 NrWgO/5g9rOGeGc0mww==
X-Authority-Analysis: v=2.4 cv=b+2CJNGx c=1 sm=1 tr=0 ts=6a05a65e cx=c_pps
 a=WW5sKcV1LcKqjgzy2JUPuA==:117 a=fChuTYTh2wq5r3m49p7fHw==:17
 a=kj9zAlcOel0A:10 a=NGcC8JguVDcA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=ZpdpYltYx_vBUK5n70dp:22
 a=VwQbUJbxAAAA:8 a=EUspDBNiAAAA:8 a=CUircwOaNzYOuOtqVfUA:9 a=CjuIK1q_8ugA:10
 a=OpyuDcXvxspvyRM73sMx:22
X-Proofpoint-GUID: asIC8Qgh5QYE9p0z5TG_3NdMK2zdTgN8
X-Proofpoint-ORIG-GUID: asIC8Qgh5QYE9p0z5TG_3NdMK2zdTgN8
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-05-14_02,2026-05-13_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 spamscore=0 phishscore=0 adultscore=0 lowpriorityscore=0
 clxscore=1011 priorityscore=1501 suspectscore=0 impostorscore=0 bulkscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2605050000 definitions=main-2605140105

On Wed, May 13, 2026 at 06:14:20PM +0300, Dmitry Baryshkov wrote:
> On 13/05/2026 17:29, Rakesh Kota wrote:
> > On Wed, May 13, 2026 at 03:01:47PM +0300, Dmitry Baryshkov wrote:
> > > On Wed, May 13, 2026 at 04:28:35AM +0000, sashiko-bot@kernel.org wrote:
> > > > Thank you for your contribution! Sashiko AI review found 2 potential issue(s) to consider:
> > > > - [High] The PMIC regulator definitions omit their required input supply dependencies (e.g., `vdd_s2-supply`, `vdd_l3-supply`), breaking the power hierarchy.
> > > > - [Medium] The device tree inaccurately hardcodes the `compatible` string to a different PMIC model (`qcom,rpm-pm2250-regulators`) instead of explicitly identifying the actual hardware (PM4125).
> > > > --
> > > > 
> > > > commit 457abf6e7ac410430c866842e08e602ec3daaa51
> > > > Author: Komal Bajaj <komal.bajaj@oss.qualcomm.com>
> > > > 
> > > > arm64: dts: qcom: Add Shikra CQM SoM platform
> > > > 
> > > > Add device tree include for the CQM variant of the Shikra System-on-Module.
> > > > This variant integrates the Shikra SoC and PM4125 PMIC. The DTSI includes
> > > > the common shikra.dtsi and adds PM4125 PMIC regulator definitions.
> > > > 
> > > > > diff --git a/arch/arm64/boot/dts/qcom/shikra-cqm-som.dtsi b/arch/arm64/boot/dts/qcom/shikra-cqm-som.dtsi
> > > > > new file mode 100644
> > > > > index 0000000000000..401e71720519d
> > > > > --- /dev/null
> > > > > +++ b/arch/arm64/boot/dts/qcom/shikra-cqm-som.dtsi
> > > > [ ... ]
> > > > > +&rpm_requests {
> > > > > +	regulators {
> > > > > +		compatible = "qcom,rpm-pm2250-regulators";
> > > > 
> > > > Since the commit message indicates this is a PM4125 PMIC, should the
> > > > compatible string include a specific identifier for the actual hardware?
> > > > 
> > > > Using a specific identifier like "qcom,rpm-pm4125-regulators" alongside
> > > > the fallback allows the kernel to apply specific quirks if PM4125 errata
> > > > are discovered later.
> > > 
> > > This can be ignored. The compat is a leftover from the historically
> > > incorrect naming.
> > > 
> > > > 
> > > > > +
> > > > > +		pm4125_s2: s2 {
> > > > > +			regulator-min-microvolt = <1000000>;
> > > > > +			regulator-max-microvolt = <1200000>;
> > > > > +		};
> > > > 
> > > > Do these regulators need to explicitly define their input supply dependencies
> > > > such as vdd_s2-supply?
> > > > 
> > > > Without these properties, the regulator framework might be unaware that the
> > > > PMIC regulators draw power from upstream supplies.
> > > > 
> > > > If the kernel dynamically manages the upstream supply and its reference count
> > > > drops to zero, could it be disabled, causing an unexpected power loss for
> > > > downstream components?
> > > 
> > > And this is a correct comment. Please provide missing supplies.
> > > 
> > As per the Qualcomm system design, the parent-child supply relationship
> > is managed by the RPM firmware, not the Linux regulator framework. The
> > RPM ensures the parent supply is never disabled until all subsystem
> > votes are cleared.
> 
> How is this different from other, previous platforms?

This is not different. In the previous platforms too this is taken care from the
RPM/RPMH firmware side, the only case where we may need explicit vote to parent
is for non-rpmh/rpm regulator rails (like i2c based regulator pm8008), which
may have a RPM/RPMH regulator as a parent.

Even on those previous targets the parent rail of all RPM/RPMH regulators are
internally voted by RPM/RPMH FW at proper voltage with required headroom
calculated based on the active child rails. This was done for all the
subsystems (including APPS) regulators.

So no explicit handling from the APPS is required for parent supply.

> 
> -- 
> With best wishes
> Dmitry
