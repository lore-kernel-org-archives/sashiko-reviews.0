Received: from dvalin.narfation.org (dvalin.narfation.org [213.160.73.56])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6BEFE20C029
	for <sashiko-reviews@lists.linux.dev>; Sun, 27 Sep 2026 15:43:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=213.160.73.56
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790523837; cv=none; b=Hwxw7HeEkJqrv3c1ea+VgcTh5msVyp4zQOjh2WVLAFPjIaPjlXk48M2B0bwhkEGXwsB/43ZuTCAfzOk99KLCBbRQZ5DW9Ru/u2nbAehVgJvjzQeByhAXgai0Xdr+L9hLbszD5vJU6pPh1bZ/oh/kLadbbkaaRFLE9awTN+8kJUM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790523837; c=relaxed/simple;
	bh=NAph2avTsG03FrifzX0VZIAfzJ/vmAGtxvvdy8EPXPQ=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=WEjkw5cX/MrrAwq+UH5UARiHbhc/PRXtI1gdAaePOJfVojT1V7wNsCIxozxSeI7nHcBLXqUzOEF1QjH80Eu2LtbVb6lLyauvTos1Ytj4/QOoa+zMlZZ4LgBZTyuQK7XQ34G/NCVnLQ3ZBOnO7FFonmYrXx3M10CAeKIYeCPsez0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=narfation.org; spf=pass smtp.mailfrom=narfation.org; dkim=pass (1024-bit key) header.d=narfation.org header.i=@narfation.org header.b=aKJEcirS; arc=none smtp.client-ip=213.160.73.56
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=narfation.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=narfation.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=narfation.org header.i=@narfation.org header.b="aKJEcirS"
Received: by dvalin.narfation.org (Postfix) id A5D3B202F3;
	Sun, 27 Sep 2026 15:43:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=narfation.org;
	s=20121; t=1790523833;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=2EGi2PrsTQLrG6Rc3gVCCF0hUp5QNm3KG5YxM+ef3GQ=;
	b=aKJEcirSThbv+Do8RB5wpaT+V6DFT3nmtEM8uFJDdQEmTZB8DOdG7qFe5IBG9zGVGX8b4g
	xVu7+sK4+BZlRje9WsHkcMqqDVrp7hath/Ae+/RDMEF5ESOITzZNbbpPGXoRZ8J6UhUzyb
	bXaLPXaG2BiUMdkPV8AfE5L8rccLCX4=
From: Sven Eckelmann <sven@narfation.org>
To: sashiko-reviews@lists.linux.dev
Cc: antonio@mandelbit.com, marek.lindner@mailbox.org, sw@simonwunderlich.de
Subject:
 Re: [PATCH batadv 2/2] batman-adv: tt: queue local DEL event before marking
 entry as pending
Date: Sun, 27 Sep 2026 17:43:48 +0200
Message-ID: <3028159.mvXUDI8C0e@sven-desktop>
In-Reply-To: <20260927154118.ED9ED1F000FF@smtp.kernel.org>
References:
 <20260927-tt-order-local_remove-v1-0-8951549e4a38@narfation.org>
 <20260927-tt-order-local_remove-v1-2-8951549e4a38@narfation.org>
 <20260927154118.ED9ED1F000FF@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: sashiko-reviews@lists.linux.dev
List-Id: <sashiko-reviews.lists.linux.dev>
List-Subscribe: <mailto:sashiko-reviews+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:sashiko-reviews+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: multipart/signed; boundary="nextPart13156350.O9o76ZdvQC";
 micalg="pgp-sha512"; protocol="application/pgp-signature"

--nextPart13156350.O9o76ZdvQC
Content-Transfer-Encoding: 7Bit
Content-Type: text/plain; charset="utf-8"; protected-headers="v1"
From: Sven Eckelmann <sven@narfation.org>
To: sashiko-reviews@lists.linux.dev
Date: Sun, 27 Sep 2026 17:43:48 +0200
Message-ID: <3028159.mvXUDI8C0e@sven-desktop>
In-Reply-To: <20260927154118.ED9ED1F000FF@smtp.kernel.org>
MIME-Version: 1.0

On Sunday, 27 September 2026 17:41:18 CEST sashiko-bot@kernel.org wrote:
> [Severity: High]
> Does this introduce a race condition in batadv_tt_local_purge_list() by
> splitting the timeout check and the state modification?
> 
> By removing the BATADV_TT_CLIENT_PENDING assignment from within the
> flags_lock scoped_guard (just above this snippet), the lock is now dropped
> before batadv_tt_local_set_pending() is called.
> 
> If a concurrent batadv_tt_local_add_existing() updates the client in this
> window:
> 
> CPU1: batadv_tt_local_purge_list()
>     checks !batadv_has_timed_out()
>     leaves scoped_guard, dropping flags_lock
> 
> CPU2: batadv_tt_local_add_existing()
>     updates last_seen
>     skips queuing an ADD event (since PENDING is not yet set)
> 
> CPU1: batadv_tt_local_set_pending()
>     queues DEL event
>     acquires flags_lock
>     sets PENDING
> 
> Could this sequence override the client refresh without an opposing ADD
> event to cancel it out, wrongfully dropping an active routing table entry?

Ok, whenever you touch the TT code, it starts to burn. I should stop trying to 
fix anything in it.

Regards,
	Sven
--nextPart13156350.O9o76ZdvQC
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: This is a digitally signed message part.
Content-Transfer-Encoding: 7Bit

-----BEGIN PGP SIGNATURE-----

iHUEABYKAB0WIQS81G/PswftH/OW8cVND3cr0xT1ywUCark5tAAKCRBND3cr0xT1
ywb3AQDpzLqGMmgg8V8kNWSRuvG1XS0bcFcPdlo2A7z/JJqbGwD+M0BwYStpKdfB
uNpbdVQ1bLBo9tWarW8fgz/rPgVXqgg=
=ePXu
-----END PGP SIGNATURE-----

--nextPart13156350.O9o76ZdvQC--



