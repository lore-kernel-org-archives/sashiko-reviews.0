Received: from mail-pg1-f200.google.com (mail-pg1-f200.google.com [209.85.215.200])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 01D733C7E1D
	for <sashiko-reviews@lists.linux.dev>; Wed, 26 Aug 2026 22:23:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.215.200
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787783031; cv=none; b=NM/yL0yLlV4MfqxK5utf2Ym12Oa8ZJmiC4AlbIg/ztgPG7oW5gMLoTBVbgC9WzKUdyHAJO9RqGmwhtjmV25bKPpNCseHE15GAT2E8vHXOCCbog2Y2X2llru2qGk0xE+lim97/Ljs3NV3ZmvszPkQisDiETsRLV1v+e7dH+ojJ6U=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787783031; c=relaxed/simple;
	bh=FNbZa11Tn/XmyFxsn4nSgRnSbN5p13oyRJf9hlGoS8c=;
	h=Date:In-Reply-To:Mime-Version:References:Message-ID:Subject:From:
	 To:Cc:Content-Type; b=CWQUsOaIW1TfUCciuvXtogVF3zfTwKNIDoFdk26X50Y2yxynbuz7cIA2YnG9babfEw1uqRWGBhY7a8Mpq9wxnYzeeQuAaJTtoaB4nmKiXciBQkHHm/bwkFSvvD/OVSBRCAO4HG4Pf0AlouZcy1HlPcK4X/i/zGe0poWpBF8wniw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=flex--seanjc.bounces.google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=sVmoMWBG; arc=none smtp.client-ip=209.85.215.200
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flex--seanjc.bounces.google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="sVmoMWBG"
Received: by mail-pg1-f200.google.com with SMTP id 41be03b00d2f7-c856470fe9fso1262186a12.2
        for <sashiko-reviews@lists.linux.dev>; Wed, 26 Aug 2026 15:23:48 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20251104; t=1787783027; x=1788387827; darn=lists.linux.dev;
        h=content-transfer-encoding:content-type:cc:to:from:subject
         :message-id:references:mime-version:in-reply-to:date:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=FChS4K6ZaQ9Y8N6eygfYDmDMcAmBzknXSGNnUNtg19w=;
        b=sVmoMWBGYpH6i46wH9YmOQOanudk9Jroh2tRSYZlx+CskxD+mNFAg+G84WPHjGwm04
         1yqmSjKkf48IWKqGCOOwPz1ZYR2KufJ1r5NijizyIxtd7KDM8f9iPMDzpmflWU+QQ/P9
         LCk7HNn7B4QF27CBabjWsHWdwxsCRPh8iFq4hghcwOzZ5KksXlshRqBMVi/d0Cf6f8Ra
         udAcyEgYhyAJQhp0ndKfK42+Ylg2lqLWQ2enHhQiyc3fwx/X1uB8kOlAFm9wiZDBkAAY
         8EAzAcSqRetlQseBC7EHJ0v1wj7rmb/ZQrwsVa0SO+EgXpnlfj+B6maSDg0kkR6gYSw7
         6pqA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1787783027; x=1788387827;
        h=content-transfer-encoding:content-type:cc:to:from:subject
         :message-id:references:mime-version:in-reply-to:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=FChS4K6ZaQ9Y8N6eygfYDmDMcAmBzknXSGNnUNtg19w=;
        b=hrQ2IahylH3mkpefpIvPfdnMnURv3ibTqQZ6U4BTs/Jr/6F32KyM4XVUuJwI0jw5eh
         75MZlYYjcm/L/JZ5VwIxn0Q6419Hu55QMWDm1APYa5vB0R61f1klbQSqFQIHZronqLNH
         jmRPcY9y4vBWwIPqyAbRlaJRCEjTmRZXqVivJ2fCP+68uCbFmMwbefjJ8+UYZOufKTtd
         aoBGpJpkRS6Djg5yMej9DDuuT0q46lFaY/8seDP+NNTXisuQVHgRuSFCTeKX3FlaCgwy
         veCSMmqz6S5sN6Cgwmxwen5TKT7sv+RHrpyigj/iF2tOeIy7BmDzBBwgs/Upky7DxpfA
         QLMg==
X-Gm-Message-State: AFuF++kVHr/SzxcavUDF5E6aERcry4VK1phYc/qydEbJ4a+iDSJXl5wk
	q1YtdIo5lLdRMhFavLloQAXbHgNNyZgE3iR6P9fnvbig8wbUPZtw14bBg2FcoYxKYK7UqWLxOLS
	4DduoWzlLeMBttIBIlhmhihqIgEVgslLMLaC2VKAAdBnuKxvlVyj/nwcYpLHa1qKSBpRp5A2nVT
	1f2N6h6+Yqz7JOsF6UvwOndGN6L2CdLT2cDHvDLiGrHlJbD4Og
X-Received: from pga28.prod.google.com ([2002:a05:6a02:4f9c:b0:c99:3b68:c9e4])
 (user=seanjc job=prod-delivery.src-stubby-dispatcher) by 2002:a05:6a21:910c:b0:3bf:7e2a:e874
 with SMTP id adf61e73a8af0-3cf7576da0cmr21501307637.1.1787783027000; Wed, 26
 Aug 2026 15:23:47 -0700 (PDT)
Date: Wed, 26 Aug 2026 15:23:46 -0700
In-Reply-To: <20260826220842.685D41F000E9@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: sashiko-reviews@lists.linux.dev
List-Id: <sashiko-reviews.lists.linux.dev>
List-Subscribe: <mailto:sashiko-reviews+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:sashiko-reviews+unsubscribe@lists.linux.dev>
Mime-Version: 1.0
References: <20260826215258.937210-1-seanjc@google.com> <20260826215258.937210-2-seanjc@google.com>
 <20260826220842.685D41F000E9@smtp.kernel.org>
Message-ID: <ao9ncoej7LdQwsbb@google.com>
Subject: Re: [PATCH v2 1/2] KVM: VMX: Explicitly track TDX VMs' root level
 instead of guessing it from CPUID
From: Sean Christopherson <seanjc@google.com>
To: sashiko-reviews@lists.linux.dev
Cc: kvm@vger.kernel.org
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: quoted-printable

On Wed, Aug 26, 2026, sashiko-bot@kernel.org wrote:
> > diff --git a/arch/x86/kvm/mmu/mmu.c b/arch/x86/kvm/mmu/mmu.c
> > index 064ecc33b9267..611c78be8b411 100644
> > --- a/arch/x86/kvm/mmu/mmu.c
> > +++ b/arch/x86/kvm/mmu/mmu.c
> [ ... ]
> > @@ -5953,19 +5953,22 @@ void __kvm_mmu_refresh_passthrough_bits(struct =
kvm_vcpu *vcpu,
> > =20
> >  static inline int kvm_mmu_get_tdp_level(struct kvm_vcpu *vcpu)
> >  {
> [ ... ]
> >  	/* tdp_root_level is architecture forced level, use it if nonzero */
> >  	if (tdp_root_level)
> >  		return tdp_root_level;
> > =20
> > +	/*
> > +	 * If the VM has mirror roots, then the root level is predefined as t=
he
> > +	 * mirror root (and by extension the normal root) needs to match the
> > +	 * root level that was configured for the external page tables that a=
re
> > +	 * being mirrored by KVM.
> > +	 */
> > +	if (kvm_has_mirrored_tdp(vcpu->kvm) &&
> > +	    !WARN_ON_ONCE(!vcpu->kvm->arch.mirror_root_level))
> > +		return vcpu->kvm->arch.mirror_root_level;
>=20
> [Severity: High]
> Does this regression allow a malicious or buggy userspace to trigger this
> WARN_ON_ONCE and cause a host denial of service (especially with
> panic_on_warn=3D1)?

No, because panic_on_warn=3D1 isn't a DoS.  But yeah, the WARN is reachable=
, because
as Sashiko points out, the check on TD_STATE_INITIALIZED happens too late. =
 Given
that CPUID _can't_ be set yet, consuming per-vCPU information in __kvm_mmu_=
create()
is bizarre (it's a leftover from what APIs were available at the time).

I'm pretty sure we can sqaush the WARN and make the code more reasonable at=
 the
same time by doing:

diff --git a/arch/x86/kvm/mmu/mmu.c b/arch/x86/kvm/mmu/mmu.c
index 611c78be8b41..d43b8b6c3b17 100644
--- a/arch/x86/kvm/mmu/mmu.c
+++ b/arch/x86/kvm/mmu/mmu.c
@@ -6837,7 +6837,7 @@ static int __kvm_mmu_create(struct kvm_vcpu *vcpu, st=
ruct kvm_mmu *mmu, struct k
 	 * other exception is for shadowing L1's 32-bit or PAE NPT on 64-bit
 	 * KVM; that horror is handled on-demand by mmu_alloc_special_roots().
 	 */
-	if (tdp_enabled && kvm_mmu_get_tdp_level(vcpu) > PT32E_ROOT_LEVEL)
+	if (tdp_enabled && kvm_mmu_get_max_tdp_level() > PT32E_ROOT_LEVEL)
 		return 0;
=20
 	page =3D alloc_page(GFP_KERNEL_ACCOUNT | __GFP_DMA32);

> If userspace creates a TDX VM via KVM_CREATE_VM (setting the VM type to
> KVM_X86_TDX_VM) and then directly calls KVM_CREATE_VCPU without executing
> KVM_TDX_INIT_VM first, it appears this warning will be reached.
>=20
> During vCPU creation, the MMU context is initialized unconditionally befo=
re
> the architecture-specific vCPU creation callback:
>=20
> kvm_arch_vcpu_create()->kvm_mmu_create()->kvm_mmu_get_tdp_level()
>=20
> Because KVM_TDX_INIT_VM was skipped, mirror_root_level remains 0, satisfy=
ing
> the condition and triggering the kernel warning.
>=20
> The architecture-specific callback that enforces the TD_STATE_INITIALIZED
> requirement is invoked too late in the process to prevent this:
>=20
> kvm_arch_vcpu_create()->kvm_x86_call(vcpu_create)()
>=20
> Would it be safer to return an error or handle the uninitialized state ra=
ther
> than triggering a host-side warning on user-controllable input?
>=20
> --=20
> Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260826215258.93=
7210-1-seanjc@google.com?part=3D1
