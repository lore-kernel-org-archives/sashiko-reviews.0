Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 495033BBFBA
	for <sashiko-reviews@lists.linux.dev>; Fri, 16 Oct 2026 08:59:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1792141168; cv=none; b=ZDtKQX+2KwukVm1b4+UI1nhxOXssWHuUJHHtehPUWXsFVt3B7qgIEZaiTlzjq9mv6mCNCWHoVbFv9urw+xk9g3Yyg73bQDYOMuELtcQ0tNk3ONubejvA1EjKbB7EhMx2dPNxb+DwoDzkcKZJPaKAc0W2XOQg9yan0CocRMhiNew=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1792141168; c=relaxed/simple;
	bh=jr+4mwpmTUEPrXMq8BAJi0IQ93OMRQw9ilNf0eyfAIw=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=tELHBPEPwQMxtGPpQgs/ziyeEuPYMEoGWRdiYj9WsrGKxMZhXcjQ42qMrCQ9K/2DU/I9LAHHyk5SUc08XsGPFZzPYiFxzJRXBKXwT3MHYBRt9maEdBEvzkb50syXR5pKqEJjeWgZSYJLw5/XW8OuLgY9sDJpve6tB4DEsuezct0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=EH9wAA72; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=Nhp++FVB; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="EH9wAA72";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="Nhp++FVB"
Received: from pps.filterd (m0279868.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 69G8m5H51465304
	for <sashiko-reviews@lists.linux.dev>; Fri, 16 Oct 2026 08:59:25 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	GfxK16iLo4LVyZ9Np1Mx+6tJVblLssEwBImgmVjgZdo=; b=EH9wAA727OmBcE/0
	44Y2+tDApWJo894zVCRaNvuXhWIPyrxfYp57dwvnfL5DWU7SqLCecHF/NtPpCHQJ
	MNoaGV9SCdH6PM3tuZB4Pe1DfOuh9MhhyWoTVACmWJVHuivIkDny6x8mn/KQWkn1
	LTMmnCBWXMHYuhaSwC+DB5KyvMNyJqVdXWJVITv6iC2l+Ws6woYDm5JIzj97kDcu
	imNwd1w77lC/p4rDtBta7UKTgeQ4QIE6mWdqEV5akmWqWAfJ1oq1gXXPPtCIZqcL
	fbR4zL9d3QlcJ84nFBNW7QcLuzQtQRUkCWb5yKokZfUu+Br2q3JRTvAvKf46tPsd
	iw4MTg==
Received: from mail-pg1-f199.google.com (mail-pg1-f199.google.com [209.85.215.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hb21wuey8-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <sashiko-reviews@lists.linux.dev>; Fri, 16 Oct 2026 08:59:25 +0000 (GMT)
Received: by mail-pg1-f199.google.com with SMTP id 41be03b00d2f7-cc1cdfb337eso3684280a12.0
        for <sashiko-reviews@lists.linux.dev>; Fri, 16 Oct 2026 01:59:24 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1792141160; x=1792745960; darn=lists.linux.dev;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=GfxK16iLo4LVyZ9Np1Mx+6tJVblLssEwBImgmVjgZdo=;
        b=Nhp++FVB8yxQMzEKw8CM2HmzD/8pfqATBrP1ggKWDJyVjDYMDrOZNVx7JiplFPZNvR
         A3qYkertmYQh81nhiZdHbed78p0Y+u4NJPcgh24k2cvrQdEn3acRo4aqAVdecd3Ts7UF
         R7JszfAw2euiCLkDraYSy4OTYakWrlPaKUo2Ki+sg0vzOGld8hja8xi00aCRxxtKlkB2
         oz7VHmgE+9eU/IYkMeacX9QaZFvj7wv0pNi9bDhNgI1gEpd2T/0iVoxOURqlKpIMCVST
         wt3XD+UH9uGLS4LNGZrTV5xtY6e/YYdaX9F5BRP017TwLb4EEd3VxDchQ3ojTHUFXI/T
         m2Ow==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792141160; x=1792745960;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=GfxK16iLo4LVyZ9Np1Mx+6tJVblLssEwBImgmVjgZdo=;
        b=ypbwte2x9Ztgr/eaCHbnPiG8aFFvfYNaeiIH5Ric+WBN3HTtDAk69UGusXQLflzSqS
         liUwDZLAPAGjO2OFbQAAFtEKdx3Mk9irO6xFXD/VuktOXXSOjkjuGJD0z+eASieVDP3D
         s+NXhaT3KfhjWZQzs5rRB66X3iEUeHI0xh2FCH2ekE5ujXQOfNGCc68Qq4zqwB4cDT5L
         Xfyyu1JWn8q64K4pbtC9AtaJy7hGkUE+rsFtkaUkqyhf1rMVvRk474MVxH/lqzVachW9
         bSVcIepAEqmRyWio+mOmF0Pek4LCCZjXQRJ/sNYhVZCD1onSU7LrBcdq5yMqrfWfEAoX
         OBdg==
X-Forwarded-Encrypted: i=1; AKwUvBwHqH19IRvf1MTderIvKhWRA3avYAaGdMs6g66/z+oVf6ujpuYeB9IXoeKnpkcy1RSWc5VJhgwBPLMnOw8/FPw=@lists.linux.dev
X-Gm-Message-State: AFq9FYLMq/8ZHBVmyEYqgKj4AB2O5aZnMjptOEq1rqDWON+xZmpmuBYQ
	N4i9xjd1L2dQYGoC7nxuXhiDOAG7aH57oG6qT0nq8cpdb5zPj/fKDXkJH7lq0vrRrH3l+yj5epZ
	P1pr+rTxwtGNDrBQmbiXBxfLdVoRssm8WGrqmSGYAuDKVOgUzyhnyTKaicyu/feeLhQ4XYC4=
X-Gm-Gg: AYBFou1YHNoyIZwZnkMkDeppcS0UHr/pUhPLMBdZKQ9jACd9lyEpFMl0JFhSRl/LSqf
	Om0xwKDwmyHKYuUZJbSvRFY12ytxw5H5hVXaROOUh6mRyZCNX9HXZUO6HhkkA0Vh3n7oXsQ0EV9
	kT5T1DflVwMTlaqSbaGduRTcLQlvY9iJOrsjXkXPMQs2YHOXy+ul3c6Ni3PIzukXAYuk596Egyi
	iN7GnortLt7/a/bI0GH/W2ar6ecjAU0snOoMymwioynXtjI4nRwttDoRM6YTw0i7/tw0/HCmU6C
	QR9y3wJaL9ny2VPeJZEHcYx843OqKKI/7yT2vCxhKsPdwXsfuIQat0TT4Jqdd/iLBcXRsOathcd
	dWeShUKgUfJxTPJiSNaXdqysn55URkA==
X-Received: by 2002:a05:6a20:3d1a:b0:3df:c9eb:127d with SMTP id adf61e73a8af0-3e16bb0b01emr19869599637.11.1792141160087;
        Fri, 16 Oct 2026 01:59:20 -0700 (PDT)
X-Received: by 2002:a05:6a20:3d1a:b0:3df:c9eb:127d with SMTP id adf61e73a8af0-3e16bb0b01emr19869587637.11.1792141159564;
        Fri, 16 Oct 2026 01:59:19 -0700 (PDT)
Received: from [192.168.29.42] ([49.37.217.198])
        by smtp.gmail.com with ESMTPSA id 41be03b00d2f7-cd6549c5621sm783679a12.17.2026.10.16.01.59.17
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 16 Oct 2026 01:59:19 -0700 (PDT)
Message-ID: <10fe47fe-e238-4d35-b61c-e163a6e06dd0@oss.qualcomm.com>
Date: Fri, 16 Oct 2026 14:29:15 +0530
Precedence: bulk
X-Mailing-List: sashiko-reviews@lists.linux.dev
List-Id: <sashiko-reviews.lists.linux.dev>
List-Subscribe: <mailto:sashiko-reviews+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:sashiko-reviews+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v7 2/5] arm64: dts: qcom: Add Kalambo SoC
To: Gopikrishna Garmidi <gopikrishna.garmidi@oss.qualcomm.com>,
        sashiko-reviews@lists.linux.dev
Cc: conor+dt@kernel.org, robh@kernel.org, devicetree@vger.kernel.org
References: <20260909-b4-kalambo-crd-v7-0-f5685804478a@oss.qualcomm.com>
 <20260909-b4-kalambo-crd-v7-2-f5685804478a@oss.qualcomm.com>
 <20260909073152.C08531F00A3A@smtp.kernel.org>
 <1f629377-c1a8-4c75-8fd6-743e1371d4cd@oss.qualcomm.com>
Content-Language: en-US
From: Sibi Sankar <sibi.sankar@oss.qualcomm.com>
In-Reply-To: <1f629377-c1a8-4c75-8fd6-743e1371d4cd@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-Proofpoint-ORIG-GUID: LeDkpV5eC4krhFrKlAGquOz4dPRii2ij
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMDE2MDAzNSBTYWx0ZWRfXyzO/wZjTkcEn
 vl3UOL2UF0OoVZbEHS7ZkJ+hoswF24T3N7Fl9psjsJCw4G0ivu4wx+llZSuoEW4AR3RCA0zM/KG
 aEQFtmhF++0VHvqW4UKqqq9G4Tlve0Rsy2llCmLf/ZQeni768yzSHPsM0/gPW8PG4G3XodSiPN/
 bZtVnzfBBv+ODvh0kPxgAW2WL0kzU5ZEHtlAlohgUcf1LvJhRI4BObXwoKwvGCYT84web2hqL2a
 JtCOZayFpno1FTdBmooGFy4pL9IUk6GAPLrQoXy87DnhGNHj/+fssywnNA9Uq2uIRoj0ajzLYac
 ftkitkGjOwQOkkQ04oDUbGmX7MGDZO6WbKne00gNHb7ro4V8oDHzC19KfYu0I0EXWKqba4FmIOo
 6JfSQah7vGTjWg6QZiptVRa3EuWV3fNlozrfs9eQAG0KPa/xhKsVFpD0THq4Uxl8EXIV64vIG3K
 x9+85fexswofEczB4NQ==
X-Proofpoint-GUID: LeDkpV5eC4krhFrKlAGquOz4dPRii2ij
X-Authority-Analysis: v=2.4 cv=R5qWitRX c=1 sm=1 tr=0 ts=6ad1e76d cx=c_pps
 a=Oh5Dbbf/trHjhBongsHeRQ==:117 a=rThwyMTpgoa+SOOJ7TDuHg==:17
 a=IkcTkHD0fZMA:10 a=660iZSQnnn4A:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=ZpdpYltYx_vBUK5n70dp:22
 a=VwQbUJbxAAAA:8 a=EUspDBNiAAAA:8 a=kA6Chgf_RWFvDljAiLMA:9 a=3ZKOabzyN94A:10
 a=QEXdDO2ut3YA:10 a=_Vgx9l1VpLgwpw_dHYaR:22
X-Proofpoint-Spam-Info: AW1haW4tMjYxMDE2MDAzNSBTYWx0ZWRfX3zzUKKkqbYUW
 460JJjOBjrqG/pq0FQA+K5je5R/U2wxLCEojvMVXZGZxv1CZWIb0nAL1nRYL5fj9xPP6kel90bI
 7InTD4pQeHySSowL/49WXGtncwyuUqY=
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-10-14_01,2026-10-14_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 impostorscore=0 suspectscore=0 phishscore=0 adultscore=0
 malwarescore=0 clxscore=1011 bulkscore=0 priorityscore=1501
 lowpriorityscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2610080000
 definitions=main-2610160035



On 14/10/2026 18:21, Gopikrishna Garmidi wrote:
> 
> 
> On 9/9/2026 1:01 PM, sashiko-bot@kernel.org wrote:
>> Thank you for your contribution! Sashiko AI review found 1 potential 
>> issue(s) to consider:
>> - [High] Missing disablement of bwmon_cluster0 after CPU cluster 0 
>> removal, leading to a synchronous external abort upon driver probe.
>> -- 
>>
>> commit 917eea48188cf7e004e9ea44ee5963d8c898f1e5
>> Author: Gopikrishna Garmidi <gopikrishna.garmidi@oss.qualcomm.com>
>>
>> arm64: dts: qcom: Add Kalambo SoC
>>
>> Introduce support for the Qualcomm Kalambo SoC. It is derived from Mahua
>> with CPU cluster 0 (cpu0-cpu5) removed, leaving only cluster 1 (cpu6- 
>> cpu11).
>> The surviving cluster is re-added in the cpu-map as cluster0.
>>
>>> diff --git a/arch/arm64/boot/dts/qcom/kalambo.dtsi b/arch/arm64/boot/ 
>>> dts/qcom/kalambo.dtsi
>>> new file mode 100644
>>> index 0000000000000..8e2077d9d0a8a
>>> --- /dev/null
>>> +++ b/arch/arm64/boot/dts/qcom/kalambo.dtsi
>>> @@ -0,0 +1,119 @@
>>> +// SPDX-License-Identifier: BSD-3-Clause
>>> +/*
>>> + * Copyright (c) Qualcomm Technologies, Inc. and/or its subsidiaries.
>>> + */
>>> +
>>> +#include "mahua.dtsi"
>>> +
>>> +/delete-node/ &cluster0_pd;
>>> +/delete-node/ &cpu_map;
>>> +/delete-node/ &cpu0;
>>> +/delete-node/ &cpu1;
>>> +/delete-node/ &cpu2;
>>> +/delete-node/ &cpu3;
>>> +/delete-node/ &cpu4;
>>> +/delete-node/ &cpu5;
>>> +/delete-node/ &cpu_pd0;
>>> +/delete-node/ &cpu_pd1;
>>> +/delete-node/ &cpu_pd2;
>>> +/delete-node/ &cpu_pd3;
>>> +/delete-node/ &cpu_pd4;
>>> +/delete-node/ &cpu_pd5;
>>> +/delete-node/ &cpu_scp_lpri1;
>>
>> [Severity: High]
>> Since cluster 0 components are explicitly deleted here, does 
>> bwmon_cluster0
>> also need to be disabled?
>>
>> The bwmon_cluster0 hardware is enabled by default in glymur.dtsi. If it
>> remains enabled here, the qcom,sdm845-bwmon driver will attempt to 
>> probe it
>> during boot. Would this result in a Synchronous External Abort (bus 
>> error)
>> and a kernel panic when the driver attempts memory-mapped I/O on the 
>> missing
>> hardware?
>>
>> If bwmon_cluster0 is physically absent on Kalambo but cannot be deleted
>> entirely because it contains the shared cpu_bwmon_opp_table used by
>> bwmon_cluster1, should its status be overridden to disabled instead?
>>
>> &bwmon_cluster0 {
>>     status = "disabled";
>> };
>>
> 
> bwmon_cluster0 is physically present and supported on Kalambo CRD, even
> though CPU cluster0 and its related power-domain nodes are removed.
> Therefore, it should remain enabled and does not need to be disabled or
> deleted. The driver can safely probe its registers.


It is still recommended that we disable it, since we ideally
shouldn't see any traffic from that particular bwmon instance.

-Sibi

> 
> Thanks,
> Gopikrishna

