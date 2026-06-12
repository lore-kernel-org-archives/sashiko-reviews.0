Received: from mail-qt1-f182.google.com (mail-qt1-f182.google.com [209.85.160.182])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 32B273672BA
	for <sashiko-reviews@lists.linux.dev>; Fri, 12 Jun 2026 08:10:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.160.182
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1781251831; cv=pass; b=ahe5xyVS5iPDf0YyeMbfI7SWYTmL4Ofv9hIXSjMhKtpAa4K9/ayiBFZlFtvgZ17B64WondHS/YS5afYvF8279y/v/a2p7bDCiGSgYtwIP4dWq3eXmtowauh/dJlox/20WtJpZRqYMkKSUnuGC86zjWoYv+sxwuqP7LGRIS9eOAk=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1781251831; c=relaxed/simple;
	bh=FBvfWHIWTRTzWtiucXcutNDAIO4vP6bwkD/CrVILj/o=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=rvef3+FkDaimOhsfDeQaLkKE5WzsO9+VhHvlMzC70GokVTaTiHa7oRPa/daoNjjqOgQ5bz3FL5nhaGjvIIL+FGHSK+WdlzcUj6hu5gG5JJ6vi9bxZaqR7uJpYtYuwWoGKauWyVIMAqtkLAmPPlxroQW5o1bx1cngoWghMxlgyfQ=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=fpfMv1z7; arc=pass smtp.client-ip=209.85.160.182
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="fpfMv1z7"
Received: by mail-qt1-f182.google.com with SMTP id d75a77b69052e-5175d339e8bso411321cf.0
        for <sashiko-reviews@lists.linux.dev>; Fri, 12 Jun 2026 01:10:28 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1781251828; cv=none;
        d=google.com; s=arc-20240605;
        b=ast4GxiiASEGK8WhYzCkrNElxutnjzQ/6mJ6/G+SEAxNkq+mFON0dU5C5gSQgOol+P
         EHDPJ8rcjySv4pGK4F25tZt2rSUduapffM6eSvbX5TF/9d61bYL+uX51+tXz+ztkBlaT
         J98jls0Xqb9n5jvylo5rzhjv30E/pfUMOKcQXsz6puAh1r6pK5Hwhj/D5jfkNXMkCruD
         geaM3Vk96rCZdQXcYhngnwBKo5rDxcyzPlDu9UPf87Cv89m+98c0A3xlXVZm3mfjDiTl
         P67AUdlT9O/9Gkyvg6LPYhMUnS8OMIWCnhrSNRSeBQs3XjIQhS4gl/aucYlz6msk+/pq
         uomA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=HsRympmeVxv140lJ2B25egk2XwJhKILnQlbW7ETNqhE=;
        fh=HhTV4G5+xnJ3thQDc6cpcOYMN3AitX7qB0zPfKB89LY=;
        b=hCbucohETumCaL25ZNN3UY4hR02Q7MnZTIfNV2x/EJhZdrDAacg91JcDueqcjUC1QT
         EYMx/SyLaInSS+Zk9HWwd9xzt7bL6YSdAml0DZEVRbui9fipa9TcNBSxdLLC0cXvMA5z
         WMSX9SZ+uUlMkX+wfnLTGoaa8H+2vyffL8FOjv+++6KGszSRv5XJKcgLJ79wXpSA0wP0
         ZuDqE/dABdjmT12NTJXHLiQhp8Eb+iw9k9wzuLU+13F0jdq0u14jw4OKKEFrXvjrJ6SN
         yhW616eeC9rvSjzngmKTZrj+S+kO879/ZtxHqVorYbPzIE/wrFcaEbALt4p6akirfJz6
         KQkg==;
        darn=lists.linux.dev
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20251104; t=1781251828; x=1781856628; darn=lists.linux.dev;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=HsRympmeVxv140lJ2B25egk2XwJhKILnQlbW7ETNqhE=;
        b=fpfMv1z7vI905vhuNhmLRVWIJbOv3cAsFwE+y/ZmMVfGQcqCsEuaDyMRNeUV5b8Sa3
         QUlgnug5xTWP6eL5/lbTfOykXY5iDA+MGyOOv1orVqlbR0423/qYtrC/1n+rYegr5XSu
         fnqkLLjmix0EhC1IVr+iVsRC7Ea5yrLJQP/y+k0XGDNt2lEpEUAVYqqXaIcC5NpGNqbK
         ytSrBlc+FQTeV4x6FbNwjuuvNB9Ui6ya6EjszeHleEcgQb19GooG/7O4zpEQExZM4IQJ
         7xcUBvj2D92VrtucMLtUAFGI6P24qljvueI5qc4yrheSiVq2dB7HtnTE9cCklRR/jKBr
         G3oQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1781251828; x=1781856628;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=HsRympmeVxv140lJ2B25egk2XwJhKILnQlbW7ETNqhE=;
        b=dFd3kUWSXwMYwJCb8OI/RcTUYDGQh8tEh7M7c3ji2YqLPienNF0XTbveZVXUbCDcQm
         BRD5ucTqm0q8Z8e/pZunecEcdnpVPc5ccvjlsO9C4JolbDhz6hgVqbmvsdnxeP9WCaE0
         pkyKEhN6DoJPZ5fbj0ZjsIDdRQHxctvJ69MeL017vHYcaC9UlpdmwbN++AkA/ce3OzU2
         qr5lqGXCKm8Dl1izwtKpvoFQHcPcJd4uWS93PG6OlzBZ0I5bRPaG+1Xt22RBJjOVoJVW
         F/ElcQaT9IC06HI6ju2aAP0Xgal+dFsE5mLQY6wyEJWNXqQ42tEoNasOR+46KrATk0yh
         dH3Q==
X-Gm-Message-State: AOJu0YwH0zgz6EL/q23FJCqTnnXLzplIXxN3OHRZdqwXlIxCDhegvVMP
	ytyraqOXevr/Opa22ICekBhS82KTdsdZ/0/W9uX3R1mnVSGJJ0RniXypgawr3I1Sa5rwgVoLkc1
	4um/OI8IhwO1Ui9CgHrQVTFr4+8IawdZLfJx8BUmm6dqjrGyuwKWMZe4S
X-Gm-Gg: Acq92OEV+cEVOaVvFKU5xVZ0h9/uZGfMkwmIcnPRnVpzAzgDDnyBpGa3ZAihtzeuBVk
	KkUAfRkW0N+uJMtMJBY/fQkNX7bLNXimSNk9yjll+o4wzAQthBbYZxbXer+65V/5aQ3jZisHCk7
	e71o2I0WhfHhyXvExUpe/OM+RgR9RB6mHH4lZuu+uaNYaPF8+UE2rePiVO7lUgX1IZHDpfjg1C9
	bBlvwzeHxacriZEsNxEn4e9Ho1d9+dY6nzzfQcOM6BviyLhlc7JFqg+nV7L5W7l4hqgqp+BMPyP
	l+psRD8PpZ7ZN2x/QIo=
X-Received: by 2002:ac8:5ad2:0:b0:517:99ea:ab7f with SMTP id
 d75a77b69052e-517fc56c173mr5018281cf.25.1781251827319; Fri, 12 Jun 2026
 01:10:27 -0700 (PDT)
Precedence: bulk
X-Mailing-List: sashiko-reviews@lists.linux.dev
List-Id: <sashiko-reviews.lists.linux.dev>
List-Subscribe: <mailto:sashiko-reviews+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:sashiko-reviews+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20260612065925.755562-10-tabba@google.com> <20260612072456.0F4D01F000E9@smtp.kernel.org>
 <CA+EHjTyyDJsOEhcJnuxpyia5EU_GUck_GeQRP65n75S85f31cg@mail.gmail.com>
In-Reply-To: <CA+EHjTyyDJsOEhcJnuxpyia5EU_GUck_GeQRP65n75S85f31cg@mail.gmail.com>
From: Fuad Tabba <tabba@google.com>
Date: Fri, 12 Jun 2026 09:09:50 +0100
X-Gm-Features: AVVi8CeGPCrayZYkuT5RU1qFdc0a4wgdOz9YB1t2V2QwM7WaiiBvzZs1-7lSQh0
Message-ID: <CA+EHjTxuPGXKJKhdQi8WPApM4L7SC6gTKwqtqKx9x25vFpMuuQ@mail.gmail.com>
Subject: Re: [PATCH v1 09/11] KVM: arm64: Minimise EL2's exposure of host VGIC
 state during world switch
To: sashiko-reviews@lists.linux.dev
Cc: kvmarm@lists.linux.dev, Oliver Upton <oupton@kernel.org>, 
	Marc Zyngier <maz@kernel.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Fri, 12 Jun 2026 at 09:05, Fuad Tabba <tabba@google.com> wrote:
>
> On Fri, 12 Jun 2026 at 08:24, <sashiko-bot@kernel.org> wrote:
> >
> > Thank you for your contribution! Sashiko AI review found 2 potential is=
sue(s) to consider:
> >
> > Pre-existing issues:
> > - [Critical] The GICv5 equivalents of the VGIC save/restore hypercalls =
(`handle___vgic_v5_save_apr` and `handle___vgic_v5_restore_vmcr_apr`) direc=
tly dereference host-provided pointers without validation, allowing a compl=
ete bypass of pKVM isolation.
> > - [Critical] The `handle___kvm_adjust_pc` hypercall directly dereferenc=
es a host-provided `vcpu` pointer without validation, granting the host an =
arbitrary memory corruption primitive against the hypervisor.
> > --
> >
> > commit a5d2ecd901c7ff6f71119eb6ee605aaa1a3fee90
> > Author: Marc Zyngier <maz@kernel.org>
> >
> > KVM: arm64: Minimise EL2's exposure of host VGIC state during world swi=
tch
> >
> > The host passes a vgic_v3_cpu_if pointer to the __vgic_v3_save_aprs and
> > __vgic_v3_restore_vmcr_aprs hypercalls, which EL2 dereferences
> > wholesale. That exposes the host's full VGIC emulation state to the
> > hypervisor, against pKVM's isolation goals.
> >
> > Recover the host vCPU from the supplied cpu_if via container_of() and
> > copy only vgic_vmcr and the active priority registers between EL2's
> > hyp-side state and the host vCPU, so EL2 no longer dereferences the
> > host's vgic_v3_cpu_if directly.
> >
> > > diff --git a/arch/arm64/kvm/hyp/nvhe/hyp-main.c b/arch/arm64/kvm/hyp/=
nvhe/hyp-main.c
> > > index 420fb19a64760..2f165b6c7b071 100644
> > > --- a/arch/arm64/kvm/hyp/nvhe/hyp-main.c
> > > +++ b/arch/arm64/kvm/hyp/nvhe/hyp-main.c
> >
> > [ ... ]
> >
> > > @@ -489,16 +501,63 @@ static void handle___vgic_v3_init_lrs(struct kv=
m_cpu_context *host_ctxt)
> > >
> > >  static void handle___vgic_v3_save_aprs(struct kvm_cpu_context *host_=
ctxt)
> > >  {
> > > -     DECLARE_REG(struct vgic_v3_cpu_if *, cpu_if, host_ctxt, 1);
> > > +     struct pkvm_hyp_vcpu *hyp_vcpu;
> > > +     struct kvm_vcpu *host_vcpu;
> > >
> > > -     __vgic_v3_save_aprs(kern_hyp_va(cpu_if));
> > > +     host_vcpu =3D get_host_hyp_vcpus_from_vgic_v3_cpu_if(host_ctxt,=
 1,
> > > +                                                        &hyp_vcpu);
> > > +     if (!host_vcpu)
> > > +             return;
> >
> > [ ... ]
> >
> > > +     } else {
> > > +             __vgic_v3_save_aprs(&host_vcpu->arch.vgic_cpu.vgic_v3);
> > > +     }
> > >  }
> >
> > [Severity: Critical]
> > This is a pre-existing issue, but while this patch addresses the VGIC v=
3 host
> > pointer dereference bypass by using get_host_hyp_vcpus_from_vgic_v3_cpu=
_if(),
> > does the same pKVM isolation bypass exist in the GICv5 equivalents?
>
> GICv5 is not supported in protected mode. vgic-v5.c:62-64 skips
> GICv5 registration entirely when is_protected_kvm_enabled(), so no
> GICv5-based guest can be created under pKVM. The host never reaches
> these hypercalls through any legitimate code path.
>
> >
> > Looking at handle___vgic_v5_save_apr() and handle___vgic_v5_restore_vmc=
r_apr()
> > in arch/arm64/kvm/hyp/nvhe/hyp-main.c:
> >
> > handle___vgic_v5_save_apr(struct kvm_cpu_context *host_ctxt) {
> >     DECLARE_REG(struct vgic_v5_cpu_if *, cpu_if, host_ctxt, 1);
> >     __vgic_v5_save_apr(kern_hyp_va(cpu_if));
> > }
> >
> > These handlers appear to take a cpu_if pointer directly from the untrus=
ted
> > host context and apply kern_hyp_va() without validation. Could a malici=
ous
> > host provide an address that translates to an arbitrary EL2-private mem=
ory
> > location, granting an arbitrary write or read primitive when
> > __vgic_v5_save_apr() or __vgic_v5_restore_vmcr_apr() is invoked?
> >
> > [Severity: Critical]
> > This is also a pre-existing issue, but does a similar arbitrary memory
> > corruption primitive exist in handle___kvm_adjust_pc()?
>
> Yes, pre-existing. It is addressed later in this series by
> "Prevent host PC adjustments for protected vCPUs" (patch 10/11).

Sorry, it is preexisting, and the fix is in the followup series, not this o=
ne.

> Cheers,
> /fuad
>
> >
> > Looking at handle___kvm_adjust_pc() in arch/arm64/kvm/hyp/nvhe/hyp-main=
.c:
> >
> > static void handle___kvm_adjust_pc(struct kvm_cpu_context *host_ctxt) {
> >     DECLARE_REG(struct kvm_vcpu *, vcpu, host_ctxt, 1);
> >     __kvm_adjust_pc(kern_hyp_va(vcpu));
> > }
> >
> > And __kvm_adjust_pc() in arch/arm64/kvm/hyp/exception.c:
> >
> > void __kvm_adjust_pc(struct kvm_vcpu *vcpu) {
> >     if (vcpu_get_flag(vcpu, PENDING_EXCEPTION)) {
> >         kvm_inject_exception(vcpu);
> >         vcpu_clear_flag(vcpu, PENDING_EXCEPTION);
> >         vcpu_clear_flag(vcpu, EXCEPT_MASK);
> >     }
> >     ...
> > }
> >
> > It seems the host-provided vcpu pointer is converted via kern_hyp_va()
> > without the __get_host_hyp_vcpus() validation barrier. Could a maliciou=
s
> > host inject a pointer that translates into EL2-private memory (like
> > hypervisor page tables) and set the PENDING_EXCEPTION bit, forcing
> > __kvm_adjust_pc() to write exception vector addresses and clear flags a=
t
> > specific offsets within the target structure?
> >
> > --
> > Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260612065925.=
755562-1-tabba@google.com?part=3D9
