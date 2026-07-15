Received: from sender4-op-o11.zoho.com (sender4-op-o11.zoho.com [136.143.188.11])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 113333BB9FD
	for <sashiko-reviews@lists.linux.dev>; Wed, 15 Jul 2026 19:20:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=136.143.188.11
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784143241; cv=pass; b=K+X/qoYc0eQYI2aWpRuecJWuYtAmKIu5SMpNQBqd53JGnYmrogCA4mi36iO9q5zwitQ7VK67mq1yVyHRcnQH+j3SKFA7hoNv97FdQG/XxRvHyKNdhpL4KYJD6y7rMQA37SCgNMdGDNmZ9YEQm9KYT3fOx/P3AE1V7hCbM2FsugM=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784143241; c=relaxed/simple;
	bh=z4+tLqOerfQ9USKtD/ecO7iXIoy+d2Wj8l4h5iDOk3Q=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=IR4aRsIo7Jrs7zA2syQ4AOGGrz22bjHmmAZwLhf19hBbXSc+HgxX1BmCtxyoZOos4Sd7OmTREixvzLGJJUlhpkJYSB8ZO8UP4XEooJ885j8G4rewPBK8RFoEBOmYQ6GGJugLfKHg/1litcH7/3ya8+vci9pkox2JBvo0CvhoLfI=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=collabora.com; spf=pass smtp.mailfrom=collabora.com; dkim=pass (1024-bit key) header.d=collabora.com header.i=sebastian.reichel@collabora.com header.b=Cv//09bd; arc=pass smtp.client-ip=136.143.188.11
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=collabora.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=collabora.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=collabora.com header.i=sebastian.reichel@collabora.com header.b="Cv//09bd"
ARC-Seal: i=1; a=rsa-sha256; t=1784143217; cv=none; 
	d=zohomail.com; s=zohoarc; 
	b=a1MKzUZJlGHaLY4VDJ83Rxs7T07th72BmzmxgQaXO8JGgQqoAo2KLnQRmLJahPmYDN3cygMuwQbi1vBEbCFnE1w4Sgxun17NU/31PeTucqxxcUI/kjrcXoqL+8GetRX3oJpJtm215yENFaRVlaSBcYMZuM18bZM4s/ZPojJincI=
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=zohomail.com; s=zohoarc; 
	t=1784143217; h=Content-Type:Cc:Cc:Date:Date:From:From:In-Reply-To:MIME-Version:Message-ID:References:Subject:Subject:To:To:Message-Id:Reply-To; 
	bh=z4+tLqOerfQ9USKtD/ecO7iXIoy+d2Wj8l4h5iDOk3Q=; 
	b=CxNMwXe1PQUtB440m0mm7pKOh+7c/p3+M/fHByUl9AhWl3/dEw4pOL9f+3YEs0BzeN6VdzSMr6/AfWSo03kgFwKTlPA9y+WjHQjRW52WrXCVJa+NinTbdWysVcxb5HFlGZgyOPnqXoIcoWz3urt5ki06wcZoAvNN0I+ldkNy04A=
ARC-Authentication-Results: i=1; mx.zohomail.com;
	dkim=pass  header.i=collabora.com;
	spf=pass  smtp.mailfrom=sebastian.reichel@collabora.com;
	dmarc=pass header.from=<sebastian.reichel@collabora.com>
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; t=1784143217;
	s=zohomail; d=collabora.com; i=sebastian.reichel@collabora.com;
	h=Date:Date:From:From:To:To:Cc:Cc:Subject:Subject:Message-ID:References:MIME-Version:Content-Type:In-Reply-To:Message-Id:Reply-To;
	bh=z4+tLqOerfQ9USKtD/ecO7iXIoy+d2Wj8l4h5iDOk3Q=;
	b=Cv//09bdWp79RVzRtwlDtFY49fyEBWmbOevhC0LGVxPbxC8bKerHT6FvwTztsTG4
	ahMG2lRzK6LyO+KS4RnSatrUqDpZ7JWI2cJpa5aVrXvMUO516akh2MzqnwxgwxkKmXE
	p/1fvFHlQ89dXnJY+Uo5t62wZwMUKi8tmYQYPwCg=
Received: by mx.zohomail.com with SMTPS id 1784143215185954.3482006909511;
	Wed, 15 Jul 2026 12:20:15 -0700 (PDT)
Received: by venus (Postfix, from userid 1000)
	id DAA25180820; Wed, 15 Jul 2026 21:20:11 +0200 (CEST)
Date: Wed, 15 Jul 2026 21:20:11 +0200
From: Sebastian Reichel <sebastian.reichel@collabora.com>
To: Igor Paunovic <royalnet026@gmail.com>
Cc: sashiko-reviews@lists.linux.dev, conor+dt@kernel.org, 
	devicetree@vger.kernel.org, robh@kernel.org, Dmitry Osipenko <dmitry.osipenko@collabora.com>, 
	Mauro Carvalho Chehab <mchehab@kernel.org>, linux-media@vger.kernel.org, kernel@collabora.com, 
	linux-kernel@vger.kernel.org
Subject: Re: [RFC PATCH 1/2] dt-bindings: media: snps,dw-hdmi-rx: add
 #sound-dai-cells
Message-ID: <alfcy_rcmjrKJb0H@venus>
References: <20260715051939.64652-1-royalnet026@gmail.com>
 <20260715051939.64652-2-royalnet026@gmail.com>
 <20260715055448.AEA021F000E9@smtp.kernel.org>
 <CAEWPSH7OqecBKvxUVtwFe4B9y0-=gsQ7vy6kdBHx-Nsne-Ct1g@mail.gmail.com>
 <aleBPE5YHlC7pLpi@venus>
 <CAEWPSH4AYfSR_DBcLFr6a=SJxnAAcjoK612v+g-TpP046qTBmg@mail.gmail.com>
 <alfCQd689ATJOdwM@venus>
 <CAEWPSH6L79Kb9wQna9Cg8yGMJAN88__PwsuXvA+oo+fPStLoYg@mail.gmail.com>
Precedence: bulk
X-Mailing-List: sashiko-reviews@lists.linux.dev
List-Id: <sashiko-reviews.lists.linux.dev>
List-Subscribe: <mailto:sashiko-reviews+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:sashiko-reviews+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="dxswjltreapgibcc"
Content-Disposition: inline
In-Reply-To: <CAEWPSH6L79Kb9wQna9Cg8yGMJAN88__PwsuXvA+oo+fPStLoYg@mail.gmail.com>
X-Zoho-Virus-Status: 1
X-Zoho-AV-Stamp: zmail-av-0.2.10.1.5.2/284.121.97
X-ZohoMailClient: External


--dxswjltreapgibcc
Content-Type: text/plain; protected-headers=v1; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable
Subject: Re: [RFC PATCH 1/2] dt-bindings: media: snps,dw-hdmi-rx: add
 #sound-dai-cells
MIME-Version: 1.0

Hi Igor,

On Wed, Jul 15, 2026 at 07:41:22PM +0200, Igor Paunovic wrote:
> Hello Sebastian,
>=20
> > Not implementing all features in the driver is perfectly fine.
> > Ideally you return -ENOTSUP if somebody tries to use the S/PDIF
> > DAI interface instead of I2S.
>=20
> Done for v2: the codec registration now exposes the S/PDIF DAI as
> well, so the DAI indexes match the binding (0 =3D I2S, 1 =3D S/PDIF),
> and hw_params() rejects the S/PDIF interface with -EOPNOTSUPP until
> that path is actually wired up.

Sounds good to me.

Greetings,

-- Sebastian

--dxswjltreapgibcc
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCgAdFiEE72YNB0Y/i3JqeVQT2O7X88g7+poFAmpX3WsACgkQ2O7X88g7
+poCkw/+JPyyaiO3x/Jodfj5BW9q2m4XxQh8EWQroBhi8WUgGUPzGl6Z+JL6no3E
gVYlbNBbc59Tjd6bXpiyuvTizQH3MyuXkuKEF86KZWFr4dfVJZ9V0wSiljNc9ZD3
XBHRLZ9gpOzP4ApWeaYdAi7kij80XKa7DEoQvUpNMSSZzAUDnZ8ha+pdX5cwQ+HP
YqTgGpQtRYD1xrnHC/NjKXxGzWo9BuDzeTIhTn6yMV96gyaRnPEhZ6LEPkSGWkXf
ImP31JzYd7iRieyzgJX9Zfk/+g8781+Y4iZoaQuhVvN0LUJE5G+6R0HDxC1eWm+E
lmdqJTwbDsAPYYe2I6TDZWTZO/dQsL6jxz8qrvFVppFXhCYkjWU0/NtMtcFbAaeH
BVlbJn7qLUhNVeRqGFSb+jQdh1ZZAHIIEt+PKzlpaFcTZ0HYOPBeVY7rkNjKphg0
oQTWMjR8To2qnJxq+XVKJZBfvH1ktGEvBg83Dt7pGdxka/tMUeZ3P+7YUWTFUJSO
05lTujsuG5ocilVJGuouDWyPbDk0axtDYAO/ojbEpSWCzH3mit1Aci0e83zyGl7u
Ve3aAA2AYOyvHpLeB5fsUpVbuS0V8Rdo/Zq41R50RI6Zwf6en6A4EB0wZEN92NQi
hBCUwNt9vlLPJNi8QFzumPYcptaWIhFzVaUphXNfBEi40YejFDM=
=Q2Qd
-----END PGP SIGNATURE-----

--dxswjltreapgibcc--
