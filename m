Received: from smtpout-04.galae.net (smtpout-04.galae.net [185.171.202.116])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 687AE3F329A
	for <sashiko-reviews@lists.linux.dev>; Mon, 28 Sep 2026 07:41:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=185.171.202.116
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790581299; cv=none; b=D48ZDx8iJBBEunNGKxibROFevhTQ5Zdp9E8MKJjaXmfPkXehrdIsCWafgYmD4J6NSsSVui3XtTovZWCsVdCetr5BJ6FyWBtbpjz1zK+xZsvzxOogDJ/zfvIQIbxIrPzkz1BAqmrLf019wp+F3DsVWfI4quz55Xp/sM0r/JZNixg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790581299; c=relaxed/simple;
	bh=VKBNyeIyyepLY+HushTRF8h/V1eHboyWyVLfny8gMu8=;
	h=Mime-Version:Content-Type:Date:Message-Id:Cc:Subject:From:To:
	 References:In-Reply-To; b=kAxKyUN1NT7Czu1u01HTOnhf481aXCZYNH6Kx+3XeGNnBenNATvgEOR2W8/rzpQOZh3x7xaC00wZ71LmvpSFzRC9ewt5WuKp7FQEdkd01xL111VrePrGHHzmXkO3ucOB0JM4TVr/HUa+IXy8fHRaJQARzYtPs6tqH3ttFXzwIgk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=bootlin.com; spf=pass smtp.mailfrom=bootlin.com; dkim=pass (2048-bit key) header.d=bootlin.com header.i=@bootlin.com header.b=HeekjZGw; arc=none smtp.client-ip=185.171.202.116
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=bootlin.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=bootlin.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bootlin.com header.i=@bootlin.com header.b="HeekjZGw"
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
	by smtpout-04.galae.net (Postfix) with ESMTPS id 9E8FBC5CD49;
	Mon, 28 Sep 2026 07:42:24 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
	by smtpout-01.galae.net (Postfix) with ESMTPS id 73219601BD;
	Mon, 28 Sep 2026 07:41:35 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id 91721102F1EA5;
	Mon, 28 Sep 2026 09:41:33 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=dkim;
	t=1790581294; h=from:subject:date:message-id:to:cc:mime-version:content-type:
	 content-transfer-encoding:in-reply-to:references;
	bh=VKBNyeIyyepLY+HushTRF8h/V1eHboyWyVLfny8gMu8=;
	b=HeekjZGw7vGIq2SFJXIE7CRqwPDSuWf2MO2RCR2yeUjmpz8sYlKol5jrIePcWc3nxdhVB9
	YXu9qU4G0tHvpZ42muz7Yz8iIxt7Ce6fgP3kcpEOWKQZpANSVdOAOyxuDIh3bMB6lUzwOb
	c0fXWU67S7X3WLsZMRxwcpdNVw4eJpcfmsEHPjna7uap9/NeHFh/t1TA7doFzofNKvTY4t
	o/8Tu3qn6mMSx6qzNN0/w4+DDse1zFEYfD8AyQXcEFkRTM6ln/dtPQOgQS63XfQ8HAaQ+Z
	kHxayxj/oZhBMnDxjQhB02QPdUcGa1cBQHALTZc+MJ9aCbzJl9ks/ehuzkRn7w==
Precedence: bulk
X-Mailing-List: sashiko-reviews@lists.linux.dev
List-Id: <sashiko-reviews.lists.linux.dev>
List-Subscribe: <mailto:sashiko-reviews+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:sashiko-reviews+unsubscribe@lists.linux.dev>
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Mon, 28 Sep 2026 09:41:32 +0200
Message-Id: <DLQS3DSRUIV5.YXZN8EGCJRAW@bootlin.com>
Cc: "Paul Louvel" <paul.louvel@bootlin.com>, <devicetree@vger.kernel.org>,
 <robh@kernel.org>, <conor+dt@kernel.org>
Subject: Re: [PATCH v3 2/3] EDAC/cadence: Add Cadence DDR EDAC driver
From: "Paul Louvel" <paul.louvel@bootlin.com>
To: "Wolfram Sang" <wsa+renesas@sang-engineering.com>,
 <sashiko-reviews@lists.linux.dev>
X-Mailer: aerc 0.21.0-0-g5549850facc2
References: <20260924-paul-v7-3-rc1-edac-v3-0-bd8054a5b180@bootlin.com>
 <20260924-paul-v7-3-rc1-edac-v3-2-bd8054a5b180@bootlin.com>
 <20260924142525.6FC771F000FF@smtp.kernel.org> <arZmkv1mbjkHrdFl@shikoro>
In-Reply-To: <arZmkv1mbjkHrdFl@shikoro>
X-Last-TLS-Session-Version: TLSv1.3

On Fri Sep 25, 2026 at 2:18 PM CEST, Wolfram Sang wrote:
>
>> FIELD_MODIFY() relies on __BF_FIELD_CHECK(), which requires the passed m=
ask
>> to be a compile-time constant via a static assertion. Because cdns_rmw()
>> takes the mask as a parameter and is not explicitly marked inline, if th=
e
>> compiler decides to outline this function, the mask loses its compile-ti=
me
>> constant property and will trigger a guaranteed build failure.
>
> Maybe just use the binary operators?

Yes, bummer because FIELD_MODIFY() is exactly what I need here. I could add=
 the
__always_inline GCC attribute but the compiler is free anyway to ignore tha=
t..




--=20
Paul Louvel, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com

