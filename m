Received: from mail-ot1-f44.google.com (mail-ot1-f44.google.com [209.85.210.44])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F1DEA3859F9
	for <sashiko-reviews@lists.linux.dev>; Thu, 18 Jun 2026 06:45:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.210.44
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1781765114; cv=pass; b=RllKdkMdr3xCHIpUDxJxg4sT0ZbPxUb/tSWpUEgigKy46mco5vAKD+loOFMI6oRfSCVRGXzBYhdQU9AzykwqRgHcHcr6hB+mSX9cdUrrMLyAjmTGgaNJMGt1fYKn4T6XYGRkB9WVQgd0Lo2xXDhtlzrgv5+9kuqV7lUO+xtTXds=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1781765114; c=relaxed/simple;
	bh=sdWy0UMOuVbFCW8i16nWjLi7y01cjarkANI889btKS0=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=YTJaEvjtHBcbkqtU8NX06Z7x/RXpovfZsXCCyQXio4r5wf2qG3fOSl9TIktRtKcLtOWlLbSrOltcOceU31gP5A2CwFw+f2YyDwx6tr0ubMGqb9f6Qd79Eo9s63wNtMcEpcEiaWUnTm2eVaEIXO+ovGZDO4Ioxfa23DGIrz8479s=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=Z1jtV8+4; arc=pass smtp.client-ip=209.85.210.44
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="Z1jtV8+4"
Received: by mail-ot1-f44.google.com with SMTP id 46e09a7af769-7e6dcad6018so502906a34.3
        for <sashiko-reviews@lists.linux.dev>; Wed, 17 Jun 2026 23:45:11 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1781765111; cv=none;
        d=google.com; s=arc-20240605;
        b=Fxk16Vfm4mihalejtWwGGK7eDWhYau9kRS1NaH6n3cgL1Gwyipcl9AEYTXyu/tF5wn
         sz4HKifzgzJ2qlndw5jLWX4uNohVIihkKAODJKveDhRy0QzVwfmezuIPIaEYATfCGvOW
         ++nsk+eS0+UbCZMYcWStHNPjmPtxUjdr5VmwkCcAm7cVakZnVaVIxVP9Bi0ukvdNE1yK
         w0r4rH+IrvORtXF1tAN3Bt1FTu/9ED/4uqIcLep4gXIAx0yMQe55T2rvJ43ZmxDAeHZE
         zyrIkvSEzUVb6+1wJBcPMyq//nSZNmbMVKeKak92DFnMsJYNF8jjPuqT/hOj2ZoLda8b
         WAgQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=Aw7+Ysr8IWme6YKCtFAf4Wtx49VGl1R8xVbGoroEzf4=;
        fh=1ANcksFQ8byr9OCZkB9UeyFhQNT99Z2aR8Bb6CgP//E=;
        b=YV3k0yqCvyp3dp+uzFxkk40PkM8cnMsAQa927W9rugdhCqXan5P27AUaU3OXhHG7yN
         ua+QbWj83VDIvOVKmCNaIe5I0mvhreseXQIM9oXDVMNutU6SYKppIK4Z4xbrd2raGCC7
         8CXJ4cluYuegStWNbrNTQeh/bA/xQ2NrHSMC7QPR8ChfV2JhDqub+gXXFSC0jNecuRti
         9D73CTwYHCu5zCZmkKYkguUZiFBQNEZG2NYq3k0mhVPAPJYMc1u37NYcr4x0H5jp2f1+
         99eeZAjKINMZSnX3iWAUDGZlDdI3mOVxctR8j8giRW2fj2nUODrfR6PrBs138tZ27U6D
         9lYg==;
        darn=lists.linux.dev
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1781765111; x=1782369911; darn=lists.linux.dev;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Aw7+Ysr8IWme6YKCtFAf4Wtx49VGl1R8xVbGoroEzf4=;
        b=Z1jtV8+4EpisALx6VL8bpPNKdRkUqq9iC8aYuVl9SoUacomz0Jn5ZkugBFoQUILKac
         FBDe6byVVac9UHObWlbVU4H6AL+qxAttJH7s50sFBLPp1A7CL882TkWGm4xzKMgoKwH5
         9S5w/Ay39U7fquTBydmTE1XuL6Qd82KmVTfo6cusNpysZPGhh7QGjo85cyLSR5glXcpp
         Mwqsx1RDBOw6H1c4HMTubOK6n/0PuI0i786lUnJ1N5zOCnghI0xUe9XM6KmqBI2E2ayc
         kn73bTsV2exvUBjoXWms2cbatlR0QQ9yJ7JmRNTXO3VyG3/Phayut5Cp+DppzOZMR70P
         tvNA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1781765111; x=1782369911;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=Aw7+Ysr8IWme6YKCtFAf4Wtx49VGl1R8xVbGoroEzf4=;
        b=KOxhu7i1bf7LyDRljEhxa1tqc0RaZ3GPShBdhsnK8bCGNneXh495wCU9Ywt8A/kody
         4gpZwHqLjfO1+vWZkAbwevWOHihaZkKx4JyPFCUATPe3g+WWOEKa8ePQhB/oIFt3/6lH
         x+fzD87yoJKp9wGqsNmQcKbHX0fHKehtA3XmdtXhvwdog6hJHUGiNpL2wm+kEflJ9nzJ
         YVFWM3N/sSdzwikJgn1ZxgOMe7Qh+5HmCNgTEStd+31DaL5Qm93ja0riIdJlIUZY43PK
         Ch7rv2rq2UtQ2c2Kawz+GHVifFMDakFQx+riDJ0sEM3LxjmJdoRPt9FiPCZd/tsW9lOR
         3YDQ==
X-Gm-Message-State: AOJu0Yz5w1bUQlkf0o7vC0K6V3nuRVP7TU2YkwxtgOeqfy69iXIiOCBa
	1lefRk38PyHrYEoucCSFTIhtAmBYn2PiyDCmPR49hcksJh18WdYJiS+e9fec7ialkLyANLIUPwP
	vhsMrR5ZAh+d9Uprc0CxqRtHVgx3ofx7tNnpyrP4GfcoTHUE=
X-Gm-Gg: Acq92OHqUnBnE9odWpwJqa8Wq1grGcAVMjVd8FmuPt7FauTN4Lh2QVkzOstR9YyHFdH
	tgcBFvMEVPbWh7JSRCK3oCGRkrikiUjk5r0AvADgYd8RCujv7pZ+NgPAlIYIA4a1AOeCUJ//NJs
	mEkao/WX3w77yV+GRwOKQ+DfGGFn5Lve7jD/uzQEOprR6WuzGE/pv3EbapU/S8ZvncDuL/qUsE2
	Y2bA4lsY1a9AGVRe+yj+3YOPuCbE6aoi0SiF1Z3F+v6MUm8QLP9oy47DxFj1s10jwxPBz/eSw4=
X-Received: by 2002:a05:6830:6d4f:b0:7dc:df37:844b with SMTP id
 46e09a7af769-7e91c0fbf54mr2313833a34.4.1781765110831; Wed, 17 Jun 2026
 23:45:10 -0700 (PDT)
Precedence: bulk
X-Mailing-List: sashiko-reviews@lists.linux.dev
List-Id: <sashiko-reviews.lists.linux.dev>
List-Subscribe: <mailto:sashiko-reviews+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:sashiko-reviews+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20260618055216.56191-1-mikhail.v.gavrilov@gmail.com> <20260618061728.75BDF1F000E9@smtp.kernel.org>
In-Reply-To: <20260618061728.75BDF1F000E9@smtp.kernel.org>
From: Mikhail Gavrilov <mikhail.v.gavrilov@gmail.com>
Date: Thu, 18 Jun 2026 11:44:58 +0500
X-Gm-Features: AVVi8CcdRAiVNAPkl0B3_vJtXygoy8kBQDI2uhJDlcKLkPHtrH-T6C0HJWVrOP8
Message-ID: <CABXGCsNgUaSkfLw1Nn7-BzD2LBUqscQJtce0Wk6F9pK0+Y6Zyw@mail.gmail.com>
Subject: Re: [PATCH] drm/amdgpu: do not enter fs_reclaim under notifier_lock
 in lockdep training
To: sashiko-reviews@lists.linux.dev, Alex Deucher <alexander.deucher@amd.com>, 
	=?UTF-8?Q?Christian_K=C3=B6nig?= <christian.koenig@amd.com>, 
	Vitaly Prosyak <vitaly.prosyak@amd.com>
Cc: dri-devel@lists.freedesktop.org, David Airlie <airlied@gmail.com>, 
	Simona Vetter <simona@ffwll.ch>, amd-gfx list <amd-gfx@lists.freedesktop.org>, 
	Linux List Kernel Mailing <linux-kernel@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Thu, Jun 18, 2026 at 11:17=E2=80=AFAM <sashiko-bot@kernel.org> wrote:
>
> Thank you for your contribution! Sashiko AI review found 1 potential issu=
e(s) to consider:
>
> Pre-existing issues:
> - [High] Removing the `fs_reclaim` lockdep annotation silences a true-pos=
itive warning about a real ABBA deadlock between memory reclaim and GPU res=
et, rather than fixing the underlying bug.
> --
>
> commit 4896f663f62249014930226b2bc964c2419486d0
> Author: Mikhail Gavrilov <mikhail.v.gavrilov@gmail.com>
>
> drm/amdgpu: do not enter fs_reclaim under notifier_lock in lockdep traini=
ng
>
> The commit removes the fs_reclaim_acquire() and fs_reclaim_release() call=
s
> from amdgpu_lockdep_init() to silence a circular locking dependency warni=
ng,
> claiming it is a false positive.
>
> > diff --git a/drivers/gpu/drm/amd/amdgpu/amdgpu_lockdep.c b/drivers/gpu/=
drm/amd/amdgpu/amdgpu_lockdep.c
> > index d5d71fd7c70d0..eeb3b5007f80f 100644
> > --- a/drivers/gpu/drm/amd/amdgpu/amdgpu_lockdep.c
> > +++ b/drivers/gpu/drm/amd/amdgpu/amdgpu_lockdep.c
> > @@ -150,12 +150,6 @@ int amdgpu_lockdep_init(void)
> >       /* Level 6: Reset control lock */
> >       mutex_lock(&reset_ctl.reset_lock);
> >
> > -     /*
> > -      * Mark potential memory reclaim boundary.
> > -      * GPU operations might trigger memory allocation/reclaim.
> > -      */
> > -     fs_reclaim_acquire(GFP_KERNEL);
> > -
>
> [Severity: High]
> This is a pre-existing issue, but does removing this lockdep annotation
> silence a true-positive warning about a real ABBA deadlock?
>
> While the circular dependency might not happen in the same thread, couldn=
't a
> cross-thread deadlock occur between memory reclaim and GPU reset?
>
> For example, if Thread A executes the MMU notifier amdgpu_hmm_invalidate_=
gfx()
> (e.g., during direct reclaim), it acquires adev->notifier_lock and blocks=
 in
> dma_resv_wait_timeout() waiting for a hardware fence:
>
> drivers/gpu/drm/amd/amdgpu/amdgpu_hmm.c:amdgpu_hmm_invalidate_gfx() {
>         ...
>         mutex_lock(&adev->notifier_lock);
>         ...
>         r =3D dma_resv_wait_timeout(vm_root->tbo.base.resv,
>                                   DMA_RESV_USAGE_BOOKKEEP, false,
>                                   MAX_SCHEDULE_TIMEOUT);
> }
>
> If Thread B (the GPU reset thread) takes down_write(&adev->reset_domain->=
sem)
> to reset the GPU and signal the fences, and performs GFP_KERNEL allocatio=
ns,
> it could be forced into direct memory reclaim (fs_reclaim). This would in=
voke
> the MMU notifier, attempting to acquire adev->notifier_lock, forming a cy=
cle.
>
> Would it be better to fix the underlying deadlock by wrapping the GPU res=
et
> path with memalloc_noreclaim_save() or memalloc_noio_save() to prevent it
> from entering memory reclaim, instead of removing the lockdep annotation?
>
> --
> Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260618055216.56=
191-1-mikhail.v.gavrilov@gmail.com?part=3D1

The reported splat is not the reset/reclaim deadlock described here.

It is single-threaded: kswapd holds fs_reclaim and the mmu_notifier range,
then takes notifier_lock in amdgpu_hmm_invalidate_gfx(). That is the normal=
,
mandatory direction fs_reclaim -> mmu_notifier -> notifier_lock. The MMU
notifier callback runs from inside reclaim, so notifier_lock is acquired
below fs_reclaim and is never held across a reclaiming allocation.

amdgpu_lockdep_init() asserts the opposite edge, notifier_lock -> fs_reclai=
m,
by calling fs_reclaim_acquire() while notifier_lock is held. That edge does
not occur at runtime, so the reported cycle is a false positive. Dropping t=
he
annotation removes the impossible edge and touches no real lock.

On the cross-thread reset case: if the reset path really holds
reset_domain->sem across a GFP_KERNEL allocation, lockdep learns
reset_sem -> fs_reclaim from that real allocation, not from this annotation=
.
The fs_reclaim_acquire() here adds nothing for that real edge; it only inje=
cts
the impossible notifier_lock -> fs_reclaim one. And because it fires on the
innocent kswapd path, it calls debug_locks_off() and disables lockdep for t=
he
rest of the boot, which would prevent detecting exactly that reset deadlock=
.

Note memalloc_noreclaim_save() on the reset path would not silence this spl=
at:
the false edge lives in amdgpu_lockdep_init(), independent of the reset pat=
h.
The splat reproduces with a userptr BO + MADV_PAGEOUT and is gone after thi=
s
change; I verified both.

If reset is confirmed to allocate under reset_domain->sem with reclaim, tha=
t
is a real and separate issue and memalloc_noreclaim_save() there would be
reasonable, but it is a different patch and does not change this one.

--=20
Best Regards,
Mike Gavrilov.
