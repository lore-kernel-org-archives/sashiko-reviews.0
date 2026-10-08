Received: from dvalin.narfation.org (dvalin.narfation.org [213.160.73.56])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1425D4D0CF0
	for <sashiko-reviews@lists.linux.dev>; Thu,  8 Oct 2026 15:03:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=213.160.73.56
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791471785; cv=none; b=IepZxMtzIwLBJ6FZYRr4VW3YOZdy3S9pXePHUAeaa6XLdXoPpPd3eHVmyDe57jW2DCIJzIlSQzuZ0cWoESImSo8sf49/gh9ItZCPkwsxNp8A0O0qdFb6c8l71IFMphK3VkKpu55Lm0Fug+moWrYMwRGNwCUXcdVPbKgSrZAIei8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791471785; c=relaxed/simple;
	bh=cG5+u2ztQmnyY0auAcYMKDcJdKF7cewJJOqR3gKL644=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=uZ0nSKWrKGhQX4WbO47YL7k5ffXMzQRvJqwBb4XiR4peyMbjaR1iLAm9rnkiTO8Xrh6d1V713nqStTBxVylX08/jpvaHb8MNWI5xcSwYZNvjZ/++g2xWg8GefnZ4UjZ5k6fCer5zCX+By6pRn5Tv50kWzgpUH3DiX+0DqRJUU6k=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=narfation.org; spf=pass smtp.mailfrom=narfation.org; dkim=pass (1024-bit key) header.d=narfation.org header.i=@narfation.org header.b=wy0poUvv; arc=none smtp.client-ip=213.160.73.56
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=narfation.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=narfation.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=narfation.org header.i=@narfation.org header.b="wy0poUvv"
Received: by dvalin.narfation.org (Postfix) id 96F09202AD;
	Thu, 08 Oct 2026 15:02:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=narfation.org;
	s=20121; t=1791471767;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=SILCkbtizl+1dIUDMgYel266LwW7VTv/Av9ol3+4Shc=;
	b=wy0poUvvaegemyZRDdeKiGUvxfapaulrv8K6/0mCUTusjTKtLzlCsSEr4sbUB1EnGlVUHf
	Fer5oVvon6L9beZ66+HTDARZkkbWy9RS5WE6TJZTpfQ/dYbTSRaW9gl1Xoa+p441KIUxTi
	jVYigfJzUqL92rvDaDzWNBtG4dtBzXM=
From: Sven Eckelmann <sven@narfation.org>
To: sashiko-reviews@lists.linux.dev
Cc: marek.lindner@mailbox.org, antonio@mandelbit.com, sw@simonwunderlich.de,
 b.a.t.m.a.n@lists.open-mesh.org
Subject:
 Re: [PATCH batadv v2 5/8] batman-adv: tt: only update flags for TT events
Date: Thu, 08 Oct 2026 17:02:35 +0200
Message-ID: <13182561.O9o76ZdvQC@sven-desktop>
In-Reply-To: <sashiko-outbox-164321@kernel.org>
References:
 <20261008-tt-avoid-unhashed-event-v2-0-7c4eed81606d@narfation.org>
 <20261008-tt-avoid-unhashed-event-v2-5-7c4eed81606d@narfation.org>
 <sashiko-outbox-164321@kernel.org>
Precedence: bulk
X-Mailing-List: sashiko-reviews@lists.linux.dev
List-Id: <sashiko-reviews.lists.linux.dev>
List-Subscribe: <mailto:sashiko-reviews+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:sashiko-reviews+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: multipart/signed; boundary="nextPart6232773.DvuYhMxLoT";
 micalg="pgp-sha512"; protocol="application/pgp-signature"

--nextPart6232773.DvuYhMxLoT
Content-Transfer-Encoding: 7Bit
Content-Type: text/plain; charset="utf-8"; protected-headers="v1"
From: Sven Eckelmann <sven@narfation.org>
To: sashiko-reviews@lists.linux.dev
Date: Thu, 08 Oct 2026 17:02:35 +0200
Message-ID: <13182561.O9o76ZdvQC@sven-desktop>
In-Reply-To: <sashiko-outbox-164321@kernel.org>
MIME-Version: 1.0

On Thursday, 8 October 2026 16:43:32 CEST sashiko-bot@kernel.org wrote:
[...]
> [Severity: High]
> Does this code introduce a permanent loss of concurrent TT events due to a
> TOCTOU race in batadv_tt_tvlv_container_update()?
> 
> Looking at batadv_tt_tvlv_container_update(), it reads
> bat_priv->tt.local_changes locklessly to determine tt_diff_entries_num and
> allocates memory for the TT diff payload:
> 
> net/batman-adv/translation-table.c:batadv_tt_tvlv_container_update() {
>     ...
> 	tt_diff_entries_num = READ_ONCE(bat_priv->tt.local_changes);
>     ...
> }
> 
> Between this read and acquiring bat_priv->tt.changes_list_lock, a concurrent
> call to __batadv_tt_local_event() can add a new TT event to
> bat_priv->tt.changes_list and increment local_changes.

Pre-existing issue and not introduced by this change.
https://www.open-mesh.org/issues/483

Regards,
	Sven

--nextPart6232773.DvuYhMxLoT
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: This is a digitally signed message part.
Content-Transfer-Encoding: 7Bit

-----BEGIN PGP SIGNATURE-----

iHUEABYKAB0WIQS81G/PswftH/OW8cVND3cr0xT1ywUCasewiwAKCRBND3cr0xT1
y4WKAQDHy/2SPPlYXNTMRUsG251Uwv6yxxzqUR2SDrDPIhg3RwEAlSsYERN9JX9L
iug1cJL0DVhbSzLmcMRFrxle5Ti5GAQ=
=/X2Q
-----END PGP SIGNATURE-----

--nextPart6232773.DvuYhMxLoT--



