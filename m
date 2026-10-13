Received: from smtpout-02.galae.net (smtpout-02.galae.net [185.246.84.56])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 755FD41167C
	for <sashiko-reviews@lists.linux.dev>; Tue, 13 Oct 2026 15:57:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=185.246.84.56
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791907058; cv=none; b=eOZd427r9ClQ3shUWf9P25a9bUswqCsMJ0uhXrbkI6fJf4UERy8/muPls4dXSB9E2YBWfq26NOBnfOUlNwLeleuAH5NX5AW/BY+qAEx4+Hp5marPWACSVYqb+cr6E50onJ7bbHJgYy3NU6nZIib7uVDm5kVGXijSoIMhrTqVRy4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791907058; c=relaxed/simple;
	bh=Up6Y6XybgD+TryRl+Xd9Wr0frOh7luR2EF70wJKDYLE=;
	h=From:To:Cc:Subject:In-Reply-To:References:Date:Message-ID:
	 MIME-Version:Content-Type; b=lQs9DB7mDf5fZyxwoYueLqn/bmnX8h9NIdYU33Nu6BQdl1hiKWQophkTZ7dHq9eum7/ksL8Sy7KW+SsSrylrFTa5KrxFAbIIv+Mf5tvKfovuRYGG4IxKXD1ybeHABdPY0BaNhe+XYyyfsKM2T/d6BLt8OU5L7RFHNtKTliO/B8w=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=bootlin.com; spf=pass smtp.mailfrom=bootlin.com; dkim=pass (2048-bit key) header.d=bootlin.com header.i=@bootlin.com header.b=aA49FrBj; arc=none smtp.client-ip=185.246.84.56
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=bootlin.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=bootlin.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bootlin.com header.i=@bootlin.com header.b="aA49FrBj"
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
	by smtpout-02.galae.net (Postfix) with ESMTPS id 152DD1A1215;
	Tue, 13 Oct 2026 15:57:35 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
	by smtpout-01.galae.net (Postfix) with ESMTPS id D9A4060362;
	Tue, 13 Oct 2026 15:57:34 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id AFBC211D7163B;
	Tue, 13 Oct 2026 17:57:26 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=dkim;
	t=1791907053; h=from:subject:date:message-id:to:cc:mime-version:content-type:
	 content-transfer-encoding:in-reply-to:references;
	bh=XmDIt57YK7EFzUiQBbov5dyO/IGnGYJ7e2nfQyFl2Xk=;
	b=aA49FrBjEavkaHu0veD8qFOVER3plJoBrfelUdhA6EapWy27npdqBjv/PvTD+WSc9e4OxH
	FqyCZDB/GCgSqWFY0W2XonigdCnd42jHLZ2uoWra2xDXyXJO4PUVkblFs3tKBLgUc3iptw
	asrDi3uu3hsa4fq1bv6yb1p+gt2u66qAwTqZaKDHS3N0h6S1ZKqP5d5zTiTfeuqhftXm6b
	Tuw1MvI+uEgwF3gqJC10yEt53Fi1KhnsSt2mUxxA3Uj9ig/3OdrHt93yt7z9wLmzE2eceI
	Qn1C0OqYxSeBDLpqM6sq1tmqpuV0Pe3gJ31uaN7Qcpf5Dbu74BtJNcBiw3WjIg==
From: Miquel Raynal <miquel.raynal@bootlin.com>
To: Paul Cercueil <paul.cercueil@bootlin.com>
Cc: sashiko-reviews@lists.linux.dev,  Pratyush Yadav <pratyush@kernel.org>,
  Michael Walle <mwalle@kernel.org>,  Takahiro Kuwano
 <takahiro.kuwano@infineon.com>,  Richard Weinberger <richard@nod.at>,
  Vignesh Raghavendra <vigneshr@ti.com>,  Mark Brown <broonie@kernel.org>,
  Thomas Petazzoni <thomas.petazzoni@bootlin.com>,  Kees Cook
 <kees@kernel.org>,  Tony Luck <tony.luck@intel.com>,  "Guilherme G .
 Piccoli" <gpiccoli@igalia.com>,  linux-mtd@lists.infradead.org,  Bharat
 Bhushan <bbhushan2@marvell.com>,  Sunil Kovvuri Goutham
 <sgoutham@marvell.com>,  Tanmay Jagdale <tanmay@marvell.com>
Subject: Re: [PATCH v2 1/7] spi: spi-mem: Add support for panic mem writes
In-Reply-To: <4a8f6d2bff13967288cbff72d1c3e8fcb4ca9f8d.camel@bootlin.com>
	(Paul Cercueil's message of "Tue, 13 Oct 2026 17:33:32 +0200")
References: <20261013141350.189996-1-paul.cercueil@bootlin.com>
	<20261013141350.189996-2-paul.cercueil@bootlin.com>
	<sashiko-outbox-169898@kernel.org>
	<4a8f6d2bff13967288cbff72d1c3e8fcb4ca9f8d.camel@bootlin.com>
User-Agent: mu4e 1.12.12; emacs 30.2
Date: Tue, 13 Oct 2026 17:57:26 +0200
Message-ID: <87wlrlvbix.fsf@bootlin.com>
Precedence: bulk
X-Mailing-List: sashiko-reviews@lists.linux.dev
List-Id: <sashiko-reviews.lists.linux.dev>
List-Subscribe: <mailto:sashiko-reviews+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:sashiko-reviews+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
X-Last-TLS-Session-Version: TLSv1.3

Hi Paul,

On 13/10/2026 at 17:33:32 +02, Paul Cercueil <paul.cercueil@bootlin.com> wr=
ote:

> Hi Sashiko,

:-)

>> > -		ret =3D spi_mem_access_start(mem);
>> > +		if (!op->panic_write)
>> > +			ret =3D spi_mem_access_start(mem);
>> > +		else if (ctlr->auto_runtime_pm)
>> > +			ret =3D pm_runtime_get_if_active(ctlr->dev.parent);
>> > =C2=A0		if (ret)
>> > =C2=A0			return ret;
>>=20
>> [Severity: High]
>> Is it safe to call pm_runtime_get_if_active() here during a kernel panic?
>>=20
>> pm_runtime_get_if_active() relies on pm_runtime_get_conditional(), which
>> unconditionally acquires dev->power.lock via spin_lock_irqsave(). In a p=
anic
>> context with NMIs or IRQs disabled, trying to acquire a spinlock that ma=
y be
>> held by a halted CPU causes an infinite spin. On PREEMPT_RT,
>> spin_lock_irqsave()
>> maps to a sleeping rt_mutex, which is strictly forbidden in atomic conte=
xt.
>
> ACK, I'll just drop pm_runtime_get_if_active() here, and restore the retu=
rn -
> EOPNOTSUPP that was in v1 when ctlr->auto_runtime_pm is set.

This is tricky but automatically rules out about 1/6th of the
controllers (45 controllers set this boolean out of +300). I don't like
it much. I guess it deserves a comment in case someone ever wants to
enable this feature on their auto-RPM-enabled controller, to understand
why this is not possible. My gut feeling is that the runtime PM layer
lacks its own understanding of what a panic is. We should, I believe, be
able to query the usage_count of a controller without taking the lock
during a panic write.

Nevertheless, let's move forward and return an error for now.

Thanks,
Miqu=C3=A8l
