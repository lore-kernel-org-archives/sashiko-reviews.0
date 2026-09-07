Received: from mta0.migadu.com (out-235.mta0.migadu.com [91.218.175.235])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 21C08448393
	for <sashiko-reviews@lists.linux.dev>; Mon,  7 Sep 2026 09:12:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=91.218.175.235
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788772351; cv=none; b=ukxk4Z2ECAzstPXS+EiL3pULDoHOjwccIFZzmF2vql/57ZO3nJ++BuWL1MpcpLl1ahNGT6cBjVoudkkv28S7VFXsVcJSTN2ZB3io9KQfrfubPl6vuh1nhdyB1igYmHtSrz5bL1OEBqhT1F84baWkuXhuJhcaF6sDbLEqvwl+2P0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788772351; c=relaxed/simple;
	bh=m5upJ1SWSf4KAgqhBc2GKFg4B6UurZsIgZcCshsGSfk=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=OR9htcIAxxaPruLZ8MrT5C8PI6Db2KmLz2FfUeudjMzX2eGHoaTyaBadISWMLoanuL3ZYHbLUgWnTdMyozqwvRoutESyWULnPe8rv6L0jvJ0/eV4VWOOROL+2qEWp/fLohHBF0okY0ervN6pcSnTKkVifl6QkHwpHn5C2aWKEOI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.dev; spf=pass smtp.mailfrom=linux.dev; dkim=pass (1024-bit key) header.d=linux.dev header.i=@linux.dev header.b=au9iQ6dI; arc=none smtp.client-ip=91.218.175.235
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.dev
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.dev
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linux.dev header.i=@linux.dev header.b="au9iQ6dI"
X-Envelope-To: sashiko-reviews@lists.linux.dev
DKIM-Signature: a=rsa-sha256; bh=m5upJ1SWSf4KAgqhBc2GKFg4B6UurZsIgZcCshsGSfk=;
 c=simple/simple; d=linux.dev;
 h=from:to:subject:date:message-id:mime-version:content-type; s=key1;
 t=1788772347; v=1; x=1789377147;
 b=au9iQ6dIvutuhESWLAKHQARCYuKIX6cBb6P5Ic4i8FZhlEIF8Waigsp+SelPbxsV3YBbZDnt
 Lxa/lCJgiZAb1pQh15jtTBmzVmNk8KgTHTz62Pi95trimlmoO8Xz/c4peoxwc/XUtrwmKtENqFg
 XrsTGyOOBkZ22/1yCiUiTLRQ=
X-Envelope-To: sashiko-reviews@lists.linux.dev
Received: by smtp.migadu.com with ESMTPS id c92ecf8b1e99aa66;
	Mon, 07 Sep 2026 09:12:27 +0000
X-Mizu-Trace-ID: c92ecf8b1e99aa66
X-Migadu-Flow: FLOW_OUT
Received: by mail-lf2-f12.google.com with SMTP id 2adb3069b0e04-5b4a0b384c4so6888e87.1
        for <sashiko-reviews@lists.linux.dev>; Mon, 07 Sep 2026 02:12:23 -0700 (PDT)
X-Gm-Message-State: AFuF++n9HKghCEvQCncNER5nzrPsb8YmPISj70yGiop4qDZLdztyMGHf
	cY9k5MxC0/eKducaMmdNjWAzF6enzgP+SUfrvP0ePWiZI7Z8oUjLfFIRILCbkbsM83SnmUQquMo
	e3w4txSiTBgwYWQLv0K0MnIMmiJuXH+nvBvO+nmY6
X-Received: by 2002:a05:6512:3d24:b0:5b5:e890:1953 with SMTP id
 2adb3069b0e04-5b74d3f2031mr126511e87.12.1788772342236; Mon, 07 Sep 2026
 02:12:22 -0700 (PDT)
Precedence: bulk
X-Mailing-List: sashiko-reviews@lists.linux.dev
List-Id: <sashiko-reviews.lists.linux.dev>
List-Subscribe: <mailto:sashiko-reviews+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:sashiko-reviews+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20260907070002.3333525-1-fuad.tabba@linux.dev>
 <20260907070002.3333525-5-fuad.tabba@linux.dev> <20260907072331.A66021F00A3A@smtp.kernel.org>
In-Reply-To: <20260907072331.A66021F00A3A@smtp.kernel.org>
From: Fuad Tabba <fuad.tabba@linux.dev>
Date: Mon, 7 Sep 2026 10:11:45 +0100
X-Gmail-Original-Message-ID: <CA+EHjTxvZXgAcdteJGBKN8mTMm0fu+Z8J5DZzN5KGzBfve_25w@mail.gmail.com>
X-Gm-Features: AcwNN1Wnh4tM_Q8WLCYpMkifhYqafgk5esWxc5PS649ZvzFiMI6o4z-L6LN_zog
Message-ID: <CA+EHjTxvZXgAcdteJGBKN8mTMm0fu+Z8J5DZzN5KGzBfve_25w@mail.gmail.com>
Subject: Re: [PATCH v2 04/17] KVM: arm64: Skip fixed-feature state flush for
 protected vCPUs
To: sashiko-reviews@lists.linux.dev
Cc: kvmarm@lists.linux.dev, Oliver Upton <oupton@kernel.org>, 
	Marc Zyngier <maz@kernel.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Mon, 7 Sept 2026 at 08:23, <sashiko-bot@kernel.org> wrote:
>
> Thank you for your contribution! Sashiko AI review found 1 potential issu=
e(s) to consider:
> - [High] State Leak and Host Integrity Bypass via Unswitched Debug Regist=
ers for Protected vCPUs

Not this one, Sashiko.

...

> [Severity: High]
> Does this early return in flush_debug_state() in
> arch/arm64/kvm/hyp/nvhe/hyp-main.c bypass the debug register context swit=
ch
> for protected guests?
>
> By returning early here, hyp_vcpu->vcpu.arch.debug_owner is never updated
> from the host and remains at its default VCPU_DEBUG_FREE. During the worl=
d
> switch, __debug_switch_to_guest_common() and
> __debug_switch_to_host_common() return early if debug_owner =3D=3D FREE.
> Consequently, KVM bypasses saving the host's live hardware debug register=
s and
> loading the guest's debug registers. The guest enters execution with the =
host's
> actual hardware breakpoint registers still active in the pipeline.
>
> Normally, this is mitigated because KVM sets MDCR_EL2.TDA to trap debug
> accesses if the guest doesn't own the registers. However, for protected V=
Ms,
> pvm_init_traps_mdcr() only sets TDA if DebugVer is unimplemented. With
> TDA unset, the protected guest can freely read the host's debug registers
> (leaking host state) and overwrite them when it explicitly reads or write=
s
> DBGBVRn_EL1, DBGBCRn_EL1, or MDSCR_EL1.

Self-hosted debug for protected VMs is still to come, as the cover
says. Until then DebugVer is NI, so pvm_init_traps_mdcr() sets TDA and
TDRA and the guest's debug register accesses trap, RAZ/WI or UNDEF.

>
> >       hyp_vcpu->vcpu.arch.debug_owner =3D host_vcpu->arch.debug_owner;
> >
> >       if (kvm_guest_owns_debug_regs(&hyp_vcpu->vcpu)) {
>
> [ ... ]
>
> > @@ -218,6 +221,9 @@ static void sync_debug_state(struct pkvm_hyp_vcpu *=
hyp_vcpu)
> >  {
> >       struct kvm_vcpu *host_vcpu =3D hyp_vcpu->host_vcpu;
> >
> > +     if (pkvm_hyp_vcpu_is_protected(hyp_vcpu))
> > +             return;
> > +
>
> [Severity: High]
> Does this early return in sync_debug_state() in
> arch/arm64/kvm/hyp/nvhe/hyp-main.c skip restoring the host's debug regist=
ers
> upon guest exit?

Same answer: the guest can't write them.

Thanks,
/fuad



/fuad
>
> Because the context switch back to the host returns early due to the bypa=
ssed
> flush, any guest modifications to the hardware debug registers persist in=
to the
> host execution context. When the guest exits, the corrupted debug registe=
rs
> remain active when the host resumes execution, allowing an untrusted prot=
ected
> guest to mount an attack against the host kernel.
>
> >       if (kvm_guest_owns_debug_regs(&hyp_vcpu->vcpu))
> >               host_vcpu->arch.vcpu_debug_state =3D hyp_vcpu->vcpu.arch.=
vcpu_debug_state;
>
> --
> Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260907070002.33=
33525-1-fuad.tabba@linux.dev?part=3D4
