Received: from mail-lj1-f171.google.com (mail-lj1-f171.google.com [209.85.208.171])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0A6E44FC8E6
	for <sashiko-reviews@lists.linux.dev>; Fri, 16 Oct 2026 16:14:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.208.171
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1792167273; cv=pass; b=rAYahMKfIvmQXlAnqiXI2o60kSHjJQtBmEiV6Xqvm0YBopqy7hx9fsKg9Xaz69g0SvFVU3TUks/vUIn6TTDT7iweW8UHc0slse7WuS2pGxE6e6+PWFUAk64krSoqEhA151wAzdzSrVV0Nu0eQvKuVw74gZViW1OWV1YoE+x+wYQ=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1792167273; c=relaxed/simple;
	bh=XWM0PptT48SHio98kQC9yyK4EB0SbfqQBSb6AQOxOw0=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=BeiTCMTNsM2gcTKh877K2snVo/BWPJVD7Dwi0POsxJt3BPmtyrAQ9DPUUzCyoERi+sLps5l5S8S+O9GJBnlAp7Nmxa8UXWQE8z6E50wUXRLx471+xmVuXR3Ac3D91Q9UvTIAJu6X59uzraPhJlTL03uBx0HRQ7rkcGUCiN56HvE=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=DbGOF/AC; arc=pass smtp.client-ip=209.85.208.171
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="DbGOF/AC"
Received: by mail-lj1-f171.google.com with SMTP id 38308e7fff4ca-3a49a022221so208531fa.3
        for <sashiko-reviews@lists.linux.dev>; Fri, 16 Oct 2026 09:14:30 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1792167269; cv=none;
        d=google.com; s=arc-20260327;
        b=coaJTwFzp9B/1+Oa1d26pI3e4B5uoXCjJ7zernq0m+iovM1CHHHxuMYRXQ0Ds4MR/q
         RsbVXuzQNdJ+dyNRYDAVbVZTFZEYiZMTvck4kH08KakEanfQch5MTZBrSl1qW5XsAvym
         lZD+0GwcnHFuLTJEK68Cp99cc+sHNoEkv/1amn/QPxeB+KkzBhAJftYkL6cb8YQ5fcmr
         vN7PS1//7th7VSHM/LOHk6kCOzOdVt9tT6sCSRqHpIvkRDTDCCPLUooBx5x4Uz7VysCF
         KA6YAaXS4fPzBHgXyXxkKWf8S5uyZuEBdrTC3dJ2csFMrKxTXOekV50p4Yc/UGVTEZ+3
         w2+g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=gZER+Z2hSHjmZyeGIvEluIbU09gJM9ZpLypRSxth3j0=;
        fh=dfvPRi+t5KvUF1qpgNVmacxvd83mvku6fE8K+/2kbH8=;
        b=YFULJXVleYgMG+HQNE+gjh3ytyiCyDudUXPxuE/cKHK9oyAKzZQ9dwvQ7SoLZTgXgt
         Dryd+teR6NEfyr5WWiP0CAYGkLC0kgXqJA2eR1kv/6PUvlzs0WIavVbJM1L411spMhYu
         McQRapY7NNyBdVFiLPaDjhZUfuQBhqTCbZ4307D+rI7kqf6rpOXIXAH/iCv1ez4bsAJH
         Nju7f+uIsYJWlmhY4dPx8UmjFrvwfV/N7h+ytKIDgRqOFzBgNwx3/JcSDgjo9kaCTwp4
         kl5v0v1NBoK89ThLfjxdIipHy7/cKvJr7Yi1J+t6tIIW6IlE3FEdeCvL4KrhgEnut1Gl
         RgTQ==;
        darn=lists.linux.dev
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1792167269; x=1792772069; darn=lists.linux.dev;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=gZER+Z2hSHjmZyeGIvEluIbU09gJM9ZpLypRSxth3j0=;
        b=DbGOF/ACgw6LBRG5duknui3eZwFxm+1VvL0jCjB5LoODkqsEvlQcdQqTW/6IAmmRtE
         mDo+YtjTvPiZS4Xp2/1LRpcP5f8gBI3ihsJSSFcUwDFLjn0I1yhzGOGe2bwU8SS0dKm1
         gkCyyZS//zjvYk00NuJDeOX5kJ5XqHCKywlL3CKeV2loMK7tl/U5qlrKntdPrdk/S4WF
         R81KjRTMf51hyEaNqNdVC/7c31r9gmdFew5BJxTZeUjWyUXRtpStg+ml4X6BPfp2nO90
         xgP15TJ2qQzQKArdGNZqzxSDk7uh2Ar6ySvQiNhl0GIFCbbZOBjcjXNAaMjJJqpqlzMT
         V2GQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792167269; x=1792772069;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=gZER+Z2hSHjmZyeGIvEluIbU09gJM9ZpLypRSxth3j0=;
        b=ehDparvLAvEImEB0WmZURh2isNryVZLThVi0nc2WrWGyUL/YV8nh4N8G2lh/kAsC7j
         Ex9hoSauAUqb1G8GAJ9AFnuDvh2lRBoPNg9kUbCIZ2bCshC6nY+P22ZjTcVm0SZsP8rZ
         luLdKO25d9NlqXclgIieyN4vmXbn1Tsptm9PNXm2VgPOV+M8hnzRhOVpDjR2XJT3PitH
         MhUog8/1ZlZC+3Px6R+HEozfkfDtz0+6GkWZLrujHt+IZ1+zvlO8vurzpEC7d8XC+19G
         ykliQ2RxFevTMmvjE64I5YLvm3ObL4lyKA3IiNDetjs+Cl6sHtp2ObNUrCDAZ9dSXmEN
         h8Sw==
X-Gm-Message-State: AFq9FYIBJEnoXGqKk45YOB01SqFi33rgK1wKAMgfvUVE+Z8Hq5Mvs7OT
	Z0kcuFazlbvCsDIB0YWsCHa246gLAWLxSfIyIaykkjm/mSxhC2GEquQngZeufATPFnBlqAeplqt
	jSSpMwWKZGioOucYienu0z+4n5yLh6WgLX6Cn
X-Gm-Gg: AYBFou2zG4ROoZUrIhkOZdY/3lL+jZfUQLwLnF8PnF7Tzw4yzEVEX5NgCe6/hu4vgtt
	JegEsORcdTJZnvu1LXXLIMpDJVMtCUlu/+0DIz/B9SYifDwHSJMF0n7aLb2cl/tx2UgVVAdScdg
	iq4SuXXPKDvtDrtZzY/94OhzgHJC5Q18rPiDKwzIldd/KCYHenhCZu+FTAUlLMXTuwN7ZE2fIc2
	0O0rYIuRUMByEdEw9iBsaQ4so9Wc5ga9jf+12tQNrbLlv0ATpZyaFJkIAN03E753NK1EN7Nc0VL
	nUfxzmPlI1k2nC+ZnD/Ia77hW+hsEOb3HvLzknNCumT82O7l3YBmEe8qqUtO+0/9kxeeiRkXCNZ
	cCtvUUYEvzrrX
X-Received: by 2002:a05:651c:1501:b0:3a9:a9f3:1e93 with SMTP id
 38308e7fff4ca-3ab29290997mr609181fa.10.1792167268791; Fri, 16 Oct 2026
 09:14:28 -0700 (PDT)
Precedence: bulk
X-Mailing-List: sashiko-reviews@lists.linux.dev
List-Id: <sashiko-reviews.lists.linux.dev>
List-Subscribe: <mailto:sashiko-reviews+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:sashiko-reviews+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20261016114757.1099300-1-meven@kde.org> <sashiko-outbox-174261@kernel.org>
In-Reply-To: <sashiko-outbox-174261@kernel.org>
From: =?UTF-8?B?TcOpdmVu?= <meven29@gmail.com>
Date: Fri, 16 Oct 2026 18:14:15 +0200
X-Gm-Features: AclHuK934t3G5978UIGy52jZ8v9DVUSyCs0cEfT2mYhlpX3AVMrgexX3inHtJ8k
Message-ID: <CAOvFf8NOvVUhuD=Ak=kXUN-e32HJTtUh+qyNG2thTHFf-HjHVA@mail.gmail.com>
Subject: Re: [PATCH v4] HID: logitech-headset: add a battery driver for the
 PRO X 2
To: sashiko-reviews@lists.linux.dev
Cc: linux-input@vger.kernel.org, dmitry.torokhov@gmail.com
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Le ven. 16 oct. 2026 =C3=A0 13:58, <sashiko-bot@kernel.org> a =C3=A9crit :
>
> Thank you for your contribution! Sashiko AI review found 1 potential issu=
e(s) to consider:
> - [Low] kconfig: unmet direct dependency on USB_HID for HID_LOGITECH_HEAD=
SET
> --
>
> commit d9d20c74276791f547d49f85750e9fd359bb8c0c
> Author: M=C3=A9ven Car <meven29@gmail.com>
> Subject: HID: logitech-headset: add a battery driver for the PRO X 2
>
> The PRO X 2 LIGHTSPEED receiver does not speak HID++, so
> hid-logitech-hidpp cannot read its battery. Its report descriptor has a
> consumer collection for the media keys and two vendor collections, and
> no report 0x10 or 0x11.
>
> > diff --git a/drivers/hid/Kconfig b/drivers/hid/Kconfig
> > index 0e3a0ccd6901e..60f579be1da69 100644
> > --- a/drivers/hid/Kconfig
> > +++ b/drivers/hid/Kconfig
> > @@ -680,6 +680,7 @@ config HID_LOGITECH_DJ
> >       depends on HIDRAW
> >       depends on HID_LOGITECH
> >       select HID_LOGITECH_HIDPP
> > +     select HID_LOGITECH_HEADSET
> >       help
> >       Say Y if you want support for Logitech receivers and devices.
> >       Logitech receivers are capable of pairing multiple Logitech compl=
iant
>
> [ ... ]
>
> > @@ -687,6 +688,18 @@ config HID_LOGITECH_DJ
> >       generic USB_HID driver and all incoming events will be multiplexe=
d
> >       into a single mouse and a single keyboard device.
> >
> > +config HID_LOGITECH_HEADSET
> > +     tristate
> > +     depends on USB_HID
> > +     select POWER_SUPPLY
> > +     help
>
> [Severity: Low]
> Could this select statement in HID_LOGITECH_DJ cause an unmet direct depe=
ndency
> warning?
>
> HID_LOGITECH_DJ unconditionally selects HID_LOGITECH_HEADSET, but
> HID_LOGITECH_HEADSET specifies a direct dependency on USB_HID.
>
> Because Kconfig's select directive forces the symbol on without evaluatin=
g its
> dependencies, enabling HID_LOGITECH_DJ in a configuration lacking USB_HID=
 will
> produce an 'unmet direct dependencies' build warning.
>
> Should HID_LOGITECH_DJ inherit the dependency on USB_HID, or should the s=
elect
> be conditional?

HID_LOGITECH_DJ already depends on USB_HID, so it cannot be enabled
without it, and the select cannot leave HID_LOGITECH_HEADSET with an
unmet dependency.

HID_LOGITECH_HIDPP also depends on HID_LOGITECH that itself depends on USB_=
HID.

--=20
M=C3=A9ven
