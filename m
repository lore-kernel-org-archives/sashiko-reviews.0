Received: from mail-yx2-f13.google.com (mail-yx2-f13.google.com [74.125.224.141])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BB132244667
	for <sashiko-reviews@lists.linux.dev>; Sun, 20 Sep 2026 20:26:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=74.125.224.141
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789936005; cv=pass; b=g7AvQoDMkSx23FM5ZiiRm+OvtNWYUbTfo2k2mv6obbsxgdxbrFGGRmcMG1nYlb/zZji5cj5rUpCImh45WMaM0a595GpSZL8aozoJkvjzDSMnSZG0xp8K9Cuf4VrN7ByWRtvHStyUofmYlfWGkw3acu3H//NPtNDV++W6GP3cmH0=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789936005; c=relaxed/simple;
	bh=E2iEBO8dOpu0/0Lr+dW8J7NY49JLrf9mwt5f8hTpVW4=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=fpdMzunn6J7FPx0m8g22Gcq31FCKEYDTlimg+FClICr1sav7SbVSWTyryVnSz2gDyhOYm/PevzNDdOQ6nYiA54/pAObELtPF+NOQX6vlDlAHrpEyVnh28P0sVTEZ+PmisyLv2Cemvf2zjdLOKCYly//WZoiddBFhUmb888DKzVw=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=Y7L7FbuQ; arc=pass smtp.client-ip=74.125.224.141
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="Y7L7FbuQ"
Received: by mail-yx2-f13.google.com with SMTP id 956f58d0204a3-66e56a1fe3fso2060392d50.3
        for <sashiko-reviews@lists.linux.dev>; Sun, 20 Sep 2026 13:26:43 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1789936003; cv=none;
        d=google.com; s=arc-20260327;
        b=Xr3f3Cxu+yvhVH3husSGo/aOaJSDzw9qFVmGTjRc4zbHoPYMylLBvtvgO0VjmOdKtz
         SxJ80joe0MMWjQh+a/SWrzaxiNmcPCpSc96JBPbrlJVgzkEMdO1FUa/2hOvM20ui0kaW
         8CsE7T+aDBpFayiwGOUORaBplEYBlR004q1wMndhZMjTNjb39gamMrP9V/sQBD0tRD/I
         S2J319wTrrAaTA2jZ8Iti3/fstcy0jtMd0PZhbqFF2mRXB4Uf0FAfEJ7MrlDvxEGU26e
         D9JtwoKFeEXq7OPDMRIfo2ccO0VpgyPY7zXFT6rZiTbnlm5Ylcu/b+Vsn6HtsuhJHJE2
         RlBw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=M5Inp0dUK9mWGDzU51sPdtRsOeEciT1UFPFVj3DOFnI=;
        fh=kAGRFKDN7aRGd6VO33HQbsOy3CoTfL4nr4GTMsDqfhg=;
        b=jJHYjyiUj123q0pSFZj4pPCQabhOIbqNf/OLBmT7rsyuxVFFhhh9RRxOMq0BfI+xQE
         MaC8zWxzUod9vf3Mn0cDLgKM5gwc2uVAR6cJ85ceBRzS9Ywm5zqZcFdBAIywLhj2fUh5
         XhtL8+BrrUF53vrqJVTtGkHUiT/CGAmk/fgZKChzXp07/8PhM8NmXs7h5adMn3bcDWLC
         N45LLbP1A/kcmV5qRL4aTUapN0OIhcf1AnSg3plOvuXXPIKtXRpWy0QzpiE4x78Vht+H
         XESROfMV+BszGd1Puat12bS7k8LZYpUEYf/f7eeXQSlXjgAMhzMZ0x6yWCsDgrGCbCMY
         bCOw==;
        darn=lists.linux.dev
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1789936003; x=1790540803; darn=lists.linux.dev;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=M5Inp0dUK9mWGDzU51sPdtRsOeEciT1UFPFVj3DOFnI=;
        b=Y7L7FbuQgdUfpz5s2+5udwfKDlEmmnixHVI3J87hOR6oEzy4zTcOjDljqUeeF4rQmb
         0q2HjILe0iCYSVIJN0ZHzRz17pi6ZQgwFx8mdqQ9oJ0mM1XGJzQ8ETBddIet4BDt2Wik
         mkvvVKRTXyDGukpMUsmCeRprnINgZ1Nac5eHTzU8Rb2apbsIh4QEOf3aUjYB9E9G/U7b
         +2I2nudABRVKQqxZNSUB6lfLXUIyhYcfVAx/9xgjqF2jDs/w4yb5J9l8gv2ByEBGaP1U
         8uxN5b42gaXmZwC0TXPDXAkABDixJZb6WJVKnMoFW3M0Qn62BWpJGdDu9RXG12K5KnpC
         UoEA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1789936003; x=1790540803;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=M5Inp0dUK9mWGDzU51sPdtRsOeEciT1UFPFVj3DOFnI=;
        b=l9LOVSXg1+I3D66Yf59iDsrw+iDRY4/6vG08d9Yk+qp0b1TMMmTVXke0zh533bBXYg
         PxC7dZTSQq5b05iQPNlCxBsUhd++BwasMC/dEErB2CrG5ljk23AnI6cBVaSUcgVmv9ro
         GfGMg9Ekv604WAetH7D73mhXbfJXeEn3sjQ8ITSFNWQ35YsrW1ObD/3Ho0QX/F9ox60U
         owBJPGpBe2BO64fUDPWAGOEf48oJx/1RTFbYZmg6/Zo8XC3J/GkGzIKx/GpRLjpMgZA4
         8t91LK8tfhKDKiz6sO+mjg/m/puXEwn6x0hrmYl0XZh6YsfsbWi7Jrd3MEqK+t1JC4jb
         dEFw==
X-Gm-Message-State: AFuF++mt1gUwSsTIkmODsJw8sKUQFkbjcuGKlt0xPkMl58MY2EgOs8d2
	XMPTj2HdQfTtDfAcjxL8ri2k3lsiYoGGCGDXqSN8kuFXLjm3CZUl/0fLjBSyj3d0QR0/kFlrbG7
	TAgX7ZSgOykw1F6I8cdqftThF2r4vzQv/qAyN
X-Gm-Gg: AYBFou1rBaKqmM5e8MCWCcAjAWOvQIR9EQVv6EOOU4iGAlClxwjATCr8hPewJVZ5jNC
	ayo0L6kAPfh/u/3GnU2lkcZPZH/jXR7KV2wHuFik/yo0SD9ej4X9q++GQ4emlkkQNHnkwRwPsBt
	us4zl5Zg2ZV3CWvh0sHXVThlVcGgA46rbtXfWFLLUs4eIDLLkLz+6NTjYk6fgbhIjQzUxhNpJCm
	XRW6d1PKsjQhIhj4saODFg3oEJ3vhFQfUaff5zUbxgcCDFTTHC+KUmE60IuXYf2uMhoCyNoJQLM
	2Aw7PV9IkXI34T46Qp/ksJ0ozxHk4VCTTt8RvnS1w3XPHxfL+lKZNVocCut3ckjBH02SjEmTz5b
	VoMpn8iZwPQTd9XLHuRprHaRgK+m28joJn0JkrMJ1VP1A
X-Received: by 2002:a05:690e:4807:b0:671:4f24:2126 with SMTP id
 956f58d0204a3-6717fdb0489mr1682517d50.59.1789936002636; Sun, 20 Sep 2026
 13:26:42 -0700 (PDT)
Precedence: bulk
X-Mailing-List: sashiko-reviews@lists.linux.dev
List-Id: <sashiko-reviews.lists.linux.dev>
List-Subscribe: <mailto:sashiko-reviews+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:sashiko-reviews+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20260916-dd-cmap-part2-clean-v10-0-af4cf4767707@gmail.com>
 <20260916-dd-cmap-part2-clean-v10-23-af4cf4767707@gmail.com> <20260916162814.434551F000FF@smtp.kernel.org>
In-Reply-To: <20260916162814.434551F000FF@smtp.kernel.org>
From: jim.cromie@gmail.com
Date: Sun, 20 Sep 2026 14:26:16 -0600
X-Gm-Features: AcwNN1V9f_cj4KFvVBI7cRGxNTARDn_RhISbjMBAMFhOdAADIUHjfDsp-6ULVao
Message-ID: <CAJfuBxwqBqTWavDX2t1dNx7BkpwrRj67WGcRp4P9ktXig6t3SQ@mail.gmail.com>
Subject: Re: [PATCH v10 23/38] dyndbg-API: replace DECLARE_DYNDBG_CLASSMAP
To: sashiko-reviews@lists.linux.dev
Cc: dri-devel@lists.freedesktop.org, linux-modules@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Wed, Sep 16, 2026 at 10:28=E2=80=AFAM <sashiko-bot@kernel.org> wrote:
>
> Thank you for your contribution! Sashiko AI review found 2 potential issu=
e(s) to consider:
> - [High] dyndbg: init_bits relies on _DPRINTK_FLAGS_DEFAULT evaluated in =
wrong translation unit
> - [Medium] dyndbg: TOCTOU race in ddebug_sync_classbits() causes out-of-s=
ync debug state
> --
>
> commit 3b29729057e8a4b4e0401fd7f3a74205f701c129
> Author: Jim Cromie <jim.cromie@gmail.com>
>
> dyndbg-API: replace DECLARE_DYNDBG_CLASSMAP
>
> This commit replaces DECLARE_DYNDBG_CLASSMAP with an explicit client-serv=
er
> model using DYNAMIC_DEBUG_CLASSMAP_DEFINE and DYNAMIC_DEBUG_CLASSMAP_USE.
> At module load time, it resolves reference records and automatically appl=
ies
> the initial bitmap to the module.
>
> Cc: linux-doc@vger.kernel.org
>
> > diff --git a/lib/dynamic_debug.c b/lib/dynamic_debug.c
> > index 03dc35af4faa1..566c3860d7bfb 100644
> > --- a/lib/dynamic_debug.c
> > +++ b/lib/dynamic_debug.c
> [ ... ]
> > +static void ddebug_sync_classbits(const struct kernel_param *kp, const=
 char *modname)
> > +{
> > +     const struct ddebug_class_param *dcp =3D kp->arg;
> > +     u32 val, new_bits, init_bits;
> > +
> > +     if (!dcp || !dcp->map)
> > +             return;
> > +
> > +     init_bits =3D (_DPRINTK_FLAGS_DEFAULT & _DPRINTK_FLAGS_PRINT) ?
> > +             CLASSMAP_BITMASK(dcp->map->length) : 0;
>
> [Severity: High]
> Does this evaluate _DPRINTK_FLAGS_DEFAULT in the context of the dynamic
> debug library rather than the target module's translation unit? Since
> dynamic_debug.c is not compiled with -DDEBUG, init_bits will always be
> evaluated as 0 here. Could this prevent the system from properly disablin=
g
> callsites for modules that are loaded and compiled with -DDEBUG?
>

yes. this code is misleading and has been removed.

what needs to be said ( Im looking for the place to say it once) is:

DEBUG is a local override  (1 file, or even 1 func,line )
to a param, which cannot possibly express its full range of behaviors

when DEBUG is used, it is honored.
In this case, to truly turn off the enabled sites, toggle them on,
then off again.

something like that..


> > +
> > +     switch (dcp->map->map_type) {
> > +     case DD_CLASS_TYPE_DISJOINT_BITS:
> > +             val =3D READ_ONCE(*dcp->bits);
> > +             new_bits =3D val;
> > +             v2pr_info("  %s: classbits: 0x%x\n", KP_NAME(kp), new_bit=
s);
> > +             ddebug_apply_class_bitmap(dcp, &new_bits, init_bits, modn=
ame);
> > +             break;
> [ ... ]
> > @@ -1238,12 +1410,17 @@ static int ddebug_add_module(struct _ddebug_inf=
o *di)
> [ ... ]
> >       mutex_lock(&ddebug_lock);
> >       list_add_tail(&dt->link, &ddebug_tables);
> >       mutex_unlock(&ddebug_lock);
> >
> > -     vpr_info("%3u debug prints in module %s\n", di->descs.len, di->mo=
d_name);
> > +     if (dt->info.users.len)
> > +             ddebug_apply_class_users(&dt->info);
>
> [Severity: Medium]
> Could this introduce a time-of-check to time-of-use (TOCTOU) race conditi=
on
> between module loading and concurrent sysfs updates?
>
> Once ddebug_add_module() adds the module to ddebug_tables and drops the
> ddebug_lock, it proceeds to call ddebug_apply_class_users() (which then
> calls ddebug_sync_classbits()).
>

 In ddebug_add_module(), linking dt to the global ddebug_tables list
  and releasing ddebug_lock before calling ddebug_apply_class_maps() and
  ddebug_apply_class_users() is structurally required.

any changes to be made by apply-class-* only work cuz the module is on
the list scanned by ddebug-change() - which takes the lock, so we cannot.


Publishing dt on ddebug_tables is sufficient for both definers (maps)
  and users (users). The kernel module loader guarantees that definers
  load before users via ELF symbol dependencies on the exported classmap
  struct. Once linked, ddebug_find_valid_class() symmetrically resolves
  class_ids across di->maps and di->users, ddebug_apply_params()
  binds controlling_param and synchronizes initial bits, and the module
  is automatically included in all subsequent runtime sysfs writes and
  ">control" queries without requiring secondary registration.


> In ddebug_sync_classbits(), the parameter value is read via
> READ_ONCE(*dcp->bits) without holding the lock. If a concurrent sysfs wri=
te
> updates the parameter and applies it to all modules in ddebug_tables
> (including this newly added one), could the module load thread subsequent=
ly
> resume and apply the stale value it just read, leaving this module's debu=
g
> state out-of-sync with the global parameter?
>

since the effect of a param change is to call ddebug_change() which
takes the lock.
taking it around the param ingestion also sounds like a bad idea.

> --
> Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260916-dd-cmap-=
part2-clean-v10-0-af4cf4767707@gmail.com?part=3D23
