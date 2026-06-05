Received: from esa.microchip.iphmx.com (esa.microchip.iphmx.com [68.232.153.233])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 059DB3FA5C4
	for <sashiko-reviews@lists.linux.dev>; Fri,  5 Jun 2026 10:30:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=68.232.153.233
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1780655425; cv=none; b=rbeC1rFRNly7dDjUIySU1TDwpaLIa9XH5QkP+rrWBIHOW3ULXOMl85oUwO/ZqKwd2PwRZ4eixEnYGvlQxYXM9BxiMuJHMRFvM0OcYIbn4KH+bZMdoharMLeIIHHy4vDFF+Fj805GEKHqiNhWXRENrqM7tL1/8oo3+WKAOmM21BA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1780655425; c=relaxed/simple;
	bh=JCn5atXy7+hqmWtx95xYBqS+yLokJfA+OcgvkCj21+g=;
	h=Date:From:To:CC:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=SMa7/t9Ap/BmT+NyYBbmmZqyFz3MWojlXTF+6sWcBLqc3H/BN57WfIMtnh9yvzLsiRZvK2bPPZLvHAYHJ12ZAtTyyVS5NwutV+kPe5M4K1oXHlE0ftvYSsqxXU/IktjILk1yOLa+osChBlCpoew6EL2LghM2j90PnmLsGkNdu+E=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=microchip.com; spf=pass smtp.mailfrom=microchip.com; dkim=pass (2048-bit key) header.d=microchip.com header.i=@microchip.com header.b=dIiRNt5U; arc=none smtp.client-ip=68.232.153.233
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=microchip.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=microchip.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=microchip.com header.i=@microchip.com header.b="dIiRNt5U"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=microchip.com; i=@microchip.com; q=dns/txt; s=mchp;
  t=1780655425; x=1812191425;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=JCn5atXy7+hqmWtx95xYBqS+yLokJfA+OcgvkCj21+g=;
  b=dIiRNt5Ub6OoNVuP/UjAdEXMHIu8cWnu7j4YmM7eiFEKouiRLW1x0sbG
   ZpzIIJNkioDTWi4VI1F3g4mbBMUTJQy0Ta8hQb7CBemc1ua4jcKCdwn0n
   LlOSj2zCT8/PcWxlhMoH9Q7FVPh6GwjVtXItD5tGV9RtGJfO4RbilPCHj
   6u/+vx1PpTiIg64RIujMUJLQua8doHk6WdgyeuG14aOBqOGvTE069Tbga
   TZqK/Ve5iN2TlnPTHNz6fAcbdA1R5L7f7auKMa81wF2nqkIfr8k6Elqqt
   2QFsEz8yX+v/ZIshww1A4ZNUm6OKRPA4D7UUq78ffNbkcKz0JQEzjXqQf
   g==;
X-CSE-ConnectionGUID: uJwvOoOWSnSZB8tKZGw+jg==
X-CSE-MsgGUID: LJk6C14tRK6j2j0P7occ5g==
X-IronPort-AV: E=Sophos;i="6.24,188,1774335600"; 
   d="asc'?scan'208";a="58647235"
X-Amp-Result: UNKNOWN
X-Amp-Original-Verdict: FILE UNKNOWN
Received: from unknown (HELO email.microchip.com) ([170.129.1.10])
  by esa3.microchip.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 05 Jun 2026 03:30:18 -0700
Received: from chn-vm-ex01.mchp-main.com (10.10.87.71) by
 chn-vm-ex3.mchp-main.com (10.10.87.32) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.2.2562.41; Fri, 5 Jun 2026 03:30:16 -0700
Received: from wendy (10.10.85.11) by chn-vm-ex01.mchp-main.com (10.10.85.143)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.58 via Frontend
 Transport; Fri, 5 Jun 2026 03:30:15 -0700
Date: Fri, 5 Jun 2026 11:29:31 +0100
From: Conor Dooley <conor.dooley@microchip.com>
To: Jonas Rebmann <jre@pengutronix.de>
CC: <devicetree@vger.kernel.org>, <conor+dt@kernel.org>, <robh@kernel.org>,
	"kernel@pengutronix.de" <kernel@pengutronix.de>,
	<sashiko-reviews@lists.linux.dev>
Subject: Re: [PATCH v2 1/2] dt-bindings: leds: Add default-intensity property
Message-ID: <20260605-factsheet-giving-69f8767bc5d7@wendy>
References: <20260605-multicolor-default-v2-1-ed07271df6b0@pengutronix.de>
 <20260605073816.E916D1F00893@smtp.kernel.org>
 <3cbee0dc-87a9-4b87-9d22-b3e378fa57c3@pengutronix.de>
Precedence: bulk
X-Mailing-List: sashiko-reviews@lists.linux.dev
List-Id: <sashiko-reviews.lists.linux.dev>
List-Subscribe: <mailto:sashiko-reviews+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:sashiko-reviews+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="nBlbV6IctgwcPDct"
Content-Disposition: inline
In-Reply-To: <3cbee0dc-87a9-4b87-9d22-b3e378fa57c3@pengutronix.de>

--nBlbV6IctgwcPDct
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Fri, Jun 05, 2026 at 10:45:12AM +0200, Jonas Rebmann wrote:
> Hello,
>=20
> On 2026-06-05 09:38, sashiko-bot@kernel.org wrote:
> > > @@ -73,6 +73,17 @@ properties:
> > >         - keep
> > >       default: off
> > > +  default-intensity:
> > > +    description:
> > > +      The initial intensity of the LED color component. Used only du=
ring
> > > +      initialization. Defaults to 0. As the intensity of each sub-LE=
D is

I'd drop sentence two here, it just duplicates sentence one.

> > > +      multiplied with the overall brightness, without this property =
on a
> > > +      sub-LED, the leds-pwm-multicolor-LED is effectively initialize=
d at
> > > +      minimum brightness regardless of its linux,default-trigger and
> > > +      default-brightness properties.
> >=20
> > [Severity: Low]
> > This isn't a bug, but the description for default-intensity explicitly
> > mentions the specific driver name leds-pwm-multicolor-LED.
> >=20
> > Since common.yaml is intended to be a hardware-agnostic specification
> > for all LED bindings, could this wording be updated to refer generically
> > to the multicolor LED or simply the LED to avoid leaking an
> > implementation detail into the generic schema?
>=20
> I'll be leaving this as-is until human feedback.
>=20
> I think documenting the property in common.yaml is correct because the
> default-intensity itself is applicable to other multicolor-LED drivers,

I think this is fine.

> I just only implemented it for pwm-multicolor because that's what I use.
> But we could just as well move it to leds-pwm-multicolor.yaml for as
> long as that's the only driver supporting it.

But this is probably also fine and it can be moved if other users crop
up.

> I intentionally included the "pwm" in that sentence because the
> described issue that default-intensity is effectively required when
> using linux,default-trigger may be pwm-multicolor specific.

I don't think this is fine. However, it is almost certainly fine if you
just do s/the leds-pwm-multicolour-LED/it/ because you're no longer
tying the description to the name of one driver.

>=20
> I would not like to omit the sentence either because this situation is
> the reason why one might actually need (not just want)
> default-intensity (for -pwm-).
>=20
> Regards,
> Jonas
>=20
> --=20
> Pengutronix e.K.                           | Jonas Rebmann               |
> Steuerwalder Str. 21                       | http://www.pengutronix.de/  |
> 31137 Hildesheim, Germany                  | Phone: +49-5121-206917-0    |
> Amtsgericht Hildesheim, HRA 2686           | Fax:   +49-5121-206917-9    |

--nBlbV6IctgwcPDct
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEABYIAB0WIQRh246EGq/8RLhDjO14tDGHoIJi0gUCaiKlCwAKCRB4tDGHoIJi
0jC0AQCEHoWLe+5TFNAzSgkGHZhdk8s9J0oaQGSzUePaWqfVggD/erMf7u/13mUV
Eg5QTIjIrpEsYtxbkziBkXisFFcsMQs=
=HsAO
-----END PGP SIGNATURE-----

--nBlbV6IctgwcPDct--
