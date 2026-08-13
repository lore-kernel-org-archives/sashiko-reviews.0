Received: from mail-yw1-f170.google.com (mail-yw1-f170.google.com [209.85.128.170])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1B166351C2D
	for <sashiko-reviews@lists.linux.dev>; Thu, 13 Aug 2026 03:58:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.128.170
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1786593524; cv=pass; b=eV1NPA+h8MSpoGdN/crcZr9za/s0bLGzbDo6rfOaZFYeinU/VLNSTEnYM/dsjQvtd3Zg1hdIH8J1u4yNKmLRr3sBvxFN3ae8csD6zvpBYVWt9te+VURRQdicj8UQnCF60F8qnetoFKtztQMn3+38l7AD6P4jl70SasDQdlz2KsE=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1786593524; c=relaxed/simple;
	bh=sq+W5BI112adXKFE8UlROpt4/+kIDwenyAibUSeEa7s=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=JKlag5g5kdcJ20pA/JkmC/B3C5WM/hpdoGoQj45PeVFtaqJmvgZ67WdES0PwtK3nw2xB6gHoH5cLvhUp2fHY/8F6SpTDov6wVYoqpzcTQAJq13PXW3WFZ5a68ik0J7IzHozQCAN8gMqmg2baDJx7b+qwFMLWPQYQlbscJLduRb0=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=lXyKKQua; arc=pass smtp.client-ip=209.85.128.170
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="lXyKKQua"
Received: by mail-yw1-f170.google.com with SMTP id 00721157ae682-81eaf3709b4so23772637b3.0
        for <sashiko-reviews@lists.linux.dev>; Wed, 12 Aug 2026 20:58:42 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1786593522; cv=none;
        d=google.com; s=arc-20260327;
        b=NJNKa+dUjQFvPbItHJRn5u+SSIIJpecP1A/B7Vz1L4Z250ndc7ZIBmcRyZGLAD+6GA
         5Fgs1QaWazch5OP0b+zaWZJgSRGR3rlRf2cP2L/ZMcCw3HGK7kPUYOoFsVRAqLRfU18S
         IQdnp0IcozXfx24yOz3ZNTGbXNl6cyT23yXU7ZuJ4IiBM5/Zhkh2rITYsK2Xzq9F6bO/
         MteC+PJu8efNKXYYmsfLzggM8/p8v2p6IzhY72A3Ce6xoOc2zn/mEoI7CXtIwqQMifYq
         ljGdIoNPzifGoROZz30kgXQJ14xS0mGglNr+g5I6bpTVD1hZDKlnu2zVsRPu19L9AAkv
         FmBA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=IXgqwLmrRycVe6Jgbf2eYsL3a6mEgCeWhuuMuTwa43Q=;
        fh=n9os5WTbvHHiLqw47yXO8YfgHtdCqzxZS24TA1BEWTA=;
        b=KJvudRJjTcq+SErKWXR5CUdGuGVYJyLggQgYzLVx7Yn3iB+WUDxXakFuBrg6fhJmzt
         CHULpEuIr20IILAomozbP5o11yfLlwH7pV5ZF0CuOty8NimrBBlVn9BL6Q0DxLjpa8XT
         g6ztlGHL0MHcbp7T4Vfp6+xlRdPFVRMnf6zCksJtm74IMcSGpe0iaiuADqmJEHPxba94
         iibaqCj1/PrwdsHPcCO9K1W1czcXt/MjpO8SCZfuroth5+UTO6Rn1re7IYDLijpHDfsw
         NpfI+KBuORuruIpKVPP5P4THnt4HyrEDtqE51Q0n5ohl7F7AoTeTUKLvaWeqG0sGG+NJ
         W8mw==;
        darn=lists.linux.dev
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1786593522; x=1787198322; darn=lists.linux.dev;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=IXgqwLmrRycVe6Jgbf2eYsL3a6mEgCeWhuuMuTwa43Q=;
        b=lXyKKQuaw2KZktlxE7c0sDrJ5gZL5BiAIv2AnS9i440h9caXMT5/0M+lF3TfIjyzkT
         YfwctFOf+gQSYwe+NRg+C0qcnv+1ZjSKuiy0JpunVcDoKpO32BToeN0cZu6PfM173CFu
         Z7vsjCsAnkPGjGjx7qulx7Ct70vQt3F2Src7qIFedaOn//F+ggiZJhvEpUpVCwkmufr+
         pzvsYSBNnqyvzdXiEKYPN5rhUu/M11HbibqSmXWIUSVTo54luok6EHQ0S7jUWEMyvb6O
         ZCp7B2p4BQXikETtd2u+2UNAhFfmJq8Nf9VO8F+IiY3A1E/nhZigNxkmm/+vGwzcKjpz
         A6Lg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1786593522; x=1787198322;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=IXgqwLmrRycVe6Jgbf2eYsL3a6mEgCeWhuuMuTwa43Q=;
        b=pUyp0OqU3q6GgEsETj987wA/JpPuX0qg4dedVjvDIZ2hNVI8O/CbgfcKuB3037cK1M
         7EhwCThKfsfqBDtvQgG7GJNNkjgKPyx8SEzZx2rgNRaoorparGYdAgeBcM56pnEbFfOl
         g4JKtd3Cffow4I474aFU9f/Pcs3dFACom4MAIZnuDsSRmDEukGH8u3Jg7Yb/39CcIdtP
         Tg6Nm1HDAgHrNUdCAi+l/UrDrG0ehEokQy/g/KpXZwgwUjhcGQF9eyaCfm8wJNf8RRCE
         lUSlvnh+82h3yvtHIHFH1fOa5PDDoRSHx1MRGX1Mj+e8Y9tEAiboBI0r2jEVnTf8Cn4G
         lHEg==
X-Gm-Message-State: AOJu0Yz2nUPxMarpA7q6uaupUTZcr05FeObRGmoxBBmjJ5QSvh6xAL3h
	fBsKDCMbhddFEvN/nHJLo7Ps4PGQHBkm1t9R6o7yauqFRCr3T3bYc1+H7h2yg/vp5jmoxqvbfyg
	cuipuipqht3ZMZFjV7peOhk/adeiS2lJ90JCj
X-Gm-Gg: AR+sD13P8x/yvGdPXAkwdGgsiivCaf5N3ai+Qi6YQZml9gB/6g6ycjLB61GPvbomyjm
	P6qujMJ6jtaB7YaKY0pHANHjR87xzPT9Wkc/pVwIeq2pPwmR02KBJVuOvPleUGlo7BsgcK+a/iU
	iQNDk0blddhxrNPRoGkMHqM8F48SQJJe1ZzLtrE5HdDgMdcxCKFr+tGONPRTPpn+mXfvadKdNaU
	OVFrf7DOLGRPsOPOz8jbisWbEYcDpI0BZ1nLAvTI9Z3asp0EvkRG62DCRGg3gYrqeD6XHxZZImg
	lomJw7mndkQHy7RvOwV0B1rYAcg3xXI5OGbHuE32I99HjNqEjC5TgGbgz6IBd4XS3wSfUpKdm+h
	NfA==
X-Received: by 2002:a05:690c:12:b0:820:a55:3ca3 with SMTP id
 00721157ae682-83476ef4715mr12735707b3.33.1786593521873; Wed, 12 Aug 2026
 20:58:41 -0700 (PDT)
Precedence: bulk
X-Mailing-List: sashiko-reviews@lists.linux.dev
List-Id: <sashiko-reviews.lists.linux.dev>
List-Subscribe: <mailto:sashiko-reviews+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:sashiko-reviews+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20260813030408.9761-1-laoar.shao@gmail.com> <20260813030408.9761-3-laoar.shao@gmail.com>
 <20260813031611.A4EAD1F000E9@smtp.kernel.org>
In-Reply-To: <20260813031611.A4EAD1F000E9@smtp.kernel.org>
From: Yafang Shao <laoar.shao@gmail.com>
Date: Thu, 13 Aug 2026 11:58:06 +0800
X-Gm-Features: AUfX_mxjwMtfVSIIOYiDzXqChSPXVXfq6yEZZda0dfVJvd-yBFpxVxLTadP0QtA
Message-ID: <CALOAHbAEc_hKR6Fz4JkVyZkhjHepBe_s_mpTe3Q8sa0V9oH2Lw@mail.gmail.com>
Subject: Re: [PATCH 2/2] livepatch: Fix UAF of unregistered patch kobjects
To: sashiko-reviews@lists.linux.dev
Cc: joe.lawrence@redhat.com, jpoimboe@kernel.org, mbenes@suse.cz, 
	jikos@kernel.org, pmladek@suse.com, song@kernel.org, 
	live-patching@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Thu, Aug 13, 2026 at 11:16=E2=80=AFAM <sashiko-bot@kernel.org> wrote:
>
> Thank you for your contribution! Sashiko AI review found 2 potential issu=
e(s) to consider:
>
> New issues:
> - [Critical] The newly added release signaling logic introduces a direct =
Use-After-Free when processing dynamically allocated objects and NOP functi=
ons in the kobject release paths.
>
> Pre-existing issues:
> - [High] The patch fails to fully resolve the original delayed kobject re=
lease Use-After-Free if partial initialization fails after the patch kobjec=
t has been added, leaving child kobjects un-added.
> --
>
> --- Patch [2]: [PATCH 2/2] livepatch: Fix UAF of unregistered patch kobje=
cts ---
> commit ac38837d810b471eed544191021bf254f8b9e585
> Author: Yafang Shao <laoar.shao@gmail.com>
>
> livepatch: Fix UAF of unregistered patch kobjects
>
> When klp_enable_patch() fails after klp_init_patch_early() has run,
> delayed kobject releases can cause use-after-free bugs when the module
> is unloaded. This patch tracks pending kobject releases and waits for
> them before completion.
>
> Link: https://lore.kernel.org/all/20260809094046.50ED31F000E9@smtp.kernel=
.org/
>
> > diff --git a/kernel/livepatch/core.c b/kernel/livepatch/core.c
> > index 28d15ba58a26d..e07b026feeb99 100644
> > --- a/kernel/livepatch/core.c
> > +++ b/kernel/livepatch/core.c
>
> [ ... ]
>
> > @@ -652,6 +653,14 @@ static void klp_kobj_release_object(struct kobject=
 *kobj)
> >
> >       if (obj->dynamic)
> >               klp_free_object_dynamic(obj);
> > +
> > +     /*
> > +      * The object kobject was initialized but never added to sysfs.
> > +      * Signal the release to the owning patch.
> > +      */
> > +     if (!obj->patch->kobj_added &&
> > +         atomic_dec_and_test(&obj->patch->kobj_pending))
> > +             complete(&obj->patch->finish);
> >  }
>
> [Severity: Critical]
> Does this dereference the freed obj pointer?
>
> If obj->dynamic is true, klp_free_object_dynamic(obj) is called, which
> frees the object structure. Immediately after this intentional free, the
> newly added logic dereferences the freed pointer by evaluating
> !obj->patch->kobj_added.

makes sense.
It seems we only fix it for the !obj->dynamic case.

>
> > @@ -668,6 +677,13 @@ static void klp_kobj_release_func(struct kobject *=
kobj)
> >
> >       if (func->nop)
> >               klp_free_func_nop(func);
> > +     /*
> > +      * The function kobject was initialized but never added to sysfs.
> > +      * Signal the release to the owning patch.
> > +      */
> > +     if (!func->obj->patch->kobj_added &&
> > +         atomic_dec_and_test(&func->obj->patch->kobj_pending))
> > +             complete(&func->obj->patch->finish);
> >  }
>
> [Severity: Critical]
> Similarly here, does this access func after it has been freed?
>
> If func->nop is true, klp_free_func_nop(func) frees the function,
> but the new check immediately dereferences func->obj->patch->kobj_added.
>

makes sense.
We only need to fix it for the !func->nop case.

> [ ... ]
>
> > @@ -737,9 +753,29 @@ static void klp_free_objects_dynamic(struct klp_pa=
tch *patch)
> >   */
> >  static void klp_free_patch_start(struct klp_patch *patch)
> >  {
> > +     struct klp_object *obj;
> > +     struct klp_func *func;
> > +
> >       if (!list_empty(&patch->list))
> >               list_del(&patch->list);
> >
> > +     if (!patch->kobj_added) {
>
> [Severity: High]
> This is a pre-existing issue, but does this check leave child kobjects
> unprotected if partial initialization fails after the patch kobject has
> been added?
>
> If klp_init_patch() successfully adds the patch kobject, it sets
> patch->kobj_added =3D true. If a subsequent operation like klp_add_nops()
> or klp_init_object() fails, klp_free_patch_start() is called on the
> error path.
>
> Because patch->kobj_added is true, this check is bypassed and
> patch->kobj_pending tracking is not initialized. However, child kobjects
> that were initialized early but not yet added to sysfs do not hold a
> reference to patch->kobj. Thus, patch->kobj will be released
> independently, unblocking patch->finish, and allowing the livepatch
> module to be unloaded while un-added child kobjects may still trigger
> their delayed releases and access freed module memory.

Right.
The kobj_added flag is insufficient because it doesn't account
for partial initialization failures where the patch kobject was added
to sysfs but some child kobjects were not. Removing kobj_added and
always counting all static kobjects in kobj_pending handles both the
fully-unadded and partially-added cases uniformly.

--=20
Regards
Yafang
