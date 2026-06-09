Received: from mail-pj1-f73.google.com (mail-pj1-f73.google.com [209.85.216.73])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A4D2A17745
	for <sashiko-reviews@lists.linux.dev>; Tue,  9 Jun 2026 00:31:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.216.73
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1780965089; cv=none; b=XOWb2j8ZzskBLlH08ZJ7qOQfZQu2MLgcqtpMYWDaHDrZ/34PK8r42+ZKzNq6EkPNPECtkQ0gjYYef/qqiBw8krPgUDNU5gd5CDLhYphnlUdWzTvcSzIy1Xgj+kNHAUdjW3zEoKkcMTwHQGrTmts8lw73iiKZ7URZ6PNCBTMwRb4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1780965089; c=relaxed/simple;
	bh=yIJ6TQJxT7dONmA/83aONXNhkBdZrn6zCKFw130M9Q4=;
	h=Date:In-Reply-To:Mime-Version:References:Message-ID:Subject:From:
	 To:Cc:Content-Type; b=U6sRn7B5EVMYIlZop/FJcB7mN338QvZ4PC4ujmuQNGkVNuh7PhApyTYyeZU+51UhnaGinDF9WnEKquWqRjVoeocYjT8z8kKB6rWdGuOFykFbwv4Tyd0YBjWz2pWTlZmHTKoCfwq6mm33PhitNKJFMU01/kG7683sI71QvBGnEHw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=flex--seanjc.bounces.google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=ZvXKv8Oj; arc=none smtp.client-ip=209.85.216.73
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flex--seanjc.bounces.google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="ZvXKv8Oj"
Received: by mail-pj1-f73.google.com with SMTP id 98e67ed59e1d1-36d982d932aso6210331a91.0
        for <sashiko-reviews@lists.linux.dev>; Mon, 08 Jun 2026 17:31:27 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20251104; t=1780965087; x=1781569887; darn=lists.linux.dev;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:from:to:cc:subject:date:message-id:reply-to;
        bh=p2pVFo4dJytLODVsSoHOHadkmK9decmDzlODrRei+YU=;
        b=ZvXKv8OjCsZ0YtVWcpO/YChV2u6pJZJwPFqJDvUuiO59McC/Sdxm1s3fjNzYUCPsPN
         tqb9fvOlE8iSWfMlO3TGG1ANzUDzAzd6n8d2TBrGcWR4KWSMhrw6WmaPaaNVp1fAQQVc
         x7nfAo2gXtMFD5wz7dEVEkXx9iVGkMHyiPrcdbMC9//XPYFqH6p5BNm0wznnDZPh/4Xm
         pTuFamVH4zungaokel0PqQo3DhGX7BKgSlMKgwPU8pP4QksZ2g0yF2fgCt85CDANA4gX
         4qrTPvs85Tninjk7kpzPWfcwLFeVMYglo67F/3MTKA7RPnoHEBvXjNibEkdjfROXHP6B
         atag==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1780965087; x=1781569887;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=p2pVFo4dJytLODVsSoHOHadkmK9decmDzlODrRei+YU=;
        b=lrMut5pn7ufWtJKLfdJKWJZof3ZfRAuaUlCM+A7U8GHvGCR7I3eWpVgOoJd2AtBqUN
         yj+YEhfBpn1IB6Pgpt+EOlS8ksb4fYj8HLyGdStzp8zTHyXMdDsb0HlKYn8w9usbkm+z
         jYs0YKAjRcIZCf9cuFsSBPiRpiIQnQxkSv2NscNbBynfNZywm1Q0bYBzrrZSCSWPSOZu
         vL4o2QQyFooNydk0+4qQHTZsvUv3BkqH9pBG4ES/ZdN+qyuqlu4PbwFotgiQiTF3ZUa4
         le5A0Sq9sPXW3FQy/LTr0jK3UnyuWu+X5owZQWEzg9WVh3XHaTjG6k5JAkH0fynzePKy
         57NQ==
X-Gm-Message-State: AOJu0Yz2CspcgLupGcAW8JKKlfJBGciVNjq5uBOHyv5uIsrwwiAlb8UB
	9dnmdXfBSGLbzzvqil5nob95wj3gtXOnYP7AWZT0xVTm5q3vWvoivAk17lysMIzVU6YH5BwTVQ2
	bIMmvlxqJAo108gOEWt15IbtldLkxy0jVtG6kx7dqt7DIXx6KmaIKF5mpn0mAbO7vL4CReDFnUQ
	VN+ITe/+pn56+/+dIqipHGvrPKU14NX1dG2IXFn9SV5AYFHpOH
X-Received: from pjbfh16.prod.google.com ([2002:a17:90b:350:b0:36b:c7cb:baf])
 (user=seanjc job=prod-delivery.src-stubby-dispatcher) by 2002:a17:90b:58e7:b0:36b:936e:73c8
 with SMTP id 98e67ed59e1d1-370f0e4ad33mr20840879a91.19.1780965086844; Mon, 08
 Jun 2026 17:31:26 -0700 (PDT)
Date: Mon, 8 Jun 2026 17:31:26 -0700
In-Reply-To: <20260530070848.158521F00893@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: sashiko-reviews@lists.linux.dev
List-Id: <sashiko-reviews.lists.linux.dev>
List-Subscribe: <mailto:sashiko-reviews+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:sashiko-reviews+unsubscribe@lists.linux.dev>
Mime-Version: 1.0
References: <20260529144435.704127-27-seanjc@google.com> <20260530070848.158521F00893@smtp.kernel.org>
Message-ID: <aide3ppnmB_suEab@google.com>
Subject: Re: [PATCH v4 26/47] x86/kvm: Don't disable kvmclock on BSP in syscore_suspend()
From: Sean Christopherson <seanjc@google.com>
To: sashiko-reviews@lists.linux.dev
Cc: linux-hyperv@vger.kernel.org, kvm@vger.kernel.org
Content-Type: text/plain; charset="us-ascii"

On Sat, May 30, 2026, sashiko-bot@kernel.org wrote:
> > diff --git a/arch/x86/kernel/kvm.c b/arch/x86/kernel/kvm.c
> > index c81a24d0efdf6..fd1c417b4f9b9 100644
> > --- a/arch/x86/kernel/kvm.c
> > +++ b/arch/x86/kernel/kvm.c
> > @@ -460,7 +460,7 @@ static void __init sev_map_percpu_data(void)
> 
> [ ... ]
> 
> > -static void kvm_guest_cpu_offline(bool shutdown)
> > +static void kvm_guest_cpu_offline(enum kvm_guest_cpu_action action)
> >  {
> >  	kvm_disable_steal_time();
> >  	if (kvm_para_has_feature(KVM_FEATURE_PV_EOI))
> > @@ -468,9 +468,10 @@ static void kvm_guest_cpu_offline(bool shutdown)
> >  	if (kvm_para_has_feature(KVM_FEATURE_MIGRATION_CONTROL))
> >  		wrmsrq(MSR_KVM_MIGRATION_CONTROL, 0);
> 
> [Severity: High]
> This isn't a bug introduced by this patch, but I noticed that
> MSR_KVM_MIGRATION_CONTROL is cleared to 0 here during CPU offline and system
> suspend, but it does not appear to be re-enabled upon online/resume.
> 
> Since this patch introduces the kvm_guest_cpu_action enum to solve an
> identical state-machine issue for kvmclock, should we also use this action
> enum to ensure the migration control MSR isn't incorrectly cleared on
> suspend? Otherwise, wouldn't a single CPU hotplug event or a suspend/resume
> cycle permanently disable live migration for the entire VM?

Looks like.  That's someone else's future problem though.
