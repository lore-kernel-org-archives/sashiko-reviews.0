Received: from mail-pg1-f182.google.com (mail-pg1-f182.google.com [209.85.215.182])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C1845383C92
	for <sashiko-reviews@lists.linux.dev>; Mon, 18 May 2026 17:32:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.215.182
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779125554; cv=none; b=OkTtxzZUH+65Rq/RDsGfe9yxHS0evdZUPR0jr80Xnhvoo66h3K43DR4/zl7HjQI5cA63aqn4y2yZS2kYvshTaikuIVXt3oy4iC0cd+klSY3k7uJtZi26ujSdDPAD8/Xxx0TaZjLKiIGBXflvmUFYJ1PZV+qdCbTM/i4hzz6QEOU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779125554; c=relaxed/simple;
	bh=AH+DBcfb8hb1EXWNIPBBXvrpcWc8hMPu2qrEVpv3n+A=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=VeLwbk9HvTx+A4XTEqsCRD6YOz24LWN0gqiBIW0B1hFYA+Cr2TxA3nYVfAxXDlz56vz9zkl7MJLiAFdbrSypCr7jNZZZb+zCJ4bH7GVGKb74xOXKNxKKcXWn55NdhiNeClds/WCwHDZuNA0r/jLZUJpGklUFJ30rGoE5faWLK3U=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=YphwCW+A; arc=none smtp.client-ip=209.85.215.182
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="YphwCW+A"
Received: by mail-pg1-f182.google.com with SMTP id 41be03b00d2f7-c8027e876fcso1058177a12.1
        for <sashiko-reviews@lists.linux.dev>; Mon, 18 May 2026 10:32:32 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1779125552; x=1779730352; darn=lists.linux.dev;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date:from:to
         :cc:subject:date:message-id:reply-to;
        bh=2uzkrbz+xMoiruhnNnylQApyqxZ7RLlqdiRaKQfhQVA=;
        b=YphwCW+Avq/byziOlmY1QGYa44p3GPlCOm6YHqU68ktf0SediJa5hchTnLgdQC0J3E
         SKe2cOV9By1s2exV9/py44h32p5LrmJLwI0f8cN8znsjoLuZc8vrXg3YT38CEbmd/p00
         Ks8OdXKiqsDBqZORyHewLgnfGx3CsdPl7Z+wA915leKXv3a3O6MSd/iWRnu8Rww8P9M+
         bTaW+oU3PKbEiYoTgOQk5xuNlDbBhUjRxevi7HXHRb5wX+ym+FVPuONTdUlRmwiEnvFE
         wMIxPPa6XRGQ2gBKIvALj+acr+8sLfmKcz8R2ltaatIw+x4PHwvhi51yDT8QNVeLOM/2
         xSAA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1779125552; x=1779730352;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=2uzkrbz+xMoiruhnNnylQApyqxZ7RLlqdiRaKQfhQVA=;
        b=rxtXlBjjkvS96xP2IuIny+BUgA/ZxkYiiTyFqCHUTtYXEEgWT3ioMw3h72gShrrdco
         5i4wsjUdr32bzk1vVRwMeeIeRxu0P54XA8kcLpYByfc+U2darYSezmxxpO6lpf0QKUml
         iJPLFBqCXohLDrf/ZFxyDh8OltLpTP4166nEXEagHLVEqpMe3vwunTFEifKfKgnn2Mve
         TEoSYIHrB9TzOvDOR9HlPxlyn5mNRUfrcmclf2WzF5PGgzrNDCkAwktL1RgtAmMZ+W4y
         oZhnf9IyjXyP07ZqYdCv5lFHcGuH630xtufrH94Qc+07sfqcy50UwxXDRVFcoqwilnGn
         +HzA==
X-Gm-Message-State: AOJu0Yzel8zkR6uXd3Kt9D8v8vZJIkR7lk3jMuitAe6/cIVty3dk6dHc
	CH8a1y1+kZo5EDZu+6TGP12vWd47tZ+3BVCjBFQDeGYfJMvqtkK1+A935jtMGQ==
X-Gm-Gg: Acq92OHE8R9RXviRDr7II5qYJC+VFSpb5Mjain/+cxTZPSun661d8YOXZdVUboTMFNz
	vQeUNk+G3Sx0SZijwfhz8PEzC5hRUtS68bc/wz/aoHwnzemBOmJD0ai+FsJe8hvTDEcXYW9t415
	NO9qY+7SYtfRcUBK2EHcFpvDzFZya1uUuXY7Sm2fFJPyrmLBG4ek9YFumzY+bOPe/HGhBAv7WDy
	iSYV+cENn0/luS2s1evJKITJLx76AMzus8wgFz4q2Pyyp5k0Lv3gOENwHswQ+gXeTTGP7M/xOib
	/8BJoAHdMIU1zcbpbu0hMggB4RIhgLEetjsGPaqW7n4yOBobt9vd9k2jDH1o5P2h6eJlb+IlKEw
	FQPbN4jv37WJsRSx/7JGcBl5SSqz3j9KTfRwPij8yM10Vfr0ACVDJxJEdq3OEHp/6dcPWYOZwax
	EqzBcR9U59OvbLXULgzvjqP5nwGeNEDQj2Wg==
X-Received: by 2002:a17:902:da90:b0:2bd:612b:912d with SMTP id d9443c01a7336-2bd7e8ad548mr166936445ad.14.1779125551825;
        Mon, 18 May 2026 10:32:31 -0700 (PDT)
Received: from google.com ([118.150.148.19])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2bd5cfe6b8fsm163562595ad.46.2026.05.18.10.32.30
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 18 May 2026 10:32:31 -0700 (PDT)
Date: Tue, 19 May 2026 01:32:29 +0800
From: Kuan-Wei Chiu <visitorckw@gmail.com>
To: sashiko-reviews@lists.linux.dev
Cc: bpf@vger.kernel.org
Subject: Re: [PATCH bpf-next v3] m68k, bpf: Add initial BPF JIT compiler
 support
Message-ID: <agtNLbj1V0DuEJvL@google.com>
References: <20260511212756.3163955-1-visitorckw@gmail.com>
 <20260513010339.81EDEC2BCB0@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: sashiko-reviews@lists.linux.dev
List-Id: <sashiko-reviews.lists.linux.dev>
List-Subscribe: <mailto:sashiko-reviews+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:sashiko-reviews+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20260513010339.81EDEC2BCB0@smtp.kernel.org>

On Wed, May 13, 2026 at 01:03:39AM +0000, sashiko-bot@kernel.org wrote:
> Thank you for your contribution! Sashiko AI review found 3 potential issue(s) to consider:
> - [High] BPF-to-BPF calls (BPF_PSEUDO_CALL) are broken, corrupting arguments, return values, and tail call tracking.
> - [High] Missing protection against signed division overflow (`S32_MIN / -1` and `S64_MIN / -1`), leading to undefined behavior and potential kernel panics.
> - [Medium] Using `kcalloc` for potentially large array allocations leads to JIT failures under memory fragmentation.
> --
> 
> commit 1a2c23f18e30a4b931f962e5e35eed83ff42f6a2
> Author: Kuan-Wei Chiu <visitorckw@gmail.com>
> 
> m68k, bpf: Add initial BPF JIT compiler support
> 
> Add a BPF JIT compiler for the m68k architecture.
> 
> > diff --git a/arch/m68k/net/bpf_jit_comp.c b/arch/m68k/net/bpf_jit_comp.c
> > new file mode 100644
> > index 0000000000000..1531b321410ae
> > --- /dev/null
> > +++ b/arch/m68k/net/bpf_jit_comp.c
> 
> [ ... ]
> 
> > +static noinline s32 jit_sdiv32(s32 a, s32 b) { return b ? a / b : 0; }
> > +static noinline s32 jit_smod32(s32 a, s32 b) { return b ? a % b : a; }
> > +
> > +static noinline u64 jit_mul64(u64 a, u64 b) { return a * b; }
> > +static noinline u64 jit_div64(u64 a, u64 b) { return b ? div64_u64(a, b) : 0; }
> > +static noinline s64 jit_sdiv64(s64 a, s64 b) { return b ? div64_s64(a, b) : 0; }
> 
> What happens if signed division or modulo is performed by -1 with the minimum
> representable value (e.g., S32_MIN / -1)?
> 
> In C, evaluating INT_MIN / -1 results in signed integer overflow (undefined
> behavior), which can trigger a CPU division exception on m68k and crash the
> kernel.
> 
> Should explicit bounds checking be added to handle these edge cases and return
> the dividend as required by the eBPF specification?
> 

Ack.
will add the missing bounds checks in neext version.

> [ ... ]
> 
> > +static int emit_call(const struct bpf_insn *insn, struct jit_ctx *ctx)
> > +{
> > +	const s8 arg_regs[] = { BPF_REG_5, BPF_REG_4, BPF_REG_3, BPF_REG_2, BPF_REG_1 };
> > +	const s8 *tmp1 = bpf2m68k[TMP_REG_1];
> > +	bool extra_pass = ctx->target != NULL;
> > +	u64 func_addr;
> > +	bool fixed;
> > +	int i, err;
> > +
> > +	err = bpf_jit_get_func_addr(ctx->prog, insn, extra_pass, &func_addr, &fixed);
> > +	if (err)
> > +		return err;
> > +
> > +	for (i = 0; i < 5; i++) {
> > +		const s8 *reg = bpf2m68k[arg_regs[i]];
> > +		s8 d_lo = bpf_get_reg32(reg[1], tmp1[1], ctx);
> > +		s8 d_hi = bpf_get_reg32(reg[0], tmp1[0], ctx);
> > +
> > +		emit_16(ctx, 0x2f00 | d_lo);			/* move.l d_lo, -(%sp) */
> > +		emit_16(ctx, 0x2f00 | d_hi);			/* move.l d_hi, -(%sp) */
> > +	}
> > +
> > +	emit_16(ctx, 0x207c);					/* movea.l #func_addr, %a0 */
> > +	emit_32(ctx, (u32)func_addr);
> > +
> > +	emit_16(ctx, 0x4e90);					/* jsr (%a0) */
> > +
> > +	emit_16(ctx, 0x4fef);					/* lea 40(%sp), %sp */
> > +	emit_16(ctx, 40);
> > +
> > +	emit_16(ctx, 0xc340);					/* exg %d0, %d1 */
> 
> Does this code break BPF-to-BPF calls (BPF_PSEUDO_CALL)?
> 
> It appears to treat the subprogram exactly like a standard C helper by pushing
> BPF registers R1-R5 to the stack and then executing exg %d0, %d1 to swap the
> 64-bit return value.
> 
> However, the subprogram's JIT-compiled code unconditionally uses the standard
> build_prologue(), which lacks a check for ctx->prog->is_func.
> 
> Consequently, doesn't the subprogram act like a root BPF program, initializing
> BPF_REG_1 from 8(%fp), zeroing its upper 32 bits, and completely ignoring the
> stacked R2-R5 arguments?
> 
> Additionally, it seems the global tail call counter (BPF_TC_LO) is improperly
> reset to 33 on every subprogram entry, and the return value of BPF subprograms
> (which already populate BPF_REG_0 properly) gets corrupted by the swap.
> 

Will try to fix this.

> [ ... ]
> 
> > +struct bpf_prog *bpf_int_jit_compile(struct bpf_verifier_env *env, struct bpf_prog *prog)
> > +{
> > +	struct bpf_binary_header *header;
> > +	struct jit_ctx ctx;
> > +	unsigned int image_size;
> > +	u8 *image_ptr;
> > +
> > +	if (!prog->jit_requested)
> > +		return prog;
> > +
> > +	memset(&ctx, 0, sizeof(ctx));
> > +	ctx.prog = prog;
> > +
> > +	ctx.offsets = kcalloc(prog->len + 1, sizeof(int), GFP_KERNEL);
> 
> Is it safe to use kcalloc() here for potentially large array allocations?
> 
> Since the BPF verifier allows up to 1,000,000 instructions per program, this
> could request up to 4MB of contiguous physical memory.
> 
> On systems with memory fragmentation, this large physically contiguous
> allocation is highly likely to fail, unnecessarily aborting JIT compilation.
> 
> Would it be better to use kvcalloc() instead, consistent with other BPF JITs?
> 

Ack.
Will change to kvcalloc().

Regards,
Kuan-Wei

> > +	if (!ctx.offsets)
> > +		return prog;
> 
> -- 
> Sashiko AI review · https://sashiko.dev/#/patchset/20260511212756.3163955-1-visitorckw@gmail.com?part=1
