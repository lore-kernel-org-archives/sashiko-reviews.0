Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6D9473F1AA1;
	Thu, 16 Jul 2026 08:44:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784191495; cv=none; b=LNoV98eT7dF96Hi55RamhgisK8GCVLf5qKsDUURYVLSVUY+WKojGoo9EnglEohtA/INk3B/bsFYs9KzJlAByK+ZJCPUWSOpwHZl+4Ow3mAut6VjwzzvIDcaZubYdsL2jsy/5HQCygqwLDD3pkraAJ9Xq9Hru2rD3O/c5Ikk97gs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784191495; c=relaxed/simple;
	bh=S5lASA7NpCMnGO1B8N1OA20kRMNHAYAoqCQZ5csLoss=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=X4yP6GBMhtMg5sTSHIHzbGFKoKnLWwKX/POl6GYVhRmemCkRY5heo6hV0uat2gtdWTeD0eB9E/JRIj1NMl7JSlcG+tmd+FE6Ys6swTKIOrYoL9I6VoS7Cg5xJp+80KPVPPsZ44JfV3ewC1r5cieYU5TnorAmDMEer9Cche8XDvQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=MCzjp4OI; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="MCzjp4OI"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id D65F01F000E9;
	Thu, 16 Jul 2026 08:44:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1784191494;
	bh=hOUPmdvTwatpY2JjUPvP5VOSDTgfbqe/iiMu2A2YDHI=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=MCzjp4OIOZxL2ZKQBTikJafgwA75uHmZnAPo6zmE3865qDc1K5HfLHxPRS3ytdLCG
	 pjaWBtM8z+DdML31vYyey14mZ1jjJ1iQgjsF61F0Z+o7xpeboMKJtbtJB6N+3DtGnF
	 jGwrca7yZMyYydzcjBDHCpBMxIbUCsE/RovLuRQSotTeAopal0s1WrhzcEmKLG5bJR
	 +R8AoncerHWp7JereXQj/ZYKNb+4dFglCpoWxAchhCLYNNlnpjwtlLB5wvzvy/+pec
	 EvyW2MU9ImL+iYTt1fXCUuvzWpoahKJ4ZA1w3nlwqVVIltLTFT7QMoFWvODi7cylan
	 SXrdR2NS+uj8w==
Date: Thu, 16 Jul 2026 09:44:50 +0100
From: Conor Dooley <conor@kernel.org>
To: Hal Feng <hal.feng@starfivetech.com>
Cc: "sashiko-reviews@lists.linux.dev" <sashiko-reviews@lists.linux.dev>,
	"conor+dt@kernel.org" <conor+dt@kernel.org>,
	"robh@kernel.org" <robh@kernel.org>,
	"devicetree@vger.kernel.org" <devicetree@vger.kernel.org>
Subject: Re: [PATCH v22 2/3] riscv: dts: starfive: Correct pwm nodes
Message-ID: <20260716-yippee-moneywise-7d6b9568b6ec@spud>
References: <20260714033050.44952-1-hal.feng@starfivetech.com>
 <20260714033050.44952-3-hal.feng@starfivetech.com>
 <20260714034453.8AA771F000E9@smtp.kernel.org>
 <ZQ2PR01MB13070E253E038C26E43C63C3E6F82@ZQ2PR01MB1307.CHNPR01.prod.partner.outlook.cn>
Precedence: bulk
X-Mailing-List: sashiko-reviews@lists.linux.dev
List-Id: <sashiko-reviews.lists.linux.dev>
List-Subscribe: <mailto:sashiko-reviews+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:sashiko-reviews+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="tKS4ZbWocdpMhOni"
Content-Disposition: inline
In-Reply-To: <ZQ2PR01MB13070E253E038C26E43C63C3E6F82@ZQ2PR01MB1307.CHNPR01.prod.partner.outlook.cn>

--tKS4ZbWocdpMhOni
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Wed, Jul 15, 2026 at 02:25:09AM +0000, Hal Feng wrote:
> > On 26.07.14 11:45, sashiko-bot wrote:
> > Thank you for your contribution! Sashiko AI review found 1 potential is=
sue(s)
> > to consider:
> > - [Medium] Missing electrical pad configuration properties in `pwm1_pin=
s`
> > after node split.
> > --
> >=20
> > --- Patch [2]: [PATCH v22 2/3] riscv: dts: starfive: Correct pwm nodes =
---
> > commit af3d5e9905acdead9e2816d09f13f054b179cbde
> > Author: Hal Feng <hal.feng@starfivetech.com>
> >=20
> > riscv: dts: starfive: Correct pwm nodes
> >=20
> > Each of the StarFive JH7100/JH7110 SoCs has 8 OpenCores PTC IP cores.
> > One OpenCores PTC IP core can output one PWM channel. Change the
> > register size to 0x10, since an OpenCores PTC IP has only 4 32-bit regi=
sters.
> >=20
> > Fixes: 8d01f741a046 ("riscv: dts: starfive: jh7110: Add PWM node and pi=
ns
> > configuration")
> > Fixes: 5e598b99fedf ("riscv: dts: starfive: jh7100: Add PWM node and pi=
ns
> > configuration")
> >=20
> > > diff --git a/arch/riscv/boot/dts/starfive/jh7100-common.dtsi
> > > b/arch/riscv/boot/dts/starfive/jh7100-common.dtsi
> > > index ae1a6aeb0aeaa..85106545090ea 100644
> > > --- a/arch/riscv/boot/dts/starfive/jh7100-common.dtsi
> > > +++ b/arch/riscv/boot/dts/starfive/jh7100-common.dtsi
> >=20
> > [ ... ]
> >=20
> > > -	pwm_pins: pwm-0 {
> > > -		pwm-pins {
> > > +	pwm0_pins: pwm0-0 {
> > > +		pwm0-pins {
> > >  			pinmux =3D <GPIOMUX(7,
> > >  				  GPO_PWM_PAD_OUT_BIT0,
> > >  				  GPO_PWM_PAD_OE_N_BIT0,
> > > -				  GPI_NONE)>,
> > > -				 <GPIOMUX(5,
> > > +				  GPI_NONE)>;
> > > +			bias-disable;
> > > +			drive-strength =3D <35>;
> > > +			input-disable;
> > > +			input-schmitt-disable;
> > > +			slew-rate =3D <0>;
> > > +		};
> > > +	};
> > > +
> > > +	pwm1_pins: pwm1-0 {
> > > +		pwm1-pins {
> > > +			pinmux =3D  <GPIOMUX(5,
> > >  				  GPO_PWM_PAD_OUT_BIT1,
> > >  				  GPO_PWM_PAD_OE_N_BIT1,
> > >  				  GPI_NONE)>;
> > >  		};
> > >  	};
> >=20
> > [Severity: Medium]
> > Should pwm1_pins also include the electrical pad configuration properti=
es?
> >=20
> > When the pwm_pins node was split, properties like bias-disable,
> > drive-strength, input-disable, input-schmitt-disable, and slew-rate were
> > configured for pwm0_pins. However, pwm1_pins only has the pinmux
> > configured.
> >=20
> > When the kernel applies the pinctrl state for pwm1 during probe, it wil=
l only
> > configure the pinmux and skip the pad electrical settings. Does this le=
ave the
> > PWM1 pad in an undefined or default electrical state that could cause w=
eak
> > signal drive or other signal integrity issues depending on the hardware
> > defaults?
>=20
> No, I added the new electrical properties for pwm0-pins, so the old elect=
rical properties
> are applied to pwm1-pins. You omitted the original code and got a wrong r=
esult. Please
> apply the patches to the mainline before you review them.
>=20
> The same reason as I explained before.
> https://lore.kernel.org/all/ZQ2PR01MB1307E58DBE3D3EA2DCA9BE9AE6162@ZQ2PR0=
1MB1307.CHNPR01.prod.partner.outlook.cn/

This is a bot that feeds your patches to an LLM for review.
The bot is not sophisticated enough to check previous revisions for
responses to the same problems.

--tKS4ZbWocdpMhOni
Content-Type: application/pgp-signature; name=signature.asc

-----BEGIN PGP SIGNATURE-----

iHUEABYKAB0WIQRh246EGq/8RLhDjO14tDGHoIJi0gUCaliaAgAKCRB4tDGHoIJi
0kDJAQDDASS/dd0e+joWPmnr8XxK1YAte9uwWhzfz2LhDZmx1QEAmYceBF72cEE4
6mQP7G+4JHEkjHz3EM+kj2DZKlXSqQk=
=j9mY
-----END PGP SIGNATURE-----

--tKS4ZbWocdpMhOni--
