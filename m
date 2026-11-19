Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=185.246.84.56
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795091376;
	b=m9cqe0yI2vm2WDcWe5jB2+vdjz+SCt9XwMHhcclpnZR1ktYbiYRCr9/iYot3pVlmHAls
	 jAY8HGFNjh2iKya6e/QTfnK2+YZe0mmOqhgJsfQ/ep40TvdGcEMbUwcJK+0CcA5PuB1FF
	 4DGLX+hCCq4uCD2whI3IoZcJELSHrbN0X7mLRdM2vuAiTTrd7mis8pBn5T9KABbeCgHBP
	 E7MJ0qdB9qJlGLDOSeu4AuQALsNXpQ7AIgmGDEhSd7mBq4gAcj89veAdgUh3RVvPbg3XS
	 gW9jAwMV2Oq9kJbFa/AtRU+ot3XB51yMYYFWq/dkTp8ljz00n058kKN+7HHtXhGKW0g==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795091376;
	h=DMARC-Filter:Received:Received:Received:DKIM-Signature:From:To:Cc:
	 Subject:In-Reply-To:References:User-Agent:Date:Message-ID:
	 MIME-Version:Content-Type:Content-Transfer-Encoding:
	 X-Last-TLS-Session-Version;
	bh=I5kM6fRDA3G9Ft88zbwbvx681/qfCITq2LFIa1aGdno=;
	b=JNkPQtjt8xuzfwxC37JzKvV+gwrZqYSoCXj3J9g+GoFQvUJaZy5S/OTRH9Zo5woMqivJ
	 BWZ0nT5gjwKGik7Dy1agoXiopK8jpUpJpgKxcXF7A3exsT2KdGe7kq97cFPfrgjTvZHkU
	 1UbxqcBNC2OnA9aJQSjNcce3IiOmPJYTFgaqiplwFzH7UxQ0Fs1rAuOzP54WghriPL3ft
	 HQyt95eW6pDGMR4qJvAxs9+InbZPQqoGOzV6cPsXLwMgvuSIH6akOeOaFtEliFuKYJZbs
	 I0UCzTONE4viGmo35FUJQEbdA18LzBvefAEnPtbbNBoKXRHyrOSKMqdSV01lHtNggpg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=bootlin.com;
	spf=pass smtp.mailfrom=bootlin.com;
	dkim=pass header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256 header.s=dkim header.b=gE+OYUHR;
	arc=none smtp.remote-ip=185.246.84.56
Received: from smtpout-02.galae.net (smtpout-02.galae.net [185.246.84.56])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 70AFB606A337
	for <sashiko-reviews@lists.linux.dev>; Thu, 19 Nov 2026 12:29:35 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 70AFB606A337
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=bootlin.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=bootlin.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256 header.s=dkim header.b=gE+OYUHR
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
	by smtpout-02.galae.net (Postfix) with ESMTPS id F30161A170E;
	Thu, 19 Nov 2026 12:29:33 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
	by smtpout-01.galae.net (Postfix) with ESMTPS id BC42360237;
	Thu, 19 Nov 2026 12:29:33 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id DDAF011BC03CF;
	Thu, 19 Nov 2026 13:29:23 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=dkim;
	t=1795091372; h=from:subject:date:message-id:to:cc:mime-version:content-type:
	 content-transfer-encoding:in-reply-to:references;
	bh=I5kM6fRDA3G9Ft88zbwbvx681/qfCITq2LFIa1aGdno=;
	b=gE+OYUHRuCH4EyQw9q30u+uHjHAX8yoadHzMdng8XO8JLrnll2Rr+IRFc1d8hotzsbhsTL
	+GBazhJVI4CYk0a45zBJbc0QEqX+SAFTFd7QVaS+M2BduBq4/WpfVZZ/c8EG8XKh8wyCjD
	D7397fJqui0aqyGhn5F6pEH8gv+1YDALeaGGHMUOmxwsfOHnOpkegu11bY/BbEO0nyYdnd
	Jv9W5K+At6XZhv+ei9pQx8cHo2aHfl4tShWhbB4jCpCpqpo42t6emVBc5oWETuKtXubi6K
	YvKgeULuHE1TBIcZPxKUeaK6t/7yqm+pimhdC4yT2Sg0UocVQaRt7eac23h8SQ==
From: Miquel Raynal <miquel.raynal@bootlin.com>
To: sashiko-bot@kernel.org
Cc: "James Hilliard" <james.hilliard1@gmail.com>,  "Richard Weinberger"
 <richard@nod.at>,  "Vignesh Raghavendra" <vigneshr@ti.com>,  "Sebastian
 Andrzej Siewior" <bigeasy@linutronix.de>,  "Clark Williams"
 <clrkwllms@kernel.org>,  "Steven Rostedt" <rostedt@goodmis.org>,  "Rob
 Herring" <robh@kernel.org>,  "Krzysztof Kozlowski" <krzk+dt@kernel.org>,
  "Conor Dooley" <conor+dt@kernel.org>,  "Philipp Zabel"
 <p.zabel@pengutronix.de>,  sashiko-reviews@lists.linux.dev,  "Chen-Yu
 Tsai" <wens@kernel.org>,  "Jernej Skrabec" <jernej.skrabec@gmail.com>,
  "Samuel Holland" <samuel@sholland.org>,  "Maxime Ripard"
 <mripard@kernel.org>,  "Richard Genoud" <richard.genoud@bootlin.com>,
  "Boris Brezillon" <bbrezillon@kernel.org>,  "Masahiro Yamada"
 <yamada.masahiro@socionext.com>,  "Brian Norris"
 <computersforpeace@gmail.com>,  linux-mtd@lists.infradead.org,
  linux-sunxi@lists.linux.dev,  linux-rt-devel@lists.linux.dev,
  devicetree@vger.kernel.org,  linux-kernel@vger.kernel.org
Subject: Re: [PATCH v10 01/26] mtd: rawnand: sunxi: centralize OOB handling
In-Reply-To: <sashiko-outbox-199823@kernel.org> (sashiko-bot@kernel.org's
	message of "Thu, 05 Nov 2026 19:13:20 +0000")
References: <20261105-submit-sunxi-nand-vendor-oob-layout-v1-v10-0-dca1f6ed29a8@gmail.com>
	<20261105-submit-sunxi-nand-vendor-oob-layout-v1-v10-1-dca1f6ed29a8@gmail.com>
	<sashiko-outbox-199823@kernel.org>
User-Agent: mu4e 1.12.12; emacs 30.2
Date: Thu, 19 Nov 2026 13:29:23 +0100
Message-ID: <877bi9dmxo.fsf@bootlin.com>
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

On 05/11/2026 at 19:13:20 GMT, sashiko-bot@kernel.org wrote:

> Thank you for your contribution! Sashiko AI review found 2 potential issu=
e(s) to consider:
> - [High] mtd: rawnand: sunxi: premature oob_ops selection in sunxi_nand_a=
ttach_chip()
> - [Medium] mtd: rawnand: sunxi: unaddressed maintainer NACK on vendor OOB=
 layout ops
> --
>
> commit 8fda5c99d9befa1771418516828f040de60c5845
> Author: James Hilliard <james.hilliard1@gmail.com>
>
> mtd: rawnand: sunxi: centralize OOB handling
>
> This commit centralizes hardware ECC result interpretation, protected OOB
> retrieval, erased-chunk checking, and user-data layout reservation behind
> per-chip sunxi_nfc_oob_ops callbacks for both PIO and DMA paths.
>
>> diff --git a/drivers/mtd/nand/raw/sunxi_nand.c b/drivers/mtd/nand/raw/su=
nxi_nand.c
>> index f41feebe42571..80006d1a33d68 100644
>> --- a/drivers/mtd/nand/raw/sunxi_nand.c
>> +++ b/drivers/mtd/nand/raw/sunxi_nand.c
> [ ... ]
>> @@ -2066,6 +2096,58 @@ static int sunxi_nfc_maximize_user_data(struct
>> nand_chip *nand, uint32_t oobsize
> [ ... ]
>> +/*
>> + * Both modes use the same layout and ECC policy. Scrambled transfers a=
lso
>> + * compensate the first two user bytes to keep the on-flash BBM unmodif=
ied.
>> + */
>> +static const struct sunxi_nfc_oob_ops sunxi_nfc_plain_oob_ops =3D {
>> +	.min_user_data =3D sunxi_nfc_oob_min_user_data,
>> +	.init_user_data =3D sunxi_nfc_oob_init_user_data,
>> +	.read_batch =3D sunxi_nfc_oob_read_batch,
>> +	.finish_read =3D sunxi_nfc_oob_finish_read,
>> +};
>> +
>> +static const struct sunxi_nfc_oob_ops sunxi_nfc_scrambled_plain_bbm_oob=
_ops =3D {
>> +	.min_user_data =3D sunxi_nfc_oob_min_user_data,
>> +	.init_user_data =3D sunxi_nfc_oob_init_user_data,
>> +	.transform_bbm =3D sunxi_nfc_randomize_bbm,
>> +	.read_batch =3D sunxi_nfc_oob_read_batch,
>> +	.finish_read =3D sunxi_nfc_oob_finish_read,
>> +};
>
> [Severity: Medium]
> As reported by Miquel Raynal on v6 [1], the series adding support for the
> vendor-specific Allwinner randomized OOB layout was declined due to
> maintainability concerns and kernel policy against vendor-specific NAND
> layouts, with an invitation to submit only the standalone fixes outside of
> the randomized layout support.

I hereby confirm that I do not which to merge the support for this
layout.

Please drop it from your series.

Thanks,
Miqu=C3=A8l
