Received: from mail-pl1-f194.google.com (mail-pl1-f194.google.com [209.85.214.194])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 39E2E392825
	for <sashiko-reviews@lists.linux.dev>; Fri, 22 May 2026 08:04:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.194
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779437059; cv=none; b=HL+ZMF0b4Sm1Q1WHUfYB/i3gOg3ojH4w7oli3g5ZcOcovkJHwAqzHdBRPIAhPD4DamtgoiGWEAG4Hhiv7+ISK2o5diFuzZgBes9RGtuVufJAi0ik3e3agRq7rCzoAZxibM/mIHr4scegYnwfiOoRngGySqsRzC1gjCwaeFuxQL8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779437059; c=relaxed/simple;
	bh=qM58pn4uqMbT5phn1an9S3xiY59xMOB8pyB3rbl5acg=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=g0lMFMqcxCkOvF6Hnxx1VXumsDYQASVubg+is/XSVhX9Xf6Dui2Y9pWK9gkZkWS+dOIoHq19ptQtTJiSqGpKc9S9YbYlsgclrbk99mxv+Rp1pj4ryxDmgUK6yJgwOYB10AI/k7qeQZzbTP4QlqAz8zm/tYVaUOgL4F/zdrWkHGw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=iO/6XTTb; arc=none smtp.client-ip=209.85.214.194
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="iO/6XTTb"
Received: by mail-pl1-f194.google.com with SMTP id d9443c01a7336-2be1dd4af34so55422865ad.1
        for <sashiko-reviews@lists.linux.dev>; Fri, 22 May 2026 01:04:18 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1779437057; x=1780041857; darn=lists.linux.dev;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=cebEu07XGAd82sdWpC/QWmSkLe+WMKz2Q5/Vl3aYjEo=;
        b=iO/6XTTbRjU2U5iefsDqY7XwZ/0FdTY55XtGiMLQoztYBLqQKrMrPXpdlFDxA5BmwQ
         xXbe2wqZ5d55/W7loW8IUuj94KNkNPLTB3iWX8eYKNZmj5FfoDQN7dBVrRlqrW1URShR
         1owDXhY7bkwL8LHfonYQF95D0V0WC+BYYAiUVGPifKHqGwHHoUaNJJzHKU7lo7V1KWHY
         IF/YkS8BljoUQODl01AODydpHEEqzDHoEeo7uYTrY4RBIx9UPdf/iK+ONWA+FfptrXQ/
         aqJVfWp474DMN+h53pe8Fs3OQIAVVusCY9DQ41Xq98W2lZzoaW6pemrrLY66bPb/mrby
         pJPA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1779437057; x=1780041857;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=cebEu07XGAd82sdWpC/QWmSkLe+WMKz2Q5/Vl3aYjEo=;
        b=mL7ijYhrtgGPBz882/rmdUTkPE2MQXO9tMCFwUo7WcUqT08EoF2iuGnETw5zR6Cttn
         IQ9wEuMeAFvFGl1vRra6jMKwGyK+spcRBg00MFN57uL51cK7tPrGnE4/UdmxWKq9YLSx
         XDvF+wXKNGxhhQIFxXcIY21I4c2N5Pt1vbLc3OAyxNecN8kkOk8qY6ADXKGAXLRNAVMJ
         7aPHwK8cvCzFIHcITSz0xIaVJCVvmjqSedX8jbD/4hbtqODwA/hP0Lz25KwAm8yXBzG1
         WGEyg/Hk2nAy4i3mMb8Pl8q9dekh6vtTZvHxcowHUMgo+XefAhmZBwFgrMIqX5PaRhtu
         73NQ==
X-Gm-Message-State: AOJu0YzWhAUrTuez2yil804HI2yRAofjh1IcmhpSLMJfRxx+QbbJc5UA
	fcldZHP7owhn6Yzq9s9PBCVn2vOdcAceQEOuKbMqdJk/OdL6LIrQjLE6iiwBGK9BfMzmyobO
X-Gm-Gg: Acq92OGORqXe5Hl6s0xvBpzETD6VuHgaMsNROjF2BD91n6EVMTjXOppeM/O5EdQR9qe
	Ai2l6F1XeW6UlxyAlcFyuDkY86IVSwqmXTrlSwWKPFN5UxxwSRQX52yGTd4D+K7CYUKTQH0mFUP
	onw5YG8bFse/bZStmfu2qaU4ky5UO7BVxEYPPMS0yqIO3akhN14ax4fhyEDHvdt9bTxyJhFg4wt
	xWJr7TBMLPUio2Tp6znAlHeECin0GdM9i57dUy1zZxw5+l1XxemhsyWS/J/86JyS6OhK0js44Hg
	D9/NFOH4Cb05296OGfH41FExhPGU/Cr0vnxUAW3u6Svy0ecJvUDWIvBMlO520QDLnJ9PcZlE/3G
	Bro5qEYasIgxN+peOO10ZejN/LceCuV6Q7jjgxEHJwrHwdVEBgT/o6HQiEbnbTJmvXi28bJmEuA
	l+941Bs3yyRYSLwhGfx6jBll7EPi8GMWY=
X-Received: by 2002:a17:903:390d:b0:2ba:b643:1f81 with SMTP id d9443c01a7336-2beb038150emr27446215ad.15.1779437057190;
        Fri, 22 May 2026 01:04:17 -0700 (PDT)
Received: from [10.125.112.20] ([210.184.73.204])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2beb58db336sm8391525ad.68.2026.05.22.01.04.14
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 22 May 2026 01:04:16 -0700 (PDT)
Message-ID: <e812a821-8773-433a-818b-aa8321316ea6@gmail.com>
Date: Fri, 22 May 2026 16:04:12 +0800
Precedence: bulk
X-Mailing-List: sashiko-reviews@lists.linux.dev
List-Id: <sashiko-reviews.lists.linux.dev>
List-Subscribe: <mailto:sashiko-reviews+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:sashiko-reviews+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 6/8] arm64: kdump: exclude non-dumpable reserved memory
 regions from vmcore
To: sashiko-reviews@lists.linux.dev
Cc: conor+dt@kernel.org, devicetree@vger.kernel.org, robh@kernel.org
References: <20260520091844.592753-7-chenwandun@lixiang.com>
 <20260520120203.20B7F1F000E9@smtp.kernel.org>
Content-Language: en-US
From: Wandun <chenwandun1@gmail.com>
In-Reply-To: <20260520120203.20B7F1F000E9@smtp.kernel.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit



On 5/20/26 20:02, sashiko-bot@kernel.org wrote:
> Thank you for your contribution! Sashiko AI review found 1 potential issue(s) to consider:
>
> Pre-existing issues:
> - [High] Lockless traversal of `memblock.memory` combined with a Time-of-Check to Time-of-Use (TOCTOU) pattern can cause an out-of-bounds array write if memory hotplug runs concurrently.
> --
>
> commit 9b53a1de1ee9b0da26c3c33056f291e1bba1171e
> Author: Wandun Chen <chenwandun1@gmail.com>
>
> arm64: kdump: exclude non-dumpable reserved memory regions from vmcore
>
> Reserved memory regions are excluded from vmcore by default unless marked
> dumpable. This patch honors the dumpable flag to filter out device firmware
> regions reserved via device tree to reduce vmcore size.
>
>> diff --git a/arch/arm64/kernel/machine_kexec_file.c b/arch/arm64/kernel/machine_kexec_file.c
>> index e31fabed378a5..1d65320c6ba48 100644
>> --- a/arch/arm64/kernel/machine_kexec_file.c
>> +++ b/arch/arm64/kernel/machine_kexec_file.c
> [ ... ]
>> @@ -51,6 +52,7 @@ static int prepare_elf_headers(void **addr, unsigned long *sz)
>>   	nr_ranges = 2; /* for exclusion of crashkernel region */
>>   	for_each_mem_range(i, &start, &end)
>>   		nr_ranges++;
> [Severity: High]
> This is a pre-existing issue, but can this lockless traversal of
> memblock.memory result in an out-of-bounds write if memory hotplug runs
> concurrently?
>
> The prepare_elf_headers() function iterates over memblock.memory twice:
> first here to count the regions for sizing the cmem allocation, and then
> later to populate cmem->ranges. This runs during the kexec_file_load
> syscall which holds kexec_mutex but not memory hotplug locks like
> device_hotplug_lock.
>
> If a memory hotplug operation (e.g., via sysfs) occurs between the two
> loops, memblock_add_node() could resize memblock.memory.regions via
> memblock_double_array(). This would free the old array and increase the
> region count.
>
> Could this cause the second loop to iterate over a freed array and write
> past the end of the allocated cmem->ranges array?
IIUC, this is a real race: prepare_elf_headers() scans memblock.memory
twice without holding any memory hotplug lock so a concurrent hotplug
could increase memblock.memory.regions between the two loops and cause
an out-of-bounds write to cmem->ranges, and also a potentially UAF on
the old regions array if memblock_double_array() fires.

However, this issue is independent of the current patch, I'd prefer to
address the memblock/hotplug race in a separate patchset after I look
into it more carefully.
>
>> +	nr_ranges += of_reserved_mem_kdump_nr_ranges();
>>   
>>   	cmem = kmalloc_flex(*cmem, ranges, nr_ranges);
>>   	if (!cmem)

