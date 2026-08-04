Received: from mail-yw1-f174.google.com (mail-yw1-f174.google.com [209.85.128.174])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 770B64322F1
	for <sashiko-reviews@lists.linux.dev>; Tue,  4 Aug 2026 08:05:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.128.174
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785830707; cv=pass; b=MVvjS/Sm57Tc/Fm3zLcfOFNBOXPuEuXLGLBP+9ll9f8cSoz/iRD42Zv1v2v9i47JCwdirq19ATcJvg8PfCf7y1vuICZ1pi2n/2wtHbV36GV+lteRh/oi6OJ7Y9IFRVHEZ+ueHtVbsIBz4yOmcHATM4trNVyDrXWbxhGltbNjmbo=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785830707; c=relaxed/simple;
	bh=+Hb1SpzFF3V8KPLkO13v6cUxu1h5CbiM4NFRrHqr13w=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=Uq+OG6V2jrsPMR6gXOLhrsCluhh9P0xvEiz7cNYgzjYod5bhMPDmNRwy0EHzUOqWCn4/k34+uFMrojb/teDugTG6wpACYVf2jASazzj1YJfbhYc2PU6YKKJoRd9NY9gO5YOHU97+A8T8cntOmFzO3B3MObWja2eUfUg3KOaHcXA=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=bKo/8g2s; arc=pass smtp.client-ip=209.85.128.174
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="bKo/8g2s"
Received: by mail-yw1-f174.google.com with SMTP id 00721157ae682-81ed2a06b9eso37015847b3.3
        for <sashiko-reviews@lists.linux.dev>; Tue, 04 Aug 2026 01:05:03 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1785830702; cv=none;
        d=google.com; s=arc-20260327;
        b=qM30T87OozefvbgmsEpw7iqAakmnwJGRAwrGHNRQl8AImLkoF4BxiO8V3dk/ufVfoM
         k9/e5frA4XyKmgESaWFyc2aZ90Tx0QRvpgXrrbXAuvaGJ4ijQvgkvMdunkLpSPsicjNM
         rnjC2f5nns+mUK37BtPsZLQygU2qZADv1Lwsv81DmQuW8uS1bpvkiE67t9rCoQsPrmez
         p/h+ACw9ZNgFx/uc0pMjjE797EYWJYtDAOSKIm9pLlrsQTlFFAJXbhlOFJNBniEHl4BY
         KuVKO/Ml9WjPkrWiGAOQsUf8aFLDR94X4JycDJY5LQ+NOkaekmcUOfU7648mqmefHCET
         h3XA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=DxODsGuSrXyYDuLdsSOihL33BxJS8kfi8qZptAhXGXo=;
        fh=4gOxDeuGnMZoj2nB/zEaclFAdYP/8bAqcL280iaA3RM=;
        b=CrSF/s5mRGz0TWgfkkIydVguklwCEBBdwu9bOBp0r/ItLTkRwJWtDtTKfUlKKJJJM6
         0DF10VT2rJOi1tmaGF9nJhXNEsl1KxNUty/FItqrCtvkjoFKIze913qHiTDR2z3Wnr2Z
         YtKbhBqSBkw+4HA6ETUH+6ZfRIcqKR1PWZlD+czYkmsrG/gmgbZJBzcba+3gcEjtIxrV
         QuZhaQVcqW3NXha4rLcYQLGx1r+LXdjd8210qHjVcYmTBu9C0UAN8juRymDsMWbWANFI
         YYY9IPa6d9M3W05IlWT9+ihf9Q6v2PJ0tpZtW7pcOMFjfbVfTjG82V9aXFUTX4WoATTE
         O6PQ==;
        darn=lists.linux.dev
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1785830702; x=1786435502; darn=lists.linux.dev;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=DxODsGuSrXyYDuLdsSOihL33BxJS8kfi8qZptAhXGXo=;
        b=bKo/8g2sYVoO1Fbdq1Wj6yn6vbAfkyVOwLQxdGbdi9J1Wz//BOFIQmS3dUiXcrcR38
         VVFcrrbqoFRpe7QLWHtsOYIKY7XV45B3+At0xdzNhIPohxnuYmiXsfEqRbEoZskklBVr
         bNiNYb0LTK/6nT5ya2yXHJiM3jf8Pv4fcU9YGQgtqXfZJkwKh9E5Ydk343ETl0E+A+Ai
         Z2sghm+TMrcv8EVqSHIWgn+AHoBq3qbOzq6d5xlMsfJ5LKxLLvlDe+w85v5TCMtd8PW7
         8UWZiQxSr9rvbT3+tfB40AUf8jSQ8X+8jGG2dYIk8aYmqcx3e+odeAb9PgPyZBZVH1AY
         N32A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1785830702; x=1786435502;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=DxODsGuSrXyYDuLdsSOihL33BxJS8kfi8qZptAhXGXo=;
        b=dE59XbTnrVhOVQCZWv/ezA5HgsR4GYrstkGUO4qEHCk6+Z1idG8X7VIamI4lFOAJdt
         XjUokWzXFM1zMvOfGjD6i9EmL9ZGA4HOdiYiRBNpICTT5ul0oBGqG2srz/z8aKB5SsgK
         G2IbsH9b/bxy1DZQ3PNl2+6/OwNJ4INKizTEhY1t2pssxsoav+EqVzXPlvcvGIGL7Wwm
         dhh1T9dH/nbW2zFNzxzj2pOELrE7HIE6GQCcIG8gYLvrt1Dx0iQlQ6ZbDYQtI5nnIiFp
         C9HPy5MuDn/7AN2xJk3APv+R9/EMxhYhi9+ntceTWpKvse0suyevzSr3WW+6z1RYZ9pI
         M57w==
X-Gm-Message-State: AOJu0YwCvdQHAcGnZk+nSREsrIc0wuFM8MF8ncNNaH6/fTs6wCpEvY72
	y3Fd5a9/7zixbxWbk+yv5oXEZNhDAk7ixUWHLAx+qKYSFLxhYaO2B3GpHUKpVqiXx55zIO+iaRv
	35TcoogZ5yJJ8+5whFRNY9KE+vSYVIiQv/FJHOHI=
X-Gm-Gg: AR+sD10BEDRAMlUAQdWFAYu1OMUrxKbVk+rPwL7OggkMPNw3MH5mjlv7zZkYIdzOLoz
	7i653ZvliQHV8Kv2Kr2ZE6p+cTl9o3iQ/7r399BNfn+XhLEDhEAmP5Z52WZkYVdw65gzWoG/4SR
	eUWmNaD7wfu2d+9mWyTp2M5q1R06XXbFW58273MCP9HPPXCP07QODr9UNjIyI6WtxehF+edC8R0
	0hiJ6sQsxj6/6thnzx2bvN7ZSw2kBEeMjWnlsziHAwjx/WqmYy9m7JWvm0L+s0tLYJBe/m5oVjk
	89CVKLfKAxDLrfXkbK1z2DM5375q5pJOd5ucMsDSvTmhljzMTTZrquymEG9B1CMXR1I8Ju0z3pQ
	hGA==
X-Received: by 2002:a05:690c:6b11:b0:80c:3848:bde5 with SMTP id
 00721157ae682-81fd4a22e3emr170966087b3.13.1785830702256; Tue, 04 Aug 2026
 01:05:02 -0700 (PDT)
Precedence: bulk
X-Mailing-List: sashiko-reviews@lists.linux.dev
List-Id: <sashiko-reviews.lists.linux.dev>
List-Subscribe: <mailto:sashiko-reviews+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:sashiko-reviews+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20260804065010.44922-1-laoar.shao@gmail.com> <20260804065010.44922-2-laoar.shao@gmail.com>
 <20260804065633.0D6A31F00A3E@smtp.kernel.org>
In-Reply-To: <20260804065633.0D6A31F00A3E@smtp.kernel.org>
From: Yafang Shao <laoar.shao@gmail.com>
Date: Tue, 4 Aug 2026 16:04:25 +0800
X-Gm-Features: AUfX_mzjzWFOup3b8CRhesfJVIRE_EvKUp-y3mYxG0ZbV58cKl29zxrmTeo9fLY
Message-ID: <CALOAHbA-5v9p4U6=RnNap1iFRNUpooABqfv1MLAuG7qQYRu5MA@mail.gmail.com>
Subject: Re: [RFC PATCH v4 1/4] livepatch: Make klp_find_func() non static
To: sashiko-reviews@lists.linux.dev
Cc: jpoimboe@kernel.org, joe.lawrence@redhat.com, song@kernel.org, 
	mbenes@suse.cz, jikos@kernel.org, pmladek@suse.com, 
	live-patching@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Tue, Aug 4, 2026 at 2:56=E2=80=AFPM <sashiko-bot@kernel.org> wrote:
>
> Thank you for your contribution! Sashiko AI review found 1 potential issu=
e(s) to consider:
> - [Medium] klp_find_func() incorrectly returns the search parameter inste=
ad of the matched object from the list.
> --
>
> --- Patch [1]: [RFC PATCH v4 1/4] livepatch: Make klp_find_func() non sta=
tic ---
> commit 59916304ff12f7685cb556f7a7c1f4a1c5a25b00
> Author: Yafang Shao <laoar.shao@gmail.com>
>
> livepatch: Make klp_find_func() non static
>
> This commit makes klp_find_func() non static so it can be used in other
> source files by an upcoming patch. It also renames the old_func parameter
> to func to better reflect its generic purpose.
>
> > diff --git a/kernel/livepatch/core.c b/kernel/livepatch/core.c
> > index 28d15ba58a26d..e07c41a0f3ac8 100644
> > --- a/kernel/livepatch/core.c
> > +++ b/kernel/livepatch/core.c
> [ ... ]
> > -static struct klp_func *klp_find_func(struct klp_object *obj,
> > -                                   struct klp_func *old_func)
> > +/* Check if @func is present in @obj. */
> > +struct klp_func *klp_find_func(struct klp_object *obj, struct klp_func=
 *func)
> >  {
> > -     struct klp_func *func;
> > +     struct klp_func *obj_func;
> >
> > -     klp_for_each_func(obj, func) {
> > +     klp_for_each_func(obj, obj_func) {
> >               /*
> >                * Besides identical old_sympos, also consider old_sympos
> >                * of 0 and 1 are identical.
> >                */
> > -             if ((strcmp(old_func->old_name, func->old_name) =3D=3D 0)=
 &&
> > -                 ((old_func->old_sympos =3D=3D func->old_sympos) ||
> > -                  (old_func->old_sympos =3D=3D 0 && func->old_sympos =
=3D=3D 1) ||
> > -                  (old_func->old_sympos =3D=3D 1 && func->old_sympos =
=3D=3D 0))) {
> > +             if ((strcmp(obj_func->old_name, func->old_name) =3D=3D 0)=
 &&
> > +                 ((obj_func->old_sympos =3D=3D func->old_sympos) ||
> > +                  (obj_func->old_sympos =3D=3D 0 && func->old_sympos =
=3D=3D 1) ||
> > +                  (obj_func->old_sympos =3D=3D 1 && func->old_sympos =
=3D=3D 0))) {
> >                       return func;
>
> [Severity: Medium]
> Will this return the correct object? It looks like this now returns the
> search parameter (func) instead of the newly introduced list iterator
> variable (obj_func).
>
> If a caller relies on the returned pointer to access the matched object
> from the list, they will receive the search parameter instead. This could
> lead to incorrect state manipulation or memory corruption for new users
> of this exported function.
>
> Should this return obj_func instead?

Good catch. It should return obj_func instead.

--=20
Regards
Yafang
