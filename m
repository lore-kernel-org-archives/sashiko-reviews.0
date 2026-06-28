Received: from mail-yw1-f173.google.com (mail-yw1-f173.google.com [209.85.128.173])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 186081AA7A6
	for <sashiko-reviews@lists.linux.dev>; Sun, 28 Jun 2026 07:16:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.128.173
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1782630970; cv=pass; b=Ytt2+SLR5hg5H7+mjlHUBr/XsF6kSQu5Z6Sa0UzY3xx8df/KZWpGbVq2xJ2EZzXL13GYzxomTr2PJ0Kfy3NnUff8nGgbpcmk1RZtSO4jcIRecbnZTchAJU1+PhTy2tqns6OtzeDtznEjeSEtokgCxicvMet1dIgWkceWPl4BKRQ=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1782630970; c=relaxed/simple;
	bh=Clnfi/kv4cLVv5dhNS8JGOOv22pyEAHj1VloGHzKTnY=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=t+p0yQ4E2KJYH7mtZc5cJzbIgzDdLRYZthmOTktVXWYC9kxfcfA9VrT8Ujls9+80C4mF7sL5xekYxL+bzbBZNlL7UpcduKrPOaTaSEurPVMM+aeLNzfBa71uCe/upXZMzmOyA4SpaPVVjjOf6r9Z02hEn145Ta34C8JeP/iJGmY=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=cJNI6efb; arc=pass smtp.client-ip=209.85.128.173
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="cJNI6efb"
Received: by mail-yw1-f173.google.com with SMTP id 00721157ae682-80cd342a796so10174807b3.0
        for <sashiko-reviews@lists.linux.dev>; Sun, 28 Jun 2026 00:16:08 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1782630968; cv=none;
        d=google.com; s=arc-20260327;
        b=Ll84J50DU9GQKE93tMfGY41SCrl/HhE+wGzp30SGQ9sR9tXKfA9ZCCuChsb3zFw/cj
         /zcoaRLM3jOWX8WmpPNRWpxa6RhABQnqNOch1lF0RHNFFAPB1DuOsLwFNUapltvEWKAc
         fdN4Jvqg83zM1rx0RXff3k6ftwM8L6S1mQfYxC+yr+v/0XgxIAU+KyPKg8Y0Fk1Ao9G/
         8oj2llDZSzzTnxXSrW3UhU6ZFELEbbIaQ5wAmf1oLl/bKQ4dBMBuE7+nLpqz1GxiQVwz
         7as/+5PNcn7h5JRnbS6hQ59oKjz4QU3lYhXaHiMInqP0wB9UIAjP3YsRg2qkGE3A0of4
         zrlQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=VYkMilNx7ZRv+pY9kOiaVDU1vZlVNUL8U5Tb17+D99Y=;
        fh=l7naXfeMQEo9RaYW8qxWeqhttAC3Wzufq6pNZDyy/F0=;
        b=mdUqS9FUnlwybv3KZz+9YijRyOiewnndixzXaxQrKYI/qLcY/aNQ+AtOx463s1jtIg
         Uxe2X/6xUHh4KboL23v7ICsNfFBf2vgVb4Ac2V5q4vJmO4H8Eoq34llsmQvcKgHcEKuQ
         kk/Zy0dF0CVjCrY8rYv3kTTMOJXGhKeIi4vyiRNf3o5AFCWMmY+nbmMI70CAsGPKfmo3
         haRCmZzEKXJ3tNZVGz+G664+kcqWUmf9ZSsckRb1uCoo0ViVtLaIP555HWE61IE+U+7q
         8MQhSFj5laix4rs0UL//UE1gHlyMvRGH+Sz9CMXvw+9J7u96kdowfk37QCObFAYzNfco
         3WTA==;
        darn=lists.linux.dev
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1782630968; x=1783235768; darn=lists.linux.dev;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=VYkMilNx7ZRv+pY9kOiaVDU1vZlVNUL8U5Tb17+D99Y=;
        b=cJNI6efbjUE67jmKlfzeKQJaKVo7riDH545pPY7WwcWvN+B+pAI73rX6VFG9/j99g8
         trxBKU8n07pWC8RoYorx77JxLEy5YxDK0U8RHQOSnZ8kDcM+n1yKBhXrJBWGH2K6xEjB
         QAPGbjN99GiLLJr64oY+RAAcqJd31TBZj6tLqrTCTJd7BE6PLzSSrBqRoRASOspd8ypM
         ZLR0ASzTbOEBudEx+rCBIeT2G2TqMbQ+zAAHUPBLdyWTE5DKZpP/vUbXzpNn89mWJ0uu
         WWP8/t/+2rq+2DYoB9RUpEQNLwZAMq6rtPPzjKfwvA+sMVD2WbKhQUN3sCYQvVWQYuC+
         WkWA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1782630968; x=1783235768;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=VYkMilNx7ZRv+pY9kOiaVDU1vZlVNUL8U5Tb17+D99Y=;
        b=qAKf3Dd7/aAuAlo21GLLX8w6ibjo4DD2EUnVZlIESM9DfXTO8Bw5yuD3CR00nyS5ck
         fHoawCzyPjrLJ9lBgdVuai1bKSOCw7vfBxWREYPrWb+sq8BFVMNTJ0SvIgKyZuYWuiJT
         PuyPmmf4ccMdpUP9YrVHLUmVLDece6DGtGS+WEQCc7SwSBawV8CMOHIsND49fVQT41R2
         Sz6ChTzk0kWqOffw0iyDgxM/T1xFvvQp6Y4pFNejqCNPLeInOiAp4ZBW121z4QD98nBF
         ZJ069xYcpaUZybVdozvYKmllxTr607bzekAhcubG2XMjxRMkd5oM3htnKT10HQrhoR/5
         LFog==
X-Gm-Message-State: AOJu0YzV8bek1/THLRnf2o9/AeW8CSdDA72BA+z6UWDUoZHXOFZ7wkVh
	Qjnvbf7D8ag1yVcjX4dNHiSkZLkJLueuI1frINEM6VeM9W/X67fhfs7l7h4jrejiz/jLPP/rHRx
	uw0T7Q1+hfnQ9fojlaoDz6rXHdm+6fWEi7g==
X-Gm-Gg: AfdE7cl3K8rZGDw3m3YL7FtFdnerys1Gh5DtSPhi1VyqcGUlZiTX3994bMP9bhBz9PM
	5Q3sYGNbZwECwM0Baio6kuq2Wcup9+smd0gS/a0rrX8h1/LIRgMSAfSWgToiXCp5bcHgBf6EOBg
	yUz2kle3MmfIs8wRPrkud2lVV3JrdlxeETzAACuyEzOcw+GzgcdG6ESvPvCzidk/ar332jmH4m/
	43IR4RU6wv+SQcf2/3BMpN5UC84dhGgDT/9CWyPsr8+CrimSq31NlzEqdWldD28IHSlR0+RRw==
X-Received: by 2002:a05:690c:6ac6:b0:7fe:bd7:9cae with SMTP id
 00721157ae682-80a6a496acamr120226927b3.44.1782630967897; Sun, 28 Jun 2026
 00:16:07 -0700 (PDT)
Precedence: bulk
X-Mailing-List: sashiko-reviews@lists.linux.dev
List-Id: <sashiko-reviews.lists.linux.dev>
List-Subscribe: <mailto:sashiko-reviews+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:sashiko-reviews+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20260622083046.3189603-1-tmaimon77@gmail.com> <20260622083046.3189603-4-tmaimon77@gmail.com>
 <20260622084246.D01A91F00ADF@smtp.kernel.org>
In-Reply-To: <20260622084246.D01A91F00ADF@smtp.kernel.org>
From: Tomer Maimon <tmaimon77@gmail.com>
Date: Sun, 28 Jun 2026 10:15:55 +0300
X-Gm-Features: AVVi8CfnmkRHCHwHniRXRzrKmmVWuj6G6RgacnVW4_rojVzgCVFn156J9Mj_5vA
Message-ID: <CAP6Zq1iD2GA2Aae2Vz0UvNG5RSv2N_H-jAnfDy4Kjm6Pn1htxg@mail.gmail.com>
Subject: Re: [PATCH v2 3/3] watchdog: npcm: add bootstatus support
To: sashiko-reviews@lists.linux.dev
Cc: devicetree@vger.kernel.org, robh@kernel.org, conor+dt@kernel.org, 
	linux-watchdog@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi,

Thanks for the comments.

On Mon, 22 Jun 2026 at 11:42, <sashiko-bot@kernel.org> wrote:
>
> Thank you for your contribution! Sashiko AI review found 2 potential issu=
e(s) to consider:
> - [High] The first watchdog instance on NPCM750 clears the global RESSR r=
egister without caching it, causing subsequent watchdog instances to perman=
ently lose their reset status.
> - [High] Non-atomic read-modify-write of the shared INTCR2 register clobb=
ers concurrent modifications and incorrectly handles W1C semantics.
> --
>
> commit dafe1267618ef0158376caf5f3acee9d7fe7b1b7
> Author: Tomer Maimon <tmaimon77@gmail.com>
>
> watchdog: npcm: add bootstatus support
>
> The NPCM750 uses RESSR and the NPCM845 uses INTCR2 to latch reset
> indications. Read those bits during probe and map them into watchdog
> bootstatus flags.
>
> > diff --git a/drivers/watchdog/npcm_wdt.c b/drivers/watchdog/npcm_wdt.c
> > index e62ea054bc618..98660419ec3f0 100644
> > --- a/drivers/watchdog/npcm_wdt.c
> > +++ b/drivers/watchdog/npcm_wdt.c
> [ ... ]
> > @@ -169,6 +250,92 @@ static bool npcm_is_running(struct watchdog_device=
 *wdd)
> >       return readl(wdt->reg) & NPCM_WTE;
> >  }
> >
> > +static void npcm_get_reset_status(struct npcm_wdt *wdt, struct device =
*dev,
> > +                               const struct npcm_wdt_data *data,
> > +                               resource_size_t start)
> > +{
> [ ... ]
> > +     if (of_device_is_compatible(dev->of_node, "nuvoton,npcm845-wdt"))=
 {
> > +             ret =3D regmap_read(gcr_regmap, NPCM_INTCR2_OFFSET, &rstv=
al);
> > +             if (ret) {
> > +                     dev_warn(dev, "Failed to read INTCR2 reset status=
: %d\n",
> > +                              ret);
> > +                     return;
> > +             }
> > +
> > +             if (rstval & NPCM8XX_RST) {
> > +                     ret =3D regmap_write(gcr_regmap, NPCM_INTCR2_OFFS=
ET,
> > +                                        rstval & ~NPCM8XX_RST);
>
> [Severity: High]
> Does this non-atomic read-modify-write risk clobbering concurrent modific=
ations
> to the shared INTCR2 register?
No, the INTCR2 is accessed only by the WD driver, and reads occur only
during the WD probe.
>
> Since INTCR2 is a shared global control register accessed by multiple dri=
vers,
> using regmap_read() followed by regmap_write() drops the regmap lock betw=
een
> operations. Any concurrent modifications to INTCR2 by other drivers could=
 be
> overwritten.
>
> Also, if INTCR2 contains Write-1-to-Clear (W1C) status bits, writing
> `rstval & ~NPCM8XX_RST` might incorrectly write 1s to all other active bi=
ts
> (clearing them) and 0s to the watchdog bits.
the INTCR2 is not contains Write-1-to-Clear (W1C) status bits.
>
> Could regmap_update_bits() or a W1C-safe write be used here instead?
It is not needed here.
>
> > +                     if (ret) {
> > +                             dev_warn(dev,
> > +                                      "Failed to clear INTCR2 reset st=
atus: %d\n",
> > +                                      ret);
> > +                             return;
> > +                     }
> [ ... ]
> > +             }
> > +     } else if (of_device_is_compatible(dev->of_node, "nuvoton,npcm750=
-wdt")) {
> > +             ret =3D regmap_read(gcr_regmap, NPCM_RESSR_OFFSET, &rstva=
l);
> > +             if (ret) {
> > +                     dev_warn(dev, "Failed to read RESSR reset status:=
 %d\n",
> > +                              ret);
> > +                     return;
> > +             }
> > +
> > +             ret =3D regmap_write(gcr_regmap, NPCM_RESSR_OFFSET, rstva=
l);
>
> [Severity: High]
> Will the first watchdog instance on NPCM750 clear the global RESSR regist=
er
> without caching it, causing subsequent instances to lose their reset stat=
us?
>
> The NPCM750 SoC has three watchdog instances that share the global RESSR
> register. When the first watchdog probes, it reads RESSR and immediately
> clears it by writing the value back. Because the value is not cached
> (unlike the SCRPAD10 mechanism used for NPCM845), when the remaining
> watchdogs probe, they will read 0 from RESSR and permanently lose their
> boot status indications.
Will be change in V3
>
> > +             if (ret) {
> > +                     dev_warn(dev, "Failed to clear RESSR reset status=
: %d\n",
> > +                              ret);
> > +                     return;
> > +             }
> > +     }
>
> --
> Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260622083046.31=
89603-1-tmaimon77@gmail.com?part=3D3

Thanks,

Tomer
