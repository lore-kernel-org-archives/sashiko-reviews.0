Received: from mail-ed1-f51.google.com (mail-ed1-f51.google.com [209.85.208.51])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7D2F62CCB9
	for <sashiko-reviews@lists.linux.dev>; Mon,  7 Sep 2026 01:19:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.208.51
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788743996; cv=pass; b=Wu6QdVkeb8wXB4OP9yt2AJqeufB/FRvkJVy+OShdgPW6kAPb3GK2tr/ppXhG1CnJOHZ/9FYzwWsNwRZw6NI3l3m2wBK2tis94yTC9l21zlc+4riLHvApS/IWyWZtN00HEMzQ8HLuG8XqfSdkV6OT+h5PUEHRbQIVSX23FJgDuy0=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788743996; c=relaxed/simple;
	bh=+bgq+L6or+IDlA78bRvqIw5zVSAvaI/hHpR8dhEneWU=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=oVUghhTdLA+2Ttfp8sEpqBDPQUkbw6SDa0I0Frd7x8XQWdddLxmGyYwTOhVTEapSe7XPe32vZ/VIHOowCzb8jmrIWohZJrTUQQqDaldckmK1/WX1clw3NMF8PW9NWRXdhAOH9IB9klMlvYs5DLBKXYAX2QQQtrpqJceZpWGkemw=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=h8rEmN4Y; arc=pass smtp.client-ip=209.85.208.51
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="h8rEmN4Y"
Received: by mail-ed1-f51.google.com with SMTP id 4fb4d7f45d1cf-6a68ca482e2so3720556a12.0
        for <sashiko-reviews@lists.linux.dev>; Sun, 06 Sep 2026 18:19:54 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1788743993; cv=none;
        d=google.com; s=arc-20260327;
        b=fpgHVT4JkCD4WeIFGVp3KNWvTF+qpJ5UrVP3iYpy5LtPPvCK/EfUXXmdAWAXao+NqT
         jKoBKiJqbYoE9wfAj8r5eFzM4u2dIoP++BzqLKKZS3iIPy9zt0yJNm76hB+mR+1RNtUo
         zk1NIABDC3iwTmytH58U+un6C3bx60ugkRbTIrU9+CrFGEeQCYnZM0CJGoCIxCHF5OY/
         HSJJZkNgOUIMwvCJ34daSk1AjmSd4o3nYzIgWQ+UetE0oVhZ0aaAbCGC/c/jJJ9GA/LD
         CDQJDi3BTtNpsvKUCokJG+G7KsBN+/2uZG9TeKVZqRqZVVp7HV1sQVvrvi4xdgbzgPp8
         JSFg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=gZKcMkvocj7VoTJTk7uM6l91znhbvSJKCueZyXOr4/Y=;
        fh=rEbUDeSlRDHDClN5FFB/8opoJgSDYGApSTj8TnPxcCE=;
        b=HAQaGdt9dKYw134Fg/W6g/CGJWaBaT2ZCbY73QJXWVfLjAcU34VReH6hznUoR3s6N2
         dMQZ6BEmOjpyhAuewZilT0mOmcJHuFFYy5MmN3SHBgmV79YiFT0+II25Cwbmg96Z3ND4
         Z5adlfxAxZz9upn1fII0xHh/3ZNlNKKC3Jlcd7usYtaX5MCn2ravmT4v0f5GLkm4yNmn
         QqQ4HsijMP9MXl/YtEQLqno7jWwOGvdtMVGMvI9f41jmQQu7JvERmjnVmkuDywW5o5UX
         mrZHlp/wq0bwkPVwsaH53laUeLrebgEQht5qJHP/R06KrmZcdj+92rbGmTVa1W/RjhSc
         zD9g==;
        darn=lists.linux.dev
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1788743993; x=1789348793; darn=lists.linux.dev;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=gZKcMkvocj7VoTJTk7uM6l91znhbvSJKCueZyXOr4/Y=;
        b=h8rEmN4Y2fjOS4p6ptVg7wcrVN+3wv5/Lgy7Xr6ZfdPe+83MeZMPti6EeeLyvj6Ov/
         P+OwkM+2fjY1qUiWW9PGzRHw9eWvw7osOXP2jVynYR9a5qpnAq6wm9S9HYzCINFHBNpE
         Ud345iqO/kXNLvz2RUOxI0Ix5O4HHfWNqdQdZ0KElh6J+HLnU/u7cvO91U4jcnjsFhMl
         AOIQkCZVRnqsjCSbaUvZ1gL3xT5mKuH15c+K6SIVQcZ/+S5JWwGnyoGbc4cyCdlut/Nr
         /gva8ZVl2OSmP82R+em+BkaRvQfrDxgLNHgBlz08APTMbZqKTaDBvelnQ3++T49oMCPk
         e27w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788743993; x=1789348793;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=gZKcMkvocj7VoTJTk7uM6l91znhbvSJKCueZyXOr4/Y=;
        b=EFRXt5y0sacu6wAOmP2lZ/WmR+KrEZKlPa+/DdPDwtKIaN00AP2WrOMLApNFslEhT4
         rBtPMNdqW2V+GGnx1AEIk44zhSnh5KArLuo6qJ7KUH1znbe+2F+Yxm4b+eWptHIZHMyj
         3Q83hjRlVUJAVh68gs7s8jSOWz8mzJEg2m3F09+lK66WXew5DZGwMjZHCOYVT2u2Hx4S
         P/QhS2DC3d2thX/iFP9eYYFlmb+p3+tW3MY4c96tM45c8Vc/d1VW9aM4FRaEdFI8SWKZ
         RLeJQIb49D9oMZIqmHeSLnAHva8h8nlZYb3fBebLPjI2cZ45xuE8CivZgUTe5uDLiyPU
         5tiw==
X-Gm-Message-State: AFuF++ng3sMA8HXZOnr/lYmSrPpceGw1GiARQqGVyjqKWeFNg2CjOs6O
	wOkdbXP77HdjA5/DrvxqxguR0YTk5M+eRiY221IsX1XvG4EDuw9kMK5LVjq3kYWcKWd7Vgp35ZZ
	Yo3caBxoDCb7ulpjD2P+5KA7LtWNlHh9ocQ==
X-Gm-Gg: AYBFou2vtVIkfYhTfiwHt2Hi2jNZQUlXnLwE1QBP7upZQP1wsCzhwp4elME3RK47adM
	gm5oiDIENVLbiY8o6NuCn+48IK8mv4bEDJdfmxm3qB39xkpvHzRbTn14omBwjSytjtEzJDYd5IV
	zaY9KoRf6XNrubuf/V2sN4Qq07/3XuvlbcMo4h56SvvndWhtYVe8Q1okcu9jeUW0y1XxyduakxT
	ilUo5ZXmlCfz6m3l1sjeAckHB6OFdwaFAi8LTJrcNT4/y+DxV9hHDmBymZlawNz3xArhQiqmvc0
	QQ3u3hFeVeocBQ9NEvJTCNOR2Ywyz9Xml1ncvenYckH+OW+/WekJ5FKyEHQQ6n5VDDSmGWCFp4+
	kHet2hr29Uv5jJGLtai5LwCfXptUVU2jalDh43u98+Onm2iY3L9fw1yolhpUI5wSZGD0TOPxhLb
	tV0fa5sPpOydNIW0lIa+aRLZbYM8wPWtXLSAKK9rZCM9oLAnrKs00RMLU=
X-Received: by 2002:a05:6402:2354:b0:6a5:d8eb:da01 with SMTP id
 4fb4d7f45d1cf-6a7e89bafb2mr12647144a12.0.1788743992532; Sun, 06 Sep 2026
 18:19:52 -0700 (PDT)
Precedence: bulk
X-Mailing-List: sashiko-reviews@lists.linux.dev
List-Id: <sashiko-reviews.lists.linux.dev>
List-Subscribe: <mailto:sashiko-reviews+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:sashiko-reviews+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20260907005933.230766-1-rosenp@gmail.com> <20260907011244.7EF5B1F00A3A@smtp.kernel.org>
In-Reply-To: <20260907011244.7EF5B1F00A3A@smtp.kernel.org>
From: Rosen Penev <rosenp@gmail.com>
Date: Sun, 6 Sep 2026 18:19:41 -0700
X-Gm-Features: AcwNN1WYswUQc0zUlJCYnQbmGuD4N0nctQMc2I7e2Ms8ipma1Za1wN84R-zK_-M
Message-ID: <CAKxU2N8PjO48hK7Ay+Xqc_3QNf7u4JvNkj1Vh8QWRHJqOuOxaw@mail.gmail.com>
Subject: Re: [PATCHv2] ARM: dts: marvell: armada-388: use onnn,pca9655 compatible
To: sashiko-reviews@lists.linux.dev
Cc: conor+dt@kernel.org, devicetree@vger.kernel.org, robh@kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Sun, Sep 6, 2026 at 6:12=E2=80=AFPM <sashiko-bot@kernel.org> wrote:
>
> Thank you for your contribution! Sashiko AI review found 2 potential issu=
e(s) to consider:
> - [High] Replacing 'nxp,pca9555' entirely with 'onnn,pca9655' removes the=
 fallback string, breaking device tree ABI backward compatibility.
> - [Low] The newly introduced compatible string 'onnn,pca9655' is not docu=
mented in the device tree bindings, which will cause a schema validation fa=
ilure.
> --
>
> commit c8f9a287a2365f46a814726f590cf6561513d0de
> Author: Rosen Penev <rosenp@gmail.com>
>
> ARM: dts: marvell: armada-388: use onnn,pca9655 compatible
>
> This patch updates the GPIO expander compatible string in the Armada 388
> ClearFog and Helios4 device trees from nxp,pca9555 to onnn,pca9655, and
> removes a stale comment about I2C matching limitations.
>
> > diff --git a/arch/arm/boot/dts/marvell/armada-388-clearfog.dtsi b/arch/=
arm/boot/dts/marvell/armada-388-clearfog.dtsi
> > index f8a06ae4a3c91..4a61e9d1a2c0d 100644
> > --- a/arch/arm/boot/dts/marvell/armada-388-clearfog.dtsi
> > +++ b/arch/arm/boot/dts/marvell/armada-388-clearfog.dtsi
> > @@ -131,12 +131,7 @@ &i2c0 {
> >        * 15-SFP_MOD_DEF0
> >        */
> >       expander0: gpio-expander@20 {
> > -             /*
> > -              * This is how it should be:
> > -              * compatible =3D "onnn,pca9655", "nxp,pca9555";
> > -              * but you can't do this because of the way I2C works.
> > -              */
> > -             compatible =3D "nxp,pca9555";
> > +             compatible =3D "onnn,pca9655";
>
> [Severity: High]
> Does replacing nxp,pca9555 entirely with onnn,pca9655 break backward
> compatibility for older kernels booting with this new device tree blob?
>
> Older kernels lacking onnn,pca9655 in their OF match table might fail to
> probe the expander0 GPIO expander, breaking features like USB3 power and
> SFP modules.
>
> Would it be safer to provide a fallback list to maintain the device tree
> ABI, such as: compatible =3D "onnn,pca9655", "nxp,pca9555"; ?
Not relevant.
>
> [Severity: Low]
> Is the onnn,pca9655 compatible string documented in the device tree
> bindings?
>
> Running make dtbs_check with schema validation enabled might fail if
> this string is not listed in the gpio-pca95xx bindings.
I will send such a patch once this gets merged.
>
> >               gpio-controller;
> >               #gpio-cells =3D <2>;
> >               reg =3D <0x20>;
>
> [ ... ]
>
> --
> Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260907005933.23=
0766-1-rosenp@gmail.com?part=3D1
