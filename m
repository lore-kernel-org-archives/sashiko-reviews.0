Received: from mail-lf1-f54.google.com (mail-lf1-f54.google.com [209.85.167.54])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6933A395D87
	for <sashiko-reviews@lists.linux.dev>; Mon, 18 May 2026 21:38:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.167.54
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779140336; cv=pass; b=S/8r0ZizxwJjUxA0omKpzRUkfwZGYjULDxjbZPS0kGEaWfrCGS20FFBYSOe9M+yIdWG/AfzocBHf+iJrxVa1TCkVEBYolB4GlxAaUF+R/WCHf1cnTjFz42sf8wDSnLxv0Yen2dRuY//YabDQGz905WdvWqb0hDKaTfFA7B4+LGA=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779140336; c=relaxed/simple;
	bh=pNW/aYejClTHOe/GUM7OBh5zmikOgfplrUaLnAuzvrg=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=fCTQ2LYecEicDf1fpOH2B0D83sdphXEM83pHz3QlFZJLwj5cpDrv9s0NujAmUnZo1m5PE01e+UEmK8/mN3SzVcFVzeXvPoir9OGbeZrEgtn6fgE6thoBxTdeWypa1qVdwH5lH4Hn+xYT/LyuWCCPAcoQsKJ9htDblOFDK/knmRk=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=JC7UFo88; arc=pass smtp.client-ip=209.85.167.54
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="JC7UFo88"
Received: by mail-lf1-f54.google.com with SMTP id 2adb3069b0e04-5a742b8b72eso3511023e87.1
        for <sashiko-reviews@lists.linux.dev>; Mon, 18 May 2026 14:38:55 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1779140333; cv=none;
        d=google.com; s=arc-20240605;
        b=Ug5a+1upw/2DOQ2OyDFSLi4MRFMaa1kf2meMSGXGX/tZzKdvEYFYOzuElDLFtC3cq0
         aUz+Ki7B6JHO8Z1dvK5YejXqSoII1SubFoGXYe3m4j+vYvHcHqCU6N2PpWJus5UvkkSA
         aulu8wY7HU8QG+6pqnc7RgfteEtKB/b7ZgkQuK30XKxw0Svrg5FXUGa/Qak53Zd6DugF
         wVusbmmUgM5wS9Q2UwDnD4u5KNPAoM/ZI0OcpaMnmfDSxSEyitnx6Jk1oJ+9Ni5CM6i7
         ukjDU+mYznrV3f2uJLxBHTRvN8V/NRwTFWcnowX8DQ0RDMGN+wiwGu0vDyv8iZChlDi3
         S6xg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=euGMTDy6+FwGD5XxUGxxeqRVdpXKKopqQh8ghrZGdtc=;
        fh=zt2hjtFWVrBSbexOnXx/digRN2O0tNSOK4/ceCsrIlE=;
        b=UkhFxOX5t1Zf5jUV+qShXXmPWdHAU9nEd1bWPR4ONrmEA1jc4cpGkTRXr0SxnxIiWK
         ckSLvmCFT00IEvouwGeJUl2OQTGf7k4IcF8IuH7dQr+sGtLeL5BwyBLJnNL8mlXm0LOB
         Gw8VshPbjkU67/ZQDeghk2RSj4WuzQ1ozETjlLCXEqH9cxvAOz1j57zYnOo0wKjlvxbg
         pQgmC8+NJhHgtGZ6SZTCAKd4QxUDujYI4CdqvM0WL1wiGdNJW4DlS9fi85dW/KVTVaNW
         vsDz3ycmcCuYHz8x4gvvW4rDpm+2RexsB/OImT1gGArCRotlruVo64h7N+bd0RvMNuQj
         zmjw==;
        darn=lists.linux.dev
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1779140333; x=1779745133; darn=lists.linux.dev;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=euGMTDy6+FwGD5XxUGxxeqRVdpXKKopqQh8ghrZGdtc=;
        b=JC7UFo88IZmWOL9uKWpuF2jU3RzdGRCVOCC5YRvm3W8tF5/V90ANWk9z0KX8XS7tXl
         IwIxCA0nyBOwTZPtiOYj79i3k5W4Me2G+N8akRnWYr2/ILItqZiYZvxrOeh2kR7GZT96
         d+oCZKru8IUvXwgP62h1xE/9ld4vU1RRYbDW0bVcojvlCl4/UShSLAZoTTWNi1IqeAQM
         9uhM0a65P24Q35PTShLCvmgBD/lwmRCzImP6onLr1M9RkW4gPcXuLkzE2ZkMYatv6CgX
         +K3QKxN/3OQLxOD+PyzvE+OcfLauT2rP7gvCm7cN1YhncA29FhwCXbyuCmW3dLzjyC9p
         Z2bg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1779140333; x=1779745133;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=euGMTDy6+FwGD5XxUGxxeqRVdpXKKopqQh8ghrZGdtc=;
        b=qa4FbtaNrXHYPLgiiv2Yq9ypyAkQmUl9R/FDccOpaXbZrAhVqVPu56D/Yayj/s0WSM
         NnGdl24DxiwFQwJaMGKXYKtnCwurWwO5mY7OqeQMyjXiHqUsh2qbrcRwQcgUzmXJ7v+J
         sAaOvNyD57V6Bqe+8V4ebHrqQlD8KA6VaSGab5EAT1klEjhltXgdX0FIlTAzsGX6d4bc
         nk1mw4xLTNEcTM/4rS2asPeTJ4Hv9T9EbIwJcM+w26C0YQp3FO3UYnm0eBBEWk2ef6B0
         Vud7FuaP0d0cNXY5eNzhJOY/DB1IPhxmjTvRMq8RetLtPBGhmL2up2t1EAJprfnvdBqJ
         qjdQ==
X-Gm-Message-State: AOJu0YzXecGnmEJCePOAvUsgPv1vZc4wnl0K+fs6cMN0Ax+xF3Hl5FHw
	+O9La5VTsGHLotujNjJmx80WsOybj+aTXqVRh3R35SUO765ZIT9zNk8aUkkZkTUxgLwezFhmrrH
	XkMlqzb4Hec+r0RkiAIQPdAvkhNyBYI45etnGiJ4=
X-Gm-Gg: Acq92OEn6XQ9IPprCrJDFupz1Sc1iT9dqFmIKE3bU5G3zBF4zLgiXN55yMusfAg2DP7
	f1blB6BxrsDWgTYzT9Gf5PXMzX7O7ab9kJzy8F/7fDtjjrq6gOnik9Ou0tUpoB6WSw+u80bxLVI
	zDtmEyCGaHLbTQFKfEhRZ7w+I3xNnsKcUOXmjLqMXQreQD0HpCaV7iXmS2ozF1EOo8Nt5wEtoZu
	FoaJ3d2rxKmqWa3zwmQzWo60s/7aA8aoICJi5ZxiwvlOQaawVRxekyoMTU1YM/leRlvNCWFRlmv
	YCptYJTgR76nLGC5MSa4gZiadejIVylmCvdbVhaotQD9gqxEVrF4+6rFPjPMLf5XluW5hDm2AK+
	Wndh16ssUg5H9gsmxyrAQuLVhsCP+RTcs4wepCQjw/WbKPNA5qGbVJUl+2w==
X-Received: by 2002:a05:6512:159f:b0:5a8:891f:388 with SMTP id
 2adb3069b0e04-5aa0e73e985mr4841694e87.29.1779140332773; Mon, 18 May 2026
 14:38:52 -0700 (PDT)
Precedence: bulk
X-Mailing-List: sashiko-reviews@lists.linux.dev
List-Id: <sashiko-reviews.lists.linux.dev>
List-Subscribe: <mailto:sashiko-reviews+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:sashiko-reviews+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20260518210957.10545-1-rosenp@gmail.com> <20260518211925.A24FDC2BCB7@smtp.kernel.org>
In-Reply-To: <20260518211925.A24FDC2BCB7@smtp.kernel.org>
From: Rosen Penev <rosenp@gmail.com>
Date: Mon, 18 May 2026 14:38:40 -0700
X-Gm-Features: AVHnY4JxHyvIhyT3-GXyQNQ7qtL3R-Vt6nEkpFJolQTPixllWzj9q7mU0PPN1UU
Message-ID: <CAKxU2N_ErLkFgvpCCexcvaGbzozdSV4y5w3ER+DaEgFLC-hPsw@mail.gmail.com>
Subject: Re: [PATCH] watchdog: ath79_wdt: select OF and COMPILE_TEST
To: sashiko-reviews@lists.linux.dev
Cc: linux-watchdog@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Mon, May 18, 2026 at 2:19=E2=80=AFPM <sashiko-bot@kernel.org> wrote:
>
> Thank you for your contribution! Sashiko AI review found 2 potential issu=
e(s) to consider:
> - [High] Permanent failure of deferred probing and device re-binding due =
to uncleared global `wdt_base` pointer on error paths.
> - [Medium] Mismatch between Kconfig changes and commit message regarding =
OF dependency.
> --
>
> commit 279311df3b831cb8a967974beeea1a51baecd0ac
> Author: Rosen Penev <rosenp@gmail.com>
>
> watchdog: ath79_wdt: select OF and COMPILE_TEST
>
> This has always been an OF driver. Select OF in Kconfig.
>
> Add COMPILE_TEST for all platforms, not just ARM.
>
> > watchdog: ath79_wdt: select OF and COMPILE_TEST
> >
> > This has always been an OF driver. Select OF in Kconfig.
>
> There is a discrepancy between the commit message and the implemented cod=
e.
> The commit message states it will "select OF", but the patch implements
> "depends on OF". Could the commit message be updated to match the
> implementation?
Yeah probably.
>
> > diff --git a/drivers/watchdog/Kconfig b/drivers/watchdog/Kconfig
> > index dc78729ba2a5d..1590f82941ba8 100644
> > --- a/drivers/watchdog/Kconfig
> > +++ b/drivers/watchdog/Kconfig
> > @@ -1811,7 +1811,8 @@ config M54xx_WATCHDOG
> >
> >  config ATH79_WDT
> >       tristate "Atheros AR71XX/AR724X/AR913X hardware watchdog"
> > -     depends on ATH79 || (ARM && COMPILE_TEST)
> > +     depends on ATH79 || COMPILE_TEST
> > +     depends on OF
>
> [ ... ]
>
> While reviewing this patch, I noticed an existing issue in the probe
> function's error handling. The driver uses a global pointer to enforce a
> singleton instance:
Yes, this is an ancient driver that needs to be migrated to
watchdog_device. This is not relevant to COMPILE_TEST though.
>
> drivers/watchdog/ath79_wdt.c:ath79_wdt_probe() {
>     ...
>         if (wdt_base)
>                 return -EBUSY;
>
>         wdt_base =3D devm_platform_ioremap_resource(pdev, 0);
>         if (IS_ERR(wdt_base))
>                 return PTR_ERR(wdt_base);
>
>         wdt_clk =3D devm_clk_get_enabled(&pdev->dev, "wdt");
>         if (IS_ERR(wdt_clk))
>                 return PTR_ERR(wdt_clk);
>     ...
> }
>
> If devm_platform_ioremap_resource() returns an error pointer, or if a
> later step like devm_clk_get_enabled() returns -EPROBE_DEFER, the global
> wdt_base pointer is never cleared.
>
> Does this permanently break deferred probing and device re-binding? On a
> second probe attempt, the uncleared wdt_base pointer would still evaluate
> to true, causing the probe to immediately fail with -EBUSY.
>
> Similarly, since ath79_wdt_remove() does not clear wdt_base, will unloadi=
ng
> and reloading the driver also fail?
>
> --
> Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260518210957.10=
545-1-rosenp@gmail.com?part=3D1
