Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=217.140.110.172
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794929709;
	b=R1y/6I6RjJF+pqZ7E89NXJH8R+wuqyoh+T1m44mKMx7ywQmJCv3aYlf/YMHoINDTf9nb
	 MusQP2b3l4gXQmxyd8hVUDeZ9UGJ1DLMwZjlGPxqd1JZ/ZIz6aoqNCIRCHChP3TNbmOm8
	 X4ZQiE+5P4Ff4O6FdWyB/4RzS2EdwWam/BWXBUjSC/kud21pa1sruXuMzyhAdJ5e47f3q
	 NLmrgnq2PMa/ambu4H1UvhCLVeG1eC2X0vCeelWON30T8+p8sg79kl9Vbz+ZHjVRCDSqw
	 9cSmV7CKhQ4j3cbCXTkvYWXKvrCX6pLG2Jq6BmWy0pUnDIAWR29Uzr0xK36PIUiMA0Q==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794929709;
	h=DMARC-Filter:Received:Received:DKIM-Signature:Message-ID:Date:
	 MIME-Version:User-Agent:Subject:To:Cc:References:From:
	 Content-Language:In-Reply-To:Content-Type:Content-Transfer-Encoding;
	bh=tK1jKo+NXSEZ02DFpKPmwfErvG5rQo62s0WEa+kB0nA=;
	b=XeUm1Es4AYoz86nyNLFtJYWbCnGC30gRyXGHTt1yJT+VQFhXNzbTSeMr0nf67bWE2zrC
	 h4R3uVh89B2RafMvvOfXGwUhwLKSuvhxqnQVyHFaD+HgAgudXBMOCoY+0UMr9ZLsBDjI1
	 ebAQYoYbTvNhCMk1x2BVs6Xr5OidHDWqgZqUTOR2nwvCqpqzuaxtKLfS2KDdl1f7XesdB
	 SVYeGxXgS6StJDohVeEIYlbUk3F+PZMWh7LKpqxEVSNotglB6FJPiCnpTo7HUhT8q0Boo
	 d0yU70MmUQmB1czd5VY2iGV3LO/lh6kUpRD1YmI9/8E1C2hSEnnRhUX6y8hWnXmDG0A==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=arm.com;
	spf=pass smtp.mailfrom=arm.com;
	dkim=pass header.d=arm.com header.i=@arm.com header.a=rsa-sha256 header.s=foss header.b=vkBqVypx;
	arc=none smtp.remote-ip=217.140.110.172
Received: from foss.arm.com (foss.arm.com [217.140.110.172])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id A7939606A31C
	for <sashiko-reviews@lists.linux.dev>; Tue, 17 Nov 2026 15:35:07 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org A7939606A31C
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=arm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=arm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=arm.com header.i=@arm.com header.a=rsa-sha256 header.s=foss header.b=vkBqVypx
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 897091A00;
	Tue, 17 Nov 2026 07:34:58 -0800 (PST)
Received: from [10.43.16.26] (e126510-lin.lund.arm.com [10.43.16.26])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id C31583F882;
	Tue, 17 Nov 2026 07:34:54 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=arm.com; s=foss;
	t=1794929701; bh=rP7KiWPD0Id1yjvR0kzV0PUGClLaAk2UzopsCTR8iXY=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=vkBqVypxWVEK5LoZ7prlEXUs+182UcWbwJNtHajfHxyCB/ZsPtloSqMts21tJ6+14
	 3BALBcz95wEISSjYK0axlgMbpfdE1rEPWnIt/7JN7JQVTHc/TrM7olVQxruDTfiWSI
	 2KG/AKWkrbBf44WJNNml+uDaICPTdOACqGBdM5Lo=
Message-ID: <bdf0cda1-049e-41cc-a2bc-161a36d269aa@arm.com>
Date: Tue, 17 Nov 2026 16:34:52 +0100
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
Subject: Re: [PATCH RFC v10 20/22] arm64: kpkeys: Enable
 kpkeys_hardened_pgtables support
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
 <20261109-kpkeys-v10-20-aa6c4d9603bc@arm.com>
 <sashiko-outbox-207334@kernel.org>
From: Kevin Brodsky <kevin.brodsky@arm.com>
Content-Language: en-GB
In-Reply-To: <sashiko-outbox-207334@kernel.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 10/11/2026 17:02, sashiko-bot@kernel.org wrote:
> [Severity: High]
> Does enabling CONFIG_KPKEYS_HARDENED_PGTABLES cause hibernation resume and
> kexec relocation to fault when writing through the transitional linear map?
>
> When kpkeys_hardened_pgtables is active, linear-map PTEs for page table
> pages carry KPKEYS_PKEY_PGTABLES, which is read-only under POR_EL1_INIT.
> Both swsusp_arch_resume() and machine_kexec_post_load() call
> trans_pgd_create_copy() to build a writable copy of the linear map so
> swsusp_arch_suspend_exit() and arm64_relocate_new_kernel() can overwrite
> existing kernel memory, including page tables:
>
> arch/arm64/mm/trans_pgd.c:copy_pte() {
> 	...
> 		__set_pte(dst_ptep, pte_mkvalid_k(pte_mkwrite_novma(pte)));
> 	...
> }
>
> Neither pte_mkwrite_novma() nor pte_mkvalid_k() clears PTE_PO_IDX_MASK, and
> POR_EL1 remains set to POR_EL1_INIT during the copy.  Any store in
> swsusp_arch_suspend_exit() or arm64_relocate_new_kernel() to a destination
> page that was a page table when trans_pgd_create_copy() ran will trigger a
> fatal synchronous EL1 Permission Overlay fault with DAIF masked.  Clearing
> PTE_PO_IDX_MASK (or setting the default pkey) in copy_pte() would avoid
> preserving the read-only overlay in the transitional page tables.

Confirmed that issue by getting kexec to reuse the running kernel's
physical pages when loading the new image:

$ kexec -l Image -c --mem-min <addr>

where <addr> is the physical address of the running kernel as reported
by /proc/iomem. This causes a crash as some of the static page table
pages in the kernel's data segment are remapped with POIndex 1 when
walking early page tables (patch 13), and the transitional linear map
inherits the POIndex, preventing writes to these pages with the default
value of POR_EL1.

Agreed that clearing the POIndex in copy_pte() is the right thing to do.
We already make all mappings present and writeable; resetting their
POIndex is another required step to ensure the mapped memory can be
written. Higher level tables should be handled in the same way, in case
we protect whole blocks in the future.

- Kevin
