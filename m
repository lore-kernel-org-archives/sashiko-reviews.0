Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=217.140.110.172
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794398057;
	b=qI+1xMCyuAuMC6KV9fKaKphsrKnZ4jBJdh46b4KdIWNpImncEWVY+W3V/LY98lKWN3l+
	 ucZazVw8sRKF/ntdlGqZUrJuXerrS60dSKqKHVvtUNtTwIGR2/UQHSDK1PK0XxpjNud0G
	 dHnARZCktrLCdlW5nsFP3ixUC2m3FCeskLqKalKR3c6P40yUTQYX9VSk4FPWvlFx6tCRk
	 VpdTw/Ld44DgPLyHo/rd5YY/O1R3kD366owLFiRfLhV7OqmU+iM7K0hbdXldQNxISkiD0
	 ho9o1Cy4WlSpDeW/wBJG82VNyQASpAkDh/iw5O6Z84iOonffk2/yrzx1EgaHUqtbURw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794398057;
	h=DMARC-Filter:Received:Received:DKIM-Signature:Date:From:To:Cc:
	 Subject:Message-ID:References:MIME-Version:Content-Type:
	 Content-Disposition:Content-Transfer-Encoding:In-Reply-To;
	bh=iRUIMS49hoSOEmD7qxA40rIo2Cj8FT0pTAOH5mtilWQ=;
	b=GzUudUQDJYwN3GaeJa6a2huyNFQJjbZbT5zeJ0/XOdAzksAORD+ILGGr/1uP9q4svYYb
	 u8P2HEtLCfo6+jiKonYsuyQln3q23Ohbukg2fCcPGR4U/X+ub+YrO3n0gyn8Gd4ub2LzQ
	 R9yNn7abhHvCS1cJPlXM6bMSwzmtACX2iZV7tWjq3ap/uBik6UY0+ZTLW5ktQKLsmDfkl
	 dmKCoI9Mu8vCt4iffVBP/5g0ME88RJq1uygB05bY4l7YLLJdeiijZ/eqBpdFrwSqEyrom
	 7MQ8UzckQ695cMucfT2AuDv2ydXgaz2GlhgGlZ0e6m9PZA8GuOH6xbot3IG/6jwE+tA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=arm.com;
	spf=pass smtp.mailfrom=arm.com;
	dkim=pass header.d=arm.com header.i=@arm.com header.a=rsa-sha256 header.s=foss header.b=CeDjNYV+;
	arc=none smtp.remote-ip=217.140.110.172
Received: from foss.arm.com (foss.arm.com [217.140.110.172])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 1D99F606A31C
	for <sashiko-reviews@lists.linux.dev>; Wed, 11 Nov 2026 11:54:17 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 1D99F606A31C
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=arm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=arm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=arm.com header.i=@arm.com header.a=rsa-sha256 header.s=foss header.b=CeDjNYV+
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 857361576;
	Wed, 11 Nov 2026 03:54:13 -0800 (PST)
Received: from localhost (a085714.arm.com [10.164.19.28])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id C754C3F673;
	Wed, 11 Nov 2026 03:54:15 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=arm.com; s=foss;
	t=1794398056; bh=vxb8GWA/SO+8jrDRzmH3YqjJX7cIOf8js4OHf9oUj8I=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=CeDjNYV+DU+n1kv8g/R00VkmjUistcizknOF0lJDila5M+/zvChfcilFDI4dD+a+t
	 WTLpTd7uc0u4qY6x/s9XVKNMs+ViIfmYuQvFTnxCT/CNk/Ab8g/fXjU/BcBU6zQmPt
	 ruup/KASfrX/MiGPuq4eBBsTGorRly6spqexOL4E=
Date: Wed, 11 Nov 2026 17:24:13 +0530
From: Anshuman Khandual <anshuman.khandual@arm.com>
To: sashiko-reviews@lists.linux.dev
Cc: catalin.marinas@arm.com, will@kernel.org, 
	Ryan Roberts <ryan.roberts@arm.com>, Mark Rutland <mark.rutland@arm.com>, 
	Lorenzo Stoakes <ljs@kernel.org>, Andrew Morton <akpm@linux-foundation.org>, 
	David Hildenbrand <david@kernel.org>, Mike Rapoport <rppt@kernel.org>, 
	Linu Cherian <linu.cherian@arm.com>, linux-mm@kvack.org, kasan-dev@googlegroups.com
Subject: Re: [PATCH V4 4/4] arm64/mm: Use pgdp_get() for PGD accesses
Message-ID: <ohyhflzuoxdemccemutoosmj5hsfwylrlt6tvnyehulerk7gf3@ada6wu4zrzkp>
References: <20261105043403.3326445-1-anshuman.khandual@arm.com>
 <20261105043403.3326445-5-anshuman.khandual@arm.com>
 <sashiko-outbox-200739@kernel.org>
X-Mailing-List: sashiko-reviews@lists.linux.dev
List-Id: <sashiko-reviews.lists.linux.dev>
List-Post: <mailto:sashiko-reviews@lists.linux.dev>
List-Help: <mailto:sashiko-reviews+help@lists.linux.dev>
List-Subscribe: <mailto:sashiko-reviews+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:sashiko-reviews+unsubscribe@lists.linux.dev>
List-Owner: <mailto:sashiko-reviews+owner@lists.linux.dev>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <sashiko-outbox-200739@kernel.org>

On Fri, Nov 06, 2026 at 04:34:47AM +0000, sashiko-bot@kernel.org wrote:
> Thank you for your contribution! Sashiko AI review found 1 potential issue(s) to consider:
> - [High] arm64/mm: KASAN fault in p4d_offset_phys() during kasan_early_init()
> --
> 
> commit e9bf68a7a555b3c58c2a0a8736f337dde8136ab9
> Author: Anshuman Khandual <anshuman.khandual@arm.com>
> 
> arm64/mm: Use pgdp_get() for PGD accesses
> 
> This commit replaces READ_ONCE() with pgdp_get() for PGD accesses and moves
> p4d_offset() and p4d_offset_phys() from arch/arm64/include/asm/pgtable.h
> into arch/arm64/mm/mmu.c to avoid header include dependencies.
> 
> > diff --git a/arch/arm64/mm/mmu.c b/arch/arm64/mm/mmu.c
> > index 5b5a85a0527d6..11015e1deb32f 100644
> > --- a/arch/arm64/mm/mmu.c
> > +++ b/arch/arm64/mm/mmu.c
> [ ... ]
> > @@ -2463,3 +2463,17 @@ pud_t *pud_offset(p4d_t *p4dp, unsigned long addr)
> >  	return pud_offset_lockless(p4dp, p4dp_get(p4dp), addr);
> >  }
> >  #endif /* CONFIG_PGTABLE_LEVELS > 3 */
> > +
> > +#if CONFIG_PGTABLE_LEVELS > 4
> > +phys_addr_t p4d_offset_phys(pgd_t *pgdp, unsigned long addr)
> > +{
> > +	VM_WARN_ON_ONCE(!pgtable_l5_enabled());
> > +
> > +	return pgd_page_paddr(pgdp_get(pgdp)) + p4d_index(addr) * sizeof(p4d_t);
> > +}
> 
> [Severity: High]
> Does moving p4d_offset_phys() (and pud_offset_phys() in the preceding patch)
> out-of-line into arch/arm64/mm/mmu.c cause a translation fault during early
> boot when KASAN is enabled with 5-level (or 4-level) page tables?
> 
> During early boot, __primary_switched calls kasan_early_init() before the
> KASAN shadow region is mapped. Because any KASAN shadow check will fault
> until kasan_early_init() finishes populating the early shadow page tables,
> arch/arm64/mm/Makefile disables KASAN sanitization for kasan_init.o:
> 
>     KASAN_SANITIZE_kasan_init.o := n
> 
> and set_swapper_pgd() in arch/arm64/mm/mmu.c is marked noinstr for the same
> reason.
> 
> When kasan_early_init() populates the shadow page tables, it calls into
> p4d_offset_phys() and pud_offset_phys():
> 
>     kasan_early_init()
>       kasan_pgd_populate(..., early=true)
>         kasan_p4d_populate(..., early=true)
>           kasan_p4d_offset(..., early=true)
>             p4d_offset_kimg()
>               p4d_offset_phys()
>           kasan_pud_populate(..., early=true)
>             kasan_pud_offset(..., early=true)
>               pud_offset_kimg()
>                 pud_offset_phys()
> 
> Previously, p4d_offset_phys() and pud_offset_phys() were static inline
> functions in arch/arm64/include/asm/pgtable.h, so calls from kasan_init.c
> were inlined into kasan_init.o and compiled without KASAN instrumentation.
> 
> Now that both functions live in arch/arm64/mm/mmu.c, which is KASAN-sanitized,
> the compiler emits KASAN shadow checks for their memory accesses (such as
> pgdp_get(pgdp), p4dp_get(p4dp), and vabits_actual) before the early shadow
> memory is mapped.
> 
> Should p4d_offset_phys() and pud_offset_phys() be marked noinstr or
> __no_sanitize_address?
> 
> -- 
> Sashiko AI review · https://sashiko.dev/#/patchset/20261105043403.3326445-1-anshuman.khandual@arm.com?part=4
> 

The kernel does fail to boot with CONFIG_KASAN enabled and PGTABLE_LEVELS = 5.
An example configuration would be as follows aka 'defconfig' with CONFIG_KASAN

------------------------
CONFIG_ARM64_4K_PAGES=y
CONFIG_ARM64_VA_BITS_52=y
CONFIG_ARM64_VA_BITS=52
CONFIG_ARM64_PA_BITS_52=y
CONFIG_ARM64_PA_BITS=52

CONFIG_KASAN_SHADOW_OFFSET=0xdfff800000000000
CONFIG_HAVE_ARCH_KASAN=y
CONFIG_HAVE_ARCH_KASAN_SW_TAGS=y
CONFIG_HAVE_ARCH_KASAN_HW_TAGS=y
CONFIG_HAVE_ARCH_KASAN_VMALLOC=y
CONFIG_CC_HAS_KASAN_GENERIC=y
CONFIG_CC_HAS_KASAN_SW_TAGS=y
CONFIG_KASAN=y
CONFIG_CC_HAS_KASAN_MEMINTRINSIC_PREFIX=y
CONFIG_KASAN_GENERIC=y
CONFIG_KASAN_INLINE=y
CONFIG_KASAN_STACK=y
CONFIG_KASAN_VMALLOC=y
------------------------

The following change fixes the problem. Although not sure if this is worth
the churn. Earlier vesion V3 might be a better trade off where all generic
pxdp_get() helpers were just copied over into the platform thus preventing
subsequent header to C movement in the first place which caused this KASAN
problem.

------------------------
diff --git a/arch/arm64/include/asm/pgtable.h b/arch/arm64/include/asm/pgtable.h
index 6a38de07e599..d0b3292ee18e 100644
--- a/arch/arm64/include/asm/pgtable.h
+++ b/arch/arm64/include/asm/pgtable.h
@@ -940,7 +940,7 @@ static inline void p4d_clear(p4d_t *p4dp)
                set_p4d(p4dp, __p4d(0));
 }

-static inline phys_addr_t p4d_page_paddr(p4d_t p4d)
+static __always_inline phys_addr_t p4d_page_paddr(p4d_t p4d)
 {
        return __p4d_to_phys(p4d);
 }
@@ -1057,7 +1057,7 @@ static inline void pgd_clear(pgd_t *pgdp)
                set_pgd(pgdp, __pgd(0));
 }

-static inline phys_addr_t pgd_page_paddr(pgd_t pgd)
+static __always_inline phys_addr_t pgd_page_paddr(pgd_t pgd)
 {
        return __pgd_to_phys(pgd);
 }
diff --git a/arch/arm64/mm/mmu.c b/arch/arm64/mm/mmu.c
index 1f56db9a946c..14e3b0387ed7 100644
--- a/arch/arm64/mm/mmu.c
+++ b/arch/arm64/mm/mmu.c
@@ -2452,7 +2452,7 @@ bool pmdp_test_and_clear_young(struct vm_area_struct *vma, unsigned long address
 #endif /* CONFIG_TRANSPARENT_HUGEPAGE || CONFIG_ARCH_HAS_NONLEAF_PMD_YOUNG */

 #if CONFIG_PGTABLE_LEVELS > 3
-phys_addr_t pud_offset_phys(p4d_t *p4dp, unsigned long addr)
+phys_addr_t noinstr pud_offset_phys(p4d_t *p4dp, unsigned long addr)
 {
        VM_WARN_ON_ONCE(!pgtable_l4_enabled());

@@ -2466,7 +2466,7 @@ pud_t *pud_offset(p4d_t *p4dp, unsigned long addr)
 #endif /* CONFIG_PGTABLE_LEVELS > 3 */

 #if CONFIG_PGTABLE_LEVELS > 4
-phys_addr_t p4d_offset_phys(pgd_t *pgdp, unsigned long addr)
+phys_addr_t noinstr p4d_offset_phys(pgd_t *pgdp, unsigned long addr)
 {
        VM_WARN_ON_ONCE(!pgtable_l5_enabled());

diff --git a/include/linux/pgtable.h b/include/linux/pgtable.h
index 780fe849ff8b..5e88015cdaac 100644
--- a/include/linux/pgtable.h
+++ b/include/linux/pgtable.h
@@ -511,14 +511,14 @@ static inline pud_t pudp_get(const pud_t *pudp)
 #endif

 #ifndef p4dp_get
-static inline p4d_t p4dp_get(const p4d_t *p4dp)
+static __always_inline p4d_t p4dp_get(const p4d_t *p4dp)
 {
        return READ_ONCE(*p4dp);
 }
 #endif

 #ifndef pgdp_get
-static inline pgd_t pgdp_get(const pgd_t *pgdp)
+static __always_inline pgd_t pgdp_get(const pgd_t *pgdp)
 {
        return READ_ONCE(*pgdp);
 }
------------------------
