Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4B27B47CC9C
	for <sashiko-reviews@lists.linux.dev>; Wed, 23 Sep 2026 10:18:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790158697; cv=none; b=EYVIJTANLG5eIH2j2PffCCAaIlmIWXCOQYsgUxk0wMAxEU5n7koGvfpAEs7xxsWeUXv9Ma+DsOJwe4IQLRCaiBPmbUtdeNw8/i4GUp6+2jDZEVfoskIILld0YSAI0eDMzVnNh+MjbacXy76JTOlQlGNk/D8w9mSMUa2j3AOuIrA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790158697; c=relaxed/simple;
	bh=z1ZwbLcUNGvULc+QXyi5mL+WX2bmwwnwUztcSc1jjyM=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=IvbzsI9pUPOEsgFl+vIsDBQfNDcTuMUaMbMB7jedeGEqCstkOV556jxaldaU9K80TAKO2FnAIWwFSwaLVp63afFVZg3bnLBmo+CsOzVcD+6+gtvXt8gljw3dJr3vUQwdrEb1nkSjNllfrCsMiWikodfb+gVUwnnjlaROmYImJLE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=BSwDJoXD; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=P9AR1zc9; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="BSwDJoXD";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="P9AR1zc9"
Received: from pps.filterd (m0279870.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 68NA2mPJ3208868
	for <sashiko-reviews@lists.linux.dev>; Wed, 23 Sep 2026 10:18:01 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	qsBE5yNUcKf7Yo4ZHQLDHYBWTTYgVcUf/x5nuIeu4NQ=; b=BSwDJoXD3HJXdLTq
	yPR9NPXhzNzpW6pMf8JX9NbOl+xij5Dzn4UbD4xePCvuBM7JZccuney8z29I0JNv
	FpjxPBLX8gK0phT2ZhWOgvSkW5mQ8OAmN7vubgjruT3B+XV0z6VWDCnf8+jjuCkR
	2JbrkqLxSYqC1IPQQ9qk9sPvq6PDW7za029uoJpSs/BSWebnQkT8F8iHvGJt+RMX
	fYMNv0vXP1OWjXwuLQegjI4e4pQvBu4bn7SzBQLcWKvf9GlFZSMSMQss5Uqtbx4S
	EJJsjvX6OgR1sX/+qTeV+84zCzwQKoCRT2KJkDaMWT1vbhy/MGTbSeDUBzaMFf6t
	RGn7iQ==
Received: from mail-dy1-f197.google.com (mail-dy1-f197.google.com [74.125.82.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4gv78n1fbt-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <sashiko-reviews@lists.linux.dev>; Wed, 23 Sep 2026 10:18:01 +0000 (GMT)
Received: by mail-dy1-f197.google.com with SMTP id 5a478bee46e88-3282d5302ffso798105eec.1
        for <sashiko-reviews@lists.linux.dev>; Wed, 23 Sep 2026 03:18:01 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1790158680; x=1790763480; darn=lists.linux.dev;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=qsBE5yNUcKf7Yo4ZHQLDHYBWTTYgVcUf/x5nuIeu4NQ=;
        b=P9AR1zc9gElhILqxv53mb09h9qs/PFLNwwyaOTOL82M74V2U6OBNUkz2vjL+CCQcBA
         2osZsYp0tlwpofG9ZWqjsm4zwv1WOdR7QblWfc+1N4+6s05pQGfrIFRcgix8xDN0uV1S
         /PBe+u+dPlfONl0T9CCWkMMoo1h6KA7NjZsyFvebP5PG6fgWcFZaSdjVASBwLBAnvtX1
         4q6jeIK5sSiK9oYdWosrGHkomYor2C6KTMmXpKhtOK5AoLQRmgjbHmkwyG0e+W9AwgRz
         Qvrpzn8Rs8GiqRT6LNA1gfsFOgQuCA3u7CEsmc6LrAoi9zaQlx4rP4V3MC1J9ieGTsk2
         NodQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790158680; x=1790763480;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=qsBE5yNUcKf7Yo4ZHQLDHYBWTTYgVcUf/x5nuIeu4NQ=;
        b=JuZYBfqhmOkPR5oup7e4aGZwPgRkcA7756t2SmhMbhsqfki5KGqShrZE4GdgqY2UF5
         NfEdAFd5d/HJpD0mMy1yV0cDdIaaPwEom/RkmcOpJKh7RFK4bhEm0UdWjxCfEi8A6MBz
         xzJFHoqRGajB9blk0RutNtoTzWL7aSJvelhwGFeeyJia8JoR7RQLutWyQ6lzj4kaffA4
         skJC8goP/yeBI6fz5BjLlar5LUBkOue687BEs/xHYfWCW0N85cMEJuzbhJ8NouZ07oSA
         6pa120LR7Vb2K66nsBvLP7wpAd8Zgv4yS8j0mX19qdDKMp64YrYgMGgVXAlYyv5y0wBD
         tG9Q==
X-Gm-Message-State: AFuF++lHwMhvOPTK6U0J50J7a+hu5hm2+QdDijZu2Ww8oCIZv2K3TF75
	ZmLB26SwsbP1xVVhRB7tb7i3BRj3txnxHN3Fm20L1a5gDNG/imlpHV1oc3i6FAQIF98QW2M1F0L
	mMUs1P5kPfPqEvSRzrFu6VeXRlzkkpuKnkiMUHe8eXXhrBqm1QVVbP3G4nJ38X84PE8nhPkLov6
	WKZtk=
X-Gm-Gg: AYBFou0xe8o1loZ2trqVtTwMc5sGiP3lFhOo0vTKMCVVROPRJiTEoHekLlyFEhLcYAW
	9j+VZsWavk5u8WVsZln7C6kJ34hwyIGbRRjcq8HpvfhrenA+6Ur6tu2S9kLGFupt4KKDqe/6NmZ
	UvPrX+IBn/uXv63i0mbibAd3XLacrV31y9iIiuMfl4/AkcA5kS3l9yTNvLZAWtw+KVCiEFpgd4C
	utSUtbTJtNB+ZnxCwlxXpXklrwAXlUOcVYlgo0BOVoEHiorbWKwi6rsekYc1o9/MW9NzYtqOmPr
	E2cVWw+NCecoeu/+ycwPTCWZNAC1FhccRRz+uYDvZbT9tL0byrBTsQPENsWN9YFpt+yUvxN5icZ
	YzxrZ3knCn/6rZa7jYSKa0IJd+sXA
X-Received: by 2002:a05:693c:8005:b0:33b:da1c:9bec with SMTP id 5a478bee46e88-33e5ca9ae39mr2432341eec.15.1790158680202;
        Wed, 23 Sep 2026 03:18:00 -0700 (PDT)
X-Received: by 2002:a05:693c:8005:b0:33b:da1c:9bec with SMTP id 5a478bee46e88-33e5ca9ae39mr2432301eec.15.1790158679401;
        Wed, 23 Sep 2026 03:17:59 -0700 (PDT)
Received: from [10.218.7.34] ([202.46.22.19])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-33e939fdd91sm5885830eec.4.2026.09.23.03.17.56
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 23 Sep 2026 03:17:59 -0700 (PDT)
Message-ID: <e8b656aa-bca7-4a1d-9588-c082a4bd665e@oss.qualcomm.com>
Date: Wed, 23 Sep 2026 15:47:56 +0530
Precedence: bulk
X-Mailing-List: sashiko-reviews@lists.linux.dev
List-Id: <sashiko-reviews.lists.linux.dev>
List-Subscribe: <mailto:sashiko-reviews+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:sashiko-reviews+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 6/6] mfd: qcom-pm8008: Tolerate missing interrupt
To: sashiko-reviews@lists.linux.dev
Cc: devicetree@vger.kernel.org, mfd@lists.linux.dev, lee@kernel.org,
        conor+dt@kernel.org, robh@kernel.org
References: <20260918-pm8010_i2c_support-v1-0-de33d78fad9d@oss.qualcomm.com>
 <20260918-pm8010_i2c_support-v1-6-de33d78fad9d@oss.qualcomm.com>
 <20260918165721.CA17C1F000FF@smtp.kernel.org>
Content-Language: en-US
From: Jishnu Prakash <jishnu.prakash@oss.qualcomm.com>
In-Reply-To: <20260918165721.CA17C1F000FF@smtp.kernel.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-Spam-Info: AW1haW4tMjYwOTIzMDA0MCBTYWx0ZWRfX+d2ndYF1tW/h
 oGtbFosNe2FDmrVvpSDq3K5uft/ZmR7WCmF9VVmLQVp7LbhTXU5psrVic97F/L5YwrYDzg5q4Vf
 pGoRIg8vfe53u13ByVkcMCPeJNDuLvc=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwOTIzMDA0MCBTYWx0ZWRfX6Usp+hE+Qhdq
 LqGuOo52aeXbSUzYjOzsR8PzwEBFi4JmR2UT38cI/eYMXf0ByZr2fpKgdqsDK5B8tUXOX1OPPvO
 uGhfisd4+WhIhIBVKBk5luDjHxm5GY37s/IXdc+mjvf/C33OBERAnGeXYJ78r54BkKfcCudFt6P
 D9azC6StpFCm1Gu4tP37GegqcRqJqRinRkWr/jbpOWCfMk8MLZhlKEywp4S6x22XmH+Otp9bGBO
 maC+0PmdKxC44AVXWXCAbM9MEc/cYm1UIt8Kb9LKmNjTxDTIRR4VbZOJTg/p7dMCa5P1uk5/z8p
 Pb9+EmHUsX89j0gafun8p8Rz/gB/smXebGANLsIydhR/PBYwxZCwBN60ri3Oc5p8erZYXZfunfs
 gZywKRpqDzIF1UkKkrEGrp4etDjx6Rt2tNoHjTNKyZNsNj6AheOUuvcCSBmaggAHDJ9sEZBTP77
 Q0enUD3TKZKiHEM7d0Q==
X-Proofpoint-ORIG-GUID: 7Jqbp36g7nWGiA84KSMKa8uwLD2f3eR-
X-Authority-Analysis: v=2.4 cv=aNFlOr9m c=1 sm=1 tr=0 ts=6ab3a759 cx=c_pps
 a=Uww141gWH0fZj/3QKPojxA==:117 a=fChuTYTh2wq5r3m49p7fHw==:17
 a=IkcTkHD0fZMA:10 a=VdqzKS8jKosA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=gowsoOTTUOVcmtlkKump:22
 a=VwQbUJbxAAAA:8 a=EUspDBNiAAAA:8 a=y5K7N4shZw4fCDjzXqEA:9 a=QEXdDO2ut3YA:10
 a=PxkB5W3o20Ba91AHUih5:22
X-Proofpoint-GUID: 7Jqbp36g7nWGiA84KSMKa8uwLD2f3eR-
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-09-23_04,2026-09-21_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 spamscore=0 lowpriorityscore=0 bulkscore=0 malwarescore=0
 priorityscore=1501 adultscore=0 phishscore=0 impostorscore=0 suspectscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2609040000 definitions=main-2609230040

On 9/18/2026 10:27 PM, sashiko-bot@kernel.org wrote:
> Thank you for your contribution! Sashiko AI review found 1 potential issue(s) to consider:
> - [Medium] mfd: qcom-pm8008: bogus IRQ mappings for child cells when client->irq is 0
> --
> 
> commit 2c273914596163e5696becde808ceb33d98f0fe8
> Author: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
> 
> mfd: qcom-pm8008: Tolerate missing interrupt
> 

...

> [ ... ]
> 
>> -	/* Needed by GPIO driver. */
>> -	dev_set_drvdata(dev, regmap_irq_get_domain(irq_data));
>> +		/* Needed by GPIO driver. */
>> +		dev_set_drvdata(dev, regmap_irq_get_domain(irq_data));
>> +	}
>>  
>>  	return devm_mfd_add_devices(dev, PLATFORM_DEVID_AUTO, data->mfd_cells,
>> -				data->num_mfd_cells, NULL, 0,
>> -				regmap_irq_get_domain(irq_data));
>> +				    data->num_mfd_cells, NULL, 0,
>> +				    regmap_irq_get_domain(irq_data));
> 
> [Severity: Medium]
> Will this lead to bogus IRQ mappings for child cells when client->irq is 0?
> 
> When the device has no IRQ, irq_data remains NULL, and we pass a NULL domain
> to devm_mfd_add_devices() with an irq_base of 0.
> 
> The MFD cells (such as pm8008_temp_res for qpnp-temp-alarm) specify IRQ
> resources using DEFINE_RES_IRQ() with hardcoded offsets, for example:
> 
> static const struct resource pm8008_temp_res[] = {
> 	DEFINE_RES_MEM(PM8008_TEMP_ALARM_ADDR, 0x100),
> 	DEFINE_RES_IRQ(PM8008_IRQ_TEMP_ALARM),
> };
> 
> When mfd_add_device() processes these IRQ resources and the domain is NULL,
> it falls back to assigning the IRQ as irq_base + start. Since irq_base is 0,
> a child device like the temp alarm will be assigned a global physical Linux
> IRQ matching its offset (e.g., 0 + 5 = 5).
> 
> If a child driver requests this IRQ, could it steal an interrupt from another
> hardware device on the system, leading to unexpected behavior or resource
> conflicts? Should the driver dynamically strip or adjust the IRQ resources
> from the MFD cells when no parent IRQ is present?

This sounds right, I'll make this fix in the next version of this series.

Thanks,
Jishnu

> 

