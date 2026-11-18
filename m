Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.180.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794979408;
	b=f/cB2IEH6SRnBCg9wmYVXdLsvhhvFzI/Nbtl6GOVaQQuI5/Ybp5dWWIkf+nd8w5llxJZ
	 Z2/IIEqHuls946c0rRbwaPA9oUOPzaoiZg3JiZ8ScvChHnPRpBKQn53wcEdY0EB/4FdBO
	 Mdf3l4gn3wz4Me6Or9BxVHQI0mj3uhZ+CAqwbcXUSeYtaGw0WDVdIeNQpqRiUfT/ugTgF
	 slAgo0gqACg4WAPSIFFkYWaATl9sPjP7yoX84A3vYRRFkTtq0EU7vuRigXY8yubAHtjJn
	 T1qHkk7SS+F+gihBUBp/KDPDnpNFm7o3iUorfLobwgdYeIpgaYPhF8x3mOcplyrYxJw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794979408;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Gm-Message-State:X-Gm-Gg:
	 X-Received:X-Received:Received:Message-ID:Date:MIME-Version:
	 User-Agent:Subject:To:Cc:References:Content-Language:From:In-Reply-To:
	 Content-Type:Content-Transfer-Encoding:X-Proofpoint-ORIG-GUID:
	 X-Proofpoint-Spam-Info:X-Proofpoint-GUID:
	 X-Proofpoint-Spam-Details-Enc:X-Authority-Analysis:
	 X-Proofpoint-Virus-Version:X-Proofpoint-Spam-Details;
	bh=KvlKFwhN06lwVbrkhz9hsAuHwVFHzHQwbKVuqeI2S/Y=;
	b=wRC4rjldIouPAvxarUGSCDlCP+QygwBj3duS3wT86YW7ajWUuFYI8HRMB5TLuKRXBRcw
	 8V/l83ic2fewn+k6jck/BAqX6fdBNAD4485/gN+wRQZ4hoq8VK56peyKtWqVfct7aawE2
	 iCI2BoXbI0fVdmwEWwMk/bb8gcKalYkgLl2wo78CTxgGoDEfEKLn+Oxttpgitmw/yB+9k
	 LJaW+dVRsuDqmR7siauE7m7JU/Gn5XvTKa8QbIrt3mEJCvP35mW3DAUp8WdQsjvBUFa63
	 z4n8n2Mv6SIXnkUpdIozwUBGOd2ceq/QdMIBEHtSISNr56ghy25C8ocQ9k/8dC+TBnA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=bvPG+c3O;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=RJeIsNAO;
	arc=none smtp.remote-ip=205.220.180.131
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8B73E606A31C
	for <sashiko-reviews@lists.linux.dev>; Wed, 18 Nov 2026 05:23:27 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 8B73E606A31C
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=bvPG+c3O;
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=RJeIsNAO
Received: from pps.filterd (m0279868.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6AI2VBEP2106531
	for <sashiko-reviews@lists.linux.dev>; Wed, 18 Nov 2026 05:23:26 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	KvlKFwhN06lwVbrkhz9hsAuHwVFHzHQwbKVuqeI2S/Y=; b=bvPG+c3ObKfev37U
	j3IWYTk0gabF0OgbX27E78K5NpHAfgFliZ7q5NR2FHJLxjXoZeyIB7Z0rN3sG7L8
	FNzJBSLmEKouDHCBCj8PXm7I/HmNkL8/LBxQd5lUces6Ek/WpnHoLivGAbU3tg50
	Hu9eE5w60JkBT4AjqOSRo5T5VOJzbZxBJlCC1t8rm5A8pfx56hDViT41SpdOjgig
	04lGeSl58u+JO4N8xeqVC1hWAtGjcDw07hza+yLec9MAmagPdmWT+FJdZT1UMXlB
	sBWSf4PhgAmm5ep6C+F5dcjuuT0wLsS/CWktqIq9RUBKVB4kV7zeHjp5/IDtmctN
	bQol5A==
Received: from mail-pf1-f199.google.com (mail-pf1-f199.google.com [209.85.210.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4j0yv8sac5-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <sashiko-reviews@lists.linux.dev>; Wed, 18 Nov 2026 05:23:26 +0000 (GMT)
Received: by mail-pf1-f199.google.com with SMTP id d2e1a72fcca58-8b852fdd55aso741023b3a.0
        for <sashiko-reviews@lists.linux.dev>; Tue, 17 Nov 2026 21:23:26 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1794979405; x=1795584205; darn=lists.linux.dev;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=KvlKFwhN06lwVbrkhz9hsAuHwVFHzHQwbKVuqeI2S/Y=;
        b=RJeIsNAOhppfELLrDflmI1re03zMEJtlB9J2MSMC0bNGe49j8z34gWWXKmwizuzXYK
         Y6wldj2g6AlMmoXiXn6gZuCFX3VQr5+xik85YBu8+2xKLyk3JtZQsxiD8sC4BVryfwpU
         fiJ1Thv5DKwZiW4S9yKzNc692aGFQiK5+i2+uL3SkW9gsU+4n67NXC8TBNETEAbSc2Ms
         x/+5BcaVFL/RUAj4oYb2Bdf0Z+CYkiQxhZQz2arBHqrr6PksGCS+h4I30Du1xuXlbXWq
         nBwW8zGJOk4kmslyTy/vxB8ETwSksrZn79bvTCh1wbggTOC41zcpYKNVQ1O7B9e+YRdw
         bbNQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794979405; x=1795584205;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=KvlKFwhN06lwVbrkhz9hsAuHwVFHzHQwbKVuqeI2S/Y=;
        b=JeAkQNLxyabxtIVEzS+6PDwak0hneHhYcvpbjoqnAWGa4CFIZNGyjwEvTZHIFDM/7B
         x4dutLCF5C0dxT5nqamCPO17dyg28kA/+nKO3bhrjWxe1d7KvyGxNXws6uyw6IqWmm4c
         YgGw5nAHulQbIvLJW4WIqySjhsJZpIkrZeWdX23sRVGLvHsJJa07vVBB+NOJaYTVCCb9
         mV5tV4duO+5vK7VJZ+BfKBPRqZfaHZI7DyHbtPG+kAi8FF9KQtYNPg0mkA0sybWL+Zui
         Y++m/FLv+mp34s7D2rr4woBL68oY1jejePyfZbUIKaFKH+1PxGoup10oFoqdarD77Wio
         PuGQ==
X-Gm-Message-State: APuU4Z+ZbWd5G5xHrbGPDg0NkUwKlZ5wCOvJtcIlbmPhKLe99H2vOtDL
	8MHN1mDNsyPmDvaP76yMuEhCvxCTQ+Nn61p/Jacb6BnIWzV+KNKevSJiOg9dpE0ykeZfoHhPj+q
	McVG6q6CBel8seOHT5cL9M5Ipd7nFJVac2PaSaITuomKWUD/DV3xXAAGinhjPaLTgBO5zb1z1Sl
	C/GxM=
X-Gm-Gg: AYBFou3AOpWHh9+nzkJkg1LY0xAMsdYLG4zXykDjC2rgdPSvS6tSaxFNmZzfdYpLcps
	n94WTC+30c9Ii21WsEgBvPpbXPZzqo4H6OgntxjREVKxQ1/WPflcIlJO7CTxscoV3P71972AoGN
	a3NKnbB7P2FAPclik4qx64HTSJOR5u1zB2Z2Kieq9+Jx5RaDAEj5k+2ox0hJMNuwHseos4qKZqk
	cyTedbwVtonhOHLAQczqu9Py6S1exIZTqAKi3fvwW+qZMMmFNFFD6uKrfLE1wg9okzIGFhsP9c5
	jBfqzFNq3to2fgRX0iv/uz8Pxoj78hR8s40NexYYGNt2H9+jsfOQ0PBnLQMt9kRFRsfp5cNmvoD
	Pa9SsqiwdIQSAHQtUAkQgku7DKpR2HxMIz0+BPUQ1QEb2h4qEng9+sWnTlGnXeb74fqVe+5rg3T
	2F+Cer/vJmSw==
X-Received: by 2002:a05:6a00:2296:b0:898:664:446 with SMTP id d2e1a72fcca58-8c5d4cbe512mr1463001b3a.54.1794979405170;
        Tue, 17 Nov 2026 21:23:25 -0800 (PST)
X-Received: by 2002:a05:6a00:2296:b0:898:664:446 with SMTP id d2e1a72fcca58-8c5d4cbe512mr1462990b3a.54.1794979404720;
        Tue, 17 Nov 2026 21:23:24 -0800 (PST)
Received: from [10.152.203.150] ([202.46.23.19])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-8c5ca7aa75esm523475b3a.15.2026.11.17.21.23.21
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 17 Nov 2026 21:23:24 -0800 (PST)
Message-ID: <c539bd0d-e54f-4858-96ce-84b02f7f9ef7@oss.qualcomm.com>
Date: Wed, 18 Nov 2026 10:53:20 +0530
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
Subject: Re: [PATCH ath-next 02/15] wifi: ath12k: refactor PCI window
 selection to per-device layout
To: sashiko-reviews@lists.linux.dev
Cc: devicetree@vger.kernel.org, robh@kernel.org, conor+dt@kernel.org
References: <20261112-wifi8_qcn9575_bringup-v1-0-3f30fbc2bb69@oss.qualcomm.com>
 <20261112-wifi8_qcn9575_bringup-v1-2-3f30fbc2bb69@oss.qualcomm.com>
 <sashiko-outbox-210781@kernel.org>
Content-Language: en-US
From: Madhavan Ganesan <madhavan.ganesan@oss.qualcomm.com>
In-Reply-To: <sashiko-outbox-210781@kernel.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Proofpoint-ORIG-GUID: ykW9h_s48M_cjtqzHCUHtMI8I8d2_9qy
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTE4MDAyMSBTYWx0ZWRfX61TJWcAB7Oye
 H/vOnI5HVvvVFxv/ynZKzsqha6ZLlmdQGxxrG190ubZHynHRevFr8DIoNDsWaAomWbHfFIdDp4i
 iSbC8cFSxgrhYIph1eIywnbShXXHrFU=
X-Proofpoint-GUID: ykW9h_s48M_cjtqzHCUHtMI8I8d2_9qy
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTE4MDAyMSBTYWx0ZWRfX2nPIuCKMY37D
 7Efd3yxI/khywXGlaXD4a2j+JdI2JxdVhrfO44Drq5MBJSoSWHrRAFS4BUtqfG7d6VoaKg6TNPq
 RTuAdqSx41s6A3UdW3CZOnsMkijzKKAc8ETLFzTjQ/j0LHk1CKQKIsRvnR51frpKBjv3C7sbatH
 hU7CSbmwngs86JZrFcjUUs+JuTB65BkHXMPwcaENCrj+CcSDHGwWyJeIPRHbHMU5zPeyAXgGhA+
 1Tf8vC1uC6oVVOYnFHnnm21Hmc5YOBYpDIKD6rJvJrVq8oqqBwDYUrWg6VmNRq0EVFbbwYEL1W8
 T5sGqt3W0HKoGpObVZwW+Yf9SHuRGHhMhgifA3sFfqB3zcInBSW/xhpdIEsH6YM1bWYemPSoYHi
 cd3EHkbvMcVKvQp+i7KUDzAv6YHOrvMtE7NFZSePcaCbIe8GCVZl2wnSV93wyz+aibCVLRNuNPg
 9Bg/jX7vXFW1NnAQSBQ==
X-Authority-Analysis: v=2.4 cv=NNVAaE6g c=1 sm=1 tr=0 ts=6afd364e cx=c_pps
 a=WW5sKcV1LcKqjgzy2JUPuA==:117 a=j4ogTh8yFefVWWEFDRgCtg==:17
 a=IkcTkHD0fZMA:10 a=zJRp6_cAMcgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=ZpdpYltYx_vBUK5n70dp:22
 a=VwQbUJbxAAAA:8 a=EUspDBNiAAAA:8 a=K-b-3miF6ZPmIZDwxpkA:9 a=QEXdDO2ut3YA:10
 a=OpyuDcXvxspvyRM73sMx:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-18_01,2026-11-16_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 bulkscore=0 priorityscore=1501 malwarescore=0 phishscore=0 adultscore=0
 suspectscore=0 clxscore=1011 impostorscore=0 lowpriorityscore=0 spamscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2611040001 definitions=main-2611180021



On 11/12/2026 2:16 PM, sashiko-bot@kernel.org wrote:
> Thank you for your contribution! Sashiko AI review found 1 potential
> issue to consider:
> - [Medium] wifi: ath12k: hardcoded 0x3f window mask in
>    ath12k_pcic_select_static_window()
> --
> 
> commit bb1726c3a715437675ea3d3a7a6b0b741f959d92
> Author: Madhavan Ganesan <madhavan.ganesan@oss.qualcomm.com>
> 
> wifi: ath12k: refactor PCI window selection to per-device layout
> 
> This commit moves PCI and AHB register window masks and register offsets into
> per-device layout structures so device families with different window layouts
> can configure their own window mapping.
> 
>> diff --git a/drivers/net/wireless/ath/ath12k/pcic.c b/drivers/net/wireless/ath/ath12k/pcic.c
>> index b6d306fd3b99f..cd04b9531d912 100644
>> --- a/drivers/net/wireless/ath/ath12k/pcic.c
>> +++ b/drivers/net/wireless/ath/ath12k/pcic.c
> [ ... ]
>> @@ -32,7 +38,7 @@ static int ath12k_pcic_select_static_window(struct ath12k_base *ab, u32 addr)
>>   	const int max_retries = 10;
>>   	int i;
>>   
>> -	window_bits = u32_get_bits(addr, WINDOW_VALUE_MASK);
>> +	window_bits = field_get(ab_ahb->reg_base->window_value_mask, addr);
>>   
>>   	/* Update window bits [5:0], preserving other bits */
>>   	new_window = u32_replace_bits(ab_ahb->static_window_reg, window_bits, 0x3f);
> 
> [Severity: Medium]
> Should ath12k_pcic_select_static_window() use
> ab_ahb->reg_base->window_static_mask (like ath12k_pci_select_window() does)
> instead of hardcoding 0x3f here?
> 
> Leaving 0x3f hardcoded leaves struct ath12k_ahb_reg_base::window_static_mask
> unused across the driver and truncates window_bits to 6 bits on AHB/PCIC
> devices whose dynamic window field is not bits [5:0], misprogramming the
> window register during CMEM accesses.
> 

I will address this in the next version.
