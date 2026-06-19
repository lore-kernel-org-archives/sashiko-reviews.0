Received: from mail-ej1-f50.google.com (mail-ej1-f50.google.com [209.85.218.50])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 10B4A11CAF
	for <sashiko-reviews@lists.linux.dev>; Fri, 19 Jun 2026 06:10:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.218.50
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1781849453; cv=pass; b=RjD6G49WJugTPHLl4xti55u1OCyw+Q2tSreHdqdSSE/yPIQg340qWb8UV2EZt0+wfnL/CiAxaGtab1NfIpIK4BjEZGlEc51Yno1f/rEhquExjhimKotD/U/Y2ycOP1GNM9C1WOn4CyQ11FYH/j192GfqeZbvQuaEyrbexAebG0s=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1781849453; c=relaxed/simple;
	bh=dk2S5WBPELrkoYZjdzCA40IFW7G6nPxmUcJbi0UDXs0=;
	h=From:References:MIME-Version:In-Reply-To:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=WkY8JHKXyBFAGD09el2x+/QQxoRpw2KVPzKV2MshqvvRcTJ74P1HOMM+tb9xnE4NsNcDFznjkbkA41SmcxA3ykeJOJcY7jjDVF6ll9yHLwQT/NYW4o1nXvBfnFxebDjWgQzFtaQzdljdAVQEGo2JxvNkdniQmWH84LN0SGFle4c=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com; spf=pass smtp.mailfrom=baylibre.com; dkim=pass (2048-bit key) header.d=baylibre.com header.i=@baylibre.com header.b=HGrMI4Do; arc=pass smtp.client-ip=209.85.218.50
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=baylibre.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=baylibre.com header.i=@baylibre.com header.b="HGrMI4Do"
Received: by mail-ej1-f50.google.com with SMTP id a640c23a62f3a-c07c246ad7bso176012966b.2
        for <sashiko-reviews@lists.linux.dev>; Thu, 18 Jun 2026 23:10:50 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1781849449; cv=none;
        d=google.com; s=arc-20240605;
        b=fonmMEB3J3y/3Ou7IRwfzguQBX6kosXvg9lzUzBP7PtegALvV25u1tfFtVnWd06iML
         feBnJ6P6dUbsZ1nD2FznuZf+10LWRnVAcrEpS3E3xxsJIsTipiulS99ubwvaMjbMXTL5
         lWB23F2AAhOQsFZ5Ochz0wgDgFS3d3iQzU6+oo1sQDGp1bt6f2MwUV55dfaNMAgkVb6L
         QAEpmPm1V+8HU10xC7Z3AZushlw0JIhKiE6lpQegNGEb07JXBnnc52Nfu+CtpaW6P9xr
         EQkKMwjCJpF3iIhmbf1oe23TLRf2bcUXrK7ATkxurhKLJpRCK84yHVqEjz7FKq7xn7qn
         rX1g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=cc:to:subject:message-id:date:in-reply-to:mime-version:references
         :from:dkim-signature;
        bh=v9MezgOvVYdDVhHOvhxfflYG59sVc/14+1QAhEmgyMo=;
        fh=HxBa1rYYw/8ok/gpD7i/Ti5JZEHuwGPXkIQcNyUYLlU=;
        b=JOqWB06NKU6SJ9jattVI+B5M41nJdo4nXNlXtMV+TUxqREL8AdN5TCgSDwDoI0jzyV
         6PkaFohKHomhQsAVVzq/+igFGb70KKZ83SjdzvP6I85IhxRA/L6uQq9Xt68Y32WrYuLV
         7o0Kdy7QZLL5CZwN6qQZnBb8NAmKMi8gTI/5UrImwkrn+Z6WEzyYj0JZBSYWl4ZzAuVU
         dDqKdP7N1Y4Co2zp7DXbdstETfGH9+tNiajOgbkQ5yL2+GFcNB8gLNIdt5dnbD3gB97/
         XgGX9vfUvK8wTzzFymOtt/7QieOvL5SmBwydPz+W12WGhSdggTJJTQUgjextpnQ/AHQd
         9oxQ==;
        darn=lists.linux.dev
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre.com; s=google; t=1781849449; x=1782454249; darn=lists.linux.dev;
        h=cc:to:subject:message-id:date:in-reply-to:mime-version:references
         :from:from:to:cc:subject:date:message-id:reply-to;
        bh=v9MezgOvVYdDVhHOvhxfflYG59sVc/14+1QAhEmgyMo=;
        b=HGrMI4DoyiLTGeOCdYhJ+dGP3ffeozLPKwkaXgnRBhoQBjZ5fED0/Td5BQkPIb9VSO
         rYscp9vdMpms4+6xNJ1VdAAfjWtRGI21tpb4Qze8UdPjGtRQ0o1R4Ph6psiy9x9ZaBVx
         cVkehePfgdYnVqBpV2AwsT989SXmMcpxrqDtavR1t/XVJf8/X6/Rnnzhu7WRuIX8MgIU
         fdLGVdo0l4DXY1O4t5+4W/OKhlIJvVCSq6sYIdqTI/HXfncIQ1sqA32158gmmcxBBffB
         Ek/PSC6MFL9zRchIY1Xhphe95C+xtNSKM32S6PtDTWV1nyTnwCp0wHG9aDYdaEVjftZK
         9itQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1781849449; x=1782454249;
        h=cc:to:subject:message-id:date:in-reply-to:mime-version:references
         :from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=v9MezgOvVYdDVhHOvhxfflYG59sVc/14+1QAhEmgyMo=;
        b=QiiDTrPPqFiY2lAVz9CTFNnwIeAZfWK2ArlqdicFnTt+dA56pmMQBD3WB7haEPH8Hp
         SwG2c3VzC9WIwKICbeC+pGLDLVvxk6HGE63CEfT7NkCiXEZ7UQdp/PD/eFD9QEFvRXcr
         q1gf+jp3IX0pYlorPbA2L4Kc4p3J4n3/iNJgneuIdSqRhxvgi2IYg3ytuDLZCiM4+6TN
         b0LsPIkikBvxP64Sdbwa4oV9GantYt9wc03fc7QjvG9xzHk5LG9FXhjc2Yb5U0gfOZXj
         koBqU9PoeuUlF5jFUS3I8NmIakoVe8BSXPWx+1eXYtzLdMNE3YS+9oONMKt73NQE7ifd
         JMxQ==
X-Gm-Message-State: AOJu0YwYBHIdhGA/P/F9uXLT7Z/6N3fbCOjj5MTexOZ4GRvWsrmoI/bp
	Io+6Fan6mCpPbLZ4qDU9+6K/YoXCy8V4/ByCHN+ZYY3HBp39S7bitTnLXAT3ifxD/2MsUzTOuXz
	kk48s3UZKEnAfAbbf875nlGN4mT6QNuHzWnrZqUKiQA==
X-Gm-Gg: AfdE7cncp0/me4tqLsfzDjcHBCEfdRY5kZwfuG9eXaOPDcnThLha1esiumCc5xGwcJX
	QlR9aXPVPwHuqb8jnE2SCBN486kNwOU15+e2R5PZkCRhqU6QonwKOEuR0A03iDpEz5o0wq+NKuB
	vWayH03KUUTpaFDZHBB4CbavJTEvfgGjPdslnHxCNJcYamHLNmi5kBOkfKywW8JQVfE5FXoQinD
	qACjn4uyi0TQp3xSSHffpBHAsCK6QLcm4wQU34p1fttt9U/dyr7LNQhE3oZE2MMREXwxtr2dVgu
	r9r1GMaLk9XB3Y6W147rloIHBg==
X-Received: by 2002:a17:907:3e98:b0:bf1:a59e:653f with SMTP id
 a640c23a62f3a-c097c9c486cmr103959766b.28.1781849449146; Thu, 18 Jun 2026
 23:10:49 -0700 (PDT)
Received: from 753933720722 named unknown by gmailapi.google.com with
 HTTPREST; Thu, 18 Jun 2026 23:10:48 -0700
Received: from 753933720722 named unknown by gmailapi.google.com with
 HTTPREST; Thu, 18 Jun 2026 23:10:48 -0700
From: Angelo Dureghello <adureghello@baylibre.com>
References: <20260609142139.1563360-6-gerg@linux-m68k.org> <20260610142725.031C31F0089A@smtp.kernel.org>
 <937086f1-5158-41e9-9194-b6d1feaee17f@linux-m68k.org>
Precedence: bulk
X-Mailing-List: sashiko-reviews@lists.linux.dev
List-Id: <sashiko-reviews.lists.linux.dev>
List-Subscribe: <mailto:sashiko-reviews+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:sashiko-reviews+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
In-Reply-To: <937086f1-5158-41e9-9194-b6d1feaee17f@linux-m68k.org>
Date: Thu, 18 Jun 2026 23:10:48 -0700
X-Gm-Features: AVVi8CeRdz8EjQv7N6iu4inU7GEg0JeeUbGrB_UMI7cQpI9RGlKWq-bZNMislQ0
Message-ID: <CALSJ-wAO-HpN+9E4cNrfQ0ELF6akddMv7DBXE2W2tKxRWvEZtQ@mail.gmail.com>
Subject: Re: [PATCHv2 4/4] m68k: coldfire: fix non-standard readX()/writeX() functions
To: Greg Ungerer <gerg@linux-m68k.org>
Cc: sashiko-reviews@lists.linux.dev, Oliver Hartkopp <socketcan@hartkopp.net>, 
	Vincent Mailhol <mailhol@kernel.org>, linux-can@vger.kernel.org, Frank.Li@kernel.org, 
	Oleksij Rempel <o.rempel@pengutronix.de>, Marc Kleine-Budde <mkl@pengutronix.de>, imx@lists.linux.dev, 
	Angelo Dureghello <adureghello@baylibre.com>
Content-Type: text/plain; charset="UTF-8"

Hi,
On Thu, Jun 11, 2026 at 11:35:02PM +1000, Greg Ungerer wrote:
> Hi Sashiko-bot,
>
> On 11/6/26 00:27, sashiko-bot@kernel.org wrote:
> > Thank you for your contribution! Sashiko AI review found 3 potential issue(s) to consider:
> >
> > New issues:
> > - [High] The transition to asm-generic readX()/writeX() changes the endianness of ColdFire internal IO accesses, breaking unpatched ColdFire drivers.
> >
> > Pre-existing issues:
> > - [High] Undefined behavior when shifting 1 by 32 or more using `BIT(ch)` in `mcf_edma_tx_handler`.
> > - [High] The error interrupt handler incorrectly skips handling high channels and returns `IRQ_NONE` after servicing low channels.
> > --
> >
> > commit 25193db3eba89f780b6dc534f2f72e16f3429571
> > Author: Greg Ungerer <gerg@linux-m68k.org>
> >
> > m68k: coldfire: fix non-standard readX()/writeX() functions
> >
> > Remove the local ColdFire definitions of readb()/readw()/readl() and
> > writeb()/writew()/writel() and use the asm-generic versions of them.
> >
> > > diff --git a/arch/m68k/include/asm/io_no.h b/arch/m68k/include/asm/io_no.h
> > > index 4f0f34b06e37c..2f12f4ed0da54 100644
> > > --- a/arch/m68k/include/asm/io_no.h
> > > +++ b/arch/m68k/include/asm/io_no.h
> >
> > [ ... ]
> >
> > > -#define writel writel
> > > -static inline void writel(u32 value, volatile void __iomem *addr)
> > > -{
> > > -	if (cf_internalio(addr))
> > > -		__raw_writel(value, addr);
> > > -	else
> > > -		__raw_writel(swab32(value), addr);
> > > -}
> >
> > [Severity: High]
> > Does replacing the local readX()/writeX() with the asm-generic versions
> > change the endianness of unpatched ColdFire drivers?
> >
> > The old ColdFire implementation detected internal IO memory using
> > cf_internalio() and bypassed byte-swapping to provide native big-endian
> > access. The asm-generic accessors always assume little-endian devices and
> > perform byte-swapping.
> >
> > Will unpatched drivers relying on readX()/writeX() for internal IO
> > (such as spi-coldfire-qspi.c, sdhci-esdhc-mcf.c, or fec_main.c) now read
> > and write byte-swapped values and malfunction?
>
> This is of course a real problem, and much effort has been expended to
> find and fix affected drivers. Specifically here:
>
>     patch 1 in this series fixes fec_main.c
>     patch 3 in this series fixes sdhci-esdhc-mcf.c
>     patch 4 (this patch) fixes spi-coldfire-qspi.c with the endian change to spi-fsl-dspi.c
>
> Not mentioned here, but patch 2 in this series fixes the smc91x driver.
>
> It is not believed at this time that any other drivers are affected.
>
>
> > [ ... ]
> >
> > > diff --git a/drivers/dma/mcf-edma-main.c b/drivers/dma/mcf-edma-main.c
> > > index 9e1c6400c77be..4ed0ce644e37e 100644
> > > --- a/drivers/dma/mcf-edma-main.c
> > > +++ b/drivers/dma/mcf-edma-main.c
> > > @@ -21,9 +21,9 @@ static irqreturn_t mcf_edma_tx_handler(int irq, void *dev_id)
> > >   	unsigned int ch;
> > >   	u64 intmap;
> > > -	intmap = ioread32(regs->inth);
> > > +	intmap = ioread32be(regs->inth);
> > >   	intmap <<= 32;
> > > -	intmap |= ioread32(regs->intl);
> > > +	intmap |= ioread32be(regs->intl);
> > >   	if (!intmap)
> > >   		return IRQ_NONE;
> >
> > [Severity: High]
> > This is a pre-existing issue, but does this shift invoke undefined behavior
> > for higher channels?
> >
> > Looking at the loop immediately following this in mcf_edma_tx_handler():
> >
> > 	for (ch = 0; ch < mcf_edma->n_chans; ch++) {
> > 		if (intmap & BIT(ch)) {
> > 			...
> >
> > On a 32-bit architecture like m68k, BIT(ch) expands to a 32-bit unsigned
> > long. Since ch can be up to 64, shifting by 32 or more would be undefined,
> > potentially causing channels 32-63 to be improperly processed or missing
> > their interrupts entirely.
> >
> > Should this use BIT_ULL(ch) when testing against the 64-bit intmap?
> >
> > [ ... ]
> >
> > > @@ -43,7 +43,7 @@ static irqreturn_t mcf_edma_err_handler(int irq, void *dev_id)
> > >   	struct edma_regs *regs = &mcf_edma->regs;
> > >   	unsigned int err, ch;
> > > -	err = ioread32(regs->errl);
> > > +	err = ioread32be(regs->errl);
> > >   	if (!err)
> > >   		return IRQ_NONE;
> >
> > [Severity: High]
> > This is a pre-existing issue, but does this early return incorrectly skip
> > handling high channels?
> >
> > If regs->errl is zero, it returns IRQ_NONE immediately, ignoring any errors
> > in regs->errh. This could leave errors in higher channels uncleared.
> >
> > [ ... ]
> >
> > > @@ -55,7 +55,7 @@ static irqreturn_t mcf_edma_err_handler(int irq, void *dev_id)
> > >   		}
> > >   	}
> > > -	err = ioread32(regs->errh);
> > > +	err = ioread32be(regs->errh);
> > >   	if (!err)
> > >   		return IRQ_NONE;
> >
> > [Severity: High]
> > This is a pre-existing issue, but does this return the wrong IRQ status if
> > low channel errors were already handled?
> >
> > If errl was non-zero (so some errors were handled) but errh is zero,
> > returning IRQ_NONE here instead of IRQ_HANDLED might incorrectly signal
> > to the IRQ subsystem that the interrupt wasn't handled at all.
>
> At casual inspection these may well be real problems. I will have to defer
> to the driver author and current maintainers for them to fix. The changes
> to fix ColdFire readl()/writel() have no effect on these, and are really
> outside of the scope of this series.
>
> Thanks for the review!
>

will fix this. Thanks.

> Regards
> Greg
>
>
>
Regards,
angelo
>
