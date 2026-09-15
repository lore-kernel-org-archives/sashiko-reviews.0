Received: from mail-ed2-f12.google.com (mail-ed2-f12.google.com [74.125.228.76])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C577E4A92ED
	for <sashiko-reviews@lists.linux.dev>; Tue, 15 Sep 2026 12:07:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=74.125.228.76
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789474075; cv=pass; b=Kh8mGruW28zsvk1N68w49MovfL8Go+X98RukLS6CbmWPIT2iUs6YDjVJVM+2SNLRAIRA33VQqnMIm1tmuyhpOW4UkS2OoXPFbVfYCe+Gclzr8ddGmjcQC5zN20KRQRzFSF6pmTkml8NDiP52yNZcjclbcA37kA4g9BocbmFLUOA=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789474075; c=relaxed/simple;
	bh=H8Hb3OAflh27h91tJ3OskQsRwA3/+y5+gbZ+gkFYhSk=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=nF2WuDEBnTWan/AcxsHtSe7CxiwrdfYKOGPAIbQlD4VYnkphZG0Kj3ut7xulIvei09cN017iDePRDbEyNlIOXsKl/HGVgi3uV6BjVN/K5hGLzSCbvBLocIoKkb2VEAAWyHJgXlbFC5bxnftKvgnL7mAD4Tu0iR0/N/VJ4I4RwQg=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=MXPsAUqC; arc=pass smtp.client-ip=74.125.228.76
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="MXPsAUqC"
Received: by mail-ed2-f12.google.com with SMTP id 4fb4d7f45d1cf-6a803458ba0so284698a12.0
        for <sashiko-reviews@lists.linux.dev>; Tue, 15 Sep 2026 05:07:53 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1789474072; cv=none;
        d=google.com; s=arc-20260327;
        b=OhBatWX9wosgkvKlblQZWz/1F2+mdwH/3/UdMEnwTAKcoxjek/RRxgz7YH2v0sD9ED
         WqdpVdKvtpQ1lo0MTraEtGuYXiGJJXMTHXRFQkqPrtK1OF7G1kKxAKnzYtX7ITwwktRh
         o9PGhfOVWd2m66YRAF/l+QsjEE49CZONFBMbDB5tP9je8owfVvr+OcG/xDhqW95S7xvy
         klPXNAKN0WSz62zUH5fDyDucG/2LayyQueO96wd3uX8QPpc4+8sTHZSJlW4h/evSBQXc
         9RrtdK/ohtaE7QAYgAEABXlGmUrnDQoh1s3/gIL2TZlNUO31k1o8/wi7r+AbSdCX2z1G
         5o1g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=Q8mjJWntdNcyjD/YCKYvvjUmGFsw69zWofEcdKwU08g=;
        fh=uA360uvxR9S0K/Y4Lovo7aIaGlBwzVBnnb2BKWupr/4=;
        b=bhs8fPOyBvQAn7xD0mcjahYSZqC3cU86bfPLfPTzCNzfjrmOuolt/j4EjBxCwYrPv7
         ilGKFT9M5GvAXUNPL/YbPTpY4BKkwqsM5SxMvAGs5xgk0IJffI8nI/EKmTINCCpux4nl
         3I5W+7byjqmsG7F9wHS/cVjcAyjS0UX3jacQixAqFY8FBB4IwVFTrlABevMGFw0Wz0YK
         4xCCY32ggLboL4FKTjhuXNhaiOW2rNRDlIMSfoAcBxEdArDhVE6pkCwwtJC002p3r0uV
         UpKjKwLrgPgN2xAgnnH+OyFfmxtmYWR4uW5fsXb49oXjm206EpJBVX7ftfvVMcF4zOJb
         ShJQ==;
        darn=lists.linux.dev
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1789474072; x=1790078872; darn=lists.linux.dev;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=Q8mjJWntdNcyjD/YCKYvvjUmGFsw69zWofEcdKwU08g=;
        b=MXPsAUqC5pFU/uyHoW5PLwFasCFIkMt2k8LV2TmajR1DmBzzHbRQkv+JrkpNzYGS1/
         6/oJSsgAT2lnoJNn96E5emI2idAK07+7VlOYo67hIsRdVzM7RXc9lC883TLqZ/IfCgZI
         S8QnQ1wn4aM5Bpu+6/B0MQFmQSeMdeJArk9ZofcGA+5+j0Cl2/LMdK7IRcX1qB/YyWuE
         weIMra1GVSph8IOaKfUodteUobGi5k5QZkQEpm2b8Qzfk7w5CHByml9m2rPFv5V/uHOQ
         9f/lpwhYow3N3f+cHpecA49aue7A3Wh66eVVCtNVMiwYO+MHE/EqkqWsmBRSo1s6onSG
         JAaw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1789474072; x=1790078872;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=Q8mjJWntdNcyjD/YCKYvvjUmGFsw69zWofEcdKwU08g=;
        b=X3i9g/4Fh2ewADF7Ox1/NTN9FR5HJEMIMtu57SGfC1uaSD5Tlq2DEZPBaCbkgubAfX
         2i8ovt4c6/mo+m6n/bgEoLqGS6YZr8rWJ9XmfyDpITO2lloaRKKu0igRW10ZeiQWm82F
         ECiC2cPxvDn4vc/WSQQJ0twFcUQt5D2f7IgwBHDUGUIQmjMcRytCpqvds5ijlXQv0GDB
         9iWSC5s1DZWAy4MpdntNfw5juLA/yChZoUA7NcBxbh370Wdwn7BqsKKB49RF7efEqtQP
         nJzSumUoA6mnTwtLJNJLNO2ffdTT/B4l58MckEDs6FixR7iNKBnUJbcwyeX+CDvju/cQ
         ZdiQ==
X-Gm-Message-State: AFuF++l6pYb4Atc/EdvEATnpbBA1TXShdKYVlCCqKkZ/kobsZVUHNR+c
	HcmHNxj+0PK/cW2AVmDnsuQaEo1Kk7av0Bn6ZMtHsQBn7f1sQHMf6q2H6BTwM8FzmnmvMXgkTwj
	1sZlqqOniGPaUkGAvto011lNDHEkJag3lW33jdCfRqQ==
X-Gm-Gg: AYBFou1tDdF/plO6zc6Q7raFmkCf1LEM0jj18f7n0iBaHc5WMRqmxDksweY6iQJUo4R
	sw8v0ve+xsUrGJhScTPiW5CTiygwKN/KGoDSG6ZpxhjppCgaU6GshI7+f2RarmYnLq2VAco37TU
	kQeks2Z61+WXLxc3SZFuiq8QL/HJhRzRrPb1uRQIKjqYf6zquhxNxuzbM0AWO+zPfklNimdGAjy
	zQVp8c5mhV/U/FPr6QEWUjbHiq4pCmvv7C3AR3+Xi5/S9DMT6L+5GUH/XiPf+ibWg5hJeYfsR2V
	sSSjjMGsSSDNe4QwyeXNoFYd0MbjCURk91oi1NeTUSsioiKe1uYJdn9sx7mWpscuiiYBvsM=
X-Received: by 2002:a05:6402:21d4:b0:6a9:cc6d:ea50 with SMTP id
 4fb4d7f45d1cf-6aa12e744bcmr489332a12.18.1789474071747; Tue, 15 Sep 2026
 05:07:51 -0700 (PDT)
Precedence: bulk
X-Mailing-List: sashiko-reviews@lists.linux.dev
List-Id: <sashiko-reviews.lists.linux.dev>
List-Subscribe: <mailto:sashiko-reviews+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:sashiko-reviews+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20260915114240.3269184-1-puranjay@kernel.org> <20260915114240.3269184-2-puranjay@kernel.org>
 <20260915120127.099B91F000FF@smtp.kernel.org>
In-Reply-To: <20260915120127.099B91F000FF@smtp.kernel.org>
From: Puranjay Mohan <puranjay12@gmail.com>
Date: Tue, 15 Sep 2026 13:07:37 +0100
X-Gm-Features: AcwNN1X-rmDGAtzHDI7Fxgwsj7esKQkKqyteUeVUnqLGOIOyAszdQ6hF_r0Mz5g
Message-ID: <CANk7y0gn5pQs02et+zgcDHPheH4-yqW0YRjd=yvdY-2hGuAJvg@mail.gmail.com>
Subject: Re: [PATCH bpf-next v2 1/4] bpf: Add bpf_call_rcu() kfunc
To: sashiko-reviews@lists.linux.dev
Cc: bpf@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Tue, Sep 15, 2026 at 1:01=E2=80=AFPM <sashiko-bot@kernel.org> wrote:
>
> Thank you for your contribution! Sashiko AI review found 1 potential issu=
e(s) to consider:
> - [Low] bpf: build failure due to missing bpf_call_rcu_tasks_trace implem=
entation
> --
>
> commit 06a7a5ada7a6b07d90668fb28558d25075dfcf41
> Author: Puranjay Mohan <puranjay@kernel.org>
>
> bpf: Add bpf_call_rcu() kfunc
>
> This commit introduces the bpf_call_rcu() kfunc to allow BPF programs to
> queue callbacks that execute after an RCU grace period. It adds the
> necessary BTF fields, map validations, and verifier support to safely
> invoke these callbacks.
>
> > diff --git a/kernel/bpf/verifier.c b/kernel/bpf/verifier.c
> > index 6c6b8d8520cdf..f91c997bc8445 100644
> > --- a/kernel/bpf/verifier.c
> > +++ b/kernel/bpf/verifier.c
> > @@ -12526,6 +12583,8 @@ enum special_kfunc_type {
> >       KF___bpf_trap,
> >       KF_bpf_task_work_schedule_signal,
> >       KF_bpf_task_work_schedule_resume,
> > +     KF_bpf_call_rcu,
> > +     KF_bpf_call_rcu_tasks_trace,
>
> [Severity: Low]
> Will this cause a build failure? Looking at the addition of
> KF_bpf_call_rcu_tasks_trace to enum special_kfunc_type in
> kernel/bpf/verifier.c, the kfunc is added to the special list here, but t=
he
> actual implementation of bpf_call_rcu_tasks_trace does not seem to be
> included in this patch.
>
> I understand the implementation is added later in the series in commit
> d37bdb9e0af5ddd44775e974f01a56e73c98e9d3 (bpf: Add
> bpf_call_rcu_tasks_trace() kfunc), but shouldn't each patch be
> self-contained and compilable to preserve git bisect functionality?
>
> >       KF_bpf_arena_alloc_pages,
> >       KF_bpf_arena_free_pages,
> >       KF_bpf_arena_reserve_pages,
>
> [ ... ]
>
> > @@ -12619,6 +12678,8 @@ BTF_ID(func, bpf_dynptr_file_discard)
> >  BTF_ID(func, __bpf_trap)
> >  BTF_ID(func, bpf_task_work_schedule_signal)
> >  BTF_ID(func, bpf_task_work_schedule_resume)
> > +BTF_ID(func, bpf_call_rcu)
> > +BTF_ID(func, bpf_call_rcu_tasks_trace)
>
> [Severity: Low]
> Does exposing this function to resolve_btfids without its implementation
> present in this commit break the build? Since the symbol is missing in
> vmlinux at this point in the series, resolve_btfids might fail to find it
> and cause a regression during compilation.
>
> >  BTF_ID(func, bpf_arena_alloc_pages)
> >  BTF_ID(func, bpf_arena_free_pages)
> >  BTF_ID(func, bpf_arena_reserve_pages)
>
> [ ... ]
>
> > @@ -12690,6 +12751,12 @@ static bool is_bpf_rbtree_add_kfunc(u32 func_i=
d)
> >              func_id =3D=3D special_kfunc_list[KF_bpf_rbtree_add_impl];
> >  }
> >
> > +static bool is_call_rcu_kfunc(u32 func_id)
> > +{
> > +     return func_id =3D=3D special_kfunc_list[KF_bpf_call_rcu] ||
> > +            func_id =3D=3D special_kfunc_list[KF_bpf_call_rcu_tasks_tr=
ace];
> > +}
> > +
>
> [Severity: Low]
> Can this check for special_kfunc_list[KF_bpf_call_rcu_tasks_trace] be
> deferred to the commit that actually introduces the function, so the
> verifier checks remain strictly aligned with the available features?
>

Ignore this version, my rebase was broken.

Will send v3 with all these fixed.
