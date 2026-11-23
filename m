Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.168.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795466386;
	b=05O0K+N0U9mmcS9I4RDAKC3QI7j1qbDShPpqhUQ361Xw9EtGwluko8iUtj6qqOWcXKji
	 r1uBuCSYlILIzHq2X/QuJvx1SPGG+/tmo3rpcDwVluIkJh9/17HZEW2L46/6kIwwmAyIq
	 CpIAXV/dRcq3knEXz7jcJuy14V+F6GfZwCVozuPM90UzCy2pzRVR1+qCiMhnKKr+UZwzs
	 FeTQYXvt8hyk37TQqkZELoj24YQwbMCfVJhJ3NvtekVAjfSQjgak5wCqig1c+A/OzLuTk
	 OWYNRdq9Cbjj6xOGsJ1mbq3m4AhlOCNj5mSDj8rSvqO3fyuaf9Y6kqWmr7gDoJsMnIQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795466386;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Gm-Message-State:X-Gm-Gg:
	 X-Received:X-Received:Received:Message-ID:Date:MIME-Version:
	 User-Agent:Subject:To:Cc:References:Content-Language:From:In-Reply-To:
	 Content-Type:Content-Transfer-Encoding:X-Proofpoint-Spam-Info:
	 X-Proofpoint-Spam-Details-Enc:X-Proofpoint-ORIG-GUID:
	 X-Authority-Analysis:X-Proofpoint-GUID:X-Proofpoint-Virus-Version:
	 X-Proofpoint-Spam-Details;
	bh=BTgZDhQmpiOfvJh/U5FMsjjeNKUBRVaNNccXn4V5Uew=;
	b=JFjfqRlwce6sCpm76ImFkQj6vMEyiTfKkz9WpAR0GzXv+vazJrVn7qfEVEiuGWqzwuc3
	 ZUHIQbko8eKhJ7tOHe3AbP9ub+Ecg4E2o0N/8YpeSd9iFLnl30yWAbMqNjSHsatpjSBtq
	 VhfUMReSmATJcfS15NwET4zfDHO7eqDgPj5s/b0KHTnTJmS/oW6UW8Fs6gl+NQZS0wO5c
	 dEx3dBxnHIL24nVCoypDiO643mIitlkxb2wt60OE4jVkKf0/JurcdXiQao98yojWMZmyj
	 cTwUlhWqnHMg2j85Nug8VbVuSg+lD2ndtiz3eTGWVUCcbTA2SFVbI9bQu2Gq4GxuyGg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=FayhAM+A;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=XL2gCJZ2;
	arc=none smtp.remote-ip=205.220.168.131
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0E628606A321
	for <sashiko-reviews@lists.linux.dev>; Mon, 23 Nov 2026 20:39:44 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 0E628606A321
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=FayhAM+A;
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=XL2gCJZ2
Received: from pps.filterd (m0279866.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6ANJuOfh2349990
	for <sashiko-reviews@lists.linux.dev>; Mon, 23 Nov 2026 20:39:44 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	BTgZDhQmpiOfvJh/U5FMsjjeNKUBRVaNNccXn4V5Uew=; b=FayhAM+AHNEAkIR3
	b8N9FmOqGz50xqkCk3OxEjpXss7cnSc+hkWsGqMr5+5F+exNlH6zrJmRTf13PDBl
	S+Tdz8zo5FIavg5QxQT/LE5mP/6UVBuJ4i8e+Trvikfj9oz7hUOfeUXnHlg0FrKC
	5ZUqYnbBtxMkB1Y5aVmTYgJL6zMAwjZhFNqYd1ElIdCIsIj3jahFnKpD+hHMit7Y
	iplugmpv7hd355++o2C9Qsne7X4Qe/19c+1DnQn90n88YMIB0X30I5J+rzN9M01B
	ig09kUJg8ijwhrrJoFCb/qSbAREJbe4LkuJYxc+dQsldu5RztJOzS71BBoYiIpqH
	Q16kQQ==
Received: from mail-dy1-f197.google.com (mail-dy1-f197.google.com [74.125.82.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4j4g9a3b9d-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <sashiko-reviews@lists.linux.dev>; Mon, 23 Nov 2026 20:39:44 +0000 (GMT)
Received: by mail-dy1-f197.google.com with SMTP id 5a478bee46e88-386a7af8b94so1762601eec.0
        for <sashiko-reviews@lists.linux.dev>; Mon, 23 Nov 2026 12:39:44 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1795466383; x=1796071183; darn=lists.linux.dev;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=BTgZDhQmpiOfvJh/U5FMsjjeNKUBRVaNNccXn4V5Uew=;
        b=XL2gCJZ2EKFoJSOM+GHb4DUEL3zzYFX0oQhn8wvHrtKiJreksNLzQXXadUPJGTWCJJ
         8q5tOKpTUrCRxz2EBEBWq3GHw4WSnQFQEJFmYFMyWub3cmOFJdwAlcPdHJV03LDT/GfE
         4q2t/l0tMatef4YcdEixCwxDMwVt8z3M3SOuSiiuMx62z2WcKsCXEm4+DIEAhX1CacP7
         0DfX1nN5knjMiikYJkdB/X/V91MNQa09/qToDSrNsa8S751JaIXVW9Snwvg92pog84n0
         bTW46DyG0KHs8c4D4ULYZ3XGweKNWOCwIxRt8yVZE8Hjc5gPmT7B/IhCN4N5GtJRwmA/
         Ah6w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795466383; x=1796071183;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=BTgZDhQmpiOfvJh/U5FMsjjeNKUBRVaNNccXn4V5Uew=;
        b=zN9HhtUEGjcZ7gHqGruPnO1P1GenQri2Qi1l9DkZiUqpKwEsb9bZi9OLJFpmPtwfu/
         Am3re8h6A0s/sZ0zIZdrGberkrOf3U0pkHanyu3bNbzN8dnUO4AzYaF3pE7iR2962uAz
         jakGeuPloczCyNvNmzWufktWK05DMzPklfI436LzNCHHpfibIh3Wwea/TR+vQIN7eDxN
         8rjqcdZdgxhYJ8A5pKhabJvQvi72oksiCPflGrNoRvCOoeKVbCRthB20S5OaIZduLhQi
         yos3MoltA1Xps89XhBQyH0SdD6fuBZKdnCf+siKZoMg9Z9cLS9wC076ANJPelcIhmSKt
         otWg==
X-Gm-Message-State: APuU4Z9lHbMgddJK8Ku+KhibJCbA+wQcXfiaefu80mcjvX0lI/1GzzIb
	A0xjelRR42MT7f9yuGU5NRrwuhTQpib3w4h1v9//t6wD/XQm3Df/y41XGS4YTAXSt6jAr1MXxJB
	8+mja07w1NnJdvLX2ooEe9yqE8D2qjlfhQaiqjkZaTtTxqyKsqRjjA/ymw/AJ1FnfehTu41uaK/
	1CgmE=
X-Gm-Gg: AZFdTZdG/mi4qnS3sxMrJSapHu5YJpHwDcU88r9SAob4l+HZVHA//vleHsCkCiI5q6U
	dUtAeGWXgD7tIyrwxLpD2GNEjHHS75lw5WjYclOGqyYfEaqfsI8ExYXp99OZSnZKHbgfylCWR7F
	GeqZFPpKquVB4Ie3fJQnALZmpp5qyWEjadCyUvB7PHpcNL5nyKglFpZwwodE54R5f3BD/BSkTvM
	EdeyQZB3E7d1N/vwwTwO6uNsoDO07UgcZPujIxPTp8fwAJx44V+I5hkw85TzT37tHECwIiop8yO
	nM8bx5j5VTIIYy7niKsUiCAtp0EWVjF9Q4ksHL5K9Rr6aFyBFYOB958YjZjTxjQP0AaYnqh6MSD
	ZFu6mDAF2Zlho7+Dzi+spgaseOmfXZD0bxcnPpIX2axqhGsP2vlvLDSQ/8NJI/9/GAyBvfKqw5p
	OijRc=
X-Received: by 2002:a05:7300:ae04:b0:384:7a8f:3bc1 with SMTP id 5a478bee46e88-386a8562bb4mr6348378eec.17.1795466383303;
        Mon, 23 Nov 2026 12:39:43 -0800 (PST)
X-Received: by 2002:a05:7300:ae04:b0:384:7a8f:3bc1 with SMTP id 5a478bee46e88-386a8562bb4mr6348357eec.17.1795466382794;
        Mon, 23 Nov 2026 12:39:42 -0800 (PST)
Received: from [192.168.1.136] ([172.88.17.160])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-385672ce402sm35843638eec.16.2026.11.23.12.39.41
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 23 Nov 2026 12:39:42 -0800 (PST)
Message-ID: <e4059318-2301-4362-b308-ba915ca8310a@oss.qualcomm.com>
Date: Mon, 23 Nov 2026 12:39:41 -0800
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
Subject: Re: [PATCH v10 3/7] usb: misc: qcom_eud: add per-path High-Speed PHY
 control
To: sashiko-reviews@lists.linux.dev
Cc: devicetree@vger.kernel.org, linux-usb@vger.kernel.org, robh@kernel.org,
        conor+dt@kernel.org, Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
References: <20261123182847.143892-1-elson.serrao@oss.qualcomm.com>
 <20261123182847.143892-4-elson.serrao@oss.qualcomm.com>
 <sashiko-outbox-229871@kernel.org>
Content-Language: en-US
From: Elson Serrao <elson.serrao@oss.qualcomm.com>
In-Reply-To: <sashiko-outbox-229871@kernel.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTIzMDA4MiBTYWx0ZWRfX880wLviAhdMr
 e8h5YM0VQGfY2Us2XdHFLMvD6oR9+oZUQNJH8S+YrnT9Q13qINToju7RGJkfnzEf9SV3AOzacDa
 ZjtVJ8jy8omIqiUTYU8tdbgRrW0gcr0=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTIzMDA4MiBTYWx0ZWRfX/CfNIpC/IjAo
 YTTQr5TptxI8GSe7Q2onVocBRrpzfkmChMOgSlr/nqk5wWDIsYa/aVYrya25iAv4MsH4SGdqQw2
 5hwBWkn9TZCEYDFWZ/OYBGq551ZT5FwwzmSqcCxPTVQEPpov2/NFJ587j59eG9LCPNwTV1Dkyig
 3y6NI1sUUUNBN2Wbj9e5FrKxokq/G7KE1xrf8voorHXN+TxUjy1Ejhzu1ETZ7WtNYaLkf9pL4cQ
 +ug20VQmmmOW7wycK3bfzsqNBFnHSBV9/lLSKrlkC20FZcyrvZm8c5LLVYsMS7tisjsdD6lBna0
 cuDDLvVYbtFvX4TomfldsrqeeDmsuCduyehFj+W1GKWQ1afeSk39CAKoilKPbhpyDGIDu5+Il6T
 R0aA0amNUHzLjaeeIpTpjQGf3/waVkszcZYBo/aINmFRvFLN/IU95ePY/WsgBNey1HmjsW6pCqY
 qSD5HHk/HrtUwaSsOyw==
X-Proofpoint-ORIG-GUID: 07ZA8ojENipG-8acdyGxza2ma6vbn9vt
X-Authority-Analysis: v=2.4 cv=cYJHPXDM c=1 sm=1 tr=0 ts=6b04a490 cx=c_pps
 a=Uww141gWH0fZj/3QKPojxA==:117 a=p3NwzfejtmCMKWTc25r7/Q==:17
 a=IkcTkHD0fZMA:10 a=zJRp6_cAMcgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=YMgV9FUhrdKAYTUUvYB2:22
 a=VwQbUJbxAAAA:8 a=EUspDBNiAAAA:8 a=PwTwPomv82BVMpG07ZAA:9 a=QEXdDO2ut3YA:10
 a=PxkB5W3o20Ba91AHUih5:22
X-Proofpoint-GUID: 07ZA8ojENipG-8acdyGxza2ma6vbn9vt
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-23_05,2026-11-23_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 phishscore=0 clxscore=1015 malwarescore=0 spamscore=0 bulkscore=0
 priorityscore=1501 adultscore=0 suspectscore=0 impostorscore=0
 lowpriorityscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2611040001
 definitions=main-2611230082



On 11/23/2026 10:48 AM, sashiko-bot@kernel.org wrote:
> Thank you for your contribution! Sashiko AI review found 1 potential
> issue to consider:
> - [Medium] usb: misc: qcom_eud: eud_probe() fails when secondary path is
>   disabled in DT
> --
> 
> commit e2fd91a7c0ed5f3452a494a0a91ef1ddd34b1c26
> Author: Elson Serrao <elson.serrao@oss.qualcomm.com>
> 
> usb: misc: qcom_eud: add per-path High-Speed PHY control
> 
> This commit adds per-path High-Speed PHY management to the Qualcomm EUD
> driver so that the PHY associated with the selected UTMI path is
> initialized and powered when EUD is enabled.
> 
>> diff --git a/drivers/usb/misc/qcom_eud.c b/drivers/usb/misc/qcom_eud.c

[...]
>>  
>> +	for_each_child_of_node_scoped(np, child) {
>> +		ret = eud_init_path(chip, child);
>> +		if (ret)
>> +			return ret;
>> +	}
>> +
>> +	/* Primary path is mandatory. Secondary is optional */
>> +	if (!chip->paths[0])
>> +		return dev_err_probe(chip->dev, -ENODEV, "primary path not found\n");
> 
> [Severity: Medium]
> Does eud_probe() fail on dual-path SoCs when a board disables the secondary
> path or its USB controller/PHY in Devicetree?
> 
> for_each_child_of_node_scoped() visits child nodes even when they are
> marked status = "disabled" (unlike
> for_each_available_child_of_node_scoped()).  In Addition, on dual-path SoCs
> where the SoC dtsi defines both eud-path@0 and eud-path@1, if a board leaves
> the secondary USB controller disabled then of_graph_get_remote_node()
> returns NULL (failing probe with -ENODEV), and if the secondary High-Speed
> PHY is disabled then devm_of_phy_get_by_index() returns -EPROBE_DEFER
> indefinitely, preventing EUD from probing even for the primary port.
> 
The binding defines both paths as required for dual-path SoCs (e.g.
SM8350). The eud-path nodes represent the UTMI topology between the
connector and the corresponding USB controller, not independently
optional hardware resources. Therefore, disabling an eud-path node or
the resources required by it is not a valid configuration for a
dual-path topology. Probe failure or probe deferral is the
expected outcome in such cases.

Thanks,
Elson
