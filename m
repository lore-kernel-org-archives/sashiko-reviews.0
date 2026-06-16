Received: from mail-pl1-f171.google.com (mail-pl1-f171.google.com [209.85.214.171])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 167A93769F3
	for <sashiko-reviews@lists.linux.dev>; Tue, 16 Jun 2026 14:17:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.171
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1781619479; cv=none; b=qWIVTDesmlR7e6eVjX0IS3InEr6EAdNwROuyklZSmCH5xRBSUzqdni5WsY4WJtCZi6uej2Y0AcdYWDKxHPH9zZpEJqYZP/d5LXo6pEUhO8S7vj0W5OnYoSFm4ztd4Nv0i6vL4P5bW3jUliLXxaUI4Q7C0bMYjaQsPGTHAOlGvsk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1781619479; c=relaxed/simple;
	bh=sDJEqkBdnnVZD8ANE44V03YBo+j6qH2GvPmUHoC5Svk=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=PvVPaLmMVekiY3iv5yrd9uOTQvc8SHKXqD9YRxTAZSzfmckTJHPS/alioyxdUqdRM1YOs9r8kbRs2FaEsXyXG82mdXelLNxceLyTS/qasP8mCn/UFnmc0gwP9embja9vHXIFnJwppfDaa9yYbV64rqPef4PKurKj3njkmb/UT5A=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=roeck-us.net; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=JfjgRhWM; arc=none smtp.client-ip=209.85.214.171
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=roeck-us.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="JfjgRhWM"
Received: by mail-pl1-f171.google.com with SMTP id d9443c01a7336-2bf1cda2b17so33383185ad.1
        for <sashiko-reviews@lists.linux.dev>; Tue, 16 Jun 2026 07:17:57 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1781619477; x=1782224277; darn=lists.linux.dev;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:sender:from:to:cc:subject:date:message-id:reply-to;
        bh=pw8Od8Q+di/221XzqoMhS7xpg4ZWfcBSLhhq2NaE2Rg=;
        b=JfjgRhWMxoGEK3BjpsPvH9TtDotepT22xdeJJ1Xy9qoxV88XQ2VFXiu0d5P+D2Y/s1
         NGk2vZMTXK8tHIqtiLSphiR3fwPDb82kcJgIWdrzDQNDBMjFfOBhsdLHjmWj14vB/bx5
         mWibFb8G120zaUNZKkCUdHZ10Ro1aJdsy4RFVHgcfsey/Ke+qB06T/jgpFQuQzkaR6z0
         I8+Ttfaf+zyCMXygxRKbOFQ+0rOLj7BWl+eek2uAsCpFI2VunRaGMyEkB8GZoHjxLu2l
         QIrM4QORy17Nv2af47p2c8AecTptlhsw0NFBhsFrVmpWegA+0xg2nL0jjD6FbjeYWkOS
         m5/Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1781619477; x=1782224277;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:sender:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=pw8Od8Q+di/221XzqoMhS7xpg4ZWfcBSLhhq2NaE2Rg=;
        b=XyONHVTchDWac//guJkNNOH1+lpWDKo7X022sCHQLF36Dh/ujteigAp/cxxkkKvae9
         ZxWQllQ5rE4QMzc7pdznGBcvsT2tPd8C3G0zWqKjqbdzCzXj+VdGxC1nFoK01XO+e4xc
         g3o2MaRaZ4zpDo3KEgBVW4CdngicXbvmrdyFq4BFrYr6zkoOV9Ke5wvqmFORiMCV8vQY
         y4hck1IUhC025B8/dpR9PalsUeuvGhtwGEWXZS+sHml2iSSLUsN+HMU6EOvTmkVDBdip
         6h0tRbkSCpNlPiaIsaoMux9jUJZFQS5c3xpldk0a62fxi6Etrx7n8HZuoRcp8Cgu8yBb
         z4zA==
X-Gm-Message-State: AOJu0Ywq6MlPFAAAdu6T4YelPDFQ+8s4q9qTmkNJ2KEjzAJqDFYUF75N
	HyiUqWWO8daXyjLY2Vx8S7uDaFQ3aMCRS6gpVpnf3t/ZWda1UdthD1Tpx5FyDOzW
X-Gm-Gg: Acq92OFGRVxLDybbUtOaOFjhxeHvHVbUiytcOjSfx08JInqeh5zxdwWB2rPlLAeo3BZ
	3y1E9zwCp9haClMFXMNNh7gXwoOEOtYpWikZROuTMaIQgmtJ4o/zcCzb1Dwp9XsZSzVCeTQFXoH
	lyEFAi/E48HBJWezISlKApCfApS/woYprpgErsys8Ny2zkhJouk/Xn7PKhQQOEMcnsOfBDlv7B9
	oL/U6avJ+PGoFLCprky0VVPNWkruBcBSneTqVeOAjF8/WBaF3oOYEXs8RsLSb6jQwfYRCo4PWLp
	0gnqDmxJJkDaDX0MaeFNFyJOo2AneD7ubXgaeYwmRUiyGkCx6Y0HtVE5ksZZvHSCO6T9ZPBXsWY
	zOZDeSK786u+SQjU1pRP2KxvJoXsNye+7oG6Bz3vubQK+hWJP+YPzrSkRKIHsP/cNCJn33EoZlP
	AsVjVZSC6DmeAFoSgCs1i6XkU6qMHGcD0erqIO+WdY/QdoL6Aq5nuMyakanKZdtvW7ebu6HTjp
X-Received: by 2002:a17:902:f546:b0:2bd:5ae4:26d1 with SMTP id d9443c01a7336-2c699b422d2mr36224865ad.17.1781619477444;
        Tue, 16 Jun 2026 07:17:57 -0700 (PDT)
Received: from ?IPV6:2600:1700:e321:62f0:da43:aeff:fecc:bfd5? ([2600:1700:e321:62f0:da43:aeff:fecc:bfd5])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2c4327aca78sm140547705ad.54.2026.06.16.07.17.56
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 16 Jun 2026 07:17:57 -0700 (PDT)
Sender: Guenter Roeck <groeck7@gmail.com>
Message-ID: <cb1a2434-456e-4ec1-96f6-640b5ffe011c@roeck-us.net>
Date: Tue, 16 Jun 2026 07:17:56 -0700
Precedence: bulk
X-Mailing-List: sashiko-reviews@lists.linux.dev
List-Id: <sashiko-reviews.lists.linux.dev>
List-Subscribe: <mailto:sashiko-reviews+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:sashiko-reviews+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 6/7] hwmon: adm1275: Support ROHM BD12790
To: sashiko-reviews@lists.linux.dev,
 Matti Vaittinen <matti.vaittinen@linux.dev>
Cc: conor+dt@kernel.org, devicetree@vger.kernel.org,
 linux-hwmon@vger.kernel.org, robh@kernel.org
References: <8ca875d21f2d9a4d53a87b47a5e6efab48266178.1781591132.git.mazziesaccount@gmail.com>
 <20260616065944.95FF11F00A3A@smtp.kernel.org>
Content-Language: en-US
From: Guenter Roeck <linux@roeck-us.net>
Autocrypt: addr=linux@roeck-us.net; keydata=
 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
 np3900V20aS7eD9K8GTU0TGC1pyz6IVJwIE=
In-Reply-To: <20260616065944.95FF11F00A3A@smtp.kernel.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 6/15/26 23:59, sashiko-bot@kernel.org wrote:
> Thank you for your contribution! Sashiko AI review found 2 potential issue(s) to consider:
> 
> Pre-existing issues:
> - [High] The driver compares the device-returned PMBUS_MFR_MODEL string using strncasecmp without verifying the returned length, leading to uninitialized stack memory reads.
> - [High] Multiplication of power and current coefficients by `shunt` overflows a 32-bit unsigned integer for larger shunt resistors.
> --
> 
> commit 8dff4bf5659b589eabe7fc876665de9339faae1f
> Author: Matti Vaittinen <mazziesaccount@gmail.com>
> 
> hwmon: adm1275: Support ROHM BD12790
> 
> Add support for ROHM BD12790 hot-swap controller which is largely
> similar to Analog Devices adm1272.
> 
>> diff --git a/drivers/hwmon/pmbus/adm1275.c b/drivers/hwmon/pmbus/adm1275.c
>> --- a/drivers/hwmon/pmbus/adm1275.c
>> +++ b/drivers/hwmon/pmbus/adm1275.c
> [ ... ]
>> @@ -581,7 +606,8 @@ static int adm1275_probe(struct i2c_client *client)
>>   	if (mid->driver_data == adm1272 || mid->driver_data == adm1273 ||
>>   	    mid->driver_data == adm1278 || mid->driver_data == adm1281 ||
>>   	    mid->driver_data == adm1293 || mid->driver_data == adm1294 ||
>> -	    mid->driver_data == bd12780 || mid->driver_data == sq24905c)
>> +	    mid->driver_data == bd12780 || mid->driver_data == bd12790 ||
>> +	    mid->driver_data == sq24905c)
>>   		config_read_fn = i2c_smbus_read_word_data;
>>   	else
> 
> [Severity: High]
> This is a pre-existing issue, but I noticed that just before this block in
> adm1275_probe(), there might be an out-of-bounds stack read:
> 
>      ret = i2c_smbus_read_block_data(client, PMBUS_MFR_MODEL, block_buffer);
>      if (ret < 0) { ... }
>      for (mid = adm1275_id; mid->name[0]; mid++) {
>              if (!strncasecmp(mid->name, block_buffer, strlen(mid->name)))
>                      break;
>      }
> 
> Does this code read uninitialized stack memory if the device returns a
> string that matches a valid model name prefix, but is shorter than the valid
> model name length?
> 
> Since i2c_smbus_read_block_data() reads up to 32 bytes into the uninitialized
> stack array block_buffer without appending a null terminator, strncasecmp()
> could read past the valid bytes returned in ret.
> 
> For example, if the device returns a shorter string like "adm12", checking
> it against "adm1275" up to the length of "adm1275" will continue reading
> into uninitialized stack bounds.
> 
> [ ... ]
>> @@ -685,12 +722,23 @@ static int adm1275_probe(struct i2c_client *client)
>>   		break;
>>   	case adm1272:
>>   	case adm1273:
>> +	case bd12790:
>> +	{
> [ ... ]
> 
> [Severity: High]
> This isn't a bug introduced by this patch, but looking further down in
> adm1275_probe(), could the coefficient calculations for current and power
> overflow a 32-bit unsigned integer?
> 
>      info->m[PSC_CURRENT_OUT] =
>          coefficients[cindex].m * shunt / 1000;
> 
>      info->m[PSC_POWER] =
>          coefficients[pindex].m * shunt / 1000;
> 
> If a larger shunt resistor value is provided via device tree
> (e.g., 200,000 micro-ohms to measure lower currents), multiplying this by
> larger coefficients like 30631 (used for ADM1293) evaluates to 6,126,200,000.
> 
> Since shunt is a u32 and the coefficient promotes to int, this operation uses
> 32-bit unsigned arithmetic.
> 
> Does this wrap-around the maximum 32-bit value of 4,294,967,295 and result
> in drastically incorrect telemetry scaling factors?
> 

Feel freew to fix (or not to fix) those problems. They should get fixed, but
not necessarily as part of this series.

Thanks,
Guenter


