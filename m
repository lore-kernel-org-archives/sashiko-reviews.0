Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4E2CF26A08A
	for <sashiko-reviews@lists.linux.dev>; Sun,  9 Aug 2026 12:25:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1786278348; cv=none; b=rFiub6RWTta1Ni/WTv4E4cTcJ/odqeKfu8ZxgKJfchlVV3CottqSoUrc0VfvDDeGyx3T+B/WhYJJoi1Th36sUDGjOv83+jcXw22cK2lZXDvpeol3jWbfnM4uhAD61NDLefR0F559XvsxcZ0s+vMGkNu8b3whO23iAa7HfspL/ys=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1786278348; c=relaxed/simple;
	bh=QUEl6UiYbHWT0k48QXA7zSE64pfkFXigcTSiAI37zKA=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=nS339UWOsrcd5+kdLQVl1uI5xIAl9AL6hOJD8tqVXUtm6ltaRZqNjzy2ATTM5KsyG6BMFUGx/7Q+0Wk8wlYwQPwPK/p3koOTYIKpL5K21MbcnjT15SzwWS9RCweEFxPOwv9j3kZC2yXpuolrn42CeJPaYUhUAIWkpoR9qdH8ezU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=Z2U7Hw9c; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=B9SlJ6Cp; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="Z2U7Hw9c";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="B9SlJ6Cp"
Received: from pps.filterd (m0279871.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 679C2SbT2985303
	for <sashiko-reviews@lists.linux.dev>; Sun, 9 Aug 2026 12:25:46 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	eFvwZPyjWrJ40SAo7E1SSw0UlXA/XiaovP/4wphuTaI=; b=Z2U7Hw9cd+Dd1rjs
	MiUr29MeDo169P+/kU8Nis/0sS+bTAuYZnu7X/bhfRlYRqnRNeq7syJtvl2JhWkc
	bNmwe0cTYu+/kJ5Zj5C9ulDyRl+FMsL30Rud9P1LUD9O6lYN5F6QdTNFdCR4nnW6
	KvCovBmAR/E/eWWGwJM5fjslNqZK2zUxMihU45bOHpOu7Hk5/s6Rnn4+Lh7WvyZt
	BdyFBhlaoFNEhamM/Q0nvXAoW9qpi5pAjkHkwTceDKqCAYLqWeHb9MdLwHXiIA//
	Y3uZCbIY5TmlYKC1wqXdIxu4oFU+3byRIzmBr9gSXsm6mcvAmDe2kaWj8mdcJrNG
	flxOJQ==
Received: from mail-pj1-f70.google.com (mail-pj1-f70.google.com [209.85.216.70])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4fwv1yaw66-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <sashiko-reviews@lists.linux.dev>; Sun, 09 Aug 2026 12:25:45 +0000 (GMT)
Received: by mail-pj1-f70.google.com with SMTP id 98e67ed59e1d1-38e6d253330so1185632a91.1
        for <sashiko-reviews@lists.linux.dev>; Sun, 09 Aug 2026 05:25:45 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1786278345; x=1786883145; darn=lists.linux.dev;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=eFvwZPyjWrJ40SAo7E1SSw0UlXA/XiaovP/4wphuTaI=;
        b=B9SlJ6CpyzS0CpZWeYxs5dX7HaGtt08P+SaUttjOk/bAhTrUV1TfVrsMUfg3QpLO1G
         Y7JUkE7VVNj0zivTBL7QXKrowftxKVkZAM1CQcpzxZNwkr6DVT5QRYRAFgQOSCWh/WaF
         aZLQNapQ46eADmgezsc8fOOALjUuSaAnEHnsKlW/xe3zljiLxv/irnr4WXL6Hu2E7WLT
         vHMAnzL4TNxBSU+zZBE58jZsHWuLCVplpBmww3u14/PF/OIGdRB43HaB5pnJrco7VQ2J
         ubQUbnpXvjtO5J6iZWl72cJLh78ipZMCp2QEjdaGBYInCbTsZwwlFxROsecTrRQJTqnW
         pVDQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1786278345; x=1786883145;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=eFvwZPyjWrJ40SAo7E1SSw0UlXA/XiaovP/4wphuTaI=;
        b=Ws9Vy0wN547c/J1kC5T6hXJeaUvY3Mb3xpe9ETm7t8cN3IqNEjteiQU1U3B1of4YaZ
         OGABwL76mnlRSORm0zVeSiZxhyQnOXcZ4xr56c9uSBqaABNFKFEdLYnngqU/G6AuhvUW
         WeieMlAMExGRfW8Td6LsT+nhGFVjo/94fxjNtWG7bWw/AXefRVF0e95jJePDjaO9MDna
         XCA5Z8fJXad4o4qYrYm9639H4onj54Ihisz6uUG6cM0Ppue/ywOr+QlLi6iFi2lMNlxM
         9KZixDIV7Z8yHIp5Wi7+ucEqZ1FposkP0I6HQ3mzkWSkKROiQJGDqDJ4EmYdphku0UqL
         y3Ig==
X-Gm-Message-State: AOJu0YwB34jOZNs5UJ1Y1sCCe73ly8OpHq/sToDv9zw+qXRb3eUbxQjW
	0GwpF0Afn0E4u3yPaKMfXVShhwCmnr1tal2Htg/RTmr88FeU4/3D+7hvpdXuQ22OzynADXWAxt1
	U04WP94zxK9A6x6+QiTmpGhKKYVf8p47YZdTl4U1C8hEzdqGVLqnSpgtRohppu1DivseGQyE86X
	/o9ck=
X-Gm-Gg: AR+sD13pf0t6K6Satkyril1KcTqRQbZQ5TPBX2K3Dh8f4zt01qPh9NFP7N/dhmxdv+Z
	ll3Yh+LGiRai5hqnxRuNnpiFmEw1nFHhe6EtH1oYN1rPh8qXGaJCHypU403kfWCNT6DAjG2rF5U
	IoZMShEslYSSX1dL1lakbvCIhatk0vpP2gXMCigdBrsIXf+43U51X25feaKxuLae1i6vRXgo0q0
	vK/mNeyxbxd5MIUg04vI2Y5eSmQlyZA5gJZJAkjlRV+UzmScZINdP9yLwM6LFaVCO4ByAnAJdUZ
	r15m9yPP7IRc8dLv6Egek8MhXe59zeyJuijRWhcQRqgPm5TzG3emaMf67l3D4BdAFGzLYKYKagq
	zVgRgW2v8YJqB2cCo7dffSBGTwER09AIMvwU=
X-Received: by 2002:a17:90a:dfcf:b0:38f:cfe2:fd3a with SMTP id 98e67ed59e1d1-392847505bfmr5855910a91.15.1786278344954;
        Sun, 09 Aug 2026 05:25:44 -0700 (PDT)
X-Received: by 2002:a17:90a:dfcf:b0:38f:cfe2:fd3a with SMTP id 98e67ed59e1d1-392847505bfmr5855882a91.15.1786278344414;
        Sun, 09 Aug 2026 05:25:44 -0700 (PDT)
Received: from [192.168.0.100] ([49.204.17.188])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-14101a5ee91sm25049479c88.11.2026.08.09.05.25.41
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sun, 09 Aug 2026 05:25:43 -0700 (PDT)
Message-ID: <409e0b5d-9064-4a98-a03e-878065b4f239@oss.qualcomm.com>
Date: Sun, 9 Aug 2026 17:55:40 +0530
Precedence: bulk
X-Mailing-List: sashiko-reviews@lists.linux.dev
List-Id: <sashiko-reviews.lists.linux.dev>
List-Subscribe: <mailto:sashiko-reviews+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:sashiko-reviews+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v1 1/5] dt-bindings: sound: qcom,q6dsp-lpass-ports: Rename
 QAIF clock IDs
To: sashiko-reviews@lists.linux.dev
Cc: conor+dt@kernel.org, devicetree@vger.kernel.org, robh@kernel.org
References: <20260808181948.2489187-1-prasad.kumpatla@oss.qualcomm.com>
 <20260808181948.2489187-2-prasad.kumpatla@oss.qualcomm.com>
 <20260808184533.5C37B1F000E9@smtp.kernel.org>
Content-Language: en-US
From: Prasad Kumpatla <prasad.kumpatla@oss.qualcomm.com>
In-Reply-To: <20260808184533.5C37B1F000E9@smtp.kernel.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Proofpoint-GUID: ZCJVvNsWDJqhCrTiPBEv7vBBH2Vc5i5E
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwODA5MDEwOSBTYWx0ZWRfX8kq4WPnVJl6d
 FuWWy51hVvZt+4BywW/6CUHR1/pr3N8eUGuJrNE3DJHarzdxG/VIdbcz+WFpB5Q83n4JsOJ7nqo
 kgvOm8y1LrCjsxmqz2cxuSKttDkHa5IHn/2Yb72KHrXfseAeKcK4C97ycWEUplY6ipixUASbnY8
 Rk/t9SBCdreXvfXs9q88T0o2UMoNY2Kh3GHw7TS/lNukGKRFOePSP3uzcrgwf7+4DiQHEbVGY4/
 cl0fwUwhUp450ZywYFsWN6jC4BmJzVJfz8Q10PveJMW6bX2xbCjTPnnTqN5Yex9vpUXUIZygJ2N
 GQhbweQVHeGIOjB81M9r9lh5oKvLeoks4lUDKUOm0/g4FGhOuIJ5j0JOsaLW1v1ymA89Qy/9gta
 KYREaAVLq3EXjGFn1qXoyiQD+GuDZLZyELekk7xzqNYIpwXMqdm0oNLuPEtcF1insTYBAt/K7t+
 uL4Ersmtzmb2wVcCseA==
X-Authority-Analysis: v=2.4 cv=PbrPQChd c=1 sm=1 tr=0 ts=6a7871ca cx=c_pps
 a=0uOsjrqzRL749jD1oC5vDA==:117 a=/JTPBhwEQko7YaD0RKblyA==:17
 a=IkcTkHD0fZMA:10 a=Sv0fKeRqtYgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=3WHJM1ZQz_JShphwDgj5:22
 a=c92rfblmAAAA:8 a=EUspDBNiAAAA:8 a=VwQbUJbxAAAA:8 a=g91HuVkBe_aeT2P-Lb0A:9
 a=QEXdDO2ut3YA:10 a=mQ_c8vxmzFEMiUWkPHU9:22 a=GvGzcOZaWPEFPQC_NcjD:22
X-Proofpoint-Spam-Info: AW1haW4tMjYwODA5MDEwOSBTYWx0ZWRfX6BTu+6rlJNBn
 1yzA2e1wRBLuORzuc6LwQo/omIWXn+AGvweRXFG80i5CtY5vuyeGWExZ9xkKr7eU8+nhS3AKW2T
 2ExR/kA52VgKlpQHkJL8QNQcDVQPrI8=
X-Proofpoint-ORIG-GUID: ZCJVvNsWDJqhCrTiPBEv7vBBH2Vc5i5E
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-08-09_04,2026-08-07_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 clxscore=1015 bulkscore=0 impostorscore=0 phishscore=0
 lowpriorityscore=0 spamscore=0 adultscore=0 malwarescore=0 suspectscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2608090109


On 8/9/2026 12:15 AM, sashiko-bot@kernel.org wrote:
> Thank you for your contribution! Sashiko AI review found 1 potential issue(s) to consider:
> - [Low] Renaming macro definitions in the dt-bindings header without updating corresponding driver usages breaks the kernel build.
> --
>
> --- Patch [1]: [PATCH v1 1/5] dt-bindings: sound: qcom,q6dsp-lpass-ports: Rename QAIF clock IDs ---
> commit 24389528fddee532f4b72dd537118240033f4a3e
> Author: Prasad Kumpatla <prasad.kumpatla@oss.qualcomm.com>
>
> dt-bindings: sound: qcom,q6dsp-lpass-ports: Rename QAIF clock IDs
>
> The patch renames the LAPSS_CLK_ID_QAIF_* macros to LPASS_CLK_ID_QAIF_*
> in the dt-bindings header to fix a spelling typo in the prefix.
>
> Link: https://sashiko.dev/#/patchset/20260804070307.117119-1-prasad.kumpatla@oss.qualcomm.com
>
>> diff --git a/include/dt-bindings/sound/qcom,q6dsp-lpass-ports.h b/include/dt-bindings/sound/qcom,q6dsp-lpass-ports.h
>> index 2e879a3c09aef..3a99703dbc4a0 100644
>> --- a/include/dt-bindings/sound/qcom,q6dsp-lpass-ports.h
>> +++ b/include/dt-bindings/sound/qcom,q6dsp-lpass-ports.h
> [ ... ]
>
>> -#define LAPSS_CLK_ID_QAIF_IF0_IBIT		71
>> -#define LAPSS_CLK_ID_QAIF_IF0_EBIT		72
>> -#define LAPSS_CLK_ID_QAIF_IF1_IBIT		73
>> -#define LAPSS_CLK_ID_QAIF_IF1_EBIT		74
> [ ... ]
>> -#define LAPSS_CLK_ID_VA_QAIF_IF0_IBIT	97
>> -#define LAPSS_CLK_ID_VA_QAIF_IF0_EBIT	98
>> +#define LPASS_CLK_ID_QAIF_IF0_IBIT		71
>> +#define LPASS_CLK_ID_QAIF_IF0_EBIT		72
>> +#define LPASS_CLK_ID_QAIF_IF1_IBIT		73
>> +#define LPASS_CLK_ID_QAIF_IF1_EBIT		74
> [Severity: Low]
> Does renaming these macros here without updating the dependent driver files
> break the build?
Hi Sashiko,

Thanks for the review.

The old LAPSS_* definitions are not used by any in-tree users, so
removing them does not introduce a build regression. The
corresponding Q6PRM updates are handled in the related changes.

Thanks,
Prasad
>
> Looking at q6prm_clks in sound/soc/qcom/qdsp6/q6prm-clocks.c, it appears
> to still reference the old macro names:
>
> sound/soc/qcom/qdsp6/q6prm-clocks.c:q6prm_clks() {
>      ...
>      Q6PRM_CLK(LAPSS_CLK_ID_QAIF_IF0_IBIT),
>      Q6PRM_CLK(LAPSS_CLK_ID_QAIF_IF0_EBIT),
>      ...
> }
>
> Because Q6PRM_CLK(id) concatenates Q6PRM_##id, the corresponding target macros
> in sound/soc/qcom/qdsp6/q6prm.h also still use the LAPSS spelling:
>
> sound/soc/qcom/qdsp6/q6prm.h:
> #define Q6PRM_LAPSS_CLK_ID_QAIF_IF0_IBIT        0x500
> #define Q6PRM_LAPSS_CLK_ID_QAIF_IF0_EBIT        0x501
>
> Do these C headers and source files need to be updated in this same commit to
> prevent undeclared identifier errors during compilation?
>
