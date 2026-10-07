Received: from dvalin.narfation.org (dvalin.narfation.org [213.160.73.56])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DC1E340803B
	for <sashiko-reviews@lists.linux.dev>; Wed,  7 Oct 2026 07:24:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=213.160.73.56
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791357873; cv=none; b=X7REu7EyIEwSx3Nxn3tnT65dB0Oc5X+kx+AaC88cp7Nwhor8LrvlZqYO4PwKLvBIocOpJ/CQvd/l60wtRnHLZ/g3uN8kzfTJSlpTI7hL32Y9icJ55eMQmdhhL68j30Y+TIXFMlTc3aaS6/byfeOi+GKAL0rsN8sEzDLoN9OJDzQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791357873; c=relaxed/simple;
	bh=iztJqddBeYql7gf7GpijGLUjFFUdkizrK/koGWWZ7F0=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=jFr/dZTjrvtPltxFwi19h2lmDyfPR2ceobKqMUf0Wll3AM5cZDfyc8i4q3X7AH2N84tuhCDNb6wxV3PE+LzNOhE0vwo37u/xN/EuNoDd6N3TJyPOnXv+Y6kuqBAo5cnoaKTlSXxM7c5K7GGMUPhSWZRQD1H+wbgaT6ZNI3n7p+w=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=narfation.org; spf=pass smtp.mailfrom=narfation.org; dkim=pass (1024-bit key) header.d=narfation.org header.i=@narfation.org header.b=OSPQWt56; arc=none smtp.client-ip=213.160.73.56
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=narfation.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=narfation.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=narfation.org header.i=@narfation.org header.b="OSPQWt56"
Received: by dvalin.narfation.org (Postfix) id 1C0A81FD5A;
	Wed, 07 Oct 2026 07:24:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=narfation.org;
	s=20121; t=1791357869;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=tEMbHhbyIhW8QfQ6FUYDsU+PwblYw5z4o/SY7zb4OIg=;
	b=OSPQWt56SzWiPiIHdb1nQ5xO25GCgU0eBrpuYcztKDDDEZVwYyKftyBe115IkrgQNkPduf
	bWU5lxDThZVvjTxG+GAZYXAjollc1OlTys5yJQfOnHthjd/hz55dQEh0abHGB8N5cXlGXW
	1QtVHQ2EEclLdrE9p/uJczWSgA0SJVU=
From: Sven Eckelmann <sven@narfation.org>
To: b.a.t.m.a.n@lists.open-mesh.org, sashiko-reviews@lists.linux.dev,
 Linus =?UTF-8?B?TMO8c3Npbmc=?= <linus.luessing@c0d3.blue>
Cc: marek.lindner@mailbox.org, sw@simonwunderlich.de, antonio@mandelbit.com
Subject:
 Re: [batadv,v14 5/5] batman-adv: avoid superfluous DAT DHT_PUT additions to
 local DAT
Date: Wed, 07 Oct 2026 09:24:23 +0200
Message-ID: <5152412.GXAFRqVoOG@sven-desktop>
In-Reply-To: <asWbc64vRQgTKt9E@sellars>
References: <asWbc64vRQgTKt9E@sellars>
Precedence: bulk
X-Mailing-List: sashiko-reviews@lists.linux.dev
List-Id: <sashiko-reviews.lists.linux.dev>
List-Subscribe: <mailto:sashiko-reviews+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:sashiko-reviews+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: multipart/signed; boundary="nextPart2015193.tdWV9SEqCh";
 micalg="pgp-sha512"; protocol="application/pgp-signature"

--nextPart2015193.tdWV9SEqCh
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset="utf-8"; protected-headers="v1"
From: Sven Eckelmann <sven@narfation.org>
Date: Wed, 07 Oct 2026 09:24:23 +0200
Message-ID: <5152412.GXAFRqVoOG@sven-desktop>
In-Reply-To: <asWbc64vRQgTKt9E@sellars>
References: <asWbc64vRQgTKt9E@sellars>
MIME-Version: 1.0

On Wednesday, 7 October 2026 03:08:03 CEST Linus L=C3=BCssing wrote:
> > - [Medium] batadv: UAPI source compatibility breakage via reserved fiel=
d rename
>=20
> I would have thought that for a field called "reserved" it would
> be clear that it'd be subject to change in the future.

To play the devils advocate: But programs would still fail when they=20
manually initialize this field to 0.

> Or should I introduce a "struct batadv_unicast_4addr_v2_packet"?

Usually, you have a couple of bytes marked as a reserved array. And then th=
ey=20
reduce the number of bytes by X and add a new field. You can discuss if thi=
s=20
is correct or not (because then suddenly the new field would no longer be=20
initialized).

But for example, in commit c07d3aede2b2 ("fscrypt: add support for hardware-
wrapped keys") or commit 38a435800945 ("habanalabs: expose device security=
=20
status using info ioctl") or 91233ad71186 ("vhost: support ASID in IOTLB=20
API"), exactly your approach was taken.

You could in theory (to make it compile in all situations), also use an=20
anonymous union around flags and reserved to ensure the byte can be accesse=
d=20
with both names.

To also support your point, please check=20
https://docs.kernel.org/dev-tools/checkuapi.html - which also considers=20
"reserved" as ok:

 95         # Common padding field names which can be expanded into
 96         # without worrying about users.

Regards,
	Sven
--nextPart2015193.tdWV9SEqCh
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: This is a digitally signed message part.
Content-Transfer-Encoding: 7Bit

-----BEGIN PGP SIGNATURE-----

iHUEABYKAB0WIQS81G/PswftH/OW8cVND3cr0xT1ywUCasXzpwAKCRBND3cr0xT1
y1l0AP9yhPxWl77/OwJTFpAy6UFrvQedoFCAuG+HysXp2Um5SQD8C4EJw40rEddj
L67A9mess7x9Lzdmk9eFsmugzeXOwwU=
=YG2O
-----END PGP SIGNATURE-----

--nextPart2015193.tdWV9SEqCh--



