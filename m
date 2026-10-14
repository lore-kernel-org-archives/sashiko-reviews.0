Received: from smtpout-03.galae.net (smtpout-03.galae.net [185.246.85.4])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D9F7C1DDC38
	for <sashiko-reviews@lists.linux.dev>; Wed, 14 Oct 2026 08:56:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=185.246.85.4
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791968220; cv=none; b=s4n6jboky0wok/D20L+HL8vg2wkAhWF89pfrk6U/izJiBR+WKQQ4A1HowtulKcTwk1zdxNJmRv8+OY9teJHn5f/pxF1uiRAMiWrPXSeQ4eGru17EZRZq5jFJ7wAVgmMVuT1q6UujlM5KuHDu/OR6gTdjSG7JQiF8EMLeFt15BM4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791968220; c=relaxed/simple;
	bh=QXEXhFBvt4F4QT67cXrgn/2jcAONBRGyvL007IxDRsY=;
	h=From:To:Cc:Subject:In-Reply-To:References:Date:Message-ID:
	 MIME-Version:Content-Type; b=U9hVe2lyg72vZMCEdoatOiCSAWZcuZUP2CPgzZvI1pJxy0WBQPn+EgFYuJX9urfxCL09bt1FRlskjaQL3YnEUFXUFBPwXiE7EsuJDEhmMt0lg7R7Lyr4VCkUbqrb48WLOeWmTnLB/fUAslMqfF6rXrAn0g8nLRzLd6SnWXMmXsg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=bootlin.com; spf=pass smtp.mailfrom=bootlin.com; dkim=pass (2048-bit key) header.d=bootlin.com header.i=@bootlin.com header.b=rCFDiC6P; arc=none smtp.client-ip=185.246.85.4
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=bootlin.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=bootlin.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bootlin.com header.i=@bootlin.com header.b="rCFDiC6P"
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
	by smtpout-03.galae.net (Postfix) with ESMTPS id 33DBA4E4120B;
	Wed, 14 Oct 2026 08:56:57 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
	by smtpout-01.galae.net (Postfix) with ESMTPS id 086C860368;
	Wed, 14 Oct 2026 08:56:57 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id B7F98103286A7;
	Wed, 14 Oct 2026 10:56:53 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=dkim;
	t=1791968216; h=from:subject:date:message-id:to:cc:mime-version:content-type:
	 content-transfer-encoding:in-reply-to:references;
	bh=QXEXhFBvt4F4QT67cXrgn/2jcAONBRGyvL007IxDRsY=;
	b=rCFDiC6Pd5sxTy0QeydLhT83XQRzmar+QdOIA+cYjU0cWFzoJ2nj6GP/iHgJPDdwUTPtvT
	ssy9Ep2wplciyZH5IX3PyBTJPImiGgSiHNBu9/wYRD/wZXb2PhxOyv6NvCJddVRjYY+7uk
	oI0SkqgVa/2ZVzb1arcpbzw1lICkL1/mNK5JThABjdYeH0KVfdDih5LkUIcG/JqJBJsWFr
	ykGSo7vjFQ0KT3WvT6fYThkaxnRmXQurdGQCMOEKOpSNJOCXJPtA4gMh/LFq4Oaj4/iC8b
	sb5+X0FBtAtaJoCfXVOOJp9e6T8s7mMJzwZ9+DF78yj81HAQxEhvXyFmzW32sg==
From: Miquel Raynal <miquel.raynal@bootlin.com>
To: sashiko-bot@kernel.org
Cc: "Pratyush Yadav" <pratyush@kernel.org>,  "Michael Walle"
 <mwalle@kernel.org>,  "Takahiro Kuwano" <takahiro.kuwano@infineon.com>,
  "Richard Weinberger" <richard@nod.at>,  "Vignesh Raghavendra"
 <vigneshr@ti.com>,  sashiko-reviews@lists.linux.dev,  "Thomas Petazzoni"
 <thomas.petazzoni@bootlin.com>,  "Steam Lin" <STLin2@winbond.com>,
  linux-mtd@lists.infradead.org
Subject: Re: [PATCH v3 08/17] mtd: spi-nor: Fix WRSR with ODTR chips
In-Reply-To: <sashiko-outbox-170165@kernel.org> (sashiko-bot@kernel.org's
	message of "Tue, 13 Oct 2026 16:51:49 +0000")
References: <20261013-winbond-master-spi-nor-w35t-v3-0-6dde1d513df8@bootlin.com>
	<20261013-winbond-master-spi-nor-w35t-v3-8-6dde1d513df8@bootlin.com>
	<sashiko-outbox-170165@kernel.org>
User-Agent: mu4e 1.12.12; emacs 30.2
Date: Wed, 14 Oct 2026 10:56:53 +0200
Message-ID: <87a4ogzmlm.fsf@bootlin.com>
Precedence: bulk
X-Mailing-List: sashiko-reviews@lists.linux.dev
List-Id: <sashiko-reviews.lists.linux.dev>
List-Subscribe: <mailto:sashiko-reviews+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:sashiko-reviews+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
X-Last-TLS-Session-Version: TLSv1.3

On 13/10/2026 at 16:51:49 GMT, sashiko-bot@kernel.org wrote:

> Thank you for your contribution! Sashiko AI review found 1 potential issu=
e(s) to consider:
> - [High] spi-nor: Unconditional -EINVAL for 2-byte writes in DTR mode
> breaks flash unlocking

Yes, I have never encountered ODTR chip with that capability, so it is
future proof to simply prevent any ODTR chip from using that in the
general path. This is intentional and should remain.

Won't fix, until we get a new chip that has an actual problem with it.

Miqu=C3=A8l
