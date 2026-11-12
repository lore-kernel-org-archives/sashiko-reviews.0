Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=213.160.73.56
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794481008;
	b=wClJNxJyPoJMGSXexPY1ha9y/SmHQTRy0h58tksF1uQBf3tR5ZjA1d6ITXMS0XLvSTaA
	 0O43KX6gtQLhAb2xPiIUz03O81Ce8M1rZTtuPS1IiO9tvLa2GX+FpHTWvy/3sRx5P0x6m
	 PYrzo+qs33EtE4veaBdpWC42vsTXf4qt0AnIe7xweNvSxTUDVNFmz09bSG0ho6lZQWujD
	 VRaoJhm8O75SzmNzZHtFDTvXaGXwM2SP76sRGOw+hnVyrtAEGJ52DYBkAyLsjFcQtpWI+
	 z4lGzhgDc3E0HMh9GpysX9iCyPlWVFCrl4A59Uv+D2UEaPFZmUXNVNY1nof0y8IMnXQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794481008;
	h=DMARC-Filter:Received:DKIM-Signature:From:To:Cc:Subject:Date:
	 Message-ID:In-Reply-To:References:MIME-Version:Content-Type;
	bh=kKN5BRpLDy7pI7ND1ZNHTvq6FOkgszxeU7B28rE9CG8=;
	b=K/Leu/zP+f3Vhc1cagVlfrnkZUCTmtCLv6tGcisaeznyaKJSNmjHz8iq7WTiL4Ay2y9s
	 aTOZ479GDp03/XWS5KzdJuDpEbETgHg2vMA+HLJwFbOmyN9pGznXDd63osftIAzw0rmr/
	 vP2KHxQcLyzu+d51k5MQ60dvqmGVVC116je4oKHLj7r5f64MllgN2w+RJij9h2XOpzjIy
	 tcJiMmAai+7NeEYbWRF2v+N8BfVTaaIotjZ8hTSw+gDf4t/SsQi7pI7uxo0PWj/8OlzcS
	 fDTmnsByNTe1qHl0CiezWih8oL8l6M7AtRWxzbVHH7Dee3PMwatO3u2leB/jyZwh17g==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=narfation.org;
	spf=pass smtp.mailfrom=narfation.org;
	dkim=pass header.d=narfation.org header.i=@narfation.org header.a=rsa-sha256 header.s=20121 header.b=qFHkR0Xb;
	arc=none smtp.remote-ip=213.160.73.56
Received: from dvalin.narfation.org (dvalin.narfation.org [213.160.73.56])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CADE9606A31C
	for <sashiko-reviews@lists.linux.dev>; Thu, 12 Nov 2026 10:56:47 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org CADE9606A31C
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=narfation.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=narfation.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=narfation.org header.i=@narfation.org header.a=rsa-sha256 header.s=20121 header.b=qFHkR0Xb
Received: by dvalin.narfation.org (Postfix) id 7D8EE200DB;
	Thu, 12 Nov 2026 10:56:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=narfation.org;
	s=20121; t=1794481005;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=kKN5BRpLDy7pI7ND1ZNHTvq6FOkgszxeU7B28rE9CG8=;
	b=qFHkR0XbVfifMrgt2QHY6emn44dB8WfcIKX+LYNsuepHAJkR9j1ZGO5hyTPwZ8iKACQ4kP
	zeZuT0HPLoZmJpslYoruU8GNWfXS8K7GQMWFHB0iwjUo4hxbrejZHrCoh3VmLY7gG9PU78
	eA09VfWVsyANpZK20qyoTwTFA1Fy9lc=
From: Sven Eckelmann <sven@narfation.org>
To: Simon Wunderlich <sw@simonwunderlich.de>, sashiko-reviews@lists.linux.dev
Cc: marek.lindner@mailbox.org, antonio@mandelbit.com
Subject:
 Re: [PATCH net-next 09/15] batman-adv: annotate originator last_seen with
 READ/WRITE_ONCE
Date: Thu, 12 Nov 2026 11:56:42 +0100
Message-ID: <3711917.V25eIC5XRa@ripper>
In-Reply-To: <sashiko-outbox-210959@kernel.org>
References:
 <20261111102729.2096241-1-sw@simonwunderlich.de>
 <20261111102729.2096241-10-sw@simonwunderlich.de>
 <sashiko-outbox-210959@kernel.org>
X-Mailing-List: sashiko-reviews@lists.linux.dev
List-Id: <sashiko-reviews.lists.linux.dev>
List-Post: <mailto:sashiko-reviews@lists.linux.dev>
List-Help: <mailto:sashiko-reviews+help@lists.linux.dev>
List-Subscribe: <mailto:sashiko-reviews+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:sashiko-reviews+unsubscribe@lists.linux.dev>
List-Owner: <mailto:sashiko-reviews+owner@lists.linux.dev>
Precedence: list
MIME-Version: 1.0
Content-Type: multipart/signed; boundary="nextPart3774230.LM0AJKV5NW";
 micalg="pgp-sha512"; protocol="application/pgp-signature"

--nextPart3774230.LM0AJKV5NW
Content-Transfer-Encoding: 7Bit
Content-Type: text/plain; charset="utf-8"; protected-headers="v1"
From: Sven Eckelmann <sven@narfation.org>
Cc: marek.lindner@mailbox.org, antonio@mandelbit.com
Date: Thu, 12 Nov 2026 11:56:42 +0100
Message-ID: <3711917.V25eIC5XRa@ripper>
In-Reply-To: <sashiko-outbox-210959@kernel.org>
MIME-Version: 1.0

On Thursday, 12 November 2026 11:34:43 CET sashiko-bot@kernel.org wrote:
[...]
> [Severity: Medium]
> This problem wasn't introduced by this patch, but can
> batadv_v_neigh_dump_neigh() and batadv_iv_neigh_dump_neigh()

batadv_iv_neigh_dump_neigh? There is no function with this name in the source 
code. There is only batadv_iv_ogm_neigh_dump_neigh()

> suffer from
> the same timestamp underflow [1]?
> 
> net/batman-adv/bat_v.c:batadv_v_neigh_dump_neigh() {
>     ...
>         last_seen_msecs = jiffies_to_msecs(jiffies - hardif_neigh->last_seen);
>     ...
> }
> 
> Because hardif_neigh->last_seen is updated locklessly on packet reception
> and read without READ_ONCE() or jiffies_delta_to_msecs(), a concurrent
> update can leave hardif_neigh->last_seen ahead of the sampled jiffies
> value, wrapping the subtraction and exporting a huge last_seen_msecs
> value over netlink.

This is adjusted in the next two patches in this patchset.

Regards,
	Sven
--nextPart3774230.LM0AJKV5NW
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: This is a digitally signed message part.
Content-Transfer-Encoding: 7Bit

-----BEGIN PGP SIGNATURE-----

iHUEABYKAB0WIQS81G/PswftH/OW8cVND3cr0xT1ywUCavWbagAKCRBND3cr0xT1
y7oWAP4sOl4ZRDJWUHcjbWCz30XsZ/Wdc4GE3vP4bxj2MEZpfgD/WesixklV98WI
U+Jjl9XBVuvIs02YlFGUlM+xc1E/+gU=
=22tQ
-----END PGP SIGNATURE-----

--nextPart3774230.LM0AJKV5NW--



