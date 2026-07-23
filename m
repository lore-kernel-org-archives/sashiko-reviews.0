Received: from mail-pf1-f200.google.com (mail-pf1-f200.google.com [209.85.210.200])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1D2C425F7A9
	for <sashiko-reviews@lists.linux.dev>; Thu, 23 Jul 2026 00:33:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.200
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784766812; cv=none; b=RE1yQPSdt/o2LNsgaP6qgU5Fr+pJgNpUPIVaKklW1ICv1T/r3vS9N4Yd7qOTi+T4b7gVR2UcHIU6uli7dnz9bEUb3/8hFqLcB6EhSz9jH087tz2qppuw74WDYSolhZeY23QdNCV0/zUMsxYohg0/aOH/RHUYfZFntF/pDQQuX2M=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784766812; c=relaxed/simple;
	bh=e7/RpxVSolxHTXBW1etTUxJL+/1qsGU1BtMP/7h5Mu4=;
	h=Date:In-Reply-To:Mime-Version:References:Message-ID:Subject:From:
	 To:Cc:Content-Type; b=NJGeLX47gj8mVV7gRx0BYZlk6ooa+tA7YsDat0xFtycgK4AVQcGxBYuW6pk+UBnfaYIBbsGG1AohADmAA5Z62DDbeEq/0Z7/w0Mx6f6TjzrZioleyNxGV7cwpjOb2uv4Chp43h9SYpL+6lTvsUhxIxVKO5xUFnmAZe0y70e6zGs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=flex--seanjc.bounces.google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=bkcQFrsp; arc=none smtp.client-ip=209.85.210.200
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flex--seanjc.bounces.google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="bkcQFrsp"
Received: by mail-pf1-f200.google.com with SMTP id d2e1a72fcca58-84865f326efso95292b3a.0
        for <sashiko-reviews@lists.linux.dev>; Wed, 22 Jul 2026 17:33:31 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20251104; t=1784766810; x=1785371610; darn=lists.linux.dev;
        h=content-transfer-encoding:content-type:cc:to:from:subject
         :message-id:references:mime-version:in-reply-to:date:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=eRKdtnniIXUIJNdGrRoc0zImiCzQKE7Rwz9ClWWv88M=;
        b=bkcQFrspAEm5HmfEMLDolMrnvmteihG3632ZtmeUElAEvfgHujeAfZQE71wSWfwhdi
         S5RlGCoX6nbQKr8kMBLa941Hp2EDuARqORKj9XNszWPwLUh8VkUzwrypDFYwbOSP4TbG
         9TskBJsLHNCTkDOVc4p1qOoRgHnG6ZnsGCSkeNN2xyzIgECkAmMVkCgIKR5ho5SunY23
         dJtjXgjz8v13o+Ja8QKPyBTBdgrxj/saMDfHNVjoGugRLfvMLRE3vM+Qv3KO2/zJS1Pg
         QutNWcb5dqIz5TXkp+Ul1048U/gNmwFFYkEnH2utRQxA8yIdWV6t30/6bd+nConMPbz3
         e2Og==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1784766810; x=1785371610;
        h=content-transfer-encoding:content-type:cc:to:from:subject
         :message-id:references:mime-version:in-reply-to:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=eRKdtnniIXUIJNdGrRoc0zImiCzQKE7Rwz9ClWWv88M=;
        b=BDtEZXCrtH8fwNk6OF09RUZtG3Wcz0Of4aV4DD1Ha5wW1x+qr92t49ftcOu49I5Zf3
         YYUywPp1qQmb/fAQz2KcWIOUwDQTNvrKJWFA7S2MqwUQzVAFsyXL3Ay7Dx5kpOkxWzTw
         vt3jR5Ygadl8QpHj9yMIJrnIop1zvOUl6zphSb7VQ6aZs76HWWP8m0QJgChIUXULvIZe
         8Y/7sE6U30v/WD7kQZTqLr95OSB8B4C97FZK+xPXn5HdUyb5Mcd9KmI/og+0ozY+rxfw
         uPf98v0/WTkMH7d7qh3TtdviQuS5bigXX0yZ9lUSn79wvYOVb8X+/SFsfjX7sxjTIoRy
         bOiw==
X-Gm-Message-State: AOJu0YzZNAuPy9R2bQQSsjzMf98FbxT3AnoBG2swp1Ycr5nbtAw12tz+
	wDk8XKBryztRO3q54FAT2RRd2wVeTwU9pJN/R3LYC44DU48M65bZyTdarEMWCehaTFYGeJoUGwn
	AvvGXTw==
X-Received: from pghz12.prod.google.com ([2002:a63:e10c:0:b0:c9a:b3b0:a861])
 (user=seanjc job=prod-delivery.src-stubby-dispatcher) by 2002:a05:6a21:d8a:b0:3c3:87e1:2637
 with SMTP id adf61e73a8af0-3c44b013224mr818095637.22.1784766809981; Wed, 22
 Jul 2026 17:33:29 -0700 (PDT)
Date: Wed, 22 Jul 2026 17:33:29 -0700
In-Reply-To: <CAO9r8zNE5F_895rmxuidfs_5Rf0Y5n+osr+bdiT3ju5=+za5sQ@mail.gmail.com>
Precedence: bulk
X-Mailing-List: sashiko-reviews@lists.linux.dev
List-Id: <sashiko-reviews.lists.linux.dev>
List-Subscribe: <mailto:sashiko-reviews+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:sashiko-reviews+unsubscribe@lists.linux.dev>
Mime-Version: 1.0
References: <20260616004155.1435766-9-yosry@kernel.org> <20260616010604.ACC021F000E9@smtp.kernel.org>
 <CAO9r8zNx4=dq=SBMcNwWzedVR4UGgarg=_pfmPT1DWb1MzC2CA@mail.gmail.com> <CAO9r8zNE5F_895rmxuidfs_5Rf0Y5n+osr+bdiT3ju5=+za5sQ@mail.gmail.com>
Message-ID: <amFhWUcEWucx1hlH@google.com>
Subject: Re: [RFC PATCH v2 08/25] KVM: SEV: Stop using per-vCPU ASID for SEV VMs
From: Sean Christopherson <seanjc@google.com>
To: Yosry Ahmed <yosry@kernel.org>
Cc: sashiko-reviews@lists.linux.dev, kvm@vger.kernel.org
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: quoted-printable

On Tue, Jul 07, 2026, Yosry Ahmed wrote:
> On Tue, Jun 16, 2026 at 10:50=E2=80=AFAM Yosry Ahmed <yosry@kernel.org> w=
rote:
> > On Mon, Jun 15, 2026 at 6:06=E2=80=AFPM <sashiko-bot@kernel.org> wrote:
> > > > diff --git a/arch/x86/kvm/svm/sev.c b/arch/x86/kvm/svm/sev.c
> > > > --- a/arch/x86/kvm/svm/sev.c
> > > > +++ b/arch/x86/kvm/svm/sev.c
> > > > @@ -3555,10 +3555,7 @@ int pre_sev_run(struct vcpu_svm *svm, int cp=
u)
> > > >       if (!cpumask_test_cpu(cpu, to_kvm_sev_info(kvm)->have_run_cpu=
s))
> > > >               cpumask_set_cpu(cpu, to_kvm_sev_info(kvm)->have_run_c=
pus);
> > > >
> > > > -     /* Assign the asid allocated with this SEV guest */
> > > > -     svm->asid =3D asid;
> > > > -
> > > > -     if (unlikely(svm->asid !=3D svm->vmcb->control.asid)) {
> > > > +     if (WARN_ON_ONCE(asid !=3D svm->vmcb->control.asid)) {
> > >
> > > [Severity: High]
> > > Can a malicious SEV guest or an unprivileged host-userspace process t=
rigger
> > > this warning by entering nested virtualization or via KVM_SET_NESTED_=
STATE?
> > >
> > > KVM does not strictly prohibit userspace from exposing CPUID.SVM to a=
n SEV
> > > guest. If an SEV guest sets EFER.SVME and executes VMRUN, KVM interce=
pts it
> > > and handles the nested transition via nested_svm_vmrun(), which switc=
hes the
> > > active VMCB pointer to the nested vmcb02.
> > >
> > > The nested vmcb02 does not inherit the SEV ASID assignment from
> > > sev_init_vmcb(), and its control.asid is initialized separately. Duri=
ng the
> > > subsequent svm_vcpu_run() -> pre_sev_run() call, the VM's valid SEV A=
SID will
> > > no longer match the nested vmcb02's ASID, causing this warning to tri=
gger.
> >
> > Hmm I looked around the code and I can't see what prevents SEV guests
> > from setting EFER_SVME or using KVM_SET_NESTED_STATE. However, I think
> > a VMRUN from an SEV VM will fail, at least due to not being able to
> > read the vmcb12 from guest memory?
> >
> > That being said, I can drop this stopgap if preferred, I was going to
> > drop it before sending but I left it in just to be cautious.
>=20
> From an offline discussion with Sean, seems like it's technically
> possible to actually run nested in SEV.=20

It is, past me actually got it working (I was curious). :-)

> So I need to actually handle this in this series, by making sure L2 uses =
the
> same ASID as L1 (required for SEV), and always flushing that ASID on nest=
ed
> transitions. I will also drop this stopgap, given that it's likely that u=
sing
> the wrong ASID will result in a loud failure anyway.

FWIW, "need" is debatable.  If supporting nested+SEV adds a lot of complexi=
ty,
I'd probably be ok dropping support for that, e.g. by failing VMRUN with a =
software
error.  But if it's roughly the same complexity overall, I'd probably vote =
to
allow it, mainly to avoid making semi-arbitrary support/policy decisions in=
 KVM.
