Received: from mail-pl1-f201.google.com (mail-pl1-f201.google.com [209.85.214.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C79242571C0
	for <sashiko-reviews@lists.linux.dev>; Wed,  8 Jul 2026 13:09:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783516175; cv=none; b=s3rAT5lNh0GsMz60OkhVk4fwFNajGMlh1Tqd/pZonvlzBR5hSF+Pr8GTC3IOE3TIrgsL4uJLsdfpS72qDyJi0WkVNchIAdpcBwAz8RPSARdneK503hexnRgQnMaf1ehTVuZbIEJFZMlgwsY2PLNwr1v1hoPWqWRkQscuzk1OfHc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783516175; c=relaxed/simple;
	bh=LRFd983JSWEXtCkfU4WpsiRZSq3G9KA4O/kVLqjiMCw=;
	h=Date:In-Reply-To:Mime-Version:References:Message-ID:Subject:From:
	 To:Cc:Content-Type; b=e8QLd/vQEI5fZyrX6xgg8AhbzG2KMgnztwj0tqdV+7ZFCjiy95hB0jzTVJKYWemJ0Vdd0Ch4GKyy2gqzEUlSY2PnkbG4SD/GYeqJNgBDxsQJXk0byHX3qXA+RlVKNDntDegAJIJvTe4XpEz5HW5hmo3o2DPK5MH0Yq44rC7nOQY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=flex--seanjc.bounces.google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=GWQl4S2c; arc=none smtp.client-ip=209.85.214.201
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flex--seanjc.bounces.google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="GWQl4S2c"
Received: by mail-pl1-f201.google.com with SMTP id d9443c01a7336-2cc8bde6318so14167445ad.3
        for <sashiko-reviews@lists.linux.dev>; Wed, 08 Jul 2026 06:09:33 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20251104; t=1783516173; x=1784120973; darn=lists.linux.dev;
        h=content-transfer-encoding:content-type:cc:to:from:subject
         :message-id:references:mime-version:in-reply-to:date:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=BMcW42PsHtPKTv9ereSadAffvq3qYaAQIfYGI6YZnqQ=;
        b=GWQl4S2ctAzei8pleECZYO5zeHKwcxVNPeEs6rMNljCOylCDLooEVaxMVtPnD/r+Qa
         /c8KgyrPO/T18lOy/H0GtUo+VhvUJ/d63aPXzj71/MgInrLTqEHu3OuJi6qiRRQhJi62
         QiO8RLkrIebnqJgHpZumjCib2tphejyBVP+PbkUoTcgBo89K5o8/iGsRtzTDo2GCi42J
         hjLtVPwPWLjcjQKSWIzLQdQ7j+v13L/sr2SChGtp1t03vQZdkMkEjaRSRHyKCto2XqUo
         8ClceLt9ihZCoMLPeX/egH7xPdNggby8j37GpCHF8H0v4sJ/nwtZX5IrtOgs30alsGi+
         2YFA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1783516173; x=1784120973;
        h=content-transfer-encoding:content-type:cc:to:from:subject
         :message-id:references:mime-version:in-reply-to:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=BMcW42PsHtPKTv9ereSadAffvq3qYaAQIfYGI6YZnqQ=;
        b=AXio/X9ortWRGRY19XOo9FZCZO1igqk8op+2xliI8N7q0M4WW+lDfodNs6n1WNol3n
         ebaKwtvtGkD+MYqu0NnhPWiTaas/kcLNnOpj2UNWfbrKtVnpC1ETzAzFD/JozJJianGD
         Nls5klWaZFgbXJP7CanMKAeWv/MvgaZk3qvA6ZaULWm4MMtsuQazhMT1YWy/610c0SJG
         Q7aLMn4R2faUv/rKuYGDvVUGCZL7mFzJoeHU0MnInz2/NyiqugBJNhbQz0AwqJhPtcW1
         io0S4VVedD5u6hSQE3Qa4rVsZTXE/0nWLqHLzG2V+J8mNt/ndnSLtVhCcYH83l1ghKm+
         A7VA==
X-Gm-Message-State: AOJu0Yys/2+UJPIv/+53ZTf5yw1XRi0vR7qvQGn8X+pCOnwswV7i9y96
	dYGxQ3QtZgCzQsT68KhAohnNVm6DhR0Q73zGuagt/1JQdTvef7TW8/hUumiJguD/jQ1cXV4YHew
	iD1ILug==
X-Received: from plme1.prod.google.com ([2002:a17:903:4901:b0:2ca:c3fb:c096])
 (user=seanjc job=prod-delivery.src-stubby-dispatcher) by 2002:a17:903:b83:b0:2c6:9f66:d573
 with SMTP id d9443c01a7336-2ccea373102mr29869925ad.2.1783516173077; Wed, 08
 Jul 2026 06:09:33 -0700 (PDT)
Date: Wed, 8 Jul 2026 06:09:32 -0700
In-Reply-To: <a018bb95-cda5-4431-9bed-e60223087d97@linux.intel.com>
Precedence: bulk
X-Mailing-List: sashiko-reviews@lists.linux.dev
List-Id: <sashiko-reviews.lists.linux.dev>
List-Subscribe: <mailto:sashiko-reviews+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:sashiko-reviews+unsubscribe@lists.linux.dev>
Mime-Version: 1.0
References: <20260708022937.2465796-1-binbin.wu@linux.intel.com>
 <20260708023531.825361F000E9@smtp.kernel.org> <a018bb95-cda5-4431-9bed-e60223087d97@linux.intel.com>
Message-ID: <ak5L2csITyi1tGp0@google.com>
Subject: Re: [PATCH] KVM: x86: TDX: Use validated CPUID entry count for TD init
From: Sean Christopherson <seanjc@google.com>
To: Binbin Wu <binbin.wu@linux.intel.com>
Cc: sashiko-reviews@lists.linux.dev, Paolo Bonzini <pbonzini@redhat.com>, 
	kvm@vger.kernel.org
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: quoted-printable

On Wed, Jul 08, 2026, Binbin Wu wrote:
> On 7/8/2026 10:35 AM, sashiko-bot@kernel.org wrote:
> > This isn't a bug introduced by this patch, but does the KVM_TDX_INIT_VM
> > initialization path have a lock inversion?
> >=20
> > Looking at the call chain triggered by the KVM_TDX_INIT_VM ioctl,=20
> > tdx_vm_ioctl() first acquires the inner KVM locks via=20
> > tdx_acquire_vm_state_locks():
> >=20
> > arch/x86/kvm/vmx/tdx.c:tdx_vm_ioctl() {
> >     ...
> >     CLASS(tdx_vm_state_guard, guard)(kvm);
> >     ...
> >     r =3D tdx_td_init(kvm, &tdx_cmd);
> >     ...
> > }
> >=20
> > The tdx_vm_state_guard acquires kvm->lock, all vcpu->mutex locks, and=
=20
> > kvm->slots_lock.=20
> >=20
> > Then tdx_td_init() continues and calls __tdx_td_init(), where=20
> > cpus_read_lock() is acquired directly:
> >=20
> > arch/x86/kvm/vmx/tdx.c:__tdx_td_init() {
> >     ...
> >     cpus_read_lock();
> >     ...
> > }
> >=20
> > Since KVM locking rules require cpus_read_lock() to be the outermost lo=
ck,
> > does acquiring it while holding kvm->lock and the other inner locks cre=
ate
> > a deadlock risk against CPU hotplug or other paths that acquire these l=
ocks
> > in the correct order?
> >=20
>=20
> The virt/kvm/locking.rst doesn't explicitly say cpus_read_lock() needs to=
 be the
> outermost lock, but
> documentation:        cpus_read_lock() is taken outside kvm_lock
>                       kvm->lock is taken outside kvm->slots_lock
> =E2=80=8Bset_nx_huge_pages():  takes kvm_lock outside of kvm->slots_lock
>=20
> So it's transitive that cpus_read_lock() should be taken outside of
> kvm->slots_lock while KVM_TDX_INIT_VM takes cpus_read_lock() inside
> kvm->slots_lock.
>=20
> So there could be a deadlock case:
> tdx_td_init()               set_nx_huge_pages()        __kvmclock_cpufreq=
_notifier
>   lock(&kvm->slots_lock)                            =20
>                               lock(kvm_lock)
>                                                          lock(cpu_hotplug=
_lock)
>                               lock(&kvm->slots_lock)
>                                                          lock(kvm_lock)
>   lock(cpu_hotplug_lock)
>=20
> There was a discussion that is related to this issue:
> https://lore.kernel.org/kvm/20250124191109.205955-2-pbonzini@redhat.com/
> It seems the discussion is still open?

Yeah, mostly because the deadlock is so extremely unlikely.

> Back to this issue, does it make sense to take cpus_read_lock() before=20
> kvm->lock during KVM_TDX_INIT_VM as following:

I would say "not yet".  I consider this a set_nx_huge_pages() problem, not =
a TDX
problem.
