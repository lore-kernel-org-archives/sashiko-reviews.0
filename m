Received: from dvalin.narfation.org (dvalin.narfation.org [213.160.73.56])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 34973481A9E
	for <sashiko-reviews@lists.linux.dev>; Tue,  1 Sep 2026 16:49:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=213.160.73.56
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788281345; cv=none; b=I1HAjllGZtp5QD1mTPBg4yoksVbfxPgYPnYZz5aJuFjXZLIhLqMhNEp1jJFVZJjOa//EW9W6rKh3odIk0wzPT0ICpSOBAzslmnN9AhIqd3/trplPRnLsIHDJmXV+ZYgvOKXBPVsgem7/jPIJOLyptWE4Qo3ZCrBIDWDGJALWseg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788281345; c=relaxed/simple;
	bh=3pET8AvO2paiPCXNTw/i9NcybQ6/37PgyrUoUmnAoII=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=Igx+/BCEDztNpOHOlot+vthf7nyVCHVs/X4zSZI/8KYuqxfKVgI2PVaL9Wk/BqcC28V9ZtjFbbTVBW3a15E8+xdyQLfLLdELW5BGDPMR/dW0hdbM+TPX5RNoxpcL0F/9Ogv5MH0ovakhqLlJL7jaDP0Nfn2R6FrSPRwLXPsm17w=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=narfation.org; spf=pass smtp.mailfrom=narfation.org; dkim=pass (1024-bit key) header.d=narfation.org header.i=@narfation.org header.b=luz1sPv1; arc=none smtp.client-ip=213.160.73.56
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=narfation.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=narfation.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=narfation.org header.i=@narfation.org header.b="luz1sPv1"
Received: by dvalin.narfation.org (Postfix) id 7D0632043A;
	Tue, 01 Sep 2026 16:48:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=narfation.org;
	s=20121; t=1788281337;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=KoqnUan3PVaRYi/m3MLLv90OX42B7DuwM0OJydpfuic=;
	b=luz1sPv1fkGKDKUHE2ty+gIMdtgH0ez0MSV79eq7uyJx09f+RzgiwkWBpm47ggGtMzrnLD
	E2Vb6ooAhxiPUhx6rMmiOjeJQ49iMLE2bsC29oVNmy6ZdHXjytOwQcO+klX4U6JY65H6nh
	+xCkIhMf/h5dq7S4Fb+l9HlBHqxx4Rk=
From: Sven Eckelmann <sven@narfation.org>
To: sashiko-reviews@lists.linux.dev
Cc: sw@simonwunderlich.de, antonio@mandelbit.com, marek.lindner@mailbox.org
Subject:
 Re: [PATCH net-next 08/15] batman-adv: tt: remove only the entry which was
 looked up from the hash
Date: Tue, 01 Sep 2026 18:48:54 +0200
Message-ID: <6306783.lOV4Wx5bFT@sven-desktop>
In-Reply-To: <20260901140001.59CD41F000E9@smtp.kernel.org>
References:
 <20260831135117.574836-1-sw@simonwunderlich.de>
 <20260831135117.574836-9-sw@simonwunderlich.de>
 <20260901140001.59CD41F000E9@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: sashiko-reviews@lists.linux.dev
List-Id: <sashiko-reviews.lists.linux.dev>
List-Subscribe: <mailto:sashiko-reviews+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:sashiko-reviews+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: multipart/signed; boundary="nextPart5134033.31r3eYUQgx";
 micalg="pgp-sha512"; protocol="application/pgp-signature"

--nextPart5134033.31r3eYUQgx
Content-Transfer-Encoding: 7Bit
Content-Type: text/plain; charset="utf-8"; protected-headers="v1"
From: Sven Eckelmann <sven@narfation.org>
To: sashiko-reviews@lists.linux.dev
Date: Tue, 01 Sep 2026 18:48:54 +0200
Message-ID: <6306783.lOV4Wx5bFT@sven-desktop>
In-Reply-To: <20260901140001.59CD41F000E9@smtp.kernel.org>
MIME-Version: 1.0

On Tuesday, 1 September 2026 16:00:00 CEST sashiko-bot@kernel.org wrote:
[...]
> [Severity: High]
> This isn't a bug introduced by this patch, but doesn't this exact same
> vulnerability still exist in the Bridge Loop Avoidance (BLA) subsystem's
> batadv_bla_del_claim() in net/batman-adv/bridge_loop_avoidance.c?


Out of scope. And it is missing the completely different promises by this 
function. It would make the code a little bit cleaner but it is definitely 
nothing missing it this patch. A ticket for a potential improvement can be 
found in https://www.open-mesh.org/issues/471.

Regards,
	Sven
--nextPart5134033.31r3eYUQgx
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: This is a digitally signed message part.
Content-Transfer-Encoding: 7Bit

-----BEGIN PGP SIGNATURE-----

iHUEABYKAB0WIQS81G/PswftH/OW8cVND3cr0xT1ywUCapcB9gAKCRBND3cr0xT1
y6BrAP9f/fYMyYaks458NQOJfkrOibdaNqAGjQf+hT1MxzJJYQEA71TkjAkTxEso
O0R87/YrrEVUgEcsCqR1n3H7WTzq/wg=
=aBLz
-----END PGP SIGNATURE-----

--nextPart5134033.31r3eYUQgx--



