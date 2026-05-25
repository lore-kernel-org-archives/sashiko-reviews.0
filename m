Received: from mail-ej1-f48.google.com (mail-ej1-f48.google.com [209.85.218.48])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 99AE73469E6
	for <sashiko-reviews@lists.linux.dev>; Mon, 25 May 2026 10:29:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.218.48
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779704961; cv=pass; b=VdCyoNu9VfcCS30YyDpHRYGKNI4Z7wcDRbBjFlhGpv8OstF86XxHxQK96LMJTB+DuhbEymQuRlHt3d+z+v/1Z3ib0FCNfUYJa/KEdUKoaXwbX56Sml0SKTN3uXs/8dSGWwlvFChN3wDRHmvLaAQht/GLj806M8rHHbLoA46OF/o=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779704961; c=relaxed/simple;
	bh=m4poLpUZSwfopyL1c/7kDTVMFzXMRL0goIzi9c66ciw=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=o6pquoXtAiuhzvl2tIDsTbwZlL/S1OgJ1aD0DZyRcc47BWIkyZYl6kBgJt4wKKfcZqx2XXCxM9QdNuYfE2mpYSOxwIrc5+A88qXQ+KpDyOSrrxyuim0lH2SF3OLc+FxM6S0nOBxyMl94Yx8Zd0KD6mYSvSdF5sDRDPEWdIofSsI=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=flipper.net; spf=pass smtp.mailfrom=flipper.net; dkim=pass (2048-bit key) header.d=flipper.net header.i=@flipper.net header.b=wICHV4ST; arc=pass smtp.client-ip=209.85.218.48
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=flipper.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flipper.net
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=flipper.net header.i=@flipper.net header.b="wICHV4ST"
Received: by mail-ej1-f48.google.com with SMTP id a640c23a62f3a-bd85ebb368fso1381100366b.1
        for <sashiko-reviews@lists.linux.dev>; Mon, 25 May 2026 03:29:19 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1779704958; cv=none;
        d=google.com; s=arc-20240605;
        b=KewIWaoUWN4xv/H8Y4mJsYewRgJJrXlr+pb2KlT5ybH1QDAPJ1VcDYBab8+Y6dWeD5
         8Rq0+xFYxTYm49sMyIMeOybTqegI7idwsmK9edp4XZr3AKNS5HevdFomJqfOZWYUCxJw
         HVH/ICzDfPigtqqzdU9UEOhbtnzNXTGVOE37wCSW1nPcr0acgPHZyPGTsWGRZaJgeox5
         giCgiSWKl8GY2Sm3N91YyPdZ22RM/tACmSAhEHurmQ3KXBrVBPiz5R/s00N67xstaTtc
         X39gPqKL5nANCx5gp6JM/v9Du4b4uK7Pmz+kLPt4Lw+tA2WoO9qrVAn7uq4hOSkSpAwh
         eEhQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=2zjYk1b3PjwohyltiHt7C7R4stIFaGLsaAw0WYacxCA=;
        fh=q2oa1ekct7KR5WHTVsuodzZeNY7MhQ5926J4NNvSleA=;
        b=L2ecHDjKY/c1O4yjbO54v8CFa/sOtM5ToW6cn/IZHV2ftLyfJFgFfbQcswosq6DY00
         W+8bpeBXdTjnjOPcxHbMjHHv2UBaGgfCHrZF3jhfl14wZIfFOahl7FcH4L3B8VCsVAlq
         Rzybj9xWcSiRkP9ibgvv7BWsx8Y1J+/mKeyDlbnomgdQUSQi0kTAAriVTPcb1IHURLn5
         CBIi4YuipySaXME1k6OiSQksg6mcZFM6QsNX+yZq4+1Ss+7J+OZNC0Ay8Nm16F/ZasCZ
         EVijqZ1Xg+56wpd1s+FIs75nZ+OrMlFBhYQTIz3/EE6G0zozVIn6Gg37ATdVCbPf5uW1
         XdBw==;
        darn=lists.linux.dev
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=flipper.net; s=google; t=1779704958; x=1780309758; darn=lists.linux.dev;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=2zjYk1b3PjwohyltiHt7C7R4stIFaGLsaAw0WYacxCA=;
        b=wICHV4STTxLL76tdu9H/286HKQaUdJeHN0BzcWS+Z513q/DWfSqCK/DOUJdHVCpPpw
         56GIr7bw5n3oz1oDBc1c7yTkRKotKvWSp7m79lzjQvWC315zUiTFMxwrwZBny0ehbEUS
         iwn9hhGiidQWNvLiw+oxqFn5cbtk9zOsOswB+XJ2Vn+yzKk4+tuZYDj4xokJewUsBpJZ
         2WLE20DDt9+BqZuIaEqB2/JjxWhbfZi477dbb48VDHPZ5wXGUvVRR3rExdw9L9C2Axbj
         F3N2+4+gjiPuLcUoHeIKhg0ZhxZ86OhFOMdp/xbuCj+iy3Ciqjp2J7XRy0ZkLbGybhw5
         +2eQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1779704958; x=1780309758;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=2zjYk1b3PjwohyltiHt7C7R4stIFaGLsaAw0WYacxCA=;
        b=rqgj2SFjEqNwx5QmZZBt1ZGHAsfbG5nanDUBbELV3iQ1SwjxYnMqg0dnpUkFv/XPWX
         onOJTuqRwPu6MlMs9BghOU0IP4aYeCaGwm8RUOcHiUl5SbfJFIHMr2gX0yPbJT8vUtV6
         efGp4nIcxbvTVZqKyakmtyqxUwsFGyN3yPP+wkGMQv9a3goFVQ1bsX//cjd/9wCDOwEl
         33c287zE4joYRavwFb60Y8x8W8y+rrnBGBPwavO7lR53jUjbwHxg8ZQ3WOe5qaq0I7QQ
         igMdrv1AX4Vvw32qXWCE981zCy+t25mNV0ceX7KaFvnZBiDqPibP659NCopO/kfWhfq6
         coUQ==
X-Gm-Message-State: AOJu0Yym9+3U/q5LewkSNb4+pNJG9bYh0iz78rCGFNKEKhFMRulIGbko
	S1G8uuBR5XlBxrvAVAy0uwf2nWizh6VAh8h1Gcr45wgBUgbP8ax/yRxxGMMxvBNF8PbfoR3clhC
	LZoDEo8WDnICsWHXYyMY1J+0bCUumvFFx5/r+aXWw+Gr+6lWtP5JDipuvTR/F
X-Gm-Gg: Acq92OGKonmmoDWZF4DvYFVMEGDSRY37IaGkaa1Qv7fchuh/ZYfeUgb0f+2hdUwAlK6
	1wQ6t2jY2UMHh2uMXOwm62D5zoqjazjRI2xBdsAk67n5+YXrIMmwbTZoC1N9Jb3yWjAKihORKcV
	U24mTu8RnX/PUiHXD15XfwTtaH0TxBPU8cMvhWaO8liF4zli13plXzmRGKKI0yZ3EgpoY+VII0P
	r87V2O3M79ZLu+4VUUyuNzlguN1B3hItelJ23VC0ZrTPNsCWcucS8Cmdq/IJBVpnMlzG3iZjFIl
	nSlZAlveaJwvIcRbv5Xw2qIobSWDgFW+LLAqOY7EkUNDoZi5GNA=
X-Received: by 2002:a17:907:97c6:b0:be2:3784:321c with SMTP id
 a640c23a62f3a-be2378432damr27174266b.14.1779704957915; Mon, 25 May 2026
 03:29:17 -0700 (PDT)
Precedence: bulk
X-Mailing-List: sashiko-reviews@lists.linux.dev
List-Id: <sashiko-reviews.lists.linux.dev>
List-Subscribe: <mailto:sashiko-reviews+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:sashiko-reviews+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20260525-nau8822-reg-v2-2-7d37ae393e46@flipper.net> <20260525095110.A5DFD1F000E9@smtp.kernel.org>
In-Reply-To: <20260525095110.A5DFD1F000E9@smtp.kernel.org>
From: Alexey Charkov <alchark@flipper.net>
Date: Mon, 25 May 2026 14:29:12 +0400
X-Gm-Features: AVHnY4L4kWcY39eUS8a0Rb31wbcqizeGPlz0iTI1nmjxINscceGgui6DSgIQ-aw
Message-ID: <CAKTNdwHMixtVodANo3GyR0mjUFJ6d=GEe+BBD6GsNgzMcViX1Q@mail.gmail.com>
Subject: Re: [PATCH v2 2/2] ASoC: codecs: nau8822: add support for supply regulators
To: sashiko-reviews@lists.linux.dev
Cc: robh@kernel.org, devicetree@vger.kernel.org, conor+dt@kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Mon, May 25, 2026 at 1:51=E2=80=AFPM <sashiko-bot@kernel.org> wrote:
>
> Thank you for your contribution! Sashiko AI review found 2 potential issu=
e(s) to consider:
> - [High] Manually disabling regulators in the I2C `remove` callback break=
s the LIFO teardown order, causing I2C operations to fail during `devm` com=
ponent teardown.
> - [Medium] Unconditional regulator disable in the `remove` callback can c=
ause an unbalanced disable if the device is removed following a resume fail=
ure.
> --
>
> commit 9b4fbe6b13298617ee870787131ce69e29d799b3
> Author: Alexey Charkov <alchark@flipper.net>
>
> ASoC: codecs: nau8822: add support for supply regulators
>
> This commit adds support for the four power supply pins on the NAU8822
> codec by requesting and enabling them at init time. It also adds a brief
> delay after power up to allow the device to stabilize before register acc=
ess.
>
> > diff --git a/sound/soc/codecs/nau8822.c b/sound/soc/codecs/nau8822.c
> > --- a/sound/soc/codecs/nau8822.c
> > +++ b/sound/soc/codecs/nau8822.c
> [ ... ]
> >       ret =3D devm_snd_soc_register_component(dev, &soc_component_dev_n=
au8822,
> >                                               &nau8822_dai, 1);
> >       if (ret !=3D 0) {
> >               dev_err(&i2c->dev, "Failed to register CODEC: %d\n", ret)=
;
> > -             return ret;
> > +             goto err_reg;
> >       }
> >
> >       return 0;
> > +
> > +err_reg:
> > +     regulator_bulk_disable(NAU8822_NUM_SUPPLIES, nau8822->supplies);
> > +     return ret;
> > +}
> > +
> > +static void nau8822_i2c_remove(struct i2c_client *i2c)
> > +{
> > +     struct nau8822 *nau8822 =3D i2c_get_clientdata(i2c);
> > +
> > +     regulator_bulk_disable(NAU8822_NUM_SUPPLIES, nau8822->supplies);
>
> [Severity: High]
> Can this manual regulator disable cause I2C bus errors during teardown?
>
> The ASoC component is registered with devm_snd_soc_register_component(),
> which means the subsystem will unregister the component during the devres
> cleanup phase. This happens after nau8822_i2c_remove() has already
> returned.

While I can move the regulator disable to the component .remove
callback instead of i2c .remove, I'm wondering how the unregistration
is supposed to work at all with a removed i2c device if it's indeed
structured the way Sashiko implies. Doing so would make it
semantically unbalanced, which feels wrong (enable in i2c device
probe, but disable in component remove, where component lifetime is
less than i2c device lifetime? Ouch)

Any guidance would be appreciated.

I see existing drivers use both ways:
- Disable regulators in component .remove: e.g. [1]
- Disable regulators in i2c device .remove: e.g. [2]

[1] https://elixir.bootlin.com/linux/v6.19.9/source/sound/soc/codecs/es8328=
.c#L824
[2] https://elixir.bootlin.com/linux/v6.19.9/source/sound/soc/codecs/rt5645=
.c#L4300

Or maybe I should just switch to devm_regulator_bulk_get_enable and
forget about the remove callback altogether - unless I'm missing some
other subtlety here.

> Because the regulators are disabled here, the hardware will be unpowered
> while the ASoC component is still active. During devres cleanup, the
> subsystem will call snd_soc_dapm_shutdown() and transition the bias level
> to SND_SOC_BIAS_OFF.
>
> Will the resulting I2C register writes to the unpowered codec fail or
> time out, potentially stalling the driver unbind?
>
> [Severity: Medium]
> Could this unconditional regulator disable also result in an unbalanced
> disable warning?
>
> If the system resumes but nau8822_resume() fails to re-enable the
> regulators, they will remain in the disabled state set during
> nau8822_suspend().
>
> If the driver is later unbound, this call will execute again. Will this
> attempt to drop the regulator reference count below zero and trigger a
> kernel warning?

Most likely yes. I'm not sure though if coding around this case is
worth the trouble, and other drivers don't seem to bother. The system
must already be quite broken if it can't re-enable regulators at
resume, and in that case, another harmless kernel warning is probably
the least of the user's concerns.

Best regards,
Alexey
