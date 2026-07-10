Received: from mail-pl1-f201.google.com (mail-pl1-f201.google.com [209.85.214.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B4E0D18871F
	for <sashiko-reviews@lists.linux.dev>; Fri, 10 Jul 2026 00:30:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783643414; cv=none; b=YT10dOwlofvhPWcsWkfPNaJ5ZqXIyQXvmw5DCG+eeG9FlxCihxhe+T9OWtVcHuagxJT1gcY2uL7gEP9hXMD5qWTfnwILc/BYs6578pl1KYamv9BCS4uSQYtfrUzcTZ8OxQ7SCQprNuXEtfLZdf0yLWltmLaHSOzAhiuOdIv0LV8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783643414; c=relaxed/simple;
	bh=GB4xCP0jtX0S7pBhKQHmaRJbmrIJrMCUGDK/2C/wZKU=;
	h=Date:In-Reply-To:Mime-Version:References:Message-ID:Subject:From:
	 To:Cc:Content-Type; b=diLrrZyJ+Nx/mXUNCJF00jx7O4bFFGxMODSnfH9PCADqqnbEKJvznssp2faxKTBaE5NYS6IviNK0ssSC0BEOChn+wybbv2hSRMhl+SQtkYj+wt2/I9QO3VpJ10owsG8+YbBnBnuuAhXmhPh72NZz/2Uhyboa6mU3G6xRSo27Ay8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=flex--seanjc.bounces.google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=H3lq603t; arc=none smtp.client-ip=209.85.214.201
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flex--seanjc.bounces.google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="H3lq603t"
Received: by mail-pl1-f201.google.com with SMTP id d9443c01a7336-2ccbb61893fso8405275ad.0
        for <sashiko-reviews@lists.linux.dev>; Thu, 09 Jul 2026 17:30:12 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20251104; t=1783643412; x=1784248212; darn=lists.linux.dev;
        h=content-type:cc:to:from:subject:message-id:references:mime-version
         :in-reply-to:date:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=bo34D4yllTctFsYLgx2ysys5c0zKcYVwf90OudJRWeA=;
        b=H3lq603tat+IehyPVBoTD5VdReZB7j9UFZkLRKeQQMS+j4xKPYbk2YLgy2x+HRdX7Y
         bfpjBKySkKIM636MSgCsavuCWls4vQr5LSdUrQTCWxTS8vH0dQi4IYIzaK20TGHDPEAK
         woziKv1x+JmvXZiuTkS1RYrok9K2Om1AziXJ8hONjFh5FNu3ff8etWALkJf1nlKvAi+l
         mmgCFEtA8DAHQkmeNWkO7aA22OrEX/Dgkq5Zi0qxHtJb8WKt+/CEEURCc8c6a9V/qeH3
         rVuvMxiQIhUhusLi1I3GEqeCRUBZfD+5U9w07HesxyYRbQ89Wvw4vIICYmtS7WruMF7T
         IZwQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1783643412; x=1784248212;
        h=content-type:cc:to:from:subject:message-id:references:mime-version
         :in-reply-to:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=bo34D4yllTctFsYLgx2ysys5c0zKcYVwf90OudJRWeA=;
        b=XIl3Ae7BGJ2PUDYVW5KZlnty3v7f8f9ZRqPWgsn5g3y2D9OaGu7X/v29xfqPXIAkka
         Y6eeXusu6OhpeKPkNWUvGpyIG/Amu+JxYPVqNeifF0hmQOtfAFUssZuMflaobWPxciRz
         NP9IRyectiQ7+twqQUyyGXYomjSl51FXe/qZXPnUgk4xWy/SnZplKusf+0l9XoWG06au
         df61HXfDGzUHMHtY9BfWYqFk2ywmBPoevJI6GNZLEKjFol6Qsj8/ldfKd2ELDpKr5+hD
         YFJMP9zXUtIO/sOwbwHG+KESmqLGIwduELFkA+o0mGy/d7mZuYdyeJDj84lNqZldZH0m
         fntQ==
X-Gm-Message-State: AOJu0Yz8By/It948etDqPqQVHcD2sYOuvRsJsTP0k5NFYSX1KLyuufuj
	kyXp+rmdUkMBqcFeANMuNqpJUFDUQIHTowY4U4Z6XTCDr9RZSDQ/Evl2tv+ebl+EqleoUzdXuhs
	gNzxamTFdH92yh75VyivSIQTKwqROv3XeM1Bxq5VN8Qp/CulLHENV3dmWi2MNRJrbyJPKVwKdpf
	3trAUE5c7UgrSauj+8a4apaNWCwVdSoE+zN0SRfrX6izxtaI7/
X-Received: from plbbh2.prod.google.com ([2002:a17:902:a982:b0:2c7:ec09:a994])
 (user=seanjc job=prod-delivery.src-stubby-dispatcher) by 2002:a17:903:37c6:b0:2c9:e86e:a9f5
 with SMTP id d9443c01a7336-2ccea3c1330mr97089325ad.18.1783643411713; Thu, 09
 Jul 2026 17:30:11 -0700 (PDT)
Date: Thu, 9 Jul 2026 17:30:11 -0700
In-Reply-To: <20260709210648.B98481F000E9@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: sashiko-reviews@lists.linux.dev
List-Id: <sashiko-reviews.lists.linux.dev>
List-Subscribe: <mailto:sashiko-reviews+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:sashiko-reviews+unsubscribe@lists.linux.dev>
Mime-Version: 1.0
References: <20260709204948.1988414-1-seanjc@google.com> <20260709204948.1988414-11-seanjc@google.com>
 <20260709210648.B98481F000E9@smtp.kernel.org>
Message-ID: <alA9E9MIHYe-OpF3@google.com>
Subject: Re: [PATCH v4 10/18] KVM: SEV: Forcefully invalidate SNP VMSA if its
 backing gmem page is zapped
From: Sean Christopherson <seanjc@google.com>
To: sashiko-reviews@lists.linux.dev
Cc: kvm@vger.kernel.org
Content-Type: text/plain; charset="us-ascii"

On Thu, Jul 09, 2026, sashiko-bot@kernel.org wrote:
> > diff --git a/virt/kvm/guest_memfd.c b/virt/kvm/guest_memfd.c
> > --- a/virt/kvm/guest_memfd.c
> > +++ b/virt/kvm/guest_memfd.c
> [ ... ]
> > @@ -185,6 +185,10 @@ static void __kvm_gmem_invalidate_start(struct gmem_file *f, pgoff_t start,
> >  		}
> >  
> >  		flush |= kvm_mmu_unmap_gfn_range(kvm, &gfn_range);
> > +
> > +#ifdef CONFIG_HAVE_KVM_ARCH_GMEM_INVALIDATE
> > +		kvm_arch_gmem_invalidate_range(kvm, &gfn_range);
> > +#endif
> >  	}
> >  
> >  	if (flush)
> 
> [Severity: Critical]
> Does this invalidation path need a way to guarantee a synchronous wait before
> returning?
> 
> Since VMSA pages typically do not have TDP MMU SPTEs,
> kvm_mmu_unmap_gfn_range() will return false, leaving flush as false.
> 
> Because flush remains false, the subsequent kvm_flush_remote_tlbs(kvm) call
> is skipped.
> 
> Meanwhile, sev_gmem_invalidate_range() relies on KVM_REQ_VMSA_PAGE_RELOAD
> and kvm_make_request_and_kick() to send an asynchronous IPI to the vCPU:
> 
> arch/x86/kvm/svm/sev.c:sev_gmem_invalidate_range() {
>     ...
>     kvm_make_request_and_kick(KVM_REQ_VMSA_PAGE_RELOAD, vcpu);
>     ...
> }
> 
> Because the IPI is asynchronous and the TLB flush (which would otherwise
> provide a synchronous wait) is skipped, the host could proceed to free the
> VMSA page before the vCPU actually drops it and exits guest mode.

No, KVM_REQ_VMSA_PAGE_RELOAD is declared with KVM_REQUEST_WAIT, i.e. KVM will
ensure the target CPUs have received the IPI before continuing on.  And the
presence of the request will prevent them from re-entering the guest with the
now-defunct VMSA.
