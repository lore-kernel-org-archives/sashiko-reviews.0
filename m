Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D155E3DB33F;
	Tue, 19 May 2026 17:26:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779211569; cv=none; b=ZxqqiGJU37xvf2z4RfKUw/VlD3iJ98wUydIMd0B9t09dtag42qIV1Rt/BXy9k4Ls+xX4LGPUaKKZPt0fl2+yTy7Czk1ys8yWKZMX4IKpY0sDv5GewdUgT7LKaNHSdqWPf3WvbvQj/NV9T5ddhEMKPHwPAT/R0fy9xAfuuWQHUj8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779211569; c=relaxed/simple;
	bh=k9V9aEj9I4iIKt9YCrh/pDpp2HCWai+5Um9teb/wV/E=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=ibi1sZbZ0s5CNzwrBFn6zVHt/oM6k5+jVpH5vYIUS2gEdx/54VznqvEQIV5UWkPBreLBosMOcWanc3mha/K1Tq1A8BeHo6vMflAhcP0cJZNHAl5FKqRwmzFIprCBIeLmr452cOVU0TxBI26IixvUoRBy/mK2f3bK4iBu4bbJvrw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=K0b6gQRB; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="K0b6gQRB"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 4D5C0C2BCB3;
	Tue, 19 May 2026 17:26:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1779211569;
	bh=k9V9aEj9I4iIKt9YCrh/pDpp2HCWai+5Um9teb/wV/E=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=K0b6gQRBgoBozUa7N8AoQvUPSUiMrj3ZJE1nWJ2rQ9FBzUbjRuzNE7t0lP92VlfhF
	 0CAo0hqfQIV/5nSg+cIp8LiMelNeKMsOsIyfNAJRczx+tA3a6G2kru0ZVCCMqlro6i
	 r8AizY+3woOLIyNOTZAKAK28cB6E/CL/DtHuF46L/7U/tXphb7b6py94PhU8lYua+q
	 SK52vxAGew+3Gf83tI4Zv3CWkypeTQaOBlNIlX7iLs5UZChofn+SFjcIpYqF2wS+O1
	 8LNTTgm5gzjKoD6QduAGq7dbmNvjnQrV8ie0ghGS3c2QgOLd4gkNaCLY8vQ76VJ66X
	 XWiIjFyNcW1/w==
Date: Tue, 19 May 2026 18:26:06 +0100
From: Conor Dooley <conor@kernel.org>
To: sashiko-reviews@lists.linux.dev
Cc: Radu Sabau via B4 Relay <devnull+radu.sabau.analog.com@kernel.org>,
	conor+dt@kernel.org, devicetree@vger.kernel.org, robh@kernel.org
Subject: Re: [PATCH v12 1/6] dt-bindings: iio: adc: add AD4691 family
Message-ID: <20260519-bamboo-gleeful-669dcbefb0a3@spud>
References: <20260519-ad4692-multichannel-sar-adc-driver-v12-1-5b335162aa51@analog.com>
 <20260519122832.780DCC2BCB3@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: sashiko-reviews@lists.linux.dev
List-Id: <sashiko-reviews.lists.linux.dev>
List-Subscribe: <mailto:sashiko-reviews+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:sashiko-reviews+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="VWDlIjX9uxY/8+Wf"
Content-Disposition: inline
In-Reply-To: <20260519122832.780DCC2BCB3@smtp.kernel.org>


--VWDlIjX9uxY/8+Wf
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Tue, May 19, 2026 at 12:28:32PM +0000, sashiko-bot@kernel.org wrote:
> Thank you for your contribution! Sashiko AI review found 1 potential issu=
e(s) to consider:
> - [Medium] The binding defines GPIO controller capabilities but omits `gp=
io-controller` and `#gpio-cells` from the `required` list.
> --
>=20
> commit 96f168db5f8432c094e1917f0e5c69f84e070941
> Author: Radu Sabau <radu.sabau@analog.com>
>=20
> dt-bindings: iio: adc: add AD4691 family
>=20
> This commit adds device tree bindings for the Analog Devices AD4691 family
> of multichannel SAR ADCs. It describes the hardware connections including
> power domains, optional PWM for CNV Burst Mode, reset GPIO, and GP pins
> usable as interrupts or GPIOs.
>=20
> > diff --git a/Documentation/devicetree/bindings/iio/adc/adi,ad4691.yaml =
b/Documentation/devicetree/bindings/iio/adc/adi,ad4691.yaml
> > new file mode 100644
> > index 0000000000000..af28a0c1cfa9e
> > --- /dev/null
> > +++ b/Documentation/devicetree/bindings/iio/adc/adi,ad4691.yaml
> [ ... ]
> > +  gpio-controller: true
> > +
> > +  '#gpio-cells':
> > +    const: 2
> > +
> > +  '#trigger-source-cells':
> > +    description:
> > +      This node can act as a trigger source. The single cell in a cons=
umer
> > +      reference specifies the GP pin number (0-3) used as the trigger =
output.
> > +    const: 1
> > +
> > +required:
> > +  - compatible
> > +  - reg
> > +  - avdd-supply
> > +  - vio-supply
>=20
> Should gpio-controller and #gpio-cells be added to the required list here?
>=20
> When a hardware variant provides GPIO controller capabilities, these
> properties generally need to appear in the required list.

More deja vu. This is incorrect advice, reading the binding or commit
message explains it, and is being regurgitated on multiple versions.

Fix this please.

--VWDlIjX9uxY/8+Wf
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEABYKAB0WIQRh246EGq/8RLhDjO14tDGHoIJi0gUCagydLgAKCRB4tDGHoIJi
0ikJAQCaR28A4r8NUeu9zteWVUi1GOw0qpnphMlBdCn6QS3ziQD8DHMbtdgiGg3q
UU5yxFwZ/oGc4xidyrjo2bXVcEjXlAs=
=1fx4
-----END PGP SIGNATURE-----

--VWDlIjX9uxY/8+Wf--
