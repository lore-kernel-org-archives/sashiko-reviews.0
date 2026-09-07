Received: from mx1.white.stw.pengutronix.de (mx1.white.stw.pengutronix.de [185.203.200.13])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 12AD03C279D;
	Mon,  7 Sep 2026 17:14:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=185.203.200.13
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788801301; cv=none; b=iq+jXN77ewvVAlUVBZ2RfroyQyiLzp5BKWDin8oUkHeGXd6dhoBSzQXd7y9anS0MWyf+AsytE2jdDpD7GGHPLcovGZtQW3yj0bBPO64MG7N03og6h54iCRk4FUEMzenWAwlpeqTa3p5C6qSgkTmlNzAzd3pyoZVV5RWOS0YfH44=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788801301; c=relaxed/simple;
	bh=GOUeUzYZmKCSbi7qH+BOLTMfPFhWvFfknY3xS/iBpmw=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=V+/QNCSyHAc0Ly28BBQpj3Zzp3kU3e9RRpcpjfkUeJIdvBAY9i3pgjUGbx7aDdJM7hGBTO8sUqHzFNA4uCTYbvpq9QtU+CwjJUN8lCUcnsrdRNgj/z381mLMyoW6l1V1MuNOqLa3VoM8oOsj4fYSRQ8M/UmWZtWQQEY/XSegZkE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=pengutronix.de; spf=pass smtp.mailfrom=pengutronix.de; arc=none smtp.client-ip=185.203.200.13
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=pengutronix.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=pengutronix.de
X-PTX-Original-Recipient: sashiko-reviews@lists.linux.dev
X-PTX-Original-Recipient: linux-sunxi@lists.linux.dev
X-PTX-Original-Recipient: kernel@pengutronix.de
X-PTX-Original-Recipient: mkl@pengutronix.de
Received: from [0.0.0.0] (ptz.office.stw.pengutronix.de [IPv6:2a0a:edc0:0:900:1d::77])
	(Authenticated sender: jre@pengutronix.de)
	by mx1.white.stw.pengutronix.de (Postfix) with ESMTPSA id 9859F200883;
	Mon, 07 Sep 2026 19:14:51 +0200 (CEST)
Message-ID: <982d45ed-607c-4ce4-99de-27948f11cd12@pengutronix.de>
Date: Mon, 7 Sep 2026 19:14:51 +0200
Precedence: bulk
X-Mailing-List: sashiko-reviews@lists.linux.dev
List-Id: <sashiko-reviews.lists.linux.dev>
List-Subscribe: <mailto:sashiko-reviews+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:sashiko-reviews+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 4/6] spi: spi-sun4i: sun4i_spi_handler(): fix race
 condition between transfer completion and RX FIFO interrupt
To: sashiko-reviews@lists.linux.dev
Cc: linux-sunxi@lists.linux.dev, "kernel@pengutronix.de"
 <kernel@pengutronix.de>, Marc Kleine-Budde <mkl@pengutronix.de>
References: <20260907-spi-sun4i-fixes-v2-0-7e805662b9bd@pengutronix.de>
 <20260907-spi-sun4i-fixes-v2-4-7e805662b9bd@pengutronix.de>
 <20260907154447.0A5161F00A3A@smtp.kernel.org>
Content-Language: en-US
From: Jonas Rebmann <jre@pengutronix.de>
In-Reply-To: <20260907154447.0A5161F00A3A@smtp.kernel.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

Dear humans,

On 2026-09-07 17:44, sashiko-bot@kernel.org wrote:
> spi: spi-sun4i: sun4i_spi_handler(): fix race condition between transfer completion and RX FIFO interrupt
> 
> This commit moves RX-FIFO draining back to sun4i_spi_transfer_one() and
> disables all interrupts in the IRQ handler when processing the transfer
> complete interrupt to close a race window.
> 
>> diff --git a/drivers/spi/spi-sun4i.c b/drivers/spi/spi-sun4i.c
>> index 8a9dcd3b6b8f4..ea8be0170fbfd 100644
>> --- a/drivers/spi/spi-sun4i.c
>> +++ b/drivers/spi/spi-sun4i.c
> 
> [ ... ]
> 
>> @@ -357,8 +359,7 @@ static irqreturn_t sun4i_spi_handler(int irq, void *dev_id)
>>   
>>   	/* Transfer complete */
>>   	if (status & SUN4I_INT_CTL_TC) {
>> -		sun4i_spi_write(sspi, SUN4I_INT_STA_REG, SUN4I_INT_CTL_TC);
>> -		sun4i_spi_drain_fifo(sspi, SUN4I_FIFO_DEPTH);
>> +		sun4i_spi_write(sspi, SUN4I_INT_CTL_REG, 0);
> 
> [Severity: High]
> Does this change leave the Transfer Complete (TC) bit active in the status
> register?

Temporarily.

> It looks like replacing the write to SUN4I_INT_STA_REG with a write to
> SUN4I_INT_CTL_REG masks the interrupt, but fails to acknowledge and clear
> the pending status bit.
> 
> If a spurious interrupt fires during the setup of a new transfer, could this
> cause the new transfer to complete prematurely? For example, in
> sun4i_spi_transfer_one(), there is a window between reinitializing the
> completion and clearing the status register:
> 
> 	reinit_completion(&sspi->done);
> 	sspi->tx_buf = tfr->tx_buf;
> 	sspi->rx_buf = tfr->rx_buf;
> 	sspi->len = tfr->len;
> 
> 	/* Clear pending interrupts */
> 	sun4i_spi_write(sspi, SUN4I_INT_STA_REG, ~0);
> 
> If a spurious interrupt arrives just before SUN4I_INT_STA_REG is cleared,
> the handler will read the stale TC bit and call complete(&sspi->done). The
> wait_for_completion_timeout() would then return immediately, potentially
> leading to use-after-free of DMA buffers or silent data corruption since the
> hardware might still be active.

Zeroing INT_CTL_REG disables all interrupts.

reinit_completion() does *not* enable interrupts early in
sun4i_spi_transfer_one():

	static inline void reinit_completion(struct completion *x)
	{
		x->done = 0;
	}

TC in SUN4I_INT_STA_REG is then write-1-cleared:

	sun4i_spi_write(sspi, SUN4I_INT_STA_REG, ~0);

Only after that, later in sun4i_spi_transfer_one(), interrupts are
enabled in sun4i_spi_transfer_one():

	/* Enable the interrupts */
	sun4i_spi_enable_interrupt(sspi, SUN4I_INT_CTL_TC |
					 SUN4I_INT_CTL_RF_F34);

Hence, the omission of clearing the TC bit register in
sun4i_spi_handler() poses no risk of the described issue.

Regards,
Jonas

-- 
Pengutronix e.K.                           | Jonas Rebmann               |
Steuerwalder Str. 21                       | http://www.pengutronix.de/  |
31137 Hildesheim, Germany                  | Phone: +49-5121-206917-0    |
Amtsgericht Hildesheim, HRA 2686           | Fax:   +49-5121-206917-9    |
