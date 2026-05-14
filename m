Received: from mail-dl1-f54.google.com (mail-dl1-f54.google.com [74.125.82.54])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3CE7E319847
	for <sashiko-reviews@lists.linux.dev>; Thu, 14 May 2026 02:14:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.82.54
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778724900; cv=none; b=e8wkCIkznQOOxNkV2HvgHPFlnxUkW5aJu5lRC+tw0O1Gxen2bixC4Ledy8LFizPSmMTnFiF/q7rLkL+Nn+oOCdcL6l36adkPKyDAoGAfwQ7mFOAgSOYoFu5pDAZ/U0Kts1Xh5vSNMNTbyxYdSom6qEZSl1R8YFv+4u9CvH16CHY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778724900; c=relaxed/simple;
	bh=mLwa8hT48xikqr5alwbZvYtL+YPKEw0F1k3NSY7iBY0=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=F3aIrBJ7+T+158wlql1BRozmDIJnij5z0vPS8uvb95/oJ0oNiuNoQl7NPiJn2RzCX2aKtY+yl7vK42qmsa64TELCxZEzq5ahRUrDIEXWLsBznIGt1ay61nOTXpuMkfBrE7/Q4wsdUFFWUWoSaAZB/+7x9ZAn3IwCQIIoIC5Pgoo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=roeck-us.net; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=Ga+X1xMB; arc=none smtp.client-ip=74.125.82.54
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=roeck-us.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="Ga+X1xMB"
Received: by mail-dl1-f54.google.com with SMTP id a92af1059eb24-1335cb20406so211840c88.0
        for <sashiko-reviews@lists.linux.dev>; Wed, 13 May 2026 19:14:59 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1778724898; x=1779329698; darn=lists.linux.dev;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:sender:from:to:cc:subject:date:message-id:reply-to;
        bh=YFeSFQ5fWNanAAto4axcgqwLVs3s/DcV44ZRpfZXmiU=;
        b=Ga+X1xMBhhqJIJiHT1f9qzsVtwbrq0V7da9K4Nd75reJZH4k5Z2v5CuMVKKQUss0fN
         hEP4cFQQwHYfYJjOtfmu8jLsDTdCkr2sqakmzEC3C/Nuc2cmvkAuMoayXXA9vL4swOfz
         yZs3CMVFDbapXC8n9bg6pv5uBAfaEzyyhoXHbwBE78ecjeeO+hLTxHv/GU0uNnhWfMAw
         yaXORkOhp/vq5rfFQACEwsZJ1lbStgGtn2dRXgRKVqf7CNJlUcrKQ/QDMb4GS2crp4OZ
         +1cZzCTvGYGho2RtG4D9xwtJ78hUgH4J15ZnWXdTgqwIp9rzXx7anYDe87AhnOSvhqLB
         r8gw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1778724898; x=1779329698;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:sender:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=YFeSFQ5fWNanAAto4axcgqwLVs3s/DcV44ZRpfZXmiU=;
        b=Cto23YFFq5VeKC3GukcBVuizcM34bTXrIvAimE94X2zjnj5F09f1UdrTDNtdLmSvDR
         BJpmCrhazi/o3mGpeZVbZ/a3Wjmjk+Vc9nvkm09SuT5VCjG8PMZbkrV965te6YatI8tX
         OQA0iMxFZhnPCAcLMGLP2+x59WApbe4UFXXdlIIuzwbmgfE1ze0v97VRrNuc2eGJmB7D
         J6JDPR1fUioxcyYglz3HysqTJdxugXCxxAy3+HksC+7mVjeeNNFd4BxKHe1f3o36qNpk
         lRma+TqN7l5FP6046sG1iltwCTvVGs65+ZgnckH+g7kh4cJVrIjO8JFn2Ff3pO1dvsIl
         6LPQ==
X-Gm-Message-State: AOJu0Ywx5CgzZV0hgh6S1P+IS5QSjaoTI0+2wSNzgmpO+mSB3XtZceXa
	jp98BkzH5D6R4BcOwv5XvcgrhLidSPLZ9fgs1RYC4BLBbEaBjFVjENooVBn1CQ==
X-Gm-Gg: Acq92OHUWanucz8V8cFPNTm+jy1aysz0G1EomMkKSDZ83btQFhVGRnuA2/aNT6PWT+i
	OOkIxUFcblMaBdznLp187YGD7WaPQnI59Ig0QB1+fSI/d6JEfpyEI4al7xUoxcZK7+fqWYlW85g
	D2SH6TAHAE7JlY5Tu9xJYQyOI2d/xfFczo0lnfkbojStquXtdm7fk6TxR0zs0YMAlAtqBQPNGOa
	56GWhiiXpKmnznUGkZBQJ0HG8vDsYQqJ17WQIx72guCXdoIhA4Srs5UjjJ/xlWe57qKjFNA/afv
	28phuJDdiqfw2EOK8ymdRm0vj4ym1yCY3rHEYxFFPv5wLr2PiM+ewKAP8Ivl4HMa1yCTVnOCLtu
	y4Mj89wwV8QcAsSS0fXCYKLXHMVkcx8vr0XfyGtKC+WWPwYG+xB35O9fjkKq+YB+LoBzdUNVno1
	sIHmTVKyKmVDWbVWDUNMtg0wcG6LBZasNAlUAYyWg7XoazQvHfdWGvy3/iLV2Uc6GfEwervBue
X-Received: by 2002:a05:7022:2605:b0:12a:68cc:3efb with SMTP id a92af1059eb24-13436682901mr3723291c88.16.1778724897922;
        Wed, 13 May 2026 19:14:57 -0700 (PDT)
Received: from ?IPV6:2600:1700:e321:62f0:da43:aeff:fecc:bfd5? ([2600:1700:e321:62f0:da43:aeff:fecc:bfd5])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-134cf44668asm1498825c88.6.2026.05.13.19.14.57
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 13 May 2026 19:14:57 -0700 (PDT)
Sender: Guenter Roeck <groeck7@gmail.com>
Message-ID: <69b9cc9b-1336-4093-8fd0-e1816e038926@roeck-us.net>
Date: Wed, 13 May 2026 19:14:56 -0700
Precedence: bulk
X-Mailing-List: sashiko-reviews@lists.linux.dev
List-Id: <sashiko-reviews.lists.linux.dev>
List-Subscribe: <mailto:sashiko-reviews+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:sashiko-reviews+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3 4/5] hwmon: (pmbus/adm1266) replace probe-time RTC seed
 with rtc_class device
To: sashiko-reviews@lists.linux.dev,
 Abdurrahman Hussain <abdurrahman@nexthop.ai>
Cc: linux-hwmon@vger.kernel.org
References: <20260512-adm1266-v3-4-a81a479b0bb0@nexthop.ai>
 <20260514015706.D7E91C19425@smtp.kernel.org>
Content-Language: en-US
From: Guenter Roeck <linux@roeck-us.net>
Autocrypt: addr=linux@roeck-us.net; keydata=
 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
 np3900V20aS7eD9K8GTU0TGC1pyz6IVJwIE=
In-Reply-To: <20260514015706.D7E91C19425@smtp.kernel.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 5/13/26 18:57, sashiko-bot@kernel.org wrote:
> Thank you for your contribution! Sashiko AI review found 1 potential issue(s) to consider:
> - [Low] Missing Kconfig dependency on RTC_CLASS causing potential build failures.
> --
> 
> commit f54ef3c53db957606d5afd59cb615359c244ece4
> Author: Abdurrahman Hussain <abdurrahman@nexthop.ai>
> 
> hwmon: (pmbus/adm1266) replace probe-time RTC seed with rtc_class device
> 
> This commit drops the probe-time seed and adm1266_set_rtc() entirely. It adds
> an rtc_class device whose read_time and set_time callbacks read and write the
> SET_RTC frame to expose the time stamp policy properly.
> 
>> diff --git a/drivers/hwmon/pmbus/adm1266.c b/drivers/hwmon/pmbus/adm1266.c
>> index 080e7dbd0c069..05b31bb08f38c 100644
>> --- a/drivers/hwmon/pmbus/adm1266.c
>> +++ b/drivers/hwmon/pmbus/adm1266.c
> 
> [ ... ]
> 
>> @@ -517,21 +517,73 @@ static int adm1266_config_nvmem(struct adm1266_data *data)
> 
> [ ... ]
> 
>> +static int adm1266_register_rtc(struct adm1266_data *data)
>> +{
>> +	struct rtc_device *rtc;
>> +
>> +	rtc = devm_rtc_allocate_device(&data->client->dev);
> 
> Could this introduce a build regression if CONFIG_RTC_CLASS is disabled?
> 
> The patch unconditionally adds calls to RTC subsystem functions like
> devm_rtc_allocate_device() and devm_rtc_register_device(). These functions
> are implemented in the RTC core, which is governed by CONFIG_RTC_CLASS.
> 
> There are no fallback stubs in linux/rtc.h for these allocation functions
> when the subsystem is disabled. Does CONFIG_SENSORS_ADM1266 need a dependency
> on RTC_CLASS in drivers/hwmon/pmbus/Kconfig to prevent unresolved external
> symbols during linking?
> 

That would be unacceptable. The driver has to work on systems with no RTC.

Guenter



