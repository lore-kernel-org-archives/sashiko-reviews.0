Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9D83333B6DC
	for <sashiko-reviews@lists.linux.dev>; Wed, 22 Jul 2026 06:16:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784700997; cv=none; b=tKpF2mJGZvgH5WoY8SciC/ZUVAzdJObyR6yCb8fqGFqif7zmatmQyM3+SND5ldkp6uh5vdlgIODXpndSJKa30+M8HqxYijtmW7mWdJZMc/je3E0YNbRKyc5RHxVLztDbVFKuA+3z68byPPVxXHiAGTCKS1g4846bQDIrU42Dy+g=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784700997; c=relaxed/simple;
	bh=2F8uL+lr/TvDZ6PebRzFyOpFLYORBeIAa6JHLuArtkA=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=fghu1y6Rbl29+i6RsXxkMiOahY2rCYT9Cp0VhVCtbKPzaRXew6Guun56ZMF9nh+qw6mhDgjPFusRso76mmLg7V3MxZqzIAP9TYl3zo7o+w76nXdNLzo30NGsUpTBKf1zcwvrDuq7LA4YYlsHUAS631HZcw400QOgvwIPu/6tc5Y=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=E+dZq3nM; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=BcpbcSfC; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="E+dZq3nM";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="BcpbcSfC"
Received: from pps.filterd (m0279870.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 66M53vT13996189
	for <sashiko-reviews@lists.linux.dev>; Wed, 22 Jul 2026 06:16:35 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	T/xSQQZylPlsd1bDeInrNUJPeUxq69DMttpsYNIVzXo=; b=E+dZq3nMzJIc+LyK
	I4Cnq/b0ZK8EW3GL5qmSzy3lZRCegMhIMp5n7ufhEdMOMjOfVv74bvDni0QrI2rW
	cBQMIiLZsArH1XzxtWfBXCrhDZUcjxKhJs7EPzmlduCHyUIA3AZMm+FGV06hZypA
	hy39djbCoZvyP9YQ3TztHzzheLHUdwiGMQcgI5Mv4pAzBnSV44L6tH4YuO1QASzP
	54f8tlbx1+thgC9Wio/ruwf2RY/1lzcocX2qJ4rji0WreAvDO+w7spT8++ki9OSS
	H39FuQw7+706cLHGozktXqDjtyMX2+1T6Ulu5ksfNP3O6DS8ZoKBBZgVjFC8F5hp
	KytOiw==
Received: from mail-qt1-f198.google.com (mail-qt1-f198.google.com [209.85.160.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4fjd6d2gm5-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <sashiko-reviews@lists.linux.dev>; Wed, 22 Jul 2026 06:16:35 +0000 (GMT)
Received: by mail-qt1-f198.google.com with SMTP id d75a77b69052e-522de3c645dso104343601cf.3
        for <sashiko-reviews@lists.linux.dev>; Tue, 21 Jul 2026 23:16:35 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1784700995; x=1785305795; darn=lists.linux.dev;
        h=content-transfer-encoding:content-type:in-reply-to:content-language
         :from:references:cc:to:subject:user-agent:mime-version:date
         :message-id:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=T/xSQQZylPlsd1bDeInrNUJPeUxq69DMttpsYNIVzXo=;
        b=BcpbcSfC8xH2SiL1qeT16YtTGWBeoRODuES9oSPLlsj1dOgFBteFd5f4u+VF8EB2sE
         TuQHU3Il7ctrvSPdS7t8At6wu/2TX1BmP3UtffEn4iz5iWVCRbqiK1TwyZvcogenySbM
         z+7eQ4mqSCFfFp3CTDICdZqDewm9aEdQwSeNSfwChSuj9AH2/Rt0Wfnm/wepcnZprPsU
         Upx75PWuCt4Sx9ZpT99tV1khVpOCQ/8XIPS2nJpKTqC6JsDeSewFyUiNJCPrUyZhsDo7
         m/2S12cZiCtjrHCwApbdykcOlwPrI5ayN2oCrOUjpAOqt6aY5fkQJ4L3WufY2PNGWiTR
         Mhsg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1784700995; x=1785305795;
        h=content-transfer-encoding:content-type:in-reply-to:content-language
         :from:references:cc:to:subject:user-agent:mime-version:date
         :message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=T/xSQQZylPlsd1bDeInrNUJPeUxq69DMttpsYNIVzXo=;
        b=JD1raMiSmbvlm1e0K+LyoGYDUGOiTjmV+b6RFHSsAHlmTkwa2iirXKf3tqhpMCcMz5
         wXnUmVEnwHWkEIlWHcMORTECfjvbg3W5iiEc1IEvbBTVlyCAxxv3zv4BWdaGhtonQLFi
         qJReZsbjHUf+2JxR9NAXpHtCv4i5iqa+cEZ3Rn0a6uvPqycDod+6CZTnp/7qOTZ6IZUU
         eS4WzeN96MLRkfm0No2e1YsQxLzCkpO0Oy2e5aItyo9NYk2AXlbMq2Q8DmRV9hKhsSik
         BGFP82emKxoVzpIRl9SYD8GbveT33Ffx5zYdCmxE672x4xGzcdvOiUakQW5My10mRVN6
         zlBg==
X-Gm-Message-State: AOJu0YytsM3iuR3eo8TBStzMDgFz3aev9A9emw6akueN5epaerQtD6mG
	m1yg0mACT4bstMwYQDwNCDvU03AiL7sVHLxWU/vBtmfHFBNbYvBSgwEtTQjlsTdhzWe+5c/DEdd
	g2IhZPMTytYk65UfiQpNljw5cDMupu7DNEaOkMKar8aAhsXrI2iameXJ5/SdsDaPQgcDggBnkH1
	huZNQ=
X-Gm-Gg: AR+sD12swmVNSNor3rcWJlgj7ubTTvX+FGyIBwedR0KotY1nWUhjdEqSnT0u1C1uaLX
	V6B34dP0icSsbEAXocML9nR3FmC0mMfQFvq4UVcV5wKpJ0VxEpx6TqPhZUPxf/ccz1bdTpVyT2N
	tXNgIu6KlOzJJefEXGhBmT6GpgmpAJgIqKXc0BhXYTQhQPAOYYZUrHBtWvXlISexqxfoe+riwq0
	pYs64jj9va/BuMYXwYXDgp0ywe23dTQfZDyEx2M3ADsjlRxgDC/UEv8F9uRlgvF+X3jpNrCHmVs
	r9Fp/JyWE0Z/1WXaimfxMT6O3SQsIXGSmIrLjp/MWlZcLPcoGyAbelgzIlZV5dxbXsy9BjOig8R
	l9spGsltSvZuCA18iw5KzyhF3fm72JQ==
X-Received: by 2002:ac8:5713:0:b0:51b:ef9c:573c with SMTP id d75a77b69052e-5213c7e5333mr217866021cf.50.1784700994761;
        Tue, 21 Jul 2026 23:16:34 -0700 (PDT)
X-Received: by 2002:ac8:5713:0:b0:51b:ef9c:573c with SMTP id d75a77b69052e-5213c7e5333mr217865781cf.50.1784700994321;
        Tue, 21 Jul 2026 23:16:34 -0700 (PDT)
Received: from [192.168.1.110] ([178.197.223.174])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4956a4aae16sm44397095e9.0.2026.07.21.23.16.33
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 21 Jul 2026 23:16:33 -0700 (PDT)
Message-ID: <3973cfc9-4fd5-4b42-8be8-b871b225ad91@oss.qualcomm.com>
Date: Wed, 22 Jul 2026 08:16:32 +0200
Precedence: bulk
X-Mailing-List: sashiko-reviews@lists.linux.dev
List-Id: <sashiko-reviews.lists.linux.dev>
List-Subscribe: <mailto:sashiko-reviews+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:sashiko-reviews+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3 3/4] dt-bindings: arm: qcom-soc: Validate nodes with
 fallbacks
To: sashiko-reviews@lists.linux.dev
Cc: conor+dt@kernel.org, devicetree@vger.kernel.org, robh@kernel.org
References: <20260721-dt-bindings-qcom-soc-naming-v3-0-8f275c9d3412@oss.qualcomm.com>
 <20260721-dt-bindings-qcom-soc-naming-v3-3-8f275c9d3412@oss.qualcomm.com>
 <20260721155830.741EC1F000E9@smtp.kernel.org>
From: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
Content-Language: en-US
In-Reply-To: <20260721155830.741EC1F000E9@smtp.kernel.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-GUID: MMADomUhQCJMA-sG-z4IA3VGxnh-kTim
X-Proofpoint-ORIG-GUID: MMADomUhQCJMA-sG-z4IA3VGxnh-kTim
X-Authority-Analysis: v=2.4 cv=XaG5Co55 c=1 sm=1 tr=0 ts=6a606043 cx=c_pps
 a=mPf7EqFMSY9/WdsSgAYMbA==:117 a=N6niishs+lR9UBL1FN3Qrw==:17
 a=IkcTkHD0fZMA:10 a=RAioF0-LDSMA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=gowsoOTTUOVcmtlkKump:22
 a=VwQbUJbxAAAA:8 a=EUspDBNiAAAA:8 a=tF9WG-mXdnh_oyKL0pEA:9 a=QEXdDO2ut3YA:10
 a=dawVfQjAaf238kedN5IG:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNzIyMDA1NSBTYWx0ZWRfX7ACt7gKVxSJ9
 IVLZl26U9lCLp6KGgWv+xUTvWZ/bKfTK9XMSCUe9R7ngz3bCfk0EVyRDMJ2NXLlY0nHUM1MNmeU
 5/F5ypJY9m+sLQmV++URMAWnuxl6bF+8DwfQtyyOS3xC7rDTNZiRLd64ksIzzNxQLCPDSnpLjWk
 loCbdM21NpmTwiHSPV9ufN/kvDPbKCmjcx4kcRNXrmXhVdEU6t2jHXrYwiW3fUT89v9BstxQzVI
 UiUXG3Shbuj/FlJFIuC11lvH7JAXBORRCAZ6iE4lgrn3M+2xfLnl0obGRXLUR5qCl/GPjWmnzfi
 /NGEZLBTNldrmkrHXnIiwZtBSsshL0e0MXu/p343zktLl+A5t3GqWVmZddWLXIpI2Bbq7nzO/fd
 H1sDPZOZ1+Q1OIKW7EMBBUekeLujFq79T9GacXa7Xc6o26HhfNYlvqHGlG6vIsFkM6vMfZKmYIZ
 gUORuUVsQRCOLWX3rrg==
X-Proofpoint-Spam-Info: AW1haW4tMjYwNzIyMDA1NSBTYWx0ZWRfX3TK8QShyZSNl
 nsi4LWj3OVoYMInazDxKDE5LnPbA4Edp09Dc3dlGYrs3iDzOaOGAXyk8fxJfQ3mQSHk7lcf+D/u
 0coDG8DbuEdLQ5IEBGlt8B+WXTWxwPQ=
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-07-22_02,2026-07-21_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 adultscore=0 priorityscore=1501 spamscore=0 lowpriorityscore=0 suspectscore=0
 bulkscore=0 impostorscore=0 clxscore=1015 malwarescore=0 phishscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2607220055

On 21/07/2026 17:58, sashiko-bot@kernel.org wrote:
> Thank you for your contribution! Sashiko AI review found 1 potential issue(s) to consider:
> - [Medium] The commit modifies a regex pattern despite the commit message explicitly claiming no patterns were changed.
> --
> 
> --- Patch [3]: [PATCH v3 3/4] dt-bindings: arm: qcom-soc: Validate nodes with fallbacks ---
> commit 5d9830a03b3532641c37f4db55bf3e194063f0c9
> Author: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
> 
> dt-bindings: arm: qcom-soc: Validate nodes with fallbacks
> 
> The schema checking for expected naming patterns for SoC IP block nodes
> was incomplete and was checking only nodes with single compatible. This
> commit changes select to contains so that nodes having at least one matching
> compatible will be evaluated.
> 
>>     These two above are the only functional changes in this commit and the
>>     rest of the diff is indentation change.  None of the patterns are
>>     changed (neither in "Preferred naming style" group nor in "Legacy
>>     namings"), none of the compatibles are affected.
> 
> [Severity: Medium]
> The commit message states that none of the patterns are changed, but the
> diff below shows the regex pattern for the codenames variant was modified to
> end with "-.+$" instead of "-.*$".

Good point. I forgot I changed that and then did not see it when
comparing the lines.



Best regards,
Krzysztof
