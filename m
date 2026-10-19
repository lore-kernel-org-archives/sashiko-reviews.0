Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792434115;
	b=D8FqgXraTdFRv55TujKjnTfzUHGy92NaSgooh+ZQkoxCa22VQi5S9qC9zrBHEMQ/mzDb
	 PMqYTMbGuPu9BkO8toTiB4PdKtLdATMjhHzGYwMdgHdPZyAaHyFrVMB7jxCs/unStNIkL
	 cb9yKZ/hufWqz2wtwA6cy1kIZOGILElGz3PjsZWMEqTN3XHMjPOIbxQkNGCEHWOZVEQ3F
	 L2BmxWeSw+Ez8Y/U3iNLeuXuYkBhcZPpeM5wHrYPK3GSBXilphBSFhbNvHkOt80NUeRpY
	 KQwARH2qtoMHlMQZ/VY7RCKPo+aMK8tPIxHHwi/fliDNhQqRr22YRgrMmDSOwJAywmw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792434115;
	h=Received:DKIM-Signature:Date:From:To:Cc:Subject:Message-ID:
	 References:MIME-Version:Content-Type:Content-Disposition:In-Reply-To;
	bh=uvOL1B9+LtCcbiXQ4KdFPDLg6OoeMbmSgIVT59fRDdY=;
	b=wud9Qjhch3mCVBSB7m3WV+7xF8oCwF9BS31E0Xi7UWltQCbVc/RsdfC7umaCsTqYMwlP
	 gt5rWyHgm23ZwPEauJYxX/BEsXq3xKE+Vcf2Ik1k7aBXnvgoRxomIz7f6uJ+lAwkovnBK
	 WEG31Iqtk1uRkEBZj7Yd+nzuvOaKpSkm7hS1K536YH0qcRfbKZekXLQ09js8o1b3skYo2
	 Z2qx3XZHeHYCLLQHdoJPYsoeyKkCObjVS82ZjAGhcJKqhlqsuUiP+AynBv0n1DjnpSBZi
	 4WGscaL0xGyX7pCkj4JH8ujjFP7RmagIKyWshc0PHyJmkOR6NtqeplWqLLDGrQGefhQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=GYeNQ2w6;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5AE5D606A31E;
	Mon, 19 Oct 2026 18:21:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=GYeNQ2w6
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 965751F000C4;
	Mon, 19 Oct 2026 18:21:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1792434113;
	bh=uvOL1B9+LtCcbiXQ4KdFPDLg6OoeMbmSgIVT59fRDdY=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=GYeNQ2w6DvQ/+O3emod3RMvPLCefiAgW9JYjiglA0coeEN8jk9nS7GojjjLs6E0FL
	 UhpoHoTIr/HGOOvLmYjOFSrpToiVmxg1l22WX9HVMoVorh68B6j9L8DFKqoLAudcel
	 3r4M10GSdUU8zpeYoDUrjm7eq6+XnzmBDhtIcnf26LkHD0DCLo4N6enALGHDxJwfz7
	 uqFGUq1cgHVssUPROcJY3ZuyPeJxD3nbJ4s9W2ZQczUjOC7vJD+tiEFPc8LNUwptAR
	 WR0SYChB0F2qah0YOOalgYAvAIwsgGQpUx6v2jiE/+4jmku5RWoRqtHjg+xfzQugBF
	 sM+zBUFeoAp4w==
Date: Mon, 19 Oct 2026 19:21:50 +0100
From: Conor Dooley <conor@kernel.org>
To: sashiko-reviews@lists.linux.dev
Cc: Lachlan Michael <lachlan.michael@sony.com>, devicetree@vger.kernel.org,
	robh@kernel.org, conor+dt@kernel.org, media-ci@linuxtv.org
Subject: Re: [PATCH v5 1/2] media: dt-bindings: imx908: Add Sony IMX908 sensor
Message-ID: <20261019-cause-decline-feb5a68f0d06@spud>
References: <20261019014720.2635-1-lachlan.michael@sony.com>
 <20261019014720.2635-2-lachlan.michael@sony.com>
 <sashiko-outbox-176511@kernel.org>
X-Mailing-List: sashiko-reviews@lists.linux.dev
List-Id: <sashiko-reviews.lists.linux.dev>
List-Post: <mailto:sashiko-reviews@lists.linux.dev>
List-Help: <mailto:sashiko-reviews+help@lists.linux.dev>
List-Subscribe: <mailto:sashiko-reviews+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:sashiko-reviews+unsubscribe@lists.linux.dev>
List-Owner: <mailto:sashiko-reviews+owner@lists.linux.dev>
Precedence: list
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="9CCrMjoYK9ZJsW8E"
Content-Disposition: inline
In-Reply-To: <sashiko-outbox-176511@kernel.org>

--9CCrMjoYK9ZJsW8E
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Mon, Oct 19, 2026 at 01:53:48AM +0000, sashiko-bot@kernel.org wrote:
> Thank you for your contribution! Sashiko AI review found 1 potential issu=
e(s) to consider:
> - [Medium] dt-bindings: media: imx908: additionalProperties: false blocks=
 allOf schema
> --
>=20
> commit ff8a8181af73cacaf3f8a03e0acde33eb53bb18b
> Author: Lachlan Michael <lachlan.michael@sony.com>
>=20
> media: dt-bindings: imx908: Add Sony IMX908 sensor
>=20
> This commit adds device tree bindings and a MAINTAINERS entry for the Sony
> IMX908 8.39 megapixel MIPI CSI-2 CMOS image sensor.
>=20
> > diff --git a/Documentation/devicetree/bindings/media/i2c/sony,imx908.ya=
ml b/Documentation/devicetree/bindings/media/i2c/sony,imx908.yaml
> > new file mode 100644
> > index 0000000000000..828db1175e2f5
> > --- /dev/null
> > +++ b/Documentation/devicetree/bindings/media/i2c/sony,imx908.yaml
> > @@ -0,0 +1,108 @@
> [ ... ]
> > +allOf:
> > +  - $ref: /schemas/media/video-interface-devices.yaml#
> > +
> > +properties:
> > +  compatible:
> > +    const: sony,imx908
> [ ... ]
> > +required:
> > +  - compatible
> > +  - reg
> > +  - clocks
> > +  - dvdd-supply
> > +  - ovdd-supply
> > +  - avdd-supply
> > +  - port
> > +
> > +additionalProperties: false
>=20
> [Severity: Medium]
> Should this be unevaluatedProperties: false instead of
> additionalProperties: false?

Only if the properties outside of what's already explicitly used in the
binding are possible.

>=20
> Because the schema references /schemas/media/video-interface-devices.yaml#
> in allOf without listing common properties such as rotation, orientation,
> lens-focus, or flash-leds under the local properties block, using
> additionalProperties: false will cause dtbs_check to reject any
> sony,imx908 node that uses those inherited properties.
>=20
> [ ... ]
>=20
> --=20
> Sashiko AI review =B7 https://sashiko.dev/#/patchset/20261019014720.2635-=
1-lachlan.michael@sony.com?part=3D1

--9CCrMjoYK9ZJsW8E
Content-Type: application/pgp-signature; name=signature.asc

-----BEGIN PGP SIGNATURE-----

iHUEABYKAB0WIQRh246EGq/8RLhDjO14tDGHoIJi0gUCatZfvgAKCRB4tDGHoIJi
0qiCAP4qFigSJ7kmNt08rOge0JhnUr0NgZ13psJilaB+vxyCQgEA7DnNdJGO2wUI
NZegYkz6WVCesokxk/JP4xcO4EZGSwU=
=w4tB
-----END PGP SIGNATURE-----

--9CCrMjoYK9ZJsW8E--
