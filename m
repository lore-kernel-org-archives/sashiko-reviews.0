Received: from mail-oo2-f39.google.com (mail-oo2-f39.google.com [74.125.231.167])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5EE193DAC02
	for <sashiko-reviews@lists.linux.dev>; Tue, 29 Sep 2026 13:08:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=74.125.231.167
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790687297; cv=pass; b=koYHty6NYqtfIA5HVr4P7W9Ep2NAAJDk/WZqoFCarTKfeKXYthXnxRbE932LvYP2giVFym05ky3EK4SZ2v6oVoBFGc/FzLm/NySP0vbqq4GmHhZ4MPmX1EPu8kjKVxeTRrbA092zG/QPesSwguSxhD6xA6bTBxvJ39GqJoQD3rQ=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790687297; c=relaxed/simple;
	bh=EM0hyZUrB30ui770u2/66WPqaHQ3vUvTAK1vkoxgYQo=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=ihB/eOUf6wwnetMVLFt7gO+T8I923652q2SvGuLdGLllhVpYc3PWguZyAsKkPcpDMTr8Ukc7mycpapYsSXmVGWT7eT/halM3tErHH1M+kwWHZRsXeZvSAMEkAM71br2c4bFIjLDRAzAvm0lPw1QOMnDMwIirzNoMj9cE2D111ZE=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=a09WlwXl; arc=pass smtp.client-ip=74.125.231.167
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="a09WlwXl"
Received: by mail-oo2-f39.google.com with SMTP id 46e09a7af769-81c05431513so1125430a34.0
        for <sashiko-reviews@lists.linux.dev>; Tue, 29 Sep 2026 06:08:16 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1790687295; cv=none;
        d=google.com; s=arc-20260327;
        b=jUzf57Ks3OZEu2zAZrpMRkBy0gWez/yRUoyDFQ8XDQIc09M8mOnsmgpLlPeljlF7f8
         osx7rwQJ9scCNpRZXcJ8IgO6Ydn23zKI2/6cs7gjiroM6oJBk4MSTw2NQKkO5H5hwzRX
         6X2hCJxE/Pgo0fDzEyQZGoYVgopAuecruHO1gN0TDlWsxWyI8IY3RRNYb8undOAeGekX
         zHNsNM2VFUZ8HLHIGYuH9PK3Bzlwidnw5aKV4zHdb5x4jFRGawuElyPbhkoenvbDoNIy
         NqtpNVx6B6WdY0iO2d+l2tDg7ePcvPlG7wbvtJkTzfJq74KEkPPR5hFfAEfamtXN9lFB
         okvA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=BzdD5Sss5i6U/JDnnUUjSN/BwY+wJHaWFoU0VMpSGVg=;
        fh=+Kn94FVzl6rE7mDhn4pFvEHlRshbQ57dQ5o19v04Oyg=;
        b=WXpBQWyJAfuNXyhIZEG0l4E5XTMNFBa9dbnltqecQ9Nk5hex6wqW7ss+veFqrtfo6/
         zTeo2TahQ6hzYH6ef6kKixN7jJ2mnNkkTcWQ+JkRXgq8tmxiX/yT6cw2a53mxX9BLISn
         DKGliIpzzFgtwBJy6LMy49En/yHhWv/VABJEXVkkvH9v++M8fN0++6+chUtbQQ9h5lR3
         8WAyh4gHafnzor0DjdgkZdhB25LL9mo3Sydbnh8Gio9xtTDj4iEvLuRMz9Pb9ugZYcF5
         S3g5moggen/wxYQTGg2FCBrulsOmErwInpOKKKyq7aqFy/Qj7O+V05rASW0gepLanRkK
         XXPA==;
        darn=lists.linux.dev
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1790687295; x=1791292095; darn=lists.linux.dev;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=BzdD5Sss5i6U/JDnnUUjSN/BwY+wJHaWFoU0VMpSGVg=;
        b=a09WlwXlMtsROUtRWDRHVP1ORc3PmpuND9z4/qeYL2S3Ip8FLlGSGMQJyvxwrEut2V
         s7tfmQCXI6xyd6THCql3r6Kbgxk69XtCGMgPh2AWzu/tSuzDswhJUHvOiLyRVOenveMR
         zSgKsV2u0s27vulvoNkDmYCZAvQRXLlFdSCWSwL9T7RF78kzYN8n3I3TY/D9frxkMD3O
         sUbFNze3VcvFgL1wHlKzORj0JxH70Tf1U0iHKRaBKE5j/p1j7G2im+pqcn135kk80CEi
         MdifBhsoat5C7prFk9tE1Xtu0VUD8Cag0OhsCRzjMxAM0fQuZKSzEo4+WANHlIvsZgO3
         2Sfw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790687295; x=1791292095;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=BzdD5Sss5i6U/JDnnUUjSN/BwY+wJHaWFoU0VMpSGVg=;
        b=1qC3ehdB1EpiXLRV39wiEJcrcShhcaeL5Nfzku4fVukgrn7swkRRXOD70NbuyGwwkB
         P4QT68RdRQUQz0hC99TL5FVWoNgxyoMTcDaPQdTQfTAlTDl4aM+fOtvO1qOJ4bfIDTLj
         KFuZtcrniDkNRUeb2woJ85YVfk/hojbjiPrTx+RzhDHSdaTclQbepDwvXQthbW7oRUBz
         f7RqnaiuST8g36Vh0yJW7fX3a47UsdawBGUHAXodj8zo4bYAQCYL2/feVn/2zAYhgGzo
         bLPRmpAg+bs6NU3E8euq/aEi2g4bN4PTNWT2Bg9id0BMnWNY9ROimjM2o4+djBn/hX8r
         j3dA==
X-Gm-Message-State: AFuF++lIU9Lr9N4F2N8tBkIB6ZYLackpz5YW/w0Pq9XlfayH8hdghydS
	sbeArslMMQic6Kv+K98Y3bqnuWBl/VhoSaM10434zqcEi9/cXb13SuUvk9EOiMOETR/hf4dAH33
	UZjoq+KATjbbZ/XyeG84a1C9eQD5EKUEYYHNy
X-Gm-Gg: AYBFou0M85V86uaEZ9KdfKHHpUDSo/aTWL9vZ43vluOZEHaEzQB3sujmdbrpzqPT4Fv
	aDKS6pqsLCfW58otaQtTH+FEqyy6H+ujAGiaouuuXmJAdbpLqent32VlgMZ3fiL23rHhPyD2rRO
	u1qc3/ykYNJS33pdCadJwjLwbebEogK/+Cc9yqu7MW6bEPROpxJxr+VmiwThY+blGYh5gNA1sqf
	8qbnvL5wzmcu2AB7CE1tFUMd0iQgCzZiwIK9Uq6rArcswmTDNs5LrTcH7OugxJDRh/kGSILhIJ6
	y3aDfaCK45Ev6bz0erKfynAaE+vo8tJ0gVUlX+5/iXmmGqjk+0wj0ijs
X-Received: by 2002:a05:6808:1201:b0:4d6:92b3:c1ba with SMTP id
 5614622812f47-4d73154520fmr15183484b6e.61.1790687295187; Tue, 29 Sep 2026
 06:08:15 -0700 (PDT)
Precedence: bulk
X-Mailing-List: sashiko-reviews@lists.linux.dev
List-Id: <sashiko-reviews.lists.linux.dev>
List-Subscribe: <mailto:sashiko-reviews+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:sashiko-reviews+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20260729114312.3947300-1-chou.cosmo@gmail.com>
 <20260729114312.3947300-5-chou.cosmo@gmail.com> <20260729115102.B7BA41F000E9@smtp.kernel.org>
In-Reply-To: <20260729115102.B7BA41F000E9@smtp.kernel.org>
From: Cosmo Chou <chou.cosmo@gmail.com>
Date: Tue, 29 Sep 2026 21:07:47 +0800
X-Gm-Features: AclHuK8qb1XTYKu0Ux_gt77HR3dgzEFvQuRam-gZ16qnagUp_F64jHCsH-lemmA
Message-ID: <CAOeEDyuqPcEdsF3E4pAorAyTb+E0VfAPhDPB8m85c8weHROwWg@mail.gmail.com>
Subject: Re: [PATCH v2 4/4] ARM: dts: aspeed: bletchley: Add second source
 ISL1208 RTC
To: sashiko-reviews@lists.linux.dev
Cc: devicetree@vger.kernel.org, robh@kernel.org, conor+dt@kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Wed, Jul 29, 2026 at 7:51=E2=80=AFPM <sashiko-bot@kernel.org> wrote:
>
> Thank you for your contribution! Sashiko AI review found 1 potential issu=
e(s) to consider:
> - [High] Adding the ISL1208 as an active alternative RTC introduces a sys=
tem-level regression on boards populated with the ISL1208. The unpopulated =
primary PCF85263 will register a phantom /dev/rtc0 device due to a missing =
I2C failure check in its driver, causing the ISL1208 to be registered as /d=
ev/rtc1 and breaking userspace time synchronization.
> --
>
> --- Patch [4]: [PATCH v2 4/4] ARM: dts: aspeed: bletchley: Add second sou=
rce ISL1208 RTC ---
> commit 02d65705396424e85939c4fb70bef75dc330e54c
> Author: Cosmo Chou <chou.cosmo@gmail.com>
>
> ARM: dts: aspeed: bletchley: Add second source ISL1208 RTC
>
> This commit adds an alternative ISL1208 RTC node at address 0x6f to suppo=
rt
> boards populated with the ISL1208 instead of the primary PCF85263.
>
> > diff --git a/arch/arm/boot/dts/aspeed/aspeed-bmc-facebook-bletchley.dts=
 b/arch/arm/boot/dts/aspeed/aspeed-bmc-facebook-bletchley.dts
> > index 3da1cf9bbb990..01dbbda3e4b6a 100644
> > --- a/arch/arm/boot/dts/aspeed/aspeed-bmc-facebook-bletchley.dts
> > +++ b/arch/arm/boot/dts/aspeed/aspeed-bmc-facebook-bletchley.dts
> > @@ -1269,6 +1269,11 @@ eeprom@56 {
> >               compatible =3D "atmel,24c64";
> >               reg =3D <0x56>;
> >       };
> > +
> > +     rtc@6f {
> > +             compatible =3D "isil,isl1208";
> > +             reg =3D <0x6f>;
> > +     };

This has been addressed in the driver by:

  commit 78acddfde751 ("rtc: pcf85363: Add error checking to regmap
calls in probe()")

pcf85363_probe() now propagates I2C errors, so an unpopulated PCF85263
fails to probe and does not register a phantom RTC. On boards with the
ISL1208, it is registered as rtc0 as expected.

> [Severity: High]
> Will adding this alternative RTC node break userspace time synchronizatio=
n on
> boards populated with the ISL1208?
>
> Looking at the primary RTC's driver probe function:
>
> drivers/rtc/rtc-pcf85363.c:pcf85363_probe() {
>     ...
>         err =3D pcf85363_load_capacitance(pcf85363, client->dev.of_node);
>         if (err < 0)
>                 dev_warn(&client->dev, "failed to set xtal load capacitan=
ce: %d",
>                          err);
>
>         pcf85363->rtc->ops =3D &rtc_ops;
>     ...
> }
>
> The PCF85263 driver ignores I2C communication errors during probe. If a b=
oard
> is populated with the ISL1208 instead of the PCF85263, the absent PCF8526=
3
> will still successfully probe and register a phantom /dev/rtc0 device.
>
> Does this cause the ISL1208 to be registered as /dev/rtc1, resulting in
> userspace services like hwclock or systemd-timesyncd targeting the
> non-functional phantom device by default?
>
> Should this alternative topology be handled via a bootloader fixup, or
> should the rtc-pcf85363 driver be fixed to fail probe when the hardware
> is absent before adding this node?
>
> >  };
> >
> >  &i2c7 {
>
> --
> Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260729114312.39=
47300-1-chou.cosmo@gmail.com?part=3D4
