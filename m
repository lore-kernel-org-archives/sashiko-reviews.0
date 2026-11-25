Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=185.246.85.4
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795609259;
	b=m1zapvR5tLVdHp/8OuhsaEspYHK8mpTipJdTb+ZIn1ctOVdvvxCTOrmV8GswpV8aQhFS
	 O4PllyDoHWD+pnIfxESa587aebP68VgQTx2VjJQ8+Qca0qcJ9eYHQ2916lwTfq0OCc6ZY
	 Z1YdbUIUGQnrkG864K6yC7yAeAgtW1PBQlV0p0o8j0T/iqmw2eUZpQVQThFxGehtIq93B
	 WkM7DFGCizNwESxPUKlnQPJ/kiu2HeBfuPngDl0wFUjaErmm8q8NqO0FYDv/BS4wKRn07
	 3fPM7GGgeUt15OFEBW9oetFUkZgyQ3NQgaRDejCvSbcLufbqPRy3/cPDRGvG82ipCTg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795609259;
	h=DMARC-Filter:Received:Received:Received:DKIM-Signature:From:To:Cc:
	 Subject:In-Reply-To:References:User-Agent:Date:Message-ID:
	 MIME-Version:Content-Type:Content-Transfer-Encoding:
	 X-Last-TLS-Session-Version;
	bh=fHDkq205OHWCz9XPh90+pVUtgDQFIwSe/rx4XfXAeLM=;
	b=qZ+xrnIqAtILbECMT3hTnajKBqRAfR+/h3yDLWhUkhfF3mFuPO4dzjSLAKEHAboZtvQ9
	 guzoTDwlLccpcgUBaGUsmA9LGD6vQd2y9seZkOPxzJoYgZfVSv+QSbGkcusorYEl9psXe
	 Bs7Gk/aG7NTd9NNLNAT2bfz6WhJpSoamEomLLKUnDq6tnnte/E8fDvzOfGr9cIUN92g6b
	 J0olSBP4QDHwbULFEcPVu8E41GbLxwgwC3wpZPB6rCb7QpF3932jtis383ZikViPYY0kh
	 POvF+5uGBm5ZujeQpUypCAuJG3wjGQWvCnq5YL1NctBD0oxhuJ/3G8zHdS+FXikn27g==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=bootlin.com;
	spf=pass smtp.mailfrom=bootlin.com;
	dkim=pass header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256 header.s=dkim header.b=Di0hGqCL;
	arc=none smtp.remote-ip=185.246.85.4
Received: from smtpout-03.galae.net (smtpout-03.galae.net [185.246.85.4])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 862AC606A321
	for <sashiko-reviews@lists.linux.dev>; Wed, 25 Nov 2026 12:20:57 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 862AC606A321
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=bootlin.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=bootlin.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256 header.s=dkim header.b=Di0hGqCL
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
	by smtpout-03.galae.net (Postfix) with ESMTPS id 99D0F4E41776;
	Wed, 25 Nov 2026 12:20:55 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
	by smtpout-01.galae.net (Postfix) with ESMTPS id 54E3060480;
	Wed, 25 Nov 2026 12:20:55 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id 5709011E69019;
	Wed, 25 Nov 2026 13:20:48 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=dkim;
	t=1795609250; h=from:subject:date:message-id:to:cc:mime-version:content-type:
	 content-transfer-encoding:in-reply-to:references;
	bh=fHDkq205OHWCz9XPh90+pVUtgDQFIwSe/rx4XfXAeLM=;
	b=Di0hGqCLyEBCNCPaWWq5He8ykZWAJB+id9zm6OKUZUBDUAi6oKDvMa9Lh2FOYY9LR144Dy
	861YSbs4//UkVVxJF8oo+Ni9xUuZXbGQWjWy+GGvogqPWhh1ZZOShUqqX9wFkkdEkUKZWp
	Or5jsO9J3fl84XZRleNfEbx+63PHsVgnWIFvBbKA9GFA9w4hJvdbr1duD2PRz0Hf746D8c
	KgTuKPXh5nWM/Z+XZ2DVm4pikKjBOSa40ej26NKemIBbyc+D8K46SffencMhu8Mx2KOwx+
	ukcY+FNjWYHhbsIqY7hYZ5H46WAcNpULhtdQEJnlAzzmF0ND9aTcpdBydX354A==
From: Miquel Raynal <miquel.raynal@bootlin.com>
To: sashiko-bot@kernel.org
Cc: "Ping Li" <leeonion.muyu@gmail.com>,  richard@nod.at,  vigneshr@ti.com,
  sashiko-reviews@lists.linux.dev,  linux-mtd@lists.infradead.org
Subject: Re: [PATCH v4 3/3] mtd: rawnand: r852: declare NAND_USES_DMA
In-Reply-To: <sashiko-outbox-233336@kernel.org> (sashiko-bot@kernel.org's
	message of "Wed, 25 Nov 2026 12:10:29 +0000")
References: <20261125092538.1938516-1-leeonion.muyu@gmail.com>
	<20261125115108.4147741-1-leeonion.muyu@gmail.com>
	<20261125115108.4147741-4-leeonion.muyu@gmail.com>
	<sashiko-outbox-233336@kernel.org>
User-Agent: mu4e 1.12.12; emacs 30.2
Date: Wed, 25 Nov 2026 13:20:47 +0100
Message-ID: <87ik1lyue8.fsf@bootlin.com>
X-Mailing-List: sashiko-reviews@lists.linux.dev
List-Id: <sashiko-reviews.lists.linux.dev>
List-Post: <mailto:sashiko-reviews@lists.linux.dev>
List-Help: <mailto:sashiko-reviews+help@lists.linux.dev>
List-Subscribe: <mailto:sashiko-reviews+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:sashiko-reviews+unsubscribe@lists.linux.dev>
List-Owner: <mailto:sashiko-reviews+owner@lists.linux.dev>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
X-Last-TLS-Session-Version: TLSv1.3

On 25/11/2026 at 12:10:29 GMT, sashiko-bot@kernel.org wrote:

> Thank you for your contribution! Sashiko AI review found 1 potential
> issue to consider:
> - [Low] mtd: rawnand: r852: unconditional NAND_USES_DMA in
>   r852_register_nand_device()

Correct.

Please be a little bit more cautious with your AI submissions.

Miqu=C3=A8l
