Received: from out-182.mta0.migadu.com (out-182.mta0.migadu.com [91.218.175.182])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5555A41DEE2
	for <sashiko-reviews@lists.linux.dev>; Mon,  6 Jul 2026 11:48:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=91.218.175.182
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783338529; cv=none; b=fxTMqNnDDqcADBYeg2qxXLB6K/PA5klnhk1TQ1l7Xerzw7EcWvEa0rNt9qwLc3SyPkPLaDHS6oRoGCvkATXKGqo3Zsic6EO8TsP6YOlaWmHM1sNFnizdFCnfn23K+qF6lNAsFEObuLKF3B1jul5McfhMN0jUdiXD7Xd87q0SCu0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783338529; c=relaxed/simple;
	bh=fe0Rz8nHynEhV/ZZ3U6JZCje8MBT7WJE6lk7gAhdFl8=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=Nif+G5ieduHDgsI7cnRutxM4NgyZttQDQ2sEZFamH6bZ0cwAp99AOY5kFyvNjuTzUIJBFeflZgJlKOZQNTJJvgufG9kVTE7uVt7yXRTMOxlNwpHRwvNOdZHZ4c1rWPNnuR4DcyWK+YpIveOi7eOxPwLTZ/CX6EkBxXg7AKhhQDE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.dev; spf=pass smtp.mailfrom=linux.dev; dkim=pass (1024-bit key) header.d=linux.dev header.i=@linux.dev header.b=j2jF2DhK; arc=none smtp.client-ip=91.218.175.182
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.dev
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.dev
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linux.dev header.i=@linux.dev header.b="j2jF2DhK"
X-Gm-Message-State: AOJu0YzXL2vj1ABzXowKCADatuKfkZEGdcnhAUmK+DbBvFbdfYrIIE/t
	jIZxVPyM4crcXlaBvnYWQYpEegcxic1UVAP0Mo0VF4Gym3MfPhIKsmWObu1gww/4X8A5ASV6P5/
	JloRLMM4V0QKuuxGTHMS0PrSu+vWFxqM2uFICdvIS
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linux.dev; s=key1;
	t=1783338525;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=olPZygbLOizmTmPPUlNgqgJKSwcw8Tk5/Z/jDgCDUwQ=;
	b=j2jF2DhKhazC8gJkJmxCECwVrenwpRbqN4gTy/+q8DQVPoclOKFWPIh/NA2cZdMss5T0X4
	lktG7TABKoXDiF6yIMNCddz8YK+sOPaig1AdoTda+jZiIAmHteAszE7vDZK3BGDbg1LD6e
	OYDg6lCMaiUy1eYODlas7KZ746vEiEg=
X-Received: by 2002:a05:622a:b:b0:51c:ca9:3d17 with SMTP id
 d75a77b69052e-51c4c0c00demr17821591cf.12.1783338522321; Mon, 06 Jul 2026
 04:48:42 -0700 (PDT)
Precedence: bulk
X-Mailing-List: sashiko-reviews@lists.linux.dev
List-Id: <sashiko-reviews.lists.linux.dev>
List-Subscribe: <mailto:sashiko-reviews+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:sashiko-reviews+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20260706095927.560795-1-fuad.tabba@linux.dev> <20260706095927.560795-3-fuad.tabba@linux.dev>
 <20260706102503.63AD01F000E9@smtp.kernel.org>
In-Reply-To: <20260706102503.63AD01F000E9@smtp.kernel.org>
X-Report-Abuse: Please report any abuse attempt to abuse@migadu.com and include these headers.
From: Fuad Tabba <fuad.tabba@linux.dev>
Date: Mon, 6 Jul 2026 12:48:04 +0100
X-Gmail-Original-Message-ID: <CA+EHjTxaG6_CWU0OQkmsiaDKJjdaCVokwh42msKbJoHhK2n2Vg@mail.gmail.com>
X-Gm-Features: AVVi8Cfj4xOt_3SERBm8sssTrFAt_HqnKSgE08h1ZpdRK28j9UUStRw5TIp64n4
Message-ID: <CA+EHjTxaG6_CWU0OQkmsiaDKJjdaCVokwh42msKbJoHhK2n2Vg@mail.gmail.com>
Subject: Re: [PATCH v4 2/8] KVM: arm64: Make vcpu_{read,write}_sys_reg
 available to HYP code
To: sashiko-reviews@lists.linux.dev
Cc: Oliver Upton <oupton@kernel.org>, Marc Zyngier <maz@kernel.org>, kvmarm@lists.linux.dev
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Migadu-Flow: FLOW_OUT

On Mon, 6 Jul 2026 at 11:25, <sashiko-bot@kernel.org> wrote:
>
> Thank you for your contribution! Sashiko AI review found 1 potential issu=
e(s) to consider:
>
> Pre-existing issues:
> - [High] `kvm_vcpu_read_sys_reg()` and `kvm_vcpu_write_sys_reg()` are fun=
damentally unsafe for nVHE EL2 emulation (e.g., during `fixup_guest_exit`),=
 despite the commit claiming they are "valid in any context".

    https://lore.kernel.org/all/20260612102347.914994-1-tabba@google.com/

/fuad

> --
>
> commit 61ee8756572b776a9170ae13bb7ede91ed5afb18
> Author: Fuad Tabba <fuad.tabba@linux.dev>
>
> KVM: arm64: Make vcpu_{read,write}_sys_reg available to HYP code
>
> This commit moves the wrappers for vcpu_read_sys_reg and vcpu_write_sys_r=
eg
> from exception.c to kvm_emulate.h as kvm_vcpu_read_sys_reg and
> kvm_vcpu_write_sys_reg. This makes them available to all hyp code so that
> emulation logic can be shared at EL2.
>
> > diff --git a/arch/arm64/include/asm/kvm_emulate.h b/arch/arm64/include/=
asm/kvm_emulate.h
> > index 5bf3d7e1d92c7..80b30fead3d16 100644
> > --- a/arch/arm64/include/asm/kvm_emulate.h
> > +++ b/arch/arm64/include/asm/kvm_emulate.h
> > @@ -506,6 +506,22 @@ static inline unsigned long kvm_vcpu_get_mpidr_aff=
(struct kvm_vcpu *vcpu)
> >       return __vcpu_sys_reg(vcpu, MPIDR_EL1) & MPIDR_HWID_BITMASK;
> >  }
> >
> > +static inline u64 kvm_vcpu_read_sys_reg(const struct kvm_vcpu *vcpu, i=
nt reg)
> > +{
> > +     if (has_vhe())
> > +             return vcpu_read_sys_reg(vcpu, reg);
> > +
> > +     return __vcpu_sys_reg(vcpu, reg);
> > +}
>
> [Severity: High]
> This is a pre-existing issue, but are these accessors actually safe for n=
VHE
> EL2 emulation? The commit message claims they are valid in any context, b=
ut
> during early exit handling (like fixup_guest_exit), the live guest state =
is
> still in hardware registers.
>
> Because has_vhe() evaluates to false in nVHE EL2, kvm_vcpu_read_sys_reg()=
 falls
> back to reading the memory context via __vcpu_sys_reg(). This means it re=
ads
> stale state until __sysreg_save_state_nvhe() runs.
>
> For example, when an exception is injected into a protected guest via
> inject_sync64(), enter_exception64() uses this helper to read SCTLR_EL1 a=
nd
> computes the new PSTATE from it. This reads a stale SCTLR_EL1, potentiall=
y
> corrupting the injected PSTATE.SPAN and PSTATE.SSBS bits.
>
> Could exposing these as generic helpers lead to more traps where EL2 code
> accidentally reads stale memory-backed sysregs before they are synced?
>
> --
> Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260706095927.56=
0795-1-fuad.tabba@linux.dev?part=3D2
