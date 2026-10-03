Received: from mail-wr2-f34.google.com (mail-wr2-f34.google.com [74.125.225.98])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7A429309EFC
	for <sashiko-reviews@lists.linux.dev>; Sat,  3 Oct 2026 02:05:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=74.125.225.98
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790993110; cv=pass; b=Q6p0mxEKdemskDo7kHdqPoyv6a4a/9ofTBA2RM6MJVyb2F3AWw1SMUmwYMUyTevzNDNlV64soKVy3+0vROVaTSqJjyQaZX3SN4/U2noNnC9ObpnUBtDB73EiGQo5ACaBiTPCU2eyyRw218+KoRcSqYmeoHqFo0HjeEPCMGrI5Sw=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790993110; c=relaxed/simple;
	bh=qaonKjcNM5SnG3XPM5ZaN1TL+Neq6W6d2iqmRt1cKI8=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=lJDh0K0sLmRr8jbzwnlkDgxh9AaZ0Ap13cQP2Oq3829hL46U2Cg7G7TenddGW8cLISmf0Z7oj3/n7XXguqOYprV///gm/7W3kUfROFnBhAEQRb4NwBotMkHw715qS/1VDkj4RsKrEe4xXjj9Xo6VlMpVxUDahj6No1W0Giz9VRU=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nahida.im; spf=pass smtp.mailfrom=nahida.im; dkim=pass (2048-bit key) header.d=nahida.im header.i=@nahida.im header.b=i7a4Dr3d; arc=pass smtp.client-ip=74.125.225.98
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nahida.im
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=nahida.im
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=nahida.im header.i=@nahida.im header.b="i7a4Dr3d"
Received: by mail-wr2-f34.google.com with SMTP id ffacd0b85a97d-48b01c4f4daso29678f8f.1
        for <sashiko-reviews@lists.linux.dev>; Fri, 02 Oct 2026 19:05:08 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1790993106; cv=none;
        d=google.com; s=arc-20260327;
        b=oAFhiGYi3PE6M8fs3D9wvtFKieHnzs/k9ZkKlzaXF+3ki4z85VMMMxHiSNb3QpSY2+
         PMCWV1/NlkiZjaLv7rSO8nKMuQmyA6lKvSG40Y/i1/4GzhBsDrHmZpsOJDCSkm0qXGo4
         arRHbSZ231raIQoOWLxXG0QnnDNlyyTpPFc1lDe271FJnkDOW+Ms0l9yJb/9v7UKVfcP
         Yw8rzwRNveL5RG10QjNFHTdS+/X/GUQL4FmgL6/UHammFic9j5CEPdiaMWxDlMMyiUh+
         WqP1BXrtkkCcwOOBP4w8xQ+07B2q50oq5qmrzL3iAlMgL0532a4TSGDSXueKm7jxEggJ
         n9gA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=t+8QgWjahKnuvKzRyDtBXHsZJiJkScJBHz23qDo+hDM=;
        fh=bN3WHTlzXcVIr2RkgMpk3NXK/DwXOefqRaFpMbeYf7s=;
        b=L/DJo9NJCoS0jTMk+bV8UNFti/Odfl3Bd035pvHBY7UCICm1snAX1F+KkvlnnfgqOP
         a3NF92G6IzmHY4q89pLE/0OVJaF/c06iJ9MQ17o5J+J57xOE44EUOXpvLypue5RXe9GE
         0YeM+6+VIuc4+lScVVmG2ztF90W6hTFGwd6Wp+bzcWRzseN5R2xYS+j4gaBmvM0twpA5
         jHf4QLY5rniob/anje2kaVdrlR39cqlAaRHwKvReuS6xqC7In1N/Jn/QTcbGABEzDIBr
         xP89/cADRLE9ayOktBOcAmI6/cmua1A6weKgzUreqoi67K9C6xgTLHTAC/zhxqOSIW6i
         Xhhg==;
        darn=lists.linux.dev
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=nahida.im; s=nahida; t=1790993106; x=1791597906; darn=lists.linux.dev;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=t+8QgWjahKnuvKzRyDtBXHsZJiJkScJBHz23qDo+hDM=;
        b=i7a4Dr3dzircVH4dW1Uktw43H46M91X3pfmhsXln3iZz1JKzpd65ToFZk2HW0Jm15m
         J+Omfd4H0KpqsmFv3Ji11Y384Jbyz2bURZ/0b27+MTLLOX9Io+Z5jn05M+EefntY6xm2
         /tW24LtdXscMv3vi+bidO5mmEvB7B1WxloMreS0wIf2Mp7q9P8BZ8HES4JSi3seVLzri
         bPNnArm2w+HJFHh2ToEAdTwTbIBtXI3Az7rE9tofBohc6bTadAg1v6ztrdlZ9sQLw5km
         RVvL856C2sFQroNFUj2viCGddol6MQ54c1wK10ouxSOMvE0NntFTzrybv474QOmqCLFJ
         TLSg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790993106; x=1791597906;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=t+8QgWjahKnuvKzRyDtBXHsZJiJkScJBHz23qDo+hDM=;
        b=k2mKJFsTweAoAhZHfrK/YjMdZodrNCE2du2pacQxy5CHqPuE1atG/YLX4q8sJ32j+i
         mHF/jcFXjrLiQ3DZAHiURAG4/RHuXbYVAAPv/wuh9lCKn3/TARuORGk837uh5a0a2bCB
         X2eDMS5fmezXatkKy9F/I0Cw2Xw6DrUziN5aX9obr8EyP5HQihdfB9T66XWh93vZuX8i
         iKRbA7P39J8C0jv9A76fBpPoTncqkdjlrZysCNJfAlm2KExcglf6iilQsnnkCw8SPrbZ
         mJCWgqpHaysxJBNxQZTIObMK0u8WY2QgJtm5DG7JbFekK8X2c6ILeR1irxMyAMRy7U9A
         VqLQ==
X-Gm-Message-State: AFq9FYJTNXbvrRR5AKWlR/1US2LzonWKgWHkMEbYwg50RLebW3DBqIHi
	gDmWnf8qVzgO+Ik9TWFry4AOrkEUC1PegrwUBUqdAEFZMPS2bLxqbdDFjx2c0UPRQ+dpDcBwEm5
	tui3xdB1vnlBeXCY+GFeisqf2/11t97Q8t2+0UXb4rf0v6TrCF1Bc7VsA5PwY/g==
X-Gm-Gg: AYBFou3M3tdxsUXfVyGtx9qk4LEewPtpB4mP8z9PtDZLPXgLWxxLrALMc3uHsBrg3+p
	AkghbVVkAe5w6uV7HOV92naBC/qCoVvPpRN+GAQBDtXRbaZretV0VkFSlfCt/87sc2XWe5K1n2L
	j1Wrm1JoFmVXxC6w/NLN9J8e9x2IiP4vPTDHARQWXvOPqH0V+FVtP6IVavL17VpNvYFIxY7ym5j
	PWvbYr2G3J3lMUZpPxOs/P66aIiqyuDW5gGlJGqDU2BApUs+Eek/QEuKXT9X9PbnTqIo2hEvdDb
	yR/IAHiRZhv5P5JaW9ptS4K/Fy++1YhEiSitjtruw8VKquCVKLjMtzeM+jKttcAZc6L1fQ+EMh2
	x1x0uDSC4SCv+6Im/Y+8xFhUS
X-Received: by 2002:adf:f304:0:b0:48a:fbf7:15b3 with SMTP id
 ffacd0b85a97d-48b12747253mr6029639f8f.54.1790993106650; Fri, 02 Oct 2026
 19:05:06 -0700 (PDT)
Precedence: bulk
X-Mailing-List: sashiko-reviews@lists.linux.dev
List-Id: <sashiko-reviews.lists.linux.dev>
List-Subscribe: <mailto:sashiko-reviews+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:sashiko-reviews+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20261002203140.121165-1-me@nahida.im> <20261002222021.149450-1-me@nahida.im>
 <20261003013405.9EF9B1F00893@smtp.kernel.org>
In-Reply-To: <20261003013405.9EF9B1F00893@smtp.kernel.org>
From: =?UTF-8?B?57qz6KW/5aayIMK3IE5haGlkYQ==?= <me@nahida.im>
Date: Sat, 3 Oct 2026 10:04:55 +0800
X-Gm-Features: AclHuK_dQjIHK3_7hoLlUhTHoLKkninCH-PAncgkVstKtoNod_DO7nt3bkfbd6s
Message-ID: <CAEEzyciPRcDWJ9pgaJBx9peeV16p9t=wx4bdy9ZyKyjgMZ+NKQ@mail.gmail.com>
Subject: Re: [PATCH v2] drm/panic: allow overriding panic QR code URL
To: sashiko-reviews@lists.linux.dev
Cc: dri-devel@lists.freedesktop.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

OK I'll fix it in v3

<sashiko-bot@kernel.org> =E4=BA=8E2026=E5=B9=B410=E6=9C=883=E6=97=A5=E5=91=
=A8=E5=85=AD 09:34=E5=86=99=E9=81=93=EF=BC=9A
>
> Thank you for your contribution! Sashiko AI review found 1 potential issu=
e(s) to consider:
> - [Medium] drm/panic: OOB read due to missing null-termination on panic_q=
r_url
> --
>
> commit 4020ffafa052ada60c700fa2d64b78e9eb01e839
> Author: =E7=BA=B3=E8=A5=BF=E5=A6=B2 =C2=B7 Nahida <me@nahida.im>
>
> drm/panic: allow overriding panic QR code URL
>
> This patch adds a module parameter to override the DRM panic QR code base=
 URL
> at boot or module load time. It exposes a getter function for the DRM pan=
ic
> helper to retrieve and format the configured URL when generating the QR c=
ode.
>
> > diff --git a/drivers/gpu/drm/drm_panic.c b/drivers/gpu/drm/drm_panic.c
> > index 9fe97c4eda6c8..463544f71c537 100644
> > --- a/drivers/gpu/drm/drm_panic.c
> > +++ b/drivers/gpu/drm/drm_panic.c
> [ ... ]
> > @@ -49,6 +49,15 @@ MODULE_LICENSE("GPL");
> >  static uint panic_qr_version =3D CONFIG_DRM_PANIC_SCREEN_QR_VERSION;
> >  module_param(panic_qr_version, uint, 0644);
> >  MODULE_PARM_DESC(panic_qr_version, "maximum version (size) of the QR c=
ode");
> > +static char panic_qr_url[256] =3D CONFIG_DRM_PANIC_SCREEN_QR_CODE_URL;
>
> [Severity: Medium]
> Will this array be null-terminated if CONFIG_DRM_PANIC_SCREEN_QR_CODE_URL=
 is
> exactly 256 bytes or longer?
>
> In C, initializing a fixed-size character array with a string literal of =
equal
> or greater length does not append a null terminator.
>
> [ ... ]
> > diff --git a/drivers/gpu/drm/drm_panic_helper.c b/drivers/gpu/drm/drm_p=
anic_helper.c
> > index 8913c3d22e8d3..b0ea0b4e8edef 100644
> > --- a/drivers/gpu/drm/drm_panic_helper.c
> > +++ b/drivers/gpu/drm/drm_panic_helper.c
> [ ... ]
> > @@ -609,17 +609,20 @@ static void drm_panic_helper_qr_exit(void)
> >       stream.workspace =3D NULL;
> >  }
> >
> > -static int drm_panic_helper_get_qr_code_url(u8 **qr_image, unsigned in=
t qr_version)
> > +static int drm_panic_helper_get_qr_code_url(u8 **qr_image, unsigned in=
t qr_version,
> > +                                         const char *qr_url)
> >  {
> >       struct kmsg_dump_iter iter;
> > -     char url[256];
> > +     char url[512];
> >       size_t kmsg_len, max_kmsg_size;
> >       char *kmsg;
> >       int max_qr_data_size, url_len;
> >
> >       url_len =3D snprintf(url, sizeof(url), "%s?a=3D%s&v=3D%s&z=3D",
> > -                        CONFIG_DRM_PANIC_SCREEN_QR_CODE_URL,
> > -                        utsname()->machine, utsname()->release);
> > +                        qr_url, utsname()->machine, utsname()->release=
);
>
> [Severity: Medium]
> Could this lead to an out-of-bounds memory read during a kernel panic?
>
> If qr_url points to a panic_qr_url array that lacks a null terminator,
> snprintf() will read past the end of the array until it encounters a null
> byte in adjacent memory. This could potentially leak adjacent memory into=
 the
> QR code URL or cause a secondary crash that prevents the panic screen fro=
m
> displaying.
>
> --
> Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20261002222021.14=
9450-1-me@nahida.im?part=3D1
