Received: from smtpout-03.galae.net (smtpout-03.galae.net [185.246.85.4])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3467437F8DB
	for <sashiko-reviews@lists.linux.dev>; Fri, 18 Sep 2026 09:24:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=185.246.85.4
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789723487; cv=none; b=HtzYpbOllaTB6IwJykPO1kAXJNLgwYm2CmpIE2vaSZsUiUhTfaGFhRHigLnkfCFanDMhLVJalCc+G8xQILgvYmHRswYDj0WA/ar5cHxlpWUEaWQbWRGJK6SButZ8pYaIIx7uzxhoGsSPATtbY8r6Y5BNSX/FMmVOBCyoHVYeQco=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789723487; c=relaxed/simple;
	bh=5kAYqROGRHI2ijZFVIXhllBEhND89bF3EWnr2HSlAzI=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=Ui4GXxOoV2gdx2LvznhACD9BJnklYyov7o8w0kKUDfsoGZVSSUE6rx5VWo3YMl+GXQmTuChBpOs/ZfOQfC01xqvlcJ6M+e3l/RiF+3ZCLgBr4tC1X22ekltvd157iw0k6Vb8cJzQGyHH5lWJy6yOKsKtbUecUVgep5eyzslUVNE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=bootlin.com; spf=pass smtp.mailfrom=bootlin.com; dkim=pass (2048-bit key) header.d=bootlin.com header.i=@bootlin.com header.b=ACusX+wv; arc=none smtp.client-ip=185.246.85.4
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=bootlin.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=bootlin.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bootlin.com header.i=@bootlin.com header.b="ACusX+wv"
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
	by smtpout-03.galae.net (Postfix) with ESMTPS id 7967A4E4083E;
	Fri, 18 Sep 2026 09:24:41 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
	by smtpout-01.galae.net (Postfix) with ESMTPS id 4DEFE60649;
	Fri, 18 Sep 2026 09:24:41 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id DDC4B10328AF3;
	Fri, 18 Sep 2026 11:24:39 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=dkim;
	t=1789723480; h=from:subject:date:message-id:to:cc:mime-version:content-type:
	 content-transfer-encoding:content-language:in-reply-to:references;
	bh=w7G9h+OKm0wuCvOlrpITU3G2HsawRC+fhCKiwp2VpE0=;
	b=ACusX+wv4WD6499Yg8r5qTPP/3zd/4HusnjWhQYq95QqH1vR4Bl5hdlRq5DbaxzsjQblu8
	1+1JGKjWPR3nezggC0QUlqQCRftp3W23Hvoj7plD+BeVf9DYfGxPk9eMUrQTkZvRBV5TZW
	dV1Wh7cyKFffcYbCC3uunyctx7xM0bBVrXQ7Ly9CekHPMj2ua2kLsGS+o8vphFYFlEWJOz
	uh8VCda7DN6WoSwvCtgY/QG8h59FGaqlK3aDSSTM0XOrvcygWQ6Sl3LcTjsL4+Z53hEWlW
	2CC3DsxyKq9/7fPBgaTlILkpRO/24Gx98Q7z5h8FDPY1OqdCuvu5XXflIazxVw==
Message-ID: <8c410484-bb66-4c9c-8eba-ce8fe3e5833d@bootlin.com>
Date: Fri, 18 Sep 2026 11:24:39 +0200
Precedence: bulk
X-Mailing-List: sashiko-reviews@lists.linux.dev
List-Id: <sashiko-reviews.lists.linux.dev>
List-Subscribe: <mailto:sashiko-reviews+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:sashiko-reviews+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3 6/9] i2c: cgbc: Add support for fixed frequency buses
To: sashiko-reviews@lists.linux.dev
Cc: lee@kernel.org, mfd@lists.linux.dev
References: <20260911-cgbc-i2c-storage-devices-support-v3-0-594b53fbc5ea@bootlin.com>
 <20260911-cgbc-i2c-storage-devices-support-v3-6-594b53fbc5ea@bootlin.com>
 <20260911185632.E6E821F000FF@smtp.kernel.org>
Content-Language: en-US
From: Thomas Richard <thomas.richard@bootlin.com>
In-Reply-To: <20260911185632.E6E821F000FF@smtp.kernel.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Last-TLS-Session-Version: TLSv1.3

On 9/11/26 8:56 PM, sashiko-bot@kernel.org wrote:
> Thank you for your contribution! Sashiko AI review found 1 potential issue(s) to consider:
> 
> Pre-existing issues:
> - [High] Uninitialized stack variable `data` or a hardware-reported frequency of 0 leads to a kernel panic via division by zero when calculating `read_maxtime_us`.
> --
> 
> commit a5aecc6c875f05c7505536612661e80e88abe3e8
> Author: Thomas Richard (congatec GmbH) <thomas.richard@bootlin.com>
> 
> i2c: cgbc: Add support for fixed frequency buses
> 
> This commit adds support for I2C buses running at a fixed frequency by
> introducing a fixed_freq flag in cgbc_i2c_platform_data. It splits the
> frequency configuration into two functions, cgbc_i2c_set_frequency() and
> cgbc_i2c_get_frequency(), to skip setting the frequency for fixed buses
> while still computing read_maxtime_us.
> 
>> diff --git a/drivers/i2c/busses/i2c-cgbc.c b/drivers/i2c/busses/i2c-cgbc.c
>> index d388e07aad84a..cb0435b3cc5f9 100644
>> --- a/drivers/i2c/busses/i2c-cgbc.c
>> +++ b/drivers/i2c/busses/i2c-cgbc.c
> [ ... ]
>> @@ -140,18 +139,21 @@ static int cgbc_i2c_set_frequency(struct i2c_adapter *adap,
>>  	cmd[0] = CGBC_I2C_CMD_SPEED | i2c->bus_id;
>>  	cmd[1] = cgbc_i2c_freq_to_reg(bus_frequency);
>>  
>> -	ret = cgbc_command(cgbc, &cmd, sizeof(cmd), &data, 1, NULL);
>> -	if (ret)
>> -		return dev_err_probe(i2c->dev, ret,
>> -				     "Failed to initialize I2C bus %s",
>> -				     adap->name);
>> +	return cgbc_command(cgbc, &cmd, sizeof(cmd), &data, 1, NULL);
>> +}
>>  
>> -	cmd[1] = 0x00;
>> +static int cgbc_i2c_get_frequency(struct i2c_adapter *adap)
>> +{
>> +	struct cgbc_i2c_data *i2c = i2c_get_adapdata(adap);
>> +	struct cgbc_device_data *cgbc = i2c->cgbc;
>> +	u8 cmd[2] = { CGBC_I2C_CMD_SPEED | i2c->bus_id };
>> +	unsigned int bus_frequency;
>> +	u8 data;
>> +	int ret;
>>  
>>  	ret = cgbc_command(cgbc, &cmd, sizeof(cmd), &data, 1, NULL);
>>  	if (ret)
>> -		return dev_err_probe(i2c->dev, ret,
>> -				     "Failed to get I2C bus frequency");
>> +		return ret;
>>  
>>  	bus_frequency = cgbc_i2c_reg_to_freq(data);
> 
> [Severity: High]
> This is a pre-existing issue, but can this lead to a division by zero panic?
> 
> In drivers/i2c/busses/i2c-cgbc.c:cgbc_i2c_get_frequency(), the output buffer
> variable data is declared on the stack without initialization. It is passed
> to cgbc_command() which, under certain hardware conditions (like returning
> CGBC_STATUS_CMD_READY in drivers/mfd/cgbc-core.c), can succeed while
> skipping the read loop, leaving data completely untouched.
> 
> If data remains uninitialized garbage that evaluates to 0, or if the hardware
> legitimately returns a value that parses as 0 for an uninitialized
> fixed-frequency bus, cgbc_i2c_reg_to_freq() will return 0 for bus_frequency.
> 
> The unvalidated bus_frequency is then used as a divisor when calculating
> read_maxtime_us a few lines later:
> 
> i2c->read_maxtime_us = (BITS_PER_BYTE + 1) * CGBC_I2C_READ_MAX_LEN
>         * USEC_PER_SEC / bus_frequency;
> 
> Could we initialize data and check if bus_frequency is valid before dividing?

No, if CGBC_I2C_CMD_SPEED succeeded (we check that) we get valid data,
so cgbc_i2c_reg_to_freq() will compute a valid frequency, so it's
impossible to get a division by zero.

Best Regards,
Thomas
