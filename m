Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3C56447ECF4
	for <sashiko-reviews@lists.linux.dev>; Wed, 23 Sep 2026 10:17:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790158675; cv=none; b=JUpbuqTiUCNMcP3QTVDEv+6+y1whzrU/tV5xFPEAlGajj1fFD/ce/1z/4jScrmL9P7neu3DfPUpvEmy6atp5195bbiem+TIHo+Fj19IBTbIehrsr69mnW6uD6PtbHccybiyEumPsKE0VAF6jQcxpcPH6gqH8raDBjMxWrZ+hTkI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790158675; c=relaxed/simple;
	bh=qoT31AAPa5+jJb2CqRYaA6IhQgVzFn6wfS5OW28TrnM=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=gK0vXDoH4FtHiE9pHmff9zHA2GMvGxV25uw1aXf0h578PjxL1VlxbHHeSTDGXm2OsF5Zpdvbdw83e9HrxoOllNguBgra+57tRMuOTPzhRsy8lUdCu+hl5yitn8Oi0VV7Nhpym2XeKH3zKWwlUkATZLVcjtRWhqElO4mXf45P9oU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=aff2TP+1; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=jtnoA6f7; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="aff2TP+1";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="jtnoA6f7"
Received: from pps.filterd (m0279871.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 68NA3JZs3566259
	for <sashiko-reviews@lists.linux.dev>; Wed, 23 Sep 2026 10:17:47 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	oGJKm8l6LX/BqhxrHb9SSldcZfCWF4dWpVhMNcxEzwM=; b=aff2TP+1C5hfL6hL
	R2AswIHOI2KzUW8uhqot5VYFyg4EG7dAEr3mlGiy55xO9joIk3/KIeLP4l/r9adT
	oBt4xYhCfpvix0Y32nHo6fD9D+m/DhDV7hedacNKcawKlDPM/n7LcY7XVpQ/CjhZ
	NDSLrxg7TR95PGkpB84QO2ljZrzaH5pJdGWDeM/6HGTEuUNkmoaA5HOpheGCaMvO
	L2gFsC6Rcsl2ZIKx9mvO54HxSeFLi6lE6pMf5K2nNNnIXfy8zR2Yroapgkypslv6
	Zjn2R4a8SWH9jlZccsSMcFeUrfCgaVY8qLGfzJSY//vGJVNWGEddMkxhBPrNk2p+
	kN0eHw==
Received: from mail-dy1-f200.google.com (mail-dy1-f200.google.com [74.125.82.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4gux7xuufs-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <sashiko-reviews@lists.linux.dev>; Wed, 23 Sep 2026 10:17:47 +0000 (GMT)
Received: by mail-dy1-f200.google.com with SMTP id 5a478bee46e88-30bcb065bfdso1022744eec.0
        for <sashiko-reviews@lists.linux.dev>; Wed, 23 Sep 2026 03:17:47 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1790158666; x=1790763466; darn=lists.linux.dev;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=oGJKm8l6LX/BqhxrHb9SSldcZfCWF4dWpVhMNcxEzwM=;
        b=jtnoA6f7nGnX3eDdjKusltjOI6QNcg05Ezy2fUSddVe7JnJeTvIcWXgpF7x4mqzBoM
         CLz9pyNKZ2tq6pnNtoRvOBsl6aEn9hJvk9ht0wziRNKYo2ArmTj+QRUObQB3U8iCurBA
         zXdLDl3yEsCaoIaLHmK2jLId41uAQmdqE/jJY7s1+Q5nHAgOVMbT6zd/C2+lp29eVJbi
         ysON29+UifnHq3gYrsSJMdmWhelGUzgaJRZSnFTGa9H+5OyXRsHCc55gRUpaCbbW8XGC
         N5IuoibRu1KtKtUm7tU/P90GJQAQMEOn4mdGFO392GhxP63o6WcpW1bp37zbDsg1xIDu
         ZmPg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790158666; x=1790763466;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=oGJKm8l6LX/BqhxrHb9SSldcZfCWF4dWpVhMNcxEzwM=;
        b=bCj78r9ZxfX15MLDnB6/xsfrPJhqntX3UTkN4w9qvmuDpZrbOt5widxP7KMXCTxcuH
         ZgH0qza3zohehq7PKjeJ7XY1p9Eo2472rgOO2B6OO9ZdIFkhjNzVmqCBDgGXjxtQ4iE6
         OA9AjD4VyiIJfWTaIIRo61Ix3EUxcwHP6KpZNrUtn4mMMB8Dyuc45TPqiAgMkYovzoVh
         GfA+TmT4HfMcEwY5+SKbh9x1LldjMxSR/zV4PDwwtQjHBWHpGhQxJEqNWlH2kHw8+14q
         4v7beVhtQPwqhmcx2rROUKKwrFZAxvvJlwe+Vv6CDNIwJam5rOIIINkFV9fldWB/Bgt7
         moGQ==
X-Gm-Message-State: AFuF++nA/zb01SwGsk0nX+zK1Yv1FfhQhVH6nnu+fRzDL8bRLSZAqboU
	i69ZgDIHr7/zcIPPmBmdhCG2Vp7NC11LBj3QzWglnJVldL8YrSGedECUuUWeLQKaT2Jc5CB3OIm
	U/LL4YH2CkSzlxYEh3GWFRK154kKxCg6MKOzjmfOWYe/KWXnLfio6gi04Rg54ZNz5FdNS6MzWjK
	PV7ZQ=
X-Gm-Gg: AYBFou18tkNctcPmepqI1YBAipwt4gq66cMxIqjqkYVI2AkTQZV57iMpbD6tuV/rRp/
	IT/ez4vVQ7/WqQJ9Kc6eNxnoS2oeNEHjvrq2oWjQrS15MtR952/Skh+ftUbeZinXyTBIfmSjsWc
	NFvZBysdnL6ECCdfARabJP0E2ziS7fQkjhwoX/4SOS4hvPKLyd4/ZGnF0ASqNTm9KGyJgyv2dGY
	0Lhrvls24yhYeVIFI2Us+1lDdysEtpKk7keB9FtQGTr6hP5v43JELOw/yG/1c7DbntzW2DdB3tM
	upRydTWW6GBii8VtjQpbhvamxfsNz7NBq2zLWXYau1M2BiIaVCulyW3gRjNEhl4nEOb/vj3hSov
	LOqs7ZdVMugYS6CQLlWj2jICecjnw
X-Received: by 2002:a05:693c:42d9:b0:33b:e75b:cc42 with SMTP id 5a478bee46e88-33e8d7d8b7bmr1703488eec.19.1790158666037;
        Wed, 23 Sep 2026 03:17:46 -0700 (PDT)
X-Received: by 2002:a05:693c:42d9:b0:33b:e75b:cc42 with SMTP id 5a478bee46e88-33e8d7d8b7bmr1703474eec.19.1790158665532;
        Wed, 23 Sep 2026 03:17:45 -0700 (PDT)
Received: from [10.218.7.34] ([202.46.22.19])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-33e939fdd91sm5885830eec.4.2026.09.23.03.17.40
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 23 Sep 2026 03:17:42 -0700 (PDT)
Message-ID: <5c7b5697-8645-4230-86f4-d31eac559a0b@oss.qualcomm.com>
Date: Wed, 23 Sep 2026 15:47:39 +0530
Precedence: bulk
X-Mailing-List: sashiko-reviews@lists.linux.dev
List-Id: <sashiko-reviews.lists.linux.dev>
List-Subscribe: <mailto:sashiko-reviews+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:sashiko-reviews+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 4/6] mfd: qcom-pm8008: Add PM8010 support
To: sashiko-reviews@lists.linux.dev
Cc: lee@kernel.org, robh@kernel.org, mfd@lists.linux.dev, conor+dt@kernel.org,
        devicetree@vger.kernel.org
References: <20260918-pm8010_i2c_support-v1-0-de33d78fad9d@oss.qualcomm.com>
 <20260918-pm8010_i2c_support-v1-4-de33d78fad9d@oss.qualcomm.com>
 <20260918165137.302631F000FF@smtp.kernel.org>
Content-Language: en-US
From: Jishnu Prakash <jishnu.prakash@oss.qualcomm.com>
In-Reply-To: <20260918165137.302631F000FF@smtp.kernel.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-GUID: pZHtISzR3Mwzcb9ON6ZBW7dbptAlGliA
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwOTIzMDAzOSBTYWx0ZWRfX9Aoia8039Li1
 nz9xfhaVmzQmfGndzT50xUFsdY1KmVsOG0YqSLCLduaga4fd+j6CKvx3m0Cd8shT3r9SA88YJ82
 F6lrNYWIegk8ln07PWi+MLYrykdzFe4kegAKIsKj9n+mi9h9MBmA9nrugL8CtBpzh4SBcTY5H3U
 p1rhvbjgg3KyA2vMJS7vDqeG2J3WpExvcX9HTzUg8qA1aDtEVesYqMvT3SGJSZRNAOKukeOFelW
 KVVwvX9HHcYyIstTxmzlwl+NL02bMNao8a0jbgnstpmO0kxLGzhnw2uOrMT6Zm/625BVnHbqX5M
 xk28lVTNtk89jJjPO70JIJuRuBfju0AWNgCk+gtyNTF6hYVd6lyAhyBvFh+lHV4Y7nDRaqVrN+l
 89KJxZVLm2DbS5fzdflfiGCoSPQDFijw9eSiM5uKkEUds+HS7uuDXwERorEk2H5Nh7fQu1yMfLD
 iyUvItUjV4gDWFw1Nkw==
X-Proofpoint-Spam-Info: AW1haW4tMjYwOTIzMDAzOSBTYWx0ZWRfX3vDvqBxVo5zR
 4SF4fPZSEdtXgHymbdhtEao5m5cOkWDAkZJnw/coPDsG0GR2ro+P+e6erUHuUwXkB5GmKbPmABW
 UvBLZZ8SWDrj5ucxfb7Ktpu6QOyh4Uk=
X-Authority-Analysis: v=2.4 cv=QsDLTlyd c=1 sm=1 tr=0 ts=6ab3a74b cx=c_pps
 a=PfFC4Oe2JQzmKTvty2cRDw==:117 a=fChuTYTh2wq5r3m49p7fHw==:17
 a=IkcTkHD0fZMA:10 a=VdqzKS8jKosA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=3WHJM1ZQz_JShphwDgj5:22
 a=VwQbUJbxAAAA:8 a=EUspDBNiAAAA:8 a=5oOkLhcO33hfkyhgiOkA:9 a=QEXdDO2ut3YA:10
 a=6Ab_bkdmUrQuMsNx7PHu:22
X-Proofpoint-ORIG-GUID: pZHtISzR3Mwzcb9ON6ZBW7dbptAlGliA
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-09-23_04,2026-09-21_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 clxscore=1015 lowpriorityscore=0 phishscore=0 bulkscore=0
 suspectscore=0 impostorscore=0 adultscore=0 malwarescore=0 spamscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2609040000 definitions=main-2609230039

On 9/18/2026 10:21 PM, sashiko-bot@kernel.org wrote:
> Thank you for your contribution! Sashiko AI review found 1 potential issue(s) to consider:
> - [Medium] mfd: complex data passed via match table .data field
> --
> 
> commit a6c2d131522cd1b3f195202001e9365b690fa7f6
> Author: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
> 
> mfd: qcom-pm8008: Add PM8010 support
> 

...

> [ ... ]
>> +static const struct pm8008_match_data pm8008_data = {
>> +	.irq_chip_desc = &pm8008_irq_chip,
>> +	.mfd_cells = pm8008_cells,
>> +	.num_mfd_cells = ARRAY_SIZE(pm8008_cells),
>> +};
>> +
>> +static const struct pm8008_match_data pm8010_data = {
>> +	.irq_chip_desc = &pm8010_irq_chip,
>> +	.mfd_cells = pm8010_cells,
>> +	.num_mfd_cells = ARRAY_SIZE(pm8010_cells),
>> +};
>> +
>>  static const struct of_device_id pm8008_match[] = {
>> -	{ .compatible = "qcom,pm8008", },
>> +	{ .compatible = "qcom,pm8008", .data = &pm8008_data },
>> +	{ .compatible = "qcom,pm8010-i2c", .data = &pm8010_data },
>>  	{ },
>>  };
> 
> [Severity: Medium]
> Does this match table improperly embed complex pointers?
> 
> The MFD documentation explicitly flags passing complex pointers via the
> .data field of match tables as a pattern to avoid. Using an ID enum
> such as (void *)TYPE_PM8008 instead of passing the &pm8008_data pointer
> would comply with the core subsystem patterns.
> 

I'll make this fix in the next version of this series.

Thanks,
Jishnu

