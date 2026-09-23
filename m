Received: from mail-qv2-f12.google.com (mail-qv2-f12.google.com [74.125.230.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 967A049B205
	for <sashiko-reviews@lists.linux.dev>; Wed, 23 Sep 2026 11:23:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=74.125.230.140
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790162609; cv=pass; b=LsPPRijt06mxlG1PAS3LAHHctm4dQta+Q+Q/t2G0V1XJi0I4Hy3hYgjBxR9AKtY0gFa0QHauwzl80wivVaIiBcQaA2c0nZLJcSswc3XNnyDHC/C0GoeXpgvyhGRjkcZdC4R6xc8QmnHjrEzBiuYWUpJhlWEw8Tjcdoqic80n89c=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790162609; c=relaxed/simple;
	bh=XhxSI0UVdEQV9nwQDMNyEd97c+q+OPCqI1wpOJhsgB0=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=NmlCyZgjvyINzkif3h2oox3vr6jUDi1zUt4wSQItdOslhhJ1PNk1KxkDgvcq21eP6sfN4ClnfFuNOvVJ73jFlMwVBA1eACR2vPwOytFWHIlqRwIgvmFh0gXw43MT+EE8Di8IFmBLwja5k01+amO6WeiHDajViOnCdNPUZAWPeRg=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=SmjTBxYv; arc=pass smtp.client-ip=74.125.230.140
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="SmjTBxYv"
Received: by mail-qv2-f12.google.com with SMTP id 6a1803df08f44-910531ea7feso7536886d6.0
        for <sashiko-reviews@lists.linux.dev>; Wed, 23 Sep 2026 04:23:27 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1790162606; cv=none;
        d=google.com; s=arc-20260327;
        b=XCpl2/RUiJPeG9UK/EpG5RmCd6WAZb6QkO69gVX6lwXBAh9pLbwa5SANFZD96mROJU
         H4KR/fzMWnISmKFdAJHDbWNtpqp27xICowvUKR/vW+W7UI+I4PA5SPImrQjLDac70pER
         pBkO+HKK7UU0wWZzmedEUEoElVuWM6wDKrU5QgQFyALTlWy40Ch/HPK8xQSgdxNAKvLr
         SKmbPhBvzl/dQG6QxXe1Gj7KpT5krpHuQ/jb8ewtvPwFo3qB/+ox1Hn3mSQ/3WSXFBVk
         p8pbBpPDfyDPm6zLagM6wLwWQrD7RnNmqC2STY8V/BkaQWBh1u23MdjYRl8sNF2T/opu
         inag==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=bN6kbYIJdb6YSfYW9P/+epswRe2d9jKi28WuqxpTfyQ=;
        fh=i0J7Vrf1Dtak+VezafgJcq22zN+YUptv8kxlFHMB4U0=;
        b=UOpBdwcZlMfPamZSssjrQkaLcd6GCaVJgxI6S0qgVpa2CFT48uF68aMPGVl4X4JMne
         jAwOFqEHDI4Tg03IGrrK0a8lj+Pcs16KJ+omex2yUmuT2k7jVYABfWjuxeR1wudlC436
         3atlM74r/fT6QMm3JPPkjDeOdBLtSjRzlci/gTOLFAkLflPa9FDbUJY+NL3W78SdZOqB
         bomSd9NP/e6FKiXUAiRLBDr72vgWR86hDYmFRYmI4HH5vNKSM4NBI76dHeCh+65TSbTM
         m/sVvicPT/f/RpfdrnYCTE0n5pPFEJPOSa9tj660hcV9U88GysdNBjrE/zrHL/P8dxQM
         s8BA==;
        darn=lists.linux.dev
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1790162606; x=1790767406; darn=lists.linux.dev;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=bN6kbYIJdb6YSfYW9P/+epswRe2d9jKi28WuqxpTfyQ=;
        b=SmjTBxYvxb0pdYfoLC6IuTaf2y4dqDjK9ZCu/xBrYsvTg3GjmdGkGN9KGjrdsI2vHP
         KbrByBzNcar1Y5foVmf5R2ccU8c5gsAMEzDmgf0LLm5LXeIinblWCBQujJvcrnUOqm0v
         bETECDLpjDME/4AghY+ZwREH1CsZjmtAmfLOw5Wlpue8pUqODG3UDCFIr+ZQHmBD4Z4m
         8gcLX7CsA1RW/7rXX5eo7TmMTSABB/gpOIAYqKzj46PzI6xVBnvOQPbVD7rQObqkxTmK
         ofDe9f+2lzSxgg5cIE2yvoMA4Ja/LS2uokCPUHwsyqS08Vnp1IDPE6bo4X2/xc9Ba8Q8
         PxKg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790162606; x=1790767406;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=bN6kbYIJdb6YSfYW9P/+epswRe2d9jKi28WuqxpTfyQ=;
        b=aTFH3GlJJsZ+ZWnowSQt/iMUE7L/nNb2zJjJZ2Vd2NkfdNAV0eQRoalOKiVCjeysk5
         rCIL4BHzJspsgEUblAoJ38rwdwsayRd9Jis89FYDepVViq/SPOfVFAWQ/CgJ8jDTUYZX
         iQVcyJylIoUsCp1ZXGENlADN5D+4k5VI6FBt2jnBFJIrvSDy/MWlHMQ5mYsAB1WfYVTv
         iB6wYAayR48V5T2iJXwh1QBnUhpzBEm0k2jzY6+P2O39kI45rGvhGYYi8zcgDvNQikXL
         q+OgQqOnLmOf8RbUy0P0zWg5CNlLqBasuxAcNcWVNbYnjAQoVz/gL1giQ4Yi5l/NWK9w
         h0OQ==
X-Gm-Message-State: AFuF++lMFx+mXVOy7KfQR+Z3W8ajBZTspjbCB6fY6YYD/t5mfUP2AEFW
	O1S4gKCK0bqQgzQRwM+dv68CUx0HZa3dU4hB4tZeOIhh7oj2OEPswxK0cv+ObhSjDN1RPaD/wbL
	rwAhBjXTaSJBkBGig9j03VYHjamwADx+xmLfnSlczDzZb
X-Gm-Gg: AYBFou1T6HvxEIDdr4B4UKxNhXV/OdTtPahpjXiLYrt9Es7vDvZ/tj04Huaw0sfslEw
	5IJ/UpzfIQkzdsuyaz3inX36ywYGvExAi+/QGHnUvosRk+/5oc5Y2t5Q4RnKkUqba+DdEN25PvK
	esi8lCWgoTCteEy38osnwCRnoKXGaoPevJrwcZbYXymNXkSUZFTl/OS8/4xgN3SVcGBJ4+XNCLQ
	CI7biGfOw7O2jg4e+0+W/wvkYRW79Oh12KpqgkeGBkg1bbh2P5a+zim3XRNnlAWA1pQKApgBx58
	du+TH37D8G6Hyi4cK2pZKyeexVEt/VeQmmZZPjaX1N9aWwg5rkWVV3YXew==
X-Received: by 2002:ad4:4eaf:0:b0:912:517b:7bcd with SMTP id
 6a1803df08f44-9140c45e16amr36513256d6.44.1790162606203; Wed, 23 Sep 2026
 04:23:26 -0700 (PDT)
Precedence: bulk
X-Mailing-List: sashiko-reviews@lists.linux.dev
List-Id: <sashiko-reviews.lists.linux.dev>
List-Subscribe: <mailto:sashiko-reviews+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:sashiko-reviews+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20260923105757.260-1-anykey196@gmail.com> <20260923110700.C331F1F00898@smtp.kernel.org>
In-Reply-To: <20260923110700.C331F1F00898@smtp.kernel.org>
From: =?UTF-8?B?0JLQu9Cw0LQg0KHQktCd?= <anykey196@gmail.com>
Date: Wed, 23 Sep 2026 16:23:13 +0500
X-Gm-Features: AclHuK80bwmJZdOYxmF8iAKdw-NUD9G5_eoeZNJ35MH2NPLmCB-oxTRJeWQWiiA
Message-ID: <CANHPwAQOPvcQvDLNpKLNL+jQg23sJMbhVSvNWqswFDm7iH6TEg@mail.gmail.com>
Subject: Re: [PATCH] Input: axp20x-pek - add AXP313a support
To: sashiko-reviews@lists.linux.dev
Cc: linux-input@vger.kernel.org, dmitry.torokhov@gmail.com, 
	linux-sunxi@lists.linux.dev
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

This is already addressed in v2 [1]: the AXP313a no longer reuses
axp20x_info. It has its own axp313a_info without start-up/shutdown
times, and the startup/shutdown attributes are hidden through
is_visible(), so they are not created and no out-of-range access to
AXP20X_PEK_KEY happens.

=D1=81=D1=80, 23 =D1=81=D0=B5=D0=BD=D1=82. 2026=E2=80=AF=D0=B3. =D0=B2 16:0=
7, <sashiko-bot@kernel.org>:
>
> Thank you for your contribution! Sashiko AI review found 1 potential issu=
e(s) to consider:
> - [Medium] input: broken AXP313a sysfs attributes due to out-of-bounds re=
gmap access
> --
>
> commit fbaeccab4996537ab99d0c8423e2cf36610e4b34
> Author: Vladimir <anykey196@gmail.com>
>
> Input: axp20x-pek - add AXP313a support
>
> This commit adds the AXP313a PMIC platform ID to the axp20x-pek driver to
> enable the power button. It uses the axp20x_info generic register layout.
>
> > diff --git a/drivers/input/misc/axp20x-pek.c b/drivers/input/misc/axp20=
x-pek.c
> > index 24f9e9d893de3..d4e2fc9a937ff 100644
> > --- a/drivers/input/misc/axp20x-pek.c
> > +++ b/drivers/input/misc/axp20x-pek.c
> > @@ -393,6 +393,10 @@ static const struct platform_device_id axp_pek_id_=
match[] =3D {
> >               .name =3D "axp221-pek",
> >               .driver_data =3D (kernel_ulong_t)&axp221_info,
> >       },
> > +     {
> > +             .name =3D "axp313a-pek",
> > +             .driver_data =3D (kernel_ulong_t)&axp20x_info,
> [Severity: Medium]
> Will reusing axp20x_info break the sysfs attributes startup and shutdown =
for
> the AXP313a?
>
> When these sysfs attributes are accessed, the driver calls:
>
> axp20x_show_attr()
>   regmap_read(axp20x_pek->axp20x->regmap, AXP20X_PEK_KEY, &val);
>
> axp20x_store_attr()
>   regmap_update_bits(axp20x_pek->axp20x->regmap, AXP20X_PEK_KEY, mask, id=
x);
>
> Since AXP20X_PEK_KEY is 0x36, but the AXP313a regmap defines max_register
> as 0x21, won't the regmap core block this out-of-bounds access and return
> an error?
>
> > +     },
> >       { /* sentinel */ }
> >  };
> MODULE_DEVICE_TABLE(platform, axp_pek_id_match);
>
> --
> Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260923105757.26=
0-1-anykey196@gmail.com?part=3D1
