Received: from mail-pl1-f181.google.com (mail-pl1-f181.google.com [209.85.214.181])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 475F439E190
	for <sashiko-reviews@lists.linux.dev>; Sun, 19 Jul 2026 14:58:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.181
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784473108; cv=none; b=bb8Wi1RRjtzpe35l6+LHzjMdPtclZQ+IUb7RhR210T9RrvHmiHKS9LpyfI0+jyh9493c6S5cTUnZO+/O+3lSO2qEa1Dhvu4fYPvNe0+8QTghK5QqeKfJchph+ae01MPFpInjLkDPJ/MKTe1SST0IVNOenGm08EwyTpqD/EHl2zE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784473108; c=relaxed/simple;
	bh=vIu51+UabEj+k31ihBNMoU3VBiRSMcsY9vtx33VG4tY=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=KAZGmyRz/+0VnjUDTbIC4Qt+7DbQ4PXsKquGYUp5holBKjozHc449wgLwKqjCV81tjMdraSgUdRcz2HSchX5MTidQOCpuYlqR/HCMDhI5MO7YA0QwZo14dLmYkjNfpCNn+j3rrH+INCWSD9Jo3t9Z3Un7pqUtxw6CQp9cNJFcIY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=roeck-us.net; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=EgX4G++k; arc=none smtp.client-ip=209.85.214.181
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=roeck-us.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="EgX4G++k"
Received: by mail-pl1-f181.google.com with SMTP id d9443c01a7336-2cacf197759so99451275ad.2
        for <sashiko-reviews@lists.linux.dev>; Sun, 19 Jul 2026 07:58:27 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1784473106; x=1785077906; darn=lists.linux.dev;
        h=content-transfer-encoding:content-type:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:sender:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=TuOWOYZJPqjblXYjLbi1DDIlFLJoew1zOivoY0LmtQM=;
        b=EgX4G++ktuybKUxFyZ4XD9A3QadFIXJUAwJNV9CVZ2cXubSBXUBTjgkT1HWOiePbbY
         NsjWBECwTmGJDPgPdrw4EcteltReIbK0EqcZiDx63i8UHjCFP2kfLzdZ3gHuEb7C/CsY
         olvLP/aLutNS1d1zIdhaZFm9pBp+5508o5W5T4MG6V7ls9iWDXc9RP8snDPA9/trOnQK
         bQwfXj6YyoBeaeL1euRjf2S/uHvo3IKThbe8fjhXjKVRgyHkPzfOzb0S4PyVT4WpuofQ
         Lh30YaMZWXmVCtDsGekSipnKdW9GXukiyLwDBWeyJIxi1BXoiFz3lfKNYOz854oLB/TM
         MWdQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1784473106; x=1785077906;
        h=content-transfer-encoding:content-type:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:sender:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=TuOWOYZJPqjblXYjLbi1DDIlFLJoew1zOivoY0LmtQM=;
        b=J05TVIYdJ+BByjLAQztJl1g+AyeM9MoLkA4XpG0cJmMWGihg0s0n6+Haci6mhm7Rlf
         w0pFwc+IpfpHq7httb90tgG5CrQtvwP/3sVvUMqX4Fkzmttjv3CiRWpedi/fFPSASShF
         AIh689DlYCNXJvb/kzMa9pYPcvpt8aeQDQ5PJoC7VrgBtiYRw/4rYdKWrhPTFbycgexm
         UKtztB/THLo29jQOhIMsDB9/PMAcT43hYFnjxHfoFT3mvZ9cU+1JQFXP5TeKPUrICwQS
         LvQSVqvOYrhHRNsLSZJTHFUxvxLx9mlxEgq7/2GmBUf1TYd3C07c/Hz1vxRPVEHOYYHQ
         2nHw==
X-Gm-Message-State: AOJu0Yx7Y5AVbJnc8qCiFmozm8hfOLkyLdNKd3uTxW8wtkYZ2UB4CvRJ
	SdC0/QLjhPFKehUEMtwrkwQz0h8J/wbt7ik9lURtipYO4Fh7mczWZOF5rspTgg==
X-Gm-Gg: AfdE7cmoeAk2+fCw8ehzztgq5eg5Z4oYNPWcXeYlhcaR9P8RFBLFfhmguK5GgRKSDtl
	uOxbungUSkY7DMF6TN/DGVdBW07yTo2kuSA0QKb7m655IFXeKIiP7YTVbXqyKIVb0CU6Tm1/tEF
	4cNbY8YA5a1BURw284hOfJhVwwCBxFTB2pP3ToyBD7BZxzUxE/XLndMpnnZ1w36dAMK9dnkGxvq
	1jIPlHsirb5FPeiglkEKK9DtZ7GEtD/sBRTLPaQ2Y2jHBFIOOArLTES6SxiAV0/IJcJy30VWhkz
	JSmNBmm6WhtB0RQuXYE9/NX20xlcE0l7S6l9PdCXkc3r0tah60e6HHk8VBEYEA18ZhbRW/npBn8
	u9fBnd7zWJ4nLBHSemDf2uv8QSLVZeHn1i7aqn7YQ33WlmttnP0axYO23HZBAo4C0PBaYuhZvqv
	uGEu9O64t5fp+MakSTZFNbzfht5mFSsPkLqWCht6ndEjk8ZErSQFk=
X-Received: by 2002:a17:903:380f:b0:2ca:4f33:e86f with SMTP id d9443c01a7336-2cf348456ecmr112818385ad.12.1784473106538;
        Sun, 19 Jul 2026 07:58:26 -0700 (PDT)
Received: from ?IPV6:2600:1700:e321:62f0:da43:aeff:fecc:bfd5? ([2600:1700:e321:62f0:da43:aeff:fecc:bfd5])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2cf344bd3aesm41488535ad.26.2026.07.19.07.58.24
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sun, 19 Jul 2026 07:58:25 -0700 (PDT)
Sender: Guenter Roeck <groeck7@gmail.com>
Message-ID: <417d6eac-409a-4b8e-995e-5ec8bdd62be9@roeck-us.net>
Date: Sun, 19 Jul 2026 07:58:23 -0700
Precedence: bulk
X-Mailing-List: sashiko-reviews@lists.linux.dev
List-Id: <sashiko-reviews.lists.linux.dev>
List-Subscribe: <mailto:sashiko-reviews+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:sashiko-reviews+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 3/4] hwmon: (kb9002) Add driver for Kandou KB9002
 retimer
To: sashiko-reviews@lists.linux.dev, Andy Chung <Andy.Chung@amd.com>
Cc: conor+dt@kernel.org, robh@kernel.org, linux-hwmon@vger.kernel.org,
 devicetree@vger.kernel.org
References: <20260715-kb9002-upstream-v2-0-2fd390383da5@amd.com>
 <20260715-kb9002-upstream-v2-3-2fd390383da5@amd.com>
 <20260715091724.18BC21F000E9@smtp.kernel.org>
Content-Language: en-US
From: Guenter Roeck <linux@roeck-us.net>
Autocrypt: addr=linux@roeck-us.net; keydata=
 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
 np3900V20aS7eD9K8GTU0TGC1pyz6IVJwIE=
In-Reply-To: <20260715091724.18BC21F000E9@smtp.kernel.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 7/15/26 02:17, sashiko-bot@kernel.org wrote:
> Thank you for your contribution! Sashiko AI review found 2 potential issue(s) to consider:
> - [Medium] The driver implements its own internal mutex for locking hardware accesses instead of using the hwmon subsystem's `hwmon_lock()` API.
> - [Low] The `i2c_device_id` array is initialized using a positional instead of a named initializer.
> --
> 
> --- Patch [3]: [PATCH v2 3/4] hwmon: (kb9002) Add driver for Kandou KB9002 retimer ---
> commit 59c6448090144292eb629f4257436694b1eaaa0d
> Author: Andy Chung <Andy.Chung@amd.com>
> 
> hwmon: (kb9002) Add driver for Kandou KB9002 retimer
>      
> The Kandou KB9002 is an 8-lane PCIe 5.0 retimer that exposes an SMBus
> target with mandatory PEC. Add a hwmon driver reporting the firmware
> aggregated maximum die temperature as temp1_input, with the firmware
> version and boot status under debugfs.
> 
>> diff --git a/drivers/hwmon/kb9002.c b/drivers/hwmon/kb9002.c
>> new file mode 100644
>> index 0000000000000..94c7d95b3fff5
>> --- /dev/null
>> +++ b/drivers/hwmon/kb9002.c
> [ ... ]
>> +struct kb9002_data {
>> +	struct i2c_client *client;
>> +	struct mutex lock;	/* serialises register accesses */
>> +};
> [ ... ]
>> +static int kb9002_fw_read(struct kb9002_data *data, u16 reg, u32 *val)
>> +{
>> +	struct i2c_client *client = data->client;
>> +	u8 addr[2];
>> +	u8 rbuf[I2C_SMBUS_BLOCK_MAX];
>> +	int ret;
>> +
>> +	put_unaligned_le16(reg, addr);
>> +
>> +	mutex_lock(&data->lock);
> 
> [Severity: Medium]
> Is this custom mutex necessary? The hwmon subsystem guidelines state that
> drivers should use hwmon_lock() and hwmon_unlock() to serialize operations
> for attributes registered by other means.
> 
> By using a custom internal mutex, does the driver bypass the standard
> subsystem synchronization architecture and introduce inefficient double-locking
> on sysfs reads, which are already protected by the hwmon core?
> 

Same question here. I do not see the point of this additional lock.

> [ ... ]
>> +static const struct i2c_device_id kb9002_id[] = {
>> +	{ KB9002_DEV_NAME },
>> +	{ }
>> +};
> 
> [Severity: Low]
> This isn't a bug, but does this array initialization bypass the I2C
> subsystem guidelines?
> 
> The I2C client initialization rules request that initialized arrays of type
> struct i2c_device_id use named initializers rather than positional
> initializers.
> 
Correct. Please fix.

Thanks,
Guenter

