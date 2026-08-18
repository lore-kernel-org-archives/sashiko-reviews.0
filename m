Received: from mail-pl1-f198.google.com (mail-pl1-f198.google.com [209.85.214.198])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5B6B330D3ED
	for <sashiko-reviews@lists.linux.dev>; Tue, 18 Aug 2026 21:56:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.198
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787090180; cv=none; b=ufGse+4c9X618g2UHr6zqj/pFlHzKnM/VleL1f0pF/kI9AfpmYLY3/wxeqPeO6lobgetUA+0i+Vb86d4+0OfYzwlbOJLM0ZXt+ehowvOeae1GnNMKBlO49EzONHzXp+h98JhHayd92d0+G6MmD35BxHiaghr87gmIO2amzFHWUc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787090180; c=relaxed/simple;
	bh=JuQe4wvhoTYyUuwxNJ/Cz6UJ4qgLwxXvjqd0Wlznc8c=;
	h=Date:In-Reply-To:Mime-Version:References:Message-ID:Subject:From:
	 To:Cc:Content-Type; b=uKKu16Q1xich/FaP2ukIsAn8vuzG8M4AHnlDlKBUuhF7PiJf8k4MDW04liEzK8nvlp4PrnSBfNqIZp7DGoh2J3+EG+fxSZ9y3GkDjCNll2lLEw9qPFBiKK8A2YisiMpaNpFZw/O4ixCFNuhh3sQE7gvTWvWnZ5dWKhsJpGts2EA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=flex--seanjc.bounces.google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=cpRwSpV3; arc=none smtp.client-ip=209.85.214.198
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flex--seanjc.bounces.google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="cpRwSpV3"
Received: by mail-pl1-f198.google.com with SMTP id d9443c01a7336-2cceabd70f5so6415035ad.1
        for <sashiko-reviews@lists.linux.dev>; Tue, 18 Aug 2026 14:56:19 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20251104; t=1787090178; x=1787694978; darn=lists.linux.dev;
        h=content-type:cc:to:from:subject:message-id:references:mime-version
         :in-reply-to:date:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=9gNRvVZWlKLU6Jjew/a+f7LZJn1aPJd/qJ+Prwj4wzc=;
        b=cpRwSpV39DhqsuB802QxF1iCxxxgOcCWSft474/356QgL6WntpCFqgv7vpfRE/X1nx
         vbTWqH3YBZe2zet/z9TA1AhItjGLEARoWxpN2jUuUFVWjT9irTsJuxvYfcQGrN5mlh97
         jOBDZlk6LFWEEOAVEDkE3RXodikI7fwrXvUchZDgpWGckhyqPIR5DDtB+GtBvrXa1pzj
         m9Wt43lixrpTCjl4mA7Zq4KwKJAuUcqoyp1dI15URqcPZ/55d2nWDldDBOnRxbG5LmF5
         DJbh65BySS/P9zlsxAE2ag7GxQMVBxQGEIVUqPOxt+7GGS7PhYWOOgnjVhjDXEGx26PJ
         AVaQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1787090178; x=1787694978;
        h=content-type:cc:to:from:subject:message-id:references:mime-version
         :in-reply-to:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=9gNRvVZWlKLU6Jjew/a+f7LZJn1aPJd/qJ+Prwj4wzc=;
        b=IXFQTdol5eIsz9V79pIwO7ky4Dyg9HuoH/ndbUpwIF4vzl1EZ7e1Zm0Z/NaGnu17os
         a2ii8ibjQJNzsXgJQWxmg7bypeh9ZTOAA5/+yBDwWZBJv6ZP3mbASD12Kj24GqIHFtWB
         6G/x5we6vtQhqh2gDbZJ8BPPzOILmmSM4+wdQCwMczlyboS/sEwHu3NBgumERkPvQykM
         +Zq13AbzdaurJM8zJRt/kc3jOxf9QH5Vimjny8dNPdDbQjOLr49HC6VEwxmU4ODixO1L
         sjFOrnjOpE6HNtKQ/rgToL/40LqFuK/SEmGJZOnZTASO6vyR7wz5u/QHNcfXO+EMpH2P
         3gag==
X-Gm-Message-State: AOJu0Yzc8tAkzt0lrhdeK0HnJYkGnGqJF/s/pDz5NsbINW95XFHp9xUR
	iUW444lUNFGqpwLbcx4xcYjEaURvFwLh6hSXF7/l9GrgDADbok7vdhSPEnfky/KJN6kUpPTrw25
	XNKLm/U5rzJStMzMi8jV62idq3gp96QA/q3BkH+tnHLMb2gmSZ3g+/K+bvnSnk0SEtI+XnfGzog
	eM2cZ5jGM4jIlXtROWZ7kUn06cZkIPK//kwSpJAh+QR6bLAfZL
X-Received: from plkk3.prod.google.com ([2002:a17:902:c403:b0:2d3:2362:d799])
 (user=seanjc job=prod-delivery.src-stubby-dispatcher) by 2002:a17:903:944:b0:2ca:d91d:d3a7
 with SMTP id d9443c01a7336-2d5f6b21181mr14818565ad.10.1787090178421; Tue, 18
 Aug 2026 14:56:18 -0700 (PDT)
Date: Tue, 18 Aug 2026 14:56:17 -0700
In-Reply-To: <aoSTeLzhaWohymLf@google.com>
Precedence: bulk
X-Mailing-List: sashiko-reviews@lists.linux.dev
List-Id: <sashiko-reviews.lists.linux.dev>
List-Subscribe: <mailto:sashiko-reviews+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:sashiko-reviews+unsubscribe@lists.linux.dev>
Mime-Version: 1.0
References: <20260818165258.2613603-1-vkuznets@redhat.com> <20260818165258.2613603-5-vkuznets@redhat.com>
 <20260818170534.07B561F000E9@smtp.kernel.org> <aoSTeLzhaWohymLf@google.com>
Message-ID: <aoTVAdqoAAuVKi8L@google.com>
Subject: Re: [PATCH v2 4/4] KVM: selftests: Check VMPTRLD with active eVMCS
From: Sean Christopherson <seanjc@google.com>
To: sashiko-reviews@lists.linux.dev
Cc: Vitaly Kuznetsov <vkuznets@redhat.com>, kvm@vger.kernel.org
Content-Type: text/plain; charset="us-ascii"

On Tue, Aug 18, 2026, Sean Christopherson wrote:
> On Tue, Aug 18, 2026, sashiko-bot@kernel.org wrote:
> > > +	asm volatile(KVM_ASM_SAFE("vmptrld %[pa]")
> > > +		     "\n\tsetna %[failed]"
> > 
> > [Severity: Medium]
> > Will this setna instruction incorrectly evaluate CPU flags?
> > 
> > The KVM_ASM_SAFE macro executes xor %%r9, %%r9 on its success path, which
> > unconditionally clears the Carry Flag (CF=0) and sets the Zero Flag (ZF=1).
> 
> Shame on me, I should know better after dealing with ba5ca5e5e6a1 ("x86/retpoline:
> Don't clobber RFLAGS during srso_safe_ret()").
> 
> Untested, but I think the fix is simply:
> 
> diff --git tools/testing/selftests/kvm/include/x86/processor.h tools/testing/selftests/kvm/include/x86/processor.h
> index 6e6f70035508..119715ffe93f 100644
> --- tools/testing/selftests/kvm/include/x86/processor.h
> +++ tools/testing/selftests/kvm/include/x86/processor.h
> @@ -1318,7 +1318,7 @@ gva_t vm_alloc_stack(struct kvm_vm *vm, int nr_pages);
>         "lea 1f(%%rip), %%r10\n\t"                              \
>         "lea 2f(%%rip), %%r11\n\t"                              \
>         fep "1: " insn "\n\t"                                   \
> -       "xor %%r9, %%r9\n\t"                                    \
> +       "mov $0, %%r9\n\t"                                      \
>         "2:\n\t"                                                \
>         "mov  %%r9b, %[vector]\n\t"                             \
>         "mov  %%r10, %[error_code]\n\t"

Vitaly, I'll send a v3 of this series with a rather large pile of additional
selftests changes.  As often seems to be the case, my desire validate a simple
fix has snowballed...
