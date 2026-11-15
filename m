Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=213.160.73.56
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794736207;
	b=YGrdaFmKCoC3toshd/F5nxwNDCiNqga8PjvhoQE3cek//YA1SPOQUHTR30OvOU3DgqhD
	 pyQCZpXNQCmhbg9+ZRjL0awJQ/34fLFTqfCqXlSM6Ga3GedgbGQ4coI0lYWpijTCksLKJ
	 WuDjYdxS9sEgCd7UTRgxTyUOodRBoUgsG2M3PSqaO8hEh0LjE6ZWE3+s1Mohh46uro3oF
	 E2m8srpZEaCYsKMIC603d/mJqh6RzAetVGIOhH0Lvqf2OwA9770m/0cGKjC+lT2iHplaV
	 EePr4XuCsyikK7zaZQLJsAIZBjiW3lD2ZRwt3e/syajEi1gFuR2csK/AxmxjHuMedFA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794736207;
	h=DMARC-Filter:Received:DKIM-Signature:From:To:Cc:Subject:Date:
	 Message-ID:In-Reply-To:References:MIME-Version:Content-Type;
	bh=fZ05mL96e7xsv2qPwj5DbOYLveVjhQuS5JmkAfy2xHw=;
	b=Q55iMqOoWQbel8qyuqDk5148GTyepRqNiQMXAdZ6VPziRHMuY3msofZdiHGk6qNmX2My
	 wkjD4CU7l7UyzMHz/8e6HVn5YUvFYeU+DK5G7nfagMBQaAiJGnRwQJTiZIj2bJE82N3kA
	 rANGfccbNYpWjtQpd2e2zCk7jBlxsFUtZom8GKWel/fth2j2bWA4oRotjS99uczCQBSJG
	 u80rcNARFmZbUXPJ//pJGEumi6eMn9Ev3zYGgQUo/xT+miVO2yyQAbJ+V/6olAQmR5nWh
	 hFrFbnQsC6dpp64ilSO2gLMM/SP+NxmLmKRt30jQQSpYxRofZoKpl1DsrYflZJWi4Iw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=narfation.org;
	spf=pass smtp.mailfrom=narfation.org;
	dkim=pass header.d=narfation.org header.i=@narfation.org header.a=rsa-sha256 header.s=20121 header.b=BgryksRZ;
	arc=none smtp.remote-ip=213.160.73.56
Received: from dvalin.narfation.org (dvalin.narfation.org [213.160.73.56])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5A668606A31D
	for <sashiko-reviews@lists.linux.dev>; Sun, 15 Nov 2026 09:50:07 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 5A668606A31D
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=narfation.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=narfation.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=narfation.org header.i=@narfation.org header.a=rsa-sha256 header.s=20121 header.b=BgryksRZ
Received: by dvalin.narfation.org (Postfix) id 3F5FA1FDCB;
	Sun, 15 Nov 2026 09:50:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=narfation.org;
	s=20121; t=1794736205;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=fZ05mL96e7xsv2qPwj5DbOYLveVjhQuS5JmkAfy2xHw=;
	b=BgryksRZW6STpubVR0e0SCKzXMREAfmttpEBSNtLlvMzcrtIPUpbliPlgvlUeHQSYNUfJz
	ANQTP6msF6EiA6r38UIcGTiA9N64RZVrP0RiUGaa/8B1qu7x7EyOFKBuG9qlO0S534Shw/
	m4j43/H8L/lDR2gJKHokRvmsTPd0Y70=
From: Sven Eckelmann <sven@narfation.org>
To: Simon Wunderlich <sw@simonwunderlich.de>, sashiko-reviews@lists.linux.dev
Cc: marek.lindner@mailbox.org, antonio@mandelbit.com,
 b.a.t.m.a.n@lists.open-mesh.org, netdev@vger.kernel.org
Subject:
 Re: [PATCH net-next 12/15] batman-adv: dat: increase hash generation when
 purging entries
Date: Sun, 15 Nov 2026 10:50:02 +0100
Message-ID: <8759436.T7Z3S40VBb@sven-desktop>
In-Reply-To: <sashiko-outbox-215358@kernel.org>
References:
 <20261114091556.3336038-1-sw@simonwunderlich.de>
 <20261114091556.3336038-13-sw@simonwunderlich.de>
 <sashiko-outbox-215358@kernel.org>
X-Mailing-List: sashiko-reviews@lists.linux.dev
List-Id: <sashiko-reviews.lists.linux.dev>
List-Post: <mailto:sashiko-reviews@lists.linux.dev>
List-Help: <mailto:sashiko-reviews+help@lists.linux.dev>
List-Subscribe: <mailto:sashiko-reviews+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:sashiko-reviews+unsubscribe@lists.linux.dev>
List-Owner: <mailto:sashiko-reviews+owner@lists.linux.dev>
Precedence: list
MIME-Version: 1.0
Content-Type: multipart/signed; boundary="nextPart10948139.nUPlyArG6x";
 micalg="pgp-sha512"; protocol="application/pgp-signature"

--nextPart10948139.nUPlyArG6x
Content-Transfer-Encoding: 7Bit
Content-Type: text/plain; charset="utf-8"; protected-headers="v1"
From: Sven Eckelmann <sven@narfation.org>
Date: Sun, 15 Nov 2026 10:50:02 +0100
Message-ID: <8759436.T7Z3S40VBb@sven-desktop>
In-Reply-To: <sashiko-outbox-215358@kernel.org>
MIME-Version: 1.0

On Sunday, 15 November 2026 10:24:45 CET sashiko-bot@kernel.org wrote:
[...]
> 
> [Severity: Low]
> Inconsistent netlink dump detection for the DAT cache was introduced without
> updating bat_priv->dat.hash->generation in __batadv_dat_purge().  Should this
> include:
> 
>   Fixes: 6f81652a4713 ("batman-adv: Add inconsistent dat netlink dump detection")

No, "Fixes" (for old kernels) should not be added without "Cc: stable@....". 
And patches with these tags which should go through net-next.

It was decided that this is so irrelevant for most situations and fixed 
primarily for getting rid of these constant "This problem wasn't introduced by 
this patch, but...." reports by Sashiko. No need to increase the load on the 
stable-kernel team for such a change.

Regards,
	Sven
--nextPart10948139.nUPlyArG6x
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: This is a digitally signed message part.
Content-Transfer-Encoding: 7Bit

-----BEGIN PGP SIGNATURE-----

iHUEABYKAB0WIQS81G/PswftH/OW8cVND3cr0xT1ywUCavmASgAKCRBND3cr0xT1
yxUHAP0SFX9XcPbQw/S7jXOHEiEHcuBlvb3h37+TT8raM6TsnAEAlZpJ7BLTmoer
0QaxcP3q2bhGKie94xKiP7hPsq57wwE=
=+9WZ
-----END PGP SIGNATURE-----

--nextPart10948139.nUPlyArG6x--



