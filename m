Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4B31E4DB575
	for <sashiko-reviews@lists.linux.dev>; Thu,  9 Jul 2026 17:38:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783618740; cv=none; b=F78VKXIdHgNZs/feLTvnTeyO1f8opE7En5MH9VCxU+5JqHTICW83FQXjaJYnbijH0mva3F0oA4VxLG+mVLq339nWIJepPrk0/cT838keoBBKgVo9PwQYzMtEJe7rIppZlzlAjDCN3wVM7GlHx/Uk+Vk0Ro0RHoxilit4D/y6dS8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783618740; c=relaxed/simple;
	bh=poQEktvQ8sK43PpTgwOxeKI8wVy+YV2bLxGSwCH7GHE=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=SK8+YOSTLNVpq5HpDVRHNZCpRbRaVzeHhdyNtVWX8fI/i3RY0qA+x9LVMJBCNsI5PlxS/g2UItRc6bdLILAwsijseZMf3MMi14wjk4fJwhrHz8Sogd5fuMsGz52VEtxAaxeUR2Y3GXk/1ZvPfYRqfyJTGSRVWRXDJlC9cvvEHhQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=ftqehzNw; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=JnrM6UdL; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="ftqehzNw";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="JnrM6UdL"
Received: from pps.filterd (m0279867.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 669HWv6Y2502425
	for <sashiko-reviews@lists.linux.dev>; Thu, 9 Jul 2026 17:38:58 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	poQEktvQ8sK43PpTgwOxeKI8wVy+YV2bLxGSwCH7GHE=; b=ftqehzNwDrLobhv4
	vCTM4xJnygj/lDxiYk6CGUqJFud2/Dsfcjt9uoRhyHSDTky8/QuAgfbfHiQdojST
	ScNAY6h7BxkoFEFIdTefGMsTqkhR2TQHxaOUQs1HX3/xcW+P1TTgDBtA4PevIaWL
	xzZ/9SvvSuMJnMZnMv8PEgJuu+q0/laSifSpleWT2wX5y/JdjEBCLevR0r3mMnGz
	eU5YvEj5+bk+eJef7tJxYUc/ERFqi68gimbLRyJUrhxodvuXyY7+XvX6viTUuWuf
	Of9folAN3n/b72YL4fO06hIiEJzFbs3eoYx1TpzJsPncr3Vhf25JJtfgByXqS6pK
	dsXn2w==
Received: from mail-qt1-f198.google.com (mail-qt1-f198.google.com [209.85.160.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4fa6p3u3d2-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <sashiko-reviews@lists.linux.dev>; Thu, 09 Jul 2026 17:38:58 +0000 (GMT)
Received: by mail-qt1-f198.google.com with SMTP id d75a77b69052e-51c1ada6c43so347641cf.3
        for <sashiko-reviews@lists.linux.dev>; Thu, 09 Jul 2026 10:38:58 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1783618737; x=1784223537; darn=lists.linux.dev;
        h=content-transfer-encoding:content-type:in-reply-to:content-language
         :from:references:cc:to:subject:user-agent:mime-version:date
         :message-id:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=poQEktvQ8sK43PpTgwOxeKI8wVy+YV2bLxGSwCH7GHE=;
        b=JnrM6UdLSF3UNEqvqdZBPB6obnRBQXl3Kj5RbVdWovJdEWJRgdu8zACxB5V82pC0Vj
         JFwuC5E9SsYGhCqtXYmgRWBeF28TNL96mjBznDvTu1R3LZ4mJNlJLfoClfG0/ENVTVvM
         XFLMnmz+MY7eSyS8gwlwCT2X6FUFVjUfDzmMloBzRyVC1KMHhUv1EHaSVfG3aamCFPug
         ma1yoZvn49mgz8KAdMF9+ja0MRieXt6DHfNgiwlrVFD0f8K9S2SZeak2eGA1RxQorCKy
         2VMPE188XgzMK6UvcIgZe1pIUS9LtgfpzmsC90pPbDJeZqenN0jcb+Lc/vv+Uq2Vk8o3
         lhCQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1783618737; x=1784223537;
        h=content-transfer-encoding:content-type:in-reply-to:content-language
         :from:references:cc:to:subject:user-agent:mime-version:date
         :message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=poQEktvQ8sK43PpTgwOxeKI8wVy+YV2bLxGSwCH7GHE=;
        b=euOmXIO/PGUDlpK/dbKWNn8BeFP9WzFcw2CnexWmcEQIFtjM+/BXcK3SXNh4AXssMs
         R08iJG2JzNUrIbcUsNikYzfFSmpeL1cHKWIKs+LVzbyXl4ab8M/EUZZ5ykWc2mOOtCAr
         T0/1ZwA0TVzhfjTlmFZS7SZjgH2AmnlrhkVF5BI6PGRzkhufkbKuw+0+t84B33KMdRkc
         RDDJcNqcejr3wNpjxuhuoMpmR5I+W2DF+cKPhW2yN9F82bZpUK+arredNKi1hcaSDxd1
         iDtQvkUKVIN+zQljPnb4GuhdReJF5zZ7qSlIuvlraokOivraMSyOrghg9Ejgbjo9IBzT
         8PmA==
X-Gm-Message-State: AOJu0YwSqlaVwPiiWrh/6zJ3Z8IuqPDtNpEPVKqKWm5/P76w/63QpSeY
	LqaU/Jhr1n2Nk0AkVfJHBEt1eHge+YLBwr2HfHnLmeU95cgG3y4GooWJBCv3Qc3wWIAYKbEvqDv
	ma0/x8Y7ej3Nt42N9aaR/M1ouf0X8RJVxtk+M3fOGKKdA0RGfMA8uHOqI8JJqYuJ8BpZOGEpwX+
	FqPWA=
X-Gm-Gg: AfdE7ck15/d6eyTzkqXep0Ah9N0Fw2HLjRP1XixUK/HMLFc0zwXafN3q6uEGdYl8YiJ
	VrBuaAp8R+gH3Liv4FeEN2eZYbAw7hKeVvEjqsCufz4v8DeSN0Gujz+viB9Xt4G1aPc4oEJ+Oz1
	Iznw/uMXW+pu3AWS5nE5uIuYeJa6IgejsD/IHfI7yA0KHyUbvaRK5M7FT3LpyoCVFBimkaY6Wx/
	StY0X+xR4K2mW4Mk7W/zLxdJ9W5joww+CuYt+Vvx1LmRnvvUR6eiMjhvUq48DU69Y2WTY7LtGAL
	mAiPT3eavOQKxZgueONQYR+h/GwUA/1EbZ1f5BAguAavp8t0fVrK9ePt88UJFPoG9Z6pttDG+85
	yqCakZnSt0aFYLwyFQ1fqOMSaCg8c0gqPoWVUy7c=
X-Received: by 2002:a05:622a:315:b0:51c:8439:14d9 with SMTP id d75a77b69052e-51c8b3c2a7dmr86237391cf.54.1783618737401;
        Thu, 09 Jul 2026 10:38:57 -0700 (PDT)
X-Received: by 2002:a05:622a:315:b0:51c:8439:14d9 with SMTP id d75a77b69052e-51c8b3c2a7dmr86237201cf.54.1783618737050;
        Thu, 09 Jul 2026 10:38:57 -0700 (PDT)
Received: from [10.204.141.154] ([213.55.184.23])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-47aa039ae44sm50653065f8f.23.2026.07.09.10.38.55
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 09 Jul 2026 10:38:56 -0700 (PDT)
Message-ID: <b4c58ca0-8844-4776-bb3e-53fa17068eda@oss.qualcomm.com>
Date: Thu, 9 Jul 2026 19:31:17 +0200
Precedence: bulk
X-Mailing-List: sashiko-reviews@lists.linux.dev
List-Id: <sashiko-reviews.lists.linux.dev>
List-Subscribe: <mailto:sashiko-reviews+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:sashiko-reviews+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v4 6/7] dtc: dt-check-style: Print proper line number of
 indentation detection place
To: sashiko-reviews@lists.linux.dev
Cc: conor+dt@kernel.org, robh@kernel.org, devicetree@vger.kernel.org
References: <20260708-dts-style-checker-v4-0-c175e6401150@oss.qualcomm.com>
 <20260708-dts-style-checker-v4-6-c175e6401150@oss.qualcomm.com>
 <20260708145452.E9AF91F000E9@smtp.kernel.org>
From: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
Content-Language: en-US
In-Reply-To: <20260708145452.E9AF91F000E9@smtp.kernel.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-ORIG-GUID: mdjTrPn_o6oozFQ9P7tZHekg-HyLoIdA
X-Proofpoint-GUID: mdjTrPn_o6oozFQ9P7tZHekg-HyLoIdA
X-Authority-Analysis: v=2.4 cv=TPh1jVla c=1 sm=1 tr=0 ts=6a4fdcb2 cx=c_pps
 a=mPf7EqFMSY9/WdsSgAYMbA==:117 a=nvVmADDuAioZMzk/ZEnfEw==:17
 a=IkcTkHD0fZMA:10 a=RAioF0-LDSMA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=eoimf2acIAo5FJnRuUoq:22
 a=VwQbUJbxAAAA:8 a=WUmGaEhgzEYFincXSwwA:9 a=QEXdDO2ut3YA:10
 a=dawVfQjAaf238kedN5IG:22
X-Proofpoint-Spam-Info: AW1haW4tMjYwNzA5MDE3NCBTYWx0ZWRfXzEyEDgJnVr15
 oP7YrxcWztmsUWEJJZUvhMJdMWV1rbkDJNyACC50yzmv4Idv5b6xQ3ugh7vRf8irYQbp9Zwu7Yz
 22OCow8lypqWyXU4ktP6EH6s/xsHUD4=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNzA5MDE3NCBTYWx0ZWRfXwtXsxrYIORrX
 zUFLLu+/9RViDQnu9Su6cYRS8kZbRo4j2ZYSKN1ILOy3D/EcNRQRVFPSlahB6xDWuFY7Kc9B+xU
 ooG25KvXgaXy37XsTYGpXvKhVgYZYlgh3DWCUfqLnkygOLz8fpB7Gkd0dbCdAaoFgtEcwYCEJ1L
 zVgpDMvyfFFGynU1COJ1OZSs68cAfelavoPOkRYjpoElG8SIRL7ZGTrjg4AKOfQ7AfknhQOUG9R
 r7h0F0SfCEGJ2tEDKJJcpFPgwyEeqImTEhBag9zMregUitwEQKeDwwVGbOKoHg37j1d39bgjVKt
 Y5BS4Fyz9Qgvc+iZinadYrKOT8bB1ZtCXuDgQErhYdzCB7Av8Z7nG8lYRmPWpeEFTOF8+Es5Sui
 QqLlPT7dZl1LR2mtSZDqBvEFYd04GGDo2014Kb2P3N2JG3WiOUXoesXlppY9yl6Z9QqJR9sqjBo
 bt8l9fXjMJ/pUbvUJ5w==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-07-09_04,2026-07-09_04,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 impostorscore=0 adultscore=0 bulkscore=0 phishscore=0
 lowpriorityscore=0 clxscore=1015 malwarescore=0 spamscore=0 suspectscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2607090174

On 08/07/2026 16:54, sashiko-bot@kernel.org wrote:
> Thank you for your contribution! Sashiko AI review found 2 potential issue(s) to consider:
> - [Low] Outdated docstring for detect_indent_unit()

Ack

> - [Low] Unused variable `lineno` in `check_indent_consistent()`

False positive, IMO



Best regards,
Krzysztof
