Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=213.160.73.56
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794480692;
	b=Muda7RGbThPKxYod0Vw9aAMaBFqa8CBq6Wy0mDtixQazeN2euDf9Kv7wpK8Cn6nbAX33
	 Sjc91cF9rEjTwh94ciXpJ93LADLNREwMsaT0oHG8PzO987R9dKGjCysfyhYfgbPSzdeDr
	 772oCY5kizuw8VbQA9Qxb1RviP6HOvFT1o1H9HtBUt9/ozQ5NaYcBexE9w5yqQ6uYe9yB
	 sqyyncJdBHzVpjrcir3uZqRpYh96LBKg/cFOLsauUaRzvHtoZhU3Ls3X7G+/QhXj3C+4Q
	 O8EqvopARlq25iF4b4hj1R63+XDKiI53fPQqupb/+ecwuI4d38+WjL0dE8IqmJSpbcA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794480692;
	h=DMARC-Filter:Received:DKIM-Signature:From:To:Cc:Subject:Date:
	 Message-ID:In-Reply-To:References:MIME-Version:Content-Type;
	bh=b0YkkUkTc9PH+xqrT4wajupAfgQd3w/GI4Z4XjgTeyg=;
	b=bZVnlDlmdbsq0fxxWXYiKMTZZR0b21WA9yUCtV+LspD0FBGe3EEwPmUxdjiN3SDLYeOF
	 nurjzwcXBzaqYkRb0C5FS9N8tnTyC6OtMZpudB6K+EK5QPLo6LSmdXlS5TRClUaLKEj7g
	 qB/1yP78VvYfsBJGVlEZ0s+ot5nVhUKn4e5AUq8Z/wAbh//WvirhhbeZXrewpBeylcIqL
	 0obHJYwpd72pmzh3/8yFjFljo5BR4lWp5/RDcNxQa3LtFIITLlYWN94l19kvrxRW41XI0
	 8nw9+nOCkE/DIz3c2Zd6tbzx9e8ZCALtxnhTcAdJeGOu6Ik1hjVilYqTRsnugdE1ZqQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=narfation.org;
	spf=pass smtp.mailfrom=narfation.org;
	dkim=pass header.d=narfation.org header.i=@narfation.org header.a=rsa-sha256 header.s=20121 header.b=0lph47cg;
	arc=none smtp.remote-ip=213.160.73.56
Received: from dvalin.narfation.org (dvalin.narfation.org [213.160.73.56])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9530B606A336
	for <sashiko-reviews@lists.linux.dev>; Thu, 12 Nov 2026 10:51:31 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 9530B606A336
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=narfation.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=narfation.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key, unprotected) header.d=narfation.org header.i=@narfation.org header.a=rsa-sha256 header.s=20121 header.b=0lph47cg
Received: by dvalin.narfation.org (Postfix) id 5331B200DB;
	Thu, 12 Nov 2026 10:51:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=narfation.org;
	s=20121; t=1794480683;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=b0YkkUkTc9PH+xqrT4wajupAfgQd3w/GI4Z4XjgTeyg=;
	b=0lph47cgAHnXCV3Xxda81oolk15KV3zv5KKasXweJDZu7appYHnC0beX8oZM3Y7t4as6x6
	nENja9chtphZssAT0Go6mwMqLPYS8AQsymwcJBqw7x0/TVV0SruCOpnmgKaBZWx74yKYrE
	YNuY+aaAqXCLiL/exgNh9swodflDdMg=
From: Sven Eckelmann <sven@narfation.org>
To: Simon Wunderlich <sw@simonwunderlich.de>, sashiko-reviews@lists.linux.dev
Cc: marek.lindner@mailbox.org, antonio@mandelbit.com
Subject:
 Re: [PATCH net-next 08/15] batman-adv: tt: annotate last_seen with
 READ/WRITE_ONCE
Date: Thu, 12 Nov 2026 11:51:16 +0100
Message-ID: <3409398.AJdgDx1Vlc@ripper>
In-Reply-To: <sashiko-outbox-210958@kernel.org>
References:
 <20261111102729.2096241-1-sw@simonwunderlich.de>
 <20261111102729.2096241-9-sw@simonwunderlich.de>
 <sashiko-outbox-210958@kernel.org>
X-Mailing-List: sashiko-reviews@lists.linux.dev
List-Id: <sashiko-reviews.lists.linux.dev>
List-Post: <mailto:sashiko-reviews@lists.linux.dev>
List-Help: <mailto:sashiko-reviews+help@lists.linux.dev>
List-Subscribe: <mailto:sashiko-reviews+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:sashiko-reviews+unsubscribe@lists.linux.dev>
List-Owner: <mailto:sashiko-reviews+owner@lists.linux.dev>
Precedence: list
MIME-Version: 1.0
Content-Type: multipart/signed; boundary="nextPart3435441.oiGErgHkdL";
 micalg="pgp-sha512"; protocol="application/pgp-signature"

--nextPart3435441.oiGErgHkdL
Content-Transfer-Encoding: 7Bit
Content-Type: text/plain; charset="utf-8"; protected-headers="v1"
From: Sven Eckelmann <sven@narfation.org>
Cc: marek.lindner@mailbox.org, antonio@mandelbit.com
Date: Thu, 12 Nov 2026 11:51:16 +0100
Message-ID: <3409398.AJdgDx1Vlc@ripper>
In-Reply-To: <sashiko-outbox-210958@kernel.org>
MIME-Version: 1.0

On Thursday, 12 November 2026 11:34:43 CET sashiko-bot@kernel.org wrote:
[...]
> [Severity: High]
> This problem wasn't introduced by this patch, but can dropping
> common->flags_lock in batadv_tt_local_add_existing() before queueing the
> ADD event [1] let a delayed ADD cancel a concurrent DEL event?
> 
> batadv_tt_local_add_existing() clears BATADV_TT_CLIENT_PENDING under
> common->flags_lock, and its caller batadv_tt_local_add() only queues the
> corresponding ADD event via batadv_tt_local_event() after the lock has
> been released:

This is handled by a pending patchset [1] which couldn't be submitted here 
because were have so many other things to fix in the TT code and already fill 
our submission up to the max of 15 patchset since a while.

And it is completely irrelevant for the submitted patchset.

Regards,
	Sven

[1] https://git.open-mesh.org/pub/ecsv/batman-adv.git/log/?h=b4/tt-avoid-unhashed-event

--nextPart3435441.oiGErgHkdL
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: This is a digitally signed message part.
Content-Transfer-Encoding: 7Bit

-----BEGIN PGP SIGNATURE-----

iHUEABYKAB0WIQS81G/PswftH/OW8cVND3cr0xT1ywUCavWaJAAKCRBND3cr0xT1
y8KHAP9Rab5iZ7PdMiN5y3pxvZ2bV/v8XxWdIMH288yJs7hwvwEAqAtiqO0668ZV
9rkNeKkoTj/Mbsbi1WmuHTX3kKQx5go=
=3KLn
-----END PGP SIGNATURE-----

--nextPart3435441.oiGErgHkdL--



