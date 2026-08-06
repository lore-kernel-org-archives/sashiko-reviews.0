Received: from mail-pz2-f0.google.com (mail-pz2-f0.google.com [74.125.228.0])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BA2354156CE
	for <sashiko-reviews@lists.linux.dev>; Thu,  6 Aug 2026 11:48:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.228.0
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1786016888; cv=none; b=HEU5kp+SOZbkv0zjc+YA7jpoJZMCNOW/zcm4WzF33AVvubqE5DGjhhMOt2UY33YzJ92f93XKCVYUp/cpXBX6PGGeCD6tpGNzLYllkuqClNhBAZniIdNd8cnG+boDhdYIjbh0cNbpJO4PuCuJi3B1zhSv/VwGUl8d8vYU1iVboQM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1786016888; c=relaxed/simple;
	bh=AfagInVYM8gAh9w0VoONI52XecLbRcbGI4KUe8vgmRI=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=IV8mgsimpRH8B/hh8lLadbR6o+Q0QUC7v8T3srIGS46CA+Ci0vgCkH2B7V5w9P1kZVH7+TFgdhUDU/h2+J/dw9ovoyVRFc/mp+fMOwiJi95b8WJ5VK5dWg7jtgtsC9QeP/aIaqvjW2NVwVkzfMliuRTbGynoZ56LPcqC88vD+Ak=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=JGdaq152; arc=none smtp.client-ip=74.125.228.0
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="JGdaq152"
Received: by mail-pz2-f0.google.com with SMTP id 41be03b00d2f7-c96739a46acso1129482a12.1
        for <sashiko-reviews@lists.linux.dev>; Thu, 06 Aug 2026 04:48:06 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1786016886; x=1786621686; darn=lists.linux.dev;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=jTa6A1M2H+9bU9KnW8JJI6pSOlN/z7qEBlNWI2ijSbE=;
        b=JGdaq152fHuWa7oqDv7Xc4GV5KzOERDOw2Ef9NJtrHjq4PuZD/TuyzDP1Ht1fhnk6A
         SVPdrtH0zdt9qTdQICOD6eMZ7MV3sqfYn+VUvYxZMOnBlXWs6WO5yGrtPnXf7159JYx/
         jf76I0l7XjliHvGG27rteWmzTXMOc82mN0+Qk9BN5XgT5EHzvmutluR/HAO7VKr0VlLO
         rOpFfjzUi8rH0TIuEehg2tWNqmoDjuxh7+fkYP146i0Jza+3Z5rjI19eab37c/xldTh4
         E9oX1KPzN8/BWuUfAXbj1jvfnnKn5hS3BtTYsTlxNmQc+tQX+3rTjN0QYXVWKmvY6wuc
         07UQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1786016886; x=1786621686;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=jTa6A1M2H+9bU9KnW8JJI6pSOlN/z7qEBlNWI2ijSbE=;
        b=fP6KjYUQo9/jaFKTgzjjh097pdIE6aJhytEhlDpy3A3vYqRNfM3GJByj4U+jcH9QAh
         QB7lQdxFNLFm4iv/2TwOps9y9wYENFqqRW/ChVrla3p5XwbycBHZCkg4Gqz/3xkV+7Rn
         hG0pbUSkt8EizCCCXKS64WXMmjJeUpoocUKkX5MhDob6PqqF7A8/yEel0gSrK0Ud/Gn/
         ziS2LO2y7Xdi592aizG+jXTEnknqdU/rDG+plhAldmB2b4SSwJ1dmBih2snn+lxGMRxS
         VNfDE+H1GtkHY3sVW3QET98uoTOEdbK+rneQQ/rIJ9Srs42Xa1Sv2fqHHNawXIrn9UA0
         v7gQ==
X-Gm-Message-State: AOJu0YwSv1fTahKUCRPJCXNs7Vd/YGktrSlGFUDd0FXErXD7RdH/dPCQ
	PODNQBCpUArOcKtB59dDwrn8c3BMBbofs7w3arHpRHDO488fQ9k1JIum1Jhj+2OczK4+wQ==
X-Gm-Gg: AR+sD13jd1AIMAYSdu9wCAT+1QB4oeV3HmRPpfQpavLoH/tlTY07jrJ8vp5PrwJJiVR
	KDX7FqHvgeLu0TuBy+J+CfX7km4AyJ2bumlUEDekcSJHi0m5TqKbpvwjyxn9Rq4vemtas171HWr
	nTeT2emaoMV7vzjJw7kk7D4CLEYCRQ7m2xJ5wslUgU8ily7SbkCN08pmWn9CWG4KWGtfcNAx1eU
	HEC8ZynRmA9hehplZtlmdQbDokEBRgYOXLnpr4CR/NjPgdiCAMezyuFnGdJ4loeSQN6yAc5csNv
	8CeYKlryAB4eWy6Ek1JMqPFrXthT3UaRn5PfZTpYCO1zffHVFzbEDuwcJ2NZqnd6xO3UMZRSYp9
	9UM+Kk1qnWieQH2iHZ88MaWUdVBcUujOS3LtZNFBscRpM1epw5VX/9n/8EwavybwBGR9BAjdD2+
	pUCMjtZoXXuyb9uSsZkVizfvxEq8R6DTUOV9FzSHeZtrQNk0qDlfp7/RGvj6ODnHe7zaJ+
X-Received: by 2002:a05:6a00:2e9a:b0:848:6ba2:4139 with SMTP id d2e1a72fcca58-84f2e0dbe21mr14854028b3a.36.1786016885959;
        Thu, 06 Aug 2026 04:48:05 -0700 (PDT)
Received: from [10.125.112.20] ([210.184.73.204])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-84f459ba3ebsm1238852b3a.46.2026.08.06.04.48.03
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 06 Aug 2026 04:48:05 -0700 (PDT)
Message-ID: <200a2b10-9f71-4e5e-9908-349c0c711073@gmail.com>
Date: Thu, 6 Aug 2026 19:48:01 +0800
Precedence: bulk
X-Mailing-List: sashiko-reviews@lists.linux.dev
List-Id: <sashiko-reviews.lists.linux.dev>
List-Subscribe: <mailto:sashiko-reviews+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:sashiko-reviews+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v5 2/8] of: reserved_mem: add dumpable flag to opt-in
 vmcore
To: sashiko-reviews@lists.linux.dev
Cc: conor+dt@kernel.org, devicetree@vger.kernel.org, robh@kernel.org
References: <20260806093519.2907771-1-chenwandun1@gmail.com>
 <20260806093519.2907771-3-chenwandun1@gmail.com>
 <20260806094742.356B81F000E9@smtp.kernel.org>
Content-Language: en-US
From: Wandun <chenwandun1@gmail.com>
In-Reply-To: <20260806094742.356B81F000E9@smtp.kernel.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit



On 8/6/26 17:47, sashiko-bot@kernel.org wrote:
> Thank you for your contribution! Sashiko AI review found 1 potential issue(s) to consider:
> - [Medium] Incomplete implementation and write-only dead code: the `dumpable` flag is introduced and set, but the promised kdump filtering and overlap checks are missing.
> --
> 
> --- Patch [2]: [PATCH v5 2/8] of: reserved_mem: add dumpable flag to opt-in vmcore ---
> commit 873defcf6278254b5c39d8d3500f986e38a79da0
> Author: Wandun Chen <chenwandun@lixiang.com>
> 
> of: reserved_mem: add dumpable flag to opt-in vmcore
> 
> This commit adds a dumpable flag to struct reserved_mem to track whether
> a reserved area should be included in the kdump vmcore. It sets the flag
> for CMA regions to true in rmem_cma_setup().
> 
>> diff --git a/include/linux/of_reserved_mem.h b/include/linux/of_reserved_mem.h
>> index e8b20b29fa68c..55a67cee41ea0 100644
>> --- a/include/linux/of_reserved_mem.h
>> +++ b/include/linux/of_reserved_mem.h
>> @@ -15,6 +15,7 @@ struct reserved_mem {
>>  	phys_addr_t			base;
>>  	phys_addr_t			size;
>>  	void				*priv;
>> +	bool				dumpable;
> 
> [Severity: Medium]
> Is the logic that checks this flag missing from this patch?
> 
> The commit message states that non-dumpable regions are later marked
> MEMBLOCK_NODUMP, and that the flag is used to check for overlap with
> /memreserve/ entries. However, this flag appears to be write-only,
> as there are no corresponding checks or calls to memblock_mark_nodump()
> implemented in this commit.

Not correct. The checking of dumpable flag is in patch 03 and patch 04.

> 
>>  };
> 
> [ ... ]
> 
>> diff --git a/kernel/dma/contiguous.c b/kernel/dma/contiguous.c
>> index f754079a287d6..63ff134dadd42 100644
>> --- a/kernel/dma/contiguous.c
>> +++ b/kernel/dma/contiguous.c
>> @@ -565,6 +565,7 @@ static int __init rmem_cma_setup(unsigned long node, struct reserved_mem *rmem)
>>  		dma_contiguous_default_area = cma;
>>  
>>  	rmem->priv = cma;
>> +	rmem->dumpable = true;
> 
> [Severity: Medium]
> Does setting this flag have any effect?
> 
> Since the promised kdump filtering and overlap checks are missing from the
> code, this assignment currently acts as dead code. Were those checks meant
> to be included in this submission?

Not dead code, the checking of dumpable flag is in patch 03 and patch 04.>

