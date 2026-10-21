Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792601486;
	b=N9XZOZqfDQ/x9QqgyESmWhL2nflGmtmBvr78jVwzSA0vmrfNPcTJ0Ir+TTRUzNFxHdav
	 fycA4PCqGg/Ja9SQrJXQ3LuCkVKlfI0xTnKRlcvfjbDipHzJWLlfv0+P0JbytKLxI4/bI
	 YybbmD7cQKwNHASdiiTiypUo2Y8K1yCvzTJ68ROH0GTL1M/bU6ok0odPoC97S2vgc0xWa
	 jDEAbwSYtpElqqHaI2DKxzjYE5W0GcjkgmPKWVftL/ci7juGlGC0aYULhUaefZ6bey1mn
	 wRIrwP0cgiXII38HirrhqS5psJEsxbH1fMrEZkY+T634FBNHcbF0sgEaYg/1n1fxzqQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792601486;
	h=Received:DKIM-Signature:Date:From:To:Cc:Subject:Message-ID:
	 References:MIME-Version:Content-Type:Content-Disposition:In-Reply-To;
	bh=hbdnG3aoWSjBlncyLDUr+YRS4FjLyxq83LeGwvz/hKs=;
	b=SZgQKnEOBZU8c3NwmBcJAKvxhRE0ujQ0Evkhal8a+1T/rPq/hXyFOQVJf7qwzuqz1EWr
	 y/46v/zz/2y5MnhWTOC08uDkAMR4tOkgkcftGOsHfbefYkxoUXgrvMfo3RJMQKP3Vo5xm
	 ybUo4va4GH1o+GwkqhBJfMHw0E1QeD1x76db9lZVYy1jnJhC62gFZ07jWTTcK/zyuARPj
	 6qick1F7fh6QSON6QkhoY2u+R8xluCfVDX8yF+lwnmPjS5vRaVIg+DxKM2VU5kR5Qo96F
	 8kvFpjNRo1VbaUqb0eUuj0jwsLBsaax3tMczPBJm5Oxc/ff+kPt438POqOSzsfqq5FA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=YjXyREZc;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D5794606A31B;
	Wed, 21 Oct 2026 16:51:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=YjXyREZc
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 3E5381F000C1;
	Wed, 21 Oct 2026 16:51:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1792601485;
	bh=hbdnG3aoWSjBlncyLDUr+YRS4FjLyxq83LeGwvz/hKs=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=YjXyREZcH8yb45lqeO/8RH9JKij2ZqO7EHrVipYnPOmBwYcw1pJy+Hz1HbSBmnptP
	 Omw1hBypC9C3EQu7lVhxxJ4gaIoRCKJGAmc43bpG3S7xv/omZQFcIQKbwZkrt+rsR9
	 mJeDlyM4J+8FVBoBoU4AxR1+pX4xOffZSaXt2YvwGNI8AR3C6EQbFVABCFgxeSQRtr
	 ETg3g/WRdI4zIVPAimBBU27S3DxO7J8Uw49ovHhwSQp4qJd1tY5tHeY3s/iwoAb8Yn
	 P5Yn7qovs6KbGaCmtO7LAanMnUu3H4i9/Ut3LlE+/Z2RTOhvPOt59YTjM/z30O+i9i
	 D/x/VjI4hD2Fg==
Date: Wed, 21 Oct 2026 17:51:22 +0100
From: Conor Dooley <conor@kernel.org>
To: Xincheng Ji <jixincheng@ultrarisc.com>
Cc: sashiko-reviews@lists.linux.dev, devicetree@vger.kernel.org,
	robh@kernel.org, conor+dt@kernel.org
Subject: Re: [PATCH v4 7/7] riscv: dts: ultrarisc: Add Milk-V Titan board
 device tree
Message-ID: <20261021-badly-issuing-847ac366c9b9@spud>
References: <20261019-ultrarisc-dts-v4-0-3979747cda2e@ultrarisc.com>
 <20261019-ultrarisc-dts-v4-7-3979747cda2e@ultrarisc.com>
 <sashiko-outbox-176776@kernel.org>
 <179246063943.3442927.10941907832509473109.b4-reply@b4>
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
	protocol="application/pgp-signature"; boundary="6HsWZr+ABwcYqoMX"
Content-Disposition: inline
In-Reply-To: <179246063943.3442927.10941907832509473109.b4-reply@b4>

--6HsWZr+ABwcYqoMX
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Tue, Oct 20, 2026 at 09:43:59AM +0800, Xincheng Ji wrote:
> Hi,
>=20
> On 2026-10-19 08:08 +0000, sashiko-bot@kernel.org wrote:
> > Should the label properties be dropped from led@1 and led@2 here?
> >=20
> > When the PHY driver probes phy0, the call chain:
> >=20
> >   of_phy_leds() ->
> >     of_phy_led() ->
> >       devm_led_classdev_register_ext() ->
> >         led_classdev_register_ext() ->
> >           led_compose_name() ->
> >             led_parse_fwnode_props()
> >=20
> > checks for the deprecated label property first in
> > drivers/leds/led-core.c:led_parse_fwnode_props():
> >=20
> > 	if (fwnode_property_present(fwnode, "label")) {
> > 		ret =3D fwnode_property_read_string(fwnode, "label", &props->label);
> > 		if (ret)
> > 			dev_err(dev, "Error parsing 'label' property (%d)\n", ret);
> > 		return;
> > 	}
> >=20
> > Because led_parse_fwnode_props() returns early when label is present, t=
he
> > color and function properties on led@1 and led@2 are never parsed and a=
re
> > completely ignored at runtime.
> >=20
> > In addition, Documentation/devicetree/bindings/leds/common.yaml depreca=
tes
> > label for new bindings in favor of color and function.
> >=20
> > Would it make sense to remove label from both nodes so that the LED core
> > uses color and function to compose the standard LED names?
> >=20
> Thank you for the review. I understand that label is deprecated in favor
> of color and function.Since the LED core still supports parsing label,=20
> would you consider removing these properties necessary for this patch,
> or more of a naming convention cleanup?

You're asking a bot that will never reply to you.

I'd say that if the analysis provided is correct, then yes you should
since the deprecated property overrides the replacement properties.

--6HsWZr+ABwcYqoMX
Content-Type: application/pgp-signature; name=signature.asc

-----BEGIN PGP SIGNATURE-----

iHUEABYKAB0WIQRh246EGq/8RLhDjO14tDGHoIJi0gUCatjtigAKCRB4tDGHoIJi
0qdHAQDJg7mVMZXbo3JBiVLR3Y/nJfObiBpvzM2Aksowbu4v5wD+Kki94ll+8U+k
TLLC37znTzsBVhizgYQFByMjNA36Gg8=
=dTSb
-----END PGP SIGNATURE-----

--6HsWZr+ABwcYqoMX--
