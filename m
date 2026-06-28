Received: from mail-pj1-f50.google.com (mail-pj1-f50.google.com [209.85.216.50])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A193C314D18
	for <sashiko-reviews@lists.linux.dev>; Sun, 28 Jun 2026 15:12:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.216.50
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1782659540; cv=none; b=hbfKpz3yeVx2FidC88+7EozhH7SMzY8xoA3166u8ZYea7nWXSypyfxQ886NiwA5WIYoFOhn1M5KR7yBV65YPiHteS7LI8/Nd5KUGemEzGegOUuXHAyjC+Q4dFxCw1Yd2xlgAV0B9w2dipJ0wGi6yiADfYy6hyjfDchgmDvQ9cT0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1782659540; c=relaxed/simple;
	bh=2P/aUwtXPkyvmn4p6J87gCgO/v7UFz5QoiB5/07M8Gw=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=hE9ru6lDhOePmgDV154lf+jKDIA3+CUhFs2Pj++m/VD1+naA9vE2b2AsbPRtce4aXioImFiAp8OoyuxN0o7Neb1Fhzvw852NrGZwCmml9tdSBUfGT1BUTSoAzVMndyXfnM/TE/rGOqu3iqic5sZjkqpOpS0PG5hc5XU3EeA0OEA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=roeck-us.net; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=FCLguF6l; arc=none smtp.client-ip=209.85.216.50
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=roeck-us.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="FCLguF6l"
Received: by mail-pj1-f50.google.com with SMTP id 98e67ed59e1d1-37ff8e0ad0fso92910a91.2
        for <sashiko-reviews@lists.linux.dev>; Sun, 28 Jun 2026 08:12:19 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1782659539; x=1783264339; darn=lists.linux.dev;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:sender:from:to:cc:subject:date:message-id:reply-to;
        bh=RvUe9e7HlrQUYYe0kIx1JIDGEGNwplGbLQlZOabKyw4=;
        b=FCLguF6l/P5jPdHVtq2IxcWflw/ghOlOt2w9sohQXmAjNvDrUqxv2xo7rmnMSRNZpt
         ruxjBbAthM5+ZxNABaT/NVo4q1trO0vvN5aMsrRjHowaMLAtLLPcTi61v19lgy0+TtLq
         6PxmuCTdDeIOjE5AWYLvF68KhnOMtMLaGgGyCn5P72hmogbbgQq3MuX/Am3MErPwH7hb
         nJn/IisrM1moxdiMZh+ZJB11CvCJKX5E7Nn0z1zYXaSGXKKrhag4/+tbgPxptHKpNEWZ
         rSu4UC9EMcelqMFWrXUbOvfMrUBqpoRLydMUVPokozvMb7G8NJCsjY0bweyi1Aj4bwiy
         XxmA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1782659539; x=1783264339;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:sender:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=RvUe9e7HlrQUYYe0kIx1JIDGEGNwplGbLQlZOabKyw4=;
        b=OXaHHSIEznopdF8NqcEVPjbIjLZrYnw3a1SILlx3Lr7tRdssfQKtkfpdbm3SPdD/2o
         cVvfetLRkUZbekErkrRgcuXshlksi3g6PMPSAgzDhmWBSmIV2omWoB0wZ5R+SU+R4Rt2
         /TI6ajDUsx1deqPKBQgc8+DwPMyfBCQGJb+rQ/6S8bSu0+IG7FL5daLhYnMZXbfHFsrZ
         v16hgqxp88YiE9hX2XEuw94u3KMHjf1TF1/SCOSOr++ShausfQqwD/+FsO01br67Mi78
         a03lKiNbVM3yC1CILUC8ha+jOXYn5AZMkDPbBhiHOffkM9miZevkyrKjG7xcLNSVtQyo
         xOzA==
X-Gm-Message-State: AOJu0YwJ3Kwag7na98ZwIDlv/dSNzc+Qqnhn/6Mh3x8DZsAsbb9bj7UI
	hwZlC62mX7Dg+goVzM+1TxFXWXyEtXCYL3lq3dFqpIeu1evP7R6LDmUZal3RfA==
X-Gm-Gg: AfdE7cmpm0VCosi+8/65nvgS6xXgvHWUqu5G+3Zz3dqDD2e5EpfBonBdvSwdvau5TMQ
	8fWtTwnd/380OdHi5SIfCn+sjvcGQB82hk5UJ7drTqYgHcGrPN6b2BiwRHoUulMhCFdxVIrJUaY
	0sQpZFJ/6+hrOMy4GCv+yRzyTttKa0JrXXR1z5d6kgQ0/cFmF86O20u+otK8ruKvBUqHZf/yK0p
	vQNbmj4WZVnhsr3cAY5vmuxNAmAKSZS+5gW9N9H8Yjk9zZfGwraiA5vrv5GuAkbuAeRQIJlN8JP
	36T6Bck5xZ88aSbSQAepyQrfk1wDGBSfFw19a9iYteVOReeV3x2YQIzyXf0GarOJ+PQSXWb8xue
	UD/LYJ3BmkW4aRxsD8Smrq8aI1lmJxtpHYEqIWyuPDOozLIp1RWi/houmyLlWTobz1412Js9wNc
	J2gk1d37K0VJqLDsgWxWO+5KwbxennvgEvo3AD8/jPlrero8HAed/Y/Yy/+baa1g==
X-Received: by 2002:a17:90b:35cd:b0:37e:9e9:6ffc with SMTP id 98e67ed59e1d1-37e09e97428mr11060759a91.25.1782659538832;
        Sun, 28 Jun 2026 08:12:18 -0700 (PDT)
Received: from ?IPV6:2600:1700:e321:62f0:da43:aeff:fecc:bfd5? ([2600:1700:e321:62f0:da43:aeff:fecc:bfd5])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-37e1bd8309bsm4395098a91.9.2026.06.28.08.12.17
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sun, 28 Jun 2026 08:12:18 -0700 (PDT)
Sender: Guenter Roeck <groeck7@gmail.com>
Message-ID: <58920807-fbde-4a7e-b9bb-5a29be5ccced@roeck-us.net>
Date: Sun, 28 Jun 2026 08:12:17 -0700
Precedence: bulk
X-Mailing-List: sashiko-reviews@lists.linux.dev
List-Id: <sashiko-reviews.lists.linux.dev>
List-Subscribe: <mailto:sashiko-reviews+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:sashiko-reviews+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2] watchdog: lenovo_se30g2_se60_wdt: Watchdog for Lenovo
 SE30G2 and SE60
To: sashiko-reviews@lists.linux.dev, Mark Pearson <mpearson-lenovo@squebb.ca>
Cc: linux-watchdog@vger.kernel.org
References: <mpearson-lenovo@squebb.ca>
 <20260625174328.3339996-1-mpearson-lenovo@squebb.ca>
 <20260625175235.49B101F000E9@smtp.kernel.org>
Content-Language: en-US
From: Guenter Roeck <linux@roeck-us.net>
Autocrypt: addr=linux@roeck-us.net; keydata=
 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
 np3900V20aS7eD9K8GTU0TGC1pyz6IVJwIE=
In-Reply-To: <20260625175235.49B101F000E9@smtp.kernel.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 6/25/26 10:52, sashiko-bot@kernel.org wrote:
> Thank you for your contribution! Sashiko AI review found 1 potential issue(s) to consider:
> - [Medium] Incorrect error cleanup for a registered platform device leaves a zombified sysfs device.
> --
> 
> commit 728400a02a11a5d2e004ae6d02e2731670483271
> Author: Mark Pearson <mpearson-lenovo@squebb.ca>
> 
> watchdog: lenovo_se30g2_se60_wdt: Watchdog for Lenovo SE30G2 and SE60
> 
> This commit adds the watchdog driver implementation for Lenovo SE30G2 and
> SE60 platforms.
> 
>> diff --git a/drivers/watchdog/lenovo_se30g2_se60_wdt.c b/drivers/watchdog/lenovo_se30g2_se60_wdt.c
>> --- /dev/null
>> +++ b/drivers/watchdog/lenovo_se30g2_se60_wdt.c
> [ ... ]
>> +static int se_30g2_60_create_device(const struct dmi_system_id *id)
>> +{
>> +	int err;
>> +
>> +	se_30g2_60_pdev = platform_device_alloc("lenovo-se30g2-se60-wdt", -1);
>> +	if (!se_30g2_60_pdev)
>> +		return -ENOMEM;
>> +
>> +	err = platform_device_add(se_30g2_60_pdev);
>> +	if (err) {
>> +		platform_device_put(se_30g2_60_pdev);
>> +		se_30g2_60_pdev = NULL;
>> +	}
>> +
>> +	return err;
>> +}
> [ ... ]
>> +static int __init se_30g2_60_wdt_init(void)
>> +{
>> +	int err;
>> +
>> +	if (!dmi_check_system(se_30g2_60))
>> +		return -ENODEV;
>> +
>> +	err = platform_driver_register(&se_30g2_60_wdt_driver);
>> +	if (err && se_30g2_60_pdev) {
>> +		platform_device_put(se_30g2_60_pdev);
> 
> [Severity: Medium]
> Since the device was successfully added to the system bus via
> platform_device_add() in the DMI callback earlier, will calling
> platform_device_put() here just drop the allocation reference without
> removing the device from the sysfs hierarchy?
> 
> Should this error path use platform_device_unregister() instead to avoid
> leaving a zombie device on the bus that could cause collisions on a later
> module load?
> 
I don't understand this code either. The parallel platform_device_put()
on error in se_30g2_60_create_device() seems risky. Each of the Lenovo
drivers uses a different mechanism to register the driver and the device.
Why ? That just makes it more difficult to review the code.

Guenter

