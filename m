Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=91.218.175.105
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794900488;
	b=RUeHazED5Qp6Yw9Rh7I9r+42LpExnLx8yClJhwYfSYE7xUYlQJ8D+p+Jiel1jshoPshZ
	 FEmmFbHZE4m41uv2n29pxaNsDXtsK3rHdn+OX0lTWcP3rX6lVPbQT3wfn3Ijywx/uFU3I
	 zt7ZpdUINSrCLBo3okFvrCLePt2WO6EFxaSpBzzzNW61bSwYARRQJR3wHErHVvn6hCC35
	 DHMaEsOqOdIWJGKCGNaCu2O7ibE2O3YVZFsA/qPreQxA2ThE7rczaRam7Bb05rcaIZk77
	 8QpvmQd2jyqOqbnPh3B5EPIi3O34w9p7aFn8ymUp0iPUJ5SNQKCmV59bUzQ/wztaHog==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794900488;
	h=DMARC-Filter:X-Envelope-To:DKIM-Signature:X-Envelope-To:Received:
	 X-Mizu-Trace-ID:X-Migadu-Flow:Message-ID:Date:MIME-Version:User-Agent:
	 Subject:To:Cc:References:Content-Language:From:In-Reply-To:
	 Content-Type:Content-Transfer-Encoding;
	bh=AiloeVj7f5SkmVduZu6GrGYjRe7VINboO/OLOU2KIoM=;
	b=X3kS1suocTgUJSOcLV32P+B0bQEkA8fJMSntPbrSwF+4YxEIPAy3OA/n77xwGUlySr1r
	 kg2XiswVsR5re75C5Fo9jrlGBRO2ywAuIPs0WDZzx8QX/pOCtdr79LQLMoBppVvqkVr8S
	 NvamL9wcI4fl0gT/Itgn0+3+UwY5Iw8gDXE+pC7SdYFqGQflUjQt2Wmad+tqbvcYcxLsj
	 FTwfxl72cVrYcmw9g/JVeXvYbSKIxHd7QNHZNM5F+E0j/ZtV44Rx0b6WUnGBdtrTgreJE
	 aJBx/xm98hU23iMhjHDd2w6w52PaSnnPG9fsyHYJyzAU9PyElEpD+OKYDn+D4BbvQpA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=linux.dev;
	spf=pass smtp.mailfrom=linux.dev;
	dkim=pass header.d=linux.dev header.i=@linux.dev header.a=rsa-sha256 header.s=key1 header.b=IUa3hUbx;
	arc=none smtp.remote-ip=91.218.175.105
Received: from mta0.migadu.com (out-105.mta0.migadu.com [91.218.175.105])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 791D1606A31C
	for <sashiko-reviews@lists.linux.dev>; Tue, 17 Nov 2026 07:28:07 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 791D1606A31C
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.dev
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.dev
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key, unprotected) header.d=linux.dev header.i=@linux.dev header.a=rsa-sha256 header.s=key1 header.b=IUa3hUbx
X-Envelope-To: sashiko-reviews@lists.linux.dev
DKIM-Signature: a=rsa-sha256; bh=OOZLqF1KqEWXsHkQIJQdmwZs3bWqAcc5EVrCFP1k6Ko=;
 c=simple/simple; d=linux.dev;
 h=from:to:subject:date:message-id:mime-version:content-type; s=key1;
 t=1794900485; v=1; x=1795505285;
 b=IUa3hUbxMteF48XpluyzUk+/5jUbACgr8hkX/L4YThrvV0cr+nwKKln3Up3fpA7yFI2y2kGa
 3s6YvYYIV/9lgM8LGKfDXd91wAe0EUzxy8SznktHU0wQ+kBthmEUygZhhAwjXgz0vqImxD7Cjxq
 Hwnf8dw6PKqww+065SW4zioU=
X-Envelope-To: sashiko-reviews@lists.linux.dev
Received: by smtp.migadu.com with ESMTPS id cca165b129b6f823;
	Tue, 17 Nov 2026 07:28:05 +0000
X-Mizu-Trace-ID: cca165b129b6f823
X-Migadu-Flow: FLOW_OUT
Message-ID: <b61ece54-4df8-4d4d-a64a-be7f56f380dc@linux.dev>
Date: Tue, 17 Nov 2026 15:27:53 +0800
X-Mailing-List: sashiko-reviews@lists.linux.dev
List-Id: <sashiko-reviews.lists.linux.dev>
List-Post: <mailto:sashiko-reviews@lists.linux.dev>
List-Help: <mailto:sashiko-reviews+help@lists.linux.dev>
List-Subscribe: <mailto:sashiko-reviews+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:sashiko-reviews+unsubscribe@lists.linux.dev>
List-Owner: <mailto:sashiko-reviews+owner@lists.linux.dev>
Precedence: list
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v5 07/11] mm/vmalloc: undo what
 __vmap_pages_range_noflush() mapped on failure
To: sashiko-reviews@lists.linux.dev
Cc: kasan-dev@googlegroups.com, linux-mm@kvack.org,
 Suren Baghdasaryan <surenb@google.com>, Uladzislau Rezki <urezki@gmail.com>,
 Dev Jain <dev.jain@arm.com>, Andrew Morton <akpm@linux-foundation.org>,
 Madhavan Srinivasan <maddy@linux.ibm.com>,
 Michael Ellerman <mpe@ellerman.id.au>, Nicholas Piggin <npiggin@gmail.com>,
 "Christophe Leroy (CS GROUP)" <chleroy@kernel.org>,
 Shrikanth Hegde <sshegde@linux.ibm.com>,
 "Ritesh Harjani (IBM)" <ritesh.list@gmail.com>,
 Marco Elver <elver@google.com>, Alexander Potapenko <glider@google.com>,
 Dmitry Vyukov <dvyukov@google.com>, Dennis Zhou <dennis@kernel.org>,
 Tejun Heo <tj@kernel.org>, Christoph Lameter <cl@gentwo.org>
References: <20261116071325.263682-1-hao.ge@linux.dev>
 <20261116071325.263682-8-hao.ge@linux.dev> <sashiko-outbox-218305@kernel.org>
Content-Language: en-US
From: Hao Ge <hao.ge@linux.dev>
In-Reply-To: <sashiko-outbox-218305@kernel.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit



On 2026/11/17 15:15, sashiko-bot@kernel.org wrote:
> Thank you for your contribution! Sashiko AI review found 1 potential
> issue to consider:
> - [Low] mm/vmalloc: vmap_pages_range_noflush_walk() truncates nr into
>   unsigned int
> --
> 
> commit f06c1baff5ffda8b5f9a1dce600b9d716bd0c648
> Author: Hao Ge <hao.ge@linux.dev>
> 
> mm/vmalloc: undo what __vmap_pages_range_noflush() mapped on failure
> 
> This commit tracks the number of pages installed by
> vmap_pages_range_noflush_walk() and tears down those PTEs in
> __vmap_pages_range_noflush() when a mapping fails midway.
> 
>> diff --git a/mm/vmalloc.c b/mm/vmalloc.c
>> index 5c1eacc2a0ac3..4f3c320a48499 100644
>> --- a/mm/vmalloc.c
>> +++ b/mm/vmalloc.c
>> @@ -725,7 +725,8 @@ static int vmap_pages_p4d_range(pgd_t *pgd, unsigned long addr,
>>   * may have contiguous chunks, as hinted by @shift.
>>   */
>>  static int vmap_pages_range_noflush_walk(unsigned long addr, unsigned long end,
>> -		pgprot_t prot, struct page **pages, unsigned int shift)
>> +		pgprot_t prot, struct page **pages, unsigned int shift,
>> +		unsigned int *mapped_pages)
>>  {
>>  	unsigned long start = addr;
>>  	pgd_t *pgd;
>> @@ -748,6 +749,7 @@ static int vmap_pages_range_noflush_walk(unsigned long addr, unsigned long end,
>>  	if (mask & ARCH_PAGE_TABLE_SYNC_MASK)
>>  		arch_sync_kernel_mappings(start, end);
>>  
>> +	*mapped_pages = nr;
>>  	return err;
>>  }
>>  
>> @@ -758,18 +760,36 @@ static int vmap_pages_range_noflush_walk(unsigned long addr, unsigned long end,
>>   * The caller is responsible for calling flush_cache_vmap() after this
>>   * function returns successfully and before the addresses are accessed.
>>   *
>> + * On failure the PTEs installed by this call are torn down before
>> + * returning, so a retry sees a clean range; PTEs that were already
>> + * there when the walk failed are left alone. When @gfp_mask cannot
>> + * block, the teardown skips cond_resched(), it may run in atomic
>> + * context.
>> + *
>>   * This is an internal function only. Do not use outside mm/.
>>   */
>>  int __vmap_pages_range_noflush(unsigned long addr, unsigned long end,
>> -		pgprot_t prot, struct page **pages, unsigned int page_shift)
>> +		pgprot_t prot, struct page **pages, unsigned int page_shift,
>> +		gfp_t gfp_mask)
>>  {
>> +	int err;
>> +	unsigned int mapped_pages = 0;
>> +
>>  	if (WARN_ON_ONCE(page_shift < PAGE_SHIFT))
>>  		return -EINVAL;
>>  
>>  	if (!IS_ENABLED(CONFIG_HAVE_ARCH_HUGE_VMALLOC))
>>  		page_shift = PAGE_SHIFT;
>>  
>> -	return vmap_pages_range_noflush_walk(addr, end, prot, pages, page_shift);
>> +	err = vmap_pages_range_noflush_walk(addr, end, prot, pages, page_shift,
>> +					    &mapped_pages);
>> +
>> +	/* Undo the PTEs installed before the failure. */
>> +	if (err && mapped_pages)
>> +		__vunmap_range_noflush(addr, addr + (mapped_pages * PAGE_SIZE),
>> +				       gfpflags_allow_blocking(gfp_mask));
>> +
>> +	return err;
>>  }
> 
> [Severity: Low]
> Should mapped_pages (and nr_mapped in vmap_pages_range_batched()) be
> unsigned long instead of unsigned int?
> 
> vmap_pages_range_noflush_walk() tracks nr as an unsigned long across the
> page-table walk, so storing it into an unsigned int truncates the count to
> 32 bits and would leave the unmap range incomplete if a walk ever failed
> past UINT_MAX pages.
> 

Sure, keeping them consistent does make sense.
I will hold this change and wait for more review comments on the rest of the patches.
