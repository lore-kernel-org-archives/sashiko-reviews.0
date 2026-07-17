Received: from smtpout-02.galae.net (smtpout-02.galae.net [185.246.84.56])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1B09A2D780C
	for <sashiko-reviews@lists.linux.dev>; Fri, 17 Jul 2026 08:19:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=185.246.84.56
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784276402; cv=none; b=oioE3dLCoyrTIDynY0hu9+G64ywseHQT/itT0krMEJbPVtLvoPFwp9Gqn1Hi/c4uZW4qZniojyx3Y0/7nb2b7oJofbU4Vj+LNjZZ6ZU5L12XtxMhoT2xepG3WPerUnXiqQZjz4TsK4o4VCGI+wOHyBCkC/vlm89ezwbUvDVRwVM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784276402; c=relaxed/simple;
	bh=Xp3nyH0/N7m6ZRpj/kgNLW+s2ZuquqTjwhtQ4n2DlfE=;
	h=From:To:Cc:Subject:In-Reply-To:References:Date:Message-ID:
	 MIME-Version:Content-Type; b=E7GGHd9j8JItwdYkDmF4UKc7FGo+rwko53APybezEDfJKAB8fgqDtlNzqnfY1I9L9D/bZlu455OtvdqwmJ7I0/1BhIfXIaxoaZDvJnaQhS2u4T/EXdDTrdCbEm+2Yq7pg9W2YKPiesmF/MIc7Eu0L0CKlj9LbN/Kxhl69BJZKVc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=bootlin.com; spf=pass smtp.mailfrom=bootlin.com; dkim=pass (2048-bit key) header.d=bootlin.com header.i=@bootlin.com header.b=ZnJx5HoU; arc=none smtp.client-ip=185.246.84.56
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=bootlin.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=bootlin.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bootlin.com header.i=@bootlin.com header.b="ZnJx5HoU"
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
	by smtpout-02.galae.net (Postfix) with ESMTPS id 1F2F21A1044
	for <sashiko-reviews@lists.linux.dev>; Fri, 17 Jul 2026 08:19:58 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
	by smtpout-01.galae.net (Postfix) with ESMTPS id E42F760361;
	Fri, 17 Jul 2026 08:19:57 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id 4F7E211BD00C6;
	Fri, 17 Jul 2026 10:19:56 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=dkim;
	t=1784276397; h=from:subject:date:message-id:to:cc:mime-version:content-type:
	 content-transfer-encoding:in-reply-to:references;
	bh=Xp3nyH0/N7m6ZRpj/kgNLW+s2ZuquqTjwhtQ4n2DlfE=;
	b=ZnJx5HoULvURkKkm7Xh1LRFNBKC4vXcXSXwRtrzzRcwsfiiUvhtg/yVS19hqadsy1KZVFI
	hL1Ikx+iy7Z6yOYxsq9IcVV6l+DUU5YeHu8ZrAEfKzS3gtpfh3uh9sXvD/Maj7etXCeAGB
	z1sprxQ3N1rDHjZCaIt4KDDPhPm297Knk/PfoHia3iZ34KlB0Ob9hQqQYuQVdWJBTg3jRf
	tlPMs4Xg8Hg5Abz8cFV4qDEE7x8r4Cgk6SYcDEgWgr3bB2LzmkmnC410BsWm9yZTc8NZrO
	dL9RqM+KiL8ODUxwXoP9ez2dNc59yTJkknGP33QYPfKk5ezAtyv5xS0UhU7Yfg==
From: Miquel Raynal <miquel.raynal@bootlin.com>
To: sashiko-bot@kernel.org
Cc: sashiko-reviews@lists.linux.dev,  conor+dt@kernel.org,
  devicetree@vger.kernel.org,  robh@kernel.org
Subject: Re: [PATCH v3 7/7] clk: tests: Add Kunit testing for nexus nodes
In-Reply-To: <20260716114235.507CD1F00A3A@smtp.kernel.org>
	(sashiko-bot@kernel.org's message of "Thu, 16 Jul 2026 11:42:34
	+0000")
References: <20260716-schneider-v7-2-rc1-eip201-upstream-v3-0-98454e83845c@bootlin.com>
	<20260716-schneider-v7-2-rc1-eip201-upstream-v3-7-98454e83845c@bootlin.com>
	<20260716114235.507CD1F00A3A@smtp.kernel.org>
User-Agent: mu4e 1.12.7; emacs 30.2
Date: Fri, 17 Jul 2026 10:19:55 +0200
Message-ID: <87ech2koyc.fsf@bootlin.com>
Precedence: bulk
X-Mailing-List: sashiko-reviews@lists.linux.dev
List-Id: <sashiko-reviews.lists.linux.dev>
List-Subscribe: <mailto:sashiko-reviews+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:sashiko-reviews+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
X-Last-TLS-Session-Version: TLSv1.3

On 16/07/2026 at 11:42:34 GMT, sashiko-bot@kernel.org wrote:

> Thank you for your contribution! Sashiko AI review found 2 potential issu=
e(s) to consider:
> - [Medium] The `of_find_node_by_name_kunit` helper creates a
> double-free vulnerability if a KUnit-managed node is passed as the
> `from` argument.

This is exactly what we want, since we want the exact same semantics as
of_find_node_by_name(), so: won't fix.

> - [Low] The `of_find_node_by_name_kunit` kernel-doc incorrectly states
> the return value is only a node or negative errno, omitting the NULL
> case when a node is not found.

I will mention the NULL possibility in the kernel doc, which is indeed
missing. This is what can happen if the lookup fails and this is the
value we want to return. The test case is already correctly checking the
output value.

Thanks,
Miqu=C3=A8l
