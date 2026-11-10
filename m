Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.208.47
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1794281433;
	b=hDxGPxmITUF3SjtbPIxzWOeyrtSL79+jzKbgNYlIvgJwlj3+Bbn42nRSoOeQX5IvJXnE
	 0oYadpUoAMvK32GF6xHyQV0JC3W31gno2uJJV2j8fu5VARLN+sKpdt2uhPvQKyEdUw99x
	 c2MtTTN3FnlQwiqYp8KY9vV6Qh35I4LLBKILzXVF62sdJZTvIGFEXUBfTDuph2AD4SHV5
	 rMvjAg4yUL2odKicL9N7jt7yv2VoNYh0un9zIp7Qn0aMDJTrNHzDcUh/qFVOxxuJR1mCD
	 LNgIsz2QTKekWuOUNAXKKDRjckrLMrfskzZIgYq0U3/kplDYDLF4oss2bx8e/qNXH0g==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794281433;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:MIME-Version:References:
	 In-Reply-To:From:Date:X-Gm-Features:Message-ID:Subject:To:Cc:
	 Content-Type:Content-Transfer-Encoding;
	bh=4qRqqhKQqWrrboy8HsAud/37m8y92m/NCTDkQF7hqO0=;
	b=TOgTuB4YbUNeVsPHcW4jhSCWtS70ysoEbypCmr/O5mmdgDBC0WjLleQK8nX/h6QyKCPk
	 dTWcKAYwLr94n0sf29JkLs/Ti6W1JQXDCCkIIYR4f6JCpPWWhCcU8SCkE8X8audtV6ugJ
	 VSuGOJj2gBUMVSdAf83BoH4LKTxYlcoiFDJY+HM3VdrjzWc3IsUD5q+A+xi5bGncOgwhw
	 BGAo2G+XpV3hdii0of3Yi6Jwh6UxvKUMWs8jvWtgtIvCQcrSWuQclA8Bd8eEPlpJCioTK
	 Ace7Nf3XXSK3ZPy6NPY3yU9QspkuU6igrUJzr0kOdVLEc9pE39BI3BdGiSP0bWUb7EQ==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=google.com;
	spf=pass smtp.mailfrom=google.com;
	dkim=pass header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20260707 header.b=RF99D3He;
	arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.208.47
Received: from mail-ed1-f47.google.com (mail-ed1-f47.google.com [209.85.208.47])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 58B8D606A325
	for <sashiko-reviews@lists.linux.dev>; Tue, 10 Nov 2026 03:30:33 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 58B8D606A325
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20260707 header.b=RF99D3He
Received: by mail-ed1-f47.google.com with SMTP id 4fb4d7f45d1cf-6b56c90b38eso6955a12.0
        for <sashiko-reviews@lists.linux.dev>; Mon, 09 Nov 2026 19:30:33 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1794281432; cv=none;
        d=google.com; s=arc-20260327;
        b=YHA59DqaMUCSMSJWIc32wwAVhbqtRkstykAsSQ74WvFihvtj/NjapR54WqoSoIOVKz
         kKwLdrBJB9z1wW7pBZw6dM2g1MxKreRleEhW/23RvOTn2HZ+y/hZJ/Ffc+xY07brQNnS
         2tmHPg/2s+nppBaLTvFmmAL99SBWx0mJLwRdGlm8lPa27Z/y0Y1XQOo2fybpa/i63MnU
         k42S/Ow2Ro4RGdoYiSM2ENzX/MNW44rIRFZAoq8A2mFulNrewUa8TNUhF3laeLGExmOP
         +917cVj2XPSp00takTWS4fxzub4FFt9OC4B5eACx78r/98RuBKJjQX2YKjbhHeeLmNh4
         t8Mg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=4qRqqhKQqWrrboy8HsAud/37m8y92m/NCTDkQF7hqO0=;
        fh=fItrUtV5UsY1KSNx1ZNnzv3miYMbODbRRQWQ18AP5Zc=;
        b=K8N/kiG/sIqsZ60x1OnOxnbvS1AA6Xl8rPcySKqK+W3+Cdoz05DaLiqdgikZUyAtIj
         QA4a75IBpw+vRSE+wVrdJ4EdcymBcHuQmaOOa4nt4Oq6ygqtIkVaTyxBwxvAjooaq558
         rdmkjcb39i8sPiuhNi6jEyiS5cCGeFOx1ztiZ3tODZi/1oensu5ZaRYxI5AUt0acPdvE
         3TF0z+QwC2QhsBPkDSZIa9MtW9Gnmh0o8+fF5Cv+RsVBbIuq4cX4wWC5r67u5IwgjVjv
         /fbA0lY0pJgFtNNxP4hsz56cq35z5tej0shv496uz1Nwzf+6I0I8pn4jIMMy1dVIXU9M
         de3g==;
        darn=lists.linux.dev
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20260707; t=1794281432; x=1794886232; darn=lists.linux.dev;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=4qRqqhKQqWrrboy8HsAud/37m8y92m/NCTDkQF7hqO0=;
        b=RF99D3He8oMesRxZ7YbDxz2UPcGEL/oawGCwO+M0/jNVsHTefvfOTb4Yuu6P9piZkI
         l5olOolGmS20JRr8R8z0aCU9kj3IOBCIGWkVr7HvWwFPrKnE0xPzT7lQ/WyLit764Fu0
         nGWXy7FYKhnogt4EJ/oJlNEFfxUpIEDlJ8KT4VGQxgDErmJZNI2UZ2b1GN9vt41NwR6t
         Pvi8noP9vrD1ZmCpRLuRedJba0fpjSYRUndwO1x5PRIGvpHdkHI9E3Hp+VbnWfRBCF3B
         U2fgU/bF3sqb27XfCPOcx3dJ4sfifwIWOYCfdklZWxGZK19FO4Gvkt4TvYdlWzZhonn9
         zvvQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794281432; x=1794886232;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=4qRqqhKQqWrrboy8HsAud/37m8y92m/NCTDkQF7hqO0=;
        b=dAD3HMocKfFZaPtMjqPnoEdIjS6wh/2qBFnM+jHlWEEFQyfgu12Wir5s8TDTvD9GTt
         Z5LyDe9tmP9PWz8DQe9xBhrkZfMz1CtCkqbuu+QZJxVJWkQLzXacAwG9YAJov7blrks7
         asG5hHzt2s8RWVGUxDaFv6/ZZKjRjSOeDDw/FhCLqtiW7M4DFxSfc9wFkuFQJ5/V6CSG
         gqVAWrTU6oXGcklImH6pwxx5XB697JN+P2/zajA4uWXagldBb/M/VUkt5Iji/L3XHnCw
         IvHkvcXVdsz+XobEC8bzh1vQbNRN8XTqj31vBrozUHTh3VssBmtD5oDAbfleyG5oA750
         wCYw==
X-Gm-Message-State: APuU4Z+HyI4BDLr1fZAGnggWt7TUkaUPfLEfOhRuvRYcraEjKEhSeum2
	YBYZX4ay8meOZb1r0r2JZUGVf9G8na6FQ4ONALkO8LVtlCBniS1zAhUxG4AVLoXLmGnfs+L+ROH
	+arVad6ovhadmZst/3PFYwtsYcZm1GOFc3OWLE7spCz30a3v8ZxjnCXIXOQc=
X-Gm-Gg: AYBFou17J4GODehp48b58iJ+8BZsS6jGCgDBVkXFuhX+JH+1khBpI+AAaU5gMPt5GWK
	lGqyGTWdGDLYutfZ8FJ9893oKS/6f/eCPGwywkJihAwTuROSDYYjU8J/hxji05XFUSWkP3p5kWc
	uB7g6kNHH+Xm0610myAMK8ACaOokUZJoD+S7GuUyYMH6GOcB1yEPmMtpfSTwsFzx7jmQdBQj24Q
	XYJO+aehJd0/W9B7+PTo/53JiO6WE4nyIwXJcbkj1ollXzjCMnqt6EqYyH8XYfI+JRzRNsjH0Ln
	cC0KIimXXcc9Y9k3ZZjpEr1vYXGz6MjHHbg1zskfxd4mLqzN4A1LGKvOPox3pcIxksp/GNfJKlN
	jAXN0xwgsVhmzLI7cfoJ9sdiB+ADn1vvjEz6l25Y4KbMOJiJMyAdslJ5vKyiO2n9sCqXMNLmb
X-Received: by 2002:a05:6402:a2c8:20b0:6b1:a517:5bce with SMTP id
 4fb4d7f45d1cf-6b75a7c6522mr28354a12.16.1794281431344; Mon, 09 Nov 2026
 19:30:31 -0800 (PST)
X-Mailing-List: sashiko-reviews@lists.linux.dev
List-Id: <sashiko-reviews.lists.linux.dev>
List-Post: <mailto:sashiko-reviews@lists.linux.dev>
List-Help: <mailto:sashiko-reviews+help@lists.linux.dev>
List-Subscribe: <mailto:sashiko-reviews+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:sashiko-reviews+unsubscribe@lists.linux.dev>
List-Owner: <mailto:sashiko-reviews+owner@lists.linux.dev>
Precedence: list
MIME-Version: 1.0
References: <20261110004037.125692-1-jmattson@google.com> <sashiko-outbox-205939@kernel.org>
In-Reply-To: <sashiko-outbox-205939@kernel.org>
From: Jim Mattson <jmattson@google.com>
Date: Mon, 9 Nov 2026 19:30:19 -0800
X-Gm-Features: AclHuK_t2oHdnmeVqgjWcz_GKdX1UpYOLcrSY1YQYKpKAAI9ePQZ2Ojqfb1wqFw
Message-ID: <CALMp9eS9reJ07aYs3THr7oboWqw3Ji=Pv_LyvzVpuW4DmLN_TA@mail.gmail.com>
Subject: Re: [PATCH] KVM: nSVM: Add missing CET VMRUN consistency checks
To: sashiko-reviews@lists.linux.dev
Cc: kvm@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Mon, Nov 9, 2026 at 5:07=E2=80=AFPM <sashiko-bot@kernel.org> wrote:
>
> Thank you for your contribution! Sashiko AI review found no new issues
> in this patch, but noticed 1 related pre-existing issue it does not
> introduce:
> - [High] KVM: nSVM: vCPU left in guest mode when enter_svm_guest_mode()
>   fails in RSM [1]
> --
>
> commit b87b2411f4552cf28fa62d1f5b9a2e342f4694d4
> Author: Jim Mattson <jmattson@google.com>
>
> KVM: nSVM: Add missing CET VMRUN consistency checks
>
> This commit adds software VMRUN consistency checks for illegal CET state
> combinations in nested_vmcb_check_save() so that invalid states trigger a
> nested #VMEXIT to L1 instead of KVM_EXIT_FAIL_ENTRY.
>
> > diff --git a/arch/x86/kvm/svm/nested.c b/arch/x86/kvm/svm/nested.c
> > index f9090b601efaa..a3affdbc15c24 100644
> > --- a/arch/x86/kvm/svm/nested.c
> > +++ b/arch/x86/kvm/svm/nested.c
> > @@ -469,6 +469,21 @@ static bool nested_vmcb_check_save(struct kvm_vcpu=
 *vcpu,
> >       if (CC(!__kvm_is_valid_cr4(vcpu, save->cr4)))
> >               return false;
> >
> > +     if (CC((save->cr4 & X86_CR4_CET) && !(save->cr0 & X86_CR0_WP)))
> > +             return false;
> > +
> > +     if (guest_cpu_cap_has(vcpu, X86_FEATURE_SHSTK) &&
> > +         CC(!kvm_is_valid_u_s_cet(vcpu, save->s_cet)))
> > +             return false;
> > +
> > +     if ((save->cr4 & X86_CR4_CET) && (save->rflags & X86_EFLAGS_VM)) =
{
> > +             u64 u_cet =3D 0;
> > +
> > +             if (!__kvm_emulate_msr_read(vcpu, MSR_IA32_U_CET, &u_cet)=
 &&
> > +                 CC(u_cet & CET_SHSTK_EN))
> > +                     return false;
> > +     }
> > +
> >       if (CC(!kvm_valid_efer(vcpu, save->efer)))
> >               return false;
>
> [Severity: High]
> This problem wasn't introduced by this patch, but can nested_vmcb_check_s=
ave()
> allow an illegal save->cr3 through on RSM and leave the vCPU stranded in
> guest mode [1]?
>
> nested_vmcb_check_save() only checks save->cr3 with kvm_vcpu_is_legal_cr3=
()
> when both EFER_LME and X86_CR0_PG are set.  When resuming an L2 guest fro=
m
> SMM with either bit clear and save->cr3 bits set beyond MAXPHYADDR,
> svm_leave_smm() passes nested_svm_check_cached_vmcb12() and calls
> enter_svm_guest_mode():
>
> arch/x86/kvm/svm/nested.c:enter_svm_guest_mode() {
>         ...
>         svm_switch_vmcb(svm, &svm->nested.vmcb02);
>         nested_vmcb02_prepare_control(svm);
>         nested_vmcb02_prepare_save(svm);
>
>         ret =3D nested_svm_load_cr3(&svm->vcpu, svm->nested.save.cr3,
>                                   nested_npt_enabled(svm), from_vmrun);
>         if (ret)
>                 return ret;
>         ...
> }
>
> nested_svm_load_cr3() unconditionally checks kvm_vcpu_is_legal_cr3() and
> returns -EINVAL before kvm_init_mmu() runs, after the vCPU has already
> switched to vmcb02, set HF_GUEST_MASK, and pointed vcpu->arch.mmu at
> guest_mmu.  Because emulator_leave_smm() returns X86EMUL_UNHANDLEABLE
> immediately when leave_smm() fails, it skips the kvm_leave_nested() clean=
up
> at the end of the function, leaving the subsequent KVM_REQ_TRIPLE_FAULT t=
o
> run in guest mode with an uninitialized guest_mmu and un-restored SMM sta=
te.

Thank you for the review. I believe that Paolo is already addressing
this issue in https://lore.kernel.org/all/20261102174130.8779-2-pbonzini@re=
dhat.com.
