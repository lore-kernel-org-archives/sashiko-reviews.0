Received: from dvalin.narfation.org (dvalin.narfation.org [213.160.73.56])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7232D43A819
	for <sashiko-reviews@lists.linux.dev>; Thu, 15 Oct 2026 07:26:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=213.160.73.56
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1792049209; cv=none; b=ZbtcshYwixH6iUy5G+vPSh33doUEHieFg3qAMjBRd0AL9Z61TMxqor7iEKON8bRnRjliSDhH0LRBoSx1HmhBW+0vaO7dm/JQ+257iXzlfV2W6Sc41FXcoz2hqQ/VcqC1E8rNV3cwwCiIX+8IAYIgcLMWrAQj/TeZRsiNOX2BCD0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1792049209; c=relaxed/simple;
	bh=6MTH0ipMn4HBFusLTOwprzeZCFqEt2OGoxrgDAuHUz8=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=eRjcQyuzAJ4tAS3mpktavRs12NFdSsKkc+JVg5YL02m9KfDmTs87ca4RqG39L+c2ysUKMWOWhpwxDuHWyOPWJKUglN5QhHruhnoWIRFaoNDNFdM+/8Ad6BoRJXk0UehnlIstbfy8JQvBs0TA9T7LUyvR6KU8NT+tukf+j4hxHS0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=narfation.org; spf=pass smtp.mailfrom=narfation.org; dkim=pass (1024-bit key) header.d=narfation.org header.i=@narfation.org header.b=WJgfuSwx; arc=none smtp.client-ip=213.160.73.56
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=narfation.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=narfation.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=narfation.org header.i=@narfation.org header.b="WJgfuSwx"
Received: by dvalin.narfation.org (Postfix) id 8B71C202BE;
	Thu, 15 Oct 2026 07:26:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=narfation.org;
	s=20121; t=1792049190;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=TN6uZdGRKGVWFrEsy6l6MYYhi5HZ2pwfzYoo6AoX+F0=;
	b=WJgfuSwxfpXg83wPYhN1wgMro5iqW+xPOBHJbPXj2mUkZthrjofnjwIQ/KP6Geo54xqwkO
	H8ECxN38/+qM8+VxP6w5//INunmqvI0D6L+PWP41WFiyRHnjgMaD0IUG5sVBfiTWjrHlFY
	KMrpCOf5JRJhcWitSEoWM7DA0e3lud8=
From: Sven Eckelmann <sven@narfation.org>
To: sashiko-reviews@lists.linux.dev
Cc: marek.lindner@mailbox.org, sw@simonwunderlich.de, antonio@mandelbit.com,
 b.a.t.m.a.n@lists.open-mesh.org
Subject:
 Re: [PATCH batadv] batman-adv: mark functions inheriting critical sections
Date: Thu, 15 Oct 2026 09:26:21 +0200
Message-ID: <2860295.mvXUDI8C0e@sven-desktop>
In-Reply-To: <sashiko-outbox-172395@kernel.org>
References:
 <20261015-must_hold-v1-1-7ddbb82da7c3@narfation.org>
 <sashiko-outbox-172395@kernel.org>
Precedence: bulk
X-Mailing-List: sashiko-reviews@lists.linux.dev
List-Id: <sashiko-reviews.lists.linux.dev>
List-Subscribe: <mailto:sashiko-reviews+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:sashiko-reviews+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: multipart/signed; boundary="nextPart12997114.O9o76ZdvQC";
 micalg="pgp-sha512"; protocol="application/pgp-signature"

--nextPart12997114.O9o76ZdvQC
Content-Transfer-Encoding: 7Bit
Content-Type: text/plain; charset="utf-8"; protected-headers="v1"
From: Sven Eckelmann <sven@narfation.org>
To: sashiko-reviews@lists.linux.dev
Date: Thu, 15 Oct 2026 09:26:21 +0200
Message-ID: <2860295.mvXUDI8C0e@sven-desktop>
In-Reply-To: <sashiko-outbox-172395@kernel.org>
MIME-Version: 1.0

On Thursday, 15 October 2026 09:22:30 CEST sashiko-bot@kernel.org wrote:
[...]
> [Severity: Low]
> Does adding this capability annotation break the type signature when passed
> as a function pointer?
> 
> In net/batman-adv/originator.c, batadv_frag_check_entry() is passed as the
> check_cb argument to batadv_frag_purge_orig():
> 
> 			batadv_frag_purge_orig(orig_node,
> 					       batadv_frag_check_entry);
> 
> Because the check_cb function pointer definition lacks the corresponding
> capability annotation, this creates a capability type mismatch that leads to
> a static analysis warning or error during context analysis.

No, it doesn't in my tests.

> 
> [ ... ]
> 
> > diff --git a/net/batman-adv/multicast.c b/net/batman-adv/multicast.c
> > index 22dd28d5e1abc..6ebab4eb1382e 100644
> > --- a/net/batman-adv/multicast.c
> > +++ b/net/batman-adv/multicast.c
> > @@ -683,6 +685,7 @@ static void batadv_mcast_mla_list_free(struct hlist_head *mcast_list)
> >   */
> >  static void batadv_mcast_mla_tt_retract(struct batadv_priv *bat_priv,
> >  					struct hlist_head *mcast_list)
> > +	__must_hold(&bat_priv->mcast.mla_lock)
> >  {
> 
> [Severity: Low]
> Is it possible this annotation is violated during teardown?
> 
> In batadv_mcast_free(), the code intentionally skips acquiring mla_lock
> because it relies on implicit serialization after the worker is canceled:
> 
> 	/* safely calling outside of worker, as worker was canceled above */
> 	batadv_mcast_mla_tt_retract(bat_priv, NULL);
> 
> However, batadv_mcast_mla_tt_retract() is now strictly annotated to require
> the lock, which will cause a build warning or error when compiled with
> CONFIG_WARN_CONTEXT_ANALYSIS=y. Is this one of the corner cases preventing
> the enablement of CONTEXT_ANALYSIS := y?

Yes, it is one one of the corner cases.

Regards,
	Sven
--nextPart12997114.O9o76ZdvQC
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: This is a digitally signed message part.
Content-Transfer-Encoding: 7Bit

-----BEGIN PGP SIGNATURE-----

iHUEABYKAB0WIQS81G/PswftH/OW8cVND3cr0xT1ywUCatCAHQAKCRBND3cr0xT1
y1M8AP4n6111DlJJ9v+mJgG3cwaBxuXBa+LmaXHLhR4K+/G96gD+P+jdBqNLmP3z
+JCcHsD7/WLhNPamUAmCmX20wvJKvgY=
=S1ns
-----END PGP SIGNATURE-----

--nextPart12997114.O9o76ZdvQC--



