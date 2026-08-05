Received: from smtpout-02.galae.net (smtpout-02.galae.net [185.246.84.56])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1155148988B;
	Wed,  5 Aug 2026 08:37:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=185.246.84.56
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785919044; cv=none; b=q482ep9t4wtO2pTCjn6AIv+75NaGTjb8FQ34V4Jc/Q8IZaIjkaKkxDnVoCC92OOAxFLTsGc8hCXpoKr5oO1kh+WxAX/271nOajFA+4iXAAGDXMLrrMbxNf6hJ4Oehj1oAeefkNZuY2VB7GB0QxAsT+nuDyU4YyALOGPXOnjxpyA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785919044; c=relaxed/simple;
	bh=hceH8L6K34krT/6tB2UoMyLkuRnZhg+ZcVUiuxXUIIQ=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=uqEIdczsxfU89E+Vt2ozKucP9F5R3BKvtAyQ15xTCj1jORsERVI/uFrCJ5EOLzKHuD14TA8UkRYoYTaNT3AjP8MFbvVfbZdQZBqWGVwGCGdWnC3ithKfOzMp31dE7x8buj210vrnQmBkxAryONyRbKCRdq1XzeXWpqYPht2xmOY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=bootlin.com; spf=pass smtp.mailfrom=bootlin.com; dkim=pass (2048-bit key) header.d=bootlin.com header.i=@bootlin.com header.b=1wA0+ooI; arc=none smtp.client-ip=185.246.84.56
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=bootlin.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=bootlin.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bootlin.com header.i=@bootlin.com header.b="1wA0+ooI"
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
	by smtpout-02.galae.net (Postfix) with ESMTPS id A32A41A13E4;
	Wed,  5 Aug 2026 08:37:21 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
	by smtpout-01.galae.net (Postfix) with ESMTPS id 7950C602AB;
	Wed,  5 Aug 2026 08:37:21 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id A71B411C34460;
	Wed,  5 Aug 2026 10:37:20 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=dkim;
	t=1785919041; h=from:subject:date:message-id:to:cc:mime-version:content-type:
	 content-transfer-encoding:content-language:in-reply-to:references;
	bh=t6BhRZrm9O0B16oif8MmgPfQT9bd239hRN/utKHecFg=;
	b=1wA0+ooIGl5PVhJdRnAEU17PytvcBz5QXATPyI8oqGyc6PUZfsyr0hNzA/jB0Ynti+pbuq
	7AnJuWWzyIUPT5Av4UwuzZlManlNSk2lvy6mvCCt2mZ/OCyrR92O2SSNmB66z3WBD1VTlC
	9eyDwMTkcF00zd3QgB3mYdxbEqfHidwOnlS8YmpJPLp7d4kz8IL3WtPw9oS4j6J3co+TPn
	9L26HOK9K8omG0J1IegDOLW4xnV+6F04W0VBgbt8vtteobkLBfq8hiJZ056nzCvp5kJpDy
	W3Cx0jIHd6qTvzu6cL3TEvR83aToD6AUh00tVBb6QEIXqEPy1aKLzoLRZnNcCg==
Message-ID: <82ce3cf8-de3d-47a4-9b35-dab49977b702@bootlin.com>
Date: Wed, 5 Aug 2026 10:37:20 +0200
Precedence: bulk
X-Mailing-List: sashiko-reviews@lists.linux.dev
List-Id: <sashiko-reviews.lists.linux.dev>
List-Subscribe: <mailto:sashiko-reviews+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:sashiko-reviews+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 2/4] i2c: cgbc: Add virtual I2C bus support
To: sashiko-reviews@lists.linux.dev
Cc: lee@kernel.org, mfd@lists.linux.dev
References: <20260804-cgbc-i2c-storage-devices-support-v1-0-fed38510671c@bootlin.com>
 <20260804-cgbc-i2c-storage-devices-support-v1-2-fed38510671c@bootlin.com>
 <20260804154317.5766E1F000E9@smtp.kernel.org>
Content-Language: en-US
From: Thomas Richard <thomas.richard@bootlin.com>
In-Reply-To: <20260804154317.5766E1F000E9@smtp.kernel.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Last-TLS-Session-Version: TLSv1.3

On 8/4/26 5:43 PM, sashiko-bot@kernel.org wrote:
> Thank you for your contribution! Sashiko AI review found 1 potential issue(s) to consider:
> 
> Pre-existing issues:
> - [High] Uninitialized stack variable `data` used as a denominator, leading to a potential division by zero panic.
> --
> 
> --- Patch [2]: [PATCH 2/4] i2c: cgbc: Add virtual I2C bus support ---
> commit 68db5c3b940f7f50540127b0266b86e6b3d69b22
> Author: Thomas Richard <thomas.richard@bootlin.com>
> 
> i2c: cgbc: Add virtual I2C bus support
> 
> Internally the Board Controller has a virtual I2C bus with some virtual
> storage devices on it. Add support for it by defining a i2c_adapter entry.
> This virtual bus has a fixed frequency that cannot be changed.
> 
>> diff --git a/drivers/i2c/busses/i2c-cgbc.c b/drivers/i2c/busses/i2c-cgbc.c
>> index 25a74fa51aa00..c3f1c83b105a8 100644
>> --- a/drivers/i2c/busses/i2c-cgbc.c
>> +++ b/drivers/i2c/busses/i2c-cgbc.c
> 
> [ ... ]
> 
>> @@ -147,11 +148,14 @@ static int cgbc_i2c_set_frequency(struct i2c_adapter *adap,
>>  	cmd[0] = CGBC_I2C_CMD_SPEED | algo_data->bus_id;
>>  	cmd[1] = cgbc_i2c_freq_to_reg(bus_frequency);
>>  
>> -	ret = cgbc_command(cgbc, &cmd, sizeof(cmd), &data, 1, NULL);
>> -	if (ret)
>> -		return dev_err_probe(i2c->dev, ret,
>> -				     "Failed to initialize I2C bus %s",
>> -				     adap->name);
>> +	/* Virtual bus has a fixed frequency */
>> +	if (algo_data->bus_id != CGBC_I2C_VIRTUAL_BUS_ID) {
>> +		ret = cgbc_command(cgbc, &cmd, sizeof(cmd), &data, 1, NULL);
>> +		if (ret)
>> +			return dev_err_probe(i2c->dev, ret,
>> +					     "Failed to initialize I2C bus %s",
>> +					     adap->name);
>> +	}
>>  
>>  	cmd[1] = 0x00;
> 
> [Severity: High]
> This is a pre-existing issue, but I noticed a potential problem in how
> cgbc_i2c_set_frequency() handles the data variable.
> 
> Could this lead to a division by zero panic? The data variable is allocated on
> the stack uninitialized:
> 
> drivers/i2c/busses/i2c-cgbc.c:cgbc_i2c_set_frequency() {
>     ...
>     u8 cmd[2], data;
>     ...
> }
> 
> When passed to cgbc_command(), if the board controller firmware returns a
> successful status but provides a zero byte count, cgbc_command() skips reading
> into data and returns 0:
> 
> drivers/mfd/cgbc-core.c:cgbc_command() {
>     ...
>     case CGBC_STATUS_DATA_READY:
>         if (istatus > data_size)
>             istatus = data_size;
>         for (i = 0; i < istatus; i++) {
>             _data[i] = ioread8(cgbc->io_cmd + CGBC_CMD_DATA + ((i + 1) % 4));
>     ...
> }
> 
> If istatus is 0, the loop is skipped and data remains untouched.
> 
> When execution continues in cgbc_i2c_set_frequency(), this uninitialized
> value is converted to a frequency:
> 
> drivers/i2c/busses/i2c-cgbc.c:cgbc_i2c_set_frequency() {
>     ...
>     ret = cgbc_command(cgbc, &cmd, sizeof(cmd), &data, 1, NULL);
>     if (ret)
>         return dev_err_probe(...);
> 
>     bus_frequency = cgbc_i2c_reg_to_freq(data);
>     ...
>     algo_data->read_maxtime_us = (BITS_PER_BYTE + 1) * CGBC_I2C_READ_MAX_LEN
>         * USEC_PER_SEC / bus_frequency;
>     ...
> }
> 
> If the uninitialized stack memory evaluates to 0, or if the hardware
> explicitly returns a frequency of 0, would this result in a division by zero
> during the read_maxtime_us calculation?

The answer is still no. If CGBC_I2C_CMD_SPEED succeeds (and we check
cgbc_command's return code), it returns exactly 1 byte. We provided a
data buffer with size 1 to cgbc_command, so there is no way for
uninitialized stack memory to be read if the command succeeded.

To prevent buffer overflow, cgbc_command verifies that the buffer is
large enough to hold all received data.

Best Regards,
Thomas
