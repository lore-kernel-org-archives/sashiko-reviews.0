Received: from dvalin.narfation.org (dvalin.narfation.org [213.160.73.56])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D7508411665
	for <sashiko-reviews@lists.linux.dev>; Tue,  1 Sep 2026 16:52:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=213.160.73.56
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788281527; cv=none; b=tsGrNwpt7apcLDUKk+I3QGStbsFBsvHgIlYR8FyhUAy3uuZt6aDnT2Ze0sP/I8tquQOQNjk4gct3mCSxiS+8zKKgqPH8i0nCMiHk/FsHoWO8ZnwzakfH6GKucAJEX11ZvDGWYVEuLTZ7T3l6vpr0mCdqIlqvucHHzHxjQNQtTU4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788281527; c=relaxed/simple;
	bh=T5R6uyPC3GslaIlh2I0cFbWLVd46LJLugcn+MOSbtzM=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=tlnGTSPH8BjSirgmEYc/4elK/R9fFGpyGIInXBs7gJ9UFUs/C5nSlx257mUk8a6OIARImk/uV4wWIuS7GoUV1a2XjCvg/e+J728Rihpj93R/z1FrwTZ57yewUEeZJT1Na69i+MXYoQfACZylM9x5OKfoy4OdDUCXaBCdkmGYL64=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=narfation.org; spf=pass smtp.mailfrom=narfation.org; dkim=pass (1024-bit key) header.d=narfation.org header.i=@narfation.org header.b=CTFhD/Hc; arc=none smtp.client-ip=213.160.73.56
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=narfation.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=narfation.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=narfation.org header.i=@narfation.org header.b="CTFhD/Hc"
Received: by dvalin.narfation.org (Postfix) id D19782043A;
	Tue, 01 Sep 2026 16:51:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=narfation.org;
	s=20121; t=1788281519;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=Dj4gOZv6SnIr/vDPMRpTmgWKsOqgRXoLZdDPxY4ltc0=;
	b=CTFhD/HcVQERbJS2wFg/baqawGffX6BBStdOqVgU4BrBNuv0gOBD38cUR3bSeBLmvtZies
	Tf39hDnIPcI0EVYpQKuth+s9yeZ1GeyyU/fzu813iBY7N3qpUg9exAs5NgoysnEp5ba1eO
	7enuetM2gDOv8DAI3SjJ+038fP1BUfg=
From: Sven Eckelmann <sven@narfation.org>
To: sashiko-reviews@lists.linux.dev
Cc: marek.lindner@mailbox.org, sw@simonwunderlich.de, antonio@mandelbit.com
Subject:
 Re: [PATCH net-next 09/15] batman-adv: tt: extract code handling a roam on
 add
Date: Tue, 01 Sep 2026 18:51:57 +0200
Message-ID: <5104837.GXAFRqVoOG@sven-desktop>
In-Reply-To: <20260901140002.533041F000E9@smtp.kernel.org>
References:
 <20260831135117.574836-1-sw@simonwunderlich.de>
 <20260831135117.574836-10-sw@simonwunderlich.de>
 <20260901140002.533041F000E9@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: sashiko-reviews@lists.linux.dev
List-Id: <sashiko-reviews.lists.linux.dev>
List-Subscribe: <mailto:sashiko-reviews+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:sashiko-reviews+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: multipart/signed; boundary="nextPart1973005.tdWV9SEqCh";
 micalg="pgp-sha512"; protocol="application/pgp-signature"

--nextPart1973005.tdWV9SEqCh
Content-Transfer-Encoding: 7Bit
Content-Type: text/plain; charset="utf-8"; protected-headers="v1"
From: Sven Eckelmann <sven@narfation.org>
To: sashiko-reviews@lists.linux.dev
Date: Tue, 01 Sep 2026 18:51:57 +0200
Message-ID: <5104837.GXAFRqVoOG@sven-desktop>
In-Reply-To: <20260901140002.533041F000E9@smtp.kernel.org>
MIME-Version: 1.0

On Tuesday, 1 September 2026 16:00:01 CEST sashiko-bot@kernel.org wrote:
[...]
> [Severity: High]
> This is a pre-existing issue, but I'm wondering if the handling of pending
> and roamed clients in batadv_tt_local_add() might have a logical flaw that
> persists here.
> 
> When batadv_tt_local_remove() is called with roaming=true for a fully
> synced client, it sets both BATADV_TT_CLIENT_ROAM and
> BATADV_TT_CLIENT_PENDING.
> 
> If the client roams back before the entry is purged, calling
> batadv_tt_local_add(), it hits this earlier code path:
> 
>     if (tt_local->common.flags & BATADV_TT_CLIENT_PENDING) {
>         ...
>         tt_local->common.flags &= ~BATADV_TT_CLIENT_PENDING;
>         spin_unlock_bh(&tt_local->common.flags_lock);
> 
>         goto add_event;
>     }
> 
>     if (tt_local->common.flags & BATADV_TT_CLIENT_ROAM) {
>         ...
>         tt_local->common.flags &= ~BATADV_TT_CLIENT_ROAM;
>         roamed_back = true;
>     }
> 
> Because of the goto add_event, it bypasses the BATADV_TT_CLIENT_ROAM
> check entirely, skipping roamed_back = true. It then proceeds from
> add_event into check_roaming, where batadv_tt_local_add_roam() is
> called with roamed_back == false.
> 
> Can this result in the local TT entry remaining incorrectly marked with
> BATADV_TT_CLIENT_ROAM, causing packets destined for the returned client to
> be misrouted or dropped?
> 
> Does this also cause the global roaming state to be incorrectly preserved
> instead of being properly canceled?
> 
> 

Out of scope for this patch. Documented it for interested contributors in 
https://www.open-mesh.org/issues/472

Regards,
	Sven
--nextPart1973005.tdWV9SEqCh
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: This is a digitally signed message part.
Content-Transfer-Encoding: 7Bit

-----BEGIN PGP SIGNATURE-----

iHUEABYKAB0WIQS81G/PswftH/OW8cVND3cr0xT1ywUCapcCrQAKCRBND3cr0xT1
yw1aAP4kMsL7jDK3eo+sqhnJZfA2WyV7pH3NY6rJDcY/FsTUuAEAqjiNuBFVsFHu
cno3AwXCiRjI69IYlryvv1fRdHuZrwI=
=TPzU
-----END PGP SIGNATURE-----

--nextPart1973005.tdWV9SEqCh--



