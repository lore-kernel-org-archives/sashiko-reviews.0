Received: from mail-wm1-f46.google.com (mail-wm1-f46.google.com [209.85.128.46])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C4B953C872B
	for <sashiko-reviews@lists.linux.dev>; Wed, 27 May 2026 07:36:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.46
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779867380; cv=none; b=rhTL2aQMOIKqlhUb3bO3eI5h0Y3dF/9k/1iCaTgsLZwKDsUbSIpLk7PF7Kt5AhCqK9ouN4By9x7f3NVMw/yJxtLStGQBfQTSn6fBglt7gp6i8EPIfIqs4DSxRkPN0XMvTY1Rvyp41w61f9cr62vvG9oLaUblJPx6s6zv1E1dSyw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779867380; c=relaxed/simple;
	bh=/E6yxZN1iL1sEOvhzLQbCR2BoEGv7qUOen6dJLFQWqE=;
	h=From:Date:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=YnQ6HSfxka5oLnPlYhNY7eASLM7tGhSgu79RncSRKvS4tSGeTJzbSPO4hP276M/wyoL38pTWkFsMdEOn2l+0hyhLmK0DlTTALflVG7KPuOPIxH+ew5LvZjslSRq0GvIkGscK5i9FEtQpsHMnrS5Vf0eA3lHfPrJPS7fX5/Fcn4c=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=fXctnJrv; arc=none smtp.client-ip=209.85.128.46
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="fXctnJrv"
Received: by mail-wm1-f46.google.com with SMTP id 5b1f17b1804b1-4891e5b9c1fso97895295e9.2
        for <sashiko-reviews@lists.linux.dev>; Wed, 27 May 2026 00:36:18 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1779867377; x=1780472177; darn=lists.linux.dev;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:date:from:from:to:cc:subject:date:message-id:reply-to;
        bh=UIF0+8LpPnndTQYvbVkGYrOCYND9z39MVrZ8YaX2YH8=;
        b=fXctnJrvmRqMUNnQ1QH23yX2m/W/2bt0zEEbgPQ6vumnvZPcDn8H0KpTY4SckJGLeW
         emxvJUlLrrKpil4B+03rqOaj+iBWkisNQVb9+6BWTyAbL3dDxKRUMjuAMfeod7PLKTvt
         jcntwqXN0cyeqoqbONkm6/5n7Nd2mu8gzR8AI0GUphQv6mo1xo36mvbsIOSeuG8ujVA7
         BGgPDKEIkMlpiMy9DAlK3TD2mJ+lIW09Ac1htkhnL/8RfllrzEHk/0ry5KPGCA3IB5I7
         1V34wXsCwdVSm0gtZMal/Jh+fSlLBtAPZJ0itLhYdjnX5I24lXB5C9omf+sd7J0Z8TcK
         q0YQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1779867377; x=1780472177;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:date:from:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=UIF0+8LpPnndTQYvbVkGYrOCYND9z39MVrZ8YaX2YH8=;
        b=qEro65gSJHPxhbgMBn0Kpbl7ezOOm2Je1l5GQuu9Ik+3RnlUsz9WDcF33QxxksONGV
         f5kTWZEL/vQNjBozS8iFLWYNbKcw0UABFuMXiYGluTkrBYOYtTMRf+aIU1j7zIO9rwID
         fg8Cp9ghLmhVO1ixe4MdnhgSB05KPzl9Sj42rCA/VvDziko9Uxv7L2sDsdrA4qdNTXE/
         ciDG3Hc62/6lMaW/zsCq5jPOEFAB8d3YoYSvS+RTwDHCDSiCGV0K6v/nQOMBlh4Wp0D8
         g+9ffbqaBZLktgmGiAsLif0/QdvxCeN1FbOuT3EHlCfh58wDDprI2zrG/U4Myu8VXkfG
         zJbw==
X-Gm-Message-State: AOJu0YymdX53J04VDs9AQmFCeNN5vAztMxWwf8schVxWFAnt5fBw7Njd
	aLlSF+pY42gMW5XKAgFegoCTCQYuay0zxyCZE9XgxGdFJLhDOBQs0XPVVTleGQ==
X-Gm-Gg: Acq92OEIC9sejQYFWUgMmwcn8Tbo1+TOT7vk+NAxPgeTnZl/V5jzHVeP1DS34ATD2y6
	g6PAzUQwni/QFUyarwmdA/h0HhZ5TJpE4a9kgZnQL7mdZcdHMzOvr36keQ7+4/myipfqDm66YQJ
	vZHz5EfmRLa+OwOrvnSfeXmp3mnDv1d/BhDjqXSqjaNkpRkqHLzKdUwdXvftV0LYhrxq69gLrLE
	9RU6POmq7SbQZ/TbdEvTrpFc3Viw+aENGAV6VkeTN0Mi7IV7K2eukDUMx0R/oFTMoYKPmHrVz20
	usRyFtLFYH3BI2iWbAKZzzP2GcKYkIFbUyyt7as/07A3x8sgOXbcfZQP6uiDoVKGfWx0AU80vNc
	lPYUVkrY3SKv9Otr4U/1IKRLP6phYJYq4RhwGCyyhWfYrxxU02RfNkWi6rpPlcOQP4DRrxR9gWs
	CbaImNkguf/9H+xDk=
X-Received: by 2002:a05:600c:8b84:b0:490:5466:8576 with SMTP id 5b1f17b1804b1-490546689a7mr333011325e9.1.1779867376895;
        Wed, 27 May 2026 00:36:16 -0700 (PDT)
Received: from krava ([2a02:8308:a00c:e200:b655:ff13:e355:16a3])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4904526ca21sm369643295e9.3.2026.05.27.00.36.16
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 27 May 2026 00:36:16 -0700 (PDT)
From: Jiri Olsa <olsajiri@gmail.com>
X-Google-Original-From: Jiri Olsa <jolsa@kernel.org>
Date: Wed, 27 May 2026 09:36:14 +0200
To: sashiko-reviews@lists.linux.dev
Cc: Gyokhan Kochmarla <gyokhan@amazon.de>, bpf@vger.kernel.org,
	Masami Hiramatsu <mhiramat@kernel.org>,
	Steven Rostedt <rostedt@kernel.org>
Subject: Re: [PATCH 6.12] x86/fgraph: Fix return_to_handler regs.rsp value
Message-ID: <ahae7nkLYjXinDRZ@krava>
References: <20260526192324.79459-1-gyokhan@amazon.de>
 <20260526195008.897721F000E9@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: sashiko-reviews@lists.linux.dev
List-Id: <sashiko-reviews.lists.linux.dev>
List-Subscribe: <mailto:sashiko-reviews+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:sashiko-reviews+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260526195008.897721F000E9@smtp.kernel.org>

On Tue, May 26, 2026 at 07:50:07PM +0000, sashiko-bot@kernel.org wrote:
> Thank you for your contribution! Sashiko AI review found 1 potential issue(s) to consider:
> 
> Pre-existing issues:
> - [High] The `return_to_handler` assembly routine creates a `pt_regs` (or `ftrace_regs`) structure on the kernel stack but only initializes four registers (`rax`, `rdx`, `rbp`, `rsp`), leaving the rest of the structure uninitialized. This partially initialized structure is passed to BPF kretprobe programs, leading to an information leak of kernel stack memory.
> --
> 
> commit ff6f1024b92860971d84c833c6dac53501145715
> Author: Jiri Olsa <jolsa@kernel.org>
> 
> x86/fgraph: Fix return_to_handler regs.rsp value
> 
> This commit fixes the unwinding rsp register value in return_to_handler. It 
> saves the original rsp before the FRAME_SIZE adjustment, replacing the 
> previous incorrect value. This ensures fprobe and direct unwinders see the 
> right stack pointer.
> 
> Link: https://lore.kernel.org/bpf/20260126211837.472802-2-jolsa@kernel.org
> 
> > diff --git a/arch/x86/kernel/ftrace_64.S b/arch/x86/kernel/ftrace_64.S
> > --- a/arch/x86/kernel/ftrace_64.S
> > +++ b/arch/x86/kernel/ftrace_64.S
> > @@ -364,6 +364,9 @@ SYM_CODE_START(return_to_handler)
> >  	UNWIND_HINT_UNDEFINED
> >  	ANNOTATE_NOENDBR
> >  
> > +	/* Store original rsp for pt_regs.sp value. */
> > +	movq %rsp, %rdi
> > +
> >  	/* Restore return_to_handler value that got eaten by previous ret instruction. */
> >  	subq $8, %rsp
> >  	UNWIND_HINT_FUNC
> > @@ -374,7 +377,7 @@ SYM_CODE_START(return_to_handler)
> >  	movq %rax, RAX(%rsp)
> >  	movq %rdx, RDX(%rsp)
> >  	movq %rbp, RBP(%rsp)
> > -	movq %rsp, RSP(%rsp)
> > +	movq %rdi, RSP(%rsp)
> 
> [Severity: High]
> This is a pre-existing issue, but could this code leak kernel stack memory
> to BPF programs?
> 
> This assembly creates a pt_regs structure on the stack by allocating
> FRAME_SIZE bytes, but only explicitly saves rax, rdx, rbp, and rsp. Later in
> ftrace_return_to_handler and arch_ftrace_partial_regs, only a few additional
> fields are populated.
> 
> The remaining fields (like rdi, rsi, rbx, and r12-r15) remain uninitialized.
> 
> Because this partially initialized pt_regs structure is passed to BPF
> kprobe_multi return programs via kprobe_multi_link_exit_handler(), and the
> BPF verifier allows reading any field of the pt_regs context, does this
> allow BPF programs to extract residual kernel stack data?

I think because kprobe/bpf is root only, it's not really an issue,
cc-ing Steven and Masami

jirka
