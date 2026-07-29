Received: from out-174.mta1.migadu.com (out-174.mta1.migadu.com [95.215.58.174])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3CAF5394E8A
	for <sashiko-reviews@lists.linux.dev>; Wed, 29 Jul 2026 17:45:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=95.215.58.174
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785347156; cv=none; b=MaKR+bq+9eF6h2boB1YKnL1+SIm6sirdVrAbMJtCGVwjVsOA4mPNQ6cvxvqEfvvw36EAtK9WhZohLYEiRN3/K2O9D8hQCT6LldP2SnU848aa5OKzlwLgtr1FkTXmMH+mn2csZxwVxeaqkKJ3M0KtJyTf3I9yVkLqWvdoS6FLT2M=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785347156; c=relaxed/simple;
	bh=zfmqSG45MPP18hMoaAXwcOuAm70pzOQ7EdxS1N12l4I=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=rHS5HUWsxuvlpirCbOpwNa3KpsmSWMbTemAt2x4goh6meOFrT8NGknmW+pakctcorLrZZy5a+TEnJ5FJORAxAA6TV/1JkbNsQSMKhTuTD8Khiz3WUlkg0gY885FHS7sF+dHsbvwmnJXuIfPxbphsU3jvy3B9WouE5rFdBxFYnKY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.dev; spf=pass smtp.mailfrom=linux.dev; dkim=pass (1024-bit key) header.d=linux.dev header.i=@linux.dev header.b=KEoNF2US; arc=none smtp.client-ip=95.215.58.174
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.dev
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.dev
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linux.dev header.i=@linux.dev header.b="KEoNF2US"
X-Gm-Message-State: AOJu0YwSgti1SjyasUHbLzX0OOnwr7nj4osj/Xye7Q5Wgi7QfZZ6HAIC
	X4BPvIJR/j9AZF1zjZJiixyOvov4SgpuH5JOJ/RWk6HUDrVdhNHMTTvebxTaZy+342BYNd5AlKl
	ezfLvzCofLvWn8uVg7WwYI9mrKnVrvVsqXd9KvmPD
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linux.dev; s=key1;
	t=1785347148;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=0y7NAqhy+F78Z9m8RS3MxYSs5HfIndgDT2RQmGz4iCU=;
	b=KEoNF2USRYtbfXjevrhJ0iOdL0VK3pXF0qrimZ/JfWh0xVzc7vY9CxagJ4IJy2KlrN1itD
	yo1qZcv/Is50stdL6JWGVF6iTJ5x8afxWgzspQ2iRXwa9LR7Zf3hdX9vQ7AW9cLIhuCosk
	aLe8WR/tQke6+9usNlIAHF09XVui+DI=
X-Received: by 2002:a05:6512:12c3:b0:5ae:b1b3:145a with SMTP id
 2adb3069b0e04-5b2d9b5dff2mr47211e87.6.1785347137689; Wed, 29 Jul 2026
 10:45:37 -0700 (PDT)
Precedence: bulk
X-Mailing-List: sashiko-reviews@lists.linux.dev
List-Id: <sashiko-reviews.lists.linux.dev>
List-Subscribe: <mailto:sashiko-reviews+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:sashiko-reviews+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20260720-hybrid-v9-0-2b713ca1b5dc@rsg.ci.i.u-tokyo.ac.jp>
 <20260720-hybrid-v9-12-2b713ca1b5dc@rsg.ci.i.u-tokyo.ac.jp> <20260720060334.E9C6C1F000E9@smtp.kernel.org>
In-Reply-To: <20260720060334.E9C6C1F000E9@smtp.kernel.org>
X-Report-Abuse: Please report any abuse attempt to abuse@migadu.com and include these headers.
From: Fuad Tabba <fuad.tabba@linux.dev>
Date: Wed, 29 Jul 2026 18:44:58 +0100
X-Gmail-Original-Message-ID: <CA+EHjTxzBQd5uqQBty_qjhsGv3XSTt-v2V0JAhm+9OWG8akVvA@mail.gmail.com>
X-Gm-Features: AUfX_mx1MxbMGozpXwtZYMAWoytrKt8CWyfo8MLfsYTWkLY03ClZGM1tdaj7_iY
Message-ID: <CA+EHjTxzBQd5uqQBty_qjhsGv3XSTt-v2V0JAhm+9OWG8akVvA@mail.gmail.com>
Subject: Re: [PATCH v9 12/16] KVM: arm64: PMU: Pass the pPMU to kvm_map_pmu_event()
To: sashiko-reviews@lists.linux.dev
Cc: Akihiko Odaki <odaki@rsg.ci.i.u-tokyo.ac.jp>, kvmarm@lists.linux.dev, 
	Oliver Upton <oupton@kernel.org>, Marc Zyngier <maz@kernel.org>, kvm@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Migadu-Flow: FLOW_OUT

On Mon, 20 Jul 2026 at 07:03, <sashiko-bot@kernel.org> wrote:
>
> Thank you for your contribution! Sashiko AI review found 1 potential issu=
e(s) to consider:
>
> Pre-existing issues:
> - [Critical] Host kernel panic via NULL pointer dereference in PMU event =
creation when a guest without a PMU toggles `MDCR_EL2.HPME`.

I don't think it's reachable. With no PMU, arm_pmu is NULL but the
event is never created: the cycle counter can't be enabled (PMCR.E is
0 and the guest can't write the hidden PMCR), and the
nested-transition path is gated by kvm_vcpu_has_pmu().

/fuad

> --
>
> --- Patch [12]: [PATCH v9 12/16] KVM: arm64: PMU: Pass the pPMU to kvm_ma=
p_pmu_event() ---
> commit 61c39cb093b2170b92839ae7097044db9d1474cc
> Author: Akihiko Odaki <odaki@rsg.ci.i.u-tokyo.ac.jp>
>
> KVM: arm64: PMU: Pass the pPMU to kvm_map_pmu_event()
>
> This patch updates kvm_map_pmu_event() to accept the PMU structure direct=
ly
> rather than implicitly looking it up via the VM argument. This prepares t=
he
> code to map events against a per-vCPU selected pPMU in the future.
>
> > diff --git a/arch/arm64/kvm/pmu-emul.c b/arch/arm64/kvm/pmu-emul.c
> > index c5c505b6fc61c..27db8877f96ea 100644
> > --- a/arch/arm64/kvm/pmu-emul.c
> > +++ b/arch/arm64/kvm/pmu-emul.c
> [ ... ]
> > @@ -725,7 +723,7 @@ static void kvm_pmu_create_perf_event(struct kvm_pm=
c *pmc)
> >        * Don't create an event if we're running on hardware that requir=
es
> >        * PMUv3 event translation and we couldn't find a valid mapping.
> >        */
> > -     eventsel =3D kvm_map_pmu_event(vcpu->kvm, eventsel);
> > +     eventsel =3D kvm_map_pmu_event(vcpu->kvm->arch.arm_pmu, eventsel)=
;
>
> [Severity: Critical]
> This is a pre-existing issue, but this change makes it a bit more explici=
t.
> Could this pass a NULL pointer to kvm_map_pmu_event() and cause a host ke=
rnel
> panic?
>
> If a guest with nested virtualization enabled but no PMU configured toggl=
es
> the MDCR_EL2.HPME bit, access_mdcr() will unconditionally trigger a
> KVM_REQ_RELOAD_PMU request without checking if the VM actually has a PMU.
>
> When kvm_vcpu_reload_pmu() handles this request on the next vCPU entry,
> it tries to reprogram the cycle counter (which defaults to enabled). This
> eventually reaches kvm_pmu_create_perf_event():
>
> arch/arm64/kvm/sys_regs.c:access_mdcr() {
>     ...
>     kvm_pmu_handle_mdcr(vcpu, old, val); /* Triggers KVM_REQ_RELOAD_PMU *=
/
> }
>
> arch/arm64/kvm/pmu-emul.c:kvm_pmu_create_perf_event() {
>     ...
>     eventsel =3D kvm_map_pmu_event(vcpu->kvm->arch.arm_pmu, eventsel);
> }
>
> arch/arm64/kvm/pmu-emul.c:kvm_map_pmu_event() {
>     ...
>     if (unlikely(pmu->map_pmuv3_event)) /* NULL pointer dereference */
> }
>
> Because no PMU was initialized for this guest, vcpu->kvm->arch.arm_pmu is=
 NULL.
>
> Could access_mdcr() or kvm_pmu_create_perf_event() check if the PMU is
> actually initialized before attempting to create events?
>
> >       if (eventsel < 0)
> >               return;
> >
>
> --
> Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260720-hybrid-v=
9-0-2b713ca1b5dc@rsg.ci.i.u-tokyo.ac.jp?part=3D12
>
