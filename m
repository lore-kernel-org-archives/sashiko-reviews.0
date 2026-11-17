Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=185.171.202.116
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794924503;
	b=EWa7BC+bZCdwG4ZdR18sIkCE/maVghXxar4WgCnbmbA9qh7aH9GaVNh945mNAKLw8vzP
	 gUmQkFduT0CB6TUCFT5sDe3zT2qOZ1X7PJPtG1xMwOlkuRpONOZLu2AbI2xBF2Qj2uj0S
	 UF6BGGnzCdT9EGRqEFU+5TYP/62nXvn9QptYZHBN+ME/zD8QDT+jyac1WKYA0zHaZQEqJ
	 UNcycGmovdFrcfB7uoejkeB431l7EZHrg4J8U97gKmwG1WH4+/ke37Qj7RBmkBchNCaP4
	 ugMMtRXTeVUULlp9gfPA3+M29kV7ZChESZrgVbBYfRdEBUFSyYz6e2o9Tj96jkgfbEg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794924503;
	h=DMARC-Filter:Received:Received:Received:DKIM-Signature:From:To:Cc:
	 Subject:In-Reply-To:References:User-Agent:Date:Message-ID:
	 MIME-Version:Content-Type:Content-Transfer-Encoding:
	 X-Last-TLS-Session-Version;
	bh=NC6ZdVr8PNnbXOJqM4/9u9Fx5qy89lUhN3gY95QsORE=;
	b=1G8fX4rymppzsjZHtDPfEOV9Mff2F8E2EKfhiF63dMRZGaRoRTWr38XTjKGAXqIasuGo
	 7YH/mb2QQGK8QEdSAbR02d04PUr0OYiOycKkRurWYNpQGxgCoQ56I55KYvcFnGV1mrysO
	 wLjyVBKp/kOUMZEyDcc3Pd2i2VrcZnlBBMKDM2EOQtr8sn2gJO1LYrb/nTiOWzGah/dwj
	 Hk9UovAZkuWQ0cAzYOKi/R6irqIpYZMpylbsn6IZyoZAdCkzY8NLGXpT/yY9iOe8xEaqH
	 KS7tH4MZ1Kw7hx2dzjlFs/E46X1Q0uu9VcK9WCwXrXs4jjeVJ/aj2pXrqDOw1xnJnng==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=bootlin.com;
	spf=pass smtp.mailfrom=bootlin.com;
	dkim=pass header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256 header.s=dkim header.b=np0ax1GY;
	arc=none smtp.remote-ip=185.171.202.116
Received: from smtpout-04.galae.net (smtpout-04.galae.net [185.171.202.116])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DFC34606A31C
	for <sashiko-reviews@lists.linux.dev>; Tue, 17 Nov 2026 14:08:22 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org DFC34606A31C
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=bootlin.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=bootlin.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256 header.s=dkim header.b=np0ax1GY
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
	by smtpout-04.galae.net (Postfix) with ESMTPS id C7183C79A9B;
	Tue, 17 Nov 2026 14:08:25 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
	by smtpout-01.galae.net (Postfix) with ESMTPS id 5A88A5FC81;
	Tue, 17 Nov 2026 14:08:21 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id 8A87611BC0024;
	Tue, 17 Nov 2026 15:08:16 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=dkim;
	t=1794924500; h=from:subject:date:message-id:to:cc:mime-version:content-type:
	 content-transfer-encoding:in-reply-to:references;
	bh=NC6ZdVr8PNnbXOJqM4/9u9Fx5qy89lUhN3gY95QsORE=;
	b=np0ax1GYh8y8hX/axL4c6tX2KdsQYngA5vekITEeamJXrmg5sltJaPe9OWZkkhSkftPAXY
	VtQFeF6swqfLZqxWNM+Um1JQfbVJkKfFRXE/ufXEel2BgG/BajJX6tYxs4pbKCMIZRKAkS
	FdJ7tkG1tisvq2hfLpRNzJoOA6GBWwpjWkg1SryPcAKIKiZYgV5gRlW1jS9l3U5430sTvN
	R5cH+0+dbJ43DMk+lJHGWxk+k3e0lmMF3JhPz12q+FFy0Vm1vyenAKYQeggt4VZGojRn5D
	+c9Kseq0X3nA2m7F5EBf9DSQ+SSSBv4v+ei6j/bva7J92BEx7fGiBpHXb2uubA==
From: Miquel Raynal <miquel.raynal@bootlin.com>
To: sashiko-bot@kernel.org
Cc: "Samarth Narang" <samarth.colleges@gmail.com>,  "Vignesh Raghavendra"
 <vigneshr@ti.com>,  "Han Xu" <han.xu@nxp.com>,  "Manivannan Sadhasivam"
 <mani@kernel.org>,  "Maxime Coquelin" <mcoquelin.stm32@gmail.com>,
  "Alexandre Torgue" <alexandre.torgue@foss.st.com>,
  sashiko-reviews@lists.linux.dev,  "Richard Weinberger" <richard@nod.at>,
  linux-mtd@lists.infradead.org,  imx@lists.linux.dev,
  linux-stm32@st-md-mailman.stormreply.com,  Frank.Li@kernel.org
Subject: Re: [PATCH v2 5/6] mtd: rawnand: marvell: stop DMA before unmapping
 on timeout
In-Reply-To: <sashiko-outbox-191272@kernel.org> (sashiko-bot@kernel.org's
	message of "Fri, 30 Oct 2026 16:38:42 +0000")
References: <20261030162041.2998170-1-samarth.colleges@gmail.com>
	<20261030162041.2998170-6-samarth.colleges@gmail.com>
	<sashiko-outbox-191272@kernel.org>
User-Agent: mu4e 1.12.12; emacs 30.2
Date: Tue, 17 Nov 2026 15:08:15 +0100
Message-ID: <87h5hflfe8.fsf@bootlin.com>
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

On 30/10/2026 at 16:38:42 GMT, sashiko-bot@kernel.org wrote:

> Thank you for your contribution! Sashiko AI review found 1 potential issu=
e(s) to consider:
> - [Medium] mtd: rawnand: marvell: sleep in atomic context in
> marvell_nfc_xfer_data_dma()

I'll be taking the other patches, please fix this one!

Thanks,
Miqu=C3=A8l
