Received: from mail-pj1-f66.google.com (mail-pj1-f66.google.com [209.85.216.66])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C5A88226D18
	for <sashiko-reviews@lists.linux.dev>; Fri, 22 May 2026 07:22:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.216.66
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779434545; cv=none; b=Pgo73oUdMljw/SiGVnqmSJ1YmOpBuAYsPwrnl6MjWBpagw2pVA8oLTU81AsUToDx6LEGAI9nTqdZy8yo3xll6H63VCdIVij5zEMxVStuNIJuspGxb3vQoeAVnBHq+GbslOkn5PpOx2lTk5ZUxx4/PUalMy1RCkUXCwe3mTaKER8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779434545; c=relaxed/simple;
	bh=obSvKijC4ntlSrQugmV7SoKTfCT7iU/AFtXLZwPmzqI=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=FVSfmF6uH7n75mCyS63Gp5J/TBABxVuGnI8Mt1L9haVYeDr3QGZbcSBoG06/mLQ47tLmClvIfwh8ff3bIIkITt057cowmqYuTyxQDZP9i7YNvhvIKg6xUpajcOJjDw3XTT0DxPF37PG43ruj6xbXEFnLFngI4ajfhTSnYm2fxNo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=CKvrCGa0; arc=none smtp.client-ip=209.85.216.66
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="CKvrCGa0"
Received: by mail-pj1-f66.google.com with SMTP id 98e67ed59e1d1-3664df32e91so7676706a91.3
        for <sashiko-reviews@lists.linux.dev>; Fri, 22 May 2026 00:22:23 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1779434543; x=1780039343; darn=lists.linux.dev;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=PJiioyKQ/ca5477xLRXKGF7zLaHoUf7g0GkFbnSC7ww=;
        b=CKvrCGa0FcCGoycaqGCnkQJX3lw2dDevklc7QsfoTCp8+7ZGwrkwV8PIsbdoTBW5Hn
         zo48NlVM9DolgK7u/zPVC9g3GV29TKjHlh14SvbAlV1tMNdQv0pu+v1g1NkMD+luAEt4
         m2UOEoUdbKOUB0MvFzsHEYRmO55Di2Km6eSOxwZM5/RpXldaRBLhVX1U0QmJDcweLomO
         oEQKNbndFSF8sbRMf7cAFZmgNEE/dKkwdv486+Dfcp/iL5CpPxWpskYvdGgj/DnlD5dR
         jvMbi50bN14q3qhuBWAlZNCqeeQx9G8v1dxxUEPyupjBFqZJegGL4kw5Mg3nVRbPXjT7
         hqYQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1779434543; x=1780039343;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=PJiioyKQ/ca5477xLRXKGF7zLaHoUf7g0GkFbnSC7ww=;
        b=mbbE/C4EG5UbymTE8pEvilsHGiSUQOJKFknVbWMdnRBh/A9WSFBHnvgXCTtyZ2M1jk
         fn0ggCOl3mvNJGethB8VFjPSeRdfQKoObYKKWZKw2xz4bCzxfMEWv1QuaVtDMvbZzR5M
         6T6R3I+TXwXCAuIgwzOEXtVXJpr2sWdq9oMkb9E49Yt3fKIfY7sMQRjh5ovl8FoJFtDf
         C6PS9/wzglTVNkMSGragiXBX3TKzrDyk4R6lvnqEsdYaGTpqrVB2a5apHgD/uu4qGMBV
         FQZUOpKdu88/K5EkLiE3SXsdkX+AZGjoEcHIfVrR77hFYFaWRezugYTefzSh93Sm6UzE
         /WVg==
X-Gm-Message-State: AOJu0Yy5ujwSXue9wE4DwVq8wfgjaGYCm/fQWoSuTIveP8FpFf9Zu94r
	cJKSzOWN9ae1QjyWR9LhZ4sR8hpj8rzyv7ADB+0wLSNspDBNIOchZWEMKY6FpggFn9doVFEK
X-Gm-Gg: Acq92OE+ytxF5ejHB3XkSnCyYQ+guxH6gQ9EDsd4P6GUtxkzMG0dTDH2vmzlJ+725rf
	pgjWEiI/YUKzD75uGz4cg16oF6q2fwG9mfMXEzoP1560ZK7vbb6jF79y1uQ2nf31Pgcc5h1z0/d
	KMRliLp/9oxTEGGIRtkhkUowPJekjFDXgm1IL4qieUubuk2r5/kMOaPxDW7KkjLuACvwIwyUVQO
	hOfRRue/0ffMf97pJrW0JnocfOhwVIegsdkwCQi18ZQwDPGw3q6S70coybGXSI7/WHGzubGmeI3
	ThWIbyxh2hZuZeXjah1aBbIMw0BCDJ5GrddabGk4s7K/OhyvXlpx6HU5DCa2/zJQWRXJYGfvHw+
	zaSNvFTjSbS4MISRPaVxb3+MJ4iLwNZ8xaofQc+P1LgKHkX35JTfKE9bVq5DmfVsmEyEgJq1RDQ
	oEkwuNjkty4oKAZo35+Q67E4VN6g3TxaGeCPyET8SgsQ==
X-Received: by 2002:a17:90b:224e:b0:368:b917:79b9 with SMTP id 98e67ed59e1d1-36a67658122mr2644126a91.25.1779434543012;
        Fri, 22 May 2026 00:22:23 -0700 (PDT)
Received: from [10.125.112.20] ([210.184.73.204])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-36a678d384fsm585491a91.4.2026.05.22.00.22.20
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 22 May 2026 00:22:22 -0700 (PDT)
Message-ID: <8833da24-9484-4081-a93c-cf91d86faaeb@gmail.com>
Date: Fri, 22 May 2026 15:22:17 +0800
Precedence: bulk
X-Mailing-List: sashiko-reviews@lists.linux.dev
List-Id: <sashiko-reviews.lists.linux.dev>
List-Subscribe: <mailto:sashiko-reviews+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:sashiko-reviews+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 5/8] of: reserved_mem: add kdump helpers to exclude
 non-dumpable regions
To: sashiko-reviews@lists.linux.dev
Cc: robh@kernel.org, devicetree@vger.kernel.org, conor+dt@kernel.org
References: <20260520091844.592753-6-chenwandun@lixiang.com>
 <20260520110321.2A23C1F000E9@smtp.kernel.org>
Content-Language: en-US
From: Wandun <chenwandun1@gmail.com>
In-Reply-To: <20260520110321.2A23C1F000E9@smtp.kernel.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit



On 5/20/26 19:03, sashiko-bot@kernel.org wrote:
> Thank you for your contribution! Sashiko AI review found 1 potential issue(s) to consider:
> - [High] Use-After-Free when accessing `reserved_mem` during kexec load on systems with `/memreserve/` but no `/reserved-memory` node.
> --
>
> commit f3d66a3fdb2eb02781d662efcbf6e92d5a51228e
> Author: Wandun Chen <chenwandun1@gmail.com>
>
> of: reserved_mem: add kdump helpers to exclude non-dumpable regions
>
> This commit adds two helpers to exclude non-dumpable reserved memory
> regions during kdump. These helpers calculate the number of excluded
> ranges and perform the actual exclusion by iterating over the
> reserved_mem array.
>
>> diff --git a/drivers/of/of_reserved_mem.c b/drivers/of/of_reserved_mem.c
>> --- a/drivers/of/of_reserved_mem.c
>> +++ b/drivers/of/of_reserved_mem.c
> [ ... ]
>
>> +/* Exclude non-dumpable reserved regions from @cmem. */
>> +int of_reserved_mem_kdump_exclude(struct crash_mem *cmem)
>> +{
>> +	unsigned int i;
>> +	int ret;
>> +
>> +	for (i = 0; i < reserved_mem_count; i++) {
>> +		struct reserved_mem *r = &reserved_mem[i];
> [Severity: High]
> Can accessing reserved_mem here cause a use-after-free on systems that have
> /memreserve/ entries but no /reserved-memory node?
>
> The global pointer reserved_mem initially points to reserved_mem_array,
> which is marked with __initdata. During early boot, if there is no
> /reserved-memory node, fdt_scan_reserved_mem_late() returns early without
> dynamically allocating a permanent array.
>
> However, fdt_reserved_mem_save_memreserve_entries() unconditionally
> populates /memreserve/ entries into this __initdata array and increments
> reserved_mem_count.
>
> After boot completes, the __initdata section is freed.
>
> When a kexec image is later loaded, won't these helpers iterate over
> reserved_mem_count and read fields like size, dumpable, and base from
> the freed init memory?
Yes, it is indeed a UAF issue if no /reserved-memory node.
Will fix in v3
>
>> +
>> +		if (!r->size || r->dumpable)
>> +			continue;
>> +		ret = crash_exclude_mem_range(cmem, r->base,
>> +					      r->base + r->size - 1);
>> +		if (ret)
>> +			return ret;
>> +	}
>> +	return 0;
>> +}

