Received: from mail-wm1-f44.google.com (mail-wm1-f44.google.com [209.85.128.44])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E2376427A10
	for <sashiko-reviews@lists.linux.dev>; Mon, 18 May 2026 16:05:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.44
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779120317; cv=none; b=iUe5wJ2XGm2NukV6xr55Q6F9ue5Pelys4Eazxh2AuZGRShQwO6ESC+o2yvJjLG0B6qvyjrTHXA6S6yHvr75xgNQzjBDW1eTcn2tLjoG+deZoI9Xg3UwLNVoZ04QlZjW8pb6E8zmdNHQEnQ9V3SsFc9hj8Eom/P8gxlAYNqw7kSw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779120317; c=relaxed/simple;
	bh=qMo2h68N+JrWSJO/RZ8Kho5+FZTjs7X8pRv0HUWBMYw=;
	h=From:Date:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=tjhV8qcBD1oa4vafnd7lG+6i0N+JDA1auVGM6b8xW2vkcSNvZgMinLH3fvBG5a4dJR7113fcTiBqglZa/rGiDN4RDaxFrMu5k2jGMIZ3Y4iEzCdzT5y2CKRk2Oc5/eNpjw6AiT+Jywggpvg+1P0GFQXSafELcyG2bvU1YsF7Cd0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=PeIKzwJY; arc=none smtp.client-ip=209.85.128.44
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="PeIKzwJY"
Received: by mail-wm1-f44.google.com with SMTP id 5b1f17b1804b1-48ff4f8ef0dso28439295e9.3
        for <sashiko-reviews@lists.linux.dev>; Mon, 18 May 2026 09:05:01 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1779120298; x=1779725098; darn=lists.linux.dev;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:date:from:from:to:cc:subject:date:message-id:reply-to;
        bh=4VGgz8O/vKdGfNaGXkWUrfuoXq2xq9PVhrs10AnzG/A=;
        b=PeIKzwJYK6IqXweTPAgT5/D8ub36CT5LUOQ/IHPrBXckJAicYnpIXhbW0s9u0M+ZJZ
         9fUN7+zUp3LmHJHObTqHh6RGZ+LqHLyrciw36soY+QEfXztVPYWCj7t4fczlZnwTMVif
         fDkufAWhnHtYbhYxp2Ula/uw9RUGPcRdLR1B5Hk0vesRb6EHD8kx/3Xx6zpEBJqDIz2w
         BMNXhptdix5v+LzVlNwFFGzdgQR/SCLnPr9CEVh9BLLeIrBGelpsoF74Ao+uPINHQODx
         LLK6GGXciRhbAu+7bBw4X4PB3/BP5CNDSohmNpOrp8/YEtadrPdLlviA16UyerxSLPC7
         NhWg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1779120298; x=1779725098;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:date:from:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=4VGgz8O/vKdGfNaGXkWUrfuoXq2xq9PVhrs10AnzG/A=;
        b=in8VcQiJztOOHZiY+of1RanaRoqB/DBUkwXyuP0wfTDrLiO6rQEewWN6kIYnG2R95f
         nW53oKYH9GcB8IqR28O8ijhhq39f7NcRIgG/XIOLOYylFzkuRPoG+v8mUOsiZ0ZmxSe+
         dgbbw8uPFLjiG5B0pzHy9kTFnX1kc8LsG6qN1jvY7aHvNXSnNp5D3w8ITLhjsTg2zJNk
         9am0d2TBtwXfMp5ep/+pY3ABdBFEDBuKfoT+RtGje3Ioa3QogCg5VcsLeHJzQs7oPNh7
         +W9Rq8GJdeERP8a3JySXQ1GrdIQqIAG0Nuyw5ibyVIwGhqV+R90Vnmt5/+DFeqvPMieG
         sMOQ==
X-Gm-Message-State: AOJu0YyEFRxD/pPsHOfZ/oj58udrNInz4tr7a8/82U4giNrGBKxLU/Gg
	a/hQCiVvoahlFY2TR/v6Sd7gCqlceJTNhgTF9ffINHK+wph9CSHVQ64m
X-Gm-Gg: Acq92OELMjgnYftbKI/5YB1a4hoX7AzAx3VqMTsrnCSwqSInW4XvdJZE2oCxvc/lGDn
	AZ9sf5IETVFDuCfIkt7h7p9UTfEKN6E2lUdb15fXiQoWVx75j2mLOvjiXwIIghQGG09ZqjeHjrw
	8uamSgziYDQX0wDffXVjD/5qO3QGzUWZczBbzW1TVr6YD8rigPw0La5zg1LqbGvb5UdXHvb58Gp
	z/w1UIssHF2a2muF1uW9zQVILE90+QjdLe2dALoYpe63zx5x7QI7r09A55Oryk5krTVhxckuZrM
	N02GAgh6ukXppwB1miqpsECEydxpXCTKkuKuTAGwf5oU/xMe7D8lj53kTeQbUX2/u8+JK3s8Fuj
	8DOsO1190VNsGE59FWyAcRhL0+wsbTXMZlfngBlss9PHiUNLsl2PUEGeWM2xFJ1no6BGanN3Yoq
	Yr8Kuuczl3ki4=
X-Received: by 2002:a05:600c:3f1b:b0:489:1c5f:3a9e with SMTP id 5b1f17b1804b1-48fe60e7fa1mr247507865e9.13.1779120298029;
        Mon, 18 May 2026 09:04:58 -0700 (PDT)
Received: from krava ([176.74.159.170])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-48feae166dasm97591015e9.9.2026.05.18.09.04.57
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 18 May 2026 09:04:57 -0700 (PDT)
From: Jiri Olsa <olsajiri@gmail.com>
X-Google-Original-From: Jiri Olsa <jolsa@kernel.org>
Date: Mon, 18 May 2026 18:04:56 +0200
To: Jiri Olsa <olsajiri@gmail.com>
Cc: sashiko-reviews@lists.linux.dev, bpf@vger.kernel.org
Subject: Re: [PATCHv2 02/11] uprobes/x86: Allow to copy uprobe trampolines on
 fork
Message-ID: <ags4qIlqFBvgZ3UP@krava>
References: <20260518105957.123445-3-jolsa@kernel.org>
 <20260518114208.CE128C2BCF6@smtp.kernel.org>
 <agsLH2G2DPxD3g12@krava>
Precedence: bulk
X-Mailing-List: sashiko-reviews@lists.linux.dev
List-Id: <sashiko-reviews.lists.linux.dev>
List-Subscribe: <mailto:sashiko-reviews+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:sashiko-reviews+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <agsLH2G2DPxD3g12@krava>

On Mon, May 18, 2026 at 02:50:39PM +0200, Jiri Olsa wrote:
> On Mon, May 18, 2026 at 11:42:08AM +0000, sashiko-bot@kernel.org wrote:
> > Thank you for your contribution! Sashiko AI review found 2 potential issue(s) to consider:
> > - [Critical] __in_uprobe_trampoline uses current->mm instead of the target mm_struct, causing kernel crashes and instruction stream corruption during uprobe_unregister.
> > - [High] Removing VM_DONTCOPY without synchronizing the uprobes state causes a linear VMA leak across fork chains.
> > --
> > 
> > commit be0e6254bd9df4f56adce23d7a5e24a78c286291
> > Author: Jiri Olsa <jolsa@kernel.org>
> > uprobes/x86: Allow to copy uprobe trampolines on fork
> > 
> > This commit allows vma uprobe trampoline objects to be copied on fork to
> > the new process by removing the VM_DONTCOPY flag.
> > 
> > > diff --git a/arch/x86/kernel/uprobes.c b/arch/x86/kernel/uprobes.c
> > > --- a/arch/x86/kernel/uprobes.c
> > > +++ b/arch/x86/kernel/uprobes.c
> > > @@ -702,7 +702,7 @@ static struct uprobe_trampoline *create_uprobe_trampoline(unsigned long vaddr)
> > >  
> > >  	tramp->vaddr = vaddr;
> > >  	vma = _install_special_mapping(mm, tramp->vaddr, PAGE_SIZE,
> > > -				VM_READ|VM_EXEC|VM_MAYEXEC|VM_MAYREAD|VM_DONTCOPY|VM_IO,
> > > +				VM_READ|VM_EXEC|VM_MAYEXEC|VM_MAYREAD|VM_IO,
> > 
> > Does removing VM_DONTCOPY without synchronizing the uprobes state cause a
> > linear VMA leak across fork chains?
> > 
> > When dup_mmap() copies the uprobe trampoline VMA to the child process during
> > fork(), the child's tracking list (mm->uprobes_state.head_tramps) is
> > initialized as completely empty via mm_init_uprobes_state(), meaning the
> > parent's state is not duplicated.
> > 
> > When the child process executes a uprobe, arch_uprobe_optimize() calls
> > get_uprobe_trampoline(). Because head_tramps is empty, it fails to find the
> > VMA it already inherited. It then falls back to create_uprobe_trampoline(),
> > which calls find_nearest_trampoline(). Since the inherited VMA is already
> > mapped, find_nearest_trampoline() finds a new unmapped area and installs a
> > second duplicate trampoline VMA.
> > 
> > In a deep fork chain, each generation inherits all previous VMAs, has an
> > empty head_tramps list, and creates a new VMA. Can this cause a linear
> > accumulation of redundant VMAs, eventually exhausting vm.max_map_count and
> > virtual memory?
> 
> I don't think it's big problem, because it's unlikely you'll insert extra uprobes
> to child process.. but perhaps we could go away with struct uprobe_trampoline
> object and operate directly on top of vma objects, it could event make code
> easier, will try

ok looks like we could go without struct uprobe_trampoline layer (below),
that should address the comment, will do that in next version

jirka


---
diff --git a/arch/x86/kernel/uprobes.c b/arch/x86/kernel/uprobes.c
index 2be6707e3320..c87079e53946 100644
--- a/arch/x86/kernel/uprobes.c
+++ b/arch/x86/kernel/uprobes.c
@@ -631,11 +631,6 @@ static struct vm_special_mapping tramp_mapping = {
 	.pages  = tramp_mapping_pages,
 };
 
-struct uprobe_trampoline {
-	struct hlist_node	node;
-	unsigned long		vaddr;
-};
-
 static bool is_reachable_by_call(unsigned long vtramp, unsigned long vaddr)
 {
 	long delta = (long)(vaddr + 5 - vtramp);
@@ -682,12 +677,10 @@ static unsigned long find_nearest_trampoline(unsigned long vaddr)
 	return high_tramp;
 }
 
-static struct uprobe_trampoline *create_uprobe_trampoline(unsigned long vaddr)
+static struct vm_area_struct *create_uprobe_trampoline(unsigned long vaddr)
 {
 	struct pt_regs *regs = task_pt_regs(current);
 	struct mm_struct *mm = current->mm;
-	struct uprobe_trampoline *tramp;
-	struct vm_area_struct *vma;
 
 	if (!user_64bit_mode(regs))
 		return NULL;
@@ -696,69 +689,26 @@ static struct uprobe_trampoline *create_uprobe_trampoline(unsigned long vaddr)
 	if (IS_ERR_VALUE(vaddr))
 		return NULL;
 
-	tramp = kzalloc_obj(*tramp);
-	if (unlikely(!tramp))
-		return NULL;
-
-	tramp->vaddr = vaddr;
-	vma = _install_special_mapping(mm, tramp->vaddr, PAGE_SIZE,
+	return _install_special_mapping(mm, vaddr, PAGE_SIZE,
 				VM_READ|VM_EXEC|VM_MAYEXEC|VM_MAYREAD|VM_DONTCOPY|VM_IO,
 				&tramp_mapping);
-	if (IS_ERR(vma)) {
-		kfree(tramp);
-		return NULL;
-	}
-	return tramp;
 }
 
-static struct uprobe_trampoline *get_uprobe_trampoline(unsigned long vaddr, bool *new)
+static struct vm_area_struct *get_uprobe_trampoline(unsigned long vaddr)
 {
-	struct uprobes_state *state = &current->mm->uprobes_state;
-	struct uprobe_trampoline *tramp = NULL;
+	VMA_ITERATOR(vmi, current->mm, 0);
+	struct vm_area_struct *vma;
 
 	if (vaddr > TASK_SIZE || vaddr < PAGE_SIZE)
 		return NULL;
 
-	hlist_for_each_entry(tramp, &state->head_tramps, node) {
-		if (is_reachable_by_call(tramp->vaddr, vaddr)) {
-			*new = false;
-			return tramp;
-		}
+	for_each_vma(vmi, vma) {
+		if (!vma_is_special_mapping(vma, &tramp_mapping))
+			continue;
+		if (is_reachable_by_call(vma->vm_start, vaddr))
+			return vma;
 	}
-
-	tramp = create_uprobe_trampoline(vaddr);
-	if (!tramp)
-		return NULL;
-
-	*new = true;
-	hlist_add_head(&tramp->node, &state->head_tramps);
-	return tramp;
-}
-
-static void destroy_uprobe_trampoline(struct uprobe_trampoline *tramp)
-{
-	/*
-	 * We do not unmap and release uprobe trampoline page itself,
-	 * because there's no easy way to make sure none of the threads
-	 * is still inside the trampoline.
-	 */
-	hlist_del(&tramp->node);
-	kfree(tramp);
-}
-
-void arch_uprobe_init_state(struct mm_struct *mm)
-{
-	INIT_HLIST_HEAD(&mm->uprobes_state.head_tramps);
-}
-
-void arch_uprobe_clear_state(struct mm_struct *mm)
-{
-	struct uprobes_state *state = &mm->uprobes_state;
-	struct uprobe_trampoline *tramp;
-	struct hlist_node *n;
-
-	hlist_for_each_entry_safe(tramp, n, &state->head_tramps, node)
-		destroy_uprobe_trampoline(tramp);
+	return create_uprobe_trampoline(vaddr);
 }
 
 static bool __in_uprobe_trampoline(struct mm_struct *mm, unsigned long ip)
@@ -1111,21 +1061,15 @@ int set_orig_insn(struct arch_uprobe *auprobe, struct vm_area_struct *vma,
 static int __arch_uprobe_optimize(struct arch_uprobe *auprobe, struct mm_struct *mm,
 				  unsigned long vaddr)
 {
-	struct uprobe_trampoline *tramp;
-	struct vm_area_struct *vma;
-	bool new = false;
-	int err = 0;
+	struct vm_area_struct *vma, *tramp;
 
 	vma = find_vma(mm, vaddr);
 	if (!vma)
 		return -EINVAL;
-	tramp = get_uprobe_trampoline(vaddr, &new);
-	if (!tramp)
-		return -EINVAL;
-	err = swbp_optimize(auprobe, vma, vaddr, tramp->vaddr);
-	if (WARN_ON_ONCE(err) && new)
-		destroy_uprobe_trampoline(tramp);
-	return err;
+	tramp = get_uprobe_trampoline(vaddr);
+	if (IS_ERR_OR_NULL(tramp))
+		return PTR_ERR(tramp);
+	return WARN_ON_ONCE(swbp_optimize(auprobe, vma, vaddr, tramp->vm_start));
 }
 
 void arch_uprobe_optimize(struct arch_uprobe *auprobe, unsigned long vaddr)
diff --git a/include/linux/uprobes.h b/include/linux/uprobes.h
index f548fea2adec..43d950f444cf 100644
--- a/include/linux/uprobes.h
+++ b/include/linux/uprobes.h
@@ -238,8 +238,6 @@ extern void uprobe_handle_trampoline(struct pt_regs *regs);
 extern void *arch_uretprobe_trampoline(unsigned long *psize);
 extern unsigned long uprobe_get_trampoline_vaddr(void);
 extern void uprobe_copy_from_page(struct page *page, unsigned long vaddr, void *dst, int len);
-extern void arch_uprobe_clear_state(struct mm_struct *mm);
-extern void arch_uprobe_init_state(struct mm_struct *mm);
 extern void handle_syscall_uprobe(struct pt_regs *regs, unsigned long bp_vaddr);
 extern void arch_uprobe_optimize(struct arch_uprobe *auprobe, unsigned long vaddr);
 extern unsigned long arch_uprobe_get_xol_area(void);
diff --git a/kernel/events/uprobes.c b/kernel/events/uprobes.c
index 4084e926e284..b5c516168f84 100644
--- a/kernel/events/uprobes.c
+++ b/kernel/events/uprobes.c
@@ -1806,14 +1806,6 @@ static struct xol_area *get_xol_area(void)
 	return area;
 }
 
-void __weak arch_uprobe_clear_state(struct mm_struct *mm)
-{
-}
-
-void __weak arch_uprobe_init_state(struct mm_struct *mm)
-{
-}
-
 /*
  * uprobe_clear_state - Free the area allocated for slots.
  */
@@ -1825,8 +1817,6 @@ void uprobe_clear_state(struct mm_struct *mm)
 	delayed_uprobe_remove(NULL, mm);
 	mutex_unlock(&delayed_uprobe_lock);
 
-	arch_uprobe_clear_state(mm);
-
 	if (!area)
 		return;
 
diff --git a/kernel/fork.c b/kernel/fork.c
index 5f3fdfdb14c7..9c6baabdc961 100644
--- a/kernel/fork.c
+++ b/kernel/fork.c
@@ -1059,7 +1059,6 @@ static void mm_init_uprobes_state(struct mm_struct *mm)
 {
 #ifdef CONFIG_UPROBES
 	mm->uprobes_state.xol_area = NULL;
-	arch_uprobe_init_state(mm);
 #endif
 }
 
