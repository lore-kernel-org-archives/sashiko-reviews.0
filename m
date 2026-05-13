Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 21CAE3FE374
	for <sashiko-reviews@lists.linux.dev>; Wed, 13 May 2026 12:01:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778673715; cv=none; b=NGAIske4RqgJCa2tVGgrW1fn8gFSMtKMySUHQQinJReYm3Vw+U2pPrVaxFBLnMCIFC6XAJdaWivmAxyoT/00eg80GeZGdWUY7sft2iNcOd0dIof2kHbHOVHmsbcch79gop2cemr/zax2/HI1Ic5AYbFdbeBpPls4bMpZuzfNluw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778673715; c=relaxed/simple;
	bh=l7r4NlK8GxrngcUyxh3lBxyq7gyU1/f8+FQ5izPScLs=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=WkvtRCAuRAsYqPY/fmKURzOtGDpvDeR5AIF8LjfKfplW75O1KwNB7lAWsn2fddF8nydlZHB3ik5YVQ2NaEYibYi77IuESurEODiST8DO94aOkEss6XZXgxwoF5S/3378OlU3XyP7jb1/X82+jbcMtLHBPg0sBuNLgfjDLvTh82Y=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=aE+MQUZL; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=hAiJNaXe; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="aE+MQUZL";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="hAiJNaXe"
Received: from pps.filterd (m0279873.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 64D9jkDh3007701
	for <sashiko-reviews@lists.linux.dev>; Wed, 13 May 2026 12:01:53 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	dY9hc/f+wkbZ17ghb1zJTtuvuVvCHXDi0+lDIqQHkRE=; b=aE+MQUZLedjmQBPB
	2BqLbPF6GSyByNBJxAaUbm1GE1qS5HXaBSw91lS2ITm6Z3T8RnnJ0kM00Q863Mb3
	uA1nRsnUADS2ZtGAEwAGZ0eff/lYSrg6hBUu3A30R0sy1lPWpUarou2TbM2VbJgZ
	IkhTivRoAwQJiV581iETaWS1IUkcgofOPlltGBVNN7Ctg+S68TPUv8gSEUJXVcWW
	E1z5xHH+lonY8b2PQX2nyG61R+q9CDZ2zDetrmcLfb+j98fmg7iPCvVGF88r7AUX
	Qh4p1JwFsH3DNlQYFjPyH0QAZqAhYx+6Nor/o6nQoIldsGrtk18xnaAr65Uhq9jb
	kllIDw==
Received: from mail-ot1-f69.google.com (mail-ot1-f69.google.com [209.85.210.69])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4e4py0gfbs-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <sashiko-reviews@lists.linux.dev>; Wed, 13 May 2026 12:01:52 +0000 (GMT)
Received: by mail-ot1-f69.google.com with SMTP id 46e09a7af769-7dbd50dee52so15186128a34.2
        for <sashiko-reviews@lists.linux.dev>; Wed, 13 May 2026 05:01:52 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1778673712; x=1779278512; darn=lists.linux.dev;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date:from:to
         :cc:subject:date:message-id:reply-to;
        bh=dY9hc/f+wkbZ17ghb1zJTtuvuVvCHXDi0+lDIqQHkRE=;
        b=hAiJNaXeAVohNPWhqA/6xBL3eKZsxV/tPKIvZEKBWFfy00PkEfeJ0qI+l7dDFZNGX3
         JqOGe+vyCAK82qZe26amRxa3Vsiiup2XkyDqE6mPwRRWU9xarccPE0PAqBY977JBbVeb
         818gegCnJyoR0EiX2RTgpRx80R38VMLLXoo0j7AJIT47RAl08LiBKuy75gh7/obJ3EsP
         xgMJcl5wLqLnX6KCFXI9XU5jE3r4nwTJTboqC9S/HwA39VNPHEueGHbwTdZ2geLReyp9
         Aex4WDLo9TDPLddDNVstbbhSyq5hBSvHVPtMBjKH7h9XwLTx0KBK87pM7ZZlCVRRgHyb
         6s0Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1778673712; x=1779278512;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=dY9hc/f+wkbZ17ghb1zJTtuvuVvCHXDi0+lDIqQHkRE=;
        b=EqIo/kZ9K+0R/f0hRkjrxNDFMYVfRi/6BqGRjB5pfJDl+EjMFo7giIs/S30e2GPswY
         YB2vn5K4GSmT9AO+Z2byjMjoKt60CKWbTIT/zODIKERpKW13KTGn3KpmMzbJbpSPf7B9
         hdJT/6WweYTQwg9stosgXTeUeoc/W/AWh3EEQNgJm1vnKrqULib/vPEl1sOkr8bc0nLs
         sAdWRhihttOckYL3kaHtkRRrMNakSBjw5eT98F+GlY6EvmhsrCGc3aKHRWox4EPZMX7A
         jdlpW36uYhZlm41nAQ+IhQA2nfGV/muspI66KyStVuNuVM8ySFCbtRKp3SbsvnSuLVLy
         +I3w==
X-Gm-Message-State: AOJu0YyiL2I8aaFr9pMARTMo46Ohi/ud+QJ7m7SKO2NoP/+iSMZ5OexT
	UsbqVKXwb44hiaeydzhyTuyT7Yc6PtfQGxm4gJhaZD8/lE5bhWawco83D66nviDn/9FNfhwjas8
	7zshpdOWmw83tv0jStokqQn4W1MPimdrWz0xIU3Y1GvRBnuQlbirpSXktIj603BuZmL7UpA9WLB
	m1o94=
X-Gm-Gg: Acq92OGnLOx9zy/HKszG2i7jBbm2F1ac8gNX5j7ARQ0wa605dyv9JPG8WRr1uhWRdej
	Uvt/yP7Bni/K9TroIdNL2I+0B6xrjOdT6x6aW5/1S5DmqNrM0N3GN12foHRPbmak2spkP9kdxZK
	ajAx9LNjux2r0gij9L9EX8228N9/AHfRNHYmTf3x4a2keZV6PsCtCIDlDL9uGi7ZU7lZtQ8RS2X
	o0lW+Xbq0SU3GV8NeVLi+O+Yf/8ogPhI6Mve/KSTP8DDrnj8t/8lYSdHnnGT0nqLdUKWD1kslP3
	BW3eNXBtO0DoAWw+9D3IWUKYFZ/yelUvc6/3IHe8/HQDIxW5XpVIkVi7y5A58AyVxGmhotI2JFI
	OdxrPADMRIgmcbv9XhVsbyg3R0pBTT7JTTcOrDgVAHbKF1JVeGKH2iIGojlaI8o4A+HYe1Fep25
	pepDlNW6fuBColSfyQEX7Q7Pgd4hd8q9ifpBg=
X-Received: by 2002:a05:6830:4998:b0:7dc:3d7e:40d8 with SMTP id 46e09a7af769-7e3da8411cbmr1739044a34.28.1778673711227;
        Wed, 13 May 2026 05:01:51 -0700 (PDT)
X-Received: by 2002:a05:6830:4998:b0:7dc:3d7e:40d8 with SMTP id 46e09a7af769-7e3da8411cbmr1738996a34.28.1778673710670;
        Wed, 13 May 2026 05:01:50 -0700 (PDT)
Received: from umbar.lan (2001-14ba-a073-af00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a073:af00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-5a8a951cfb4sm4026836e87.20.2026.05.13.05.01.48
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 13 May 2026 05:01:49 -0700 (PDT)
Date: Wed, 13 May 2026 15:01:47 +0300
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
To: sashiko-reviews@lists.linux.dev
Cc: Komal Bajaj <komal.bajaj@oss.qualcomm.com>, robh@kernel.org,
        linux-phy@lists.infradead.org, neil.armstrong@linaro.org,
        vkoul@kernel.org, olteanv@gmail.com, krzk+dt@kernel.org,
        conor+dt@kernel.org, devicetree@vger.kernel.org
Subject: Re: [PATCH 3/4] arm64: dts: qcom: Add Shikra CQM SoM platform
Message-ID: <t2sw6owdxy5iyodjqsldbw6bfaqnezhgvc4hhylxuyrrbjkjto@iwf4dr5nmot3>
References: <20260512-shikra-dt-v1-3-716438330dd0@oss.qualcomm.com>
 <20260513042836.073F9C2BCB7@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: sashiko-reviews@lists.linux.dev
List-Id: <sashiko-reviews.lists.linux.dev>
List-Subscribe: <mailto:sashiko-reviews+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:sashiko-reviews+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20260513042836.073F9C2BCB7@smtp.kernel.org>
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNTEzMDEyNSBTYWx0ZWRfX+jn4Si/zwclY
 7hfx/VviZFOk6fiPlNMNyPXLR0lewJ/4pyAt8W/Bvj0oGn9Yhn0ULDBRUaBIgIyhQhwvlZs2wfc
 f8ETG29RyLafKm7JeRp5Qv9bpd3QwpgPzGubIbBfC7n4KJWyilw5AFX0974kHy/YKPY5Gdqj6Ah
 dHMLQbu2Yibspji070IqfcojPQ9WMVu03UdaNMMz3Tv7FvVY0HC6j8OyDcv2gjgo76f1zghs2/o
 2p3p6cdGUfG67F16irJhz+jle6UvVxSTmfxCvCEYRaWhvaggdgrVDyfwh/cykhgtVnE7sP1xWvH
 Yy6nNvNIz9lJDeD2Y9nqEhqIzY17Wb8fue0Dg88GF+Mg6cKddJ171aA0/gGkFAl1k2ux5Ohgiot
 zNoC826Tyjnz6yUtAGrjTnA/rnlSYbjrUwRDar9ja0GLnUNKUK6aCTM4BIC2jpkfkBBw10/hFtQ
 vN8PHJEEyQzXQFKsdDQ==
X-Authority-Analysis: v=2.4 cv=XqXK/1F9 c=1 sm=1 tr=0 ts=6a046830 cx=c_pps
 a=z9lCQkyTxNhZyzAvolXo/A==:117 a=xqWC_Br6kY4A:10 a=8nJEP1OIZ-IA:10
 a=NGcC8JguVDcA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=rJkE3RaqiGZ5pbrm-msn:22 a=c92rfblmAAAA:8
 a=EUspDBNiAAAA:8 a=VwQbUJbxAAAA:8 a=5d6JBiFWPPR-1DGLDXwA:9 a=3ZKOabzyN94A:10
 a=wPNLvfGTeEIA:10 a=EyFUmsFV_t8cxB2kMr4A:22 a=GvGzcOZaWPEFPQC_NcjD:22
X-Proofpoint-ORIG-GUID: MZO8K_HDpvHM8hXXZy_k-oz0Vulbsi90
X-Proofpoint-GUID: MZO8K_HDpvHM8hXXZy_k-oz0Vulbsi90
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-05-13_01,2026-05-08_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 spamscore=0 phishscore=0 bulkscore=0 impostorscore=0
 lowpriorityscore=0 malwarescore=0 adultscore=0 clxscore=1011 suspectscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2605050000 definitions=main-2605130125

On Wed, May 13, 2026 at 04:28:35AM +0000, sashiko-bot@kernel.org wrote:
> Thank you for your contribution! Sashiko AI review found 2 potential issue(s) to consider:
> - [High] The PMIC regulator definitions omit their required input supply dependencies (e.g., `vdd_s2-supply`, `vdd_l3-supply`), breaking the power hierarchy.
> - [Medium] The device tree inaccurately hardcodes the `compatible` string to a different PMIC model (`qcom,rpm-pm2250-regulators`) instead of explicitly identifying the actual hardware (PM4125).
> --
> 
> commit 457abf6e7ac410430c866842e08e602ec3daaa51
> Author: Komal Bajaj <komal.bajaj@oss.qualcomm.com>
> 
> arm64: dts: qcom: Add Shikra CQM SoM platform
> 
> Add device tree include for the CQM variant of the Shikra System-on-Module.
> This variant integrates the Shikra SoC and PM4125 PMIC. The DTSI includes
> the common shikra.dtsi and adds PM4125 PMIC regulator definitions.
> 
> > diff --git a/arch/arm64/boot/dts/qcom/shikra-cqm-som.dtsi b/arch/arm64/boot/dts/qcom/shikra-cqm-som.dtsi
> > new file mode 100644
> > index 0000000000000..401e71720519d
> > --- /dev/null
> > +++ b/arch/arm64/boot/dts/qcom/shikra-cqm-som.dtsi
> [ ... ]
> > +&rpm_requests {
> > +	regulators {
> > +		compatible = "qcom,rpm-pm2250-regulators";
> 
> Since the commit message indicates this is a PM4125 PMIC, should the
> compatible string include a specific identifier for the actual hardware?
> 
> Using a specific identifier like "qcom,rpm-pm4125-regulators" alongside
> the fallback allows the kernel to apply specific quirks if PM4125 errata
> are discovered later.

This can be ignored. The compat is a leftover from the historically
incorrect naming.

> 
> > +
> > +		pm4125_s2: s2 {
> > +			regulator-min-microvolt = <1000000>;
> > +			regulator-max-microvolt = <1200000>;
> > +		};
> 
> Do these regulators need to explicitly define their input supply dependencies
> such as vdd_s2-supply?
> 
> Without these properties, the regulator framework might be unaware that the
> PMIC regulators draw power from upstream supplies.
> 
> If the kernel dynamically manages the upstream supply and its reference count
> drops to zero, could it be disabled, causing an unexpected power loss for
> downstream components?

And this is a correct comment. Please provide missing supplies.

> 
> [ ... ]
> 
> -- 
> Sashiko AI review · https://sashiko.dev/#/patchset/20260512-shikra-dt-v1-0-716438330dd0@oss.qualcomm.com?part=3

-- 
With best wishes
Dmitry
