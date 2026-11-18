Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=185.246.84.56
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794991541;
	b=FRY4xJadHe77z5SgJCL9M9ww5+bc6cIkapCmuiTYGE6ex6wvUuDwrKgqgxeGPyef20kT
	 tbxCOywiXa9N0BYBJNQkL7nYzV6V+GeAjSCdWERZouBj0BgUREACUwFj81QtRwhNlq73K
	 imxC+bpYrRbAQ4KDj+TUn+eSHLb4/tyU9QHpodUY0g8dMGedqxGGZpbkEiuwclEnH+vnf
	 jnw0tZsSbtNYdKm/3F1knB5fvglwyQjBkdc3wisVX8WBe8ZZnb+2G8TpwB4GJdaR3W2ZU
	 jtVJ472lewkuvp9lY5plIBvK9aViEfHT+cGPIK21NwML23xeI+h4Kp5np3BUsp0H6xw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794991541;
	h=DMARC-Filter:Received:Received:Received:DKIM-Signature:From:To:Cc:
	 Subject:In-Reply-To:References:User-Agent:Date:Message-ID:
	 MIME-Version:Content-Type:Content-Transfer-Encoding:
	 X-Last-TLS-Session-Version;
	bh=D8aW/fvdy/qLsQ/bXMIpI7RqiPKFGY+NzzzViUtgqks=;
	b=cdUZkAN2xWFOfBIsc77o42GXDRw2eq8x2R/gzA02Svf49wFYIhWNggHkyey943Mgkbdc
	 ap/qu2vTxmtn6iyfmK8LMvVqoe/yZJ6W554Uye/YVEDSjOruzd4nYJbQp8JqIS5E0QtEp
	 mpiw3I2XCcJ24+FMIBBzlxhMgPByKEN984pmShVNTMeoEbGViQq0fRt69lccMEe+PCcSt
	 sS+un2SIvlLFnf/tKFQzL2gmh3b3xp4Eqe5tPXwII5d0obvt0Aq+HIoNdM/kdO4mq6kY8
	 vivh3Ona1xcgaYssGA618Z42ygESRr0sV3hdy7isqnH9pXeluvKjg2nlp+0Ux88VwQw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=bootlin.com;
	spf=pass smtp.mailfrom=bootlin.com;
	dkim=pass header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256 header.s=dkim header.b=fCOn2VL0;
	arc=none smtp.remote-ip=185.246.84.56
Received: from smtpout-02.galae.net (smtpout-02.galae.net [185.246.84.56])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5D156606A325
	for <sashiko-reviews@lists.linux.dev>; Wed, 18 Nov 2026 08:45:39 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 5D156606A325
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=bootlin.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=bootlin.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256 header.s=dkim header.b=fCOn2VL0
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
	by smtpout-02.galae.net (Postfix) with ESMTPS id A953F1A16A8;
	Wed, 18 Nov 2026 08:45:37 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
	by smtpout-01.galae.net (Postfix) with ESMTPS id 77ADB5FE9B;
	Wed, 18 Nov 2026 08:45:37 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id 0875711BC0AAD;
	Wed, 18 Nov 2026 09:45:32 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=dkim;
	t=1794991536; h=from:subject:date:message-id:to:cc:mime-version:content-type:
	 content-transfer-encoding:in-reply-to:references;
	bh=D8aW/fvdy/qLsQ/bXMIpI7RqiPKFGY+NzzzViUtgqks=;
	b=fCOn2VL04CAe4uc6dNNRn8T9M6+C0SFFRTRTKjqQLDTSj+zt2weyl6UhwTCQLP1CirhTF2
	dX3lt9nkzB8WhYESBI57iKo5mPcVtzzpc3mq0OiRrLloQIKYQLxyU5q05+VtVizsKNdIcZ
	IQzZnd67Apy7fEK9U8BedwPaDjATqsCn1levczvqWIoES8I2cgNmgHmjIgDN9UlesQkd2j
	kwRbwg3Uckfcck8xT0GZEF9HvXUkTdxfO6Vfgf3RaAVkAS+SrrIRdIgivr1LdEzfrQPVA0
	E+Y2pXka3EguqmDdPtE0jHibIzQADHDnVV0L5Jmprx24e/eRfwouGfD8XkPt0g==
From: Miquel Raynal <miquel.raynal@bootlin.com>
To: sashiko-bot@kernel.org
Cc: "Gabor Juhos" <j4g8y7@gmail.com>,  "Richard Weinberger"
 <richard@nod.at>,  "Vignesh Raghavendra" <vigneshr@ti.com>,  "Boris
 Brezillon" <boris.brezillon@collabora.com>,
  sashiko-reviews@lists.linux.dev,  linux-mtd@lists.infradead.org
Subject: Re: [PATCH] mtd: spinand: set request type explicitly in
 spinand_{is,mark}bad() functions
In-Reply-To: <sashiko-outbox-219169@kernel.org> (sashiko-bot@kernel.org's
	message of "Tue, 17 Nov 2026 16:27:11 +0000")
References: <20261117-spinand-set-req-type-in-bbm-functions-v1-1-f46d5b3b8cf3@gmail.com>
	<sashiko-outbox-219169@kernel.org>
User-Agent: mu4e 1.12.12; emacs 30.2
Date: Wed, 18 Nov 2026 09:45:32 +0100
Message-ID: <87wlqajzo3.fsf@bootlin.com>
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

Hi Gabor,

On 17/11/2026 at 16:27:11 GMT, sashiko-bot@kernel.org wrote:

> Thank you for your contribution! Sashiko AI review found no new issues
> in this patch, but noticed 1 related pre-existing issue it does not
> introduce:
> - [Critical] mtd: spinand: 1-byte bad block marker overlap in
>   ooblayout_free() [1]
> --
>
> commit cd3136a28caa4c65d360f664085cbb1e630acb0f
> Author: Gabor Juhos <j4g8y7@gmail.com>
>
> mtd: spinand: set request type explicitly in spinand_{is,mark}bad() funct=
ions
>
> This commit explicitly sets req.type to NAND_PAGE_READ in spinand_isbad()
> and NAND_PAGE_WRITE in spinand_markbad().
>
> Link: https://sashiko.dev/#/log/192383
>
>> diff --git a/drivers/mtd/nand/spi/core.c b/drivers/mtd/nand/spi/core.c
>> index 18bba02fbd31f..35bcb4a8861b4 100644
>> --- a/drivers/mtd/nand/spi/core.c
>> +++ b/drivers/mtd/nand/spi/core.c
>> @@ -1105,6 +1105,7 @@ static bool spinand_isbad(struct nand_device *nand=
, const struct nand_pos *pos)
>>  	struct spinand_device *spinand =3D nand_to_spinand(nand);
>>  	u8 marker[2] =3D { };
>>  	struct nand_page_io_req req =3D {
>> +		.type =3D NAND_PAGE_READ,
>>  		.pos =3D *pos,
>>  		.ooblen =3D sizeof(marker),
>>  		.ooboffs =3D 0,
>
> [Severity: Critical]
> This problem wasn't introduced by this patch, but can the 2-byte marker[]
> read in spinand_isbad() [1] collide with free OOB space on chips that
> reserve only 1 byte for the bad block marker?
>
> spinand_isbad() treats a block as bad whenever marker[0] !=3D 0xff ||
> marker[1] !=3D 0xff, reading OOB offsets 0 and 1.  However, several vendor
> ooblayout_free() callbacks expose OOB offset 1 as free space:
>
> drivers/mtd/nand/spi/gigadevice.c:gd5fxgq4xa_ooblayout_free() {

The bug is in the gigadevice driver. It was arbtrarily decided to keep
using 2 bytes BBM like in the raw NAND world.

You may fix this driver in a separate patch, but that is not a
prerequisite for me.

However, why is this not stable material?

Thanks,
Miqu=C3=A8l
