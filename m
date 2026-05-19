Received: from mail-yw1-f178.google.com (mail-yw1-f178.google.com [209.85.128.178])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C97A039D6C9
	for <sashiko-reviews@lists.linux.dev>; Tue, 19 May 2026 06:47:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.128.178
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779173248; cv=pass; b=PfiotBGft2UQTnrvVp8G62+AJy7zblBsbIcAP6ivKmEBObm2J5YKP8YbRNKC5Mx6yUmynWSirAI1gAO3PvAxDKjZkynLLhdAK+RVIzj+Vd6wkOprUxe0TzCKYkygnRC0Z522r8F0af8hggEwp/JheSwiGWBxirEAH+cuu0/8618=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779173248; c=relaxed/simple;
	bh=NyNDhvSyv7XRMowpgU81uTJFnsKmqI+7pkyzUxT0azo=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=ZihR8sztP/HU7rsJg0X+3j/ngt6PYQY1ggW/yp5KqcdV8GSv+oEeDUImUGjfecz9K8QYkkS4QgLEK8gU5cjJzGfCxpbTZGwm1WHlyCeLM4Zswg3/rZE71u6LBLFSkxOQ/dUHV5AdRGR3y5evhjTvgcQWs5sEV6Hs9sxSSNixHoE=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=FwSxUvDs; arc=pass smtp.client-ip=209.85.128.178
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="FwSxUvDs"
Received: by mail-yw1-f178.google.com with SMTP id 00721157ae682-7bdec52f48dso24225037b3.0
        for <sashiko-reviews@lists.linux.dev>; Mon, 18 May 2026 23:47:26 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1779173246; cv=none;
        d=google.com; s=arc-20240605;
        b=H523cy9c09zKMmof3eoopLjbZLyGr0fTCwBrLLoB6hmePuWoHGbiEXWkkCWZc17SRL
         3DG0YWlKWPEWJcGcOliusULjYKzA20I/SpoBXG2RKE2ekqK8qRPxpOU3g4cJ44fmVDLs
         dQwnPnUR1WpqC1sO7QPum1cXzMfGrglrbUKrJLfZ3Myic0RxIcnVp4+0jv80ZOF5a2qO
         YBqles3LLlNK4Z4lOhINtzXuiPAn0MPr+Mf6FMWOUNifvjgrp37iHL8fh2DiPLNYqX1Q
         EsHCHhtF8AKqytMEOYpId3jkNWXbvjlfhOYOPn2JJ+aPan2ChgGgwqxz4skDHIrb0WAC
         +reA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=eaSPx0wbxWVv539GDTg5+Kyju9uz5Da///Zk6u5kJUA=;
        fh=jNN73ROUAWpOnqcFckj/je1cyezepSLhAlHS00pwn+I=;
        b=e3jO+AHqa2r12QOsDWp75g//09G7lUFyCRm2RjRF6uxGWtdPx0SWBz0JeuOZfKCKBS
         7AyipVgHU9GNBzOSdvkTsVWXgesShlTqQDHLsqZeF1p1jNI3ePAAnBA+NFDHiq5sJHCE
         qEvc80L5Dqk+jwwk6FjFapBs+RYS6MUdeWcmyXQ5qvD8QFro7x5Q4STdzZIOHTPhjE9S
         Cs3Hevv1wHrdyrC/xRbtW12ehINcSowfIFKobBMJpPgLYBPGQhMhQ1JXSowynMgziHox
         cehLumLWwaQtmMA7zUzGCLu2LOuJXsjOIPkkm04JzO1uORxZX1se9yJfNzoMSTVvvRNW
         fuKg==;
        darn=lists.linux.dev
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1779173246; x=1779778046; darn=lists.linux.dev;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=eaSPx0wbxWVv539GDTg5+Kyju9uz5Da///Zk6u5kJUA=;
        b=FwSxUvDsIiABz6AGUsHd3tubhokkCTpfjU7l8kYYK2zBh6NKvXdjc89V32F0AJQQwf
         uuKG/wGa/RD/H8gvdrgr7FrecLNR00LIlfW9p5bWBD+6X5kesiUCptEBet4JbUc7uP9b
         WKfDxdkg08k9/V5TxslBNAVewZpwEhU6AyA1j+/9wU9VJjMj+974zMXUdNKNY5V2wust
         pooRN8mjEvJWFgPBnHemr0Z5cb10woIlOs7g10z8MVL2WaedLQMbQhLIndfRyiJ6JoZs
         BPe9c4w29otqZJ0WcsuJnL4SE29h2B5ZSkF0wpb1E8/OfER+doILTEDhF07L5Vt8F7Vd
         wbjw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1779173246; x=1779778046;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=eaSPx0wbxWVv539GDTg5+Kyju9uz5Da///Zk6u5kJUA=;
        b=URTheLN6z0gY053GRvWbueevihR9WZ3QdrpEofwKSf+yDWdGzptDfAUGh0aYq/LEac
         nYuD+4dBQQ1LLw/TJ9avGKAxcceR8z36MYHsQt//KSBrLYQJRUeNMe3tJA525F+RV0Uf
         TjsaZykuYonqa+/Km1eY04/uvIT3a0ACl6smuUAkfq1jZfylFlWDq1+q5CDLdMQKmk7F
         1H3gH3W11wB271Qd+0VOrIQhQF1tgoqlR74CkjewF09KaCFEbLwINLkaXcq7+KGIvAWf
         sTlQMl4sddttCPCiyyn6vBERDEzDTF4zwPgiavfAscLp7fXfXfH+riYjU4GcznXK2kRh
         sjSA==
X-Gm-Message-State: AOJu0YyASdjCbSe6aIk+UllgLYw+YtyjrDpvnFXp9XPpls/1Sn5lWViO
	17ztyH8ObszLbKj2yVfDTpUDzOdYLDNp2kBOf3Y9VU/SlGRKbCpdMHt1eyHBvOSzkd4mQfULUdf
	pVdnsGmzWljpD5lTjqk9Ln4D4PWACrXB3Nf+fUSc=
X-Gm-Gg: Acq92OFf5pi0LjsTTwbBy7yr4MHbLWnPF2Y8knkf09/5fvBq6fnPjA/vy8CgzEFYa2m
	MS2/nbQOM4L9fEHTGunud3puN5Mpw62w7Qa9CvO3K/tDI2CM/KB8TW3qHZYizL57nee0BF8OaPH
	REkfur6iEgXIQHD/hGA1lmMrg9SruFPVanCyiDlwLU9znrVaJcMYNwWXke61YAC+NbNifKarPpx
	6Bi3+1aKCw7TX2dPzbiP6EhwtDKq/hCcIy29cuIuBAe0TOY8YCMMZEBKWuURUDR7eYt4KsrXkUO
	igjWz+wDqbagH5EPJ3Ji1rHLJ7ma4QjxhqsPYEo9
X-Received: by 2002:a05:690c:c15:b0:7c6:e377:1dc6 with SMTP id
 00721157ae682-7c7e3134169mr200189587b3.0.1779173245682; Mon, 18 May 2026
 23:47:25 -0700 (PDT)
Precedence: bulk
X-Mailing-List: sashiko-reviews@lists.linux.dev
List-Id: <sashiko-reviews.lists.linux.dev>
List-Subscribe: <mailto:sashiko-reviews+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:sashiko-reviews+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20260513143321.26185-6-laoar.shao@gmail.com> <20260514224000.8316FC2BCB3@smtp.kernel.org>
In-Reply-To: <20260514224000.8316FC2BCB3@smtp.kernel.org>
From: Yafang Shao <laoar.shao@gmail.com>
Date: Tue, 19 May 2026 14:46:49 +0800
X-Gm-Features: AVHnY4JvQLoFhFQyXqActjgjy4XZjyhfXkPZbhv95lsGfAQ4gvQIoFIxkJ2j3RE
Message-ID: <CALOAHbD28PLp=35mV6n2G=tKtf8rGb_uVbTb4wY=6Erm+wjLGQ@mail.gmail.com>
Subject: Re: [RFC PATCH 5/6] livepatch: Remove obsolete per-object callbacks
To: sashiko-reviews@lists.linux.dev
Cc: jikos@kernel.org, joe.lawrence@redhat.com, mbenes@suse.cz, song@kernel.org, 
	pmladek@suse.com, jpoimboe@kernel.org, live-patching@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Fri, May 15, 2026 at 6:40=E2=80=AFAM <sashiko-bot@kernel.org> wrote:
>
> Thank you for your contribution! Sashiko AI review found 3 potential issu=
e(s) to consider:
> - [Critical] Out-of-bounds ELF relocations causing memory corruption
> - [High] Silent failure of livepatch state callbacks due to missing initi=
alization
> - [Low] Build failures due to unmigrated selftests and samples
> --
>
> commit deb761bd65e9a96a95798282bde72ddb362e1c0d
> Author: Yafang Shao <laoar.shao@gmail.com>
>
> livepatch: Remove obsolete per-object callbacks
>
> This commit removes obsolete per-object callbacks from the livepatch fram=
ework
> in favor of per-state callbacks. It drops the callback fields from the kl=
p
> object structures and updates objtool and the livepatch core scripts.
>
> > All selftests have been migrated to the new per-state callbacks, making=
 the
> > per-object callbacks redundant.
>
> Is this description accurate?

Selftests are untouched in this RFC. I'll revise the commit log accordingly=
.

>
> The callbacks field was removed from struct klp_object, but if modules li=
ke
> samples/livepatch/livepatch-callbacks-demo.c or the selftests still use i=
t
> in their klp_object declarations, won't this cause build failures?
>
> > diff --git a/scripts/livepatch/init.c b/scripts/livepatch/init.c
> > index 9265e0e504e0c..570366b9268c4 100644
> > --- a/scripts/livepatch/init.c
> > +++ b/scripts/livepatch/init.c
> > @@ -63,8 +63,6 @@ static int __init livepatch_mod_init(void)
> >
> >               obj->name =3D obj_ext->name;
> >               obj->funcs =3D funcs;
> > -
> > -             memcpy(&obj->callbacks, &obj_ext->callbacks, sizeof(struc=
t klp_callbacks));
> >       }
> >
> >       patch->mod =3D THIS_MODULE;
>
> Will the state callbacks be executed when the patch is enabled?
>
> Looking at livepatch_mod_init() after these changes, patch->states is nev=
er
> initialized:
>
> scripts/livepatch/init.c:livepatch_mod_init() {
>         ...
>         patch->mod =3D THIS_MODULE;
>         patch->objs =3D objs;
>
>         /* TODO patch->states */
>
>         patch->replace_set =3D KLP_REPLACE_TAG;
>         return klp_enable_patch(patch);
> }
>
> When klp_states_pre_patch() iterates over patch->states, won't it silentl=
y
> skip the uninitialized callbacks?

Since these callbacks have been moved to klp_state, they must be
initialized first. Note that the KLP_*_PATCH_CALLBACK macros are
broken after patch #6; I will fix this in the next version.

>
> > diff --git a/tools/objtool/klp-diff.c b/tools/objtool/klp-diff.c
> > index 4d1f9e9977eb9..6e2762de3d512 100644
> > --- a/tools/objtool/klp-diff.c
> > +++ b/tools/objtool/klp-diff.c
> [ ... ]
> > @@ -1566,8 +1566,8 @@ static int create_klp_sections(struct elfs *e)
> >               reloc =3D find_reloc_by_dest(e->out, sym->sec, sym->offse=
t);
> >
> >               if (!elf_create_reloc(e->out, obj_sec,
> > -                                   offsetof(struct klp_object_ext, cal=
lbacks) +
> > -                                   offsetof(struct klp_callbacks, pre_=
patch),
> > +                                   offsetof(struct klp_state_ext, call=
backs) +
> > +                                   offsetof(struct klp_state_callbacks=
, pre_patch),
> >                                     reloc->sym, reloc_addend(reloc), R_=
ABS64))
> >                       return -1;
> >       }
>
> Does this result in out-of-bounds memory writes during ELF relocation?
>
> Earlier in create_klp_sections(), obj_sec is allocated using the size of
> struct klp_object_ext, which is 24 bytes:
>
> tools/objtool/klp-diff.c:create_klp_sections() {
>         size_t obj_size  =3D sizeof(struct klp_object_ext);
>         ...
>         obj_sec  =3D elf_create_section_pair(e->out, KLP_OBJECTS_SEC, obj=
_size, 0, 0);
>
> However, the new relocations are created using offsets from a completely
> different structure, struct klp_state_ext.
>
> Because offsetof(struct klp_state_ext, callbacks) is 16, and the callback
> offsets go up to 24, this applies relocations at offsets 16, 24, 32, and =
40
> within obj_sec.
>
> Won't the relocation at offset 16 corrupt klp_object_ext.nr_funcs, and th=
e
> subsequent relocations write entirely out of bounds of the 24-byte obj_se=
c
> buffer?

Nice catch. I will fix it in the next version.

--=20
Regards
Yafang
