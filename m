Received: from mail-wr1-f46.google.com (mail-wr1-f46.google.com [209.85.221.46])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 300C8344031
	for <sashiko-reviews@lists.linux.dev>; Sun, 17 May 2026 11:42:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.46
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779018175; cv=none; b=qOnDMUlHKtfGheMgiptJ+01BUuFixM8Vhr/yu8pZRd/h5ex3FJBy/STCbdr76dtaQo4QrFILB+fl0DldJrYotHKEo05qxi41M8xnmYAUTgrNHEA1JL4EphtcR3mwklZUmI8wi6MXuWst2w+rdqS9TXUHuqj/h3gQICRuBo7L3PU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779018175; c=relaxed/simple;
	bh=Xy1jqNO/dWSb+SZbjSvHdSEZMKvQz0fLuscfrvVICH0=;
	h=From:Date:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=pPm/3SVJLMlrAGHD24tfoTv19dcZCDIy/Hei+KhCCCv43E00m57cBQzYh54kGw50TM0N90AwZI7fzmtBgBFfqsGpj3m2r9owUdkldJG4EjW4ka26hrd3yt75PuXAEV7dJ0EVismar+tUq97SvRf5FnVTQ/V0kNV4F4D1ORvZrPk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=ffFQRC4Q; arc=none smtp.client-ip=209.85.221.46
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="ffFQRC4Q"
Received: by mail-wr1-f46.google.com with SMTP id ffacd0b85a97d-43d7645adbdso733385f8f.1
        for <sashiko-reviews@lists.linux.dev>; Sun, 17 May 2026 04:42:54 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1779018172; x=1779622972; darn=lists.linux.dev;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:date:from:from:to:cc:subject:date:message-id:reply-to;
        bh=JK0RbP9KNEdv+TVPsROEDK3VHRuOLbzAz89mc5tNNn0=;
        b=ffFQRC4QmIQFNq94WflY+IIgviup0VzpbfluTPcI1D/sMHAktB1+i3woofxKJ4CdKv
         2kpeDtbkdouJehd7LVYDpkhObOSv9arNb+41YxGQ+vAAw4uJxMdh2fZXqymAlhrwfHhX
         ywUU0+hOiAW7rab0MJQb5cIbeajbl0OCl6ZFj2HWGHPGEFCCxu0VITr+HlDrULr7r6GQ
         1yXjnWMuVwA+r6fHJaVFipkbDF9kF4Ohew2RmUBwYGKjfsyvltPTxcaSzMBp6KapASV6
         AekJb/fyuvMi98S5AH84undnpGE+UnbT3f1CBBK1lOCX+mcFK0XeLnYpuXalLAS4Utzr
         UuXA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1779018172; x=1779622972;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:date:from:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=JK0RbP9KNEdv+TVPsROEDK3VHRuOLbzAz89mc5tNNn0=;
        b=bf+GPcP4TMzDvdjDqJGFbqAwPEjj4SIQmH5qdLeffFnnGAeqN9XbqigvWcllJ906Dz
         K81RTSxLqFHDzphEjCYXUNYaRTV8thXQp2t4XQmKYbU7I131WqGzzJEbSaYGv8i1pNdo
         s/ORZbLuStmPnegmYljm6kdcMqooy0wNw5PN5qpmQjPG41d55jxwd4uf/C9JKjvY8LCU
         14aEH9Q37Be9FKvZ6CAUwfIfQnvts6CAV1HSaiy0NgSYY40GJNe9+4zK5xcQ+ejyKX0x
         eFK+DSHFNZVeCuu5aXWEirQtwvVAwJsLM/zgi06NpfwMX9v64/nWeiPxbDenJ1DB1pdA
         p0Ag==
X-Gm-Message-State: AOJu0YxeUjdyRRg/fHgQ84WaXtQRo9kbgZ4yWi7bXY7lhpRlvDBh3R3A
	/xjFl5IuHhw/Z2dEhxTICZSa8wsoLdrycoVGnmFNcf6n0whbveplNufk
X-Gm-Gg: Acq92OEzmb+vXMGRgMVauVs9QsgJ1Npk7EKSFcsEqw3oHFV6lNMUTdNzdOV5/tYZJfc
	//E6QHyfaGLjYm+0k6xkdysCFYR9bvGft7nAZXIHtX7Hz55INCcN3BmW66Y90k2eXPJ2G+mDKfK
	an/VOYTezlC/eJZRItfnxJH/+kIZsPLnw+dDrWz2aCMauhGbAOJOKGDs3exkvXiiK5S2voAfR9P
	H2GbFwHMQ23sGSx5B24M7SpQSPd8cieAbbfJ4wSxubyHg6JUtBsS/zVwhelBN0tYNJ/fIqb7Ud9
	jF8xKfGoUYdgMkSWZdbHlSGhqTjmrPlFuOCl/SmqksqQLc0qkvKhaOBETiEqK4wN9tSXkS9hyhx
	lo+rbWzJ+qOxqEHQbrUsXGlBOBcUBoEqDoeNswvDddzAuJ24RztFNec74mo/6uFjqgbWLz6ie4n
	tRxV4JCyPqvLKu5onLohwNQspVXg==
X-Received: by 2002:a05:6000:2087:b0:441:1e1e:a050 with SMTP id ffacd0b85a97d-45e5c367353mr16471811f8f.16.1779018172192;
        Sun, 17 May 2026 04:42:52 -0700 (PDT)
Received: from krava ([2a02:8308:a00c:e200:b655:ff13:e355:16a3])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-45da0fe1a41sm31736211f8f.31.2026.05.17.04.42.51
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 17 May 2026 04:42:51 -0700 (PDT)
From: Jiri Olsa <olsajiri@gmail.com>
X-Google-Original-From: Jiri Olsa <jolsa@kernel.org>
Date: Sun, 17 May 2026 13:42:50 +0200
To: Jiri Olsa <olsajiri@gmail.com>
Cc: sashiko-reviews@lists.linux.dev, bpf@vger.kernel.org
Subject: Re: [PATCH 1/7] uprobes/x86: Move optimized uprobe from nop5 to nop10
Message-ID: <agmpurrWy15nahPK@krava>
References: <20260514135342.22130-2-jolsa@kernel.org>
 <20260514200545.C672EC2BCB3@smtp.kernel.org>
 <agcSP6LxxpRA4ICO@krava>
Precedence: bulk
X-Mailing-List: sashiko-reviews@lists.linux.dev
List-Id: <sashiko-reviews.lists.linux.dev>
List-Subscribe: <mailto:sashiko-reviews+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:sashiko-reviews+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <agcSP6LxxpRA4ICO@krava>

On Fri, May 15, 2026 at 02:31:59PM +0200, Jiri Olsa wrote:
> On Thu, May 14, 2026 at 08:05:45PM +0000, sashiko-bot@kernel.org wrote:
> > Thank you for your contribution! Sashiko AI review found 2 potential issue(s) to consider:
> > - [High] set_orig_insn fails to unoptimize uprobes in foreign processes because __is_optimized relies on __in_uprobe_trampoline, which hardcodes current->mm for VMA lookups, resulting in silent stack pointer corruption.
> > - [High] set_orig_insn fails to unoptimize a forked child's uprobe due to breakpoint overwriting the lea instruction, leaving a corrupted instruction that truncates the stack pointer.
> > --
> > 
> > commit ecbc682eb0a0b0a7df1fd339bbdb6beeb8e1fc0a
> > Author: Jiri Olsa <jolsa@kernel.org>
> > 
> > uprobes/x86: Move optimized uprobe from nop5 to nop10
> > 
> > This commit fixes a redzone clobbering issue with optimized uprobes by
> > moving them to use a 10-byte nop instruction, allowing space for a stack
> > adjustment before the call.
> > 
> > Link: https://lore.kernel.org/bpf/20260509003146.976844-1-andrii@kernel.org/
> > 
> > > diff --git a/arch/x86/kernel/uprobes.c b/arch/x86/kernel/uprobes.c
> > > --- a/arch/x86/kernel/uprobes.c
> > > +++ b/arch/x86/kernel/uprobes.c
> > 
> > [ ... ]
> > 
> > > @@ -1049,19 +1077,21 @@ static bool __is_optimized(uprobe_opcode_t *insn, unsigned long vaddr)
> > >  	struct __packed __arch_relative_insn {
> > >  		u8 op;
> > >  		s32 raddr;
> > > -	} *call = (struct __arch_relative_insn *) insn;
> > > +	} *call = (struct __arch_relative_insn *)(insn + LEA_INSN_SIZE);
> > >  
> > > -	if (!is_call_insn(insn))
> > > +	if (!is_lea_insn(insn))
> > > +		return false;
> > > +	if (!is_call_insn(insn + LEA_INSN_SIZE))
> > >  		return false;
> > > -	return __in_uprobe_trampoline(vaddr + 5 + call->raddr);
> > > +	return __in_uprobe_trampoline(vaddr + OPT_INSN_SIZE + call->raddr);
> > >  }
> > 
> > Does this sequence risk silent stack pointer corruption during uprobe
> > unregistration?
> > 
> > When a tracer unregisters a uprobe from another process, it runs in the
> > tracer's context. However, __is_optimized() calls __in_uprobe_trampoline(),
> > which hardcodes current->mm for the VMA lookup:
> > 
> > arch/x86/kernel/uprobes.c:__in_uprobe_trampoline() {
> >         struct vm_area_struct *vma = vma_lookup(current->mm, ip);
> >         return vma && vma_is_special_mapping(vma, &tramp_mapping);
> > }
> > 
> > Since current is the tracer, the lookup fails, causing __is_optimized()
> > to return false.
> > 
> > If __is_optimized() returns false, set_orig_insn() bypasses
> > swbp_unoptimize() and writes only the first byte of the original
> > instruction (e.g., 0x66 for nop10) over the 0x48 (lea) byte.
> > 
> > This leaves the instruction 66 8d 64 24 80 e8 ... in the tracee's memory,
> > which decodes as lea -0x80(%rsp), %sp. Could this truncate the stack
> > pointer to 16 bits and cause stack corruption when the tracee subsequently
> > pushes or pops?
> 
> yes, we need to pass vma->vm_mm to __is_optimized and not use current->mm
> 
> > 
> > [ ... ]
> > 
> > > @@ -1095,14 +1125,25 @@ int set_orig_insn(struct arch_uprobe *auprobe, struct vm_area_struct *vma,
> > >  		  unsigned long vaddr)
> > >  {
> > >  	if (test_bit(ARCH_UPROBE_FLAG_CAN_OPTIMIZE, &auprobe->flags)) {
> > > -		int ret = is_optimized(vma->vm_mm, vaddr);
> > > -		if (ret < 0)
> > > +		uprobe_opcode_t insn[OPT_INSN_SIZE];
> > > +		int ret;
> > > +
> > > +		ret = copy_from_vaddr(vma->vm_mm, vaddr, &insn, OPT_INSN_SIZE);
> > > +		if (ret)
> > >  			return ret;
> > > -		if (ret) {
> > > +		if (__is_optimized((uprobe_opcode_t *)&insn, vaddr)) {
> > >  			ret = swbp_unoptimize(auprobe, vma, vaddr);
> > >  			WARN_ON_ONCE(ret);
> > >  			return ret;
> > >  		}
> > > +		/*
> > > +		 * We can have re-attached probe on top of jmp8 instruction,
> > > +		 * which did not get optimized. We need to restore the jmp8
> > > +		 * instruction, instead of the original instruction (nop10).
> > > +		 */
> > > +		if (is_swbp_insn(&insn[0]) && insn[1] == OPT_JMP8_OFFSET)
> > > +			return uprobe_write_opcode(auprobe, vma, vaddr, JMP8_INSN_OPCODE,
> > > +						   false /* is_register */);
> > >  	}
> > >  	return uprobe_write_opcode(auprobe, vma, vaddr, *(uprobe_opcode_t *)&auprobe->insn,
> > >  				   false /* is_register */);
> > 
> > Is there a similar issue for forked children that inherit the optimized
> > 10-byte sequence?
> > 
> > During fork, uprobe_mmap() installs a breakpoint in the child by writing
> > 0xCC to the first byte, changing the instruction from 48 8d... to cc 8d...
> > 
> > If the uprobe is unregistered before the child hits and re-optimizes it,
> > __is_optimized() will return false because is_lea_insn() strictly expects
> > the first byte to be 0x48:
> > 
> > arch/x86/kernel/uprobes.c:is_lea_insn() {
> >         return !memcmp(insn, lea_rsp, LEA_INSN_SIZE);
> > }
> > 
> > The fallback check for the re-attached probe on top of jmp8 also fails
> > because insn[1] is 0x8d, not OPT_JMP8_OFFSET.
> > 
> > Could set_orig_insn() then fall back to writing just the first byte of
> > the original instruction over the 0xcc, again leaving 66 8d 64 24 80 e8 ...
> > and silently truncating the child's stack pointer?
> 
> nice.. maybe we can skip the install_breakpoint call in uprobe_mmap
> for optimized probes.. will check

I think we need to dup uprobe trampolines on fork like below

jirka


---
 arch/x86/kernel/uprobes.c | 30 ++++++++++++++++++++++++------
 include/linux/uprobes.h   |  6 ++++--
 kernel/events/uprobes.c   |  8 +++++++-
 mm/mmap.c                 |  2 +-
 4 files changed, 36 insertions(+), 10 deletions(-)

diff --git a/arch/x86/kernel/uprobes.c b/arch/x86/kernel/uprobes.c
index 2be6707e3320..a29cdc3b85f1 100644
--- a/arch/x86/kernel/uprobes.c
+++ b/arch/x86/kernel/uprobes.c
@@ -682,19 +682,21 @@ static unsigned long find_nearest_trampoline(unsigned long vaddr)
 	return high_tramp;
 }
 
-static struct uprobe_trampoline *create_uprobe_trampoline(unsigned long vaddr)
+static struct uprobe_trampoline *
+create_uprobe_trampoline(struct mm_struct *mm, unsigned long vaddr, bool nearest)
 {
 	struct pt_regs *regs = task_pt_regs(current);
-	struct mm_struct *mm = current->mm;
 	struct uprobe_trampoline *tramp;
 	struct vm_area_struct *vma;
 
 	if (!user_64bit_mode(regs))
 		return NULL;
 
-	vaddr = find_nearest_trampoline(vaddr);
-	if (IS_ERR_VALUE(vaddr))
-		return NULL;
+	if (nearest)  {
+		vaddr = find_nearest_trampoline(vaddr);
+		if (IS_ERR_VALUE(vaddr))
+			return NULL;
+	}
 
 	tramp = kzalloc_obj(*tramp);
 	if (unlikely(!tramp))
@@ -726,7 +728,7 @@ static struct uprobe_trampoline *get_uprobe_trampoline(unsigned long vaddr, bool
 		}
 	}
 
-	tramp = create_uprobe_trampoline(vaddr);
+	tramp = create_uprobe_trampoline(current->mm, vaddr, true);
 	if (!tramp)
 		return NULL;
 
@@ -1169,6 +1171,22 @@ static bool can_optimize(struct insn *insn, unsigned long vaddr)
 	/* We can't do cross page atomic writes yet. */
 	return PAGE_SIZE - (vaddr & ~PAGE_MASK) >= 5;
 }
+
+int arch_uprobe_dup_mmap(struct mm_struct *oldmm, struct mm_struct *newmm)
+{
+	struct uprobes_state *old_state = &oldmm->uprobes_state;
+	struct uprobes_state *new_state = &newmm->uprobes_state;
+	struct uprobe_trampoline *old_tramp, *new_tramp;
+
+	hlist_for_each_entry(old_tramp, &old_state->head_tramps, node) {
+		new_tramp = create_uprobe_trampoline(newmm, old_tramp->vaddr, false);
+		if (!new_tramp)
+			return -EINVAL;
+		hlist_add_head(&new_tramp->node, &new_state->head_tramps);
+	}
+
+	return 0;
+}
 #else /* 32-bit: */
 /*
  * No RIP-relative addressing on 32-bit
diff --git a/include/linux/uprobes.h b/include/linux/uprobes.h
index f548fea2adec..01fc8f59eee5 100644
--- a/include/linux/uprobes.h
+++ b/include/linux/uprobes.h
@@ -214,7 +214,8 @@ extern int uprobe_mmap(struct vm_area_struct *vma);
 extern void uprobe_munmap(struct vm_area_struct *vma, unsigned long start, unsigned long end);
 extern void uprobe_start_dup_mmap(void);
 extern void uprobe_end_dup_mmap(void);
-extern void uprobe_dup_mmap(struct mm_struct *oldmm, struct mm_struct *newmm);
+extern int uprobe_dup_mmap(struct mm_struct *oldmm, struct mm_struct *newmm);
+extern int arch_uprobe_dup_mmap(struct mm_struct *oldmm, struct mm_struct *newmm);
 extern void uprobe_free_utask(struct task_struct *t);
 extern void uprobe_copy_process(struct task_struct *t, u64 flags);
 extern int uprobe_post_sstep_notifier(struct pt_regs *regs);
@@ -284,9 +285,10 @@ static inline void uprobe_start_dup_mmap(void)
 static inline void uprobe_end_dup_mmap(void)
 {
 }
-static inline void
+static inline int
 uprobe_dup_mmap(struct mm_struct *oldmm, struct mm_struct *newmm)
 {
+	return 0;
 }
 static inline void uprobe_notify_resume(struct pt_regs *regs)
 {
diff --git a/kernel/events/uprobes.c b/kernel/events/uprobes.c
index 4084e926e284..29890e354430 100644
--- a/kernel/events/uprobes.c
+++ b/kernel/events/uprobes.c
@@ -1845,13 +1845,19 @@ void uprobe_end_dup_mmap(void)
 	percpu_up_read(&dup_mmap_sem);
 }
 
-void uprobe_dup_mmap(struct mm_struct *oldmm, struct mm_struct *newmm)
+int __weak arch_uprobe_dup_mmap(struct mm_struct *oldmm, struct mm_struct *newmm)
+{
+	return 0;
+}
+
+int uprobe_dup_mmap(struct mm_struct *oldmm, struct mm_struct *newmm)
 {
 	if (mm_flags_test(MMF_HAS_UPROBES, oldmm)) {
 		mm_flags_set(MMF_HAS_UPROBES, newmm);
 		/* unconditionally, dup_mmap() skips VM_DONTCOPY vmas */
 		mm_flags_set(MMF_RECALC_UPROBES, newmm);
 	}
+	return arch_uprobe_dup_mmap(oldmm, newmm);
 }
 
 static unsigned long xol_get_slot_nr(struct xol_area *area)
diff --git a/mm/mmap.c b/mm/mmap.c
index 5754d1c36462..ae7540d42dc6 100644
--- a/mm/mmap.c
+++ b/mm/mmap.c
@@ -1739,7 +1739,6 @@ __latent_entropy int dup_mmap(struct mm_struct *mm, struct mm_struct *oldmm)
 	if (mmap_write_lock_killable(oldmm))
 		return -EINTR;
 	flush_cache_dup_mm(oldmm);
-	uprobe_dup_mmap(oldmm, mm);
 	/*
 	 * Not linked in yet - no deadlock potential:
 	 */
@@ -1901,6 +1900,7 @@ __latent_entropy int dup_mmap(struct mm_struct *mm, struct mm_struct *oldmm)
 		mm_flags_set(MMF_UNSTABLE, mm);
 	}
 out:
+	retval = retval ?: uprobe_dup_mmap(oldmm, mm);
 	mmap_write_unlock(mm);
 	flush_tlb_mm(oldmm);
 	mmap_write_unlock(oldmm);
-- 
2.53.0

