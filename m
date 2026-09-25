Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 844C41B3957
	for <sashiko-reviews@lists.linux.dev>; Fri, 25 Sep 2026 00:03:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790294629; cv=none; b=Hu7xutAAvrTIUounuaGGy5AV83OD1AOBTN9cYhhyx/IkTtHiIw/wESRr6+aFiyODbMNjrJzCTqP0vjygtHehVWZE2NgAnApmLfPPHHgsyRbpEupSRI3I3YZNXPVDSzbMYKU4JwN5AVQ2a9Q3wJxy9w9A1MkYcFALQopKxre+RGQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790294629; c=relaxed/simple;
	bh=smEO5ajkUjd/XE0Q0NvHBZW2RfBUnec6o1gpJNIoge0=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=dX3SrLU95lA1Chw1QEGzlJmmvHdcXPSkF17ZIXJ86FLUMBXkxu0V3LdvVfrbWcqNsoPaitLaP6P6GYZiv1EhCEWt2rkN3sHs6WNY6aF78XTJ7yhcpX11G0pdjzI/OFOrJ/ZMkFyiQ5TbUSaubml7LBmjM+NHo+71XIxHrNO9eGE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=ntgaicXv; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=WCqbYgmZ; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="ntgaicXv";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="WCqbYgmZ"
Received: from pps.filterd (m0279870.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 68OMP7823718220
	for <sashiko-reviews@lists.linux.dev>; Fri, 25 Sep 2026 00:03:46 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	H58DggwAYgasWPTqDpc+NXUeOTsA5g+ce6658T2WcyQ=; b=ntgaicXvjPhYL4n6
	qMgOWfjyLEiYTmV3eiqMJUfyDMu1v/ap5+JMIDrvPcsqAMvACUmEk1fPQV7KLR0z
	6liUr6WlTz+lrBgOGoRq7OmWO4BCuaqRysoTUJg2dP59gPytJcs3kx2/jh974v1F
	kShGODI3Xy0JVUAem1WpNVVfJNqhC/R1DcDqOdJIaHJaeNaxQkhAeOqyRCHFSdb3
	CXW/uraeyinRTqFdLFt6qPoRxzfKfJA7IKfMFI041x0J+s0/kfN1oZ6M70CU/Ls1
	HOrYAQ46y7ZI+YjZkCRl2k7EjmwD1uVljR0X1uBIhBHoc2HABrnwogN9pkeedX88
	qqXrEw==
Received: from mail-dy1-f199.google.com (mail-dy1-f199.google.com [74.125.82.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4gw881sarp-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <sashiko-reviews@lists.linux.dev>; Fri, 25 Sep 2026 00:03:45 +0000 (GMT)
Received: by mail-dy1-f199.google.com with SMTP id 5a478bee46e88-32b8c2b30c4so509928eec.1
        for <sashiko-reviews@lists.linux.dev>; Thu, 24 Sep 2026 17:03:45 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1790294625; x=1790899425; darn=lists.linux.dev;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :content-type:mime-version:references:message-id:subject:cc:to:from
         :date:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=H58DggwAYgasWPTqDpc+NXUeOTsA5g+ce6658T2WcyQ=;
        b=WCqbYgmZbDktynX8DWlp1gq8We/OdR9IRFqyWfPzYCo/6pmsBWiiwe0rLHwIN16Tby
         4PuIunC7rd61uUxjMFtCBvPqkL/429h5Vb8EBzdduB/jdmLfgKaVJumaM5GIDyQCgcf4
         9nsfrc+cswpfiTPV5njudx1xyObYw9Fr9ipeJxzqto+IobtXFQSUdKvZAzbcnLleeZ1+
         Zlng4XsCHe2/unOIAl976pi9FyOLd/eWJRA0zba6uu1lzV5zKMnKl9pFiXvkPJAifN5J
         mnVdjWdKlf384Q4lfdHU1/vzCKyVN5P/UHMyAay18U0J7LH0e/bh65sx8ObUYskMG1xt
         MQNg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790294625; x=1790899425;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :content-type:mime-version:references:message-id:subject:cc:to:from
         :date:x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=H58DggwAYgasWPTqDpc+NXUeOTsA5g+ce6658T2WcyQ=;
        b=FogOtR+gEE3C1LNaOBJ6nSdFNdTKpweUQsdSEq/EM+ygGic1ePzpFsAuheU64O+n0J
         jKz+PTF0S/dbEqNJDIqBIXliJ6ncmxhoGmTADadRwLv2+Oeeb5Vsr43VL1/w1goCd6nq
         IFjVdlpQXnUn0+d2MYVUE4UR2ljxCkUA7Gk1sRxhOJiri5mSlODq158iGf3Wzs9YGeb6
         7PyDiROLPzYXufh1UTChzaHNuj0m7ETJb2AhDWPuLpggHMivw32vzefenGmQ7n3Q5OxL
         GgHYHyI5F8AvXkLXhj0eT/1u0VAeulX1J/gIGGWWXTls1o+wumUIsH+OWdaIT1apZYPk
         6/8A==
X-Gm-Message-State: AFuF++k0aV5njBqjeu3Kmlgt7YlG/q2E3cDshgU5KJ2b+CvNK8TvXvHI
	brQ7hdnJulPFOHD3zdesGwcKS+RViRpidAXd3A23CMyvDxAE9ebT/I5tLtlM5wCf8IwHe7wjxYG
	45CSJx9zo3UAd7UyW+6TU7fjyuog2xNuBQXiF3iooOTCMhXQyMTF/6ZCQCHCDMMxky2QltJpscC
	zDvL88nQ==
X-Gm-Gg: AYBFou3r6UbMJHebIrMSypoE/ZceJ9x9qZnK5j4rGVUD65IYnCkapIenW81ynCP/h5F
	bPmcZyzwd3/EgIdfngFJlTRXRRcJkiO1XV7zDw0uDnW7wY4sEf0g+GEyWxoEGx4jMWSs6x8qDAW
	vz2uaTIVXKfOfg5iKoSlhQagcVwSi/h3Tv/ubjZEnskJZl6OZ1wIx27TNjOqdXCk758D22ZfcES
	0jgZmMFyRijmHL7lPwogOMi0uZLi9FcWDhAW4gDMKWzBUCpflDABM80rAXROTblHCpCC7e37Qyd
	Zh8driRXYjH8D0oEa7M0PuiePPHvT7AsPh2b/TJs36e7F7gyFV/CXQuBzD53oAMNj3gSe/tZDEk
	S0rEwjATmu0xIR/HnLp4tUhrMvP3dRskY/euDzw3AgQ==
X-Received: by 2002:a05:7300:1c94:b0:33b:fae9:fc37 with SMTP id 5a478bee46e88-340043a2f7fmr3392708eec.5.1790294624772;
        Thu, 24 Sep 2026 17:03:44 -0700 (PDT)
X-Received: by 2002:a05:7300:1c94:b0:33b:fae9:fc37 with SMTP id 5a478bee46e88-340043a2f7fmr3392683eec.5.1790294623875;
        Thu, 24 Sep 2026 17:03:43 -0700 (PDT)
Received: from QCOM-aGQu4IUr3Y (i-global052.qualcomm.com. [199.106.103.52])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-3414407c548sm1779043eec.8.2026.09.24.17.03.41
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 24 Sep 2026 17:03:43 -0700 (PDT)
Date: Fri, 25 Sep 2026 08:03:39 +0800
From: Shawn Guo <shengchao.guo@oss.qualcomm.com>
To: sashiko-reviews@lists.linux.dev
Cc: linux-clk@vger.kernel.org, conor+dt@kernel.org, robh@kernel.org,
        devicetree@vger.kernel.org
Subject: Re: [PATCH 1/3] dt-bindings: clock: qcom,sm8450-videocc: Fix clock
 inputs for Glymur
Message-ID: <arW6W_2Azq0GLF9P@QCOM-aGQu4IUr3Y>
References: <20260924161152.1162301-1-shengchao.guo@oss.qualcomm.com>
 <20260924161152.1162301-2-shengchao.guo@oss.qualcomm.com>
 <20260924162500.C92FC1F000FF@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: sashiko-reviews@lists.linux.dev
List-Id: <sashiko-reviews.lists.linux.dev>
List-Subscribe: <mailto:sashiko-reviews+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:sashiko-reviews+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20260924162500.C92FC1F000FF@smtp.kernel.org>
X-Authority-Analysis: v=2.4 cv=TptzFzXh c=1 sm=1 tr=0 ts=6ab5ba61 cx=c_pps
 a=cFYjgdjTJScbgFmBucgdfQ==:117 a=b9+bayejhc3NMeqCNyeLQQ==:17
 a=8nJEP1OIZ-IA:10 a=VdqzKS8jKosA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=gowsoOTTUOVcmtlkKump:22
 a=c92rfblmAAAA:8 a=EUspDBNiAAAA:8 a=VwQbUJbxAAAA:8 a=zgFx8tfR_8MVfJF-GFEA:9
 a=3ZKOabzyN94A:10 a=wPNLvfGTeEIA:10 a=scEy_gLbYbu1JhEsrz4S:22
 a=GvGzcOZaWPEFPQC_NcjD:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwOTI0MDA5NyBTYWx0ZWRfX61XN8zyDDiPQ
 cA6+8rSy+nhggJleooDun7j82inpwNkicw2I7k+zlMMfr2tY6J+X8HS7c4k9oopTnP3YAJjh5mK
 N89OwP8GnKuUmIouIxynTz+1Q9Dj9CNslzHWG1bbYTUjWrDykXHmVrpObCsShJgM6gSdyZO1a6j
 41AubecZbkS0oH8IjGrucrUBAVQjLaN1usUR0eEuV858YS/ju2EYqCfc7+mfqUFPnNIVqy68vxn
 h1jQWuhG1j0PT9zbhgM7dsHu0zJAAEI+W9G87gJcW752bE2E+yvnc5Q5YjSdrRPV6OmXoVOhUmB
 F1+w8MiqUSXQ79MyvV1dNFtWRQTdinl5OYZSK71Wab3s0v7QyxiowXd9Tia/3Ygu7E2HdFzgnd9
 D+HKGLuW/1yWY0mqN5WpPN8FAGynD6IkmjGAwUMrslQgK/byCUREAqRu2HaavJ559GAO60HM4ZH
 HbXOhR6wmhoPD0fEBuQ==
X-Proofpoint-ORIG-GUID: H_ipy82QhVPFX4GTzT3hDvrs1GRb7JqF
X-Proofpoint-Spam-Info: AW1haW4tMjYwOTI0MDA5NyBTYWx0ZWRfX0B2cIlZ3KM42
 FHtW3AJKnc9gXu/KM8ukK6ynlbnGBImvBSHE3P5qohmKnf3Wat8Qlv3RdvaRPIll8rLykXQexYl
 zTFahVjJZqLaOTX3QNNaxVdFFthG8MQ=
X-Proofpoint-GUID: H_ipy82QhVPFX4GTzT3hDvrs1GRb7JqF
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-09-24_06,2026-09-21_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 phishscore=0 clxscore=1011 priorityscore=1501 impostorscore=0
 malwarescore=0 suspectscore=0 lowpriorityscore=0 adultscore=0 bulkscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2609040000 definitions=main-2609240097

On Thu, Sep 24, 2026 at 04:25:00PM +0000, sashiko-bot@kernel.org wrote:
> Thank you for your contribution! Sashiko AI review found 1 potential issue(s) to consider:
> - [Medium] dt-bindings: hallucinated qcom,nord-videocc omitted from top-level enum
> --
> 
> commit 0ca2f034154349c48cdd7a693b1d8282d6886964
> Author: Shawn Guo <shengchao.guo@oss.qualcomm.com>
> 
> dt-bindings: clock: qcom,sm8450-videocc: Fix clock inputs for Glymur
> 
> The commit updates the clock inputs for the Glymur, Nord, and SM8750
> variants in the bindings from exactly two items to up to three items. This
> change allows device trees to supply the sleep clock input required by
> these drivers, resolving an issue where it would register as an orphan
> clock.
> 
> > diff --git a/Documentation/devicetree/bindings/clock/qcom,sm8450-videocc.yaml b/Documentation/devicetree/bindings/clock/qcom,sm8450-videocc.yaml
> > index 910c6d5672b86..dc01c37dcd0e3 100644
> > --- a/Documentation/devicetree/bindings/clock/qcom,sm8450-videocc.yaml
> > +++ b/Documentation/devicetree/bindings/clock/qcom,sm8450-videocc.yaml
> 
> [ ... ]
> 
> > @@ -77,6 +76,27 @@ allOf:
> >      then:
> >        required:
> >          - required-opps
> > +  - if:
> > +      properties:
> > +        compatible:
> > +          contains:
> > +            enum:
> > +              - qcom,glymur-videocc
> > +              - qcom,nord-videocc
> 
> [Severity: Medium]
> Is qcom,nord-videocc missing from the top-level properties/compatible enum
> list? When a compatible string is introduced in the allOf/if conditional
> logic but omitted from the top-level enum list (under unevaluatedProperties:
> false), any device tree node using it will unconditionally fail validation.
> 
> Additionally, the commit message mentions that videocc-glymur.c handles
> qcom,nord-videocc, but this identifier does not appear to exist anywhere in
> the kernel tree. Could this compatible string be an LLM hallucination?

The series is based on linux-next, wehre qcom,nord-videocc has landed.

Shawn

> 
> > +              - qcom,sm8750-videocc
> > +    then:
> > +      properties:
> > +        clocks:
> > +          items:
> > +            - description: Board XO source
> > +            - description: Board always-on XO source
> > +            - description: Sleep clock source
> > +    else:
> > +      properties:
> > +        clocks:
> > +          items:
> > +            - description: Board XO source
> > +            - description: Video AHB clock from GCC
> >  
> >  unevaluatedProperties: false
> >
> 
> -- 
> Sashiko AI review · https://sashiko.dev/#/patchset/20260924161152.1162301-1-shengchao.guo@oss.qualcomm.com?part=1
