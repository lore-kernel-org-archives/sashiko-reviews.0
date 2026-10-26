Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.210.178
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1792980636;
	b=z4GSh345WUb6aKDrNVD6MOFTAvf7s/CDVaFx5OYC914cb1OJhIjiSBjExQ1k+ViNQqmB
	 vnb+ueKwR+y4jlRmSg7t7hDcREmjH/C6Sjt/S2OPS2bPNCXVB0RZCkYK+a7t0orCupZp+
	 dQsRPgZl/SOKeZvOn1HChhheu2KIz8JqcuBdPcJ8uuDioSioEl4/MoO0cEAr2VZ4z3hJL
	 iYz6IHcPnT59p1OODqgfGywl6xCNA+u6qN6CuH4c4PPP6bI989Ef80ILCWyju3ZMOzCq/
	 SPyVsY2ClUquGOwXxE12taiw9JJQqRzy1hQ+CNa2f8603NsMjyFVNCXHRahr4kEVwWA==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792980636;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:MIME-Version:References:
	 In-Reply-To:From:Date:X-Gm-Features:Message-ID:Subject:To:Cc:
	 Content-Type:Content-Transfer-Encoding;
	bh=PhozeamFwuWtPyIKg2kpa7YRAXXBYhqW3aJ0bO6CqHQ=;
	b=hqPrkVPjJ59DSRMAJmKdG7giKobgiHTtfSg6GJOK7dwk2CQuMCi3aQJ9dY5NNTZbmXtO
	 QyDHoBE2AmjApfJALtza4bgRYVLngT+MOHGybErFKfwBV089JUeE4vr0fDp1e7GTYJo8r
	 5dqxl3v6H4lLOu9Xi975fZ2s+5iwMKHXsMDz2ItWNzwN0tF1hkNt4P88VIs6fmCetW33j
	 Wpsrj6VxR4f3sRJW2SRbBcPSQ1msGCaUVskNyBF9O6NF0NNkAGLav7azpWAhqhpyGl4tu
	 qoJci0nCgFim5fR5VG87GFGnkl5JSaNxtkXeKKE6qNPRofHG6hAUl0Vr21UeF34T6bQ==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b=k6+0IVKn;
	arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.210.178
Received: from mail-pf1-f178.google.com (mail-pf1-f178.google.com [209.85.210.178])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F2417606A31F
	for <sashiko-reviews@lists.linux.dev>; Mon, 26 Oct 2026 02:10:35 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org F2417606A31F
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b=k6+0IVKn
Received: by mail-pf1-f178.google.com with SMTP id d2e1a72fcca58-8a39e5161c1so748445b3a.3
        for <sashiko-reviews@lists.linux.dev>; Sun, 25 Oct 2026 19:10:35 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1792980635; cv=none;
        d=google.com; s=arc-20260327;
        b=Hk1bSWm2Y4MmxXnkmAOuF5lR9sLSXrnVYYyeLtfPegsuHJiIBij1Zd7Ra16C9FNsDT
         j6pLBJwJIyohZfx2GJTVo/lC0aXc4IWt2zKYP1hhRM55B+NYwi6IeemNcfT6o8If8V1t
         AWcU02ys41L6xh0zZwDU8Jn0uIW0ausLbU6BBrzI0zupN21v9LlN3VvGzfBmh09rAMeH
         mnnKkTsKG1bR3Xu2BnZpUHXD/Sgi+/zxEoaQWjWoWAIasc504oWzYgWpU8k26erEV0Xi
         4hf3yihQ0poGkaHqnhUMLlWpAQC4Ghv/KPnEbGPEcczVo5ClMN6AcUe3x9We+E0Ymi7a
         EczA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=PhozeamFwuWtPyIKg2kpa7YRAXXBYhqW3aJ0bO6CqHQ=;
        fh=5iYfhhOzHQWYhMEjFDrcuaE5tJLWVyDMSfmgXPYvEJ0=;
        b=jRGlnRMOxOw/5v6zHdEcThdaXgdYoz87xpRJV/PDs6QrLRVfZAYGUUjWCdkh2BF/ab
         sJwq0xEp+bySW39DRQVC4PWR2NmLUDjEf2sRJVijrHYr0WM6Xg3xCUgzet5/F6niwMpS
         g4KvBGAwExvVfj3Cjgw8JFz3ah/NGDyTSXyAgQuYXiQGexk5aAPeK9LcFgTgJhsB5JA5
         ehXJnn7G92FmCioTqU5PMhaWhQaVG12N0lTnOA8EnaKNqwJ0qoWp0VEm2WnlxCG9/tiB
         meKABeHRgImVLWP8Ogmvltjxc8PKor0A3iJ4oH+llipFNFJt866otUIIkqfmF9SWZD2S
         tGYw==;
        darn=lists.linux.dev
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1792980635; x=1793585435; darn=lists.linux.dev;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=PhozeamFwuWtPyIKg2kpa7YRAXXBYhqW3aJ0bO6CqHQ=;
        b=k6+0IVKnFqcZTXYaP4pdeiqIra7t+p7uptYDPo2Itvu/nX9pUQCe9/uAMOSpJY9S/V
         uj9uglSGzJHGCNhB2rldXY22tX9Em+aGkOmYwOoax/Fm8UtlKM86n7oM9wqxOcUmGlPI
         dYdXd7fQBKVIgXfYgAMUO5Hw1rixrgJBvhkArYll3i4A+lymnA6aq0lB9KkawSUWE0vp
         ZOaG76Sqt3RBffQSyOnBYcP04LLsroqb9wyic3xt+UxVK/+ZIW4ZN5qRK/LNxZxP+mDI
         w0jmD4li4WYf4nmEtfsT8ru5s2JO0xwZbP5OfsDeSAknZvZL2UV9gobZll1Ee2+VmQMi
         3v4A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792980635; x=1793585435;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=PhozeamFwuWtPyIKg2kpa7YRAXXBYhqW3aJ0bO6CqHQ=;
        b=ODRS4wX8k4csrOsW/ZLQr/u7q/EtrJ2u+2ljyqqjl9EYmYN9vcGMCtXZqvoyKmgsUW
         w05KakcWBlQ+9VlievrT4r7xFH5UEf5pPAulVcr5r9m1E8F70EOrAswPwrGbJs+8DdzM
         +5vrS49auL1DtOJr52uVTb5CqkWp+8aeVmuViBnNFpBu/UyESXzDC6DtQxci0XcB6IM0
         HiL7bPSZOV48DK3zAN3fi6BMcvw86HWyYsaELE58M6n3ucew+egysNkHQ4BY3Uo6qx4O
         jpJE5fFsbPrB2FpaUWZdXlnWWidvpzvDmU3QJdQVMFnY7VCNWUrEUkWXPmYBXfSRH9P1
         ud9w==
X-Gm-Message-State: AFq9FYLP9DJs98HnNdgQqFS4D4R9wINAIQO50XBXBDHjB3ZH9LttU94a
	9a5ggHmajqifgQE367hAX5GEZOXNKWwuKpBkczr5UmwQo2gJUbHDV8MLdiIlTWO0uau0tBuYiSg
	S8FOdVTYOd6PHzhAKr9NL/AxBiPycP3A3vHo3TEINaeWH
X-Gm-Gg: AYBFou2OtxtlPPMT3Nf7lVXQxy8vKLLtZDUCrPo3L530u3rS+A6iSYi/EdiOQtXg1Wr
	lmbwfhJsXOaix01KD/fzK3xJSwO8BXLpCoaJ9JYKAnItskEVz3lFSLOMVxWP+dmt2sJk3cwGwEc
	PSL0nhDQLZ9PgxuKYRLEVp+AHhPES4p/OhQycwhd/xEzqChCaeerE+bWAf+Ks5O1uWFht17FEpK
	PNs4NUbLEGQFjWkxPeTEJfEvEqwwDYxTcYuBdzh3IAnM/Mldua+bj++u2taSb2khllezN9TePQO
	An9645D65ct/kUn++prQNBg8q5Q0ujW0JKhPnn4JoB5qb4rG0oYcYOIgSB2ftU8MW2E5s750b7B
	v3brvs7iSYFH3c1oyvcCJL2JsO6FKBJ/PnjqudZuiHlG/1UlKZ8HA
X-Received: by 2002:a05:6a21:3f92:b0:3e1:a769:9620 with SMTP id
 adf61e73a8af0-3e7cd688935mr3859739637.71.1792980635201; Sun, 25 Oct 2026
 19:10:35 -0700 (PDT)
X-Mailing-List: sashiko-reviews@lists.linux.dev
List-Id: <sashiko-reviews.lists.linux.dev>
List-Post: <mailto:sashiko-reviews@lists.linux.dev>
List-Help: <mailto:sashiko-reviews+help@lists.linux.dev>
List-Subscribe: <mailto:sashiko-reviews+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:sashiko-reviews+unsubscribe@lists.linux.dev>
List-Owner: <mailto:sashiko-reviews+owner@lists.linux.dev>
Precedence: list
MIME-Version: 1.0
References: <20261026003918.155321-1-pmazzini@gmail.com> <20261026003918.155321-6-pmazzini@gmail.com>
 <sashiko-outbox-184583@kernel.org>
In-Reply-To: <sashiko-outbox-184583@kernel.org>
From: Pablo Mazzini <pmazzini@gmail.com>
Date: Mon, 26 Oct 2026 02:10:24 +0000
X-Gm-Features: AclHuK8r-7Bfel_EEhpHI86UjS9b9Nqlm9UoSS8x6HzK6eJI57dyjtwPozP_C4g
Message-ID: <CAAxh=jvoB5c94U+y3ZQ8ijjPH=kB2DuL_+r1EXXKrSZQq7ojCQ@mail.gmail.com>
Subject: Re: [PATCH 5/7] regulator: sy7636a: report the temperature
To: sashiko-reviews@lists.linux.dev
Cc: linux-hwmon@vger.kernel.org, mfd@lists.linux.dev, lee@kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

This follows the TPS65185 and FP9931 drivers, which register their
temperature sensor in the same way.

On Mon, Oct 26, 2026 at 1:35=E2=80=AFAM <sashiko-bot@kernel.org> wrote:
>
> Thank you for your contribution! Sashiko AI review found 1 potential issu=
e(s) to consider:
> - [Medium] regulator: sy7636a: registering hwmon device outside drivers/h=
wmon/
> --
>
> commit 3011502577fb90233215473b5182522faa4b0058
> Author: Pablo Mazzini <pmazzini@gmail.com>
>
> regulator: sy7636a: report the temperature
>
> This commit removes the dedicated sy7636a hardware monitoring driver and
> moves temperature reporting into the sy7636a regulator driver, reading th=
e
> thermistor register only when the rails are enabled.
>
> > diff --git a/drivers/regulator/sy7636a-regulator.c b/drivers/regulator/=
sy7636a-regulator.c
> > index 5705599d1b55e..816df7716c0e0 100644
> > --- a/drivers/regulator/sy7636a-regulator.c
> > +++ b/drivers/regulator/sy7636a-regulator.c
>
> [ ... ]
>
> > @@ -147,6 +148,52 @@ static const struct regulator_desc desc =3D {
> >       .of_match =3D of_match_ptr("vcom"),
> >  };
> >
> > +static int sy7636a_hwmon_read(struct device *dev, enum hwmon_sensor_ty=
pes type,
> > +                           u32 attr, int channel, long *temp)
> > +{
> > +     struct sy7636a_data *data =3D dev_get_drvdata(dev);
> > +     unsigned int mode, val;
> > +     int ret;
> > +
> > +     ret =3D regmap_read(data->regmap, SY7636A_REG_OPERATION_MODE_CRL,=
 &mode);
> > +     if (ret)
> > +             return ret;
> > +
> > +     /* the thermistor is only sampled while the rails are on */
> > +     if (!(mode & SY7636A_OPERATION_MODE_CRL_ONOFF))
> > +             return -ENODATA;
> > +
> > +     ret =3D regmap_read(data->regmap, SY7636A_REG_TERMISTOR_READOUT, =
&val);
> > +     if (ret)
> > +             return ret;
> > +
> > +     *temp =3D (s8)val * 1000;
> > +
> > +     return 0;
> > +}
>
> [ ... ]
>
> > @@ -235,6 +282,15 @@ static int sy7636a_regulator_probe(struct platform=
_device *pdev)
> >               return PTR_ERR(rdev);
> >       }
> >
> > +     if (IS_REACHABLE(CONFIG_HWMON)) {
> > +             struct device *hwmon_dev;
> > +
> > +             hwmon_dev =3D devm_hwmon_device_register_with_info(&pdev-=
>dev, "sy7636a", data,
> > +                                                              &sy7636a=
_hwmon_chip_info, NULL);
> > +             if (IS_ERR(hwmon_dev))
> > +                     dev_notice(&pdev->dev, "failed to register hwmon\=
n");
> > +     }
>
> [Severity: Medium]
> Should the hardware monitoring driver remain in drivers/hwmon/ rather tha=
n
> calling devm_hwmon_device_register_with_info() directly from
> sy7636a_regulator_probe() in drivers/regulator/sy7636a-regulator.c?
>
> Hardware monitoring drivers are expected to reside in drivers/hwmon/, and
> when a chip's primary functionality is in another subsystem, its hardware
> monitoring support should be implemented as an auxiliary or subdevice dri=
ver
> in drivers/hwmon/ rather than registering a hwmon device directly from
> outside drivers/hwmon/.
>
> While the follow-up commit ("regulator: sy7636a: bind to the i2c device
> directly") removes the mfd cell table in drivers/mfd/simple-mfd-i2c.c,
> sy7636a_hwmon_read() only accesses the shared regmap via regmap_read() an=
d
> does not depend on internal regulator driver state. Could the temperature
> reading check be kept in drivers/hwmon/sy7636a-hwmon.c (for instance via =
an
> auxiliary device registered by the regulator driver)?
>
> --
> Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20261026003918.15=
5321-1-pmazzini@gmail.com?part=3D5
