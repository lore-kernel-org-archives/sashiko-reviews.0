Received: from mail-dy1-f178.google.com (mail-dy1-f178.google.com [74.125.82.178])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 95F0833CE80
	for <sashiko-reviews@lists.linux.dev>; Wed, 20 May 2026 05:03:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.82.178
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779253433; cv=none; b=Vog2qDwx7lYN9InNxaNUUqDtcMNWYQi/eE02LqoKXWZ9eptkQ8NwPwFplSTzULusdtpngnG55jjt7mbT1NUe2yX9+UO7QMbfNncFRROYIbGSakzfJGB2xigPmrPntug1iUeeoshVZZq6PGg0wJeIORrPaFTubShc7/0MJrDanBY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779253433; c=relaxed/simple;
	bh=XY3uf602Ba/C4DeV0TBm7ywPL/0eDoa92sLY3bgPT5s=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=riBGpa3Mqs+k4bBuZxXiTq68fr4ZkBH5uY/a+x2M7qx1J6qG+Unxcn1TxAXtNf9pI3yTvePXuPnWhOHSiNPxr7mTLmvUEnKMaK9h0IEag92pG9vFxZ1VPG5xIl7pNInEIZxW3xPvMXcZvtHuRp6fodS8P3YJjSh4Mf9m22z58x8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=roeck-us.net; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=jHREHdX+; arc=none smtp.client-ip=74.125.82.178
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=roeck-us.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="jHREHdX+"
Received: by mail-dy1-f178.google.com with SMTP id 5a478bee46e88-303dbfbec77so4255003eec.0
        for <sashiko-reviews@lists.linux.dev>; Tue, 19 May 2026 22:03:51 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1779253431; x=1779858231; darn=lists.linux.dev;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:sender:from:to:cc:subject:date:message-id:reply-to;
        bh=owrf94ddYwaqYEgNfgCjoUKkkvN+uo9vnxJR4lLBfXQ=;
        b=jHREHdX+W8OR1DBBwakTPLagZiIWDiF7O413XeQOzQ//5PRAQRVzm08LLMGfHN4cU7
         4+mqOtcmOTgxuAGXYexLmB2fQT/FV/Bzp0+nbMEXKC93rYkSm2JPrCOQWi1l+7N0uYPV
         HWA/qnJZXZL+fTtStHvaQYRpxdjFpr1iuv1t5TcHhw1LNPC3z54GJhEBMYx2DmgXGlBe
         cX3re7zJeBeYSKfPZM73QqgWCtdUA9MaF9rLYkSVTF6ni945j5gPrkg2WMAlZ2BGSZK/
         0BdHlD3pJ8YAmxhyqHzevMl7K7FAuGDg/yzCextV1SEh2w8gXca5sW0QaUTgEAzlLfq7
         W7uQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1779253431; x=1779858231;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:sender:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=owrf94ddYwaqYEgNfgCjoUKkkvN+uo9vnxJR4lLBfXQ=;
        b=SzBGYIIpiammbsn90TsyJu3dQfQGK2jwQK+o0miGOJmqQOVvHZT/Z6JIuNrZJi/vgc
         DrBIFh/xgSkKaIYsN01/nINZDzymW6C83gYe/jXt4tT5/JILOBc4LQP5YcayQ4IPfSf1
         L9psKhvc1swEzl2MD0UAmKjOH5+aTQ8zzwILeZBvGev4+J8cHnBr5T0Eh+Bk1OxUFl4J
         3Ltf2x2QI28NqXVE425VoRuCUvecesz+gxWxnXxKoPY92u5SyTdl62pCtXYoit74w+ya
         0asK5Giu4f1ua2G6gLfRByZVOwzAicENe/XP3TynU/pVwTNxB28jXScu6ECRcBuUL6dy
         p00w==
X-Gm-Message-State: AOJu0Yxg93xIlqHo0UjX+rehR6oPhFTKI966b3909CaOL6k9yghzuca9
	MbhDGGkX6ruijG4T0tGhMYxAAGQ2b8qhgSkPylhHlOApbRlbGMKs5A8DSamagEv9
X-Gm-Gg: Acq92OFEhKzArl9gYPNrE8iTaFB3U4Xdhu91hL3xtFXePPwiVoUGHhWDgCVw7C0g2pK
	QEK/Qnm4Db4SzsV79sZaYhJnjRBVYzsH/F6z21uq6NngIFDHs3fqxCBn8l8BVXtZA9rEXgnPwGw
	TmdisbXDRBPSiC0B33QWNxbGROErIfk23oT0kAuHAnw8A1n1FjdvQlVRuitbxlBEfHcc4vQamtZ
	B9jCNT96QhMEhdWgInCybxflJTuuCsQ+i6kFcaN/lBzNzAjCo8HqPD/3jHVhKKGSJ+TISJVimtx
	5rlPevP8IDW6QVw37eTbUILTorprxrcefSct5xnzjoAKPRha+U/Rup/82L5IVuFR1fHU9Y34juU
	h6sWaS4LGIfShPmnTzJgDa6/Jxzcqm+mvPndERMpo6J9fkq5Bxg9GTaXjnrOyg+ufjFGctljx9S
	rh4C/F24IjQSZNVdPDxJXASIgNRMTWsJZsmkxh87F8r+RwWhQ4ZnRe5f2T9tEYSnIErQMlw8RN
X-Received: by 2002:a05:7300:d08f:b0:303:f2fc:c483 with SMTP id 5a478bee46e88-303f2fd1799mr2990674eec.1.1779253430519;
        Tue, 19 May 2026 22:03:50 -0700 (PDT)
Received: from ?IPV6:2600:1700:e321:62f0:da43:aeff:fecc:bfd5? ([2600:1700:e321:62f0:da43:aeff:fecc:bfd5])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-302973bc9d4sm17552282eec.23.2026.05.19.22.03.49
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 19 May 2026 22:03:50 -0700 (PDT)
Sender: Guenter Roeck <groeck7@gmail.com>
Message-ID: <58352b37-a87a-49f0-ac89-da226f2266dc@roeck-us.net>
Date: Tue, 19 May 2026 22:03:48 -0700
Precedence: bulk
X-Mailing-List: sashiko-reviews@lists.linux.dev
List-Id: <sashiko-reviews.lists.linux.dev>
List-Subscribe: <mailto:sashiko-reviews+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:sashiko-reviews+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 1/2] hwmon: (lenovo-ec-sensors): Convert to
 devm_request_region()
To: sashiko-reviews@lists.linux.dev, Kean Ren <rh_king@163.com>
Cc: linux-hwmon@vger.kernel.org
References: <20260520022946.17335-2-rh_king@163.com>
 <20260520025130.DB45A1F000E9@smtp.kernel.org>
Content-Language: en-US
From: Guenter Roeck <linux@roeck-us.net>
Autocrypt: addr=linux@roeck-us.net; keydata=
 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
 np3900V20aS7eD9K8GTU0TGC1pyz6IVJwIE=
In-Reply-To: <20260520025130.DB45A1F000E9@smtp.kernel.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 5/19/26 19:51, sashiko-bot@kernel.org wrote:
> Thank you for your contribution! Sashiko AI review found 1 potential issue(s) to consider:
> - [Medium] The commit message inaccurately claims to remove five `release_region()` calls and drop unnecessary braces, but only four calls were removed and the braces were left intact.
> --
> 
> commit e8c1e48be4d237988380d2577325024d4865618f
> Author: Kean Ren <rh_king@163.com>
> 
> hwmon: (lenovo-ec-sensors): Convert to devm_request_region()
> 
> This commit replaces manual request_region() and release_region() calls
> with devm_request_region() to allow the device-managed framework to
> handle the I/O region lifetime automatically.
> 
>> Remove all five manual release_region() calls that are now handled
>> automatically, and drop the unnecessary braces on the single-statement
>> blocks that previously contained them.
> 
> [Severity: Medium]
> Is this description accurate? The patch diff shows that only four
> release_region() calls were removed.
> 

As far as I can see there are only four calls in the code. Description
problem ?

>> diff --git a/drivers/hwmon/lenovo-ec-sensors.c b/drivers/hwmon/lenovo-ec-sensors.c
>> index 8681bbf6665b1..45db49e189d3d 100644
>> --- a/drivers/hwmon/lenovo-ec-sensors.c
>> +++ b/drivers/hwmon/lenovo-ec-sensors.c
>> @@ -541,7 +541,6 @@ static int lenovo_ec_probe(struct platform_device *pdev)
>>   	    (inb_p(MCHP_EMI0_EC_DATA_BYTE1) != 'C') &&
>>   	    (inb_p(MCHP_EMI0_EC_DATA_BYTE2) != 'H') &&
>>   	    (inb_p(MCHP_EMI0_EC_DATA_BYTE3) != 'P')) {
>> -		release_region(IO_REGION_START, IO_REGION_LENGTH);
>>   		return -ENODEV;
>>   	}
> 
> [Severity: Medium]
> This isn't a bug, but could these curly braces be removed? The commit
> message mentions dropping the unnecessary braces on the single-statement
> blocks, but they appear to have been left intact here.
> 

Hmm, yes, the description does not match the code changes. Please drop
the now unnecessary {}.

Thanks,
Guenter

> [ ... ]
> 
>> @@ -607,7 +605,6 @@ static int __init lenovo_ec_init(void)
>>   				       lenovo_ec_probe, NULL, 0, NULL, 0);
>>   
>>   	if (IS_ERR(lenovo_ec_sensors_platform_device)) {
>> -		release_region(IO_REGION_START, IO_REGION_LENGTH);
>>   		return PTR_ERR(lenovo_ec_sensors_platform_device);
>>   	}
> 
> [Severity: Medium]
> Could the braces be removed from this block as well, to match the
> description in the commit message?
> 

