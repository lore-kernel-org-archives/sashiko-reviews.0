Received: from mail-pl1-f200.google.com (mail-pl1-f200.google.com [209.85.214.200])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 31630497B93
	for <sashiko-reviews@lists.linux.dev>; Wed, 23 Sep 2026 17:13:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.200
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790183624; cv=none; b=UxSGMmczj0in/UxyMfbRgEoDHCSlr4nyf8fy5F7OLR7FxFoRHy0z9rkdix5GatbDcJsCNt0vVSycujtULIMxGA5JiUlkTIo5xYil7rX/P/vTmjagJOFghlgHTzcPxV8e+fktR31hH1g878tK3sVkA6jTZU1toSuf07b7e2PAL8o=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790183624; c=relaxed/simple;
	bh=j25IDjqnZ2B+O9BFrffaf2s+85pCbwoElmfY2yAkYvw=;
	h=Date:In-Reply-To:Mime-Version:References:Message-ID:Subject:From:
	 To:Cc:Content-Type; b=gSNZ5vDzPwlLMRIMGPsKb1CaLpGnIYyN1b0n9qsor28MKNzaEWFedlsn9NaeqogOLlL7CvxZ6ET/483A5XW/Mrc2VcCpvszLm7nMbu59xNinwyvZ4E6pun2FCcBiXYqlaU8jTRUXCr7kMFl645GvHMeyGX+oCnbx4oLviUjkAlA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=flex--seanjc.bounces.google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=Q25QuEkq; arc=none smtp.client-ip=209.85.214.200
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flex--seanjc.bounces.google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="Q25QuEkq"
Received: by mail-pl1-f200.google.com with SMTP id d9443c01a7336-2dd8920c132so16223245ad.0
        for <sashiko-reviews@lists.linux.dev>; Wed, 23 Sep 2026 10:13:42 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20251104; t=1790183622; x=1790788422; darn=lists.linux.dev;
        h=content-transfer-encoding:content-type:cc:to:from:subject
         :message-id:references:mime-version:in-reply-to:date:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=DfGbxY9fQpk1HNaK1cUtE5h3XKD5TipRYi2NYb+dVLk=;
        b=Q25QuEkqLf1ZHFkeKKtPzzjvt7hQr+oYT7pCMaH/F3Fr6zgsvJIZO7KhK5Qc3VUcAh
         nb/CeDEJvboQzoxPj0kydwC2SH9330gsVGyE8qSgrL+Id/+H7NalUsSaYkMHuMRIJtlU
         4vBj77H8mjbPaXWTSBGLJAnaLKBhERnzwx3X+X8jGt/5buPJO6I4Zq3iVzdsiPZ+zM58
         4vAev03+LqXUNnUo8RwJo2QfJgtsQxAf4mXKPJR3OQiJFFGoJXjSiPh9o8r6N1K5HqBx
         E1ATpVa1E5NlX4rF8D4+dyYrGktnffsMQ1MM6Vym6qZwZI6ZqNe+24QK35/T5sO60urE
         k9QA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790183622; x=1790788422;
        h=content-transfer-encoding:content-type:cc:to:from:subject
         :message-id:references:mime-version:in-reply-to:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=DfGbxY9fQpk1HNaK1cUtE5h3XKD5TipRYi2NYb+dVLk=;
        b=OoBkoEMD539OZ6Jb1DR1sMSHnUZSmJIZBSzcFacRVDnQZ3XwFSgGCnlp/z/c+2r2Sd
         o8h90NJ3XN/5j0jYb/TJLWmSSjLA5YG15igD7gQlOGQKTNYc75YUUA8FVRbDHNtv9cE+
         HWGK4zu+5Ax+YlTqVb0O1LsFOA4f3RW5ZcYBrBOud4D7dgmtnSMzhueW8y7vTMAvLdKM
         qAfrLz+Ed4yxZGrolfTnT1jn76v3rAq62AQ0fNHeeURDUMmTmZE3AjxoDxssCoVN2Xvn
         eqww+dLUZ/DhQZtLoe6a1ukOMbr61Iv+qB2xTcOFbUibWLc/H3dHGSQEGPl7/ne7Aypc
         522Q==
X-Gm-Message-State: AFuF++nfWK7SI71jPcJT7a09y3Zlu60C4ghDyttDUZzx1OEgCoIt6wVS
	Bli2NgY4/KdO2KS8+mvwoIsQcHXQNaO3fXQd9tedOIxXSUgXn1t5J0YxeeB2je6nXr0gRrxGIDz
	HUC2MnABEgboemEL3eBmSiO+Mffwa2ThbGDxhgAlGWzhzo7LgIwLhLOK0fVP9tJggIzoLQmy4da
	fM0WBvOncGED3AHQVsD1inL5mVFmZTdcSLBdZOvcXPQmAaeV+a
X-Received: from plar5.prod.google.com ([2002:a17:902:c7c5:b0:2dd:c066:f5c4])
 (user=seanjc job=prod-delivery.src-stubby-dispatcher) by 2002:a17:902:f693:b0:2dd:b20b:76c8
 with SMTP id d9443c01a7336-2df69d3aae3mr29300185ad.16.1790183622104; Wed, 23
 Sep 2026 10:13:42 -0700 (PDT)
Date: Wed, 23 Sep 2026 10:13:41 -0700
In-Reply-To: <20260923164348.2DB2D1F000FF@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: sashiko-reviews@lists.linux.dev
List-Id: <sashiko-reviews.lists.linux.dev>
List-Subscribe: <mailto:sashiko-reviews+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:sashiko-reviews+unsubscribe@lists.linux.dev>
Mime-Version: 1.0
References: <20260923163315.1580860-1-seanjc@google.com> <20260923164348.2DB2D1F000FF@smtp.kernel.org>
Message-ID: <arQIxfjw-2s-vsVL@google.com>
Subject: Re: [PATCH] KVM: TDX: Synthesize SHUTDOWN instead of returning -EIO
 on unhandled EPT violation
From: Sean Christopherson <seanjc@google.com>
To: sashiko-reviews@lists.linux.dev
Cc: kvm@vger.kernel.org
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: quoted-printable

On Wed, Sep 23, 2026, sashiko-bot@kernel.org wrote:
> Thank you for your contribution! Sashiko AI review found 1 potential issu=
e(s) to consider:
> - [High] kvm: tdx: host log spam via repeated KVM_RUN on unhandled EPT vi=
olation
> --
>=20
> commit 8eacf1c465f7e8b6cb99f1f4dae3c4af3bcde33c
> Author: Sean Christopherson <seanjc@google.com>
>=20
> KVM: TDX: Synthesize SHUTDOWN instead of returning -EIO on unhandled EPT =
violation
>=20
> This commit synthesizes a triple fault instead of returning -EIO when KVM
> encounters an EPT Violation from a guest accessing a pending page. This g=
ives
> userspace the option to keep the VM alive or reboot it, rather than treat=
ing
> the situation as a fatal KVM bug.
>=20
> > diff --git a/arch/x86/kvm/vmx/tdx.c b/arch/x86/kvm/vmx/tdx.c
> > index 7173ef3fc398e..eb82f739a7c04 100644
> > --- a/arch/x86/kvm/vmx/tdx.c
> > +++ b/arch/x86/kvm/vmx/tdx.c
> [ ... ]
> > @@ -1938,8 +1938,8 @@ static int tdx_handle_ept_violation(struct kvm_vc=
pu *vcpu)
> >  		if (tdx_is_sept_violation_unexpected_pending(vcpu)) {
> >  			pr_warn("Guest access before accepting 0x%llx on vCPU %d\n",
> >  				gpa, vcpu->vcpu_id);
> > -			kvm_vm_dead(vcpu->kvm);
> > -			return -EIO;
> > +			kvm_make_request(KVM_REQ_TRIPLE_FAULT, vcpu);
> > +			return 1;
>=20
> [Severity: High]
> Will this change allow a malicious or buggy userspace VMM to flood the ho=
st
> kernel log?

Well, a malicious VMM could already spam the logs, e.g. by creating a new V=
M or
or spinning up a huge number of VMs.  I.e. this is a pre-existing issue.  B=
ut I
agree that it should be ratelimited (or maybe converted to vcpu_debug_ratel=
imited()?).

> By replacing kvm_vm_dead() with KVM_REQ_TRIPLE_FAULT and returning 1, KVM
> will clear the request during vcpu_enter_guest() and exit to userspace wi=
th
> KVM_EXIT_SHUTDOWN. If the VMM ignores this exit and repeatedly calls KVM_=
RUN
> without resetting the vCPU, KVM will immediately re-enter the guest.
>=20
> The guest will hit the exact same unexpected SEPT violation in
> tdx_handle_ept_violation(), triggering this unconditional pr_warn() again=
.
> This can create an infinite loop that spams dmesg.
>=20
> >  		}
> >  		/*
> >  		 * Always treat SEPT violations as write faults.  Ignore the
> [ ... ]
>=20
> --=20
> Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260923163315.15=
80860-1-seanjc@google.com?part=3D1
