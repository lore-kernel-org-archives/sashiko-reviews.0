Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2242B393DE6
	for <sashiko-reviews@lists.linux.dev>; Wed,  5 Aug 2026 15:10:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785942625; cv=none; b=h9E0dMI19LjsKBpRErkNRqZLgkJcDqF/auN209+3lk5+gUpnqKOWl5Zc+90daj4P5UrphRaF9yBtxwsDieWRMIuVZai4BTn6hMvA9QHV/P4rF9HyfzqaKDslG7RwZuk5Gh4YcC4u6JOsMHEiE7GvxtdTMdZz3HDZET3O1rF0oCw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785942625; c=relaxed/simple;
	bh=L+5tXYPtUhRaNL0B+rgIRcgv8+FzWrIwWS9NcMN3aEk=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=etHVRt0J/l7n0eJbh1L7ktiyxy4RrQzTkPQurz5W3uH4M/6GqWozd5O6uNTifevJxwHi11W/GfFwXNpR4QCuPaadnZkrw7YtleG6RSnmhUay1hCurcih4zrRg6Gg6gFnp+uj0GQT99W7f4HxhUSxaOozDBBfXH5v//6Nr2t/tDY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=koZwwlGB; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=Vl5Mv0R0; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="koZwwlGB";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="Vl5Mv0R0"
Received: from pps.filterd (m0279865.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 675Cg2Dx3472485
	for <sashiko-reviews@lists.linux.dev>; Wed, 5 Aug 2026 15:10:23 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	VQtXNJQp1VB5MSHelQbg0WHY6EAG35/lwGSn0XAXIxc=; b=koZwwlGBCetyD3er
	k5gRz7bToU0NORNDqCJyyTzsDpQDhaerHwGO3U8KUG/KdWBRVEUoHQpZ0Ea/ffWp
	LTNJohZHDEeKrMEpaQM9As5xupE65IRSU3Ibu6wKB7e5zlJGzNe719oA1rrqZVu/
	dGpWodZ7XApPcGVpdMVqAjRScWGj34m9Dnrb0uAQd1RGNrK0iZ2nbIDglhpeTKGQ
	u9tqkmJhc7eDGPBc33pRD13ywdrK/PQgUxxWa5zQSFQMkxmqTzuhEiyo1Ih2izAy
	4Tv36iJSQpgtBaxwG6LTJzaMPhKs+acSz2uVpyFkUn02Uo2mnRikBUDVbYLtujdq
	rFbHWQ==
Received: from mail-pg1-f199.google.com (mail-pg1-f199.google.com [209.85.215.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4fv5dk0rae-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <sashiko-reviews@lists.linux.dev>; Wed, 05 Aug 2026 15:10:23 +0000 (GMT)
Received: by mail-pg1-f199.google.com with SMTP id 41be03b00d2f7-c856470fe9fso848343a12.2
        for <sashiko-reviews@lists.linux.dev>; Wed, 05 Aug 2026 08:10:23 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1785942622; x=1786547422; darn=lists.linux.dev;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=VQtXNJQp1VB5MSHelQbg0WHY6EAG35/lwGSn0XAXIxc=;
        b=Vl5Mv0R0tNue65nGIVkCAxiZOgWuSYbG1bXX+to71Q6iadAiV1XXYoDlLiKsPuGCne
         gcJYEGeu8Acgiw1y3VF8Q+20F4GYl2/esZsV3e6UNe0O4ggcHYXZj0CDj6bEI4dfYD7d
         Y2tdlzGuC+1qva+sWf8tnnSIVV+7BJE3yr+uWVW6aGB+PXP6YYcZbXB1fzigwY5m94Rd
         dlsngrG13XFj4ppykoedCM5aF3mHMrlTblxNNw7Va1zZSvOAOOvoOcclEataOXGURHlf
         hyDbcl+oVQT+BhBPELnUKWueZ0AIzueJT48L3kEE8J6+Vl2p1LzRzOVSfYKwA81m7afZ
         M9TQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1785942622; x=1786547422;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=VQtXNJQp1VB5MSHelQbg0WHY6EAG35/lwGSn0XAXIxc=;
        b=JT5ROw+hDdxNNdDe1GeTWkus1ewIXTijnxVALmCqdWRZu6t5p6KeiwihA/6bKgi8cV
         i77jkNG+/dkIXShP0c16eWD9zEop77GjjxHyzYlojfIdom2A92crO5S5kvqnEL+WsdGi
         Pr5aGjq6Vc3mHGj85qRH+r3IDyais6fpIPukx1/V44smv8UJixtoSHQ9YtFev5KpWlxs
         l0/jLrhl2yFAeXR49DyGhuk53vSs1Ag033GUkrezR66JTcaix5rQj+wNCjrGjRBxcU7J
         ENpv3FsYYnJCKy4ovDDtOxU7v3qF7RlO12UMxTHC9Tki6+VcMAD85SE/uGHB0QQkktaw
         eD+w==
X-Gm-Message-State: AOJu0Yxo/AcDd2x1OILPS2pdwJPRjCV11lj02gKsH0lwVHIQGMbDycNm
	bpv7M5Bvb86pJMKYH5PDfbaY5V3Sn9SDsrRgmk6Ukx+wuVgY7QMTWxtKb2ktpVjFt7BB5rj73yg
	oh9NzPIhi8eAGS3m4qsW/q1tMxgmpX7pF6e93vPtrg1EhM+amVeDCj6oaWF9kPgyQjTlC+oPDMG
	wzuX0=
X-Gm-Gg: AR+sD11yOlbU3LoR5LeUrNBn0S3LVEWLNTVPALfp2O2VS9MoILMO5saE0+/Rp3fb2Dr
	xTn2iKze+rchNuDioqUqaDUKpTeB99umJotlR9Ot/Oztw9K6EvS65h35ylJr85BUvKaFXaxX/TP
	7JnPUJn5EZf4BF1f9XEE88OZq8YqXXckLHLkz+TBihu9IbzDTqDdcjO0v+PHHiNay62w9stBndc
	pPjN9JDMMfH2yKy/du3v671h1FG3dbEp33lCzb3CZgQ+l5MPm9NQESU2e2JJ+Z2i5HGMl6eI5XE
	wdJPwbes5/cWNExvxuZur+lupt5VXP3UPbQFUOS5kvtQUMCyr4P0lRtCESKHhmg5EZhtBPL5cb3
	m+4EjO6iK6p1qCbJqauGl+IM=
X-Received: by 2002:a17:90b:17c6:b0:38f:1a2e:6e56 with SMTP id 98e67ed59e1d1-3903c59330amr7100321a91.9.1785942622342;
        Wed, 05 Aug 2026 08:10:22 -0700 (PDT)
X-Received: by 2002:a17:90b:17c6:b0:38f:1a2e:6e56 with SMTP id 98e67ed59e1d1-3903c59330amr7100240a91.9.1785942621794;
        Wed, 05 Aug 2026 08:10:21 -0700 (PDT)
Received: from [192.168.1.6] ([171.76.80.242])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-13fca50ad27sm14996315c88.2.2026.08.05.08.10.19
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 05 Aug 2026 08:10:21 -0700 (PDT)
Message-ID: <dd445279-3e1b-4d2e-9a6f-e73b67c33a10@oss.qualcomm.com>
Date: Wed, 5 Aug 2026 20:40:17 +0530
Precedence: bulk
X-Mailing-List: sashiko-reviews@lists.linux.dev
List-Id: <sashiko-reviews.lists.linux.dev>
List-Subscribe: <mailto:sashiko-reviews+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:sashiko-reviews+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 6/8] platform: arm64: qcom-hamoa-ec: Retry I2C transfers
 on NACK
To: sashiko-reviews@lists.linux.dev
Cc: conor+dt@kernel.org, robh@kernel.org, devicetree@vger.kernel.org
References: <20260728-ec_add_more_commands-v1-0-771abd65ee1a@oss.qualcomm.com>
 <20260728-ec_add_more_commands-v1-6-771abd65ee1a@oss.qualcomm.com>
 <20260728182642.AFF0E1F00A3A@smtp.kernel.org>
Content-Language: en-US
From: Anvesh Jain P <anvesh.p@oss.qualcomm.com>
In-Reply-To: <20260728182642.AFF0E1F00A3A@smtp.kernel.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Proofpoint-ORIG-GUID: R8RjZyh_EZr0gsO8coVsv6N-PZqfQDOr
X-Authority-Analysis: v=2.4 cv=Or9/DS/t c=1 sm=1 tr=0 ts=6a73525f cx=c_pps
 a=Oh5Dbbf/trHjhBongsHeRQ==:117 a=UcsMPGGDBby+oECK+wqMZw==:17
 a=IkcTkHD0fZMA:10 a=Sv0fKeRqtYgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=Um2Pa8k9VHT-vaBCBUpS:22
 a=VwQbUJbxAAAA:8 a=EUspDBNiAAAA:8 a=ajF3hhvFhjBU8BI-8GAA:9 a=3ZKOabzyN94A:10
 a=QEXdDO2ut3YA:10 a=_Vgx9l1VpLgwpw_dHYaR:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwODA1MDEyMyBTYWx0ZWRfXzNdxJPg7dtiZ
 guwEUWM4/nlbJsAngmG1a4miSOnXOe5Y7625aB5ODDnRyMwhOR90lXufL56d4OGw+ES9nqJilow
 0596P4XLiLvm9Lm7MJwYe6am/JEkLCJiiScpz2tJ2mlfRrEQ38VnGkk7lhvYOKXFnaIcepzuTF0
 ISgNWgwUgyNUuVbx2DVPQNnE1Zxdd+YttE2rz9x0oKcpRiG4n+HjUU1x71Ii2I0X4tyTFtaQiSe
 24Lj87yFxCrcb+Yv+Zl7mYFnPdafgka/E3Sle3STzS/8an6xa+iSFycZ7Djgp3pLNSekxcYo0MG
 vTanxbLXAyPQXcoozY3/uP1qvPeF7gIrRnA1iiujQ3EunR0Hn3cpJ/WTsYjmx6wxEwIbIHL90EB
 1l/NwvxmVFuznxtnG51aVHL8Bt4/ry8z3u8k0UDV6b1fplrPmm5RrLLaHtFSR8AwvjpVCKqNCmN
 QadgfylzRWUb8fEB4Eg==
X-Proofpoint-GUID: R8RjZyh_EZr0gsO8coVsv6N-PZqfQDOr
X-Proofpoint-Spam-Info: AW1haW4tMjYwODA1MDEyMyBTYWx0ZWRfXy3jCOn2cGGFL
 WX3xETjPqxp4D/TZJvMt7k3nN9/G6+dcz8Q9fcyy8qjfZrP4Vuv+M4ejIUO5XM9l9G7efUHarE9
 5hx8rmYURvCXU5DMwJXky/BZl9lorzI=
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-08-05_04,2026-08-04_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 suspectscore=0 phishscore=0 priorityscore=1501 spamscore=0 bulkscore=0
 clxscore=1015 malwarescore=0 lowpriorityscore=0 adultscore=0 impostorscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2608050123



On 7/28/2026 11:56 PM, sashiko-bot@kernel.org wrote:
> Thank you for your contribution! Sashiko AI review found 3 potential issue(s) to consider:
> 
> Pre-existing issues:
> - [High] The patch adds retry logic for EC NACKs to `qcom_ec_write()` and `qcom_ec_read()`, but fails to add equivalent retries for the numerous `i2c_smbus_*` calls made throughout the driver, leaving them vulnerable to the exact same failure.
> - [High] Race condition during device removal where cooling device callbacks can execute after debug mode is disabled.
> - [Low] Initialized arrays of type `struct i2c_device_id` must use named initializers rather than positional initializers.
> --
> 
> --- Patch [6]: [PATCH 6/8] platform: arm64: qcom-hamoa-ec: Retry I2C transfers on NACK ---
> commit 42a41f4860b9d5a24932df8c69069cb7fd89b4d1
> Author: Anvesh Jain P <anvesh.p@oss.qualcomm.com>
> 
> platform: arm64: qcom-hamoa-ec: Retry I2C transfers on NACK
> 
> The patch adds bounded retry logic to qcom_ec_write() and qcom_ec_read()
> to handle EC firmware NACKs that occur during busy windows right after
> boot or during SCI event bursts.
> 
>> The EC firmware NACKs the bus instead of clock-stretching while it is
>> busy servicing internal work (e.g. right after boot, when it is also
>> emitting a burst of SCI events). A transfer issued in that window fails
>> with -ENXIO even though the EC is otherwise healthy.
> 
> [Severity: High]
> This isn't a bug introduced by this patch, but since the EC NACKs the bus
> right after boot and during SCI event bursts, will the un-retried i2c_smbus
> calls also fail?
> 
> For example, qcom_ec_sci_evt_control() is called directly during probe and
> uses i2c_smbus_write_byte_data() without retry logic:
> 
> drivers/platform/arm64/qcom-hamoa-ec.c:qcom_ec_sci_evt_control() {
>     ...
>     ret = i2c_smbus_write_byte_data(client, EC_SCI_EVT_CONTROL_CMD, enable ? 1 : 0);
>     ...
> }
> 
> Similarly, qcom_ec_irq() reads events during an SCI burst using
> i2c_smbus_read_byte_data():
> 
> drivers/platform/arm64/qcom-hamoa-ec.c:qcom_ec_irq() {
>     ...
>     val = i2c_smbus_read_byte_data(ec->client, EC_SCI_EVT_READ_CMD);
>     ...
> }
> 
> Should these SMBus calls also be updated to retry on NACK?
>

I'll add the same NACK-retry loop to qcom_ec_sci_evt_control()'s write
and qcom_ec_irq()'s SCI event read.

>> diff --git a/drivers/platform/arm64/qcom-hamoa-ec.c b/drivers/platform/arm64/qcom-hamoa-ec.c
>> index a420a180a1948..122ae27c2b483 100644
>> --- a/drivers/platform/arm64/qcom-hamoa-ec.c
>> +++ b/drivers/platform/arm64/qcom-hamoa-ec.c
> 
> [ ... ]
> 
>> @@ -281,11 +302,18 @@ static int qcom_ec_read(struct qcom_ec *ec, u8 cmd, const u8 *subcmd,
>>  	msgs[1].len   = resp_len;
>>  	msgs[1].buf   = read_buf;
>>  
>> -	ret = i2c_transfer(client->adapter, msgs, 2);
>> -	if (ret != 2) {
>> -		ret = ret < 0 ? ret : -EIO;
>> -		goto out;
>> +	for (int i = 0; i < EC_I2C_NACK_MAX_ATTEMPTS; i++) {
>> +		ret = i2c_transfer(client->adapter, msgs, 2);
>> +		ret = ret == 2 ? 0 : (ret < 0 ? ret : -EIO);
>> +		if (ret != -ENXIO || i == EC_I2C_NACK_MAX_ATTEMPTS - 1)
>> +			break;
>> +
>> +		dev_dbg(&client->dev,
>> +			"EC busy (NACK), retrying read of cmd 0x%02x\n", cmd);
>> +		msleep(EC_I2C_NACK_RETRY_DELAY_MS);
>>  	}
>> +	if (ret)
>> +		goto out;
>>  
>>  	if (read_buf[0] == 0 || read_buf[0] == 0xff) {
>>  		ret = -EOPNOTSUPP;
> 
> [Severity: High]
> This is a pre-existing issue, but does the cooling device teardown have a
> race condition that could leave the fan stuck in debug (manual PWM) mode?
> 
> In qcom_ec_remove(), the driver turns off debug mode:
> 
> drivers/platform/arm64/qcom-hamoa-ec.c:qcom_ec_remove() {
>     ...
>     qcom_ec_fan_debug_mode_off(ec_cdev);
>     ...
> }
> 
> However, since the thermal cooling device is managed by devres, it remains
> registered until after remove() completes. Can the thermal core invoke
> qcom_ec_fan_set_cur_state() during this window, which re-enables debug mode?
> 
> drivers/platform/arm64/qcom-hamoa-ec.c:qcom_ec_fan_set_cur_state() {
>     ...
>     ret = qcom_ec_fan_write_pwm(ec_cdev, state);
>     ...
> }
> 

This one's tied to how the cooling device gets registered — devm was
specifically requested there during the initial driver review

> [Severity: Low]
> This is a pre-existing issue, but does qcom_ec_i2c_id_table violate the I2C
> subsystem API guidelines by using positional initializers?
> 
> drivers/platform/arm64/qcom-hamoa-ec.c:
> static const struct i2c_device_id qcom_ec_i2c_id_table[] = {
> 	{ "qcom-hamoa-ec", },
> 	{}
> };
> 
> The subsystem guidelines state that initialized arrays of type
> struct i2c_device_id must use named initializers.
> 

Yeah, I'll switch that to a named initializer instead of positional.

-- 
Best Regards,
Anvesh

