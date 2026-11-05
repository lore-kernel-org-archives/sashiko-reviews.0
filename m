Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.128.178
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1793898602;
	b=yJC92CzoNWCgpDooRyFUJsnBpSpVAqYzx8nehTiFDywbfAzyMyUWZ7uYFqdDt+Pk/HAf
	 /9hsgP6XwuroX3wVkyzAo661iTfTljo/2aZjbHZDo4jXAyX0sI2vVeKBr44qgQi9UqWCJ
	 K3MkTFyQj4GO38ptwL9D2EZy91OqrIWF0iQm6fWSy+64YO/Lh+nohyhgRM2wPGa3j9tDm
	 PgZY7M7zYv1FYId2OtoQkf760qG+w4wkXQcyeX7YUzZQmAODYrlfjUI2XI3JXxSTvqwFp
	 G2c7hHAeX25+YyXipeGTeiXkTVm/0xW2cW3PLWVzdwQe7O/qyst0KZaRcl6agpni0jg==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793898602;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:MIME-Version:References:
	 In-Reply-To:From:Date:X-Gm-Features:Message-ID:Subject:To:Cc:
	 Content-Type:Content-Transfer-Encoding;
	bh=ifFEYR9TPUFV/LjRD8ZLryB8zv3m5cq4xfOUyH46ME4=;
	b=sBDrmnb/tlWWnIAXLmuQSMAYEIO78XZwerpwvYfxEcEfc0UswNqQuaQ1ywHXJ4iodLsQ
	 TG5CzkvqQ3v9g/g0qE3Rrprkv+12NvZgXWV6Grp6bMq1PHq29nVWsSBz1I/d/Pm3ymlxQ
	 qHJ4LJlol4/nD3Zmdgkk2xDJlqLurIjxef6TbQYOU9gKsvKpyMHTaG43Kv3ZFUui+3ULo
	 IItsDvtrE35xcMZKlbRMo9+2eyRMaRBqVz3vE4UTpNupcDrggS9dJVRNfWL7+rDrTQdmI
	 IhQF1Rkl14it/lBweeLK0l1rW4uBZu3b7TA3rluq7gyZ9vaBnBytL0blj/oPtkJRBLg==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=iVCtRbWE;
	arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.128.178
Received: from mail-yw1-f178.google.com (mail-yw1-f178.google.com [209.85.128.178])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 27707606A328
	for <sashiko-reviews@lists.linux.dev>; Thu,  5 Nov 2026 17:10:02 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 27707606A328
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=iVCtRbWE
Received: by mail-yw1-f178.google.com with SMTP id 00721157ae682-8b12b1ee403so16018037b3.2
        for <sashiko-reviews@lists.linux.dev>; Thu, 05 Nov 2026 09:10:01 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1793898601; cv=none;
        d=google.com; s=arc-20260327;
        b=ACHVQMFicgT8dp6otnfVFZQreJ8uvtVt0ntd0DnracgCJWjWV+zUq19lTNvvPMvSWg
         aYpFDLCIgS3zFLN6TN6QhIVp1WhOwRWEYn5JrlqeUFGX4TM7PARpcyvZBP0VtD2vkaQZ
         tzT2h2dVrz8s09d1wbPiUSZjX6JqAP9W8nOI5UrtyV3/LOSd+Tb4vW3XXjC6eHIZnZO0
         HOrViF2Tn90IvLqDS4XslRsZDhZmVUCLAZ35JwP5042Fijv9BreNkpE8bFWbi8PPcik1
         XFRNnxOXqfDsTAE7fBmTvqdhHNyRPpiHUcNr4o/Vbo2uzlDv4EMtW8NfROXcpgcG9Gqy
         diwQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=ifFEYR9TPUFV/LjRD8ZLryB8zv3m5cq4xfOUyH46ME4=;
        fh=8s/m3WFbgYWSrFq8O6qnuwJh8MouRhxqinKYkPkfiw0=;
        b=X2gwsQRRMJZSn2Sqhd5Cah3l2km7zdLMEj24oOdfIewvnIwUlka2/pLfBAIOsFGNtN
         RFAftUbo64LQNQ6KDDc79VZ3N5FOVJ7Kz+Sr2u/fXj9ixbnnhlb7k1AaGl9vjB50cnXj
         kY7g5IthW1CVASjtTBlGZX2XDrFFfbgfKj19f2njKV9lY3t/veaKaeme3LAPoGfBkW7F
         bD7LiV1gvJmAYciQlboz+fR6mzzSVnsFD0OiwDJJs2CE3bSrGx9nSSXMg5uSRgFNGcjg
         uFbmMpoSxvJRA0Ddhg3bwPMhByJ9RJr0g47z3OZ9IqNC+DrVLTRnaq4emwSy1Syv1vsC
         7UwQ==;
        darn=lists.linux.dev
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1793898601; x=1794503401; darn=lists.linux.dev;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=ifFEYR9TPUFV/LjRD8ZLryB8zv3m5cq4xfOUyH46ME4=;
        b=iVCtRbWEa55xlUXh0XpH9Ds2cyb67duKSyiGZ4X4QjWaamdzqvMz8p3mlOJFhMDoit
         L5eWOSJNFZRmEaRSZphfgaV7zbw4vQHqhUCIzkBL1uY1JQl2MvfD4/g6cTsUH+AxGk+E
         7cvwUWOalow1JohqNmHZ06PQbIYr3uhHYruPQYF+drPYanrIkn/umCKACSaphH3ni5PK
         lHzUtiqbB+kMvNa1+B7r1ORaVUq84RW6O0RTzwIWn7XnBc28DEgCrhBWEqDW4dTFL9uD
         ODkAnegZUZeT7UT1UQ4BJc/H+bUyf/VNRrx1zLuaAenqMl27R9xBEdFTMrqlq4ZTXzGM
         GT4w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793898601; x=1794503401;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=ifFEYR9TPUFV/LjRD8ZLryB8zv3m5cq4xfOUyH46ME4=;
        b=X0rAWdiU08FbEw3DVYI63PGc7vy/nsxgywcowr/CfgwA4mApD7BYNes/uRODJWFa9L
         2Fk9h0d55Yp4CrYwzHy+wnFDcc4rpLzgMZgXg1pfPyXel6pXFejMSE+OyMxmRWXEcdOu
         L9ZlINvo4wPsw4UB83VKYqnBdEXuBFP2O60V6hZ3pIQn3M6LRemTjn1inCkinv1M5TEz
         hBPngla3Zy6asNw/REnxYP8lH9B6z+zxNI9AWFKIEKWYaSSDCxxkYTERahs/SCW+tq8n
         ONQi0YHt5KbdSVRwmYuXU2VqHF4WD1KHmnp7t9bs+OKdBA6Vij2vXh54BQXVnuwqRVRH
         F8zw==
X-Gm-Message-State: APuU4Z/4WVgGcSiEyyb2TK3J8DZhX9BZLhWATem/YlFIjuHNmjaKyLZ9
	K12M82xglu3mVzUc/CyKNwsbrYPKfP5HnldxqZAMFuOpc58wJ9VVxiapjfdKLiIoluR3aHSbcVp
	cSFhou9U6R9vj4XxmTYYBxY/aARv8l5NxnO0m
X-Gm-Gg: AYBFou1CMfkuGT+a0BLq7fivFTHSKFKaHwBNAoPA6EX6X+GV9edDeDK4R1Ocbs54hRA
	8Lvir0Xo0SZ80RSFAO+dWw6xYno2hlrOzNqTYw+aY19MiWTZDW9kAFaLzDtVpRFcBMvINywgcgn
	bqUDDnnEmT7sN5fKWdDV/W60mjTdcTjzkt2l6dPNUVc1C+ZguftojWsZyIa7U6Y3VfXQ+w7gYaU
	KbXnYDAalLNI6IJ6GlE/MQ6z5uSLB4vuuN1SQApnkUfuMcWfSRsS4RGZx5k9VivnveobqIOB74v
	Y8Hd+uWS9desjO4eVTEn9zhmhX8yHcpgtAHr0BYbswGGYIMURJOp8VZ1ulli4Lo6BclGXia45Rn
	VSMiF+g2mV1FJA7LOkvPNh1LxsfQxi3ag7AuNdDU=
X-Received: by 2002:a05:690c:113:b0:8b3:2eb4:1429 with SMTP id
 00721157ae682-8b32eb41a88mr12568607b3.65.1793898601098; Thu, 05 Nov 2026
 09:10:01 -0800 (PST)
X-Mailing-List: sashiko-reviews@lists.linux.dev
List-Id: <sashiko-reviews.lists.linux.dev>
List-Post: <mailto:sashiko-reviews@lists.linux.dev>
List-Help: <mailto:sashiko-reviews+help@lists.linux.dev>
List-Subscribe: <mailto:sashiko-reviews+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:sashiko-reviews+unsubscribe@lists.linux.dev>
List-Owner: <mailto:sashiko-reviews+owner@lists.linux.dev>
Precedence: list
MIME-Version: 1.0
References: <20261022024314.48623-1-prasanth.padarthi10@gmail.com>
 <20261105152348.8567-1-prasanth.padarthi10@gmail.com> <sashiko-outbox-199315@kernel.org>
In-Reply-To: <sashiko-outbox-199315@kernel.org>
From: Prasanth <prasanth.padarthi10@gmail.com>
Date: Thu, 5 Nov 2026 22:39:46 +0530
X-Gm-Features: AclHuK9EMZYoNclpt7vGM08eNe4WIB8G2Jwgu5F5HXqHJo1re962sdUNfsV_OY0
Message-ID: <CAMFFDGiM2ExudSegF0X6sQN+AraYnorMHw9R8YvTBXRbKGNCuQ@mail.gmail.com>
Subject: Re: [PATCH v3] pinctrl: aspeed: Hand over global GPIOP passthrough to
 local mux controls
To: sashiko-reviews@lists.linux.dev
Cc: linux-gpio@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Thanks for the review. I checked the shared probe helper and confirm
that it uses unmanaged pinctrl_register(), while this patch introduces
devm-allocated private data. The unbind lifetime needs to be corrected.

I will address controller cleanup and private-data lifetime in the
next revision.

On Thu, Nov 5, 2026 at 9:03=E2=80=AFPM <sashiko-bot@kernel.org> wrote:
>
> Thank you for your contribution! Sashiko AI review found 1 potential issu=
e(s) to consider:
> - [High] pinctrl: aspeed: use-after-free on unbind in aspeed_g6_pinctrl_p=
robe()
> --
>
> commit 7926ad91b4f1741a83b80da360b9a845357a5376
> Author: Prasanth Kumar Padarthi <prasanth.padarthi10@gmail.com>
>
> pinctrl: aspeed: Hand over global GPIOP passthrough to local mux controls
>
> This commit transfers global GPIOP0-P5 passthrough selections in SCU510 a=
nd
> SCU51C to per-pin mux controls in SCU4BC during probe, and blocks GPIO an=
d
> mux requests on GPIOP0-P5 if the handover fails.
>
> > diff --git a/drivers/pinctrl/aspeed/pinctrl-aspeed-g6.c b/drivers/pinct=
rl/aspeed/pinctrl-aspeed-g6.c
> > index 85d6640ff4c4e..be22a918420df 100644
> > --- a/drivers/pinctrl/aspeed/pinctrl-aspeed-g6.c
> > +++ b/drivers/pinctrl/aspeed/pinctrl-aspeed-g6.c
> [ ... ]
> > @@ -2778,15 +2827,103 @@ static const struct pinctrl_desc aspeed_g6_pin=
ctrl_desc =3D {
> [ ... ]
> >  static int aspeed_g6_pinctrl_probe(struct platform_device *pdev)
> >  {
> > -     int i;
> > +     struct aspeed_g6_probe_data *g6;
> > +     struct regmap *scu;
> > +     int i, ret;
> > +
> > +     if (!pdev->dev.parent)
> > +             return -ENODEV;
> > +     scu =3D syscon_node_to_regmap(pdev->dev.parent->of_node);
> > +     if (IS_ERR(scu))
> > +             return dev_err_probe(&pdev->dev, PTR_ERR(scu),
> > +                                  "No SCU regmap for THRU handover\n")=
;
> > +
> > +     g6 =3D devm_kzalloc(&pdev->dev, sizeof(*g6), GFP_KERNEL);
> > +     if (!g6)
> > +             return -ENOMEM;
> > +     memcpy(&g6->pdata, &aspeed_g6_pinctrl_data, sizeof(g6->pdata));
> > +
> > +     ret =3D aspeed_g6_thru_handover(scu);
> > +     if (ret =3D=3D -EPROBE_DEFER)
> > +             return ret;
> > +     if (ret) {
> > +             g6->thru_error =3D ret;
> > +             dev_warn(&pdev->dev,
> > +                      "THRU handover failed (%d); GPIOP0-P5 mux reques=
ts blocked\n",
> > +                      ret);
> > +     }
> >
> >       for (i =3D 0; i < ARRAY_SIZE(aspeed_g6_pins); i++)
> >               aspeed_g6_pins[i].number =3D i;
> >
> >       return aspeed_pinctrl_probe(pdev, &aspeed_g6_pinctrl_desc,
> > -                     &aspeed_g6_pinctrl_data);
> > +                     &g6->pdata);
>
> [Severity: High]
> Can this cause a use-after-free of g6 if the device is unbound?
>
> In aspeed_g6_pinctrl_probe(), g6 is allocated with devm_kzalloc() and
> &g6->pdata is passed to aspeed_pinctrl_probe(). However,
> drivers/pinctrl/aspeed/pinctrl-aspeed.c:aspeed_pinctrl_probe() registers =
the
> controller with the unmanaged pinctrl_register() helper:
>
> drivers/pinctrl/aspeed/pinctrl-aspeed.c:aspeed_pinctrl_probe() {
>         ...
>         pctl =3D pinctrl_register(pdesc, &pdev->dev, pdata);
>         ...
> }
>
> Previously, aspeed_g6_pinctrl_probe() passed the static
> aspeed_g6_pinctrl_data structure, which remained valid for the lifetime o=
f
> the kernel. Because aspeed_g6_pinctrl_driver does not define a .remove
> callback to call pinctrl_unregister() and does not set .suppress_bind_att=
rs,
> unbinding the platform device via sysfs frees g6 via devres while the
> pinctrl_dev remains registered with driver_data pointing to &g6->pdata.
>
> Subsequent calls to aspeed_g6_set_mux(), aspeed_g6_gpio_request_enable(),
> other pinctrl callbacks, or pinctrl debugfs entries will then dereference=
 the
> freed g6 structure.
>
> --
> Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20261105152348.85=
67-1-prasanth.padarthi10@gmail.com?part=3D1
