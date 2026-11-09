Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794200378;
	b=JpavobNzABNJAGJD1nS5156o5VJHhVQjS0IauaT9GMZBJMMXQjzMZzXvbi4ZLjex/cIu
	 2BAlm0IWEVyMSUdtJSmDIsOLQKEnRGjteOdRluLujvXyNZ6DzmLdgTheP/9pwPhKv8SkI
	 0lrz97eIpR3L+tN4WDsxD90X667EHHNrh0Q6TbcFsI9r/V3FXy/VnXxGwCbnyTNOAT9zO
	 l9HgAhyPXRofGeD+u0Vg7kBZUto85fCnjCOe9FO5fkokV1qJfa1PpxOujIWFkRxSRM1Os
	 XVhv8EdXZ3+UGSTvLJmgibFkWz59CT6szZTzAGIwdgzhim98RlcQtpvQ15nz77rZlLQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794200378;
	h=Received:DKIM-Signature:Date:From:To:Cc:Subject:Message-ID:
	 References:MIME-Version:Content-Type:Content-Disposition:
	 Content-Transfer-Encoding:In-Reply-To;
	bh=ERG2I7Pd24sxoFvp82kJAGtR6dHyLv+SwnsIesDmAb0=;
	b=BCDIgwCwPLVwAHRSocubI7yLnOqCNz3nWCDDc2lEHowi3GzW3uBhJnC8LkI39vImIl6W
	 LizzmDthbtCOXk2dq6dgamn3GzDb2CXgtZTnnI1pW3THdSKOHEHC6MQpnPC79b74SSIU7
	 nMp+CLCj7xwwM2CPNRVcKGeBXthGxw5IAGhAj3R2DbBtk7uhL8Y2A1aSPcYiP57/EqQT7
	 pZGWLU5fDUEzji6tvBRQN+LfnCw4w08bhnZMQJRNJNuzSruc07SUm4HqzDxK7y5X5lJad
	 pIY4BP0qflTc7f40CzlvTuxXREfoU78ee61BL3a97MMEVVTAfHT9BbWaQ6yyLiEmMAQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=MfqYncIT;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3E20A606A321
	for <sashiko-reviews@lists.linux.dev>; Mon,  9 Nov 2026 04:59:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=MfqYncIT
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 5B8721F0089F;
	Mon,  9 Nov 2026 04:59:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1794200378;
	bh=ERG2I7Pd24sxoFvp82kJAGtR6dHyLv+SwnsIesDmAb0=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=MfqYncITt25+ECW2QvR5aoo9iAQhXLKcQ2LdXpuZzDe0mnvVZC3n726QmHzfgQh8y
	 DfwvfSOExCsM+2jHtIJDTkiqujRoLgPcduIvhE7yCWF7HRVm5Dnc8n4S07lj4uYw+N
	 oC13rcU8BzslZRwR2c0TdtfDFaY+5upd7x6RZeBUyCxFCXABHd7FI5UFByFQdKgi1Z
	 R5iTB2vqMVn+hM7bHW3mLT90DD/IgrKT87ztZ8D/jhL+TOlXISPnsgQud0PU4hQFau
	 yNWlBQADuUTXqiU5hEU5qaihGJtxUnFG1Vhix1HROVJwJDjs/yOMYcVjS/psdLXRqd
	 rsuSCirkQUrVA==
Date: Mon, 9 Nov 2026 12:39:25 +0800
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
Subject: Re: [PATCH 1/4] arm64: percpu: Always inline helpers used by noinstr
 code
Message-ID: <avFOfUZFBqTzrT4X@xhacker>
References: <20261107071339.17467-1-jszhang@kernel.org>
 <20261107071339.17467-2-jszhang@kernel.org>
 <sashiko-outbox-203633@kernel.org>
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
Content-Transfer-Encoding: 8bit
In-Reply-To: <sashiko-outbox-203633@kernel.org>

On Sun, Nov 08, 2026 at 07:43:56AM +0000, sashiko-bot@kernel.org wrote:
> Thank you for your contribution! Sashiko AI review found 1 potential
> issue to consider:
> - [Low] arm64: percpu: __PERCPU_OP_CASE() and sibling helpers not marked
>   __always_inline
> --
> 
> commit 3a2df0916b5200b227df21487897e171275b29f4
> Author: Jisheng Zhang <jszhang@kernel.org>
> 
> arm64: percpu: Always inline helpers used by noinstr code
> 
> This commit marks __hyp_my_cpu_offset(), __kern_my_cpu_offset(), and
> __percpu_read_##sz() as __always_inline so they are not emitted out of line
> when called from non-instrumentable code.
> 
> > diff --git a/arch/arm64/include/asm/percpu.h b/arch/arm64/include/asm/percpu.h
> > index 3cc316091d665..7c344de5052d5 100644
> > --- a/arch/arm64/include/asm/percpu.h
> > +++ b/arch/arm64/include/asm/percpu.h
> 
> [ ... ]
> 
> > @@ -129,7 +129,7 @@ static inline unsigned long __kern_my_cpu_offset(void)
> >  #endif
> >  
> >  #define PERCPU_RW_OPS(w, sfx, sz)						\
> > -static inline unsigned long __percpu_read_##sz(void __percpu *pcp)		\
> > +static __always_inline unsigned long __percpu_read_##sz(void __percpu *pcp)		\
> >  {										\
> >  	u16 *gprs = &current_thread_info()->pcpu_gprs;				\
> >  	unsigned long off;							\
> 
> [Severity: Low]
> Should __PERCPU_OP_CASE() and the remaining __percpu_* helpers in this header
> (__percpu_write_##sz(), __PERCPU_RET_OP_CASE(), PERCPU_XCHG_OP(),
> PERCPU_CMPXCHG_OP(), and __percpu_cmpxchg_128()) also be marked
> __always_inline?
> 
> The noinstr function lockdep_hardirqs_on() calls
> __debug_atomic_inc(redundant_hardirqs_on), which under CONFIG_DEBUG_LOCKDEP=y
> expands to this_cpu_inc(lockdep_stats.redundant_hardirqs_on) ->
> __percpu_add_case_64().  Because __PERCPU_OP_CASE() still uses plain static
> inline and is also called from instrumentable lockdep functions, builds with
> CONFIG_CC_OPTIMIZE_FOR_SIZE=y can emit __percpu_add_case_64() out of line in
> .text and call it from .noinstr.text before RCU and lockdep state are ready
> for instrumentation.

Good catch! I will address this in v2. Before that, I will wait
for a while to collect review comments.

Thanks
> 
> -- 
> Sashiko AI review · https://sashiko.dev/#/patchset/20261107071339.17467-1-jszhang@kernel.org?part=1
