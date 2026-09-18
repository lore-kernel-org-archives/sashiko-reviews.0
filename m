Received: from mail-pj2-f5.google.com (mail-pj2-f5.google.com [74.125.227.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 30F543AA1BB
	for <sashiko-reviews@lists.linux.dev>; Fri, 18 Sep 2026 06:21:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.227.133
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789712463; cv=none; b=rDGjbT16h6WnMau2yZR4E73s4iQi9FOJIknjZQPOEeMGOPDv+xn7mumvmAQ/JVVe6NK7Kj7o6/e4SVnEsNYyf+din5FkDxTmFWfXruwrirngxuLmIZOKDUhyh9Eq3XLxGdKJTcFVEpKD9QF7XFfj7ujPEpCW9Px4Oz1pgTmMLnE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789712463; c=relaxed/simple;
	bh=//hfLy4KXhKQImjLqRGtoddsxb8nUplNRym/SxtSwic=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=dzEVrG3m5/bAWI6w4Vnre8Nd+u1cZP2iEf7JE3wUeyndANiiSEhHbUrHnUbVmt4Kem9eFfVZs1/1HC3Gq4NwbHgQnGupYU+8RHw7LtHs4XzFcFh3LP+Kx9dFoArRgJgtFssmpbIJkpe4XN/T1awHysBtql+2sVRjOkR96DL508k=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=dGKvf4Kw; arc=none smtp.client-ip=74.125.227.133
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="dGKvf4Kw"
Received: by mail-pj2-f5.google.com with SMTP id d9443c01a7336-2d6fbdc8772so2022345ad.0
        for <sashiko-reviews@lists.linux.dev>; Thu, 17 Sep 2026 23:21:01 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1789712461; x=1790317261; darn=lists.linux.dev;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=E6nAoxNwBlRXfqDM8NwerdYs9kHcaYf9og/arr7yGEY=;
        b=dGKvf4Kwk4VRa1jU/U6xQVMxJKTeVml94GSLSA4D29FClbHI4xV4qo8wX8IVOTj+P2
         qCGhSMQ/tSTKwqBRqelMMzCjLxRteMgPXx+afB28HwPvFKCLoG7lI6QkhMvUmAtPODD5
         3O5cW0P5HklnBVONAylctPKP3k1k40tlUNHxbvHfQrrQ6xyLMSCTUPdyJrys4sHhQb3h
         w+zdsKp0NZZars+bKHLlOQXcBZ1JT4gs/GtbrN+L0Xx3vZZIzSXaYmGQWOBUBmc8EaG1
         u75hKrYBvElLapc0fnQIB17ghj/fdIy5PfLKeaedklX+JPjwsylNoAp455akr3wsyWFd
         qG0g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1789712461; x=1790317261;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=E6nAoxNwBlRXfqDM8NwerdYs9kHcaYf9og/arr7yGEY=;
        b=aeLTZpZZbAIPbt7P9XaI4+Tfh/gUe4Yj+C9NyHj1YTiaOUH6RWQE3zZnZAXRuEtL0y
         qndaUCJo3dJ2FPS4ZL8HHTDvkoswHH/Pad2W4U18gei3GPYRxQ+MFu78iZpYV1BB0xuo
         v6WT3ajJCKbbh7K1PZl+DgqAtMZRjtKOwjx4xQL3Tf6/kHIk/upwlKHGdIY69T3rDVgU
         /3VHbKOSP24j2N0mZbGwamXsDEyEUPZccjEJFS9NyhfgSe+dWmyhnYN8wo+ldgiViwu8
         phZHMke+aE7a8KgDG7U0+J0h9IbzSxywMg1p/gq791OwaEskavDd+s8FT2n+QjVjma2K
         QPrA==
X-Forwarded-Encrypted: i=1; AKwUvBypXwrBBzc7AvdLOmL4RYvrIcJsI7nTGie7x/8X8ot64GFDjYCmKcqiMsax0Fn3/+/gpb/g4iW24UehHFwb70w=@lists.linux.dev
X-Gm-Message-State: AFuF++lbqMeLenTwX1TK8Agsr2lHlS5klCWMtoXFFEZ4ixDoEtBlUUj7
	sna4m2RVLGfgxC88RjZeAnFK/KPYM+o9rtpKAEeFRZ/WHuMXrV+bSSJA
X-Gm-Gg: AYBFou3FLje4I1dnpqrSFcVMOC9Vx7XIude5tKXJ8zFlDZUkDQXxygfSVWFus8g8juf
	xG9Kik0ZEQULgX1m/mFu3fQ4IUWceVXa4n3fB7MTtNSNPTrSHwrA2fV6LMqWDZwWMZyA53cgOhU
	OQnGFfkm8KoV3XysjosQh5ChX6b2pQSGy+TlT33h7P8hlkEc2rEkGzBVNFItz5tbSxnT1DDzmA2
	VvhLsZuQsvKjIxCy1G60Mv8qICthp62IpJGI3O8p+Hl9BhuBGNhRPp1k9JRObyUVnLXGy7mBnvS
	jiVoD42E87ISyEq0zWO7JrEJ54kQZ1A/f8zvu7vta1TWHG4Z3RcjOLNIgTidp3PRXOv5GSUrQS/
	/fRA8MIWnAyNKEKrGtD2H8X1uJG9RsI7NkyY0b4my/jTFjy3pO6NHXp//KAkgNqkvO0WSCJe1qa
	WgBqHlqGHTJvyX/uFQUUrNX4shMAg/2fWfyUS/t5HUWkQfod+f7TRu8cGA/hJ04/6ZO+Y/+YQYR
	KTI+DPZ/mDDaauH
X-Received: by 2002:a05:6a20:1609:b0:3bf:7bf7:7913 with SMTP id adf61e73a8af0-3dd8c399f37mr3432890637.14.1789712461102;
        Thu, 17 Sep 2026 23:21:01 -0700 (PDT)
Received: from [10.125.112.20] ([122.11.210.25])
        by smtp.gmail.com with ESMTPSA id 41be03b00d2f7-cc5bc988662sm385602a12.3.2026.09.17.23.20.57
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 17 Sep 2026 23:21:00 -0700 (PDT)
Message-ID: <10bc727c-d05d-4c02-bba5-dc72fbf0116d@gmail.com>
Date: Fri, 18 Sep 2026 14:20:54 +0800
Precedence: bulk
X-Mailing-List: sashiko-reviews@lists.linux.dev
List-Id: <sashiko-reviews.lists.linux.dev>
List-Subscribe: <mailto:sashiko-reviews+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:sashiko-reviews+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v6 09/10] of: reserved_mem: mark /memreserve/ entries as
 MEMBLOCK_NODUMP
To: Rob Herring <robh@kernel.org>, sashiko-reviews@lists.linux.dev
Cc: devicetree@vger.kernel.org, conor+dt@kernel.org
References: <20260902073116.802752-1-chenwandun1@gmail.com>
 <20260902073116.802752-10-chenwandun1@gmail.com>
 <20260902090211.9DA891F000E9@smtp.kernel.org>
 <20260917220750.GA4013814-robh@kernel.org>
Content-Language: en-US
From: Wandun <chenwandun1@gmail.com>
In-Reply-To: <20260917220750.GA4013814-robh@kernel.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit



On 9/18/26 06:07, Rob Herring wrote:
> On Wed, Sep 02, 2026 at 09:02:11AM +0000, sashiko-bot@kernel.org wrote:
>> Thank you for your contribution! Sashiko AI review found 2 potential issue(s) to consider:
>> - [High] FDT /memreserve/ entries marked as MEMBLOCK_NODUMP can be later freed to the buddy allocator, causing active kernel memory to be silently omitted from crash dumps.
>> - [Medium] 64-bit FDT reserve entries are checked for overlap in 64-bit space but implicitly truncated to phys_addr_t when marked as NODUMP, potentially corrupting dumpable regions on 32-bit systems.
>> --
>>
>> commit f6e6bcd14fb6f4946f258fc34089bbbdcd52f624
>> Author: Wandun Chen <chenwandun@lixiang.com>
>>
>> of: reserved_mem: mark /memreserve/ entries as MEMBLOCK_NODUMP
>>
>> This patch marks /memreserve/ entries in the device tree as MEMBLOCK_NODUMP
>> so they are excluded from kernel crash dumps. It explicitly leaves regions
>> that overlap with a dumpable region unmarked.
>>
>>> diff --git a/drivers/of/of_reserved_mem.c b/drivers/of/of_reserved_mem.c
>>> index f29a07e8fb23e..a42cf6eac55b5 100644
>>> --- a/drivers/of/of_reserved_mem.c
>>> +++ b/drivers/of/of_reserved_mem.c
>> [ ... ]
>>> @@ -251,6 +251,39 @@ static void __init __rmem_check_for_overlap(void)
>>>  	}
>>>  }
>>>  
>>> +void __init fdt_mark_memreserve_nodump(void)
>>> +{
>>> +	u64 base, size;
>>> +	int n;
>>> +	const void *fdt = initial_boot_params;
>>> +
>>> +	if (!IS_ENABLED(CONFIG_CRASH_DUMP))
>>> +		return;
>>> +
>>> +	if (!fdt)
>>> +		return;
>>> +
>>> +	for (n = 0; ; n++) {
>>> +		int i;
>>> +
>>> +		if (fdt_get_mem_rsv(fdt, n, &base, &size))
>>> +			break;
>>> +		if (!size)
>>> +			break;
>>> +
>>> +		for (i = 0; i < reserved_mem_count; i++) {
>>> +			struct reserved_mem *rmem = &reserved_mem[i];
>>> +
>>> +			if (rmem->dumpable &&
>>> +			    base < (u64)rmem->base + (u64)rmem->size &&
>>> +			    (u64)rmem->base < base + size)
>>> +				break;
>>> +		}
>>> +		if (i == reserved_mem_count)
>>> +			memblock_mark_nodump(base, size);
>>
>> [Severity: Medium]
>> Will this corrupt dumpable regions on 32-bit systems?
>>
>> base and size are u64, so the overlap check evaluates safely in 64-bit
>> space. However, memblock_mark_nodump() takes phys_addr_t. On 32-bit
>> systems, could a 64-bit FDT reserve entry > 4GB correctly pass the overlap
>> check above, but then get implicitly truncated to a 32-bit address when
>> passed to memblock_mark_nodump(), incorrectly marking a lower 32-bit
>> physical address as NODUMP without having checked it for overlap?
> 
> Unlikely. Such a system would probably enable LPAE or equivalent.
>  
>> [Severity: High]
>> Can this cause active kernel memory to be silently omitted from crash dumps?
>>
>> If the bootloader specifies a /memreserve/ entry for memory that the kernel
>> later frees (such as the initrd), this memory is returned to the buddy
>> allocator.
>>
>> Since the MEMBLOCK_NODUMP flag is never cleared, will this cause reused
>> pages to be incorrectly skipped and omitted from the crash dump later on?
> 
> This seems like an issue. Both the FDT and initrd are typically in 
> /memreserve/ and can be moved.

Thanks for the review, I will fix it in next version.

Best regards,
Wandun>
> Rob

