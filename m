Received: from mail-wm1-f43.google.com (mail-wm1-f43.google.com [209.85.128.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 73F15223DE7
	for <sashiko-reviews@lists.linux.dev>; Fri, 15 May 2026 12:32:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.43
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778848326; cv=none; b=YxaElj3ljT49JoeWjHtxS3B00+/VlMWH4CYqT9CdEVzRZGdedptlUyXxVv/m84bbJsAGR34vCfipGFZ4SKOdPNqjJimMGBV4SbSSSSKQQvdAsBd7WYmAEzsL65ky2wFDJena6uO/emGEcvFNFwgbBK5w3c5317IxdDOC/pWw7RA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778848326; c=relaxed/simple;
	bh=45q0AEN1NbecCD+iBBbFlmo9GV+ePz5tpmPXhyvkVYg=;
	h=From:Date:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=IiMsv2zzG7UqXSaQCg7yGS+A+xTuihvQvONJ2rdj5K1drPNZ9t4UGxWKn9nmNceH9GO3DoM78DCf3ROUumXziwAiBBmSpXEiLGcUCkp+O3Ti/siK9tGgEOplGhhWhfDrnTjUp2Hu9pOIUIKOz22YwoDqekNNrSgSqgCnGJI7rns=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=LaCCdZDv; arc=none smtp.client-ip=209.85.128.43
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="LaCCdZDv"
Received: by mail-wm1-f43.google.com with SMTP id 5b1f17b1804b1-48d102471a4so89384985e9.2
        for <sashiko-reviews@lists.linux.dev>; Fri, 15 May 2026 05:32:04 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1778848323; x=1779453123; darn=lists.linux.dev;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:date:from:from:to:cc:subject:date:message-id:reply-to;
        bh=+GaEoCty7GhaeD1H3UefvPhtIWVVayr8sbWw+KFknDs=;
        b=LaCCdZDvAM0LCBYEXt/7BVYMf7xMYxUinHUl602fsCV9uj+HRci7CEPuzOIjkmxn4h
         f0DZJC2At/70AQ1sdGJOkxAaY/vIdCQoai3gWJPQZgMf124ggYdl1jBCOxrqHkdp7Gnp
         BD9GtmbF66b0LZuU6CgEs3TjMHxRfzJxBZxlYZZc1Q/KXtQ9Ql85gHPXo2bAFA32oTJq
         adzanhKrOY1PrxmToR4op567cNLk9SkxsjXyrIljIAHH7mvA9dHvzHcV5TGkYV+nL4zt
         AYPuaHU6cumXb2l086M7e88+E0FpI2FKsr/3xDiZhsJDSjiktXIz42Fq2ebEFWYv+olw
         7RmQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1778848323; x=1779453123;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:date:from:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=+GaEoCty7GhaeD1H3UefvPhtIWVVayr8sbWw+KFknDs=;
        b=mgljGMDDMUB1nb6+2Jx+BRKs99pp7WQWOytHWhPRydZhzAztjyZB8zWXQZbfbtnmkW
         D1XLxdlayxN/aNqaKkDdc/fQXCZJiAdswYo7aSaZ/wtV/PVEUoNVoAQL67lyEK3i+Ylh
         cyihI0oUle+fDYaojhifnGN3bTqiUEh0YjRTNegYK/X+F26IkQm4ITEe6QiR3NylQVtP
         ybHjpTj4laFM1/zt3ED0vdm3xMJqn57qghA/0Ol9U9iY0fbj/27EdUKH7BYKmfiF0geU
         3ij+IhkxOkfZ2dijH0N0mWebf3ytI0tgcFMCcuoeXYm+4ntDiX+wAmMDGKz0ozKjcvzY
         Is3w==
X-Gm-Message-State: AOJu0YygrB1bwK3BmgN8ZZx6LeJVg2jwDfnwgAHAeSDxeOgGc8Ar4cXZ
	Epwv8zw9zmzix4oB9zHKYkY7/lkKYIG1L/jLNDUhkRcw2252OmnHFsXRyIjrB35H
X-Gm-Gg: Acq92OGeagOnRGVk9S0WlET+Qcw9Um6A8sWZs6hw4JgnwgxNW0hY78v87SH3+HgOfp1
	cgr0rirw3osrpjOzWWhOcIJmlnu/0iPzY5A6AnIYwd+tBNq//dJjWegS4xpdFpm4wHHrIbi0mAz
	3mgwIaV+wniwEg67dKJAuyaTFmuSBjZPGcwD3+GEQKmXpJfvkNJBSsh5AyaKU3rT+VJTuCZblQw
	dWjBEW3g6Ek/KKyMzmjqj4lLprUCmBBM9nwOzbWs18K6W4WlBkiVyG7KE+esb4CDzUzKAvRy5uZ
	TT+wlpzUINjTN6x/XK581EvBHerOwdNWKpUr3+U1dFBAEYuXJz8Ddj31Zn9oMQMbVyAWPZU1TTT
	TGTw9xFWPOE4blYobqHky4Lsn/m8O2eJWlpDfpH//LOT7wqgoltcHPKpSAl5oJPQTyj2SfJ+opP
	kofYMantwQT91DOho=
X-Received: by 2002:a05:600c:3104:b0:48e:89b8:7c6d with SMTP id 5b1f17b1804b1-48fe63074edmr50216045e9.25.1778848321855;
        Fri, 15 May 2026 05:32:01 -0700 (PDT)
Received: from krava ([2a00:102a:4039:3341:dfc:8dc0:b9c5:81b8])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-48fe5694fbfsm105573425e9.6.2026.05.15.05.32.01
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 15 May 2026 05:32:01 -0700 (PDT)
From: Jiri Olsa <olsajiri@gmail.com>
X-Google-Original-From: Jiri Olsa <jolsa@kernel.org>
Date: Fri, 15 May 2026 14:31:59 +0200
To: sashiko-reviews@lists.linux.dev
Cc: bpf@vger.kernel.org
Subject: Re: [PATCH 1/7] uprobes/x86: Move optimized uprobe from nop5 to nop10
Message-ID: <agcSP6LxxpRA4ICO@krava>
References: <20260514135342.22130-2-jolsa@kernel.org>
 <20260514200545.C672EC2BCB3@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: sashiko-reviews@lists.linux.dev
List-Id: <sashiko-reviews.lists.linux.dev>
List-Subscribe: <mailto:sashiko-reviews+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:sashiko-reviews+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260514200545.C672EC2BCB3@smtp.kernel.org>

On Thu, May 14, 2026 at 08:05:45PM +0000, sashiko-bot@kernel.org wrote:
> Thank you for your contribution! Sashiko AI review found 2 potential issue(s) to consider:
> - [High] set_orig_insn fails to unoptimize uprobes in foreign processes because __is_optimized relies on __in_uprobe_trampoline, which hardcodes current->mm for VMA lookups, resulting in silent stack pointer corruption.
> - [High] set_orig_insn fails to unoptimize a forked child's uprobe due to breakpoint overwriting the lea instruction, leaving a corrupted instruction that truncates the stack pointer.
> --
> 
> commit ecbc682eb0a0b0a7df1fd339bbdb6beeb8e1fc0a
> Author: Jiri Olsa <jolsa@kernel.org>
> 
> uprobes/x86: Move optimized uprobe from nop5 to nop10
> 
> This commit fixes a redzone clobbering issue with optimized uprobes by
> moving them to use a 10-byte nop instruction, allowing space for a stack
> adjustment before the call.
> 
> Link: https://lore.kernel.org/bpf/20260509003146.976844-1-andrii@kernel.org/
> 
> > diff --git a/arch/x86/kernel/uprobes.c b/arch/x86/kernel/uprobes.c
> > --- a/arch/x86/kernel/uprobes.c
> > +++ b/arch/x86/kernel/uprobes.c
> 
> [ ... ]
> 
> > @@ -1049,19 +1077,21 @@ static bool __is_optimized(uprobe_opcode_t *insn, unsigned long vaddr)
> >  	struct __packed __arch_relative_insn {
> >  		u8 op;
> >  		s32 raddr;
> > -	} *call = (struct __arch_relative_insn *) insn;
> > +	} *call = (struct __arch_relative_insn *)(insn + LEA_INSN_SIZE);
> >  
> > -	if (!is_call_insn(insn))
> > +	if (!is_lea_insn(insn))
> > +		return false;
> > +	if (!is_call_insn(insn + LEA_INSN_SIZE))
> >  		return false;
> > -	return __in_uprobe_trampoline(vaddr + 5 + call->raddr);
> > +	return __in_uprobe_trampoline(vaddr + OPT_INSN_SIZE + call->raddr);
> >  }
> 
> Does this sequence risk silent stack pointer corruption during uprobe
> unregistration?
> 
> When a tracer unregisters a uprobe from another process, it runs in the
> tracer's context. However, __is_optimized() calls __in_uprobe_trampoline(),
> which hardcodes current->mm for the VMA lookup:
> 
> arch/x86/kernel/uprobes.c:__in_uprobe_trampoline() {
>         struct vm_area_struct *vma = vma_lookup(current->mm, ip);
>         return vma && vma_is_special_mapping(vma, &tramp_mapping);
> }
> 
> Since current is the tracer, the lookup fails, causing __is_optimized()
> to return false.
> 
> If __is_optimized() returns false, set_orig_insn() bypasses
> swbp_unoptimize() and writes only the first byte of the original
> instruction (e.g., 0x66 for nop10) over the 0x48 (lea) byte.
> 
> This leaves the instruction 66 8d 64 24 80 e8 ... in the tracee's memory,
> which decodes as lea -0x80(%rsp), %sp. Could this truncate the stack
> pointer to 16 bits and cause stack corruption when the tracee subsequently
> pushes or pops?

yes, we need to pass vma->vm_mm to __is_optimized and not use current->mm

> 
> [ ... ]
> 
> > @@ -1095,14 +1125,25 @@ int set_orig_insn(struct arch_uprobe *auprobe, struct vm_area_struct *vma,
> >  		  unsigned long vaddr)
> >  {
> >  	if (test_bit(ARCH_UPROBE_FLAG_CAN_OPTIMIZE, &auprobe->flags)) {
> > -		int ret = is_optimized(vma->vm_mm, vaddr);
> > -		if (ret < 0)
> > +		uprobe_opcode_t insn[OPT_INSN_SIZE];
> > +		int ret;
> > +
> > +		ret = copy_from_vaddr(vma->vm_mm, vaddr, &insn, OPT_INSN_SIZE);
> > +		if (ret)
> >  			return ret;
> > -		if (ret) {
> > +		if (__is_optimized((uprobe_opcode_t *)&insn, vaddr)) {
> >  			ret = swbp_unoptimize(auprobe, vma, vaddr);
> >  			WARN_ON_ONCE(ret);
> >  			return ret;
> >  		}
> > +		/*
> > +		 * We can have re-attached probe on top of jmp8 instruction,
> > +		 * which did not get optimized. We need to restore the jmp8
> > +		 * instruction, instead of the original instruction (nop10).
> > +		 */
> > +		if (is_swbp_insn(&insn[0]) && insn[1] == OPT_JMP8_OFFSET)
> > +			return uprobe_write_opcode(auprobe, vma, vaddr, JMP8_INSN_OPCODE,
> > +						   false /* is_register */);
> >  	}
> >  	return uprobe_write_opcode(auprobe, vma, vaddr, *(uprobe_opcode_t *)&auprobe->insn,
> >  				   false /* is_register */);
> 
> Is there a similar issue for forked children that inherit the optimized
> 10-byte sequence?
> 
> During fork, uprobe_mmap() installs a breakpoint in the child by writing
> 0xCC to the first byte, changing the instruction from 48 8d... to cc 8d...
> 
> If the uprobe is unregistered before the child hits and re-optimizes it,
> __is_optimized() will return false because is_lea_insn() strictly expects
> the first byte to be 0x48:
> 
> arch/x86/kernel/uprobes.c:is_lea_insn() {
>         return !memcmp(insn, lea_rsp, LEA_INSN_SIZE);
> }
> 
> The fallback check for the re-attached probe on top of jmp8 also fails
> because insn[1] is 0x8d, not OPT_JMP8_OFFSET.
> 
> Could set_orig_insn() then fall back to writing just the first byte of
> the original instruction over the 0xcc, again leaving 66 8d 64 24 80 e8 ...
> and silently truncating the child's stack pointer?

nice.. maybe we can skip the install_breakpoint call in uprobe_mmap
for optimized probes.. will check

jirka
