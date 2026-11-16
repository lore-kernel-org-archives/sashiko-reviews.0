Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=217.140.110.172
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794844893;
	b=in03ox93mxIk2DuUxYP4P8dH1IXywSpL6+x162ensvoVtalhD88x2eXV5Vzz7aS5L913
	 1MAzsfeMBO/gwT4Jz8dUyGBDOYOOYaiBfFjik4yQ0H4iIdf9Iysm+VjEeY/DBhH+SxFsj
	 ULklX78XIy4qrBMoQ1TKuoJnivpJ4GV8QloWqe1NwXSE/FgXxRtOAJh5d3aiKtfJeil+m
	 cp1ni3ZU64/TX3m+imzEs4XGZWD+O5O8H6sfCg7Tu2Xo1bTWIV6ufAT8j3/iHE9RjPOiJ
	 FtTFhVgRA3xpQh2qtkQgK4jp3URHm9nbYqTLjJ8wKcRzXeFJZPbaMQ0OK8BLNUwzBhA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794844893;
	h=DMARC-Filter:Received:Received:DKIM-Signature:Message-ID:Date:
	 MIME-Version:User-Agent:Subject:To:Cc:References:From:
	 Content-Language:In-Reply-To:Content-Type:Content-Transfer-Encoding;
	bh=Jgg5EKN99U8VWXl+ylwhKyqraBlgCj53d3cDuGHQiY4=;
	b=s/JX0thVkzebq3L15f+MM6APpdZWj1SboTYx4+oFnr7E12NdzGf2l5dUM+nb6HX6sGrm
	 ATgY7VGo0FgkRyGdZxsoiGbkZxE5BS+iotAfOLXF2n0rwRQBFsoGVRuw5AlVjdnf0G/4j
	 LrGbGZwa6+kPrqmf41o93opGgks/dEeHScp1JbYJ13+K91cqGE3QEw1zMU1xtpBhC4gt5
	 OtFP+xWwqrPDK2EzijGEmofETWAH2vyut8/8Tr/56e7E11YbYQu25OA55vvs/VaMToHmi
	 yhR7FEnY6+7GLJOS6aVTMSXmmUaPvtdcsn1OyK4rY2aomMm9Sh16CsNPqP9X3TEXM2w==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=arm.com;
	spf=pass smtp.mailfrom=arm.com;
	dkim=pass header.d=arm.com header.i=@arm.com header.a=rsa-sha256 header.s=foss header.b="ethP/+I0";
	arc=none smtp.remote-ip=217.140.110.172
Received: from foss.arm.com (foss.arm.com [217.140.110.172])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 36BE2606A322
	for <sashiko-reviews@lists.linux.dev>; Mon, 16 Nov 2026 16:01:32 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 36BE2606A322
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=arm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=arm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key, unprotected) header.d=arm.com header.i=@arm.com header.a=rsa-sha256 header.s=foss header.b=ethP/+I0
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 235B31684;
	Mon, 16 Nov 2026 08:01:27 -0800 (PST)
Received: from [10.57.62.118] (unknown [10.57.62.118])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id F40773F763;
	Mon, 16 Nov 2026 08:01:23 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=arm.com; s=foss;
	t=1794844890; bh=FbZg7NHHCz6rr+xeyl8Jzirm2hXhzTWlvIqCbcztP+o=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=ethP/+I0Wt5Q7NXiFSu2kgNONXgJK6hDf8j0f5OQz/5k64NfduehJGmItzqrqLBds
	 lrNV8tE12J8Ci7T8dcM74qRk/uBu1OZSmLhvZif4We4Gh55Xul48FXbGFwMl6G+c5C
	 gf6IUWWMZAdXqScLocJkvtdyQHmulLn3N+yfKYGg=
Message-ID: <21e5ddae-c115-4d30-ab5b-ea669a66c9d4@arm.com>
Date: Mon, 16 Nov 2026 17:01:21 +0100
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
Subject: Re: [PATCH RFC v10 10/22] arm64: Enable kpkeys
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
 <20261109-kpkeys-v10-10-aa6c4d9603bc@arm.com>
 <sashiko-outbox-207324@kernel.org>
From: Kevin Brodsky <kevin.brodsky@arm.com>
Content-Language: en-GB
In-Reply-To: <sashiko-outbox-207324@kernel.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 10/11/2026 17:02, sashiko-bot@kernel.org wrote:
>> @@ -2334,8 +2335,10 @@ static void cpu_enable_mops(const struct arm64_cpu_capabilities *__unused)
>>  #ifdef CONFIG_ARM64_POE
>>  static void cpu_enable_poe(const struct arm64_cpu_capabilities *__unused)
>>  {
>> -	sysreg_clear_set(REG_TCR2_EL1, 0, TCR2_EL1_E0POE);
>> +	write_sysreg_s(POR_EL1_INIT, SYS_POR_EL1);
>> +	sysreg_clear_set(REG_TCR2_EL1, 0, TCR2_EL1_E0POE | TCR2_EL1_POE);
>>  	sysreg_clear_set(CPACR_EL1, 0, CPACR_EL1_E0POE);
>> +	isb();
>>  }
>>  #endif
> [Severity: Medium]
> Does enabling TCR2_EL1_POE here break privileged EL1 accesses to user
> memory when S1POE is present without S1PIE (for example, in a KVM guest
> configured with FEAT_S1POE=1 and FEAT_S1PIE=0)?

That one is a very good point. FEAT_S1POE does not require FEAT_S1PIE,
so it is technically possible that an implementation has POE but not
PIE, and in that case things will go wrong as described below (confirmed
on FVP).

There are ways we could deal with this, but they are more invasive as,
without PIE, POR_EL1 restricts all accesses via TTBR1. Without evidence
that POE would ever be implemented without PIE, I think it is reasonable
to remove this possibility by requiring PIE when detecting POE.

- Kevin

> Commit "arm64: mm: Enable overlays for all EL1 indirect permissions" relies
> on PIR_EL1 (PIE_E1) leaving user memory types without overlay (_O) so that
> privileged EL1 accesses to user pages (such as futex_atomic_op_inuser()
> using uaccess_enable_privileged() when FEAT_LSUI is absent) are not checked
> against POR_EL1.  When S1PIE is absent, stage-1 translations use direct
> permissions and TCR2_EL1_POE applies POR_EL1 to all privileged accesses,
> including TTBR0 user mappings.
>
> Because POR_EL1_INIT only permits pkey 0, a user mapping with pkey 1..7
> causes futex_atomic_op_inuser() to fault against POR_EL1 while
> fault_in_user_writeable() succeeds with unprivileged sttr against POR_EL0,
> resulting in an unbounded retry loop in futex_wake_op().
>
> Should TCR2_EL1_POE and arch_supports_kpkeys() (or ARM64_HAS_S1POE itself)
> require S1PIE to be supported and enabled?
