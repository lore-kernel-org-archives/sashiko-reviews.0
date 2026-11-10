Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.128.45
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794318681;
	b=1OSTM3QQXqAtNe+DkUeGq0bxC5JU0DKv5blXxu7E5yYbIjKtlgZb500QD4QmRG+QlI+1
	 pJwTlTxZ94aZlVyFpCn2T9q51yV6a2DOUK5gRjF1N632pUb658+ZKLjBHlC+IV8l0Ng3d
	 N5VwYoN8QTXUoMYymKZ9QNrflsOOaSW7dD5rEInUax6o8/8CH6PSVaQ1y0Rsx/SFPeUPM
	 s9mYf0dMirkDqrOlBtOca8cJcsHUykE48N9BcWT/SVMTPxtLdd7wVdXQTPEq2LuS76ueV
	 tl2Nla+zOdW3e3dFeDx5l9ISu1wm7UIUN9yuexRZdEn5od//fniCJlpolxN6AGo0sUQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794318681;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:Received:Date:From:To:Cc:
	 Subject:Message-ID:References:MIME-Version:Content-Type:
	 Content-Disposition:Content-Transfer-Encoding:In-Reply-To;
	bh=x1qBW8RoYHIsd8MuKQz0jzwuZbI8dPJ3tz/udwg6UjY=;
	b=VSmTrpy6TsSWjMDr6syTsgGCRvsYbIw5dYj9jpR0mf5udWeOM+OpMgzabE8aBINBHey5
	 SEPUInz3c6aYtcJRsrqqQbRiFTOExTmRbdtsNHD9e4Oay8UDAAkLBwmNileg4ZQHMjaiA
	 9zJqkgjBEqa4mD67KZsS1maGcoQeQMgyBE+fbMkNGP6eqrQ+szOklv8OZcB21NPWX0mdN
	 naNPKiBH6qkp0ziM7PwS7FbV6Xr93k5UUkL7oxP3dKd5srW1/kF7KAlS8D9JjTM6oEbfH
	 /MK8tDe75q0jiiSloUao9PPKTzhw/B+BlqqMHj6HI26jbZWDwmiVB0nCfNp7klkCfzQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=Q8MfRVfd;
	arc=none smtp.remote-ip=209.85.128.45
Received: from mail-wm1-f45.google.com (mail-wm1-f45.google.com [209.85.128.45])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 62E2A606A31C
	for <sashiko-reviews@lists.linux.dev>; Tue, 10 Nov 2026 13:51:21 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 62E2A606A31C
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=Q8MfRVfd
Received: by mail-wm1-f45.google.com with SMTP id 5b1f17b1804b1-4a5b2be99a8so17159865e9.2
        for <sashiko-reviews@lists.linux.dev>; Tue, 10 Nov 2026 05:51:21 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794318680; x=1794923480; darn=lists.linux.dev;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :content-type:mime-version:references:message-id:subject:cc:to:from
         :date:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=x1qBW8RoYHIsd8MuKQz0jzwuZbI8dPJ3tz/udwg6UjY=;
        b=Q8MfRVfdCOVUJylwqwi/4N3LDyzOV60C8/gwrxFeM/vQpCHHDn6LtUxdqQ/Rhrujhg
         YtSdcITZLBYz0SXfj8aoTdrcS0yI/ZnDjqUr48xr34xgrcc3oUH6MRiOCj7J9dA3PSO9
         7G7+qT4OrWK2QWzocqd+16hGx4SglPw/EW5JheBuI1Ai2bgaLV1TIOL7DaQBidEQSsRy
         OYmB6ev3PtJozO0UTWtlsgXmrbBnnMANiOuKumbXNpkEFYen1HUdGuZmao9DgdLvFYxk
         ELWg80KxgbxM1TI/CzTWyZLfJvWHNwv0ehdb+1JCLlVZIk1XjmXE2mVmpuwcLJ79gUzG
         VcAw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794318680; x=1794923480;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :content-type:mime-version:references:message-id:subject:cc:to:from
         :date:x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=x1qBW8RoYHIsd8MuKQz0jzwuZbI8dPJ3tz/udwg6UjY=;
        b=honkvAWImRNwbmoKhsIu3wWEO5wz7JC9jpZ5+4XPXd9g9cofwUON8FhvMwovYN9aCO
         9HTd+Q+Iscj7m725vZ54j4tbicpWG7CNEuoKB3CXVWAo8UkoRZJzzzHRVjgL7lqRsN5o
         SB+B18iqTS9BU23JN3TcLw9pIzvvSKIgH/YD03IqQajb6BRR3xcODSH2cuM31rAWCfyF
         /ma5/flEnjxo86M5hRsu9M5e7O/4Slu/GkIipNS/1NMISBS3hweypRYjzyIYWAC3MvBR
         NhE3BcSEXQJJuXSjZh/PEzWB7DTcX3q3/fPduxNktQMPhrgjPdg+NR7+5wZgoxLD2b4L
         hF1w==
X-Gm-Message-State: APuU4Z/E7SBl1wAIv45Lj22WsPvWGWp/PPUR6zCAR3O+LKpWNXAEJS32
	3mgnye7ymlTgEx71HrKltEJ4TMLLNnufRsKRk0f5gv5zzzQeudXUBRLIwcv/9Q==
X-Gm-Gg: AYBFou3bRZbiCZAOXDd9L5scWtRpJ+J+RXPPKgnJkapSKPhMrZgxrXMM2rbxq1KTs1g
	eVdAWXjOxCX/NXRPEYfXQLWy+yrU9b6B+IWR2GMDt3k78wyMB2XzE00dfNF8RU92byOBt8Ydc3N
	7zORMHGGwXu/fuL/nM0sPPWooN4/VGvbJ4/o0jeN4JsS1RrL/TClmVrdr5F9SLTJCQTQwIGsGCU
	2KXP0m9um5oLFmabUujZPAZRc29qpmb0camFGzxCrsE1UATn4+PpUtGB9IfH6tZwZA7s10JY8IT
	jc5bNZE1vN7wbv24T0gp3LwWnJuAryAvhR2JUj6fMphsaIDw4lYQCC6vVW9ruexzcjb5SiXTrG/
	VYDtBjl6NMRpbRPt4bTCzhrqkRe33kwSmHzxuEPCJureNQ9i0By+jAYwEV37yTZr5VpqMJ1BCOk
	Jw55ByHWfhbWfUe9V7UFCh4ZGuBXUhi+6LW8rrvRegz4cWpwmxaDpkSnL+qYj0qJkjlKDBDbhcU
	kfV9sVyKlGPIUiSGtxzS+D6WW6NFdErZ8/eKJHru8nqWjgyaroNbim2mGkXyqJr8qTMw5kcRtie
	CEfrWqlVWrlf4+qyHxbQ/VDXRXRQYLfq/DArxA==
X-Received: by 2002:a05:600c:3e1a:b0:4a1:de8a:603a with SMTP id 5b1f17b1804b1-4ba0233a429mr47496295e9.6.1794318679654;
        Tue, 10 Nov 2026 05:51:19 -0800 (PST)
Received: from mail.gmail.com ([2a04:ee41:4:b2de:1ac0:4dff:fe0f:3782])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4ba01fef1d0sm64488975e9.13.2026.11.10.05.51.18
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 10 Nov 2026 05:51:18 -0800 (PST)
Date: Tue, 10 Nov 2026 14:02:50 +0000
From: Anton Protopopov <a.s.protopopov@gmail.com>
To: sashiko-reviews@lists.linux.dev
Cc: bpf@vger.kernel.org
Subject: Re: [PATCH v2 bpf-next 07/18] scripts: Add LLVM plugin infrastructure
Message-ID: <avMkCh9LLezKS151@mail.gmail.com>
References: <20261109170550.141443-1-a.s.protopopov@gmail.com>
 <20261109170550.141443-8-a.s.protopopov@gmail.com>
 <sashiko-outbox-205331@kernel.org>
X-Mailing-List: sashiko-reviews@lists.linux.dev
List-Id: <sashiko-reviews.lists.linux.dev>
List-Post: <mailto:sashiko-reviews@lists.linux.dev>
List-Help: <mailto:sashiko-reviews+help@lists.linux.dev>
List-Subscribe: <mailto:sashiko-reviews+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:sashiko-reviews+unsubscribe@lists.linux.dev>
List-Owner: <mailto:sashiko-reviews+owner@lists.linux.dev>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <sashiko-outbox-205331@kernel.org>

On 26/11/09 05:45PM, sashiko-bot@kernel.org wrote:
> Thank you for your contribution! Sashiko AI review found 2 potential
> issues to consider:
> - [Low] riscv: pi: filter out LLVM_PLUGINS_CFLAGS from KBUILD_CFLAGS
> - [Low] vdso: avoid stripping LLVM_PLUGINS_CFLAGS from kernel objects
> --

no, riscv is not supported yet, vdso is not target for fmodret

> commit 072fb07f8d2d07b80e87b0ea8e05cc60c466504e
> Author: Anton Protopopov <a.s.protopopov@gmail.com>
> 
> scripts: Add LLVM plugin infrastructure
> 
> This commit adds Kbuild and Kconfig infrastructure for building and loading
> LLVM IR pass plugins with -fpass-plugin, and excludes LLVM_PLUGINS_CFLAGS
> from vDSO, EFI stub, and early boot builds.
> 
> > diff --git a/arch/arm64/kernel/pi/Makefile b/arch/arm64/kernel/pi/Makefile
> > index a273ab5af805c..5813bb75c9925 100644
> > --- a/arch/arm64/kernel/pi/Makefile
> > +++ b/arch/arm64/kernel/pi/Makefile
> > @@ -10,6 +10,7 @@ KBUILD_CFLAGS	:= $(subst $(CC_FLAGS_FTRACE),,$(KBUILD_CFLAGS)) -fpie \
> >  		   -D__DISABLE_EXPORTS -ffreestanding -D__NO_FORTIFY \
> >  		   -fno-asynchronous-unwind-tables -fno-unwind-tables \
> >  		   $(CONFIG_CC_OPT_NO_ADDRSIG)
> > +KBUILD_CFLAGS	:= $(filter-out $(LLVM_PLUGINS_CFLAGS),$(KBUILD_CFLAGS))
> 
> [Severity: Low]
> Should arch/riscv/kernel/pi/Makefile also filter out $(LLVM_PLUGINS_CFLAGS)
> from KBUILD_CFLAGS?
> 
> Like arch/arm64/kernel/pi/Makefile, it compiles pre-MMU position-independent
> early boot objects with -fpie and -ffreestanding, filters out
> CC_FLAGS_FTRACE and CC_FLAGS_LTO, and prefixes symbols with __pi_ via
> objcopy.  Leaving LLVM_PLUGINS_CFLAGS enabled there can break symbol
> confinement or introduce absolute addresses before the MMU and relocations
> are active.
> 
> [ ... ]
> 
> > diff --git a/lib/vdso/Makefile.include b/lib/vdso/Makefile.include
> > index cedbf15f80874..848d58296ba23 100644
> > --- a/lib/vdso/Makefile.include
> > +++ b/lib/vdso/Makefile.include
> > @@ -1,5 +1,8 @@
> >  # SPDX-License-Identifier: GPL-2.0
> >  
> > +# vDSO code executes outside the kernel.
> > +KBUILD_CFLAGS := $(filter-out $(LLVM_PLUGINS_CFLAGS),$(KBUILD_CFLAGS))
> > +
> >  GENERIC_VDSO_MK_PATH := $(abspath $(lastword $(MAKEFILE_LIST)))
> >  GENERIC_VDSO_DIR := $(dir $(GENERIC_VDSO_MK_PATH))
> 
> [Severity: Low]
> Does stripping $(LLVM_PLUGINS_CFLAGS) from the directory-wide KBUILD_CFLAGS
> here also drop LLVM plugins from standard in-kernel objects built in those
> directories?
> 
> Makefiles that include lib/vdso/Makefile.include also build obj-y kernel
> objects linked into vmlinux, such as arch/sparc/vdso/vma.o and the
> vdso*-image.o targets in arch/x86/entry/vdso/common/Makefile.include,
> arch/sparc/vdso/Makefile, and arch/mips/vdso/Makefile.  Those Makefiles
> scope $(GCC_PLUGINS_CFLAGS) removal to $(vobjs) (as this patch does for
> arch/x86/um/vdso/Makefile), whereas modifying KBUILD_CFLAGS unconditionally
> in lib/vdso/Makefile.include prevents enabled LLVM plugins from running on
> the in-kernel objects and drops their <generated/llvm-plugins.h> rebuild
> dependency.
> 
> -- 
> Sashiko AI review · https://sashiko.dev/#/patchset/20261109170550.141443-1-a.s.protopopov@gmail.com?part=7
