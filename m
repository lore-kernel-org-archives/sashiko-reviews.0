Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 045E83B841B
	for <sashiko-reviews@lists.linux.dev>; Tue, 28 Jul 2026 06:23:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785219805; cv=none; b=r7eGoh6F/dx9jL8ljVBI9rTKSSDzzu3ZWojwIeNfStEWAaRDivH4HosuOyI6UeVOV9neDj1A1h9YZhPhMjgZfgT6/X8z+m1Hp9jEsbMjPnqax8dRn8MY1D/qb1K4V25nggrMlXFsCl/NIWJ7Po0AdfJJuAYnjC8mJtPRL6+LDDg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785219805; c=relaxed/simple;
	bh=iMbmJsNaLLeTIxlQ1jOCqp4Vms5UQzlYStW0ICCyBfc=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=LrXPvqdsEnJgYIh25rgmRJb1POyqHjzSZ6uPxx4RDmSsdrOBqAlHnAF22Wy/VLvRE8pIxoLpDzfk/rfWtoVU2aIrXPFCLqXimnYQzBShUaZjx6SQp3HBHH9Fgy8EHn9cmSD6Cfvh5AEOLpBZer03IInk5OJGrb5VNXRtQFFHRz8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=p7hhTgZ0; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=TUXiBQu0; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="p7hhTgZ0";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="TUXiBQu0"
Received: from pps.filterd (m0279863.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 66S3aXjU1714739
	for <sashiko-reviews@lists.linux.dev>; Tue, 28 Jul 2026 06:23:22 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	MoAsJknaz1GZDs6X/7eVr0WT+lP7Mxrr81WYawWLjWI=; b=p7hhTgZ0XbOzLnp5
	qQOeVXZfkI7wEaV535YXAhPf+Mw7QnnKT8tVPb8BPnebApD94+VRXdzzkAnoQfKx
	Y4ncEbgI3iz31xswL9y7pDNDvCgu+Jc7ZuVNgpXP3LvSk1qCG/wFoCxR+hP+9cJa
	SLFopooinDe4pGJfERt/U082g+mMm+g6HifnbBloRmtNTlFmX2OcJ6IhVvYU25Nz
	4yMMAeja7DBwlAVWWRjLHLJjrTZi2rsrmUDjQ3EW2gYobPlJodlhMATxobpnNY5/
	HvTtzXPOqUZ1V/Gbkl//L7dpfVMopJN4SAEw2fztKza/Gmfw8hvfNpH3GCEIpI8E
	6MP86Q==
Received: from mail-pf1-f200.google.com (mail-pf1-f200.google.com [209.85.210.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4fpadkk9dk-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <sashiko-reviews@lists.linux.dev>; Tue, 28 Jul 2026 06:23:21 +0000 (GMT)
Received: by mail-pf1-f200.google.com with SMTP id d2e1a72fcca58-84859a64079so5742747b3a.3
        for <sashiko-reviews@lists.linux.dev>; Mon, 27 Jul 2026 23:23:21 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1785219801; x=1785824601; darn=lists.linux.dev;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=MoAsJknaz1GZDs6X/7eVr0WT+lP7Mxrr81WYawWLjWI=;
        b=TUXiBQu0bO3TohagaS8E7XZJhtETPlWHqVysnOaQZoY2IUnUoOrayhgrZ2u453NWzC
         kOBo9D43zeB/BS6d64o+dVQ+5NnDxeUqJYleYofJqIrLSihsi5VEoUb3NrprT4Mw492W
         GHtNVqHzA2grNY3s5b3C3sF0aq1OrssepbTs2+dbyn1coBnBRsrvtd1KoTGO5iLtyrLG
         2oozSNJtYqXU2/tF8wMCptV7l+q6c9As/pce7zWkbw7QlxQD2OuEQBz6NwIwQafd48tX
         C3czy+BPw8ZU7r0cK0/KcX/lVSg1AWzawp/HcO9QjQRsvmUmuOTH0bJxgglldye9mbl5
         v5dA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1785219801; x=1785824601;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=MoAsJknaz1GZDs6X/7eVr0WT+lP7Mxrr81WYawWLjWI=;
        b=ELLlhdf96wMcwbQRZXxwGX4piTacXgyIyb4M/9GuX1X5BdchecOsw4vWkh+PFzpvgM
         4Jbl9wEmhgeghFjKY8f6abRsFHbtdk03ZaOeES+D8VqZ6nXN14+AWAhFrskAkr33ATJY
         YcVn6yqNGib463Eduwoc29HNCiMhLURquAhCn69iVvmVtb67LCYYAhwXvWTDKqTAFznr
         Rbcm56xFrJo1DrOXDpRFc/Sy4ooKHOI08IPbe92fu5laVrLR61oIfDpv/6yob9yxlFBo
         nuiiHW0DhHNC8pOQmTj3M7tdVMlJYYH/LnMwhplxE2KyEtEzKxMQR+rVefxHM3LRqUTo
         9BTw==
X-Gm-Message-State: AOJu0YxV9U6KKNq5Pf47rafd57umBLVYlKPg/ttd3JIF+UHJUPjfYjg+
	SYzbgSeShQaMeYqTe/IvYUUhoJq8dMUc3Rc43SdkmKsCqaGUfXF6QSGIdGTosfU+okj96uyh14c
	eokaOcogJJ8GQynfQmb8d0DpkxhG87HF6b/XVwUWlQcJNdA1EeyQsk7n2CC1YSTM9OjwK9l/SzN
	Jv7yA=
X-Gm-Gg: AR+sD10hLNkFUj5LqTX4ts9+Pl+6XMRNFc4K5CJr6QQA5LKgQ4yBXfUQTkWBHIjqMLJ
	uHJpU0/PVJu7jJciyOYr3V5psf6qdCX3dn+rybLJQMBU42JdUiJwQNwz4EWS/RE0y/OpdAWOkG1
	2QgENl9U0oQyblRTTs4r4KY9NYXzp+l5n8nlnlz26eYELMCSaHkrODWs5w5XhGv4/utEl2n9bmK
	Eni0zrJfyMbES8FBDX0MBEBukvzQgJ36JiMEPjqoEuM13Z5RzhfYwZOy99Qs0qzuTakdO2QPH2H
	beWujZPRQ4xhIjCiWFnyquNoniGLgpbh190nLsLZsMv6oMcNoMJdofA1KiqRx0dBIH6tJ8kte0x
	u7ntd10y/5OW40wpLf1f3pbAW9XExnPHfBA==
X-Received: by 2002:a05:6a00:1795:b0:848:2a71:a48a with SMTP id d2e1a72fcca58-84e9311d07cmr1184824b3a.13.1785219801109;
        Mon, 27 Jul 2026 23:23:21 -0700 (PDT)
X-Received: by 2002:a05:6a00:1795:b0:848:2a71:a48a with SMTP id d2e1a72fcca58-84e9311d07cmr1184791b3a.13.1785219800627;
        Mon, 27 Jul 2026 23:23:20 -0700 (PDT)
Received: from [10.219.49.187] ([202.46.23.19])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-84e5327f0fdsm3925209b3a.14.2026.07.27.23.23.18
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 27 Jul 2026 23:23:20 -0700 (PDT)
Message-ID: <d038a86a-67f3-4d2a-b034-7b80f3317f2a@oss.qualcomm.com>
Date: Tue, 28 Jul 2026 11:53:17 +0530
Precedence: bulk
X-Mailing-List: sashiko-reviews@lists.linux.dev
List-Id: <sashiko-reviews.lists.linux.dev>
List-Subscribe: <mailto:sashiko-reviews+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:sashiko-reviews+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v6 1/5] ASoC: dt-bindings: qcom: add LPASS LPR vote clock
 ID
To: sashiko-reviews@lists.linux.dev
Cc: conor+dt@kernel.org, devicetree@vger.kernel.org, robh@kernel.org
References: <20260724141708.2212057-1-prasad.kumpatla@oss.qualcomm.com>
 <20260724141708.2212057-2-prasad.kumpatla@oss.qualcomm.com>
 <20260724142917.953BC1F000E9@smtp.kernel.org>
Content-Language: en-US
From: Prasad Kumpatla <prasad.kumpatla@oss.qualcomm.com>
In-Reply-To: <20260724142917.953BC1F000E9@smtp.kernel.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Proofpoint-ORIG-GUID: MnZenNPlVgK4TB9l8YP1DRVvXVqJWX9C
X-Proofpoint-GUID: MnZenNPlVgK4TB9l8YP1DRVvXVqJWX9C
X-Authority-Analysis: v=2.4 cv=Ns7htcdJ c=1 sm=1 tr=0 ts=6a684ad9 cx=c_pps
 a=mDZGXZTwRPZaeRUbqKGCBw==:117 a=j4ogTh8yFefVWWEFDRgCtg==:17
 a=IkcTkHD0fZMA:10 a=RAioF0-LDSMA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=yOCtJkima9RkubShWh1s:22
 a=VwQbUJbxAAAA:8 a=EUspDBNiAAAA:8 a=ug1fvlQovbtiwNzuxlkA:9 a=QEXdDO2ut3YA:10
 a=zc0IvFSfCIW2DFIPzwfm:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNzI4MDA1NyBTYWx0ZWRfXzwNIEwntCgxy
 x/ONbo0kYdI3HStZ9QgGCShxSTzHGSwdgFNh15urRfEEJAkdBIyNXV7kdu5VkwLcFW/XN1HO8yl
 pDLTSJtOQ/8eF5WqIb1BDV3ixb3NT1+tlOr+JkVU2BdFmI46SXWGewGPY9KxgfP9pU3JlN6tMmL
 3ddotoqFn8Fz2QiTaFHGj0hdLZi3UbD4IoAWTOCHakUBw1/JQc7HyBz1+0stn5rFzdagZEvqDRi
 TOyA70nb22PotwdiIddwTxDPBy8mmIDf+uPVNlmwelkiptpsKG21YYzKXsx9bNNPHrreBIjYRby
 2zdfe9R0wpHyepw+4PJufxMTGctnUd4P5lkiwf8/CIl0yUxxyfffh+SbxOUGWnPzHDpzPhfbL7G
 dsrSkY17+NkQ31NZMSBoiWK8PxXII9fKQ3c0lGHF/ySvGb1cTk6vXe7QoWMdfI2SwFS9LRKUC4P
 dB6DhRBehqNaJSRTfyg==
X-Proofpoint-Spam-Info: AW1haW4tMjYwNzI4MDA1NyBTYWx0ZWRfXwaxvKS+UIikX
 JXRUeoaBggSRVZaSDmex3fubwra5gYRLgOA7oxLIId4pVWoccDhBtYo/DmtXe7vMSQmKN10YT1m
 dInuPrcevPhgEHi3pLX/Zcdh/K/KybY=
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-07-28_01,2026-07-27_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 suspectscore=0 malwarescore=0 impostorscore=0 phishscore=0 spamscore=0
 clxscore=1015 adultscore=0 priorityscore=1501 lowpriorityscore=0 bulkscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2607280057


On 7/24/2026 7:59 PM, sashiko-bot@kernel.org wrote:
> Thank you for your contribution! Sashiko AI review found 2 potential issue(s) to consider:
> - [High] Adding clock ID LPASS_HW_LPR_VOTE (104) without incrementing Q6DSP_MAX_CLK_ID in the clock driver prevents its use and introduces a latent out-of-bounds array access.
> - [Medium] The new clock ID `LPASS_HW_LPR_VOTE` is defined in the dt-bindings header but is completely unimplemented in the actual clock provider driver, making it unusable.
> --
>
> --- Patch [1]: [PATCH v6 1/5] ASoC: dt-bindings: qcom: add LPASS LPR vote clock ID ---
> commit f9999fdb82c99c4b2b674da0fc47d8921c55373d
> Author: Prasad Kumpatla <prasad.kumpatla@oss.qualcomm.com>
>
> ASoC: dt-bindings: qcom: add LPASS LPR vote clock ID
>
> This patch adds a new clock ID, LPASS_HW_LPR_VOTE (104), to the dt-bindings
> for the LPASS low-power resource (LPR) vote.
>
>> Add a new clock ID, LPASS_HW_LPR_VOTE, to represent the LPASS low-power
>> resource (LPR) vote through the PRM interface.
>>
>> The LPASS PRM supports a resource voting mechanism to control low-power
>> states via PARAM_ID_RSC_CPU_LPR. Exposing this as a q6prm clock ID allows
>> clients to request the LPR vote using the existing qcom,q6prm clock
>> provider interface.
> [Severity: Medium]
> Is the clock provider implementation missing from this patch?
>
> The existing qcom,q6prm clock provider interface doesn't appear to have this
> new ID wired up in the q6prm_clks array in sound/soc/qcom/qdsp6/q6prm-clocks.c.
> Without adding it there, clients won't actually be able to request the clock
> as described in the commit message.
Thanks for review.

The corresponding clock provider support is added in patch 2 of the
series, where LPASS_HW_LPR_VOTE is registered in q6prm_clks[] and
the required PRM handling is implemented.

As a result, clients can request this clock through the existing
qcom,q6prm clock provider interface when the full series is applied.

>
> [ ... ]
>
>> diff --git a/include/dt-bindings/sound/qcom,q6dsp-lpass-ports.h b/include/dt-bindings/sound/qcom,q6dsp-lpass-ports.h
>> index 7b553a73bc928..8e04106d48be5 100644
>> --- a/include/dt-bindings/sound/qcom,q6dsp-lpass-ports.h
>> +++ b/include/dt-bindings/sound/qcom,q6dsp-lpass-ports.h
>> @@ -236,6 +236,7 @@
>>   #define LPASS_HW_AVTIMER_VOTE		101
>>   #define LPASS_HW_MACRO_VOTE		102
>>   #define LPASS_HW_DCODEC_VOTE		103
>> +#define LPASS_HW_LPR_VOTE		104
> [Severity: High]
> Will this new ID get rejected by the driver's bounds checking?
>
> In sound/soc/qcom/qdsp6/q6dsp-lpass-clocks.c, Q6DSP_MAX_CLK_ID is currently
> defined as 104. When a client requests this new clock, the validation check
> in q6dsp_of_clk_hw_get() will fail:
>
>      if (idx >= Q6DSP_MAX_CLK_ID || attr > LPASS_CLK_ATTRIBUTE_COUPLE_DIVISOR) {
>          dev_err(cc->dev, "Invalid clk specifier (%d, %d)\n", idx, attr);
>          return ERR_PTR(-EINVAL);
>      }
>
> Since 104 >= 104 is true, it will return -EINVAL.
>
> Additionally, if the new clock is wired up later in the provider array without
> increasing Q6DSP_MAX_CLK_ID, q6dsp_clock_dev_probe() will perform an
> out-of-bounds write because the array is sized based on the max ID:
>
>      cc->clks[id] = clk;
>
> Does Q6DSP_MAX_CLK_ID need to be incremented to accommodate this new ID?

This is addressed in patch 2 of the series. Along with adding support 
for |LPASS_HW_LPR_VOTE|,

patch 2 increases |Q6DSP_MAX_CLK_ID| to accommodate the new clock ID and 
updates the clock
provider accordingly.

As a result, clock ID 104 is accepted by the bounds checking and the 
clock array remains correctly sized.

Thanks,
Prasad

>
>>   
>>   #define LPASS_CLK_ATTRIBUTE_INVALID		0x0
>>   #define LPASS_CLK_ATTRIBUTE_COUPLE_NO		0x1
