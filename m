Received: from mail-wr1-f48.google.com (mail-wr1-f48.google.com [209.85.221.48])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8E11C44B66A
	for <sashiko-reviews@lists.linux.dev>; Mon, 18 May 2026 12:50:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.48
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779108646; cv=none; b=Bc+nAiQrhpMx7nAlmO3iOCh35XzeVnVud5YYloxqrMxJ1PtijVKLcsVD/fit6RrHmCp8YEDzBIoyhTrMEEbUva5aadbsthoKlFRUergfJbKboLo2oyGPm47oYBs/xFQEEvUtobby6fFBWzQ/cDo58Pt0IABHB+Xa+roqVX2gNMQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779108646; c=relaxed/simple;
	bh=kG0zBGxl5DlcXlb7z+bicLfvzmtEd5Qp2YiqQMBvAwA=;
	h=From:Date:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=dGF+yNDYNtQ43+El3gjkhMQE2tLUzzZEikd4Rnf6IltbVbBAAXpZ3tzfxdF5xfmLC/EuW6eegsOZyUWUHmKZUhdT1RhXaGNZYPmCqFCy5cdZCP5QKI/8qK1+F/4CXQ9gnEaG4ieoydUJydNngwyUmnAzwr6uwvZrpIs7dhfXGgQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=kRZIfl32; arc=none smtp.client-ip=209.85.221.48
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="kRZIfl32"
Received: by mail-wr1-f48.google.com with SMTP id ffacd0b85a97d-44e1860558fso1279075f8f.0
        for <sashiko-reviews@lists.linux.dev>; Mon, 18 May 2026 05:50:44 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1779108643; x=1779713443; darn=lists.linux.dev;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:date:from:from:to
         :cc:subject:date:message-id:reply-to;
        bh=ql/8UlldJOKpd6Udzj2qJIyg292oHzAM/rjPKsghj1Y=;
        b=kRZIfl325TlpzwS4P2UAb4AXzp7uC7Yjigla07UDgAewbIhmAGzihIqc5s+o4bMsYY
         9H0XreRn++yGVkymPNu2oA6QqEg2I6RHwdw5vp28WSWEMo1Ug00xTdPE91jddpM7XGw5
         B20mR0TS0UUkkCBDy2QcOgoL88nzMFtH+FPXYt6K6IXJ8Shbl22i7leGEN12vWF2lN+g
         idN8xbZS3eJ34BR30i3pepuAdzon1UWCARsLEOr2KA4V1udq/TcIBtRGvu2KhUYt5o4c
         /+DkUuhnxFK57Ez+21zRLH+l8dikJnkwNlPrpL10y1PxhUIdKuKntL7mxXqGO2qmKfiA
         B4ww==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1779108643; x=1779713443;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=ql/8UlldJOKpd6Udzj2qJIyg292oHzAM/rjPKsghj1Y=;
        b=tSE0OZdEj+DI0sCg80QuQkK8u9g6gTLhfr4/Ljnz4En5O+Ts0jJSZUEacPbaw15/Qv
         gfqF7KuGqOatzKVnxTfD90vhg1IxJKMoW5zDqzaotzi3dCMhpm/fyb++U66ZSE9j8/XC
         +ra/OOGZ+q3LIsuVwup2NFi/z+hkYmQXix+e2X08cx619VSEVDlpp40Z4SWjqUNUJLxV
         jziNTZUdhMqjg4RLgRFOjqI+7p/HLlzvDe/iF7n3Wp+sYqQ3liGgupCoPGdXpCGuvkRd
         Oib5/mVtmIjKIrer3s+dXIf9g5gcHbHZE7q8rWjEI9YCO6uI/JxHbT1gBiqtq08FW9AU
         gDUA==
X-Gm-Message-State: AOJu0YwHbbkUWPfGnxHHJuoxFUkfQoGh0A3rNITYQYFNJh9lw2W2ZDCh
	RGPpBTq89zBNUKLQ0JKbeeiUmQRxU2RPvVwGj6kWkt9X3gug5T4vSooPgj1xHkti
X-Gm-Gg: Acq92OHz4Nt3kn0QqZNsLd0USKvnuYShH5WTWMpzP92bHEs0FLuTUq+YxAgdc99Evfz
	g3g2wtRrXlL6OcHENHH32UUrV1R3xszmrycf+oiojCAZip+xkekUG1SHo3cdS4TCBWFqvrUwlu0
	cnAFPxfH7CX+nNGqcVhvTE+9dAGvBMP59RJjWdF0kvmTkc5n791sAjM8KVjcrxqu1pjjsawQJEc
	fFZ3ZRgwhQZKtOSYobHU+bJO4IqPAeqV1Y+v9khrTY4j13Zr2iMFpjbZwtK7hN23K8yqO0cmC5M
	9kDk8a7lzFc0apnmkAC/0KD+9GTF25eyjOdNFPhGrMRZt1GqrJDuYm+TCPhZsiNJvtBgioZiVru
	ZcGMQHMaeSTaRLH2Mw6jc71krpaePjp2A+iNsPMS+gJJagiRQYTOPpVdywZ3nNIh7+SN/8Et3+q
	HRarGdKiryuXYTpAW5/NF/tCQdOQ==
X-Received: by 2002:a05:600c:35c5:b0:48f:f64c:c314 with SMTP id 5b1f17b1804b1-48ff64cc4d1mr171305945e9.30.1779108642524;
        Mon, 18 May 2026 05:50:42 -0700 (PDT)
Received: from krava ([2a00:102a:403c:11b1:accc:2af:f875:4e0d])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-48fe53ab6aasm271285035e9.2.2026.05.18.05.50.41
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 18 May 2026 05:50:41 -0700 (PDT)
From: Jiri Olsa <olsajiri@gmail.com>
X-Google-Original-From: Jiri Olsa <jolsa@kernel.org>
Date: Mon, 18 May 2026 14:50:39 +0200
To: sashiko-reviews@lists.linux.dev
Cc: bpf@vger.kernel.org
Subject: Re: [PATCHv2 02/11] uprobes/x86: Allow to copy uprobe trampolines on
 fork
Message-ID: <agsLH2G2DPxD3g12@krava>
References: <20260518105957.123445-3-jolsa@kernel.org>
 <20260518114208.CE128C2BCF6@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: sashiko-reviews@lists.linux.dev
List-Id: <sashiko-reviews.lists.linux.dev>
List-Subscribe: <mailto:sashiko-reviews+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:sashiko-reviews+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20260518114208.CE128C2BCF6@smtp.kernel.org>

On Mon, May 18, 2026 at 11:42:08AM +0000, sashiko-bot@kernel.org wrote:
> Thank you for your contribution! Sashiko AI review found 2 potential issue(s) to consider:
> - [Critical] __in_uprobe_trampoline uses current->mm instead of the target mm_struct, causing kernel crashes and instruction stream corruption during uprobe_unregister.
> - [High] Removing VM_DONTCOPY without synchronizing the uprobes state causes a linear VMA leak across fork chains.
> --
> 
> commit be0e6254bd9df4f56adce23d7a5e24a78c286291
> Author: Jiri Olsa <jolsa@kernel.org>
> uprobes/x86: Allow to copy uprobe trampolines on fork
> 
> This commit allows vma uprobe trampoline objects to be copied on fork to
> the new process by removing the VM_DONTCOPY flag.
> 
> > diff --git a/arch/x86/kernel/uprobes.c b/arch/x86/kernel/uprobes.c
> > --- a/arch/x86/kernel/uprobes.c
> > +++ b/arch/x86/kernel/uprobes.c
> > @@ -702,7 +702,7 @@ static struct uprobe_trampoline *create_uprobe_trampoline(unsigned long vaddr)
> >  
> >  	tramp->vaddr = vaddr;
> >  	vma = _install_special_mapping(mm, tramp->vaddr, PAGE_SIZE,
> > -				VM_READ|VM_EXEC|VM_MAYEXEC|VM_MAYREAD|VM_DONTCOPY|VM_IO,
> > +				VM_READ|VM_EXEC|VM_MAYEXEC|VM_MAYREAD|VM_IO,
> 
> Does removing VM_DONTCOPY without synchronizing the uprobes state cause a
> linear VMA leak across fork chains?
> 
> When dup_mmap() copies the uprobe trampoline VMA to the child process during
> fork(), the child's tracking list (mm->uprobes_state.head_tramps) is
> initialized as completely empty via mm_init_uprobes_state(), meaning the
> parent's state is not duplicated.
> 
> When the child process executes a uprobe, arch_uprobe_optimize() calls
> get_uprobe_trampoline(). Because head_tramps is empty, it fails to find the
> VMA it already inherited. It then falls back to create_uprobe_trampoline(),
> which calls find_nearest_trampoline(). Since the inherited VMA is already
> mapped, find_nearest_trampoline() finds a new unmapped area and installs a
> second duplicate trampoline VMA.
> 
> In a deep fork chain, each generation inherits all previous VMAs, has an
> empty head_tramps list, and creates a new VMA. Can this cause a linear
> accumulation of redundant VMAs, eventually exhausting vm.max_map_count and
> virtual memory?

I don't think it's big problem, because it's unlikely you'll insert extra uprobes
to child process.. but perhaps we could go away with struct uprobe_trampoline
object and operate directly on top of vma objects, it could event make code
easier, will try

> 
> As a related question about the uprobe trampolines introduced in the preceding
> commit ba2bfc97b462, does __in_uprobe_trampoline() safely handle unregistered
> uprobes?
> 
> When a uprobe is unregistered (e.g., via bpf_uprobe_unregister in a workqueue
> or by a different process like perf), set_orig_insn() calls is_optimized() to
> check if the uprobe is optimized. If is_optimized() internally calls
> __in_uprobe_trampoline() which hardcodes current->mm for the VMA lookup, does
> it completely ignore the passed mm parameter?

__in_uprobe_trampoline has no longer hardcoded current->mm, check
previous patch:

      uprobes/x86: Use proper mm_struct in __in_uprobe_trampoline

jirka

> 
> If unregistered asynchronously from a kernel thread, current->mm is NULL. Can
> this cause a deterministic NULL pointer dereference in vma_lookup() and crash
> the kernel?
> 
> Additionally, if unregistered by a different process, would vma_lookup()
> search the wrong mm, return false, and cause set_orig_insn() to incorrectly
> assume the instruction is not optimized? Could this lead to replacing only
> the first byte of the 5-byte CALL instruction with the original opcode,
> leaving the 4-byte relative offset as garbage and crashing the traced process
> when it executes the corrupted instruction?
> 
> >  				&tramp_mapping);
> >  	if (IS_ERR(vma)) {
> >  		kfree(tramp);
> 
> -- 
> Sashiko AI review · https://sashiko.dev/#/patchset/20260518105957.123445-3-jolsa@kernel.org?part=1
