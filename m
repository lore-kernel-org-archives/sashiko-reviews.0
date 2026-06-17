Received: from mail-qt1-f174.google.com (mail-qt1-f174.google.com [209.85.160.174])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D83F527EC7C
	for <sashiko-reviews@lists.linux.dev>; Wed, 17 Jun 2026 14:52:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.160.174
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1781707951; cv=pass; b=ZaibNmCict9/Ie4wOH+i84l5hr6UuOZdfjTdiQzbZtop5IZhi5NcOWOjB6O60d/yNNckbIshVOZ3gz/5tSaWFCiJ09AifpanzfIckV9vnqhHK/3IHTERz+MKduFQQjjlgsJVFTHlX5iOOFlNj6ghzkiGoEi15pE+P4lPu9jzkXY=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1781707951; c=relaxed/simple;
	bh=svG5VUeLWXcFadC9nMYewsobyw3y4iSJPkBxx3gavIM=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=swCV4i/f/uVsglvui+FFy+laFn45Hrk+BJhFm553rMo8C18EPPHNARt6q+PZnzgmkk6dGajZaXts6ETLU5ffrgDrCzHeih/B7YtExmh1eFeP2sGlla/tfvt/ajjMX7GICDhehIQzVY0BUpY1wpFao8nr3NUvKoCV/HMNAp3czzA=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=IdZWu9pj; arc=pass smtp.client-ip=209.85.160.174
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="IdZWu9pj"
Received: by mail-qt1-f174.google.com with SMTP id d75a77b69052e-5177d1ff061so269591cf.1
        for <sashiko-reviews@lists.linux.dev>; Wed, 17 Jun 2026 07:52:29 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1781707949; cv=none;
        d=google.com; s=arc-20240605;
        b=VaiSNVfLV8ZnoWRCncYGOLv6tgxY2QuozQer2urEJqPv760nrvk8nuKWaVL2zwNgxG
         5xYMb3TWE/30U0/km6ecTJ2UneoYX5wlf7RE1h+y0p4S+zwQOV/6+fnTWajOjIBHQpaN
         HtOaLcHjkJCgYtDGa4+FmDDst/ha/9zPE8mMZLCL6dB+GqRrt7y6r1UV3Qv4s54VV08f
         VxuKZWp+OLlARS7NiwYtSfz16/pTmTbKOy1rmjL6qkQZa3sF8rm/KkXMugbk3sUYxQTn
         ovPWeiM1THYPLHUizKV0sIj3LsRaQ+Uk4pIxlQTFIJOa95ynL9SMp6SdTH3wIQ7wtxTa
         xvdw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:dkim-signature;
        bh=rRL5oribGYZKW3GCbWudAKMbSR10/FVZtjDSZUF5qUc=;
        fh=k9s8btd99OQQsxs9gX8zPzaoPr4l9lUJ09mDmwBg+Vo=;
        b=QbuSY9rA26HQtoItjgfi3mrT9nnSUWz1NnI98QJJPMtFOGpLZTwhE+77p34ZiiOIfR
         dh1keYBMFnaybyHa1Kl5jWo2zUnAb/TNJb6Vz3TQP+0ffvkGue067UvOE3egQES+Y7/P
         VgQK3kIGmLFdYAPJEd2D4PZCL5iQpmxxTlYYb0c+AOU1fqkVPfdFx2vQm1p8kF5lPbYY
         pzYrQMV1hxFOSYWrFYTklEKOOazHbPesZwc1+6HVHZTNthxd5X2/syN+/5Yk4sUwrbA5
         BoR5MwDh/0gL4/qO7tYTYbrbcb/EioAZiFuIKy7sg3EoXK8PxIRSuUifP7TPUApQSDbN
         JSQg==;
        darn=lists.linux.dev
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20251104; t=1781707949; x=1782312749; darn=lists.linux.dev;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=rRL5oribGYZKW3GCbWudAKMbSR10/FVZtjDSZUF5qUc=;
        b=IdZWu9pj1BXYXox1F2vuzn+6N9amITcUz/Dql+8DdGTxGilfHKqeMhhgy0J/pWSqEW
         J7wE1OJ6yi786DNq+9mw6E8Nu90wEfHRSMvDPdJqK0NAUeAxG2mpOx13Bmf7179du7HY
         8whhxXp9YlkUZ4AxgsFU9iBrdoU5kPNhlrdSG9pMRDiCxPpQyE+EQug13G5e9fZQaNdX
         JtanltPluJPC3fqjOQhLrd5+tWnflT46mYFMKOQ7Yd/cIkevfW27b6ZaCj2GqnNotHaL
         MmSvoSBpaFxRR//IwaVlK9k0qByeJiu2ss8VyCarrrGNauU81YOiiDV5Q3Nyqs8apwv1
         DgEQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1781707949; x=1782312749;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=rRL5oribGYZKW3GCbWudAKMbSR10/FVZtjDSZUF5qUc=;
        b=h14XJCxdcMukWAlWTf1WtXvr4fbyZ7upFAPDXTuYmIDIOextiMS8kskXeGBnZRIyBn
         B574fZ+qjbmte3A+m4hfxZ6c8c0Wfgk+OKAoWK1QjD9/cZ+CSn9jE66ymyLfb9CL6D4p
         9pJX+iwNJSQ8qTQFa+OA/RgpwSoHx52oQPuwSeLiqcRvIZknhzpHn8KzTiV8iUa19oCu
         1degNh21w5Ss7VJpVYPFBJmYiUkxFQzjy9yK2cN3GZ1/lNLsBmpSWoAT4T2aJk3ulEkD
         eMv5f3un2ASYFeLkFr0Jc/CGBHgrh4LbJ1zh/j2R5TMjvasHIre78ZCt8EO0+M0Q1PT5
         cCQQ==
X-Gm-Message-State: AOJu0YyKhmuuWvxqnw7NsagRYZd+rIXXza42lTFneBxNt6gQNXwrJwXL
	6rICahbzkzh5sAawa0TQtYssQLRCLwlipedInVuecQh1SAkCaQwZr5ZbpHTFqn3UaL6j7lW6CQ2
	q5tnCLJLHZ2VPQ0EFRxdoJjY3/FFazPurYWD6EgQD
X-Gm-Gg: Acq92OExXdL18M5peADG+ybbMVHl1xRGReZpvWnG/K77iaAK4qyFQo41X/A8sO/ZC8h
	2LHIzwazvtf3vEtBs9C948cDFGK6IZs2EOZ4p83aKGAVGRJRUrdanPAZCTMutamim5nDGNBgMOM
	pMNFP7UKCAVmAkBNOaWRLusy0DsreWEAbrDTiSaUQBKWUc9bsDraPcc8w1m1/GXNDavpmy1IWE3
	RzaVALcj2jXZ8mZ3/2Qf/GwAakS9ZsAFT88XcLYv1r0PgvFiRYkPquaKlvuN0wETB19CeFZF9tA
	Hm9NPdVo8hh4lE+xfG7Cw5939fQ=
X-Received: by 2002:a05:622a:1143:b0:519:56a8:2693 with SMTP id
 d75a77b69052e-519aad18b33mr10178591cf.24.1781707948213; Wed, 17 Jun 2026
 07:52:28 -0700 (PDT)
Precedence: bulk
X-Mailing-List: sashiko-reviews@lists.linux.dev
List-Id: <sashiko-reviews.lists.linux.dev>
List-Subscribe: <mailto:sashiko-reviews+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:sashiko-reviews+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20260614163336.3490925-5-tabba@google.com> <20260614164547.D398B1F000E9@smtp.kernel.org>
 <CA+EHjTwHoveK6FT0CGcKuj97aUaHpv7vk=DQjRxT9c6UkkSeoA@mail.gmail.com>
 <86wlvxs5r0.wl-maz@kernel.org> <CA+EHjTzWpLBxy=Pi=K0G-9JU0cPTsGSNB4Esy+K+vFYNM0DnNw@mail.gmail.com>
 <86v7bhs0af.wl-maz@kernel.org>
In-Reply-To: <86v7bhs0af.wl-maz@kernel.org>
From: Fuad Tabba <tabba@google.com>
Date: Wed, 17 Jun 2026 15:51:51 +0100
X-Gm-Features: AVVi8Ce476niaO8Z4RT83x1LhKP1vNSFXlSVYznEqkjoo5qVPP39l7ZYDE5bAKw
Message-ID: <CA+EHjTy_t2SR7yeehg3JDV5+1pa=BpREQ2-UuinZ2SQAgj3JZw@mail.gmail.com>
Subject: Re: [PATCH 4/7] KVM: arm64: Set IL for injected FPAC exceptions
 during ERET emulation
To: Marc Zyngier <maz@kernel.org>
Cc: sashiko-reviews@lists.linux.dev, Oliver Upton <oupton@kernel.org>, 
	kvmarm@lists.linux.dev
Content-Type: text/plain; charset="UTF-8"

On Wed, 17 Jun 2026 at 15:34, Marc Zyngier <maz@kernel.org> wrote:
>
> On Wed, 17 Jun 2026 13:39:14 +0100,
> Fuad Tabba <tabba@google.com> wrote:
> >
> > On Wed, 17 Jun 2026 at 13:36, Marc Zyngier <maz@kernel.org> wrote:
> > >
> > > On Mon, 15 Jun 2026 13:42:23 +0100,
> > > Fuad Tabba <tabba@google.com> wrote:
> > > >
> > > > On Sun, 14 Jun 2026 at 17:45, <sashiko-bot@kernel.org> wrote:
> > > > >
> > > > One thing I noticed while looking at this:
> > > > kvm_check_illegal_exception_return() preserves {N,Z,C,V,D,A,I,F} from
> > > > the current PSTATE, but the Arm ARM says these should come from
> > > > SPSR_ELx on an illegal exception return (EL and SP are unchanged, but
> > > > the flags and masks are taken from SPSR). PAN and ALLINT should also
> > > > come from SPSR_ELx if their respective features are implemented.
> > > >
> > > > Marc, is the current behavior intentional, or should we be
> > > > constructing PSTATE from the original SPSR_EL2 for those fields?
> > >
> > > This looks like a long standing bug for something we really never
> > > tested. I reckon the patch below would do the trick.
> > >
> > >         M.
> > >
> > > +++ b/arch/arm64/kvm/emulate-nested.c
> > > @@ -2746,17 +2746,29 @@ static u64 kvm_check_illegal_exception_return(struct kvm_vcpu *vcpu, u64 spsr)
> > >             (spsr & PSR_MODE32_BIT) ||
> > >             (vcpu_el2_tge_is_set(vcpu) && (mode == PSR_MODE_EL1t ||
> > >                                            mode == PSR_MODE_EL1h))) {
> > > +               u64 mask;
> > > +
> > >                 /*
> > >                  * The guest is playing with our nerves. Preserve EL, SP,
> > > -                * masks, flags from the existing PSTATE, and set IL.
> > > -                * The HW will then generate an Illegal State Exception
> > > -                * immediately after ERET.
> > > +                * masks, flags from the existing SPSR, and set IL (see
> > > +                * R_VWJHB). The HW will then generate an Illegal State
> > > +                * Exception immediately after ERET.
> > >                  */
> > > -               spsr = *vcpu_cpsr(vcpu);
> > > -
> > > -               spsr &= (PSR_D_BIT | PSR_A_BIT | PSR_I_BIT | PSR_F_BIT |
> > > +               mask  = (PSR_D_BIT | PSR_A_BIT | PSR_I_BIT | PSR_F_BIT |
> > >                          PSR_N_BIT | PSR_Z_BIT | PSR_C_BIT | PSR_V_BIT |
> > >                          PSR_MODE_MASK | PSR_MODE32_BIT);
> > > +
> > > +               if (kvm_has_feat(vcpu->kvm, ID_AA64MMFR1_EL1, PAN, IMP))
> > > +                       mask |= PSR_PAN_BIT;
> > > +               if (kvm_has_feat(vcpu->kvm, ID_AA64PFR1_EL1, NMI, IMP))
> > > +                       mask |= ALLINT_ALLINT;
> > > +               /* Account for FEAT_SPE_EXC and FEAT_TRBE_EXC one day... */
> > > +               if (kvm_has_feat(vcpu->kvm, ID_AA64DFR1_EL1, EBEP, IMP))
> > > +                       mask |= BIT_ULL(32);
> > > +               if (kvm_has_feat(vcpu->kvm, ID_AA64PFR1_EL1, GCS, IMP))
> > > +                       mask |= BIT_ULL(34);
> > > +
> > > +               spsr &= mask;
> >
> > I'm on it...
>
> Sorry, in what sense?

Writing up the fix:
https://lore.kernel.org/all/20260617144907.2972095-1-tabba@google.com/

which deviated slightly from your suggestion above.

Cheers,
/fuad
>
>         M.
>
> --
> Without deviation from the norm, progress is not possible.
