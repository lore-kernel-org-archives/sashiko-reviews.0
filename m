Received: from mta1.migadu.com (out-194.mta1.migadu.com [95.215.58.194])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CE2B73ED5C9
	for <sashiko-reviews@lists.linux.dev>; Tue, 25 Aug 2026 09:25:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=95.215.58.194
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787649934; cv=none; b=abpf+Kr4hFgN3Z2sRAA9sRFV0C5C4s1ZPSoSQzDR4AMHd705OLOH9csdRsAi+Jb5gjvkitW7zehT5nUOdMXJlc5lzihjrPagIGeY0w4ADb3yERscG1WtoD7tMDlcOnSc82hh4gbxuGpiOdVHQ0hYzRdVoAU8aKPH7DyphkiYOnQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787649934; c=relaxed/simple;
	bh=Me0T5+G6GU+yqK+pfWnftzQNd1qwsvqsRERpiPzCgCs=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=KU0L+Vv6pEjoIU5ueBdCpkkUOeEJOwKTTgVOq5qSm8I4LMo918QGAT2S1YfIIyRRK05NAPTDJh74amWzOFEqyeFrOiWzLS8JP+xMk+r4c6QVlWWSFRtWOJVoVehgTqxxl4i92zIEZzM1/daXsYkZm9G9W1HhHkd5Auc98IQzLO0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.dev; spf=pass smtp.mailfrom=linux.dev; dkim=pass (1024-bit key) header.d=linux.dev header.i=@linux.dev header.b=sJJK9A91; arc=none smtp.client-ip=95.215.58.194
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.dev
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.dev
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linux.dev header.i=@linux.dev header.b="sJJK9A91"
X-Envelope-To: sashiko-reviews@lists.linux.dev
DKIM-Signature: a=rsa-sha256; bh=Me0T5+G6GU+yqK+pfWnftzQNd1qwsvqsRERpiPzCgCs=;
 c=simple/simple; d=linux.dev;
 h=from:to:subject:date:message-id:mime-version:content-type; s=key1;
 t=1787649930; v=1; x=1788254730;
 b=sJJK9A91oOq/SQ6f5hvjT6cX1z9D6s2FvK6HAEXsZfao1ftVM99QQUM+nNdaD0K2Qa63k2ci
 yl6hkPFEZJbYQcPp46HTILaMiB/1ZhZ9LkZBdKuTcXjFwFVg+sI8jyPj+YgVOp/hqr8Q9BbCrsj
 Z/2EbFzrvFVRkfGGOS+Rj1f4=
X-Envelope-To: sashiko-reviews@lists.linux.dev
Received: from mail-lf1-f50.google.com (209.85.167.50)
	by smtp.migadu.com with ESMTPS id 3cb13eb8cb0bbc2e;
	Tue, 25 Aug 2026 09:25:30 +0000
X-Mizu-Trace-ID: 3cb13eb8cb0bbc2e
X-Migadu-Flow: FLOW_OUT
Received: by mail-lf1-f50.google.com with SMTP id 2adb3069b0e04-5b2a73da7e1so1051e87.0
        for <sashiko-reviews@lists.linux.dev>; Tue, 25 Aug 2026 02:25:26 -0700 (PDT)
X-Gm-Message-State: AFuF++k+L7Z9rjIuLtvM9ZQ5PM++VHIpMfrcSdyRSt2wsGKFfoFFeuhx
	hnQJfcs9cUr2sQ/eFPu3aeKPZUPIEEUJ37cbrkGKi3dDxmRyv9MtSbATpGQwkpDX4/yOC9HyOj1
	hnZFYS04BfRR29iGGEzYJxKDWo1NKeRkModtssHNg
X-Received: by 2002:a05:6512:3ca1:b0:5b2:a967:c0e1 with SMTP id
 2adb3069b0e04-5b49ddd8905mr67230e87.0.1787649925547; Tue, 25 Aug 2026
 02:25:25 -0700 (PDT)
Precedence: bulk
X-Mailing-List: sashiko-reviews@lists.linux.dev
List-Id: <sashiko-reviews.lists.linux.dev>
List-Subscribe: <mailto:sashiko-reviews+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:sashiko-reviews+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20260825085948.1674721-1-fuad.tabba@linux.dev>
 <20260825085948.1674721-3-fuad.tabba@linux.dev> <20260825091816.F361E1F00A3A@smtp.kernel.org>
In-Reply-To: <20260825091816.F361E1F00A3A@smtp.kernel.org>
From: Fuad Tabba <fuad.tabba@linux.dev>
Date: Tue, 25 Aug 2026 10:24:49 +0100
X-Gmail-Original-Message-ID: <CA+EHjTw8wN-MgXXsYr0GtOUWJZ5=25GofefuDjqKfF3b5P4uaQ@mail.gmail.com>
X-Gm-Features: AcwNN1Xjr3NXNfeX6K1obDu2zEHXIEui6hZzl_xWAkvM-wr4YjqGEMNUSRhqSAY
Message-ID: <CA+EHjTw8wN-MgXXsYr0GtOUWJZ5=25GofefuDjqKfF3b5P4uaQ@mail.gmail.com>
Subject: Re: [PATCH 2/4] KVM: arm64: Do not clear VM-wide SVE feature on vCPU
 init failure
To: sashiko-reviews@lists.linux.dev
Cc: kvmarm@lists.linux.dev, Oliver Upton <oupton@kernel.org>, 
	Marc Zyngier <maz@kernel.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Tue, 25 Aug 2026 at 10:18, <sashiko-bot@kernel.org> wrote:
>
> Thank you for your contribution! Sashiko AI review found 1 potential issu=
e(s) to consider:
>
> Pre-existing issues:
> - [High] Hypervisor DoS via WARN_ON() upon page table allocation failure

Nope [1]

[1] https://lore.kernel.org/all/CA+EHjTyPxcObTOwi25QTUDbLwAYaKnWY0QJVB_aMso=
2=3D38PJUg@mail.gmail.com/

> --
>
> --- Patch [2]: [PATCH 2/4] KVM: arm64: Do not clear VM-wide SVE feature o=
n vCPU init failure ---
> commit 1188c411e2a65143d7371d1038c2752c0f2de6c0
> Author: Fuad Tabba <fuad.tabba@linux.dev>
>
> KVM: arm64: Do not clear VM-wide SVE feature on vCPU init failure
>
> pkvm_vcpu_init_sve() clears KVM_ARM_VCPU_SVE in kvm->arch.vcpu_features
> when it fails, but vcpu_has_sve() tests KVM_ARCH_FLAG_GUEST_HAS_SVE,
> which is left set. Later vCPUs on that VM then skip the SVE setup and
> register with a NULL sve_state, which the guest's first FP access hands
> to sve_load_state().
>
> Return the error without touching vcpu_features.
>
> > diff --git a/arch/arm64/kvm/hyp/nvhe/pkvm.c b/arch/arm64/kvm/hyp/nvhe/p=
kvm.c
> > index c31b9d46b8b60..4340b13ee295b 100644
> > --- a/arch/arm64/kvm/hyp/nvhe/pkvm.c
> > +++ b/arch/arm64/kvm/hyp/nvhe/pkvm.c
>
> [ ... ]
>
> > @@ -462,24 +462,19 @@ static int pkvm_vcpu_init_sve(struct pkvm_hyp_vcp=
u *hyp_vcpu, struct kvm_vcpu *h
> >       sve_max_vl =3D min(READ_ONCE(host_vcpu->arch.sve_max_vl), kvm_hos=
t_sve_max_vl);
> >       sve_state =3D kern_hyp_va(READ_ONCE(host_vcpu->arch.sve_state));
> >
> > -     if (!sve_vl_valid(sve_max_vl) || !sve_state) {
> > -             ret =3D -EINVAL;
> > -             goto err;
> > -     }
> > +     if (!sve_vl_valid(sve_max_vl) || !sve_state)
> > +             return -EINVAL;
> >
> >       sve_state_size =3D sve_state_size_from_vl(sve_max_vl);
> >
> >       ret =3D hyp_pin_shared_mem(sve_state, sve_state + sve_state_size)=
;
> >       if (ret)
> > -             goto err;
> > +             return ret;
>
> [Severity: High]
> This is a pre-existing issue, but can the call to hyp_pin_shared_mem()
> trigger a hypervisor panic if EL2 memory is exhausted?
>
> Looking at hyp_pin_shared_mem() in arch/arm64/kvm/hyp/nvhe/mem_protect.c,
> it wraps the mapping allocation in a WARN_ON:
>
>         if (p->refcount =3D=3D 1)
>                 WARN_ON(pkvm_create_mappings_locked((void *)cur,
>                                                     (void *)cur + PAGE_SI=
ZE,
>                                                     PAGE_HYP));
>
> At EL2 under nVHE/pKVM, WARN_ON() expands to a BRK instruction which pani=
cs
> the hypervisor and brings down the host.
>
> Since host userspace can repeatedly invoke KVM ioctls to create VMs or vC=
PUs
> and exhaust the bounded EL2 memory pool, pkvm_create_mappings_locked()
> might eventually fail and return -ENOMEM.
>
> Does this allow an unprivileged host process to hit the WARN_ON and crash
> the host system?
>
> --
> Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260825085948.16=
74721-1-fuad.tabba@linux.dev?part=3D2
