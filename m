Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 316763E47B
	for <sashiko-reviews@lists.linux.dev>; Fri, 19 Jun 2026 06:00:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1781848857; cv=none; b=ucEGbpPru6rNfFezcrBVQkRJMg8JgyAB4FfQWi2+klfRAf5KkobF30TLl7Mcaynn3OKNZaVJHaePXlEaXNeWHVikjtS3fNLsaxCMjHLbEpsLW6kCYOcmObx2VEjChIzj5rCAgbhkmH5KDVF9ann18u4rTrU1ly9s4vNYNSggmSs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1781848857; c=relaxed/simple;
	bh=GOWJ/89oyAiSHVd1jrrIu3EI/VVX0OmtAF3VMc69KdE=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=HVEs/1VziESWqyoiCU2Bi3BcQIQN2frPjnRCPI8bKpJbdKVgne1wIZU72ajuBrUhiiFPvsfF5FGBGhv7UTfExLhkmHiMcECZsYBLO0cLY/j7A6R/7szE8b2seFgj3t24dDUTEoskF/NmmBhdeQZFCDDDlpF2XeRfvKT4JoCAX14=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=IX98iZ2Q; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=ZqDwOpsT; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="IX98iZ2Q";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="ZqDwOpsT"
Received: from pps.filterd (m0279868.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 65J2ujml3464455
	for <sashiko-reviews@lists.linux.dev>; Fri, 19 Jun 2026 06:00:54 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	gQt0BGCoj085u0yk/A7JdFuPj5T9+RUYXPXfTT33xHw=; b=IX98iZ2QUL0Eus8P
	EeA3vwxs3JCjnFsNIAj3iHE2wtB4xnXaeyRe2DJ40DVJUKZP2PIzxaSuJDUtKHBs
	VtNwLbBrPef/z/dc//DnABfy08TzVS4GDBIN1ayLnIfYCPpa5Eu4fzf6OU5LSe7E
	2kbD8VzNuM2463Z6yWMAGD+8HtYD5rsuOl/lrLzOGUYNecINn5/guwMcAW0SqVdw
	E7h2SaNkvdMRcw7kmIGDYyAYJ213hYTtd0kllA1nEFCisXeBN0chlQD7FvQ8jVof
	C2ZCfpttzWUYKyCftphbbrn/uUhvCinnyNkCfv3uOPehUz/pTaVmMKTSIbO6xrgJ
	yohWVg==
Received: from mail-pg1-f197.google.com (mail-pg1-f197.google.com [209.85.215.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4evp6sa3a9-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <sashiko-reviews@lists.linux.dev>; Fri, 19 Jun 2026 06:00:53 +0000 (GMT)
Received: by mail-pg1-f197.google.com with SMTP id 41be03b00d2f7-c856470fe9fso1345656a12.2
        for <sashiko-reviews@lists.linux.dev>; Thu, 18 Jun 2026 23:00:53 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1781848853; x=1782453653; darn=lists.linux.dev;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=gQt0BGCoj085u0yk/A7JdFuPj5T9+RUYXPXfTT33xHw=;
        b=ZqDwOpsTr8Vi1m9AXGK6XU4ubOx4u9RtnOQQ/qAGMfLiT2ZAQ96Gv+Nh0ynybir3N+
         q60NahKQguTgW17ENLU2MhXw5PZwOMRrDr5IcjxKjv5fQ1mkq5UpdSX7Sf0Tuqkgrk2b
         BdOu0WeiDsIlJGjtpAp71kfuit+NA8I9RPqM3zSXsejNp5pkwF5w5kQiPk4n6jIzYG1H
         6l+/Uar05CIV88HOLVWK7Lom9Q7i4oPhqDdEXtBx/qXHjWyP3FUruFWnvbjLI80yf2Q0
         rxVeIe3LQTBpTIhDDx+wlhj2swzECK8SqvY5e2mnO4Dohu73ISyowg8ITQ000dVb1Y7s
         ydnw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1781848853; x=1782453653;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=gQt0BGCoj085u0yk/A7JdFuPj5T9+RUYXPXfTT33xHw=;
        b=l1sQ8QsJg3KljQV/6XZJsnlS+YhBMX6c9qT/Hn9E+F9hFWtDY+KfSaqrhkWV0J2zZ9
         qkbjswxx644a6oQMS0HrDMUISqtesMcO2iOFejtDT6UYq2VllpMpn/WGErY45Yl/Kbid
         drRugqYCRqfxbWvmvsNIzdyb/nxUufgGwWKhcoCr5khAKZWdVNiFhEBAOpitNIL7728n
         WOtX1Wdr16nm3/sJi4jQ4+jN4F09UpGKOKOWTX+8Pwn7NHyhGtsxYB6Jff6/8rF3sWjx
         aDH86rpzj6l+i5hdMLxXdSoGqnuRozj7SkplnicCeMZNPyHNdN5Pp3pUF62ZDZG/L0JC
         BUmA==
X-Gm-Message-State: AOJu0YyHF9N9q/4UCwlBMXbD0mO0i+6cOV59gZNPJIcX6PtUQ5XGAAe4
	PJTt1IsI0TaCi0cSfxs9E26z//PaaL2bo1Oc0b+A6negK0CWHtwpaDlnSwvW0Sbxy5+jrkWuAZt
	PSgJGjjZN/sy+VKEMJy6E0koJAQZsePuh2nW32OQtn54UPxXIo2llOOFqykpByzST/Hl3s4AAnc
	RQFy8=
X-Gm-Gg: AfdE7clwD0Xh0/2Z8f5hiN0XL/SjFu9INyXFS2y30kYPAZ/J9j5H+fjap/Xmldq3n9k
	cRuHRW3qxmWq6zB7sMbY/ACOCly0RAaR2Aw7sOjKd18uT2psuT8FJAF2WDP6HBEx+vDWxe/Y74X
	PyJfGMJdEzlkg8goxr6FOTdHgn6aUaUM/R5RyWZBfgdoI8LtCR5p7H2i939UfPIIN+GVJecI5fw
	FX5gPGtpFbUNNmQj5spWTvrMykKpmQ9LZvbK0es9IV3/7LJFhzHW7bHt6Ko2PiJT+xhHIwBawuR
	Eky7DKL8dXbpfSZqXR19n40DMi2FMEEOjrgCYfHZriPPBugGrDvEjz9E5m0wjvCuH7psEq9v/D6
	U0riiV7JodPwbcceSHhuSNkdP75GFJ3QX/xOteeAS
X-Received: by 2002:a05:6a20:b786:b0:3b4:80db:f1b6 with SMTP id adf61e73a8af0-3bb319dbfcemr2771690637.6.1781848852616;
        Thu, 18 Jun 2026 23:00:52 -0700 (PDT)
X-Received: by 2002:a05:6a20:b786:b0:3b4:80db:f1b6 with SMTP id adf61e73a8af0-3bb319dbfcemr2771631637.6.1781848852021;
        Thu, 18 Jun 2026 23:00:52 -0700 (PDT)
Received: from [10.92.184.233] ([202.46.23.19])
        by smtp.gmail.com with ESMTPSA id 41be03b00d2f7-c8a887ea5e0sm1324538a12.20.2026.06.18.23.00.49
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 18 Jun 2026 23:00:51 -0700 (PDT)
Message-ID: <ede03b43-d95a-4eda-8054-1dce35fa17d9@oss.qualcomm.com>
Date: Fri, 19 Jun 2026 11:30:48 +0530
Precedence: bulk
X-Mailing-List: sashiko-reviews@lists.linux.dev
List-Id: <sashiko-reviews.lists.linux.dev>
List-Subscribe: <mailto:sashiko-reviews+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:sashiko-reviews+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 2/2] thermal: qcom: Add support for Qualcomm MBG thermal
 monitoring
To: sashiko-reviews@lists.linux.dev
Cc: robh@kernel.org, devicetree@vger.kernel.org, conor+dt@kernel.org
References: <20260601-spmi-mbg-driver-v1-2-b4892b55a17f@oss.qualcomm.com>
 <20260601114035.2D9A81F00893@smtp.kernel.org>
Content-Language: en-US
From: Sachin Gupta <sachin.gupta@oss.qualcomm.com>
In-Reply-To: <20260601114035.2D9A81F00893@smtp.kernel.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-Proofpoint-GUID: 3E0hjdb1T1weL35u4XaDUBNOH2v9fkC-
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNjE5MDA1MiBTYWx0ZWRfX3Hb5Qhfi/NSu
 OSIaVy4mxg2xyi2uLJV5kjE+C+ntQaxi0oLWC4CxeHULfkQAp2oj1LP8QL2EWClz4AS1zZ1mWC4
 pCZQoKzy5kN5tWD8GIU8vtmITnlkg6afm5c4Sr8ZeFwQ9faaQlDKJIaRdH0Y2AKWiUN762k7w2m
 +9W5pY+MbjXq9UbeD5bCLMxCAX9z5kh+f59qJ51JfKWrp7xyHDhBDk7Qeh49cTUGX6QzxY8kIZW
 AMaAa5jJ+qH1ElQpF9TNGZBBQIt/15zt/+B/ycJW8lwNkDMNdK++oTRIZKiGtiCX/DOVVY2zCv0
 S9JmxGvCSequVCgook39PVN7v2MHAA/aq6ZESm36yr9MjU/6oTqH1Y/uoYPWq5EMgsaNDuqGwIW
 R5hhrzldSGxI0PmCJ05XCjy/J8kLBF7JDTlvylQ0M8720UTdeiQbOP1Fu8/JIER7VMUDawibh/l
 2qHl01KrWCVLtOJincw==
X-Proofpoint-Spam-Info: AW1haW4tMjYwNjE5MDA1MiBTYWx0ZWRfX5T/RNgRVz/rS
 Wrw0CQ+O8wG2H7iZ+U5kXstgTvvSo70hSYHsODXp5PIt3D8iuuEokfQKxAhrelfL1gyPT7VmsGv
 /v2lSnOTtyMuS2kyLJhAou1CWIV0ALg=
X-Proofpoint-ORIG-GUID: 3E0hjdb1T1weL35u4XaDUBNOH2v9fkC-
X-Authority-Analysis: v=2.4 cv=KbzidwYD c=1 sm=1 tr=0 ts=6a34db15 cx=c_pps
 a=rz3CxIlbcmazkYymdCej/Q==:117 a=j4ogTh8yFefVWWEFDRgCtg==:17
 a=IkcTkHD0fZMA:10 a=FelO9ux0wxsA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=ZpdpYltYx_vBUK5n70dp:22
 a=VwQbUJbxAAAA:8 a=COk6AnOGAAAA:8 a=zo2K64OUA6rPPm9ls2MA:9 a=3ZKOabzyN94A:10
 a=QEXdDO2ut3YA:10 a=bFCP_H2QrGi7Okbo017w:22 a=TjNXssC_j7lpFel5tvFf:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.125,FMLib:17.12.100.49
 definitions=2026-06-19_01,2026-06-18_03,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 suspectscore=0 priorityscore=1501 lowpriorityscore=0
 bulkscore=0 spamscore=0 impostorscore=0 adultscore=0 phishscore=0
 clxscore=1015 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2606150000
 definitions=main-2606190052



On 6/1/2026 5:10 PM, sashiko-bot@kernel.org wrote:
> Thank you for your contribution! Sashiko AI review found 6 potential issue(s) to consider:
> - [High] Data race and TOCTOU window on `last_thres_crossed` leading to missed thermal violations.
> - [High] Potential NULL pointer dereference accessing `node->name` on non-OF platforms.
> - [High] Incorrect bitwise AND used to check a 4-bit fault status enumeration.
> - [High] Silent disablement of supported thermal trips.
> - [Medium] Hardware threshold interrupt is enabled before configuring the threshold value.
> - [Low] Incompatible pointer type passed to `regmap_read`.
> --
> 
> commit 59e6da95c48d5200129439570e254b1f9180acf4
> Author: Satya Priya Kakitapalli <quic_skakitap@quicinc.com>
> Subject: thermal: qcom: Add support for Qualcomm MBG thermal monitoring
> 
> This patch adds a driver for the Qualcomm MBG thermal monitoring device.
> It monitors the die temperature and notifies the thermal framework when a
> level 1 upper threshold violation occurs via an SPMI interrupt.
> 
>> diff --git a/drivers/thermal/qcom/qcom-spmi-mbg-tm.c b/drivers/thermal/qcom/qcom-spmi-mbg-tm.c
>> new file mode 100644
>> index 0000000000000..60190b341fc7c
>> --- /dev/null
>> +++ b/drivers/thermal/qcom/qcom-spmi-mbg-tm.c
> 
> [ ... ]
> 
>> +static int mbg_tm_get_temp(struct thermal_zone_device *tz, int *temp)
>> +{
>> +	struct mbg_tm_chip *chip = thermal_zone_device_priv(tz);
>> +	int ret, milli_celsius;
>> +
>> +	if (chip->last_thres_crossed) {
>> +		dev_dbg(chip->dev, "last_temp: %d\n", chip->last_temp);
>> +		chip->last_thres_crossed = false;
>> +		*temp = chip->last_temp;
>> +		return 0;
>> +	}
> 
> [Severity: High]
> Could this lockless read and clear of chip->last_thres_crossed cause missed
> thermal violations?
> 
> If a user-space sysfs read occurs concurrently with the thermal worker
> execution (which is triggered by the ISR), the sysfs read might consume the
> flag by setting it to false.
> 
> When the thermal worker subsequently calls mbg_tm_get_temp(), it would see
> false and read the raw ADC value. Because ADC readings can fluctuate and
> lag, it might read a value below the threshold, entirely missing the
> violation.
> 

I will address this by adding proper locking for this state in the next 
patch series.

> [ ... ]
> 
>> +static int mbg_tm_set_trip_temp(struct thermal_zone_device *tz, int low_temp,
>> +				int temp)
>> +{
>> +	struct mbg_tm_chip *chip = thermal_zone_device_priv(tz);
>> +	int ret = 0;
>> +
>> +	guard(mutex)(&chip->lock);
>> +
>> +	/* The HW has a limitation that the trip set must be above 25C */
>> +	if (temp > MBG_MIN_TRIP_TEMP && temp < MBG_MAX_SUPPORTED_TEMP) {
>> +		ret = regmap_set_bits(chip->map, chip->base + MBG_TEMP_MON2_MISC_CFG,
>> +				      MON2_UP_THRESH_EN);
>> +		if (ret < 0)
>> +			return ret;
>> +
>> +		ret = regmap_write(chip->map, chip->base + MON2_LVL1_UP_THRESH,
>> +				   temp_to_vtemp_mv(temp));
> 
> [Severity: Medium]
> Is it safe to enable the threshold comparator before programming the new
> threshold value?
> 
> If the hardware retains a stale threshold from a prior state that is lower
> than the current temperature, enabling the comparator first could
> immediately trigger a spurious interrupt.
> 
> Would it be better to write the threshold value before enabling the
> interrupt?
> 

You are right that enabling the comparator before programming 
MON2_LVL1_UP_THRESH can allow a stale threshold to trigger a spurious 
interrupt. I will update the programming sequence to write the threshold 
first and enable the comparator afterward in the next patch series.

>> +		if (ret < 0)
>> +			return ret;
>> +	} else {
>> +		dev_dbg(chip->dev, "Set trip b/w 25C and 160C\n");
>> +		ret = regmap_clear_bits(chip->map, chip->base + MBG_TEMP_MON2_MISC_CFG,
>> +					MON2_UP_THRESH_EN);
>> +		return ret;
>> +	}
> 
> [Severity: High]
> When the requested temperature falls outside the hardware's supported bounds,
> the driver disables the threshold interrupt and returns 0.
> 
> By returning 0, does the driver deceptively signal to the thermal core that
> the trip has been successfully configured?
> 
> Because the interrupt is disabled, the core will never be notified when the
> temperature violates the trip point. Should this return an error code like
> -ERANGE instead?
> 

I agree returning 0 here is not correct for an out-of-range request, 
since the trip is not actually configured. I will return -ERANGE for 
unsupported trip temperatures and update this in the next patch series.

> [ ... ]
> 
>> +static irqreturn_t mbg_tm_isr(int irq, void *data)
>> +{
>> +	struct mbg_tm_chip *chip = data;
>> +	int ret, val;
> 
> [Severity: Low]
> The regmap_read() function expects an unsigned int pointer for the value
> parameter, but val is declared as a signed int here.
> 

We can keep this as-is for now to stay consistent with the surrounding 
driver style, where int is commonly used for temporary readback 
variables with regmap_read(). Since the value is only used for bit 
checks and not sign-sensitive arithmetic, this does not cause a 
functional issue. I plan to keep it unchanged in this series for 
consistency.

>> +
>> +	scoped_guard(mutex, &chip->lock) {
>> +		ret = regmap_read(chip->map, chip->base + MBG_TEMP_MON2_FAULT_STATUS, &val);
>> +		if (ret < 0)
>> +			return IRQ_HANDLED;
>> +	}
>> +
>> +	if (FIELD_GET(MON_FAULT_STATUS_MASK, val) & MON_FAULT_LVL1_UPR) {
> 
> [Severity: High]
> Does this bitwise AND correctly check the 4-bit fault status enumeration?
> 
> MON_FAULT_LVL1_UPR is defined as 0x5 (binary 0101). A bitwise AND against
> 0x5 will evaluate to true if either bit 0 or bit 2 is set, matching
> unrelated fault states like 0x1, 0x4, or 0x7.
> 
> Should this use an exact equality check (==) instead?
> 

I’ll correct this to use == in the next patch series.

>> +		chip->last_thres_crossed = true;
> 
> [Severity: High]
> This sets chip->last_thres_crossed to true outside of the mutex. As
> mentioned earlier in mbg_tm_get_temp(), this flag is read and cleared
> locklessly.
> 
> Could this lead to a data race if mbg_tm_get_temp() executes concurrently?
> 

Agree updating last_thres_crossed outside the lock can race with 
concurrent reads in mbg_tm_get_temp(). I will move this update under the 
lock in the next patch series.

>> +		dev_dbg(chip->dev, "Notifying Thermal, fault status=%d\n", val);
>> +		thermal_zone_device_update(chip->tz_dev, THERMAL_TRIP_VIOLATED);
>> +	} else {
>> +		dev_dbg(chip->dev, "Lvl1 upper threshold not violated, ignoring interrupt\n");
>> +	}
>> +
>> +	return IRQ_HANDLED;
>> +}
>> +
>> +static int mbg_tm_probe(struct platform_device *pdev)
>> +{
>> +	struct mbg_tm_chip *chip;
>> +	struct device_node *node = pdev->dev.of_node;
> 
> [ ... ]
> 
>> +	chip->tz_dev = devm_thermal_of_zone_register(chip->dev, 0, chip, &mbg_tm_ops);
>> +	if (IS_ERR(chip->tz_dev))
>> +		return dev_err_probe(chip->dev, PTR_ERR(chip->tz_dev),
>> +				     "Failed to register sensor\n");
>> +
>> +	return devm_request_threaded_irq(&pdev->dev, chip->irq, NULL, mbg_tm_isr, IRQF_ONESHOT,
>> +					 node->name, chip);
>> +}
> 
> [Severity: High]
> Will node->name cause a NULL pointer dereference on non-OF platforms?
> 
> Because the driver uses device_property_read_u32(), it can be instantiated
> via ACPI or MFD without a device tree node, meaning pdev->dev.of_node
> could be NULL.
> 
> Would it be safer to use dev_name(&pdev->dev) instead?
> 

This driver is intended to support DT-only instantiation, so of_node is 
expected to be present for valid platforms. In that context, using 
node->name is consistent with the intended usage model.

Thanks,
Sachin Gupta

