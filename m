Received: from dvalin.narfation.org (dvalin.narfation.org [213.160.73.56])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 005BD4D8DB8
	for <sashiko-reviews@lists.linux.dev>; Thu,  8 Oct 2026 15:13:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=213.160.73.56
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791472437; cv=none; b=TyjQAn8NAqrvS61QMQ/+rvkGOlbzO7Axq8hDH74aYRbcGmma5/mCdgvWbsTgO1zSklWzp84aqtQQr1QOTjFZDl2nrTO2aubuloOfRdVoPeXIOZNa0K227cRYrHpvd0RkIMUa3dM2wn7fOoJIyP9IA1+uLPh2hGnaGDw3wxhBUvE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791472437; c=relaxed/simple;
	bh=dOY0Y18nMCwfoZHDoHM/dIe8og8xf0/IT8gpWup5aIY=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=MnsYy3xFzGA8VW6ZIEiIZEUqV8PBU2bnxr1AAvkBwMs3ZNzrRr7VVovHJ5XrcZDwc2a8mIRj+ed/r6lHbqBZJvXiGLYg5icp3d96mk4IjShV147wc/OpAkUQdZDoQlg6DkBGtVlfPZNO9OAYwAflDIqA2jnl6PdmSSQVTbQtQK8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=narfation.org; spf=pass smtp.mailfrom=narfation.org; dkim=pass (1024-bit key) header.d=narfation.org header.i=@narfation.org header.b=JyPLHH/F; arc=none smtp.client-ip=213.160.73.56
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=narfation.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=narfation.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=narfation.org header.i=@narfation.org header.b="JyPLHH/F"
Received: by dvalin.narfation.org (Postfix) id E6CB92049B;
	Thu, 08 Oct 2026 15:13:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=narfation.org;
	s=20121; t=1791472429;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=9zqyAUXTCmHML//7dA6W07y4wqyOLiR+6T722Jgzub0=;
	b=JyPLHH/F+p+d4sirSq2cHJUF3/UwIJV5B23disprnHE8RxrsZcK1lUMgPrsnDjDdFcKl77
	QlDpIxlrogbVPR6UMXfhXUkJuk57uPhTWv96B9vfz1dxa9sI2duO2S8NnFkqdCfO4qZ+FK
	FkBd1ynXofAQi2uExM+oePzTV6VVnTw=
From: Sven Eckelmann <sven@narfation.org>
To: sashiko-reviews@lists.linux.dev
Cc: sw@simonwunderlich.de, antonio@mandelbit.com, marek.lindner@mailbox.org,
 b.a.t.m.a.n@lists.open-mesh.org
Subject:
 Re: [PATCH batadv v2 6/8] batman-adv: tt: don't queue local events for
 unhashed entries
Date: Thu, 08 Oct 2026 17:13:45 +0200
Message-ID: <5334040.31r3eYUQgx@sven-desktop>
In-Reply-To: <sashiko-outbox-164327@kernel.org>
References:
 <20261008-tt-avoid-unhashed-event-v2-0-7c4eed81606d@narfation.org>
 <20261008-tt-avoid-unhashed-event-v2-6-7c4eed81606d@narfation.org>
 <sashiko-outbox-164327@kernel.org>
Precedence: bulk
X-Mailing-List: sashiko-reviews@lists.linux.dev
List-Id: <sashiko-reviews.lists.linux.dev>
List-Subscribe: <mailto:sashiko-reviews+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:sashiko-reviews+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: multipart/signed; boundary="nextPart4965436.LvFx2qVVIh";
 micalg="pgp-sha512"; protocol="application/pgp-signature"

--nextPart4965436.LvFx2qVVIh
Content-Transfer-Encoding: 7Bit
Content-Type: text/plain; charset="utf-8"; protected-headers="v1"
From: Sven Eckelmann <sven@narfation.org>
To: sashiko-reviews@lists.linux.dev
Date: Thu, 08 Oct 2026 17:13:45 +0200
Message-ID: <5334040.31r3eYUQgx@sven-desktop>
In-Reply-To: <sashiko-outbox-164327@kernel.org>
MIME-Version: 1.0

On Thursday, 8 October 2026 16:51:45 CEST sashiko-bot@kernel.org wrote:
> [Severity: Low]
> Should this update include an atomic_inc(&hash->generation) similar to how it
> is handled in batadv_tt_local_remove_now()?
> 
> If batadv_tt_local_dump() is preempted during a netlink dump and resumes
> in the middle of a hash bucket while batadv_tt_local_purge_pending_clients()
> concurrently removes an entry, the dump offset will be shifted.
> 
> Without incrementing the hash generation counter here, cb->seq remains
> unchanged and netlink won't set NLM_F_DUMP_INTR. Does this allow userspace
> to silently skip elements in the dump without being warned of the
> inconsistency?

Pre-existing problem and not introduced in this change.
https://patchwork.open-mesh.org/project/b.a.t.m.a.n./patch/20261008-tt-hash-generatopn-v1-1-5aa687343ce1@narfation.org/

Regards,
	Sven
--nextPart4965436.LvFx2qVVIh
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: This is a digitally signed message part.
Content-Transfer-Encoding: 7Bit

-----BEGIN PGP SIGNATURE-----

iHUEABYKAB0WIQS81G/PswftH/OW8cVND3cr0xT1ywUCasezKQAKCRBND3cr0xT1
y9YqAQDVp/rkuHJ26wPbqg2d4Dtpbh9yR4OSc9xdb2EQON42HQEAnLEMAIsZIMFW
WvOpAhmEF+cRdTynoBntkxDkhkfHbgw=
=4SjA
-----END PGP SIGNATURE-----

--nextPart4965436.LvFx2qVVIh--



