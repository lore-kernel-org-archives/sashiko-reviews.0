Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=213.160.73.56
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794735474;
	b=47SbCF7v19rxWSkaMYpbCFrsy9/z5U6oaNCs3ilJa2q4bsVSthVgPfnKSjWX2YdZzCb1
	 4PunQ/PeEj42J53rLaLqjxt9XJO/aBiAGvcPPkxJqgwDsbi+Tr8K28UafFVx8g0JnOCMM
	 znAinJeLcIzuSOehrfaTG21RFQonoQkWuGw6gb5329lNo6qfsRLPS1fxRbrNyDJysSGEL
	 eAWjRlENxmcLoOMpwvvufDtq8zMh/seH4jgohRbmsIZZu7bfS8r/kJRR8Y2SXDrhSgylS
	 70g00dClyXDemdxmsGHtSy/TcC8WbyvAnxxrXbZNXO1D9sO8XuRdOeeYK9B2LrMw52Q==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794735474;
	h=DMARC-Filter:Received:DKIM-Signature:From:To:Cc:Subject:Date:
	 Message-ID:In-Reply-To:References:MIME-Version:Content-Type;
	bh=wwmpXvyRTyVJUt+RqQWfGJPUrlqMaIfW3WE9yDFdAx4=;
	b=aC+mFbPltbX/bL8D71XqaYoXpJJvqp0gdDoM+5OVJ1GgwF3Zy7jaVI6Gw4ZaYPSmTs9I
	 GUhcPCUOIaZDxnVw9v0A08BavBj1UeueqxeahCBHUm5UljLQGsQ4fMKrPR/OME7JW+LSg
	 jxjKsYthldkyi7CXfeOe7uXmPtFXgnaYk0qoofAaftiqDqmfnJw3z5kyEwvt5QlY6Kkg2
	 wUHcrYnHJ8IsiaEYmBEEde5tHevldDKN591MpX0cR8g0Jr2sLQkvQ5WPyaxPuFJmXTV0d
	 7pl7rSe5JHDSC+zwAMH0JTpMMUv2rT4c+Qe6EfgaSSp4fzJbUcsLmIsP85FAPBmhnwg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=narfation.org;
	spf=pass smtp.mailfrom=narfation.org;
	dkim=pass header.d=narfation.org header.i=@narfation.org header.a=rsa-sha256 header.s=20121 header.b="ti/mgU+I";
	arc=none smtp.remote-ip=213.160.73.56
Received: from dvalin.narfation.org (dvalin.narfation.org [213.160.73.56])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4E5EB606A31D
	for <sashiko-reviews@lists.linux.dev>; Sun, 15 Nov 2026 09:37:54 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 4E5EB606A31D
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=narfation.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=narfation.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=narfation.org header.i=@narfation.org header.a=rsa-sha256 header.s=20121 header.b=ti/mgU+I
Received: by dvalin.narfation.org (Postfix) id D0E681FDCB;
	Sun, 15 Nov 2026 09:37:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=narfation.org;
	s=20121; t=1794735467;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=wwmpXvyRTyVJUt+RqQWfGJPUrlqMaIfW3WE9yDFdAx4=;
	b=ti/mgU+I2rgdcQk1OnSy+Xef2JsFl2ybsKWDeMwV+E0hKr0qEXH5lRsFeGYkOiiw9gOkzl
	DvlOqjkVgKxaVP0jodRleBp0lu7OfE3WqiYdSdlS7RHE1sCEo+kRITZrtYyQl4ExcazFbW
	5A1z5tgMu5GE7RWhZ7nBEDEFw6C4V4s=
From: Sven Eckelmann <sven@narfation.org>
To: Simon Wunderlich <sw@simonwunderlich.de>, sashiko-reviews@lists.linux.dev
Cc: marek.lindner@mailbox.org, antonio@mandelbit.com, netdev@vger.kernel.org,
 b.a.t.m.a.n@lists.open-mesh.org
Subject:
 Re: [PATCH net-next 02/15] batman-adv: bla: use dedicated key type for
 backbone gateway hash
Date: Sun, 15 Nov 2026 10:37:39 +0100
Message-ID: <13009955.O9o76ZdvQC@sven-desktop>
In-Reply-To: <sashiko-outbox-215348@kernel.org>
References:
 <20261114091556.3336038-1-sw@simonwunderlich.de>
 <20261114091556.3336038-3-sw@simonwunderlich.de>
 <sashiko-outbox-215348@kernel.org>
X-Mailing-List: sashiko-reviews@lists.linux.dev
List-Id: <sashiko-reviews.lists.linux.dev>
List-Post: <mailto:sashiko-reviews@lists.linux.dev>
List-Help: <mailto:sashiko-reviews+help@lists.linux.dev>
List-Subscribe: <mailto:sashiko-reviews+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:sashiko-reviews+unsubscribe@lists.linux.dev>
List-Owner: <mailto:sashiko-reviews+owner@lists.linux.dev>
Precedence: list
MIME-Version: 1.0
Content-Type: multipart/signed; boundary="nextPart6047506.DvuYhMxLoT";
 micalg="pgp-sha512"; protocol="application/pgp-signature"

--nextPart6047506.DvuYhMxLoT
Content-Transfer-Encoding: 7Bit
Content-Type: text/plain; charset="utf-8"; protected-headers="v1"
From: Sven Eckelmann <sven@narfation.org>
Date: Sun, 15 Nov 2026 10:37:39 +0100
Message-ID: <13009955.O9o76ZdvQC@sven-desktop>
In-Reply-To: <sashiko-outbox-215348@kernel.org>
MIME-Version: 1.0

On Sunday, 15 November 2026 10:24:42 CET sashiko-bot@kernel.org wrote:
[...]
> [Severity: Medium]
> This problem wasn't introduced by this patch, but should
> batadv_bla_purge_backbone_gw() and batadv_bla_del_backbone_claims()
> [1] increment hash->generation when removing entries with
> hlist_del_rcu()?
> 
> Netlink dumps such as batadv_bla_backbone_dump() and
> batadv_bla_claim_dump() set cb->seq from atomic_read(&hash->generation) and
> rely on genl_dump_check_consistent() to flag concurrent table changes with
> NLM_F_DUMP_INTR.  Because these bulk deletions (as well as
> __batadv_dat_purge() and batadv_purge_orig_ref()) unlink entries directly
> without bumping hash->generation, a concurrent netlink dump can miss
> NLM_F_DUMP_INTR and return an inconsistent snapshot to userspace.

This is done in the "increase hash generation when purging entries" patches in 
this series.

And it is absolutely unrelated to this patch.

Regards,
	Sven
--nextPart6047506.DvuYhMxLoT
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: This is a digitally signed message part.
Content-Transfer-Encoding: 7Bit

-----BEGIN PGP SIGNATURE-----

iHUEABYKAB0WIQS81G/PswftH/OW8cVND3cr0xT1ywUCavl9YwAKCRBND3cr0xT1
yyY4AQCqj6pW6rJ265sQV3f8auxGfvDlUuerS5OMIji8HgG76QEA7hVNDYG02lCD
WQlSSI2FSAkxM1Od6pw/IX65AhH3pA0=
=eLP7
-----END PGP SIGNATURE-----

--nextPart6047506.DvuYhMxLoT--



