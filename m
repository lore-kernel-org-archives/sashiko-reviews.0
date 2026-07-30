Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C049C3DCDA0
	for <sashiko-reviews@lists.linux.dev>; Thu, 30 Jul 2026 10:08:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785406091; cv=none; b=b1Nq0FCHJwzYvG3opN/ERFzzj7eHpS4nUjfBLNNGuRsomADXMuH88DHGpqCEw9IH8EvEDlZV3a7Kd5/QHkfNVSva6r1nlJE+MxnSvPhxibuN0wEnqWSp7YUZxpgj2BXrZl2fmztj3ii4sV2UuIxFCWetbdj9l5MBsVuLh8eRfTU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785406091; c=relaxed/simple;
	bh=Qbd9OP9RaSmVgWE/08xXchOAy87JHiIPy3Xt7XdRZyo=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=Js5S6NEu+vrhQJWEUnOSIkD1dqbCtbqFc3ED6WFlgy27cYXTifEpqxE0WlKQZILL5rL421pdpy644bXH6Yshv/7yaLsn1+qU9iR3wtiKiCxouZ1M7S8/ywKTm3GWngh6dHViYQdFq7zp1KNmPhgaMf0mU2Di2CSuo+upK0LzFJA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=ogDo6z8C; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=MES789+4; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="ogDo6z8C";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="MES789+4"
Received: from pps.filterd (m0279872.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 66UA2NB0363244
	for <sashiko-reviews@lists.linux.dev>; Thu, 30 Jul 2026 10:08:08 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	2l/iWVzzYUmH93s2wNbdWFoLyvXQJu6s9IWrGf+BUl4=; b=ogDo6z8CKj5k3R/E
	lBLT4WAu6qWnsJG7MmcE+3xNcS1QY6XTl9Q3M/ht/i3/K86rMzk+6JMk8tCg+ObH
	U3x9106Jw4DdfLxuTx5EVcnbekC39xIAoOpLn2WfuTioRwAD3AKTTaoIAerV+2Mq
	jG7GAlmeVQlL8OOlry87vdjEtgsfi/pDvMBkC0KTSCHr3g7W3xg6FS6qsUQIFCd2
	tRnQWflcih6pW9ISoaN589uS7cZs6zSyUdYW5dyzgG3y3Q3BMpT5KSWdI2sByJH/
	MynyDk6JcWOJ/eUZ3cNUQFfXdgGi4DtIcq49UXFlIFaKmNqnDKZ2uP6BdyBiybjB
	0bHuyw==
Received: from mail-pf1-f199.google.com (mail-pf1-f199.google.com [209.85.210.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4fr3ucr755-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <sashiko-reviews@lists.linux.dev>; Thu, 30 Jul 2026 10:08:08 +0000 (GMT)
Received: by mail-pf1-f199.google.com with SMTP id d2e1a72fcca58-8482b95574dso2441450b3a.1
        for <sashiko-reviews@lists.linux.dev>; Thu, 30 Jul 2026 03:08:08 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1785406087; x=1786010887; darn=lists.linux.dev;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=2l/iWVzzYUmH93s2wNbdWFoLyvXQJu6s9IWrGf+BUl4=;
        b=MES789+4GYivMiZVsGEucU99a2g2BjRp3qMnVNZ5U53i3lX4Bz6SEgjm5zt/n/hc/r
         37TEBCDjGugLIKes8kCFsFj0QYWmM/7RQP/3nJAhGr/MgjWYLKo4SnBw1SlH7GfsI1a4
         Fp/t6RPDqWMDv/KD2Nb2EsXaLkBAtQ8E415a+peX5FDI8S+v1/L0gCzlZeWFfqoGAKRX
         yjsW+dNus4i+05/2LxxCiuO3qMxg5QiZDEQ54tze5JTrjnmBvY9mnLX17hxNpaq1CbmC
         7eDaFxvL+CovQSZWmdE2LRLmx5SSkyO++N1EKYvtxS4VazcLAH0BQ4oC/lgFZZo2fibd
         b0bA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1785406087; x=1786010887;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=2l/iWVzzYUmH93s2wNbdWFoLyvXQJu6s9IWrGf+BUl4=;
        b=pQmkBGH5dA6KUiJn26DDGelpd5ja7QMedFFFI3XEJG8mnEoiOujCabo5PHn5MdAakF
         fsEjXqrRyBv9fmO5gv9OBk/VEEd1aoXlKAJMsx2CmnBGfKlbRSpgtUgwH2FxeZ93Guyc
         49EosvLnxio2bBfw+XEba9V6FkLA/d3yy2VJFn9yQsVr3OuPWGTAVO2ek6Ffx/zjxaPu
         dP/FYm936p6VYNTzW/76JDi7N6MCXXFoQ5XthmlgGmP9sVeK+a0xE8rNeZuiVRNg30gV
         2ZXVfKxewxIBSWjB7icQNRKe5C52edhsKCkEcCPDl8GXzbmvRK4fCYoKEiLLyzrItMKu
         Ag9g==
X-Gm-Message-State: AOJu0YzJc9/7ngd+1xcghr0m3Va+AcrXyXL418lWffs2V/5ySBKdLpBT
	/XMrOy5NCh5pJd8iW2XTPuBlYdcEj5rJf0LeixLMONiVNAzLuxuSmqpmVtCKzUbFQuy9Tz0x3NH
	oZiT3GBOpFqejegPiy+JZSkq7tWh+maF5DevUHh5ULlAomyjIMuqq4DaKw7oSju3WoFQphbrZxb
	iuj0PPfQ==
X-Gm-Gg: AR+sD116gDY8YmoT1VFGFGKDhy8lxaQSAZKsA7ZhfI5JltBERgPeloYSlFER6k2c2RA
	i8YsFiYPjOvwh2jTF19zrCVvFLfspQyABosf1jwwQ7dBJ2+9ZBZAAsFdZNf/K3BrdbDNueUFqQt
	k3SNkJgT3w3vDZ4fZ/sw8flUK4yjryLpTMkxm1fVMn02uA5euG580H9fSOa19jYlmd33AUEwGDV
	OZPkBB5g42CVnoPFtUpcpQ1NELZuBZAhiYSP96K52hJfcOFPd/VCXYmZTE6ZdmSd30KoVxJ3yGS
	6DCoHYpRrHRs9i0N0m1hp56q9spE8rsSlHnplee2L3YVLZlyRBitwLR3k83CgCMKZLQiMMrzCR3
	NyyelWYAQmBebdGW++c39YHzIXrTzr072vkw8MjTstQqgZrJ3ZyXc1TXSXAoXDrFEEXDf/Xm4
X-Received: by 2002:a05:6a20:428b:b0:3c6:5723:5356 with SMTP id adf61e73a8af0-3c900a28d19mr1970045637.73.1785406087271;
        Thu, 30 Jul 2026 03:08:07 -0700 (PDT)
X-Received: by 2002:a05:6a20:428b:b0:3c6:5723:5356 with SMTP id adf61e73a8af0-3c900a28d19mr1970023637.73.1785406086816;
        Thu, 30 Jul 2026 03:08:06 -0700 (PDT)
Received: from [10.133.33.210] (tpe-colo-wan-fw-bordernet.qualcomm.com. [103.229.16.4])
        by smtp.gmail.com with ESMTPSA id 41be03b00d2f7-cbdba63f806sm2111539a12.23.2026.07.30.03.08.04
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 30 Jul 2026 03:08:06 -0700 (PDT)
Message-ID: <0637c5b9-2cf3-462c-9664-e809cb9bc177@oss.qualcomm.com>
Date: Thu, 30 Jul 2026 18:07:53 +0800
Precedence: bulk
X-Mailing-List: sashiko-reviews@lists.linux.dev
List-Id: <sashiko-reviews.lists.linux.dev>
List-Subscribe: <mailto:sashiko-reviews+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:sashiko-reviews+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v16 3/7] qcom-tgu: Add signal priority support
To: sashiko-reviews@lists.linux.dev
Cc: devicetree@vger.kernel.org, robh@kernel.org, conor+dt@kernel.org
References: <20260730080704.2903540-1-songwei.chai@oss.qualcomm.com>
 <20260730080704.2903540-4-songwei.chai@oss.qualcomm.com>
 <20260730081714.118D31F000E9@smtp.kernel.org>
Content-Language: en-US
From: "Songwei.Chai" <songwei.chai@oss.qualcomm.com>
In-Reply-To: <20260730081714.118D31F000E9@smtp.kernel.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-Proofpoint-GUID: ms_S3IG5eAqsgTVgt0ZVmyswfBEvhx9x
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNzMwMDA3NCBTYWx0ZWRfX7kTN41DyN4gc
 Kgjrp1uYB/CPpantJx4nKmAZL0Fe2CCEBQpnqTFDv8eWroBk9J6PfBNNMqNGi/6PLKAcxj7fpg3
 UfT5TW7RUi0E1GwQ44/1hiILBDnRWHx8z90uGdEdLLF0DZ9enTKITrA0epw7LbMBZardzcCsZDP
 2Z2dC/EO5Lo8XEnth+tYYeZD8pItwqNezxchY7qKXGbyE9Tw7LT9g/19/KeXSoLNx+PcJ4wCGsD
 O+mXjQMaXhT8YuUs5AcDMbYjaHUA6rKFd5W7z3eRAcoVm01N6AUtvgU4YnyvPtaQhDNd1ZwYPnH
 af/4WmVaJYoYuHP7Fqt0EbUGnx3jjNt3CMSUNJx+W8OMMLOHZscLq0eeGFUqSRN2IwExQA6mmU3
 U6+07bFxD8BQMxM2H5RYtbArW6lqtrFW2LxnZ7dfshzSggLsWkkmmtESzC1MxVOaZo8k52YHpf/
 Oz3hSfUTA1QvhYV/MHw==
X-Authority-Analysis: v=2.4 cv=eZENubEH c=1 sm=1 tr=0 ts=6a6b2288 cx=c_pps
 a=WW5sKcV1LcKqjgzy2JUPuA==:117 a=nuhDOHQX5FNHPW3J6Bj6AA==:17
 a=IkcTkHD0fZMA:10 a=RAioF0-LDSMA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=yx91gb_oNiZeI1HMLzn7:22
 a=VwQbUJbxAAAA:8 a=EUspDBNiAAAA:8 a=Zh2D9iEZmoPOMH589UwA:9 a=3ZKOabzyN94A:10
 a=QEXdDO2ut3YA:10 a=OpyuDcXvxspvyRM73sMx:22
X-Proofpoint-Spam-Info: AW1haW4tMjYwNzMwMDA3NCBTYWx0ZWRfX2bZbPmD6y4mM
 fw7BOdDlZfuaxw25LeBQwuFSjdBo+FJQhtBSAhpwT1vacv1TIv45EyYlr4JgKMGKj4u7inxqrEt
 t1wpqY8qZvv8CASkGhf6QfAlUrhNVwo=
X-Proofpoint-ORIG-GUID: ms_S3IG5eAqsgTVgt0ZVmyswfBEvhx9x
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-07-30_03,2026-07-29_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 suspectscore=0 bulkscore=0 lowpriorityscore=0 clxscore=1015
 spamscore=0 malwarescore=0 phishscore=0 priorityscore=1501 adultscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2607300074


On 7/30/2026 4:17 PM, sashiko-bot@kernel.org wrote:
> Thank you for your contribution! Sashiko AI review found 2 potential issue(s) to consider:
> - [Medium] tgu_dataset_store allows writes while the device is enabled, causing silent software/hardware state desynchronization.
> - [Medium] tgu_dataset_store silently truncates out-of-range priority values on 64-bit systems.
> --
>
> --- Patch [3]: [PATCH v16 3/7] qcom-tgu: Add signal priority support ---
> commit 8afece15a767b432d65a919119df2e97aca2bed5
> Author: Songwei Chai <songwei.chai@oss.qualcomm.com>
>
> qcom-tgu: Add signal priority support
>
> This commit adds signal priority configuration support to the Qualcomm TGU
> driver. It introduces sysfs attributes to configure the priority of sensed
> signals for each step, and stores these configurations in a dynamically
> allocated table.
>
>> diff --git a/drivers/hwtracing/qcom/tgu.c b/drivers/hwtracing/qcom/tgu.c
>> index 9c7dd4a09f027..0e88b437f191f 100644
>> --- a/drivers/hwtracing/qcom/tgu.c
>> +++ b/drivers/hwtracing/qcom/tgu.c
> [ ... ]
>
>> +static ssize_t tgu_dataset_store(struct device *dev,
>> +				 struct device_attribute *attr,
>> +				 const char *buf, size_t size)
>> +{
>> +	struct tgu_drvdata *tgu_drvdata = dev_get_drvdata(dev);
>> +	struct tgu_attribute *tgu_attr =
>> +		container_of(attr, struct tgu_attribute, attr);
>> +	unsigned long val;
>> +	int index;
>> +	int ret;
>> +
>> +	ret = kstrtoul(buf, 0, &val);
> [Severity: Medium]
> Does this code silently truncate out-of-range priority values on 64-bit
> systems?
>
> The function uses kstrtoul() to parse user input into an unsigned long.
> Later, it directly assigns this value to
> tgu_drvdata->value_table->priority[index], which is an array of unsigned int.
>
> On 64-bit systems, inputs exceeding UINT_MAX will be silently truncated
> without returning an error like -ERANGE. Would kstrtouint() be more
> appropriate here?

|Clarification：|

The target register is 32 bits wide (|REG_OFFSET = 0x4|). Therefore, any 
value larger than |UINT_MAX| cannot be represented by the hardware and 
is inherently meaningless.

We can switch to |kstrtouint()| for stylistic consistency, but this is 
not a functional bug.

>
>> +	if (ret)
>> +		return ret;
>> +
>> +	guard(mutex)(&tgu_drvdata->lock);
>> +	index = calculate_array_location(tgu_drvdata, tgu_attr->step_index,
>> +					 tgu_attr->operation_index,
>> +					 tgu_attr->reg_num);
>> +
>> +	tgu_drvdata->value_table->priority[index] = val;
> [Severity: Medium]
> Can this cause a silent desynchronization between software and hardware
> state?
>
> If a user writes to this attribute while the TGU is actively tracing
> (tgu_drvdata->enabled == true), the driver updates the software backing array
> and returns success, but the hardware is not dynamically updated. Subsequent
> reads will return the new value, giving the false impression that the hardware
> configuration has changed.
>
> Should this check if the device is enabled and either return an error, or push
> the update to the hardware registers?

|Clarification：|

The design is intentional.

A complete TGU configuration spans multiple register groups (priority, 
condition_decode, condition_select, timer, counter).

Writing hardware on every store would leave the engine in a transient, 
half-updated state between sysfs writes, which could feed a spurious 
match into CTI/interrupt consumers — exactly the hazard documented in 
tgu_write_all_hw_regs().

>
>> +
>> +	return size;
>> +}
