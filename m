Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794317025;
	b=3xSUVC2rI65AZjVbx157FgGNpOKUwG0/+OjvUKk/Eo2InJ6CxTA6YxpG9/yQfuGUNWHu
	 6wklwdAG6unck/Jz9ZkpmLS2EijTQdFkmBaWpgbYC2DIxvbmPRRTmwZJDQFeRI1STYH99
	 81Ls+LoOvzLzdXoSTlsXZBlRk+6zv7NKZV0PoCqUj4Hipb5XWF6F2WEm4bzo7g5y30e34
	 PFJZc12oeeB5i7nF1l6arqPSG51NkJIZD9lCyLyMNC4OkeSFl7XL7FERTiSXdba7HxjBU
	 EBqRzDr3ATQqdHdlTDuR/RU+CfjJX8cIQe3KKab+hLllSu0GfeJzaVDxSwNEsDKiugw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794317025;
	h=Received:DKIM-Signature:Date:From:To:Cc:Subject:Message-ID:
	 References:MIME-Version:Content-Type:Content-Disposition:In-Reply-To;
	bh=wnCPVGnFkCMfnhztBqzYv3ZWVtZicPARnus4J5UF5Bc=;
	b=AhjiVjIRVHhx0gIF8RhKa6FcXgbpZqgAV5BNWWizakSZhTx8qKeu/I+Rr6WIfZjOl7TO
	 cd5KEgtB7dz2Wlj5QTREcMjbCSvvnYoR7se5OCiO20MGUQVyDOU9ATcF9h58vonH13Dk7
	 KVmzkCUZobeczji7zWnRMe6YmPGRlrwLg8CrPtDSKtA/dRv0Czb5Dnj8RpRngFDF5gn/H
	 Ps0UqpN5AmwuIzvdP3Fr7640y+laZCL6YJdfLpm7xzUV6GO0DhMun0BL0wOdG0+Nezjzb
	 yilYt2h5iwC/pul1eqaqlY30qzffZkqvPCnNJmf84/sihphKzvbUly/okkiuLzUMLPg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=ZkruCbZ7;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E2E86606B2F5
	for <sashiko-reviews@lists.linux.dev>; Tue, 10 Nov 2026 13:23:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=ZkruCbZ7
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 0E6991F0089F;
	Tue, 10 Nov 2026 13:23:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1794317024;
	bh=wnCPVGnFkCMfnhztBqzYv3ZWVtZicPARnus4J5UF5Bc=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=ZkruCbZ71BbG9JOnDTQW+HinEcm0lMCTvvCCvkt04ltCSD7uOQfxPBzYAexdZ4uSA
	 3t3MQ3XPiTjY8gcS+4EzbWh+4gOYlJimWi3Kit1D1fiOixEP9rirz5THqnbKrZ8VdF
	 jSm8toZ2W/1Knn3vWCHY4ctcG0xhgr9bOkaEIJiKjQE8Vm/ACgwK99Jn2SUePCb4Is
	 8HfUnZkw8778f9z6yIbAcsbwI5yIBLLWX6tRYUhSU23U0hwFuKRyrLJIoZyJveFuLr
	 DgjvfV+E9nXln97l53kgQvXYSJCwgoddmL+1BHEYd4hPjROhAHxnSnj57fsutGCBPM
	 TXL5DwKmFPB3w==
Date: Tue, 10 Nov 2026 21:03:31 +0800
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
Subject: Re: [PATCH v2 2/6] arm64: entry: Always inline helpers used by
 non-instrumentable paths
Message-ID: <avMWI5makxfDNJXD@xhacker>
References: <20261109114500.20298-1-jszhang@kernel.org>
 <20261109114500.20298-3-jszhang@kernel.org>
 <sashiko-outbox-206977@kernel.org>
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
In-Reply-To: <sashiko-outbox-206977@kernel.org>

On Tue, Nov 10, 2026 at 12:05:42PM +0000, sashiko-bot@kernel.org wrote:
> Thank you for your contribution! Sashiko AI review found 1 potential
> issue to consider:
> - [Low] arm64: entry: missing __always_inline on !CONFIG_ARM64_SME stubs
>   in fpsimd.h
> --
> 
> commit ed5f3b4320afc347aa0402f3b75096047a676bff
> Author: Jisheng Zhang <jszhang@kernel.org>
> 
> arm64: entry: Always inline helpers used by non-instrumentable paths
> 
> This commit marks MTE, SME, CPU feature, and rescheduling helpers called
> from noinstr entry and exit paths as __always_inline, and updates the SME
> entry and exit helpers to use tif_test_bit(TIF_SME).
> 
> > diff --git a/arch/arm64/include/asm/fpsimd.h b/arch/arm64/include/asm/fpsimd.h
> > index a67d5774e6728..e7c881c1c1f79 100644
> > --- a/arch/arm64/include/asm/fpsimd.h
> > +++ b/arch/arm64/include/asm/fpsimd.h
> > @@ -749,17 +749,17 @@ void sme_enable_dvmsync(void);
> >  void sme_set_active(void);
> >  void sme_clear_active(void);
> >  
> > -static inline void sme_enter_from_user_mode(void)
> > +static __always_inline void sme_enter_from_user_mode(void)
> >  {
> >  	if (alternative_has_cap_unlikely(ARM64_WORKAROUND_4193714) &&
> > -	    test_thread_flag(TIF_SME))
> > +	    tif_test_bit(TIF_SME))
> >  		sme_clear_active();
> >  }
> >  
> > -static inline void sme_exit_to_user_mode(void)
> > +static __always_inline void sme_exit_to_user_mode(void)
> >  {
> >  	if (alternative_has_cap_unlikely(ARM64_WORKAROUND_4193714) &&
> > -	    test_thread_flag(TIF_SME))
> > +	    tif_test_bit(TIF_SME))
> >  		sme_set_active();
> >  }
> 
> [Severity: Low]
> Should the !CONFIG_ARM64_SME stubs for sme_enter_from_user_mode() and
> sme_exit_to_user_mode() in the #else branch below also use
> __always_inline, matching the !CONFIG_KASAN_HW_TAGS stubs updated in
> mte.h and mte-kasan.h?

I think this is false alarm because the #else branch is null function,
any compiler will inline them even when -Os, but if maintainers wants
__always_inline as well for #else branch, kindly comment I will update
them.
