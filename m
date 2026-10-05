Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2FD4A46AA6B
	for <sashiko-reviews@lists.linux.dev>; Mon,  5 Oct 2026 11:25:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791199538; cv=none; b=EuYVcVPfvW6t0t5sCEUltAbsBJTsA6fCtHB+ck+PUI6ExDXC/r7eEC+A4ctmKLhC2FaynTJJ/YQ6As2CerCK7KLYN+B++ps57zCVJ1OMBr8Yn5hl8ayEI/dr+QCLAKon0QUeG/zRpkdm3bgeSQx+iXfuncVBb56eInbKjKoCD+0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791199538; c=relaxed/simple;
	bh=3Pc9Itga+pi16jhUeqmzJNwEXoXts84QaR6nATMrKFc=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=SZOcH6Pex8eS5TbzpZ959ws+up6Q0Lzmx4tH3C8VaKsSZNdfgJZPC3IHQri+tPQ1cfqDzZ5AMbgHAQl3erORgjaKdsgsG1FlJ6IgHXWE8Zd424Fgdh5TmAuWpkupUGIh5Ff70fit2NsB4RpcVyLkXA2p8BnZkL5n2EHsypAQv1Q=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=Yvi51Lca; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=UFQh8x1D; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="Yvi51Lca";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="UFQh8x1D"
Received: from pps.filterd (m0279866.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 695AoI0m886470
	for <sashiko-reviews@lists.linux.dev>; Mon, 5 Oct 2026 11:25:35 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	VabCPYl8CmmT4hmJVbpxYnUz4Qn/+FS2QK4fZXw5zF4=; b=Yvi51Lcaxs/cZYO3
	MF4SJkCukFSA7UUwRKJwQbu1iKLWU7i86jlcZRulPtMIZ5UuyJ2GNf09vnwhLGM7
	t5Cizp/Glf2ELNdR9s9NPwZVHcE9HdbsBtKnwbcLYzh9/Sw7APCTtxMSyaQSKfQP
	bA/0FbONcQHthuW565Y4ndkTYUts9PO14pS9tgusMHJ23Y7mplsFFEgAvZl68/kw
	XDCvmcIXbpxqUwAO2uNCZ/iT0kT06/FSlvwLLdQkJ7QGE4imOGxwehrS/96F1krp
	nGvvkXXIx8BXQDPqHDeE5Gfg/7064m5BuvsWXaA1OARpKxBrFbxrxna21iZd+ns9
	DbS8+Q==
Received: from mail-pj1-f71.google.com (mail-pj1-f71.google.com [209.85.216.71])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4h2u08ngtu-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <sashiko-reviews@lists.linux.dev>; Mon, 05 Oct 2026 11:25:35 +0000 (GMT)
Received: by mail-pj1-f71.google.com with SMTP id 98e67ed59e1d1-39deb05ef51so1401470a91.3
        for <sashiko-reviews@lists.linux.dev>; Mon, 05 Oct 2026 04:25:35 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1791199535; x=1791804335; darn=lists.linux.dev;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=VabCPYl8CmmT4hmJVbpxYnUz4Qn/+FS2QK4fZXw5zF4=;
        b=UFQh8x1DKdkk3fnt5cv/5Qi+FlPQCaIb47BGIiRSXHhQLrJ1AAh06tOz/qBWWBFsyE
         lX5CKgt5EupyL/lMPvVtTCV3CX3Kgw4ETWkLlUkg6/UadU3LnOXvUkdjf7R5y9CjRGBe
         ARthbOVjTu6svObzZS/3vtLKj+Aqxnkq7J/bRbkxT15s74/U+IcMTQxM+bej+w7PpdwB
         jUcNO3nEZlyov4w35Vo/rHbta+FPWfikLxoUxswm1VWysO3UJz6TIVFT0g5a9NE+doXX
         wjO7cnMU2DMwU0JoK7Hr8zv2MbCWJRWmRpo3mthN/IINlFhMPFRE213cf8zQ3WItHz51
         WuZQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791199535; x=1791804335;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=VabCPYl8CmmT4hmJVbpxYnUz4Qn/+FS2QK4fZXw5zF4=;
        b=UgrYFmTq+af1T3kEmrCqEe/EyyXxyympn09mxaaogOleORZnx/fHInL29Xs1K+Tf4v
         aG0WnLn1poNl6hLKj/Z/uc1sfxYQQexyLPR2z7HkUAQsoZA2TreGI2TD62kkOVCAXG9l
         cIJHcvAQGR1cWibBwXx59x+TpziNgJA52WviOrshfUfB8ObWgQS1pPrNPomjvVbUs350
         QzCoO8//8XpXrYIxXLMRmRVXX4gkI5CvVdF7M/5icI/QZzcPpbzbXXTVAPAgQcNKV9cV
         qVlTVMS6cv8wUozajziwxtfir8j2ux4vrukl8WXxNTCdsLpQhLyZ3Cn06f6D94M5uCEF
         aWkQ==
X-Gm-Message-State: AFq9FYJw+S4tHhYQRkVVHyImihttCTRDn2QXYeQWV+nxJ11t2cw/x+8O
	z2svi7KoUlrZCblipo3uPBKmbEaKacLHpK5i7w2hhqzW/dLP/6y/B/6sRnt0C6wLRjVXcuXexrr
	poLMGwKju4JcWCrR1tiWSrBdbeNhJUrDORsT+ir9TjbdF0bMIDD1N/cQnaswq/EAdmT7rz7CTI+
	gZUOk=
X-Gm-Gg: AYBFou0wKtd0E3OCqI6PFZWaMS5N6Qb/TMpxXu99pPRxLRvvwleYOQpiIh5SiJad/js
	qo90B+w0DdnE2EeTboARHJmtSej3BYqQRyZBALjBUd7UfDe8P1+KWYLrRMU2IfCIy2EW1W9TwVh
	8wv548sooIR0ttIZEVPVNlkjSbhBPBVUH2pAeXmY0k/6s6TDoicotknEWd+ROu0r8hSrmT5BZqd
	X+r6mwC8JJlpcH4iJQVvk97+rLX/JdEal5UES/cOVYMKfhANt6bVf710HVnO5oYWF4rISpQo7gC
	62rG63/vb4Pb3DJFuK+BzaEub7Dlyg1kI9/JMGEEJWsQ5e1MOx7wtJ7Rmc2y7BVTbMzzgSNHO2F
	2qpBgGnZ3Dni+4j3txdFwqKn7D82HmBF0mw==
X-Received: by 2002:a17:90b:4d83:b0:3a4:fe48:d427 with SMTP id 98e67ed59e1d1-3a6ce7987e0mr4334817a91.28.1791199534567;
        Mon, 05 Oct 2026 04:25:34 -0700 (PDT)
X-Received: by 2002:a17:90b:4d83:b0:3a4:fe48:d427 with SMTP id 98e67ed59e1d1-3a6ce7987e0mr4334799a91.28.1791199533988;
        Mon, 05 Oct 2026 04:25:33 -0700 (PDT)
Received: from [10.92.200.217] ([202.46.23.19])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3a78e4262f0sm11836451a91.4.2026.10.05.04.25.31
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 05 Oct 2026 04:25:33 -0700 (PDT)
Message-ID: <a362b160-0b31-4f66-bb2c-69ac741f71c7@oss.qualcomm.com>
Date: Mon, 5 Oct 2026 16:55:29 +0530
Precedence: bulk
X-Mailing-List: sashiko-reviews@lists.linux.dev
List-Id: <sashiko-reviews.lists.linux.dev>
List-Subscribe: <mailto:sashiko-reviews+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:sashiko-reviews+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3 02/12] hwmon: Add Qualcomm PMIC BCL driver
To: sashiko-reviews@lists.linux.dev
Cc: devicetree@vger.kernel.org, lee@kernel.org, robh@kernel.org,
        linux-hwmon@vger.kernel.org, mfd@lists.linux.dev, conor+dt@kernel.org
References: <20260929-qcom-bcl-hwmon-v3-0-f5ca00889cf7@oss.qualcomm.com>
 <20260929-qcom-bcl-hwmon-v3-2-f5ca00889cf7@oss.qualcomm.com>
 <20260929132147.2D7C41F000FF@smtp.kernel.org>
Content-Language: en-US
From: Manaf Meethalavalappu Pallikunhi <manaf.pallikunhi@oss.qualcomm.com>
In-Reply-To: <20260929132147.2D7C41F000FF@smtp.kernel.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Proofpoint-ORIG-GUID: Lh_4mRvAwVBsoC_DDmDZZUGeRACznXnV
X-Proofpoint-GUID: Lh_4mRvAwVBsoC_DDmDZZUGeRACznXnV
X-Authority-Analysis: v=2.4 cv=JqlkP84C c=1 sm=1 tr=0 ts=6ac3892f cx=c_pps
 a=UNFcQwm+pnOIJct1K4W+Mw==:117 a=j4ogTh8yFefVWWEFDRgCtg==:17
 a=IkcTkHD0fZMA:10 a=660iZSQnnn4A:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=YMgV9FUhrdKAYTUUvYB2:22
 a=VwQbUJbxAAAA:8 a=EUspDBNiAAAA:8 a=3-bhLjB0DjplO_CttVUA:9 a=QEXdDO2ut3YA:10
 a=uKXjsCUrEbL0IQVhDsJ9:22
X-Proofpoint-Spam-Info: AW1haW4tMjYxMDA1MDA0NCBTYWx0ZWRfX7fJ7NhlfmuAw
 kv7ktCRASkFFukbgUi6oHCunh6IRSJuMocXCeftkP6kCngbsfOQiQ1po4qqwmoNUjWFQ71pYnLy
 PNe4RzZO2hz3w+mKxaXqhLIUFZVaRhk=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMDA1MDA0NCBTYWx0ZWRfX0OK0XDjYAn45
 7tCCg9o8je4JRR+G/m0oHS1xtnCnV90HiP6b8wNNOgebVIoSdtbrc1yNwJrKbiVkaMEV86ATZSb
 dm5B16EcyVKx2vw/MJ4qxze4w0KeUOgpZBfuavC1LiCESSpPm1/TqM8QQV9Ucz5UeiySFH3Ca2C
 LPlw5wJ/DdD+qFyeMsH2gD1CTiMiZ/9i4MCs+VMD3mosX8EVK7hRtZ8HBwJAdP/MmxjgHQsem11
 8A5quoXvlFzTBB1WP0e/B9PxmmjSYan9nHT1TwGttDT1a0vOY5HUZjmIupXlpVrxxMI/4kHOWYH
 ARdgYnsDAUzky2LZMu3T3ILmOTTaaqseEt7NwBrrgEmcMQrJo/cJjYutHk8ocOjpRvTDUfmUXbM
 7ta4FUR6r44WD06hYLHqc1Dofrf1mt9fzONoTzJq28Fd43HyGPNMCxBDf/Vju1lVZMQ7ADxxYdX
 QulFZiWfwlicecHpIcg==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-10-05_02,2026-10-02_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 bulkscore=0 malwarescore=0 phishscore=0 suspectscore=0 lowpriorityscore=0
 impostorscore=0 priorityscore=1501 adultscore=0 clxscore=1011 spamscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2609040000 definitions=main-2610050044

Hi

On 9/29/2026 6:51 PM, sashiko-bot@kernel.org wrote:
> Thank you for your contribution! Sashiko AI review found 3 potential issue(s) to consider:
> - [High] hwmon: use-after-free in delayed work due to missing cleanup on probe error
> - [Medium] hwmon: potential torn read of 16-bit volatile ADC values
> - [Low] hwmon: incorrect rounding of negative ADC current readings
> --
> 
> commit 582b6b399b20e883c83628558dc27f1dcb1c1d4d
> Author: Manaf Meethalavalappu Pallikunhi <manaf.pallikunhi@oss.qualcomm.com>
> Subject: hwmon: Add Qualcomm PMIC BCL driver
> 
> Add driver for Qualcomm SPMI PMIC Battery Current Limiting (BCL)
> hardware monitor. The driver exposes battery voltage and current
> monitoring through hwmon interface.
> 
>> diff --git a/drivers/hwmon/qcom-bcl-hwmon.c b/drivers/hwmon/qcom-bcl-hwmon.c
>> new file mode 100644
>> index 0000000000000..eb6bfa7ff18f5
>> --- /dev/null
>> +++ b/drivers/hwmon/qcom-bcl-hwmon.c
> [ ... ]
>> +static int bcl_convert_raw_to_milliunit(const struct bcl_device *bcl,
>> +					s32 raw_val,
>> +					enum bcl_channel type,
>> +					u8 field_width)
>> +{
>> +	const struct bcl_desc *desc = bcl->desc;
>> +	u32 def_scale = desc->channel_cfg[bcl->batt_config][type].default_scale_nu;
>> +	u32 scaling_factor = (field_width > 8) ? def_scale : (def_scale << field_width);
>> +
>> +	return div_s64((s64)raw_val * scaling_factor + 500000, 1000000);
> 
> [Severity: Low]
> Does this math correctly handle negative current values?
> 
> When the hardware provides a negative ADC value for current (e.g., during
> battery discharging), it is sign-extended in bcl_curr_input_read() and
> passed here. The arithmetic unconditionally adds 500000 before performing
> integer division (div_s64). For negative dividends, adding a positive offset
> shifts the value towards positive infinity, and C integer division truncates
> towards zero, causing the hwmon statistics to be off by 1 unit.
> 
> Could this conditionally subtract 500000 for negative dividends to ensure
> mathematically symmetric rounding?

I will use DIV_S64_ROUND_CLOSEST instead of the biased 
add-500000-then-truncate pattern in next revision.

> 
> [ ... ]
>> +static int bcl_curr_input_read(struct bcl_device *bcl, long *out)
>> +{
>> +	int ret;
>> +	u32 raw_val = 0, msb = 0;
>> +	s32 signed_val;
>> +	const struct bcl_desc *desc = bcl->desc;
>> +
>> +	/* Return cached value if read too soon after last update */
>> +	if (bcl->last_curr_updated &&
>> +	    time_before(jiffies, bcl->last_curr_updated + HZ)) {
>> +		*out = bcl->last_curr_input;
>> +		return 0;
>> +	}
>> +
>> +	ret = regmap_field_read(bcl->fields[F_CURR_INPUT], &raw_val);
>> +	if (ret)
>> +		return ret;
>> +
>> +	/* For 16-bit data, read MSB and combine with LSB */
>> +	if (desc->data_field_bits_size == 16) {
>> +		ret = regmap_field_read(bcl->fields[F_CURR_INPUT1], &msb);
> 
> [Severity: Medium]
> Is there a risk of a torn read when fetching this 16-bit volatile ADC value?
> 
> These sequential reads can capture hardware registers in an inconsistent
> state if the PMIC hardware updates the ADC registers exactly between the two
> independent bus transactions. Since the mutex lock only serializes software
> threads, a hardware update right between these calls would result in reading a
> mix of old and new bytes (e.g., an LSB of 0xFF and an MSB of 0x01).
> 
> Should this use an atomic regmap_bulk_read() for 16-bit data fields to
> prevent wildly incorrect sensor readings?

I will update regmap_bulk_read() for the 16-bit LSB/MSB pair.

> 
>> +		if (ret)
>> +			return ret;
>> +		raw_val |= FIELD_PREP(GENMASK(15, 8), msb);
>> +	}
> [ ... ]
>> +static int bcl_alarm_irq_init(struct platform_device *pdev,
>> +			      struct bcl_device *bcl)
>> +{
>> +	int ret, irq_num, i;
>> +	struct bcl_alarm_data *alarm;
>> +
>> +	for (i = 0; i < ARRAY_SIZE(bcl->bcl_alarms); i++) {
>> +		alarm = &bcl->bcl_alarms[i];
> [ ... ]
>> +		ret = devm_request_threaded_irq(&pdev->dev, irq_num, NULL,
>> +						bcl_handle_alarm, IRQF_ONESHOT,
>> +						bcl_int_names[i], alarm);
>> +		if (ret)
>> +			return ret;
>> +
>> +		if (!enable_irq_wake(irq_num))
>> +			alarm->irq_wake_enabled = true;
>> +
>> +		ret = devm_add_action_or_reset(&pdev->dev, bcl_alarm_wake_cleanup_action,
>> +					       alarm);
>> +		if (ret)
>> +			return ret;
>> +
>> +		ret = devm_add_action_or_reset(&pdev->dev, bcl_alarm_work_cleanup_action,
>> +					       alarm);
> 
> [Severity: High]
> Could this lead to a use-after-free if device probe fails under memory
> pressure?
> 
> The IRQ is activated by devm_request_threaded_irq() and can immediately
> schedule the delayed work. If the very next devm_add_action_or_reset()
> fails, the driver returns early without registering
> bcl_alarm_work_cleanup_action.
> 
> If the IRQ fires in this brief window and schedules the delayed work, the
> work will not be safely canceled during the devm teardown sequence and will
> execute after the bcl_device memory is freed.

ACK, will update

Thanks,
Manaf

> 
>> +		if (ret)
>> +			return ret;
>> +	}
>> +
>> +	return 0;
>> +}
> 

