Received: from mail-pl1-f182.google.com (mail-pl1-f182.google.com [209.85.214.182])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4EFB32192FA
	for <sashiko-reviews@lists.linux.dev>; Sun,  7 Jun 2026 15:42:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.214.182
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1780846974; cv=pass; b=Hm6VlgcXRLOX8JXJA0lyNe3q6VLlT2e188gFD035sZZWkNuXClq8hSoUFKu8HlKewPEeZ7PzYr5HgPMA79iTPqvuPAtSaP8vYuyAhrZSBNpV0GLfw4sx8Pla3h7pfIgdPETxf1YIb/KENU+zQDKNzno7djTnimuQPQCyEUIwtag=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1780846974; c=relaxed/simple;
	bh=XCkHV8ZeNsUm5lPYgRn5fehEBmeWytVYAVnjilzGzk0=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=uX5X1zYp2mHsNGSyf2CMfS3TBQhKI6eMUv1giCY/+7EGQ6aiRYvWINEUn8iQxv1ew3arx8TH4jt7tLK36VEvU3VWUChzxOjpyG7QFl0AOphBIfsC2LD4uVmzaFzi0eb7C2WYXUD1qbdnuj4QsDOyimb1OrrNc4qfgdyxXwlb9U8=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=C5ND8MFC; arc=pass smtp.client-ip=209.85.214.182
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="C5ND8MFC"
Received: by mail-pl1-f182.google.com with SMTP id d9443c01a7336-2c0a5354da1so27858715ad.0
        for <sashiko-reviews@lists.linux.dev>; Sun, 07 Jun 2026 08:42:53 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1780846973; cv=none;
        d=google.com; s=arc-20240605;
        b=iu34bHTH+h8WwXThHyYphpyelJFlSlr0rvWmnby/4J6+XM6VqngqM42d5BlKlUvTV5
         WTWuMwW35dlY9fhlo5j7nOKBgMWiS0H6hkLSereIjvnvz1u0K8BknnvVOJcSpfKgnuH9
         6xpuxImmX2PZU9HvV/SXE8y4jhd5HSZs87tUUyeXg5HNzncapEEStYlYPSHZezHgkSDm
         t+KFLsyHG88xp4BNpK8+WjpyQxYm1FLjs0v2W0jeCs711gZ4bzF4KQ0TV6S2WtWQsG5L
         4Qn3QL3t06Eq0SBHFXyeD/SyIYhOm9MVofDvgh8s+2Y55DstOibakussn2T/Ld0x54xY
         PtSw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=45MZ8afngvd7K1ygn3gw3ZGKK+4IuTNrYGUdSONsW8E=;
        fh=0hdvEPJRino8wRvGrrw1gATkOs6ExpSix2L2F38xNVA=;
        b=D/7kqBHJtoGqbq8QZ/M3WmEKC88H/Ll9X1pDYgw36g4+DBhe+3KICFOLr+L1g6gp4G
         W4VL+UtoVUeHo60sziVn37L9dw8DvFQuYgsqIKTo4phui+oP2jYHBq5stCIDM0MUZnZg
         EYzKlrSHe/9dtERsfjz5Wyph2hi9N458TYC0wfYQG4vTAHq3TImpGYzjgxkN4EGGbAw9
         r4Qd97/mP94Xzw3Ebpbc7adZGBTLIQzwEZgDhCO8vxb//KW+zEY2kiigEAYl2xYK+gEr
         lI4gE8xzI/k+YuK5JJVlNBkM5bXYNQRtQVI0l+slGUxKDAY0eV/bgVk/W99xAn4fyaCU
         2dCg==;
        darn=lists.linux.dev
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1780846973; x=1781451773; darn=lists.linux.dev;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=45MZ8afngvd7K1ygn3gw3ZGKK+4IuTNrYGUdSONsW8E=;
        b=C5ND8MFC0Hud2liSYJa25ywRcHVGxsPSs7J2LLL2z6xAl+RSGCS2cuflZ3kNbCE2mw
         jznS2/88pFOZ9/75QIhWZd0w0IYScmW0iXqeM4Xrw+UMgxY+0ODcUtt6uQMgwHdsVpZJ
         aCbvcb6jBJFZl6WxtJKDWabIMZm8ie4x8S/c2Tb/MNYyQ/BTfLucqIfs0Cx3OD3oIfJJ
         Akeymmz4nrnjynpTD63iyx5anRwrIEQTsLtvna1hExftZQJ+EScaJNIBNDE2dU/Y4jep
         StGlT1vQ+yRf3zsF7zE7tl8RogGoIrF8/7zJBl34gMhH6ClP0rpINKYouagGdacWIESk
         EvJQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1780846973; x=1781451773;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=45MZ8afngvd7K1ygn3gw3ZGKK+4IuTNrYGUdSONsW8E=;
        b=l8lILeigTT2Zm0+isNaaPbsNQ8v32OjV/Gh7WPYCg4OdgUn9Xywkrt0ILq7bmGRUoC
         R21Qw+IRDH8SlrfhPX58G+pfL3jaB4SpjBNJGdC9KZCvurPA7HdgJlq4/ZxTztkxYCN+
         gQx5nElJua9ao9w1uV6RfBkngi9Ji2KV16o/WjNAlp4uxgR/QvefK/d6J+aYEuv0iYT9
         0c2tugNYsciP/1X8CZJqJPx+pgNtS1BMv1r2LPMBhSbRjb2CPmcRTNx1AJhwo8Xr6587
         oen742fIMbKVtMnScC5FCBbqukw7kffJafi19o+d+bnypoVaZ8A/oTCW1fM83YK50YGN
         M8Fg==
X-Gm-Message-State: AOJu0Yx368KboPH1W9wNCYfwvZwuYSo0/lNCgsQA/mSx+FEL391t9qss
	YvjjvVpMXQG+j1xs+HvBCmS8iX27fL1IPq2HPpBww4z/Qz3RjH+VSXb7gobb6U9sBO7jmlrY4BK
	l8R7e2uulKmsxC2olzgjUdCn2fT1pocIebunpcGL6Nw==
X-Gm-Gg: Acq92OGN+vJHUs00FOVkeD6tgcJg5pJG+BC9JbUFbwVeQYl9+mDM8lgXolnBdiZlbvF
	vacusCOYmUjYyzWRI9hS5VXgykzuDdQvddgU6RMjT08UCvirwj54SQjB3JxuOBo+TilZzaNPk1y
	EMynsuEr93qG3ZWyHJq7As93EgmULuJlrcZheVDWGYLyYpOdgM0U41F6IUP38S7sPwL+5H/vDu9
	1tvn1HQZgiizIl//aAxxqzhj2jc/RAOEW6/gYP1VLA/FcbmnA1Khm8lx5n984CZ4OV3zFF8xXOW
	mjgCF1ZiSeZz2rqrLyfkY4nV7u4eh62wn6zrGnM8xIKBmMNYK7g=
X-Received: by 2002:a17:903:3d05:b0:2c2:343:88b0 with SMTP id
 d9443c01a7336-2c203438bcamr79596615ad.19.1780846972505; Sun, 07 Jun 2026
 08:42:52 -0700 (PDT)
Precedence: bulk
X-Mailing-List: sashiko-reviews@lists.linux.dev
List-Id: <sashiko-reviews.lists.linux.dev>
List-Subscribe: <mailto:sashiko-reviews+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:sashiko-reviews+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20260607144238.128259-1-eugene.shalygin@gmail.com> <20260607145912.558FF1F00893@smtp.kernel.org>
In-Reply-To: <20260607145912.558FF1F00893@smtp.kernel.org>
From: Eugene Shalygin <eugene.shalygin@gmail.com>
Date: Sun, 7 Jun 2026 17:42:40 +0200
X-Gm-Features: AVVi8Cc2WdM1NlzuL36qde311cEr23kQJqMzFvmX39CF_vJU9xTuXAY9Qst8XrQ
Message-ID: <CAB95QATYOcHgYKi73M2cQOXUD1Z7rLPU0XZYAZivaVrcxohm_w@mail.gmail.com>
Subject: Re: [PATCH] hwmon: (asus-ec-sensors) add ROG MAXIMUS Z790 EXTREME
To: sashiko-reviews@lists.linux.dev
Cc: linux-hwmon@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

I fell into the same trap again :( Thanks, Sashiko!

On Sun, 7 Jun 2026 at 16:59, <sashiko-bot@kernel.org> wrote:
>
> Thank you for your contribution! Sashiko AI review found 1 potential issu=
e(s) to consider:
> - [Medium] Missing sensor metadata for ROG MAXIMUS Z790 EXTREME causes re=
quested sensors to be silently ignored.
> --
>
> commit 409e24c49843127f834ed70831b89be991b9e50c
> Author: Brian Downey <bdowne01@gmail.com>
>
> hwmon: (asus-ec-sensors) add ROG MAXIMUS Z790 EXTREME
>
> Add support for ROG MAXIMUS Z790 EXTREME
>
> > diff --git a/drivers/hwmon/asus-ec-sensors.c b/drivers/hwmon/asus-ec-se=
nsors.c
> > index b5d97a27f80d3..34f96aba5cb99 100644
> > --- a/drivers/hwmon/asus-ec-sensors.c
> > +++ b/drivers/hwmon/asus-ec-sensors.c
> [ ... ]
> > @@ -514,6 +514,13 @@ static const struct ec_board_info board_info_maxim=
us_z690_formula =3D {
> >       .family =3D family_intel_600_series,
> >  };
> >
> > +static const struct ec_board_info board_info_maximus_z790_extreme =3D =
{
> > +     .sensors =3D SENSOR_TEMP_T_SENSOR | SENSOR_TEMP_VRM |
> > +             SENSOR_SET_TEMP_WATER | SENSOR_FAN_WATER_FLOW,
> > +     .mutex_path =3D ASUS_HW_ACCESS_MUTEX_RMTW_ASMX,
> > +     .family =3D family_intel_700_series,
> > +};
> > +
>
> [Severity: Medium]
> Will these water sensors be successfully exposed to userspace?
>
> The newly added board configuration specifies SENSOR_SET_TEMP_WATER and
> SENSOR_FAN_WATER_FLOW. However, looking at the sensors_family_intel_700 a=
rray
> used for family_intel_700_series:
>
> static const struct ec_sensor_info sensors_family_intel_700[] =3D {
>         [ec_sensor_temp_t_sensor] =3D
>                 EC_SENSOR("T_Sensor", hwmon_temp, 1, 0x01, 0x09),
>         [ec_sensor_temp_t_sensor_2] =3D
>                 EC_SENSOR("T_Sensor 2", hwmon_temp, 1, 0x01, 0x05),
>         [ec_sensor_temp_vrm] =3D EC_SENSOR("VRM", hwmon_temp, 1, 0x00, 0x=
33),
>         [ec_sensor_fan_cpu_opt] =3D
>                 EC_SENSOR("CPU_Opt", hwmon_fan, 2, 0x00, 0xb0),
> };
>
> This array lacks the initializers for the requested water sensors. Becaus=
e
> they are not explicitly initialized, their definitions default to zero an=
d
> they will be silently ignored during sysfs creation.
>
> While the driver safely handles zeroed structs without causing out-of-bou=
nds
> reads or sysfs corruption (because get_sensor_value() returns 0 when size=
=3D0
> and hwmon_genattrs skips attributes without templates), this regression
> means the requested water sensors will not be exposed to userspace.
>
> --
> Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260607144238.12=
8259-1-eugene.shalygin@gmail.com?part=3D1
