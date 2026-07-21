Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DA98C2D8762
	for <sashiko-reviews@lists.linux.dev>; Tue, 21 Jul 2026 07:51:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784620286; cv=none; b=iuD+pfmp4sJXJI5BjY+jfMBXTzNym2jXfIJGij6IP2AsNnu4iP5kc8HVgHhguw+HKZaTVOFUvafWXcC2n/Xnu5zDoiDS7uKm3e/rtik4J+G5co1U+hX3QwWzi6JamVr5T3WxJygKWxZnlaXFatPAhGN9MIFHTncwaFeShyVgMkM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784620286; c=relaxed/simple;
	bh=QHJW3siNgVmjc3aSobEsxJMCM7AgcuQE4rep5BisgJI=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=FviABMYdfz7va3FSzZnPuFYdOeVY3XyAgAamUYvGfzAEATe5AvlPY3tGwuvpbYDxjq9Mk3DPO2OST/TajvF/wAb8VGpj0Uwx4j9EgI/uRf8DUoDiRUYtLmHOcSvSbk25ja4nwQOsf/VCn7PEPE8118l57MvLvWoVnT8Z5PSqxOw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=Zo9aFlyt; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=RLf6kzwf; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="Zo9aFlyt";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="RLf6kzwf"
Received: from pps.filterd (m0279864.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 66L460XV037541
	for <sashiko-reviews@lists.linux.dev>; Tue, 21 Jul 2026 07:51:24 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	UZD7JCH11xpW947rrsKkL3xINONomQp6T3v293UueOQ=; b=Zo9aFlytQ9yO6NqU
	SkGESjdG839aocem9TkEI1g0dOaCOFMSb8oqgFZRUcxoiwOxC9CrSojAC/ZqWtoC
	vsRB00rdtG2IXhBOD2NB7v43x2LGtlXPh2+opnka2eoBo9IAA06chxjBH1fKaV/l
	QgabzJGmo32Kad3sd+QaM/BlzibzFWBs84vwNXmAzGSseIBuwfnppRbD5CYyriBx
	S8TSw2NB4rSsv8dQmPxYNwXXg5QQEUFGsK/53ZXr57psAl+VplPhJwNwBU8UxBxL
	P8Q36C7vLgB8cSwESMKQjuHPIfXJ1iUKzHUgb9qvlehagp/sjRoQcwRgUzr/VyjX
	JAtXsg==
Received: from mail-pl1-f199.google.com (mail-pl1-f199.google.com [209.85.214.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4fj1es0uk0-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <sashiko-reviews@lists.linux.dev>; Tue, 21 Jul 2026 07:51:23 +0000 (GMT)
Received: by mail-pl1-f199.google.com with SMTP id d9443c01a7336-2cc73f47bdcso204277035ad.3
        for <sashiko-reviews@lists.linux.dev>; Tue, 21 Jul 2026 00:51:23 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1784620283; x=1785225083; darn=lists.linux.dev;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=UZD7JCH11xpW947rrsKkL3xINONomQp6T3v293UueOQ=;
        b=RLf6kzwfzprL5hK9SBVaDYtcDLhPmDxq2lgE2LB0ms8rE8PSYgbYYfumQBqYqJCOYo
         B3qloTwF9oxiw6cwaoo5WAE/YGUIzAZAvuQBvRJSR0i2VJJT+ALW5KpFBUVnMN3RgyEk
         OhLHhC8GFvjr0D7l1oRb2LtIRoYy2CTyn8SCbhWQD8/kr0d3tpyTAUCKNAFJ9Hm8EWWR
         6h1JB391ScZ+FtzHQAB0I3ImdAGBwt/V201z9aW67nkQYvSthdF2i/0iHYIjLQw9UKE9
         Gf8lUNdIa27mPODpowhceGlRCZaiDuh5bFHkefd1xUfXL9m43F8v2tZvajcmf3iFsbCu
         YTUQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1784620283; x=1785225083;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=UZD7JCH11xpW947rrsKkL3xINONomQp6T3v293UueOQ=;
        b=WxBucULzOmSaFkzSdKcewqPAfDeXckZ+s7KrC5x+XrSiPNfrMm5086p6SdCzHXk4yg
         gxIJ71UaM59dE2JR0TaCerhl6K26ZoYKb7FgkSdyqphxraTr8hnN7GdNGDHQLdP1zVa4
         Iu/wYy04UYGBOD7g0Q1cN4xlyUTjMj3nfAeuW++cTlBk/NOWFHMkIxfoM5/0s7dDs0Ct
         B+ix1ra2o8D4fLeDzOh3GRenRbBvLNVNWoS76xN3X3DK/HThydz/bgVhLz5k9s2xZ2nk
         E1rADLnuQQxkRXGE7V1Q7NtafqzHkC2uvcwVLcJ97dMubeV17sMBCu8KOLjdFOVpde4V
         DN3g==
X-Gm-Message-State: AOJu0Yzb+wTeEyOycbt28Zm2mmpDGEoNstFjEGrqmBD+LR1xCf/K8Zh3
	mGw5UI/CQHF/WbO9SRqZw1t9hqWAc56Vf/pIaLwkK4izHCQjGY70OgesmH8PN+AXvO94pxr0Lw4
	nm3JHj9J4U+WXD0tFVdkOV3owth1M6yus2xHKX3/Yb6eiLPOYN+ZE8GYoSb0ShmwmrvZ74NQ=
X-Gm-Gg: AR+sD13qLDq2S8rChOE8b9amjZsal82Dl+N2tRMTjsA9QaSnL5Mx8T8OgZfd57ddhjS
	EsBR9Dcd8YeTJnebzQYQWpAClNfYsn/SHItGhPn293OtgTqp3Xu9fWPhGjVUhjhGVVPRnB0Peu1
	WUwn/hQAv2yLjGOitBOTBAGk7QK7YJcaR2Q7b/1ZQ6I3PzSNs/7ztdrTaxwVSBBXqzJZag9WbKE
	DBcbkLaCgzjlFDEP9SH2+lf42nrmd7xCSucQ3c4Mbv7AHiT7RiVgt9jAvgTcEd2dqV5H2LgfX8J
	TIvBmA3QHLU9QNJ8Bxvv6XrgX9zvXf2G9m/7sdgcpu9kypO6T0XlZbK7WoJXoty0M/BQAiBqx13
	k2ax5OBMY7RsA++tFJ35SbsdnQxZtYd3OmNpa2xs=
X-Received: by 2002:a17:902:d588:b0:2c9:e86e:a9f5 with SMTP id d9443c01a7336-2cf348669c4mr201710735ad.18.1784620283225;
        Tue, 21 Jul 2026 00:51:23 -0700 (PDT)
X-Received: by 2002:a17:902:d588:b0:2c9:e86e:a9f5 with SMTP id d9443c01a7336-2cf348669c4mr201710505ad.18.1784620282715;
        Tue, 21 Jul 2026 00:51:22 -0700 (PDT)
Received: from [10.218.21.154] ([202.46.22.19])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2cf347a7c9fsm70041285ad.84.2026.07.21.00.51.20
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 21 Jul 2026 00:51:22 -0700 (PDT)
Message-ID: <44eb0b26-08cf-42c4-b5b4-93cbcfd2d2cf@oss.qualcomm.com>
Date: Tue, 21 Jul 2026 13:21:19 +0530
Precedence: bulk
X-Mailing-List: sashiko-reviews@lists.linux.dev
List-Id: <sashiko-reviews.lists.linux.dev>
List-Subscribe: <mailto:sashiko-reviews+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:sashiko-reviews+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v6 1/3] ASoC: dt-bindings: qcom,q6apm-lpass-dais: Document
 DAI subnode
To: Krzysztof Kozlowski <krzk@kernel.org>
Cc: sashiko-reviews@lists.linux.dev, conor+dt@kernel.org,
        devicetree@vger.kernel.org, robh@kernel.org
References: <20260720160226.1026440-1-mohammad.rafi.shaik@oss.qualcomm.com>
 <20260720160226.1026440-2-mohammad.rafi.shaik@oss.qualcomm.com>
 <20260720161033.5277A1F000E9@smtp.kernel.org>
 <2efd7e96-d0ea-478d-bfc8-bf7380ff8982@oss.qualcomm.com>
 <20260721-blond-tortoise-of-authority-ab3dca@quoll>
Content-Language: en-US
From: Mohammad Rafi Shaik <mohammad.rafi.shaik@oss.qualcomm.com>
In-Reply-To: <20260721-blond-tortoise-of-authority-ab3dca@quoll>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Authority-Analysis: v=2.4 cv=SPZykuvH c=1 sm=1 tr=0 ts=6a5f24fb cx=c_pps
 a=JL+w9abYAAE89/QcEU+0QA==:117 a=fChuTYTh2wq5r3m49p7fHw==:17
 a=IkcTkHD0fZMA:10 a=RAioF0-LDSMA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=DJpcGTmdVt4CTyJn9g5Z:22
 a=VwQbUJbxAAAA:8 a=EUspDBNiAAAA:8 a=n4nC-CJ8elYlXPpnoCwA:9 a=QEXdDO2ut3YA:10
 a=324X-CrmTo6CU4MGRt3R:22
X-Proofpoint-GUID: NcjQjkNyi89xbvpKCU_vQGSemZCzyXIe
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNzIxMDA4MiBTYWx0ZWRfXyqQqlqhtObP7
 kvcbBILiJtVB+KpCqpHC1wZLJYovk6yAgquCOk9aDjwn1swEKBw/akPxiE5ZmklQCAVbv4eOZCT
 IXybmGpe6tfpMi+ZB0zBlC7J6vvAiw9Fjp97pUqU3JwEwVaR7cN/4TfhjBbYHX2iTBhW7GF7dUN
 4HlITLMIOmwIUroMqz0z94nDHdnd+MJmPOWpDANkKablBIsnRWp9TySf8aRPuRD8VEfRyeAiMyQ
 kWtzqpdgMfdFx0ew54NgBVfQYUWBL24jlpx4eIv5+mK84D7ebWMsJau3XB6WNObKVkOBAmW+DIn
 JbU1eYPg7iSpPenF4mr4prqwsmJy/XNaqDCOLu0QpdGsqPkudp4swSKxWTX9XBnSChiQiuPuXW6
 n/d2sAh1thJiWe/7YHtJrH6Hqh49etLy4eQtfkQ8joVJcebDopxTGqLUZW8bRsEZ+4Q+RJPkrfR
 96HKgI6agWRVcjEdTWw==
X-Proofpoint-ORIG-GUID: NcjQjkNyi89xbvpKCU_vQGSemZCzyXIe
X-Proofpoint-Spam-Info: AW1haW4tMjYwNzIxMDA4MiBTYWx0ZWRfX33GY7KrpmL/B
 xIye4p2sthggbL2nAVG37MagJ4V491fyjE+Af7KP1bhJch1n/An07FqP/k/iNbLMN5TroygAD8E
 Gtrny7JqVhNve61JmLCXAzG5JuZMVMg=
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-07-20_06,2026-07-20_03,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 adultscore=0 priorityscore=1501 bulkscore=0 phishscore=0 lowpriorityscore=0
 spamscore=0 clxscore=1015 suspectscore=0 malwarescore=0 impostorscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2607210082



On 7/21/2026 12:19 PM, Krzysztof Kozlowski wrote:
> On Mon, Jul 20, 2026 at 10:02:39PM +0530, Mohammad Rafi Shaik wrote:
>>
>>
>> On 7/20/2026 9:40 PM, sashiko-bot@kernel.org wrote:
>>> Thank you for your contribution! Sashiko AI review found 1 potential issue(s) to consider:
>>> - [Medium] Contradictory array lengths and definitions between `clocks` and `clock-names`, making valid hardware clock combinations fail validation.
>>> --
>>>
>>> --- Patch [1]: [PATCH v6 1/3] ASoC: dt-bindings: qcom,q6apm-lpass-dais: Document DAI subnode ---
>>> commit cca2bfa9278ee0dba4fe02f999f9bda9ec6f258f
>>> Author: Mohammad Rafi Shaik <mohammad.rafi.shaik@oss.qualcomm.com>
>>> ASoC: dt-bindings: qcom,q6apm-lpass-dais: Document DAI subnode
>>>
>>> This commit extends the qcom,q6apm-lpass-dais device tree binding to explicitly
>>> describe Digital Audio Interface (DAI) child nodes. It adds address and size
>>> cells to allow multiple DAI instances and defines a pattern to document per-DAI
>>> properties like interface IDs and clocks.
>>>
>>>> diff --git a/Documentation/devicetree/bindings/sound/qcom,q6apm-lpass-dais.yaml b/Documentation/devicetree/bindings/sound/qcom,q6apm-lpass-dais.yaml
>>>> --- a/Documentation/devicetree/bindings/sound/qcom,q6apm-lpass-dais.yaml
>>>> +++ b/Documentation/devicetree/bindings/sound/qcom,q6apm-lpass-dais.yaml
>>> [ ... ]
>>>> +      clocks:
>>>> +        minItems: 1
>>>> +        items:
>>>> +          - description: MI2S bit clock
>>>> +          - description: MI2S external bit clock
>>>> +          - description: MI2S master clock
>>>> +
>>>> +      clock-names:
>>>> +        minItems: 1
>>>> +        items:
>>>> +          - enum: [bclk, eclk, mclk]
>>>> +          - const: mclk
>>>
>>> [Severity: Medium]
>>> Will this cause device tree validation to fail for valid hardware clock
>>> combinations?
>>>
>>> The clocks list defines 3 items, but clock-names defines only 2 items.
>>> Because dt-schema limits arrays to the size of the items list when defined
>>> in this way, providing 3 clocks in a device tree will trigger a "too long"
>>> array error for clock-names.
>>>
>>> Additionally, do the array index descriptions mismatch? The clocks array
>>> defines index 1 as the external bit clock, but clock-names index 1 strictly
>>> requires "mclk". This would prevent configuring "bclk" and "eclk" together
>>> if "mclk" is not present.
>>
>>
>> The sashiko review assumes that bclk and eclk may be used together.
>>
>> However, the hardware supports either bclk or eclk, optionally with mclk. A
>> bclk + eclk configuration is not valid hardware usage,so the reported issue
>> is not applicable to the valid clock configurations.
> 
> But you wrote that eclk ALWAYS follows bclk! Look!
> 
> +        items:
> +          - description: MI2S bit clock
> +          - description: MI2S external bit clock
> 
> What is the meaning of this?

your right, The item descriptions are misleading because they imply an 
ordered bclk + eclk configuration. I'll drop those descriptions.

The hardware supports either bclk or eclk.

will keep only

clocks:
   minItems: 1
   maxItems: 2


Thanks & Regards,
Rafi.

> 



> Best regards,
> Krzysztof
> 

