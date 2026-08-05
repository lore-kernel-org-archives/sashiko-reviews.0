Received: from mail-pj1-f43.google.com (mail-pj1-f43.google.com [209.85.216.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1DFD42931D2
	for <sashiko-reviews@lists.linux.dev>; Wed,  5 Aug 2026 02:51:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.216.43
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785898281; cv=none; b=I9j6ZAi2ObB0VifTLWhhnB8WL2zfF+SW0RB35bnZ8SSzz9KDwhgp35v3/iNKrrpwkB3fRWgrKdJIWTy/31Ik7g6JPb3eF4NjTIZeVnFnRR4lt2WAG3mMS4qhujXQr3xSj1MroFFtpKU6lLTR75/vgAtHt6p+9qySNKbE1S/JHrQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785898281; c=relaxed/simple;
	bh=7/2LB3Av9kHtvKKEFbTym3NGe/DZzLMld9p2wFxgLOk=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=EDG5AyGwCaU/b95epyOHN3JzaR4dABnii0E/z8Fr0e5QqhesdaCkxaWc8LN6ymIiAa7DMf15VjFL7z0hMXpAAQvf4gLjS6RQY/F9yJEahgofPg8cO+ON9ZgFvAouS+nNfshx8TpYBXtFzv0Bea4c44MsoJOYS4AgtrS4c0WdvY4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=roeck-us.net; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=gCW4JZsE; arc=none smtp.client-ip=209.85.216.43
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=roeck-us.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="gCW4JZsE"
Received: by mail-pj1-f43.google.com with SMTP id 98e67ed59e1d1-38deea72eebso399051a91.1
        for <sashiko-reviews@lists.linux.dev>; Tue, 04 Aug 2026 19:51:19 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1785898279; x=1786503079; darn=lists.linux.dev;
        h=content-transfer-encoding:content-type:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:sender:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=Hb7cpiF1haPDfic8xNq1MIp0OroCt8boGG/yMAW7dr4=;
        b=gCW4JZsE/R4S/jb1JyvlP5nl+kSk7hNNDd4Xz9asvEXMDSWyy6VSApLZOrKMTTlUuj
         PCoXgxjBhyj997SlYWHpgPupTujnZgZTgNNmz/Q/Tiz7yleDPgZ/24jXASgeFlH8+lmH
         ju5SsNKjCQkuUasErimSCV2HNi0AoqbbhZGx8SSKa674RFPhSG7pmN5J7p7Zco2LIR81
         QRxwij4SbPWfJDQEoRvaCKX3ArnFMBCwYmJMuTJFRan3mdYco/quRtWqqM3kPom0OiMM
         lPBRS80ZMUl1ZTCjy9+9RYfKKKH3WwUi5P5Y078HOIY99Cv7fjc4d+IuMoLJmUnpqZbl
         3AIw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1785898279; x=1786503079;
        h=content-transfer-encoding:content-type:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:sender:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=Hb7cpiF1haPDfic8xNq1MIp0OroCt8boGG/yMAW7dr4=;
        b=PUKlWsCDoBTIjnKyHdlykxnOScIylez+Ux5DuOQOyPqsOLT6rfEVFqWqhPM1vJS1V9
         SeM0dAvCpvXFK3vUeHrnl407zBgjKSaCSQzVNrHJpJ5CIDHrMfLioC8MApnJIv+qy2uU
         y1sPyIgtdbI0xx6C51eSHzyb/FcNXf7tAyDmvSa2S+fJYekUSgaEJP8qd1N9oC2ng2vX
         bKFj8Y/QfCu72lp3HkrZawuIrjqnVrTO8DYaDnlPQ/jmXYyMOWhXOi6UdIF8qry+4T5V
         fxPt9ts0WAR3podUHGBN8duCbvWACnozF2+s0qdceEmoCZct+ZWpTbpUOGKoFcmGB18C
         cvzg==
X-Gm-Message-State: AOJu0YyPOe22dE/eOWjxwHpAgtpGVewmSqhMmAoE0tMcHWwPd3QJQuaH
	6v/T2RZ44eVlcGYZ5DPIsAsBXAL1X/EODnhBSzxmilwgxEbOPmBWUTGHVQhKQg==
X-Gm-Gg: AR+sD13TcMRFok+LpsNgmDdAUOS2MjbQoTpLpDaBqRoDOCqYCXjBk/JkdV9FYLHhAwX
	ScXHgWw5n7bj4EB43HZwkiJ1LbW6YXcM/frazpdg5LS9mFEznToSxveaotLPH0geEr8HTvQg3zc
	v7+tx24ehUvIFRymZO8fR1iL9rT3bQ4qUWwIx5qt/uKXznisj0oMV3vOXKidF+iAWPyW1armKKq
	0rLovfNGGYpN4teqPwxibqtxor3YwPsRUzUFb4Dl/e2c1QvnzOKAhP1onWBtVV/9AH7VZWx2it1
	6vOFcWO6SNau5BWV5HGnXRmeBhXaD9QD33tp6GLCpuPRermWTITGkYZgzU2vsaEmLJcR0lZ21Mh
	Zf6z+KNAt9uWj/tg/wgQgXh1tJXJr+LeogC7LBqpKASEgbq5AF8uXL/7k9y0KoroJlZ3oPd4r36
	FAHNkrTgsWSBgtW0UVjk5QQkeYz39uIShr1GPlfHIIauaTyZArUWnJA5UtBzJ8vBSps11ujycun
	WxO8BVXF3MiFArGAKll7HdnvHEeH0EaWcLq4w==
X-Received: by 2002:a17:90b:2747:b0:37f:eafd:3505 with SMTP id 98e67ed59e1d1-3903c5588d4mr3503110a91.6.1785898279305;
        Tue, 04 Aug 2026 19:51:19 -0700 (PDT)
Received: from ?IPV6:2600:1700:e321:62f0:da43:aeff:fecc:bfd5? ([2600:1700:e321:62f0:da43:aeff:fecc:bfd5])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-38febffb2ecsm2792333a91.8.2026.08.04.19.51.18
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 04 Aug 2026 19:51:18 -0700 (PDT)
Sender: Guenter Roeck <groeck7@gmail.com>
Message-ID: <19d0921a-b09f-4af4-8e21-a4d31f09fa07@roeck-us.net>
Date: Tue, 4 Aug 2026 19:51:17 -0700
Precedence: bulk
X-Mailing-List: sashiko-reviews@lists.linux.dev
List-Id: <sashiko-reviews.lists.linux.dev>
List-Subscribe: <mailto:sashiko-reviews+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:sashiko-reviews+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] hwmon: (ads7828) Properly handle -EPROBE_DEFER from
 devm_regulator_get_optional()
To: sashiko-reviews@lists.linux.dev, Qingshuang Fu <fffsqian@163.com>
Cc: linux-hwmon@vger.kernel.org
References: <20260805020506.958722-1-fffsqian@163.com>
 <20260805021158.79FC71F000E9@smtp.kernel.org>
Content-Language: en-US
From: Guenter Roeck <linux@roeck-us.net>
Autocrypt: addr=linux@roeck-us.net; keydata=
 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
 np3900V20aS7eD9K8GTU0TGC1pyz6IVJwIE=
In-Reply-To: <20260805021158.79FC71F000E9@smtp.kernel.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 8/4/26 19:11, sashiko-bot@kernel.org wrote:
> Thank you for your contribution! Sashiko AI review found 2 potential issue(s) to consider:
> 
> Pre-existing issues:
> - [High] The driver masks genuine errors from `devm_regulator_get_optional()` by explicitly only checking for `-EPROBE_DEFER`.
> - [High] The driver fetches an optional external VREF regulator but never calls `regulator_enable()` to turn it on.
> --
> 
> --- Patch [1]: [PATCH] hwmon: (ads7828) Properly handle -EPROBE_DEFER from devm_regulator_get_optional() ---
> commit 78230277b5f05df9416cedbd8b4b4816183523e1
> Author: Qingshuang Fu <fuqingshuang@kylinos.cn>
> 
> hwmon: (ads7828) Properly handle -EPROBE_DEFER from devm_regulator_get_optional()
> 
> This commit explicitly checks for -EPROBE_DEFER when calling
> devm_regulator_get_optional() in ads7828_probe(). It ensures the error is
> propagated to trigger probe deferral, rather than incorrectly falling back
> to the internal VREF.
> 
>> diff --git a/drivers/hwmon/ads7828.c b/drivers/hwmon/ads7828.c
>> index 149cfcec78dcc..1c4a04cb023c0 100644
>> --- a/drivers/hwmon/ads7828.c
>> +++ b/drivers/hwmon/ads7828.c
>> @@ -133,6 +133,8 @@ static int ads7828_probe(struct i2c_client *client)
>>   			    vref_mv > ADS7828_EXT_VREF_MV_MAX)
>>   				return -EINVAL;
>>   			ext_vref = true;
> 
> [Severity: High]
> This is a pre-existing issue, but does this code need to enable the external
> regulator?
> 
> After retrieving the optional regulator, the driver queries its voltage but
> never calls regulator_enable() to turn it on. If the external regulator is
> not configured as 'always-on' in the device tree, the VREF pin will remain
> unpowered, causing the ADC to return zero or floating conversion results.
> 

This should probably call devm_regulator_get_enable_optional().

>> +		} else if (PTR_ERR(reg) == -EPROBE_DEFER) {
>> +			return PTR_ERR(reg);
> 
> [Severity: High]
> This isn't a bug introduced by this patch, but does this error handling mask
> genuine failures from the regulator core?
> 
> By only propagating -EPROBE_DEFER, legitimate errors from
> devm_regulator_get_optional() like -ENOMEM or -EINVAL are treated as if no
> regulator exists (-ENODEV). This causes the driver to incorrectly fall back
> to the internal VREF.
> 
> If the pin is physically connected to an external regulator, driving it
> internally could create a voltage conflict and lead to hardware damage.
> Should we check for -ENODEV to decide whether to fall back, and propagate
> all other errors?
> 

My point from the other reply.

Guenter

