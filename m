Received: from mail-dy1-f172.google.com (mail-dy1-f172.google.com [74.125.82.172])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CBDB72C235E
	for <sashiko-reviews@lists.linux.dev>; Thu, 14 May 2026 05:17:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.82.172
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778735851; cv=none; b=ELhHrvFzdf8eQh4caCVUQbqrAD4KGlFHmugvMl5zCxK2z0ISIPQYJQzkpN1HiY1aDXBlnZ8zgYzYDvDDCmcBGwt36eHIl4AZ0E+Hs+FmZcGQ9SoXsFknuo4+rsFzKtI0GEp0aXYYmgFDJsbWJYlQ/kjw3vfKfUAzBycGU+dwLeQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778735851; c=relaxed/simple;
	bh=+yrA+pG0I/dSz7fpzwQiNOOK+H+ExX8/eCT6i7SYtVQ=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=hMIZqlx/CBBwQ2+9N9pcswisMiI9lT/QYtiawq65C5PmInj49i2cTY+T/aumc3tweSf6wy/HyoEk6C8buDqANWnTChv42eSdtTySwlAJa+PP9tRFf7X2qL3pWN28QfrMv+vZEEpDe4Mpfoq+bv2NE5StgZc5w0DX0EIASh/zutw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=roeck-us.net; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=FoyjLToQ; arc=none smtp.client-ip=74.125.82.172
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=roeck-us.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="FoyjLToQ"
Received: by mail-dy1-f172.google.com with SMTP id 5a478bee46e88-3025d725a05so1282943eec.1
        for <sashiko-reviews@lists.linux.dev>; Wed, 13 May 2026 22:17:29 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1778735849; x=1779340649; darn=lists.linux.dev;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:sender:from:to:cc:subject:date:message-id:reply-to;
        bh=QY9dUZyhAciLJDOU3t/7DNHKq1hJHqqVlOT7yQkdLeY=;
        b=FoyjLToQBGR8XosDufgkz5jQ65Xy7fV4zv4EVi/0nE6TzQNUOuV0zkDc/YQY6opRKN
         3YjsJUa5XFps2MjnbBIilVEKN93uE2fy2Vp1Hg05Cw3KevPlEswXciZw64ctm6dskr1b
         p5Nthg21+eq15BUTFlZWRxJY8HcLzKTjowlpJZHYwy5cKk05KnWs7QhLphnzzhR38eFi
         0dsWXpzxCfYqvpc8ptR3iboKL362JsjCzXuYjSxAa30vQYd7kWaUpXBBLHLfC8BjaDc5
         jGPy4Np+NPXRdE0tNM7rhCMJYaj8XOiv2iWZrpAEgDjOFIwjxGfhoVgBsnGmVJSvLgcX
         zaPg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1778735849; x=1779340649;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:sender:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=QY9dUZyhAciLJDOU3t/7DNHKq1hJHqqVlOT7yQkdLeY=;
        b=ZgeilBotzYq+Deov59gEvLTbXfq+tx9DPMtI+zpRGwNRro2YDYhp8CQ47YRsBwACT4
         mpPGEzzlmCXRnUZs9MCLQo9mQ3VR0/HDLUaYCzeCvePSKcDq09WjiOtNCuMYKxog4VWl
         8YkqFZwm/Um2Kz8/XyCh1qNHWzi/+y7MZZMHbhNRrkxs5xYuadB0z9YXZH7NNc3q2B7e
         nTNRUzap5VwaaMSlf/QdoampnfaYupdh3ru5nW+59qNamOFHUTFFRZQRdnmOAaNSB/mC
         kssQPlrJMYsiVCuPH40xEVCnvk4ZZC298vgywwBb8biJtA4NH5v4gk9Us+8YdJhBBv4r
         oOHQ==
X-Forwarded-Encrypted: i=1; AFNElJ9L6NV5OtNodDd2Uh5fByQwEOdw3IM7kFJd6p9+NqZsu9fpwJ4ApjGDSY/+MLb0lZYY/sZYEXgQnmkXX9Vo3MQ=@lists.linux.dev
X-Gm-Message-State: AOJu0Yxoenr+gpG1H6s0TGUceZ5QU0fYmBaPJ3n8iNLqhNrbF4IpgNNs
	7jIJU3oeI6BqTOioeBFU7nd7EB0v+wXBkZzC0cSW6aXS3P6s9XRsRHxZU/jFaQ==
X-Gm-Gg: Acq92OEc499VxectLXUpn0eP7wxVhNN0czg01bdr4NWaJgs+o4U45ll8FaA2BbfK6OO
	PoExDlu0VhYgsVZc1t6yrlF4pJl71O+ToO2AyKqwiF7lkLRncBv8ey7Vhq3zDEcb/OeELDEGW4D
	T87Dq3t3HgIbdT3pS4yFtYGt2F6KUHw0Yr2Mm+mYOUuakD+kSIJG9MzdQFq3StIQnFPsSd8EEa4
	5uN6urVbcXhFyf1IAEQO3R+0/DgDxdraDJuHc2w9TUGZ1bxpDNZbxwoGXuZb+btI6h8qUrwEipF
	0QVCYDzjHMnsfo0XvMrmUfngkJsA95FmpKh5356eEeD2ZvX8hh7qMcroARdPyR8y+DANYzqbFTn
	K2tfXpez+/9XMU87/iFL/vuzHaD1DLeY1nA8DGvyJeKkejKFibixViA2bbOt4ZYoHa19yta/hB1
	/Uulr7tdIY9gtCfSh/fpW6SQD5A2R9zJ1a+zftEzBm9V2j+NVQEk/KTzJ7FuxjiLYqWV2ljMnL
X-Received: by 2002:a05:693c:2b08:b0:2f2:32bc:787d with SMTP id 5a478bee46e88-3011a661913mr4172772eec.23.1778735848686;
        Wed, 13 May 2026 22:17:28 -0700 (PDT)
Received: from ?IPV6:2600:1700:e321:62f0:da43:aeff:fecc:bfd5? ([2600:1700:e321:62f0:da43:aeff:fecc:bfd5])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-302973bc8ddsm1633828eec.21.2026.05.13.22.17.27
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 13 May 2026 22:17:27 -0700 (PDT)
Sender: Guenter Roeck <groeck7@gmail.com>
Message-ID: <388bb990-3df0-4eb4-983d-59c502397b8c@roeck-us.net>
Date: Wed, 13 May 2026 22:17:26 -0700
Precedence: bulk
X-Mailing-List: sashiko-reviews@lists.linux.dev
List-Id: <sashiko-reviews.lists.linux.dev>
List-Subscribe: <mailto:sashiko-reviews+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:sashiko-reviews+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 2/2] scsi: mpt3sas: add hwmon support
To: Louis Sautier <sautier.louis@gmail.com>, sashiko-reviews@lists.linux.dev
Cc: linux-hwmon@vger.kernel.org
References: <20260512214703.655633-3-sautier.louis@gmail.com>
 <20260514010209.5C3ABC19425@smtp.kernel.org>
 <106e2981-35a1-4559-ae20-2026c224f590@gmail.com>
Content-Language: en-US
From: Guenter Roeck <linux@roeck-us.net>
Autocrypt: addr=linux@roeck-us.net; keydata=
 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
 np3900V20aS7eD9K8GTU0TGC1pyz6IVJwIE=
In-Reply-To: <106e2981-35a1-4559-ae20-2026c224f590@gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit

On 5/13/26 20:39, Louis Sautier wrote:
> On 14/05/2026 03:02, sashiko-bot@kernel.org wrote:
>> Could exposing this read to unprivileged users lead to excessive firmware
>> requests and mutex contention?
>>
>> Since the sysfs files are world-readable, any local user can read them in a
>> tight loop. Every read directly calls mpt3sas_config_get_iounit_pg7(), which
>> issues synchronous requests to the firmware over the PCIe bus and acquires
>> the shared config_cmds.mutex:
>>
>> _hwmon_read() ->
>>      mpt3sas_config_get_iounit_pg7() ->
>>          _config_request() ->
>>              mutex_lock(&ioc->config_cmds.mutex)
>>
>> Does this allow an unprivileged user to starve other storage subsystem
>> components that rely on this mutex for administrative tasks or device
>> discovery?
>>
>> Could we implement a caching mechanism (for example, caching the readings
>> for a short period using jiffies) to rate-limit these firmware requests?
> 
> My initial implementation had a 1-second jiffies-based cache; I
> dropped it after seeing that drivers/nvme/host/hwmon.c follows the
> same no-cache pattern.
> 
> The cover letter's contention figure came from a less direct
> measurement and was too optimistic. I re-measured directly on
> ioc->config_cmds.mutex, hammering the sysfs temperature file from
> N concurrent unprivileged workers on a 9500-8i / SAS3816 while a

If you use a recent kernel, the hwmon subsystem serializes sysfs accesses,
so hammering it from multiple threads should not substantially increase
the back-end load. If you have 16 readers, 15 of them will wait for the
hwmon subsystem lock. All lock contention will happen in the hwmon core.

> separate "administrative" reader runs in the foreground. The same
> setup against the system's NVMe is included below for comparison:
> 
> hwmon: mpt3sas (/sys/class/hwmon/hwmon3/temp1_input)
> nproc: 16
> 
> baseline (no concurrent readers): p50=14.6µs  p95=18.9µs
> 
> Foreground reader latency with N concurrent unprivileged hammers:
> 
>    N   agg r/s   p50 µs   p95 µs   max µs
>    1     65244     38.0     60.2     60.8
>    2     57722     57.0     60.1    120.5
>    4     55026     90.8    115.5    152.9
>    8     53688    207.2    247.9    300.1
>   16     52188    345.8    390.3    444.8
> 
> hwmon: nvme (/sys/class/hwmon/hwmon2/temp1_input)
> nproc: 16
> 
> baseline (no concurrent readers): p50=268.6µs  p95=289.4µs
> 
> Foreground reader latency with N concurrent unprivileged hammers:
> 
>    N   agg r/s   p50 µs   p95 µs   max µs
>    1      3558    803.8    839.8   1008.3
>    2      3549   1342.0   1443.6   1558.7
>    4      3543   2154.8   2473.0   2756.6
>    8      3518   4130.9   4459.6   4677.4
>   16      3522   7394.6   8743.6   8804.3
> 
> Aggregate throughput is mutex-bound: every hwmon read takes
> config_cmds.mutex, so contention is bounded. The worst

It also takes a device mutex in the hwmon core.

Guenter

> foreground p95 I observed was ~8.5 ms at N=nproc=96 on the
> 9305-24i (below).
> 
> Across the other two test boxes:
> - 9305-24i / SAS3224 (nproc=96): mpt3sas baseline 31 µs, p95 at
>    N=96 ~8.5 ms; same shape, ~2x slower per read than the more
>    recent 9500-8i / SAS3816 above.
> - 9211-4i / SAS2004: no mpt3sas sensors reported, no hwmon
>    device registered, no contention surface (graceful-skip path
>    in the cover letter).
> 
> If a maintainer thinks the cache should come back to bound this
> independently of the attacker count, I am happy to re-add it.
> 

