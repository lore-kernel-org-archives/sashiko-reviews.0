Received: from mail-pl1-f198.google.com (mail-pl1-f198.google.com [209.85.214.198])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3156818859B
	for <sashiko-reviews@lists.linux.dev>; Thu, 23 Jul 2026 00:46:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.198
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784767595; cv=none; b=EKxDV7siEsPVknY2M2XiIT0U7Oyz3QOp3uKmcoMqxR3N2g4xPl1D65f+EyZOMuCCMj1Ew4qL8w60jnnHkClx3OiPAcJ4EqqyREMPUlbQbRwQXQsC4NhjpPQlr3lRJM56m3ur/VxHViSI6Nx/7WrLUCw4cq6RLtyjTFAJzm/3+Zc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784767595; c=relaxed/simple;
	bh=mJhDJ4wuqKOqnygiiCPKcSW2lydIlEwMcX960VTrxGs=;
	h=Date:In-Reply-To:Mime-Version:References:Message-ID:Subject:From:
	 To:Cc:Content-Type; b=JXDJe+jVzXJL0qYwCu4isNtKWtYHts92z+DQKdHoSg/Llhn0DvB/zRDWYuhzu+bXKrz4WJVvvBdRYAEc++Wyqvc39msAKahlZAfsya88a9qOl6uLMDIbKI6KaP7pMv5zMqWzIg1PbLel+XPIHxfuZ6K3fvBT+tLPmTWPLm7UmyU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=flex--seanjc.bounces.google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=vGlA6FSy; arc=none smtp.client-ip=209.85.214.198
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flex--seanjc.bounces.google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="vGlA6FSy"
Received: by mail-pl1-f198.google.com with SMTP id d9443c01a7336-2cfa4e4684bso2989005ad.2
        for <sashiko-reviews@lists.linux.dev>; Wed, 22 Jul 2026 17:46:32 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20251104; t=1784767592; x=1785372392; darn=lists.linux.dev;
        h=content-transfer-encoding:content-type:cc:to:from:subject
         :message-id:references:mime-version:in-reply-to:date:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=iZ0hpTloGG/G9ddHfgB5VGCnW/abthdzeJrDqZKbAcA=;
        b=vGlA6FSyRvaAQJmIN51nZDrxJWi6zTtmfBT0mlpr6L3hoHomydz7lD4qWvwjPsfH7l
         jQgVxq/AGP7Ck1zKN9jVI/2sSMOxkyTrn7VxTemaOsDLB/iU1m1/84V+XofQ6w2HqUxM
         ecDpRIu6HOcYh5Koln6kS8ySqdOa8fw0UYIHNu6+e5u8/TcS26yk0mUoke2gUPPaX5f0
         qfuChb8QKeA8fRuo2+V4L/BU54w0VtKcI2AWEroTz7Dlo9G1hsROHeMWgfpZgyWRh9A3
         T7d5YfIDuxKuSbqQ3NWEbqEDwYJx5Zh7RAso02ZTydaoMQz+vkuS71BK+BhA9AyZ9C7f
         FUlA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1784767592; x=1785372392;
        h=content-transfer-encoding:content-type:cc:to:from:subject
         :message-id:references:mime-version:in-reply-to:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=iZ0hpTloGG/G9ddHfgB5VGCnW/abthdzeJrDqZKbAcA=;
        b=JGRR7FaFVrp5KbVvgHPiJGgm10eNOUWL3P4LA/J89b17K596JN9JBaX2D4UdpZwyjR
         JDRM1S1GNhzMcU327cyyEfJkHBurzAVHNpxvgspenWcQhE2CgwhOcsB5n7+iE4CzOUR3
         BhnOZ9gNCcEygOvlA5HAvciumGfMCncLqkFw2Ot5Nmg3E3bc+9YQRdZRY/gpEmkjFQ5V
         l1rc+rrxzrL0OqsGbyB9aSFSM4lUTNY+JCP8Zg4b35OjXBw21YyTXUX6fSKKibk8Hhbf
         AVw6wlsjP69XYoOYXD50uqPkXGfOIFQf1Vp1vTDTfGY+eWIXlBLhyRX6U5LF4cbtxsaV
         dqTg==
X-Gm-Message-State: AOJu0YySobC5ei17nq60KU14OqCi1p2QSFAr/94ylF0A8VldqIkQ2mkn
	0iNITqFlQCJJnOE6QA3NUD9OAO24K+jEXPST7KAKujuuQgEYQh/zKUubPmLv2ponLZjMpho0lz4
	kerl6wg==
X-Received: from plbji11.prod.google.com ([2002:a17:903:324b:b0:2cc:b904:3254])
 (user=seanjc job=prod-delivery.src-stubby-dispatcher) by 2002:a17:903:26c6:b0:2ca:a03a:29b2
 with SMTP id d9443c01a7336-2cfa71b761amr12107325ad.8.1784767592187; Wed, 22
 Jul 2026 17:46:32 -0700 (PDT)
Date: Wed, 22 Jul 2026 17:46:31 -0700
In-Reply-To: <CAO9r8zPSEw0snypASanWEdaaTnqf-ZvzRgZpEc=M+sPjELQbSA@mail.gmail.com>
Precedence: bulk
X-Mailing-List: sashiko-reviews@lists.linux.dev
List-Id: <sashiko-reviews.lists.linux.dev>
List-Subscribe: <mailto:sashiko-reviews+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:sashiko-reviews+unsubscribe@lists.linux.dev>
Mime-Version: 1.0
References: <20260616004155.1435766-18-yosry@kernel.org> <20260616012056.669B91F000E9@smtp.kernel.org>
 <CAO9r8zPRmcwKAtHch995Gm5EKxv07-3f90+H71g+w=iZ+VZfiQ@mail.gmail.com> <CAO9r8zPSEw0snypASanWEdaaTnqf-ZvzRgZpEc=M+sPjELQbSA@mail.gmail.com>
Message-ID: <amFkZwsaoPvuNWDA@google.com>
Subject: Re: [RFC PATCH v2 17/25] KVM: nSVM: Service local TLB flushes before
 nested transitions
From: Sean Christopherson <seanjc@google.com>
To: Yosry Ahmed <yosry@kernel.org>
Cc: sashiko-reviews@lists.linux.dev, kvm@vger.kernel.org
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: quoted-printable

On Tue, Jun 16, 2026, Yosry Ahmed wrote:
> On Tue, Jun 16, 2026 at 11:06=E2=80=AFAM Yosry Ahmed <yosry@kernel.org> w=
rote:
> > > > diff --git a/arch/x86/kvm/svm/nested.c b/arch/x86/kvm/svm/nested.c
> > > > index 234724d8b4c54..7b19191e0e43f 100644
> > > > --- a/arch/x86/kvm/svm/nested.c
> > > > +++ b/arch/x86/kvm/svm/nested.c
> > > > @@ -717,9 +717,16 @@ static void svm_switch_vmcb(struct vcpu_svm *s=
vm, struct kvm_vmcb_info *target_v
> > > >  {
> > > >       struct kvm_vcpu *vcpu =3D &svm->vcpu;
> > > >
> > > > +     /*
> > > > +      * TLB flushes are applied to the VMCB, so apply any pending =
TLB flushes
> > > > +      * on the current VMCB before switching to a new one..
> > > > +      */
> > > > +     kvm_service_local_tlb_flush_requests(vcpu);
> > >
> > > [Severity: High]
> > > Does this clear global TLB flush requests (like KVM_REQ_TLB_FLUSH_GUE=
ST)
> > > while applying them only to the outgoing VMCB?
> > >
> > > If a host-initiated flush occurs (e.g., from page reclaim), the reque=
st
> > > bit will be consumed and applied to the outgoing VMCB, leaving the in=
coming
> > > VMCB to miss the flush and run with a stale TLB.
> >
> > Yeah it is intentional to apply the flushes to the
> > current/old/outgoing context. If there are flushes needed in the new
> > context, they are queued by nested_svm_{entry/exit}_tlb_flush().
> > That's similar to what VMX does.
> >
> > >
> > > Also, is there a context mismatch here during nested VM-Exit?
> > >
> > > In nested_svm_vmexit(), leave_guest_mode(vcpu) is called before
> > > svm_switch_vmcb(svm, &svm->vmcb01).
> > >
> > > Because of this, kvm_service_local_tlb_flush_requests() will see
> > > is_guest_mode(vcpu) as false. If Hyper-V is enabled, this means
> > > kvm_hv_purge_tlb_flush_fifo() will incorrectly target L1's FIFO while=
 the
> > > hardware flushes are actually being applied to L2's vmcb02.
> >
> > Ugh.. yes. This is annoying. kvm_service_local_tlb_flush_requests()
> > needs to be called on both the current/old/outgoing VMCB *and* guest
> > mode. So we'll need to open-code the call in a bunch of places before
> > svm_switch_vmcb() and {enter/leave}_guest_mode(). I really liked
> > putting it in svm_switch_vmcb() together with
> > nested_svm_{entry/exit}_tlb_flush() so that all the TLB flushing logic
> > for nested transitions live in one place and the ordering needs to be
> > handled in one place.
>=20
> Maybe we can just re-order the code to always call svm_switch_vmcb()
> before {enter/leave}_guest_mode(). We already do that on the entry
> side, and seems to be straightforward on the exit side.

As stated earlier, I'd prefer to explicitly do flushing stuff where it fits=
 from
an architectural perspective.

> With that, we can keep kvm_service_local_tlb_flush_requests() and
> nested_svm_{entry/exit}_tlb_flush() inside svm_switch_vmcb(). We can
> add a WARNING to kvm_service_local_tlb_flush_requests() to make sure
> the calls remains in the correct context (i.e. VMCB matches guest
> mode).
