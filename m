Received: from mail-ed1-f54.google.com (mail-ed1-f54.google.com [209.85.208.54])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 996F9282F00
	for <sashiko-reviews@lists.linux.dev>; Thu,  9 Jul 2026 05:23:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.208.54
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783574617; cv=pass; b=SJtpO1y35UUQiMqTR+l57wqVyIPLSjr8EbNCjE7EYLcsTIiXkZs/NYgoIHn42iQ7R9EJ7jRv7WLtL+WdrMwu2y8Lk7fBo8gKSkfxHBnk10/DVkv2VTyhZN0XBRAGMZYso+ZNaIXJa0GMNPcxmEMU58WIPYDdoeCABdJxTgCDaHM=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783574617; c=relaxed/simple;
	bh=N4IaFh4irsPi9G/nPjxoICQH42HqckBrZkiXKWwClDo=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=aYTiVX1soQxcXJLoZTd248ciytXhJiHpx6C6n3gT0e/ab9vkLVjfmuDiRIx2Dm9y6tvfCugHUqWSEyfSDa9ggijWCE1cc8+BYzw+biG1PsSIualp48M+AJe4IcdB8AuD/1fR8Bxa9OptL0nP97yNevqnKD8GtJLXnzvX+mIhvnU=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=iEnzV28H; arc=pass smtp.client-ip=209.85.208.54
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="iEnzV28H"
Received: by mail-ed1-f54.google.com with SMTP id 4fb4d7f45d1cf-697cee2eb6dso1538672a12.0
        for <sashiko-reviews@lists.linux.dev>; Wed, 08 Jul 2026 22:23:34 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1783574613; cv=none;
        d=google.com; s=arc-20260327;
        b=jWz513+fMZ70PADM7Z/RPqcsyq7p2nlUMbFZ49XI9CrrZG/D4G34X8m0fbMXTy9e/5
         Xt99hnGa5Nad0Fhz0S6MyF2iZeSjlNvzpONp0QBw+Dt9x2GfWCib+wEJ2k1TYed+2SnN
         nnwAadaq6G697/X2tnGIVz3JhXUie80aYh5UEG4UikiTwnAnertcQilDXkWPVQj5hzpH
         ynYpQ5l1YEfOyxUd4GhNUISQrQmbrYNoQAlDu8HQ3aH5lKfsw2dTbcA/mlrhidsyl7N9
         ldXic8mG+oDy4sU/SHLUx6cx+BTW2nnbTefIgMniUpePkyT1ysGCER5wshEQYXXhtbBk
         Edjw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=3jYMuHN3mp22w1LNXaX78paFZMrbcZqtJQFGUwmQCoc=;
        fh=pdw1w4I8RFrdd8EFrxO1f7NbYHinGgc2cmeqSZRwy0A=;
        b=YGxssu433Y17DCu4tkR45pX7VjXhHH7GtRC0CJcnCHxHV2cYTUZZIa/OR9dSc0cRUu
         NPmqiBfJnwDRWf4Yrcu4FDpePpGmreEO0UZAk/q+KAZNp5bOnBmI9AygNO8fP/AAN1XX
         7fKDCnCFpfMPdR4+I9k7mnGT/l9dyHLO22vxLNi3hFl0ytG+dgroIzPeebFsdhanlRf1
         Eg6Ey/JITY0Iej6j1LruqHsoUIThHA6KR0hd4la45Gt3Ih6bFADxO8dsgkcJqK8Nn6B7
         7fY7cAX9tgtUmDHTLwclq/ovajcFfaOYz8rT5oeAUeXsSETHDfIc0uUb4LPsPMUJE9sP
         I/Bg==;
        darn=lists.linux.dev
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1783574613; x=1784179413; darn=lists.linux.dev;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=3jYMuHN3mp22w1LNXaX78paFZMrbcZqtJQFGUwmQCoc=;
        b=iEnzV28HLqxK462ITKwo0lEVuP0ZYDwfdI4NjTSMyVVbgKwMNLi6awemUXAhrCAx6/
         Eb/wzlhnyJgercjKIrTgy0QRHcoxSFzkQUg9gRwJnfR7eU5Ay39hAGmXlhQCBuQ52K1x
         cPZ2KUXXFshe3it/cutWZdU5B7UuZwiRu0aymqDxKsxp4tYpwfQ4ArRdZAyQlUwCvLzU
         Nf56eEjvWoGKC7jEG1Me/5CbpKjcnm0oKTQRia02B/gVPgGEfH/n8RTIsXO5i362Hy4W
         Z80iwOcZUCuIjlr7I1z1x9NsWsfm8pC3cfweG49VvchBq+acDgKXwYIWqC7v+DrGbmcg
         66kA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1783574613; x=1784179413;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=3jYMuHN3mp22w1LNXaX78paFZMrbcZqtJQFGUwmQCoc=;
        b=fLMxtj35nMh4XpLdHuT9Rh+kxTFBuyTVkAiylAceUWOeG1LRzx2A8HS8g/B1+aTJS3
         ZoQ4sLH/PrcnhxKQ735y0V/kIhro+Jjd3sGf8CkelzjX7hfix+Vh7Gyju12TBq4fuLcv
         kqj0gobW7M7AxGp4nC79yqZcQoxiezylQQHkZUtEVG7Ll1xYwexUI2rxXY1jSA1eWWx/
         MGebPM93YrBI+G4crlB9ZhA/GvJc6/0rM5zW1/gn3IF2nFkoha2U0tsJureK/HMQGgRh
         yBfbiOtBVT3vk119PXwotcirwlc016mwpcKLancm6S7PyL5/hU7+3I4x6GlDUpXRlZNg
         FbEQ==
X-Gm-Message-State: AOJu0Yz/vpREIk2bWtnqB8JDz0+O9fJu6OOep7tv0FEaJs8gK/2QnZYe
	FXje1QFRcWJiHeZ8vvfxq1bajB94dusabM2I++u8VMZHoNVHr2/hyqMgC67OS2l2RqOWm/+19J7
	ITYWWAZ3fMm7upoHC0c90d6uFIbnzWIpZ0Q==
X-Gm-Gg: AfdE7clExDLXq8oRKlZVb7yeZdKx0QIbQrUxZ1D84KAaWTrH2rTdJ67nzEm+vjf1M/+
	dnaDYu8Q1mnvsqvzRSK4b7G6OuVrRt4T3FA6QoX2WVOYivrvccfvNMrHJKb7V1PsMnqZJR5lReQ
	Y6Flt4B1V1gCcIbAJcFhczlaeSuHMFPxPcRjQvZnBonIJwwBhZdDqUq8JcVlBpOaqaqDD32wER6
	JZy3cb+PT3tNsYa95U14JsLi98+27yCxLUfBvpOePH9q32lRFB8XB+mlFNpNz2G5lqLJ6wGU/HV
	Vi9t5gG6a68Y9thFX50LZrlDdqJKKPIKRmR4uz0uouPJzBmHSwGi0o6GY4wbIog3oVjYKqrZisn
	jVYde9j6zNpSmvJ12vGV2K6aZy+ExlSxK0BzNmOQqVfJtqcB9A0MrillVZQFCb3c4SF8Ktizydq
	tnmyCep6sbFdZVSqPZ3iqE50apYfuZEe5cqp2VKg==
X-Received: by 2002:a05:6402:2691:b0:698:3365:f94a with SMTP id
 4fb4d7f45d1cf-69ab4460df3mr2297290a12.15.1783574612726; Wed, 08 Jul 2026
 22:23:32 -0700 (PDT)
Precedence: bulk
X-Mailing-List: sashiko-reviews@lists.linux.dev
List-Id: <sashiko-reviews.lists.linux.dev>
List-Subscribe: <mailto:sashiko-reviews+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:sashiko-reviews+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20260709023202.2132165-1-rosenp@gmail.com> <20260709023202.2132165-2-rosenp@gmail.com>
 <20260709024713.58EC71F000E9@smtp.kernel.org>
In-Reply-To: <20260709024713.58EC71F000E9@smtp.kernel.org>
From: Rosen Penev <rosenp@gmail.com>
Date: Wed, 8 Jul 2026 22:23:21 -0700
X-Gm-Features: AUfX_mxUsrbMf_vMjOrBztQg0DDni59xq5EgO9N7xFeXpzk-Tve9U0tz1DayLso
Message-ID: <CAKxU2N-S33sLoJc1M5idCx7ma1aw=LcBdjtyaMaKHMo-ci17Eg@mail.gmail.com>
Subject: Re: [PATCHv3 1/5] ata: sata_dwc_460ex: use platform_get_irq()
To: sashiko-reviews@lists.linux.dev
Cc: cassel@kernel.org, linux-ide@vger.kernel.org, dlemoal@kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Wed, Jul 8, 2026 at 7:47=E2=80=AFPM <sashiko-bot@kernel.org> wrote:
>
> Thank you for your contribution! Sashiko AI review found 1 potential issu=
e(s) to consider:
> - [Low] The patch removes the local variable `np` from `sata_dwc_probe()`=
, causing a build failure when `CONFIG_SATA_DWC_OLD_DMA` is enabled.
Rebasing error. Will fix.
> --
>
> --- Patch [1]: [PATCHv3 1/5] ata: sata_dwc_460ex: use platform_get_irq() =
---
> commit 74bc1be9c4385029a4079d000bf78ff4452fc266
> Author: Rosen Penev <rosenp@gmail.com>
>
> ata: sata_dwc_460ex: use platform_get_irq()
>
> This commit replaces irq_of_parse_and_map() with platform_get_irq() in bo=
th
> sata_dwc_dma_init_old() and sata_dwc_probe(). It improves error handling =
for
> IRQs and removes the unnecessary include of of_irq.h.
>
> > diff --git a/drivers/ata/sata_dwc_460ex.c b/drivers/ata/sata_dwc_460ex.=
c
> > index 4fc22ce4bd9aa..442c6e9d06e0a 100644
> > --- a/drivers/ata/sata_dwc_460ex.c
> > +++ b/drivers/ata/sata_dwc_460ex.c
>
> [ ... ]
>
> > @@ -1126,7 +1122,6 @@ static const struct ata_port_info sata_dwc_port_i=
nfo[] =3D {
> >  static int sata_dwc_probe(struct platform_device *ofdev)
> >  {
> >       struct device *dev =3D &ofdev->dev;
> > -     struct device_node *np =3D dev->of_node;
> >       struct sata_dwc_device *hsdev;
> >       u32 idr, versionr;
> >       char *ver =3D (char *)&versionr;
>
> [ ... ]
>
> > @@ -1173,11 +1168,9 @@ static int sata_dwc_probe(struct platform_device=
 *ofdev)
> >       sata_dwc_enable_interrupts(hsdev);
> >
> >       /* Get SATA interrupt number */
> > -     irq =3D irq_of_parse_and_map(np, 0);
> > -     if (!irq) {
> > -             dev_err(dev, "no SATA DMA irq\n");
> > -             return -ENODEV;
> > -     }
> > +     irq =3D platform_get_irq(ofdev, 0);
> > +     if (irq < 0)
> > +             return irq;
> >
> >  #ifdef CONFIG_SATA_DWC_OLD_DMA
> >       if (!of_property_present(np, "dmas")) {
>
> [Severity: Low]
> Will this cause a build failure when compiling with CONFIG_SATA_DWC_OLD_D=
MA
> enabled?
>
> The earlier hunk removes the declaration of the np variable, but it appea=
rs
> to still be referenced here in sata_dwc_probe(). Could dev->of_node be pa=
ssed
> to of_property_present() instead to avoid an undeclared identifier error?
>
> --
> Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260709023202.21=
32165-2-rosenp@gmail.com?part=3D1
