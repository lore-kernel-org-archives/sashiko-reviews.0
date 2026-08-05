Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EF01A471275
	for <sashiko-reviews@lists.linux.dev>; Wed,  5 Aug 2026 13:16:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785935764; cv=none; b=qcKFAzHuW+5o9u6uLAh9VyEo1BRTiz7+J+zBep6Lbmy69/eovZBS9FbKPOm0jVXYg06oXH7DPrBo6zDpoi227NvioUPi4V2biJZziX5hZ/xlkxIgIokGNYTac52EhYIGNOOQmgsUmdwJcna92fdIfD7lzSGXHC1kHesu832vZP0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785935764; c=relaxed/simple;
	bh=MCHR5bHaUz1jgjPvf2+S+pxP7wSBueHnoUoV9aIhEZg=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=B16KXVcxDsKHu8NMdF7UIgM2hVDX/EG4ltVU/1TaBdRtS6BF8ZZFJdCa6+i1XbdTqdrLtyDh+Rrr+mNlr6ofzELZEtjDbFg9uNwnNbB/P4UvhyKaSD/UZhz8LCkd6IQKAE89w4ELG1MBkwmgzHs8vjjw1S3HUggS3nHjyZXjFBg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=a0KSbExV; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=E+OZ1yio; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="a0KSbExV";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="E+OZ1yio"
Received: from pps.filterd (m0279869.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 675BvuCV3124689
	for <sashiko-reviews@lists.linux.dev>; Wed, 5 Aug 2026 13:16:02 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	S5PD355OhZIEocJcFj+xdm1rv7mreAZ7LtNr5C3z80E=; b=a0KSbExVtEUhh16q
	GT3IViHBt5wdStuL5u2Q9f7VysY5hQA1HAXTOIKoVlDind3/KIA2VeFpZCvmptH/
	PEfp6dFhR01VfkokdCiqNYVlleBPt0kkC10Xn0GV1WA5RwG4eZIvH3gjqkuSFOUm
	QPe08jZONHJrm/wLASA0hdiL4UOavAkofJxWWi9OkeqWSZPt63V2hxHms1shZD+Z
	5XQT8nvyFxQDgBmtkHR38Fx+PP5g/OkQ1+C+PiQUeoWalHiXDk57QtUOHsz2bmsP
	UC/3ObqOFZhiJ+N3FZLXgeuDcpESQlD8RHDVHAgUXSB/V4+UYcbldfP+QIj3oaox
	fCSCGg==
Received: from mail-pl1-f199.google.com (mail-pl1-f199.google.com [209.85.214.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4fv14w9ceu-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <sashiko-reviews@lists.linux.dev>; Wed, 05 Aug 2026 13:16:01 +0000 (GMT)
Received: by mail-pl1-f199.google.com with SMTP id d9443c01a7336-2cf6acd760cso12210495ad.3
        for <sashiko-reviews@lists.linux.dev>; Wed, 05 Aug 2026 06:16:01 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1785935761; x=1786540561; darn=lists.linux.dev;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=S5PD355OhZIEocJcFj+xdm1rv7mreAZ7LtNr5C3z80E=;
        b=E+OZ1yioGPc1jJtL+NSfv9tMomO9qDAoGFGHBZRUaCXk5X8HjCtQuY8/i8C4eP3QM0
         ZifZRCdRkQo9y6ih9AGcY8b1QrzpyeuVXofJ8vVazarH7yoaIhYOlJ1G73X13CGOOLK5
         +ztwrM2bAQqkS9/HF3f5TTLsmnVoEZa3OmtRwl8vjkRsDZwH1o0pvO2GF9jnzYwJFJ8P
         aygl2ZzHpPNdxIIv48oDQ4AjnXP0IJRPcLbr9AhkLhXrWIOPJn06ilWYaUDjbr7tAinB
         b+cIqJJ/v0nHnYAdjCY+4ezcLAF/Fof0/Svt284UTZCduXk4inhjq8su0+rMg/SM5ul1
         bpRA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1785935761; x=1786540561;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=S5PD355OhZIEocJcFj+xdm1rv7mreAZ7LtNr5C3z80E=;
        b=BIImoWS57YqAf85EDLLAY2r6izrnXqD7AlghHnuEO2TEILe0wWAo++K7Nyyvk9oXxo
         KbBNidCucwtJERSffTqKU9ce0zxssgfXDTwsx2ZXT+esniLzIHpcLblzRacqqtBiQzMt
         4akDcqA7iCuKKUTSM3qLrl6Z/iPK+MXH7cX37fQEfLA6lxPVQSRPxF4LW95ZyE6hBK1j
         qElDzqYe4tHG/YvOK/ewafZTRDUbl6AJBN8xrP/92hwjWVXjA0QaaGlrgj9HiMG+vJOb
         UvdZvbYASPMGvJi0Z6LUFAiBU+6RXwLH0jPYBPLM5B94rw8VOCoUE/cv4C1tDNcFrOUK
         L73g==
X-Gm-Message-State: AOJu0YwapHJb/TM1Xht6bIolL19W3BncqtQu8EvSmMK1oKsELPqqfTqg
	tLOW3C8t55iER5xyLu1x06/6ww3P0BEw3tSFf8D4oWzR/zUKkdxzHM0Ght24cTFRkkp8yDy4Vpf
	5Ky+cjs527a+VMbIG+wKJ8dSjEMvPUHSbmwOPGohygEB8jvur9llB4BtFav0QwIjDa6QOz6/e8y
	Rw5v8=
X-Gm-Gg: AR+sD13YgwVrPF8iaeskFfs75XpF23apCBRKJN44BAvtE4w9E+sAsfbazPVAaEwhYER
	en6iQLJQ2lQzvNOpKv1QfqNBcUxvr4WpDywjoT/o8E1EAViBP1kYRNg36aMojdaAXnXMSc96B37
	su3LaqZOqVWo+TbhnnISQtiMQJYf4TW3ZLKhjKmQ10IfPLtt2Vf8RYg2hhMs0cH7uCXohVX3nrG
	rmAJBg0bC4xVgIHFRT9OpM9i9VobnVnCbXm/1fDHvsd5ICiFKIxVMadj3sjxcSNXvlWnfMHA2cf
	c9q8tXd+LWjnBy0rCla5uY2lt/xfrRLX75kHbg41JB9sg2y3htwXZAX3gC52H8QDwgQWEOKKO7+
	pQZixIZS7Tkpx2BEqAznKZdw=
X-Received: by 2002:a17:902:ea01:b0:2d0:8b28:517c with SMTP id d9443c01a7336-2d0ca712ed0mr69851385ad.3.1785935760742;
        Wed, 05 Aug 2026 06:16:00 -0700 (PDT)
X-Received: by 2002:a17:902:ea01:b0:2d0:8b28:517c with SMTP id d9443c01a7336-2d0ca712ed0mr69850635ad.3.1785935760206;
        Wed, 05 Aug 2026 06:16:00 -0700 (PDT)
Received: from [192.168.1.6] ([171.76.80.242])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2d0a9f9362esm17387865ad.12.2026.08.05.06.15.57
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 05 Aug 2026 06:15:59 -0700 (PDT)
Message-ID: <6b59bf0d-c98c-4004-a117-7f5dde20d625@oss.qualcomm.com>
Date: Wed, 5 Aug 2026 18:45:56 +0530
Precedence: bulk
X-Mailing-List: sashiko-reviews@lists.linux.dev
List-Id: <sashiko-reviews.lists.linux.dev>
List-Subscribe: <mailto:sashiko-reviews+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:sashiko-reviews+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 4/8] platform: arm64: qcom-hamoa-ec: Add fan RPM query and
 LUT calibration
To: sashiko-reviews@lists.linux.dev
Cc: conor+dt@kernel.org, devicetree@vger.kernel.org, robh@kernel.org
References: <20260728-ec_add_more_commands-v1-0-771abd65ee1a@oss.qualcomm.com>
 <20260728-ec_add_more_commands-v1-4-771abd65ee1a@oss.qualcomm.com>
 <20260728181543.AB3131F000E9@smtp.kernel.org>
Content-Language: en-US
From: Anvesh Jain P <anvesh.p@oss.qualcomm.com>
In-Reply-To: <20260728181543.AB3131F000E9@smtp.kernel.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-Spam-Info: AW1haW4tMjYwODA1MDEwNiBTYWx0ZWRfX/4o5aLQuhs3g
 gN/qdyhaaBMBEUi2V4vcwYi17a9da1XejmNfPRBbMUnB9XJbekCZdd94u7DTjjD8D6FoAkiPQLz
 OBqkuJ+9mpP60/H8V2Jmp0bFDnrCshg=
X-Proofpoint-ORIG-GUID: 4FwcS3pZbrW1oVQEbnLLMZbeD_T1J2VG
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwODA1MDEwNiBTYWx0ZWRfXxzo8T48+oNtC
 yRrTSfnKsfetGz84/AJ7o5VGweegtNuCukVCnNwVVQ6H0cDVAYtLNhp3zRUakwt9ikvzlcvoE2/
 YpczPjJbdwsWCKf3bv5xxGYovqJZk8dBhcyS/ObnX+rhI8dxLNKHrnTnc8FSKYI9i/Eiahwz5Wz
 azeAnwbOMj70148J+vEvMeCj0p39XrRrwnNhyFS3LK8tTQVg1WK4Tx4tlyMRkmrL/K9NvwWkAfT
 YW8t1y6WHVTRcEv45RoSfY1bLVaLsiKv8v5nHDbLwXMsAkAdc7i7Q0F+6mmaO4ehnmlZoogu/rY
 bNixwqXlyKIIIB/DlAlv1b7no7hJFoLZRctxg1lSZuKX0zwaCFuClDqTfx2D3BFg+GVp9dLwpUW
 /wQPSmJDF6KIRlWhFWeMXycuarIGueP/XIYYBe1djbEnJFF9STQHwXYHB1k5oFVT+8CmBq7VtaB
 MYyBLAmfehEKbjgxEKw==
X-Proofpoint-GUID: 4FwcS3pZbrW1oVQEbnLLMZbeD_T1J2VG
X-Authority-Analysis: v=2.4 cv=Cu+PtH4D c=1 sm=1 tr=0 ts=6a733791 cx=c_pps
 a=JL+w9abYAAE89/QcEU+0QA==:117 a=UcsMPGGDBby+oECK+wqMZw==:17
 a=IkcTkHD0fZMA:10 a=Sv0fKeRqtYgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=_glEPmIy2e8OvE2BGh3C:22
 a=VwQbUJbxAAAA:8 a=EUspDBNiAAAA:8 a=MTEsSbWAnu0fgz7AP8kA:9 a=QEXdDO2ut3YA:10
 a=324X-CrmTo6CU4MGRt3R:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-08-05_04,2026-08-04_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 phishscore=0 clxscore=1015 malwarescore=0 spamscore=0 suspectscore=0
 bulkscore=0 priorityscore=1501 adultscore=0 impostorscore=0
 lowpriorityscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2606150000
 definitions=main-2608050106



On 7/28/2026 11:45 PM, sashiko-bot@kernel.org wrote:
> Thank you for your contribution! Sashiko AI review found 2 potential issue(s) to consider:
> - [High] Race condition between suspend/remove paths and `fan_calib_work_fn` can cause a 10 to 20-second hang.
> - [High] `psy_work` can be queued and executed while the device is in suspend, leading to I2C transfer failures.
> --
> 
> --- Patch [4]: [PATCH 4/8] platform: arm64: qcom-hamoa-ec: Add fan RPM query and LUT calibration ---
> commit e49733d2c63b28585a159eb3f465f9613c0aec7d
> Author: Anvesh Jain P <anvesh.p@oss.qualcomm.com>
> 
> platform: arm64: qcom-hamoa-ec: Add fan RPM query and LUT calibration
> 
> This commit adds EC command definitions and handler functions for querying
> fan RPM and programming per-fan LUTs mapping SoC temperature to target RPM.
> It implements a runtime calibration work item to determine the maximum RPM,
> and programs the LUT once calibration finishes and upon power-supply changes.
> 
>> diff --git a/drivers/platform/arm64/qcom-hamoa-ec.c b/drivers/platform/arm64/qcom-hamoa-ec.c
>> index f6ff77d4e8f69..d0c45d9970eee 100644
>> --- a/drivers/platform/arm64/qcom-hamoa-ec.c
>> +++ b/drivers/platform/arm64/qcom-hamoa-ec.c
> [ ... ]
>> @@ -665,6 +1097,49 @@ static void qcom_ec_soc_tj_work_fn(struct work_struct *work)
>>  	queue_delayed_work(system_percpu_wq, &ec->soc_tj_work, EC_SOC_TJ_TEMP_POLL_JIFFIES);
>>  }
>>  
>> +static void qcom_ec_fan_calib_work_fn(struct work_struct *work)
>> +{
>> +	struct qcom_ec *ec = container_of(work, struct qcom_ec, fan_calib_work);
>> +	struct device *dev = &ec->client->dev;
>> +	int i, ret;
>> +
>> +	reinit_completion(&ec->calib_abort);
> 
> [Severity: High]
> Can this race with the suspend or remove paths and cause a long delay?
> 
> If qcom_ec_fan_calib_work_fn() begins executing concurrently with
> qcom_ec_suspend() or qcom_ec_remove(), the suspend/remove thread calls
> complete_all(&ec->calib_abort) to signal the worker to abort.
> 
> However, if the worker executes reinit_completion() immediately after the
> suspend thread's complete_all(), the abort signal is erased. The suspend
> thread then blocks in cancel_work_sync(), waiting for the worker to finish,
> and the worker will block in wait_for_completion_interruptible_timeout()
> for the full timeout per fan (up to 10-20 seconds total).
>

I'll guard against this, probably by checking completion state before
reinit or using a separate abort flag instead of relying on
reinit_completion() alone.

>> +
>> +	mutex_lock(&ec->io_lock);
>> +	ec->calibrating = true;
>> +	mutex_unlock(&ec->io_lock);
>> +
> [ ... ]
>> @@ -690,7 +1169,16 @@ static int qcom_ec_suspend(struct device *dev)
>>  	struct qcom_ec *ec = i2c_get_clientdata(client);
>>  	int ret;
>>  
>> -	disable_delayed_work_sync(&ec->soc_tj_work);
>> +	if (ec->lut_cfg && ec->thermal_cap.fan_cnt) {
>> +		complete_all(&ec->calib_abort);
>> +		cancel_work_sync(&ec->fan_calib_work);
>> +	}
>> +
>> +	if (ec->lut_cfg)
>> +		cancel_work_sync(&ec->psy_work);
> 
> [Severity: High]
> Does this allow psy_work to be re-queued and executed during suspend?
> 
> While cancel_work_sync() stops currently pending work, the system-wide
> power supply notifier qcom_ec_psy_notifier() is not unregistered during
> suspend. 
> 
> If a power supply event occurs during the suspend process after
> cancel_work_sync() has run, the notifier can immediately queue psy_work
> back to the non-freezable system_long_wq.
> 
> This could cause the work to run and attempt I2C transfers while the
> I2C controller is suspended or the EC is in Modern Standby, potentially
> leading to bus lockups or suspend failures.
>

I'll switch that to disable_work_sync() so the notifier can't requeue it
mid-suspend.

>> +
>> +	if (ec->lut_cfg && ec->lut_cfg->send_soc_tj)
>> +		disable_delayed_work_sync(&ec->soc_tj_work);
>>  
>>  	mutex_lock(&ec->io_lock);
>>  	ret = i2c_smbus_write_byte_data(client, EC_MODERN_STANDBY_CMD,
> 

-- 
Best Regards,
Anvesh

