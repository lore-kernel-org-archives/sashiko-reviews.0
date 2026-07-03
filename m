Received: from smtpout-04.galae.net (smtpout-04.galae.net [185.171.202.116])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A0D2A3E1235
	for <sashiko-reviews@lists.linux.dev>; Fri,  3 Jul 2026 14:28:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=185.171.202.116
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783088897; cv=none; b=KYdiIsMz4FlATO3GoGrgLzhFdaGTDCWx8gI2JSOxLPrBayW/65oU9Bm023aumJE4t6yWW/R8sOmi87fAxySTCYBSJUQO0OnyKMFvs1knwFtU4RwboeJDRQrvz4Myl6tPjKEU7tb6sjl+5pLMzXk9aKCmx6rYNL2hsvQvoxkJEt4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783088897; c=relaxed/simple;
	bh=ITrbvsm0G/Pv3ujrq2Szij0qYf7HygBokH53s7KoMok=;
	h=Mime-Version:Content-Type:Date:Message-Id:Cc:Subject:From:To:
	 References:In-Reply-To; b=kgawAnXGl/9HKYajs0EGvJaUu9DiV8VL06hVXpxOcrYqpKtexrlrNWv7Rlj/NCarPINQWcH0BSw3XsuEXAkCrtRTgYqQuOUD/zcQs3CCc+rH4JMR0wZTPitnaSm/dlvKGsG2Ou/AMIeMKg3iqW5hNPTTy3c5Wtk4T999nQ63lJw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=bootlin.com; spf=pass smtp.mailfrom=bootlin.com; dkim=pass (2048-bit key) header.d=bootlin.com header.i=@bootlin.com header.b=COglTmmj; arc=none smtp.client-ip=185.171.202.116
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=bootlin.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=bootlin.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bootlin.com header.i=@bootlin.com header.b="COglTmmj"
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
	by smtpout-04.galae.net (Postfix) with ESMTPS id E1A6BC49F58;
	Fri,  3 Jul 2026 14:28:20 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
	by smtpout-01.galae.net (Postfix) with ESMTPS id 1637D60300;
	Fri,  3 Jul 2026 14:28:09 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id BBE16104C952E;
	Fri,  3 Jul 2026 16:28:07 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=dkim;
	t=1783088888; h=from:subject:date:message-id:to:cc:mime-version:content-type:
	 content-transfer-encoding:in-reply-to:references;
	bh=FWZEXxxoOOd2vkIKZNPsTFkOcP9YZMV5eBktDgGvjGk=;
	b=COglTmmjEndgEfeTc6lee+3w9LIPbjrp1K7WmZG8rhp7D/O7fj0BL646cN0RzkoHI4s5Ao
	3Yfz5WbbHfY+8mhTbMaaGWVrbNfFSrwe9Bq4x8m+JfoIfGcfmeyMG8VqoEOC30rxMGHpD6
	x9APSMfzgfhZU2m47Ekj8Ix5uu5rPizJlsv3Rn8iCu/alIAZmF6wgrjv9R7fWKjcbS9g4q
	sY5hCc/BWpQqzUzy4ZXnxDcNgGlRuWc5xoVfs0PvDyqZL+Nh6xXGorvPfDTHTjqWHotMHn
	WmoqKskpKTQ/JsoEqfFOEwHhJNuQqMDVwk5gNxChT1ekVf+3//2xro2NeSdgug==
Precedence: bulk
X-Mailing-List: sashiko-reviews@lists.linux.dev
List-Id: <sashiko-reviews.lists.linux.dev>
List-Subscribe: <mailto:sashiko-reviews+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:sashiko-reviews+unsubscribe@lists.linux.dev>
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Fri, 03 Jul 2026 16:28:06 +0200
Message-Id: <DJP09A8O5CHS.1KVKCP45QSMDH@bootlin.com>
Cc: <conor+dt@kernel.org>, <devicetree@vger.kernel.org>, <robh@kernel.org>
Subject: Re: [PATCH 08/12] soc: fsl: qe: Convert to generic IRQ chip
From: "Paul Louvel" <paul.louvel@bootlin.com>
To: <sashiko-reviews@lists.linux.dev>, "Paul Louvel"
 <paul.louvel@bootlin.com>
X-Mailer: aerc 0.21.0-0-g5549850facc2
References: <20260703-qe-pic-gpios-v1-0-6c3e706e27dc@bootlin.com>
 <20260703-qe-pic-gpios-v1-8-6c3e706e27dc@bootlin.com>
 <20260703134516.ECD1A1F000E9@smtp.kernel.org>
In-Reply-To: <20260703134516.ECD1A1F000E9@smtp.kernel.org>
X-Last-TLS-Session-Version: TLSv1.3

On Fri Jul 3, 2026 at 3:45 PM CEST, sashiko-bot wrote:
> Thank you for your contribution! Sashiko AI review found 3 potential issu=
e(s) to consider:
>
> New issues:
> - [High] Incorrect hwirq calculation in `qepic_cascade()` maps bit indice=
s [0..31] to hwirqs [32..1] instead of [31..0], causing out-of-bounds mappi=
ng and shifting all IRQs by one.
> - [High] Race condition on probe: The chained interrupt handler is regist=
ered before `data->gc` is initialized, causing a NULL pointer dereference i=
f an interrupt fires early.
>
> Pre-existing issues:
> - [High] The IRQ mask, unmask, and set_type callbacks use lockless read-m=
odify-write operations on shared registers, leading to data races.
> --
>
> commit 39268a559b43e95ee6bcd43807086719d4997f6e
> Author: Paul Louvel <paul.louvel@bootlin.com>
>
> soc: fsl: qe: Convert to generic IRQ chip
>
> The generic IRQ chip framework is available to handle IRQ chips. Using
> this framework for the QE interrupt controller allows to simplify the
> driver. Indeed, the framework internally handles operations coded
> directly in the driver.
>
>> diff --git a/drivers/soc/fsl/qe/qe_ports_ic.c b/drivers/soc/fsl/qe/qe_po=
rts_ic.c
>> index c8b73b0aa2334..d022aa224f6d6 100644
>> --- a/drivers/soc/fsl/qe/qe_ports_ic.c
>> +++ b/drivers/soc/fsl/qe/qe_ports_ic.c
>> @@ -20,63 +20,65 @@ struct qepic_data {
>>  	void __iomem *reg;
>>  	struct irq_domain *host;
>>  	int irq;
>> +	struct irq_chip_generic *gc;
>>  };
>> =20
>>  static void qepic_mask(struct irq_data *d)
>>  {
>> -	struct qepic_data *data =3D irq_data_get_irq_chip_data(d);
>> +	struct irq_chip_generic *gc =3D irq_data_get_irq_chip_data(d);
>> +	struct irq_chip_type *ct =3D irq_data_get_chip_type(d);
>> =20
>> -	clrbits32(data->reg + CEPIMR, 1 << (31 - irqd_to_hwirq(d)));
>> +	clrbits32(gc->reg_base + ct->regs.mask, d->mask);
>>  }
>
> [Severity: High]
> This is a pre-existing issue, but does this lockless read-modify-write
> operation cause data races?
>
> The qepic_mask(), qepic_unmask(), and qepic_set_type() callbacks use
> clrbits32() and setbits32() on shared registers without a shared controll=
er
> lock. If multiple CPUs modify different IRQs concurrently, could updates =
to
> the shared mask or type registers be lost?
>
> [ ... ]
>
>>  static void qepic_cascade(struct irq_desc *desc)
>>  {
>>  	struct qepic_data *data =3D irq_desc_get_handler_data(desc);
>> +	struct irq_chip_type *ct =3D data->gc->chip_types;
>>  	struct irq_chip *chip =3D irq_desc_get_chip(desc);
>>  	unsigned long event, bit;
>> =20
>>  	chained_irq_enter(chip, desc);
>> =20
>> -	event =3D in_be32(data->reg + CEPIER);
>> +	event =3D in_be32(data->gc->reg_base + ct->regs.eoi);
>>  	if (!event) {
>>  		handle_bad_irq(desc);
>>  		goto out;
>>  	}
>
> [Severity: High]
> Could the hwirq calculation in qepic_cascade() be incorrect?
>
> When an interrupt fires, the trailing loop (using for_each_set_bit) yield=
s a
> 0-based bit index, but generic_handle_domain_irq() evaluates the hwirq us=
ing
> "32 - bit".
>
> For example, if bit 0 is set, it maps to hwirq 32, which exceeds the doma=
in's
> hwirq_max of 32 and leaves all IRQs shifted out of bounds. Does this need=
 to
> be "31 - bit" to correctly map bit indices [0..31] to hwirqs [31..0]?
>
> [ ... ]
>

Valid point.

>> @@ -125,14 +158,16 @@ static int qepic_probe(struct platform_device *pde=
v)
>>  	if (data->irq < 0)
>>  		return data->irq;
>> =20
>> -	data->host =3D irq_domain_create_linear(dev_fwnode(dev), 32, &qepic_ho=
st_ops, data);
>> -	if (!data->host)
>> -		return -ENODEV;
>> +	data->host =3D devm_irq_domain_instantiate(dev, &d_info);
>> +	if (IS_ERR(data->host))
>> +		return PTR_ERR(data->host);
>> =20
>> -	irq_set_chained_handler_and_data(data->irq, qepic_cascade, data);
>> -
>> -	return devm_add_action_or_reset(dev, qepic_remove, data);
>> +	data->gc =3D irq_get_domain_generic_chip(data->host, 0);
>> +	if (!data->gc)
>> +		return -ENODEV;
>> +	data->gc->reg_base =3D data->reg;
>> =20
>> +	return 0;
>>  }
>
> [Severity: High]
> Can this probe sequence trigger a NULL pointer dereference?
>
> When devm_irq_domain_instantiate() is called, it triggers the init callba=
ck
> qepic_domain_init(), which registers the chained handler and unmasks the
> parent interrupt:
>
> qepic_domain_init()
>     irq_set_chained_handler_and_data(data->parent_irq, qepic_cascade, dat=
a);
>
> If an interrupt is pending and fires immediately, qepic_cascade() will
> execute and attempt to dereference data->gc->reg_base. However, data->gc =
is
> not initialized until irq_get_domain_generic_chip() is called after the
> domain instantiation returns.
>
> Could this cause a crash if a pending interrupt is triggered during probe=
?

Valid point.




--=20
Paul Louvel, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com

