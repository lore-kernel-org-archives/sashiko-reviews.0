Received: from esa.microchip.iphmx.com (esa.microchip.iphmx.com [68.232.154.123])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3D1FD4C77D3
	for <sashiko-reviews@lists.linux.dev>; Fri,  5 Jun 2026 10:53:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=68.232.154.123
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1780656788; cv=none; b=jZDk+HE2wIxB53GbtHwBvloDMo8l/M4z9dsl5GZCG+Gs2DJ9J2tmK4xYnYLKXhJJcB7smeNYJhO7RIRSRcY5dJ9j4lUy66kmqD34aLK/1IEHXk63Mty1F3lDOLlKYfOmEpEEf57zo7hELxnbHu/QYazdVP9AhedmiwjPVWOaCEg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1780656788; c=relaxed/simple;
	bh=eko3ejY1AKL8S/i3X/Usf5JDfNK2dEIqUhYr1ERevno=;
	h=Date:From:To:CC:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=Nlp3TwbEMCCzgxXsBfXJ7zFNRXwBk9G5ekilCL9wYXcqfhWkiy1sAJF5Hq9gC/F7lmUakYaRsMCVwtGJMEFIirn7rqaxT+1/YuOJyK/IMc7WeXZvM4mIA+tnybF3XbqTr90EIZkiWejMOpO37ZhzF2qrY2JWCjxJXBFUvs/yclQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=microchip.com; spf=pass smtp.mailfrom=microchip.com; dkim=pass (2048-bit key) header.d=microchip.com header.i=@microchip.com header.b=iKMy53Fd; arc=none smtp.client-ip=68.232.154.123
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=microchip.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=microchip.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=microchip.com header.i=@microchip.com header.b="iKMy53Fd"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=microchip.com; i=@microchip.com; q=dns/txt; s=mchp;
  t=1780656786; x=1812192786;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=eko3ejY1AKL8S/i3X/Usf5JDfNK2dEIqUhYr1ERevno=;
  b=iKMy53FdvFcVl2Z40ywJicH9wxclttGHSRs3IaZ2uacrigS3qwwEGhtb
   Zh6WY4jSDkMjYu/+c+ls1e/vgfG3HEw5QsuVaJmHFzEBI1K4VxoMNWUdK
   +rsqQGP45JEH51LQAXtLrkR9slJVxKHLH4G7g0uWy1niJGsREdQoQ5qCa
   1tQcSUnqcG9BbsNzByilk+XZYMuBt9GpEm5eKe/kNLOrgI/+rpQlEyYVi
   13J80bfrQ18078BN/ZGVz7cIN3x1P2woHElh+8oQdnP9HqwK2LbnZ76V3
   1cwtjwxdzr0HpnRCKR2zjEY0RMAWRrfOiwHcJLvNnQGLmBTAhy3lnt1/k
   Q==;
X-CSE-ConnectionGUID: /HEGIi8URK2IGcijAbVT8Q==
X-CSE-MsgGUID: X/asKt5zRO2ijWBY7kwauA==
X-IronPort-AV: E=Sophos;i="6.24,188,1774335600"; 
   d="asc'?scan'208";a="59053131"
X-Amp-Result: UNKNOWN
X-Amp-Original-Verdict: FILE UNKNOWN
Received: from unknown (HELO email.microchip.com) ([170.129.1.10])
  by esa2.microchip.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES128-GCM-SHA256; 05 Jun 2026 03:53:05 -0700
Received: from chn-vm-ex02.mchp-main.com (10.10.87.72) by
 chn-vm-ex02.mchp-main.com (10.10.87.72) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.58; Fri, 5 Jun 2026 03:53:05 -0700
Received: from wendy (10.10.85.11) by chn-vm-ex02.mchp-main.com (10.10.85.144)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.58 via Frontend
 Transport; Fri, 5 Jun 2026 03:53:03 -0700
Date: Fri, 5 Jun 2026 11:52:19 +0100
From: Conor Dooley <conor.dooley@microchip.com>
To: Jonas Rebmann <jre@pengutronix.de>
CC: <devicetree@vger.kernel.org>, <conor+dt@kernel.org>, <robh@kernel.org>,
	"kernel@pengutronix.de" <kernel@pengutronix.de>,
	<sashiko-reviews@lists.linux.dev>
Subject: Re: [PATCH v2 1/2] dt-bindings: leds: Add default-intensity property
Message-ID: <20260605-widow-griminess-7c5dd14aa308@wendy>
References: <20260605-multicolor-default-v2-1-ed07271df6b0@pengutronix.de>
 <20260605073816.E916D1F00893@smtp.kernel.org>
 <3cbee0dc-87a9-4b87-9d22-b3e378fa57c3@pengutronix.de>
 <20260605-factsheet-giving-69f8767bc5d7@wendy>
Precedence: bulk
X-Mailing-List: sashiko-reviews@lists.linux.dev
List-Id: <sashiko-reviews.lists.linux.dev>
List-Subscribe: <mailto:sashiko-reviews+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:sashiko-reviews+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="FG1YpU5IGLvFTb7z"
Content-Disposition: inline
In-Reply-To: <20260605-factsheet-giving-69f8767bc5d7@wendy>

--FG1YpU5IGLvFTb7z
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Fri, Jun 05, 2026 at 11:29:31AM +0100, Conor Dooley wrote:
> On Fri, Jun 05, 2026 at 10:45:12AM +0200, Jonas Rebmann wrote:
> > Hello,
> >=20
> > On 2026-06-05 09:38, sashiko-bot@kernel.org wrote:
> > > > @@ -73,6 +73,17 @@ properties:
> > > >         - keep
> > > >       default: off
> > > > +  default-intensity:
> > > > +    description:
> > > > +      The initial intensity of the LED color component. Used only =
during
> > > > +      initialization. Defaults to 0. As the intensity of each sub-=
LED is
>=20
> I'd drop sentence two here, it just duplicates sentence one.

Also drop "Defaults to 0." since that duplicates the default: 0.

> > > > +      multiplied with the overall brightness, without this propert=
y on a
> > > > +      sub-LED, the leds-pwm-multicolor-LED is effectively initiali=
zed at
> > > > +      minimum brightness regardless of its linux,default-trigger a=
nd
> > > > +      default-brightness properties.
> > >=20
> > > [Severity: Low]
> > > This isn't a bug, but the description for default-intensity explicitly
> > > mentions the specific driver name leds-pwm-multicolor-LED.
> > >=20
> > > Since common.yaml is intended to be a hardware-agnostic specification
> > > for all LED bindings, could this wording be updated to refer generica=
lly
> > > to the multicolor LED or simply the LED to avoid leaking an
> > > implementation detail into the generic schema?
> >=20
> > I'll be leaving this as-is until human feedback.
> >=20
> > I think documenting the property in common.yaml is correct because the
> > default-intensity itself is applicable to other multicolor-LED drivers,
>=20
> I think this is fine.
>=20
> > I just only implemented it for pwm-multicolor because that's what I use.
> > But we could just as well move it to leds-pwm-multicolor.yaml for as
> > long as that's the only driver supporting it.
>=20
> But this is probably also fine and it can be moved if other users crop
> up.
>=20
> > I intentionally included the "pwm" in that sentence because the
> > described issue that default-intensity is effectively required when
> > using linux,default-trigger may be pwm-multicolor specific.
>=20
> I don't think this is fine. However, it is almost certainly fine if you
> just do s/the leds-pwm-multicolour-LED/it/ because you're no longer
> tying the description to the name of one driver.
>=20
> >=20
> > I would not like to omit the sentence either because this situation is
> > the reason why one might actually need (not just want)
> > default-intensity (for -pwm-).
> >=20
> > Regards,
> > Jonas
> >=20
> > --=20
> > Pengutronix e.K.                           | Jonas Rebmann             =
  |
> > Steuerwalder Str. 21                       | http://www.pengutronix.de/=
  |
> > 31137 Hildesheim, Germany                  | Phone: +49-5121-206917-0  =
  |
> > Amtsgericht Hildesheim, HRA 2686           | Fax:   +49-5121-206917-9  =
  |



--FG1YpU5IGLvFTb7z
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEABYIAB0WIQRh246EGq/8RLhDjO14tDGHoIJi0gUCaiKqYwAKCRB4tDGHoIJi
0vsfAQD2B/woMBteEYBiU98oBWwXt5vsU+GiwOOpiWiZTszvRwEAiB3uNnGhqzDK
tAIrzUODvmUPoCrTVrs+y+V7IiZZrgM=
=VEdq
-----END PGP SIGNATURE-----

--FG1YpU5IGLvFTb7z--
