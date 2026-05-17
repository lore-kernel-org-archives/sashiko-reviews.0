Received: from mail-yw1-f177.google.com (mail-yw1-f177.google.com [209.85.128.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2C3A53624D3
	for <sashiko-reviews@lists.linux.dev>; Sun, 17 May 2026 13:32:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.128.177
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779024776; cv=pass; b=SPKbV/Yew3AGK/q7hV1/3D0SVbRuhwoTmfnm5IJiOcW5NcqUyVS8rSFV8DwnSDJadndsGC8d52t1bn4qCEFoAaQaDPEPF/cOx5Ax+ctXKiKZg4irRpo4tncdumXHmecuTIut6aV3J042pFbb8dIqFwivTyld7lwJIbSGD4ChI+0=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779024776; c=relaxed/simple;
	bh=Me13lM9jQNdFUFO9f6NP1VUcg617l+KY6RpnBp03sKg=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=MFk8CkumVGebs73Ml2q6uQSZWNWgX5/EVhQkplvd/VfXFisCxtbYfC7X5Lk82BSQ2otDtGEhB+0WWmXvRrQBKlC88/4HomKCZCRh42/NRJFGNJh6fADn2B1yp+c+g95mAgkhTHDacs1b/jWgW9Xl5P/rPl+GzWYYKgSA5pSneTA=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=k8+j7d/z; arc=pass smtp.client-ip=209.85.128.177
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="k8+j7d/z"
Received: by mail-yw1-f177.google.com with SMTP id 00721157ae682-7b4ee3a88e1so7788057b3.1
        for <sashiko-reviews@lists.linux.dev>; Sun, 17 May 2026 06:32:55 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1779024774; cv=none;
        d=google.com; s=arc-20240605;
        b=hiflkqdgKfc2XYAGenpI9GU4vx94NMQwXheVnBLjNQWaoWGwEnEpUG70nk0a0TyPZB
         8BI6HrUA7Hlzov2rOq6p49CZhsgiy8EVC8WoNO+EieHJImWdU1/UQFmJP87B8KSwRl53
         pDc8U1a7gwYbbafc1P9c1Rw51jAxtFL96ZwPyhbk/uEmrNXBwKlip4av3XOZnyMtfdqR
         mitFf4UqumwAix+YfoNVIq6q3YxCjDtuyyBfGKmtqR3ji4B+tx393ZFvwm2Vz8aLol8J
         3t8OiQEBtqRJBWPhf6T8C4g49DLtM3FfNv9ObT5C6Fhhu9NHjAdC3FSwEH5m6jbrNGQq
         Q5lQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=uMwhRipX67UD0+c6NpFaV2oXtR27/5WyYFPFRLfw3uE=;
        fh=MxJSjx8cX++PF4xQNJ+OGldOvfaQgkG9wmNEphOOzoc=;
        b=cMWhJiM29ff1Ozwww2kDs7I2mZt3hUqPXL2kYgZIrrmf+UMwo06+7diY1gGe4ZklvK
         8RqGrIH5htbUdtBdSUecebjH/QpEweMUCIgQ7D1jzPtxE4VZ0KkbgXKSC6YGIgpwjrcr
         DosoxjTW6xn+AMLIsrATnV3FGnv2yi9mB3UQRTmJt1bgGM+di6PDuY1XJPmZu7TWlCFo
         sT6HQgCryYen6IHGcmxo1EaG5Jjc8NVVvnpJL8CaP6c7BQGjiMC27HpvK9nDT1qPIKgR
         QPicblMC4HU4Cn6HLxlxOAJDIDB5MN4wb1WAXFwUh+yCtW6CLfgfii85AS8tBhfU8HKp
         U7aA==;
        darn=lists.linux.dev
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1779024774; x=1779629574; darn=lists.linux.dev;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=uMwhRipX67UD0+c6NpFaV2oXtR27/5WyYFPFRLfw3uE=;
        b=k8+j7d/zTOJ3wrv2FdRVj5s50S1p/9Cc5abhT8uHv3ggUCNVi5fRiCW23MCN6ekusf
         EmSLE2YJL6+XCC+YG92EQ+7b6+06JS/6A0WybZSIFuOSHwPKwlABkSwIIjpOF/wC7FNP
         ah0ouNLP+YGhourhVuqOh5He6naYkuaZhfLEAzHjBtoG07dylIsHyFPJFYb/3e3NDo3N
         Q5psFnZsJs+HyACl4p+jKRNkpXooI9bscvL8WMG+d/HBkbc0X7hf/zcl4cVOkjNUfiWv
         bxeHlHPRFWco8rw8UqCvxSRxOstA3T7LssP7MrH+pppg/vZbXf8gBmbNTb7UUPCNRYr+
         XV1Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1779024774; x=1779629574;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=uMwhRipX67UD0+c6NpFaV2oXtR27/5WyYFPFRLfw3uE=;
        b=qc25dYWFCqL9j9CPG1qN15Dbia6nQY2zPBlxRwJu2Q2981TnJnd066VyTxDWqlxmv4
         S2m/zHoRIukZfvw3Iz4hIiaQEmDhmnv8TY+H+AVZB8DHu/rH8b/fIHX4Xq+xo9zBizHZ
         v7fQwREasK3XbGRHBn8prcc9EsOgsnuw+dcdh0ov2ts6P9xkAYIXBQqEQJgGnOMQoYEu
         iqeSDEl+SQ3/uo8fK7qZpJA9H87DW5ZJLv8S3d7Lpapi6yFVvZVf9ad3LDXAtMGU8mQi
         fsxmKvXTpZdb5MKy7khASifUSxmgc6VHkzGqqlfCbkttcdfgPZHAPMMKLpJ526tW+bro
         1lTw==
X-Gm-Message-State: AOJu0YypYN2E9WqICBYtX0ML5qB5tTmF7nw4ruX/bbGRZwr7b3KYDqvT
	yqAexceg1iR6eR49KrZsvFhqqqwN4y7Xib8yurc1s+8vwjcmQTcc+KBUGZ7ot6QplfuL/Xs1Zcs
	kCv7ok7R6RU8YDqbCCvTSNSvwJ5gNUPLvzBrxf8A=
X-Gm-Gg: Acq92OEfZsWgtWUTn0l88UH1PqVR1pnjZ+ZURehsL5XPdRQUNZX5JTo3DlueQM9f2Nq
	u5bifVfZo83Y9lNZl6oNzC1RcdwvpkQgPXt3A6e7LgcX1/xDOk+dYzszG3NOof2YkIR2zovZ+V1
	vBaRamkWe3u22wsYkKaBhrJY34M/JYe5vwa3yA4RMpy5FiU0I2mKrd5dDbxhTnOscOZeAmD2Wd/
	VAmyf2kry9XCMidWpyd50YusqXvz0WdepIuf18ORyIysemDYrZW0VvPrYiZZGIlYGOWpO4QU1ZZ
	hOA4/oMX7SbXRgT5yNjnrsbcJWrS0wP2+Z0LYU9/
X-Received: by 2002:a05:690c:f15:b0:7b3:ca3b:84a4 with SMTP id
 00721157ae682-7c95aa5f23amr125105337b3.18.1779024774198; Sun, 17 May 2026
 06:32:54 -0700 (PDT)
Precedence: bulk
X-Mailing-List: sashiko-reviews@lists.linux.dev
List-Id: <sashiko-reviews.lists.linux.dev>
List-Subscribe: <mailto:sashiko-reviews+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:sashiko-reviews+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20260513143321.26185-2-laoar.shao@gmail.com> <20260514205439.925F1C2BCB7@smtp.kernel.org>
In-Reply-To: <20260514205439.925F1C2BCB7@smtp.kernel.org>
From: Yafang Shao <laoar.shao@gmail.com>
Date: Sun, 17 May 2026 21:32:18 +0800
X-Gm-Features: AVHnY4I0OHG_DMlGc3-4Hr09LP87tpwxlQNyIPLcFKrv6iPr-_-qKusBySvBicU
Message-ID: <CALOAHbCpRO9-EpFURKPw7NOj0sXhkEMwNp_orVjXhWfhP9dtEw@mail.gmail.com>
Subject: Re: [RFC PATCH 1/6] livepatch: Support scoped atomic replace using
 replace set
To: sashiko-reviews@lists.linux.dev
Cc: mbenes@suse.cz, song@kernel.org, jikos@kernel.org, jpoimboe@kernel.org, 
	pmladek@suse.com, joe.lawrence@redhat.com, live-patching@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Fri, May 15, 2026 at 4:54=E2=80=AFAM <sashiko-bot@kernel.org> wrote:
>
> Thank you for your contribution! Sashiko AI review found 4 potential issu=
e(s) to consider:
> - [High] Module reference leak during forced transition.
> - [High] Silent semantic reversion for zero-initialized out-of-tree livep=
atches.
> - [High] Sysfs ABI breakage and incorrect type formatting for the `replac=
e` attribute.
> - [Medium] Build failure in livepatch selftests.
> --
>
> commit 8a05e8a3ebd9241541926ac6aba19452a820c899
> Author: Yafang Shao <laoar.shao@gmail.com>
>
> livepatch: Support scoped atomic replace using replace set
>
> This commit converts the boolean replace attribute to a u32 replace_set
> to allow livepatches to atomically replace only existing patches within
> the same set. Patches with different replace sets can now remain active
> simultaneously.
>
> > diff --git a/include/linux/livepatch.h b/include/linux/livepatch.h
> > --- a/include/linux/livepatch.h
> > +++ b/include/linux/livepatch.h
> [ ... ]
> > @@ -137,7 +138,7 @@ struct klp_patch {
> >       struct module *mod;
> >       struct klp_object *objs;
> >       struct klp_state *states;
> > -     bool replace;
> > +     unsigned int replace_set;
>
> By removing the boolean replace flag, out-of-tree livepatches that
> zero-initialize their patch structures will now default to a replace_set =
of 0.
> Will this cause them to unintentionally replace all other zero-initialize=
d
> patches instead of stacking safely?

As previously discussed, backward compatibility is not a concern.

>
> Additionally, does this rename break the livepatch selftests in
> tools/testing/selftests/livepatch/test_modules/ (such as test_klp_state2.=
c),
> which still explicitly set patch.replace =3D true?

Selftests are currently excluded from this RFC

>
> [ ... ]
> > diff --git a/kernel/livepatch/core.c b/kernel/livepatch/core.c
> > --- a/kernel/livepatch/core.c
> > +++ b/kernel/livepatch/core.c
> > @@ -454,7 +454,7 @@ static ssize_t replace_show(struct kobject *kobj,
> >       struct klp_patch *patch;
> >
> >       patch =3D container_of(kobj, struct klp_patch, kobj);
> > -     return sysfs_emit(buf, "%d\n", patch->replace);
> > +     return sysfs_emit(buf, "%d\n", patch->replace_set);
>
> Does changing the sysfs output from a boolean to a replace set ID break
> compatibility for userspace tools expecting strict 0 or 1 values from the
> replace attribute?
>
> Also, since replace_set is declared as an unsigned int, will using the
> signed %d format specifier cause large replace set IDs to overflow and
> display as negative numbers?

Should use "%u" instead.

>
> [ ... ]
> > diff --git a/kernel/livepatch/transition.c b/kernel/livepatch/transitio=
n.c
> > --- a/kernel/livepatch/transition.c
> > +++ b/kernel/livepatch/transition.c
> [ ... ]
> > @@ -720,11 +720,11 @@ void klp_force_transition(void)
> >               klp_update_patch_state(idle_task(cpu));
> >
> >       /* Set forced flag for patches being removed. */
> > -     if (klp_target_state =3D=3D KLP_TRANSITION_UNPATCHED)
> > +     if (klp_target_state =3D=3D KLP_TRANSITION_UNPATCHED) {
> >               klp_transition_patch->forced =3D true;
> > -     else if (klp_transition_patch->replace) {
> > +     } else {
> >               klp_for_each_patch(patch) {
> > -                     if (patch !=3D klp_transition_patch)
> > +                     if (patch->replace_set =3D=3D klp_transition_patc=
h->replace_set)
> >                               patch->forced =3D true;
> >               }
> >       }
>
> Could this inadvertently set forced =3D true on the klp_transition_patch
> itself?
>
> Since klp_transition_patch was already added to the global list during
> klp_init_patch(), it will match its own replace_set here. If it is marked
> as forced during a patching transition, wouldn't we leak its module refer=
ence
> in klp_free_patch_finish() when it is cleanly disabled later?

Right. it should be :

                klp_for_each_patch(patch) {
-                       if (patch !=3D klp_transition_patch)
+                       if (patch !=3D klp_transition_patch &&
+                           patch->replace_set =3D=3D
klp_transition_patch->replace_set)
                                patch->forced =3D true;
                }

--=20
Regards
Yafang
