Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.180.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794987218;
	b=rpBnfZCaKhfOBgKkPcFBhqvmnFfmM5nmcVYyT7ZPvKTb0fDwpRTOKybJnobsCuUvYkzc
	 1tlhXaXwXGztmOkgcAzdM9JlQFwlSF7QqOFVYtrkURyvP9zcyMo5sXow28S6OIRSl7s/q
	 tWBb/8JvRaAe4sXUoTG9IBChJMJI2/zjxeSen1j+wHAuabDe9yzgh2hg+5xnvj/XOzYR7
	 kLOZU4kG3tLjM2WB/nyKRoiFITlEmU7A2A8JK7XYgbAX8sJx1VJEVoWnwfsAYRtTAXNbv
	 zGetA721E4PjHN6SGqnDZDCLOXan2RKqCjOynnyMTG4KlUQp/eaX8UMjPUZR2qSy7qw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794987218;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Gm-Message-State:X-Gm-Gg:
	 X-Received:X-Received:Received:Message-ID:Date:MIME-Version:
	 User-Agent:Subject:To:Cc:References:Content-Language:From:In-Reply-To:
	 Content-Type:Content-Transfer-Encoding:X-Proofpoint-ORIG-GUID:
	 X-Proofpoint-Spam-Info:X-Proofpoint-GUID:
	 X-Proofpoint-Spam-Details-Enc:X-Authority-Analysis:
	 X-Proofpoint-Virus-Version:X-Proofpoint-Spam-Details;
	bh=fKiQf0NBcUBsU2pcKcQNNnQnxuzDCkqCYxmq+8T0PdI=;
	b=4E+PUU+/Dw3ynMOrBKl8RI5pAQ5UombbROFNfAGXwwjA3NGr6+6IF8fEWqjwttxE4IE4
	 lo/h1SgcvjSyDzPpem+uVw1XLGL4/DInLKUeUODqPxzZtmlpNy24dk+MbHs8+fhk8n/QD
	 4B0rgtJLWOr+vAZq94j+4dgon5sxUw6uPKO9mywBPiQQsL8yTrdnIztGp0QFgz5R6v+bw
	 dVSC0mKwC/kJofQGbRX9StX4cTjBhnUWOBtwoCagVbiHQ3bAq0Mf0R4IbsGX4ijVriu26
	 ggOOLezleYQgEwKXW3bNDshuRukpZgVqMXrH947ToraVjrg4gimGylQbjLspVPP87og==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=dTrpUWTA;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b="QNyZEat/";
	arc=none smtp.remote-ip=205.220.180.131
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7D39F606A330
	for <sashiko-reviews@lists.linux.dev>; Wed, 18 Nov 2026 07:33:37 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 7D39F606A330
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=dTrpUWTA;
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=QNyZEat/
Received: from pps.filterd (m0279868.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6AI2V1VK2106311
	for <sashiko-reviews@lists.linux.dev>; Wed, 18 Nov 2026 07:33:36 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	fKiQf0NBcUBsU2pcKcQNNnQnxuzDCkqCYxmq+8T0PdI=; b=dTrpUWTAkiaRQcEq
	QzzQnlzKTT48wbMM/ogzmRK2Rg1c75MStcXKS+eS4QoBa5WY/s86QC7C069MAiob
	K4Uq/TS40RNvfDKKmSHBftY121sqlfUHFViQxi8rVDPRwFmKqe1kZbHfapR3rQvM
	iipMjKi2lO+8cJYl4GdmClX2g+09Ml4lrIOdWbkc/10hTKF8dufXL2j9LSRYm6wN
	1S9sNhvPDAEhgSEXWvU8bFkKTQUp6VR9AxtFaz++BHRDAGnbICQdvTsO7L/k8BgZ
	Fdv7n1eWpdBjzb4gmOEYb3k66JN1NQmpP3kl+t/14ynb+Qu/WVYR1XwZRXtu4OZl
	rLNUQg==
Received: from mail-pj1-f72.google.com (mail-pj1-f72.google.com [209.85.216.72])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4j0yv8ssde-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <sashiko-reviews@lists.linux.dev>; Wed, 18 Nov 2026 07:33:36 +0000 (GMT)
Received: by mail-pj1-f72.google.com with SMTP id 98e67ed59e1d1-3acc98e3b3cso513818a91.3
        for <sashiko-reviews@lists.linux.dev>; Tue, 17 Nov 2026 23:33:35 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1794987215; x=1795592015; darn=lists.linux.dev;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=fKiQf0NBcUBsU2pcKcQNNnQnxuzDCkqCYxmq+8T0PdI=;
        b=QNyZEat/Py5XZF0+qwNqIDMuPvlFJMKOFqS0E7fNsSpiT0Qm+CfNghSX/SM9V90/C2
         iakSAiAuK5I4ufZvgb3fRE/QTgi6XAiUO7bOt38MCYCQScB+TNc7k6HzxHtEKJmGEt/a
         4ZwsLwyu3KwfpdE3cW87DSvio7LRBLoSemlfv+hTEn/lr5iMOjQjBxH9RJv1xgenlqdc
         hKMQPxp8e0c6cdw+ioZ4RyX5DOppXuXUexBc536opQflwOUJGb8azQLaWVS2cgd+g3iu
         OnaDwIp4ZGuVdBZza9VJ5wuzXw5d5HpokGQgSRo5NK7ScEtSGKLVfi8zEdBUGzzRMjkP
         ccJQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794987215; x=1795592015;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=fKiQf0NBcUBsU2pcKcQNNnQnxuzDCkqCYxmq+8T0PdI=;
        b=dIZfbtUPW9SPzGnHZive0SYCAsX0+LKm6r+Ym6U7pI3z29y+fepGnHbWAbMH73qKNV
         k0bHDPhw//R4CZJR576PYDgNT2ZB1Yio+OjHlE+SQP41v0k08HTgRqWstAsStfMysxhK
         NJwhTV0BGNKNisvAX64KF3HdxP30+/P/ruTu3lripgcWCNZAvjMCaE5azmceT/HigWOq
         c6/9clNHzJX0Zu+rNHD/yrt6py3jri8dHHxxN063aWxF0bilr8ImtC0ZHy/z4NxZuSwd
         9W/onLglB+uC7qZCF1i6m/Pzv8Ds9aaobfosUbC0CtrIH+oc0ohNzPfSM4BzYjoVgYep
         0+Gw==
X-Gm-Message-State: APuU4Z+ZUBIM1NKT265ZTHJZUdrF6RlNrWbyD+r3ucXAqe5y42uYyTJz
	i0HL1y7+nwSTnD53rZdDvRGRT4QpFcOrQUJefqM7shDhzPHAfXfuKLJoxoTDkKxrbs98dNFF8xQ
	zEClpDPGxtqmFv2o26ustSIjFxg9g50518SFAyxxfvIoxiAiS0cbaVjZLGI+nElqHfhkiK+HQnj
	uthxU=
X-Gm-Gg: AZFdTZdIF91Gfx4exx/RQwXFQLzCP0/o/mObokyVcam4nX1j968nP83M3Q19Ktk//bx
	7YBTFQPxWNcnvJDYTtWGBrNb3euvlSp//unmij2vlASS0hb8VQ1V2YX1QNyD/E2yyq8VoH8+BNJ
	1IxDyayMPBr1F/pmwX+PF7Un14kC+yUFr014vU9ZHBBNeacgrrWvPai4QqxjoxvxOoik2GFvUAW
	gfS3c/Dk7EbIHtgI21G7N9qeDw0XoIi9Ie956mo00ix6+0m/mP8PQDxgP8fxz7hQQgDabDkbphH
	nk4tZO6PJtLFzvNnjdSbvwC47dnsrNuOQiweb75UekvqdDuNuTx8Bd61HevbIxTyzyxwKXYlzkP
	DyuHQ83csKDH+YBnd13lCzrM1e0SHr/Y5rWnUoCh66cqhyhN0lhAkCpxQqnN+qvYviZ6UrSRUfS
	s9KvQJgXYQXA==
X-Received: by 2002:a17:90b:2243:b0:3a7:82ef:bcdd with SMTP id 98e67ed59e1d1-3b3d07a44a5mr1948876a91.41.1794987214672;
        Tue, 17 Nov 2026 23:33:34 -0800 (PST)
X-Received: by 2002:a17:90b:2243:b0:3a7:82ef:bcdd with SMTP id 98e67ed59e1d1-3b3d07a44a5mr1948847a91.41.1794987214019;
        Tue, 17 Nov 2026 23:33:34 -0800 (PST)
Received: from [10.152.203.150] ([202.46.23.19])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3b3d1acde50sm3056463a91.14.2026.11.17.23.33.31
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 17 Nov 2026 23:33:33 -0800 (PST)
Message-ID: <e085eb40-64fc-44a7-a2e1-45209c73752e@oss.qualcomm.com>
Date: Wed, 18 Nov 2026 13:03:30 +0530
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
Subject: Re: [PATCH ath-next v2 02/15] wifi: ath12k: refactor PCI window
 selection to per-device layout
To: sashiko-reviews@lists.linux.dev
Cc: devicetree@vger.kernel.org, robh@kernel.org, conor+dt@kernel.org
References: <20261118-wifi8_qcn9575_bringup-v2-0-d81a3046290e@oss.qualcomm.com>
 <20261118-wifi8_qcn9575_bringup-v2-2-d81a3046290e@oss.qualcomm.com>
 <sashiko-outbox-220253@kernel.org>
Content-Language: en-US
From: Madhavan Ganesan <madhavan.ganesan@oss.qualcomm.com>
In-Reply-To: <sashiko-outbox-220253@kernel.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Proofpoint-ORIG-GUID: jLn5TsP6q2RmpABU1VHYXF0U4ORwmq8N
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTE4MDAyOSBTYWx0ZWRfXxIxHyFyznP3K
 qK90F+L5R4bg8+WC3EMCHWZ7b4YyDqqtVCHnGNdDdcBIsmLVAn+75gvvbzEfMzIzcDH4vP5Ro+S
 jx/HUYhBfMt+FGIfFcut7TUjvrXlXUo=
X-Proofpoint-GUID: jLn5TsP6q2RmpABU1VHYXF0U4ORwmq8N
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTE4MDAyOSBTYWx0ZWRfXxj8GAj4Wmqg8
 r1LAHRcRZY2d2tYKu5OMcFfLj9NOezboMK9Y7zT3KnCTpJODaI7Zz+QVQE9IkhHddS7DzxhkE66
 b3EvcBNEprKIiXKMfjUyC7pkUe2uBtqBfrKWVpneJP6YMI1NWw6CRvrpGiz8TMPloLEaLbQLfif
 mpFvCmjj34yK/9MpYaGhihdvtbS9yt/v3/N/qsRACDpGyXq2O6bv1kDvquKKGODqzwbMJRtdR/E
 MyMP+PU0prylP1SsHajLDKnC05LwZKnpbxuhJgcTSusu3JeoyjRuFab66CI4q/s5YRUS/UwFiaR
 ggFMWiq8VsG26BsVYOvHGBU7Lv+/spjLYLQtjkLbmqa9psuMd+r37q2lCNtGSlhO/UAmT+AuJKn
 uJPPotWG4BGopXXaPM3Kt4HZqkTXlymPuyl7rvbMwKcFsYU6+ioLmzhxGTcIRb9IoU7Ia5OftFq
 GLoq77sgaAVIrSm+SnA==
X-Authority-Analysis: v=2.4 cv=NNVAaE6g c=1 sm=1 tr=0 ts=6afd54d0 cx=c_pps
 a=RP+M6JBNLl+fLTcSJhASfg==:117 a=j4ogTh8yFefVWWEFDRgCtg==:17
 a=IkcTkHD0fZMA:10 a=zJRp6_cAMcgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=ZpdpYltYx_vBUK5n70dp:22
 a=VwQbUJbxAAAA:8 a=EUspDBNiAAAA:8 a=WK7bwhHvCB5DiU98bBAA:9 a=QEXdDO2ut3YA:10
 a=iS9zxrgQBfv6-_F4QbHw:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-18_01,2026-11-16_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 bulkscore=0 priorityscore=1501 malwarescore=0 phishscore=0 adultscore=0
 suspectscore=0 clxscore=1015 impostorscore=0 lowpriorityscore=0 spamscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2611040001 definitions=main-2611180029



On 11/18/2026 12:01 PM, sashiko-bot@kernel.org wrote:
> Thank you for your contribution! Sashiko AI review found 1 potential
> issue to consider:
> - [High] wifi: ath12k: runtime mask passed to u32_replace_bits() in
>    pcic.c
> --
> 
> commit fea0a3bf22c9a4872fcffbf9f6c11d790f370851
> Author: Madhavan Ganesan <madhavan.ganesan@oss.qualcomm.com>
> 
> wifi: ath12k: refactor PCI window selection to per-device layout
> 
> This commit moves PCI and AHB register window masks and addresses into
> per-device structures so device families with different window layouts can
> configure their own mappings.
> 
>> diff --git a/drivers/net/wireless/ath/ath12k/pcic.c b/drivers/net/wireless/ath/ath12k/pcic.c
>> index b6d306fd3b99f..c10e21d688303 100644
>> --- a/drivers/net/wireless/ath/ath12k/pcic.c
>> +++ b/drivers/net/wireless/ath/ath12k/pcic.c
> 
> [ ... ]
> 
>> @@ -32,20 +38,21 @@ static int ath12k_pcic_select_static_window(struct ath12k_base *ab, u32 addr)
>>   	const int max_retries = 10;
>>   	int i;
>>   
>> -	window_bits = u32_get_bits(addr, WINDOW_VALUE_MASK);
>> +	window_bits = field_get(ab_ahb->reg_base->window_value_mask, addr);
>>   
>> -	/* Update window bits [5:0], preserving other bits */
>> -	new_window = u32_replace_bits(ab_ahb->static_window_reg, window_bits, 0x3f);
>> +	/* Update the dynamic window bits, preserving the static window configuration */
>> +	new_window = u32_replace_bits(ab_ahb->static_window_reg, window_bits,
>> +				      ~ab_ahb->reg_base->window_static_mask);
> 
> [Severity: High]
> Does passing ~ab_ahb->reg_base->window_static_mask to u32_replace_bits()
> break the build when CONFIG_ATH12K_AHB is enabled?
> 
> u32_replace_bits() calls u32_encode_bits() -> field_multiplier(), which
> requires a compile-time constant mask to eliminate the __compiletime_error
> call to __bad_mask().  Because ab_ahb->reg_base is a runtime pointer, the
> mask check cannot be folded at compile time.
> 
> Updating new_window with field_prep(~ab_ahb->reg_base->window_static_mask,
> window_bits) | (ab_ahb->static_window_reg &
> ab_ahb->reg_base->window_static_mask), or masking static_window_reg
> directly as in ath12k_pci_select_window(), would avoid u32_replace_bits()
> on a runtime mask.
> 

u32_replace_bits() requires a compile-time-constant mask. but 
window_static_mask is a runtime per-device value, so this fails to 
build. I will fix it in next version.
