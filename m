Received: from dvalin.narfation.org (dvalin.narfation.org [213.160.73.56])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D134E480DDB
	for <sashiko-reviews@lists.linux.dev>; Tue,  1 Sep 2026 16:31:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=213.160.73.56
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788280287; cv=none; b=gOtQFCTIGw7NT6NQ1nXvyyqAS1EBv1aBygIHZkBAckmHOVLidu+51kp/6aQ1RRu1wpRgl1GEJ5h0PqqCofntqJfuuWizUzJdEQkUFtii8I+kv74Uswo3eYRm1Nn0UWfzHNDwqpmXWGEe1ilnPI8cuF+aMdaDiwfmbfVQNLXs+j0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788280287; c=relaxed/simple;
	bh=kXxccQq9tpY+ErspuD7I0/GeT72igWDf1YdmxSxDfzY=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=cqps21LDdK3zprtBCQf5czYxFhU+jAYsQJ0KLMzndVZP3LeFL0zZ5fUepPJBmSutJ7It9i4Q2s9vqb8veKXN07CfJQUgqTDlqCZfb35FSkop3zhACb1N3KDJYPwuYneBoFmDr45zJru/oLhNw0NrHeWVHr4w/RIwp4LuC84ADhU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=narfation.org; spf=pass smtp.mailfrom=narfation.org; dkim=pass (1024-bit key) header.d=narfation.org header.i=@narfation.org header.b=b9n5Y944; arc=none smtp.client-ip=213.160.73.56
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=narfation.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=narfation.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=narfation.org header.i=@narfation.org header.b="b9n5Y944"
Received: by dvalin.narfation.org (Postfix) id 9A6432043A;
	Tue, 01 Sep 2026 16:22:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=narfation.org;
	s=20121; t=1788279748;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=wh9xxZ8TieWMKyommpBXWpjVka0rPy1DvVyKENWfxEA=;
	b=b9n5Y944HrG2myUzf9rMma+6O1PrFQhJszHgl/9xevZyEPwa7Np67XDJH82ibEllDIhN7W
	6Dbre1Rao0NOhWGaH6tdD9GwdB17lROiQ6kZ6QLZcDDWDvHLqW572hrnWQ9Kn6hXfXizMA
	o1yVwUtbKOV0qSKEwZyoz9QAuCu23YA=
From: Sven Eckelmann <sven@narfation.org>
To: sashiko-reviews@lists.linux.dev
Cc: marek.lindner@mailbox.org, sw@simonwunderlich.de, antonio@mandelbit.com
Subject:
 Re: [PATCH net-next 03/15] batman-adv: bat_v: fix bonding candidate selection
Date: Tue, 01 Sep 2026 18:22:22 +0200
Message-ID: <6025781.DvuYhMxLoT@sven-desktop>
In-Reply-To: <20260901135959.23F6C1F000E9@smtp.kernel.org>
References:
 <20260831135117.574836-1-sw@simonwunderlich.de>
 <20260831135117.574836-4-sw@simonwunderlich.de>
 <20260901135959.23F6C1F000E9@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: sashiko-reviews@lists.linux.dev
List-Id: <sashiko-reviews.lists.linux.dev>
List-Subscribe: <mailto:sashiko-reviews+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:sashiko-reviews+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: multipart/signed; boundary="nextPart6301397.lOV4Wx5bFT";
 micalg="pgp-sha512"; protocol="application/pgp-signature"

--nextPart6301397.lOV4Wx5bFT
Content-Transfer-Encoding: 7Bit
Content-Type: text/plain; charset="utf-8"; protected-headers="v1"
From: Sven Eckelmann <sven@narfation.org>
To: sashiko-reviews@lists.linux.dev
Date: Tue, 01 Sep 2026 18:22:22 +0200
Message-ID: <6025781.DvuYhMxLoT@sven-desktop>
In-Reply-To: <20260901135959.23F6C1F000E9@smtp.kernel.org>
MIME-Version: 1.0

On Tuesday, 1 September 2026 15:59:58 CEST sashiko-bot@kernel.org wrote:
> [Severity: High]
> This isn't a bug introduced by this patch, but does the throughput comparison
> in batadv_v_neigh_cmp() overflow?
> 
> In batadv_v_neigh_cmp(), we have:
> 
>     ret = ifinfo1->bat_v.throughput - ifinfo2->bat_v.throughput;
> 
> If an interface is provisioned with a throughput override via netlink that
> exceeds the signed 32-bit maximum (2,147,483,647), subtracting a low or zero
> throughput interface from it causes this unsigned subtraction to overflow.
> 
> The result is implicitly cast to a signed 32-bit integer, turning it negative.
> 
> Will returning a negative value here incorrectly signal to callers that the
> optimal high-throughput path is worse, causing the mesh routing to prefer
> suboptimal or zero-throughput paths instead?

Out-of-scope for this patch. It isn't even touched in this patch.

Document it for interested contributors in 
https://www.open-mesh.org/issues/470

Regards,
	Sven
--nextPart6301397.lOV4Wx5bFT
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: This is a digitally signed message part.
Content-Transfer-Encoding: 7Bit

-----BEGIN PGP SIGNATURE-----

iHUEABYKAB0WIQS81G/PswftH/OW8cVND3cr0xT1ywUCapb7vgAKCRBND3cr0xT1
yzgmAQDY67XwtrweevGdsBqmZNgF2g7vcVoagEHiwaunHVzqmQEA37HbaNt9a792
AqxThKCjqvauujP0M2Txi1WbK18YqgY=
=rP72
-----END PGP SIGNATURE-----

--nextPart6301397.lOV4Wx5bFT--



