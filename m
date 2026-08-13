Received: from mail-pl1-f169.google.com (mail-pl1-f169.google.com [209.85.214.169])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 40DB32E88A4
	for <sashiko-reviews@lists.linux.dev>; Thu, 13 Aug 2026 04:58:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.214.169
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1786597083; cv=pass; b=La7HMtXkTNkHM3dBpc+lePSN+lwfNAwp9ibovpiTeuJsIEP3fE7oy9TZDj7quYj8HgKaLo0ySYSRL0pKkripo/k6QxrsJTHSu1ZIX8wZfWB1n30cNcxEFyWHaQo00ye7Obg3jLNYgrl/i9Uer6GWQuHXGNDToa6RPEzgXfqnaWI=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1786597083; c=relaxed/simple;
	bh=s7dEc1PMLnZ/FdlcTZBJRUWujNEvt8LM9Z4x2ckqrYc=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=niGVWYAmK/fGmv/rO8tJThK0H19NAtrBEZptNrv42ahN642qazNyP1ysg5ObhuC+NwW11HwD7DrvmgieFfG8eSfGcKvBivTdkd5hWkrJI9IRYe32YVIpoimorw59d5u442JnNrIG2jf5uhFkADJj3qdBoAb/+2h+3t/udSQ5QvA=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=hPwSA/2l; arc=pass smtp.client-ip=209.85.214.169
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="hPwSA/2l"
Received: by mail-pl1-f169.google.com with SMTP id d9443c01a7336-2caed617615so4173025ad.3
        for <sashiko-reviews@lists.linux.dev>; Wed, 12 Aug 2026 21:58:02 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1786597081; cv=none;
        d=google.com; s=arc-20260327;
        b=Wz899edTgLGvb40Stfhip5Ybv8RizBhFAmPCPlYiwe3e4mwSkJmo6sgqgAshkClkgC
         gBEjj2asXC4HYp6MEhFs20be14+gpOiwxn5Cb+IB/+X46CwX41+9hvVPwEaMkbYTzkjV
         fMf/wMWWeKTC29olsRQtkxaYIU+1HbczyeihiSarIyf8Gbfb3YZe5Xpe0haaBb7mNy1V
         fNh/59z0DQhPoLZcREElbi3yJZB9PC/NQ7lQJsOewAOp62zDbW0pj/D1GFkiSqOebnB1
         e1FL10sjZQ5CsSiw4IN4Wd6xolFJEIcWDJ+oZ31svIP8QKVMMqYkZd3+uJnrpettyP8h
         AdOA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=SUsbAPNc68aIG4OQfMUsvANEsU1GLxgtxRCXnCqwe0w=;
        fh=WJ81iVv7VVNN3XcmqLwfLU/KtKhWcyunKbGcwKiNOFI=;
        b=HgwKTHxG5RP65jKAtWtDrwVFjRJxqFtpVevexAaJUXQT5G6iwM8R7dAjzMyGjxQbcj
         Uk/I7FcCVH6r+dzpEv1hBkhURlDjUMteQaVZVO9ShJLAWPdB094Ey1oEYDo44jIQS7AQ
         y79tU0ZaZl8IqwxokUzs7Y/QMeBPXOZTYYqUv62mzHcHoW8zZG0RkX8ocr1H193dQtiA
         bThH193VnAHBTmNzr2H1yJL1/JsJXmUHqro54xLhin/JnT9C2Ms5BpIe1a7MixyApXUa
         hycNDH35f3JBWHA0cPcm4AapEm4kRJGnwovPJtzREwK+lvteVd6AseaGeQJHINmnk3OW
         PbkQ==;
        darn=lists.linux.dev
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1786597081; x=1787201881; darn=lists.linux.dev;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=SUsbAPNc68aIG4OQfMUsvANEsU1GLxgtxRCXnCqwe0w=;
        b=hPwSA/2lMBKsx0E50fgO06LDJXw+rsLrrz7DQm/jtDty7FQylzaGI06+PgNtdT68Bm
         Xx/9JHi2DSfgdlUbOGUyU7PZxfgozM5VoW/AlhDM+su/DamqXSjtIes2C71Nf2INVXB2
         FHKQWm11tRd9ICHvyWgB9NUvux7p+9BVKky8vJzf97+E+rjPjAjmIlIaEqZDMN5X7By+
         RuXUk+eue+4lyO1yH1GdgHR3guiS7JJ/jRnoJqOoqIOssU8e/eQJbWM2z2fKzesrAEIw
         Qd1BNYkpN/9I0E3bJ/53E63dHyf3pMfb01WwExJFovl4f5oRPL6VTz++dLdPUc/ui103
         Qbog==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1786597081; x=1787201881;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=SUsbAPNc68aIG4OQfMUsvANEsU1GLxgtxRCXnCqwe0w=;
        b=izTnR9eyduZOFlEE+WQhvyogZTtMVdrpvdP/FViGgS0xWd7LI2TVW80RHP5u0I0zB3
         dghsTLkT/uRSM8LNk6tGf8RnrBbWg/Y788ST58wo3uWA8SmgVUCBf+78dbgHeDFaExTd
         x7KkDP/DCNAY6JCfMbNlMdIcJN3YjKUkLrG7Ot5b4FER7uxufQbx2Z37nVFFi1RTg32h
         Q/PFuq0/0XlPkaQ4Ph44sLM3+Aw2xIvLlf03FR2ZN7xrB65e87uL07c1xy3ZVYa/I+PD
         D/Fffj3NoO9bX9ZiCoUwbqaCa8+TEl4rwhVv391ZxQN52fQrxGe/HrwK/kFNT8XMiesH
         4kew==
X-Gm-Message-State: AOJu0YzssxU2cWfQhlr75z8QZLTzI+j77EvBueNdBmDgXbTVs8sp8yOa
	RJjR2ls5MB8Rgiir1B3TYyZYwmDgdkPYM55sZv1GOXQ56xmZRzROwsUZuSIYE+6tZyQzZIpOVn1
	FEbOB0f1oBMEQ71ks2bFoRNr4rUQE88UyQlrz
X-Gm-Gg: AR+sD11UTsWfEiu9v0pmD9j8rsY193ZnDDXcDj2MgvS63ctFhDWshB6ryLKzh+LZtQF
	DPuQ7xjr8jhIm0YBxyYP9DK68orkbi9PLOruW5YsJLJ+WcfHeUggcdFH+50Y5dGUb553lQL7IaL
	Jcs5S8/wv2RJtRcqHh8BieV7mF+VfsquROovEkbww1jqmTZjHoeDdS7rCMd1QrC1pN4t8QkztCi
	ag1eMdO1zRQ5f3FZZqhvV5mMsffwEvV7eF720JHdzSZ03QTCYnGV5FxM20vYJ8seqko6+rOTfV6
	8LPp/uGp+mfyXe2iKZ8jULbo98sgr5m2aA3h25aP1TobNlvwQiaVXJhaRokFaASzNsdiGoFMgux
	215GI/IekyK3iklsV4srTc2LTEwPfRQ9eDacf1KyFAdL9DsrUhlXy/yjQ
X-Received: by 2002:a17:902:f64c:b0:2c9:d8c6:1dc3 with SMTP id
 d9443c01a7336-2d37d189f9emr36563835ad.0.1786597081398; Wed, 12 Aug 2026
 21:58:01 -0700 (PDT)
Precedence: bulk
X-Mailing-List: sashiko-reviews@lists.linux.dev
List-Id: <sashiko-reviews.lists.linux.dev>
List-Subscribe: <mailto:sashiko-reviews+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:sashiko-reviews+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20260812112023.42254-1-phucduc.bui@gmail.com> <20260812112023.42254-3-phucduc.bui@gmail.com>
 <20260812114711.8641E1F00A3A@smtp.kernel.org>
In-Reply-To: <20260812114711.8641E1F00A3A@smtp.kernel.org>
From: Bui Duc Phuc <phucduc.bui@gmail.com>
Date: Thu, 13 Aug 2026 11:57:50 +0700
X-Gm-Features: AUfX_mykwCkincg2687zWGdDRSSrfKTd8N6RDJWLSmR0UYOP0VRifiRp-JErN1o
Message-ID: <CAABR9nHBt=+5C54vDzhvnZ2EsSTbA_raTq_q_K7EXoxhst_H2w@mail.gmail.com>
Subject: Re: [PATCH 2/3] mmc: davinci: Handle errors from optional IRQ lookup
To: sashiko-reviews@lists.linux.dev
Cc: neil.armstrong@linaro.org, linux-amlogic@lists.infradead.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

> [Severity: High]
> Does this direct return leak the clock reference?
>
> Earlier in davinci_mmcsd_probe(), the clock is prepared and enabled:
>
>         ret =3D clk_prepare_enable(host->clk);
>         if (ret)
>                 return ret;
>
> If platform_get_irq_optional() returns an error like -EPROBE_DEFER, retur=
ning
> directly here bypasses the cleanup labels at the end of the function that
> call clk_disable_unprepare(host->clk). This can endlessly increase the
> clock reference count on probe retries, permanently preventing the clock =
from
> being disabled for power management.
>
> Should this use a goto label (like parse_fail or dma_probe_defer) instead=
?
>
> > +     if (ret > 0)
> > +             host->sdio_irq =3D ret;
> >
> >       if (host->use_dma) {
> >               ret =3D davinci_acquire_dma_channels(host);
>


You are right. I overlooked the full context of the function.
I=E2=80=99ll add the goto parse_fail cleanup path and adjust the handling a=
ccordingly.
There is already a check for host->sdio_irq before devm_request_irq()
at the end of the function:

---------------------------------
if (host->sdio_irq >=3D 0) {
        ret =3D devm_request_irq(&pdev->dev, host->sdio_irq,
                                               mmc_davinci_sdio_irq, 0,
                                               mmc_hostname(mmc), host);
---------------------------------

So I=E2=80=99ll handle the optional IRQ lookup as follows:

--------------------------------
host->sdio_irq =3D platform_get_irq_optional(pdev, 1);
if (host->sdio_irq < 0 && host->sdio_irq !=3D -ENXIO) {
        ret =3D host->sdio_irq;
        goto parse_fail;
}
--------------------------------

This preserves the existing handling of -ENXIO while making sure
other errors are propagated through the proper cleanup path.
