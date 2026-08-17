Received: from mta1.migadu.com (out-22.mta1.migadu.com [95.215.58.22])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DF3B4471CE9
	for <sashiko-reviews@lists.linux.dev>; Mon, 17 Aug 2026 18:41:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=95.215.58.22
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1786992095; cv=none; b=PjRDcCGpfHl7gjVec7m4EUWAN0RaI3gAO+hemtE+Q3D9StFU215rhxpPJvJ6gTQRqcm2awz76lV4o0Wdd35fQspkqBZMbAfeFJW8DnSnEtw+6rnLjiEUtKJ2RKbJMO6DoT6MjpsSA5e635vwbsg8MnaXKCo/ntPX4Hu30SDqPuQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1786992095; c=relaxed/simple;
	bh=RrHhJ3A9FoasjBOLHlVqix4YEDNoiM+OR7lzWl4jd7s=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=LF0VJJ+vmPtcoAW6EmiIOOatqWB4bNlDdveaeah2iL4yPhFh8NH4+Mva7gLqNbn3XgUMqU/x3Mn/ENIFQT+t5eUISYqAtgJKNRYHJgJlAQiXjQRcD6WbAEGUVACWgHGni+FtX8ltO/H5wwYrPzbvlJgo+80w8TgDQSDyIW+zmNI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.dev; spf=pass smtp.mailfrom=linux.dev; dkim=pass (1024-bit key) header.d=linux.dev header.i=@linux.dev header.b=BJ5b2NLP; arc=none smtp.client-ip=95.215.58.22
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.dev
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.dev
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linux.dev header.i=@linux.dev header.b="BJ5b2NLP"
X-Envelope-To: sashiko-reviews@lists.linux.dev
DKIM-Signature: a=rsa-sha256; bh=RrHhJ3A9FoasjBOLHlVqix4YEDNoiM+OR7lzWl4jd7s=;
 c=simple/simple; d=linux.dev;
 h=from:to:subject:date:message-id:mime-version:content-type; s=key1;
 t=1786992091; v=1; x=1787596891;
 b=BJ5b2NLPtCZVnwTzcm4krFucQ9LXX3AEv0wEwf6VSNUPzb4VXRKB+QfWEc+9CeZSmHvrWzU1
 zgNswfaS6PG5/GCMfvzokSCghJ4ZR8QPZPULZ3gyTaUuxNbMKiYvYZhGTZV2s8jWYfaG/J9XTeX
 uMhyC3ohfVvOkvjJJtk/iZk0=
X-Envelope-To: sashiko-reviews@lists.linux.dev
Received: from mail-lf1-f48.google.com (209.85.167.48)
	by smtp.migadu.com with ESMTPS id f85e5bfcb376c63c;
	Mon, 17 Aug 2026 18:41:21 +0000
X-Migadu-Flow: FLOW_OUT
Received: by mail-lf1-f48.google.com with SMTP id 2adb3069b0e04-5b0129cf6ffso1232e87.0
        for <sashiko-reviews@lists.linux.dev>; Mon, 17 Aug 2026 11:41:17 -0700 (PDT)
X-Gm-Message-State: AOJu0YwXDFDQLJKY3+0bjARWGjYuGasjvfnzZpFB3/Cl/1gji7VjnhFW
	PKtN6WB9u54GYSV+A6Pxm8q19Eoua6j35Koi5ljJfH/Bw3BN31i82uSzxASKr1lunY0Kp06/tOO
	J3AczybvrvK1GnGoIXpuNU61/qvzcXy//LYoYEK2G
X-Received: by 2002:a05:6512:4027:b0:5b1:5e30:ab4d with SMTP id
 2adb3069b0e04-5b471fde592mr33238e87.5.1786992076773; Mon, 17 Aug 2026
 11:41:16 -0700 (PDT)
Precedence: bulk
X-Mailing-List: sashiko-reviews@lists.linux.dev
List-Id: <sashiko-reviews.lists.linux.dev>
List-Subscribe: <mailto:sashiko-reviews+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:sashiko-reviews+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20260807104102.2410744-1-fuad.tabba@linux.dev>
 <20260807104102.2410744-3-fuad.tabba@linux.dev> <20260807105558.73D701F000E9@smtp.kernel.org>
 <CA+EHjTwVKkAwWUeMrF_m2-35kyhESqAezOKJy-Pj=vA3qE5Bjw@mail.gmail.com> <87fr0pq5uu.wl-maz@kernel.org>
In-Reply-To: <87fr0pq5uu.wl-maz@kernel.org>
From: Fuad Tabba <fuad.tabba@linux.dev>
Date: Mon, 17 Aug 2026 19:40:40 +0100
X-Gmail-Original-Message-ID: <CA+EHjTyQ-1sUhgs0LNuPa-VJ=J=+vS7UCwJJU0ATJG9LtEQpSA@mail.gmail.com>
X-Gm-Features: AcwNN1VrtrWbBJrYrjs_GvIHapN_ve_R88uonv4ayDAbGZQ7xJ3qvWzDpPWhULU
Message-ID: <CA+EHjTyQ-1sUhgs0LNuPa-VJ=J=+vS7UCwJJU0ATJG9LtEQpSA@mail.gmail.com>
Subject: Re: [PATCH v2 2/4] KVM: arm64: vgic: Don't leak the SPI array when
 init is retried
To: Marc Zyngier <maz@kernel.org>
Cc: sashiko-reviews@lists.linux.dev, kvmarm@lists.linux.dev, 
	Oliver Upton <oupton@kernel.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Fri, 7 Aug 2026 at 16:58, Marc Zyngier <maz@kernel.org> wrote:
>
> On Fri, 07 Aug 2026 13:15:52 +0100,
> Fuad Tabba <fuad.tabba@linux.dev> wrote:
> >
> > On Fri, 7 Aug 2026 at 11:56, <sashiko-bot@kernel.org> wrote:
> > >
> > > Thank you for your contribution! Sashiko AI review found 1 potential =
issue(s) to consider:
> >
> > No, thank _you_ Sashiko!
> >
> > >
> > > Pre-existing issues:
> > > - [High] If `vgic_init()` fails after `vgic_v4_init()` succeeds, the =
VPE array is left allocated but `vgic_initialized` remains false. Userspace=
 can then create additional VCPUs and retry `vgic_init()`. The second `vgic=
_v4_init()` returns early because the VPE array is already allocated, leavi=
ng the new VCPUs without initialized VPE IRQs.
> > ...
> > > When a new VCPU runs, `vgic_v4_load()` calls `irq_set_affinity()` wit=
h an uninitialized IRQ (0), which fails and triggers a host `WARN_ON`, caus=
ing a host-side denial of service.
> >
> > This is a separate fix. But you're right about the state.
> > kvm_arch_vcpu_precreate() only refuses vCPUs once vgic_initialized()
> > is true, so the retry admits one the VPE array does not cover.
> >
> > I don't think a VMM can drive it. kvm_vgic_setup_default_irq_routing()
> > is the only failure after vgic_v4_init(), and it builds its own
> > routing entries, so nothing short of a real -ENOMEM fails it.
> >
> > The fix I have in mind keeps vgic_v4_init() idempotent, as this patch
> > is: return early only while the vCPU count is unchanged, rebuild when
> > it grew. That needs its_free_vcpu_irqs() to clear vm->domain and
> > vm->fwnode first, which it does not today, so its_alloc_vcpu_irqs()
> > can reach its error path with a domain it has already removed.
> >
> > Let me think about it some more and I'll send something once others
> > have had a chance to digest this as well.
>
> I don't think we should grow anything opportunistically.
>
> The GICv4 code expects the number of vcpus to be fixed when first
> initialised, and if we must fail it one way or another, then
> everything should be torn down and reinitialised from scratch.
>
> I really don't want to have to think about the intermediate state.

Agreed. I'll drop the idempotent version I sketched and do teardown
and reinit instead.

Cheers,
/fuad

>
> Thanks,
>
>         M.
>
> --
> Jazz isn't dead. It just smells funny.
