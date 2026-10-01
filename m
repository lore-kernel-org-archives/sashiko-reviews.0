Received: from mail-yx2-f39.google.com (mail-yx2-f39.google.com [74.125.224.167])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 51D414B828D
	for <sashiko-reviews@lists.linux.dev>; Thu,  1 Oct 2026 22:53:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=74.125.224.167
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790895235; cv=pass; b=RKbQPgOYVnn39seNMosE/hT9YS8IvKDuFYR6FBB4sSvqFBlMLZa5dE2Sd0rzis/eNuFlCC4mov0/ZP5OPXpp4a//4ok7P1r13jpZAGuJZEJU0p+JrFtwilDDPk6pPZPk22EklM6IRenq7sbloE8TRthHUa1p+IH9/S/Xpp87eiQ=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790895235; c=relaxed/simple;
	bh=9WU6gk8eX4Rgb9wpGURVmjH7c1vwFJ+Sl5X4ljE9SyY=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=dhWugNnPyGUGyH0eMau2ifN+ydV8upzcCrhlZU3VKog7r5b841lADA/FWSVuNOlHPkcCklRXQT7qKX+TfBkFehxRMJ0ZPcvugekKpt4MUlt+K4LHCraYKuqqKolDgOQc+b07CFthnsxCLpX72oun/LYtxunjCQuaRB4K/6yJRXw=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=GpE8S1bB; arc=pass smtp.client-ip=74.125.224.167
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="GpE8S1bB"
Received: by mail-yx2-f39.google.com with SMTP id 956f58d0204a3-67559a09ec2so3773467d50.0
        for <sashiko-reviews@lists.linux.dev>; Thu, 01 Oct 2026 15:53:52 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1790895232; cv=none;
        d=google.com; s=arc-20260327;
        b=A89XldQ4fAAlML5nDsD4dcNk8NoqlQ1ttQKB7xiD5iISwynTTFK97+a+o4spJuepPK
         LsGzy8G48v3a9q1dNV+D1OKp8NugnIr+ONjRBFNYiV9+iyMzdW3nJRJLG90A5Afz0Tu+
         AgegjzU67/UVDH4cSbrhiD21cH5xtbG7rFQMrUjngaionI7eoBm4O+GcwZ1fmvcw+fu2
         c52rowDFiUSfn/zW9BxN1ONXIbB0k0n6JDL+M/wnaFSaUNRr8EtI8dK3JEyHG3YUy4rX
         OBosjA2JXdQq6V0JfxcdtKhDb/1k06BooeFiPLJW2NJII3wXwUbdy292MDqdoNZ7n3YX
         qdQA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=TBYFdlPzVVihY84Cq15ZaQjohkF0LhdMTg9utDLtVGs=;
        fh=kAGRFKDN7aRGd6VO33HQbsOy3CoTfL4nr4GTMsDqfhg=;
        b=QxJjQRGtJul1ZqVwZtTnzyrwbi5HjPOuCRF4pB1M7a8WxhCIYvYNuOo9O8f2qrwZ71
         ebuAjK04M+c1blzEpRbsM/vNd/qdd+gf7O8V5oIIzXqXZXfzBqteIl7xkgBZV9Tz6LVy
         9cai5L5TCPdm5CN6VTQYNMZ9att1Okitt+iPZAe4HgA0Gjx1hI4ZBU5MwWJlczyx2Mm7
         u/o/q9/RZ3tS1P/ceJxHRHqqBA4Jg0K3nlGy+uOGk00ZfGlFjrX/crAeB52deNoEOX1k
         sxyKmctDBhe6gb9JJ2JQwUeJEybkleYrIsSvJnbLd7nMYmvfDvG7gh/57dClhaTiaanw
         KT9A==;
        darn=lists.linux.dev
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1790895232; x=1791500032; darn=lists.linux.dev;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=TBYFdlPzVVihY84Cq15ZaQjohkF0LhdMTg9utDLtVGs=;
        b=GpE8S1bB62ZiKoGHyylYQpp8GtshM+VWbUh1PZLX5nDsLfavHhV/iJNWnklqzN4w7j
         QTqSiCzf1kJpGVblUu58AbARS6YchQ5of9HzNaJ4eBg1TJ9BoNPN0YHdIc9M4SGQPGWi
         Twh1KvfOjgvTTNWVq9z7I84fsR3+u+HPT7u/wd+RbWv1Faenx1pslL51D+LZGg/9pvdv
         WZFwGOUIZHhvqEaCsMoqKEiusa5aVpRi08qrIHVtRDsnl1BeThWCp/ct9ljVTijRlx1I
         Pdz31Ss0JtDMbGuWaezDXkIacvqzDuJKw0o+7u5AArOelVu2EN3K1uJDa1QbJyYIZ8uf
         3P/g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790895232; x=1791500032;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=TBYFdlPzVVihY84Cq15ZaQjohkF0LhdMTg9utDLtVGs=;
        b=ha56EcQkwzS2DtZMjnp392JGKWZ+o3OffyF1iPv5FldXwF/IyFl/B6fiYIWX7f7NR0
         WJe40jMmWxaGop+cX8N3f8wUE5ncYv162gTWWald7nhi/rvCuzDC4alXVruEHxt44Sxr
         R9enrZutT9rnMFjBg9BKbj+9YrApr9QEz3+01+IEfXwU1oaZk/QnpOxSDwdFWc8lL1TS
         v1sx83iNLBd64TiA4JtoHFMrgLBFU0/ADYZYzulQcFISv1szKF1+dNnMfREMOGaCOwAu
         eMdVKWKGqzXPK5IUuEIKvuogoYOvQnpitLAJ4XkG0KN8FvXWnWIZ04gLN3J72e1CrjnS
         Jn4A==
X-Gm-Message-State: AFq9FYLjCiJrF3DRugyoyCSE0POdCwK8d1zewR9W0freGNhUST7ouklQ
	/5SiQ6feIFxvWt2hvXHK8KZwavZEaPAzAG14wf36SuAFa2vRO5c8Sl5gRPxYirklfkcoC6N8u0Y
	DRmpDfznRXN/u28MN6qSGceHZZu85JirSXIeN
X-Gm-Gg: AYBFou1KlaVse8G5c9zegVeB4tC/zi24aSR8fTE1iEIOf3rn/PrM0ikaNg2EhIqxJj1
	Drhob8RV58XJjw2KT6uhiEPZRekwnrKDX51O626wt3+TXKRennlnjgC+yKSqqVL2QQ1U+ecaL2/
	y/cRr0WMi8qYBBbBQwL57jyQahEDGTSgWQAbGWEtanhzNbhmqZ7/l/xP64CrG1lEOPkITxE973n
	1KPs7c9eCbV7Ss6dfND4+yAKZT3ksVC+MI3JXLTvw/y6LsA1pUwwEXxguoy/ewYNxbUkk2bJ3LT
	rwMYJAJ5GAQSvODNCQD28QR8i5EewRw2ekTkgnqraDjTIxRfo2LNNGLu6AeRFuDPAVo5J77/5te
	4wpAEIDKGFSYZAMixLS2KFv1Ux7ZRyD0jostJYgcb1+hk
X-Received: by 2002:a05:690e:1c08:b0:676:87c6:4f71 with SMTP id
 956f58d0204a3-677ac165db5mr389082d50.99.1790895231491; Thu, 01 Oct 2026
 15:53:51 -0700 (PDT)
Precedence: bulk
X-Mailing-List: sashiko-reviews@lists.linux.dev
List-Id: <sashiko-reviews.lists.linux.dev>
List-Subscribe: <mailto:sashiko-reviews+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:sashiko-reviews+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20260923-dd-cmap-part2-clean-v11-0-9b6c217fdf2f@gmail.com>
 <20260923-dd-cmap-part2-clean-v11-23-9b6c217fdf2f@gmail.com> <20260923224940.ABEB51F00893@smtp.kernel.org>
In-Reply-To: <20260923224940.ABEB51F00893@smtp.kernel.org>
From: jim.cromie@gmail.com
Date: Thu, 1 Oct 2026 16:53:25 -0600
X-Gm-Features: AclHuK89upHDiixXSE95YCeG6kGs9RvurvEycW_YR863IjXCz2W8iVCgqdQxxeI
Message-ID: <CAJfuBxzPMjqAsnqGqEESjZCfz=nmFGiOj6vFZby0kpAdFnNEFg@mail.gmail.com>
Subject: Re: [PATCH v11 23/38] dyndbg-API: replace DECLARE_DYNDBG_CLASSMAP
To: sashiko-reviews@lists.linux.dev
Cc: dri-devel@lists.freedesktop.org, linux-modules@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Wed, Sep 23, 2026 at 4:49=E2=80=AFPM <sashiko-bot@kernel.org> wrote:
>
> Thank you for your contribution! Sashiko AI review found 2 potential issu=
e(s) to consider:
> - [Medium] dyndbg: TOCTOU race in ddebug_sync_classbits allows stale modu=
le settings
> - [Low] dyndbg: incompatible pointer type in module section load
> --
>
> commit 0e12bed35baa8c038def6b06ffc95416176ee997
> Author: Jim Cromie <jim.cromie@gmail.com>
>
> dyndbg-API: replace DECLARE_DYNDBG_CLASSMAP
>
> This commit replaces DECLARE_DYNDBG_CLASSMAP with an explicit client-serv=
er
> model using DEFINE and USE macros. It resolves boot-time parameter
> propagation failures by establishing a robust reference linkage. At modul=
e
> load time, dyndbg now scans and resolves parent classmap references.
>
> > diff --git a/kernel/module/main.c b/kernel/module/main.c
> > --- a/kernel/module/main.c
> > +++ b/kernel/module/main.c
> [ ... ]
> > @@ -2791,6 +2791,9 @@ static int find_module_sections(struct module *mo=
d, struct load_info *info)
> >       mod->dyndbg_info.maps.start =3D section_objs(info, "__dyndbg_clas=
s_maps",
> >                                                  sizeof(*mod->dyndbg_in=
fo.maps.start),
> >                                                  &mod->dyndbg_info.maps=
.len);
> > +     mod->dyndbg_info.users.start =3D section_objs(info, "__dyndbg_cla=
ss_users",
> > +                                                sizeof(*mod->dyndbg_in=
fo.users.start),
> > +                                                &mod->dyndbg_info.user=
s.len);
>
> [Severity: Low]
> The len field in struct _ddebug_class_users is declared as a signed int, =
but
> section_objs() expects an unsigned int pointer for its num parameter. Cou=
ld
> passing &mod->dyndbg_info.users.len here trigger an incompatible pointer
> type compiler warning and result in a build error under standard
> configurations?
>

fixed for v12




> [ ... ]
> > diff --git a/lib/dynamic_debug.c b/lib/dynamic_debug.c
> > --- a/lib/dynamic_debug.c
> > +++ b/lib/dynamic_debug.c
> [ ... ]
> > +static void ddebug_sync_classbits(const struct kernel_param *kp, const=
 char *modname)
> > +{
> > +     const struct ddebug_class_param *dcp =3D kp->arg;
> > +     u32 val, new_bits;
> > +
> > +     if (!dcp || !dcp->map)
> > +             return;
> > +
> > +     switch (dcp->map->map_type) {
> > +     case DD_CLASS_TYPE_DISJOINT_BITS:
> > +             val =3D READ_ONCE(*dcp->bits);
> > +             new_bits =3D val;
> > +             v2pr_info("  %s: classbits: 0x%x\n", KP_NAME(kp), new_bit=
s);
> > +             ddebug_apply_class_bitmap(dcp, &new_bits, 0, modname);
>
> [Severity: Medium]
> Because dcp->bits is read locklessly via READ_ONCE() before
> ddebug_apply_class_bitmap() takes ddebug_lock, is there a race condition
> here?
>
> If a user concurrently writes to the corresponding sysfs parameter, the s=
ysfs
> thread will update existing modules under the lock, release it, and then
> update the parameter value.
>
> If a concurrent module load thread executing ddebug_sync_classbits() read=
s
> the old parameter value right before the sysfs thread writes the new valu=
e,
> and then acquires the lock to apply the settings:
>
> sysfs thread:
> param_set_dyndbg_module_classes()
>     mutex_lock(&ddebug_lock);
>     // updates existing modules
>     mutex_unlock(&ddebug_lock);
>
> Module load thread in ddebug_sync_classbits():
>     val =3D READ_ONCE(*dcp->bits); // reads old stale value
>
> sysfs thread:
>     *dcp->bits =3D new_value;
>
> Module load thread in ddebug_sync_classbits():
>     ddebug_apply_class_bitmap(...)
>         mutex_lock(&ddebug_lock);
>         // applies stale value
>
> Would the newly loading module miss the concurrent sysfs update and
> initialize with stale debug class settings?
>

Holding ddebug_lock during the READ_ONCE() in ddebug_sync_classbits()
would deadlock against ddebug_change(), which acquires ddebug_lock to
iterate ddebug_tables and toggle descriptor flags.

ddebug_add_module() publishes dt to ddebug_tables under ddebug_lock
before calling ddebug_sync_classbits(). Because ddebug_change()
acquires ddebug_lock while walking ddebug_tables, any concurrent sysfs
write either completes before publication (so ddebug_sync_classbits()
reads the new value) or executes after publication (so ddebug_change()
finds and updates the new module directly).



> --
> Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260923-dd-cmap-=
part2-clean-v11-0-9b6c217fdf2f@gmail.com?part=3D23
