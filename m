Received: from smtpout-03.galae.net (smtpout-03.galae.net [185.246.85.4])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4B31547ACF4
	for <sashiko-reviews@lists.linux.dev>; Wed, 14 Oct 2026 09:18:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=185.246.85.4
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791969500; cv=none; b=mN6U7YE6G+1ZkYSBnJpoqsgKBMKMN6L+DgxtKYAEeGTX5FyJehN67lcA9sos8Bc1Jc331x1Qx2F6skhKvL8YYnibWaQEq9Tadw3D2tPK61k/2QeCPjPZlmOCN2UnNbeYk2gy4V/Gf25sdEwrccf+g9Vo9P6GKmSn1/DrECC2djY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791969500; c=relaxed/simple;
	bh=BQrQJ415lFqktu8wfhzi56O3POtrl1kjqL5oXucFGLE=;
	h=From:To:Cc:Subject:In-Reply-To:References:Date:Message-ID:
	 MIME-Version:Content-Type; b=SBx6TlWJhnwO3BpAMNdZ7+VqGeH8VrApDlgtZkA2Z3K297FHTpKj+Ic1y8GlXy11FWSBVeyy4r+hOMHlTzanQdOcinhXd+K+ZvTHchFzLXVST+Y9ws0S7jFY2ptpUqgGmV4lal7dbs65UiVkt3ut+7sVcWRwGeV8g6WvxKDaSng=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=bootlin.com; spf=pass smtp.mailfrom=bootlin.com; dkim=pass (2048-bit key) header.d=bootlin.com header.i=@bootlin.com header.b=kznN615H; arc=none smtp.client-ip=185.246.85.4
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=bootlin.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=bootlin.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bootlin.com header.i=@bootlin.com header.b="kznN615H"
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
	by smtpout-03.galae.net (Postfix) with ESMTPS id A13134E411F3;
	Wed, 14 Oct 2026 09:18:16 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
	by smtpout-01.galae.net (Postfix) with ESMTPS id 7691960368;
	Wed, 14 Oct 2026 09:18:16 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id 29B2D10328AE5;
	Wed, 14 Oct 2026 11:18:09 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=dkim;
	t=1791969494; h=from:subject:date:message-id:to:cc:mime-version:content-type:
	 content-transfer-encoding:in-reply-to:references;
	bh=gVDJVVXGkBzfUYwNqBZ6DDXQIvFOWpJRrMRJFdS3O14=;
	b=kznN615HBHUoJcKTfKUOqEXUzm5Voxkg2DYv5tG2A3ZoGv+fSnn97G0xBKwio+5eGqs4yw
	ioVFIEmUKLf9kYqHKRZNT9c6TQ2pACmb7iXZ9DaHEoOk3PzSBtV1cvl/15JUnG92A0ySJ8
	IOq6auu/Tb94W2PkJ4UfVZbzOGFPdzmXGTno+OzrPuuxercv3wdPe+spJnnz/lgv9BlF8W
	ioIFakZqAUeium0M7P0B+neRxR+4gjxLjK6PDhCY109QyZJ0ByWcRldN7QohCZnkK6iTfP
	Fu5YZQ2zdKhcZjN7KJXuW56Cmt/tbaot1FYQpjlfA1FOoOIipu91wbvhSuv/Fg==
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
In-Reply-To: <73139fed463dc3c32ccccfddb84d0f500066401f.camel@bootlin.com>
	(Paul Cercueil's message of "Wed, 14 Oct 2026 10:24:45 +0200")
References: <20261013141350.189996-1-paul.cercueil@bootlin.com>
	<20261013141350.189996-2-paul.cercueil@bootlin.com>
	<sashiko-outbox-169898@kernel.org>
	<4a8f6d2bff13967288cbff72d1c3e8fcb4ca9f8d.camel@bootlin.com>
	<87wlrlvbix.fsf@bootlin.com>
	<73139fed463dc3c32ccccfddb84d0f500066401f.camel@bootlin.com>
User-Agent: mu4e 1.12.12; emacs 30.2
Date: Wed, 14 Oct 2026 11:18:08 +0200
Message-ID: <87se28y71r.fsf@bootlin.com>
Precedence: bulk
X-Mailing-List: sashiko-reviews@lists.linux.dev
List-Id: <sashiko-reviews.lists.linux.dev>
List-Subscribe: <mailto:sashiko-reviews+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:sashiko-reviews+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
X-Last-TLS-Session-Version: TLSv1.3

On 14/10/2026 at 10:24:45 +02, Paul Cercueil <paul.cercueil@bootlin.com> wr=
ote:

> Hi Miqu=C3=A8l,
>
> Le mardi 13 octobre 2026 =C3=A0 17:57 +0200, Miquel Raynal a =C3=A9crit=
=C2=A0:
>> Hi Paul,
>>=20
>> On 13/10/2026 at 17:33:32 +02, Paul Cercueil <paul.cercueil@bootlin.com>
>> wrote:
>>=20
>> > Hi Sashiko,
>>=20
>> :-)
>>=20
>> > > > -		ret =3D spi_mem_access_start(mem);
>> > > > +		if (!op->panic_write)
>> > > > +			ret =3D spi_mem_access_start(mem);
>> > > > +		else if (ctlr->auto_runtime_pm)
>> > > > +			ret =3D pm_runtime_get_if_active(ctlr-
>> > > > >dev.parent);
>> > > > =C2=A0		if (ret)
>> > > > =C2=A0			return ret;
>> > >=20
>> > > [Severity: High]
>> > > Is it safe to call pm_runtime_get_if_active() here during a kernel p=
anic?
>> > >=20
>> > > pm_runtime_get_if_active() relies on pm_runtime_get_conditional(), w=
hich
>> > > unconditionally acquires dev->power.lock via spin_lock_irqsave(). In=
 a
>> > > panic
>> > > context with NMIs or IRQs disabled, trying to acquire a spinlock tha=
t may
>> > > be
>> > > held by a halted CPU causes an infinite spin. On PREEMPT_RT,
>> > > spin_lock_irqsave()
>> > > maps to a sleeping rt_mutex, which is strictly forbidden in atomic
>> > > context.
>> >=20
>> > ACK, I'll just drop pm_runtime_get_if_active() here, and restore the r=
eturn
>> > -
>> > EOPNOTSUPP that was in v1 when ctlr->auto_runtime_pm is set.
>>=20
>> This is tricky but automatically rules out about 1/6th of the
>> controllers (45 controllers set this boolean out of +300). I don't like
>> it much. I guess it deserves a comment in case someone ever wants to
>> enable this feature on their auto-RPM-enabled controller, to understand
>> why this is not possible. My gut feeling is that the runtime PM layer
>> lacks its own understanding of what a panic is. We should, I believe, be
>> able to query the usage_count of a controller without taking the lock
>> during a panic write.
>>=20
>> Nevertheless, let's move forward and return an error for now.
>
> I guess I can use pm_runtime_active() then?

Ah, yes!
