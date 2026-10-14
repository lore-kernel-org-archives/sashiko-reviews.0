Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 587DF4EA383;
	Wed, 14 Oct 2026 16:53:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791996807; cv=none; b=B7HigqE4iqOufm2sLRJUg9+bcCrV3rm9A6EGFj5ML0y7uPXD1lXcE4WcoS5EXMi+kbDHig3dH0KN/yg1w/wSoSV9UsbyPk4moohT5WwI11XKIfaHRa3lpHB5tZt/NHrAHABdBHMjwbVNEdnpQc+Ybgd4Sb3hdwYj25D3nq0bpJg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791996807; c=relaxed/simple;
	bh=bHJeLYx/zP/c/hH+sDKQXmv5bqOLbYLXobUA35d7ELw=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=EZG39NmQwJMT282eOd09YbzdjdHqXKN1TDXbJwQIvhTQ9g7aXRP5jx6erlgq8IhSUHrysCSuHDiVUJ3yfcR4VaT0hH14iBROsnXNYqcStPdkWCvmO4gevcp6u/qRzHdohd+77DP5X0D2ffve7RYu0p82+y9gnRmPV05I1fuwrlE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=i+t3i3AT; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="i+t3i3AT"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 1C4D71F000C5;
	Wed, 14 Oct 2026 16:53:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1791996805;
	bh=RgiPoJhjkF0RmveNsripgkC14dDEJ3YX+2FMsj+N8HQ=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=i+t3i3AT/4QnWCOKbMf5y7oPQj8BEzoyJE7+UnLC7VmOsgbzmkfzoq7q2nxSXrifo
	 JQjJ3ro3hII/Cs9JEY53ltLiWpHR6WPWbSqT2NdLTryQV9eu/rL3uWb0MWxjfP4gzl
	 JdjfjcqCnLl4no7A0PmdZVcNrOrrkqUeuKnB2hX6B3T1UcVHAdOA/WxrmUqjCTFcyp
	 Q4YtgthodO/Ts5GO1QBvoV8P+ycF2p7vpcQJ5e6igINuvX3+y2AYby1VWSwUIldgYp
	 weZ1GOHGIka8QeQqglSKm7JYS2wAZoh4Yr6YFa1BfsPyChJ98nuLwcWGAcB2i5Y51K
	 70cF90VJliM3A==
Date: Wed, 14 Oct 2026 17:53:22 +0100
From: Conor Dooley <conor@kernel.org>
To: sashiko-reviews@lists.linux.dev
Cc: Xincheng Ji <jixincheng@ultrarisc.com>, devicetree@vger.kernel.org,
	robh@kernel.org, conor+dt@kernel.org
Subject: Re: [PATCH v3 5/7] riscv: dts: ultrarisc: Add initial device tree
 for UltraRISC DP1000
Message-ID: <20261014-ramp-dioxide-63e1d5e0499f@spud>
References: <20261013-ultrarisc-dts-v3-0-5ff3ebb2a90d@ultrarisc.com>
 <20261013-ultrarisc-dts-v3-5-5ff3ebb2a90d@ultrarisc.com>
 <sashiko-outbox-169523@kernel.org>
Precedence: bulk
X-Mailing-List: sashiko-reviews@lists.linux.dev
List-Id: <sashiko-reviews.lists.linux.dev>
List-Subscribe: <mailto:sashiko-reviews+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:sashiko-reviews+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="ARWNT9dftyec56pO"
Content-Disposition: inline
In-Reply-To: <sashiko-outbox-169523@kernel.org>

--ARWNT9dftyec56pO
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Tue, Oct 13, 2026 at 10:36:18AM +0000, sashiko-bot@kernel.org wrote:
> Thank you for your contribution! Sashiko AI review found 1 potential issu=
e(s) to consider:
> - [Medium] dts: L2 cache nodes are incorrectly nested as children of cpu =
nodes
> --
>=20
> commit 72d6d58d85f9aab9e46d9c7167175451c2551346
> Author: Jia Wang <wangjia@ultrarisc.com>
>=20
> riscv: dts: ultrarisc: Add initial device tree for UltraRISC DP1000
>=20
> Add the base device tree for the UltraRISC DP1000 SoC. It describes
> eight CP100 CPU cores, their cache topology, and essential peripherals.
>=20
> > diff --git a/arch/riscv/boot/dts/ultrarisc/dp1000.dtsi b/arch/riscv/boo=
t/dts/ultrarisc/dp1000.dtsi
> > new file mode 100644
> > index 0000000000000..86d7f5533aa84
> > --- /dev/null
> > +++ b/arch/riscv/boot/dts/ultrarisc/dp1000.dtsi
> > @@ -0,0 +1,899 @@
> [ ... ]
> > +	cpus {
> > +		#address-cells =3D <1>;
> > +		#size-cells =3D <0>;
> > +		timebase-frequency =3D <10000000>;
> > +
> > +		cpu0: cpu@0 {
> > +			compatible =3D "ultrarisc,cp100", "riscv";
> [ ... ]
> > +			cpu0_intc: interrupt-controller {
> > +				compatible =3D "riscv,cpu-intc";
> > +				interrupt-controller;
> > +				#interrupt-cells =3D <1>;
> > +			};
> > +
> > +			l2_cache0: l2-cache {
>=20
> [Severity: Medium]
> Does this incorrectly nest the L2 cache nodes as children of the cpu node=
s?
>=20
> Standard Devicetree topologies for CPU schemas require cache nodes to be
> defined as siblings under the /cpus node or globally, rather than as dire=
ct
> children of the cpu nodes. Instantiating l2-cache here can cause
> dt_binding_check validation failures and break generic kernel cache topol=
ogy
> parsers that expect the cache nodes at the root of /cpus and referenced v=
ia
> the next-level-cache phandle.
>=20
> Should these cache nodes be moved outside of the cpu@0 node?

This seems like a fairly reasonable comment from Sashiko. Does keeping it
here lead to hwloc incorrectly displaying your topology?

>=20
> > +				/*
> > +				 * L2 cache:
> > +				 * cache-unified, block-size 64B
> > +				 * 8-way set associative, size 512KB
> > +				 * per-core.
> > +				 */
> > +				compatible =3D "cache";
> > +				cache-block-size =3D <64>;
> > +				cache-level =3D <2>;
> > +				cache-size =3D <0x80000>;
> > +				cache-sets =3D <1024>;
> > +				cache-unified;
> > +				next-level-cache =3D <&cluster0_l3>;
> > +			};
> > +		};

--ARWNT9dftyec56pO
Content-Type: application/pgp-signature; name=signature.asc

-----BEGIN PGP SIGNATURE-----

iHUEABYKAB0WIQRh246EGq/8RLhDjO14tDGHoIJi0gUCas+zgQAKCRB4tDGHoIJi
0q2ZAQC66NsAT20rg0QZ+CbMX+ObxCT7viyzqovdLz6l06THpAEA0nkPt2N1F774
QJUKHfgPbuMnSw4GMKBzhLR0pkZnGg8=
=Jcsi
-----END PGP SIGNATURE-----

--ARWNT9dftyec56pO--
