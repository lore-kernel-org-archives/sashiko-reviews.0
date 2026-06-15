Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AB9DE35B633
	for <sashiko-reviews@lists.linux.dev>; Mon, 15 Jun 2026 08:54:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1781513700; cv=none; b=OFDRC6Eiq1+G7bjXi6hDYcFQXoBLdT6cnrc9ZlplCOjVnFxpLcEER6HC1e9ypmFeG1HZNKvcU9skswdWH2rRgrB1GWYjmyQxYrVXFApT/XZ7SwGT+Lwa6uxLg+w5wD0GNglGXCvCrRWvy3yEvQPxlbehQDOpSWay+QAAJG7SWLc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1781513700; c=relaxed/simple;
	bh=ImY+QKS1yWtn0AtQzKxjo/SmwqApVnVDxa9ZWuNJn5U=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=rqnDEM3uABG7KT4Fqya3/pUSHv9JAUg8v8i6kGVHPL4JDI8xe2Dej27+8SJYevRgQ5VOifAJXt6qUKr0EJUaI5SAG2ktgd905C5wQHZMZbiPanBEQszcqwMKpEE7WEw0chq3Im5LMtsquN3FTx9ygyWu0bZ6rCH9kOs8/Z0lBkk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=AhsDasjF; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=h1HCupfu; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="AhsDasjF";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="h1HCupfu"
Received: from pps.filterd (m0279863.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 65F6ItPI3332442
	for <sashiko-reviews@lists.linux.dev>; Mon, 15 Jun 2026 08:54:58 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	r8bECzSiTb3LgJMZEcwHvvqOjyDEdKf1cdVEHMFUpUc=; b=AhsDasjFeRTEExNf
	5ijKNMYAgfwAsDtnm2nncGAnI8WyxVB6BpGqIjDkfE5kQ52svlGwJJEdMhOhArO9
	f2RuvkWt25ueryhn0EUmPzjUFIVeOwOsjauvDXgXAdjy2pthTrSuRK+Z7c/df4qa
	IIZyS2jEdfTHcMp6dftifGxZaixqLuzZMoTOT9ohJQXax0jJ7uiT8uzw5CVrRIZ5
	PqyrRvMU6PGeLB18ow+6kFNN0T38T0JQ814hU4kY/nXBusc+5rkxZKZssarJKIRr
	Ys0Y0254r9e9HnUsBGTtHJ1PzfpW3TWn83LSCsQDhGGHhOiBKGgwYeGnGNgBxdhF
	ChE15A==
Received: from mail-pj1-f70.google.com (mail-pj1-f70.google.com [209.85.216.70])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4erye16kb4-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <sashiko-reviews@lists.linux.dev>; Mon, 15 Jun 2026 08:54:57 +0000 (GMT)
Received: by mail-pj1-f70.google.com with SMTP id 98e67ed59e1d1-36bc54005a7so4034427a91.0
        for <sashiko-reviews@lists.linux.dev>; Mon, 15 Jun 2026 01:54:57 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1781513697; x=1782118497; darn=lists.linux.dev;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=r8bECzSiTb3LgJMZEcwHvvqOjyDEdKf1cdVEHMFUpUc=;
        b=h1HCupfub3QmbmMVAh7jUzVghohxSjdGfEdK/Zs2bbzNQ0aI5ljTZN2Pn/8xC9LBkx
         Z8ftshpvLOGywmIdHjlE6l/Dwv1G6ZlE8MLiyFpXtDHOpOSpUl7CUURQ3JxG71iSXRnh
         V4cioXXBgjqs+6J0TXrKrpNPPY3+R/kWznqRVOpoudlttJXIa/cuu5ATLTU09hH1znfz
         tcsR3zPDiVQAi1A/hpr7aC+V9N2rOsCTV3vt5HtsrXgHuB3Kb6/aMU1YYnlyMWW0O+56
         OWWfkEPlgowGmhk+9xph3LJ6WMowAuV+UYGNUR6i59NrZHLbWZhfo0BetcOSHfdChwWa
         xJNA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1781513697; x=1782118497;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=r8bECzSiTb3LgJMZEcwHvvqOjyDEdKf1cdVEHMFUpUc=;
        b=TDSa69JtIO9Ib/9CcjAH8hZs8VwpkvQ876vpmZ2C3MAmXMQ/hfev5H/jwRQZq9ADGk
         dsmUpDY8lWx56oomkoTkZyrCJYNoP5klSL7Yq4T1Wecyj4jv6kOsVmqg1yjEHKG5dg6t
         AA2VV3p9C5pxxLelbDAKlmxmmWzGgFBn3DiFEIPds8oPUODT+CXmGUUvO201OJeWl0G1
         ANMYWfwR63jNtiFAhUgnllLDYwRBPJTCfQwcPJMK3nGrzTId56wwMGfbnpgnNtTcSv9L
         A0ndD5nZ5msjxvaeyE2Hck2NpwJGpjnV839zsvfzw/pe/25tC75i969cEqB+o/JXMUFz
         N3Vw==
X-Gm-Message-State: AOJu0YxLCcZTV1nBY0ajCA4eeAbrE59+IcBdZRXgqpeXcG3B8Bs+sxqS
	s4imKJq8rPyuegopAycnTcIHDYlmgBBxvqNGE0XekYnCDJn+SiPbhDuPA4IJASp9QOzk1+T52Oo
	698PP8nXEAy+XdqrEfu3CRqEBCFOSVagg3fXGcqFd1z0eDhJuyeXK46QCn3E6ZqB0zta5JwOfvC
	BAaY0=
X-Gm-Gg: Acq92OFvO8acRqcyIk4CdsUK6FEMceHjpGYQskrGLYIBjZ/hqLZFMog679y0rLuR3aL
	Iqh+0/2Oxyk6Rg6DoSE6sIg5lFfFFIp8lGcoH35ZmVa+1ssMjGHwFD2VCHy3oOXYsuata4yWmPU
	n620AqXXWo9ZAMl8FGx3NgiihawYYLhN4Lrb0qfJki64Wtp7lnEf5JsZNOqggR+FVXPbZZYge9t
	Ih7raODMq8/I8tA/u398oozXUmb8LxPG7d8uON3K/8wc8k4WOYshO2I6cDkYQsbjdZdTzs5EZ6F
	k0ggqW5iiWwUEO10z8HZwqlrsOiPxZZX5mAehg8kNGmxQNEgeSwYPN6hU1asWmWDcYZqcbLkdjY
	VjK2ld9bSUS5eWpqGe2gCaUHzcXsGKj6RbHwTXDiPDDIWNMQb4y6Ylp2m9TmwfIxpjg==
X-Received: by 2002:a17:90b:4ec8:b0:368:7c0f:ebf7 with SMTP id 98e67ed59e1d1-37c2bd06679mr10501802a91.16.1781513697375;
        Mon, 15 Jun 2026 01:54:57 -0700 (PDT)
X-Received: by 2002:a17:90b:4ec8:b0:368:7c0f:ebf7 with SMTP id 98e67ed59e1d1-37c2bd06679mr10501782a91.16.1781513696915;
        Mon, 15 Jun 2026 01:54:56 -0700 (PDT)
Received: from [10.151.37.217] ([202.46.23.19])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-37a212ab0dcsm10243964a91.15.2026.06.15.01.54.54
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 15 Jun 2026 01:54:56 -0700 (PDT)
Message-ID: <0d6e0c5b-045f-4b14-860f-872aa294c876@oss.qualcomm.com>
Date: Mon, 15 Jun 2026 14:24:53 +0530
Precedence: bulk
X-Mailing-List: sashiko-reviews@lists.linux.dev
List-Id: <sashiko-reviews.lists.linux.dev>
List-Subscribe: <mailto:sashiko-reviews+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:sashiko-reviews+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3 3/3] regulator: qcom-refgen: add support for the
 IPQ9650 SoC
To: sashiko-reviews@lists.linux.dev
Cc: conor+dt@kernel.org, robh@kernel.org, devicetree@vger.kernel.org
References: <20260615-ipq9650_refgen-v3-3-5f611623629c@oss.qualcomm.com>
 <20260615084646.4F0A31F000E9@smtp.kernel.org>
Content-Language: en-US
From: Kathiravan Thirumoorthy <kathiravan.thirumoorthy@oss.qualcomm.com>
In-Reply-To: <20260615084646.4F0A31F000E9@smtp.kernel.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Proofpoint-GUID: W0PZ56rFZbz8if4avWFWjkiIhdU0nmeV
X-Authority-Analysis: v=2.4 cv=MNlQXsZl c=1 sm=1 tr=0 ts=6a2fbde2 cx=c_pps
 a=0uOsjrqzRL749jD1oC5vDA==:117 a=j4ogTh8yFefVWWEFDRgCtg==:17
 a=IkcTkHD0fZMA:10 a=FelO9ux0wxsA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=yOCtJkima9RkubShWh1s:22
 a=VwQbUJbxAAAA:8 a=EUspDBNiAAAA:8 a=LUqKRbfh-dbFGJuYVaUA:9 a=QEXdDO2ut3YA:10
 a=mQ_c8vxmzFEMiUWkPHU9:22
X-Proofpoint-Spam-Info: AW1haW4tMjYwNjE1MDA5MyBTYWx0ZWRfX7NKDOk/zGBFH
 SeclwhQIaTKbDHgGRiA/Ra9mpoZiz4NcbGnfQbqlnd0HaF4J3NYF+JRqizt5gqFzjdCZJzPKAo7
 IhNDfLvh0Jro2jpv1CdxOwXcbuie6SU=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNjE1MDA5MyBTYWx0ZWRfX9FXXNFW0nJ5b
 KVmuvd/rrsWkN0U55GHdUJzqTmdf5qf34NRGHjmOjCsw+n79Vdbtv+xBwyXTEhWoVt1SvwgkHuh
 nDQZ0UfgUwFfOZYiOobCkCzk7FhyaukPmsH379jkcQ7W0hW/3y5wrz7sQLb+zBuylR1Jk/0i7p2
 So6bTnB7z4ns9wJzgGw0DzWDETaqzya6J3WcTX3FGvqS8hpViUFcYGe1lu9zegwgpi4eoPabUpr
 GK43p9NbVAQ3G/O2z8cPdlhU2isdwjHCCGmcqQ86rMFmkUthkOApYjghYjJVW6nQB7a+Rt85swH
 GFxHrBoBVKZ0bVHqhaPcQ6nC+iJODAQ+xUmxZlV+AGM97p5zAtwAgxTgp/V3BQNXX98Bf37vBqp
 TMO13VVd+YqCVdlitlw8waFa6zFI+fEG1MUwPcxe6mEZV7djsnLlVGOUhD1Bd9Ess7o93/nUgda
 /zCfC2MqEw1VbB2TMug==
X-Proofpoint-ORIG-GUID: W0PZ56rFZbz8if4avWFWjkiIhdU0nmeV
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.125,FMLib:17.12.100.49
 definitions=2026-06-15_02,2026-06-12_03,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 impostorscore=0 spamscore=0 priorityscore=1501 phishscore=0
 adultscore=0 suspectscore=0 clxscore=1015 lowpriorityscore=0 bulkscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606040000 definitions=main-2606150093


On 6/15/2026 2:16 PM, sashiko-bot@kernel.org wrote:
> Thank you for your contribution! Sashiko AI review found 1 potential issue(s) to consider:
> - [High] The `.is_enabled` callback maps to `regulator_is_enabled_regmap` without enabling clocks, causing a synchronous bus hang on IPQ9650 during probe.
> --
>
> commit 57e8a1a06a52f828e01d53b16f6c708e7f6df23e
> Author: Kathiravan Thirumoorthy <kathiravan.thirumoorthy@oss.qualcomm.com>
>
> regulator: qcom-refgen: add support for the IPQ9650 SoC
>
> This commit adds support for the IPQ9650 SoC to the qcom-refgen regulator
> driver. It introduces explicit clock management for the REFGEN blocks, as
> they are not enabled on power up for this specific SoC.
>
>> diff --git a/drivers/regulator/qcom-refgen-regulator.c b/drivers/regulator/qcom-refgen-regulator.c
>> index 6a3795469927e..4b8aa40d7efe0 100644
>> --- a/drivers/regulator/qcom-refgen-regulator.c
>> +++ b/drivers/regulator/qcom-refgen-regulator.c
> [ ... ]
>> +static const struct regulator_desc ipq9650_refgen_desc = {
>> +	.enable_reg = REFGEN_REG_REFGEN_STATUS,
>> +	.enable_mask = REFGEN_STATUS_OUT_MASK,
>> +	.enable_val = REFGEN_STATUS_OUT_ENABLE,
>> +	.enable_time = 5,
>> +	.name = "refgen",
>> +	.owner = THIS_MODULE,
>> +	.type = REGULATOR_CURRENT,
>> +	.ops = &(const struct regulator_ops) {
>> +		.enable		= qcom_ipq9650_refgen_enable,
>> +		.disable	= qcom_ipq9650_refgen_disable,
>> +		.is_enabled	= regulator_is_enabled_regmap,
> [Severity: High]
> Does this result in an unclocked MMIO read?
>
> During device probe, the regulator core calls the is_enabled callback via
> devm_regulator_register() to determine the initial state:
>
> qcom_refgen_probe()
>     devm_regulator_register()
>        regulator_is_enabled_regmap()
>
> Since the IPQ9650 clocks are disabled on power up and only enabled later in
> qcom_ipq9650_refgen_enable(), regulator_is_enabled_regmap() will perform an
> MMIO read on the REFGEN_REG_REFGEN_STATUS register without the required
> clocks enabled.

REFGEN block can be accessed without the clocks enabled as part of this 
change. Hence there will no issue while checking the STATUS register in 
the regulator_is_enabled_regmap().

>
> Could this cause a synchronous external abort and a kernel panic during
> boot?
>
>> +	},
>> +};
