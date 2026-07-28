Received: from mail-pj1-f54.google.com (mail-pj1-f54.google.com [209.85.216.54])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5F76B3C7692
	for <sashiko-reviews@lists.linux.dev>; Tue, 28 Jul 2026 18:13:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.216.54
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785262411; cv=none; b=ciHMW3j3KlOBPRHSRGlGl37mTB/DC4SappKj04W7x0BZVrVcfT16m/ZcJWRmy5LxHa2ASWLWIb875UxNKYNmmdQfs0wy4wzQvzipUnl/9HLPm2RYGkC5StxgFWRJGlbtE/wbeSJx3FdpLffbuyAbeNkajSUi1Q1WoxPod/qxFvA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785262411; c=relaxed/simple;
	bh=jY6dnqvHqg10KwmO68TrPmov0yHK8C6hEToNCKrRsr4=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=V6oFpnP01hRewCt9DH83qLDXWBVHi1W38++z31oEXGf3MiuVQkwziQT1OZuWqQJDDjq0jKKSSD877dEN7IlZ6uOg8UCnqlKae44Pj55BCgFKPyyQ4kzk0vHNm4DJ2zGkEHsndZPsVTb6yB+kiDtrXJuc3xBdQcQ2uMZIg4qhp+A=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=roeck-us.net; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=CcET0Zp+; arc=none smtp.client-ip=209.85.216.54
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=roeck-us.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="CcET0Zp+"
Received: by mail-pj1-f54.google.com with SMTP id 98e67ed59e1d1-38dc4553f62so153887a91.0
        for <sashiko-reviews@lists.linux.dev>; Tue, 28 Jul 2026 11:13:29 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1785262409; x=1785867209; darn=lists.linux.dev;
        h=content-transfer-encoding:content-type:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:sender:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=YMSPpx6yGKTGt83Sgz1eRa+q8wGQ4JN++szdtt2dYyA=;
        b=CcET0Zp+U1bn3+pUghr79ovwO0N2LptsPAiDTry0/DERnzJF5WpKrvrGilkTJu0s0G
         pcdoYQrw/j7Wne14+Umni059jz31u0bQAjmFIMsNIOIo+KOi8Y+sVrHxD3qi4Vp5rOCE
         xSI/XYaoyjY3+g+lWHc415ei4BoEhVVOXaRAnEJJd1USdylimSvy3SgVaWLxUvjjlKUK
         FgFst01A6KFojglQ3Rs60UXva6DBZqV+hLuH1VCHoDyY4JghlIgYd4ZkBgaNm5UDX5Ai
         3OTIu6tn24Aia0TA2436SNbgvCklpXEEB+NQdFcKfEQ4RzsNW72c7hlnJUxVNhbgF0Le
         CsMw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1785262409; x=1785867209;
        h=content-transfer-encoding:content-type:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:sender:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=YMSPpx6yGKTGt83Sgz1eRa+q8wGQ4JN++szdtt2dYyA=;
        b=VCLzK1Sf5pUMv2cfZes/k+mNsxONmtpPfv6O6EMJjvmpWxPCSkps9cI7XwAW3BPJoo
         EdBTPdthGXiO51fDT5kbRu/z44iA4aCCs01ljMEdTdySf8o8RL0RB/RWMSdVq7TRM44O
         zBhjnmNY7N/H+qLQ5iXBtWqMo0ScvO72jwLjFHO4DRcp7JHtvhMk7TIGgfmiQE+W19SX
         5zIguwIN3eAFxMYto9LIGednUUgp8ej1QK5YJe72oAHycyKTN7Q/k2/PYLDtFBIhHB/a
         Ap4TE0t/U0CiSeYVKK3rGynCOwsTNbrC8U9n2P10MYBHThIcXUdmjjXj/cSBB/nvaaF/
         6WPw==
X-Gm-Message-State: AOJu0Yy3Vx0lNjVJsh9sjKaHaPozZdg2gqcE9jQ8pZTyxihMRxf7hGbs
	mHJCPlbW9Q0sBO2tvSLZVoV3J5HsXLSXjBTDz1uiQ5lWraPRw/NgUvdWgH7NQg==
X-Gm-Gg: AR+sD11nOQPOT1pHNojml1spoInMHd2DXF28YIQ8tJjaHhmlKrF4G0Npv0QYvAnC0g8
	CRY3XMixDt1C0Roto1WitKoxufAwbHi18ukufQQbYFLtG9Ne857ptLW1/sSVh+CAEQx85vDMFBX
	f/UMD2Yor6YPLCErggiKSCGusINU+12eC0TjKTl6GYMSUJLy07CCJ1v+JGhxXebJ6DzHqFjmxR5
	dTmLv1AHJ2fXK/RZrK3jvAXHuzR/9os3/Gfa5V5gXxltAzkipTtyJLgX8wP1IRnpDUbJLiT4CAN
	zjdTGbcpJpUBJqmhJS1AREnNy6Kr2GxjvuCq34gN2iLJLlXSsKPpfNqkxmhPrUURY+tWQj1zpUt
	U217/hwAImfbnuwmWBwh6RQzrAX0AqpF1RAYRwm2/wbsXk0Whl1zu8CnqAv1XBeFcYgtHWHWCd2
	WoYO8EZUB0ze34C8Rk+Lf6e/tkG6JWENHJLbA5SlIuczJASClv3ok=
X-Received: by 2002:a17:90a:d888:b0:38d:e658:595a with SMTP id 98e67ed59e1d1-38f6a30d87emr3634504a91.2.1785262408610;
        Tue, 28 Jul 2026 11:13:28 -0700 (PDT)
Received: from ?IPV6:2600:1700:e321:62f0:da43:aeff:fecc:bfd5? ([2600:1700:e321:62f0:da43:aeff:fecc:bfd5])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-31504d373c3sm915235eec.23.2026.07.28.11.13.27
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 28 Jul 2026 11:13:28 -0700 (PDT)
Sender: Guenter Roeck <groeck7@gmail.com>
Message-ID: <e8ba1c8a-cf68-421e-9974-f31f31e90e59@roeck-us.net>
Date: Tue, 28 Jul 2026 11:13:26 -0700
Precedence: bulk
X-Mailing-List: sashiko-reviews@lists.linux.dev
List-Id: <sashiko-reviews.lists.linux.dev>
List-Subscribe: <mailto:sashiko-reviews+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:sashiko-reviews+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 3/5] hwmon: (pmbus/core) Add mapping function to
 pmbus_read_block_data()
To: sashiko-reviews@lists.linux.dev, =?UTF-8?Q?Nuno_S=C3=A1?=
 <nuno.sa@analog.com>
Cc: conor+dt@kernel.org, linux-hwmon@vger.kernel.org,
 devicetree@vger.kernel.org, robh@kernel.org
References: <20260728-hwmon-max20826-support-v1-0-224766e0acd1@analog.com>
 <20260728-hwmon-max20826-support-v1-3-224766e0acd1@analog.com>
 <20260728162749.A42051F000E9@smtp.kernel.org>
Content-Language: en-US
From: Guenter Roeck <linux@roeck-us.net>
Autocrypt: addr=linux@roeck-us.net; keydata=
 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
 np3900V20aS7eD9K8GTU0TGC1pyz6IVJwIE=
In-Reply-To: <20260728162749.A42051F000E9@smtp.kernel.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit

On 7/28/26 09:27, sashiko-bot@kernel.org wrote:
> Thank you for your contribution! Sashiko AI review found 2 potential issue(s) to consider:
> 
> New issues:
> - [High] Stack buffer overflow in `pmbus_debugfs_block_read` due to unbounded return value from custom `read_block_data` callback.
> 
> Pre-existing issues:
> - [High] TOCTOU data race on PMBus hardware page selection during probe.
> --
> 
> --- Patch [3]: [PATCH 3/5] hwmon: (pmbus/core) Add mapping function to pmbus_read_block_data() ---
> commit c4bd4d03203a9fd14a7a2bcff69ec842b441fa68
> Author: Nuno Sá <nuno.sa@analog.com>
> 
> hwmon: (pmbus/core) Add mapping function to pmbus_read_block_data()
> 
> This commit introduces a mapping function to pmbus_read_block_data() in
> preparation for adding support to a device which needs to use its own
> read_block implementation.
> 
>> diff --git a/drivers/hwmon/pmbus/pmbus.h b/drivers/hwmon/pmbus/pmbus.h
>> index 3d5586c67f840..d697939ec8921 100644
>> --- a/drivers/hwmon/pmbus/pmbus.h
>> +++ b/drivers/hwmon/pmbus/pmbus.h
>> @@ -459,6 +459,9 @@ struct pmbus_driver_info {
>>   	int (*read_byte_data)(struct i2c_client *client, int page, int reg);
>>   	int (*read_word_data)(struct i2c_client *client, int page, int phase,
>>   			      int reg);
>> +	/* size of data_buf is I2C_SMBUS_BLOCK_MAX + 2 */
>> +	int (*read_block_data)(struct i2c_client *client, int page, u8 reg,
>> +			       char *data_buf);
> 
> [Severity: High]
> Does this API need a size limit parameter? The comment specifies the buffer
> size is 34, without providing a limit parameter to the callback, which might
> encourage callbacks to return values up to 34.
> 

The maximum amount of data returned must be 32 bytes, not 34. Callers define
a larger buffer size to be able to append, for example, '\n\0'. The function
itself, however, must not return more than 32 bytes of data, plus the data
length in the first byte.

Guenter
> [ ... ]
> 
>> diff --git a/drivers/hwmon/pmbus/pmbus_core.c b/drivers/hwmon/pmbus/pmbus_core.c
>> index 7b58f71985741..ff4572c473b70 100644
>> --- a/drivers/hwmon/pmbus/pmbus_core.c
>> +++ b/drivers/hwmon/pmbus/pmbus_core.c
> [ ... ]
>> @@ -678,7 +698,7 @@ static bool __maybe_unused pmbus_check_block_register(struct i2c_client *client,
>>   	struct pmbus_data *data = i2c_get_clientdata(client);
>>   	char data_buf[I2C_SMBUS_BLOCK_MAX + 2];
>>   
>> -	rv = pmbus_read_block_data(client, page, reg, data_buf);
>> +	rv = _pmbus_read_block_data(client, page, reg, data_buf);
> 
> [Severity: High]
> This is a pre-existing issue, but can this lead to a race condition with
> sysfs accesses during probe?
> 
> Looking at pmbus_init_debugfs(), it traverses pages and reads registers
> without taking the pmbus_lock. This indirectly invokes pmbus_set_page()
> through pmbus_check_block_register():
> 
> pmbus_init_debugfs()
>    pmbus_check_block_register()
>      _pmbus_read_block_data()
>        pmbus_read_block_data()
>          pmbus_set_page()
> 
> If userspace reads or writes to a sysfs attribute concurrently, it acquires
> the lock and sets the hardware page. Could the lockless call from
> pmbus_init_debugfs() interleave between the sysfs thread's pmbus_set_page()
> and its subsequent I2C operation, causing the sysfs thread to hit the wrong
> PMBus page?
> 
>>   	if (rv >= 0 && !(data->flags & PMBUS_SKIP_STATUS_CHECK))
>>   		rv = pmbus_check_status_cml(client);
> [ ... ]
>> @@ -3564,7 +3584,7 @@ static ssize_t pmbus_debugfs_block_read(struct file *file, char __user *buf,
>>   	char data[I2C_SMBUS_BLOCK_MAX + 2] = { 0 };
>>   
>>   	scoped_guard(pmbus_lock, client) {
>> -		rc = pmbus_read_block_data(client, entry->page, entry->reg, data);
>> +		rc = _pmbus_read_block_data(client, entry->page, entry->reg, data);
>>   		if (rc < 0)
>>   			return rc;
>>   	}
> 
> [Severity: High]
> Can the new callback return a value large enough to cause an out-of-bounds
> write here?
> 
> If _pmbus_read_block_data() delegates to the new read_block_data callback,
> and that callback returns a size of 34 (I2C_SMBUS_BLOCK_MAX + 2) or greater,
> would it cause a buffer overflow?
> 
> Just below this hunk in pmbus_debugfs_block_read(), the code does:
> 
>      data[rc] = '\n';
> 
> Since the size of the data array is 34, an rc of 34 would write past the end
> of the array. Is a bounds check needed on rc before using it as an index?
> 

