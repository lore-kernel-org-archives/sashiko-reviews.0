Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.216.50
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1793575158;
	b=qr3fmA4CVg/bwEcC2nuvYp0Oi8RMOqaq5DQJPv4GG5sBCCi6PAmj2xGFlNUfaItz2q6L
	 CSW5hqZyd/rcc4ng6xtF7WdAw37Zg29nIKVwSdd3ehwTYi81cFwGNlCY2w6Z6agrHRIZI
	 F5Sy4mvly2Y3beOyRJBP6o3zqIWzjjBe0Ja4ud6ZanR0FwSiSTBo0JqpcrP1qyPdWWExm
	 OKaJVlG0LojYU/2wIJyOv9EM6R2J6XO6ZeeD5wN3J3kA2PLSsAjIcDlxVXAIKKYNGwDoF
	 lJViaFseLsO2QKsxfghRa5Vzx+OmpUXuIPzhycqzHX2JVMEEx9MNBCibAzZfuC+Nlyw==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793575158;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:
	 MIME-Version:References:In-Reply-To:From:Date:X-Gm-Features:
	 Message-ID:Subject:To:Cc:Content-Type:Content-Transfer-Encoding;
	bh=OgokyJgZPmoFvmekackCrMWks/pVfhNUcYrltTftkwI=;
	b=enLS2b/d1CEchxluwF92Fa0x284/BEldYprsG5j3eLn47ERQ/pxnGeR2koN/PvwF0/q3
	 u2pXZE3leoTiiq3o0zUxIe+TuANxIqf6C6THkyyg2jZdfv6ORFUZ0ojd+vZ1tviQsmRNv
	 FfgR4dmPAuZiGormOxIROfPrknE8A1cnDIeuacYdwdbhjyq6RRa0StKsBg8LlZA2fs1Rq
	 OMb5Z6P3K/Ty7j/Zr98ywrFGefuM6RpujwvXq5XOHrb0Li3olhaomlvepfkPACcr55dqJ
	 47PySRnCSGU+AwFlYM75aGVuyy7hbL4SPW11/8MC6VkuY4OCxXRSznuxkgKN/AYFIgA==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=elNo1oRn;
	arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.216.50
Received: from mail-pj1-f50.google.com (mail-pj1-f50.google.com [209.85.216.50])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D8FB4606A326
	for <sashiko-reviews@lists.linux.dev>; Sun,  1 Nov 2026 23:19:17 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org D8FB4606A326
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=elNo1oRn
Received: by mail-pj1-f50.google.com with SMTP id 98e67ed59e1d1-3ab2cb8d577so1711597a91.1
        for <sashiko-reviews@lists.linux.dev>; Sun, 01 Nov 2026 15:19:17 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1793575157; cv=none;
        d=google.com; s=arc-20260327;
        b=SUcf6mIchktEWrSV1nkbsE6zSmjiRXbmkqvBTj9YUKk3mmlVtcrwwAWTSzLHaKPs+t
         otmvyejG3K4NlBR5m5YCv80Rt6DCBZiz7c2ZFRTCBmAEwiQPtAWSLf0zQGdyr2RHt4FH
         3o33i2+ewDY38wym/UnnUEvG0f8LF/X+OA/KNI64jC/UaSjJc0fqcn9boCekM01cTVA9
         gOkFKwhWMIMo7pRK+C+eS7xMBgXI4mWst3u05ojqV/vyUuZF7Hj29aSz+TE7oTTD9jE/
         31/3CDERgYGN6uuVchtI7Jy5zc3i0s0jFpQDGbazo3O2nzjJXlKwOQkwrtumMaFdSG2l
         KOdQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=OgokyJgZPmoFvmekackCrMWks/pVfhNUcYrltTftkwI=;
        fh=Bufre/RZAh0Oz7dfVyDi9Tz9Ab5kMUqAolUMvxdNMlo=;
        b=dmp9D5IJtg8Xj+VBcgVGHLwFL8kfeC8euYPVO4TPDZ904wUVGa10rnZg4llR8lfKBx
         t+iHCuNAnV90OayAeiGSNW0nDoKT7TZmE8xZXm/vZVi5CeDILjuj4VgJpA6u91D77XsL
         IireVBVA2GyLCrHO7mr0L7RQ11W3etWb4P6qy7byjmT9Eao+o0JzWGH2YhCAvaM9Ri7o
         MOhHOgq7LBx+51YyT4lM7bShviHal8N5qwveOtJIoQAAdeyHYose1e7JhfdNtJHPiujj
         kAFbK5D2fjJlQPQJO0VHRvemWCgATEkbuMalullDdcWDUKoab5q8O8fb0PKHqJOECcC8
         u9pA==;
        darn=lists.linux.dev
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1793575157; x=1794179957; darn=lists.linux.dev;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=OgokyJgZPmoFvmekackCrMWks/pVfhNUcYrltTftkwI=;
        b=elNo1oRnLjSoHGRiKXPuPgMBw2f9X9GUvCvaqi8H/ULT4VcdIdU09VJr5Hh13Bavd9
         Kg58/+9iLkwhdDvPdbJ+z56mLUP1RXzCE8VPEUm5AJIAPxs1xd1ACaATXBzFKUYO+lTu
         wHwJn2MBrRUD1NEhwm78cbyas+RQlTwkujNflirCcH8B/g6zK+hBArs1G9W82BzbhQKN
         v/JGEN7rwNZ5zW4ZOHCC012ea3bdJPDyjVgVXPbRovzY4CAmllpGIgaf4he3w/Rvuwqi
         jG+keQl+yFjkIece4OqhRp3MLPrw51BrXxX4t4VyQ4I0m4FMJMvVFUG87tMZ9aOzmH6x
         60CQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793575157; x=1794179957;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=OgokyJgZPmoFvmekackCrMWks/pVfhNUcYrltTftkwI=;
        b=NJEiDrTL7qAXrcfteZdgVJrt5xZv1pfm8GeVg7Rj68ElJkI4W0a5mR7Zt44KOJEW7o
         YvAsLXYcNnXtZwgwDsoG9kEM7JT5Oz4bG9LUpbLXTsSNaBDMwirU7ggUv3nKmTe+doOI
         05wm+ChbeNfaXyeBPdCvvv3iGm8L8rSA8Kmjr6UC3K9V+nqG/vCcTUJcjJa19/X9WYea
         HHIRBEVKAD3foHs3blI/EOH3nsTmQDoz4Hq3i4TofxlHt15Cg5Mnh/d9NwPD/KV12AoI
         ZXQBBEEyw6Hjz5TpTmaEhQ702xDO6C949welOXx1wf2qLdzhIA+wKeblF4E+8FMzB7v/
         zPEw==
X-Forwarded-Encrypted: i=1; AKwUvByBhDqhyCQcqIsx8+8IlzJ8y53Y1xXxVN+6lDs1mue7M4xzStIR6xflIWAs7pNdCUlPBfnLuUxBuAW3Qt6017s=@lists.linux.dev
X-Gm-Message-State: APuU4Z//bSUIxmgvG3EZ3o2bm+PY4Wu8paORwatBLSOsT7YPvGO1NQRO
	SJYkhGJKRLg4GgoXjEVUnFuCgvpAlNxITvP3O8Vv0PSWdXss1DVqGPPvJLMUDusQR+AhxEpYedr
	rZeERdbXfChPRjep1eICoX3AwqK62zDY=
X-Gm-Gg: AYBFou1GWwZaOpWxFxq9ZV33owkvVHAk2TYIYRJUZB6ZT5weWUbyBZ1lVWoEw2kDcBS
	Bpfs8kPCbkytdWaS8mSuRV7ETJBDWT/Qz903LpbUoRvz1FU0CG5f1AVMfHccHp0FsOTf8bBLtlj
	nxD4BZbfpZZqOOwqrE4qzwUD/Sql88RMpE2a74OC+9eRP4TWuX8lkXkX7gNSbjMv0EU5vKZUeQ1
	RJpWsX4SC/hTUnlhW8ApYewwDkEZNtQZ8mwWXHTGpg/VhykUkgdXZuBFLSigW8Ajq6c3L7mYy/A
	Yj9TUT/4POjMYg9XButPohqST/X5s0xk2KLt4xF/F80satQpwLMk2aMeLzJYiuH3kFTRlSAzEEt
	ZL7eR+5UEVqZP5rJeEEqntMXEWaI+3XSD1vXBSx/UKT3CAFJtYC6V
X-Received: by 2002:a17:90b:180d:b0:3ac:a204:aa27 with SMTP id
 98e67ed59e1d1-3ae8985edbfmr7252728a91.66.1793575157168; Sun, 01 Nov 2026
 15:19:17 -0800 (PST)
X-Mailing-List: sashiko-reviews@lists.linux.dev
List-Id: <sashiko-reviews.lists.linux.dev>
List-Post: <mailto:sashiko-reviews@lists.linux.dev>
List-Help: <mailto:sashiko-reviews+help@lists.linux.dev>
List-Subscribe: <mailto:sashiko-reviews+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:sashiko-reviews+unsubscribe@lists.linux.dev>
List-Owner: <mailto:sashiko-reviews+owner@lists.linux.dev>
Precedence: list
MIME-Version: 1.0
References: <20261101223125.302001-1-pmazzini@gmail.com> <20261101223125.302001-6-pmazzini@gmail.com>
 <sashiko-outbox-192738@kernel.org>
In-Reply-To: <sashiko-outbox-192738@kernel.org>
From: Pablo Mazzini <pmazzini@gmail.com>
Date: Sun, 1 Nov 2026 23:19:02 +0000
X-Gm-Features: AclHuK9xi2Gx2yZNeMpyMDXsD4VBMsSeY1I24W_gI-TNXeinEzyyjVyZpY76rRE
Message-ID: <CAAxh=jt4UV3iUkXYq9bnB7k8uayD1t4+BPdO4q+dAQM8tdeh_w@mail.gmail.com>
Subject: Re: [PATCH v2 5/7] hwmon: sy7636a: read the temperature only while
 the rails are on
To: andreas@kemnade.info
Cc: linux-hwmon@vger.kernel.org, linux@roeck-us.net, alistair@alistair23.me, 
	sashiko-reviews@lists.linux.dev
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Right. On the reMarkable 2 nothing in mainline turns the rails on.
Keeping the rails on is out, so I would drop the epd-thermal zone from
imx7d-remarkable2.dts in v3.

Andreas, is that OK with you, or would you prefer something else?

On Sun, Nov 1, 2026 at 10:51=E2=80=AFPM <sashiko-bot@kernel.org> wrote:
>
> Thank you for your contribution! Sashiko AI review found 1 potential issu=
e(s) to consider:
> - [High] hwmon: sy7636a: returning -ENODATA when rails are off disables t=
hermal zone
> --
>
> commit 72fc8d76dc4f0fe2ee1ec4e02805a6f20803ef65
> Author: Pablo Mazzini <pmazzini@gmail.com>
>
> hwmon: sy7636a: read the temperature only while the rails are on
>
> This commit stops enabling the VCOM regulator at probe, registers the hwm=
on
> device under the chip name "sy7636a", and reads the fault flag alongside =
the
> thermistor in a single bulk transfer, returning -ENODATA when power good =
is
> not set.
>
> > diff --git a/drivers/hwmon/sy7636a-hwmon.c b/drivers/hwmon/sy7636a-hwmo=
n.c
> > index f01f368d68e5f..475aff997c2d2 100644
> > --- a/drivers/hwmon/sy7636a-hwmon.c
> > +++ b/drivers/hwmon/sy7636a-hwmon.c
> > @@ -14,7 +14,6 @@
> >  #include <linux/module.h>
> >  #include <linux/platform_device.h>
> >  #include <linux/regmap.h>
> > -#include <linux/regulator/machine.h>
> >
> >  #include <linux/mfd/sy7636a.h>
> >
> > @@ -22,14 +21,22 @@ static int sy7636a_read(struct device *dev, enum hw=
mon_sensor_types type,
> >                       u32 attr, int channel, long *temp)
> >  {
> >       struct regmap *regmap =3D dev_get_drvdata(dev);
> > -     int ret, reg_val;
> > -
> > -     ret =3D regmap_read(regmap,
> > -                       SY7636A_REG_TERMISTOR_READOUT, &reg_val);
> > +     u8 buf[2];
> > +     int ret;
> > +
> > +     /*
> > +      * Read power good and the thermistor in one transfer: the thermi=
stor is
> > +      * only sampled while the rails are on, and power good comes afte=
r the
> > +      * first sample
> > +      */
> > +     ret =3D regmap_bulk_read(regmap, SY7636A_REG_FAULT_FLAG, buf, siz=
eof(buf));
> >       if (ret)
> >               return ret;
> >
> > -     *temp =3D (s8)reg_val * 1000;
> > +     if (!(buf[0] & SY7636A_FAULT_FLAG_PG))
> > +             return -ENODATA;
>
> [Severity: High]
> Will returning -ENODATA in sy7636a_read() when SY7636A_FAULT_FLAG_PG is
> cleared cause the thermal core to permanently disable the attached therma=
l
> zone when the rails remain off?
>
> In drivers/hwmon/sy7636a-hwmon.c, sy7636a_info sets HWMON_C_REGISTER_TZ:
>
> static const struct hwmon_channel_info * const sy7636a_info[] =3D {
>         HWMON_CHANNEL_INFO(chip, HWMON_C_REGISTER_TZ),
>         HWMON_CHANNEL_INFO(temp, HWMON_T_INPUT),
>         NULL
> };
>
> In arch/arm/boot/dts/nxp/imx/imx7d-remarkable2.dts, the epd-thermal zone
> binds to &sy7636a with a 30-second polling delay while the vcom regulator=
 only
> specifies regulator-boot-on:
>
>         thermal-zones {
>                 epd-thermal {
>                         thermal-sensors =3D <&sy7636a>;
>                         polling-delay-passive =3D <30000>;
>                         polling-delay =3D <30000>;
>
> When the thermal zone is polled while the EPD rails are off, the call cha=
in
> __thermal_zone_device_update() -> __thermal_zone_get_temp() ->
> hwmon_thermal_get_temp() -> sy7636a_read() passes -ENODATA to
> thermal_zone_recheck() in drivers/thermal/thermal_core.c:
>
> static void thermal_zone_recheck(struct thermal_zone_device *tz, int erro=
r)
> {
>         if (error =3D=3D -EAGAIN) {
>                 thermal_zone_device_set_polling(tz, THERMAL_RECHECK_DELAY=
);
>                 return;
>         }
>
>         if (tz->recheck_delay_jiffies =3D=3D THERMAL_RECHECK_DELAY)
>                 dev_info(&tz->device, "Temperature check failed (%d)\n", =
error);
>
>         thermal_zone_device_set_polling(tz, tz->recheck_delay_jiffies);
>
>         tz->recheck_delay_jiffies +=3D max(tz->recheck_delay_jiffies >> 1=
, 1ULL);
>         if (tz->recheck_delay_jiffies > THERMAL_MAX_RECHECK_DELAY) {
>                 thermal_zone_broken_disable(tz);
>
> Because thermal_zone_recheck() only treats -EAGAIN as a non-fatal retry a=
nd
> treats -ENODATA as a sensor failure, it logs an error, switches to
> exponential backoff polling starting at 250 ms, and after roughly 5.5 min=
utes
> with the rails off calls thermal_zone_broken_disable(), which sets the th=
ermal
> zone mode to THERMAL_DEVICE_DISABLED so thermal monitoring remains disabl=
ed
> even after the rails are turned back on.
>
> --
> Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20261101223125.30=
2001-1-pmazzini@gmail.com?part=3D5
