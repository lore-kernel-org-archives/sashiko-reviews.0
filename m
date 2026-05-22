Received: from mail-pg1-f194.google.com (mail-pg1-f194.google.com [209.85.215.194])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 30E0972617
	for <sashiko-reviews@lists.linux.dev>; Fri, 22 May 2026 07:19:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.215.194
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779434377; cv=none; b=FcySm+clR9djJxoGy7+rXIJnhDNIGGnRROpObC4rK5V7ikZ7DSXmy/EDc/UaIkc61txf5WzjhFDszezuHvDkul4aWgrDcJrdKOXMpGBDbxssZZYD7DngjKtSFewjrvb0/CBJeQY1qc/8PkWVWgMEJbcaC/tNNixxWx91P20gUE8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779434377; c=relaxed/simple;
	bh=vB8ncglXsDL+G3GQLuAvTKjMpZQbsil0GJXiBoS1ZPY=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=bpgqNm/NfbGSwhMKRucWmVJVqSspE8bEz9gn9RW3CQuXtP3V9U9aYKvJkUzFDMatFjtwls0f8iS4CAMc8aVEd1zESC9EDelrEakKGpASBVTPAtCVTBLjiWHb04XFMIsBJ5WwEUp0770BW7vtHR+cj0V0yNN6G1nm0iLkP84vfUU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=ILl1+PMr; arc=none smtp.client-ip=209.85.215.194
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="ILl1+PMr"
Received: by mail-pg1-f194.google.com with SMTP id 41be03b00d2f7-c801b30188dso3269415a12.3
        for <sashiko-reviews@lists.linux.dev>; Fri, 22 May 2026 00:19:36 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1779434375; x=1780039175; darn=lists.linux.dev;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=SxeTpMAFFvPJj1oPmHKERDLVM0KYa/xZKuY/auNrHes=;
        b=ILl1+PMrLbwnyMsKwYqoIHYpZbHh2GC7A6Tnu3qDMxKb2U2meQCjrSZ+f5Yd66yFcw
         NIlqLE409eVHkd0nTbggNrHMq7p50vMMV/BxxSvIOOlRq3lH8qWzoRnAFQ9KbCptZUpr
         lBT5FU7rKrb20HlC3f4gXwOlCAKT4Jfxx6xjVO/tcUXkyD+0fvZZStCOmbrXqsBvde4T
         aOG65ZKAylXfEsy8EOwyj0UHvXEHBsVWsAPyjOUePxsZEwLI8+g7YL+MquWiZ374Uudc
         7ZJGloN7/1quJ9wypPCPB504zCm6lO12/57AJiQM5Qz5HxTM/EecY3o6WC+jw2fa8jpm
         GGeA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1779434375; x=1780039175;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=SxeTpMAFFvPJj1oPmHKERDLVM0KYa/xZKuY/auNrHes=;
        b=Kg/Ofx04y6ChVefqU/32t7feLchN/eP+lhpCFqWbHKCgu+sQm03utFXUeGlgd5654S
         ByLp9bPeGo6pgLs3J47Yj9aXsIR2iVOiKiJq/4sIReaMbRztSZjJW/jXHhPSaC8Nq4gG
         D7mtM/pv0cAJmYuEhiFyaxTrXlZQhhyVVJM06wRcU86bTYccbLF1umilozKMmrPz+nt/
         fhtu5OTPPtk0RYVRdf60MDCIYsrnu8YjBnmAlh0KNRqEkyfZudzUSNopR5s8pIEkDFnx
         1Km62TAtgJa4CvEplFyAxltI6taYwgcszSeTHYI3imE6ycFCGfdYzUXC7K1zyycn2c1H
         Ta0A==
X-Gm-Message-State: AOJu0YzhGHP+XlIWdy/74jZAt4ECWDTXb+K4EGFoCxhzkJ4wJoxWZNft
	gmQpLkHFX4Avw2lv2kEgnPRU/p1YI0mHiobcYBq0XOIcuR7x32912r3oQtWXAU7EEGRzEKHQ
X-Gm-Gg: Acq92OE+UmeXeMfgylv7T+6ZS3C4UX+2BHU848sq0RlPh7GmYHIsTgKQlfdvo099O7r
	+w+YcPg1p/vLBWD+xjdTA26IZlYDIhapKuHRA2HrRpOFcYxDBO6mumJFs0zPV0A7b06jgfP2VY1
	WKN0BdkIUiE8XYO8TI5/QCc2MsYD/8ZaDTYWrJLSAOYjzTfcXcb4nf6hImisnUL9GhWACHFADhp
	UiiIrsuIaydpJfMuUeiYWkPrT3FFaAlkA4s765c8Yw9gonfvcQ7w6WeQTLb6V3+2bMmW/5nOJHq
	PWvI458+dm65cZNdrH3QRa3jRVX2v1Eyx0yBgEVdqc9FineVz76gPglYP+XceVUKkjk7k8AGe96
	sfJBtOyxvx6khLJWwpx6jzC4Pv7MYQY+ul71dQot2S8ZnmVNvaoSfJOqLJTiHG/3+yrGSL4Lj9R
	ALlotqDt3MmLbxAQp2mw2wWjRCeFUarqM=
X-Received: by 2002:a05:6a21:d86:b0:3b3:2703:117 with SMTP id adf61e73a8af0-3b3293ba4b1mr2450063637.41.1779434375371;
        Fri, 22 May 2026 00:19:35 -0700 (PDT)
Received: from [10.125.112.20] ([210.184.73.204])
        by smtp.gmail.com with ESMTPSA id 41be03b00d2f7-c852054e0cbsm654054a12.20.2026.05.22.00.19.32
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 22 May 2026 00:19:34 -0700 (PDT)
Message-ID: <cc70c1af-2276-4d73-bd55-612995ec6cae@gmail.com>
Date: Fri, 22 May 2026 15:19:31 +0800
Precedence: bulk
X-Mailing-List: sashiko-reviews@lists.linux.dev
List-Id: <sashiko-reviews.lists.linux.dev>
List-Subscribe: <mailto:sashiko-reviews+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:sashiko-reviews+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 4/8] of: reserved_mem: save /memreserve/ entries into
 the reserved_mem array
To: sashiko-reviews@lists.linux.dev
Cc: robh@kernel.org, devicetree@vger.kernel.org, conor+dt@kernel.org
References: <20260520091844.592753-5-chenwandun@lixiang.com>
 <20260520103734.2CDFA1F000E9@smtp.kernel.org>
Content-Language: en-US
From: Wandun <chenwandun1@gmail.com>
In-Reply-To: <20260520103734.2CDFA1F000E9@smtp.kernel.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit



On 5/20/26 18:37, sashiko-bot@kernel.org wrote:
> Thank you for your contribution! Sashiko AI review found 1 potential issue(s) to consider:
> - [High] Out-of-bounds write to the statically allocated `reserved_mem_array` due to inflated `total_reserved_mem_cnt` without guaranteed array reallocation.
> --
>
> commit cac834a48f61205ebaa2a6eaf1bc2f735c0a6c46
> Author: Wandun Chen <chenwandun1@gmail.com>
>
> of: reserved_mem: save /memreserve/ entries into the reserved_mem array
>
> This commit saves /memreserve/ entries into the reserved_mem array so they
> can be excluded from kdump vmcores. Overlapping entries are marked as dumpable
> to ensure useful crash analysis data is retained.
>
>> diff --git a/drivers/of/fdt.c b/drivers/of/fdt.c
>> index 82f7327c59ea9..d2bcaf149fe81 100644
>> --- a/drivers/of/fdt.c
>> +++ b/drivers/of/fdt.c
> [ ... ]
>> @@ -516,7 +517,9 @@ void __init early_init_fdt_scan_reserved_mem(void)
>>   		if (!size)
>>   			break;
>>   		memblock_reserve(base, size);
>> +		nr_memreserve++;
>>   	}
>> +	fdt_reserved_mem_account_memreserve(nr_memreserve);
>>   }
> [ ... ]
>> diff --git a/drivers/of/of_reserved_mem.c b/drivers/of/of_reserved_mem.c
>> index 313cbc57aa453..6dfe9e03c535d 100644
>> --- a/drivers/of/of_reserved_mem.c
>> +++ b/drivers/of/of_reserved_mem.c
> [ ... ]
>> @@ -241,6 +241,43 @@ static void __init __rmem_check_for_overlap(void)
>>   	}
>>   }
>>   
>> +static void __init fdt_reserved_mem_add_memreserve(phys_addr_t base,
>> +						   phys_addr_t size)
>> +{
>> +	struct reserved_mem *rmem;
>> +	bool dumpable = false;
>> +	int i;
>> +
>> +	if (reserved_mem_count == total_reserved_mem_cnt) {
>> +		pr_err("not enough space for memreserve regions.\n");
>> +		return;
>> +	}
> [Severity: High]
> Could this lead to an out-of-bounds write to the statically allocated
> reserved_mem_array during early boot?
>
> fdt_reserved_mem_account_memreserve() increments total_reserved_mem_cnt
> by the number of /memreserve/ entries. However, if the device tree lacks
> a /reserved-memory node, fdt_scan_reserved_mem_late() returns early and
> alloc_reserved_mem_array() is bypassed.
Yes, there is indeed an out-of-bounds issue if the device tree lacks a
/reserved-memory node.

At the same time, it will also cause inaccurate counting for
total_reserved_mem_cnt.

Will fix both in v3.
>
> If this happens, the reserved_mem pointer continues to point to the
> statically allocated array with a fixed capacity of MAX_RESERVED_REGIONS.
>
> Since the check above compares against the inflated total_reserved_mem_cnt, it
> appears we could write past the end of the static array if the device tree
> contains 64 or more /memreserve/ entries?
>
>> +
>> +	for (i = 0; i < reserved_mem_count; i++) {
>> +		rmem = &reserved_mem[i];
>> +
>> +		if (!rmem->dumpable)
>> +			continue;
>> +
>> +		if (base < rmem->base + rmem->size && rmem->base < base + size) {
>> +			dumpable = true;
>> +			break;
>> +		}
>> +	}
>> +
>> +	rmem = &reserved_mem[reserved_mem_count];
>> +	rmem->base = base;
>> +	rmem->size = size;
>> +	rmem->dumpable = dumpable;
>> +
>> +	reserved_mem_count++;
>> +}
> [ ... ]
>

