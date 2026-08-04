Received: from smtpout-02.galae.net (smtpout-02.galae.net [185.246.84.56])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0D7583C7689
	for <sashiko-reviews@lists.linux.dev>; Tue,  4 Aug 2026 13:29:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=185.246.84.56
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785850195; cv=none; b=Hfi1gxft1dNzlB7uyJejxxIrldRIv4fmNP6cvGZQYGimfn6V+swbpZ5tzTt6NeM8KkAY8dIR6GHU5n3uV/OTuLg2Xzb05deJ2lMXilkoJ3wfZvYSYFEL7ozsTaiv0aE1Ec6BCQ54pCB5SF7+arGM7JFHpAg/zkyP9S4H0C2f5hY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785850195; c=relaxed/simple;
	bh=bD5QRcZh6DnQVOaHcGNDWpPuhP9UGm/59ubY1uhhIcs=;
	h=From:To:Cc:Subject:In-Reply-To:References:Date:Message-ID:
	 MIME-Version:Content-Type; b=DW913c+v51SLcHfKqyDeV/Si6Rup+gEqrAcqkfmUSKS3PDzd9k1NHiOTnmfy2NRqi82Isl4K76+sTlZat0SUbT6aX7DCLD9nYxVELUluIje9t5yr74Z5I6frH0KP8sGp4Qz/9xU5mlH4v5Q19POoOKRYa8lhNJvdZJjNZRTU7XQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=bootlin.com; spf=pass smtp.mailfrom=bootlin.com; dkim=pass (2048-bit key) header.d=bootlin.com header.i=@bootlin.com header.b=Wcoh5C0W; arc=none smtp.client-ip=185.246.84.56
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=bootlin.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=bootlin.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bootlin.com header.i=@bootlin.com header.b="Wcoh5C0W"
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
	by smtpout-02.galae.net (Postfix) with ESMTPS id 27BE41A13F7;
	Tue,  4 Aug 2026 13:29:50 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
	by smtpout-01.galae.net (Postfix) with ESMTPS id ECE946029E;
	Tue,  4 Aug 2026 13:29:49 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id 2691B11C3270A;
	Tue,  4 Aug 2026 15:29:43 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=dkim;
	t=1785850185; h=from:subject:date:message-id:to:cc:mime-version:content-type:
	 content-transfer-encoding:in-reply-to:references;
	bh=bD5QRcZh6DnQVOaHcGNDWpPuhP9UGm/59ubY1uhhIcs=;
	b=Wcoh5C0WERIjdgHXfeqIEEIKh+cnqGjLJ3IIwMXJE2qSgFGd8TUnQDyquORD9YxvLOd64V
	m5l7Wi1PBAPQ+SxpXXlbHyAI772g54AvfgFNFBxdVSYrIDdfD9IO3yJBJDhiVXs/dN0oMG
	+W9G9e5Sg1DPL28q9IvZ448/9gg6qjtP0YhzW81jEOIOD7stPIF6NXD3QKWVGqP/kHaQU7
	A8uM34r4cUnPa46olshWaEH2BqL4C7NfW+8f8rl0+j7UhLMRiDDuoJkK9nsQYffg7bQ8il
	uyFOE491J+6U2fsNapk9LTyr2cRTi8UVZrkE1iFEZuFS4CPsej+Q7bKtiNQjig==
From: Miquel Raynal <miquel.raynal@bootlin.com>
To: sashiko-bot@kernel.org
Cc: sashiko-reviews@lists.linux.dev,  "Pratyush Yadav"
 <pratyush@kernel.org>,  "Michael Walle" <mwalle@kernel.org>,  "Takahiro
 Kuwano" <takahiro.kuwano@infineon.com>,  "Vignesh Raghavendra"
 <vigneshr@ti.com>,  "Richard Weinberger" <richard@nod.at>
Subject: Re: [PATCH v3 03/27] mtd: spi-nor: Unconditionally parse SFDP in
 the deprecated path
In-Reply-To: <20260804111805.6F02F1F000E9@smtp.kernel.org>
	(sashiko-bot@kernel.org's message of "Tue, 04 Aug 2026 11:18:05
	+0000")
References: <20260804-winbond-v7-1-spi-nor-jv-cleanup-v3-0-542ce107bc92@bootlin.com>
	<20260804-winbond-v7-1-spi-nor-jv-cleanup-v3-3-542ce107bc92@bootlin.com>
	<20260804111805.6F02F1F000E9@smtp.kernel.org>
User-Agent: mu4e 1.12.12; emacs 30.2
Date: Tue, 04 Aug 2026 15:29:42 +0200
Message-ID: <87zez2f1yx.fsf@bootlin.com>
Precedence: bulk
X-Mailing-List: sashiko-reviews@lists.linux.dev
List-Id: <sashiko-reviews.lists.linux.dev>
List-Subscribe: <mailto:sashiko-reviews+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:sashiko-reviews+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
X-Last-TLS-Session-Version: TLSv1.3

Hello all,

I find very strange to answer to a review without the normal Cc list in
copy, nor the list. I am more and more tempted to say this is a problem
and we should just let Sashiko reviews flow.

What I also find problematic is the fact that Sashiko does not learn
from one iteration to another. So people will have to keep answering the
same remarks over and over again.

Nevertheless, two comments below.

On 04/08/2026 at 11:18:05 GMT, sashiko-bot@kernel.org wrote:

> Thank you for your contribution! Sashiko AI review found 2 potential issu=
e(s) to consider:
>
> New issues:
> - [High] Unconditional SFDP probing intentionally breaks backward
> compatibility for legacy non-SFDP chips.

This is all explained in the commit log, it can be debated, but it is
already flagged.

> Pre-existing issues:
> - [High] Incomplete error rollback in
> `spi_nor_sfdp_init_params_deprecated()` leaves `nor->flags` and
> `nor->cmd_ext_type` corrupted on partial SFDP parsing failure.

This is an hallucination, the bfpt table parsing is the last step and
there is no fatal return case past the point where we set the flags.

Thanks,
Miqu=C3=A8l
