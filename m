Received: from smtpout-04.galae.net (smtpout-04.galae.net [185.171.202.116])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A798B3A875F
	for <sashiko-reviews@lists.linux.dev>; Sun, 20 Sep 2026 14:38:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=185.171.202.116
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789915092; cv=none; b=Wa/mEXkA0xbQhURgiIoTKEdQAM+ZLRnENPamyDbxezPxDfFdBNhBO9etpiBaKm/nEET+VtrLZE5qe0DxGjzLSlyGuSs4hD/6vlfuRISI8vYRDP6v7eZXo54Hj2VKLHgQOauzfvobGZN0PQDdp5SDJernCWe3Wz7MUDldC7DiyhI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789915092; c=relaxed/simple;
	bh=JFhAMpKcqCT9uHzVU/MN32RuRVXPbT7jg55CNNemccY=;
	h=From:To:Cc:Subject:In-Reply-To:References:Date:Message-ID:
	 MIME-Version:Content-Type; b=UIdOf/k4VB31rOCv1wkB5Q+ioB2WG55Zcr8ZrAgd4c/auUbVp0Vo34x3H2+YJWIcpP823zFDURj3WiQERNpynp6WgR7pegWGmmvdAHj0EIWpNMPanGunlwAvO3weCUx6dDiUy5fC7qiHw8gZ5SQUIZ0e59WB7VLOhnlD9YoyPOk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=bootlin.com; spf=pass smtp.mailfrom=bootlin.com; dkim=pass (2048-bit key) header.d=bootlin.com header.i=@bootlin.com header.b=X5si8/Ro; arc=none smtp.client-ip=185.171.202.116
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=bootlin.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=bootlin.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bootlin.com header.i=@bootlin.com header.b="X5si8/Ro"
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
	by smtpout-04.galae.net (Postfix) with ESMTPS id 2DEF5C5CD4D;
	Sun, 20 Sep 2026 14:38:49 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
	by smtpout-01.galae.net (Postfix) with ESMTPS id 4CCDE6033F;
	Sun, 20 Sep 2026 14:38:03 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id EBB9210329078;
	Sun, 20 Sep 2026 16:37:56 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=dkim;
	t=1789915082; h=from:subject:date:message-id:to:cc:mime-version:content-type:
	 content-transfer-encoding:in-reply-to:references;
	bh=JFhAMpKcqCT9uHzVU/MN32RuRVXPbT7jg55CNNemccY=;
	b=X5si8/RoJbehh1U3mj+MRrx07ioronomOBnutvN1smWVPL8VkcNSM8GnmgF9L8eMD8OT3F
	IqL68/FFiEzGqVthEZFFUCCHfODcEI+qBh2gN4/iphZ4U7Y5jRjQDBB7p7wpWu+CEXCVAG
	VkYhb6ENHqms+RzMaOInRIVVjyURw7uotXhp9g30fKBz4UQDHbzaQ87kkPUI80JUCL4BHs
	W5dMEA3q0UXUqX6jY2+1FnmyKg2IIn6U1YCG4tsRfSV9cQktXTqmHbSe2POT78rV86FGoU
	m01qfwHy5ZUS4f/hnduLwv18awRkiEU/pEIPbZnOzIYbJTtBAioFmXE//oBd8w==
From: Miquel Raynal <miquel.raynal@bootlin.com>
To: sashiko-bot@kernel.org
Cc: "Pratyush Yadav" <pratyush@kernel.org>,  "Takahiro Kuwano"
 <takahiro.kuwano@infineon.com>,  "Michael Walle" <mwalle@kernel.org>,
  "Vignesh Raghavendra" <vigneshr@ti.com>,  "Richard Weinberger"
 <richard@nod.at>,  sashiko-reviews@lists.linux.dev,  "Steam Lin"
 <STLin2@winbond.com>,  linux-mtd@lists.infradead.org,
  linux-kernel@vger.kernel.org,  "Thomas Petazzoni"
 <thomas.petazzoni@bootlin.com>
Subject: Re: [PATCH v2 17/25] mtd: spi-nor: winbond: Add support for
 W25Q33PW-Q/N
In-Reply-To: <20260920141210.B32B51F000FF@smtp.kernel.org>
	(sashiko-bot@kernel.org's message of "Sun, 20 Sep 2026 14:12:10
	+0000")
References: <20260920-winbond-master-spi-nor-jw-cleanup-pw-addition-v2-0-ab9c9688d071@bootlin.com>
	<20260920-winbond-master-spi-nor-jw-cleanup-pw-addition-v2-17-ab9c9688d071@bootlin.com>
	<20260920141210.B32B51F000FF@smtp.kernel.org>
User-Agent: mu4e 1.12.12; emacs 30.2
Date: Sun, 20 Sep 2026 16:37:55 +0200
Message-ID: <87zexc6la4.fsf@bootlin.com>
Precedence: bulk
X-Mailing-List: sashiko-reviews@lists.linux.dev
List-Id: <sashiko-reviews.lists.linux.dev>
List-Subscribe: <mailto:sashiko-reviews+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:sashiko-reviews+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
X-Last-TLS-Session-Version: TLSv1.3

On 20/09/2026 at 14:12:10 GMT, sashiko-bot@kernel.org wrote:

> Thank you for your contribution! Sashiko AI review found 1 potential
> issue(s) to consider:
> - [Medium] spi-nor: winbond: commit message claims ECC support for
> W25Q33PW-Q/N but code excludes it

The commits are indeed inaccurate, I will fix them both and send a v3.

Miqu=C3=A8l
