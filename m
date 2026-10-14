Received: from smtpout-04.galae.net (smtpout-04.galae.net [185.171.202.116])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DC6EA48F018
	for <sashiko-reviews@lists.linux.dev>; Wed, 14 Oct 2026 09:09:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=185.171.202.116
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791968950; cv=none; b=gud4Unj+SQJCk3w2gLyAjnZQFYjPFySqNxoHu4WI9AzoKqxJNP/ahuRYH4FZIdGE6TaPvmtakDljs0OKqANmcUStoJ8CY67vjyD/8wU/xBDGMBC1qs6JoZ1fDrQfi++706RNj9yd/rMbbkTUip7CdxyfSQ2L0MCA4fVjoOjusf4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791968950; c=relaxed/simple;
	bh=nQH1zjatcOZn3TeDS8HVALU6V1m6Tw4nh1OqFyNIQ/8=;
	h=From:To:Cc:Subject:In-Reply-To:References:Date:Message-ID:
	 MIME-Version:Content-Type; b=ZU2owijwywMGNQOu8R5gOvaRfe/uG0VrBWtRLOWgn8orDZYBhpFWX0vN5BC0ZxUc1oWsMe4F7Pz+0Zkc8QJg9+pDt16N69VP/iP8DQ9FKsEYXXD4ACOqIlBIjBz62xRRSb5463O/O5LlUwTipjf7aptRK4Zs8iz7tcy0lgiZFUw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=bootlin.com; spf=pass smtp.mailfrom=bootlin.com; dkim=pass (2048-bit key) header.d=bootlin.com header.i=@bootlin.com header.b=MpQucQfw; arc=none smtp.client-ip=185.171.202.116
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=bootlin.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=bootlin.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bootlin.com header.i=@bootlin.com header.b="MpQucQfw"
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
	by smtpout-04.galae.net (Postfix) with ESMTPS id AE6AAC63443;
	Wed, 14 Oct 2026 09:10:01 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
	by smtpout-01.galae.net (Postfix) with ESMTPS id C69D260368;
	Wed, 14 Oct 2026 09:09:05 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id D297B10328B5A;
	Wed, 14 Oct 2026 11:09:01 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=dkim;
	t=1791968944; h=from:subject:date:message-id:to:cc:mime-version:content-type:
	 content-transfer-encoding:in-reply-to:references;
	bh=Kz1QzeFPXpgXoxH0dqLkiCCXCL7vc/GTZmF74AAJUAs=;
	b=MpQucQfw6G11Qn9TOznwb9oYKLOcWxWNyWHPZQPZR9EP7+WIvF0ipyUidKiTgHTl4q/XAJ
	D88htoj8Sql7zcGskcH1TYiKUolXARayBM9klBe3Qx1CAWcKVRh3LGQAUZieMUdsLhwXWh
	PHTbQSRurI2F8uJ0LL03Tlaw+hCPrDzgWUsSz0DawO0V1pMTq4mbwb8Y/dGE/hjanUgxic
	PcgksMrEAX3a961e0AGQH3kiKhtVwDNA6MQWNhmhHPy40Jp++pjn7WlQhcGVAcocehjlM9
	xQIAw9IvOVlWT7r9vK3NJzqaSvg0DNr2ViacEV4vJB9Rl4Xnrwv9aJDq7JC9ng==
From: Miquel Raynal <miquel.raynal@bootlin.com>
To: sashiko-bot@kernel.org
Cc: "Pratyush Yadav" <pratyush@kernel.org>,  "Michael Walle"
 <mwalle@kernel.org>,  "Takahiro Kuwano" <takahiro.kuwano@infineon.com>,
  "Richard Weinberger" <richard@nod.at>,  "Vignesh Raghavendra"
 <vigneshr@ti.com>,  sashiko-reviews@lists.linux.dev,  "Thomas Petazzoni"
 <thomas.petazzoni@bootlin.com>,  "Steam Lin" <STLin2@winbond.com>,
  linux-mtd@lists.infradead.org
Subject: Re: [PATCH v3 09/17] mtd: spi-nor: Allow configuring the actual
 number of dummy cycles
In-Reply-To: <sashiko-outbox-170162@kernel.org> (sashiko-bot@kernel.org's
	message of "Tue, 13 Oct 2026 16:49:52 +0000")
References: <20261013-winbond-master-spi-nor-w35t-v3-0-6dde1d513df8@bootlin.com>
	<20261013-winbond-master-spi-nor-w35t-v3-9-6dde1d513df8@bootlin.com>
	<sashiko-outbox-170162@kernel.org>
User-Agent: mu4e 1.12.12; emacs 30.2
Date: Wed, 14 Oct 2026 11:09:01 +0200
Message-ID: <874ieozm1e.fsf@bootlin.com>
Precedence: bulk
X-Mailing-List: sashiko-reviews@lists.linux.dev
List-Id: <sashiko-reviews.lists.linux.dev>
List-Subscribe: <mailto:sashiko-reviews+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:sashiko-reviews+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
X-Last-TLS-Session-Version: TLSv1.3


>> @@ -3100,6 +3118,10 @@ static int spi_nor_init(struct spi_nor *nor)
>>  	struct spi_nor_flash_parameter *params =3D nor->params;
>>  	int err;
>>=20=20
>> +	err =3D spi_nor_set_dummy(nor);
>> +	if (err)
>> +		return err;
>> +
>>  	err =3D spi_nor_set_octal_dtr(nor, true);
>>  	if (err) {
>>  		dev_dbg(nor->dev, "octal mode not supported\n");
>>  		return err;
>>  	}
>
> [Severity: High]
> If spi_nor_set_octal_dtr() returns an error, does this leave the flash ch=
ip
> in a non-default hardware state?
>
> It appears that if entering octal mode fails, the function returns immedi=
ately
> without undoing the just-applied spi_nor_set_dummy() configuration.
>
> Similarly, if a memory allocation fails later during driver probe after
> spi_nor_scan() has successfully mutated the flash state:
>
> drivers/mtd/spi-nor/core.c:spi_nor_probe() {
>     ...
> 	err =3D spi_nor_scan(nor, name, &hwcaps);
> 	if (err)
> 		return err;
>
> 	if (nor->bouncebuf_size) {
> 		nor->bouncebuf =3D devm_kmalloc(dev, nor->bouncebuf_size,
> 					      GFP_KERNEL);
> 		if (!nor->bouncebuf)
> 			return -ENOMEM;
>     ...
> }
>
> Does the driver return here without calling spi_nor_restore() to undo the
> dummy cycles configuration?
>
> If the flash chip is left expecting the newly configured dummy cycles,
> reads using default SPI parameters (e.g., standard dummy cycles) during a=
 warm
> reboot might return garbage, potentially hanging the boot process.

There is no "default" hardware state regarding dummy cycles. This is a
state that must be negociated at every "boot" (when relevant), warm or
not, so there is no breakage here since next warm boot the same dance
will happen again from scratch. In case octal is not reachable we
already recalculate the dummy cycles for the SSDR case when relevant.

So: won't fix either.

Miqu=C3=A8l
