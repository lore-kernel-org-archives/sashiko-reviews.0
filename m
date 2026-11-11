Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=217.140.110.172
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794410341;
	b=2SY+XLE6KKONyLazlrP/R5TfZkR1NasHNRReJn+aoN9XZ9AfVYBBrHYc9YRIBDlKPCnV
	 GlJU6uvqdh/reICITjj5Bos1qGSh00SLoUxV2RfOS96YeKzTAequTQmQytwDuzh6lStTZ
	 dT8MMsSKrRLaaQ7CyWPBc+Q7ALX/vin7FK/Ga58q88sNt4wAWov5sIIf/poLT5biWjScj
	 w1fcWzGuVDfEDPFwD8v6V42fNF0s+DH6rk0mSWnbgOV7R8BhDSLuqiXJfxphaTXhQ3aIc
	 Vf1/2ISC4pOuwfXlsRXTHpUr2ddmOyYmFgnN7sh4N0ebhmFjQkbAKDwuDKwkqKpaJ3g==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794410341;
	h=DMARC-Filter:Received:Received:DKIM-Signature:Message-ID:Date:
	 MIME-Version:User-Agent:Subject:To:Cc:References:From:
	 Content-Language:In-Reply-To:Content-Type:Content-Transfer-Encoding;
	bh=KRk3hY6OxrgIUUvXnGsk+3o0qrfqVOAaie3G63vpVoQ=;
	b=3KmgNDJRaGphFVTrKRDs0ew9+ttouStzQWeZqFtVIJ4lWU5b3pmttWBKXA3aLs7VXTGY
	 5n4eqxLOU6XVJS4pL90EpXxFzvNiCBLOb3yd9AsYGm2T4s+Ms8F7vIABbZYJYFZUCNMGY
	 GcbnQnsNhSBCaaFaTd6h3Xab920iNG+aba8GCgKo2u0bsYcFGCJgYNwk4vgjZYtL2p3YN
	 UUJxh3CFxrA8FRj+4DGi6dHOCnfK5YEKa7LEnTYr1x+IsO86qKtiSsg9T4C7vpGc03hzt
	 Mr00ACN3HQnSd0L7AknADFSekyqTc7ZRsDXTQ4fVvL2PH7JQBi58kUadkUjut9Kw1og==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=arm.com;
	spf=pass smtp.mailfrom=arm.com;
	dkim=pass header.d=arm.com header.i=@arm.com header.a=rsa-sha256 header.s=foss header.b=QkPGJIg2;
	arc=none smtp.remote-ip=217.140.110.172
Received: from foss.arm.com (foss.arm.com [217.140.110.172])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 4288D606A326
	for <sashiko-reviews@lists.linux.dev>; Wed, 11 Nov 2026 15:19:01 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 4288D606A326
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=arm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=arm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=arm.com header.i=@arm.com header.a=rsa-sha256 header.s=foss header.b=QkPGJIg2
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 75D3B1576;
	Wed, 11 Nov 2026 07:18:57 -0800 (PST)
Received: from [10.43.20.72] (e126510-lin.lund.arm.com [10.43.20.72])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 4F7853F632;
	Wed, 11 Nov 2026 07:18:54 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=arm.com; s=foss;
	t=1794410340; bh=K/XoUAuP8agS+YAJXtE2UoZzMy+glW6cZvjG+mAtTjI=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=QkPGJIg2CJOeLzjtVDkULCNadPWNyrorR/1C3mAUX8c/pyOkkWvDHG9G3CGYEhMev
	 qUJgES66VYZtNmeSHicJvJWPKlisEzf+05LgJxfpCQgOaimgsIvi/LnEu/6LHVJoQQ
	 7r13JTYY6omaLAN2C8gYibM2JsE67D2KGh3HWRew=
Message-ID: <fe64be42-03aa-43fc-bdcd-e6b581eb9984@arm.com>
Date: Wed, 11 Nov 2026 16:18:50 +0100
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
Subject: Re: [PATCH RFC v10 04/22] arm64: Implement asm/kpkeys.h using POE
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
 <20261109-kpkeys-v10-4-aa6c4d9603bc@arm.com>
 <sashiko-outbox-207318@kernel.org>
From: Kevin Brodsky <kevin.brodsky@arm.com>
Content-Language: en-GB
In-Reply-To: <sashiko-outbox-207318@kernel.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 10/11/2026 17:02, sashiko-bot@kernel.org wrote:
>> [...]
>>
>> +#ifdef CONFIG_ARM64_POE
>> +
>> +static inline u64 por_set_kpkeys_context(u64 por, enum kpkeys_ctx ctx)
>> +{
>> +	por = por_elx_set_pkey_perms(por, 0, POE_RWX);
>> +
>> +	return por;
>> +}
>> +
>> +static __always_inline void __kpkeys_set_pkey_reg_nosync(u64 pkey_reg)
>> +{
>> +	/*
>> +	 * Writing to POR_EL1 potentially affects all memory accesses, so
>> +	 * use barrier() to ensure load/store instructions cannot be reordered
>> +	 * past the write.
>> +	 */
>> +	barrier();
>> +	write_sysreg_s(pkey_reg, SYS_POR_EL1);
>> +	barrier();
>> +}
>> +
>> +static __always_inline
>> +bool arch_kpkeys_enter_context(enum kpkeys_ctx ctx,
>> +			       struct arch_kpkeys_state *state)
>> +{
>> +	const u64 prev_por = read_sysreg_s(SYS_POR_EL1);
>> +	const u64 new_por = por_set_kpkeys_context(prev_por, ctx);
>> +
>> +	if (prev_por == new_por)
>> +		return false;
>> +
>> +	state->por = prev_por;
> [Severity: Medium]
> Should this block be guarded by CONFIG_ARCH_HAS_KPKEYS instead of
> CONFIG_ARM64_POE?
>
> include/linux/kpkeys_types.h only includes <asm/kpkeys_types.h> (for
> struct arch_kpkeys_state) and defines enum kpkeys_ctx when
> CONFIG_ARCH_HAS_KPKEYS is enabled:
>
> include/linux/kpkeys_types.h:
>     #ifdef CONFIG_ARCH_HAS_KPKEYS
>     #include <asm/kpkeys_types.h>
>     #endif
>
>     #if defined(CONFIG_ARCH_HAS_KPKEYS) && !defined(__ASSEMBLY__)
>
>     enum kpkeys_ctx {
>     	KPKEYS_CTX_DEFAULT = 0,
>     	KPKEYS_CTX_COUNT,
>     };
>
> Because CONFIG_ARM64_POE is enabled by default on arm64 and does not
> select ARCH_HAS_KPKEYS until the later commit "arm64: Enable kpkeys",
> when commit "arm64: Context-switch POR_EL1" includes <asm/kpkeys.h> in
> arch/arm64/kernel/process.c, the build fails with incomplete type errors
> for enum kpkeys_ctx and struct arch_kpkeys_state, breaking bisection.

Will use CONFIG_ARCH_HAS_KPKEYS instead. The idea was that this
implementation is POE-specific, but in fact another implementation would
likely be runtime-selected so using the generic #ifdef makes more sense.

- Kevin
