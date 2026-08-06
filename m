Received: from out-188.mta0.migadu.com (out-188.mta0.migadu.com [91.218.175.188])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0E8C7394470
	for <sashiko-reviews@lists.linux.dev>; Thu,  6 Aug 2026 16:21:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=91.218.175.188
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1786033316; cv=none; b=nJRwf0lD1RicCPvq0jIfXsHbRLTvcspESqo//kuhmz72spBWPvXIJMRQkfj6k+P2K+kV1WTXTK+fS2ydBTOrUsrCLvSKyc6GTq0Oq6dafkJCWL2liSpnFQIGEStp2Yh08lXJgLrOXAhohQu6YSy/i0ZxXtyRx0Xw41Qbc9ei/Ac=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1786033316; c=relaxed/simple;
	bh=YpAZsBTBHfOWn98a0J8Pkrh9F4NMleu15ho9SrxatPY=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=GcKG9/pfUMC3UJO+5RrvTMbboPDE25MYu9N6iY5gP+WEmEFB7sWHUFgPTDtOu+cHvKF3QyjYgiZI5ofq0QxH5s4j6exnRKGiug9nIsWhivLs+hMmAJRuTczfRxdDSZDGvUfBJSabCBuANzC11zTri6xeHXgjsZcV1/vnzRV78xA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.dev; spf=pass smtp.mailfrom=linux.dev; dkim=pass (1024-bit key) header.d=linux.dev header.i=@linux.dev header.b=PfR/Ahr4; arc=none smtp.client-ip=91.218.175.188
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.dev
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.dev
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linux.dev header.i=@linux.dev header.b="PfR/Ahr4"
X-Gm-Message-State: AOJu0Yz0ll0f4x9zOXjQVTf2waN8j2b92nnF8Cu+R8TIrcJ+9Y53HS24
	8ihwsUaReH8TW7PVZmQdt6j6wQfibZdcqBVn/CjbKLpVF0GnlL9Z9tTbnFHnAnCpCjWH6MROy5H
	LO8znkkGVkfJhindPJB8kL0t4Z5xRx8PbphtxTKny
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linux.dev; s=key1;
	t=1786033311;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=86swyc2XR9zidBek0gZHlj2E5P9dzEjsE79qGoC6SXA=;
	b=PfR/Ahr4cBQabS5yTzwn9HeuL8Md3QZ5Ji9M5ZESLHQflRqJVBKeZeqJnuvNrRKRmn4zt2
	ibxuHJP3E6k9BauURIhTaI8mysBgn/46BQAmZiAITOO2qcYBAI+D53H9k1+L45JjWGf8i0
	XRLicyFsfxbjoFMqmOEwqLnIeOHc3TE=
X-Received: by 2002:a05:622a:e106:20b0:51c:6b7:d3de with SMTP id
 d75a77b69052e-52cfe9f3116mr817471cf.5.1786033280113; Thu, 06 Aug 2026
 09:21:20 -0700 (PDT)
Precedence: bulk
X-Mailing-List: sashiko-reviews@lists.linux.dev
List-Id: <sashiko-reviews.lists.linux.dev>
List-Subscribe: <mailto:sashiko-reviews+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:sashiko-reviews+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20260806150105.4010701-1-smostafa@google.com> <20260806153135.02E851F000E9@smtp.kernel.org>
In-Reply-To: <20260806153135.02E851F000E9@smtp.kernel.org>
X-Report-Abuse: Please report any abuse attempt to abuse@migadu.com and include these headers.
From: Fuad Tabba <fuad.tabba@linux.dev>
Date: Thu, 6 Aug 2026 17:20:43 +0100
X-Gmail-Original-Message-ID: <CA+EHjTypNs3i8qAqtnyN3wodZDZv79HnN51BobNdMguE9wo58w@mail.gmail.com>
X-Gm-Features: AUfX_myK7gV-2pjnJHRq_JJk4TqwcNWtCy5tCRxJURLuUPc_gdk7PhMNMNhRpAo
Message-ID: <CA+EHjTypNs3i8qAqtnyN3wodZDZv79HnN51BobNdMguE9wo58w@mail.gmail.com>
Subject: Re: [PATCH] KVM: arm64: Fix hvhe and broken CNTVOFF_EL2
To: sashiko-reviews@lists.linux.dev
Cc: Mostafa Saleh <smostafa@google.com>, kvmarm@lists.linux.dev, 
	Oliver Upton <oupton@kernel.org>, Marc Zyngier <maz@kernel.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Migadu-Flow: FLOW_OUT

On Thu, 6 Aug 2026 at 16:32, <sashiko-bot@kernel.org> wrote:
>
> Thank you for your contribution! Sashiko AI review found 2 potential issu=
e(s) to consider:
>
> New issues:
> - [High] Virtual timer traps are inadvertently disabled for non-protected=
 guests under pKVM on hardware with broken CNTVOFF_EL2, breaking their conf=
igured timer offsets.
>
> Pre-existing issues:
> - [High] `__timer_enable_traps()` uses the global `is_protected_kvm_enabl=
ed()` check and an unsynced `poffset`, unconditionally disabling physical t=
imer traps for non-protected VMs under pKVM.

This only runs on broken-CNTVOFF hardware, where the workaround pins
CNTVOFF_EL2=3D0 for all guests. Dropping the trap changes nothing
observable.


/fuad

> --
>
> --- Patch [1]: [PATCH] KVM: arm64: Fix hvhe and broken CNTVOFF_EL2 ---
> commit d5e405a74fba9d73744f97970471012a4473ce3c
> Author: Mostafa Saleh <smostafa@google.com>
> Subject: KVM: arm64: Fix hvhe and broken CNTVOFF_EL2
>
> The commit fixes a guest kernel panic when launching a protected VM with
> protected hvhe mode on hardware with a broken CNTVOFF_EL2. It achieves
> this by conditionally enabling virtual timer traps only when the guest
> actually has a non-zero virtual timer offset.
>
> > diff --git a/arch/arm64/kvm/hyp/nvhe/timer-sr.c b/arch/arm64/kvm/hyp/nv=
he/timer-sr.c
> > index ff176f4ce7deb..98b6e37ee8fa4 100644
> > --- a/arch/arm64/kvm/hyp/nvhe/timer-sr.c
> > +++ b/arch/arm64/kvm/hyp/nvhe/timer-sr.c
> [ ... ]
>
> [Severity: High]
> This is a pre-existing issue, but does the physical timer trap logic earl=
ier
> in __timer_enable_traps() improperly grant all guests under pKVM access t=
o
> the physical timer?
>
> Looking at the physical timer access check in this function:
>
>         if (is_protected_kvm_enabled() ||
>             !kern_hyp_va(vcpu->kvm)->arch.timer_data.poffset)
>                 set |=3D CNTHCTL_EL1PCTEN;
>
> The is_protected_kvm_enabled() static key reflects host pKVM support and
> applies to all guests. Additionally, the fallback poffset check evaluates=
 to
> true under pKVM because the EL2-private hyp_vm->kvm is never populated wi=
th
> the host's poffset during init_pkvm_hyp_vm().
>
> Can this cause non-protected VMs on older hardware without CNTPOFF_EL2 to
> bypass physical timer offset emulation and read the raw physical timer
> directly?
>
> > @@ -63,7 +64,7 @@ void __timer_enable_traps(struct kvm_vcpu *vcpu)
> >        * Trap the virtual counter/timer if we have a broken cntvoff
> >        * implementation.
> >        */
> > -     if (has_broken_cntvoff())
> > +     if (has_broken_cntvoff() && hyp_timer_get_offset(vcpu_vtimer(vcpu=
)))
>
> [Severity: High]
> Could this condition inadvertently disable virtual timer traps for
> non-protected guests under pKVM?
>
> The new check evaluates hyp_timer_get_offset(vcpu_vtimer(vcpu)). However,
> under pKVM (nVHE), the EL2-private pkvm_hyp_vcpu structure's timer_cpu st=
ate
> is never synchronized from the host vCPU during init_pkvm_hyp_vcpu() or
> flush_hyp_vcpu().
>
> Since ctxt->offset.vm_offset remains NULL, hyp_timer_get_offset() will
> unconditionally return 0. Will this allow any non-protected guest with a
> configured virtual timer offset to bypass the trap and incorrectly observ=
e an
> offset of 0?
>
> >               set |=3D CNTHCTL_EL1TVT | CNTHCTL_EL1TVCT;
> >
> >       sysreg_clear_set(cnthctl_el2, clr, set);
>
> --
> Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260806150105.40=
10701-1-smostafa@google.com?part=3D1
>
