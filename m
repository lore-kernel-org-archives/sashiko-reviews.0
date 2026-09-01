Received: from mta0.migadu.com (out-56.mta0.migadu.com [91.218.175.56])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3753437B40E
	for <sashiko-reviews@lists.linux.dev>; Tue,  1 Sep 2026 10:17:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=91.218.175.56
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788257880; cv=none; b=gzOa9XMtVC0xudSk0KszolyPBCXs003P21HpEgFI5sU8bkoPVw7EyBRijeyqVTWMTdb0+RiVi8J8iIwuqr0O3arGj/MOGLfm9zS8RUwZLOLK+Y1H03Vv9XdbU2+p/gw79S54YduDAwsVfv3oHqaiSlh1EFhrdvmyj41PGLKh1Is=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788257880; c=relaxed/simple;
	bh=uD0GgEFbux6jCH7K6cAknBBr7yR9JjdUKd7dTuffxPI=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=NL2F3pEM1TVRxRjAwEfwZi2ZwB7aty2JOMBAXwMdVEz+82Qo8EPzntUrDXUi700kq7R9/JcIDjd7AsyIt6X7THQHXJ3J1/E/wDydzE0PHTM+R2VusKX1tg+hifgYkHPf2YmzXPeSFBvBixGx75DAy/EjcZRpRPkMKatA+NPeuyg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.dev; spf=pass smtp.mailfrom=linux.dev; dkim=pass (1024-bit key) header.d=linux.dev header.i=@linux.dev header.b=Vid8ACbG; arc=none smtp.client-ip=91.218.175.56
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.dev
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.dev
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linux.dev header.i=@linux.dev header.b="Vid8ACbG"
X-Envelope-To: sashiko-reviews@lists.linux.dev
DKIM-Signature: a=rsa-sha256; bh=uD0GgEFbux6jCH7K6cAknBBr7yR9JjdUKd7dTuffxPI=;
 c=simple/simple; d=linux.dev;
 h=from:to:subject:date:message-id:mime-version:content-type; s=key1;
 t=1788257876; v=1; x=1788862676;
 b=Vid8ACbGD1dc6cgCdcTx4qAWhItc7MAxwcbAamlrAYmBIxniRNpFSo69R6CsE8xdxR3am619
 yIElG9sPCs0oXqCYLZDDT2sctEQcZZ0pQ63ZpkGv2dMIlGbTJ7XNP4wZOCIyv7noeGjieHo0Yfk
 bdI9HoCTvaVvU5dOANpI0dFM=
X-Envelope-To: sashiko-reviews@lists.linux.dev
Received: by smtp.migadu.com with ESMTPS id e56c5de9248489cf;
	Tue, 01 Sep 2026 10:17:55 +0000
X-Mizu-Trace-ID: e56c5de9248489cf
X-Migadu-Flow: FLOW_OUT
Received: by mail-lf1-f51.google.com with SMTP id 2adb3069b0e04-5b5e5aaf7deso6891e87.0
        for <sashiko-reviews@lists.linux.dev>; Tue, 01 Sep 2026 03:17:55 -0700 (PDT)
X-Gm-Message-State: AFuF++maG9yNs8DkPndQx7VhbSCNthivETGRdbG0v86x61/3DKUuTpfz
	zRb2huKhjwlfol1iRNK1FV4c1Wb830PQns/gnAtiFbhz5H/Pzh5YbTgY9V8iZhGLtiX7WSBXwoQ
	DWuLHqXei1RrcW1LUSMJSeckytzEnAXx8tGv7tTtU
X-Received: by 2002:a05:6512:1309:b0:5b6:4ae:3fef with SMTP id
 2adb3069b0e04-5b604ae4113mr20499e87.14.1788257874587; Tue, 01 Sep 2026
 03:17:54 -0700 (PDT)
Precedence: bulk
X-Mailing-List: sashiko-reviews@lists.linux.dev
List-Id: <sashiko-reviews.lists.linux.dev>
List-Subscribe: <mailto:sashiko-reviews+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:sashiko-reviews+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20260831163421.272420-1-fuad.tabba@linux.dev> <20260831163421.272420-8-fuad.tabba@linux.dev>
 <20260831202209.58EAC1F000E9@smtp.kernel.org>
In-Reply-To: <20260831202209.58EAC1F000E9@smtp.kernel.org>
From: Fuad Tabba <fuad.tabba@linux.dev>
Date: Tue, 1 Sep 2026 11:17:18 +0100
X-Gmail-Original-Message-ID: <CA+EHjTzzVxmPv1gV2GSbn9zoavC0RXYfc96=66YANwm2mXujuw@mail.gmail.com>
X-Gm-Features: AcwNN1X2vrS7sBqUSmpOETSLoJmRWz8Nzp_ep7RH1bSPmkCbReV6dID_ak-GoIk
Message-ID: <CA+EHjTzzVxmPv1gV2GSbn9zoavC0RXYfc96=66YANwm2mXujuw@mail.gmail.com>
Subject: Re: [PATCH 07/17] KVM: arm64: Add system register reset framework for
 protected VMs
To: sashiko-reviews@lists.linux.dev
Cc: Oliver Upton <oupton@kernel.org>, kvmarm@lists.linux.dev, 
	Marc Zyngier <maz@kernel.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Sashiko, I challenged you, and you delievered... I'll give you 1/2 here...

On Mon, 31 Aug 2026 at 21:22, <sashiko-bot@kernel.org> wrote:
>
> Thank you for your contribution! Sashiko AI review found 2 potential issu=
e(s) to consider:
> - [High] EL2 reads host-controlled system registers (ACTLR_EL1 and AMAIR_=
EL1) to initialize protected VM state, violating the pKVM trust boundary.
> - [High] Host-provided vcpu_id is used to calculate the protected VM's MP=
IDR_EL1 without uniqueness validation, violating architectural constraints.
> --
>
> commit 84ffa62c045287810116009ea32700416618900e
> Author: Fuad Tabba <fuad.tabba@linux.dev>
> Subject: KVM: arm64: Add system register reset framework for protected VM=
s
>
> Reset a protected VM's system registers at EL2 rather than taking the
> host's values: add kvm_reset_pvm_sys_regs() and the
> pvm_sys_reg_reset_vals[] table that drives it, and call it from
> init_pkvm_hyp_vcpu() for protected vCPUs. The values follow the
> host-side reset in sys_regs.c, with a poison value where it resets to
> UNKNOWN, and for VBAR_EL1 and CONTEXTIDR_EL1 in place of the 0 it
> resets them to. MPIDR_EL1 is derived from vcpu_id, as for any KVM
> guest.
>
> > diff --git a/arch/arm64/kvm/hyp/nvhe/sys_regs.c b/arch/arm64/kvm/hyp/nv=
he/sys_regs.c
> > index 8758c68017765..ebfd48aa15b56 100644
> > --- a/arch/arm64/kvm/hyp/nvhe/sys_regs.c
> > +++ b/arch/arm64/kvm/hyp/nvhe/sys_regs.c
>
> [ ... ]
>
> > +/* Hardware value, as sys_regs.c's reset_actlr()/reset_amair_el1(). */
> > +static void reset_actlr(struct kvm_vcpu *vcpu, const struct sys_reg_de=
sc_reset *r)
> > +{
> > +     __vcpu_assign_sys_reg(vcpu, r->reg, read_sysreg(actlr_el1));
> > +}
> > +
> > +static void reset_amair_el1(struct kvm_vcpu *vcpu, const struct sys_re=
g_desc_reset *r)
> > +{
> > +     __vcpu_assign_sys_reg(vcpu, r->reg, read_sysreg(amair_el1));
> > +}
>
> [Severity: High]
> Does this allow the host to dictate the protected guest's initial registe=
r
> state?

I'll give you this one Sashiko... Both will reset to 0 in v2, and
these two functions go with them. Mirroring KVM's reset was the wrong
call here.

>
> Since EL1 has write access to both the actlr_el1 and amair_el1 hardware
> registers, the host could set them to arbitrary values before the vCPU
> creation hypercall is invoked. Seeding EL2-private state for a protected
> guest by reading host-modifiable hardware registers instead of using
> hardcoded architectural constants appears to breach the pKVM trust bounda=
ry.
>
> > +
> > +static void reset_mpidr(struct kvm_vcpu *vcpu, const struct sys_reg_de=
sc_reset *r)
> > +{
> > +     __vcpu_assign_sys_reg(vcpu, r->reg, kvm_calculate_mpidr(vcpu));
> > +}
>
> [Severity: High]
> Can a malicious host supply duplicate vcpu_id values?
>
> Earlier in init_pkvm_hyp_vcpu(), hyp_vcpu->vcpu.vcpu_id is directly copie=
d
> from the untrusted host_vcpu. Since kvm_calculate_mpidr() calculates the
> guest's MPIDR_EL1 value based on this unvalidated vcpu_id, could the host
> use this to instantiate a protected VM with duplicate MPIDR_EL1 values
> across its vCPUs?

... but not this one. KVM does not check for uniqueness either:
kvm_init_mpidr_data() keeps the last vCPU written into an aliased
slot.

Cheers,
/fuad




>
> --
> Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260831163421.27=
2420-1-fuad.tabba@linux.dev?part=3D7
