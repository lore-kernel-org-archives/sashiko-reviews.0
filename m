Received: from mail-qt1-f178.google.com (mail-qt1-f178.google.com [209.85.160.178])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 24AA5288D0
	for <sashiko-reviews@lists.linux.dev>; Wed, 17 Jun 2026 12:39:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.160.178
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1781699995; cv=pass; b=BWxiibQjoCA1Tv3kw+K4HLfdMBh54yu2Gu5EH62ZkcxXpugOAyhJm6XwPL1CAp4YU0L3YWTIsPGfqWcAYMZ1YQWXEKUU57k4PSrgT2cpjBdYK8tBcUQ7+rHCL12rBlX/2UoWbI260hd+tDkr69e3LF3/hdgXuRW9s6ysgc4l5Ik=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1781699995; c=relaxed/simple;
	bh=t9viMQR94jVVD+nDvBDbpY98W8gKo84PmFUepmOCjZc=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=DIDuWONoE9q+9/T28XtOgw8U0SSY/HR/oLqWJdK+QPQpYgOCY6dbJxpgX3tcUwE5yT1Z9QrcanaIMLOklZJafFLuzywm3pmE/og7LT7e3sqYcJitYwSocm75+8/vRdf4a1huXQDCRcvvyhQQctoGJf9ml/geVK77IKtWUDVc8jI=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=e7rmlqJS; arc=pass smtp.client-ip=209.85.160.178
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="e7rmlqJS"
Received: by mail-qt1-f178.google.com with SMTP id d75a77b69052e-51765531803so258541cf.0
        for <sashiko-reviews@lists.linux.dev>; Wed, 17 Jun 2026 05:39:53 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1781699993; cv=none;
        d=google.com; s=arc-20240605;
        b=EvBT/yT2GDSQEP29TmSjrkn616TrON4BhHGaLpaALXsi6l+kPlonH77ldM5+Qd7CMe
         JILUeOoCPu0beBX2M1ZqHuhaeJN49Gq/XBYZVaRFJHrMGLJ74pAWUWItl/gvk2wZU8ag
         fUteSHgNA5ihl/fVpbWBQXDLrHyeOGG7rfbTxS8y8gVZXNcviEeKqSw9gn7itHppoDds
         rbtiZI3C5a4catR9n21C3h/ASArcIKoQXoxkhLAPW/0wuBFChwBE8o6722q+kG/Smpaz
         oFJlQpi50jXUANdDdKf36VBh415ksWVIATrLGzoAu9rV+un7e6LwplTSiei7a7ZHqke0
         z4FQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:dkim-signature;
        bh=qhhtgQnSjLdOLlgeRgnMdwozVJra8F/T77Ka+Nix12g=;
        fh=k9s8btd99OQQsxs9gX8zPzaoPr4l9lUJ09mDmwBg+Vo=;
        b=hVmgH3lNTxtlhQgrW+UfLdbscX3KYbiakyuCqpvdyyhuIyEr2tb+wekzTfuj5UW/Bp
         6gs0EW4v7lapvu+EVBujGB71jKHJLeDDQ9Ecnfe3HTCuGIYnayINw/Pwi6RMh4XiXPVj
         +MhJbvJ/p1h2z2s34AH2YmJhKHp51T/yjbF+FvaSLpBRsz1IV/q0sMlOLvWw0fq8YETE
         Wjza7GP6jM75U3d6B1/OCZj4d4mZgsLR6O/m42tzREzR8nNWYm256X1/NiK0qbPaS/GH
         a4Zlk1HrH77GtFPdGYwX2mh6S9PP9b5VvetcqeJ9ZLVE7sJHoqC0Zz2Ap1K58Ad3ae3E
         yUTg==;
        darn=lists.linux.dev
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20251104; t=1781699993; x=1782304793; darn=lists.linux.dev;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=qhhtgQnSjLdOLlgeRgnMdwozVJra8F/T77Ka+Nix12g=;
        b=e7rmlqJS0IKZOtzDUtq0SPLJpkQibRGeuTMkyWCciYWskd90+rXov6dipGXSvbiEpQ
         b+5opkxprfrzIujCx/AirorqIp9vv1hsgkzLPNCc64bX7DglxwmbwZLjk8a26wFpiIY8
         7hg9j18ay8Uet6TTRY29howo47jMIztS3SeZj31ZAFAaYGqriih1Ln4n9xky2EN9g10X
         3qO4Nikrb1Hck01oyMHjky1neWpyUYUH7TA5aicad9Da9o2Lc2qfeW2YIfvgJFtITAQC
         H0EGEUnk3Ubg9yspV+mJuygQ0XQOp4WWbDWfQ8EVfml43UnkBMBuTzhprT0+bIzzgKM0
         oTJg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1781699993; x=1782304793;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=qhhtgQnSjLdOLlgeRgnMdwozVJra8F/T77Ka+Nix12g=;
        b=fue/IQfjqGQnvJexT00ZKrx7Ccpfvy4gOhe6xOx8ZGVssnBfbmoWUHQcRpCJeHV7bP
         mtCF2gTQbgzkhsFqEb22PI/Gy6Fnws7/cjYpXqePZ0OM6eQC1PRnOI6IMew8+LeL4wq8
         9udsb1KL9CrTK/7GPEK/5dyC/ooLe0cxRcc7wr8i5EKDVYIqrZmOUHZdqMz2EBdSjC4S
         sEHgKXErUu0wOSSwNTW/U/HbVTzT0lTyRWXjYo1GKICxftyuJHRz40XIR8xPskt8w5Ur
         CeScbS4pIG/uSnX4mgfLaQ8PkU4lcaksC9Fgf+HHfM0oEtRlsm5cErN5G4qqokAIEPtM
         R+SQ==
X-Gm-Message-State: AOJu0YxruSRuL11sSenpY2KDiky5iq5LQat+rCYHRLtQlr+ejU0LKSdy
	petO0Ca1zgMRA3vHC/g0iKqTWJ736CQAdkmlFm6WxngFT9QBrcoaNmQUhRI3qv/tmVqDVmGpG2b
	U4GrJJ+G8pU34p6ifM0Zpe1c1heqLrMg9BemESUQvBfjsYT/konTgfRKu
X-Gm-Gg: Acq92OEVVZE/R8TdKSaBWP/O3BH94OpfrWcIOAV3BmBTFwNpA/WD3g7j901NbpczDRh
	QhiftoTpjWhknCrSCgjeEagi3xGbIf8jx2mdFXZ4z3IG0qzPx4K4QefX7edyg5JV1z9FHu5zHDS
	yQ2aj6L/eEFiUg1Ph0EyVDTyu7XJkjHn8wq0js///Vf9e17Dt/n5vqH3fWCCEGs2o6Ms9Q3/0tF
	wELQhj1w7WKLMRxCHPdK3yZ0T6Hl7nqPbFNZLEn/rTymBB7GFua9q8G5Z2D81RuBxoQnS56KrKM
	8b5acyI7FdfcWX2BiqtHuIdRrIY=
X-Received: by 2002:ac8:5fd1:0:b0:4ff:bfd9:dd31 with SMTP id
 d75a77b69052e-519ad98aad1mr7033901cf.5.1781699992272; Wed, 17 Jun 2026
 05:39:52 -0700 (PDT)
Precedence: bulk
X-Mailing-List: sashiko-reviews@lists.linux.dev
List-Id: <sashiko-reviews.lists.linux.dev>
List-Subscribe: <mailto:sashiko-reviews+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:sashiko-reviews+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20260614163336.3490925-5-tabba@google.com> <20260614164547.D398B1F000E9@smtp.kernel.org>
 <CA+EHjTwHoveK6FT0CGcKuj97aUaHpv7vk=DQjRxT9c6UkkSeoA@mail.gmail.com> <86wlvxs5r0.wl-maz@kernel.org>
In-Reply-To: <86wlvxs5r0.wl-maz@kernel.org>
From: Fuad Tabba <tabba@google.com>
Date: Wed, 17 Jun 2026 13:39:14 +0100
X-Gm-Features: AVVi8Cct_ZHP1KQdVJAOvW56vMpd8WJo9KZTslpamsJbbcKsypOLTzJK376mQOM
Message-ID: <CA+EHjTzWpLBxy=Pi=K0G-9JU0cPTsGSNB4Esy+K+vFYNM0DnNw@mail.gmail.com>
Subject: Re: [PATCH 4/7] KVM: arm64: Set IL for injected FPAC exceptions
 during ERET emulation
To: Marc Zyngier <maz@kernel.org>
Cc: sashiko-reviews@lists.linux.dev, Oliver Upton <oupton@kernel.org>, 
	kvmarm@lists.linux.dev
Content-Type: text/plain; charset="UTF-8"

On Wed, 17 Jun 2026 at 13:36, Marc Zyngier <maz@kernel.org> wrote:
>
> On Mon, 15 Jun 2026 13:42:23 +0100,
> Fuad Tabba <tabba@google.com> wrote:
> >
> > On Sun, 14 Jun 2026 at 17:45, <sashiko-bot@kernel.org> wrote:
> > >
> > One thing I noticed while looking at this:
> > kvm_check_illegal_exception_return() preserves {N,Z,C,V,D,A,I,F} from
> > the current PSTATE, but the Arm ARM says these should come from
> > SPSR_ELx on an illegal exception return (EL and SP are unchanged, but
> > the flags and masks are taken from SPSR). PAN and ALLINT should also
> > come from SPSR_ELx if their respective features are implemented.
> >
> > Marc, is the current behavior intentional, or should we be
> > constructing PSTATE from the original SPSR_EL2 for those fields?
>
> This looks like a long standing bug for something we really never
> tested. I reckon the patch below would do the trick.
>
>         M.
>
> +++ b/arch/arm64/kvm/emulate-nested.c
> @@ -2746,17 +2746,29 @@ static u64 kvm_check_illegal_exception_return(struct kvm_vcpu *vcpu, u64 spsr)
>             (spsr & PSR_MODE32_BIT) ||
>             (vcpu_el2_tge_is_set(vcpu) && (mode == PSR_MODE_EL1t ||
>                                            mode == PSR_MODE_EL1h))) {
> +               u64 mask;
> +
>                 /*
>                  * The guest is playing with our nerves. Preserve EL, SP,
> -                * masks, flags from the existing PSTATE, and set IL.
> -                * The HW will then generate an Illegal State Exception
> -                * immediately after ERET.
> +                * masks, flags from the existing SPSR, and set IL (see
> +                * R_VWJHB). The HW will then generate an Illegal State
> +                * Exception immediately after ERET.
>                  */
> -               spsr = *vcpu_cpsr(vcpu);
> -
> -               spsr &= (PSR_D_BIT | PSR_A_BIT | PSR_I_BIT | PSR_F_BIT |
> +               mask  = (PSR_D_BIT | PSR_A_BIT | PSR_I_BIT | PSR_F_BIT |
>                          PSR_N_BIT | PSR_Z_BIT | PSR_C_BIT | PSR_V_BIT |
>                          PSR_MODE_MASK | PSR_MODE32_BIT);
> +
> +               if (kvm_has_feat(vcpu->kvm, ID_AA64MMFR1_EL1, PAN, IMP))
> +                       mask |= PSR_PAN_BIT;
> +               if (kvm_has_feat(vcpu->kvm, ID_AA64PFR1_EL1, NMI, IMP))
> +                       mask |= ALLINT_ALLINT;
> +               /* Account for FEAT_SPE_EXC and FEAT_TRBE_EXC one day... */
> +               if (kvm_has_feat(vcpu->kvm, ID_AA64DFR1_EL1, EBEP, IMP))
> +                       mask |= BIT_ULL(32);
> +               if (kvm_has_feat(vcpu->kvm, ID_AA64PFR1_EL1, GCS, IMP))
> +                       mask |= BIT_ULL(34);
> +
> +               spsr &= mask;

I'm on it...

Cheers,
/fuad

>                 spsr |= PSR_IL_BIT;
>         }
>
>
> --
> Without deviation from the norm, progress is not possible.
