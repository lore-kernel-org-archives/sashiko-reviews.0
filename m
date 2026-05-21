Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 621EE38330A;
	Thu, 21 May 2026 16:52:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779382334; cv=none; b=bqCnx/AfIcO8xDcfkoR11hxMMk99ZlHggy3TLffB7KPR3H7WRn/GLOWiilcMGL9W9jf4BpSqrE/JUf1w6rjaRCz9GkjWhKSsC8UMkJzUBFOdiH4mvK2X/6wKC2n/87HM8meBvxIX0goSdTJgvYsvPaN6y6o5wPha7rvatOi5cfM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779382334; c=relaxed/simple;
	bh=OXtFSh4y4YgrQJu2Fd8sAvsJZ+ivK61dFVSu7rosbAo=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=X/NpIibheWWfMldt/gX0fzst1mj9wxxtEl77AAYZRp0KdEOyOfRmnULlhVDZnBrEQ3P4FnkznJXNXYAgCntOA+uJzeRjPRMImT3yAEtK4/SsiLdJhaTYDfsX9v/bnYTlMcWD4oIUUdaZdPAJ/iVNjTkb0u1pBWAasFmVijVFsgc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=HoDSi/P9; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="HoDSi/P9"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id B238D1F01567;
	Thu, 21 May 2026 16:52:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1779382332;
	bh=HqrbPXusXPMXcIS9HKkT8zlhErFr3ZAlpslnFMZy0fA=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=HoDSi/P9K6wGjhEsBw0dzjqF75XTAVQv0r3COG2iTVXBk/Wwhm68iKGoTGiyUo8en
	 lzXQwE8671RYA2b3qEFw8JBi0cn4hsmwy+uqAe+MUJ1CcD95uvvakg3Ph+RQCqhMCX
	 14reXa83H8AIG1JKGgB6k0au+yah4kQMlpf9gBZ8okRbZ54vjSp1CMB2z0/YBmXuxE
	 DPQ0pzFzoAUqiIDyb/wAQUE4QttN/BY7YB76xrtFtUbEXbT5Sd0rTutway88riHUCF
	 gAOAoT5vimo3HzBf8SL6m0xgwyZoY/Qv95W5nxSOLwmGyFYYMQVTTBrZa9dK0hovW2
	 WIICxlF4d84qA==
Date: Thu, 21 May 2026 17:52:09 +0100
From: Conor Dooley <conor@kernel.org>
To: sashiko-reviews@lists.linux.dev
Cc: Vitor Soares <ivitro@gmail.com>, conor+dt@kernel.org,
	devicetree@vger.kernel.org, robh@kernel.org
Subject: Re: [PATCH v1 14/15] dt-bindings: display: panel-lvds: Add LG
 LP156WF1
Message-ID: <20260521-whooping-appliance-802f41767113@spud>
References: <20260521150038.103538-31-ivitro@gmail.com>
 <20260521152716.DD2FD1F000E9@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: sashiko-reviews@lists.linux.dev
List-Id: <sashiko-reviews.lists.linux.dev>
List-Subscribe: <mailto:sashiko-reviews+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:sashiko-reviews+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="/WOCuUl28PDdUzJL"
Content-Disposition: inline
In-Reply-To: <20260521152716.DD2FD1F000E9@smtp.kernel.org>


--/WOCuUl28PDdUzJL
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Thu, May 21, 2026 at 03:27:16PM +0000, sashiko-bot@kernel.org wrote:
> Thank you for your contribution! Sashiko AI review found 1 potential issu=
e(s) to consider:
> - [Medium] The dt-binding fails to enforce the dual-channel requirement (=
the `ports` property) for the newly added `lg,lp156wf1` compatible string.
> --
>=20
> commit a568203d1851908daadd835b566099e0a123357a
> Author: Vitor Soares <vitor.soares@toradex.com>
> dt-bindings: display: panel-lvds: Add LG LP156WF1
>=20
> This commit adds the compatible string for the LG LP156WF1 15.6" FHD
> dual-channel TFT LCD LVDS panel to the generic panel-lvds schema.
>=20
> > diff --git a/Documentation/devicetree/bindings/display/panel/panel-lvds=
=2Eyaml b/Documentation/devicetree/bindings/display/panel/panel-lvds.yaml
> > index 45183a1439ce9..a6af2b9cc2f9a 100644
> > --- a/Documentation/devicetree/bindings/display/panel/panel-lvds.yaml
> > +++ b/Documentation/devicetree/bindings/display/panel/panel-lvds.yaml
> > @@ -58,6 +58,8 @@ properties:
> >            - hydis,hv070wx2-1e0
> >            # Jenson Display BL-JT60050-01A 7" WSVGA (1024x600) color TF=
T LCD LVDS panel
> >            - jenson,bl-jt60050-01a
> > +          # LG LP156WF1 15.6" FHD (1920x1080) dual-channel TFT LCD LVD=
S panel
> > +          - lg,lp156wf1
>=20
> [Severity: Medium]
> Since the commit message indicates this is a dual-channel panel, shouldn'=
t we
> add an if-then conditional block to require the ports property specifical=
ly for
> this compatible string?

No idea if this is accurate, but if it is accurate, would the
lvds-dual-ports bindings come into play?

>=20
> Currently, the panel-lvds.yaml schema allows panels to be configured with
> either a single port or multiple ports. Without a specific conditional bl=
ock
> enforcing required: [ports] for lg,lp156wf1, a device tree incorrectly
> configuring this dual-channel hardware with only a single port will silen=
tly
> pass validation.
>=20
> --=20
> Sashiko AI review =B7 https://sashiko.dev/#/patchset/20260521150038.10353=
8-17-ivitro@gmail.com?part=3D14

--/WOCuUl28PDdUzJL
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEABYKAB0WIQRh246EGq/8RLhDjO14tDGHoIJi0gUCag84OQAKCRB4tDGHoIJi
0iEyAQC4KAbnKPdOa8gcJ7C/ne2DgDsLr5Jt9ce0JR47V7q/DgD8DBS8z/V29lSD
FlnKqoXNaG++FqLLBUX9wgii9SzUKwk=
=DTg3
-----END PGP SIGNATURE-----

--/WOCuUl28PDdUzJL--
