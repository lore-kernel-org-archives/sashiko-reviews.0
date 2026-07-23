Received: from mail-pl1-f200.google.com (mail-pl1-f200.google.com [209.85.214.200])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0228C2737F8
	for <sashiko-reviews@lists.linux.dev>; Thu, 23 Jul 2026 00:37:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.200
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784767051; cv=none; b=hrIf8i/qkeTgVaHmqWcJoTQZy/tE6pes1fhhj3X3Fda+rYRSgrqvSg2UhPZ8Cd7KMM7mOZAOek1GtUaL4vIvZYJvOXgTZAR3I6jWqD9sMw+Zcl/IY/YH5+hIxrdBrk1I2TcWtd3gYxmYQLqWjOmGDOs0kWY56P83ztl5g3838rM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784767051; c=relaxed/simple;
	bh=Yt5hbkRC9PjOkXytqszGtz6pUpPWAwfKd2toK8ODUDE=;
	h=Date:In-Reply-To:Mime-Version:References:Message-ID:Subject:From:
	 To:Cc:Content-Type; b=X+fyIbFT/AX8lWZz2lmK8XcUDfNDb9aa3laXyhUpeDBQIDGBFti50W6yoN/vKNujJcyThCqzk9I3lOdZsXA4f4wzfaNT4/wWIjXR9+BfFx/sWw1PLmd82FcdfpSlz2pfTKq7umbx/YOZ41htpGojKaoebGJwoECiw71ew+JY8xU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=flex--seanjc.bounces.google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=mQ5aiqWL; arc=none smtp.client-ip=209.85.214.200
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flex--seanjc.bounces.google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="mQ5aiqWL"
Received: by mail-pl1-f200.google.com with SMTP id d9443c01a7336-2cd01a14e81so1468325ad.1
        for <sashiko-reviews@lists.linux.dev>; Wed, 22 Jul 2026 17:37:29 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20251104; t=1784767049; x=1785371849; darn=lists.linux.dev;
        h=content-transfer-encoding:content-type:cc:to:from:subject
         :message-id:references:mime-version:in-reply-to:date:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=BHbGiVuZLUHACML0nqP9iDubHlU79isIZOnCNGhwIGA=;
        b=mQ5aiqWL8v+Kr6Ckv27IxuO6KmZf1g/8kKprfN1O8bpbsOxm3dHC+LKnix7SgXo59N
         iRg3v1sQpVaf2GLcYAN5JpfPygzV2RTIrW1PnHzwaoL00EzezIk50oJazzlai7JJRGoD
         f0kuq5XGwkiEc6wYj0Al7zqPUBIunRlMn9IJEMQGtqEgbe/o22gSgJDPEn4KRHMfBA/q
         3TVzVKQ/HjX3x7sj1DT5r3R6VdQAii9iZjfxoBt/WRPDoNBBZpzKDSgHnAFBgTnryjsd
         hBQ9Tt3L1VBD34W34SSEP4hU3zcPN4s3bls73zGP2Vfv7eXxY2ASO5HqITbvE+LzfgFP
         EfZA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1784767049; x=1785371849;
        h=content-transfer-encoding:content-type:cc:to:from:subject
         :message-id:references:mime-version:in-reply-to:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=BHbGiVuZLUHACML0nqP9iDubHlU79isIZOnCNGhwIGA=;
        b=NNxMijUyEJycgbLF2gI8B3WL3YdkbxmDXzTq40HH6tHOdo+JbaVGs3VeK+K7+A5WLg
         VOzF57HmJpd+B/6lid4tCkh8/gpqBbeKUTbUeGdSpafOt7v0xkrF8P5viWLaEYUaE+XE
         arojzFbYpr/IIGa2arabc4lwp4ncaDeuMJ+soEZ6S5K8Kwls8ELJsoJcnsY2LCk8WCXh
         7r2tQS8XaWEh/SvQOQOx9HYBRR5pDBs+oE+mUQr3dMlzwcMLAJmY3MtRrnzcdfdOg/e+
         CTVCRzg9gQ/9sB9bPtgBQeJjDENGJHcFq8AHzs3GriQz/V394H0/8jJO25Z+9vwt3m7A
         I+jA==
X-Gm-Message-State: AOJu0YyFFJMf7fgVKBs4dgQ0WtnyYL4Q0uqdjwGWWn4cp/YH7yHBC0mi
	BwQqDgx2o1zTC3gf62+wJyp2d0SwhArxrv9ycXyWMUuG0bpiRzoyRXQ6R8Z85NVUVDQQ0ZkCiBM
	JK8a//g==
X-Received: from plhi3.prod.google.com ([2002:a17:903:2ec3:b0:2cf:3e66:d26c])
 (user=seanjc job=prod-delivery.src-stubby-dispatcher) by 2002:a17:902:dac7:b0:2c7:ebfb:618f
 with SMTP id d9443c01a7336-2cfa6b73a76mr12595425ad.14.1784767049125; Wed, 22
 Jul 2026 17:37:29 -0700 (PDT)
Date: Wed, 22 Jul 2026 17:37:28 -0700
In-Reply-To: <CAO9r8zNVPAeeiporS5aYFxdRUciaGwZGbnSg7Dr2XVpNFCvOmw@mail.gmail.com>
Precedence: bulk
X-Mailing-List: sashiko-reviews@lists.linux.dev
List-Id: <sashiko-reviews.lists.linux.dev>
List-Subscribe: <mailto:sashiko-reviews+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:sashiko-reviews+unsubscribe@lists.linux.dev>
Mime-Version: 1.0
References: <20260616004155.1435766-14-yosry@kernel.org> <20260616010534.2C8511F000E9@smtp.kernel.org>
 <CAO9r8zNVPAeeiporS5aYFxdRUciaGwZGbnSg7Dr2XVpNFCvOmw@mail.gmail.com>
Message-ID: <amFiSICO8Hqit7SY@google.com>
Subject: Re: [RFC PATCH v2 13/25] KVM: nSVM: Flush both L1 and L2 ASIDs on KVM_REQ_TLB_FLUSH
From: Sean Christopherson <seanjc@google.com>
To: Yosry Ahmed <yosry@kernel.org>
Cc: sashiko-reviews@lists.linux.dev, kvm@vger.kernel.org
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: quoted-printable

On Tue, Jun 16, 2026, Yosry Ahmed wrote:
> On Mon, Jun 15, 2026 at 6:05=E2=80=AFPM <sashiko-bot@kernel.org> wrote:
> > > diff --git a/arch/x86/kvm/svm/svm.c b/arch/x86/kvm/svm/svm.c
> > > index dac3d0098bb77..4f13c3456a5d7 100644
> > > --- a/arch/x86/kvm/svm/svm.c
> > > +++ b/arch/x86/kvm/svm/svm.c
> > [ ... ]
> > > @@ -4213,7 +4215,11 @@ static void svm_flush_tlb_all(struct kvm_vcpu =
*vcpu)
> > >       if (WARN_ON_ONCE(svm_hv_is_enlightened_tlb_enabled(vcpu)))
> > >               hv_flush_remote_tlbs(vcpu->kvm);
> > >
> > > -     svm_flush_tlb_asid(vcpu);
> > > +     kvm_hv_purge_all_tlb_flush_fifos(vcpu);
> > > +
> > > +     vmcb_set_flush_asid(svm->vmcb01.ptr);
> > > +     if (svm->nested.vmcb02.ptr)
> > > +             vmcb_set_flush_asid(svm->nested.vmcb02.ptr);
> >
> > [Severity: High]
> > Could this dereference of svm->nested.vmcb02.ptr cause a use-after-free=
?
> >
> > If svm_allocate_nested() successfully allocates vmcb02_page and assigns=
 it
> > to svm->nested.vmcb02.ptr, but a subsequent allocation (such as msrpm)
> > fails, the error path frees the page but does not clear the pointer:
> >
> > arch/x86/kvm/svm/nested.c:svm_allocate_nested() {
> >     ...
> > err_free_vmcb02:
> >     __free_page(vmcb02_page);
> >     return -ENOMEM;
> > }
> >
> > If a TLB flush is later triggered and calls svm_flush_tlb_all(), the ch=
eck
> > for if (svm->nested.vmcb02.ptr) would evaluate to true on the dangling
> > pointer, and vmcb_set_flush_asid() would write to freed memory.
> >
> > Would it be safer to check svm->nested.initialized here instead, to ens=
ure
> > the nested state is fully allocated and valid?
>=20
> Yes. But if no one objects, I'd rather add a patch to drop
> svm->nested.initialized completely, and properly NULLify
> svm->nested.vmcb02.ptr in the destruction paths. Keying off the
> pointer makes more sense semantically imo.

+1
