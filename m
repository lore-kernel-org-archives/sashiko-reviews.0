Received: from mail.zeus03.de (zeus03.de [194.117.254.33])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 457A33E1713
	for <sashiko-reviews@lists.linux.dev>; Tue, 19 May 2026 08:38:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=194.117.254.33
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779179934; cv=none; b=VWuYKQHHsF4ZntL4C/tIgGkge2Vrh4Eaw5G2KJyGPyw9HEEGuHtT4sbIU4ENrJpAepkCA83mMNVuq4+a/L7UQv8JcoWhq1qoUVTZTN9stTrYGIon7o7WgXLEa4F1N8rG3ZYgO13Kw/X+53r5GMhjdA9yQWHlA0j4/3BVCAMJS+A=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779179934; c=relaxed/simple;
	bh=KiYg5pTe8MuLF81e6jKZtWiCbFifOfu4ZtlKT4BVK8Y=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=uYEuTB7j2flYgtYbzQHGzI7XrB1qd1Dm/wwUE09VYIRftwZuBsf1Q6Yl+twdJjLuHMpafwavA/og1e2vMZ3mDSWXFIasp5H3Y0kfZths3PYhhZHMBB+TQB1H/S06iX5WQzrIK4zAxXS7o09lEVJtLOwaKenKcbKE7YrH0IyH7HY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=sang-engineering.com; spf=pass smtp.mailfrom=sang-engineering.com; dkim=pass (2048-bit key) header.d=sang-engineering.com header.i=@sang-engineering.com header.b=g7TYZXXy; arc=none smtp.client-ip=194.117.254.33
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=sang-engineering.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=sang-engineering.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=sang-engineering.com header.i=@sang-engineering.com header.b="g7TYZXXy"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	sang-engineering.com; h=date:from:to:cc:subject:message-id
	:references:mime-version:content-type:in-reply-to; s=k1; bh=KiYg
	5pTe8MuLF81e6jKZtWiCbFifOfu4ZtlKT4BVK8Y=; b=g7TYZXXynFmRPNtyt5Le
	MRZ/kcbSC5QwuWqzGIRZQTqGrIOwFJyF8BwUH3uJTcmGKsuEOClG8ex6opUXBc2C
	jsk9/P9unrIUhGeus3DOq0bCXabnzKhaTfLFkRIQVZE5ZWHrbWarZ+ju6fVS/mXo
	MNW2qmYSVcQdzYIaW7Q6E6bGYlqSl5KRNKjtaqjOPjQStHqgI3RpoDrbRHJlRlJh
	UyGpjiam2C6mUbkje8cgIjjEmOvr6+0VrysOTV8q5E0REzhdlwMK9DfMF/tjDhS1
	j6/3XNxBug2TpEdO0dHhK/YPkLv/TT5BMZCOF8UrMEEYeOji/zcwUtClbb3oO5F2
	7Q==
Received: (qmail 186074 invoked from network); 19 May 2026 10:38:51 +0200
Received: by mail.zeus03.de with ESMTPSA (TLS_AES_256_GCM_SHA384 encrypted, authenticated); 19 May 2026 10:38:51 +0200
X-UD-Smtp-Session: l3s3148p1@9dzHmydS89pUszca
Date: Tue, 19 May 2026 10:38:50 +0200
From: Wolfram Sang <wsa+renesas@sang-engineering.com>
To: sashiko-reviews@lists.linux.dev
Cc: devicetree@vger.kernel.org, conor+dt@kernel.org, robh@kernel.org
Subject: Re: [PATCH v2 1/2] arm64: renesas: r8a78000: add MFIS, MFIS SCP and
 transport nodes
Message-ID: <agwhmjpJaqYiDNxi@shikoro>
References: <20260519074702.3308-5-wsa+renesas@sang-engineering.com>
 <20260519080519.C4B97C2BCB3@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: sashiko-reviews@lists.linux.dev
List-Id: <sashiko-reviews.lists.linux.dev>
List-Subscribe: <mailto:sashiko-reviews+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:sashiko-reviews+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="EjRhHHmfWMDdBUZA"
Content-Disposition: inline
In-Reply-To: <20260519080519.C4B97C2BCB3@smtp.kernel.org>


--EjRhHHmfWMDdBUZA
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Tue, May 19, 2026 at 08:05:19AM +0000, sashiko-bot@kernel.org wrote:
> Thank you for your contribution! Sashiko AI review found 1 potential issue(s) to consider:
> - [Medium] Removing the `prr` node silently breaks SoC revision detection and hardware ID verification in the Renesas SoC initialization driver.

This is handled in -next properly.


--EjRhHHmfWMDdBUZA
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCgAdFiEEOZGx6rniZ1Gk92RdFA3kzBSgKbYFAmoMIZYACgkQFA3kzBSg
KbZ4ZQ/+IrvVKqCfRfwVa3BJ8nAyNAIxqHoRAh4DOQc3N9rAdFLM6PKdoDfcVdw9
jYKxXca1nTiIxFjE2jVndcO/R3bM1XYBJ3m6SeSVlwTcyn32W2YIedvbl+fL9OZ2
BtFfKIGTfF0ds2On4Ctbpnw3eZMUYWmxN1NwHXhHH2Q7G+zsWGYiYdvnJKjRrCSk
+K6fdRgfRhjBq4Q8R2E0AQiXtyq7eDSBAX/IAc3vk/NAb2JnK/eMVm59htATjXsZ
IkJJGHVyK1M9cnkSu5cu+V3RJMAOUCY+jDpuyErbAPCm+sFFgnMNfBoCqaLO6IT9
/NczgYnmhudG08PTekkhw/X69sfoy2kHmr+SBOh+Xv6M3xnvBBqwM/OENytBvWwo
3WW6Vs2pSTcvvB+xUQEUcOTl8uzOeI+2khOR2H8nOOElRpBfu17flULU7mJKonI5
wWLWFxj76cIr0hRLzZSzVgLvaDj0tva83ux+vxTby0B/onTmULGAbG+Tm5RDZSpY
iopJeZIh4jNCbOgGz7Yxj3xVjhS/IngOgULAWgdg3X+qvTS1QKoxE/dlAW4Yu1H7
txaZy+RmzsUD56kpWW7YQ01X+1JXs6l7sj9l3JMig7ZstU8yYb6vu+Q1ahCUsRa8
vJCkFAdVPO1Oj4nf3d1uCb2VoodGVHWcOeSsZQcaXstXCvwSFEo=
=34L2
-----END PGP SIGNATURE-----

--EjRhHHmfWMDdBUZA--
