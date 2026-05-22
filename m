Received: from mail-pf1-f195.google.com (mail-pf1-f195.google.com [209.85.210.195])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C23F030567F
	for <sashiko-reviews@lists.linux.dev>; Fri, 22 May 2026 07:13:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.195
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779434029; cv=none; b=koS/O6d9CFlkSkojWf2fn5Ikc9lRCSZxqlFmquteRK4llZgnPOnZzo5bP2zjdqDhlVWrXB37hGxXH3U51cEkxwh4fEmT9SPEJzHVx+w91+4z38ShqD2XKcZ+D0XlrRiL25kk5mvTVKK8WfBdyjKkxw4tUoSUF/F09Wy2BUWiriU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779434029; c=relaxed/simple;
	bh=9Fa/UB4HkPYCNyGFgozf00j+m/SdWP845EBaSOPQEOw=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=Gf+4BNpNf7geauUrzSHAXdDiQmLEArm/oesZjazYPTktqxOylzIzkiNuSiNLN5Q7OEHMjAyj3roxZ6TjBNhy7OHESkO9pf7VZ2sMdmTwaeXUqjEfmTiO5GmIsrZyBFdA7KT2tLHcrrBFPpG5zhjq1uJCGzv7NfX3Rpm0RxsXL0U=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=FTaRdiXi; arc=none smtp.client-ip=209.85.210.195
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="FTaRdiXi"
Received: by mail-pf1-f195.google.com with SMTP id d2e1a72fcca58-83f674f978fso2458099b3a.3
        for <sashiko-reviews@lists.linux.dev>; Fri, 22 May 2026 00:13:47 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1779434027; x=1780038827; darn=lists.linux.dev;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=/ZUvJ6eFcygxv78l6IC5YA/pTb85t8JqQtZJgDAjKvE=;
        b=FTaRdiXiOlyTWOKyHONFeu+2iTPMNHfYHjCoAcIe2vqM4il+08frBelkQllzMhsTra
         icp6ezGtEhiJ3eCfCFgHzs+OQ3XcFeCJoidF4FU2G0unluyxQbLEP1X1dAjz4MX+fkv0
         c0tNt99uwU2VL9K/ECEzasIqeudJqxzo8Wi0BWDmHKk2nN06NaU0tOoQ0MeIbDiQ1/62
         UlNZib9nhoCVri1d7hHDVPZlWhBdkNCxgYiafZ1icSA4oMFDYXi9G6I/8FXHjki803+8
         pFS0ROH6ViVCrnFVMxTatfgMvmN/8N77RHcB0DlIlp0qcddtvWcpqUzljuQ+0elP9U3y
         TTTg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1779434027; x=1780038827;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=/ZUvJ6eFcygxv78l6IC5YA/pTb85t8JqQtZJgDAjKvE=;
        b=lubVhIGbOUybgc9FgYzQByFkSVzj3ihZK3NRg0FwpddLKXKcAJuMLdMABpKoFkQJe3
         5Hs1oPjLXD8qBaOhqvZxhbUFAakqk0rThW9u4tx2E1/H/+bdVXRUM4hZvBNvDf6aUhG7
         3OaDXXn1Hq8lqdj8ht/eCNPLbAaf7ZaQ4hEOWsxEk9lWmoLsXxvMZ5HdcNmWKjnYYtA+
         XNgdSkGWl7OB0lo/s8LXwGfL9/Okua4ReZAlKMQNpPiHyLhXpBOzpvliaJc+TqY/yPpd
         yKn25SN83rafzxV1LCscC4lXxfd+JpvLacSEgXJNC9rZgScfDENC3M1ATsGutmFxeUYk
         Z47g==
X-Gm-Message-State: AOJu0YxE2+Yio3qq74YSSo/E2cG7sWEKG2dC4DOHgan9iDqOD147Ok4D
	Om6qY0WtxqA24BmsvZE7DwsHAG/ha5GgXZ4GR9EoqD8Esp8ixDAKPkoYA79kd7OGzKWJXLx9
X-Gm-Gg: Acq92OEA8AS4NxQQK1BPYN/bdKkBeDAkPjIV67o8Q58BYho4A0ffQ6iwY59FhtsuWZb
	Mu0uzPZz7Iaf0/3DXCPgLS/m16IIhfoUVFR9Ajf6EfrQT2e+TwUhtIhHSFiM6ymax1M41oXzIzc
	/o58yIrBbjkcnq1rkRDM+zXCtVRSgK9650kHUK+exFBeWURakrflfiQlNnYBJnTrd57R0d8Haab
	5NrH87sZI6N+2L4GJFrG9lKnlAF/+6l3lsJFGypKZeA38vZvUDHMZomjdx7hNB9hEhnvrx2VbIb
	42qp9RPxCDKlKdHPgs65MjS7JR+pqXSXGZdMf+/jUifJtXLxSW8kAqPeGWx6z96D9705rPU0O4C
	3EufxF7d+25Vp9sxLc1Ik/93DzKTWYte9a0x6Zru0vrWedc8mKP2JAXnU4LgVBW4fzciNuHSWzl
	7BKysd79TnG8eROutQODCla7tBQntBKGY=
X-Received: by 2002:a05:6a00:1147:b0:82f:38df:681c with SMTP id d2e1a72fcca58-8415f2d6cccmr2485881b3a.6.1779434026785;
        Fri, 22 May 2026 00:13:46 -0700 (PDT)
Received: from [10.125.112.20] ([210.184.73.204])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-84164ff3e00sm1184421b3a.54.2026.05.22.00.13.42
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 22 May 2026 00:13:46 -0700 (PDT)
Message-ID: <90a37efa-8d01-47f5-bf9b-dd008e4bbb65@gmail.com>
Date: Fri, 22 May 2026 15:13:39 +0800
Precedence: bulk
X-Mailing-List: sashiko-reviews@lists.linux.dev
List-Id: <sashiko-reviews.lists.linux.dev>
List-Subscribe: <mailto:sashiko-reviews+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:sashiko-reviews+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 3/3] of: reserved_mem: only support one <base size>
 entry in reg property
To: sashiko-reviews@lists.linux.dev
Cc: robh@kernel.org, conor+dt@kernel.org, devicetree@vger.kernel.org
References: <20260519082427.4181476-4-chenwandun@lixiang.com>
 <20260519092404.0969FC2BCC9@smtp.kernel.org>
Content-Language: en-US
From: Wandun <chenwandun1@gmail.com>
In-Reply-To: <20260519092404.0969FC2BCC9@smtp.kernel.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit



On 5/19/26 17:24, sashiko-bot@kernel.org wrote:
> Thank you for your contribution! Sashiko AI review found 1 potential issue(s) to consider:
> - [High] Unconditional read of the first `reg` property entry without verifying that `len > 0` leads to an out-of-bounds FDT read for empty `reg` properties.
> --
>
> commit def0743ccda5f4a97f9b1275e989c8ea559363b4
> Author: Wandun Chen <chenwandun1@gmail.com>
>
> of: reserved_mem: only support one <base size> entry in reg property
>
> This commit simplifies reserved memory parsing by restricting support
> to a single base/size entry in the reg property. It removes the loop
> in the early pass and warns if multiple entries are present,
> unconditionally reading only the first entry.
>
> Link: https://lore.kernel.org/all/20260506014752.GA280279-robh@kernel.org/
>
>> diff --git a/drivers/of/of_reserved_mem.c b/drivers/of/of_reserved_mem.c
>> index 462e7c3078a3a..0e91c4a71d89d 100644
>> --- a/drivers/of/of_reserved_mem.c
>> +++ b/drivers/of/of_reserved_mem.c
>> @@ -134,37 +134,38 @@ static int __init __reserved_mem_reserve_reg(unsigned long node,
> [ ... ]
>>   	prop = of_flat_dt_get_addr_size_prop(node, "reg", &len);
>>   	if (!prop)
>>   		return -ENOENT;
>>   
>> +	if (len > 1)
>> +		pr_warn("Reserved memory: node '%s' has %d <base size> entries, only the first is used\n",
>> +			uname, len);
>> +
>>   	nomap = of_get_flat_dt_prop(node, "no-map", NULL) != NULL;
>>   
>>   	err = fdt_validate_reserved_mem_node(node, NULL);
>>   	if (err && err != -ENODEV)
>>   		return err;
>>   
>> -	for (i = 0; i < len; i++) {
>> -		u64 b, s;
>> -
>> -		of_flat_dt_read_addr_size(prop, i, &b, &s);
>> -
>> -		base = b;
>> -		size = s;
>> +	of_flat_dt_read_addr_size(prop, 0, &b, &s);
> If a device tree node contains an empty reg property,
> of_flat_dt_get_addr_size_prop() returns a valid pointer to the empty
> property data and sets len to 0.
>
> Since the loop was removed, is there a risk of an out-of-bounds read here
> because the code unconditionally calls of_flat_dt_read_addr_size()?
Yes, there is indeed an out-of-bounds read issue here, which will be
fixed in v3.
>
> This could fetch garbage values for the physical base and size. If the
> parsed garbage size happens to be non-zero, could the kernel attempt
> to reserve unintended physical memory regions via
> early_init_dt_reserve_memory()?
>
> Would it be safer to verify len > 0 before reading the first entry?
>
>> +	base = b;
>> +	size = s;
> [ ... ]
>> @@ -277,20 +278,24 @@ void __init fdt_scan_reserved_mem_late(void)
>>   	alloc_reserved_mem_array();
>>   
>>   	fdt_for_each_subnode(child, fdt, node) {
>> +		const __be32 *prop;
> [ ... ]
>> -		if (!of_flat_dt_get_addr_size(child, "reg", &b, &s))
>> +		prop = of_flat_dt_get_addr_size_prop(child, "reg", &len);
>> +		if (!prop)
>>   			continue;
>>   
>>   		ret = fdt_validate_reserved_mem_node(child, NULL);
>>   		if (ret && ret != -ENODEV)
>>   			continue;
>>   
>> +		of_flat_dt_read_addr_size(prop, 0, &b, &s);
> Does this have the same out-of-bounds read potential when len == 0?
>
> The previous of_flat_dt_get_addr_size() wrapper explicitly checked that
> entries != 1, which inherently skipped empty reg properties.
>
>>   		base = b;
>>   		size = s;
>>

