Received: from mail-yx2-f40.google.com (mail-yx2-f40.google.com [74.125.224.168])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8229C2BD022
	for <sashiko-reviews@lists.linux.dev>; Thu,  1 Oct 2026 21:48:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=74.125.224.168
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790891331; cv=pass; b=VDP+/+qaIgdR4ckcu2uaJ7fY4j0G/GjZCdCjIGViQ+XvwvTWjL8H+GnSozQzTAbQmieyav2DACLkgRyAVQHA6m0MZdujM5bi3MmJ3bJWbtj7mr8ACp9C7LHPnacY178YyGPaxDiR0MsD4jTFr0SxuRixlzfK/msUGRxbdk2g1Y4=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790891331; c=relaxed/simple;
	bh=k6v4N3fQcBAwgPIa+eEVArEBhH9E4XZ3TbkGxaeXGuw=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=ei9U/4q+2ZBnnmG5pPBa9/JptL9BFKg+oqImPxOS8EJ6L3HoJI89b/89ydUvwJuAfeN4veEZ2+n3M3bFeCP2Dk9PFR6i2iH4ndVyECLad1xi5lVtr8iNLNvbChoc3+vpUDNvFN2EwPVstFed7cPsI/5eQPbLPNyu8HxuWWzjoM8=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=ItnVDOU0; arc=pass smtp.client-ip=74.125.224.168
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="ItnVDOU0"
Received: by mail-yx2-f40.google.com with SMTP id 956f58d0204a3-67568357b63so3211577d50.1
        for <sashiko-reviews@lists.linux.dev>; Thu, 01 Oct 2026 14:48:49 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1790891328; cv=none;
        d=google.com; s=arc-20260327;
        b=RAfHnaEJ8v7ywwQMohIR79jrvhvqIetfssLg03G6deZF4wTLWpZ7swD54I1s57Srrp
         PY6rhHTvcHhvJTqZqE955rE2AULoc5tmoZT4uZhcV84VrlPoQ5j2cZnhH3Xzb3W1BeaL
         3vOq9vwI3u35XIPmxNgDffGBX5J8+5bkqPWxUKiqLWUdgUCnv4Edb55y0Tk80lQDce7/
         8gGSYqhe3YfptMQFH6rDu2qDWmKZuc+4+R0X641FFEY+b1xDzGZsj8SN6N+J4Xle95sF
         T5oTj1OgxHLx6i7XSuea2J3aMKuZWgmDFLdjTcZcsN6kXP+Ktg5Xq9Q6QyvF4UyVoowf
         FOGg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=FxEBbkBDr98zgUdqxxzSaXIdqAeCMXlZGMeNUHK5+N8=;
        fh=kAGRFKDN7aRGd6VO33HQbsOy3CoTfL4nr4GTMsDqfhg=;
        b=Gx5q7APrEY9Jx55rffgMlIYKMeuZ9uMca0fjtI/8IwkiI6l70VQDzn5ItDkiXGuQOz
         vPaJgE91xTK3bNBoa0+11zjh/zo9LIfcWdThqcMmDOcavf4QZ4hZuLDyZ4CPe2x6KHj1
         kdG7CMJ+/HScDPuWY/XYkmXn6tRjK8Gatet9vAEfRqU0du0NMK+vkeJQhRqxA/AiOyDg
         rTqD+tiMSiCdgdV36YRzNjPSUmXr7gmHp2DIZfK+CZHXy9isTmgxUOVakpFbuaXmXakX
         m6vJHAnMYdS4FQo4c9Sil8pzmcjXHPSjWiQSEZA0mAbLd0/2GgBm7uZwNckg033I5swS
         CQEg==;
        darn=lists.linux.dev
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1790891328; x=1791496128; darn=lists.linux.dev;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=FxEBbkBDr98zgUdqxxzSaXIdqAeCMXlZGMeNUHK5+N8=;
        b=ItnVDOU0AkukInd58WaegJx+VeE0uuMctCG5GNHANEGGodSDh/w08Tze2lUYLNkH4a
         Tsyh0BnnqXw+jjDBFI149BgN139QVLT+pALbazXJRrcCjzmMMVTEs0hzrrc76CPSl+rr
         e6hwcWeYI6Xtfmm2hNCAOOjMmcZ8LLRLt5zb2JEnVHCAwiNYiUP3Bny+VeCowszF+1SB
         3XZB5bGapijPRDlrJ6lsrIo763Hjd+cGwgPT4GL05t8Z2cLpiqHV+BBlkrYkHwuV/D7C
         iWX/uOL6fqvKTSO3z87wto95Krm0QDNvQbaGUE6OXH+7LeIBfVq9tzEW6wZMVz0WD1IM
         LIGA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790891328; x=1791496128;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=FxEBbkBDr98zgUdqxxzSaXIdqAeCMXlZGMeNUHK5+N8=;
        b=zigMDHxapvS4ExUcta1FbGzVedb7ylrTu5mbT7Y1k7ahuHEGCHztqBdhctoTNo7OlV
         39VTdFDNetoC0WgFJiVaR68iN1oDt/JrNhA+dlL2noHIxjUUUPUhEwuJum3hIzJEyvKo
         wkfVGuoDvH68q8Mwrc81Rzrtt40gMlXVb1CPEc00DTqYGeqGC3Gs1wC1vmzVfNfTUKRh
         ziJUqb/Meln3jD6Y6mtxkBO4yBsT3upwjxvNiRCTlGKz8F/l/D9WLaXHuVpyrRDUS8i0
         D3jQIYcYB6yQAfC1ddm0AZzgpBSLuOJw1OJXcsqJLSUmpqZp0iwp1NuNyu5RBRgYwv4m
         lAwQ==
X-Gm-Message-State: AFq9FYK6NXon8yBbcLaLCbQ5MNU06wtnmxvnxBljx0BCD2yBELUiDLqy
	rzvQK+/mlghhJnW9STZCeaiBffQVu+q38FdnTV4fiTsUhWZakhqSds3hnDZAsbS1PJr20YqDp8N
	R6K3z/FaZI3u885lxmfwCXraaMAWUkuCuYw==
X-Gm-Gg: AYBFou2GYRXjXnuIhiTImxYQ5USl05Q26plNolDSKGADaUaqVsU9bTuP9zvqb8gHAg9
	rvc53Pk4P4Gw7WghBj+LXvxxYu9nQ5VHBwYEc9x3p4cf3yKj7H58eHpiX88v1V3KzotpYj7t0B7
	+tuEfjdHswylwd3Q22Gdt/RV417uL6aQXAFVBwOpTFAGhJDZqTEUitXl0omKBOZuA7YGjuHvFEB
	+2BoCyHB2QXtEYKhTv1sVf3NqzuouRbS5m7cLzmZVwfMf+9ZJ5brMaCP7JgqdLcv/7vy+zobj5p
	TuhUWNMf9m0JJf3vAP3ii2s+5OkorU5IBrgwTHivxPFOhDcZBcYPROZ5wkoTXK12Fld6yt8gQyt
	Ded3V26DNpCkx3mg67871nHpxPy/6mlaJag==
X-Received: by 2002:a05:690e:168e:b0:673:1df3:86b2 with SMTP id
 956f58d0204a3-677ac0a5637mr405865d50.66.1790891328358; Thu, 01 Oct 2026
 14:48:48 -0700 (PDT)
Precedence: bulk
X-Mailing-List: sashiko-reviews@lists.linux.dev
List-Id: <sashiko-reviews.lists.linux.dev>
List-Subscribe: <mailto:sashiko-reviews+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:sashiko-reviews+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20260923-dd-cmap-part2-clean-v11-0-9b6c217fdf2f@gmail.com>
 <20260923-dd-cmap-part2-clean-v11-32-9b6c217fdf2f@gmail.com> <20260923225318.68FA81F000FF@smtp.kernel.org>
In-Reply-To: <20260923225318.68FA81F000FF@smtp.kernel.org>
From: jim.cromie@gmail.com
Date: Thu, 1 Oct 2026 15:48:21 -0600
X-Gm-Features: AclHuK89WETVF5kBKceq7LGgHNh99DFnvQVhaT61KjOm5bX44GqQ2b5VPPdB404
Message-ID: <CAJfuBxw6=rmCZ-YXyDjxUVZCKpXf+5oLUgGqDnmeXu=PfrLJ4Q@mail.gmail.com>
Subject: Re: [PATCH v11 32/38] dyndbg: resolve "protection" of class'd pr_debug
To: sashiko-reviews@lists.linux.dev
Cc: dri-devel@lists.freedesktop.org, linux-modules@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Wed, Sep 23, 2026 at 4:53=E2=80=AFPM <sashiko-bot@kernel.org> wrote:
>
> Thank you for your contribution! Sashiko AI review found 1 potential issu=
e(s) to consider:
> - [Medium] dyndbg: race during module load bypasses ABI protection perman=
ently
> --
>
> commit c8a052c030fff7b63aa2d9e4c2dc3aa455948704
> Author: Jim Cromie <jim.cromie@gmail.com>
>
> dyndbg: resolve "protection" of class'd pr_debug
>
> This patch implements an ABI protection mechanism for dynamically debugge=
d
> classes by binding a controlling sysfs parameter to classmaps. If a modul=
e
> parameter is configured, it protects class'd callsites from being
> accidentally modified by un-classed wildcard queries.
>
> > diff --git a/lib/dynamic_debug.c b/lib/dynamic_debug.c
> > index 636a88994a774..d300d44c1a82e 100644
> > --- a/lib/dynamic_debug.c
> > +++ b/lib/dynamic_debug.c
>
> [ ... ]
>
> > @@ -252,7 +294,28 @@ static bool ddebug_match_desc(const struct ddebug_=
query *query,
> >           dp->lineno > query->last_lineno)
> >               return false;
> >
> > -     return true;
> > +     /*
> > +      * above are all satisfied, so we can make final decisions:
> > +      * 1- class FOO or implied class __DEFAULT__
> > +      * 2- site.is_classed or not
> > +      */
> > +     if (query->class_string) {
> > +             /* class FOO given, exact match required */
> > +             return (dp->class_id =3D=3D selected_class);
> > +     }
> > +     /* query class __DEFAULT__ by omission. */
> > +     if (dp->class_id =3D=3D _DPRINTK_CLASS_DFLT) {
> > +             /* un-classed site */
> > +             return true;
> > +     }
> > +     /* site is class'd */
> > +     site_map =3D ddebug_find_map_by_class_id(di, dp->class_id);
> > +     if (!site_map) {
> > +             WARN_ONCE(1, "unknown class_id %d, check %s's CLASSMAP de=
finitions", dp->class_id, di->mod_name);
> > +             return false;
> > +     }
> > +     /* module(-param) decides protection */
> > +     return !ddebug_class_wants_protection(site_map);
> >  }
>
> [Severity: Medium]
> Does this code expose a race condition when a module is loading?
>
> Looking at ddebug_add_module(), the module is added to ddebug_tables and =
the
> ddebug_lock is dropped before map->controlling_param is initialized:
>
> lib/dynamic_debug.c:ddebug_add_module() {
>         ...
>         mutex_lock(&ddebug_lock);
>         list_add_tail(&dt->link, &ddebug_tables);
>         mutex_unlock(&ddebug_lock);
>
>         if (dt->info.maps.len)
>                 ddebug_apply_class_maps(&dt->info);
>         ...
> }
>
> If a concurrent wildcard query (like echo -p > /proc/dynamic_debug/contro=
l)
> is processed while the lock is dropped but before ddebug_apply_class_maps=
()
> finishes binding the parameter, site_map->controlling_param will be NULL.
>
> This causes ddebug_class_wants_protection() to return false, bypassing th=
e
> protection and erroneously enabling the callsites.
>

yes, theres a narrow window where a module w classd pr-debugs
is changeable with "+p" flags, before the controlling-param is set up.

Once the protection is in place, "-p" will not be able to undo the "+p".
Only toggling the param itself will undo those "+p"s

v12 addresses this by setting the controlling-param before the module
is added to the ddebug-tables list, and not in the class-map-attach




> [ ... ]
>
> > @@ -772,11 +833,14 @@ static int param_set_dyndbg_module_classes(const =
char *instr,
> >                                          const struct kernel_param *kp,
> >                                          const char *mod_name)
> >  {
> > -     const struct ddebug_class_param *dcp =3D kp->arg;
> > -     const struct ddebug_class_map *map =3D dcp->map;
> > +     struct ddebug_class_param *dcp =3D kp->arg;
> > +     struct ddebug_class_map *map =3D dcp->map;
> >       u32 inrep, new_bits, old_bits, old_val;
> >       int rc, totct =3D 0;
> >
> > +     if (map && !map->controlling_param)
> > +             map->controlling_param =3D dcp;
>
> [Severity: Medium]
> Is it safe to assign map->controlling_param here without holding
> ddebug_lock or using WRITE_ONCE()?
>
> Since this shared state is accessed by concurrent queries, could this
> cause a data race?
>
> [ ... ]
>
> > @@ -1332,25 +1395,40 @@ static void ddebug_sync_classbits(const struct =
kernel_param *kp, const char *mod
> >       }
> >  }
> >
> > -static void ddebug_match_apply_kparam(const struct kernel_param *kp,
> > -                                   const struct ddebug_class_map *map,
> > -                                   const char *mod_name)
> > +static struct ddebug_class_param *
> > +ddebug_get_classmap_kparam(const struct kernel_param *kp,
> > +                        const struct ddebug_class_map *map)
> > +{
> > +     struct ddebug_class_param *dcp;
> > +
> > +     if (kp->ops !=3D &param_ops_dyndbg_classes)
> > +             return NULL;
> > +
> > +     dcp =3D (struct ddebug_class_param *)kp->arg;
> > +     return (map =3D=3D dcp->map)
> > +             ? dcp : (struct ddebug_class_param *)NULL;
> > +}
> > +
> > +static void ddebug_match_apply_kparam(const struct kernel_param *kp,
> > +                                   struct ddebug_class_map *map,
> > +                                   const char *mod_name)
> >  {
> > +     struct ddebug_class_param *dcp =3D ddebug_get_classmap_kparam(kp,=
 map);
> >
> >       if (dcp && dcp->map =3D=3D map) {
> > +             /*
> > +              * Bind controlling_param to activate ABI protection in
> > +              * ddebug_match_desc(), shielding callsites from non-clas=
s
> > +              * wildcard (>control) queries.
> > +              */
> > +             map->controlling_param =3D dcp;
> >               v2pr_info(" kp:%s.%s =3D0x%x", mod_name, kp->name, *dcp->=
bits);
> >               vpr_cm_info(map, " %s maps ", mod_name);
> >               ddebug_sync_classbits(kp, mod_name);
> >       }
> >  }
>
> [Severity: Medium]
> Can the delayed assignment of map->controlling_param combined with
> ddebug_sync_classbits() result in permanent desynchronization?
>
> During the race window in ddebug_add_module() mentioned above, callsites
> can be erroneously enabled by a concurrent query. Once the module loading
> thread resumes, it binds map->controlling_param here and calls
> ddebug_sync_classbits().
>
> However, ddebug_sync_classbits() passes 0 for old_bits:
>
> lib/dynamic_debug.c:ddebug_sync_classbits() {
>         ...
>         case DD_CLASS_TYPE_DISJOINT_BITS:
>                 val =3D READ_ONCE(*dcp->bits);
>                 new_bits =3D val;
>                 v2pr_info("  %s: classbits: 0x%x\n", KP_NAME(kp), new_bit=
s);
>                 ddebug_apply_class_bitmap(dcp, &new_bits, 0, modname);
>         ...
> }
>
> Because old_bits is 0, the function skips resetting any class bits that a=
re
> supposed to be off (since it sees new_bits (0) =3D=3D old_bits (0)). Does=
n't this
> prevent the synchronizer from noticing and clearing the erroneously enabl=
ed
> callsites?
>
> --
> Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260923-dd-cmap-=
part2-clean-v11-0-9b6c217fdf2f@gmail.com?part=3D32
