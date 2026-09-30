Received: from mail-pl1-f197.google.com (mail-pl1-f197.google.com [209.85.214.197])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B52594D9F6A
	for <sashiko-reviews@lists.linux.dev>; Wed, 30 Sep 2026 13:00:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.197
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790773215; cv=none; b=Z+BU6ZmoHNHbEjUh7lGGdvngkVKv+Riw4ZfnPKU4eFrrVuiM8kgCvZD2hh8uKiF/3oHbLIVgwtR0MTAVyqYixCo/ArwJ1TEQVHOg6QEOzdNyfwFiThuHq+o3e8WUR6x6TxzdFD/zrTfEeFGSswATf/ilsIs8p6Vhu/IBGOOv7ZA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790773215; c=relaxed/simple;
	bh=H/AldlVMjk/oQNta6Hs1FIuCqnbxULD8ohl+C5FSSSs=;
	h=Date:In-Reply-To:Mime-Version:References:Message-ID:Subject:From:
	 To:Cc:Content-Type; b=n1WdGgvnAyt+NJPYejLXI6+X9TtoaQgK+GlfiFQbCjPl3Hrmwl+/Ucea/WL8TNWQUqYGLFcHxXk6JQ0S3N0gssg69+r93RflEyXp5PYOwoqNUzmonDVaGcijIJP56BxriKHh9bCaGuDMm8dfS/LiCLI2d78L8nkq2fZ78L1Eby8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=flex--seanjc.bounces.google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=AV60zr72; arc=none smtp.client-ip=209.85.214.197
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flex--seanjc.bounces.google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="AV60zr72"
Received: by mail-pl1-f197.google.com with SMTP id d9443c01a7336-2dd7d0751efso16682405ad.0
        for <sashiko-reviews@lists.linux.dev>; Wed, 30 Sep 2026 06:00:05 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20251104; t=1790773202; x=1791378002; darn=lists.linux.dev;
        h=content-transfer-encoding:content-type:cc:to:from:subject
         :message-id:references:mime-version:in-reply-to:date:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=uxkJXleKpEm3giS9KW70/l1fmv0cN3weadq8nwqYF/s=;
        b=AV60zr722tAc3O+1cDV20ygXgV9gCQTsjKA70uDFDm69l3dgKwmF3bPwH2Qtj8WoTg
         rAOQl9IMZs7xvu7yMZYx9bODvUZ8Sfi3/M+v6yiE+eW7FtyhfX9WfrvZO2G3bVhDek4I
         bo5kr/WKvMPNObxuh6N3lJ0mz/3TXcZH/VEj0O5XLoeYAvzDDlnUxvUGjoPXd4wHpBVP
         5B71U1PQhjDsoiQW8qi66S8oNr/xxtbc+pbkWRjoHvB9vqn+PMG2eDmpXgIH+FYok6ZH
         UY/giwc36PgL+LBiNSbSu9JxkW4W2XXXOd30OMCv0iq66vrSVXPOTQUu2cTucFLrBdxI
         /o6Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790773202; x=1791378002;
        h=content-transfer-encoding:content-type:cc:to:from:subject
         :message-id:references:mime-version:in-reply-to:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=uxkJXleKpEm3giS9KW70/l1fmv0cN3weadq8nwqYF/s=;
        b=lBhxrylZP7EPJNBaxOiZphcWUdwdvxVoFeBaLNRya1RqA82jNeYGZ7BAjmnVHQRh55
         G1F62nmN8oDJRWfhQ9eFzhMzr6kQs/ghv9dpE8rH5dYZBK5VsAwHfFnQ6JreFZhalGrQ
         +9g61YxOIZk4xhAUuy8f0BsC1ZP+VX3mCxnHXLpu4mQcjuoiRvDKtoMheaSAQw8Xsxr/
         aPGyVCx1jazXiCdcll00+R+1ak2QIxic5CCca6pfHil1IrLKTAdrbeTIKGygB5UdWN0D
         7QcUyZtYMlkG6ErTRZlHxcx8RyZHBQapk4KZ2MXryxXgvab+hjVmWUQpKre8baVzWi1j
         QdRQ==
X-Gm-Message-State: AFq9FYLZh4t+JDSdxH22fdYhpv0Sav0fEXuXX2VsyHLgVV7SGxcXHhgp
	3xZadVeIFhw5mOy9z9VGIc+U+FefR/qQv6kiNvwP+7LHvOUmd+Cx6k2CQH6CcVL1T4fstT2kLHV
	2xFO3ygWn5g1rhw5cHASUB5r0qfrLvUEdljDiwVcJpZXLga9M+0MOudTdNeOCFjLruH/o3DLfY+
	u/HMH4Oxp32KWs61zU5g54MANrs+9y7gW+XBd4fyU6EyCW8SKf
X-Received: from plmo19.prod.google.com ([2002:a17:903:18d3:b0:2e2:c37a:5ebc])
 (user=seanjc job=prod-delivery.src-stubby-dispatcher) by 2002:a17:902:f712:b0:2dd:a937:9bfb
 with SMTP id d9443c01a7336-2e2e4b3213bmr8506045ad.10.1790773201544; Wed, 30
 Sep 2026 06:00:01 -0700 (PDT)
Date: Wed, 30 Sep 2026 05:59:52 -0700
In-Reply-To: <20260930012809.331EB1F000FF@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: sashiko-reviews@lists.linux.dev
List-Id: <sashiko-reviews.lists.linux.dev>
List-Subscribe: <mailto:sashiko-reviews+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:sashiko-reviews+unsubscribe@lists.linux.dev>
Mime-Version: 1.0
References: <20260930011313.3197688-1-seanjc@google.com> <20260930011313.3197688-6-seanjc@google.com>
 <20260930012809.331EB1F000FF@smtp.kernel.org>
Message-ID: <ar0HyDZ_mUqUK5cn@google.com>
Subject: Re: [PATCH v5 05/12] KVM: x86: WARN if fixed-1 DR6 bits aren't
 already set when delivering payload
From: Sean Christopherson <seanjc@google.com>
To: sashiko-reviews@lists.linux.dev
Cc: kvm@vger.kernel.org
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: quoted-printable

On Wed, Sep 30, 2026, sashiko-bot@kernel.org wrote:
> Thank you for your contribution! Sashiko AI review found 1 potential issu=
e(s) to consider:
> - [High] kvm/x86: host DoS via WARN_ON_ONCE in kvm_deliver_exception_payl=
oad
> --
>=20
> commit 55e3dfb3c54d9318de7a4a9b55c84a0a9acf4aa2
> Author: Sean Christopherson <seanjc@google.com>
>=20
> KVM: x86: WARN if fixed-1 DR6 bits aren't already set when delivering pay=
load
>=20
> This commit adds a WARN_ON_ONCE to kvm_deliver_exception_payload() to ass=
ert
> that fixed-1 bits in DR6 are already set when delivering a #DB payload. I=
t
> also switches to using kvm_get_dr6_fixed_1() for the check.
>=20
> > diff --git a/arch/x86/kvm/x86.c b/arch/x86/kvm/x86.c
> > index 99518e3265b45..5b3918a4ed521 100644
> > --- a/arch/x86/kvm/x86.c
> > +++ b/arch/x86/kvm/x86.c
> [ ... ]
> > @@ -440,8 +442,10 @@ void kvm_deliver_exception_payload(struct kvm_vcpu=
 *vcpu,
> >  		 * breakpoint), it is reserved and must be zero in DR6.
> >  		 */
> >  		vcpu->arch.dr6 &=3D ~BIT(12);
> > -		vcpu->arch.dr6 |=3D DR6_FIXED_1;
> > +		if (WARN_ON_ONCE((vcpu->arch.dr6 & dr6_fixed_1) !=3D dr6_fixed_1))
> > +			vcpu->arch.dr6 |=3D dr6_fixed_1;
>=20
> [Severity: High]
> Can an unprivileged host-userspace process trigger this warning in
> kvm_deliver_exception_payload() in arch/x86/kvm/x86.c by injecting a
> malformed dr6 state?
>=20
> If host-userspace invokes the kvm_vcpu_ioctl_x86_set_debugregs() via the
> KVM_SET_DEBUGREGS ioctl in arch/x86/kvm/regs.c with dbgregs.dr6 =3D 0, it
> clears all fixed-1 bits in vcpu->arch.dr6, since kvm_dr6_valid() only
> validates the upper 32 bits.

Drat.  I had reservations about adding the sanity check even before Sashiko
chimed in, so I'll just drop it.

>=20
> Then, if it invokes kvm_vcpu_ioctl_x86_set_vcpu_events() in
> arch/x86/kvm/x86.c via the KVM_SET_VCPU_EVENTS ioctl to queue a pending
> #DB exception with an unchecked payload and runs the VCPU via KVM_RUN,
> kvm_deliver_exception_payload() will evaluate this newly added
> WARN_ON_ONCE before the fixed-1 bits are restored.
>=20
> On systems with panic_on_warn=3D1, could this result in a host kernel pan=
ic
> and a denial of service?
>=20
> >  		break;
> > +	}
> >  	case PF_VECTOR:
> >  		vcpu->arch.cr2 =3D ex->payload;
> >  		break;
>=20
> --=20
> Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260930011313.31=
97688-1-seanjc@google.com?part=3D5
