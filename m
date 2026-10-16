Received: from mail-yx1-f51.google.com (mail-yx1-f51.google.com [74.125.224.51])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 92EC843801B
	for <sashiko-reviews@lists.linux.dev>; Fri, 16 Oct 2026 07:47:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=74.125.224.51
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1792136834; cv=pass; b=sxur5nrS5Fp6zrbdNovB3huWkpX2NhSesZWKAvnBssvWpnCv0okttk1FLcrA16cNdDLcRgXxgY3ROr0DRBCOPuzrUZqU/zA6iFAQGGCxm85jEdzybEqQfBlgc/n2AcUVnqTOB9yxWVIwZvKCcJFk7xx0j+mPp01CDaQxZDMsSSI=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1792136834; c=relaxed/simple;
	bh=iz50SIIYgNXhoBf+ZNtcTDDxG1l5WEOIvp9iGxEjNrw=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=J9tbilWdfa2eCGhr+cK428pMXCggYFXEQvLzX+NLxwi8LFc2HtO4h9K2lKDu1i0eGJOI9dp7CgPPkR8ycR8wzNr38ETaJOU8U8cu6EuXybbAiZSNpBTk382fgNL1LkqHO7eNzTvFPb3u/CfGdD1oAZaoFH/ux2sJ0A8fFBfpxmg=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=aS0EIxKP; arc=pass smtp.client-ip=74.125.224.51
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="aS0EIxKP"
Received: by mail-yx1-f51.google.com with SMTP id 956f58d0204a3-679a420b5afso1544475d50.3
        for <sashiko-reviews@lists.linux.dev>; Fri, 16 Oct 2026 00:47:10 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1792136830; cv=none;
        d=google.com; s=arc-20260327;
        b=anVzV4ZZnrVwcaJmVVPA1R8swdwbdfnPrTV9caadNN8/OCVR0ev9zU4IubbuLKqnGh
         xA2s+XWLgMc+RaKLTwFHcR8aO6FTus+lTIfVOG8agtd313Og5yCzVppnLleEab/hhH7h
         WafVPY+zRLyKDGhBo+4KiczC6o4Y9sz3bJca0iuRo3fyRamsnlQZdpXG2qRiIvieUWkM
         5x4UH0dUE1ZZhR/SeyLqvF4t0paEaD1y2xPeFdGPvYExGoMIn41jTYnOcyavJSboqQwf
         Wgv8FwoN7FMUgwCBeL6NBT21ngNRIWkePB/D4Zl6z4sa+Ma0scgvmqkF34mB+i75VHp4
         eoug==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=YjWAKtNOnITlaXHSksc6OaQBOzDeD+AdLblBRpND2cY=;
        fh=jN8VodyhAI7zYna9JzV1QjHjWbE/Mn6J5bWeUXC0oQM=;
        b=OLXf42IpBBiXYBsKXV6a4omRXMrJ9flyZiVVK/Nc3hFjX7tMHjnuO6B45A6x56Eu/R
         GfLaQTmh94Ea8Gw1vt3LoKgD0GFDmXBWKbiUwZZVYS9ICIsoR1hVfhGi2YBBX+9794qb
         pvygJy1N6EE/A5MHsMogORPJ71IKUxWVpWPT7BhIb53rE6eNFezzf1vktyCURSWOavvE
         CHvD1daXJTYSHwWEEoewqA6HXv8fksSfMwWD7Hx8ei6uIcnKcgQay71NDWECKDrKBe+2
         4v6+d9sShZI1xaP+mLMFq3mqZojpH3nryN3IVu4kKdYmqQ5pbpVU/ZnW7H8Lz+KpGMZG
         Ujzg==;
        darn=lists.linux.dev
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1792136830; x=1792741630; darn=lists.linux.dev;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=YjWAKtNOnITlaXHSksc6OaQBOzDeD+AdLblBRpND2cY=;
        b=aS0EIxKP5H5/oxXtAVsoapUAM02F7/2G2EKZ4vqo4avrhoPlyvabLAAqaNoKuaPmi4
         Dc18KuEK5C2rv/CFLOtTxq0n0Av2xNnpS0OqUbyUp5NE23IQZ/3FE3dbFlQDaEdR2BIo
         il+6TMFVVZI4heP0ieNldygkLJLmJda5d44HaiQG7SlpmagzO9pAWv2MpekxbtYjNTp7
         TuNWEedcooMxhYSXGKiAdN2oNkJphBNbvO9rST6GY8zP5u1kkojS7pIUPlOpxOM9Hr9Q
         /HALeABABO+c1epKU3x8ZeSebOG7YYA7/gOhVAPWhEBIKj/UzcAuVyEpOWkjLmu9fYJC
         zRjA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792136830; x=1792741630;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=YjWAKtNOnITlaXHSksc6OaQBOzDeD+AdLblBRpND2cY=;
        b=2SgfECLkdES+/czCszmzr/0bt0BSJN4cxcSfMuZPqXhVGdRQ1UVoL3kY3O70FMfkWt
         fxLNQQ+qzTYB4UDBFxs+zn246f9Vdcsthppf+V9cmGIxDR3UGOJ7UlAq25k5O1sZkJ43
         fgHPGpyWmYj68T2ZFgFBapzGiLbb2Rp8v+Tzmr1d9adPoEE9RaOYVV/EAb/OiCX4taPn
         whGXXLfk5M68kVq+mnCLkllMB6JQ+PI6rNNW3DnuR9jwBlMTKeDATfQsB06PPJdRMd9L
         A6/mzk6eChqZq8mICaUANB+BvyhyOTbOhGRz9G+QME+Fi2IZb/1tER6ih9UrYaxrekhZ
         t0Xg==
X-Gm-Message-State: AFq9FYJhETpyROciOIZ+/DaSaxKlraeicEdcicO764VxjLAxCozpyB1Z
	oODydAv7rhwrGw/7MPN6WSfg9QgTgfDAAOxMPtdzcn23oKGiFWHauE3YG9l2mtJaGvHUUehklWp
	UTzXu9E5ZW2OvaPmSlaqiDY56hS8d+2WwzvQ6gpk=
X-Gm-Gg: AYBFou2t8Wsqej1BRPES9G0egzuB874rh5BOwdqKFmWpa6g9GHWPYCw7fAFW5flzB9Q
	nlKM7x2RLoGDy5QOB4ZRrmi/pKvJc7qPEinoQqhQwLqGe/e1YFTTJSBwOpTiUMMsfBTTQ8Akehk
	DzbanZA9z0VxPyEINueSEGqpnVflKr3vnVnSacBTTiWGFzdzRCLRCYTLldc8sUB61U4xd3gNMo4
	S1o0CnmehFBG8YRUZ97IbJF2kHhIz8aAaYuLNp9TN3PhAPciabybJ5/jZp0SdI3tdV9IMrACTW3
	U2s6VPnqeKHSAM7zy2cnCkwOYBIMXNysSGuOMSPrNEJURae/KoBPbwhtdBvGhKLKKkZScCs37Ci
	DPQa5fjbLf2+qy8Zi21Lg
X-Received: by 2002:a05:690e:168b:b0:679:5b51:339f with SMTP id
 956f58d0204a3-6795b513803mr4554881d50.132.1792136829876; Fri, 16 Oct 2026
 00:47:09 -0700 (PDT)
Precedence: bulk
X-Mailing-List: sashiko-reviews@lists.linux.dev
List-Id: <sashiko-reviews.lists.linux.dev>
List-Subscribe: <mailto:sashiko-reviews+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:sashiko-reviews+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20261016053708.47089-1-laoar.shao@gmail.com> <20261016053708.47089-6-laoar.shao@gmail.com>
 <sashiko-outbox-173837@kernel.org>
In-Reply-To: <sashiko-outbox-173837@kernel.org>
From: Yafang Shao <laoar.shao@gmail.com>
Date: Fri, 16 Oct 2026 15:46:33 +0800
X-Gm-Features: AclHuK_T9y1mVOiQaEvA1Ds2-qibg0REEpTSP5r7q1epESdWgUdYroFJnwfhLw4
Message-ID: <CALOAHbCeKtedvb=D=QdQiAXouJ4_dCVsgCP5t_OpA3QG=7xn1w@mail.gmail.com>
Subject: Re: [PATCH v12 5/9] livepatch: Implement provides and obsoletes for
 scoped atomic replace
To: sashiko-reviews@lists.linux.dev
Cc: jpoimboe@kernel.org, jikos@kernel.org, mbenes@suse.cz, pmladek@suse.com, 
	joe.lawrence@redhat.com, song@kernel.org, live-patching@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Fri, Oct 16, 2026 at 1:48=E2=80=AFPM <sashiko-bot@kernel.org> wrote:
>
> Thank you for your contribution! Sashiko AI review found 1 potential issu=
e(s) to consider:
> - [Medium] livepatch: memory leak of dynamically allocated patch structur=
es on klp_enable_patch failure
> --
>
> commit 160ccf1ed36fde593c80db0147adb4d9a0aa689f
> Author: Yafang Shao <laoar.shao@gmail.com>
>
> livepatch: Implement provides and obsoletes for scoped atomic replace
>
> This commit replaces the boolean replace flag in klp_patch with provides
> and obsoletes fields. It introduces a new flexible model to allow multipl=
e
> independent livepatch sets to coexist safely on the same system.
>
> > diff --git a/scripts/livepatch/init.c b/scripts/livepatch/init.c
> > index f14d8c8fb35fa..1eb124191cf22 100644
> > --- a/scripts/livepatch/init.c
> > +++ b/scripts/livepatch/init.c
>
> [ ... ]
>
> > @@ -72,15 +75,19 @@ static int __init livepatch_mod_init(void)
> >
> >       /* TODO patch->states */
> >
> > -#ifdef KLP_NO_REPLACE
> > -     patch->replace =3D false;
> > -#else
> > -     patch->replace =3D true;
> > +#ifdef KLP_PROVIDES
> > +     patch->provides =3D KLP_PROVIDES;
> > +#endif
> > +#ifdef KLP_OBSOLETES
> > +     patch->obsoletes =3D klp_obsoletes;
> > +     patch->nr_obsoletes =3D ARRAY_SIZE(klp_obsoletes);
> >  #endif
> >
> >       return klp_enable_patch(patch);
>
> [Severity: Medium]
> If klp_enable_patch() fails (e.g., due to patch incompatibility or early
> -ENODEV) and returns an error code, does this direct return bypass the
> err_free_objs cleanup path below?
>
> The primary structures (patch, objs, and funcs) are allocated with kzallo=
c()
> earlier in livepatch_mod_init(). Because the core livepatch error path in=
side
> klp_enable_patch() treats these structures as statically provided by the =
module,
> it will not kfree() them upon failure.
>
> Does this code permanently leak the patch, objs, and funcs structures? Wo=
uld it
> be better to save the return status and goto err_free_objs on failure?

Good catch.
It seems to be a pre-existing bug, not introduced by this series.
It could be fixed by the following change:

- return klp_enable_patch(patch);
+ ret =3D klp_enable_patch(patch);
+ if (ret)
+     goto err_free_objs;
+
+ return 0;

--=20
Regards
Yafang
