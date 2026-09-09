Received: from mail-yx2-f12.google.com (mail-yx2-f12.google.com [74.125.224.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3D7EA3C1D7A
	for <sashiko-reviews@lists.linux.dev>; Wed,  9 Sep 2026 20:56:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=74.125.224.140
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788987397; cv=pass; b=pMxbl+dkLfA8+lFdA9PXEYAGaBwtfP+09vr5RRbK99yjNmJBfwtTtUu7MUq1z2kjQaYzr9Ue2GCM+po8Kv8xsOqtePlnK5SAZNrZiVFnjUisOYfCIPO8KnD6zjO3HSpZItKxkIB1aZE9YTPDYHRoeq7J0rrD0IfjRfMpOkCLags=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788987397; c=relaxed/simple;
	bh=mSXDf5L3akGYZpZ85/ToGKuGbVhQAqImwbuSO42wJoU=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=RxUXJPEnfdBU5OONYdeGSe48M+BCPuRyABVryJQ+9jwtzrUXkXgg71uxEMxAO1dnVcCoyBEouJMQnTmXYLfLHnomDgge0sqUbo4f/7TL/22JuPoDnnV2EYlvtbhKq1vAPIvA4qyahgc4jqW9jEQX77IV0xZBJZDKBH3af9IDZq0=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=bw9Wg3Cq; arc=pass smtp.client-ip=74.125.224.140
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="bw9Wg3Cq"
Received: by mail-yx2-f12.google.com with SMTP id 956f58d0204a3-66e4ab201ebso905415d50.3
        for <sashiko-reviews@lists.linux.dev>; Wed, 09 Sep 2026 13:56:32 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1788987391; cv=none;
        d=google.com; s=arc-20260327;
        b=Th/syplqstr+mK1UNx7Mc5XnPbY8l9cEPLeQG6oRTyOoJU3zjT7elASilqJGLUdbQF
         ecUkHTAPKQ/SM+2Q14yp+VZWalUfOsUDu1QxZ/jC+jQ7iO7EYGow3QwGUQF9ERLWxFYR
         ay3dxv+5P1HuyXzC0WjqM96zjsVxkmVrtUpGjFmA8tRnkFlVejhA3CprLc3lwAEaRiCF
         13jlOywygVlOrxUEkxH9A8t+bNxyRhnfL/U4SyKP66/Ntur760767CzxFp+Ab70uoGHP
         A6tcosxaOKvw2FeKNP3DAwOvyG/MpxuD5xnOp4tAwDTFKFolj1mI5yvnKfsre8575p6Y
         QoOA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=aHx4F49Zpu+pEmstw6hBfMqlyRg9LrY6GEInd1anRvI=;
        fh=kAGRFKDN7aRGd6VO33HQbsOy3CoTfL4nr4GTMsDqfhg=;
        b=bmpFXLFk7RhudMe74Ipnv/iAPa8R0iBwEfdq1WPas0lb6jmakL8vC2Q1jXNrrQElU2
         75OUsoYyKiIR25wqAYR7sE+TLusb7zRBzVyxO8FWY7xPfHqpO4hDB6YqrxrOcWTFElvf
         HJnsLWa08x3RTMBltTWMXxvxjzOcOIuqdFYJ1IfSskMJz3Sh9q9nHMD/tBxpM6eMGqEe
         KADqOdpfgeB2Gwn4T11CIzMKN8Pb0peqYQH4HE0QlGh7owR8SODafSLOvmj9LRBrfN69
         Z2txi32OdpclBi7Un/Da5DLfInCKi+01ygqWciY54V1WXpD7HOUVhsHC7/GaPWVU/qMR
         98nQ==;
        darn=lists.linux.dev
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1788987391; x=1789592191; darn=lists.linux.dev;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=aHx4F49Zpu+pEmstw6hBfMqlyRg9LrY6GEInd1anRvI=;
        b=bw9Wg3CqnwKeA+RMmcdaYnbo/DLaoyssbyxtR59TSirRXU3HAT4GHknRJBf/Xipm35
         32wNjZp/yp2uGS5temnTmTYAV3RTacvASfsf2VvxEvdXXroG7Ts1vWSvNC/aXzqC+9DH
         xFCNHbmKyCz2pmqvqje4L8Dxe2cM/kD9l+E4Fh/PRPrTAJf99wNKluUMjn/OSW6qenss
         htUZkV75Dd9wHIuz1i2MIN0bYAuxIye34jrMvg2BG0PySZoHNMhCKTOrH8/raVTmLccp
         4KGJXkg2zR4WmoNmz78iPtHRp2pbm2qCkm/q6H0eVRlGF0jLnKHEgcREB0WfpQa/wMRW
         HAHA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788987391; x=1789592191;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=aHx4F49Zpu+pEmstw6hBfMqlyRg9LrY6GEInd1anRvI=;
        b=rnJAUGnSm6MBC2G/MZWH4atFtVlyRlvJX6tPgzDtiSE01yAUOjGiISqoocfY+VSFus
         0gQkWrioK/2y0fnSiJPaICe+tuOM1Tg4iEuJ65NLz/Z2OScRg4dSTMzvllPTdWaCLF2y
         l1NQrN8y9SaWGp8pQ7Mx+nUmB22jbR+njH7ZAFVwqRAVxPI9uEzHcBXqz3EwSraxiCEv
         QmYMiSjcsGXKvjnHFTr/n1aIOzWY5Nled7qmou9Sit/KmgHcGqwswZgtGEqR2IsS4XAa
         Y7tWt3F1mopqJSdGkwOurwaXXtJjwLhvg1u2MO40GnSIGytxqZ5Y36sjZsyvX2eM4XRS
         rZYA==
X-Gm-Message-State: AFuF++nqm9PpYhto3yNUBeU3LPfbdBn+lxwYkxj8yYo9FySrM3AxAw+J
	iXHzst9NYtrn923ZbDJ0Rsay3+/I9q8PwtjofCxQIYrdtSBsiKtaqBi4IYdQVeaVSb6V6Y1cmoH
	tthYUZbwvCFhm9Qi4KA4vdVCm9UfTg3S3htXRqNs=
X-Gm-Gg: AYBFou3Tck1SkfFBaQeXRgb45OIX3Pg5wl7+1aMRADmN6v1J3nXSMl+mSLytPc6ZEua
	PFEQqu+azxB6rPsgGoDqC0vpGhZcioxfXrCX1mjUdWRXU5N4IHV6++WODApKqF0j0Nvz0nh51Pu
	4nj6D3Tp5Jhj0KEp1o7exC0COtExsoxX4grmmkfEIkCY49Ob9DHXM4WwTUKRMa7729jcSgbtDJO
	hFP6NqoNtU/shqauKYWDxAtt4DwXAENFaAJJZKyroJbThaKq4hvZuEcNzYcCdbY6bIjsMoQM9vk
	7eNjq/e/xnjJ8SeiSs/og2QFXaIcab2kWEf81ZD13x45dt4SyHMzz74ZYl/diY2FCvA3X/eZ7tf
	aGZSwr95KWcmA2Jtz6LZkTU2/RzrqDk5jsg==
X-Received: by 2002:a05:690e:43cf:b0:66f:c67f:1a6a with SMTP id
 956f58d0204a3-6710ff14f4fmr1492851d50.44.1788987388660; Wed, 09 Sep 2026
 13:56:28 -0700 (PDT)
Precedence: bulk
X-Mailing-List: sashiko-reviews@lists.linux.dev
List-Id: <sashiko-reviews.lists.linux.dev>
List-Subscribe: <mailto:sashiko-reviews+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:sashiko-reviews+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20260908-dd-cmap-part2-clean-v9-0-3a3f621f4a10@gmail.com>
 <20260908-dd-cmap-part2-clean-v9-24-3a3f621f4a10@gmail.com> <20260909011309.543B91F00A3A@smtp.kernel.org>
In-Reply-To: <20260909011309.543B91F00A3A@smtp.kernel.org>
From: jim.cromie@gmail.com
Date: Wed, 9 Sep 2026 14:56:00 -0600
X-Gm-Features: AcwNN1V549rxj8x0UclZdPYhK2I8FxFFFwB6mo2fxWYjnCTaNEuPXTVR7O_ixeA
Message-ID: <CAJfuBxy9gvQ3kBRy=9_ik6oUaBdczoC76XwHR71zc4Lxkp-wSw@mail.gmail.com>
Subject: Re: [PATCH v9 24/39] dyndbg-API: replace DECLARE_DYNDBG_CLASSMAP
To: sashiko-reviews@lists.linux.dev
Cc: dri-devel@lists.freedesktop.org, linux-modules@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Tue, Sep 8, 2026 at 7:13=E2=80=AFPM <sashiko-bot@kernel.org> wrote:
>
> Thank you for your contribution! Sashiko AI review found 3 potential issu=
e(s) to consider:
> - [Medium] Newly loaded classmap user modules fail to sync disabled class=
es due to a hardcoded `0UL` state assumption.
> - [Medium] TOCTOU race in `ddebug_apply_class_users` when a class paramet=
er is modified via sysfs concurrently with module load.
> - [Low] struct ddebug_class_user defines mod_name as non-const char*, whi=
ch discards qualifiers from string literals.
> --
>
> commit ed72477b68f823658c20da0da2c5754d60e12c69
> Author: Jim Cromie <jim.cromie@gmail.com>
>
> dyndbg-API: replace DECLARE_DYNDBG_CLASSMAP
>
> DECLARE_DYNDBG_CLASSMAP had a flaw: multiple invocations across both
> core and driver modules broke the K&R "define once, refer afterwards"
> principle, causing boot-time parameter propagation failures.
>
> Replace it with an explicit client-server model:
> [ ... ]
>
> > diff --git a/include/linux/dynamic_debug.h b/include/linux/dynamic_debu=
g.h
> > index 144a2a947abcb..6517e0169a803 100644
> > --- a/include/linux/dynamic_debug.h
> > +++ b/include/linux/dynamic_debug.h
> [ ... ]
> > +struct ddebug_class_user {
> > +     char *mod_name;
>
> [Severity: Low]
> Does this code discard qualifiers from string literals?
>
> Using the DYNAMIC_DEBUG_CLASSMAP_USE_ macro assigns the string literal
> DDEBUG_MODNAME to this field, which can trigger compiler warnings and
> compromises type safety. Should this be declared as const char *mod_name
> instead, similar to how it is defined in struct ddebug_class_map?
>
> > +     struct ddebug_class_map *map;
> > +     const int offset;       /* offset from map->base */
> > +} __aligned(8);
>
> [ ... ]
> > diff --git a/lib/dynamic_debug.c b/lib/dynamic_debug.c
> > index 2065bfd1687e0..0e25b4d53942b 100644
> > --- a/lib/dynamic_debug.c
> > +++ b/lib/dynamic_debug.c
> [ ... ]
> > +/* called for class-users only, parse_one does this for definer module=
s */
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
> > +             ddebug_class_param_clamp_input(&val, kp);
> > +             new_bits =3D val;
> > +             v2pr_info("  %s: classbits: 0x%x\n", KP_NAME(kp), new_bit=
s);
> > +             ddebug_apply_class_bitmap(dcp, &new_bits, 0UL, modname);
>
> [Severity: Medium]
> Will this fail to sync disabled classes for newly loaded modules?
>
> By hardcoding 0UL as the old_bits argument, ddebug_apply_class_bitmap()
> assumes the module starts with all debug classes disabled. This means it
> will skip generating disable commands for any cleared bits.
>
> If a module is compiled with -DDEBUG, its callsites are enabled by defaul=
t
> and won't be correctly disabled to match the system-wide classmap paramet=
er


ack.  handled with a macro that yields a classbits full of 1s on DEBUG.

> state.
>
> > +             break;
> > +     case DD_CLASS_TYPE_LEVEL_NUM:
> > +             val =3D READ_ONCE(*dcp->lvl);
> > +             ddebug_class_param_clamp_input(&val, kp);
> > +             new_bits =3D CLASSMAP_BITMASK(val);
> > +             v2pr_info("  %s: lvl:%d bits:0x%x\n", KP_NAME(kp), val, n=
ew_bits);
> > +             ddebug_apply_class_bitmap(dcp, &new_bits, 0UL, modname);
> > +             break;
> > +     default:
> > +             pr_err("bad map type %d\n", dcp->map->map_type);
> > +             return;
> > +     }
> > +}
> [ ... ]
> > @@ -1238,12 +1404,17 @@ static int ddebug_add_module(struct _ddebug_inf=
o *di)
> >        */
> >       dt->info =3D *di;
> >       dd_set_module_subrange(i, cm, &dt->info, maps);
> > +     dd_set_module_subrange(i, cli, &dt->info, users);
> >
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
> Can this introduce a TOCTOU race with concurrent sysfs updates?
>
> Here, the new module is added to ddebug_tables and the ddebug_lock is
> dropped before the module's initial settings are applied by
> ddebug_apply_class_users().
>
> If a concurrent sysfs write to the dyndbg class parameter occurs in this
> lockless window, the sysfs thread will acquire ddebug_lock, apply its new
> parameter value to all modules (including this newly added one), and upda=
te
> the parameter value.
>
> When this load thread then calls ddebug_apply_class_users(), it will read=
 the
> parameter unprotected. If it read the old parameter value before the sysf=
s
> thread overwrote it, it will subsequently acquire the lock deep inside
> ddebug_change() and apply the stale old value, overwriting the sysfs thre=
ad's
> newer changes. This would leave the module permanently out of sync.
>


    There is no race here:

    0. Separate definer vs user modules:
       The locking in ddebug_add_module() adds the module to ddebug_tables =
so
       it is reachable by params and >control queries.
       Classmap definer modules (e.g. drm) EXPORT their classmap records;
       class_user modules (e.g. amdgpu, drm_kms_helper) depend upon them.
       The kernel module loader guarantees strict serialization: the define=
r
       is fully live before any user module can begin loading.

    1. Builtin ordering:
       For builtins, the linker orders drm ahead of dependent drivers and
       helpers in vmlinux, strictly ordering ddebug_add_module() calls duri=
ng
       early_initcall.

    2. Deadlock avoidance:
       ddebug_lock must be dropped before calling ddebug_apply_class_users(=
)
       because the sync path calls ddebug_change(), which acquires ddebug_l=
ock.
       Holding the lock across ddebug_apply_class_users() would self-deadlo=
ck.

    3. Init bits handling:
       Calculate init_bits based on (_DPRINTK_FLAGS_DEFAULT &
       _DPRINTK_FLAGS_ACTIVE) (CLASSMAP_BITMASK(map->length) if DEBUG is
       defined, else 0UL). Pass init_bits as old_bits to
       ddebug_apply_class_bitmap() in ddebug_sync_classbits(), ensuring
       disabled classbits correctly generate "-p" queries for modules built
       with -DDEBUG.
