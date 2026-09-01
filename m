Received: from dvalin.narfation.org (dvalin.narfation.org [213.160.73.56])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 17F7A48125C
	for <sashiko-reviews@lists.linux.dev>; Tue,  1 Sep 2026 16:38:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=213.160.73.56
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788280726; cv=none; b=On5WJUCE37TtMTEqwkJlyjQtHT86RrYZkq/iXqn88en3+xrNXD+o52NkMsQUU8u0Px7DB4RteboqyAThNDqhZctjybUJePf/LLIwgrCMe5ZY2lWmAYJ2OhWKgH6p7XmZVfrCf2jjpSsSzzhfN2SlW9QweK7qqRG9KYfJswCZBKs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788280726; c=relaxed/simple;
	bh=sUK7XGeATjue4bs9rhdPzTV9uNxHQrJdjIN5LhXFOo4=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=iTfuuy9GeefQ+kxbNfZYyLdpjdlRgh4BHjrGUss/N1TbcBOdRnjoPzDKyqa+w/+2ZGawNVX+qiI2un5iLqduKQhSWgeMhkN9xrzYBPV0QTk1hTng+ArDmi7oYWWtb7frD5QQKm8/rM2zfaKBY+LcfDyCZSDiy91tsDEzVgHeOvI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=narfation.org; spf=pass smtp.mailfrom=narfation.org; dkim=pass (1024-bit key) header.d=narfation.org header.i=@narfation.org header.b=uWR1mMgE; arc=none smtp.client-ip=213.160.73.56
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=narfation.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=narfation.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=narfation.org header.i=@narfation.org header.b="uWR1mMgE"
Received: by dvalin.narfation.org (Postfix) id 223702043A;
	Tue, 01 Sep 2026 16:38:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=narfation.org;
	s=20121; t=1788280719;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=uKZDP1Sj5kZT+0JXVWxIHMLMLJIEw6PMKYo0ok+WzP4=;
	b=uWR1mMgEL5AvQRg8iA6kDrhY7up7zPjZqNgUvridLdexO9WJ6EAvK4UI3TUkW2gTa1UA+k
	fhZUZc4jTj8crnHBxePm7exPCyl23BWHyw2aDCkN/ShrttIWcdToCouAc3rbph6o5x8+hl
	9GZ5LGWbVfF7QLiFlzijoPrs6VvGHs4=
From: Sven Eckelmann <sven@narfation.org>
To: sashiko-reviews@lists.linux.dev
Cc: marek.lindner@mailbox.org, sw@simonwunderlich.de, antonio@mandelbit.com
Subject:
 Re: [PATCH net-next 06/15] batman-adv: ensure u16 aligned mac address arrays
 on stack
Date: Tue, 01 Sep 2026 18:38:37 +0200
Message-ID: <2276913.irdbgypaU6@sven-desktop>
In-Reply-To: <20260901140000.035F51F000E9@smtp.kernel.org>
References:
 <20260831135117.574836-1-sw@simonwunderlich.de>
 <20260831135117.574836-7-sw@simonwunderlich.de>
 <20260901140000.035F51F000E9@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: sashiko-reviews@lists.linux.dev
List-Id: <sashiko-reviews.lists.linux.dev>
List-Subscribe: <mailto:sashiko-reviews+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:sashiko-reviews+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: multipart/signed; boundary="nextPart14085588.uLZWGnKmhe";
 micalg="pgp-sha512"; protocol="application/pgp-signature"

--nextPart14085588.uLZWGnKmhe
Content-Transfer-Encoding: 7Bit
Content-Type: text/plain; charset="utf-8"; protected-headers="v1"
From: Sven Eckelmann <sven@narfation.org>
To: sashiko-reviews@lists.linux.dev
Date: Tue, 01 Sep 2026 18:38:37 +0200
Message-ID: <2276913.irdbgypaU6@sven-desktop>
In-Reply-To: <20260901140000.035F51F000E9@smtp.kernel.org>
MIME-Version: 1.0

On Tuesday, 1 September 2026 15:59:59 CEST sashiko-bot@kernel.org wrote:
[...]
> If memory allocation fails for bat_priv->bla.backbone_hash, the previously
> allocated claim_hash is destroyed but the pointer is left dangling:
> 
> net/batman-adv/bridge_loop_avoidance.c:batadv_bla_init() {
>         ...
>         bat_priv->bla.backbone_hash = batadv_hash_new(32);
>         if (!bat_priv->bla.backbone_hash) {
>                 batadv_hash_destroy(bat_priv->bla.claim_hash);
>                 return -ENOMEM;
>         }
>         ...
> }
> 
> This failure propagates up to batadv_mesh_init() and register_netdevice(),
> which rolls back by calling the device's priv_destructor 
> (batadv_meshif_free()).
> 
> This destructor calls batadv_mesh_free() which unconditionally calls
> batadv_bla_free(). Could batadv_bla_free() then use the dangling non-NULL
> claim_hash pointer:
> 
> net/batman-adv/bridge_loop_avoidance.c:batadv_bla_free() {
>         ...
>         if (bat_priv->bla.claim_hash) {
>                 batadv_bla_purge_claims(bat_priv, primary_if, 1);
>                 batadv_hash_destroy(bat_priv->bla.claim_hash);
>                 bat_priv->bla.claim_hash = NULL;
>         }
>         ...
> }
> 
> leading to a use-after-free in batadv_bla_purge_claims() and a double free
> via batadv_hash_destroy()?
> 
> Would it be safer to set bat_priv->bla.claim_hash = NULL immediately after
> destroying it in batadv_bla_init()?
> 
> 

Completely out-of-scope for this patch. Submitted patch for review to 
https://patch.msgid.link/20260901-claim-avoid-err-double-free-v1-1-6d6f081f5151@narfation.org

Regards,
	Sven

--nextPart14085588.uLZWGnKmhe
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: This is a digitally signed message part.
Content-Transfer-Encoding: 7Bit

-----BEGIN PGP SIGNATURE-----

iHUEABYKAB0WIQS81G/PswftH/OW8cVND3cr0xT1ywUCapb/jQAKCRBND3cr0xT1
y/hrAQDAzFSaqS5pWVzwfTmZdRNf42xbsLVAA5Yec8qCfZ0U2QD/b5Wp2ANNh49e
SlVQ/7cG1+Wor9HVUdOc9bAZlvAZzAc=
=JsZw
-----END PGP SIGNATURE-----

--nextPart14085588.uLZWGnKmhe--



