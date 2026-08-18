Received: from mail.zeus03.de (zeus03.de [194.117.254.33])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EA49437E5E7
	for <sashiko-reviews@lists.linux.dev>; Tue, 18 Aug 2026 10:03:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=194.117.254.33
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787047424; cv=none; b=inq81Y0M7kzbAAp6NH4oSzBCavexMYhn5qtet2v/4DLqRCPbMU+KX9ecn4b10E8Ul6ad4qtRymyfHkrsw8O1TsnKsVyyPEHGmHcPlTQhCq+lxN7UHUWurihQrvS2zYMytJ1Du0I1HU8xOvr9A1QIbsc51Fz78E3y74vXeJZsWRU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787047424; c=relaxed/simple;
	bh=C0HCW72zM79iFVVsM5WSeATz1jsOrplZoTWDpYd8nmQ=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=JIkmksZKWq9b35i7yVIV5V+9EuU8xntGl/Eh1dH7Wjx6pOQIs6eRbGBA6rROZPE87jlTiGTknJb9RxsszHK2S8djM1bOtb2xsbmVw2qQEXjeiPCySBMtbkEOxsRecNZIiquuAKiaFhXdz1g4+kN5lnVFlo6x3JmxFoDF1qmggKM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=sang-engineering.com; spf=pass smtp.mailfrom=sang-engineering.com; dkim=pass (2048-bit key) header.d=sang-engineering.com header.i=@sang-engineering.com header.b=EKCBhfvT; arc=none smtp.client-ip=194.117.254.33
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=sang-engineering.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=sang-engineering.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=sang-engineering.com header.i=@sang-engineering.com header.b="EKCBhfvT"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	sang-engineering.com; h=date:from:to:cc:subject:message-id
	:references:mime-version:content-type:in-reply-to; s=k1; bh=flTW
	lluT2xrHSGFV7gl3IrPvJEE1mKVirXZXfgwfNAU=; b=EKCBhfvT5uRw80x8kpOz
	WMz9GKf1ZZUDE8IOgrsuzZyzUbQNcJKriEGwpuJyXWJZgCPDLJNi6xTFxiktlERZ
	tSIfL4LfHvQL8dPGSYnGdJsfmja83MrLdAFkK13DuM7v3fvrmJeoga2bdCJTm1rH
	afgGb//yRnEbk9mFm1nmaba+sGcb1646f8kiL6MAjgC0roTQLU/+11g9ZO+3SYBx
	pYXxY3GGwScfQJJGCuyap9imQb0fcF0szf5oV7U2OZQvoDvCaRp3aYIJLu6jbVva
	bPUuhGOHFyoAOIZIQk0u7ZDD5wg0Hu54oZVf+eOxOHamuXnZLOL0NyogLkgG73C/
	bg==
Received: (qmail 3751099 invoked from network); 18 Aug 2026 12:03:35 +0200
Received: by mail.zeus03.de with UTF8SMTPSA (TLS_AES_256_GCM_SHA384 encrypted, authenticated); 18 Aug 2026 12:03:35 +0200
X-UD-Smtp-Session: l3s3148p1@xDNmZk9ZrMkujnuP
Date: Tue, 18 Aug 2026 12:03:35 +0200
From: Wolfram Sang <wsa+renesas@sang-engineering.com>
To: sashiko-reviews@lists.linux.dev
Cc: robh@kernel.org, devicetree@vger.kernel.org, conor+dt@kernel.org
Subject: Re: [PATCH v3] ARM: dts: renesas: r9a06g032-rzn1d400-eb: enable
 GPIOs on CN12
Message-ID: <aoQt94eAuPlfV-0p@ninjato>
References: <20260817103255.49565-2-wsa+renesas@sang-engineering.com>
 <20260817104615.3D4631F000E9@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: sashiko-reviews@lists.linux.dev
List-Id: <sashiko-reviews.lists.linux.dev>
List-Subscribe: <mailto:sashiko-reviews+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:sashiko-reviews+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="9F4I4fnNXXphUTNM"
Content-Disposition: inline
In-Reply-To: <20260817104615.3D4631F000E9@smtp.kernel.org>


--9F4I4fnNXXphUTNM
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable


> > +&gpio2b {
> > +	pinctrl-0 =3D <&pins_cn12>;
> > +	pinctrl-names =3D "default";
> > +};
>=20
> [Severity: Medium]
> Will these pinctrl properties be ignored here?

Tests show they are not ignored.


--9F4I4fnNXXphUTNM
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCgAdFiEEOZGx6rniZ1Gk92RdFA3kzBSgKbYFAmqELfMACgkQFA3kzBSg
KbZLSg//bdXjNSgSsj8BkDOTndwfz+OkXGkHBwXfLh3TrYDM4M4HmN7fRs764T/f
1O+vRiqaPSdxT2zZ2wV81g0Cyz9/QfKwCpnKAeNMyxHisfvYHzxClhV1YngARm14
kNA9NFS9X0fYvWChKgCG9fYN2baks79t1VCwXYLIyiZQrNQ3b0TdXulxuovCNe78
QjU6ce3QxRO7OYPWZDFBf4bJrnNnL/6lP1Iqiyqouy2MxBopH/JaW3uGvWtOnrxZ
QLaRT9lCcSnlVln9gUGkJfprlQtZAL2+zxuWiGBaqbXy5+MbBky3iYgYp10tkAkP
aAVzIbMgyOoh0kMoefjl6QEIKb0qqMrMyVyQbkwjspjO6nROuNjaoCA2Huxmv25k
8ymK+ISt/3zpMPw2gjSNMJWZoKSjkREjcnlrylNe2W73uJZBSjGnzrnID+jwllDw
75mlyF9od36PvMOYtiEJiXbdjLdYzzX/2qDMT5Uejznv7DQOOa4sIdStsqwaoIt7
aTW77tXmZeY9hvaG5fW5ipWfX2cZrr/tBCHJzez4y0ckzS/V6hA45Hr11Z4erx+S
Dmyk/avYAcCjSpTuJNNUbw0YNy1Il36+ignKMFQL234a2tDcqnBOHiGDgn2rpcr0
VA9601tfEvkw7MBfIPcjV7RYlmcIX/dqL8JH9z9ehFB1kcOh4og=
=DvzK
-----END PGP SIGNATURE-----

--9F4I4fnNXXphUTNM--
