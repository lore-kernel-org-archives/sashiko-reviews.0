Received: from mail-yx2-f42.google.com (mail-yx2-f42.google.com [74.125.224.170])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5CC20288C2D
	for <sashiko-reviews@lists.linux.dev>; Sat, 26 Sep 2026 04:17:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=74.125.224.170
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790396274; cv=pass; b=kW4ClgUBglFw0E197dcTTXo5dZQEhGzrBEtIdZ4q4YO79kwnsd2XcZVm6lxJeV9ZcLr38mFsHHuIs73UpJFesJ3esSeuWgAJXz/MDXXZQnAinXI0wF0yYAv+i8zQF3U07dC1Al+/T70jo6rcQE/mQZDiI0SjICZAfuWQwPgBQf0=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790396274; c=relaxed/simple;
	bh=mKoQB2K1zd59bCFIuaYSj0ang9r2+p7Fgc4CdLQkv+c=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=loJKoI9toSZifHcffpkBd8QlJw9LOyGrcAq86Hd4Hg4/iPjhuTKYYUjO8pK45GV+eVdPULIQAcFWhXuYUZUqvBFRts2zLiaC4yxFWXY4h6ZolwwGpZoAWHerIhPhy/yHDhaxqsG0dzhrt0Fys+vt7oAVPYJduR0N0cKJ32vNCdY=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=etsalapatis.com; spf=pass smtp.mailfrom=etsalapatis.com; dkim=pass (2048-bit key) header.d=etsalapatis-com.20251104.gappssmtp.com header.i=@etsalapatis-com.20251104.gappssmtp.com header.b=KF5gPkU7; arc=pass smtp.client-ip=74.125.224.170
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=etsalapatis.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=etsalapatis.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=etsalapatis-com.20251104.gappssmtp.com header.i=@etsalapatis-com.20251104.gappssmtp.com header.b="KF5gPkU7"
Received: by mail-yx2-f42.google.com with SMTP id 00721157ae682-89666ee9b3bso11364847b3.0
        for <sashiko-reviews@lists.linux.dev>; Fri, 25 Sep 2026 21:17:52 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1790396271; cv=none;
        d=google.com; s=arc-20260327;
        b=XV/7BX4CGZakrNQlCP578cGicoOvUcuSmztADFxZ6fmo2FDTXvPrn4aKeTvtdtTwBY
         deMh7Rk6VnEgB/jF78vDGdDIAQtuuk7gbegjG4yEa5gMFdP2fgRu7Bo/Q9/IkqYD2VXu
         svKzs1P+PQNWwTfYyMtzW0mKIamRUEfCsj13H0LOw8JI0gSu1wH02IEQCKLSKwbooyrp
         +oMRcW9kJmQV6UL/v58cf79bSuqUcEFheojEjw6neOakIrMIAQGXidoL0FG2V8Dcw+Zr
         6+PHWAERvyi1iYLmcVCI6r38V48NHEbOYWGb8JZTGBwMHsGGkUqAvYgVBJEQbCX4Th0L
         OXdg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=snWcYVIbuHCJCEzCM2a0sbOXAcXL63CZ9fKsTCFnAx4=;
        fh=uA360uvxR9S0K/Y4Lovo7aIaGlBwzVBnnb2BKWupr/4=;
        b=EVGX2m3QC7W5x4WXyl6wsFayCYKT+dgMUW/HPPDB7I8qpRyo6DhQ38NDsQHEF4rizF
         h0Y+IaCRqnN2PlKtULWCO+562vFzvPizoD0ZEnSReVRjjReut2yQKLOTNserdLkTd7CI
         3/hRpdofCHdUrUP0mM38Clm5qsVTP23gs+HjJjCSJkBtLkTNtNI/4p1i/Ln4IBP/Qlp8
         R3cHBL9RAcYhZznkgClFfGfT+ozKvUF7EWgO1GosP+nDTOJS2bKb+2GxAul68PhkOz8G
         +TRt0MqZXpAG1zjf34W61PaIrOHuP0QTM02Ytt5yfBQOmbwHZglqA/jjIfnvSm3Sl780
         waFw==;
        darn=lists.linux.dev
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=etsalapatis-com.20251104.gappssmtp.com; s=20251104; t=1790396271; x=1791001071; darn=lists.linux.dev;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=snWcYVIbuHCJCEzCM2a0sbOXAcXL63CZ9fKsTCFnAx4=;
        b=KF5gPkU7TdLeDSOgEakgyL9r0WbSQvCW06+mur7vlLVJM/9ONsYb6TCE6a8cQuDrY0
         nqmIRyEn7VSEKFPGrGljHkxHNIupnADnbwcYuS38rtbnTWiYCyzpzitZ157daXeuMrW4
         72W7byjytoMJxyHKtL4Y8pssa3CA2lEfIYWuxfT0M90/fy+4uIJLrfSjkMT+44Inhpp7
         yqHcVLrp69cvZox+YEG2PoGwAhfvMlKfyBRTS58fHiHRmBpdjcBkte8UDd5N87UE8STt
         y/207i+5Fi+dXOoEm4K73nSMRZ7q1Ciow2mRlDsRsNHRNKRtoUyuUtVeilsM4/nk+HkL
         U69g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790396271; x=1791001071;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=snWcYVIbuHCJCEzCM2a0sbOXAcXL63CZ9fKsTCFnAx4=;
        b=VidkMFjvUfzjzuEH7xBp0Bm9TrnUm5o1lN2vIzw2qjr1nVpvZZPzyLV/t2TF5x5keS
         Z5PiXaC92/n+7zU0pmYltw39VMVrNaXyH3NuZh9wZXtc+Aod9kc4Qc/etFZr8BNFR/Wr
         wx33G5MnjZgcDGbN4KqsZIvhyxn0qX61XOyJpQIjJjyEkhtJlVuhqCA6xjvDfPoSk3i4
         PWZbmjoCGLOGrVY2znV9HI4koJCJqTh4f8q3hZfGmS/FVJzn/3hfKjoR3uYto2zFRqZT
         h4gncJsEW7NTyoKhEJZ+Ie34T8Xl4/s5WSLv5bHQdJTS+Qhq9TUEm/l1AIyghezE2hPr
         Pvbw==
X-Gm-Message-State: AFq9FYIoe+DuZRmGOu3CnoEn3rKoYh7VhzICYS0UicJSDpzSN5oy1vRz
	eJ8NdvkAoZSVEJjLPJ27R3LLRn/pk33grnjYZvBdG0w5Ih8wyjFaVCP1IQdEgQzGZ+kPYLpFqOB
	NDkvsgRZENo2VigeSQKRlQQKOdGITFbZd7b3I58X+qT6MV37ErxEYb9Q=
X-Gm-Gg: AYBFou1nSzuHWZA+617fcGlKjQHMe/Nvf6GHqZzRsiYf1ay7XrTH5FlAfAX/MpRGA8Y
	H3ORyrdiTbZ34Le3OvVxa/jea/mD4zzAAxGKqDWnBTxi0VVtGSCJpeqW2Cuofzgdo3/u/lmpISL
	b2ROgxXoYTeDcsYksShcUksbRo8ywmRWCw5dgOrYMGonwNWCcsjBAZNDlm4MdgrYS9EERdb38fD
	0BGvmjv6GPfQJ4h8RN9016P/IiJliNWhw/UFEdZZ01SaI5ZZwYU0iIidDQ6lLPCmDx6AuQSXocX
	ksganzzRDSN6Gblnu15mbxC7/FV9m4Fm1fBqIrsOGpfIDGxYn9xDdZuquQ==
X-Received: by 2002:a05:690c:c4fa:b0:8a8:7688:2d99 with SMTP id
 00721157ae682-8a876885069mr21726147b3.26.1790396271119; Fri, 25 Sep 2026
 21:17:51 -0700 (PDT)
Precedence: bulk
X-Mailing-List: sashiko-reviews@lists.linux.dev
List-Id: <sashiko-reviews.lists.linux.dev>
List-Subscribe: <mailto:sashiko-reviews+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:sashiko-reviews+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20260925233538.5708-1-emil@etsalapatis.com> <20260925233538.5708-4-emil@etsalapatis.com>
 <20260925234633.AC33F1F000FF@smtp.kernel.org>
In-Reply-To: <20260925234633.AC33F1F000FF@smtp.kernel.org>
From: Emil Tsalapatis <emil@etsalapatis.com>
Date: Sat, 26 Sep 2026 04:17:40 +0000
X-Gm-Features: AclHuK860xoyleu-slraLZST313n0NY2IiJuy1wJUsr-r0xjKr3KqEvsXl3X80s
Message-ID: <CABFh=a4w_SM+XBAHXzcPa_vPcr_CBdZFTRuzQM+V12bqT9X5jg@mail.gmail.com>
Subject: Re: [PATCH bpf-next v4 3/7] bpf: Add sleepable arena page allocation path
To: sashiko-reviews@lists.linux.dev
Cc: bpf@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Fri, Sep 25, 2026 at 11:46=E2=80=AFPM <sashiko-bot@kernel.org> wrote:
>
> Thank you for your contribution! Sashiko AI review found 1 potential issu=
e(s) to consider:
> - [High] bpf: CPU lockups and memory pressure due to massive page allocat=
ions before range validation
> --
>
> commit 0ff0c13da92aa5b627b22373d01f9a6a0085c43f
> Author: Emil Tsalapatis <emil@etsalapatis.com>
>
> bpf: Add sleepable arena page allocation path
>
> This commit modifies the BPF arena allocator to allocate physical pages
> outside the spinlock. This allows sleepable BPF programs to use the
> blocking allocator slow path when under memory pressure.
>
> > diff --git a/kernel/bpf/arena.c b/kernel/bpf/arena.c
> > --- a/kernel/bpf/arena.c
> > +++ b/kernel/bpf/arena.c
>
> [ ... ]
>
> > @@ -747,8 +769,12 @@ static long arena_alloc_pages(struct bpf_arena *ar=
ena, long uaddr, long page_cnt
> >                       /* requested address will be outside of user VMA =
*/
> >                       return 0;
> >       }
> > -
> >       bpf_map_memcg_enter(&arena->map, &old_memcg, &new_memcg);
> > +
> > +     ret =3D bpf_alloc_pages(node_id, page_cnt, &pages, sleepable);
> > +     if (ret)
> > +             goto out_memcg;
> > +
>
> [Severity: High]
> Could this early allocation trigger system instability or CPU lockups und=
er
> pressure?
>
> By moving bpf_alloc_pages() before the arena_adjust_tree() check, a BPF
> program can request a huge page_cnt (up to the entire arena size). Becaus=
e
> the physical pages are allocated before we verify if the requested virtua=
l
> address range is actually available in the range tree, this could result =
in
> massive physical memory allocations and blocking reclaims.
>
> If the requested virtual range is already occupied, the allocation will j=
ust
> immediately free everything when the range check fails under the lock. Co=
uld
> this be used by a BPF program to induce excessive memory pressure?
>
> >       data.arena =3D arena;
> >       data.pages =3D &pages;
> >       data.i =3D 0;
>

This scenario is handled well enough as we discussed in the previous versio=
n.

As an aside, the set has  a merge conflict because it is being routed to th=
e bpf
tree but the patch series is based off of bpf-next. I think it may be bette=
r to
target bpf-next instead, otherwise we're going to have a conflict merging
the two later (bpf-next is further ahead arena-wise so to speak).

> --
> Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260925233538.57=
08-1-emil@etsalapatis.com?part=3D3
