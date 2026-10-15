Received: from mx01.bremer-it.com (mx01.bremer-it.com [85.215.132.167])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 38ADC3BB128
	for <sashiko-reviews@lists.linux.dev>; Thu, 15 Oct 2026 18:45:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=85.215.132.167
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1792089907; cv=none; b=drOfHyLuiLeD1mCEGRfj18nEYhVWxRowPep24hxfx/WIVE3y6scr+3QN2i3PZEth1gNLqOlOOv+/VPe3EDH2CholePVGqlpp93wyrVyEgGMb941Uhqj4G/P3wg46JeiyxOKHKNdY5VTH7nfDYiLT9jLLCwzBFYm5FpaOXbXInYQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1792089907; c=relaxed/simple;
	bh=NlnqvJZQJCMroc+E9FdvzFC1Rz8sX/0v/jbdHr8Q9fw=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=ulBm2xn+kYa/5AKfdhAHHVb4J0zfyjPRXtCfUdp6eWNnhQtF7hqrJRQWcz1hhsTrdcyJvRfVsQf4R6vk90XTVHx5V2n4gCDXmIj3HMLd++VLQAXKwJDu7LYi7lDgkkJ5OW1bBl33N//T/jDKfqC/+sgSyVZkJakZlFwiuIu+Acs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=barelysecure.org; spf=pass smtp.mailfrom=barelysecure.org; dkim=pass (2048-bit key) header.d=barelysecure.org header.i=@barelysecure.org header.b=Da3adV0g; arc=none smtp.client-ip=85.215.132.167
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=barelysecure.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=barelysecure.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=barelysecure.org header.i=@barelysecure.org header.b="Da3adV0g"
Received: from cashel.logfs.org (c-98-33-96-243.hsd1.ca.comcast.net [98.33.96.243])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (prime256v1) server-signature ECDSA (secp384r1) server-digest SHA384)
	(No client certificate requested)
	by mx01.bremer-it.com (Postfix) with ESMTPSA id 99B6E200D2;
	Thu, 15 Oct 2026 20:34:47 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=barelysecure.org;
	s=dkim68; t=1792089290;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=rWzJkDI/em5y6nh6j86gUEA89QfFvvGbbcLOG6nyaLU=;
	b=Da3adV0gloTJ32d9fYhXySL1K2qui+tJSJj6r8EFpqIPqrd2HX3+CYCrKAfEeiUf9Flrql
	OIZN484H6pocKqU1Rr4ezT3eyWPCJD5mVwNj/+df4rvSShfeh/al/uBn0rE64rcn39em8R
	AXCDpHKZG2yvjRKtyL1pVV1SyZnCvJzt5RcYYJp3DhrqEuOGz2MP5Ivd+j0keB3KU7a65F
	C1KeOcEjRABMxb1dn45KyzoWBvGPZU9stcBMro/ifFjxu9RGbMQRgTm7vQkX7wT7RcDdKM
	qCCtYEAPbs7TLiM5JyZ5GX6JWh/nWV0TpAIGIGRNN2ON1IdvsLMLPsmqWAoJBg==
Authentication-Results: ORIGINATING;
	auth=pass smtp.auth=joern@lazybastard.org smtp.mailfrom=joern@barelysecure.org
Date: Thu, 15 Oct 2026 11:34:44 -0700
From: =?iso-8859-1?Q?J=F6rn?= Engel <joern@barelysecure.org>
To: Tal Zussman <tz2294@columbia.edu>
Cc: Miquel Raynal <miquel.raynal@bootlin.com>, sashiko-bot@kernel.org,
	Joern Engel <joern@lazybastard.org>,
	Richard Weinberger <richard@nod.at>,
	Vignesh Raghavendra <vigneshr@ti.com>,
	sashiko-reviews@lists.linux.dev,
	"Matthew Wilcox (Oracle)" <willy@infradead.org>,
	linux-mtd@lists.infradead.org
Subject: Re: [PATCH 3/3] mtd: block2mtd: convert _block2mtd_erase() to folios
Message-ID: <atEcxC2Hp7idmr04@cashel.logfs.org>
References: <20261014-block2mtd-folio-v1-0-19d24ae676ee@columbia.edu>
 <20261014-block2mtd-folio-v1-3-19d24ae676ee@columbia.edu>
 <sashiko-outbox-172225@kernel.org>
 <87mrsfwck3.fsf@bootlin.com>
 <5ec61284-3ae9-4875-bba3-932cbede14b4@columbia.edu>
Precedence: bulk
X-Mailing-List: sashiko-reviews@lists.linux.dev
List-Id: <sashiko-reviews.lists.linux.dev>
List-Subscribe: <mailto:sashiko-reviews+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:sashiko-reviews+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <5ec61284-3ae9-4875-bba3-932cbede14b4@columbia.edu>
X-Spamd-Bar: /
X-Spamd-Result: default: False [-0.10 / 14.00];
	MIME_GOOD(-0.10)[text/plain];
	BAYES_HAM(-0.00)[20.70%];
	ARC_NA(0.00)[];
	RCVD_COUNT_ZERO(0.00)[0];
	ASN(0.00)[asn:7922, ipnet:98.32.0.0/11, country:US];
	MISSING_XM_UA(0.00)[];
	RCPT_COUNT_SEVEN(0.00)[9];
	FROM_HAS_DN(0.00)[];
	DKIM_SIGNED(0.00)[barelysecure.org:s=dkim68];
	FROM_EQ_ENVFROM(0.00)[];
	MIME_TRACE(0.00)[0:+];
	LOCAL_OUTBOUND(0.00)[];
	TO_MATCH_ENVRCPT_SOME(0.00)[];
	TO_DN_SOME(0.00)[]
X-Rspamd-Action: no action
X-Rspamd-Server: server01
X-Rspamd-Queue-Id: 99B6E200D2

On Thu, Oct 15, 2026 at 11:19:23AM -0400, Tal Zussman wrote:
> 
> It seems like it's a real but very rare pre-existing issue.

You should drop the "but very rare" bit. ;)

When it comes to bugs, being rare and hard to hit doesn't improve
things, it makes them worse.  Rare bugs result in crazy bug reports that
you cannot reproduce.  Instead of spending a few hours on them, they can
cost you days, weeks or months.

They are also often non-trivial to fix.  Instead of taking a bug report
and saying "ah, here is the problem", several times I've had to come up
with new debug code, make it robust enough to ship into production
(because rare bugs only reproduce at scale, which means on production
systems), refine it once or twice and then finally get enough
information to fix the bug.

On the plus side, such debug infrastructure tends to provide enough
clues to fix many bugs, not just one troublemaker.

Jörn

--
The cost of changing business rules is much more expensive for software
than for a secretaty.
-- unknown
