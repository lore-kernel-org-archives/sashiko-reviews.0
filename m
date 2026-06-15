Received: from mail-qt1-f176.google.com (mail-qt1-f176.google.com [209.85.160.176])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 169333F4DD8
	for <sashiko-reviews@lists.linux.dev>; Mon, 15 Jun 2026 12:43:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.160.176
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1781527386; cv=pass; b=Bn4iiBeB/sWvOdCQi5yl1IhS954zLmc8dF6AfK/kqTaM+P3/jlVMbmewcMKIBt4S04cFw44FlFO2DlsSLZZ1cLxpmzRRvzyVvog7yZaxyYyZszm41D78Zqk1dY0k/NeTvtTPpg+f+VQXHo1hmzgDYOeje7JCaeoWjrzLbbEGogw=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1781527386; c=relaxed/simple;
	bh=Bw9yLChPYY8XYNoz0p+T9zcVRoabwdPf/QVDPf9nI34=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=aKMyfyRho0lhLVNSn/vr/26hspO68FCbSzhiEC14NhOzG8ziEB2utcKZc46X0FpNipZ9wB41DmGkmfCeX4pMZo2NDxPMtijoiPtKp54evZZruWQqfqKLSXeNhS3BfK9GJ7CHugOC5b8isBrA67rSDHCHcL2dip5RBA5FqJ5KptU=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=ePXdnS1a; arc=pass smtp.client-ip=209.85.160.176
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="ePXdnS1a"
Received: by mail-qt1-f176.google.com with SMTP id d75a77b69052e-5177d1ff061so67631cf.1
        for <sashiko-reviews@lists.linux.dev>; Mon, 15 Jun 2026 05:43:01 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1781527381; cv=none;
        d=google.com; s=arc-20240605;
        b=ieEQariExzVsGODB/5EOwg/mwtgxNC/f2WPAgWmtJkyxNA9dvKg3Yc8lRpFpPNV4Wj
         vvE3ROESfe1+9YUK42U7vrAXUJIk+neVQ5fWlQ2UIUfQ4IsoiqLHkhYZOfSUB9vK5HmL
         SBYlBwEQp3EcmNjs0X5tFsIZZS6HfhTScEobP4M3NhG9jT7SK4LYkVFda19FKuSIhA4T
         7IltNPxnwLY7l0G7rTE5duTyCWFyvKdH/PKXvYFpLc+0WuYLMwjazU6t/RoUApZ2EWb5
         eWj3b5Akwm1MU0MHh0c2ihefRIMuVZqH9zUc4DPgKLcGhPwV+SNRk05qUd15zFTOH8eY
         ZDDA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=6RinZ6UVRLzqeCskT7I+XyHLStsWE+0zve+ajaQieeo=;
        fh=5NVIgO8D/OOrmMGizBrG+5Z6zuKo+gTS/PJhUJkF/vU=;
        b=OGAZP6Za2+kCYbKbBpVqeIBNsLi5uXiClqR7m2VbtITYFa67OqGyj75JlCVBlsIi3Y
         wc856y8lDmxVPWebvuIgMQDVUln4jGfxI/Ktk3n+u6TSD02VKZEDTDPi/fFl4w5/UVVb
         YVXKbOLXh3d6mHq6SSh1tTSIosLNJVREzl+8YS/a37rs2q4LJSdJJU1lqG6OA0RvUnHs
         vZOZVG7waqoqACE3dcjkM1OWtA3Zv4EJ/lEm2ufVZw7eSYofNGL3xlKPSmBNNGD7T1Yu
         S6Qcp76tUtmD4LkMUm4SSiwczXoEXAUSesOJIEOE+jOLdZ23Itg+kth85Xur17/LyDGP
         1hBw==;
        darn=lists.linux.dev
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20251104; t=1781527381; x=1782132181; darn=lists.linux.dev;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=6RinZ6UVRLzqeCskT7I+XyHLStsWE+0zve+ajaQieeo=;
        b=ePXdnS1abGdotB4EFVNEsCmzxVchAP5NmJmeOJenTlVX4l9OATfLOyEP70O9Hv8xzO
         ii2dvBAEVoXblAFQC/IXxRgz4mR/YwEhxqvjavNq6g6D+nvis8n9eggVNl83MfaS2hvt
         G+Gd/MskI9LlH0oA5We2+ip64twjX5e22rWzAy0BTIBh35sojQstrcpFo/NFmeaIBLHF
         7TyZa/3Yzoqnql+yGboPakSsPlkrZVyUex8bq80453JGlOazOipMY/N9II3Df/asQ35L
         dDHgvVS/21Qu19DZqNDaWPGIHAV5jg8y3pLl5foPc378x3j6LcxldGkpaNPE6eQ/lSlm
         3sBA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1781527381; x=1782132181;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=6RinZ6UVRLzqeCskT7I+XyHLStsWE+0zve+ajaQieeo=;
        b=hGWC5xG+3+zxZ38kAL4Gr+XRbas3YbC4/cQ5/jFT1lcR6B+BlSdO2AoGSJxIHG0xTA
         OB4nCLQuim9coQywfzqTGF+Y8teZplrQEyh44r5lsIH1hpvMFvy48RBDwe1BNR4MnWaU
         zPDhdMunBqRl8V2jfXHF4n7FJb3PqhKr4y7k9f+3IIyhuiMxNXj5r36saPgQU2obvCI6
         tKB2y3vHpnN6mcYxjdMEyG+1oZVkk/rzFM8CSZyUoVJ4xu3skjaiQoZjMLd9fN+sNqpp
         v6pRBLOdmoD7y3/6xLeC6W6YC+uAWm8YO1DIwEbnhMyUEIbEaVabJp5s4j3JCkjl4ZKO
         cSeA==
X-Gm-Message-State: AOJu0YwQUDZyPzEDlDZKiUkw/HeqxL1BbzqgwQPDFisL60eFoOGzyAm/
	xnD5Vr6ylzyrVtkoio9qpe0aWwpmlMWARaEyKIJaQXsL0i+gnsEPyjCz4HESzjVFBG0aidND6KN
	yjEprOBNpn9i30MtfL+vgqMcWjRkoOyf7O1cW8FMg/lqHjgYro41t1yNbxgk=
X-Gm-Gg: Acq92OFFN/3ijj9QrkLECLFWRk/1+xuTtXpp6oCIBX76NIrPEnWxNOA55Eu7EMbeNUE
	ypZfhX4xf8gQsD5x1tPdFf+yKURcrPTYzZbHKkWUkg0jeqy+h+BZWOawvMaLYtRGJFkP7GxcZhb
	K3VlZb9xobMvT4iUjEBwXyQGGrKnv8KtgiyFW/8zRgh3a+7xQ9+AplKWRWK2f4CjUNNOBGhMLJK
	gj+H/KPeZkPctt1eW5Aj7KFjEUzFhG4QSRd3ptlXDpBDNNxgYVEBXA+O54BlfEgWdCATiI0UMHw
	MHKTnTd/
X-Received: by 2002:a05:622a:4f:b0:517:6488:904a with SMTP id
 d75a77b69052e-5198752b4damr1402741cf.20.1781527380134; Mon, 15 Jun 2026
 05:43:00 -0700 (PDT)
Precedence: bulk
X-Mailing-List: sashiko-reviews@lists.linux.dev
List-Id: <sashiko-reviews.lists.linux.dev>
List-Subscribe: <mailto:sashiko-reviews+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:sashiko-reviews+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20260614163336.3490925-5-tabba@google.com> <20260614164547.D398B1F000E9@smtp.kernel.org>
In-Reply-To: <20260614164547.D398B1F000E9@smtp.kernel.org>
From: Fuad Tabba <tabba@google.com>
Date: Mon, 15 Jun 2026 13:42:23 +0100
X-Gm-Features: AVVi8Cdrb9YQfLGPkc6Ljw1y0SYp8HnSvtrsJjbiTklgs9sQgOb93MYz_1Urvhg
Message-ID: <CA+EHjTwHoveK6FT0CGcKuj97aUaHpv7vk=DQjRxT9c6UkkSeoA@mail.gmail.com>
Subject: Re: [PATCH 4/7] KVM: arm64: Set IL for injected FPAC exceptions
 during ERET emulation
To: sashiko-reviews@lists.linux.dev
Cc: Marc Zyngier <maz@kernel.org>, Oliver Upton <oupton@kernel.org>, kvmarm@lists.linux.dev
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Sun, 14 Jun 2026 at 17:45, <sashiko-bot@kernel.org> wrote:
>
> Thank you for your contribution! Sashiko AI review found 1 potential issu=
e(s) to consider:
>
> Pre-existing issues:
> - [High] Incorrect Emulation of Illegal Exception Return corrupts ELR_EL2=
 and may cause spurious Instruction Aborts
> --
>
> commit 56bc216de713f5bf0e45ff5ad97580cbdc7eeb66
> Author: Fuad Tabba <tabba@google.com>
>
> KVM: arm64: Set IL for injected FPAC exceptions during ERET emulation
>
> This commit fixes the FPAC syndrome constructed during nested ERET
> emulation to include the IL bit. It ensures that the IL bit is set to 1
> for ERET and its authenticated variants, which are always 32-bit A64
> instructions.
>
> > diff --git a/arch/arm64/kvm/emulate-nested.c b/arch/arm64/kvm/emulate-n=
ested.c
> > --- a/arch/arm64/kvm/emulate-nested.c
> > +++ b/arch/arm64/kvm/emulate-nested.c
> > @@ -2777,7 +2777,7 @@ void kvm_emulate_nested_eret(struct kvm_vcpu *vcp=
u)
> >                */
> >               if (kvm_has_pauth(vcpu->kvm, FPACCOMBINE) && !(spsr & PSR=
_IL_BIT)) {
> >                       esr &=3D ESR_ELx_ERET_ISS_ERETA;
> > -                     esr |=3D FIELD_PREP(ESR_ELx_EC_MASK, ESR_ELx_EC_F=
PAC);
> > +                     esr |=3D FIELD_PREP(ESR_ELx_EC_MASK, ESR_ELx_EC_F=
PAC) | ESR_ELx_IL;
> >                       kvm_inject_nested_sync(vcpu, esr);
> >                       return;
> >               }
> >       }
> >
> >       preempt_disable();
> >       vcpu_set_flag(vcpu, IN_NESTED_ERET);
> >       kvm_arch_vcpu_put(vcpu);
> >
> >       if (!esr_iss_is_eretax(esr))
> >               elr =3D __vcpu_sys_reg(vcpu, ELR_EL2);
> >
> >       trace_kvm_nested_eret(vcpu, elr, spsr);
> >
> >       *vcpu_pc(vcpu) =3D elr;
> >       *vcpu_cpsr(vcpu) =3D spsr;
>
> [Severity: High]
> This is a pre-existing issue, but does setting the PC to the target addre=
ss
> here cause issues when an illegal exception return is detected?
>
> If kvm_check_illegal_exception_return() previously detected an illegal re=
turn
> and set PSR_IL_BIT in spsr, kvm_emulate_nested_eret() unconditionally
> advances the guest PC to the ERET target address (elr) and returns to the
> guest, relying on hardware to generate the Illegal Execution State except=
ion.
>
> Wouldn't the hardware then save the target address into the guest's ELR_E=
L2
> instead of the faulting ERET address, corrupting the architectural state?
>
> Additionally, since the hardware fetches the instruction at the target ad=
dress
> using the guest EL2 translation regime before execution, an unmapped or
> unexecutable target address could trigger an Instruction Abort instead of=
 the
> required Illegal Execution State exception, per ARM ARM D1.8.2.
>
> Could this result in the guest hypervisor receiving a spurious Instructio=
n
> Abort for an EL1/EL0 address?

Not a bug. On an illegal exception return, the Arm ARM specifies that
PC is set to ELR_ELx unconditionally. The subsequent Illegal Execution
State exception is taken at the target PC, so ELR_ELx is saved with
the target address. This is architecturally correct.

Similarly, an Instruction Abort at an unmapped target would take
priority over the Illegal Execution State exception, which is also
correct behavior.

One thing I noticed while looking at this:
kvm_check_illegal_exception_return() preserves {N,Z,C,V,D,A,I,F} from
the current PSTATE, but the Arm ARM says these should come from
SPSR_ELx on an illegal exception return (EL and SP are unchanged, but
the flags and masks are taken from SPSR). PAN and ALLINT should also
come from SPSR_ELx if their respective features are implemented.

Marc, is the current behavior intentional, or should we be
constructing PSTATE from the original SPSR_EL2 for those fields?

Cheers,
/fuad

>
> --
> Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260614163336.34=
90925-1-tabba@google.com?part=3D4
