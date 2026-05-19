Received: from mail.zeus03.de (zeus03.de [194.117.254.33])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F32023E316B
	for <sashiko-reviews@lists.linux.dev>; Tue, 19 May 2026 08:39:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=194.117.254.33
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779179969; cv=none; b=RXpqH6x/nM2yyVLyxM4Jty4Lb/oWvaKfJY94Vjunyj4+vJCSW2cEo4qqT6YNIijKYciphZTzdLHLrqb7ctliwpRHztxgYFSyHWZJXntuP1GT/Z4tQ2ohYbi9qj3HcelTZCMvT6RG1xllTpJee1ZXEbBzHtWE9xVid6hp9u4OFno=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779179969; c=relaxed/simple;
	bh=MdRV54VogZfy2pTCjREEuf8SI5/HBdFrEUmn/7BsXJ0=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=i6D3/kcHctr4qE8JwKG0vn5bfbjqLTOqjTLM6H0ALZV/2xUmbpL8Kd1RHKy2/lN5g7oy7OOAu2zsoEUp68ZE4ChidBQKT7mAnXtTF5UWyG3jLXAKEbAjvtf7VTTAtHwQDuTBiMwHMTMyyjS/IqeuMVa3OuHOqjIzj+/Z/CSfmao=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=sang-engineering.com; spf=pass smtp.mailfrom=sang-engineering.com; dkim=pass (2048-bit key) header.d=sang-engineering.com header.i=@sang-engineering.com header.b=AmECmYBM; arc=none smtp.client-ip=194.117.254.33
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=sang-engineering.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=sang-engineering.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=sang-engineering.com header.i=@sang-engineering.com header.b="AmECmYBM"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	sang-engineering.com; h=date:from:to:cc:subject:message-id
	:references:mime-version:content-type:in-reply-to; s=k1; bh=MdRV
	54VogZfy2pTCjREEuf8SI5/HBdFrEUmn/7BsXJ0=; b=AmECmYBMYcqggJLfYG1n
	hTFUTFFUzhwHSffSyocINY+nIkWGMIjb5kH29SxiyOlPrrIfckPjlxrg4/wvAd48
	Yn2KAxNqqsTe8XFh9BYCQMOXHCM9ARyhTI5+0t6hmouD3CbH0fVRHA2jpJ1UySrt
	JhAuuiPhSBrmnrvE/0f2fDNXFcW2OINRLhcMOlpRTRiNmjN5zae6fV5e3iP+qrdp
	yovU19PpX/9atnNUTwkbFyz2tNTt5BxMgtJgs5GmKFiirE70r3eeyieS9oLFgsl8
	/KOwWnVSd76C+bG4OvYNIbXFG/fxFio0d8J77ThpH3DgX1ZmJEqiOb0wpX4YAJP6
	pw==
Received: (qmail 186237 invoked from network); 19 May 2026 10:39:23 +0200
Received: by mail.zeus03.de with ESMTPSA (TLS_AES_256_GCM_SHA384 encrypted, authenticated); 19 May 2026 10:39:23 +0200
X-UD-Smtp-Session: l3s3148p1@WzeynSdSrmlUszca
Date: Tue, 19 May 2026 10:39:22 +0200
From: Wolfram Sang <wsa+renesas@sang-engineering.com>
To: sashiko-reviews@lists.linux.dev
Cc: conor+dt@kernel.org, devicetree@vger.kernel.org, robh@kernel.org
Subject: Re: [PATCH v2 2/2] arm64: renesas: r8a78000-ironhide: enable to use
 SCMI
Message-ID: <agwhuk7DyN-l0Idb@shikoro>
References: <20260519074702.3308-6-wsa+renesas@sang-engineering.com>
 <20260519081718.4F790C2BCB3@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: sashiko-reviews@lists.linux.dev
List-Id: <sashiko-reviews.lists.linux.dev>
List-Subscribe: <mailto:sashiko-reviews+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:sashiko-reviews+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="/arnjRI5x5Qn1PYd"
Content-Disposition: inline
In-Reply-To: <20260519081718.4F790C2BCB3@smtp.kernel.org>


--/arnjRI5x5Qn1PYd
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Tue, May 19, 2026 at 08:17:17AM +0000, sashiko-bot@kernel.org wrote:
> Thank you for your contribution! Sashiko AI review found 1 potential issue(s) to consider:
> - [Low] The patch adds an include directive for `<dt-bindings/soc/renesas,r8a78000-mfis.h>`, but this header is not included in the commit and does not exist in the repository.

This is handled in -next properly.


--/arnjRI5x5Qn1PYd
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCgAdFiEEOZGx6rniZ1Gk92RdFA3kzBSgKbYFAmoMIboACgkQFA3kzBSg
KbbwuQ//fLV/Ab162iNa9XidxIjXfms6Fi3o4tvgLLRpVpRy2JGgSshgbUGaMHBr
3stflO+y3fZzIt6nkE91XMspOHCxv0sxJ+K/8tDPtmF9tM0n9X1rN9q+G9Hqal6c
l5JZNpoHnjBT02uCtXXDiVRbmd1iovCibcu7EXgrN1A9L99g8I+ibEXohgxH3imf
rMvLRmOtyTtwIUzPDgAlPiOwOv2cbP2wgnxt8aCCbnNmGO/tKfOTX9krlgmlcm0P
nGqgI8NZ5BwSmJeXFgUgmcvTAsz5vCtsm/qyFyRlo7lomn108suLWcBCXGZ1uz3E
yfPwiJi2bYWbGyKWyM3gVUMGwwOeGsbL0E5PAhqJW0qu22Am1BfTUKcPH7OFGFek
noQzCyRz4NyjBO5o7yh9gDMPEco8tdCCUycGMc3vrsa8JVo+eeA6HQUodWA8/6Bz
U+M7HQPho7Tf/g/9ktYw0BLVOY+wiF8yyfhtxF5cZvsg52BXXBreuvwVrkbsfxHO
mcenoBwVyavN5g0azzm6uhFI7jSfNcdyqCeCQmup19fYedz6VI0SubxGcAfCnhkz
8b29XvmSHIe9j5BqAUK4oW2xItlYUEhDYb2TyoG+cDFSPRS/0WUcexOvhzm95Iff
YIeqouLr7vGTkP9UBxOA3Y+VgG1btTII/0SxftVdwdhCSn8jdAM=
=XZ0l
-----END PGP SIGNATURE-----

--/arnjRI5x5Qn1PYd--
