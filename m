Received: from mail-pg1-f169.google.com (mail-pg1-f169.google.com [209.85.215.169])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4AF8F3A785A
	for <sashiko-reviews@lists.linux.dev>; Wed, 26 Aug 2026 21:38:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.215.169
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787780305; cv=none; b=CtnvMdWSAvpdUr7+1VWesj4Ku+me+nSzgGmhX92eVdcYPA8Wcsh+QBViF21BtHbmyJ/xVnvfAtzZ38Hc2RfQlIwzAkOSqhHaWEm80Nvfk15qinFGtwg3Ix/R7v+iRUKRIcnB4zX1Un5FVUMTof74NnqYm+/m9/U4AhPYYZxDjgA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787780305; c=relaxed/simple;
	bh=KJxiocFFulx1gyvaIva7hCGCdkW8RxYUKtNlSyCVR0I=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=bg8Sjx3MK77FAR4OwLYc60zWxDgjIAvZ730diY4LBTFocfS3wP6mhKF3LKY2uTY0ECUga2SbuTUxhAsB7uRf3YnkkQcmgIzbKF5MLONcoN06mMq2ogfjhCNFA+fcipaUSf/tXH0qB8YFlOiKyhKq65Y1zz5w9IwOSKCtewvY64c=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=roeck-us.net; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=MFblkIgG; arc=none smtp.client-ip=209.85.215.169
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=roeck-us.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="MFblkIgG"
Received: by mail-pg1-f169.google.com with SMTP id 41be03b00d2f7-cc1cc97b84bso39103a12.1
        for <sashiko-reviews@lists.linux.dev>; Wed, 26 Aug 2026 14:38:24 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1787780304; x=1788385104; darn=lists.linux.dev;
        h=content-transfer-encoding:content-type:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:sender:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=D8v0eLC3lqB1O4ht8TaGs8/rxS1/v9Xyd+T9SvWAlPQ=;
        b=MFblkIgGFjpUavOqtfCphj0wOOkg3yUrtG8/nAJqNsZDOQMncX2yh3vwzoQLj7VImz
         5Qr0eBV+6IJVUmBcOxMbE8iR7f47ToC4E8gzoPm2jzZfxf39ojF2AA6UeTnP0fDsfNaA
         NstbWsNoNN8vjvj7DDVRHwXDIncP378rFvl4zjwWMCfEL9xTbD0IQBKtHS051i0K1it/
         K2Cta1DU8Vi6oG0pycy6IhjPl+mB2lCp7D9T+/zUeuymBI9bUbTVDH91WgnRS+xqpROT
         tEzKeXx/ZejZUHtwu7KG75odSTCGMn6BqCwsr9opTwg3C5PUBQVSozUrPdfUXLeQZDfS
         Tyrw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1787780304; x=1788385104;
        h=content-transfer-encoding:content-type:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:sender:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=D8v0eLC3lqB1O4ht8TaGs8/rxS1/v9Xyd+T9SvWAlPQ=;
        b=R0G1MJr3qZ6jL92blBNtN0ZJam8KNdRkqYr4h5H2TNgUkB0/C5yGJtgxAKpX/oCoOr
         L4rPzqc2YBNqc8JlvZwYDGmxX2ZG3AZgJ0dwa8ZTvgg37+Ql0Te7TVZi3c9NUUFQuIoR
         GZ1M44J+r3Koq1ySf90TwVJlJGzH9lBdTgXbfEtPSrMBKkDAMMYfd+k83g+5rz+W8ffj
         uXz9cjDdOJx/WiiitVyXvThElKdszkqpsY2EQolSh+dXf7bHnbaruYn8DiBPa4Q2Lk4q
         5xipxoVHNceMVY3aW4L9d63vOrq4tevxwA29E+OSjjd0hfnqstnsMmL2xbQH2REsPm25
         DWpQ==
X-Gm-Message-State: AFuF++k3TBcxJxDg7wz1ARP61l9ubesA3Qn0Hj/V9ZfpiWmx1ejUozdJ
	jPOwkAWGFFKqkJLZp9ymm+bzjq4y5tqHrAQAs89QdpW7gkhUOCAuHhF4jssDyg==
X-Gm-Gg: AR+sD119kFkh/LLMDOIBSHCYOPy4/VTOpBC+7/sRou5nGR19jMaLJ4moVdzStaFu2FY
	pj5VMd6ehp8/xYm8EK3ywVzu2sEslN+mPhJiC5uaxCQT/tOMyN/652FYXrfcAdB0ZlKrXuvS7fJ
	jQC9vubWyf3A8DXnM6PyMLMa2LwX8Jt0UzZtr7blfOD52Om4ctD3g1kORWHan9N+EL7QRayb2/k
	Ql8XAWWdBhmT0yNktxNc3WxzyasL1slQBcNXGLp1v8X/wAp7E+iWSFDKRVYWCipCFzWm3apQV5g
	p97NyLrY54uQds9733sLZ+mGQI/x2hx9UM0sclY3GfKSXXvtAkzpvFHBCzbAQXZ1HVzPIo3UHuk
	eFLp04X8iuxTO8XpplEzyk6+at9AHdFyhn/FE9sjG3CRqrQBcXvb0DB1MgJhkTjX9QObtLXBhLk
	KB9LALBc3P0X4YSuV8Ii9YFyWlG0VeJz2wsiXq8+nDcneDlUXk+UqyQgRknfzWWS5Ok23lfevk2
	Ma0kdKhhDuSU7u9GZX7Jq63vOSFKm9gJg/DAQ==
X-Received: by 2002:a17:90b:380b:b0:366:3517:1aa2 with SMTP id 98e67ed59e1d1-3966d002fffmr19304395a91.0.1787780303532;
        Wed, 26 Aug 2026 14:38:23 -0700 (PDT)
Received: from ?IPV6:2600:1700:e321:62f0:da43:aeff:fecc:bfd5? ([2600:1700:e321:62f0:da43:aeff:fecc:bfd5])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-396686e8e74sm5737255a91.1.2026.08.26.14.38.21
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 26 Aug 2026 14:38:21 -0700 (PDT)
Sender: Guenter Roeck <groeck7@gmail.com>
Message-ID: <e942dc40-891f-4612-bbbb-2ff41fd88a24@roeck-us.net>
Date: Wed, 26 Aug 2026 14:38:20 -0700
Precedence: bulk
X-Mailing-List: sashiko-reviews@lists.linux.dev
List-Id: <sashiko-reviews.lists.linux.dev>
List-Subscribe: <mailto:sashiko-reviews+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:sashiko-reviews+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 3/8] watchdog: keembay_wdt: Convert to
 DEFINE_SIMPLE_DEV_PM_OPS()
To: sashiko-reviews@lists.linux.dev, Triet Hoang <triet.hoang.dev@gmail.com>
Cc: linux-watchdog@vger.kernel.org
References: <20260826060839.203297-1-triet.hoang.dev@gmail.com>
 <20260826060839.203297-4-triet.hoang.dev@gmail.com>
 <20260826061737.EF6B91F000E9@smtp.kernel.org>
Content-Language: en-US
From: Guenter Roeck <linux@roeck-us.net>
Autocrypt: addr=linux@roeck-us.net; keydata=
 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
 np3900V20aS7eD9K8GTU0TGC1pyz6IVJwIE=
In-Reply-To: <20260826061737.EF6B91F000E9@smtp.kernel.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 8/25/26 23:17, sashiko-bot@kernel.org wrote:
> Thank you for your contribution! Sashiko AI review found 1 potential issue(s) to consider:
> - [Low] The driver uses `pm_sleep_ptr()` for the `dev_pm_ops` structure pointer in the platform driver definition, which violates the strict subsystem guidelines mandating `pm_ptr()`.
> --
> 
> commit a755ace210f3814431fd01a8ffbd96e121f18dda
> Author: Triet Hoang <triet.hoang.dev@gmail.com>
> 
> watchdog: keembay_wdt: Convert to DEFINE_SIMPLE_DEV_PM_OPS()
> 
> This commit converts the deprecated SIMPLE_DEV_PM_OPS() to
> DEFINE_SIMPLE_DEV_PM_OPS() and wraps the PM operations pointer with
> pm_sleep_ptr(). This enables dropping the __maybe_unused annotations from
> the suspend and resume callbacks.
> 
>> diff --git a/drivers/watchdog/keembay_wdt.c b/drivers/watchdog/keembay_wdt.c
>> index 2a39114dbc641..9424ea4155f07 100644
>> --- a/drivers/watchdog/keembay_wdt.c
>> +++ b/drivers/watchdog/keembay_wdt.c
> [ ... ]
>> @@ -285,7 +285,7 @@ static struct platform_driver keembay_wdt_driver = {
>>   	.driver	= {
>>   		.name		= "keembay_wdt",
>>   		.of_match_table	= keembay_wdt_match,
>> -		.pm		= &keembay_wdt_pm_ops,
>> +		.pm		= pm_sleep_ptr(&keembay_wdt_pm_ops),
> 
> [Severity: Low]
> Is it correct to use pm_sleep_ptr() here for the dev_pm_ops structure pointer?
> The PM subsystem guidelines require using pm_ptr() for dev_pm_ops structure
> pointers, reserving pm_sleep_ptr() for the sleep callbacks themselves.
> 

The use of pm_sleep_ptr() for .pm is widely used in the kernel, but at
least Sashiko's guidance suggests that pm_ptr() should be used instead.
Please do that for .pm pointers.

Thanks,
Guenter

