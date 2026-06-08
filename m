Received: from mail-pl1-f174.google.com (mail-pl1-f174.google.com [209.85.214.174])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 00321347BD9
	for <sashiko-reviews@lists.linux.dev>; Mon,  8 Jun 2026 03:11:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.174
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1780888295; cv=none; b=KQ+bUDE1xeG0+veSGEyXn3Z4vQKzDZx1MsGCt8yLEUrOHHiWWSUIQ7AqjGubVtX8xR8/T5F5B33VJVif+KYp8XMRSO9ZdiYSUr/MU/rxZUJK23NCImznhGEaymtQ3WsdgP8TagmDRazP/CasSzY0pq0cdaLsZG3yTXBu0MJzo18=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1780888295; c=relaxed/simple;
	bh=eMMFZ7PoTVFU+HtZAfAiBJKr6ct6C46CfD1rFsryOhY=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=gXddmjo1AH8cJ97nkT65Q9G6TNEbawdI6fnDtKSq9d2zebLxv/Y97XyfReMwMDt9b8A1zUNLJM/seRXSTxGeUTrcVgDGcHjC7UTv3byxm8LnozFLAmjkzFhenGqw2m+QBc35hkF0mhHqmHfKNR6j+wos4C8eKK+aveRBSHj+kO8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=roeck-us.net; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=QneXjYav; arc=none smtp.client-ip=209.85.214.174
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=roeck-us.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="QneXjYav"
Received: by mail-pl1-f174.google.com with SMTP id d9443c01a7336-2c0c1e0d00bso37619255ad.0
        for <sashiko-reviews@lists.linux.dev>; Sun, 07 Jun 2026 20:11:31 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1780888291; x=1781493091; darn=lists.linux.dev;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:sender:from:to:cc:subject:date:message-id:reply-to;
        bh=o6AQpyw9cz+Q5RmbdlhznksmZIhCHg9E+Gub5iwssz8=;
        b=QneXjYavVx/vbrvsg214hIcf4Kuv/nr+duqJpM+SSnNpH/yuQj6XrFwAuX2FMRBEFS
         sXEk89Op5wpLw0WvA+3T61rQKd/k9dXOakNoPWu3kA0hXaJnFFt2UjEZiQt3btle2SZa
         t8iG5NwshSpG6U8GWl4hSyqXkZ3WTDVA2sbuVu7Sv8c1IhIWw4t3AXDbpvoB5tHOP562
         cYHg9wTEmMEzT0leoFTn+Caznti6T6G7CMoX+JI41gpPLltyuPTQuH1fy1oKCtoq/giR
         ChulnL0YN1aOGovQ5ybFUGTv7BmHRNlncAAE5F7lRBDK6cKSbzKBW7b7q6mnkQ27Ks0A
         hdCw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1780888291; x=1781493091;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:sender:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=o6AQpyw9cz+Q5RmbdlhznksmZIhCHg9E+Gub5iwssz8=;
        b=dqhdCVYVdvh4ddYvtOK5FY3+ipU0sSeAkwB9PQsbAHxrcKWb/S0QjsAltzJMOBMnH+
         iCrM65lOU6raNRZf+1YaEqGJ3GpWehWetM9EgdtEizkT9P25LO9mwZCq+dkefmx1Mrob
         59aSxkP/pxuQTCA13P/NP7xnsIgsS4hN0OpASOmjGdWtQkWNeFm5M07QgBnYj2+sId6g
         vN1NmTifarq8L2Q42HO2nsaSJ8dQ24NCVFGtxWnIxigjLwyDLiSzJfv5i9Hcj8V/prDB
         x6Ej0wpKgQL8x4Y4VxM03uSCwe68Bb3qRWgTQi0heZceCbMmMa+h7vJYWWreDsmBsmDO
         2uBg==
X-Gm-Message-State: AOJu0YyXzjz8p4EHItxvSqYKwGpTrkHFkKck35BOaNmSMt5HD/h8ca2W
	cgaSCdsdGGG7PMSHiS0sswWv2fXHhKqKT2rHiDRl9MxqhROIDllGJwW/rNVpzAdh
X-Gm-Gg: Acq92OG9uzes3Qe2K9dwHxCvlvLN4VxxI4LF+vwbGMWTSi8TwWIf9JPKKmcDX2cEU0g
	8MjAjE24um7yIbuevGP828XaXPQCiSImZ6GrJS6OHUosBr6eHYbe3u6ssw1npYqoe3ZhIAjHuRZ
	liByC6zFQNFczz0RBa971oO5/ZVUSMvrxtQXBjd/alPdbYIh5vKdC0dJ/uWE6AAcKU0JX+WWab4
	eKHzD7tzeW4fF4Y0BpxgGMnvf4D7MfaNc+p3WsuMWLND1ZUl+IhC+XZB8YpRRumGXWleO+dUdUv
	pSqyPcE/e+Nd/K5uDuij9MRlnmiWZkx5WeiWAD4M45FtvEU10ZOJRLRXDPV7Ga7YZSDofFGq4sU
	t0DJGnyNnddzgr208du4I5/lQUWsFgE/w/k3BgL4QiCZCPIUCqdoT2/kCgaUJCT+zgbcBQfSNjK
	afXRCWjF4IKujzK0ZNS78rE8XCbT8kLDR6VMV+bnlBbihJi6u5TTsPGEekuSCN9OTiKFMYEpKGj
	shzK36Uqqw=
X-Received: by 2002:a17:902:f711:b0:2c0:ab82:6ba7 with SMTP id d9443c01a7336-2c1e85ad8d7mr154959505ad.33.1780888290954;
        Sun, 07 Jun 2026 20:11:30 -0700 (PDT)
Received: from ?IPV6:2600:1700:e321:62f0:da43:aeff:fecc:bfd5? ([2600:1700:e321:62f0:da43:aeff:fecc:bfd5])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2c164f6d395sm218827905ad.17.2026.06.07.20.11.30
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sun, 07 Jun 2026 20:11:30 -0700 (PDT)
Sender: Guenter Roeck <groeck7@gmail.com>
Message-ID: <3ed9e0ed-d6fe-4b9f-aca9-590290a78f4a@roeck-us.net>
Date: Sun, 7 Jun 2026 20:11:29 -0700
Precedence: bulk
X-Mailing-List: sashiko-reviews@lists.linux.dev
List-Id: <sashiko-reviews.lists.linux.dev>
List-Subscribe: <mailto:sashiko-reviews+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:sashiko-reviews+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 2/2] hwmon: (adt7462) Add of_match_table to support
 devicetree
To: sashiko-reviews@lists.linux.dev,
 Romain Gantois <romain.gantois@bootlin.com>
Cc: robh@kernel.org, conor+dt@kernel.org, linux-hwmon@vger.kernel.org,
 devicetree@vger.kernel.org
References: <20260603-adt7462-bindings-v1-2-301304bcf774@bootlin.com>
 <20260603114026.709611F00893@smtp.kernel.org>
Content-Language: en-US
From: Guenter Roeck <linux@roeck-us.net>
Autocrypt: addr=linux@roeck-us.net; keydata=
 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
 np3900V20aS7eD9K8GTU0TGC1pyz6IVJwIE=
In-Reply-To: <20260603114026.709611F00893@smtp.kernel.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 6/3/26 04:40, sashiko-bot@kernel.org wrote:
> Thank you for your contribution! Sashiko AI review found 1 potential issue(s) to consider:
> - [Low] Using `of_match_ptr()` prevents the driver from being matched via ACPI PRP0001 when `CONFIG_OF` is disabled.
> --
> 
> commit c2691e00dcd763957c6a2291880ea9079be2bbda
> Author: Kory Maincent <kory.maincent@bootlin.com>
> 
> hwmon: (adt7462) Add of_match_table to support devicetree
> 
> This commit adds an of_match_table to the adt7462 driver to enable
> devicetree probing.
> 
>> diff --git a/drivers/hwmon/adt7462.c b/drivers/hwmon/adt7462.c
>> index 174dfee47f7a7..ef6e5252dc0a4 100644
>> --- a/drivers/hwmon/adt7462.c
>> +++ b/drivers/hwmon/adt7462.c
> [ ... ]
>> @@ -1814,10 +1814,17 @@ static const struct i2c_device_id adt7462_id[] = {
>>   };
>>   MODULE_DEVICE_TABLE(i2c, adt7462_id);
>>   
>> +static const struct of_device_id __maybe_unused adt7462_of_match[] = {
>> +	{ .compatible = "adi,adt7462" },
>> +	{ },
>> +};
>> +MODULE_DEVICE_TABLE(of, adt7462_of_match);
>> +
>>   static struct i2c_driver adt7462_driver = {
>>   	.class		= I2C_CLASS_HWMON,
>>   	.driver = {
>>   		.name	= "adt7462",
>> +		.of_match_table = of_match_ptr(adt7462_of_match),
> 
> [Severity: Low]
> Does using of_match_ptr() here prevent the driver from being matched via
> ACPI PRP0001 when CONFIG_OF is disabled?
> 
> When CONFIG_OF is disabled, of_match_ptr() evaluates to NULL, hiding the
> of_match_table from the driver core. This prevents the driver from being
> matched using ACPI PRP0001, which relies on OF compatible strings even on
> systems without Device Tree.
> 
> Would it be better to drop of_match_ptr() and assign the table directly,
> along with removing the __maybe_unused attribute from adt7462_of_match?
> 

I agree.

Guenter

