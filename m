Received: from mail.zeus03.de (zeus03.de [194.117.254.33])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9A1C740A933
	for <sashiko-reviews@lists.linux.dev>; Thu, 16 Jul 2026 10:20:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=194.117.254.33
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784197258; cv=none; b=Qdw5JoBzIIww7z0tc/aM+SgjP6q1tqm9WUJ2sMc83AV3ejifcrtabVMRSNCj3w2/e/7Z+gHhYoff57WPhcfwLY6ZWHPddOY6VdAJzVl9SnPAYhLf1vnyBapiv8bftU3k5oJp0M6v0FA3fThqS9LMBdwRG6t92kBPKKFOXhF9f8E=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784197258; c=relaxed/simple;
	bh=Ls9L4fEI6Kp9cQiG4vjTx8k921xxhZTelLdj7VO69fg=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=oN7aE0oZrEJ6mw0gFJaCJY6dAl/HeDE+wFYe0KIcytWOFBw8KePsd8HRNY/T5dt9MI9F/mcb8BpcEbebn1hrkSu0V5u2/0Ga54diRLzXH/WpeokFlz7KyHcFuGu8pQOjXn0+o8PxfxuTtZlAV/ta7f3KZNRbiZoBH8vH4PswuyI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=sang-engineering.com; spf=pass smtp.mailfrom=sang-engineering.com; dkim=pass (2048-bit key) header.d=sang-engineering.com header.i=@sang-engineering.com header.b=agJqxkIy; arc=none smtp.client-ip=194.117.254.33
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=sang-engineering.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=sang-engineering.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=sang-engineering.com header.i=@sang-engineering.com header.b="agJqxkIy"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	sang-engineering.com; h=date:from:to:cc:subject:message-id
	:references:mime-version:content-type:in-reply-to; s=k1; bh=Ls9L
	4fEI6Kp9cQiG4vjTx8k921xxhZTelLdj7VO69fg=; b=agJqxkIy3gB49tZ+Lc43
	FmdfwfQBbuFh0qaoyliqUNqHyXn2sO3lnjOeRaW1Q8MHcwAdLxC2KgaeBGfrN4tc
	f14Wjo2ZZliCtHMbEXI50ByKBa0NJiOEZzjJCyq5J+6qibXZ7PBhdHFmik/SDfr9
	fvsKjbPj0fwMdFH/zdNP+5Xvkl56MOfJO1duMAW+5npiBuK/eZtGJFfDq3RsCtLr
	qeZWEMfNRmExPp4hOBl9gBXqxO9tYVIiQnaNWQr3LUBVNjAgRIq9GmR6B0/FvLbx
	HvCDZPQYO3EQ+9dXd01qphWjT0YPpcPbmXAf8eqI1wGncPVXXV/zL7GlWHO952w4
	Jw==
Received: (qmail 1013210 invoked from network); 16 Jul 2026 12:20:54 +0200
Received: by mail.zeus03.de with UTF8SMTPSA (TLS_AES_256_GCM_SHA384 encrypted, authenticated); 16 Jul 2026 12:20:54 +0200
X-UD-Smtp-Session: l3s3148p1@dVyMy7dWcI0ujntt
Date: Thu, 16 Jul 2026 12:20:53 +0200
From: Wolfram Sang <wsa+renesas@sang-engineering.com>
To: sashiko-reviews@lists.linux.dev
Cc: robh@kernel.org, conor+dt@kernel.org, devicetree@vger.kernel.org
Subject: Re: [PATCH v2 2/2] ARM: dts: renesas: r9a06g032-rzn1d400-eb: enable
 GPIOs on CN12
Message-ID: <aliwheG1LPdnAFZA@ninjato>
References: <20260716095935.13329-4-wsa+renesas@sang-engineering.com>
 <20260716095935.13329-6-wsa+renesas@sang-engineering.com>
 <20260716101312.D95D21F000E9@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: sashiko-reviews@lists.linux.dev
List-Id: <sashiko-reviews.lists.linux.dev>
List-Subscribe: <mailto:sashiko-reviews+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:sashiko-reviews+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="qcs67yqcDbbjBSLR"
Content-Disposition: inline
In-Reply-To: <20260716101312.D95D21F000E9@smtp.kernel.org>


--qcs67yqcDbbjBSLR
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline


> [Severity: Medium]
> Will these pinctrl settings actually be applied here?

Yes, see reasoning in v1.

> Should these properties be placed in the parent &gpio2 node instead?

No, it obviously works.


--qcs67yqcDbbjBSLR
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCgAdFiEEOZGx6rniZ1Gk92RdFA3kzBSgKbYFAmpYsIEACgkQFA3kzBSg
KbbJXw/+Lj1Z2RoKXVP2EPUzROTMe5EiL0gfZAuHN5W7GtxCxxs796JchWXU3iFl
o6Bwfp9SIWaz5nvP1r9A9hgVJb5g+sA4/Sx5v5Z0smAg4dJYpp9F82KQQ/EGCPfp
IrIz/7xsu+w5GsbQcOJ1qYmJQ1MvBKSZtd94E8Xim8ts0BiVlrfkZbyTS/KuKMdg
LHmxkV5/dXc0uyDfJpXNFXNa7dbn2Qgma/kD+Az6eJlDRpfkI0oQkZwB1lLguXeg
SbjC0KzoaSWZ2pkqmhAHoYesQ8g0tj3wPNjsl6MPM0K9xIW3/KDUsASkZlciGS1r
ifHMIEyKL4IvnjNiTssuwqBaelc4/gIbkpnGN0VhpZ5ov3NiS1ygxlQO30YTQCEi
qUJiIMTa0fARc/wrmPtPMpZVQ9TPjz2hw5DRa3TadJOuvvL/XWt4MB2XTkThv/yQ
leSXGrVaMQyclKonaCcjOF5NQDBPM2uVndp3Tt712XAHjmDyDYbxeDZOgfSNTgkb
MDk7z+t27r86jilVdFusAYLamKVUIIoeuafyTCyP4ejX8y7/JTJalBTOw+tMH7mj
gK/nuZgzOrIhxmqxFsVR2/UB9NqB1nlJ6cWMc4tuoHvwnsYjcuhUwgnQdK4Z5JZC
4Es5HPWpP8Wb40qWIya+H56p2wBKt9/3GSYwl2bQ/eZh6pUcIPI=
=0QdO
-----END PGP SIGNATURE-----

--qcs67yqcDbbjBSLR--
