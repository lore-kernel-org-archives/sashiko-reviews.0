Received: from dvalin.narfation.org (dvalin.narfation.org [213.160.73.56])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 500A0431A5C
	for <sashiko-reviews@lists.linux.dev>; Tue,  1 Sep 2026 16:55:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=213.160.73.56
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788281730; cv=none; b=VJ53q2El3PKIYEvy3FoP5oEz38dTKkU/vYFtmhgFnKnXx1JKLSLiyYo6HLNyG18L+LHVJda86G6LV+/zIIy/cqktabYUZ4yRcbmTX598Gni3eEEiJYY2bieSLJvN5in97cBygTQw2BFF+i0/a+tqLFzptxqexxmVWRXJDBFQi9E=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788281730; c=relaxed/simple;
	bh=Puw4NiijiqFTDwQyVLMSHplf7x1FaXbLBGjtt2B6Gfk=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=PIDXgcbLRnF7GewbQoT14TCqrdGID5UDE3/zZ3m/NfBSn165z6wTLrLl/H5fUZC7BtxDkYqLImJ0OswTcRQmMnMKbqcF4ZwexICob7bb/u1SJAh2Kfn07y1JtYu8lUY+Q6cpdBZZdSyI2wWWYKnU/wi7x5ZciKV88eqPtyaWFvc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=narfation.org; spf=pass smtp.mailfrom=narfation.org; dkim=pass (1024-bit key) header.d=narfation.org header.i=@narfation.org header.b=YWSzN9xm; arc=none smtp.client-ip=213.160.73.56
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=narfation.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=narfation.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=narfation.org header.i=@narfation.org header.b="YWSzN9xm"
Received: by dvalin.narfation.org (Postfix) id 5DC6720396;
	Tue, 01 Sep 2026 16:55:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=narfation.org;
	s=20121; t=1788281723;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=osIqNQ6lRIzcJuzlbVERFwKGzjODYGDMijXzvFh71bs=;
	b=YWSzN9xmO1yBulDlXfVaashzkpZ9NRlQI2VG5W89ZhurecoRnumxWH+Vb+vzWxxNr+ncOG
	QvJ0vc33x6GTh50NQ7ylEFdLnj5mdNRnvtzxgcYZUwvnFiPr2IGVxtMpNFEwMqlwsy74dX
	CYgH85IDtxN2EQJFADm/qbzDMDaOyBo=
From: Sven Eckelmann <sven@narfation.org>
To: sashiko-reviews@lists.linux.dev
Cc: antonio@mandelbit.com, marek.lindner@mailbox.org, sw@simonwunderlich.de
Subject:
 Re: [PATCH net-next 12/15] batman-adv: tt: use protected flag modifications
Date: Tue, 01 Sep 2026 18:55:20 +0200
Message-ID: <3066909.e9J7NaK4W3@sven-desktop>
In-Reply-To: <20260901140003.62B041F000E9@smtp.kernel.org>
References:
 <20260831135117.574836-1-sw@simonwunderlich.de>
 <20260831135117.574836-13-sw@simonwunderlich.de>
 <20260901140003.62B041F000E9@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: sashiko-reviews@lists.linux.dev
List-Id: <sashiko-reviews.lists.linux.dev>
List-Subscribe: <mailto:sashiko-reviews+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:sashiko-reviews+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: multipart/signed; boundary="nextPart3435845.aeNJFYEL58";
 micalg="pgp-sha512"; protocol="application/pgp-signature"

--nextPart3435845.aeNJFYEL58
Content-Transfer-Encoding: 7Bit
Content-Type: text/plain; charset="utf-8"; protected-headers="v1"
From: Sven Eckelmann <sven@narfation.org>
To: sashiko-reviews@lists.linux.dev
Date: Tue, 01 Sep 2026 18:55:20 +0200
Message-ID: <3066909.e9J7NaK4W3@sven-desktop>
In-Reply-To: <20260901140003.62B041F000E9@smtp.kernel.org>
MIME-Version: 1.0

On Tuesday, 1 September 2026 16:00:02 CEST sashiko-bot@kernel.org wrote:
[...]
> > @@ -1351,10 +1391,17 @@ u16 batadv_tt_local_remove(struct batadv_priv *bat_priv, const u8 *addr,
> >  	}
> >  
> >  	if (!(tt_local_entry->common.flags & BATADV_TT_CLIENT_NEW)) {
> > -		batadv_tt_local_set_pending(bat_priv, tt_local_entry, flags,
> > -					    message);
> > +		tt_local_entry->common.flags |= BATADV_TT_CLIENT_PENDING;
> > +		pending = true;
> > +	}
> > +	spin_unlock_bh(&tt_local_entry->common.flags_lock);
> > +
> > +	if (pending) {
> > +		batadv_tt_local_set_pending_event(bat_priv, tt_local_entry, flags,
> > +						  message);
> 
> [Severity: High]
> Does detaching the DEL event emission from the flag update create a
> split-brain routing state?
> 
> By setting the BATADV_TT_CLIENT_PENDING flag under the flags_lock but
> delaying the emission of the DEL event (via
> batadv_tt_local_set_pending_event) until after the lock is released,
> there is a window where concurrent operations can interleave.
> 
> If a concurrent batadv_tt_local_add() executes within this window, it
> will clear the PENDING flag and queue an ADD event:
> 
> CPU1: batadv_tt_local_remove()
>     tt_local_entry->common.flags |= BATADV_TT_CLIENT_PENDING;
>     spin_unlock_bh(&tt_local_entry->common.flags_lock);
>     // Preempted
> 
> CPU2: batadv_tt_local_add()
>     tt_local->common.flags &= ~BATADV_TT_CLIENT_PENDING;
>     spin_unlock_bh(&tt_local->common.flags_lock);
>     batadv_tt_local_event(bat_priv, tt_local, BATADV_NO_FLAGS); // Queues ADD
> 
> If the OGM worker runs now, it broadcasts the ADD.
> 
> CPU1: batadv_tt_local_remove() (resumes)
>     batadv_tt_local_set_pending_event(..., BATADV_TT_CLIENT_DEL, ...);
> 
> The next OGM broadcasts the DEL event. The local node considers the MAC
> active (because PENDING was cleared), but the rest of the mesh drops it
> due to the DEL event, leading to persistent split-brain routing.

This is not how TT works. The events are a best effort in informing other 
originators. But it is not the source of all truth.

And this is not changed by this patch.

> > @@ -1394,21 +1441,37 @@ static void batadv_tt_local_purge_list(struct batadv_priv *bat_priv,
[...]
> > -		batadv_tt_local_set_pending(bat_priv, tt_local_entry,
> > -					    BATADV_TT_CLIENT_DEL, "timed out");
> > +		batadv_tt_local_set_pending_event(bat_priv, tt_local_entry,
> > +						  BATADV_TT_CLIENT_DEL, "timed out");
> 
> [Severity: High]
> Can this sequence similarly cause a split-brain state?
> 
> Like in batadv_tt_local_remove(), this delays the DEL event emission
> until after the lock is dropped. A concurrent batadv_tt_local_add()
> could interleave during this window, resulting in the local node
> keeping the entry active while the rest of the mesh removes it.

This is not how TT works. The events are a best effort in informing other 
originators. But it is not the source of all truth.

And this is not changed by this patch.

Regards,
	Sven
--nextPart3435845.aeNJFYEL58
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: This is a digitally signed message part.
Content-Transfer-Encoding: 7Bit

-----BEGIN PGP SIGNATURE-----

iHUEABYKAB0WIQS81G/PswftH/OW8cVND3cr0xT1ywUCapcDeAAKCRBND3cr0xT1
yzzuAQD/QUzeoJzr3UK8s4lToPK9ArxOQQcBQv3cv/1zmOAoIgEA1jLmRgMZovhC
WlQDVxEQAcv0Vu91moEWxpKUaObRdwc=
=lCpE
-----END PGP SIGNATURE-----

--nextPart3435845.aeNJFYEL58--



