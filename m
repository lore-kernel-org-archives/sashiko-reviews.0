Received: from mail-pl1-f202.google.com (mail-pl1-f202.google.com [209.85.214.202])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2624C175A77
	for <sashiko-reviews@lists.linux.dev>; Thu, 25 Jun 2026 23:31:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.202
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1782430294; cv=none; b=MbJr4waUD6bZPBM54LahWShaLq+Ey6XW+OvO6TArivmYB3L7iWjutKfwd+VNomI+/zzBRmI377Ccsr1zIu7/lYejmIALQ5oJdcRT5CsPyQ1zdopNnpFJWpsJNsUn3mkHIE5FNGqgdeZLq5CZEJvp2xbWyFP9LX7Vqob8ZbGeiEM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1782430294; c=relaxed/simple;
	bh=iDj3peP1xyM5+cXPeaLlyU4dBm3+6xBn7CrvHRWwU08=;
	h=Date:In-Reply-To:Mime-Version:References:Message-ID:Subject:From:
	 To:Cc:Content-Type; b=ZW5T/B7ToyZaovw3ytJqME39M6DR6kAHHBOfspnnCPfzyziT7dwUGwoEvoo4tVprSkkmjlPdajxDq7paPbVMspiKqaYiAnp8fDlnSLI/Kf7x1mV5CmBpeX+md7dRC06AbRJl0/7QYB7jAUWDQ54mkpV7no/ooAbLmzzi2J3Y9iU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=flex--seanjc.bounces.google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=llqDK7mw; arc=none smtp.client-ip=209.85.214.202
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flex--seanjc.bounces.google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="llqDK7mw"
Received: by mail-pl1-f202.google.com with SMTP id d9443c01a7336-2bd04e4fe3dso5358925ad.3
        for <sashiko-reviews@lists.linux.dev>; Thu, 25 Jun 2026 16:31:32 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20251104; t=1782430292; x=1783035092; darn=lists.linux.dev;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:from:to:cc:subject:date:message-id:reply-to;
        bh=6UO4O1YNoI8Tg0yuseab1pxGK1UBWC9yNVHQIRrwqok=;
        b=llqDK7mwz0sNP98a/afVq1mPjJKk5hXV8hbxoZXB1WAxbNhzG59oT1J8oidw5wiw1S
         SLSaUPIL/9heLewcCisUA0WLetneV8PC0J5gPZk6B721z3c/G2NeUt+H0oYohzEnlhrI
         D7gZ3aclgDWdbblZzZlq18RMKK02Hkc5vXiLgcmtmNrPPzfmVBvmpNsagiLvBopoIJgD
         XgElr0NGZB/K9R9nsF/gMSGgDIwbW1oEGyxNHoqZ6xUT4cKwQZgh4OVQJxfO3VJDuHAi
         S3FKHmFMOF1QiP4hU4+Yj7qyWb6JPAXFqwcb3oK7eX7Au+p10FOJgdQlINOzg78YApF2
         mz3A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1782430292; x=1783035092;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=6UO4O1YNoI8Tg0yuseab1pxGK1UBWC9yNVHQIRrwqok=;
        b=OWxBFJMwfNgbrZPFfLZDKZf9NW6TdilZV/0qWAFn/R3pX3yHMyl8SV9qKk1dzGs9wf
         NpsUlDKP35bVIbzNOVBnDYlZmIKG9lv1eX/yRc9W8lJv4yBHpIWUx7yYmclGg7g04VHg
         Hc2N8wcjrM72d7H9wsKzpsTGRnIucqpchHm7a8DyLj8m6ZXirPlnC32GT55dQQMIkKaU
         edi1f1RlA8BhAZ3bd5TgI8NXOeC67LpNXXHbL38P3dax0Gpbpur1cKpPQfepkTu5yU1a
         tfrQRiQWd26+V3y9H17AlLnxLIlsXzNVTJvEYVfrtX+N2vq27VQ7YEsnhoUFLKU/+ArI
         Jzqw==
X-Gm-Message-State: AOJu0YzfdoUX/MDeKMcuBG1scgiQjRuiqjGAwPp0ZABF1z/XJU992uM5
	gfaEYPivEUDJd7Vp012Ve/BTg6OPmsxus9wIGHV/y1ZRAjg+rdmcb7QegwRPhWPfGAL33Y4jnep
	5ErwcWyf62ciAisk5hdVjZ8bfwNeFsW+1tQbsHNhvJAvjbtRO4uh+0y8QMl6emuhAgzmfaunsbE
	ygMLo/l+5zl60rZS0JCgmOiznYblprSM1fI0/361ZhtPUs+AL7
X-Received: from plmx3.prod.google.com ([2002:a17:902:fe83:b0:2c7:f3da:de3d])
 (user=seanjc job=prod-delivery.src-stubby-dispatcher) by 2002:a17:903:1a24:b0:2c6:b3dc:b831
 with SMTP id d9443c01a7336-2c7fcb7fc5cmr50400365ad.27.1782430292000; Thu, 25
 Jun 2026 16:31:32 -0700 (PDT)
Date: Thu, 25 Jun 2026 16:31:31 -0700
In-Reply-To: <20260625225715.5102D1F000E9@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: sashiko-reviews@lists.linux.dev
List-Id: <sashiko-reviews.lists.linux.dev>
List-Subscribe: <mailto:sashiko-reviews+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:sashiko-reviews+unsubscribe@lists.linux.dev>
Mime-Version: 1.0
References: <20260625223623.3376478-1-seanjc@google.com> <20260625223623.3376478-7-seanjc@google.com>
 <20260625225715.5102D1F000E9@smtp.kernel.org>
Message-ID: <aj26U17iLJbEuFkW@google.com>
Subject: Re: [PATCH v3 06/10] KVM: Initialize a vCPU's index to '-1' while
 it's being created
From: Sean Christopherson <seanjc@google.com>
To: sashiko-reviews@lists.linux.dev
Cc: kvm@vger.kernel.org
Content-Type: text/plain; charset="us-ascii"

On Thu, Jun 25, 2026, sashiko-bot@kernel.org wrote:
> > diff --git a/virt/kvm/kvm_main.c b/virt/kvm/kvm_main.c
> > index e44c20c049610..98da4c889ffc6 100644
> > --- a/virt/kvm/kvm_main.c
> > +++ b/virt/kvm/kvm_main.c
> [ ... ]
> > @@ -4216,11 +4218,18 @@ static int kvm_vm_ioctl_create_vcpu(struct kvm *kvm, unsigned long id)
> >  		goto unlock_vcpu_destroy;
> >  	}
> >  
> > +	/*
> > +	 * Set the vCPU's index *before* the vCPU is reachable by other tasks.
> > +	 * Unwind the index back to -1 on failure so that KVM can use the index
> > +	 * to detect that the vCPU is unreachable, e.g. for lockdep asserts.
> > +	 */
> >  	vcpu->vcpu_idx = atomic_read(&kvm->online_vcpus);
> >  	r = xa_insert(&kvm->vcpu_array, vcpu->vcpu_idx, vcpu, GFP_KERNEL_ACCOUNT);
> >  	WARN_ON_ONCE(r == -EBUSY);
> > -	if (r)
> > +	if (r) {
> > +		vcpu->vcpu_idx = -1;
> >  		goto unlock_vcpu_destroy;
> > +	}
> >  
> >  	/*
> >  	 * Now it's all set up, let userspace reach it.  Grab the vCPU's mutex
> 
> [Severity: Medium]
> Should the vCPU index also be unwound back to -1 on the create_vcpu_fd()
> error path?

What the?  Oh, ugh.  I thought we had eliminated erasing a vCPU from the xarray,
but what we eliminated was unwinding online_vcpus.  
