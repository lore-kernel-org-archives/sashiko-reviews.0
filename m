Received: from mail-wr1-f50.google.com (mail-wr1-f50.google.com [209.85.221.50])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 577D13E3DB8
	for <sashiko-reviews@lists.linux.dev>; Wed, 30 Sep 2026 08:36:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.221.50
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790757390; cv=pass; b=JHO5AGpgM5XBUzZ2zQLJYKSSUXxW/jISgoy9XI2/iXk7RqiEaZOJiLNbwTYB+VNW6Lm5uFE+RXD+RBGLv9651ykfqTYhL+1UEGRlImh5F7fwDO1lbUMcPear+mPI86fC/CJylC3xFRPXbt8joIZCuDomM4Vo5mIGk5NQJpAUj0w=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790757390; c=relaxed/simple;
	bh=HjdOFxmrol1vUnD9FKIi4UFta8BjlFpXjkromc99kSU=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=uYVpIF9teCP/gzX1aS40aBEnoEqrol0NOtGiKAyi7B4knQ284YCrfTa++2hCaHcGRbiMMJpB3GSO68ThHDrwXAtoJfTtnxYNrAkI8/3abih/MFnptFLUJCnK9YvwcIw5Wkul0kjxgymNks9coPvFYw12CEgq3aiULoI7TnaZZmE=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=MuLhTKtS; arc=pass smtp.client-ip=209.85.221.50
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="MuLhTKtS"
Received: by mail-wr1-f50.google.com with SMTP id ffacd0b85a97d-48b02a2359aso104327f8f.0
        for <sashiko-reviews@lists.linux.dev>; Wed, 30 Sep 2026 01:36:29 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1790757387; cv=none;
        d=google.com; s=arc-20260327;
        b=bknJ5Zy20OYlgcDGttkM9k9C5U26FJuJkkb2yzDhDYGIK9anKrljXtEm3o+wj9u0FU
         gmcQQPEH2LurthFZf/FekQo7za5+dayuHx+V89bi7oUye+nkqTruRNciwpPK9oDI7r1X
         4knruta2ti45Z7wc/eXuwPyT+/0mh4TquhyjBK+3rg2MAfyxXJ33ZuhmCNQ9ZaRRpQVZ
         ujpB1SL3wlsVS4tKcLMUh3dcUoQmMZTktSWacRz00qXZb2qqm6T9wHpF4nmFwix80bwQ
         6gK78d/UN1Z8ISYqVCWdMuVXxXAEq+O7GUdpUwj73l6k4QQCkoce3OrDCr1UdkgyUsrG
         8OHA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=lZaIHzaOhcnhKP+I2Nw6s6CnueUSh0ItyVCxd7z2kOw=;
        fh=fSzKU6+wSBQyrZqZ9zRYUyFn5nrHTjRbJJVTPr1J10g=;
        b=Ri9RT0i4JCC+OTT9lviKLWNfTiHUbXz2+yVozcMkbXPflpOqQZgjc3ZVTSks4ziU3S
         T/ZDSUs9X5zPEW0TCSgBVjJBkHZjTmkMe/3T/vHmnInBdFg7ZDPypfbJsk8MX6DxlRJU
         8/XqNfBQAn/qNeBYvi14DlHRxewdq9I+KP9YFj+GSdRww9bW96OdOqD6CNiuSYh7FNA0
         5HhcGFdBMrG3HzwQCi1+an+SRoxYb8yBoJKkSUGzWQHlzsz+hjPhz4FtTz9EtOByj9UI
         LDotKnRZ2NHUOFgsZs4oyEbY5qmASW/7BcHGEOyME3AndozNTBDxYjU3DbbZ7p/XUsXX
         XRjg==;
        darn=lists.linux.dev
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1790757387; x=1791362187; darn=lists.linux.dev;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=lZaIHzaOhcnhKP+I2Nw6s6CnueUSh0ItyVCxd7z2kOw=;
        b=MuLhTKtSsIaDaNU9jhn5ue9axQQ8zm8gcO/rhcYAbR0Mzk/f3UZmthxgftPfWMRURl
         yRm32LKjUnYBFTFgKoVK48OCuH00lZuvu0Yqxu4zsuquhsTslSarIEemEJ3ltCXefulY
         1KwVRijq7tM1BaghAR+XeC9SodH/fRttTKtPkpK6wIKACLmUmOTfg4a6qVpILhPqJsBJ
         Gq5Yba1vPxtd+XPPi0nkiW2NbNNHv9kdflxfvrOmjeHT4TQtI8FWuktvs+jcDmAPNXd6
         3XqUMQqP9KBH0sAfvXY5rU36MSMFkMo6bWKcNj6na+79rvIEjbPUTB7fYxwGomQGVojG
         ksYQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790757387; x=1791362187;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=lZaIHzaOhcnhKP+I2Nw6s6CnueUSh0ItyVCxd7z2kOw=;
        b=o0zx1C8t2sv2jasdNi5iuF4am/94h1UaPLFFvs9a1zfqOLseSHvaOU3H1H1KwF+6T4
         quU8H6EdOs0faPhGLGohw+bsL3fvlgEgZUg6SzcxeILcPWNM4Ox9iQxy8ui9dxz6Jgbi
         cjAuuuC+6V0xqsFTih+UAN3wv4LGAT3ykY6xoJ7B2slQRBE3qvPE7oO++Ie6sfZqF49a
         WD1bFZJJGYYo9d86r9320zfiI/Yz7YfB/BSJByhkdIkxxpfHhEmojZ6EN/7SLY2Y5qaN
         qaGs6xsWJRoTBBiCundqh5+z7oTaD0nBBVDOG42MVsmuEfiPqMmnQx/YG4Ea8aviantS
         kbyQ==
X-Gm-Message-State: AFq9FYK5gqv5iPu4g8N01fERouFv2mGBMG+acNmWp6PEVql6cbLr1VhG
	AbLw/JAShgVrgjwrs4sxvneP9UXWBjvnJxDSmhX+53cYM58WNMviPKy797KhLX7X5uUfdI1bYi1
	TdfS0CbdElRb2se5CcSWtIxcYUL8uPAmQGGWDn7c=
X-Gm-Gg: AYBFou0wVtqb3mPD8AKqdNFJvKFj0K0If3Ucx4mkgsf4Zkd5msILY2MONEA418YpXmJ
	ADosW9p3gaLj8m141lYKBCrBrXARpiBxzXcKSi2v9NkX02mDqeho29bAVKpTCfhfwzFl7BYS583
	qXS04oqW0JUlywLqIBH1/ZP0u9NBkDPfSYWWoVBPZ174TpZ/4sjXg55NseRibaiDD66VPFn5TZQ
	ZV00Ek8SkgnUrKZHIHfexSV5YzqtXYhFoT94qkx5tnSLJpY047mGsxgOKgBc4dUi0gltltbJxkZ
	NGGhSDusn4JCmqcFO4wAVX8CX9DlnQnEOxbqcw19WWCVw/NXT8VpHoycMetejeL2gJVwq2CEuYy
	fN3DgfVP2AknT5LPI1F+0HDyp1XX0JmfKmwUTJ5PkcIWjbo+E3DF05RGuV9jd2p1Ilzz78ai3ug
	==
X-Received: by 2002:a5d:588c:0:b0:48a:f11e:6d5e with SMTP id
 ffacd0b85a97d-48b024a6d19mr1630952f8f.11.1790757387095; Wed, 30 Sep 2026
 01:36:27 -0700 (PDT)
Precedence: bulk
X-Mailing-List: sashiko-reviews@lists.linux.dev
List-Id: <sashiko-reviews.lists.linux.dev>
List-Subscribe: <mailto:sashiko-reviews+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:sashiko-reviews+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20260929105021.542730-1-prabhakar.mahadev-lad.rj@bp.renesas.com>
 <20260929105021.542730-4-prabhakar.mahadev-lad.rj@bp.renesas.com> <20260929110602.D533D1F000FF@smtp.kernel.org>
In-Reply-To: <20260929110602.D533D1F000FF@smtp.kernel.org>
From: "Lad, Prabhakar" <prabhakar.csengg@gmail.com>
Date: Wed, 30 Sep 2026 09:36:01 +0100
X-Gm-Features: AclHuK8CCNO96WytW0FDoK4wkycLlbK69yfsHonOrEjdyZiIwv_YOfKHdgyoR20
Message-ID: <CA+V-a8sNsgCP6icoYd8irORb9OGMAFG+RrgMOEtAiMoX9gFFdA@mail.gmail.com>
Subject: Re: [PATCH v7 3/8] watchdog: rzv2h: Drop enabling clocks in the
 restart handler
To: sashiko-reviews@lists.linux.dev
Cc: wsa+renesas@sang-engineering.com, conor+dt@kernel.org, 
	devicetree@vger.kernel.org, robh@kernel.org, linux-clk@vger.kernel.org, 
	linux-watchdog@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi sashiko,

On Tue, Sep 29, 2026 at 12:06=E2=80=AFPM <sashiko-bot@kernel.org> wrote:
>
> Thank you for your contribution! Sashiko AI review found 1 potential issu=
e(s) to consider:
> - [High] watchdog: unintended system reset during suspend due to permanen=
tly enabled clocks
> --
>
> commit 465743d35253a3a281f9ce8cea373ed0c3ae3e5a
> Author: Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
>
> watchdog: rzv2h: Drop enabling clocks in the restart handler
>
> The commit drops dynamic clock enable/disable operations from the watchdo=
g
> restart handler to avoid deadlocking on the clock framework's global
> enable_lock. Instead, it keeps the peripheral and oscillator clocks enabl=
ed
> for the lifetime of the device using devm_clk_get_enabled() and
> devm_clk_get_optional_enabled().
>
> > diff --git a/drivers/watchdog/rzv2h_wdt.c b/drivers/watchdog/rzv2h_wdt.=
c
> > index f247e42d54f54..55ac11fcfcabd 100644
> > --- a/drivers/watchdog/rzv2h_wdt.c
> > +++ b/drivers/watchdog/rzv2h_wdt.c
>
> [ ... ]
>
> > @@ -292,11 +279,11 @@ static int rzv2h_wdt_probe(struct platform_device=
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
> Does switching to devm_clk_get_enabled() and devm_clk_get_optional_enable=
d()
> prevent the PM framework from fully gating these clocks during suspend?
>
> By permanently incrementing the CCF enable_count by 1 here in probe, it a=
ppears
> that pm_clk_suspend() will only drop the count from 2 to 1 during system
> suspend, leaving the clocks physically enabled.
>
> If the clocks remain running while the system is suspended and the ping w=
orker
> is frozen, won't the hardware watchdog counter inevitably underflow and t=
rigger
> an unintended system reset?
>
The driver doesn't currently support dev pm ops so I can't test this
scenario. My current intention is to add syscon support so for now
I'll drop this patch and revisit it when adding pm ops.

Cheers,
Prabhakar
