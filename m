Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794226728;
	b=fbnoa7nye3fGyWRUW2kxp/eI7nomU03COYwZhT526ibDY4lJE5UDrCwfETiExHMNqXcN
	 W6XxWABEjRfjudAfWchHA1tHaPhEcg5RgDoALe7z9sH3juGFuBTkDqDFrb8pTMLWgJzuF
	 JEYYtCaCkkhq6hUOKstkd59DtX4RdhVugxFgzH387z9H5RZurE6VCaQQb46kA10h6s+Gk
	 aTMIoo5Aol2TY8/yo/AnisKyzUs57ixzCdnog5xTO9VPr3SR+ums6U+mXBtXfxHOwzM2K
	 dizoBx/lM9y5uOuWtj0yWw1U1qTwxpTov5eMtfHhJBftQhu6pvsKK4ZgbujyS2MaZOQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794226728;
	h=Received:DKIM-Signature:Date:From:To:Cc:Subject:Message-ID:
	 References:MIME-Version:Content-Type:Content-Disposition:In-Reply-To;
	bh=ZMzmCKSIkoQfwrqG+6d9p6F4cnVpKsZmbCb0zDMSihk=;
	b=QdrM89WHMk4A+uhg3c0hiPpMZpS5UyZCQHpdaddR/+T3BvXJm/e2Poi6pt+LLlDwwrNe
	 HUTy8synzBEDRDJOiqp1FY6eBnqLV3r7vqxAbaZ2W1mjlUE+tPmXQl90EXaZsLn5QIZsf
	 vGefx8zxXNDRJIEalquedmd7XPMZMkKaYQY90MTWpNZMAkLPchBW/6PWZYVId3AobfnJV
	 btcgWVxJro6ris22/EBYkykdAqW7h134fQszT3WOSEL1zzGSMSG8APFo35OpJv+1K077G
	 7QmTbYstvLWPmUG4K7qxSyDyuGjB0j2XWR4qKiHGvAbM28A5jhr+WOgn3XUDPoA35aA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=VUWugq1T;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4F347606A31C
	for <sashiko-reviews@lists.linux.dev>; Mon,  9 Nov 2026 12:18:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=VUWugq1T
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 033011F0089F;
	Mon,  9 Nov 2026 12:18:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1794226727;
	bh=ZMzmCKSIkoQfwrqG+6d9p6F4cnVpKsZmbCb0zDMSihk=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=VUWugq1T8LES3WvDoryymkJe/5u+zIris0rGfjfH5o/eCc4OYGe/jqNNYSQBTkB08
	 yuLv0k+CV5aasQM+lmC5Q9cIim0b0K92C2mY25tBKSEpq+Che2kWXSdFTn/dLVOwY6
	 qoDFmAm4Ajg5HsFg8Lt/nfMALrPqyKwelqycnIuEm1E19ecReL+ARFKT71gfwXKctJ
	 gtHYhuzgfnt5Kv/8CHwcVEgLDCTpkEo1veT6Us7YPkhn+0uRh4q2brKBgUxWrDTzso
	 Sa7J4Cj4ddnkWVjvB/Eyhuy2SxOK5g1KKIqnF9o/X67vYD172gNC7JZT8CLTUmZgw6
	 qibxRFwKNjMoA==
Date: Mon, 9 Nov 2026 19:58:35 +0800
From: Jisheng Zhang <jszhang@kernel.org>
To: sashiko-reviews@lists.linux.dev
Cc: Catalin Marinas <catalin.marinas@arm.com>,
	Will Deacon <will@kernel.org>, Mark Rutland <mark.rutland@arm.com>,
	Andrey Ryabinin <ryabinin.a.a@gmail.com>,
	Alexander Potapenko <glider@google.com>,
	Andrey Konovalov <andreyknvl@gmail.com>,
	Dmitry Vyukov <dvyukov@google.com>,
	Vincenzo Frascino <vincenzo.frascino@arm.com>,
	Tejun Heo <tj@kernel.org>, Dennis Zhou <dennis@kernel.org>,
	Christoph Lameter <cl@gentwo.org>, kasan-dev@googlegroups.com,
	linux-mm@kvack.org
Subject: Re: [PATCH 4/4] arm64: alternatives: Make branch and ADRP offset
 helpers noinst
Message-ID: <avG1a9aVNdkiiGX_@xhacker>
References: <20261107071339.17467-1-jszhang@kernel.org>
 <20261107071339.17467-5-jszhang@kernel.org>
 <sashiko-outbox-203636@kernel.org>
X-Mailing-List: sashiko-reviews@lists.linux.dev
List-Id: <sashiko-reviews.lists.linux.dev>
List-Post: <mailto:sashiko-reviews@lists.linux.dev>
List-Help: <mailto:sashiko-reviews+help@lists.linux.dev>
List-Subscribe: <mailto:sashiko-reviews+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:sashiko-reviews+unsubscribe@lists.linux.dev>
List-Owner: <mailto:sashiko-reviews+owner@lists.linux.dev>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <sashiko-outbox-203636@kernel.org>

On Sun, Nov 08, 2026 at 07:43:58AM +0000, sashiko-bot@kernel.org wrote:
> Thank you for your contribution! Sashiko AI review found 1 potential
> issue to consider:
> - [Medium] arm64: insn: branch profiling instrumentation in noinstr
>   offset helpers
> --
> 
> commit b08429609214cdffaa257c9ef953b28e179973db
> Author: Jisheng Zhang <jszhang@kernel.org>
> 
> arm64: alternatives: Make branch and ADRP offset helpers noinst
> 
> This commit marks the branch and ADRP offset helpers noinstr and introduces
> __always_inline immediate encoding and decoding helpers so that
> patch_alternative() does not call instrumentable code while modifying
> instructions.
> 
> > diff --git a/arch/arm64/lib/insn.c b/arch/arm64/lib/insn.c
> > index e70ac02385153..b98610fcab32e 100644
> > --- a/arch/arm64/lib/insn.c
> > +++ b/arch/arm64/lib/insn.c
> 
> [ ... ]
> 
> > @@ -1299,23 +1316,23 @@ u32 aarch64_insn_gen_adr(unsigned long pc, unsigned long addr,
> >   * signed value (so it can be used when computing a new branch
> >   * target).
> >   */
> > -s32 aarch64_get_branch_offset(u32 insn)
> > +s32 noinstr aarch64_get_branch_offset(u32 insn)
> >  {
> >  	s32 imm;
> >  
> >  	if (aarch64_insn_is_b(insn) || aarch64_insn_is_bl(insn)) {
> > -		imm = aarch64_insn_decode_immediate(AARCH64_INSN_IMM_26, insn);
> > +		imm = __aarch64_insn_decode_immediate(AARCH64_INSN_IMM_26, insn);
> >  		return (imm << 6) >> 4;
> >  	}
> >  
> >  	if (aarch64_insn_is_cbz(insn) || aarch64_insn_is_cbnz(insn) ||
> >  	    aarch64_insn_is_bcond(insn)) {
> > -		imm = aarch64_insn_decode_immediate(AARCH64_INSN_IMM_19, insn);
> > +		imm = __aarch64_insn_decode_immediate(AARCH64_INSN_IMM_19, insn);
> >  		return (imm << 13) >> 11;
> >  	}
> >  
> >  	if (aarch64_insn_is_tbz(insn) || aarch64_insn_is_tbnz(insn)) {
> > -		imm = aarch64_insn_decode_immediate(AARCH64_INSN_IMM_14, insn);
> > +		imm = __aarch64_insn_decode_immediate(AARCH64_INSN_IMM_14, insn);
> >  		return (imm << 18) >> 16;
> >  	}
> >  
> > @@ -1327,35 +1344,35 @@ s32 aarch64_get_branch_offset(u32 insn)
> >   * Encode the displacement of a branch in the imm field and return the
> >   * updated instruction.
> >   */
> > -u32 aarch64_set_branch_offset(u32 insn, s32 offset)
> > +u32 noinstr aarch64_set_branch_offset(u32 insn, s32 offset)
> >  {
> >  	if (aarch64_insn_is_b(insn) || aarch64_insn_is_bl(insn))
> > -		return aarch64_insn_encode_immediate(AARCH64_INSN_IMM_26, insn,
> > +		return __aarch64_insn_encode_immediate(AARCH64_INSN_IMM_26, insn,
> >  						     offset >> 2);
> >  
> >  	if (aarch64_insn_is_cbz(insn) || aarch64_insn_is_cbnz(insn) ||
> >  	    aarch64_insn_is_bcond(insn))
> > -		return aarch64_insn_encode_immediate(AARCH64_INSN_IMM_19, insn,
> > +		return __aarch64_insn_encode_immediate(AARCH64_INSN_IMM_19, insn,
> >  						     offset >> 2);
> >  
> >  	if (aarch64_insn_is_tbz(insn) || aarch64_insn_is_tbnz(insn))
> > -		return aarch64_insn_encode_immediate(AARCH64_INSN_IMM_14, insn,
> > +		return __aarch64_insn_encode_immediate(AARCH64_INSN_IMM_14, insn,
> >  						     offset >> 2);
> >  
> >  	/* Unhandled instruction */
> >  	BUG();
> >  }
> >  
> > -s32 aarch64_insn_adrp_get_offset(u32 insn)
> > +s32 noinstr aarch64_insn_adrp_get_offset(u32 insn)
> >  {
> >  	BUG_ON(!aarch64_insn_is_adrp(insn));
> > -	return aarch64_insn_decode_immediate(AARCH64_INSN_IMM_ADR, insn) << 12;
> > +	return __aarch64_insn_decode_immediate(AARCH64_INSN_IMM_ADR, insn) << 12;
> >  }
> >  
> > -u32 aarch64_insn_adrp_set_offset(u32 insn, s32 offset)
> > +u32 noinstr aarch64_insn_adrp_set_offset(u32 insn, s32 offset)
> >  {
> >  	BUG_ON(!aarch64_insn_is_adrp(insn));
> > -	return aarch64_insn_encode_immediate(AARCH64_INSN_IMM_ADR, insn,
> > +	return __aarch64_insn_encode_immediate(AARCH64_INSN_IMM_ADR, insn,
> >  						offset >> 12);
> >  }
> 
> [Severity: Medium]
> Can these four noinstr helpers still call into ftrace_likely_update() when
> CONFIG_TRACE_BRANCH_PROFILING is enabled?
> 
> Although f22c81bebf8b ("arm64: Disable branch profiling for all arm64 code")
> added -DDISABLE_BRANCH_PROFILING to arch/arm64/Kbuild, arch/arm64/lib/ is
> built via libs-y in arch/arm64/Makefile rather than arch/arm64/Kbuild, so
> arch/arm64/lib/insn.o is compiled without DISABLE_BRANCH_PROFILING.
> 
> As a result, the generic BUG_ON() in aarch64_insn_adrp_get_offset() and
> aarch64_insn_adrp_set_offset() expands to unlikely(), and the if statements
> in aarch64_get_branch_offset() and aarch64_set_branch_offset() are
> instrumented under CONFIG_PROFILE_ALL_BRANCHES.  When patch_alternative()
> calls these helpers while patching live instructions before cache
> maintenance completes, they call the instrumentable ftrace_likely_update().
> 
> Passing -DDISABLE_BRANCH_PROFILING in arch/arm64/lib/Makefile (or defining
> DISABLE_BRANCH_PROFILING in arch/arm64/lib/insn.c) would prevent branch
> profiling instrumentation here.

All comments should have been addressed in v2. Plz review

Thanks very much for the comments and hints!
