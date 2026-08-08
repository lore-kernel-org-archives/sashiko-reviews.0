Received: from mail-yw1-f181.google.com (mail-yw1-f181.google.com [209.85.128.181])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2F8613B05BB
	for <sashiko-reviews@lists.linux.dev>; Sat,  8 Aug 2026 09:19:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.128.181
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1786180764; cv=pass; b=FC1DzHxM5nCSWqAfy/Zu7PKopD6G6yDF4SD0RKzTOm1NIxU0AMAtxpHBqVQ64cKZUzWoJr4mRJSdhbsRCqfo1U0n6fUltKudElE5tHvETGOVD3swOy+btvWoFiUSwwYPJmcoud6BYRlpCwvNOVmFf5dWOYEShTCRP9ghPA1e+rk=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1786180764; c=relaxed/simple;
	bh=pd8FOy1ubR62uZqYb1thHiWFnOUmjn71WGhkcVdafHg=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=MDxwUA0SnYqEavYvhltKkSfKhFn3e1lsQRcIv1vPnEzERg7vz5p7wuOHMdGYuhGJCcvLjvcVl42CgaC+K2zGapfkpYqXk32PTMi5FJMILMy2FDYpc+jSnszfj5IpsMrpATruL+ug0xgbZhn6s/RIFontkJrO245U0u+gFkUlFUQ=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=PlKIGSM7; arc=pass smtp.client-ip=209.85.128.181
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="PlKIGSM7"
Received: by mail-yw1-f181.google.com with SMTP id 00721157ae682-82011c59e66so4726317b3.0
        for <sashiko-reviews@lists.linux.dev>; Sat, 08 Aug 2026 02:19:23 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1786180762; cv=none;
        d=google.com; s=arc-20260327;
        b=Eryh5H9mPCgWBxmCFVvXueX+gyqUfXT8thwdL8zMoDbLDZjLT9cE1daOoEsT0U7MhU
         7SJuILhElX+mEIEz/fd8osfhAMMqWsUYST49LQZ1CnTMrBTiFvnMBlPEu+/eifh3GUTr
         vlg6WJ6tazT+nrZTHhDtm4u+88Jv8P40AKUPVVUTnMz0Y3KC6/si4ow3Mif7M8JCNOHc
         qri2rpYarqJ1Dc9SDLmdHQFoebR6aIxuWPJYOVXD0Bd6wSpZl+XPMJ8e5CoaD6nL0lD3
         76TTUtU2UjThQOQ7tAKjEIu7z53oRbDwuKNoCUbtXlfTcyv2BG/AyVhAeCU6n1XOUU11
         sHxw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=fg2c76AY5foyHjbEy805FD3dTMeTfW3OaOdCgYpTznU=;
        fh=0hdvEPJRino8wRvGrrw1gATkOs6ExpSix2L2F38xNVA=;
        b=Zgh9Y6+j4veO3Kg2Q9fdJKYN46v7MvjAxL1okAgYNdbfhPrxCLug0rLQT9HquxQLji
         ncBtvS1hcLeJuWD6lpQ1XspuFzH5Ec/kV9Y1HsH11Hdw/NArWwv2okc0qJQgzVMKncJ5
         mhfcsVQP2mcpHH/yoVxPFM1ao++OQFN1EBXLbvpchVkuZ9C2DTxw7U4NYfzFhyQbcYCH
         XZmt23wSVjzhdUoE8YbrjaojLTzl0zy2WhRa9xCjp6IuYRUhpsAABNl4C/5hCvF3nHm0
         qVtpaszyODjCa8anAHlsuRyP/xmARZ3LDYdLAda11Pmpd5L6bVk8vT6FEPUiT8KZXdAX
         775g==;
        darn=lists.linux.dev
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1786180762; x=1786785562; darn=lists.linux.dev;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=fg2c76AY5foyHjbEy805FD3dTMeTfW3OaOdCgYpTznU=;
        b=PlKIGSM7EakUaFJS+rMDnDmxsVR5hYNaQitoirzjengpvt8UIzwR67Qimr4UhMdGIk
         XEudxsKpeZ4I72BN2TGnhqnIglaaJTMtF26zlxeOuJKQaC/GpZUAyXR3Qeju4TtijgZW
         Dy1JaKjmFTZ+PnMkR6qFRJKUk3CxlzaYcpwa7goXgOVSTnHL8L0IF0tvw/nn2s3og8tV
         qD4408NfzdLjjcG+1kTeMmpa3POSeRuCiVjkKQC/td+0Cg1eUCmJaq3UxQC3yjgx3pxE
         GdRTiVlyy91C3iqGGuk7fdBEumFZ1n7KcVgPhelljNsyv6C7jYIj9jvJWSLWmCfgL+QA
         Jz+g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1786180762; x=1786785562;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=fg2c76AY5foyHjbEy805FD3dTMeTfW3OaOdCgYpTznU=;
        b=FJYCX8ynQDM6HofoBEuZoZ4Gk+EQEV5pRXSwlQQpQtUp2htL2m+vnYKyowb0Vu7sHa
         2xmNVxfn2mMlbJP3PMPxeQVKb8PIH3HCRMjAR3OCtBFevXg85N+w4sL1+Z3dknuP4B+c
         ibRkHXihrTUNZd4y87jh5V7LaX0E/IoZSvw+J4i0jFNY2Y2JIy+tVgMmkOPDdQW259kl
         FA+88RhXtNup28tcQZ1QsViLmnK/A2nQXs5nkD551wstFh7TexVBlgVhL0YCYTxE15tY
         mGcJ0VYtI4NqgnHgTZ/+18q/jKDnQuQviS0I5QZlhuGXwKKqvyP0DvIX32tihsgBtte8
         FPDQ==
X-Gm-Message-State: AOJu0YwBaD3ziVSlVUDY7PhCuq6kLbSG8R2K3Bv0gPnQ5ZEubTVtT0EK
	s4642ByKeVi6wXnmFdZ6UEBk3u3hVJCswdZjrcbOmwqEailEeqsRPWB8Kpfm01VH41s4gFAdIyg
	xfbj0cBcxtbDaZP4edlc3FTz1PXySt7jMGwyCqPVmNg==
X-Gm-Gg: AR+sD11dPLfz1AIMaGnwYTozACPggIVNY8If5kqZX/SYJEiS7dsiIsrMUg/hHAtsKSK
	BH0/s9OAcpFX1J9ANr/FRAy35r+Va7SO32XjJlo6/nn5uEvkqSRlcVIn4E764Oun85gfb7I/HPj
	hxpIWrDaLRuhr0W8bHWn/drkujLsLPpeztvtOycvF0LnfXv+Ei9N7xPnKXHD3ALllX047P0BriT
	RFI8H/Yr2GsiFMSVgj7WpkmS8Z+sosdtRwOu3zv5ZaZTxDZ3i4l1DBKR66kMK6L6ailOUm1u+Aw
	qmWzfKNQ0ay2qo6fWiJ1XszXyiearMTwKP9mgwuWQnhkQw==
X-Received: by 2002:a05:690c:c8c:b0:7d0:79f:339f with SMTP id
 00721157ae682-82022504c69mr183661797b3.34.1786180762177; Sat, 08 Aug 2026
 02:19:22 -0700 (PDT)
Precedence: bulk
X-Mailing-List: sashiko-reviews@lists.linux.dev
List-Id: <sashiko-reviews.lists.linux.dev>
List-Subscribe: <mailto:sashiko-reviews+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:sashiko-reviews+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20260808083718.2612205-1-congnt264@gmail.com> <20260808085811.ACB651F000E9@smtp.kernel.org>
In-Reply-To: <20260808085811.ACB651F000E9@smtp.kernel.org>
From: =?UTF-8?B?Tmd1eeG7hW4gQ8O0bmc=?= <congnt264@gmail.com>
Date: Sat, 8 Aug 2026 16:19:11 +0700
X-Gm-Features: AUfX_mxQrAoGr3BaW7w3K_8fDZegiZEg_B84a8nklKQleIDy4-JOpboIcOQOUUo
Message-ID: <CAJpJ=GuiQy0XtcER6=Va7VmfuGF__3BGSrjKiYRriEEUbUaEPA@mail.gmail.com>
Subject: Re: [PATCH] hwmon: (max6621) fix negative temperature offset and crit readings
To: sashiko-reviews@lists.linux.dev
Cc: linux-hwmon@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Sat, Aug 8, 2026 at 3:58=E2=80=AFPM <sashiko-bot@kernel.org> wrote:
>
> Thank you for your contribution! Sashiko AI review found 2 potential issu=
e(s) to consider:
>
> Pre-existing issues:
> - [High] Writing the maximum allowed temperature of 128=C2=B0C to hwmon_t=
emp_crit silently wraps to -128=C2=B0C in hardware.
> - [Medium] Fractional temperature precision is discarded due to shifting =
and integer division before scaling.
> --
>
> --- Patch [1]: [PATCH] hwmon: (max6621) fix negative temperature offset a=
nd crit readings ---
> commit a073f1d4838dda93adf9b46f8e3cc16f1b662f82
> Author: Cong Nguyen <congnt264@gmail.com>
>
> hwmon: (max6621) fix negative temperature offset and crit readings
>
> This patch fixes temperature reporting for the max6621 driver. It
> addresses an issue where negative temperatures were reported as large
> positive numbers due to missing sign extension before scaling the 16-bit
> register values.
>
> Cc: stable@vger.kernel.org
>
> >       - temp_input used an s8 intermediate, which is correct for the
> >         -127..127 range but reports the documented +128 degrees C maxim=
um as
> >         -128 degrees C.
>
> [Severity: High]
> This is a pre-existing issue, but while fixing the read path for the +128
> degrees C maximum, is it possible that the write path still wraps to -128
> degrees C?
>
> When writing to hwmon_temp_crit, max6621_write() in drivers/hwmon/max6621=
.c
> clamps the input to MAX6621_TEMP_INPUT_MAX (128000) and divides by 1000L:
>
> drivers/hwmon/max6621.c:max6621_write() {
>     ...
>     case hwmon_temp_crit:
>         ...
>         /* Clamp to allowed range to prevent overflow. */
>         val =3D clamp_val(val, MAX6621_TEMP_INPUT_MIN,
>                 MAX6621_TEMP_INPUT_MAX);
>         val =3D val / 1000L;
>
>         return regmap_write(data->regmap, reg, val);
> }
>
> If a user writes 128000 to temp_crit, it gets clamped and divided to 128
> (0x80). For an 8-bit two's complement alert register in the MAX6621
> hardware, 0x80 is interpreted as -128 degrees C.
>
> Could this cause continuous false thermal alerts and potential unintended
> system throttling?
>
> > diff --git a/drivers/hwmon/max6621.c b/drivers/hwmon/max6621.c
> > index e86ec6d237ca6..9becd098d840b 100644
> > --- a/drivers/hwmon/max6621.c
> > +++ b/drivers/hwmon/max6621.c
> [ ... ]
> > @@ -225,8 +224,8 @@ max6621_read(struct device *dev, enum hwmon_sensor_=
types type, u32 attr,
> >                        * The temperature is given in two's complement a=
nd 8
> >                        * bits is used for the register conversion.
> >                        */
> > -                     temp =3D (regval >> MAX6621_REG_TEMP_SHIFT);
> > -                     *val =3D temp * 1000L;
> > +                     *val =3D (sign_extend32(regval, 15) >>
> > +                             MAX6621_REG_TEMP_SHIFT) * 1000L;
>
> [Severity: Medium]
> This is a pre-existing issue, but does this arithmetic right shift discar=
d
> the hardware's fractional temperature precision?
>
> By shifting right by MAX6621_REG_TEMP_SHIFT (6 bits) before multiplying b=
y
> 1000L, the lower 6 fractional bits are lost, dropping up to 0.984 degrees=
 C
> of precision.
>
> Would it be better to multiply by 1000L first and then shift or divide to
> expose the full fractional precision provided by the MAX6621 device?
>
> The same precision loss also happens when writing hwmon_temp_offset in
> drivers/hwmon/max6621.c:
>
> drivers/hwmon/max6621.c:max6621_temp_mc2reg() {
>     return (val / 1000L) << MAX6621_REG_TEMP_SHIFT;
> }
>
> --
> Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260808083718.26=
12205-1-congnt264@gmail.com?part=3D1

Thanks for the review. Both points are pre-existing and on the
write/precision side, so I'd like to keep this patch focused on the
sign-extension read fix and handle them separately:

- temp_crit write / +128 =C2=B0C: agreed this is a pre-existing write-path
issue. max6621_write() clamps to MAX6621_TEMP_INPUT_MAX (128000), so
128 =C2=B0C lands in the (non-shifted) alert register as 0x80; if that
register is interpreted as signed, it wraps. I'll send a separate
patch to tighten the clamp once I've confirmed the alert register
width/sign against the datasheet =E2=80=94 it's orthogonal to this read-sid=
e
fix.
- Fractional precision: also pre-existing =E2=80=94 both the read (>>
MAX6621_REG_TEMP_SHIFT before scaling) and the write
(max6621_temp_mc2reg() divides by 1000 before shifting) discard the 6
fractional bits, so the driver has always reported at 1 =C2=B0C resolution.
Exposing the 1/64 =C2=B0C resolution is a behavioural change rather than a
fix, so I'd prefer to do that as a follow-up.

This patch only restores the sign of the existing values, which were
being reported as large positives for negative offsets and crit
thresholds.
