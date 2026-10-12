Received: from mail-yx1-f45.google.com (mail-yx1-f45.google.com [74.125.224.45])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BFB87485CF5
	for <sashiko-reviews@lists.linux.dev>; Mon, 12 Oct 2026 14:23:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=74.125.224.45
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791815029; cv=pass; b=CvJvanLn2cQWr3zfND7oAcPCfq3AsEoRFCmT0mn/WE3KgQHMgH+x+N84ldx3ftJ8N/ZdiUXp+GFp2TFYbZXUMOm7OasC7LQoVg43DXQ8VrMwumqxBPa/1pRGVpvML3yrDKCiAGOr0oYvGQXuUYZrDYBjMMQ0E1+y8tDreIUlv2k=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791815029; c=relaxed/simple;
	bh=kXLIv9Z8ptpWQ9lGeWrSdcNDbt3PrhK3S0Ia8ytG55w=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=VgTXrEZ6PUtyIa6+xFHaRjQ2Bgf58tKgRK5Y1H30/IMBhYs0SqExmEF4kS4d0P0ncbL66zdz0VKTUwUePo9BDrwmIy+lzctUv5QxkBCspPOGTlId5EkMled85YAqksojpMg7wRvgeSuAjvZnKC6WfgvK8p3Svnid1nhfGI8BPEw=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=CoLLv3+t; arc=pass smtp.client-ip=74.125.224.45
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="CoLLv3+t"
Received: by mail-yx1-f45.google.com with SMTP id 956f58d0204a3-6768a9fc0e8so1593629d50.2
        for <sashiko-reviews@lists.linux.dev>; Mon, 12 Oct 2026 07:23:47 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1791815027; cv=none;
        d=google.com; s=arc-20260327;
        b=QFxoiK19XSE066t8BMXjWo+7F9cXUg1HIsG3kyIjOPUgnla7nUVZKSGdV8ulOreuM6
         dfCTnW/ChdQh+uY1YwbZuYSkGuD4L4OLRn0VRKWirSj4VR2MF+if+FiQw0atUZv0VOC8
         y27cQHWuxOWXCJvdI+T4NGbgbu5UjUS3eVMVdh+Moqc7tu7u8j/gP584z6xSUMsE7mIz
         wahQjYA6keq2gkE4frKm6waiw8IO4YaztCHsZYZpiF7AYUl0jSw5F7gq787pFybq/B7U
         LgJG6ELKNjFegQxbA6EEN8V+J9Wy938wbmKtdIuJd3aeHdXDBb+r21Gbwqk/JNT4etWq
         mmuw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=UYVD2/fOf0nyTIVA/pcXMc/3GdRicISF9zh8lG/z94k=;
        fh=Y/k4U7yoNLjw8JsGo3J4dpewq9eYJPGzO1oh42U3RZ4=;
        b=dAPwBoFIxy82Azu+k1TNltW1SC2VCoaQRhw4ZUk6fl6Gkm5hVKiGjY2KK7+eS6XBVS
         lPu4KGx8d/mJslaBABnB5G5GGPXojc4bT9RdzzAp+L+IOei8hchS5/La/C4rzT2S6dkh
         sVyClF5Uj62KKnw6t1FWZfg29hRK4oyc951vNAJ85bx1ue7xgXlBziGJ6l6U14D1MJay
         DcKHwoYy7a0LZeiMFEmyWNZa14SU9/gw5IFCdLIBPxVMUp73U9EBOLoFeR5OJmTrvhg0
         NxcVVcJiW/F2xypkEvz7SkpOQGBwuVx9ImnJSyft4i9/nyL/URF4b8k1k1e3tYYQ9+YB
         PucA==;
        darn=lists.linux.dev
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1791815027; x=1792419827; darn=lists.linux.dev;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=UYVD2/fOf0nyTIVA/pcXMc/3GdRicISF9zh8lG/z94k=;
        b=CoLLv3+tjgx++BEYpoM5CNNh4qdsxWW3VXx0Lccuc3GBYwAhxHJHSfpx8BJxJSd3M7
         9PY+Sv979SWRsuWHZKkvkqsVubob3JJMNhXBx8x8khVX6oksu3zrWdceER2V4VnDApOW
         07yyHOPIPvj+F3iHFMbJDP62St6o40cojwIxj4Nm85GfyLNrqtcCqWWvVOmunnr5oesZ
         CxPxcyrV3134PGI68+cwaAyukQL2v49b1fO+POdyycUaxGwhwdMzznQ6Kd2XyFLrCNXQ
         WR2Fi2pf4y3CVBL3rZ2IdkCos5JvoSJJb6pS4DJvvA6ND2bZhQMFsSYvykwlVQ3QoApS
         ykYA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791815027; x=1792419827;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=UYVD2/fOf0nyTIVA/pcXMc/3GdRicISF9zh8lG/z94k=;
        b=0NRhJR2mRNlc7g/tA53YCcKDfANNhBIo2SKfUZOurTbglaornPS4PJSloZA0iy0DE+
         MZR7oeQnJcbveRkWVlejYWUA6+EPOV+bIUNB8CkjT85g/k/3Fg2lJjLfa8bB3YD4rvRO
         NpPYNq9jXLrRv4fggGrXzqW2X1F2xciD/Gh8xF6GZzW8Ty5t4SdJ3m6fM9SBEY6kCDQB
         mibSIBUxiYIL8L6Kkwgtop4UpwOgOSsGQ9aevRzuCC6vsm3N/CKD469g0MIidCgeFiNN
         bNKN51z51yfH53XMHZttvW+0NjfmVHzcHBletgctDpAjw17zOuhHhX7pdS7D2dRgRQjt
         eW3w==
X-Gm-Message-State: AFq9FYIBIz+BYGtn5STeyPgjW6GjcDK3qarledeFRjBiz/wvJD4qzwmE
	GZldpTjpHKthSYYeuk0ZuTP6opyAhVQF87TBISYdMf6yjXYrTxQDY9YOvrHYNMp6ZVSdjT3J5mA
	0R4Ywx4K7Oadg+F1CQhmoX67sdXYe0Ei7BnHMCPc=
X-Gm-Gg: AYBFou1nauFLLsM0tiOh8z6hSYUPh1rHwq0bL8IbUFFHWLetwGyMQtuV8a7BeddmDHR
	d2SdoeuiXPVyN5TwgvOGlQjY4wEN+kpAFXI3cvidL1Pu+QNtVU9qKNx3dYS+yN/wimwNjEFK9fw
	l3S4Wa08GNyMqZwIDyNUFY89MV4S4RmN3Ib9EJDCVs80dGjYQUO4y2L1OhRUft4nGq/kS8u/a6D
	le+q3FOWoRKC28xsXQDtjljV+MPgE2b71fbayQ/V8YXmYrzrch1QyNmHXPY9AnaYDiXRcRWawNH
	nwUBrJAx9Mx5uegLjrzMegYy2oRuYW4+07g5FUOLKR3ebe4USM3ZNwP8dwNdsng0R/c8kn2qPMx
	M+odRyG72qQ==
X-Received: by 2002:a05:690e:4192:b0:677:d106:6f9c with SMTP id
 956f58d0204a3-679362867a8mr2147661d50.87.1791815026466; Mon, 12 Oct 2026
 07:23:46 -0700 (PDT)
Precedence: bulk
X-Mailing-List: sashiko-reviews@lists.linux.dev
List-Id: <sashiko-reviews.lists.linux.dev>
List-Subscribe: <mailto:sashiko-reviews+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:sashiko-reviews+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20261012120438.52849-1-laoar.shao@gmail.com> <20261012120438.52849-2-laoar.shao@gmail.com>
 <sashiko-outbox-168087@kernel.org>
In-Reply-To: <sashiko-outbox-168087@kernel.org>
From: Yafang Shao <laoar.shao@gmail.com>
Date: Mon, 12 Oct 2026 22:23:09 +0800
X-Gm-Features: AclHuK-9lM9g9S-C3ROal123aP5fOYW0LLV-IaA5rIADxO0M27DcvcX-i1S5wUc
Message-ID: <CALOAHbD5K32=Vq8sEk2nor4NzVWwXrgG15=5MFHxwbvxVJrrbw@mail.gmail.com>
Subject: Re: [RFC PATCH v2 1/3] sched: add helpers for numa balancing
To: sashiko-reviews@lists.linux.dev
Cc: bpf@vger.kernel.org, hannes@cmpxchg.org, mkoutny@suse.com, tj@kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Mon, Oct 12, 2026 at 8:19=E2=80=AFPM <sashiko-bot@kernel.org> wrote:
>
> Thank you for your contribution! Sashiko AI review found 2 potential issu=
e(s) to consider:
> - [Medium] sched: Incomplete refactoring leaves direct sched_numa_balanci=
ng accesses
> - [Low] sched: performance regression in task_numa_fault() due to incorre=
ct static branch hint
> --
>
> commit 6333e53c9f6ee67bda34cc209d9f45e01a0af5fd
> Author: Yafang Shao <laoar.shao@gmail.com>
>
>     sched: add helpers for numa balancing
>
>     Two new helpers task_numab_enabled() and numab_mode_tiering() are
>     introduced to replace the scattered direct accesses to the
>     sched_numa_balancing static key and the sysctl_numa_balancing_mode
>     bitmask.
>
> > diff --git a/include/linux/sched/numa_balancing.h b/include/linux/sched=
/numa_balancing.h
> > index 52b22c5c396db..353772b49c5f9 100644
> > --- a/include/linux/sched/numa_balancing.h
> > +++ b/include/linux/sched/numa_balancing.h
> > @@ -32,6 +33,28 @@ extern void set_numabalancing_state(bool enabled);
> >  extern void task_numa_free(struct task_struct *p, bool final);
> >  bool should_numa_migrate_memory(struct task_struct *p, struct folio *f=
olio,
> >                               int src_nid, int dst_cpu);
> > +
> > +extern struct static_key_false sched_numa_balancing;
> > +
> > +/*
> > + * Whether NUMA balancing applies to @p.  The @p argument is unused fo=
r
> > + * now: a later patch will consult a per-cgroup BPF policy with it.
> > + */
> > +static inline bool task_numab_enabled(struct task_struct *p)
> > +{
> > +     return static_branch_unlikely(&sched_numa_balancing);
> > +}
>
> [Severity: Low]
> Does this wrapper unintentionally flip the branch prediction hint from
> likely to unlikely on hot paths?
>
> For instance, task_numa_fault() is almost exclusively called from NUMA
> hinting fault handlers, which only trigger when NUMA balancing is active.
> Before this patch, it used static_branch_likely():
>
> -       if (!static_branch_likely(&sched_numa_balancing))
> +       if (!task_numab_enabled(p))
>
> Because the new task_numab_enabled() wrapper hardcodes
> static_branch_unlikely(), could the compiler now outline the body of
> task_numa_fault() and other functions that expect the condition to usuall=
y
> be true?

Nice catch.

They are all static_branch_likely(&sched_numa_balancing) except
the one in task_tick_fair().  Since NUMA balancing is enabled by
default:

config NUMA_BALANCING_DEFAULT_ENABLED
        bool "Automatically enable NUMA aware memory/task placement"
        default y
        depends on NUMA_BALANCING
        help
          If set, automatic NUMA balancing will be enabled if running on a =
NUMA
          machine.

I believe we'd better make the change below first and then switch
the helper to static_branch_likely().

--- a/kernel/sched/fair.c
+++ b/kernel/sched/fair.c
@@ -15082,7 +15082,7 @@ static void task_tick_fair(struct rq *rq,
struct task_struct *curr, int queued)
        if (queued)
                return;

-       if (static_branch_unlikely(&sched_numa_balancing))
+       if (static_branch_likely(&sched_numa_balancing))
                task_tick_numa(rq, curr);

        task_tick_cache(rq, curr);

>
> [ ... ]
>
> > diff --git a/kernel/sched/fair.c b/kernel/sched/fair.c
> > index c52c29dcb6a2e..451e26da5af24 100644
> > --- a/kernel/sched/fair.c
> > +++ b/kernel/sched/fair.c
> > @@ -4199,7 +4200,7 @@ void task_numa_fault(int last_cpupid, int mem_nod=
e, int pages, int flags)
> >       struct numa_group *ng;
> >       int priv;
> >
> > -     if (!static_branch_likely(&sched_numa_balancing))
> > +     if (!task_numab_enabled(p))
> >               return;
>
> [Severity: Medium]
> Are there a few direct accesses to the sched_numa_balancing static key in
> kernel/sched/fair.c that might have been missed by this refactoring?
>
> For example:
>
> kernel/sched/fair.c:exceed_llc_capacity() {
>     ...
>         if (static_branch_likely(&sched_numa_balancing)) {
>     ...
> }
>
> kernel/sched/fair.c:get_pref_llc() {
>     ...
>                 if (static_branch_likely(&sched_numa_balancing) &&
>                     p->numa_preferred_nid >=3D 0 &&
>     ...
> }
>
> kernel/sched/fair.c:get_scan_cpumasks() {
>     ...
>         if (!static_branch_likely(&sched_numa_balancing))
>                 goto out;
>     ...
> }
>
> Since get_pref_llc() and get_scan_cpumasks() already take a task_struct
> pointer 'p', shouldn't they also be updated to use the new
> task_numab_enabled(p) wrapper?
>
> If these direct checks remain, might they bypass the per-cgroup BPF polic=
y
> that the commit message notes will be consulted in a later patch?

I will update it.

--=20
Regards
Yafang
