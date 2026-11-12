Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=217.140.110.172
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794489707;
	b=3qiNaOvyNddHBZeqg3Q3kTqaSJKSbzoMoBPJWgYY/qrXLI3RAAnosusDGITReGIaW+CM
	 Nqd3aFQkxNprLrLYQlDPEF7fU9ot2QlBQCLqzZHFkmfPQs5oJoSJx7u+TsDq8mAyO5Ar0
	 s/rbamJOQFqIaLY1+TiLfdB+4REdt86IoECyA+VU3DRGU7DfGk29pi72Iej0kw0taLKNA
	 /IwOstRnRzZ2WPsnsu53LN+EI8cwGUIGVnqUSB0hkm9GEO3aUXdyd+33mliAWyopDFioD
	 gX8WLVKsFl1sIYuTMzb1OBpr3AjkuQmcbkRpD90mjOQf92NrR8aeCDz5/BfTOFieI7w==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794489707;
	h=DMARC-Filter:Received:Received:DKIM-Signature:Message-ID:Date:
	 MIME-Version:User-Agent:Subject:To:Cc:References:From:
	 Content-Language:In-Reply-To:Content-Type:Content-Transfer-Encoding;
	bh=cjqczUye1MVwPqhaOlQgDiP5yhV0lWKaPzJ6WzQm5OE=;
	b=iVzc7/4CGkzLBQ1dbPueBzucljF8zENTsDto5+PX7/SZjUzEUCNnFdMTNFECTEIcWXbI
	 0XtXTMRyiM/g738QKVK6DMcfQE2hqi165eQV/qnY8OYS+TpI33w+c/+K2I0Astmhvr2m5
	 MZR5K0RVmollaw8UGYqKobAeNtHfi2R8DGAdXSfz4dzXwlrkGa6YtzIXw+N1wy8JntSxc
	 HNnevqWuPVisLkUXH/mkKNvw/1Q37HF8iYn5koGsU1ch/4F8U65BmgYuCrsQkPx69AXkg
	 pLWu9qz0YtRyNsO8oQAB3MKHiIZhx8gxX9JcpL+X0TlFaMsgulnhEb3ThKJFPV3+elA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=arm.com;
	spf=pass smtp.mailfrom=arm.com;
	dkim=pass header.d=arm.com header.i=@arm.com header.a=rsa-sha256 header.s=foss header.b=dcVeGkuz;
	arc=none smtp.remote-ip=217.140.110.172
Received: from foss.arm.com (foss.arm.com [217.140.110.172])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 449FB606A31C
	for <sashiko-reviews@lists.linux.dev>; Thu, 12 Nov 2026 13:21:47 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 449FB606A31C
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=arm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=arm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=arm.com header.i=@arm.com header.a=rsa-sha256 header.s=foss header.b=dcVeGkuz
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 63726165C;
	Thu, 12 Nov 2026 05:21:43 -0800 (PST)
Received: from [10.57.59.183] (unknown [10.57.59.183])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 193F63FA7A;
	Thu, 12 Nov 2026 05:21:39 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=arm.com; s=foss;
	t=1794489706; bh=HfYryOQX0VfevLVVawDWgNmplypwK1zuJ64tPBf60Vw=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=dcVeGkuz8JRTli4xPVnr0cneyHwitzpVLR6K5+VmuJc5TLTZ3SfUxK00ybswx7BHw
	 ZABhy4k+P+PlalTjxCNRVuyEB+uUvxZ5kl4kQRedzTz5e4bpIBQT65bhwnQBBCJ2k7
	 rstlfOYgzutGXSfnrukT/eNGHieeTuBJwM+G1P/I=
Message-ID: <e1cbaf1c-940e-4298-a5f7-dcfbe12ec7dc@arm.com>
Date: Thu, 12 Nov 2026 14:21:37 +0100
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
Subject: Re: [PATCH RFC v10 19/22] arm64: kpkeys: Batch KPKEYS_CTX_PGTABLES
 switches
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
 <20261109-kpkeys-v10-19-aa6c4d9603bc@arm.com>
 <sashiko-outbox-207333@kernel.org>
From: Kevin Brodsky <kevin.brodsky@arm.com>
Content-Language: en-GB
In-Reply-To: <sashiko-outbox-207333@kernel.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 10/11/2026 17:02, sashiko-bot@kernel.org wrote:
> Thank you for your contribution! Sashiko AI review found 1 potential
> issue to consider:
> - [Medium] arm64: kpkeys: POR_EL1 desync with is_lazy_mmu_mode_active()
>   on entry/exit
> --
>
> commit 1b260fb8242fe345fd5e4bdc00ba9a4272383991
> Author: Kevin Brodsky <kevin.brodsky@arm.com>
>
> arm64: kpkeys: Batch KPKEYS_CTX_PGTABLES switches
>
> This commit batches KPKEYS_CTX_PGTABLES context switches across lazy MMU
> sections by switching POR_EL1 when entering and leaving lazy MMU mode and
> skipping per-write guard switches while lazy MMU mode is active.
>
>> diff --git a/arch/arm64/include/asm/pgtable.h b/arch/arm64/include/asm/pgtable.h
>> index 5f46d4cb38828..5e958531e6abe 100644
>> --- a/arch/arm64/include/asm/pgtable.h
>> +++ b/arch/arm64/include/asm/pgtable.h
>> @@ -43,10 +43,44 @@
>>  
>>  #ifdef CONFIG_KPKEYS_HARDENED_PGTABLES
>>  KPKEYS_GUARD_COND(kpkeys_hardened_pgtables, KPKEYS_CTX_PGTABLES,
>> -		  kpkeys_hardened_pgtables_enabled())
>> -#else
>> +		  kpkeys_hardened_pgtables_enabled() &&
>> +		  !is_lazy_mmu_mode_active())
>> +
>> +static inline void kpkeys_lazy_mmu_enter(void)
>> +{
>> +	if (!kpkeys_hardened_pgtables_enabled())
>> +		return;
>> +
>> +	current->thread.kpkeys_state_lazy_mmu =
>> +		kpkeys_enter_context(KPKEYS_CTX_PGTABLES);
>> +}
> [Severity: Medium]
> Can a synchronous exception between updating current->lazy_mmu_state and
> switching SYS_POR_EL1 cause a fatal permission fault when writing to page
> tables?

Sashiko already reported this on RFC v9. What I concluded is that this
is very unlikely - we shouldn't get a (non-fatal) synchronous exception
in that window. The one plausible case is kprobes, and I guess the
answer to that one is: don't put a kprobe there :) (We can't easily
enforce this though as NOKPROBE_SYMBOL() doesn't work for inlined
functions.)

A more serious concern is that since RFC v7, POR_EL1 is no longer reset
on exception entry, because that doesn't play well with lazy MMU mode
either [1]. If we found a way for lazy MMU mode to be fully disabled
while exceptions are handled, then it should address both concerns at
the same time.

- Kevin

[1]
https://lore.kernel.org/linux-hardening/7dc9485d-a822-494d-9384-4a973c782c11@arm.com/

> lazy_mmu_mode_enable() and __task_lazy_mmu_mode_resume() mark
> current->lazy_mmu_state active before calling arch_enter_lazy_mmu_mode():
>
> include/linux/pgtable.h:lazy_mmu_mode_enable() {
>     ...
> 	if (state->enable_count++ == 0)
> 		arch_enter_lazy_mmu_mode();
> }
>
> On arm64, synchronous kernel exceptions (such as kprobes or KFENCE page
> faults) do not set NMI, hardirq, or softirq bits in preempt_count(), so
> in_interrupt() remains false and is_lazy_mmu_mode_active() returns true:
>
> lazy_mmu_mode_enable()
>   state->enable_count++ (0 -> 1)
>   <synchronous exception, e.g. kprobe / KFENCE fault>
>     ...
>       __set_pte_nosync()
>         guard(kpkeys_hardened_pgtables)()
>           is_lazy_mmu_mode_active() == true  <-- skips POR_EL1 switch
>         WRITE_ONCE(*ptep, pte)               <-- unhandled EL1 permission fault
>   arch_enter_lazy_mmu_mode()
>     kpkeys_lazy_mmu_enter()
>
> Because is_lazy_mmu_mode_active() is already true while SYS_POR_EL1 still
> maps KPKEYS_PKEY_PGTABLES as read-only, both a nested
> lazy_mmu_mode_enable() and guard(kpkeys_hardened_pgtables)() skip
> switching SYS_POR_EL1, and the page table write faults.
>
> A symmetric window exists in lazy_mmu_mode_disable() and
> __task_lazy_mmu_mode_pause(), where enable_count or pause_count is updated
> before arch_leave_lazy_mmu_mode() restores SYS_POR_EL1.  A synchronous
> exception in that window that enters a nested lazy_mmu_mode_enable() sees
> SYS_POR_EL1 already set to KPKEYS_CTX_PGTABLES and overwrites
> kpkeys_state_lazy_mmu.entered_context with false, causing the outer
> kpkeys_lazy_mmu_exit() to leave SYS_POR_EL1 writable.


