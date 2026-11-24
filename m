Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.221.45
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1795500573;
	b=DUV9jFejp9DLIaR4uYV5nON3VqJYknxl3MdOKumJ4G4JSpw6IhfTpz5QAygH/BBv3GNQ
	 eabDA07e0troqgTS8dJI79JMoZuQQckzHp5fuUiaFlZHJXQOCMyEo+OEO/Pkg/91oeJFL
	 N5TIeZFCr8mSvwfGYrO2WXdgm6yc46hZiiuWVZrDCi8Ma9tcXJ0XtIgNa0pivbxDdKvFV
	 tSsXPszfBq2Vkek0+064LU/eZIFSU/K0QXijjzIvXyVM014OMgk54XoxmtpH+KVOCSOTd
	 xyKCe3mE4s5oLX/UQHfdSDS0FYkpWjqBO0PR4clILZ8v9UXKwZ3P8jyJ1nWSC+PCQCA==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795500573;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:MIME-Version:References:
	 In-Reply-To:From:Date:X-Gm-Features:Message-ID:Subject:To:Cc:
	 Content-Type:Content-Transfer-Encoding;
	bh=Unmz5fGYEvX56+imjPXFeVnLj491/aA9h3Sgmra885A=;
	b=MGUA1k8NOc9F7FA59CiMZMVERHhvCHb5hHbYPTdpLAqGXJo1d9evE2U9O134I0vSMU0s
	 Zr2AgD9XE6rgFfEL/dNaqCZ+uf26k84QhXJXuJDfzzHciYdwoTNIX/6pDIbTclx1N8Ww0
	 4hLcSYsLfYC66ARSVsHoYjJ9reAds6azb7u/a/oK3ZIZzy0mtTG8Y0I6+KFOYAK29OPKN
	 PYXe3ATWkiijvwiFVcyvBTVNk4Ky+YmPTsJudAcIYJAM+TVH0IzzDEnSAqYXeWXn8fAap
	 /dN8ZcglFyIH0F2fTZK0fF+bCWi0RrJb6mPy4yYBAKbwj5eEIwMSIJKHPfjN3QUKWZw==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=hwvOVU3p;
	arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.221.45
Received: from mail-wr1-f45.google.com (mail-wr1-f45.google.com [209.85.221.45])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 409CB606A31E
	for <sashiko-reviews@lists.linux.dev>; Tue, 24 Nov 2026 06:09:33 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 409CB606A31E
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=hwvOVU3p
Received: by mail-wr1-f45.google.com with SMTP id ffacd0b85a97d-4ac109a8a12so2340144f8f.3
        for <sashiko-reviews@lists.linux.dev>; Mon, 23 Nov 2026 22:09:33 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1795500571; cv=none;
        d=google.com; s=arc-20260327;
        b=jy/6fNsDwOMpEIemmzfF5Yw0xeN3IfmH8aZUFkDTocdUXur8KXvVKhLIY/Sbm6TuOp
         j4QNzAvBkZH57Knc6DTdAknovL91czksWVSElymDgLhHn69N8FugU2LoTrX70NJOQNT9
         85/CZFFSWPOu1AC9ndlCCZZdUd/gtZElTPhezAv8y27war59PKkzizWsO9uypJkWokK4
         jfx/VT2fWxH4n6CQGXh+Xufy3cBjV2p/CizY0AZV3cf9AmZn15JOx040cdyAcZIPUnvO
         ElZUZTSYQByCygyCUL2LiXlyjPufTjBgXSf34j+rIx9yhrjobPqT1rqYjGSELZyo845c
         3tbQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=Unmz5fGYEvX56+imjPXFeVnLj491/aA9h3Sgmra885A=;
        fh=j7qE0RlvzNR5Qm6xA4ehUDBqPqcz09gsE3Wa6zaxdUU=;
        b=edtc2H4PCsxw1bUZxknbzXf6tM6M9dZLyUiZOHPYvEOcUDYe83/AHB3xrFiA92aIog
         QY7FU0m7oZWRVEKl4wejs+2MpUqN5lgl/JG5MUUr9oKZ0lMxhdinExdEX70JpKbjdHMX
         40ypLnvzxKig7vd1kkOiQr9TgPzdg0z6IVhi1r7YiujoToG8Xa9Bzq/TsHgJXoko5Jlb
         ceaRlgtfFUy1+HpV+3HDycsSL/qdmUtR6c8+SzhKS0HHEq97IhXM/4GzUDra7HLk6jR+
         PswoyUqfBevyVyyHMI7a9IXls1b+GlTFcilxGOcknaUf+dSlPHSNYIshT5v6acVFk3hY
         Fzkw==;
        darn=lists.linux.dev
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1795500571; x=1796105371; darn=lists.linux.dev;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=Unmz5fGYEvX56+imjPXFeVnLj491/aA9h3Sgmra885A=;
        b=hwvOVU3ppMoxz0BXTN0rtm2MIAF9PWGyduir6dBnn4Ro0JQyGgMRh/jn5Z4P+W3JG3
         a8GeuPfO15GlvMIQcfXpHjVHDtdbYfI3bXZtMh2RIKpnQ7TF8D5vcU8UZQ9fvfmraWfi
         QvXEIE9Ce7gGSQtd2Zf4BV0eBe9Bm+6WUJedFNpdfxnE5rU1KQ3nSlWxvJcOWM7xWTP8
         Uy7HKV74jC1tdrcdhaarRboTCNDWNiXFuR1IKRL5oYhD2mGFSbfmtO45lkqqahhqtOMi
         LwahDVG/F8uSP/yBy2c/iRM727hqAwUw7nVgAGJni2ChKQs+ndgBIducKkGunfhLj9GG
         6hIw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795500571; x=1796105371;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=Unmz5fGYEvX56+imjPXFeVnLj491/aA9h3Sgmra885A=;
        b=1WIdpJYDsxvLre/6gTNBNJUZBDwXI2/MlOGiznnhywqGr9KzWJOlGD+RpFp4p0thuC
         jC19N6tJgMhnD1Ow7fpJkcy/7qbiwxK4EbquHcbRj2rmbbH0Aoty+VBV18of9peuqdM6
         iaKpUfbdNAjpslW/5j9gmf+Zl7eYp5E2wSUa7ulp1s9z5zxkGm7NjfbSdBABPgJR0xWb
         /ry5O8kFQ4HR3T6vekw63Iig52NMW6RFMuW4OCwyyLiXAZSk0Is9NJynaRW3yqDgGc2o
         34hL/iFaFWNM/W85X3YUyLRSH4NI1B5oHHOpjzH8p4Nz5JpaK28GV7JKhb7Bhq3sV2Oo
         OWew==
X-Gm-Message-State: APuU4Z/baPxjR6utdqj1wWhdNx0pJmoJsfcu1rmh5Fh+Aqtf3dc2l0ym
	hefo6qXiJKmgxJc/EPxptSVua1LMe290w7mD8toOibg98Klilqs9fBtRYndpqe3RPUEuOL4+UIF
	e0QtW3et5GN+JpkkaLADIHT5xpGYPRMdtV5Cq/y8wLQ==
X-Gm-Gg: AZFdTZfzOATJJdv+QJSvpxbndMjb+LjOyMyOsQvICHNlEkEGNohflqD3PHER32cMm5f
	2nUhfQ05ct8AtM0rdzpuTUi82MIIs7a5RoubzEUopLktqfBsyU2jPKLjt5IpqsJLwYzNK1c+Fsv
	r64MnmT3PL3ckvriA4ysvCz6wCpAIlQ43ANtpkpjZtD3Bh/BGO+1Sjs0aGSmxbUcbY4usYKrjDi
	xyAX63L7RW+smB/pcqmp2M3CnqKu+ZAVWGA9NNePMZje/ZbnXVqIQS9Oyj/Iou08u20bjvfGbna
	iMJHjod+jtsGqaIzXiyjqXc2lp0Zv+hluLDkDGIrM3t0UGA7+3hpiSgfRAqDD0DM71u/uSbFfYK
	OwzBt2Ms9Fn+QGZ7Mhb4D7nG5gi/Ax8+7h8r5Zv0aILgFMvEGfEci+6tbopf84ufTNK7S1qZVAL
	WAom4ZQHkk7HMGmrnz/8pk01Y+cT1az5WbZwZTfImOVd0VAPyF0jmC
X-Received: by 2002:a05:6000:2c04:b0:4ad:2699:74ec with SMTP id
 ffacd0b85a97d-4ad269975e8mr26924185f8f.39.1795500571241; Mon, 23 Nov 2026
 22:09:31 -0800 (PST)
X-Mailing-List: sashiko-reviews@lists.linux.dev
List-Id: <sashiko-reviews.lists.linux.dev>
List-Post: <mailto:sashiko-reviews@lists.linux.dev>
List-Help: <mailto:sashiko-reviews+help@lists.linux.dev>
List-Subscribe: <mailto:sashiko-reviews+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:sashiko-reviews+unsubscribe@lists.linux.dev>
List-Owner: <mailto:sashiko-reviews+owner@lists.linux.dev>
Precedence: list
MIME-Version: 1.0
References: <20261124-arizona-jack-remove-v1-1-11d8ec426a41@gmail.com> <sashiko-outbox-230548@kernel.org>
In-Reply-To: <sashiko-outbox-230548@kernel.org>
From: Wong Steve <shyckless@gmail.com>
Date: Tue, 24 Nov 2026 14:09:19 +0800
X-Gm-Features: Aa3M54qpM4MPvk0QbJ2lKAWT8ovgFTxZNio6uwGbDoyWApLaveGT2J3sZlXU4gY
Message-ID: <CA+X8SdjnZLuJs4LK=o_XsEBD_TaPiYX-gn-Jip8hV7iretWspA@mail.gmail.com>
Subject: Re: [PATCH] ASoC: arizona: Disable jack detection when the component
 is removed
To: sashiko-reviews@lists.linux.dev
Cc: linux-sound@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

> - [Medium] ASoC: arizona: GPIO UAF in arizona_jack_codec_dev_remove() on
>   codec unbind
> - [Medium] ASoC: arizona: stale jack and HPDET state in
>   arizona_jack_disable_jack_detect()

Thanks, both are right. On codec unbind the platform remove callback
runs before the component is removed, and disabling jack detection
during a headphone measurement or before a rebind leaves state behind.

I'll send a v2 that also disables jack detection in
arizona_jack_codec_dev_remove() before the GPIOs are put, and makes
arizona_jack_disable_jack_detect() finish a running measurement and
reset the detection state. Mark, please don't pick up v1.

Thanks,
Suyuan

<sashiko-bot@kernel.org> =E4=BA=8E2026=E5=B9=B411=E6=9C=8824=E6=97=A5=E5=91=
=A8=E4=BA=8C 13:17=E5=86=99=E9=81=93=EF=BC=9A
>
> Thank you for your contribution! Sashiko AI review found 2 potential
> issues to consider:
> - [Medium] ASoC: arizona: GPIO UAF in arizona_jack_codec_dev_remove() on
>   codec unbind
> - [Medium] ASoC: arizona: stale jack and HPDET state in
>   arizona_jack_disable_jack_detect()
> --
>
> commit 64c10974d73769b43875985100c8e416d589c894
> Author: Suyuan Wang <stevewong@hust.edu.cn>
>
> ASoC: arizona: Disable jack detection when the component is removed
>
> This commit calls arizona_jack_set_jack(component, NULL, NULL) in the
> component_remove callbacks of the wm5102, wm5110, wm8997, and wm8998
> codec drivers to disable jack detection on teardown.
>
> > diff --git a/sound/soc/codecs/wm5102.c b/sound/soc/codecs/wm5102.c
> > index 762e81979cb8d..43df7cb46b599 100644
> > --- a/sound/soc/codecs/wm5102.c
> > +++ b/sound/soc/codecs/wm5102.c
> > @@ -1982,6 +1982,8 @@ static void wm5102_component_remove(struct snd_so=
c_component *component)
> >  {
> >       struct wm5102_priv *priv =3D snd_soc_component_get_drvdata(compon=
ent);
> >
> > +     arizona_jack_set_jack(component, NULL, NULL);
> > +
> >       wm_adsp2_component_remove(&priv->core.adsp[0], component);
> >
> >       priv->core.arizona->dapm =3D NULL;
> > diff --git a/sound/soc/codecs/wm5110.c b/sound/soc/codecs/wm5110.c
> > index faa85d88a489b..c772f4380ae7d 100644
> > --- a/sound/soc/codecs/wm5110.c
> > +++ b/sound/soc/codecs/wm5110.c
> > @@ -2340,6 +2340,8 @@ static void wm5110_component_remove(struct snd_so=
c_component *component)
> >       struct wm5110_priv *priv =3D snd_soc_component_get_drvdata(compon=
ent);
> >       int i;
> >
> > +     arizona_jack_set_jack(component, NULL, NULL);
> > +
> >       for (i =3D 0; i < WM5110_NUM_ADSP; ++i)
> >               wm_adsp2_component_remove(&priv->core.adsp[i], component)=
;
> >
> > diff --git a/sound/soc/codecs/wm8997.c b/sound/soc/codecs/wm8997.c
> > index f041dfc905a42..aa9f23ddd9975 100644
> > --- a/sound/soc/codecs/wm8997.c
> > +++ b/sound/soc/codecs/wm8997.c
> > @@ -1077,6 +1077,8 @@ static void wm8997_component_remove(struct snd_so=
c_component *component)
> >  {
> >       struct wm8997_priv *priv =3D snd_soc_component_get_drvdata(compon=
ent);
> >
> > +     arizona_jack_set_jack(component, NULL, NULL);
> > +
> >       priv->core.arizona->dapm =3D NULL;
> >  }
> >
> > diff --git a/sound/soc/codecs/wm8998.c b/sound/soc/codecs/wm8998.c
> > index 1158e9ca40a13..47adbcd80e077 100644
> > --- a/sound/soc/codecs/wm8998.c
> > +++ b/sound/soc/codecs/wm8998.c
> > @@ -1301,6 +1301,8 @@ static void wm8998_component_remove(struct snd_so=
c_component *component)
> >  {
> >       struct wm8998_priv *priv =3D snd_soc_component_get_drvdata(compon=
ent);
> >
> > +     arizona_jack_set_jack(component, NULL, NULL);
> > +
> >       priv->core.arizona->dapm =3D NULL;
> >  }
>
> [Severity: Medium]
> When a codec platform device is unbound while a card is bound, can a jack
> IRQ or delayed work use info->micd_pol_gpio or info->hpdet_id_gpio after
> they have been freed?
>
> The codec drivers register their ASoC components with
> devm_snd_soc_register_component(), whereas their platform_driver.remove
> callbacks call arizona_jack_codec_dev_remove() directly.  Because
> snd_soc_card_bind() creates a stateless device link, unbinding the codec
> runs platform_driver.remove before devres_release_all() unregisters the
> component and invokes component_remove:
>
> CPU0                              CPU1
> wm5102_remove()
>   arizona_jack_codec_dev_remove()
>     gpiod_put(info->micd_pol_gpio)
>     gpiod_put(info->hpdet_id_gpio)
>                                   arizona_hpdet_irq()
>                                     gpiod_set_value_cansleep(
>                                       info->hpdet_id_gpio, 0)
>                                       <-- use-after-free
> devres_release_all()
>   ...
>     wm5102_component_remove()
>       arizona_jack_set_jack(..., NULL, NULL)
>
> Calling arizona_jack_disable_jack_detect() inside
> arizona_jack_codec_dev_remove() before dropping the GPIO descriptors
> (while keeping the call in component_remove for card unbind) would close
> this window.
>
> [Severity: Medium]
> If the card is unbound and bound again while a jack is plugged in, does
> stale state in struct arizona_priv prevent the newly bound card from
> detecting the jack?
>
> info->last_jackdet is only initialized in arizona_jack_codec_dev_probe(),
> and neither arizona_jack_disable_jack_detect() nor
> arizona_jack_enable_jack_detect() resets info->last_jackdet or
> info->hpdet_done.  When the card is rebound and sets a new snd_soc_jack,
> arizona_jackdet() sees val =3D=3D info->last_jackdet and suppresses the e=
vent
> instead of reporting the inserted jack, and stale info->hpdet_done causes
> arizona_identify_headphone() to skip headphone detection.
>
> In addition, if arizona_jack_disable_jack_detect() runs while an HPDET
> measurement is in flight (info->hpdet_active is true), freeing
> ARIZONA_IRQ_HPDET prevents arizona_hpdet_irq() from clearing
> arizona->hpdet_clamp and dropping the pm_runtime_get_sync() reference
> taken when starting HPDET.
>
> --
> Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20261124-arizona-=
jack-remove-v1-1-11d8ec426a41@gmail.com?part=3D1
