Received: from mta0.migadu.com (out-141.mta0.migadu.com [91.218.175.141])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5A55B3AF65C
	for <sashiko-reviews@lists.linux.dev>; Fri, 21 Aug 2026 07:38:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=91.218.175.141
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787297897; cv=none; b=nsJDOCHhkl0F55HyLB0mK96RzQyhT9dlzIa7vh6xlqNxtgPIgxZ/HTu8HqHmDoAxPRmILQWQX5D1beybqsUlaFGn6ik+NJ6s1V8KrlzbrJWIEsgtVRfe9G61pZ3Het3h4RceAoxmXPrmPEjEemgyguawicZR9klBIiXy+UGwbUw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787297897; c=relaxed/simple;
	bh=yah7MrKK7PNquSWPJQDCIwVZ2JPFu1xOp+2NvgehUVA=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=ebo9yV0hAlYPxjR7nKDy8d36KHlTPLkxBkkK8FQsTNQur9SJ0owj75WmpIixUF9aSKPwz3aacbcJt+FMjDAdZUOmxXnSiPyur/wPz9j6BONDtcbbgsfg5wxfvwtRafVb8mO2TDSwgHc4FHYlzB6cLGOzg2qTqTUAFtte3ESd+MI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.dev; spf=pass smtp.mailfrom=linux.dev; dkim=pass (1024-bit key) header.d=linux.dev header.i=@linux.dev header.b=cjvF4HMN; arc=none smtp.client-ip=91.218.175.141
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.dev
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.dev
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linux.dev header.i=@linux.dev header.b="cjvF4HMN"
X-Envelope-To: sashiko-reviews@lists.linux.dev
DKIM-Signature: a=rsa-sha256; bh=yah7MrKK7PNquSWPJQDCIwVZ2JPFu1xOp+2NvgehUVA=;
 c=simple/simple; d=linux.dev;
 h=from:to:subject:date:message-id:mime-version:content-type; s=key1;
 t=1787297886; v=1; x=1787902686;
 b=cjvF4HMNjkUNc7Zvk8hFDzdHXsA0mzfYDkjE+U3enN5oAgzW9XkCNR8nHFOHDnvRA1pBddWK
 RiZ+gFHicvXhmwcIooFWQhClvR8FHYUbu8QxzjYmZ8NQfHXlp0+E1tRqaKrVBmNqXo7auv92pKS
 ZHFo/Wbz9md4gNhQMBP58Oso=
X-Envelope-To: sashiko-reviews@lists.linux.dev
Received: from mail-lf1-f46.google.com (209.85.167.46)
	by smtp.migadu.com with ESMTPS id f1a181b8429e6cab;
	Fri, 21 Aug 2026 07:38:06 +0000
X-Mizu-Trace-ID: f1a181b8429e6cab
X-Migadu-Flow: FLOW_OUT
Received: by mail-lf1-f46.google.com with SMTP id 2adb3069b0e04-5b2a73da7e1so7170e87.0
        for <sashiko-reviews@lists.linux.dev>; Fri, 21 Aug 2026 00:38:02 -0700 (PDT)
X-Gm-Message-State: AFuF++nPd9JRHOV/pgGx1IS/QgbyJ7UilHKK+SP2M5UdHboiYzMQHeiT
	mU/22pVbwkipczeAWCriyXBz0CdL2OcJ+uml2D/e3FLnUFpB0ry8QuG5aokzF2b/1TxSIClKScv
	K2/v2cqtEGSx/7P4+H6MxdeGI9nifjQRLCuahDyDK
X-Received: by 2002:a05:6512:ba3:b0:5b2:8963:e5d4 with SMTP id
 2adb3069b0e04-5b484abe418mr132544e87.5.1787297880970; Fri, 21 Aug 2026
 00:38:00 -0700 (PDT)
Precedence: bulk
X-Mailing-List: sashiko-reviews@lists.linux.dev
List-Id: <sashiko-reviews.lists.linux.dev>
List-Subscribe: <mailto:sashiko-reviews+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:sashiko-reviews+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20260821064445.615838-1-fuad.tabba@linux.dev> <20260821064445.615838-2-fuad.tabba@linux.dev>
 <20260821065743.3563C1F000E9@smtp.kernel.org>
In-Reply-To: <20260821065743.3563C1F000E9@smtp.kernel.org>
From: Fuad Tabba <fuad.tabba@linux.dev>
Date: Fri, 21 Aug 2026 08:37:24 +0100
X-Gmail-Original-Message-ID: <CA+EHjTy6Qb8dv_apBg4RVU+V-LsP1Z+BkDYfRKLX0f6PnbKpeg@mail.gmail.com>
X-Gm-Features: AcwNN1V3Jgp2N0wWKRNXl0kP7pIhBFQl-DudY3Ff6wk0kH-wghLTEWnL5baySig
Message-ID: <CA+EHjTy6Qb8dv_apBg4RVU+V-LsP1Z+BkDYfRKLX0f6PnbKpeg@mail.gmail.com>
Subject: Re: [PATCH v2 1/4] KVM: arm64: vgic-its: Free the caches when
 GITS_BASER changes
To: sashiko-reviews@lists.linux.dev
Cc: Oliver Upton <oupton@kernel.org>, kvmarm@lists.linux.dev, 
	Marc Zyngier <maz@kernel.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Sashiko, this one is real.

On Fri, 21 Aug 2026 at 07:57, <sashiko-bot@kernel.org> wrote:
>
> Thank you for your contribution! Sashiko AI review found 1 potential issu=
e(s) to consider:
>
> Pre-existing issues:
> - [High] Pre-existing race condition in ITS MMIO handler allows MSI injec=
tion while ITS is disabled due to a stale translation cache entry.
> --
>
> --- Patch [1]: [PATCH v2 1/4] KVM: arm64: vgic-its: Free the caches when =
GITS_BASER changes ---
> commit 98c89973da07ed23e9bd8348bfd2cf61333c4e66
> Author: Fuad Tabba <fuad.tabba@linux.dev>
>
> KVM: arm64: vgic-its: Free the caches when GITS_BASER changes
>
> A guest that disables the ITS and changes GITS_BASER<n> with VALID still =
set
> keeps the mapped devices and collections. This patch frees the list and
> drops the translation cache whenever the stored value changes.
>
> Link: https://lore.kernel.org/all/87ecg9owwa.wl-maz@kernel.org/
>
> > diff --git a/arch/arm64/kvm/vgic/vgic-its.c b/arch/arm64/kvm/vgic/vgic-=
its.c
> > index 9e782a4fea7e5..ab89b0138efd0 100644
> > --- a/arch/arm64/kvm/vgic/vgic-its.c
> > +++ b/arch/arm64/kvm/vgic/vgic-its.c
>
> [ ... ]
>
> > @@ -1702,6 +1705,8 @@ static void vgic_mmio_write_its_baser(struct kvm =
*kvm,
> >                       vgic_its_free_collection_list(kvm, its);
> >                       break;
> >               }
> > +             /* A concurrent injection may have cached a translation. =
*/
> > +             vgic_its_invalidate_cache(its);
>
> [Severity: High]
> This is a pre-existing issue, but the commit message explicitly notes tha=
t
> an injection can still cache an entry after the ITS is disabled.
>
> Is it possible for a subsequent MSI to trigger an unexpected LPI injectio=
n?

Yes, and it violates the spec: with GITS_CTLR.Enabled =3D=3D 0 writes to
GITS_TRANSLATER are ignored, so nothing should be injected.

It was reported in June [1] and is being worked on.

Cheers,
/fuad

[1] https://lore.kernel.org/all/ah6Lsi4MfKUU6wBR@v4bel/

>
> If Thread 1 (e.g. irqfd) calls vgic_its_inject_msi(), takes its_lock, and
> enters vgic_its_resolve_lpi() in arch/arm64/kvm/vgic/vgic-its.c, it reads
> its->enabled as true.
>
> If Thread 2 (guest vCPU) concurrently disables the ITS via
> vgic_mmio_write_its_ctlr(), it acquires cmd_lock (but not its_lock), sets
> its->enabled to false, and clears the cache.
>
> Thread 1 could then resume, finish resolving the LPI, and call
> vgic_its_cache_translation() to insert the entry into the cache, ignoring=
 the
> fact that its->enabled is now false.
>
> A subsequent MSI would then hit vgic_its_inject_cached_translation(), whi=
ch
> does a fast-path lookup without checking its->enabled, successfully injec=
ting
> the MSI.
>
> Could this violate the GICv3 specification by delivering LPIs while the I=
TS
> is explicitly disabled, potentially crashing a guest OS during kexec?
>
> >               mutex_unlock(&its->its_lock);
> >       }
> >  }
>
> --
> Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260821064445.61=
5838-1-fuad.tabba@linux.dev?part=3D1
