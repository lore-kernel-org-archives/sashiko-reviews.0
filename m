Received: from smtpout-03.galae.net (smtpout-03.galae.net [185.246.85.4])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 02C00374E4C
	for <sashiko-reviews@lists.linux.dev>; Wed, 29 Jul 2026 08:45:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=185.246.85.4
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785314750; cv=none; b=HCzaolRRqx5MM39V+2jipbyIW1v6PROz/xE74VA1BSpHGpQnB+EkFX/n1qpuCyWsGDiHt59WvfTSRHVzBQuVk/kLZskIPeDf4VAsoS6PPqAlni3PCXaMcZsk1LeQ1tJ9rDOwyB6xJA81tvyZRiyFa81eHrWY51b4OTN/4A/n9IU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785314750; c=relaxed/simple;
	bh=Uem0BCTQG+LFAr0n9rYxTIFcsrX39QrrrrkVdgpsJn0=;
	h=From:To:Cc:Subject:In-Reply-To:References:Date:Message-ID:
	 MIME-Version:Content-Type; b=kvIaonZYrT7RPVtglVlwu+V1Ivpj6yacTsGTIB86HqM7R0qMGCbbwXhxu8V1YR8QQ60JIaCxpseDIquDAl5fxmDF0zQPNZyL3ajNy9huixwBlYPdjIhtuySXuX+JDS0LkFJRkXNUcs6Yc0369HA+No8aG0zfGD1zqHiQozpw3SA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=bootlin.com; spf=pass smtp.mailfrom=bootlin.com; dkim=pass (2048-bit key) header.d=bootlin.com header.i=@bootlin.com header.b=yfWc11bO; arc=none smtp.client-ip=185.246.85.4
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=bootlin.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=bootlin.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bootlin.com header.i=@bootlin.com header.b="yfWc11bO"
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
	by smtpout-03.galae.net (Postfix) with ESMTPS id 3E29E4E40FD9;
	Wed, 29 Jul 2026 08:45:46 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
	by smtpout-01.galae.net (Postfix) with ESMTPS id 061A16039A;
	Wed, 29 Jul 2026 08:45:46 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id 06BAA11C11FDA;
	Wed, 29 Jul 2026 10:45:39 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=dkim;
	t=1785314741; h=from:subject:date:message-id:to:cc:mime-version:content-type:
	 content-transfer-encoding:in-reply-to:references;
	bh=Uem0BCTQG+LFAr0n9rYxTIFcsrX39QrrrrkVdgpsJn0=;
	b=yfWc11bOPX9DS6oVz3wVHzXAZYLOKldzTwc5ox7bVJ3aWyMLfnePszDAAzZMINh9m6Q5VY
	Za8SnYVD+h9nY0YNws5+R/GjzLhPznYpzbkUh5oymaS0pkU3iZnNF9016hM3XrjHSGctv2
	l4uqPKKh5UZQBRQWcZW1YiIq2QM6WMIMHwewaVRfvi8NYmEqf1SN/GPemiu68w9Qkk+q3O
	oYLllgf5z/baoYscM/tNfRD/ZwQiSLNpA3Hm5NdSdS9TAcfP0lety1CJE0qXB7ooVPwnG/
	NRH1ddXWGEPD35U7x9WlyABZzOIHkah4FQom7s1gymCOuf1AcZOR2kDEkPj6Cg==
From: Miquel Raynal <miquel.raynal@bootlin.com>
To: sashiko-bot@kernel.org
Cc: "Santhosh Kumar K" <s-k6@ti.com>,  sashiko-reviews@lists.linux.dev,
  "Pratyush Yadav" <pratyush@kernel.org>,  devicetree@vger.kernel.org,
  "Takahiro Kuwano" <takahiro.kuwano@infineon.com>,  conor+dt@kernel.org,
  "Vignesh Raghavendra" <vigneshr@ti.com>,  robh@kernel.org,  "Richard
 Weinberger" <richard@nod.at>,  "Michael Walle" <mwalle@kernel.org>
Subject: Re: [PATCH v6 15/17] mtd: spinand: negotiate optimal controller
 operating point before dirmap creation
In-Reply-To: <20260723120247.8E1BD1F000E9@smtp.kernel.org>
	(sashiko-bot@kernel.org's message of "Thu, 23 Jul 2026 12:02:23
	+0000")
References: <20260723110219.3180747-1-s-k6@ti.com>
	<20260723110219.3180747-16-s-k6@ti.com>
	<20260723120247.8E1BD1F000E9@smtp.kernel.org>
User-Agent: mu4e 1.12.12; emacs 30.2
Date: Wed, 29 Jul 2026 10:45:39 +0200
Message-ID: <87fr12mbf0.fsf@bootlin.com>
Precedence: bulk
X-Mailing-List: sashiko-reviews@lists.linux.dev
List-Id: <sashiko-reviews.lists.linux.dev>
List-Subscribe: <mailto:sashiko-reviews+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:sashiko-reviews+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
X-Last-TLS-Session-Version: TLSv1.3

Hi Santhosh,

On 23/07/2026 at 12:02:23 GMT, sashiko-bot@kernel.org wrote:

> Thank you for your contribution! Sashiko AI review found 4 potential issu=
e(s) to consider:
> - [High] Ranked controller optimization downgrades the read variant on tu=
ning failure but fails to update or disable continuous read, leading to pot=
ential controller lockups and data corruption.
> - [High] The SPI NAND chip is unconditionally restored to ODTR mode upon =
system resume, even if controller optimization dynamically fell back to SSD=
R mode at probe time, breaking statically configured dirmaps.
> - [High] SPI controller PHY tuning state is lost across suspend/resume cy=
cles.
> - [Medium] `spinand->max_write_op` is not reset between iterations in
> `spinand_try_ranked_variant()`, leaking `max_freq` modifications
> across tuning attempts.

The four reports seem legitimate. Some are easy to fix, the one about
continuous reads is a real concern I also had during my previous review
but forgot about it, and it is going to be slightly more challenging
than the others to handle properly. Of course we want both features to
work together, ideally.

Thanks,
Miqu=C3=A8l
