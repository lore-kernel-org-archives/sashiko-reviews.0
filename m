Received: from mail-ed1-f54.google.com (mail-ed1-f54.google.com [209.85.208.54])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4292F231A21
	for <sashiko-reviews@lists.linux.dev>; Sun, 26 Jul 2026 14:53:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.208.54
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785077619; cv=pass; b=eVnmJAzoaGSXOq7l48wkf4gHHTPy0jc285H4sl42Y0LmrBHt6V4WWWOApOXzCnDgq78saa1kArYwN15qvkzrUvdJUYsivxSmQ9cSthg0BhJuPnXOdAYKnEfQ9xlO+UrhJO+gLQLZ5GECoCp0Ev/WFq/YGxc1SmnU6Qiii9nFv68=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785077619; c=relaxed/simple;
	bh=R9f/pVZc43NS1ELRvBxRZnxLsiBqbijHMdSlyhcCN0c=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=KkJCP31A+xELhPkWfaNpErpNoYBJ5m9qLYLI1am0iQPhSYTXEXmPXSgZstDM4KQw72tC2uipN5N6lQqX1PNiQRqL32e0h1q5lOUhW4IVlyk2kyOscl+tDZtbTYp7Jyzlq4VicrHzSW+y2jQSS9QPyTjJ9SkGYiNUgvhcrZ2DTyw=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=IMGw9Y4t; arc=pass smtp.client-ip=209.85.208.54
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="IMGw9Y4t"
Received: by mail-ed1-f54.google.com with SMTP id 4fb4d7f45d1cf-69c3044e4b2so291777a12.2
        for <sashiko-reviews@lists.linux.dev>; Sun, 26 Jul 2026 07:53:38 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1785077616; cv=none;
        d=google.com; s=arc-20260327;
        b=ck80URhs6Nsa2/HY8SauioaCFHfgD1hCMqJHa+9mdd6+e1aIOyuLvb70RxW/zzWXvY
         Ite+e497EiMrv+Y2bZKLE9+2E0SWsfJPRcqt48iBW9tVdogsdqweGk54ElfrEcojB3ts
         9zORJDxtvC1M5Xr5tO3Dj9EgY586QFj8sL0r0ZkAX1XmlCRI5YxrWiUXIS+NhaKXs5Sp
         otKS6Kju2W7n/jHhwKzkBofReIhMl3xTzvmCXSxKEhlC0Pdd5Hlh/JRVWotLYwEYjsZp
         J/ZTFrU2KQBye3AIWR5cPD8klSV6Sz5TElpd+K2USArUhKwEjWkmkneZ0QyN3EDmHHt7
         XXyw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=2SqHyyBA+Ia1q8kRP2fi5yiAfiuE7PWnVjVyGMbBz8E=;
        fh=o9tesHJqpAboKLnI8f4pDTFFw62D4/egZePQM0kvGzg=;
        b=lPw9Cvs0HaqXEoxFo5UbUypR8XOXmKdKIag6vY7EgyYj4AUe/PKwU7x1p9O1ObD8hc
         71aM9uiv698K1J3d94YSYMj+gip/3sM7qD04rZUWfdaqz7uRsroY3Mfbh9bjpZurV+6D
         G4sl0qQrMDmsFomzjvOUmukT1ejL7dHH4pjoltFMNrO0AoviC49lj90XDyHrcjeA8aZL
         /Lhj3LkPIp9P4OyV/56auq3qowl1T35x+gmWM/GpAu3zouAIa/guaQk7VxZSk4jD+XIv
         4VWbboVMw9j6h3DAnmVv1pkxsIqX40rgrXMWv1kBMasTO3Xm6egpuvmUY8K5ksCO6E4N
         06NQ==;
        darn=lists.linux.dev
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1785077616; x=1785682416; darn=lists.linux.dev;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=2SqHyyBA+Ia1q8kRP2fi5yiAfiuE7PWnVjVyGMbBz8E=;
        b=IMGw9Y4t7XEkia/5AvCs4iQsGlH+cBbqBj9R3NEPKlNNu/yshSDNGvOuppj1ySKWlH
         nnuWqSSz7127KH1TpRZsLhqCCe5mR+beLEZ9Ql2Aij5JluRtHCrvQ/Q1VdV5PrTa96tC
         JWQFzIrnf/K6O4cxlEsAyELqoy3vSvEhrIcMgu2S5xNi+xUNHw5jmWAEK1qKr32R3fkt
         EDz1hv6SaWSMorExo5wpDgytuldkShHPyCkiLPkrpQ/Y4ysOyMyF9xfciMphkoMHuFcg
         BX5xbwlcWLfzzOKCOQEjohoh/J2B/U/p3q0It9L/VNmvuX4nBBqaHCkYobMeQw39rzJB
         UHgA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1785077616; x=1785682416;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=2SqHyyBA+Ia1q8kRP2fi5yiAfiuE7PWnVjVyGMbBz8E=;
        b=R3C91RXo3cXJ5DdnN9hssBBoTllUbYK0HVMSft+olsVLj7Xwu7LGDBtjS6JcTvWc/W
         T5LbbnNP0mlIaLP3SfLnTQQ5KDobrJkUBm9UmA7I+9IQbiOyi/4frEA1FPxxxRcUo7eC
         zeQM0dCBCFWc4saozwK27lcpYsP2WJmSkZGruhb7iDlvvA1d6K37PahRWQx4mDyepimi
         4NSLhbhcGQY/G+Y3hToSkh2CKf4RpdqoDGNhhL/ue4kTc9ev5LH2/tY1ZY4HPWvPAMB6
         sMH66Z0FBgUQT9aA2E6hTVSy6++LmcUXRKnPR6XFOTzqkHHr0B71e0Rn5qTz0lb8Nffc
         zsjg==
X-Gm-Message-State: AOJu0Yy8VMDg7/rlynthjNMLV0hEPslqQM39Mij7G6iKQ8QBPV9Roegr
	ffRhE3SSOl7oEOIJX/o1pYmIHoEtl2MKKO8Hsf/HRKC+0+hqE0zN0xluXCcDPyowpGbqSGQ6lig
	FOf1oIOraL/Ip+/mBx37Lx9DV5tamkUYaRT1s
X-Gm-Gg: AR+sD11zBigUO5yLkGG6swucbrFuq7l1RgKrPu6W84IqpsMz+cHDWxZAXKp3lySh+sg
	fnQnzVTfZCeZcVeaa7yd2mK87KNIciOWhLfMIT5wTJxezyUoTBX4l+8YqYwH3xKTfDcG5s5fSWB
	jpj/MF2UPsNBwAZoW490e7FAxreyObVCX3scj2y0GU3MR9Dsu/Ip6ecBgJyKDFKxJgs9yFZTtlz
	JGKt3iFHGzVq3VO3vJ5sXt7XNsUmux8mV617zAZzsI2xp9nQaWwEqv3ZaY1Z+mYDGMw4C1rS3Q2
	D65dw2c=
X-Received: by 2002:a05:6402:51c7:b0:69c:7a3f:9fb5 with SMTP id
 4fb4d7f45d1cf-69fc117f84dmr1172000a12.7.1785077616017; Sun, 26 Jul 2026
 07:53:36 -0700 (PDT)
Precedence: bulk
X-Mailing-List: sashiko-reviews@lists.linux.dev
List-Id: <sashiko-reviews.lists.linux.dev>
List-Subscribe: <mailto:sashiko-reviews+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:sashiko-reviews+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20260721-dcphy-rx-v1-v1-0-4fc83c0ccac9@gmail.com>
 <20260721-dcphy-rx-v1-v1-3-4fc83c0ccac9@gmail.com> <20260721104456.0695D1F01560@smtp.kernel.org>
In-Reply-To: <20260721104456.0695D1F01560@smtp.kernel.org>
From: =?UTF-8?B?5qWK5pm65oiQ?= <jason98166@gmail.com>
Date: Sun, 26 Jul 2026 22:54:10 +0800
X-Gm-Features: AUfX_mzTjOOwIggGzm-aEH5bYG0UISvchkAs7LjBaVST0b3wi1zvFpg_5iayiDI
Message-ID: <CAPwA33Kin3jRGmUCCUt86n64C+q5N0E4a+afsWZPyFypDAW3Og@mail.gmail.com>
Subject: Re: [PATCH 3/4] phy: rockchip-samsung-dcphy: model TX and RX as
 separate PHYs
To: sashiko-reviews@lists.linux.dev
Cc: conor+dt@kernel.org, neil.armstrong@linaro.org, olteanv@gmail.com, 
	vkoul@kernel.org, devicetree@vger.kernel.org, robh@kernel.org, 
	linux-phy@lists.infradead.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

> Does this code modify the shared samsung->lanes state before checking if
> the direction is supported?

Yes, this is a valid finding - and the shared lane count turned out to
be a real problem beyond the ordering. It reproduces on hardware: with
the receiver configured for one data lane, powering the transmitter
off afterwards disables only one of its two lanes and leaves the
second still enabled, which the per-lane GNR_CON0 registers confirm.

In v2 both the lane count and the receiver link rate become
per-direction state, so a configure() call can no longer clobber the
other direction, and the peer power_count check is replaced by a
powered flag kept under the provider mutex. With those changes the
same sequence disables both lanes cleanly on the same hardware.

Thanks,
Jason

<sashiko-bot@kernel.org> =E6=96=BC 2026=E5=B9=B47=E6=9C=8821=E6=97=A5=E9=80=
=B1=E4=BA=8C =E4=B8=8B=E5=8D=886:44=E5=AF=AB=E9=81=93=EF=BC=9A
>
> Thank you for your contribution! Sashiko AI review found 1 potential issu=
e(s) to consider:
> - [High] Concurrent or unsupported PHY configuration clobbers the shared =
`samsung->lanes` driver state before verifying the direction is supported.
> --
>
> --- Patch [3]: [PATCH 3/4] phy: rockchip-samsung-dcphy: model TX and RX a=
s separate PHYs ---
> commit 242b9435d09e0133de4658156f3cc224aa2f84c9
> Author: Jason Yang <jason98166@gmail.com>
>
> phy: rockchip-samsung-dcphy: model TX and RX as separate PHYs
>
> This commit models the MIPI DSI transmitter and MIPI CSI receiver as sepa=
rate
> PHYs that share the same hardware block. It registers one struct phy per
> direction and adds a per-provider mutex to serialize access to the shared
> state.
>
> > diff --git a/drivers/phy/rockchip/phy-rockchip-samsung-dcphy.c b/driver=
s/phy/rockchip/phy-rockchip-samsung-dcphy.c
> > --- a/drivers/phy/rockchip/phy-rockchip-samsung-dcphy.c
> > +++ b/drivers/phy/rockchip/phy-rockchip-samsung-dcphy.c
>
> [ ... ]
>
> > @@ -1488,11 +1521,15 @@ samsung_mipi_dcphy_pll_calc_rate(struct samsung=
_mipi_dcphy *samsung,
> >  static int samsung_mipi_dcphy_configure(struct phy *phy,
> >                                       union phy_configure_opts *opts)
> >  {
> > -     struct samsung_mipi_dcphy *samsung =3D phy_get_drvdata(phy);
> > +     struct samsung_mipi_dcphy_dir *pd =3D phy_get_drvdata(phy);
> > +     struct samsung_mipi_dcphy *samsung =3D pd->parent;
> >       unsigned long long target_rate =3D opts->mipi_dphy.hs_clk_rate;
> >
> >       samsung->lanes =3D opts->mipi_dphy.lanes > 4 ? 4 : opts->mipi_dph=
y.lanes;
> >
> > +     if (pd->dir =3D=3D RK_DCPHY_DIR_RX)
> > +             return -EOPNOTSUPP;
> > +
>
> [Severity: High]
> Does this code modify the shared samsung->lanes state before checking if
> the direction is supported?
>
> Since this is done without holding samsung->lock, can a consumer
> configuring the RX PHY clobber the active TX PHY's lane count?
>
> If the lane count is corrupted, it looks like it could lead to incorrect =
lane
> power-down sequences when the TX PHY is disabled later, potentially leavi=
ng
> MIPI lanes actively driven.
>
> Should the pd->dir check and the lock acquisition happen before updating
> samsung->lanes?
>
> [ ... ]
>
> --
> Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260721-dcphy-rx=
-v1-v1-0-4fc83c0ccac9@gmail.com?part=3D3
