Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.180.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794979460;
	b=1GSNn1+c87m6JlTiSJ+SPgMXMk2AmTiPhKeAbhfExuTgRi+A2620Qy73Ee0i6iWS66Fm
	 e4Y1aeXEX6hrvvtCNSa13ztNvIhr1ipVtVfMr7DOAoboAM6CF0zEpwW6O2BzW87lSM3Ku
	 8zqj8orQetsbxzAKkuuq0JVKf11g3CjSohu6l1/dsqHcDNeuqnKsvrdcBGXhETcz6PYtr
	 BTfoQdxwucmwBTIeuxjP6J6ABc2+17m8JYLqX9PUETrUldoJDz5XJQsR/rv4LUQZFYYfw
	 vJcLzcDJPwId7FCN0aRnszQLz6skCEuxGyzK0x3h1LtilGnHvyHzaT5hlXWH7kYr/wA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794979460;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Gm-Message-State:X-Gm-Gg:
	 X-Received:X-Received:Received:Message-ID:Date:MIME-Version:
	 User-Agent:Subject:To:Cc:References:Content-Language:From:In-Reply-To:
	 Content-Type:Content-Transfer-Encoding:X-Proofpoint-ORIG-GUID:
	 X-Authority-Analysis:X-Proofpoint-Spam-Details-Enc:
	 X-Proofpoint-Spam-Info:X-Proofpoint-GUID:X-Proofpoint-Virus-Version:
	 X-Proofpoint-Spam-Details;
	bh=HDcsFx7BbcP7s863fiRiwMb+iMGeVs8DDKQn0DRYTmI=;
	b=T2DEFlmtP6laey7EycQwOkO9wAD7AJmmEEMgO4JQKPDdKCYVayctGP1tN9KrfVoe2vjp
	 kLwkK3Lh6Vw1x2cjhVz0Qmkg1KCa11tXcLQRDm5/KchXVYTF9kXFAMyBzfT1p8XwxFXTa
	 fbesTeBWaTJrV7zBuNoGrWzQnZ2Rw5UycodZ/0M9ae6nwW5hq5Ii7fsJTkkpp02YjvOeD
	 qGZxaFJq67HTiAxCe/KXF6s62d9Si+zzCL8KbTfgaP0I8fL/TQpLQp0LE2+MhHdplVJRl
	 IM/HTu9bz754qpUwLADVwU612hyQubgN5c2M1b9z94x6Xa8jSdsM6EQNzMVxNaB/S4Q==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=U7YVcPbR;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b="d/hQxKbl";
	arc=none smtp.remote-ip=205.220.180.131
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 82EE0606A32C
	for <sashiko-reviews@lists.linux.dev>; Wed, 18 Nov 2026 05:24:19 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 82EE0606A32C
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=U7YVcPbR;
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=d/hQxKbl
Received: from pps.filterd (m0279873.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6AI2V2Ms472672
	for <sashiko-reviews@lists.linux.dev>; Wed, 18 Nov 2026 05:24:18 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	HDcsFx7BbcP7s863fiRiwMb+iMGeVs8DDKQn0DRYTmI=; b=U7YVcPbRZ4xI8hzq
	fqHGtrlavcBRFDZ3lBQuSQBcdaU95Q118jsCERIcpMantFmIDdFLc4TUEjd2AOhZ
	ywAPGCeH4HexPJeg3cZsiFhzxlvxAYbZsHm3UwO+YF5CYdf5nL05bUTEvS9ySAEU
	ywLwsXUL6tlqNordU/LqWVwUEQpSarx0HMKG/L3B9FniywBdq2bVWAD0Ms4GAA3/
	+EKjjgv9BKVM2HsY8S7+NkcLd7FbThB3WvmXsy1pvYzOTUCq+oCcdT05jZdNMF0W
	BVCkJ4t65DE8hzPe7lq2Shqyrn+gCEsL65AYBHMLkD0Lez8w3JRSqwR15PjUY8VT
	K1EC2A==
Received: from mail-pj1-f69.google.com (mail-pj1-f69.google.com [209.85.216.69])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4j0yv89aex-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <sashiko-reviews@lists.linux.dev>; Wed, 18 Nov 2026 05:24:18 +0000 (GMT)
Received: by mail-pj1-f69.google.com with SMTP id 98e67ed59e1d1-3b191f8a9b3so777221a91.1
        for <sashiko-reviews@lists.linux.dev>; Tue, 17 Nov 2026 21:24:18 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1794979457; x=1795584257; darn=lists.linux.dev;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=HDcsFx7BbcP7s863fiRiwMb+iMGeVs8DDKQn0DRYTmI=;
        b=d/hQxKblxcwkKD0twCb9nVmxQFn99dNMpHPf4W4SlqoHQ2pdGtetm3WvVLaI8wUZG1
         EBpge7gwjPXcASGa2O2jNWTW2rkBmVHS3QKJTCS5yV44zflQGFl5FxlQCQqAs1lbtBcV
         d9qF90F3P3O2czV0phi+mSLUtMH6u4YWyubC2SfoQwCa08enb0p32CdItr4Kz35g3Skh
         XVSJvAnS6dMzASLpSohwHyZ+30nDSggwCadaTRkcf0a4tSxfxV7OjTz1DZeQpCn3cueX
         Zu0e0amDHpSKx8BPZ9x1m5QbF4lrWG1bfJ+EgA91XJSVcduX4iGli3MD3CEkmaSqUlZo
         EVhg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794979457; x=1795584257;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=HDcsFx7BbcP7s863fiRiwMb+iMGeVs8DDKQn0DRYTmI=;
        b=wBKrJoT14uXU7r1DmgkuvOMtGMtwRzdaymqFK+xcp6Xhf1VUiqJpRYcnNYPwMgTygF
         Q9PBV9VAJewmmqcmOw4TRBODnN34D2w9/U8WK5oSne0ZxkxohCvw9rPO2n/iaWEXEvfo
         e5ngM5yp/Y5mrA8dlo1xHRCCWzD6/8b6yqDQD9gmwpJzVf9ekbnsO6wjLfxG6P3EXQSR
         Dl04vyoJIjrSDgavKwUcG1kO5QZTuDszl+qYF9iUYTrzJMGuemyd28DwyVvo8keX/pVe
         3AXy/HZMxUOnO74VQTGQN3qrYFwQ4yxXBr8KmmF6jzTht2nzgIxA39Pa8M4mWXCKfBj7
         0QLw==
X-Gm-Message-State: APuU4Z/sX2O/OXHNc9+tRzL0HVc9pUpYasu1TV0Pxd6PuFk84S8hl+7B
	zSi69t/jYq72u1d5hijHirmVKKjA9NsqRQuPUQGryWKOf5F+iY0lnaqxdyq6T+9MUQkmblB3gwp
	gDKGJPAOCuYVrFFVNRPhuuNEKwUa5kSXSGwnR58Avr4ATSIHCICEyclRL0hC2UDP3vA1aKCsELs
	njWNE=
X-Gm-Gg: AZFdTZednZ+dtDCPmmJ1U0DH9IKeZ1cO9SE/MiawEDhEoIHEZQAhJGXk5beFr20zugN
	xygvIQaWyEsNh5FG9ZxslKu2jO/dBPKMhbR7/tDoOpdn+zuG7jGGNTMmZLheyrq31zw/g28iVw1
	+hCxrf6NgCvLRn5pdhYtazwy2eiFDbOfZq/6Ho9idO38/UPs3N1mkOkfP6hvjxnw6pwIhbBICtN
	3zhWMbMDjnWnmG1y91IDJrX6jYP6A7kDN2wD1BSmLojMKV/OKb/6S1BsXWLC9q7TGHR6peZDCM5
	oyCNtBLlGoVikilxHeipOi8Ga8Pd866deb46vE+6YyHVtVWeqYjWx362CBO7xfqoXeI3Gj6rAF0
	UREigbyVICCcy5jIwNp1Pt7MvGlqhWigMzXCyCSVr76whp4US1l+hD9GqJxaC1r7mepTdePB8HU
	/JFbY/f7ZXFg==
X-Received: by 2002:a17:90b:2e46:b0:3b0:ce1c:e754 with SMTP id 98e67ed59e1d1-3b3d07d216amr1465600a91.62.1794979457107;
        Tue, 17 Nov 2026 21:24:17 -0800 (PST)
X-Received: by 2002:a17:90b:2e46:b0:3b0:ce1c:e754 with SMTP id 98e67ed59e1d1-3b3d07d216amr1465584a91.62.1794979456567;
        Tue, 17 Nov 2026 21:24:16 -0800 (PST)
Received: from [10.152.203.150] ([202.46.23.19])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2eff61841aasm6771165ad.34.2026.11.17.21.24.14
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 17 Nov 2026 21:24:16 -0800 (PST)
Message-ID: <cc8e97f5-be62-40ab-81ed-4f23e50bb14a@oss.qualcomm.com>
Date: Wed, 18 Nov 2026 10:54:13 +0530
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
Subject: Re: [PATCH ath-next 14/15] wifi: ath12k: add and hook Wi-Fi 8
 mac80211 ops skeleton for QCN9575
To: sashiko-reviews@lists.linux.dev
Cc: devicetree@vger.kernel.org, robh@kernel.org, conor+dt@kernel.org
References: <20261112-wifi8_qcn9575_bringup-v1-0-3f30fbc2bb69@oss.qualcomm.com>
 <20261112-wifi8_qcn9575_bringup-v1-14-3f30fbc2bb69@oss.qualcomm.com>
 <sashiko-outbox-210929@kernel.org>
Content-Language: en-US
From: Madhavan Ganesan <madhavan.ganesan@oss.qualcomm.com>
In-Reply-To: <sashiko-outbox-210929@kernel.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Proofpoint-ORIG-GUID: fZ6coF6tglHJCyHri2wjQv7Z73lOQafT
X-Authority-Analysis: v=2.4 cv=N9u8hG9B c=1 sm=1 tr=0 ts=6afd3682 cx=c_pps
 a=vVfyC5vLCtgYJKYeQD43oA==:117 a=j4ogTh8yFefVWWEFDRgCtg==:17
 a=IkcTkHD0fZMA:10 a=zJRp6_cAMcgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=rJkE3RaqiGZ5pbrm-msn:22
 a=VwQbUJbxAAAA:8 a=EUspDBNiAAAA:8 a=G-y7d_-i5GkObnu5dnsA:9 a=QEXdDO2ut3YA:10
 a=rl5im9kqc5Lf4LNbBjHf:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTE4MDAyMSBTYWx0ZWRfX6gP8cB0HxkTf
 r2H1DXApz1NTbIile1u8J7rLrrNOM4ftPRrGSQsS2tX+wC6X76T1Vr4TwHGFeWv6m2Wmk2CWQP5
 VbD4osYa6jbuDt3hfBej7Yla2O7J1g93ZBcmYB+/myWtGMSTYfpSo2giHqCPgtW/z2cyCRA9B5r
 QNFB09/LnHDeDdIyM/g1qxapaXufTwWjC6t9doNhRnitA7oXOJEYEb73iLfsM6DIFSgE99Rt3WG
 obtjcH+dU2MQLqBWKkkXTxPBIW9c/APuh92uAhRT8vTfM8sGkjb3pLQ71sut1McR7w5fUzI25Ff
 x7kMNcjbk/go44GOWAiYCXtxJjU9POQuhqPx9PBp0etx5pRi+TxdN3gMmmmYL3gqFu6z6iVpecM
 s3LV5kYFoBYyv3fjDyhrqbKXpByGcS/fgwuHtaTbCSr7ONVDYEO9y1SvO1kmnCCbIERobcD3i8W
 4K0yt9w6AFzPfTDgE6A==
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTE4MDAyMSBTYWx0ZWRfX5J8Vg5KeWP+e
 VUCJ7itk3ew3TZlopzQoUCKDJiQI2/pg9zMA+Gfkv24UpBwBWI1cpfnNn+xI8JcPJVMepQ292y0
 Jnfh/Cr9PUyPlI/BY2CqDr6Ou6j6+IQ=
X-Proofpoint-GUID: fZ6coF6tglHJCyHri2wjQv7Z73lOQafT
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-18_01,2026-11-16_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 adultscore=0 phishscore=0 suspectscore=0 clxscore=1015 impostorscore=0
 priorityscore=1501 malwarescore=0 lowpriorityscore=0 bulkscore=0 spamscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2611040001 definitions=main-2611180021



On 11/12/2026 3:49 PM, sashiko-bot@kernel.org wrote:
> Thank you for your contribution! Sashiko AI review found 1 potential
> issue to consider:
> - [Medium] wifi: ath12k: missing sta_set_4addr callback in
>    ath12k_ops_wifi8
> --
> 
> commit 6de3568cf375a8ba9425721f1a8ad36656373d50
> Author: Madhavan Ganesan <madhavan.ganesan@oss.qualcomm.com>
> 
> wifi: ath12k: add and hook Wi-Fi 8 mac80211 ops skeleton for QCN9575
> 
> This commit adds a dedicated ath12k_ops_wifi8 ieee80211_ops table with a
> placeholder TX callback and existing common ath12k_mac_op_* callbacks,
> and hooks it in ath12k_wifi8_hw_init().
> 
>> diff --git a/drivers/net/wireless/ath/ath12k/wifi8/hw.c b/drivers/net/wireless/ath/ath12k/wifi8/hw.c
>> index 92c897de16f4f..30188f4fae022 100644
>> --- a/drivers/net/wireless/ath/ath12k/wifi8/hw.c
>> +++ b/drivers/net/wireless/ath/ath12k/wifi8/hw.c
> 
> [ ... ]
> 
>> @@ -152,6 +155,72 @@ static const struct ath12k_hw_params ath12k_wifi8_hw_params[] = {
>>   	},
>>   };
>>   
>> +static void ath12k_wifi8_mac_op_tx(struct ieee80211_hw *hw,
>> +				   struct ieee80211_tx_control *control,
>> +				   struct sk_buff *skb)
>> +{
>> +	struct ath12k_hw *ah = ath12k_hw_to_ah(hw);
>> +
>> +	__ath12k_warn(ah->dev, "wifi8: tx stub is a placeholder, dropping frame\n");
>> +	ieee80211_free_txskb(hw, skb);
>> +}
>> +
>> +static const struct ieee80211_ops ath12k_ops_wifi8 = {
>> +	.tx				= ath12k_wifi8_mac_op_tx,
>> +	.wake_tx_queue			= ieee80211_handle_wake_tx_queue,
>> +	.start				= ath12k_mac_op_start,
>> +	.stop				= ath12k_mac_op_stop,
>> +	.reconfig_complete		= ath12k_mac_op_reconfig_complete,
>> +	.add_interface			= ath12k_mac_op_add_interface,
>> +	.remove_interface		= ath12k_mac_op_remove_interface,
>> +	.update_vif_offload		= ath12k_mac_op_update_vif_offload,
>> +	.link_info_changed		= ath12k_mac_op_link_info_changed,
>> +	.vif_cfg_changed		= ath12k_mac_op_vif_cfg_changed,
>> +	.change_vif_links		= ath12k_mac_op_change_vif_links,
>> +	.configure_filter		= ath12k_mac_op_configure_filter,
>> +	.hw_scan			= ath12k_mac_op_hw_scan,
>> +	.cancel_hw_scan			= ath12k_mac_op_cancel_hw_scan,
>> +	.set_key			= ath12k_mac_op_set_key,
>> +	.set_rekey_data			= ath12k_mac_op_set_rekey_data,
>> +	.sta_state			= ath12k_mac_op_sta_state,
>> +	.sta_set_txpwr			= ath12k_mac_op_sta_set_txpwr,
>> +	.link_sta_rc_update		= ath12k_mac_op_link_sta_rc_update,
>> +	.conf_tx			= ath12k_mac_op_conf_tx,
> 
> [Severity: Medium]
> Should ath12k_ops_wifi8 also wire .sta_set_4addr to
> ath12k_mac_op_sta_set_4addr like ath12k_ops_wifi7 does?
> 
> The other shared callbacks here (ath12k_mac_op_update_vif_offload() and
> ath12k_mac_op_add_interface()) enable IEEE80211_OFFLOAD_ENCAP_4ADDR and
> WMI_VDEV_PARAM_WDS on 4-address interfaces, but without .sta_set_4addr,
> drv_sta_set_4addr() is a no-op and never configures WMI_PEER_USE_4ADDR or
> peer->dp_peer->use_4addr when a 4-address station associates.
> 

This is a false positive, since the CP/DP changes will fill in the 
remaining fields.
