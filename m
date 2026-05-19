Received: from mail-yw1-f177.google.com (mail-yw1-f177.google.com [209.85.128.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 71D442D3A7B
	for <sashiko-reviews@lists.linux.dev>; Tue, 19 May 2026 06:57:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.128.177
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779173833; cv=pass; b=eCFiTFkB1Pnnqjx0GmFu/s751ZJK6CmKXZIfRyG0kCqCj7LWJdmOUITFrq0jVV1o9/i0WsyMUmuzk55K46ERzU4lhVZnGhsWnBF8cme1lFkTUmMJfe5z34M4oLajWA7xlKRVIG56SKk+tymEWngil1mB0avfy7QHQkmQ4d1PYMI=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779173833; c=relaxed/simple;
	bh=OwxHlPGz5ECvvbPqp96QaRuFid/aSDuMfJI5ko53EyE=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=mlS6+S6pLPXL+SiihtiAmZ6G1iVI42TdKLB3I8cihRB3cqU6XQJmrR6pLts/aDSjwJSVfgKs9XxsofjOWuu7FjtEFC0op7zcXrowj6jtU8sYyJj+4+t/shxvH17dFbmHwKaJwPuDkmDPRVJXQkMf4Gut6xq8RYfUl1ODHoRY7KE=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=eGy/pdoT; arc=pass smtp.client-ip=209.85.128.177
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="eGy/pdoT"
Received: by mail-yw1-f177.google.com with SMTP id 00721157ae682-7bf1eaba464so25752887b3.1
        for <sashiko-reviews@lists.linux.dev>; Mon, 18 May 2026 23:57:12 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1779173831; cv=none;
        d=google.com; s=arc-20240605;
        b=THNGfN1NrCDJVPuFR3a3L08Frty92hNyWZt/U3/GJzbUuQOXFrdi2C8+ou2b5LW3bQ
         9jnPdwWK5s/8Nmmfro1haGBHiUJcfXLWrLXJ0JmKY7b8SpLfr7teX6ZXoHIDRscekkHt
         BkVHbe+W5p+dTkzS4d01+jyiLj8b+Xeu6i+RsCjLCkH9kFtPB7vwBpXvoRBfeiyzxWYg
         VtHWJUaNMokNieyNjAu5zhP7tuuTcAfOsbnV/V3ISo3JdsDQHPLNhFtywZob7k7yC3dg
         PH/5G6Ex4cp71PfaLR+TZUzaawFhX8TvgV66n5ajYtCCFNRbVSTIyr08klBJ1k2mDi+k
         QPww==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=6YzJyV+bO2QFVkrxFi/2ouYgMlXUGJCU36KJo4L5Lf4=;
        fh=4gOxDeuGnMZoj2nB/zEaclFAdYP/8bAqcL280iaA3RM=;
        b=FUMLcstDqw3pGdsS1CiQEWldO0YBrdB/ZQ6WKBBqCXZ7t27Ry1khhJi4+KNmLJotzT
         0FDx0lZeVDcn343QouIN+iC6wqBriEMiSXrLW2+dK/0Z8SNn5Njj2sZxThGAznwnsLiy
         Yts+GrabeQ0f6fSR8LYcDjDzJAYok0m45Zz9QstyuYBmyNRTuyTwnL0ksDe3NJ9fnFUI
         lwhpb+sG8ZJRt3WYvDmUQMOiJy0G5LXxQISLsVb0FhkOOnkrJw2jKqmuvB9PBCPUqQIg
         V38wIq1RigpGZDTN6gBx1MLIIwO0u3GwE60o5vCAKsegbRcCClbglk9C5BRZe7UIkHbn
         RBLQ==;
        darn=lists.linux.dev
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1779173831; x=1779778631; darn=lists.linux.dev;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=6YzJyV+bO2QFVkrxFi/2ouYgMlXUGJCU36KJo4L5Lf4=;
        b=eGy/pdoTTzTPIgERlgoF0vzthxVaTOk2FiLsi1ztKc06p+Bg2qVtQFTUMR1eVHJ0G9
         KnJ1qzpXpWtiGrJKZ8iQww59UadtHZ5nf/5XCjHIJuovPKAKrqilBao55YR5LTbqODKC
         nhLZuS3+mC5D7M4xr1QyfvsL7F/Z37ASYjBSnPK6fpBRANJnLuWkCe96L6g3oQMHhjMt
         RJV9f9jS8IH7YnWgoKjIEJUWnZ+manZwpp6uUmOMigJ/FoiIIUGDrHdaq7Eo2vJVelck
         5dyD3bQ8mvxVg78ZkCM3WgxhzfEdGPw0zvxGOxml9V/lPATz2l76rVyxBP3ev5JBFPYz
         iHBw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1779173831; x=1779778631;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=6YzJyV+bO2QFVkrxFi/2ouYgMlXUGJCU36KJo4L5Lf4=;
        b=o2HXWfe1yqM8rzho12d2lyzeb3/ZavO6otDjVOOGCFUNM/bzAxUi1ZHYreovcptrhC
         2FmDREXyRKCOY1GWFixRxSPujO+W2b67dsfG0NvKfevYA5UjfnS0w5MS3CH+4qMJC5mo
         yWFeDHJd2lLSh5Sfh78WIr3Mb8hQ0aSpFB5FtmfGpQDyRSYdnqS1sBwmXlVgRuaf5/Vq
         uG8qPKos3oIdBL2Niq0C0NxCPVDwFRjD3J296GnjtVDzJVhqoh1qbfWqtAa+P/E/Hda+
         h8Sql9ATPVVH26RQg1WkK7WZGx0RWRyR1s5M06/TZFnPM+barRBz4l9JUruw14S1gEfT
         ePhg==
X-Gm-Message-State: AOJu0Yyo+cgZqGT5/XbsvIhszGKJtLunGbyRMcvr/fSyrZyW2FjzCdAO
	6pz2D6Yx0YBmmwxkJwsyU7s/gV5ukJiI2znif6m5cWt18ZNiDh87ScdDkQUoIm9hQ6yHyKBjCwT
	tFBr0SEUwmbAd7OkbqPSZe13/keRXNN8u2vykfPQ=
X-Gm-Gg: Acq92OGyNp0htsSEDtsF4m4lYj8OJHaeJxqlGyHHTiCOz6iqsWsZlA0dgp52Syzi/Zz
	dP5gBoIIKDe+ONXFd+le/AGXV0hl5/b4oNKeN8MEJBSrt7UaBOSZVvhuRFVkJlhamodVnzGXIpA
	aitkC84bJftqlGRCccjRZrEJvqAfIjr4B4Rwh8APfCRWy0aNUUrCH3PncTIa+/s0j5NzQcl+/tO
	+QhufJnTxRCn5fT8x4Ltu7t38WWoExfyTfwwa9MAJo8PxRiF1lTidylwHLehXeAIeEYP92Suc9N
	5tk76ivsFTLYINL9bdEOuVRsDLEDplXVBmcaumtbe223ansQHAY=
X-Received: by 2002:a05:690c:c248:b0:79f:4e02:50cc with SMTP id
 00721157ae682-7c95c7f00famr211146907b3.42.1779173831407; Mon, 18 May 2026
 23:57:11 -0700 (PDT)
Precedence: bulk
X-Mailing-List: sashiko-reviews@lists.linux.dev
List-Id: <sashiko-reviews.lists.linux.dev>
List-Subscribe: <mailto:sashiko-reviews+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:sashiko-reviews+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20260513143321.26185-7-laoar.shao@gmail.com> <20260514230124.A4236C2BCB3@smtp.kernel.org>
In-Reply-To: <20260514230124.A4236C2BCB3@smtp.kernel.org>
From: Yafang Shao <laoar.shao@gmail.com>
Date: Tue, 19 May 2026 14:56:35 +0800
X-Gm-Features: AVHnY4JvYrg93B2o6rxhprK1XxGcjfdc28pes5tYsAu0IfXgVN0YjAMMBbz2omY
Message-ID: <CALOAHbB_94VGGEmXrSN9dckqNHZdQDv0ZbH0xkuA6ri+g9=MWA@mail.gmail.com>
Subject: Re: [RFC PATCH 6/6] livepatch: Support replace_set in shadow variable API
To: sashiko-reviews@lists.linux.dev
Cc: jpoimboe@kernel.org, joe.lawrence@redhat.com, song@kernel.org, 
	mbenes@suse.cz, jikos@kernel.org, pmladek@suse.com, 
	live-patching@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Fri, May 15, 2026 at 7:01=E2=80=AFAM <sashiko-bot@kernel.org> wrote:
>
> Thank you for your contribution! Sashiko AI review found 4 potential issu=
e(s) to consider:
> - [High] Newly allocated shadow variables fail to store the `replace_set`=
 identifier, breaking all subsequent lookups and leading to unbounded memor=
y leaks.
> - [High] The `klp_shadow_combined_id()` function invokes undefined behavi=
or and loses data on 32-bit architectures by shifting a 32-bit integer by 3=
2 bits.
> - [High] Changing the shadow API `id` parameter to `unsigned int` silentl=
y truncates 64-bit `klp_state` identifiers, leading to memory leaks.
> - [Low] Modifying the `klp_shadow_*` function signatures breaks the build=
 for in-tree callers.
> --
>
> commit 91116e31e667d0beea437b5048ab5a62099a5eed
> Author: Yafang Shao <laoar.shao@gmail.com>
>
> livepatch: Support replace_set in shadow variable API
>
> To support more complex livepatching scenarios where multiple
> replacement sets might coexist, extend the klp_shadow API to
> include a replace_set identifier.
>
> > diff --git a/include/linux/livepatch.h b/include/linux/livepatch.h
> > index c9f2036dfefcf..cee35f5cae9ad 100644
> > --- a/include/linux/livepatch.h
> > +++ b/include/linux/livepatch.h
> > @@ -192,15 +192,17 @@ static inline bool klp_have_reliable_stack(void)
> >              IS_ENABLED(CONFIG_HAVE_RELIABLE_STACKTRACE);
> >  }
> >
> > -void *klp_shadow_get(void *obj, unsigned long id);
> > -void *klp_shadow_alloc(void *obj, unsigned long id,
> > +void *klp_shadow_get(void *obj, unsigned int replace_set, unsigned int=
 id);
> > +void *klp_shadow_alloc(void *obj, unsigned int replace_set, unsigned i=
nt id,
> >                      size_t size, gfp_t gfp_flags,
> >                      klp_shadow_ctor_t ctor, void *ctor_data);
>
> Does this signature change break the build for existing in-tree callers?
>
> It looks like samples/livepatch/livepatch-shadow-fix1.c and
> tools/testing/selftests/livepatch/test_modules/test_klp_shadow_vars.c
> might not have been updated to pass the new replace_set argument.

selftests will be changed accordingly once the RFC is removed.

>
> [ ... ]
>
> > diff --git a/kernel/livepatch/shadow.c b/kernel/livepatch/shadow.c
> > index c2e724d97ddf2..35e507fae4458 100644
> > --- a/kernel/livepatch/shadow.c
> > +++ b/kernel/livepatch/shadow.c
> > @@ -59,6 +60,11 @@ struct klp_shadow {
> >       char data[];
> >  };
> >
> > +static unsigned long klp_shadow_combined_id(unsigned int set, unsigned=
 int id)
> > +{
> > +     return ((unsigned long)set << 32) | id;
> > +}
>
> On 32-bit architectures that support livepatching (such as 32-bit PowerPC=
),
> unsigned long is 32 bits wide. Does shifting a 32-bit integer by 32 bits
> invoke undefined behavior here?

Ah, that is a problem on 32-bit PPC. I'll fix this in v2.

>
> Furthermore, since struct klp_shadow->id remains defined as an unsigned l=
ong,
> it cannot physically store a 64-bit combined ID on these systems. The
> replace_set value might be entirely truncated, resulting in hash collisio=
ns
> and subsequent issues when multiple sets manage the same resource.
>
> [ ... ]
>
> > @@ -126,7 +134,7 @@ static void *__klp_shadow_get_or_alloc(void *obj, u=
nsigned long id,
> >
> >       /* Look for <obj, id> again under the lock */
> >       spin_lock_irqsave(&klp_shadow_lock, flags);
> > -     shadow_data =3D klp_shadow_get(obj, id);
> > +     shadow_data =3D klp_shadow_get(obj, set, id);
> >       if (unlikely(shadow_data)) {
> >               /*
> >                * Shadow variable was found, throw away speculative
> > @@ -147,8 +155,8 @@ static void *__klp_shadow_get_or_alloc(void *obj, u=
nsigned long id,
> [ ... ]
> >       }
> >
> >       new_shadow->obj =3D obj;
> >       new_shadow->id =3D id;
>
> Because the id argument is now a 32-bit integer, the upper 32 bits of
> new_shadow->id will be zero. Should this be initialized using
> klp_shadow_combined_id(set, id) instead?

Right. will fix it.

>
> Lookup functions like klp_shadow_get() and klp_shadow_free() search using
> the 64-bit composite ID klp_shadow_combined_id(replace_set, id). When
> replace_set is non-zero, this lookup will always fail.
>
> This means klp_shadow_get() will erroneously return NULL, and
> klp_shadow_get_or_alloc() could duplicate variables indefinitely, leading
> to unbounded memory leaks.
>
> [ ... ]
>
> > diff --git a/kernel/livepatch/state.c b/kernel/livepatch/state.c
> > index 43115e8e8453c..6e3d6fb92e64a 100644
> > --- a/kernel/livepatch/state.c
> > +++ b/kernel/livepatch/state.c
> > @@ -203,7 +203,8 @@ void klp_states_post_unpatch(struct klp_patch *patc=
h)
> >                       state->callbacks.post_unpatch(patch, state);
> >
> >               if (state->is_shadow)
> > -                     klp_shadow_free_all(state->id, state->callbacks.s=
hadow_dtor);
> > +                     klp_shadow_free_all(patch->replace_set, state->id=
,
> > +                                         state->callbacks.shadow_dtor)=
;
>
> The shadow variable APIs previously accepted an unsigned long for the id,
> allowing 64-bit identifiers. The new klp_shadow_free_all() now accepts an
> unsigned int, but struct klp_state still defines id as an unsigned long.

Right, we should clearly document this API change.

>
> Will the implicit cast from unsigned long to unsigned int silently trunca=
te
> the upper 32 bits of state->id on 64-bit platforms?
>
> If the original ID exceeded 32 bits, the core might fail to locate and fr=
ee
> the correct shadow variables, causing a permanent memory leak during
> garbage collection.
>
> --
> Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260513143321.26=
185-1-laoar.shao@gmail.com?part=3D6



--=20
Regards
Yafang
