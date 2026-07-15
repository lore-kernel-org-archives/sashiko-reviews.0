Received: from sender4-op-o11.zoho.com (sender4-op-o11.zoho.com [136.143.188.11])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9CAAA47DFB0
	for <sashiko-reviews@lists.linux.dev>; Wed, 15 Jul 2026 13:00:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=136.143.188.11
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784120403; cv=pass; b=hBxPjLLvOdVelhjqRBYzDK3Gtx2iTvYzIGPCNzv84+eMJXz2zU4NdXmxp/LE+xaLom5PDNpOq3azXm9Xx4C9F2aD4sT8pWYXPTZd4m5BX4fUQB5TI2ASCedehu5n0cQJi9KI8R81tt0sL+2mx/FFMltpsA625TjGMBvwaICEjpo=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784120403; c=relaxed/simple;
	bh=SQEqNE5wPkXDM7mVRcDJc6CUwQU/GiabL6D9qOKl4ag=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=OywfNh0IuKrCv33hia2bdzsIC90T5UWOPaXHvGeSNggy+vN7UIXfEe4pWbCmDD8mDvcfW9tyFuCCeu0qc/EuoMp9RSmYrGTpoYM1Ng0o17iIrSRUzTfD729YtvS4VqRkf/Qqxuxq7cuXbpbln/JTP+pxsQN3xsd9QLqhc0M2D7Q=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=collabora.com; spf=pass smtp.mailfrom=collabora.com; dkim=pass (1024-bit key) header.d=collabora.com header.i=sebastian.reichel@collabora.com header.b=cqRHtmDI; arc=pass smtp.client-ip=136.143.188.11
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=collabora.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=collabora.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=collabora.com header.i=sebastian.reichel@collabora.com header.b="cqRHtmDI"
ARC-Seal: i=1; a=rsa-sha256; t=1784120392; cv=none; 
	d=zohomail.com; s=zohoarc; 
	b=FM7czj7K2CkmMbBVXgS79FibJ36YLwn4Hg9YN5g7Jz7qfXL1WD3cZJKr7dG07rRPg41C+Di21/oDmrjD4olFi0h7VCaJkb6VZ2jzc2z18bhqA8e3eleLdZYb10Unp6syUUCJoOrFXH5FWPZ2XJ96XIerXInUqLCpn/JnXCf2ie0=
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=zohomail.com; s=zohoarc; 
	t=1784120392; h=Content-Type:Cc:Cc:Date:Date:From:From:In-Reply-To:MIME-Version:Message-ID:References:Subject:Subject:To:To:Message-Id:Reply-To; 
	bh=0X9a2/9rf8so0cbamy4a/Ax3kfWAme7PBrmR3FMvRE0=; 
	b=NyHCI8B6SLz+C0CvF6xmc294Op3ohG6R9roXQI/oz2BsUczccAXbgp3i7Ki1HbDH6UFNNwmfBvFzUoELAvEFsyG/z6OxcWF6C1CF2d68rH6lsfm59/RUwJTlMVGoFO4GUPxuUS5cySCt6kgWCaBDtoFlK6sQlgdIU5F96bfnrI4=
ARC-Authentication-Results: i=1; mx.zohomail.com;
	dkim=pass  header.i=collabora.com;
	spf=pass  smtp.mailfrom=sebastian.reichel@collabora.com;
	dmarc=pass header.from=<sebastian.reichel@collabora.com>
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; t=1784120392;
	s=zohomail; d=collabora.com; i=sebastian.reichel@collabora.com;
	h=Date:Date:From:From:To:To:Cc:Cc:Subject:Subject:Message-ID:References:MIME-Version:Content-Type:In-Reply-To:Message-Id:Reply-To;
	bh=0X9a2/9rf8so0cbamy4a/Ax3kfWAme7PBrmR3FMvRE0=;
	b=cqRHtmDIFEstJG3eByxH4uI0E58jrJu7IrO11AOWVBcHoT7Hk8BGpeHsQTTE3WMi
	TSDWjYl6ttng2M3Bwzop13zj+SxX0Ltq6udjbuicECamKjV2zTtCPoKE12bNctCXQ5P
	g9I0vZNuBhG66YPPBcqB1fUqdpJPg11XUA6RhgZc=
Received: by mx.zohomail.com with SMTPS id 1784120390457969.5152214020392;
	Wed, 15 Jul 2026 05:59:50 -0700 (PDT)
Received: by venus (Postfix, from userid 1000)
	id C6033180820; Wed, 15 Jul 2026 14:59:46 +0200 (CEST)
Date: Wed, 15 Jul 2026 14:59:46 +0200
From: Sebastian Reichel <sebastian.reichel@collabora.com>
To: Royal Net <royalnet026@gmail.com>
Cc: sashiko-reviews@lists.linux.dev, conor+dt@kernel.org, 
	devicetree@vger.kernel.org, robh@kernel.org, Dmitry Osipenko <dmitry.osipenko@collabora.com>, 
	Mauro Carvalho Chehab <mchehab@kernel.org>, linux-media@vger.kernel.org, kernel@collabora.com, 
	linux-kernel@vger.kernel.org
Subject: Re: [RFC PATCH 1/2] dt-bindings: media: snps,dw-hdmi-rx: add
 #sound-dai-cells
Message-ID: <aleBPE5YHlC7pLpi@venus>
References: <20260715051939.64652-1-royalnet026@gmail.com>
 <20260715051939.64652-2-royalnet026@gmail.com>
 <20260715055448.AEA021F000E9@smtp.kernel.org>
 <CAEWPSH7OqecBKvxUVtwFe4B9y0-=gsQ7vy6kdBHx-Nsne-Ct1g@mail.gmail.com>
Precedence: bulk
X-Mailing-List: sashiko-reviews@lists.linux.dev
List-Id: <sashiko-reviews.lists.linux.dev>
List-Subscribe: <mailto:sashiko-reviews+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:sashiko-reviews+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="ia3gqxw75or2z2nr"
Content-Disposition: inline
In-Reply-To: <CAEWPSH7OqecBKvxUVtwFe4B9y0-=gsQ7vy6kdBHx-Nsne-Ct1g@mail.gmail.com>
X-Zoho-Virus-Status: 1
X-Zoho-AV-Stamp: zmail-av-0.2.10.1.5.2/284.55.37
X-ZohoMailClient: External


--ia3gqxw75or2z2nr
Content-Type: text/plain; protected-headers=v1; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable
Subject: Re: [RFC PATCH 1/2] dt-bindings: media: snps,dw-hdmi-rx: add
 #sound-dai-cells
MIME-Version: 1.0

Hello Igor,

On Wed, Jul 15, 2026 at 08:55:37AM +0200, Royal Net wrote:
> > Should the constraint be set to 0 to follow standard device tree
> > norms?
>=20
> Fair point. The current RFC wires up a single I2S DAI, and for a
> single-DAI provider 0 is indeed the norm -- rockchip,dw-hdmi does
> exactly that for its one DAI on the TX side.
>=20
> The reason I picked 1 is that the controller also has an S/PDIF
> audio output path (the vendor driver exposes both I2S and S/PDIF
> DAIs through hdmi-codec), so a DAI index becomes meaningful if that
> second path is wired up later.
>=20
> Unless the DT maintainers prefer keeping 1 from the start to avoid
> changing the cell count if/when the S/PDIF DAI is added, I'll switch
> to const: 0 in the next revision -- please let me know which you'd
> prefer.

It should be 1 from the start as the DT binding is supposed to
describe the hardware and be stable. But in the next version you
should look into updating the commit descriptions to be less about
the kernel driver and more about the hardware. Maybe something like

> The HDMI RX controller has two digital audio interfaces, one for
> I2S and one for S/PDIF. Allow referencing connections from audio
> codecs to these interfaces by documenting the missing #sound-dai-cells
> property.

Apart from that it makes sense to document that argument 0 means
I2S and argument 1 means S/PDIF interface in the property description.

Last but not least drop "A value of 1 lets a sound card reference
the audio DAI as <&hdmirx 0>.". Instead you can add this to the
example section at the end of the file.

Greetings,

-- Sebastian

>=20
> Igor
>=20
> On Wed, Jul 15, 2026 at 7:54=E2=80=AFAM <sashiko-bot@kernel.org> wrote:
> >
> > Thank you for your contribution! Sashiko AI review found 1 potential is=
sue(s) to consider:
> > - [Medium] Incorrect cell count constraint for single-DAI provider.
> > --
> >
> > --- Patch [1]: [RFC PATCH 1/2] dt-bindings: media: snps,dw-hdmi-rx: add=
 #sound-dai-cells ---
> > commit e6b0bac0b97f568ce749084e6c1e728bcd258b10
> > Author: Igor Paunovic <royalnet026@gmail.com>
> > dt-bindings: media: snps,dw-hdmi-rx: add #sound-dai-cells
> >
> > This commit adds the #sound-dai-cells property to the HDMI RX controller
> > bindings, enabling a generic audio codec to capture incoming embedded a=
udio.
> >
> > > diff --git a/Documentation/devicetree/bindings/media/snps,dw-hdmi-rx.=
yaml b/Documentation/devicetree/bindings/media/snps,dw-hdmi-rx.yaml
> > > index b7f6c87d0e06a..83c10d9997c8e 100644
> > > --- a/Documentation/devicetree/bindings/media/snps,dw-hdmi-rx.yaml
> > > +++ b/Documentation/devicetree/bindings/media/snps,dw-hdmi-rx.yaml
> > > @@ -78,6 +78,13 @@ properties:
> > >        The phandle of the syscon node for the Video Output GRF regist=
er
> > >        to enable EDID transfer through SDAIN and SCLIN.
> > >
> > > +  "#sound-dai-cells":
> > > +    const: 1
> > > +    description:
> > > +      The HDMI RX controller registers a generic HDMI audio codec so=
 the
> > > +      audio embedded in the incoming stream can be captured. A value=
 of 1
> > > +      lets a sound card reference the audio DAI as <&hdmirx 0>.
> >
> > [Severity: Medium]
> > Is this cell count constraint correct for a single-DAI provider?
> >
> > Looking at properties:#sound-dai-cells, the hardware exposes only a sin=
gle
> > generic audio DAI. Requiring a cell count of 1 forces device tree nodes=
 to
> > use a non-standard syntax like <&hdmirx 0> instead of just <&hdmirx> fo=
r a
> > single resource.
> >
> > Should the constraint be set to 0 to follow standard device tree norms?
> >
> > --
> > Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260715051939.=
64652-1-royalnet026@gmail.com?part=3D1

--ia3gqxw75or2z2nr
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCgAdFiEE72YNB0Y/i3JqeVQT2O7X88g7+poFAmpXhD4ACgkQ2O7X88g7
+ppfpBAAoMfCHMu9qD2CD/CNFbUADMwm3P0NAEq/3wLsWPIcjMi9g5dYd0x9m5i8
VTPrWdmxTCODAo+grzk2NDizo2zv0RRb0jR0gTkkvw1iE6v4WKBcQ1LgeVC5i+/4
BPGFALjP6kPIJqzFVEPtBpPEwpk8BGbzM8Lrjew7JHtwOAwa6pdIslCUBfJjAtTI
Y7vHm8I39dYtwjLYXkWSxVUYoO4uo7KwNVifY1CBk5WzfbWD5CIs9xHjga0nHK0N
VrccjNeo5Nt77JOQpFiiPVEqzG3yjeC+n2iue/DfzTnTyR3kb+F5PEaRCDktc+Ng
DxkQfxHpAqhYLiz0eifQF7zomNhYZLVq/8Up1dgktkmYLOem+gMGFOaVN9hGLXOv
Fjl3fv1CdK+EETrC7qi75KZ0XZoXoyHOVmrFSKfVvzIScKrUjj4QL+hv5mn8HfQd
X8S0Fn0nz7uaJ8Y3yGWAUJHfyUrCEfzGJ9+0GgnmICuIIpPgnDDIbTypQE0Ib2i1
rrWck1/Ax4NqQxOnz7sCvWEAnYVrWPPAPKnbXMNfoAyZfhdQLiv6AmcfdgLaeO3U
TwCJGeNZgPIewgmZvjIUJM9pj2yVhD7Aek/hWDUryiFnCNx0Gy1cFq51j+Q7yEV8
z3Q/aUZg7u2wLYVijmBlAbzkfK3IbWa9I7dCapxERdkrGJA2pdU=
=EQ7t
-----END PGP SIGNATURE-----

--ia3gqxw75or2z2nr--
