Received: from mail-yx2-f41.google.com (mail-yx2-f41.google.com [74.125.224.169])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 40B3B49BD6D
	for <sashiko-reviews@lists.linux.dev>; Thu,  1 Oct 2026 20:48:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=74.125.224.169
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790887730; cv=pass; b=udbailKoTnL+2PAoeTUsq0lvnTPsw0Pxexy9NboPzsJMlnhaisZrO1cc1legLivLY94JBjMUGHfZgqSF77TozFIpixS3RD3RaBb+zihrLzQm4jmTla9Gg5XkGmlUazRXnUeAHObqP8LwO0AN4HVfbVLgQAiUD1VPh+OETOX18Hk=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790887730; c=relaxed/simple;
	bh=tOUyUtD9YzGjF21bX25M8K+WYH8Q/K7pCMWsEnYbjKc=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=fogUCvvbBAuEV3kVK6Xd5UpvimtSoCqo4H88zMkqBgD8oE4CZR+5hYR9It1g4vh3TeCxKnhQDrDkHYAww0Th/ZR8+Uco93tieGD3ExQKrJXBH1lKoux5Bi4PvnbiaG0u6nbIYv3yp2ZuXKKfpHZNynthY1c3K9JelE3TU1XIItA=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=BeWulSTR; arc=pass smtp.client-ip=74.125.224.169
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="BeWulSTR"
Received: by mail-yx2-f41.google.com with SMTP id 956f58d0204a3-675bcac8ceeso2755120d50.0
        for <sashiko-reviews@lists.linux.dev>; Thu, 01 Oct 2026 13:48:49 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1790887728; cv=none;
        d=google.com; s=arc-20260327;
        b=fhwqIPhRtuTIQghXEW+hgU683sAssF1KVju6AtxvYbFIi5nMekGgd03FB99HL10SZI
         1Tk+p5/w5CdAGmXIboo0WaZjgcYYHrhxt5gFc7L7V4v4ZM0cDd+YRYHCml3wuY91MTSQ
         Yjh//Nd/04CFJAg5WtNdCBuNaYSPoctVmQQjY5kt5rO6ryLebZBeKEml/dRq8wS/W87V
         5uBwBM81BlRLKoKak8nUI8LOz4VckxOle/uupzbO1rUtueQn3HiSbHaehOxSOZBAymwx
         XXi+HJ4X+5CdvjVILklNtWSmrSb5aoRNI9H9DSCTAiAR0fMVIoPUiJKe/bBCFembKzh8
         yc6w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=hXzdK5QWID3MCeLjE3WVpfx7nvstpzl0h0tds4vVtak=;
        fh=kAGRFKDN7aRGd6VO33HQbsOy3CoTfL4nr4GTMsDqfhg=;
        b=DOysWrRHcdU2m9wH2Mg/soFQnWyGhFIl8SFjIUmeHQ+Adiqten41/JYQhYoU7+5mNf
         FTlIlnA4wZTPcwIu+7ACJC2NyOxgbgeSr5LUl0nlerFQIcPwZuSE81/mpWrtYMct43Tq
         BoWu1GPojZWAd8BnbaxtdFZAER5fkUdv/BzVOXYIAqJcIYdIKRurtFuYkxqMiSbmFPL7
         flK9GCB1UnzCfB4fQyM/RnKgXxb77uY6S2lZI29cfwTBLW+XXhuh0XoQE25SZP99SiD+
         KTZRgcY6Q9tUhoOWGFexUmeSO66E1Ix3y/7uHv0foeX1vUhD2gjhILLB1b5A1OlYO5MU
         7GDQ==;
        darn=lists.linux.dev
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1790887728; x=1791492528; darn=lists.linux.dev;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=hXzdK5QWID3MCeLjE3WVpfx7nvstpzl0h0tds4vVtak=;
        b=BeWulSTRyAkR7UXzYcnf51RrzZM0ik251MI2B+ZXT7uvH2KxWN+2MmdpaEBwQK/fy1
         zdd7EoJ2H8quYfrJlvk0rK1LlsZbXlPyMeXCPB5x3mstINjjnd57GgfnyA1NYRY/5Gk7
         52kZSO64yAk461VtZkrhAFWtLdZtE9ahJfp2zC4RL3mdStEYa2AhKRvCvFe2acqKy5h6
         nylRJAb97HrCdMdxSr6N4+4GgFic9DiTi6Hibp8u+Cf2xqdA1EcMcJyaf7cQ6PRMEAyQ
         5c26pZ5AvbutfA57fWQzq2/l0YapVAgYt0RjCSJv9ExkdTBll1svgSndEYS8Otcvn3My
         kyig==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790887728; x=1791492528;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=hXzdK5QWID3MCeLjE3WVpfx7nvstpzl0h0tds4vVtak=;
        b=GODjfrxtQolzNu0L+iejpIVpzwVwKMX9HnfBCdy41qp951T9rljVTSAwuB3XNzU2bX
         2V1QoIenweEshFDBF5qSNxNA8nAPeVaUC55eNkSYJ18QZLNnzxA01W75zuwD9AbI3C+B
         YI3tkyuY80taE0FKCEAhDVAHLLzIvLORzui3bgCg5b/CdlqKx99bbRg1m8qsi3hPifnb
         U2wO1BFAuYgKGPjKQ4km4M1kkL9AixV0E1Sh2DL8OmN93LMF1hKQCUvojhnuIUMVJ20U
         KaC9QgSSP7lMBTzCs1mGLH0/IPZuwVWQv0qreV+MqWzQdF9rBs4PKwBGOina28xyo+b1
         Qy6Q==
X-Gm-Message-State: AFq9FYILsI0aPb2/vX6osIjEWzfzMCGY+I7K0EflcPgbPPQRtHn4ZMvu
	fD9Ob4pZTDfzVLvJVkGKgXR3rBqTImuVosil51XHflKUvlU1U9J6tpg5qsy5h2Qz/38d3Q5NP/E
	/NLxTlp0sn8TfGmytaggA0/UWeILKqrQLW8DC
X-Gm-Gg: AYBFou1ejMtQaMCFSsItcDEmfgsOl3FsNwf0yU8HY2KARRO263GYn1FEh+nXionVtW7
	3Rr4l8zLtt3Qs9j2PxhVE22tV+QlRIOKTKnYujgpdlr36NP8Hir9VaSBrCjfplH+TujCgG1cW9o
	esn7rSBq9IGWdRRDP3Sb1/vyCIya7EblhvVjMsm/0N14EdXrEfKu7QEtdhDgKixmfZqPH9ZGmgk
	9BrW3eKJTK32jPVvwE+VPTBOKuigpPTfpbTPa40VGfnhiKH/Yt5vMfZtwYeQj3UTax80eghFX78
	JtG3Dl98bBXvxYPanuvxiX5ZZ3oENP6jcKBA1coIQhSU82SnKj6BI1K16bDtYc5sTJrejw6swE6
	l7zRw7EYDDmeovYc5eFm+zM3Af2eGt4MJ6Z69y1hJWD0C
X-Received: by 2002:a05:690e:43c2:b0:675:3b2f:149d with SMTP id
 956f58d0204a3-677abdedee8mr177654d50.6.1790887728087; Thu, 01 Oct 2026
 13:48:48 -0700 (PDT)
Precedence: bulk
X-Mailing-List: sashiko-reviews@lists.linux.dev
List-Id: <sashiko-reviews.lists.linux.dev>
List-Subscribe: <mailto:sashiko-reviews+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:sashiko-reviews+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20260923-dd-cmap-part2-clean-v11-0-9b6c217fdf2f@gmail.com>
 <20260923-dd-cmap-part2-clean-v11-17-9b6c217fdf2f@gmail.com> <20260923224758.ABDB11F000FF@smtp.kernel.org>
In-Reply-To: <20260923224758.ABDB11F000FF@smtp.kernel.org>
From: jim.cromie@gmail.com
Date: Thu, 1 Oct 2026 14:48:22 -0600
X-Gm-Features: AclHuK_fnG9ePBcpefBAaL1OxTkmt0Q1XqH_AAR2O6UruMjbb77-3ueG2XaC4OU
Message-ID: <CAJfuBxzR+rHmMw7HPscwb4eAVn1SsnHpFVLGcYxJOq9icQyQWw@mail.gmail.com>
Subject: Re: [PATCH v11 17/38] dyndbg: replace classmap list with an array-slice
To: sashiko-reviews@lists.linux.dev
Cc: dri-devel@lists.freedesktop.org, linux-modules@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Wed, Sep 23, 2026 at 4:47=E2=80=AFPM <sashiko-bot@kernel.org> wrote:
>
> Thank you for your contribution! Sashiko AI review found 1 potential issu=
e(s) to consider:
> - [Medium] dyndbg: interleaved classmaps are orphaned due to contiguous s=
lice assumption
> --
>
> commit 8936e7007afda568cebc34aa496a40887ac6a5a1
> Author: Jim Cromie <jim.cromie@gmail.com>
>
> dyndbg: replace classmap list with an array-slice
>
> Classmaps are currently individually list-linked onto dyndbg's per-module
> ddebug_table for operation. This commit replaces the list building operat=
ion
> with an approach that treats packed classmaps as an array-start-address a=
nd
> array-length, reusing the select-by-modname condition to find the bounds.
>
> > diff --git a/lib/dynamic_debug.c b/lib/dynamic_debug.c
> > --- a/lib/dynamic_debug.c
> > +++ b/lib/dynamic_debug.c
>
> [ ... ]
>
> > -static void ddebug_attach_module_classes(struct ddebug_table *dt,
> > -                                      struct ddebug_class_map *classes=
,
> > -                                      int num_classes)
> > +static void ddebug_attach_module_classes(struct ddebug_table *dt, stru=
ct _ddebug_info *di)
> >  {
> >       struct ddebug_class_map *cm;
> > -     int i, j, ct =3D 0;
> > +     int i, nc =3D 0;
> >
> > -     for (cm =3D classes, i =3D 0; i < num_classes; i++, cm++) {
> > +     /*
> > +      * Find this module's classmaps in a subrange/wholerange of
> > +      * the builtin/modular classmap vector/section.  Save the start
> > +      * and length of the subrange at its edges.
> > +      */
> > +     for (cm =3D di->classes, i =3D 0; i < di->num_classes; i++, cm++)=
 {
>
> [Severity: Medium]
> Since the scan in ddebug_attach_module_classes() always restarts at index=
 0,
> could this cause regressions if multiple descriptor tables exist for the
> same interleaved module? When distinct compiled objects share the same
> KBUILD_MODNAME, it seems they might all incorrectly bind to the first blo=
ck
> instead of finding their respective fragments.
>
> >
> >               if (!strcmp(cm->mod_name, dt->mod_name)) {
>
> [ ... ]
>
> > +                     if (!nc) {
> > +                             v2pr_info("start subrange, class[%d]: mod=
ule:%s base:%d len:%d ty:%d\n",
> > +                                       i, cm->mod_name, cm->base, cm->=
length, cm->map_type);
> > +                             dt->classes =3D cm;
> > +                     }
> > +                     nc++;
> > +             } else if (nc) {
> > +                     /* end of matching classmaps */
> > +                     break;
> >               }
> >       }
>
> [Severity: Medium]
> Does this premature break in ddebug_attach_module_classes() enforce an
> assumption that classmaps are strictly contiguous?
>

Yes, it explicitly enforces that assumption, because contiguous packing
is a fundamental invariant of the Kbuild object model and linker script:

0. In Linux, all translation units (.c files) comprising a loadable
   module or composite built-in object are linked together via
   $(LD) -r into a single intermediate object (e.g. foo.o) before final
   vmlinux or .ko generation. All contributions to custom ELF sections
   (__dyndbg_classes, __dyndbg_class_maps) within that object are
   placed contiguously.

1. Built-in module definitions do not interleave across directories or
   link units. Core dyndbg already relies on this exact contiguous
   invariant for callsite descriptors: dynamic_debug_init() scans
   __start___dyndbg_descs sequentially from index 0 and allocates a
   struct ddebug_table whenever strcmp(modname, iter->modname)
   transitions. If Kbuild interleaved objects for the same module
   across arbitrary boundaries, descriptor tables would already break.

2. An array slice (start, len) inherently represents a single contiguous
   memory extent. By definition, a slice cannot represent fragmented,
   disjoint ranges. Replacing struct list_head link with a slice saves
   memory and pointer indirection overhead per classmap, backed by
   standard section layout guarantees.

> If classmaps for a module are interleaved, breaking early means only the
> first contiguous block is bound. Subsequent classmap fragments might be
> permanently orphaned, leaving class'd pr_debug calls in those fragments
> uncontrolled.
>
> --
> Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260923-dd-cmap-=
part2-clean-v11-0-9b6c217fdf2f@gmail.com?part=3D17
