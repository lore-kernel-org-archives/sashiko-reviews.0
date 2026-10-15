Received: from mail-yw1-f182.google.com (mail-yw1-f182.google.com [209.85.128.182])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3C67042903C
	for <sashiko-reviews@lists.linux.dev>; Thu, 15 Oct 2026 04:09:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.128.182
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1792037364; cv=pass; b=WlFjTKSCUSVyo8fwLkqh9DmMePvwnVqLsPHtf8FhBNJ4eB3bJ8c9Wa1xseop6DPj3X2N+xnpJeSOVsXeamvGLzUgjkiurh4OYoe28aMQ/Iq0VTL2nKMxs78u5sVKupbm3QZtkgh8Lk+rwiq4+8/cuWWgNUrduCPwHtYCdZM37ug=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1792037364; c=relaxed/simple;
	bh=cwcIQjmKeVD7FnLdEzP8n5oUHhca5lVTuP6lLsa8DEY=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=f7DAlgsdgHYsRNO9EXhts4HdDhJVj0E9oPUYBEQfqmRoGeEQ3eqlw5S/K4dx+fBaZm9X00tpUfd1ome6iGTh89hLPR+Joo+q/+7i/Rn8smuXwBttdSiEN5EnUDQ84hc7eJPK9FHqOSscXZmi2YwXKiaVMTOzrAtAstDdWPYaHDE=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=RMphZker; arc=pass smtp.client-ip=209.85.128.182
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="RMphZker"
Received: by mail-yw1-f182.google.com with SMTP id 00721157ae682-8b05bf699easo39057157b3.2
        for <sashiko-reviews@lists.linux.dev>; Wed, 14 Oct 2026 21:09:20 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1792037360; cv=none;
        d=google.com; s=arc-20260327;
        b=MGL28MRjl7CqyANgsyRT4PYtNv1Un02Xo9tDX3zFnBAKr1+a9ld7ixQvKl208g5HA6
         m0G6ebsPHbM4trybv+dhHxobePLf+HMXwGy/U3BgnICH+RFVPfuLaHVO4m92yDe3QnJi
         t74wNNA9I1MbfSZfFzZxTeBpXWE4Q3Pyj5wzKzV6diOrWh6nZUCfdo7KPVIDtZnYWnYh
         fSVL3ejZU5qktdA6nXUSpfOnzmBMOJVbSflecc2mLZB7akoLKVIQtOJfxsLo4ToyV0id
         7sr/RR18pZkjueTkT412ED1SeskPDXsMnYbatrEOQbbCdu1aRn+/QPZvRnfzcpoBE//Y
         WiOg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=Z0RARrI6Xkn31Iauz6QebFLJV9EzpgSJiNuHo75FS8w=;
        fh=8s/m3WFbgYWSrFq8O6qnuwJh8MouRhxqinKYkPkfiw0=;
        b=Yju+tod0o34c5PgqbFcQTZiCeKyPUC+I6aIkTsKSpogg6JmujsQFVdzbeKBecrsc8x
         F5UNDaJU/SKNa2cEkyAWkureYiYkSjUzhZwHCfXLuR0HF5DGSuRNOqYT+0pTiSXWR7fU
         u/a60ZuO5Hntly9coBlmfmwCF7DuPThCbSHSnaQ99c0NZSsGrImOhbPfhBLbZTZ0XAsF
         dxWk3/wgwn05ASU5SEh7aRUkJ+eCfvsbkjfivBIneVXDu5NVgU7TgsZ4Op41l3UbFulW
         UOujCe+qQOUXfbOf1b+zRTbGgHRDfv1M76K0lOAUvqW9Qrnyhmx2TDeoe5i0I6y2daX5
         q43Q==;
        darn=lists.linux.dev
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1792037360; x=1792642160; darn=lists.linux.dev;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=Z0RARrI6Xkn31Iauz6QebFLJV9EzpgSJiNuHo75FS8w=;
        b=RMphZkerTVPC0QMF1jsljCRXaIBMlLKBCqoJn6CxYHvCc+dsgHROhJRNsAEgmonz2A
         at3EDvR5CiPll8Bpb7jWw5C3Y06KayENpJoleo6Df4Dixy8b9+tUgQGwFVjVpt15mGig
         JJC/VyhrTxGrzZEBAytDPREE2qOu5xW42DR5/vP26mNd9b/oKeeklA9edRRAPmZjGXQC
         s8ixsSsC8b3GZbdezec8SwFvudDgJ554mN62r727Dbe0DDwR7TZIK5D64rsdhSMHsjst
         reTnbLH0x8FPF08Yazw73BRCtfhasDs90KWSUzr6ui03G/Tn7ttF7QNfvCQvFCejMVYj
         kv2w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792037360; x=1792642160;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=Z0RARrI6Xkn31Iauz6QebFLJV9EzpgSJiNuHo75FS8w=;
        b=ww4gSiipVwKozUgsHe0lgZLVByH1aEriPd9JzYmCsX44nN7a8IC2Nr8pPO5NQ612fR
         cHMoH5foVDHLRTqhcWcoCtI6lYib3nA9xZegfgrDhgVLa9oQeO23rr+zPFtlHZUBEY8z
         ikwc6cXQwvCtp3PgBMmf4GeeIyAbV5hRoSDu6qR4zJYXBTKj9cTYwUck3mD6N2w4bzpw
         E0sKnLrl6mKH+mMwkUaTGgzseLxYB9/BqcsGMUd13k+DL0GvZ/Xo/oek9QqT4HGSYJ1F
         q9JYA0zwCuyBesKK7RhZgR50h9e54JK9SHfNS6OdQXpcyC+tny6NAKav7xje39G+ccvE
         wQow==
X-Gm-Message-State: AFq9FYIMiBgGW8p/QraiUf0YbRFj4RTJrsBM8dJ3BmsFVC0BL216Ih7V
	m1UNzNtFqNbujeWpldSoywXDAlBzyKzvl+1LLNHqilStSguWyJSHB6+ZiDuoQG57E6zelyt5O8q
	aGHzh0nBKdxkdHFGbta18kBIgNl4wI7ck6WcL
X-Gm-Gg: AYBFou0DhfEctHcEnCqzeAnHvkBfNpKb8GDUkpIvq0pGhQLal2wbR4ElZH00gJN7/ES
	ZCN1JpDXRkzutbZzdPti4dQDafpb95pI18yQb5RR57XvqCaaWtd64IfxfOoSNiCSjeOphtMxlf0
	p7YwFlF/ttQ8dqnjo1fHS1ID+FAnrXV1dsVw8CI2ONepeJETR1APeeSSO1wD3Te91B2WrHsFvqM
	J8K0lAioXokTG85rWgPAly7mTEFfPxRX+B9YasNOpM1TRLnx/OLxA4XwX9Ph84lL3vtMPucqMcl
	0PX4A6vOmDxDUyoPWKNVpCyq2MP4NHiyK+Fy/QVpjlX1Fa4+dWIl5u02NQ==
X-Received: by 2002:a05:690c:ec3:b0:8ab:36db:e2fc with SMTP id
 00721157ae682-8b07ee7527bmr57485067b3.58.1792037359820; Wed, 14 Oct 2026
 21:09:19 -0700 (PDT)
Precedence: bulk
X-Mailing-List: sashiko-reviews@lists.linux.dev
List-Id: <sashiko-reviews.lists.linux.dev>
List-Subscribe: <mailto:sashiko-reviews+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:sashiko-reviews+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20261015035118.9495-1-prasanth.padarthi10@gmail.com> <sashiko-outbox-172228@kernel.org>
In-Reply-To: <sashiko-outbox-172228@kernel.org>
From: Prasanth <prasanth.padarthi10@gmail.com>
Date: Thu, 15 Oct 2026 09:39:08 +0530
X-Gm-Features: AclHuK85ar3Quea9pPbexRyYHc-KVCFcZrOcG-WitctjclERdx06hBQK6rhJ0KQ
Message-ID: <CAMFFDGgxiTMd01iU5JJebvTLBF9ku1F9Zq16LV+gYyqn+tBVmQ@mail.gmail.com>
Subject: Re: [RFC PATCH] pinctrl: aspeed: Handle GPIOZ6 pass-through strap on
 GPIO requests
To: sashiko-reviews@lists.linux.dev
Cc: linux-gpio@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Thanks for the review. The shared SCU51C[9] control and SCU510[28]
rejection are known limitations called out in this RFC. I agree that
the post-mux error paths also require attention.

The hardware result establishes that clearing SCU51C[9] permits
ordinary GPIO power control on B650D4U; it does not establish that
this callback implementation is suitable across AST2600 platforms. I
will investigate coordinated handling of the shared strap and per-pair
mux state before proposing a revision.

On Thu, Oct 15, 2026 at 9:31=E2=80=AFAM <sashiko-bot@kernel.org> wrote:
>
> Thank you for your contribution! Sashiko AI review found 3 potential issu=
e(s) to consider:
> - [High] pinctrl: aspeed: clobbering shared SCU51C[9] strap bit breaks pa=
ss-through
> - [High] pinctrl: aspeed: unconditionally rejecting GPIO requests based o=
n SCU510[28]
> - [Medium] pinctrl: aspeed: missing hardware mux rollback on error path
> --
>
> commit fc751bac2dfdee809f65ba4da118ede6fdbe6aaf
> Author: Prasanth Kumar Padarthi <prasanth.padarthi10@gmail.com>
>
> pinctrl: aspeed: Handle GPIOZ6 pass-through strap on GPIO requests
>
> This commit introduces an AST2600-specific GPIO request callback to handl=
e
> the GPIOZ6 pass-through strap in SCU51C[9] for GPIOP0-P5. It clears this
> shared strap bit to allow host power control on boards like the B650D4U,
> while also explicitly rejecting requests when SCU510[28] is set.
>
> > diff --git a/drivers/pinctrl/aspeed/pinctrl-aspeed-g6.c b/drivers/pinct=
rl/aspeed/pinctrl-aspeed-g6.c
> > index 85d6640ff4c4e..6e58feb48bf59 100644
> > --- a/drivers/pinctrl/aspeed/pinctrl-aspeed-g6.c
> > +++ b/drivers/pinctrl/aspeed/pinctrl-aspeed-g6.c
>
> [ ... ]
>
> > @@ -2743,12 +2744,56 @@ static struct aspeed_pinctrl_data aspeed_g6_pin=
ctrl_data =3D {
> > +static int aspeed_g6_gpio_request_enable(struct pinctrl_dev *pctldev,
> > +                                      struct pinctrl_gpio_range *range=
,
> > +                                      unsigned int offset)
> > +{
> > +     struct aspeed_pinctrl_data *pdata =3D pinctrl_dev_get_drvdata(pct=
ldev);
> > +     struct regmap *scu =3D pdata->pinmux.maps[ASPEED_IP_SCU];
> > +     unsigned int strap2, strap3;
> > +     int ret;
> > +
> > +     if (offset < AB22 || offset > AB23)
> > +             return aspeed_gpio_request_enable(pctldev, range, offset)=
;
> > +
> > +     ret =3D regmap_read(scu, SCU510, &strap2);
> > +     if (ret)
> > +             return ret;
> > +     if (strap2 & BIT(28))
> > +             return -EOPNOTSUPP;
>
> [Severity: High]
> Does this unconditionally reject standard GPIO requests based on an unhan=
dled
> strap condition?
>
> Systems where the SCU510[28] strap is set will no longer be able to reque=
st
> GPIOP0-P5 as standard GPIOs. Any standard GPIO consumer on such hardware =
will
> fail, breaking backwards compatibility.
>
> > +
> > +     ret =3D aspeed_gpio_request_enable(pctldev, range, offset);
> > +     if (ret)
> > +             return ret;
> > +
> > +     /* In dedicated-strap mode, SCU51C[9] does not enable pass-throug=
h. */
> > +     if (strap2 & BIT(30))
> > +             return 0;
> > +
> > +     ret =3D regmap_update_bits(scu, SCU51C, BIT(9), 0);
>
> [Severity: High]
> Does this clear a shared hardware enable bit for all three pairs without
> refcounting?
>
> The SCU51C[9] bit globally controls the pass-through feature for three
> distinct pin pairs (GPIOP0/P1, GPIOP2/P3, and GPIOP4/P5). Modifying it
> unconditionally for a single pin request might destructively clobber
> concurrent pass-through usage for the other unconnected pins.
>
> > +     if (ret)
> > +             return ret;
>
> [Severity: Medium]
> If regmap_update_bits() fails here, does this return an error without
> unwinding the active pinmux modification made earlier by
> aspeed_gpio_request_enable()?
>
> This could leave the pin's hardware multiplexer configured for GPIO, whil=
e
> the pinctrl subsystem considers the request failed and the pin unreserved=
,
> creating a state mismatch between hardware and software.
>
> > +     ret =3D regmap_read(scu, SCU51C, &strap3);
> > +     if (ret)
> > +             return ret;
>
> [Severity: Medium]
> Similarly, if this regmap_read() fails, does this also leak the hardware =
mux
> state?
>
> > +     if (strap3 & BIT(9))
> > +             return -EPERM;
>
> [Severity: Medium]
> Could this error path also miss unwinding the hardware mux state from
> aspeed_gpio_request_enable()?
>
> > +
> > +     return 0;
> > +}
> > +
> >  static const struct pinmux_ops aspeed_g6_pinmux_ops =3D {
> >       .get_functions_count =3D aspeed_pinmux_get_fn_count,
> >       .get_function_name =3D aspeed_pinmux_get_fn_name,
> >       .get_function_groups =3D aspeed_pinmux_get_fn_groups,
> >       .set_mux =3D aspeed_pinmux_set_mux,
> > -     .gpio_request_enable =3D aspeed_gpio_request_enable,
> > +     .gpio_request_enable =3D aspeed_g6_gpio_request_enable,
>
> [Severity: High]
> Since this structure lacks a .gpio_disable_free callback, is there any
> mechanism to ensure the shared strap modification is reversed upon releas=
e?
>
> Without it, the SCU51C[9] bit is never restored when the GPIO is freed,
> which could cause a permanent system-wide functional loss for pass-throug=
h
> features until a reboot.
>
> >       .strict =3D true,
> >  };
>
> --
> Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20261015035118.94=
95-1-prasanth.padarthi10@gmail.com?part=3D1
