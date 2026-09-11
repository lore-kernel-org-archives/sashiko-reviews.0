Received: from mail-wr1-f42.google.com (mail-wr1-f42.google.com [209.85.221.42])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 700933C1F5B
	for <sashiko-reviews@lists.linux.dev>; Fri, 11 Sep 2026 11:36:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.221.42
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789126620; cv=pass; b=NvhVmoUH5JIMFdamPQDjcGQmM+61O9il7qLnB8iujJ+Toj0iJwyC4PtMI3NHTpFRH2PKngqKE3O4wuQwpJq0ZyYOODqcaW53ayQ8S9J0ttE7WvI+AVpg3euVr4v8TpEwQElNpbvkc+Y2llaD5rc7Mscy6y1O+CScmwe3Z96AaGY=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789126620; c=relaxed/simple;
	bh=VP4BlcnfUZVr3/+zomIB7ojpIUneSSNJHRIVnHGfdr8=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=Gc15fgy3LuYyw7VveGtOxxW1crmM5eafCr5gricND4PDE/9SdVzIks06RLaXT1//RR6ZkzdZdlDKYhGAE/kWPjejhubnLLIEJ7cBzfV+awQn+W0f8GxuMv38QE0I9UF3dVwaN307qkVl8EsMdXDXcN4uD0D43BXSZYA3JPHOIZc=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=l10L8IHR; arc=pass smtp.client-ip=209.85.221.42
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="l10L8IHR"
Received: by mail-wr1-f42.google.com with SMTP id ffacd0b85a97d-485aca32ab7so154191f8f.1
        for <sashiko-reviews@lists.linux.dev>; Fri, 11 Sep 2026 04:36:58 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1789126616; cv=none;
        d=google.com; s=arc-20260327;
        b=VsYyLvM1nvACl3jciYX/w1gDAAAcHsDbsqfZjXX8V6A8R5+52pnFekDPIWfEzpCT/s
         nTMXvnw0PweNLMhCAwKJ8GV94+PrGaTzhbl5GAYemV9WsDzuUcM8h8R3ML5C3zT9Ex7Z
         aG6gU1KZ9LgW/JyMEjH28c/KYfzJRpunRdeqemk202Jk9gZSz3m6zfl2/v70/YjxOEG/
         FK7wrLXDKpyOmLPGAtB2C20dQsWWr5aLsAlEzIucTbyIrGPEWmmzMefyOs48r6mC2NMw
         bNXxgrjBs6weinJOcRuALD8skC0BDPqG6YhdfwgdhVM1oWDFDL3poBTXhLSKlA2NeV5l
         2YHA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=LIgt75iQmZv2IR1V0VMxqaMEjC44FA+M0gjq3T1j3yE=;
        fh=13L9lns6+9DWzS/kdkWn/v6gGpgaXxlhOFZ5Z8k63ls=;
        b=r22rlBEdT3hOqIIa3K9QaprjVJhP//WXwTeEQiiwqxPNBGcWm4AtL/gXqzeQnCZMnI
         b7moRzRssjoLW22da9i7doQdUaEwA4qL+eI5kBRqS0DJ6qlZTYBphYrFXP8ARaBLiGft
         7LSLjJe3dPdV+5X0MasVFFDW26rmIIxSwA4ubc/OSFwgpW008VAE2TwvQN5z6sHz6OmJ
         vehrpJL/BhrockS96VrO7jG2umLWI4itdiD3GK7CcZkP71/vpQaMumHnXO99YpwIpoEr
         PTyVVcp5H7SUJyD84hRYj1SwEGabhWzDc0rZhJGtKbfO/IM3MNk577yr3qJjQf0huryx
         4Nbw==;
        darn=lists.linux.dev
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1789126616; x=1789731416; darn=lists.linux.dev;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=LIgt75iQmZv2IR1V0VMxqaMEjC44FA+M0gjq3T1j3yE=;
        b=l10L8IHR5HgrZJWG7A8Wp2Zcvkm1VrmgsuD91V4YC8ZxQ+nfJcqZXF2quTDIDKVsRh
         rJ1yVdzdYLpYE1WUQGeAgHFp9WB4R8bsTT/xHuRgFsT/vqUh9MoFo6ktS7RfF7IIq7tn
         0ADUYailbVXFZmiaNapD56vRmULhozqOKQyhUP3lb4qHdECRzNmA0TsXjlsrvFprpMWn
         ue460szE+aE+3LSMGYRqfNp1X0hl/CrlFNrycOOJLU67lehEjRmvLEE7WvDnYeciTGFy
         WCtiEsKhtgx8U0CUURE8JzorsjUpZd0v9PvFJfTAXlmEQGVfQSKoxWv+wQMBFiGXYk/3
         k86g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1789126616; x=1789731416;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=LIgt75iQmZv2IR1V0VMxqaMEjC44FA+M0gjq3T1j3yE=;
        b=CpLeNl90eweB0xT3MYtjoWiZcD1C5iXFlb8yJKbQqq3GcPB/E0WTgzkkydYVIVfzhU
         tQ1Mv0i+xyJ3Z0fkIGJYHAWh/y3zFyiesCBRKJrfReYHwN3ZH/Hu6xJcHp694sL7bWv1
         jNpNCTH2Ey0zHFJj5LXSLqdwZs4eGJQvt8Yt7V23Ky/WImb9dXZlJOkTgDplZzDb67MQ
         gJQz74iAfGRD/6SYOpnwY5duWo5ddXWrITrU0xJrNwoA0H6Dq28PpQwIf6vf4e1j4UTR
         4NcsntIJZKaLieGUVlgvG4f5dwMGC/09MDe5xr5YjqnSloNZSQ1J0laQSebGca2bQ5gL
         mrCg==
X-Gm-Message-State: AFuF++lmeP4inidT57KD5wZyNsDyiWJrOA2XBn1ZC72gBDnO4TR41H7C
	QAqDY5ZaCdfeo0QopSr7CKcjLVVr1Q5IyKecqs1Dfab8UXUBiRSSxOmCUBVXocBqNWW831YRReG
	yEKfa8YzS604vWA6ODRvFGXezNgYSCMTLfU4hnF6jTw==
X-Gm-Gg: AYBFou3FXjoDEXSUSaiOYmQFxBh8txuIjHW+/cQs9XOIUbsS9vJubRfo50g9orqqrTf
	kT1bSQH4ICHwFLpzb71L0zMChBtJrFJf8Iy6pkGaI4BYwxnPGASXu8CANwzGsZqMmJDHnFwKPMU
	uK72CccuYqN+eDt72KCeGLB52hOW84Gqz2NsDbcU+z5+rLJs3daTYP+BEXkjiEqnKHnrfI+/+eh
	vEmg+AQeWl2fCra4xq7wERWotg20I3gJOi1n5GaZHWFzFKm2royHN9F2CS+7sBOcejsuZZ22CaX
	Gom5/+NjI5Iwmm5axJ7d9W7dUyYvZIkbg4eysm7CNHkd6Qn3g3zusviXvoetIK2hJLa+S1t8ci5
	AEWSq+xO+QTJLmKnW9LeKYWo7PkD4PYoWMusW8rzQ9QdjwgUaun5wvVig6o5SNs6JGH9AfKoLSQ
	==
X-Received: by 2002:a05:6000:2311:b0:485:8c16:5ef5 with SMTP id
 ffacd0b85a97d-486eb30a9ffmr4061062f8f.47.1789126616471; Fri, 11 Sep 2026
 04:36:56 -0700 (PDT)
Precedence: bulk
X-Mailing-List: sashiko-reviews@lists.linux.dev
List-Id: <sashiko-reviews.lists.linux.dev>
List-Subscribe: <mailto:sashiko-reviews+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:sashiko-reviews+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20260911111731.3404308-1-prabhakar.mahadev-lad.rj@bp.renesas.com>
 <20260911111731.3404308-2-prabhakar.mahadev-lad.rj@bp.renesas.com> <20260911113217.0178F1F00899@smtp.kernel.org>
In-Reply-To: <20260911113217.0178F1F00899@smtp.kernel.org>
From: "Lad, Prabhakar" <prabhakar.csengg@gmail.com>
Date: Fri, 11 Sep 2026 12:36:29 +0100
X-Gm-Features: AcwNN1WsWnutDhTfem_mFFkR3R6OacHy1RxvsrgccYae_oUqrtA6rSmNdVdNO54
Message-ID: <CA+V-a8vCd7n1BBzoxL6XB6iiB8fyakT-bDgu6cX5GjnpoREzbg@mail.gmail.com>
Subject: Re: [PATCH v5 1/8] watchdog: rzv2h: Drop enabling clocks in the
 restart handler
To: sashiko-reviews@lists.linux.dev
Cc: linux-watchdog@vger.kernel.org, devicetree@vger.kernel.org, 
	wsa+renesas@sang-engineering.com, robh@kernel.org, conor+dt@kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi sashiko,

On Fri, Sep 11, 2026 at 12:32=E2=80=AFPM <sashiko-bot@kernel.org> wrote:
>
> Thank you for your contribution! Sashiko AI review found 1 potential issu=
e(s) to consider:
>
> Pre-existing issues:
> - [High] Unchecked division by zero during probe if the optional 'oscclk'=
 is missing from the device tree.
> --
>
> commit e61522c3f4f781e0b8cf17bd6e22135a7d714358
> Author: Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
>
> watchdog: rzv2h: Drop enabling clocks in the restart handler
>
> The watchdog restart handler runs from do_kernel_restart() with
> interrupts disabled and after smp_send_stop() has halted the other CPUs.
> Calling clk_enable() from the !watchdog_active() path takes the clock
> framework's global enable_lock, which can cause a spin if another CPU hol=
ds it.
> This commit keeps pclk and oscclk enabled for the lifetime of the watchdo=
g
> device by using devm_clk_get_enabled() and devm_clk_get_optional_enabled(=
).
>
> > diff --git a/drivers/watchdog/rzv2h_wdt.c b/drivers/watchdog/rzv2h_wdt.=
c
> > index 3b6abb66a1da0..bd86da71b0eb8 100644
> > --- a/drivers/watchdog/rzv2h_wdt.c
> > +++ b/drivers/watchdog/rzv2h_wdt.c
>
> [ ... ]
>
> > @@ -290,11 +277,11 @@ static int rzv2h_wdt_probe(struct platform_device=
 *pdev)
> >       if (IS_ERR(priv->base))
> >               return PTR_ERR(priv->base);
> >
> > -     priv->pclk =3D devm_clk_get_prepared(dev, "pclk");
> > +     priv->pclk =3D devm_clk_get_enabled(dev, "pclk");
> >       if (IS_ERR(priv->pclk))
> >               return dev_err_probe(dev, PTR_ERR(priv->pclk), "Failed to=
 get pclk\n");
> >
> > -     priv->oscclk =3D devm_clk_get_optional_prepared(dev, "oscclk");
> > +     priv->oscclk =3D devm_clk_get_optional_enabled(dev, "oscclk");
>
> [Severity: High]
> This is a pre-existing issue, but can this optional clock fetch result in=
 a
> divide by zero oops?
>
> If the optional "oscclk" is legitimately omitted from the device tree (or=
 the
> device tree is malformed), priv->oscclk will be successfully returned as =
NULL.
>
> Later in rzv2h_wdt_probe(), if the chip variant uses COUNT_SOURCE_LOCO, t=
his
> NULL pointer is assigned to count_clk and evaluated:
>
>         switch (priv->of_data->count_source) {
>         case COUNT_SOURCE_LOCO:
>                 count_clk =3D priv->oscclk;
>                 break;
>         ...
>
>         priv->wdev.max_hw_heartbeat_ms =3D (MILLI * priv->of_data->timeou=
t_cycles *
>                                           priv->of_data->cks_div) / clk_g=
et_rate(count_clk);
>
> Because clk_get_rate(NULL) safely returns 0, the unchecked division will
> cause a divide error exception during device probe. Should this verify
> count_clk or its rate before the division?
>
oscclk is optional for T2H SoCs and is handled in the DT binding, to
be fully proof, I'll add a check for this case.

Cheers,
Prabhakar
