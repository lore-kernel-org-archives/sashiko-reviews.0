Received: from mail-pl1-f176.google.com (mail-pl1-f176.google.com [209.85.214.176])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EB4E2221275
	for <sashiko-reviews@lists.linux.dev>; Mon, 27 Jul 2026 01:08:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.176
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785114504; cv=none; b=RIuUJ2NViYjoDF4QK1f1Kv1ur9dWMTuh+Pm2BctXlxjH++2Sdl0Ik/BMaktqE0rKDkJecrXEgJAgRclMw6kjvBV7PIWkpmE1xP4sh9QtIhqeOS0bQtbkanUyna4WdSm4Uk++J06S6lrDM0/6rlcL+SmGKem+1bsLcf3g08RR3pw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785114504; c=relaxed/simple;
	bh=4iWw43H4Dfdak3kFZoZER0jBk5rNsCuH4UMYVBnj1Jg=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=ssAQnJaufoA+fyoVIJt/rQ1GbIR0JQPnL3imS3ajgjzVB9RmBjOigEeXSqk7SYLX4hcTBP9KliuoYzRwFc59B+32KLGr2C+paU2A+QuZJhq+GhdIP7Sj1mkA1c75OVGVYDOBiQUdOCvcYKi4vyGn/DLb9XyGTffYCy1F0O8GKow=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=roeck-us.net; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=Ru2cTdFq; arc=none smtp.client-ip=209.85.214.176
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=roeck-us.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="Ru2cTdFq"
Received: by mail-pl1-f176.google.com with SMTP id d9443c01a7336-2cae1a3a744so15796005ad.3
        for <sashiko-reviews@lists.linux.dev>; Sun, 26 Jul 2026 18:08:22 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1785114502; x=1785719302; darn=lists.linux.dev;
        h=content-transfer-encoding:content-type:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:sender:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=6UCnWA3/qbb8vkzEIDjamjKBwxZEnFEYoC7NY7uCkUo=;
        b=Ru2cTdFqQu6osAkNYoySpdU71MCBfPqly7xrYzb5lHTCBbZ+uCJltKB0HAyHvBsiRf
         ecgmkpHJpPsNQbeQrI50K2EYAN+adlt/8XO3sVSqCJsFNtZtvD9aBIfoVBr+g1Na/dN0
         c/XN7H6SCHo2LRJJ5G9Sncq7BQQeoZ/L8oabZUce409tHeUrc19jNnR0T7Hz5ciK5wgz
         vLGMDCEvzFVpP3bnZriTeAHkLP5XjxvCMO3dkqyA/M2ZuVISJA/pIV2BZ87Az1IJGvoW
         KW1TqDSNvohItk+LPb5T//tda//f/cd71sbLihMspSc7EAlDICCjfVra382Ik5Os3J30
         JY+w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1785114502; x=1785719302;
        h=content-transfer-encoding:content-type:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:sender:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=6UCnWA3/qbb8vkzEIDjamjKBwxZEnFEYoC7NY7uCkUo=;
        b=ipnCFbk5n6aivb6/519ZgxyCBssC9jAZBUqPMs9kqEVibA/KSfKHwqOapPURLIVxDy
         W2QSo+abCmboeShL4z4RRpP+FcDDucUIFHX3y9mEpUu1BTbJnwYIF7DrfrMZ/cIrMpiV
         KpULCIazcF9plyxPQVIl/C7G6+PUQCq+7ytmlSZTBbFfDenzGpi6bdbf2AcSPiTmXv0V
         RCOwpX6M60NFSsQnbjQtCW3DBSBMJv66sla2lxSYV6xQXZiomHMEhaUnhEJyChiYQOPM
         iNFN7RXX1PGCjxVdTpzVx9Or7p5LjqlpJCSx5fgfTmHT6CvlrUJnh58Pd9EZ02YVfMmr
         Cyag==
X-Gm-Message-State: AOJu0Yxs6G7+gn4oXCiTwavZd3loIpvtDumx2SHC4jCoXKsC5ZrlVBzO
	CZndS6UU4KbwlQLvDIMA0kFzLC8BWZ3S9w9Y1Qtm7tzXiGbqbmWKPFFXQ4hR8g==
X-Gm-Gg: AR+sD13fDglxml+6eCK1IIjP5uVHj5ZJvIoqL77aoQtlg4u6omwEE5eatp5qikZ3RRd
	Nh+yNtWuobY+EBE+p/vli+wGy1bzgkNf4DH1y9mZ7ySexVgXOsPmk1BgPULoaom+1sIjBPr9gJB
	mNvHcmgIhqbV5ulnF9nGWV2nIsPIlrRGHRqFh6u4bLaMK6/iDzqgFKBgOgidFAQLX6zu29+7gy0
	XR9DhKX2vpd5T3Pr1UXaD2oGyWiofheSzSuKxBjoORWDjhYBYPzfPlWcTX/WFujZlEY4rjPRmP8
	+vPkZyNTnp6NrtvhMn42XEqs5ZDS5+rwQ01N16wVV5WyEakJWXl3ogTbIQN9Je+iwE4HarG10u6
	TqKyI4PbVqQLxz0do6/wFE6XyerhspMw7d5Q+eGOvv1rp3Numm0zW1Q3fws0szKtVdMMUTVPy7F
	+MR/ca4uhQOIB9Qbhv/8IE66Mbhl/bYiMqYPEjBpesZ0bQTGU605gC/GknJuUNwg==
X-Received: by 2002:a17:903:32c4:b0:2bf:9760:b94d with SMTP id d9443c01a7336-2cfde7ac5bfmr66610965ad.15.1785114502059;
        Sun, 26 Jul 2026 18:08:22 -0700 (PDT)
Received: from ?IPV6:2600:1700:e321:62f0:da43:aeff:fecc:bfd5? ([2600:1700:e321:62f0:da43:aeff:fecc:bfd5])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-314bc59e9fesm22773812eec.27.2026.07.26.18.08.20
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sun, 26 Jul 2026 18:08:21 -0700 (PDT)
Sender: Guenter Roeck <groeck7@gmail.com>
Message-ID: <2368bc26-634e-4691-a369-25090913ec50@roeck-us.net>
Date: Sun, 26 Jul 2026 18:08:20 -0700
Precedence: bulk
X-Mailing-List: sashiko-reviews@lists.linux.dev
List-Id: <sashiko-reviews.lists.linux.dev>
List-Subscribe: <mailto:sashiko-reviews+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:sashiko-reviews+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 5/8] watchdog: w83627hf_wdt: Add Super I/O
 configuration port as a platform device resource
To: sashiko-reviews@lists.linux.dev, Paul Louvel <paul.louvel@bootlin.com>
Cc: linux-watchdog@vger.kernel.org
References: <20260726-w83627hf_wdt-improvements-v2-0-3645a2a6c022@bootlin.com>
 <20260726-w83627hf_wdt-improvements-v2-5-3645a2a6c022@bootlin.com>
 <20260726185636.31D4C1F000E9@smtp.kernel.org>
Content-Language: en-US
From: Guenter Roeck <linux@roeck-us.net>
Autocrypt: addr=linux@roeck-us.net; keydata=
 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
 np3900V20aS7eD9K8GTU0TGC1pyz6IVJwIE=
In-Reply-To: <20260726185636.31D4C1F000E9@smtp.kernel.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 7/26/26 11:56, sashiko-bot@kernel.org wrote:
> Thank you for your contribution! Sashiko AI review found 1 potential issue(s) to consider:
> - [Critical] Claiming the shared Super I/O configuration port as a static platform device resource causes a Use-After-Free and breaks global mutual exclusion upon module unload.
> --
> 
> --- Patch [5]: [PATCH v2 5/8] watchdog: w83627hf_wdt: Add Super I/O configuration port as a platform device resource ---
> commit 7147d011852b779a7e376729ecb29c06b86e9282
> Author: Paul Louvel <paul.louvel@bootlin.com>
> 
> watchdog: w83627hf_wdt: Add Super I/O configuration port as a platform device resource
> 
> This commit changes the Super I/O configuration port address from a
> global variable to a platform device resource. It uses
> platform_device_register_resndata() to assign the IO resource during
> module initialization.
> 
>> diff --git a/drivers/watchdog/w83627hf_wdt.c b/drivers/watchdog/w83627hf_wdt.c
>> index 69d4230d8f6cc..a067b8ea6b289 100644
>> --- a/drivers/watchdog/w83627hf_wdt.c
>> +++ b/drivers/watchdog/w83627hf_wdt.c
> [ ... ]
>> @@ -594,8 +597,14 @@ static int __init wdt_init(void)
>>   	if (ret)
>>   		return ret;
>>   
>> -	wdt_pdev = platform_device_register_data(NULL, wdt_ids[chip].name,
>> -						 PLATFORM_DEVID_NONE, NULL, 0);
>> +	res.name = "Super I/O port";
>> +	res.flags = IORESOURCE_IO;
>> +	res.start = sioaddr;
>> +	res.end = sioaddr + 1;
>> +
>> +	wdt_pdev = platform_device_register_resndata(NULL, wdt_ids[chip].name,
>> +						     PLATFORM_DEVID_NONE, &res,
>> +						     1, NULL, 0);
> 
> [Severity: Critical]
> Does claiming the shared Super I/O configuration port as a static platform
> device resource cause a use-after-free regression and break mutual exclusion
> on module unload?
> 
> If this port is registered as a non-busy I/O resource, it becomes a
> container node in the global ioport_resource tree. When another driver
> calls request_muxed_region() for the same port, it might sleep on
> muxed_resource_wait while holding a parent pointer to this container node.
> 
> If the wdt module is unloaded while that thread is sleeping,
> platform_device_del() unlinks the container node and
> platform_device_release() frees its memory. When the sleeping thread
> wakes up, will it dereference the freed parent pointer in
> __request_resource()?
> 
> Additionally, it appears that unlinking the container node orphans any
> active child reservations from the tree. Could this allow concurrent
> hardware access to the shared Super I/O port?
> 

That makes me wonder: Under which authority can the watchdog driver claim
ownership of this resource ? What is the rationale ?

Why should the owner not be, for example, the hardware monitoring driver ?
Or the Bluetooth driver, if the chip has one ? Or some other driver ?
Or some non-existent Super-IO core ?

On a higher level, why even risk the problem outlined by Sashiko above ?
What is the benefit of doing this ? The patch description fails to
explain _why_ this change is made. Actually, that is true for many
of the patches. Quite often the description explain what is done,
but not the reason for it. The reason may be obvious for you, but not
or not always for me - and very much so for this patch.

Please explain why you are making those changes.

Also, I notice that at least in some cases it looks like you did not
address the feedback from Sashiko. Partially that is because problems
in one patch are addressed in a later patch of the series, but I am quite
sure I have seen Sashiko's feedback about the missing parent device
initialization before. Please ensure to address its feedback.

Thanks,
Guenter

