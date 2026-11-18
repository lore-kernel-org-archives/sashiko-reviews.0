Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.180.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794979435;
	b=3OMS2k19Y0HCwtuwjyS9Ewj/jLVxZ23MBMaoHwNe5lfOLOFB9WsisdBJHq8ZIM5w+faD
	 4GeFYSoPRoR0qt7oNrdj0XtuY1rf1UYbXpFTe0ORbt0BC5gomBWXaiTBEhdQMN9WN5pYq
	 l+EUZMTguY9HNsZnAxKxK+54HyQjxlFav0RmDTYIYMdZAT2Hf7z6bvlp0NsCXdegceZQq
	 mG916XzVVJk5p5qBUkljt2ciQYqCotjzBsr9ree3zBhBsq4LtozvWhN+V7fgdPLUlyJSm
	 5liaP8WsGgvBrN1HNNbrSHMf85z+KqC1yKzjaBrn+f8U+DQqUM6Qdv4EzNEt+W1b/Fw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794979435;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Gm-Message-State:X-Gm-Gg:
	 X-Received:X-Received:Received:Message-ID:Date:MIME-Version:
	 User-Agent:Subject:To:Cc:References:Content-Language:From:In-Reply-To:
	 Content-Type:Content-Transfer-Encoding:X-Proofpoint-ORIG-GUID:
	 X-Authority-Analysis:X-Proofpoint-Spam-Details-Enc:
	 X-Proofpoint-Spam-Info:X-Proofpoint-GUID:X-Proofpoint-Virus-Version:
	 X-Proofpoint-Spam-Details;
	bh=/xxDnMiHreRzE4y4EglUn8HJtByKaIRrNnJe+dPZ1qY=;
	b=P0iP7FWFEgsQeCDN7FWhrcjSTE8E/Wz5Bf2m9BKhoRszvdfAYS2a95J7zVaKfXTNnS3R
	 lzRhyVLyzX6GWUMhLjDRaEpi03+PriHmRuqQX+x0aL8NDX/CfLGXwIPLgLflW2h0ST+Jo
	 KDWj6pkM+eYb0hT6s+tcNGt5b2J4Q0eDoSedQrl5PkzolenAePk8TsqR3UAwP4g6iZrdr
	 3/1KYYOGGCyo1a5gtGUuJdmIM47EMQ9vojt84Zn+BgqakpDVYAR2K3jaa3FaNAF+p1/12
	 rG+MwabXUU5ymgl3D1VgRcEZDoLQ378s7W6TxRr3CWkI3cQJXqiJOjmgi6tyZeUXg/g==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=igqf0lAp;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b="O4fM1/1p";
	arc=none smtp.remote-ip=205.220.180.131
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7C7AD606A325
	for <sashiko-reviews@lists.linux.dev>; Wed, 18 Nov 2026 05:23:54 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 7C7AD606A325
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=igqf0lAp;
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=O4fM1/1p
Received: from pps.filterd (m0279873.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6AI2UvnN472516
	for <sashiko-reviews@lists.linux.dev>; Wed, 18 Nov 2026 05:23:53 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	/xxDnMiHreRzE4y4EglUn8HJtByKaIRrNnJe+dPZ1qY=; b=igqf0lApBH0VcLWF
	JwSt2q24SyQ3dQsd3zuAdOXhyaOVyxRXyqbKkXU76L1ts0eFWSS7yO9vP0mDSGUQ
	EZ1Bqf2W+cT9Gfmt+/k2Ng/Q4WY7hed0Ea1LwABu4NPOe9WoYq6cFxkERTIndBhf
	SEy7vhDT7fhh1hqT9b82yBjCQdJZq0JSCopTKIHwXiIYFHMKXNZ3Pq7uAjkYrT0G
	totMnQbW2bxHVhZuC02FWb7hfWY8a0pwFNyppqY7xAzBGqoIs7K2O0kcFUk9zJod
	4KPZn96UnYHEIzcg2DNfD1BIrNLqg6uLD3JN9J1saw4q/NQUUU+hHOO8GH1IbrXQ
	1xmPeA==
Received: from mail-pj1-f72.google.com (mail-pj1-f72.google.com [209.85.216.72])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4j0yv89adf-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <sashiko-reviews@lists.linux.dev>; Wed, 18 Nov 2026 05:23:53 +0000 (GMT)
Received: by mail-pj1-f72.google.com with SMTP id 98e67ed59e1d1-3b191f8a9b3so776428a91.1
        for <sashiko-reviews@lists.linux.dev>; Tue, 17 Nov 2026 21:23:53 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1794979432; x=1795584232; darn=lists.linux.dev;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=/xxDnMiHreRzE4y4EglUn8HJtByKaIRrNnJe+dPZ1qY=;
        b=O4fM1/1pni7SURn57r3wH7GD+QT/GK94LenIs9xaMTXthucto9PA+bhiWeCcACjCzk
         U90k3NeqiS81njGORMJQoHRapvd5rJUFBAL07eG+e7oRHbLo7k2S6QZHPauiuX/Apvq5
         JT/94yAgt85f7AKrkIoPAHqRkACBC1VnaulV0w8GqN8Ii+SD9G8M+nbrETpiUPSGTYAQ
         5tj3LTbPH9G13oqvL5bvjHfTqfh/XntMKuZnk4fltaHkIQknuh0WSg5zOHvE15Uw8d2h
         fsgWHIwZRcxf5oGDI/ZCdBsG9SDSoAReNrY27rPsC7ZMXYUADcpQd8m8+5QKnC4OWbE0
         KRPw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794979432; x=1795584232;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=/xxDnMiHreRzE4y4EglUn8HJtByKaIRrNnJe+dPZ1qY=;
        b=s2dmQiKo60kiRhpcVKnjK6iMuJNYjUTnyHXvW5wx+SMWmEVFDjHFQzIGx+NLiuEJwH
         GB/IjPtEg6j2YJ3Jws2iBlp/kBbNZ9OTgt5/Mm7CEVv+M0gj6FPs9/AblRmBgi2mD+pY
         UTnua/Da4bDEgBbUAsgpP6D/Ick5trLzxZoTz0SQEYFKAWD71roreq1zDqv1FpIaQij+
         pzdk68GYQ2Yl3HEjkHkJUCYtzCv4ez2UT0JdQ8KUJUOYoeCaIFtMxlZ2R00scw563x+b
         rZG+JHmz2lh8K9GXT0aF+VAw76qHDBLd59jdS+1nRYjQHCfHmGeISZWhF5Sp0H/cxh4u
         Up5w==
X-Gm-Message-State: APuU4Z/84tbDxah2tLAiVkhUQJMY+Ei3gN4dCz8ZUPy1nPwkitGNAjmj
	dKmK2UMC2+CSj+RhU2337JhH6w5wLlr6hLbLhEeqccTPf4nXfuuwf47HRczsyj+T9ZZvNgZ9hR4
	4+WpOk3C3lrrJrOjrx7lYYl+LcwK5h09kfsnofylYXHNYMkBolIu1XMO++OXlQnpYrB0XumiLMR
	UbTH4=
X-Gm-Gg: AZFdTZeGoXBzGyP466B937ALUdqC5pC+0UNU6KATWGGGcW7aylKm93ZjzE8pSrSxZ7H
	4wQ2tmWfIqkgbry+4ebisSMmngYdOuf65BRYk7XdYeoQI2QrFzMCTKoux9GEJQjOj0cGDGAPjLl
	HzbTcz5fZlgMgy/fracXk25fMnuunorwOp+PzUNr6Qxgp23laDo41Af8tBtk5/rSk5sOknSwSst
	RwfYbiLviE1QTpYC876y8kEnqKjKML7XWsEOKmnKl6I937iImIGtJgsS9aEgqdmUrJUgB8W1GJ/
	c2zc+u8UV3rT3n/wERe63UkTqxtpeoIBFwCmJaf5dbr/4Z8kkQqrq97DPap9QhZAwrxoAljkxX8
	mFTDxgGH70Ecw+e7A1hGGrIuo8jrrdLb2PRxdmMsnUeSk597ksmj8FFbZSSFh9+7hmQX/bV7Ivm
	EtnvngBtYw7g==
X-Received: by 2002:a17:90b:4b82:b0:3b3:b632:7f1b with SMTP id 98e67ed59e1d1-3b3d07598b8mr1726899a91.12.1794979432250;
        Tue, 17 Nov 2026 21:23:52 -0800 (PST)
X-Received: by 2002:a17:90b:4b82:b0:3b3:b632:7f1b with SMTP id 98e67ed59e1d1-3b3d07598b8mr1726866a91.12.1794979431674;
        Tue, 17 Nov 2026 21:23:51 -0800 (PST)
Received: from [10.152.203.150] ([202.46.23.19])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3b3d1acde50sm2383976a91.14.2026.11.17.21.23.49
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 17 Nov 2026 21:23:51 -0800 (PST)
Message-ID: <c32bcfe7-4258-47b0-9f71-c26bb232c23a@oss.qualcomm.com>
Date: Wed, 18 Nov 2026 10:53:48 +0530
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
Subject: Re: [PATCH ath-next 08/15] wifi: ath12k: add Wi-Fi 8 HAL ops and
 descriptor definitions for QCN9575
To: sashiko-reviews@lists.linux.dev
Cc: devicetree@vger.kernel.org, robh@kernel.org, conor+dt@kernel.org
References: <20261112-wifi8_qcn9575_bringup-v1-0-3f30fbc2bb69@oss.qualcomm.com>
 <20261112-wifi8_qcn9575_bringup-v1-8-3f30fbc2bb69@oss.qualcomm.com>
 <sashiko-outbox-210876@kernel.org>
Content-Language: en-US
From: Madhavan Ganesan <madhavan.ganesan@oss.qualcomm.com>
In-Reply-To: <sashiko-outbox-210876@kernel.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Proofpoint-ORIG-GUID: G8qzZgbiDA8LSaNNYfVO8uaN4PQF_LdS
X-Authority-Analysis: v=2.4 cv=N9u8hG9B c=1 sm=1 tr=0 ts=6afd3669 cx=c_pps
 a=RP+M6JBNLl+fLTcSJhASfg==:117 a=j4ogTh8yFefVWWEFDRgCtg==:17
 a=IkcTkHD0fZMA:10 a=zJRp6_cAMcgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=rJkE3RaqiGZ5pbrm-msn:22
 a=VwQbUJbxAAAA:8 a=EUspDBNiAAAA:8 a=s3KEoQyvBckcJShn9SoA:9 a=QEXdDO2ut3YA:10
 a=iS9zxrgQBfv6-_F4QbHw:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTE4MDAyMSBTYWx0ZWRfX/TH4Pv+5cwim
 CagMYZL7b38dAZcaCx2W6KNp5NpwIiz14ZB7Fhjqh5Z/oOAiFnW/kMGKBX7rJRl1Gv+081fm3v/
 +7Q87sOPIjW6wcml2dsOksYrSGHGs8BxRKTRFlfpMNxDk3gXdbekc9MTmxBoj2Td1cUKSgF7osM
 VJYosbkFAH89rA9XeVpJSJCCpWVsvMCTcgbhD7VROIkRU04BiY6ampJakzhV62GmIZgTQGsBHOp
 ZsZZwW09x3VOnIF3rLtHn6kYY3S+xd0iniTuoTkG8E2rN2BEXfXnhOrzC9hyFJA304Eilph9+PN
 jaevW8xCQtNwJFFFkz+EXeTxQz0MtJJUOKvS0LdfrsXAY9/+Y3CrunqwWMfppgDpQk0AxSyGlDX
 FoFo4Dgpre+Gq1pnE34n6DM8liGinYJpO7UL7GVmNJYNdMzhMJ13GerWqrlD0JyWr92XHsDIKdu
 vM947RYB0S6xSJckkyg==
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTE4MDAyMSBTYWx0ZWRfXxYLgAR8P5wTz
 C57QrRhppE7Nrn1pfkHPxvfgaJgbRh5NH58DTwybdES/8j9AtURdJjHhLckoKyluovfOY50GHUS
 /REMW25xRbz1QVgLaB+RGx+WMcBZHi0=
X-Proofpoint-GUID: G8qzZgbiDA8LSaNNYfVO8uaN4PQF_LdS
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-18_01,2026-11-16_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 adultscore=0 phishscore=0 suspectscore=0 clxscore=1015 impostorscore=0
 priorityscore=1501 malwarescore=0 lowpriorityscore=0 bulkscore=0 spamscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2611040001 definitions=main-2611180021



On 11/12/2026 2:55 PM, sashiko-bot@kernel.org wrote:
> Thank you for your contribution! Sashiko AI review found 1 potential
> issue to consider:
> - [High] wifi: ath12k: undersized srng_config in
>    ath12k_hal_srng_create_config_qcn9575()
> --
> 
> commit a0803bb7ba2b3bd95c6970f62088631be5af1b5d
> Author: Madhavan Ganesan <madhavan.ganesan@oss.qualcomm.com>
> 
> wifi: ath12k: add Wi-Fi 8 HAL ops and descriptor definitions for QCN9575
> 
> This commit adds Wi-Fi 8 HAL operation callbacks, CE descriptor
> definitions, and wires hal_qcn9575_ops into the QCN9575 hardware-version
> map.
> 
>> diff --git a/drivers/net/wireless/ath/ath12k/wifi8/hal_qcn9575.c b/drivers/net/wireless/ath/ath12k/wifi8/hal_qcn9575.c
>> index 56d45785ecd44..076a5a609f8b6 100644
>> --- a/drivers/net/wireless/ath/ath12k/wifi8/hal_qcn9575.c
>> +++ b/drivers/net/wireless/ath/ath12k/wifi8/hal_qcn9575.c
>> @@ -2,8 +2,37 @@
>>   /*
>>    * Copyright (c) Qualcomm Technologies, Inc. and/or its subsidiaries.
>>    */
>> +#include "hal.h"
>> +#include "hal_desc.h"
>>   #include "hal_qcn9575.h"
>>   
>> +static const struct hal_srng_config hw_srng_config_template[] = {
>> +	[HAL_CE_SRC] = {
>> +		.start_ring_id = HAL_SRNG_RING_ID_CE0_SRC,
>> +		.max_rings = 16,
>> +		.entry_size = sizeof(struct hal_ce_srng_src_desc) >> 2,
>> +		.mac_type = ATH12K_HAL_SRNG_UMAC,
>> +		.ring_dir = HAL_SRNG_DIR_SRC,
>> +		.max_size = HAL_CE_SRC_RING_BASE_MSB_RING_SIZE,
>> +	},
>> +	[HAL_CE_DST] = {
>> +		.start_ring_id = HAL_SRNG_RING_ID_CE0_DST,
>> +		.max_rings = 16,
>> +		.entry_size = sizeof(struct hal_ce_srng_dest_desc) >> 2,
>> +		.mac_type = ATH12K_HAL_SRNG_UMAC,
>> +		.ring_dir = HAL_SRNG_DIR_SRC,
>> +		.max_size = HAL_CE_DST_RING_BASE_MSB_RING_SIZE,
>> +	},
>> +	[HAL_CE_DST_STATUS] = {
>> +		.start_ring_id = HAL_SRNG_RING_ID_CE0_DST_STATUS,
>> +		.max_rings = 16,
>> +		.entry_size = sizeof(struct hal_ce_srng_dst_status_desc) >> 2,
>> +		.mac_type = ATH12K_HAL_SRNG_UMAC,
>> +		.ring_dir = HAL_SRNG_DIR_DST,
>> +		.max_size = HAL_CE_DST_STATUS_RING_BASE_MSB_RING_SIZE,
>> +	},
>> +};
>> +
>>   const struct ath12k_hw_regs qcn9575_regs = {
>>   	/* SW2TCL(x) R0 ring configuration address */
>>   	.tcl1_ring_id = 0x00001604,
>> @@ -40,3 +69,55 @@ const struct ath12k_hw_regs qcn9575_regs = {
>>   
>>   	.qrtr_node_id = 0x01e03300,
>>   };
>> +
>> +static int ath12k_hal_srng_create_config_qcn9575(struct ath12k_hal *hal)
>> +{
>> +	struct hal_srng_config *s;
>> +
>> +	hal->srng_config = kmemdup(hw_srng_config_template,
>> +				   sizeof(hw_srng_config_template),
>> +				   GFP_KERNEL);
> 
> [Severity: High]
> Does sizing hw_srng_config_template[] implicitly cause out-of-bounds reads
> on hal->srng_config?
> 
> Because the highest designated initializer is [HAL_CE_DST_STATUS] (10),
> hw_srng_config_template[] has only 11 entries, and kmemdup() allocates an
> 11-entry buffer for hal->srng_config.  Common HAL code such as
> ath12k_hal_srng_shadow_config() iterates up to HAL_MAX_RING_TYPES (25):
> 
> drivers/net/wireless/ath/ath12k/hal.c:ath12k_hal_srng_shadow_config() {
> 	for (ring_type = 0; ring_type < HAL_MAX_RING_TYPES; ring_type++) {
> 		struct hal_srng_config *srng_config = &hal->srng_config[ring_type];
>      ...
> }
> 
> This reads past the end of the kmemdup() allocation for ring types above
> HAL_CE_DST_STATUS.  Declaring
> hw_srng_config_template[HAL_MAX_RING_TYPES] would ensure all ring types
> are allocated and zero-initialized.
> 

This is a false positive, since the CP/DP changes will complete the table.
