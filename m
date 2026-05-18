Received: from mail-wm1-f54.google.com (mail-wm1-f54.google.com [209.85.128.54])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 33654221DB3
	for <sashiko-reviews@lists.linux.dev>; Mon, 18 May 2026 08:31:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.54
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779093117; cv=none; b=m69TU86TGzjwM4Frvv69Vk9WePpo7k7FNxRmclsWIrXi0wmvUVV730qrTZ/ZPGEQHdAQsWzqnnGMO6Kd1CT0dYaizFwUb932Bn7/Oc6g45UCCAH3mE6XCPjJeBN75ye1H8nRFVZBzpYK1VhKgPcvGU0iEYHA57kiJdaaNk4BEao=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779093117; c=relaxed/simple;
	bh=PmpScwcGJyXezoD1P7i8aSqy8+IuUXibgGwQ+ap6uj0=;
	h=From:Date:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=F2f5eqUhIThf2rdnfa5SwkbjmIpOS4aY1qc6P1459GHgTUR6ZfDioglAEAKyzdc+1WgMh1P69hLUuZCa/GCwZA+uUUTeTGUXEdFh5iJIE9Dbjx/vfkEg3VGynb8DDZVB7tJt0ULQlXiXYJvz8kS0yMvP1vDnsFmNeJikf40Cz9I=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=E0beJFyH; arc=none smtp.client-ip=209.85.128.54
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="E0beJFyH"
Received: by mail-wm1-f54.google.com with SMTP id 5b1f17b1804b1-488b0046078so17287155e9.1
        for <sashiko-reviews@lists.linux.dev>; Mon, 18 May 2026 01:31:56 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1779093115; x=1779697915; darn=lists.linux.dev;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:date:from:from:to:cc:subject:date:message-id:reply-to;
        bh=Pw8ouC4hEgSVvRs2LGBCbdqdtEj1Oh885FP+LlzBSas=;
        b=E0beJFyH08qkGoyQ8DmjNs/UhfK2qNRMDhZmzz0+uJq0MOl1IGA9uMdFD3mYFNYzow
         wyJJ624I4cigkbV84s7sgKuZhB5+l5ZVY+QtA6FpAFhhrkAvOW/9jn5O0MiACZOnCRFN
         6wZ2SqPgbxQCMuKNtaaacFUbxIYezu50UGvZrZwZ3H2tyCIC37j6YnC8eA5Ovw/Hg+NW
         y4ZqrLuGH6O0nMwdpKVFRUMpJWSeD0Rcw458LxoSQQ8z9GTbJGQS1vafOa2ZJ4KZHPQM
         0xYYyULPuTRn+Wk+h4lzb9tjxrvilh2dOO/uZdcFqZMYGtPsNp4jwarFHffY/fS+VvJe
         BsWg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1779093115; x=1779697915;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:date:from:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=Pw8ouC4hEgSVvRs2LGBCbdqdtEj1Oh885FP+LlzBSas=;
        b=Kuzg93m6SMGPytj1EuuM5ZxzjvI1hf1woiezU1FbLmGnckSPZgrhbgHHOVBtm6Teu5
         B/4AlPdzA8PpRdW6/fv5g8LFNq2uVGQW7k3Cg3Gzl9YielOrnZdOqfeV40oroSP+MLPl
         hnS3RCTZ2ZNtwIPxCAi/zJXhfzSWWCJA03Cjpp4O1a0KldHfeUcr3nWcbjZSEbJNZIhc
         16GGNWvwjtDgcEfQh2rU3FYQ/ZL4vpI4xl6lOYEfUs1o4zBXf2sIXtlx2vdFUdOc9cTY
         q667fFr9ntuhPokLCEpBpH+U+sS9Krv1P+e+b8PKxOtfqdbpHwT6gspXuzuQkfO8+ivU
         52Pw==
X-Gm-Message-State: AOJu0Yy7tt4DSeko7iL0S4fJ0Kb8yRTvbq0BnJHwmY4DsDWqdok1OTcE
	p7jpCg9sdh4/89n//KQmVTM7w38nB0ZVL3Y464l52mx9FhYxCwvlPef8
X-Gm-Gg: Acq92OHmImJvh28j1xn4sfhuClyYkv78HzKWS3jXLcpbBvSbVEnfS98h/TNNfEX/a7I
	J98VUL5rIX7coTmquaXapieZe5IxnqFeaT4YVIfhqEiuSe30aPvRGIsov4CK3/98glXVposp6Ap
	pWVhOGbCXgqW21SK/BVy5mifGG2Nlthxrn0T4HHJX8xUO+CGruOVeC+AouKjGj9XiyWqYyCPEAV
	Er7EKxjANGzYpAnQ6EA2DiJ1eZs6yqH82tcPF9SUS/cxhCEJOcbKePnQiQcwaTDxxpMUmhv9Uy/
	/O+XoNPrRqzUPsYCfpWV21HOdAWn1SLrItwHvc5fVf6dI0UX7MDR51Ia04CMQsMrH6i8ap0Cj7X
	7WPvtpzZcYImysiW3rxKhgnnb/TOIOjO5u7MILiark0cfdNRZF07C8KQiFmuy2jNut9vZs/JbJ0
	BVAlX1AOPE5oTyql8=
X-Received: by 2002:a05:600c:5297:b0:48a:5342:36b5 with SMTP id 5b1f17b1804b1-48fe61ed375mr212210515e9.21.1779093114436;
        Mon, 18 May 2026 01:31:54 -0700 (PDT)
Received: from krava ([2a02:8308:a00c:e200:b655:ff13:e355:16a3])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-48febe6b9efsm112607115e9.5.2026.05.18.01.31.53
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 18 May 2026 01:31:53 -0700 (PDT)
From: Jiri Olsa <olsajiri@gmail.com>
X-Google-Original-From: Jiri Olsa <jolsa@kernel.org>
Date: Mon, 18 May 2026 10:31:51 +0200
To: Jiri Olsa <olsajiri@gmail.com>
Cc: sashiko-reviews@lists.linux.dev, bpf@vger.kernel.org
Subject: Re: [PATCH 1/7] uprobes/x86: Move optimized uprobe from nop5 to nop10
Message-ID: <agrOd1GVFYSH_txN@krava>
References: <20260514135342.22130-2-jolsa@kernel.org>
 <20260514200545.C672EC2BCB3@smtp.kernel.org>
 <agcSP6LxxpRA4ICO@krava>
 <agmpurrWy15nahPK@krava>
Precedence: bulk
X-Mailing-List: sashiko-reviews@lists.linux.dev
List-Id: <sashiko-reviews.lists.linux.dev>
List-Subscribe: <mailto:sashiko-reviews+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:sashiko-reviews+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <agmpurrWy15nahPK@krava>

On Sun, May 17, 2026 at 01:42:50PM +0200, Jiri Olsa wrote:

SNIP

> > > Is there a similar issue for forked children that inherit the optimized
> > > 10-byte sequence?
> > > 
> > > During fork, uprobe_mmap() installs a breakpoint in the child by writing
> > > 0xCC to the first byte, changing the instruction from 48 8d... to cc 8d...
> > > 
> > > If the uprobe is unregistered before the child hits and re-optimizes it,
> > > __is_optimized() will return false because is_lea_insn() strictly expects
> > > the first byte to be 0x48:
> > > 
> > > arch/x86/kernel/uprobes.c:is_lea_insn() {
> > >         return !memcmp(insn, lea_rsp, LEA_INSN_SIZE);
> > > }
> > > 
> > > The fallback check for the re-attached probe on top of jmp8 also fails
> > > because insn[1] is 0x8d, not OPT_JMP8_OFFSET.
> > > 
> > > Could set_orig_insn() then fall back to writing just the first byte of
> > > the original instruction over the 0xcc, again leaving 66 8d 64 24 80 e8 ...
> > > and silently truncating the child's stack pointer?
> > 
> > nice.. maybe we can skip the install_breakpoint call in uprobe_mmap
> > for optimized probes.. will check
> 
> I think we need to dup uprobe trampolines on fork like below

or just allow it to be copied on fork

jirka


---
diff --git a/arch/x86/kernel/uprobes.c b/arch/x86/kernel/uprobes.c
index 4d91930aa792..e0067d1b6242 100644
--- a/arch/x86/kernel/uprobes.c
+++ b/arch/x86/kernel/uprobes.c
@@ -719,7 +719,7 @@ static struct uprobe_trampoline *create_uprobe_trampoline(unsigned long vaddr)
 
 	tramp->vaddr = vaddr;
 	vma = _install_special_mapping(mm, tramp->vaddr, PAGE_SIZE,
-				VM_READ|VM_EXEC|VM_MAYEXEC|VM_MAYREAD|VM_DONTCOPY|VM_IO,
+				VM_READ|VM_EXEC|VM_MAYEXEC|VM_MAYREAD|VM_IO,
 				&tramp_mapping);
 	if (IS_ERR(vma)) {
 		kfree(tramp);
