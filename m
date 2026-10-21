Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.180.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792579502;
	b=IyQXU9Eq7C0RR8i9WKnADkoHBIMCkscuU5KOCU8/nQiWT9wklPlEzT38ZnkT302OBK4S
	 0ycwkOLVB38xECvH+0QuO6QZhl2wOaF+KxgnRiUTnpZWuojgkH72apskzJWvNDxOW6o2e
	 f9XPT0/EZ4And28K25s8xTIgrJqGIgzvJI+vgWuqpqAS3AAlEsm6E/Ef8C0/7TGI2WA0i
	 Ohb4YmZHGaFqyNsLxMj/4KzKcsj7AyvSEhJJHoKNsAxF2MWt5C/hpvXiYf/P9qe+myDWV
	 6IlG8r3tI3m47iOrdRIGPknwQPbyaaKK4se6tiAB1M7Ew4j/WRf5aka+/y7gqBt5N0w==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792579502;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Gm-Message-State:X-Gm-Gg:
	 X-Received:X-Received:Received:Message-ID:Date:MIME-Version:
	 User-Agent:Subject:To:Cc:References:Content-Language:From:In-Reply-To:
	 Content-Type:Content-Transfer-Encoding:X-Authority-Analysis:
	 X-Proofpoint-ORIG-GUID:X-Proofpoint-Spam-Details-Enc:
	 X-Proofpoint-GUID:X-Proofpoint-Spam-Info:X-Proofpoint-Virus-Version:
	 X-Proofpoint-Spam-Details;
	bh=ik84gjJhQXZyxzqpUBYq3dSc7Euo+Avkq4FYME9dfpE=;
	b=XwMd7NtkCPuSjdwTjuc1eHG426GV4GxqN2KlgnYWXhP8CDG8HZEfSgkiTvd4ci0cUys/
	 c+G2i2Ns8D2wjcwlSPyahxIQQwYH+Oc5eSxdvZfN4/COS+Ywlf1MOrdE5txRjZcfxcUTS
	 Ko7Kwzsj6/Qi4CnjTHxvVVkTfx5d1kXvUd8VooXJLozis9hF9nr8UswaPfyctfRftFyjP
	 ZUK1qDTSdRW0WAl/uOn8PMnslqODI1LlALMt5hK1t/v9WZSnrC9Tj4/ilcNOp/uLqan9O
	 AMOao87bk7MmgmqOyqNSIeK+NNyn34qH252k01/6t4m8rPD/GsQGz/KNXiC7GYBzEyA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=c90OVmmj;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b="HIHN4W/z";
	arc=none smtp.remote-ip=205.220.180.131
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E71AB606A31D
	for <sashiko-reviews@lists.linux.dev>; Wed, 21 Oct 2026 10:45:01 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org E71AB606A31D
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=c90OVmmj;
	dkim=pass (2048-bit key, unprotected) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=HIHN4W/z
Received: from pps.filterd (m0279870.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 69LA6RtF282249
	for <sashiko-reviews@lists.linux.dev>; Wed, 21 Oct 2026 10:45:00 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	ik84gjJhQXZyxzqpUBYq3dSc7Euo+Avkq4FYME9dfpE=; b=c90OVmmjPQw+bVBp
	JuYLpaUHzF8pry/dvoE4zMJMbkN0UdZ51c/FJja3NdSEUtUiah+V2X+l59iOSQ82
	I1+hlzYmRIlQLt8wLJk/qxQsQW9rKylm6h4df5Mi5lRnYKD9JSok7UkP3ppu9QrL
	yyNlTyC0FYPRTvzJKJ5ZqnKn/bTwWDUI00TJpmwhuMo3+XP1NlI3Eq5zEtYpCTFO
	RrNlyuExnTD101II9Vhn17xbwC6Loz9oFFoXmByLZKB0z+pphx3352XtZ75+sOQm
	8YT1NhLx+wRKQDCSbtZF0XaIiodo19RhocKwEPp0oBmaG3Lx97bfK36RzXIXCTGI
	8l1ziA==
Received: from mail-pf1-f198.google.com (mail-pf1-f198.google.com [209.85.210.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4heh5r2m4m-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <sashiko-reviews@lists.linux.dev>; Wed, 21 Oct 2026 10:45:00 +0000 (GMT)
Received: by mail-pf1-f198.google.com with SMTP id d2e1a72fcca58-8a01e2962a1so826012b3a.2
        for <sashiko-reviews@lists.linux.dev>; Wed, 21 Oct 2026 03:45:00 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1792579499; x=1793184299; darn=lists.linux.dev;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=ik84gjJhQXZyxzqpUBYq3dSc7Euo+Avkq4FYME9dfpE=;
        b=HIHN4W/zLLyYs7N5elFvF0q8/9xZ7p9HrrZCyMWydr+qI0iRSa9bz6U4ymZu8XTWiv
         86l59Wh2akewn/CXGrIiEw8Pgp+dPtenOO/h/JSdzk0m1XU7XZQq4Z1pS/nJyBhK3tgu
         Sh6uo4xDTFBLmkaftZq0pYSHmoGjusmvalTw486GXpJPW7gqAEEujWA9e0gneigwGv8J
         5UpTgRVUF1QKQwUCbhKPk9ntNFbrYyYxJ5QgPqV7uZabMCQpj5kqFjr4CXrUlAdvQw0A
         wtfXjWY1jOxStkOxY4ML+qxE8k1cLbcgL/5v2TFYOdHqjjmM0NWGrozfy5PZoxTvx4sm
         HxMg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792579499; x=1793184299;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=ik84gjJhQXZyxzqpUBYq3dSc7Euo+Avkq4FYME9dfpE=;
        b=UMtJ1IkhxeiBPwUmrM1sLoWRuXpJ3o/Pbv7jo1zG2jQ6sIuyDffwXaEHsfwuKAafeU
         /Iol1Ic0tcVdNCvHFzMAOKgdVfZtiENPZ2stLW+3oQbBznjikuk5MysRAjuYf0CHLMdU
         HUp7N+GCDhnPt7iDRreGJG2uz0ruahfOf7kqd0iA30DWp29H6G/rNOrtnPbta/GhNxWQ
         BG/VT+rROYodjA36Q6kwmQwDNvZRjZ7MptIkhkcvJfdzhzFbr/vU2ZUjPn1Sj+QVqL8G
         GjeeWkhjw4mTYA1ppRJXwdG2fxzIG66Cbn/uHvwMmgPQlwRiFn0XYieDOgbkcLrIe0UE
         kwbQ==
X-Gm-Message-State: AFq9FYKxLwReKX9gD7RUb/iiCemVid9qX3SOFiqcjhcy7FLMlgSmn5wu
	hHh28Ga/wr2V9cLehyAQFLxOvOo7+BASJb4n6jjiWdHIjPBZ04WkKCTRDlWW0+7naoUFAVHGZ0m
	m6G7thOuwzq4bMf+MuzuvgBC5Jtmhg16Kg7QpTTJv9QozfHbXSNcik3sfqcjHzfxzD6gDXHMmuh
	/wzhU=
X-Gm-Gg: AYBFou2mVHcs9YlZBv6xu2BMH6trk3lfo0Lu6mmvo7CMA+DMpjzsUS2aR8T7hjwdPBf
	FKUpGzoTzRPpTepKpacM/2SEC75frobYfkTA8yVDqnh9K4kZBMltKqAxPSMN2n2UCCfz7E0Q8aO
	/HUKhl0SN7rTuoEr77+ZpiBh9UB99plnD9SeVdiVA0uYy7kTCZ404p72PHreGm7vIueUjA8HjlU
	Yv0t0mDEe6/GRwWv81Evt940TPeNkM6oPpSTCxOBMf9yKWNitmf9YCwqWrp4klmzV4tcjmMoKY3
	ZvDmoNbg6RH4HRZkAfrOrz4oyZ7SCQQOw6w1rxIkreHCk+p9BP6ctH6fZPD/Nqm30fE2ngjHTWr
	mplvtUpxAIEcCvCegeQHbQI40VhT0ZBzNjg==
X-Received: by 2002:a05:6a00:3687:b0:89f:28c3:aab0 with SMTP id d2e1a72fcca58-8a089d43a8fmr1242649b3a.40.1792579499516;
        Wed, 21 Oct 2026 03:44:59 -0700 (PDT)
X-Received: by 2002:a05:6a00:3687:b0:89f:28c3:aab0 with SMTP id d2e1a72fcca58-8a089d43a8fmr1242630b3a.40.1792579498886;
        Wed, 21 Oct 2026 03:44:58 -0700 (PDT)
Received: from [10.152.193.243] ([202.46.23.19])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-8a0895dba2bsm729437b3a.36.2026.10.21.03.44.56
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 21 Oct 2026 03:44:57 -0700 (PDT)
Message-ID: <3fee0897-a878-459d-89c8-c9dd772c1976@oss.qualcomm.com>
Date: Wed, 21 Oct 2026 16:14:54 +0530
X-Mailing-List: sashiko-reviews@lists.linux.dev
List-Id: <sashiko-reviews.lists.linux.dev>
List-Post: <mailto:sashiko-reviews@lists.linux.dev>
List-Help: <mailto:sashiko-reviews+help@lists.linux.dev>
List-Subscribe: <mailto:sashiko-reviews+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:sashiko-reviews+unsubscribe@lists.linux.dev>
List-Owner: <mailto:sashiko-reviews+owner@lists.linux.dev>
Precedence: list
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH ath-next v2 12/17] wifi: ath12k: Enable MSI interrupt
 support for DP interrupt
To: sashiko-reviews@lists.linux.dev
Cc: devicetree@vger.kernel.org, robh@kernel.org, conor+dt@kernel.org
References: <20261016-mpp-bringup-v2-0-f510c33bfcf5@oss.qualcomm.com>
 <20261016-mpp-bringup-v2-12-f510c33bfcf5@oss.qualcomm.com>
 <sashiko-outbox-173689@kernel.org>
Content-Language: en-US
From: Aaradhana Sahu <aaradhana.sahu@oss.qualcomm.com>
In-Reply-To: <sashiko-outbox-173689@kernel.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Authority-Analysis: v=2.4 cv=aI5lOr9m c=1 sm=1 tr=0 ts=6ad897ac cx=c_pps
 a=m5Vt/hrsBiPMCU0y4gIsQw==:117 a=j4ogTh8yFefVWWEFDRgCtg==:17
 a=IkcTkHD0fZMA:10 a=660iZSQnnn4A:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=gowsoOTTUOVcmtlkKump:22
 a=VwQbUJbxAAAA:8 a=COk6AnOGAAAA:8 a=JXgSEGKP8_NlnuhlkvkA:9 a=QEXdDO2ut3YA:10
 a=IoOABgeZipijB_acs4fv:22 a=TjNXssC_j7lpFel5tvFf:22
X-Proofpoint-ORIG-GUID: 1lv9MzsDdL4KIvFoOGY3V_KlohR3nVji
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMDIxMDA0MiBTYWx0ZWRfX6npl1JimumVT
 p5rPkeNAQ+dlomPx55zuFv7dteWimYttRf6uQdqx8E99BJo3wBeDnQg2/YQwyDS1cYPvIj7P2pO
 8HGsmpXiYxabN/XjZbP8kk5L+HOASx9wZjcMsbZ2Bx7qjUS0BaM9cOqcu51MlUcJy4dxFcV6wC4
 11HtTdf+4JryFfVdB5UcYmxMB7AjFaJmr+uUNWuaLbNGhExVnHvgRWGJ6mo6PButS90kcB6b3HX
 2Wfo+z7JEU4HgTCR91/ZNGHrkqCwFqk9NwV71Qvzs9gSLnTJzVz2Pe+ZIGMs7t1NgtYSDnDOR3Y
 ppv2bwYAAf8TtAYPu2OP0cJB+aQgtxEdx8y6gbI1MqPiYgUtCzYa56/S//UACTTIw0SNly1oNuW
 yPKnxj8J/SsS2OfGgG+70Ulo10eMIcBcVlcqlL5j8gbpnaC9hFAeUb7bR2qtA773Y04gg59+gIH
 Cx9D8K9Q69xDhb6/oNw==
X-Proofpoint-GUID: 1lv9MzsDdL4KIvFoOGY3V_KlohR3nVji
X-Proofpoint-Spam-Info: AW1haW4tMjYxMDIxMDA0MiBTYWx0ZWRfXwGs4NL5uy3Ob
 WD1fEPM65kM3tOnLTCTAfZsxZ1ZUul0K49Z8vcy5Qj5AackH6tDZW+AlMBptRR5y9BpLGoCcX3S
 dCeh99plO1SpfdhwzJHf6pphLDhTa2E=
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-10-21_03,2026-10-19_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 clxscore=1015 impostorscore=0 spamscore=0 bulkscore=0
 malwarescore=0 suspectscore=0 adultscore=0 phishscore=0 lowpriorityscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2610190000 definitions=main-2610210042



On 10/16/2026 9:11 AM, sashiko-bot@kernel.org wrote:
> Thank you for your contribution! Sashiko AI review found 1 potential issue(s) to consider:
> - [High] wifi: ath12k: TOCTOU race drops edge-triggered MSI DP interrupts causing permanent stall
> --
> 
> commit d922087bb1f873dbadddf00fcba276c1d612d2d7
> Author: Sowmiya Sree Elavalagan <quic_ssreeela@quicinc.com>
> 
> wifi: ath12k: Enable MSI interrupt support for DP interrupt
> 
> This commit configures and requests external MSI interrupts for DP ring groups.
> It creates a NAPI context for each active external interrupt group and disables
> the corresponding IRQs while NAPI polling is in progress.
> 
>> diff --git a/drivers/net/wireless/ath/ath12k/pci.c b/drivers/net/wireless/ath/ath12k/pci.c
>> index a26fdb3c0ad27..4bb14a95aec98 100644
>> --- a/drivers/net/wireless/ath/ath12k/pci.c
>> +++ b/drivers/net/wireless/ath/ath12k/pci.c
> [ ... ]
>> @@ -1118,7 +1122,7 @@ void ath12k_pci_ext_irq_enable(struct ath12k_base *ab)
>>  	for (i = 0; i < ATH12K_EXT_IRQ_GRP_NUM_MAX; i++) {
>>  		struct ath12k_ext_irq_grp *irq_grp = &ab->ext_irq_grp[i];
>>  
>> -		if (!irq_grp->napi_enabled) {
>> +		if (irq_grp->napi_ndev && !irq_grp->napi_enabled) {
>>  			napi_enable(&irq_grp->napi);
>>  			irq_grp->napi_enabled = true;
>>  		}
> 
> [Severity: High]
> Can unmasking the hardware IRQs race with setting the software flag?
> 
> In ath12k_pci_ext_irq_enable(), ath12k_pci_ext_grp_enable() is called just
> after this block to unmask the hardware IRQs, but the software flag
> ATH12K_FLAG_EXT_IRQ_ENABLED is only set after the loop completes:
> 
> 	ath12k_pci_ext_grp_enable(irq_grp);
> }
> set_bit(ATH12K_FLAG_EXT_IRQ_ENABLED, &ab->dev_flags);
> 
> If an MSI interrupt fires immediately after unmasking,
> ath12k_pci_ext_interrupt_handler() drops it because the flag is still clear:
> 
> 	if (!test_bit(ATH12K_FLAG_EXT_IRQ_ENABLED, &ab->dev_flags))
> 		return IRQ_HANDLED;
> 
> Since MSI interrupts are edge-triggered, dropping the interrupt without
> scheduling NAPI leaves the hardware condition unacknowledged. No further MSI
> will be generated, which could permanently stall the DP ring.
> 
> Since NAPI is already enabled for the group before unmasking the hardware IRQ,
> is it safe to drop this interrupt, or could the flag be set earlier?
> 

The expectation is that ATH12K_FLAG_EXT_IRQ_ENABLED is set after the IRQ
configuration and enable sequence is completed. NAPI is already enabled before
the hardware IRQs are unmasked.
