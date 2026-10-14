Received: from dvalin.narfation.org (dvalin.narfation.org [213.160.73.56])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E1A01486BAB
	for <sashiko-reviews@lists.linux.dev>; Wed, 14 Oct 2026 08:00:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=213.160.73.56
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791964802; cv=none; b=lMQlv95/6vCjYNE508beID0RgLbSTL66ypq72++pDjR6ml7uJMZngoUOa7ubyLEod3noE/pXgnn8N8Q7cjr9otNDWi+l8QIlVzpsNISttl+e37NfX3ApDCNU1cX+MpdqKU437VgDlxmJ1r04fxbjr9A5ZIP4wsLMWGEY62qs/rM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791964802; c=relaxed/simple;
	bh=x8QS/0OX3luJeSn/eR1jXbU9g67FYPFrQJ6Ztv9NVXU=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=DkroiN6HrDYF1e8wf2hVqICLgvYSzgtOcAuijvt1C+Fp6BXtHaw3e+HUVzHwtbauTYOerbwnWW4yGqfASs7o53LzgNBj0TllnDD1yw0FSGjvvOeUwMlidzv7Ujp5qh+RF6RiZXrW8oUlKHpnu9CiCqSfv2L0NlCKic5gYL1N6xE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=narfation.org; spf=pass smtp.mailfrom=narfation.org; dkim=pass (1024-bit key) header.d=narfation.org header.i=@narfation.org header.b=fhO1q6qT; arc=none smtp.client-ip=213.160.73.56
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=narfation.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=narfation.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=narfation.org header.i=@narfation.org header.b="fhO1q6qT"
Received: by dvalin.narfation.org (Postfix) id 87AFB202DA;
	Wed, 14 Oct 2026 07:59:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=narfation.org;
	s=20121; t=1791964792;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=AYMYuT2f6ocVBKdlPySLM/2ynQDBkjP3ZPJoT6aQqIk=;
	b=fhO1q6qTSLsYeFiQ5NgnBG+vAh1SC2ZyR9BEO67lNVg5fdJQTtk3biyhBp9KvEr9dMn55h
	RIIWQgaaegvV/qpp0x/kOMRA55KE96NjhZEyGA31gr/FFtzRVFkpYYFsGhTG1eKBqX9/qn
	vrkJYDz56cPjeLxTDAn7gRJkjBhjfss=
From: Sven Eckelmann <sven@narfation.org>
To: sashiko-reviews@lists.linux.dev
Cc: marek.lindner@mailbox.org, sw@simonwunderlich.de, antonio@mandelbit.com
Subject:
 Re: [PATCH batadv v2 2/6] batman-adv: bla: use dedicated key type for
 backbone gateway hash
Date: Wed, 14 Oct 2026 09:59:49 +0200
Message-ID: <2870219.mvXUDI8C0e@sven-desktop>
In-Reply-To: <sashiko-outbox-170981@kernel.org>
References:
 <20261014-hash-key-v2-0-7cb91c7df2cb@narfation.org>
 <20261014-hash-key-v2-2-7cb91c7df2cb@narfation.org>
 <sashiko-outbox-170981@kernel.org>
Precedence: bulk
X-Mailing-List: sashiko-reviews@lists.linux.dev
List-Id: <sashiko-reviews.lists.linux.dev>
List-Subscribe: <mailto:sashiko-reviews+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:sashiko-reviews+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: multipart/signed; boundary="nextPart13006561.O9o76ZdvQC";
 micalg="pgp-sha512"; protocol="application/pgp-signature"

--nextPart13006561.O9o76ZdvQC
Content-Transfer-Encoding: 7Bit
Content-Type: text/plain; charset="utf-8"; protected-headers="v1"
From: Sven Eckelmann <sven@narfation.org>
To: sashiko-reviews@lists.linux.dev
Date: Wed, 14 Oct 2026 09:59:49 +0200
Message-ID: <2870219.mvXUDI8C0e@sven-desktop>
In-Reply-To: <sashiko-outbox-170981@kernel.org>
MIME-Version: 1.0

On Wednesday, 14 October 2026 09:57:28 CEST sashiko-bot@kernel.org wrote:
[...]
> [Severity: High]
> Does this in-place key modification corrupt the hash table?
> 
> As seen in batadv_choose_backbone_gw() above, key.orig is used to determine
> the hash bucket. If the key is updated here without removing and re-inserting
> the object into the correct bucket, the element becomes orphaned in the wrong
> bucket. Future fast-path lookups for the new MAC address would then search a
> different bucket and potentially create a duplicate entry.
> 
> Additionally, since batadv_bla_periodic_work() iterates over all hash buckets
> instead of doing a key lookup, could it find both the newly created entry
> and the old orphaned entry? It appears this would repeatedly refresh lasttime
> for both entries. This would prevent batadv_bla_purge_backbone_gw() from
> ever cleaning up the orphaned entry, leading to a memory leak and redundant
> loop-detect network broadcasts.
> 
> Finally, is there a data race here? The 6-byte MAC address modification
> via ether_addr_copy() is not atomic and runs under rcu_read_lock() rather
> than the bucket's spinlock. Can concurrent lockless RCU readers observe torn
> reads when performing equality checks?
> 
> >  			/* send an announce frame so others will ask for our
> >  			 * claims and update their tables.
> >  			 */
> 
> 

Not introduced in this patch. It is known and waiting for a fix by Simon: 
https://www.open-mesh.org/issues/452

Regards,
	Sven

--nextPart13006561.O9o76ZdvQC
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: This is a digitally signed message part.
Content-Transfer-Encoding: 7Bit

-----BEGIN PGP SIGNATURE-----

iHUEABYKAB0WIQS81G/PswftH/OW8cVND3cr0xT1ywUCas82dQAKCRBND3cr0xT1
y6bLAQCzIU9B5LYw7lX8yFcWMFAORkhPei5c9HFC/24G5RbxWQEA+bYQT6JnrjpE
bh10asVyPrEC9Q9JgVRBXY4G7i1HLgc=
=TeEn
-----END PGP SIGNATURE-----

--nextPart13006561.O9o76ZdvQC--



