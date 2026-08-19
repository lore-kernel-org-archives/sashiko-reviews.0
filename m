Received: from mail-pz2-f1.google.com (mail-pz2-f1.google.com [74.125.228.1])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D33DA2DF3F2
	for <sashiko-reviews@lists.linux.dev>; Wed, 19 Aug 2026 03:14:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.228.1
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787109272; cv=none; b=gqfaxHHUOr91xKNp5V8tcdDGQUhd+IpJpuUMlU7R6wwJ9lUDqHlMA1+TVsMO28VQnBVaLzUHuL1DRR1Vx+IGRrLUFIkfo2rT22qHBN9RCeJR9ykajtTeDxxuNdfZUNQVmd7eBuy9TOyolaJopcR6u/WlvErbPMp1VrkktNvw0Go=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787109272; c=relaxed/simple;
	bh=qhh5IYjcZfOvPbQAcHwjlmsNnJJ/j7fHA9NCgpyJsgU=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=bQ7++N5BTmyrWEx9r7Zv+yZ/YRNBskeQcyY9LN6IQlJym0XYpiOoIa3BC4UGZwpTRNqZvXdi0C9uzyiR2hiV06t+NE+0rBojySor0nMmLpyTJ9Jlu0oB3sE7ebMfpwQO5pvnB8ouLNCVHoRtJHT6DutoDZOGC04yDJmXYCgCCTM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=NgPSXdvI; arc=none smtp.client-ip=74.125.228.1
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="NgPSXdvI"
Received: by mail-pz2-f1.google.com with SMTP id 41be03b00d2f7-ca8758e7e94so19564a12.0
        for <sashiko-reviews@lists.linux.dev>; Tue, 18 Aug 2026 20:14:30 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1787109270; x=1787714070; darn=lists.linux.dev;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=rkDTbm6UNf3o2IwfVAFs79C+vTq7/RzNoY70xRVtDM8=;
        b=NgPSXdvIrxV0c6AFQ1mzWJwBskrm1RRbYl6MuIBShhVLAAUpysCgIH6RT1QJ3LbKPU
         9rs8uiqrwqq7HJrijHVc4r/XledR73/+uvvpVQIysMwSfltUtLX3llAUIuvAXemrm5Tf
         Ms2FYzdms+DyOwdb7XyF68PFahgILn4Dg2vRi9eLzZiW9vsDhcGjW/sZEvaEkjxxBmrn
         4Wifr7CZMtJ6uCD/jHo8DjPfHTuBpiod/WxpCOH7PFrTOwwEpeWQhK45lSJbVdBjlLzH
         a6bYSbIFcQ7YuijQ8T2KW9mVj8jM22uPVmrPYZMBHJI/YiIV4htanzRB/mIOs9iC7Zks
         G2mQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1787109270; x=1787714070;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=rkDTbm6UNf3o2IwfVAFs79C+vTq7/RzNoY70xRVtDM8=;
        b=qNwgkgTflp38rCs3Wr7rm4TfywPN/LHQjru5iix/d+rdwLnEraDvZjrDhc57hPjTQA
         qdEBiOU+cCIP8XKd1TP1nufHYgkjtmU/wNqp8dAmxTaMfW3e/r/s/6GSq4X/R6L70bJo
         9YdRFSAay/n39QWZE7nxL8T6/tbJwAxR5QCWXT2VVTWB1i0rZDva2HbS7pJzv0fH8BVm
         ir+X2DBHYvMsQ5yoRgIk4QX3HfBq8KD5Rc5AbAnTP3UVBb4IxTc71fImoFSXw2A4wBqC
         lOcwBbO/5imKdZHmD5OQQEIT5T5u6iLYsY/gLdqEXLbxLABRPpfrEYlW9Zs/jRzSl/Lc
         k0bw==
X-Gm-Message-State: AOJu0YwJwvDVlc+XBweoewZLU1iX5qR+En9UC0wO9uoWGT89OE/2sjoe
	mafmzj9Q0knlHCDM1sZEqfC8ERZJOlgdapaV5NO4rEMZVHNqIFsneyFCINXLIsCr4bYouw==
X-Gm-Gg: AR+sD11Ic1RQqNSErCaGFMsRyJTWzsWTfIgZCMPxelyqLEDeO8SJyRn5ZDoS7/sWtSb
	x9celN66GXgO4Uy/zU6NSwzHfI4YW1sjnRdCJeittWstrjqSvNFir3IreBKvJuL8Dpt1TKAlBau
	GRGQql3t3A8WOuh4hgRUFj/wpxUJ927GHhQQVLF4UWfeYjqGBCOgulXDb9NRAwvdcmwx2cW9zM8
	C9jYdsmH8n/pacINYyCPRsLMBry5KXV0m+XBP+guHl+xfWiVsryM6UlTZZcNlcVZBsTsclBP7X8
	dapF/f4XW9hpTsCTDUtfPTNd87SSnyRA0vhsDshIPk5GTSHRtl62KsFDVgqXW4/4zjRLu/PIxbt
	Kq6Gano4iQww7o/w9ywLOF/XG6HoRq+tIpGWSPSyDJAv+ZjU1Msc0miOn5gdzjBDgvJrL7AClNM
	2qTUGP6Oz6jJB69SJEcs2T95bXuOQLO2pjoxveM/t2lVByqpC8M77Pl2iHm9h5dchb7FQ=
X-Received: by 2002:a17:903:15c8:b0:2cf:7db9:e13e with SMTP id d9443c01a7336-2d5fc8c65a8mr22351785ad.3.1787109270238;
        Tue, 18 Aug 2026 20:14:30 -0700 (PDT)
Received: from [10.125.112.20] ([122.11.210.25])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2d5c1e9ab8bsm19697935ad.64.2026.08.18.20.14.27
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 18 Aug 2026 20:14:29 -0700 (PDT)
Message-ID: <8ab82f38-e2c7-4cde-b306-946a220f8c78@gmail.com>
Date: Wed, 19 Aug 2026 11:14:23 +0800
Precedence: bulk
X-Mailing-List: sashiko-reviews@lists.linux.dev
List-Id: <sashiko-reviews.lists.linux.dev>
List-Subscribe: <mailto:sashiko-reviews+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:sashiko-reviews+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 4/5] of: reserved_mem: release dynamically allocated
 no-map region on init failure
To: sashiko-reviews@lists.linux.dev
Cc: conor+dt@kernel.org, robh@kernel.org, devicetree@vger.kernel.org
References: <20260818092420.2859026-1-chenwandun1@gmail.com>
 <20260818092420.2859026-5-chenwandun1@gmail.com>
 <20260818093834.588661F000E9@smtp.kernel.org>
Content-Language: en-US
From: Wandun <chenwandun1@gmail.com>
In-Reply-To: <20260818093834.588661F000E9@smtp.kernel.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit



On 8/18/26 17:38, sashiko-bot@kernel.org wrote:
> Thank you for your contribution! Sashiko AI review found 2 potential issue(s) to consider:
> 
> Pre-existing issues:
> - [High] `__reserved_mem_alloc_size()` ignores the error return value and checks `base == 0` for failure, leading to Use-After-Free of reserved memory regions.
> - [High] Statically allocated reserved memory is unconditionally freed back to the OS on driver initialization failure, violating the DT specification and causing memory corruption.
> --
> 
> --- Patch [4]: [PATCH v2 4/5] of: reserved_mem: release dynamically allocated no-map region on init failure ---
> commit cf35e3414292da4070c89965dbb1bce8416755e9
> Author: Wandun Chen <chenwandun@lixiang.com>
> 
> of: reserved_mem: release dynamically allocated no-map region on init failure
> 
> Dynamically reserved-memory regions are added to memblock.reserved by
> memblock_phys_alloc_range() during __reserved_mem_alloc_size(). When a
> reserved-memory region's driver initialization fails,
> fdt_init_reserved_mem_node() cleans up the reservation. For no-map
> regions it only calls memblock_clear_nomap(), leaving the range in
> memblock.reserved and unavailable for normal memory use.
> 
> Fix it by freeing the region on init failure when it was dynamically
> allocated.
> 
> Sashiko found this issue in [1].
> 
> Link: https://sashiko.dev/#/message/20260806100605.2C2C01F000E9%40smtp.kernel.org [1]
> 
>> diff --git a/drivers/of/of_reserved_mem.c b/drivers/of/of_reserved_mem.c
>> --- a/drivers/of/of_reserved_mem.c
>> +++ b/drivers/of/of_reserved_mem.c
> 
> [ ... ]
> 
>> @@ -567,7 +568,7 @@ static int __init __reserved_mem_alloc_size(unsigned long node, const char *unam
>>  	}
>>  
>>  	fdt_fixup_reserved_mem_node(node, base, size);
>> -	fdt_init_reserved_mem_node(node, uname, base, size);
>> +	fdt_init_reserved_mem_node(node, uname, base, size, true);
>>  
>>  	return 0;
>>  }
> 
> [Severity: High]
> This is a pre-existing issue, but is it possible for
> __reserved_mem_alloc_size() to ignore the error return value from
> early_init_dt_alloc_reserved_memory_arch() and only check if base is 0 for
> failure?
> 
> If early_init_dt_alloc_reserved_memory_arch() fails after setting *res_base
> because memblock_mark_nomap() fails:
> 
> early_init_dt_alloc_reserved_memory_arch() {
>         ...
>         *res_base = base;
>         if (nomap) {
>                 err = memblock_mark_nomap(base, size);
>                 if (err)
>                         memblock_phys_free(base, size);
>         }
>         ...
> }
> 
> The base variable in __reserved_mem_alloc_size() will be non-zero, but the
> memory has already been freed. Since __reserved_mem_alloc_size() only checks
> if base is 0, it passes the error check and registers the freed memory.
> 
> Could this result in a use-after-free if the OS hands the memory out to
> other subsystems while it is still mapped or used by the reserved region?
> 

If too many nodes init fail, it will fallback to the current behavior.

> [ ... ]
> 
>> @@ -707,7 +710,8 @@ static void __init fdt_init_reserved_mem_node(unsigned long node, const char *un
>>  
>>  		if (nomap)
>>  			memblock_clear_nomap(rmem->base, rmem->size);
>> -		else
>> +
>> +		if (dynamic || !nomap)
>>  			memblock_phys_free(rmem->base, rmem->size);
>>  		return;
>>  	} else {
> 
> [Severity: High]
> This isn't a bug introduced by this patch, but could this logic
> unconditionally free statically allocated memory without the no-map
> property back to the general pool?
> 
> If a driver fails to initialize a statically defined reserved memory region,
> and the region does not have the no-map property, it is freed here.

This is pre-existing behavior for static non-no-map regions.
> 
> According to the Device Tree specification, if a driver fails to initialize,
> the OS must not use the memory for general purposes unless the reusable
> property is explicitly present.
> 
> Will this cause kernel memory corruption if the general buddy allocator
> hands this memory out to unrelated kernel subsystems, but the firmware or a
> coprocessor still expects the region to remain reserved and accesses it?
> 


