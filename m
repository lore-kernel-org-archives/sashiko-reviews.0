Received: from dvalin.narfation.org (dvalin.narfation.org [213.160.73.56])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F153F1B4F1F
	for <sashiko-reviews@lists.linux.dev>; Wed,  3 Jun 2026 09:02:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=213.160.73.56
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1780477356; cv=none; b=aKKLFtRCqUxHcjDRQB7+G5y162f5oJInMgWLEc+wAXWmL5WYG4Iv9i+mqy9d6zUDrI6gnXcK1JNGLvziTh1I0QSpJddC+rIj2vq1wVHYQ9+fi77rsL3u+MHAKICQ5LG2QYV1w59liDV24ws4s7VjXGkDh+yUjbdaOfVcsMMxzuI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1780477356; c=relaxed/simple;
	bh=LGs6qFxgDHihzWkDKcvL5VmST44rOBrR7X5wst/S0dg=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=Navb250ng3uNcahjayQRaiMQG/ck+Xy1EeNOeXDcb3GfTEh9xgzb1QuygJL7EAGLaUnIYJj0yD3CMwp2GFXoNGdPoLTzIHjseEVMEr7S8czmYrUTARb2x9rD5YY6gMivx+fshZR++s+CjpIzQbz1cEy0Xm/9nOssAbSneMgBGNU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=narfation.org; spf=pass smtp.mailfrom=narfation.org; dkim=pass (1024-bit key) header.d=narfation.org header.i=@narfation.org header.b=IO2Dej4j; arc=none smtp.client-ip=213.160.73.56
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=narfation.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=narfation.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=narfation.org header.i=@narfation.org header.b="IO2Dej4j"
Received: by dvalin.narfation.org (Postfix) id D8D672023F;
	Wed, 03 Jun 2026 09:02:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=narfation.org;
	s=20121; t=1780477346;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=K0GOSa7pR1jJR5EBKpCSaPddlA99w+oFdD0eiBfewGU=;
	b=IO2Dej4jiDjYqggV8MHOmM3Ky1qiwgZLzy3Byeso0dLqda/EQKjzepBnA22QpjdMEd1vqR
	5BcvBBF83MqRErYFzzTIi+kSINaZYgrc78FwKF0MD5eUV2/30oPBRbNVp02nZcuG5NkVNw
	o/GJ+mc6QhDcRp3vlNfJZTDynU6mMv4=
From: Sven Eckelmann <sven@narfation.org>
To: sashiko-reviews@lists.linux.dev
Cc: sw@simonwunderlich.de, marek.lindner@mailbox.org, antonio@mandelbit.com,
 b.a.t.m.a.n@lists.open-mesh.org
Subject:
 Re: [PATCH batadv 3/3] batman-adv: use GFP_KERNEL allocations for the wifi
 detection cache
Date: Wed, 03 Jun 2026 11:02:23 +0200
Message-ID: <2275479.Mh6RI2rZIc@ripper>
In-Reply-To: <20260603045118.0625E1F00893@smtp.kernel.org>
References:
 <20260603-wifi-cache-cleanup-v1-3-d5ed08075c96@narfation.org>
 <20260603045118.0625E1F00893@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: sashiko-reviews@lists.linux.dev
List-Id: <sashiko-reviews.lists.linux.dev>
List-Subscribe: <mailto:sashiko-reviews+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:sashiko-reviews+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: multipart/signed; boundary="nextPart3760743.R56niFO833";
 micalg="pgp-sha512"; protocol="application/pgp-signature"

--nextPart3760743.R56niFO833
Content-Transfer-Encoding: 7Bit
Content-Type: text/plain; charset="utf-8"; protected-headers="v1"
From: Sven Eckelmann <sven@narfation.org>
To: sashiko-reviews@lists.linux.dev
Date: Wed, 03 Jun 2026 11:02:23 +0200
Message-ID: <2275479.Mh6RI2rZIc@ripper>
In-Reply-To: <20260603045118.0625E1F00893@smtp.kernel.org>
MIME-Version: 1.0

On Wednesday, 3 June 2026 06:51:17 CEST sashiko-bot@kernel.org wrote:
> [Severity: High]
> This isn't a bug introduced by this patch, but while looking at the
> rhashtable usage in this file, I noticed that rhashtable_lookup_fast() is
> called without rcu_read_lock() in batadv_wifi_net_device_update():
> 
> net/batman-adv/hard-interface.c:batadv_wifi_net_device_update() {
> ...
>         wifi_flags = batadv_wifi_flags_evaluate(net_dev);
>         device_state = rhashtable_lookup_fast(&batadv_wifi_net_devices,
>                                               &net_dev,
>                                               batadv_wifi_net_devices_params);
> ...
> }
> 
> And similarly in batadv_wifi_net_device_unregister():
> 
> net/batman-adv/hard-interface.c:batadv_wifi_net_device_unregister() {
> ...
>         device_state = rhashtable_lookup_fast(&batadv_wifi_net_devices,
>                                               &net_dev,
>                                               batadv_wifi_net_devices_params);
> ...
> }
> 
> Can this lead to a use-after-free on the bucket array?
> 
> Since batadv_wifi_net_devices is initialized with automatic_shrinking = true,
> it can be asynchronously resized by a background worker at any time. This
> worker frees the old bucket array via kfree_rcu(). Without an active RCU
> read-side critical section, couldn't the RCU grace period end while
> rhashtable_lookup_fast() is still iterating?

Would be nice if someone else can double check this. But this doesn't seem to 
be valid:

static __always_inline void *rhashtable_lookup_fast(
	struct rhashtable *ht, const void *key,
	const struct rhashtable_params params)
{
	void *obj;

	rcu_read_lock();
	obj = rhashtable_lookup(ht, key, params);
	rcu_read_unlock();

	return obj;
}

So, rhashtable_lookup_fast() takes rcu_read_lock() itself. And the returned obj 
cannot be freed because all functions mentioned here are protected by the 
rtnl_lock().

We are therefore also fulfilling the requirement from the 
rhashtable_lookup_fast comment:

 * Only use this function when you have other mechanisms guaranteeing
 * that the object won't go away after the RCU read lock is released.

Regards,
	Sven


--nextPart3760743.R56niFO833
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: This is a digitally signed message part.
Content-Transfer-Encoding: 7Bit

-----BEGIN PGP SIGNATURE-----

iHUEABYKAB0WIQS81G/PswftH/OW8cVND3cr0xT1ywUCah/tnwAKCRBND3cr0xT1
y8ZzAP9vEh68cW1+QPtnKyDD9MMkyFWwasYaKYcXBTLuiIysuAD/Sju84BZx5nyk
qg4Z7ALt19w7SiOWotndBC/9ROpIMwU=
=Vaaz
-----END PGP SIGNATURE-----

--nextPart3760743.R56niFO833--



