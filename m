Received: from mail-24425.protonmail.ch (mail-24425.protonmail.ch [109.224.244.25])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 914354D90D7
	for <sashiko-reviews@lists.linux.dev>; Fri, 25 Sep 2026 18:43:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=109.224.244.25
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790361788; cv=none; b=tiAQTsSWXVPDZYSfyZ32aKa9EygFZpEOvT9vT/1GYFHTD8emFWKFDE7azqkcWlF4GsjkQvjfYA9OfGurqy1HxuLCohJO4bUA8Nqbz8xfftZJbVqyywVJkRie0xDSMoBlMFEKgTASiqFy/HH6Zmc4zl5GhkhFxcGGVYtf2lbbW4Y=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790361788; c=relaxed/simple;
	bh=LyGdqqrQ0vd54rvHRqB5PWD2AGY0gDgKQDe0UFFUlfA=;
	h=Date:To:From:Cc:Subject:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=rWd4zOcFyPoYrBwUEdRYCMksfAQ0r0vqZOhz/Wqg0au+Y7CtBQC/9RDnWhBk+46bErUwSvM/A/mctL78nBDjYeSziAXY/eIBFNw/R1trOO1OXE/hds73GfNuFNwF2lV5+CMGKBWBH9AFCqhpotE5/CuFDtBUEbu/XeiBUr51o68=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=protonmail.com; spf=pass smtp.mailfrom=protonmail.com; dkim=pass (2048-bit key) header.d=protonmail.com header.i=@protonmail.com header.b=HlVkb3FD; arc=none smtp.client-ip=109.224.244.25
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=protonmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=protonmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=protonmail.com header.i=@protonmail.com header.b="HlVkb3FD"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=protonmail.com;
	s=protonmail3; t=1790361779; x=1790620979;
	bh=7pn7pcVoPhTOJIXSkVX/8RnmQp0/EqHKka+NfvDRV8s=;
	h=Date:To:From:Cc:Subject:Message-ID:In-Reply-To:References:
	 Feedback-ID:From:To:Cc:Date:Subject:Reply-To:Feedback-ID:
	 Message-ID:BIMI-Selector;
	b=HlVkb3FDc4mNcwr4g1JnsGlh4gM+ixWbsmlJDL/1BeAq+04nZcoCpqE56frZqW2Gn
	 vu/k18ZmJntL1SXq88+9lKbDrHgaZJ51YlSBCKxKNCwm4H4OlcTGZ6FF6E4da/I7xm
	 RuX043Aysg9eBnbYb7yJBWrNEgyvVKaYXR5agppBXW3ZnjauOMEk+Do7qeuP/m6T6c
	 C0ZLWxIxjRn++XdEJRTESrEKjziYWydVmhLcPyXIiy08L+QKwz2A+8B40PTMSH9pri
	 nKaoKofBt7Qh4tw2J31+DuJSLHjQK3+g6h4uu03ryGWy9ztb+8kotCx6Ix0YWWnqJa
	 tDynCRd2YGzuA==
Date: Fri, 25 Sep 2026 18:42:55 +0000
To: sashiko-reviews@lists.linux.dev
From: Yassine Oudjana <y.oudjana@protonmail.com>
Cc: devicetree@vger.kernel.org, robh@kernel.org, conor+dt@kernel.org
Subject: Re: [PATCH v9 4/6] dt-bindings: pinctrl: mediatek,mt6779-pinctrl: Document MT6765 pin controller
Message-ID: <yGJDPa8csyO6apSZnPdzzedE2MTkVaD8h4vjCM7woH1CVJ_C1iD1EmuUxUnHJhiwXbI0tnh_DKnXM2KNXhjqzEI2Y_q3Dp9A2D7wlAv7tQE=@protonmail.com>
In-Reply-To: <20260925155559.9AA941F00898@smtp.kernel.org>
References: <20260925-mt6735-pinctrl-v9-v9-0-bfb19d8bb87c@protonmail.com> <20260925-mt6735-pinctrl-v9-v9-4-bfb19d8bb87c@protonmail.com> <20260925155559.9AA941F00898@smtp.kernel.org>
Feedback-ID: 6882736:user:proton
X-Pm-Message-ID: 89f76ae22e23fe1d0287e5e30c9ffb5b376bf85d
Precedence: bulk
X-Mailing-List: sashiko-reviews@lists.linux.dev
List-Id: <sashiko-reviews.lists.linux.dev>
List-Subscribe: <mailto:sashiko-reviews+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:sashiko-reviews+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable

On Friday, September 25th, 2026 at 4:56 PM, sashiko-bot@kernel.org <sashiko=
-bot@kernel.org> wrote:

> Thank you for your contribution! Sashiko AI review found 1 potential issu=
e(s) to consider:
> - [Medium] pinctrl: mediatek: DT binding allows drive-strength 16 which d=
river rejects
> --
>=20
> commit c86bb87060bc7c504b8fa22832cdfbbac4934ccd
> Author: Yassine Oudjana <y.oudjana@protonmail.com>
>=20
> dt-bindings: pinctrl: mediatek,mt6779-pinctrl: Document MT6765 pin contro=
ller
>=20
> The MT6765 pin controller has had a driver for a while, but DT bindings w=
ere
> never documented for it.
>=20
> > diff --git a/Documentation/devicetree/bindings/pinctrl/mediatek,mt6779-=
pinctrl.yaml b/Documentation/devicetree/bindings/pinctrl/mediatek,mt6779-pi=
nctrl.yaml
> > index 4df6971030416..94117008ebf9f 100644
> > --- a/Documentation/devicetree/bindings/pinctrl/mediatek,mt6779-pinctrl=
.yaml
> > +++ b/Documentation/devicetree/bindings/pinctrl/mediatek,mt6779-pinctrl=
.yaml
>=20
> [ ... ]
>=20
> > @@ -61,6 +62,41 @@ required:
> >
> >  allOf:
> >    - $ref: pinctrl.yaml#
> > +  - if:
> > +      properties:
>=20
> [ ... ]
>=20
> > +      patternProperties:
> > +        '-pins$':
> > +          patternProperties:
> > +            '^pins':
> > +              properties:
> > +                drive-strength:
> > +                  enum: [1, 2, 4, 16]
>=20
> [Severity: Medium]
> Does this binding allow a drive-strength that exceeds the hardware capaci=
ty?
>=20
> The MT6765 driver is configured to pass the device tree drive-strength
> value strictly as a raw register value:
>=20
> drivers/pinctrl/mediatek/pinctrl-mt6765.c:mt6765_data {
>     ...
>     .drive_set =3D mtk_pinconf_drive_set_raw,
>     ...
> }

The drive-strength property takes mA values as per pincfg-node.yaml. Fixing=
 the driver to take mA values is out of the scope of this series.

>=20
> The core driver then safely rejects values exceeding the 3-bit register m=
ask
> (which limits values to at most 7):
>=20
> drivers/pinctrl/mediatek/pinctrl-mtk-common-v2.c:mtk_hw_set_value() {
>     ...
>     if (value < 0 || value > pf.mask)
>         return -EINVAL;
>     ...
> }
>=20
> Since 16 is greater than the hardware register mask, would device trees
> using this value pass schema validation but fail to configure pins during
> driver probe?
> --
> Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260925-mt6735-p=
inctrl-v9-v9-0-bfb19d8bb87c@protonmail.com?part=3D4
> 
