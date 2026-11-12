Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=217.140.110.172
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794482947;
	b=jgXhZoW20PR2X9ywr9oc90CVLDrus0x72xejdgPnVMpo6TTlemONqpqSS6RaA5LPd4jC
	 35BoYGv+MRCIu/iRg0OK9QprlBpeZEO8Ix0vsPS6GJEQFUopRGE8WkjKoMAbI8bD+f9mu
	 hBENQwjyI56zZa7ouOd4af6ZrzaiDzyO1edekzWIwDQ2oZ3xH98mp2zpqB/uOshwk9mAb
	 YBnzxejtTzNhGtB0/5qBOMMGTr0CnVZDubsxGM6inysBcPJXZJ9UQ7+2jxeIC5tSKmspI
	 3XixqnY+F40W9mf52WN5D9S3sRstOkCkzMBkSic9IWO6GkUnykTlyAkT9CmxFUSsQvw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794482947;
	h=DMARC-Filter:Received:Received:DKIM-Signature:Message-ID:Date:
	 MIME-Version:User-Agent:Subject:To:Cc:References:From:
	 Content-Language:In-Reply-To:Content-Type:Content-Transfer-Encoding;
	bh=omP2ka6eqdRebpd9f2r0exDtmLmc6R/khoAMBzVyA3w=;
	b=FCsPMlBkbeTMQk0HyYY45LeZVcyX5rcUlomSbyEkdKYAGybWcjgNHDhT+Pyt21ftk+k/
	 AGleQ2I1mpDZruWTCIw+mQyd8rj0g7TLywyri4hL5I1ypoZUcYBXTMrxDwylVvysjAKw/
	 vIPyuEUr6dngaaga9CXVKjhUghvOeWfoc049OyXoz82lPjYUDVi0Hc7UwGlWp0mmV2How
	 USBAXAA+H8eGzy3hi+ks8jbxGIsZUl+shmoQQ5pSxZNzv9J3H/HKW0+7YQ1vl+LDkRqBE
	 S/IX/3fPdu5UXD9aaLZeM4JBW29utMmuMUbVB7BWON68Bdgw7Njs/PemK7+IDicqg+w==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=arm.com;
	spf=pass smtp.mailfrom=arm.com;
	dkim=pass header.d=arm.com header.i=@arm.com header.a=rsa-sha256 header.s=foss header.b=JNB2g3Zm;
	arc=none smtp.remote-ip=217.140.110.172
Received: from foss.arm.com (foss.arm.com [217.140.110.172])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 6E4AE606B59B
	for <sashiko-reviews@lists.linux.dev>; Thu, 12 Nov 2026 11:29:06 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 6E4AE606B59B
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=arm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=arm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key, unprotected) header.d=arm.com header.i=@arm.com header.a=rsa-sha256 header.s=foss header.b=JNB2g3Zm
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 82305153B;
	Thu, 12 Nov 2026 03:29:02 -0800 (PST)
Received: from [10.57.59.183] (unknown [10.57.59.183])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 45FFC3FA7A;
	Thu, 12 Nov 2026 03:28:58 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=arm.com; s=foss;
	t=1794482945; bh=GM+wYOwDu4RHFLVq/TBNKwG/MbfYaJS+I1C0GInFgZc=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=JNB2g3ZmQqRZ5i+qpkSU6aSNW2KEfP/6eEdrA4U5pGDP5V+3MgICDJlffO51AcsQL
	 Ay60k6osyIJCBlnzKeZP6Hn4/sWuap8Rl800g52mwF2zB1ROVV+8nEYPmBSdFcc9Oi
	 53FaBbGBQsbN16dxZvALt9asmN5jzazd454fKKwI=
Message-ID: <65433c02-7b1c-449b-bf92-417bdedbbe54@arm.com>
Date: Thu, 12 Nov 2026 12:28:55 +0100
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
Subject: Re: [PATCH RFC v10 13/22] mm: kpkeys: Protect early kernel page
 tables
To: sashiko-reviews@lists.linux.dev
Cc: Andrew Morton <akpm@linux-foundation.org>,
 Ard Biesheuvel <ardb+git@google.com>, Andy Lutomirski <luto@kernel.org>,
 Catalin Marinas <catalin.marinas@arm.com>,
 Dave Hansen <dave.hansen@linux.intel.com>,
 "David Hildenbrand (Arm)" <david@kernel.org>, Jann Horn <jannh@google.com>,
 Jeff Xu <jeffxu@chromium.org>, Joey Gouly <joey.gouly@arm.com>,
 Kees Cook <kees@kernel.org>, Linu Cherian <linu.cherian@arm.com>,
 Linus Walleij <linusw@kernel.org>, Marc Zyngier <maz@kernel.org>,
 Mark Brown <broonie@kernel.org>, Matthew Wilcox <willy@infradead.org>,
 Maxwell Bland <mbland@motorola.com>, "Mike Rapoport (IBM)"
 <rppt@kernel.org>, Peter Zijlstra <peterz@infradead.org>,
 Pierre Langlois <pierre.langlois@arm.com>,
 =?UTF-8?Q?Pierre-Cl=C3=A9ment_Tosi?= <ptosi@google.com>,
 Quentin Perret <qperret@google.com>,
 Rick Edgecombe <rick.p.edgecombe@intel.com>,
 Ryan Roberts <ryan.roberts@arm.com>, Vlastimil Babka <vbabka@kernel.org>,
 Will Deacon <will@kernel.org>, Yang Shi <yang@os.amperecomputing.com>,
 Yeoreum Yun <yeoreum.yun@arm.com>, linux-mm@kvack.org, x86@kernel.org,
 Ira Weiny <iweiny@kernel.org>, Lorenzo Stoakes <ljs@kernel.org>,
 Thomas Gleixner <tglx@kernel.org>
References: <20261109-kpkeys-v10-0-aa6c4d9603bc@arm.com>
 <20261109-kpkeys-v10-13-aa6c4d9603bc@arm.com>
 <sashiko-outbox-207327@kernel.org>
From: Kevin Brodsky <kevin.brodsky@arm.com>
Content-Language: en-GB
In-Reply-To: <sashiko-outbox-207327@kernel.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 10/11/2026 17:02, sashiko-bot@kernel.org wrote:
>> +static int __init protect_p4d_table(pgd_t *pgd, unsigned long addr,
>> +				    unsigned long next, struct mm_walk *walk)
>> +{
>> +	pgd_t entry;
>> +
>> +	if (mm_p4d_folded(walk->mm))
>> +		return 0;
>> +
>> +	entry = pgdp_get(pgd);
>> +	if (!pgd_present(entry) || pgd_leaf(entry))
>> +		return 0;
>> +
>> +	protect_pgtable_page(p4d_offset(pgd, 0));
>> +
>> +	return 0;
>> +}
> [Severity: Medium]
> When CONFIG_KASAN_GENERIC or CONFIG_KASAN_SW_TAGS is enabled, does this walk
> and call set_direct_map_pkey() millions of times on the shared
> kasan_early_shadow_{p4d,pud,pmd,pte} tables?

Yes, KASAN support needs to be addressed, as mentioned in the cover letter.

> kasan_init() runs in setup_arch() before mm_core_init() calls
> kpkeys_hardened_pgtables_init(), populating unbacked shadow ranges in
> [PAGE_OFFSET, ULONG_MAX) with shared static tables where all 512 entries at
> each level point to the same next-level kasan_early_shadow_* page.  Unlike
> mm/ptdump.c, which detects those tables and sets walk->action =
> ACTION_CONTINUE, the callbacks here descend through every entry and invoke
> set_direct_map_pkey() (including a direct-map page table walk and broadcast
> TLB flush) for every 2 MiB PMD slot across the multi-terabyte shadow range,
> stalling boot.
>
> [ ... ]
>
>> +static void __init protect_early_kernel_pgtables(void)
>> +{
>> +	int ret;
>> +
>> +	mmap_write_lock(&init_mm);
>> +	/*
>> +	 * [PAGE_OFFSET, ULONG_MAX) covers all early kernel mappings on arm64
>> +	 * and x86 (at least).
>> +	 */
>> +	ret = walk_kernel_page_table_range(PAGE_OFFSET, ULONG_MAX,
>> +					   &protect_pgtable_ops, NULL, NULL);
>> +	mmap_write_unlock(&init_mm);
>> +	WARN_ON_ONCE(ret);
>> +}
> [Severity: Medium]
> On arm64 with CONFIG_ARM64_LPA2=y running on hardware where the top page
> table level is dynamically folded (vabits_actual < VA_BITS), does starting
> at PAGE_OFFSET walk and re-protect swapper_pg_dir 16 or 32 times?
>
> On arm64, PAGE_OFFSET is the compile-time _PAGE_OFFSET(VA_BITS) rather than
> _PAGE_OFFSET(vabits_actual).  When !pgtable_l5_enabled() on 4K pages (or
> !pgtable_l4_enabled() on 16K pages), pgd_none() is always false and
> pgd_to_folded_p4d() (or p4d_to_folded_pud()) wraps each top-level step in
> [PAGE_OFFSET, ULONG_MAX) back to the start of swapper_pg_dir:
>
> arch/arm64/include/asm/pgtable.h:pgd_to_folded_p4d() {
> 	return (p4d_t *)PTR_ALIGN_DOWN(pgdp, PAGE_SIZE) + p4d_index(addr);
> }
>
> As a result, walk_kernel_page_table_range() traverses the entire kernel page
> table hierarchy and flushes TLBs across all page table pages 16 times on 4K
> pages (or 32 times on 16K pages) during boot.

Right. Addresses don't really matter here, so for the next version I'm
planning to use the synthetic range [0, SZ) where SZ is PTRS_PER_PXX *
PXX_SIZE and PXX is the highest non-folded level (PGD if there is no
folding).

- Kevin
