Received: from mail-yw1-f173.google.com (mail-yw1-f173.google.com [209.85.128.173])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CB3323CEB9E
	for <sashiko-reviews@lists.linux.dev>; Mon, 12 Oct 2026 13:56:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.128.173
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791813407; cv=pass; b=gxvyLnAL8HASO043aMoyFEWoQaaFuaPoj8srO8Zsu2AMqakAbi7G5l97l3iko414ReiTgXLX2SUKtZ4HXP6F+pwf09jeqDDG4W9OdruGKW+5y8Thw7SUaRIOa81TJeQGEZWRQZJlPUJMFwH/XMylphkp60rHCsOeEk3P5M1rxtk=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791813407; c=relaxed/simple;
	bh=AXk7YQzZGdPsV1Y19stqR/+N6Eth+uynV8aOKDjd7qQ=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=pC4sJs/UbHyIx1Pe6TagDxjn/KnpeXCVeZQrTuqg407sQ6nxDXuFMZdvjqpS9/sOslCv6B7mgr40UY+4G5oJP4hd4r3o4BJp/vfjmZnlhJJEeM+aycY4cW10+B8P+5l1uxbncwRgeWcI8p8MQd1dNyrPdRjyCbOrkn8c1aqYoaM=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=Mpn436Lr; arc=pass smtp.client-ip=209.85.128.173
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="Mpn436Lr"
Received: by mail-yw1-f173.google.com with SMTP id 00721157ae682-8ac9d666d4eso12294327b3.3
        for <sashiko-reviews@lists.linux.dev>; Mon, 12 Oct 2026 06:56:45 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1791813405; cv=none;
        d=google.com; s=arc-20260327;
        b=pwV9JuNjYlccSU/jOEygANsTT7xch/WDxKPaK6UvUcmJUeXBCfVU06NIIVH1N7LuAe
         cvYf7jjqwa/Iv1H4AWnoRjFGPUBjPzKmXaX2OBjKo/mCSdZKMah77tvWYfV1vm+8YJjS
         NNhX42/HWeZz3/gPs8Xr8ZFpQi/NM5tUv7DG+0qbyS+LsX/ZV8yfSi754Uw/dxOg5PyD
         TC1VpKIDFupEUvaVKIya5e0n3YGyzri7bR/aCcmj/91uPKZm24Pu4B/bwm/ye+CXIk4b
         rM6YenZlJm6JydIWkY5UyrYEVCk8Lc8u1dc3oHmDnu9DeYaUXLugfLAYYDbe9oihWVdh
         M4Nw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=zUSJf6l0CJa1NnRQ8xG0jpJk1bJoecmuqzqR9c6U0fY=;
        fh=DmtMrhf/F7icu9kWVbA50OX2nW3SfqLC9TWo/aumy44=;
        b=BVSFLgY412ExjN5EDTbLegN1WCcVVdruTG/7n3pSwHjMI+troH7iyZ95JS9RXDk6oJ
         +QSvMNl5ZQtkjq28939PWlxG6DDr6XoXXEhEvobx7KM1Rnu5Tfnj3JM1hKeLZH/IN6OX
         e9ZiqtERHpQ/hqXvRvLZ5eU8bm+h///40tNT67T9tZVy0+nxBebEvDhW+KDrSa8FZtNh
         jdUoSCShmq4cOHVbHXolrEXxIKDLAfqzI923M6qywA1EMC1R1/vFm+4bo0WETNL0Xvrz
         MtZxprBE54W7xHNpTzQKRZ7l3ZNBgAc/c73ZfaC84WAGi3+D3gvCm/c7j/rudifx+mMT
         qYIQ==;
        darn=lists.linux.dev
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1791813405; x=1792418205; darn=lists.linux.dev;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=zUSJf6l0CJa1NnRQ8xG0jpJk1bJoecmuqzqR9c6U0fY=;
        b=Mpn436LrMWBdbZ/ARGrvbrimqIx1Qb1RS0mtk7E9j2/xD80utCnx7p0Qcmf0DT2wUe
         hp8WfuO3H1zNFeWb1pgne30FPrYUYLVd5Hg6XXUJQmwZjc70FmGadIg3ZiDEU81e7TB4
         kAnl6WW5jeGm8L+rdPiV5VTxE6fE0dzvfHnvzsIhdSRCFcFnw/iW3cDloNeTzvEN46uB
         JyrkLMGSk+kufMTgZp+bApv9xRW3ZzHJFMcWk24P9Z89kAuHpZAMATT22RaGf0KSpHcN
         KKGNwdChU7zAWPJbc0rl6LNEOfUDCM47RFGDF1J2sjWwqKxTDddc0/pWQ7uL8nXqtmOS
         6AIg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791813405; x=1792418205;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=zUSJf6l0CJa1NnRQ8xG0jpJk1bJoecmuqzqR9c6U0fY=;
        b=cU5NFB6BLwlLpLQSbjOs/WeeubiSx+F16h1l+3duVVQkbVVQCkPX7k/vwP84eASVmT
         Q+lqJSRmIARD9lHDBzAIDDS9gLIsWuw9DmVz1CzowUirnCKc2QlQchw5UJT7CplDg0sT
         NHTr82PO3j7KnGPYBe6pxYhy46sSmLIQ68epSbZGxdNE/Wqe0ttzM2+2EjRnfkiiZ1UH
         OntWQfhl1l3H29GBWREumI4K4BNktaz6lCmmecsVbwMJr6pnP9dOmt0/KFHJxpOO7BGi
         7Iu0+PUF5S7XoazjS2XsjdsTpGvndMxn4gnUMx8rMzq0Vi1yQhSkX5J1p9WdrjeeboIT
         IdzA==
X-Gm-Message-State: AFq9FYKso1Plf3M79A0f1xkTJHNv4cAd2HsKDlVFLoVSeE9uIASi/r/T
	f5JmfbwsATPeNA2P8laGyD5qeHu/jF65cXcKYmVLazJ1wHScLmH61QsdonZABPVnTXVOSsz9M7a
	Lx7d41ZbNvT0Id4dIbq9LGSdaITkrd87c520SCO8=
X-Gm-Gg: AYBFou09Vq1odm/F3YEe+wHUZFQ6RSkBKaH3s8yRgmQUGFnhTnwA7MUExu+Fq8fFZJw
	OeeAhZxLwNVAO25mzo1gkpmr3tF8ew7OrLwvTO/QW5sDLkcFOGO77kffz3+rSCieycevRHimpT2
	vHcouuFuTEs59hFZNAXyig2LkZSwZKNx/AO2697b1tPdktQ2sZedIFTaKYd2KbEvoa6py5LxYoD
	iye24wumQ6CyF2Va5mHgKyc72s8RmMEw4COhVdd+58gTYmkmqzKQigl74ng6TZBwwky9of+0b0b
	v9tyZyDxWrYbmPxxpdw5tGUnqycP9YDnDiuOdoFFbbQtTDR0bv/2YWzzwoUDrMByBcctzgSukEQ
	cdekNnxdotw==
X-Received: by 2002:a05:690c:c3b7:b0:8b0:702f:1169 with SMTP id
 00721157ae682-8b07edb7254mr19201297b3.38.1791813403774; Mon, 12 Oct 2026
 06:56:43 -0700 (PDT)
Precedence: bulk
X-Mailing-List: sashiko-reviews@lists.linux.dev
List-Id: <sashiko-reviews.lists.linux.dev>
List-Subscribe: <mailto:sashiko-reviews+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:sashiko-reviews+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20261012120438.52849-1-laoar.shao@gmail.com> <20261012120438.52849-3-laoar.shao@gmail.com>
 <sashiko-outbox-168093@kernel.org>
In-Reply-To: <sashiko-outbox-168093@kernel.org>
From: Yafang Shao <laoar.shao@gmail.com>
Date: Mon, 12 Oct 2026 21:55:54 +0800
X-Gm-Features: AclHuK_hWKERSs8YM5btLTPqoL7z0K5nG8ilNCIMeTV20zODt-3yd-QFVAUCxgQ
Message-ID: <CALOAHbADKfZRuJD=B0bcBz_=QQ96dA=YKj_xvPZpsxF5V5A-xw@mail.gmail.com>
Subject: Re: [RFC PATCH v2 2/3] sched: add per-cgroup NUMA balancing mode
 selection via BPF
To: sashiko-reviews@lists.linux.dev
Cc: tj@kernel.org, mkoutny@suse.com, hannes@cmpxchg.org, bpf@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Mon, Oct 12, 2026 at 8:25=E2=80=AFPM <sashiko-bot@kernel.org> wrote:
>
> Thank you for your contribution! Sashiko AI review found 4 potential issu=
e(s) to consider:
> - [High] mm: folio_can_map_prot_numa() disables NORMAL NUMA balancing on =
top-tier nodes when TIERING is active
> - [High] sched: AB-BA deadlock in bpf_numab_mode (rq->lock -> pi_lock)
> - [High] bpf: missing __nullable annotation in bpf_numab_ops leads to ker=
nel panic
> - [Medium] sched: BPF NUMA balancing opt-in ignored by LLC scheduling
> --
>
> commit 3975a69bbe7653d443a34c5ce6984dadc110d558
> Author: Yafang Shao <laoar.shao@gmail.com>
>
> sched: add per-cgroup NUMA balancing mode selection via BPF
>
> Global NUMA balancing is all-or-nothing: kernel.numa_balancing and
> kernel.numa_balancing_mode pick the mode for every workload. A
> latency-sensitive service wants the scheduler's NUMA statistics but
> not tiering's promotion machinery. This patch adds a bpf_numab_ops
> struct_ops to allow policies attached to a cgroup to pick a mode.
>
> > diff --git a/include/linux/bpf_numab.h b/include/linux/bpf_numab.h
> > --- /dev/null
> > +++ b/include/linux/bpf_numab.h
> [ ... ]
> > +struct bpf_numab_ops {
> > +     /**
> > +      * numab_mode - request a NUMA balancing mode
> > +      * @p: task the NUMA balancing machinery is about to act on, or N=
ULL
> > +      * @folio: folio whose NUMA balancing semantics are being decided=
,
> > +      *         or NULL
> > +      *
> > +      * Exactly one of @p and @folio is set. The kernel passes @p when
> [ ... ]
> > +      * Return: bits from enum bpf_numab_mode.  Other bits are dropped=
.
> > +      */
> > +     u32 (*numab_mode)(struct task_struct *p, struct folio *folio);
>
> [Severity: High]
> Could the lack of a __nullable annotation here lead to a NULL pointer
> dereference in user BPF programs?

Nice catch.

It should be
u32 (*numab_mode)(struct task_struct *p__nullable, struct folio
*folio__nullable);

>
> The BPF verifier relies on the __nullable suffix on struct_ops stub
> arguments to mark them as PTR_MAYBE_NULL. Without it, the verifier assume=
s
> they are strictly non-NULL and optimizes away any user-provided NULL chec=
ks.
> When the kernel passes a NULL argument (as designed, since only one of p =
or
> folio is set), the executing BPF program will crash the system.
>
> > +};
> [ ... ]
> > diff --git a/include/linux/sched/numa_balancing.h b/include/linux/sched=
/numa_balancing.h
> > --- a/include/linux/sched/numa_balancing.h
> > +++ b/include/linux/sched/numa_balancing.h
> [ ... ]
> >  static inline bool task_numab_enabled(struct task_struct *p)
> >  {
> > +     u32 state =3D bpf_numab_mode(p, NULL);
> > +
> > +     /* A policy can always opt out, regardless of the global state. *=
/
> > +     if (state & BPF_NUMAB_DISABLED)
> > +             return false;
> > +     if (state & (BPF_NUMAB_NORMAL | BPF_NUMAB_TIERING))
> > +             return true;
> >       return static_branch_unlikely(&sched_numa_balancing);
> >  }
>
> [Severity: Medium]
> Is this BPF opt-in overlooked by the LLC scheduling logic?

Right, LLC scheduling was overlooked on my end. Will fix in v2.

>
> This new helper allows workloads to opt into NUMA balancing even when glo=
bal
> NUMA balancing is disabled. However, functions like get_pref_llc() and
> get_scan_cpumasks() still check the global static key sched_numa_balancin=
g
> directly instead of using task_numab_enabled(p). For a workload that
> explicitly opts in via BPF, its numa_preferred_nid and CPU scan masks wil=
l
> be skipped.
>
> [ ... ]
> > diff --git a/kernel/sched/bpf_numab.c b/kernel/sched/bpf_numab.c
> > --- /dev/null
> > +++ b/kernel/sched/bpf_numab.c
> [ ... ]
> > +static u32 numab_mode_stub(struct task_struct *p, struct folio *folio)
> > +{
> > +     return BPF_NUMAB_GLOBAL;
> > +}
>
> [Severity: High]
> Should this stub function also include the __nullable suffix on its
> arguments?

I will add the __nullable here as well.

>
> As mentioned in include/linux/bpf_numab.h, omitting the __nullable suffix
> (e.g., p__nullable) prevents the verifier from recognizing the arguments =
as
> optional. This leads to dead-code elimination of user NULL checks and a
> subsequent system crash.
>
> [ ... ]
> > +u32 bpf_numab_mode(struct task_struct *p, struct folio *folio)
> > +{
> [ ... ]
> > +     bpf_cgroup_struct_ops_foreach(ops, item, cgrp, CGROUP_NUMAB_OPS) =
{
> > +             if (ops->numab_mode)
> > +                     acc |=3D ops->numab_mode(p, folio) & BPF_NUMAB_VA=
LID_MASK;
> > +     }
> > +
> > +     cgroup_bpf_put(cgrp);
>
> [Severity: High]
> Could dropping the cgroup BPF reference here trigger an AB-BA deadlock?
>
> The scheduler path calls task_tick_fair() under rq->lock, which invokes
> bpf_numab_mode(). Dropping the cgroup BPF reference here via
> cgroup_bpf_put() can trigger queue_work() if this is the final reference
> while the cgroup is being offlined.
>
> queue_work() acquires pool->lock and wakes up a worker by acquiring its
> pi_lock. Because standard wakeup paths acquire pi_lock before rq->lock, t=
his
> inverted rq->lock -> pool->lock -> pi_lock sequence leads to a deadlock.
>
> Since this code is already protected by rcu_read_lock(), is the reference
> counting strictly necessary here?

Nice catch.

The walk needs no refcount on cgrp->bpf: the cgroup itself is only
freed after an RCU grace period (css_free_rwork_fn() runs through
queue_rcu_work()), and the effective prog array is freed through
bpf_prog_array_free() (kfree_rcu), so rcu_read_lock() keeps both
alive for the whole walk -- the same protection bpf_tcp_ops_call()
relies on.

While removing it I noticed the copy from the memcg_ext series
missed a warning its walk carries: it is only v1-safe because
memory.high happens to be v2-only, and a hook on a path v1 can
reach needs its own cgroup_on_dfl() test -- a v1 cgroup has an
uninitialised bpf.refcnt and a NULL effective array.  The folio
surface here can reach v1 memcgs on a hybrid system, so the walk
now reads:

    rcu_read_lock();

    if (p) {
            cgrp =3D task_dfl_cgroup(p);
    } else {
            memcg =3D folio_memcg(folio);
            cgrp =3D memcg ? memcg->css.cgroup : NULL;
    }

    /* Only the default hierarchy has a cgroup_bpf. */
    if (!cgrp || !cgroup_on_dfl(cgrp))
            goto out;

    bpf_cgroup_struct_ops_foreach(ops, item, cgrp, CGROUP_NUMAB_OPS) {
            if (ops->numab_mode)
                    acc |=3D ops->numab_mode(p, folio) &
                           BPF_NUMAB_VALID_MASK;
    }
out:
    rcu_read_unlock();
    return acc;

>
> > +out:
> > +     rcu_read_unlock();
> > +     return acc;
> > +}
> [ ... ]
> > diff --git a/mm/mempolicy.c b/mm/mempolicy.c
> > --- a/mm/mempolicy.c
> > +++ b/mm/mempolicy.c
> > @@ -884,11 +884,10 @@ bool folio_can_map_prot_numa(struct folio *folio,=
 struct vm_area_struct *vma,
> >               return false;
> >
> >       /*
> > -      * Skip scanning top tier node if normal numa
> > -      * balancing is disabled
> > +      * Skip scanning top tier memory whose owner participates in
> > +      * tiering: hinting faults on it would buy nothing.
> >        */
> > -     if (!(sysctl_numa_balancing_mode & NUMA_BALANCING_NORMAL) &&
> > -         node_is_toptier(nid))
> > +     if (folio_numab_mode_tiering(folio) && node_is_toptier(nid))
> >               return false;
>
> [Severity: High]
> Does this unconditionally disable NORMAL NUMA balancing on top-tier nodes
> when TIERING is active?
>
> Previously, this skipped hinting faults on top-tier nodes only if
> NUMA_BALANCING_NORMAL was explicitly disabled. The new logic skips top-ti=
er
> scanning entirely if tiering is enabled.

You are right, this is a regression.
I will fix it by introducing a new folio_numab_mode_normal().

>
> When the global sysctl_numa_balancing_mode is 3 (both NORMAL and TIERING
> enabled), folio_numab_mode_tiering() returns true. This breaks standard N=
UMA
> page placement optimization for fast memory on tiered systems by dropping
> all top-tier scanning.
>
> >
> >       if (folio_use_access_time(folio))
>
> --
> Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20261012120438.52=
849-1-laoar.shao@gmail.com?part=3D2



--=20
Regards
Yafang
