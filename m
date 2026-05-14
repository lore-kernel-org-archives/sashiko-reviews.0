Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2F3EB3451C1;
	Thu, 14 May 2026 18:22:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778782960; cv=none; b=Q8mVIwjkvaXcWaToYxKudXdzWirx9PyKg7vO6kritr+gGQy8n2IFDL0qVZsfxMLoQ83RQIQXTuc7fFZc04fgZQlLGP0SjB5YkO7rltfecyCAj/Lyp20+2GBu0Smif5vunAZdAt12hZCPqkBJofBhkNG8tssoFHkE0nCrJOc2MxI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778782960; c=relaxed/simple;
	bh=tcNcx48a+go1+PIXbPVx+bqSAKU5IIdX2EligEhqik8=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=jCCNTxl9QAhv9cnlmVfxdhMyYEMKfxia29WBV6iBpEUpoAXyAwt6L1Z5WGoREnTq8oNBHlXyJV53zy+4rC7q5MlvmmM2U7Pvt/xdlPiEGIcfZETipEEawfXtuNSjUlME9kgVOl0+8IF+SQW07K5vl4vW/yWV4zMlCxrPKtOb0V0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=a3YNDsyz; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="a3YNDsyz"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 7D81DC2BCB3;
	Thu, 14 May 2026 18:22:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1778782959;
	bh=tcNcx48a+go1+PIXbPVx+bqSAKU5IIdX2EligEhqik8=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=a3YNDsyzai9dvNt6VZBDL6ERsW+oYVA2SykU/Obr7s07OgADYxAhobMPBDxXiK9Kn
	 iaHArLA19pu2f3di2hQZqXd2e1RWdCXA3QcZ88NW3ZbVhhEHl/fC7sMj7o2BlN6BmJ
	 TMUxOs1RcqEspBfQe+k0J8arhd1Z9I1ROQ44uXxqNNizC66LkvfDPGRYbKchEhnE0Z
	 BGaYw+akOZZ7t4xNb+cHVMaLCA51K3B6ERnIckfj6ZXwvh7gg4L9l5MrwvZBe0b81k
	 8SOjRmi5nHbWQGGW8K4rB3hYpz2KGFY8Pb3Pkfbppk6mzcIlgv6lQMWTIBA9raABrj
	 6bKc7sa1QPwCg==
Date: Thu, 14 May 2026 19:22:36 +0100
From: Conor Dooley <conor@kernel.org>
To: Caleb James DeLisle <cjd@cjdns.fr>
Cc: sashiko-reviews@lists.linux.dev, devicetree@vger.kernel.org,
	conor+dt@kernel.org, krzk+dt@kernel.org, robh@kernel.org
Subject: Re: [PATCH v2 1/5] dt-bindings: timer: econet: Update EN751627 for
 multi-IRQ
Message-ID: <20260514-abiding-entertain-cd2aab06bef5@spud>
References: <20260514000601.3430262-2-cjd@cjdns.fr>
 <20260514114243.126F4C2BCB3@smtp.kernel.org>
 <23568f49-4b58-4acd-85fa-7eba5e99b46c@cjdns.fr>
Precedence: bulk
X-Mailing-List: sashiko-reviews@lists.linux.dev
List-Id: <sashiko-reviews.lists.linux.dev>
List-Subscribe: <mailto:sashiko-reviews+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:sashiko-reviews+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="U3nnOgtn/eu2wwWq"
Content-Disposition: inline
In-Reply-To: <23568f49-4b58-4acd-85fa-7eba5e99b46c@cjdns.fr>


--U3nnOgtn/eu2wwWq
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Thu, May 14, 2026 at 05:22:05PM +0200, Caleb James DeLisle wrote:
> > > @@ -52,21 +52,31 @@ allOf:
> > >             items:
> > >               - description: VPE timers 0 and 1
> > >               - description: VPE timers 2 and 3
> > > +        interrupts:
> > > +          description: An interrupt for each timer (one per VPE)
> > > +          minItems: 4
> > Could this include an items list detailing the specific purpose of each
> > of the four interrupts? Defining an items array for each interrupt (suc=
h as
> > Timer for VPE 0, VPE 1, etc.) would help ensure clarity for driver deve=
lopers
> > and enforce a consistent definition order.
> IMO should be self-evident.

Ye, I think this is okay. Perhaps you could make it an items list if you
want though.

> >=20
> > [ ... ]
> > >   examples:
> > >     - |
> > > +    #include <dt-bindings/interrupt-controller/mips-gic.h>
> > >       timer@1fbf0400 {
> > >           compatible =3D "econet,en751627-timer", "econet,en751221-ti=
mer";
> > Is it safe to retain econet,en751221-timer as a fallback compatible str=
ing?
> >=20
> > Device Tree fallback strings declare that an older OS can safely operat=
e the
> > hardware using the fallback driver. Since econet,en751627-timer uses fo=
ur
> > individual shared IRQs while econet,en751221-timer strictly uses a sing=
le
> > percpu IRQ, they appear to have fundamentally incompatible interrupt
> > topologies.
> >=20
> > If an older kernel boots using the fallback, the legacy
> > timer-econet-en751221 driver will attempt to map the first shared IRQ a=
s a
> > percpu IRQ via request_percpu_irq(). This will fail with -EINVAL, causi=
ng
> > the timer driver to fail to initialize and potentially leading to a boot
> > failure or system hang.
> >=20
> > Should econet,en751627-timer be defined as a standalone compatible stri=
ng
> > without the econet,en751221-timer fallback?
> I find this argument compelling so I'll switch.

And ye, this is a good point that it made.

> >=20
> > >           reg =3D <0x1fbf0400 0x100>, <0x1fbe0000 0x100>;
> > >           interrupt-parent =3D <&intc>;
> > > -        interrupts =3D <30>;
> > > +        interrupts =3D <GIC_SHARED 30 IRQ_TYPE_LEVEL_HIGH>,
> > > +                     <GIC_SHARED 29 IRQ_TYPE_LEVEL_HIGH>,
> > > +                     <GIC_SHARED 37 IRQ_TYPE_LEVEL_HIGH>,
> > > +                     <GIC_SHARED 36 IRQ_TYPE_LEVEL_HIGH>;
> > >           clocks =3D <&hpt_clock>;
> > >       };

--U3nnOgtn/eu2wwWq
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEABYKAB0WIQRh246EGq/8RLhDjO14tDGHoIJi0gUCagYS7AAKCRB4tDGHoIJi
0tmOAQC/dD5AgiYmPrze2oXBe2h36kSTdYvxZrJXj8IcC3moKAD7BfI60QSdELli
+gBfkkaGm+igCABXL8s8C8+kOQoTnwQ=
=ZGnf
-----END PGP SIGNATURE-----

--U3nnOgtn/eu2wwWq--
