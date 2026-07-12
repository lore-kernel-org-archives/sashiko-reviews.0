Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2AF803546F9
	for <sashiko-reviews@lists.linux.dev>; Sun, 12 Jul 2026 16:21:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783873294; cv=none; b=lNDDix0t3jT88EPjWqPku1BhnVewRYBJvkxFG76TGNWhLBYl+ix0OYqi1+Pwgw11rDpTE1EcXV9rZFoXWT4EQWMKntWy54soz5LDIYCihLiucJG/8f4QavZJSR9b5eMNjXLrZgGGF8CdhlRMEYwIKo17GHWvbU5pUvuFDUb+AMU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783873294; c=relaxed/simple;
	bh=GL+VFhO8CO6do2DAPvHKDO+khg+wGy/uyXfCtrc7bug=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=bOiZHh+ZuV2Mu7lm+p7jpwoyYHZppc/GaHVLvYbnoWSD9QTzTZmfGsrmrb5LYVeTGiWbG7KuFG0wbIhmbf6P3+RvDubrfL8Cg6j9LBDhtvPlx//OolE7jfT1iqGR0g/wSAQ+d6ukvOyovpIoAfctfh0biZRK4ttMZZEDfhk5+yg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=FprvP2JN; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=DdB8xaRW; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="FprvP2JN";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="DdB8xaRW"
Received: from pps.filterd (m0279863.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 66CDa3C62749979
	for <sashiko-reviews@lists.linux.dev>; Sun, 12 Jul 2026 16:21:32 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	GL+VFhO8CO6do2DAPvHKDO+khg+wGy/uyXfCtrc7bug=; b=FprvP2JNVM1jrc4j
	AYOD9ipjY59zXG7UPYvM1hw054jRSHagQ4b+KhfHUTZ1Y9eDYhzZXBY79ApIdqYJ
	FEsICGLjrRCnd2relGJk/9j6/NGNralETtEEiGhGzehP2lFaeuIFzBC8WDNrvV9D
	8VeWpLmeITqoUakEN0o5t2kjo3sTs8FbZd/ad7V2Kdc5WrF7J/q1m7WOFAViHhuT
	C1fURu8r8sPMOSYotY2Zb3vx3sFVvRhckIfHFiS+wmD9OPgpq0BQC8zLjj1wbtKB
	KVEhNjAsUfQd75Nby7VCcyIpw+yqBc26GJpy2eocjDvGf1E2//LZZzJzU9EYka1O
	IcegHQ==
Received: from mail-qt1-f200.google.com (mail-qt1-f200.google.com [209.85.160.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4fbe8vb36r-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <sashiko-reviews@lists.linux.dev>; Sun, 12 Jul 2026 16:21:32 +0000 (GMT)
Received: by mail-qt1-f200.google.com with SMTP id d75a77b69052e-51c21c01cf3so47174371cf.2
        for <sashiko-reviews@lists.linux.dev>; Sun, 12 Jul 2026 09:21:32 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1783873291; x=1784478091; darn=lists.linux.dev;
        h=content-transfer-encoding:content-type:in-reply-to:content-language
         :from:references:cc:to:subject:user-agent:mime-version:date
         :message-id:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=GL+VFhO8CO6do2DAPvHKDO+khg+wGy/uyXfCtrc7bug=;
        b=DdB8xaRWs8LeZOff4mfUJiVAf3PC/nPqZIXJpg1+HNO049BdlfK1yr+CoHKoPG+0no
         NGPatr5vGEApT3k8mHgo/FLSXBLFDM10S5FFC2ABZqI8njivLrQz4Q6oPHSLPAV9hRq/
         koy6hKg8ZjU6vtyk/JJRtp6VoP0nrqvdZTqoKi6Jg+Pv/KNshy2U8ENvwE+sxWcJxSE5
         mYWhGebhvqPkHVUuG7/Vl+kIM9Q6Sx7QWQXPEkLJV0mToRym4m6i6VmN3tQMgwqDeuFO
         G1zZHAvCPVV+aWdja2eIhzsb8eFvSH3doAuxauV2ZxcbPr1Kwxpj7y/maE+3GeMKFPjR
         yEWw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1783873291; x=1784478091;
        h=content-transfer-encoding:content-type:in-reply-to:content-language
         :from:references:cc:to:subject:user-agent:mime-version:date
         :message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=GL+VFhO8CO6do2DAPvHKDO+khg+wGy/uyXfCtrc7bug=;
        b=YhrmvHaTx9MdnYW+RFDWYkQBiuI7FL7OEdc4Ie7owiZuVkvjweE4n0O2ULMMUmMBqu
         ULiZ9odmVrKRZ2NfZuXoqosfi2xK9soDLR2r3RAsjj+AP0DXZ6sWpbIf+ISAmXP/b3sb
         tU+pJ1TAXlrbnHkSk9YkcmfkAqou0UtpJHOSXTVQHRImj4UAuTxBoAieruA1le9yWMDZ
         JagJy36sFxkzI9Alg0HpefxtADgQyq7XIlixh2Pl5UscA8jSnenJz1UnIE3wJ4vzo8bg
         WnoME4fwOLJM7NHpXJ9YGfw/woe858Ax4lFWqC9riZgF2XEOu7DHa+pzkN7UTgPuWY+Z
         H8Gw==
X-Gm-Message-State: AOJu0Ywc+zkmFeXhXLRr91j1CH3937bafBMY+SG+V22DtuTvW3SKiU9Z
	WS4azesBt3Bv07Kq0NJbjkYtiNvEi0ZEIOA1BGjmN+zC5F+VWyXzNf6kSrqcwzuZ9W1d4L33bYG
	+BAeEKN9DNq7SX9m0c/n7s7vWqXDWEm4vFl7BnYP9JGttn7sliVpIcVEOGpqCJd9uis28Ty1TO5
	ZObzw=
X-Gm-Gg: AfdE7cnnSIvo8swE4dBSb2hwCx2fjJqIDxMAoG/vizdMtNNwKzP2tS4MTPLl5gqUP6j
	0pcfQJt4qeoE9NKmXrdyH3no+FclIj9LB00h80akNrXXjpNrBDKt4JLuoWglp7iE6IP5YG11glF
	B2K2wi6/BAE/lDP5RpPeIZJs7+DYnitvhsTeF1aoS0n690++u29xBHPBqI9aEwsnEsQaiM+P3oc
	ir6/rI6jnT3+UkaAG7vL3sNFLaKRve2m22rSzWFFbRz3FykK8ryJW+/s18Ue8KRbLI/eBzBzkTo
	P8im3KMT8gI2nhUthfLWVVHxGu+Gik4b2xMc9SkhfCc6lb9pPpTzwhnZ4AfZIc4UuAFp7ND6xWb
	/t6cweO2Dp3IQBl3BgnY6e4/lgVT7kClpRXaIcd0N
X-Received: by 2002:a05:622a:10a:b0:51c:1d0c:605f with SMTP id d75a77b69052e-51cbf136b72mr67172571cf.20.1783873291352;
        Sun, 12 Jul 2026 09:21:31 -0700 (PDT)
X-Received: by 2002:a05:622a:10a:b0:51c:1d0c:605f with SMTP id d75a77b69052e-51cbf136b72mr67172441cf.20.1783873290952;
        Sun, 12 Jul 2026 09:21:30 -0700 (PDT)
Received: from [192.168.1.110] ([178.197.223.174])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-47aa039b0cesm80097472f8f.22.2026.07.12.09.21.29
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sun, 12 Jul 2026 09:21:29 -0700 (PDT)
Message-ID: <9f94cda6-ce06-4c3a-ae0f-ba264c876279@oss.qualcomm.com>
Date: Sun, 12 Jul 2026 18:21:28 +0200
Precedence: bulk
X-Mailing-List: sashiko-reviews@lists.linux.dev
List-Id: <sashiko-reviews.lists.linux.dev>
List-Subscribe: <mailto:sashiko-reviews+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:sashiko-reviews+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] dt-bindings: soc: qcom,wcnss: Drop redundant $ref of
 firmware-name property
To: sashiko-reviews@lists.linux.dev
Cc: robh@kernel.org, conor+dt@kernel.org, devicetree@vger.kernel.org
References: <20260712145654.126171-2-krzysztof.kozlowski@oss.qualcomm.com>
 <20260712150707.83A411F000E9@smtp.kernel.org>
From: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
Content-Language: en-US
In-Reply-To: <20260712150707.83A411F000E9@smtp.kernel.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-ORIG-GUID: RPsXXCreK9ZI5aCjUHxoW-ChHyLNBIO8
X-Proofpoint-GUID: RPsXXCreK9ZI5aCjUHxoW-ChHyLNBIO8
X-Proofpoint-Spam-Info: AW1haW4tMjYwNzEyMDE3NCBTYWx0ZWRfXx2ZcCE+U/1cf
 Blu2WuOTJvWIfffewplI8TTo7ubBIsu+PODrGFqbE70BbSuTzZP6TWwoMViCP243ZG2ZtErD681
 mg23u8Mw05xmTPeK+YHVAwVJRiDkz4Q=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNzEyMDE3NCBTYWx0ZWRfX/CDFYz0A8MSv
 4fzQRbMesEQVmHF3t3MUMmCZdrK5uWI01hKkTIf85EdQ52bWp1spz12BKo9hrWFjCaM7MQ/S6A3
 stfig3oBWUkiXOAKqEo1Dyz+/hvw3bdW6F2D/76LAPRAa1ZNM8s5cExC1yoxWxVgSSZvOqy5BiT
 YED7OFK9a3+ErMnBzh8dRUgCKmU67+zXtxucFlnKqL3ae/bc8FoErJBjDeScfONJ3I9rr0JRHS1
 WDqFLNA6lyOKee9jEFzLlSUWEqP6KuS91R4KIj/tKMyhbzROgBeRCNR8wquUAeuthA79zXhfxkp
 75nMhfJoSPmJHqXO60zHRPISMAL2k8BvHn3QCprwFG8Q6GnieAoLpyyQb2dkuImuZq1TtyjSt37
 E2YOhejnEMA/IiDKrsvzBBT0tb25YnpYxEFGLshdglgMHDmD3Vq9jN+uucK0k98UCUf/1niKU6F
 ua0hv4R7BLG5yBdAp1g==
X-Authority-Analysis: v=2.4 cv=WONPmHsR c=1 sm=1 tr=0 ts=6a53bf0c cx=c_pps
 a=JbAStetqSzwMeJznSMzCyw==:117 a=N6niishs+lR9UBL1FN3Qrw==:17
 a=IkcTkHD0fZMA:10 a=RAioF0-LDSMA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=yOCtJkima9RkubShWh1s:22
 a=VwQbUJbxAAAA:8 a=3R4P5zgYZQQvAFKv3WgA:9 a=QEXdDO2ut3YA:10
 a=uxP6HrT_eTzRwkO_Te1X:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-07-12_05,2026-07-10_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 suspectscore=0 lowpriorityscore=0 adultscore=0 impostorscore=0 phishscore=0
 clxscore=1015 malwarescore=0 bulkscore=0 priorityscore=1501 spamscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2607120174

On 12/07/2026 17:07, sashiko-bot@kernel.org wrote:
> Thank you for your contribution! Sashiko AI review found 1 potential issue(s) to consider:
> - [Low] Schema validation error: `default` value for `firmware-name` is a scalar string but should be a string array.
> --


Validation passes, but I can make it for correctness:
default: [ wlan/prima/WCNSS_qcom_wlan_nv.bin ]

Best regards,
Krzysztof
