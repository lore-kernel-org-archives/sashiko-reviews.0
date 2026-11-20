Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=185.171.202.116
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795191856;
	b=UaLmy0f6ip2uvmRbHthK8Aw6aO71WCbcYuPUsh+XbmydfRXmLj6y2Oza6igtShqRYadp
	 EyzZW4jKpLICEWOkQGVkAEkL2wky2/P65Z6sW4VqGiSax95UhXvTtSiHJTVfR3e49IFHU
	 zlW1xpdk+Q8mjsiA8Cakrn3xEFwfuvM1Qk7owfxrqZzHKqCSqUM1urBnYROasR+/QOU0z
	 3kau1r0f91rpLugw2zMFpYoWEaJYdwUid0fIVYo0YOOjkcKF8izliUKSfCStZ+fOyoLes
	 EBmBudmQjKrlR/mGZnDFPRFHngdUMTkuem6ha3xQ7oBY0yLz5T89ARKhSt+ENltWOIA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795191856;
	h=DMARC-Filter:Received:Received:Received:DKIM-Signature:From:To:Cc:
	 Subject:In-Reply-To:References:Date:Message-ID:MIME-Version:
	 Content-Type:Content-Transfer-Encoding:X-Last-TLS-Session-Version;
	bh=eXweuammQ53+bG7aA+FdCn6vhVGbnGzeBs58ATTcDoI=;
	b=GVoar/6bjSSfomK2cC2Z5JcMEmvUk4M+zB/oILtUxLsUAzm2uja9qimk7SEs3hraMWhg
	 7mLCXLp9k8gwWx0Qq4rS9t/7XAwgWtSh749pgf3LIokXHTXIAPAmcIkHh6et4C1kG4NjA
	 UJKD67uogRAKXlrQ9EXKn5+RiaE2RWDGVWHIRz69aF1gPtyB5U+s8S+Zdp/g/g+M9BN3M
	 lewkAbvgae0KMEGkkEABPLTiH3CMU/P8hvLmDQEqnh5I2VjoISPcAOIY/qHXiv1gyeWY5
	 vMKp6SmPjqRVn9xL+tBLKHOacbqhGdRWn9rEe1iMmJcVY4N/iNaJr/BRAeS20ac4FSg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=bootlin.com;
	spf=pass smtp.mailfrom=bootlin.com;
	dkim=pass header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256 header.s=dkim header.b=NitsyhcT;
	arc=none smtp.remote-ip=185.171.202.116
Received: from smtpout-04.galae.net (smtpout-04.galae.net [185.171.202.116])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DFDB4606A32C
	for <sashiko-reviews@lists.linux.dev>; Fri, 20 Nov 2026 16:24:15 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org DFDB4606A32C
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=bootlin.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=bootlin.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256 header.s=dkim header.b=NitsyhcT
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
	by smtpout-04.galae.net (Postfix) with ESMTPS id ED29DC62220
	for <sashiko-reviews@lists.linux.dev>; Fri, 20 Nov 2026 16:24:19 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
	by smtpout-01.galae.net (Postfix) with ESMTPS id 354FB601B9;
	Fri, 20 Nov 2026 16:24:14 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id E840C11BC0459;
	Fri, 20 Nov 2026 17:24:08 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=dkim;
	t=1795191849; h=from:subject:date:message-id:to:cc:mime-version:content-type:
	 content-transfer-encoding:in-reply-to:references;
	bh=eXweuammQ53+bG7aA+FdCn6vhVGbnGzeBs58ATTcDoI=;
	b=NitsyhcTsZo6nspRAWCOw4J46MqCWiv6Uff41OYdpHmvpBAf0ciSur6WG4NO3gXmBrEC0g
	hXp1ZhZ5bu9uEuCUd/K5vXDJGrbDlU8usmNYSM5GvRIieitmxNwVLTfTg/tAbrzBkyiuVX
	y2hgH1qZECTGahTK6J3DBvx7D6sBC5iWFGggRBHN2jW7GBaZaFsaUm7vrQWsK9C4KPQ5LX
	s4ol5ipViQpcQjXwGXCdvfpbqtiZIHVehxvtHxHLopJd/GwbjcqchDqCQoERgWdcoP8qJe
	40q7eEPdhHjzyet4NJMVuJE4VAGsGrptXPJ36MFuyyd5hlgtjBdsoeQdOMElJQ==
From: Gregory CLEMENT <gregory.clement@bootlin.com>
To: sashiko-reviews@lists.linux.dev
Cc: devicetree@vger.kernel.org, robh@kernel.org, conor+dt@kernel.org
Subject: Re: [PATCH v4 2/5] irqchip: irq-eyeq5-msi: add EyeQ5 PCIe MSI
 controller driver
In-Reply-To: <sashiko-outbox-217188@kernel.org>
References: <20261116-eyeq5_msi-v4-0-2e1233b014b0@bootlin.com>
 <20261116-eyeq5_msi-v4-2-2e1233b014b0@bootlin.com>
 <sashiko-outbox-217188@kernel.org>
Date: Fri, 20 Nov 2026 17:24:07 +0100
Message-ID: <87a4n3pj2w.fsf@BLaptop.bootlin.com>
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

Hello,

> Thank you for your contribution! Sashiko AI review found 1 potential
> issue to consider:
> - [Medium] irqchip/eyeq5-msi: lost and unmasked interrupts in
>   eyeq_msi_isr()
> --
>
> commit ecbaf749e93a909382eba764dafb43426071620b
> Author: Gregory CLEMENT <gregory.clement@bootlin.com>
>
> irqchip: irq-eyeq5-msi: add EyeQ5 PCIe MSI controller driver
>
> This commit adds an irqchip driver for the Mobileye EyeQ5 PCIe MSI
> controller, supporting both root complex PCI MSI and endpoint platform MSI
> roles.
>
>> diff --git a/drivers/irqchip/irq-eyeq5-msi.c b/drivers/irqchip/irq-eyeq5=
-msi.c
>> new file mode 100644
>> index 0000000000000..823dfb0b00b5b
>> --- /dev/null
>> +++ b/drivers/irqchip/irq-eyeq5-msi.c
> [ ... ]
>> +static struct irq_chip eyeq_msi_irq_chip =3D {
>> +	.name			=3D "EyeQ5-MSI",
>> +	.irq_mask		=3D eyeq_msi_mask_irq,
>> +	.irq_unmask		=3D eyeq_msi_unmask_irq,
>> +	.irq_ack		=3D eyeq_msi_ack_irq,
>> +	.irq_compose_msi_msg	=3D eyeq_msi_compose_msg,
>> +#ifdef CONFIG_SMP
>> +	.irq_set_affinity	=3D irq_chip_redirect_set_affinity,
>> +#endif
>> +};
>> +
>> +static void eyeq_msi_isr(struct irq_desc *desc)
>> +{
>> +	struct irq_chip *parent_chip =3D irq_desc_get_chip(desc);
>> +	struct eyeq_msi *msi =3D irq_desc_get_handler_data(desc);
>> +	void __iomem *status_reg;
>> +	unsigned long pending;
>> +	unsigned int bit;
>> +
>> +	guard_chained_irq(parent_chip, desc);
>> +
>> +	status_reg =3D msi->gcsr_base + GCSR_IRQSTATUS;
>> +
>> +	while (true) {
>> +		pending =3D FIELD_GET(GCSR_IRQSTATUS_MASK, readw(status_reg));
>> +		if (!pending)
>> +			break;
>> +
>> +		/*
>> +		 * Write-one-to-clear status register.
>> +		 */
>> +		writew(FIELD_PREP(GCSR_IRQSTATUS_MASK, pending), status_reg);
>> +
>> +		for_each_set_bit(bit, &pending, EYEQ_MSI_MAX_VECTORS) {
>> +			if (!generic_handle_demux_domain_irq(msi->msi_domain, bit))
>> +				pr_err_ratelimited("unmapped MSI interrupt %u\n", bit);
>> +		}
>> +	}
>> +}
>
> [Severity: Medium]
> Can eyeq_msi_isr() lose interrupts that arrive while a vector is lazily
> disabled, and dispatch vectors that are masked in GCSR_IRQMASK?
>
> eyeq_msi_domain_alloc() sets handle_edge_irq without IRQ_DISABLE_UNLAZY or
> an .irq_disable callback.  When an MSI arrives after disable_irq(),
> eyeq_msi_isr() clears its bit in GCSR_IRQSTATUS before handle_edge_irq()
> records IRQS_PENDING and masks GCSR_IRQMASK.  Because eyeq_msi_irq_chip
> has no .irq_retrigger callback and neither EYEQ5_MSI nor MIPS selects
> HARDIRQS_SW_RESEND, enable_irq() -> check_irq_resend() cannot replay
> IRQS_PENDING and the interrupt is lost.
>
> In addition, eyeq_msi_isr() does not mask pending with the enabled bits in
> GCSR_IRQMASK before clearing GCSR_IRQSTATUS and calling
> generic_handle_demux_domain_irq().  If a masked vector latches in
> GCSR_IRQSTATUS, a sibling vector firing will clear and dispatch the masked
> vector (for example re-entering a masked IRQF_ONESHOT threaded handler,
> since handle_edge_irq() checks irq_can_handle() rather than
> irqd_irq_masked()), or repeated writes to a masked vector can keep the
> while (true) loop spinning.
>

I reused my MSI test setup and added a new test: on the host, a helper
disables one MSI-X vector, raises that MSI-X from the endpoint, then
enables the vector again and checks its count in /proc/interrupts. This
confirmed the lost-interrupt issue was real and let me write the fix.

Since there was no further comment, I will send a v5 with the fix soon.

Gr=C3=A9gory


> --=20
> Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20261116-eyeq5_ms=
i-v4-0-2e1233b014b0@bootlin.com?part=3D2

--=20
Gr=C3=A9gory CLEMENT, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com
