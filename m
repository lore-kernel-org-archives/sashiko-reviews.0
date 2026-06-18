Received: from mail-yw1-f174.google.com (mail-yw1-f174.google.com [209.85.128.174])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B9A831DC985
	for <sashiko-reviews@lists.linux.dev>; Thu, 18 Jun 2026 23:04:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.128.174
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1781823899; cv=pass; b=HJQ+HCEPmubWV682+qdwU+cv586CpWDvalESYvQGshsDqVdaKipWSnO+mswdtGk+XQCm3i8y6LHn/R8ClueETVKc7ZGz5gKZLxuIDWtCI4hqiEkz9WbgKMfYdmBmvIVlaaeFZUEScpaCOzb90tfdej6crscU+2QZmXFVosTVbTg=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1781823899; c=relaxed/simple;
	bh=EX8FRVIG00u8HGBnvXLPq8RIp5dwT/Ow4pDrpVHV+pU=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=IX6eeIOzHD0cywCZq1giGQs4EG6Dw+jd2xJCXESBlNeIuxxlMSy+jvShjwgrI2LoW2/KDqP+sTEu1ctQosGHec02ySJj0B7iIcSMOOhwJJDaD+co4GPtzVWNblRbQstWCXcZD3IS0YwKnpuPd+T1MdqGu6NL997aebbzh/FONzU=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=q6lXwx5+; arc=pass smtp.client-ip=209.85.128.174
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="q6lXwx5+"
Received: by mail-yw1-f174.google.com with SMTP id 00721157ae682-7dc67a5e102so16043717b3.1
        for <sashiko-reviews@lists.linux.dev>; Thu, 18 Jun 2026 16:04:57 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1781823897; cv=none;
        d=google.com; s=arc-20240605;
        b=AY7cisyKgJb3wn7UUjKCJXnTrpYbHQEqlpvLbMxh9J08+/mwZoLIFEHhuTE9hWGeow
         1Qxj2kMqYqfabDRizd2KyD6ptpVtveKMo6eziiQX11uZim9xbEinMIxSevWwIo7pSxR7
         7M0qTBtrG/fqF/itszIdCVh5FRiz6vQmJ6UN0LEHpU/euHRtcBP9argwEPLGnb4ouE9l
         ImrhdZ8o4k4Y38Qu84qUEtt00KVowdMybCtALMZUs7vS5wMJVnpRvoOY9MennFb14zBQ
         lPtmdPG1KLtktNTyCjCR0FQNEdrxvmeGGzwt5ppw/MZ6ExBA6LIglgpAlTss9LOFkwaC
         nB+Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=n+U5LnBvxE2n7Stgu6vC4rG5e+TN4oQ5BlsbYeF7xXs=;
        fh=uA360uvxR9S0K/Y4Lovo7aIaGlBwzVBnnb2BKWupr/4=;
        b=K65Cp3DxFKE7/mokfwsdt/x94OnuyfGz8JzD7mEB9uH+WescgdugLt6b3dxhu+tjHY
         a6d8KHQt43z7tohrm7v0NXF0Hi5fEBFw8Zh4ATfk1JaXTge51FkG/q6G93XzE9PDPmHi
         o3ZZyLhDKgwc8JL0DIAOBPR9UjfLuX0UbPWeLxNBv0ExV2m0D+oiqh5z4b7kj/Q3v15w
         Xf8M3z+CAc9DZeiFxKSjQp77cZy7boZtugA7YrFQD+t4g1idJb5Afk1l7RlrFMW3lEJt
         8IMApSJ9UBWChC4uP1vpgioOzo5/8kzvrOQ+xyB9sXzZLEzXs2U/H3rrwIh/3tdSLZit
         ibXQ==;
        darn=lists.linux.dev
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1781823897; x=1782428697; darn=lists.linux.dev;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=n+U5LnBvxE2n7Stgu6vC4rG5e+TN4oQ5BlsbYeF7xXs=;
        b=q6lXwx5+dvNWhAuq8h1WX6qjxGe8gw2D9ZcuxdrCa813RXUjeqq073MXv+5Ui+58Mj
         19rwfBF6Ipg8RRQgIW0LrMGCbr1JAC62ikL6QQbCuh35oFEH46MSJ1LxAqdaGE8R3rnQ
         djUGrG8lr5rLVMtqGbS5k6ca0mSvKTE4x9Ji5W3JShkukS4t4o/WN+wUqZP9uOt2pwz7
         eHxOJdsSbXuLnwRCDKoIoMHaYDFVpDj/sLwcfe4spbHWM4HJlqblN+TR3qGJAxeB4SOV
         PJ6rxC4UB/8tBVGOK+80xt0gHH9wIRR02pt6qGQ154swczyBefzRbDXj6Ocrq3V/Xf/l
         VynA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1781823897; x=1782428697;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=n+U5LnBvxE2n7Stgu6vC4rG5e+TN4oQ5BlsbYeF7xXs=;
        b=JcSqcXw2o+JtpWKLgZ2HxlizN7TcNKjfK2kw5O3T36SUpws+y/D29pVAaz/YzAkXfg
         /ZIZjW1yg+Z/8YFXP4LTUDO1swdyNhdsXbyxSu6P5/UsJ4w1UaEC0TyWHZkKXIWZ9MfE
         whHf8Ej9fLLEyQJ3LIR7TLbEcgiV8k2dt/YU1Q2vQ3V+POHPCaPvh4igvq0rp+YVppwT
         X/FXqjWicLkDWyvdERmuSd3DWxxDPAKwHwpOWlUV0g3sz1/GkskdhEcTOhewrDW3qv68
         BwLVaOjKA1cjoj80SwD/qVRIqD+i9822sMw4YQ0xzMBQPviXNZlwU8ZMm4CilPU+Ausw
         2AoA==
X-Gm-Message-State: AOJu0YzJE8WC3oczVgsOaitddJrTEO3+kO5BIVwYybNOQ8k5yg9G6QeX
	a72j060MAg+waMAOiYVq0Sp6hgSl1077J0LiWJPUgeSXJJs+GTytIQ5rweLTItLakwactboW5HS
	N2WhhfOkVnty/Gf+r74qjtaGaDh71UNXk1g==
X-Gm-Gg: AfdE7ckysrcABoqYXIYtpDmuE/N42Aqk8R7SL+fwrlZcNIEw7YcDkR8dZ272p8iQeoY
	ftGIlSfH66uWS7dCIR8aGqxT1TUPmKmbWBow8xCslY+xEpSo24w72bEPfcTaEdEFOsKzTJcCE4q
	UpgRYAtBd5G2Atjs03ZFTbPVSmRv18g6Csk28kdw9raxuGgYbyfCdub7Vqv4oaCTO6SbrnijlHB
	5XO2GiQsZU81CSkKErmnUezYROHQCcZRJG5ISSxanMQUOl3zQe51kMEtgYfHuVvHgrJ/5Wl
X-Received: by 2002:a05:690c:d21:b0:7f8:7e31:28a3 with SMTP id
 00721157ae682-80138627d6cmr9137217b3.49.1781823896442; Thu, 18 Jun 2026
 16:04:56 -0700 (PDT)
Precedence: bulk
X-Mailing-List: sashiko-reviews@lists.linux.dev
List-Id: <sashiko-reviews.lists.linux.dev>
List-Subscribe: <mailto:sashiko-reviews+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:sashiko-reviews+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20260618221919.2919512-1-ameryhung@gmail.com> <20260618223119.4696B1F000E9@smtp.kernel.org>
In-Reply-To: <20260618223119.4696B1F000E9@smtp.kernel.org>
From: Amery Hung <ameryhung@gmail.com>
Date: Thu, 18 Jun 2026 16:04:44 -0700
X-Gm-Features: AVVi8CcFVwA3MIjPhnuWrGMCYNKvR0MNN_Sax3m2dGf3JDq0ygI5IQkS2uUOJu0
Message-ID: <CAMB2axN2x0QXadyNm1FoDgkF9kfAOt58QXGw-0YbT3eEaUo+9Q@mail.gmail.com>
Subject: Re: [PATCH bpf v1 1/2] bpf: Fix effective prog replacement with BPF_F_PREORDER
To: sashiko-reviews@lists.linux.dev
Cc: bpf@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Thu, Jun 18, 2026 at 3:31=E2=80=AFPM <sashiko-bot@kernel.org> wrote:
>
> Thank you for your contribution! Sashiko AI review found 1 potential issu=
e(s) to consider:
>
> Pre-existing issues:
> - [Critical] Incomplete fix leaves `purge_effective_progs()` vulnerable t=
o an incorrect array index calculation, leading to a Use-After-Free.
> --
>
> commit 66001d04979b50f447c6655c1c7db45dc464ee71
> Author: Amery Hung <ameryhung@gmail.com>
>
> bpf: Fix effective prog replacement with BPF_F_PREORDER
>
> The patch fixes replace_effective_prog() to handle BPF_F_PREORDER array
> indexing. By introducing effective_prog_pos(), it properly replays
> compute_effective_progs()'s placement instead of relying on a linear coun=
t.
>
> > diff --git a/kernel/bpf/cgroup.c b/kernel/bpf/cgroup.c
> > index 83ce66296ac19..b12e44ec5d8cb 100644
> > --- a/kernel/bpf/cgroup.c
> > +++ b/kernel/bpf/cgroup.c
>
> [ ... ]
>
> > @@ -960,22 +1006,10 @@ static void replace_effective_prog(struct cgroup=
 *cgrp,
> >               if (percpu_ref_is_zero(&desc->bpf.refcnt))
> >                       continue;
> >
> > -             /* find position of link in effective progs array */
> > -             for (pos =3D 0, cg =3D desc; cg; cg =3D cgroup_parent(cg)=
) {
> > -                     if (pos && !(cg->bpf.flags[atype] & BPF_F_ALLOW_M=
ULTI))
> > -                             continue;
> > -
> > -                     head =3D &cg->bpf.progs[atype];
> > -                     hlist_for_each_entry(pl, head, node) {
> > -                             if (!prog_list_prog(pl))
> > -                                     continue;
> > -                             if (pl->link =3D=3D link)
> > -                                     goto found;
> > -                             pos++;
> > -                     }
> > -             }
> > -found:
> > -             BUG_ON(!cg);
> >               pos =3D effective_prog_pos(desc, atype, link);
> >               if (WARN_ON_ONCE(pos < 0))
> >                       continue;
>
> [Severity: Critical]
> This is a pre-existing issue, but does purge_effective_progs() still
> compute the array index using the naive linear increment that was removed
> here?

I think sashiko is right about this similar issue in the purge path. I
will send v2 replacing the linear search below with
effective_prog_pos() helper introduced in the set.

>
> Looking at purge_effective_progs() in kernel/bpf/cgroup.c:
>
>         /* find position of link or prog in effective progs array */
>         for (pos =3D 0, cg =3D desc; cg; cg =3D cgroup_parent(cg)) {
>                 if (pos && !(cg->bpf.flags[atype] & BPF_F_ALLOW_MULTI))
>                         continue;
>
>                 head =3D &cg->bpf.progs[atype];
>                 hlist_for_each_entry(pl, head, node) {
>                         if (!prog_list_prog(pl))
>                                 continue;
>                         if (pl->prog =3D=3D prog && pl->link =3D=3D link)
>                                 goto found;
>                         pos++;
>                 }
>         }
>
> Since purge_effective_progs() acts as a fallback when
> update_effective_progs() fails, could this incorrect array index calculat=
ion
> lead to a use-after-free?
>
> If bpf_prog_array_delete_safe_at(progs, pos) overwrites the wrong program
> slot, __cgroup_bpf_detach() might later call bpf_prog_put() on a program
> that is still active in the effective array.
>
> --
> Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260618221919.29=
19512-1-ameryhung@gmail.com?part=3D1
