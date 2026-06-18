Received: from mail-lf1-f42.google.com (mail-lf1-f42.google.com [209.85.167.42])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 226412BE656
	for <sashiko-reviews@lists.linux.dev>; Thu, 18 Jun 2026 14:41:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.167.42
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1781793717; cv=pass; b=XmXs9qrXD4pSZhTJ/XBp3JS2at5rvRBjJ/yZ3VT8lPrYQHOPzSX0F3mqwp1l6Y+yc9GTPFeG7niSvYlEQ2f2q3XPSLdFdjAkqFKJxFnHekDom5JB7bD7RfSRuhuhHNyWLfYmmsxWC8LoS7tAERSUAI8R3LC9i8+qd0bfkrj3t3w=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1781793717; c=relaxed/simple;
	bh=6jAMPAUU7NxAHfo3CqmuOs+a1P+DBOmdpSJ3YXon3gE=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=JRq8PBK3b74lV5iFsp8zRtFsz5cIej37jI8aH5ExD9jU36NxDOft12zhUaA0sjWtNd63TjVYIGqPluIRDs5exrpZZZAmFtU/f09cNmCYVnlcIyeUOPvcWvFdAeyW0BSZkCsDLUkEKyZdO0srusa2a6jKZl4B0lqD0paPViksQSc=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=TL9lxz6e; arc=pass smtp.client-ip=209.85.167.42
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="TL9lxz6e"
Received: by mail-lf1-f42.google.com with SMTP id 2adb3069b0e04-5ad4c101545so8896e87.0
        for <sashiko-reviews@lists.linux.dev>; Thu, 18 Jun 2026 07:41:55 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1781793714; cv=none;
        d=google.com; s=arc-20260327;
        b=lHtRg9MVMQpMfpI7AlcknML845uf8wIxYLlXQtm6Y/2mtdoCIuEjokqyF+QNA5PAn3
         nxnXoE9Tz9PA9dpADL0MlN2ANZd80zpz5128jsEmZEqo5iRjstnaDtz/AnfCqYeZp+By
         xuTP+TilunGphw+q+U/wyQmjxEcaWluSQ5dSFrx9aNdirodzhoQyV1U3l7FEfleeKeZc
         Jwqihen697OTOw8XmUYzTYZQmkeuHlTv6etkqS1aWzlPTk8iXHNaWU38usLybnXmzIPy
         rQcGKLBOtkInAndPt+CsD9HymxeqKYsikxKnVraNW4zNcjd9rQnDH3XUi0nmT6UiSqr1
         f9SA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=cyv7WmAzvj3n/08dSdKcTP0+sZKN+JUNiB8NClmfTJ8=;
        fh=vxFxEzPfV2TVZiF6T5th9UokvWy0tGwKR5SSoD4lX+g=;
        b=Fw837af3awQWEGwBK5nx3NDHDGCpZHbUk0NCM1a6wNtDO6+IXTsXy3qv2pX8NWBkig
         I0hG3U01g/IAbN2EpsgpT7zZ2Vh/UgeYe5Q9w3b6yEdMRmRiaICzd6rePFs7pj2OcMxw
         ist7mAj94WdqHt42IoMOU70bfGcna0ah/Tmb71YeNFgYXe0uDXNunWoXk86VACCucE4t
         Nk9wLQrB3hhoxugHujuD0fMqDYIWYLwdFxFRVrPWKW8FezCjRLREnpHzY6G4WJyA2/EQ
         JkdVsuWQvnR6635nXyOGvpieM/Kh/kKfGO6gy4es2f6oewzp9fukUZ/Z3Y612wd6Q4Yy
         Gt8g==;
        darn=lists.linux.dev
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20251104; t=1781793714; x=1782398514; darn=lists.linux.dev;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=cyv7WmAzvj3n/08dSdKcTP0+sZKN+JUNiB8NClmfTJ8=;
        b=TL9lxz6eLPxTxzLvqeTdvG0YejlLfimR8VsEGyPUQd9Fgnmm5roOa7e0fubnYlz9l/
         Vsresp70RgCwDVQgBVAufR7fGJyykTlQHlye+7xRwa+kgEkpQgHTnCamW6GPR4d5BRjZ
         usghkHaJjZ/4PxTS1co3Zxvt/y2VbJ0YZfgoWaSHvuE72D8jukpj7r4viP2Kq4gJ7onU
         TJhHDETcgZPUzwkXpl6nf73v6rrJrZh24YY7LnxrnFFHGnCxxap56iLuTedomfmawOcm
         EP9JJvDSRxuFLwix3wBqsqm7zqG1G1/XpRLKTyt5bkOniMwNYfWpk2FPrt11nVhUK7vO
         V/GA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1781793714; x=1782398514;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=cyv7WmAzvj3n/08dSdKcTP0+sZKN+JUNiB8NClmfTJ8=;
        b=h63O/afmRfhvvRR+vIobIstVRpEyd9qXbGP3dsxf1um44SEmPdCncgnQt2qD8uXpM/
         TGlvupI6n0tLzQ0jz6u0aSaICg6WaiZ+J+wDpREZvp6WhnBZ+8VW4LCYaew6q8tCmDoT
         E3Ogc08NdnruFzVyZHs+X4sXH4uUyf80dhJDE/lnBx2bLsNNS5PRPi2si9kvD+NkH913
         UGm4QhMV2k6cKDEefptfaLWiBH/SENmCAykvNI6A3R4ML2c1uV5FpnjWxRUmgdN/Y5u5
         ENt+EPjNMxRqL5qZkoqLmvnLlZaPvFXLGtCktWCL4+wy4rSB19FW9NVIro2lynEW2oZT
         akQw==
X-Gm-Message-State: AOJu0YyP50EpliLuFwyqSmwP0JlltEsGFiO32po5+IJNKKS4f56OFG5c
	UzELm+9iARc9R2HUuyiCZZnTGNuRW8V853Qfnbvn75cXN5vPSFyoXmqQCgOhI/PeVU3gBhNQha3
	W2FN6MUkt4FwGqtKrfWHwosRIkCe26R86Ly9xMDXauL7Kd6S3kR1Cw9Q0
X-Gm-Gg: AfdE7cnHi8NQ8sL7RvYGFns6YP6arghNKQ+msKO6zt338rV4TBqsFIzPGPpuo1bLs8F
	3d+HfHNRW2uPAIGJ0PBQqXA1AMn2OYmZNfgLazwb0xsUbaXbq4+0TnpnAkOSYMSCejP6AcCLxj7
	JkEFHdV2wzPJVxIRpcrXGQmtVTJUBLauxnhsSAWVifvceFBWKU5X5XtenfPanbEjIPHlBml8tp/
	jZmgv0vEhy6JAr7ln2yU2A5ltQo7lzVGQ9b9XcA+/VeSho2Wbg6JuFnCxUtXDwxTbOzO/x+fA==
X-Received: by 2002:a05:6512:3193:b0:5aa:4c72:8732 with SMTP id
 2adb3069b0e04-5ad4db9bc41mr182457e87.10.1781793713788; Thu, 18 Jun 2026
 07:41:53 -0700 (PDT)
Precedence: bulk
X-Mailing-List: sashiko-reviews@lists.linux.dev
List-Id: <sashiko-reviews.lists.linux.dev>
List-Subscribe: <mailto:sashiko-reviews+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:sashiko-reviews+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20260618121643.4105064-1-tabba@google.com> <20260618121643.4105064-3-tabba@google.com>
 <20260618123043.5D1C21F000E9@smtp.kernel.org>
In-Reply-To: <20260618123043.5D1C21F000E9@smtp.kernel.org>
From: Fuad Tabba <tabba@google.com>
Date: Thu, 18 Jun 2026 15:41:14 +0100
X-Gm-Features: AVVi8Cf0GaVcwzO4o9AsKmalolh1Ixou3PwA9WCiyR5ufBQEFXD4fRAnHT5wNkA
Message-ID: <CA+EHjTyiyCNV40z82=YTTMrx3BoR5gn5uh-xP80gFxX2PSUMAg@mail.gmail.com>
Subject: Re: [PATCH v2 2/7] KVM: arm64: Unconditionally set IL for injected
 undefined exceptions
To: sashiko-reviews@lists.linux.dev
Cc: Marc Zyngier <maz@kernel.org>, kvmarm@lists.linux.dev, 
	Oliver Upton <oupton@kernel.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Thu, 18 Jun 2026 at 13:30, <sashiko-bot@kernel.org> wrote:
>
> Thank you for your contribution! Sashiko AI review found 1 potential issu=
e(s) to consider:
>
> Pre-existing issues:
> - [High] Nested SError exception injection silently drops the ESR_EL2 val=
ue.
> --
>
> commit e7d1337c1e8d6db55c7b9ce2682f4c52e85c3f44
> Author: Fuad Tabba <tabba@google.com>
>
> KVM: arm64: Unconditionally set IL for injected undefined exceptions
>
> This commit simplifies the inject_undef64() exception injection path by
> unconditionally setting the IL bit, as the architecture mandates IL=3D1 f=
or
> EC=3D0 (Unknown).
>
> > diff --git a/arch/arm64/kvm/inject_fault.c b/arch/arm64/kvm/inject_faul=
t.c
> > index 89982bd3345f6..9dfae1bcdf992 100644
> > --- a/arch/arm64/kvm/inject_fault.c
> > +++ b/arch/arm64/kvm/inject_fault.c
> > @@ -170,14 +170,7 @@ void kvm_inject_sync(struct kvm_vcpu *vcpu, u64 es=
r)
> >
> >  static void inject_undef64(struct kvm_vcpu *vcpu)
> >  {
> > -     u64 esr =3D (ESR_ELx_EC_UNKNOWN << ESR_ELx_EC_SHIFT);
> > -
> > -     /*
> > -      * Build an unknown exception, depending on the instruction
> > -      * set.
> > -      */
> > -     if (kvm_vcpu_trap_il_is32bit(vcpu))
> > -             esr |=3D ESR_ELx_IL;
> > +     u64 esr =3D (ESR_ELx_EC_UNKNOWN << ESR_ELx_EC_SHIFT) | ESR_ELx_IL=
;
> >
> >       kvm_inject_sync(vcpu, esr);
> >  }
>
> [Severity: High]
> This isn't a bug introduced by this patch, but while reviewing the except=
ion
> injection changes, I noticed a pre-existing issue in the nested SError
> injection path.
>
> In arch/arm64/kvm/emulate-nested.c, kvm_inject_nested_serror() constructs
> the ESR for the nested SError and passes it down to kvm_inject_nested():
>
> arch/arm64/kvm/emulate-nested.c:kvm_inject_nested_serror() {
>         ...
>         esr |=3D FIELD_PREP(ESR_ELx_EC_MASK, ESR_ELx_EC_SERROR);
>         return kvm_inject_nested(vcpu, esr, except_type_serror);
> }
>
> However, when this esr reaches kvm_inject_el2_exception(), the value is
> silently discarded:
>
> arch/arm64/kvm/emulate-nested.c:kvm_inject_el2_exception() {
>         ...
>         switch (type) {
>         case except_type_sync:
>                 kvm_pend_exception(vcpu, EXCEPT_AA64_EL2_SYNC);
>                 vcpu_write_sys_reg(vcpu, esr_el2, ESR_EL2);
>                 break;
>         case except_type_irq:
>                 kvm_pend_exception(vcpu, EXCEPT_AA64_EL2_IRQ);
>                 break;
>         case except_type_serror:
>                 kvm_pend_exception(vcpu, EXCEPT_AA64_EL2_SERR);
>                 break;
>         ...
> }
>
> Because the except_type_serror case breaks without writing esr_el2 to
> ESR_EL2 (unlike the except_type_sync case), the constructed syndrome is
> completely dropped.
>
> Since enter_exception64() does not dynamically update ESR_ELx, will the
> guest hypervisor observe a stale ESR_EL2 when handling the injected SErro=
r?
>
> Could this cause the guest to misinterpret the error, potentially leading
> to incorrect functional behavior or a guest panic?

IL=3D1 is correct here. The architecture mandates IL=3D1 for any
Instruction Abort unconditionally, and for any Data Abort where ISV=3D0
(ARM ARM, ESR_ELx IL bit definition). IL only reflects the faulting
instruction length when ISV=3D1.

This function never sets ISV. The FSC is always EXTABT or SEA_TTW, and
FEAT_RAS mandates ISV=3D0 for any synchronous external abort. The
Address Size Fault case (kvm_inject_size_fault overwriting FSC to 0)
also has ISV=3D0 since address size faults are detected during
translation table walks with no valid instruction syndrome.

The old code copying IL from the hardware trap ESR was the bug: it
produced IL=3D0 for a 16-bit Thumb instruction, which is wrong for an
ISV=3D0 data abort.

Cheers,
/fuad


>
> --
> Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260618121643.41=
05064-1-tabba@google.com?part=3D2
