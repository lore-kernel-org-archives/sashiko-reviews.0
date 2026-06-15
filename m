Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 07D313C278B
	for <sashiko-reviews@lists.linux.dev>; Mon, 15 Jun 2026 08:57:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1781513878; cv=none; b=V07lBqMlYazJTZ0BA79vbcD/ckJWlvk2uFuGiyIKzkWjtVBgh3DIye9Pt5xuyl926h5RGQYqIUuM67n8flCu20TyVJc3vbEUzR06bG31BXA99jN2aScYot3p9MN2bYuP+D8ifU6iSN/efr/Kj5SSYfM3EHAJ7E7expyam5eBDP4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1781513878; c=relaxed/simple;
	bh=24okBL6gtaDt3tri7M98Z3amMYfwq69PTYKn2LX6GDs=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=qLAPtnwClK3NHiRHJWNPYkPpH0hVQaKR4KinwdG6N4mXJJxs2OZFoeJ8rZJUFnvuvXcxGJc4zOy+waUYenCm8WIilOo1IG7YojokMOK6bGzZIlUI+edIATq6QRppt1v3WY1iH5LhL6PgJzPhAuNhCfXZxyQNC48+HKPgetVAzNs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=PeCsM7ZW; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="PeCsM7ZW"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id D5E9A1F000E9;
	Mon, 15 Jun 2026 08:57:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1781513876;
	bh=BHDUtQTed+hn+mTvjKKEmuSL1hPlj0o2lJcEyC32cTE=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To;
	b=PeCsM7ZWpojsNSaxbP8P+I+iQlYJBakAK9Iuv0uTWNeUxlVkSBHCCdGbCVY/Fr1oh
	 klmO5QyT5PQtRetTbI5x0K6QvQbe8EX7RG9Kpbfc/uToFCaYdIhkJ5q5KU/+WzThqU
	 U7LaxbYwtJ9SYdAEr/qWlhSooyJ65xThGkjhMwvhSH+lQ+57BvIIOOhcy1YlQyISel
	 KyiKLduYAtHp52fBfNGwaJIRTXQNoxpkGgLuw9NJGBJZTs46V1cUyGHMDhQ960pme7
	 I6DZ8PAx0fzqoL+OGZegcmEZUWxZUJZ4sxW1FPNZdEL9XMxDon3ltXD9rJnCseNOR8
	 XzP0oosjGN8rQ==
Message-ID: <e3f8a05c-85ab-4c29-ae61-b9e81420bbb8@kernel.org>
Date: Mon, 15 Jun 2026 11:57:53 +0300
Precedence: bulk
X-Mailing-List: sashiko-reviews@lists.linux.dev
List-Id: <sashiko-reviews.lists.linux.dev>
List-Subscribe: <mailto:sashiko-reviews+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:sashiko-reviews+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v4 01/16] i3c: renesas: Check that the transfer is valid
 before accessing it
To: sashiko-reviews@lists.linux.dev
Cc: Frank.Li@kernel.org, linux-i3c@lists.infradead.org
References: <20260612160458.3102106-2-claudiu.beznea@kernel.org>
 <20260612162039.A5D701F000E9@smtp.kernel.org>
Content-Language: en-US
From: Claudiu Beznea <claudiu.beznea@kernel.org>
In-Reply-To: <20260612162039.A5D701F000E9@smtp.kernel.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit



On 6/12/26 19:20, sashiko-bot@kernel.org wrote:
> Thank you for your contribution! Sashiko AI review found 8 potential issue(s) to consider:
> 
> New issues:
> - [High] The `!xfer` early return path in `renesas_i3c_rx_isr` fails to disable the `NTIE_RDBFIE0` interrupt, causing an interrupt storm.
> - [High] A typo in the `!xfer` early return path of `renesas_i3c_tend_isr` duplicates the `BIE_TENDIE` flag, failing to mask the NACK interrupt.
> - [High] The `!xfer` early return path in `renesas_i3c_start_isr` fails to disable the `BIE_STCNDDIE` interrupt.
> 
> Pre-existing issues:
> - [Critical] The transfer functions `renesas_i3c_i3c_xfers` and `renesas_i3c_i2c_xfers` silently ignore timeouts and hardware errors, falsely returning success.
> - [Critical] Hardware State Desync causing cross-transfer corruption due to failure to abort hardware on timeout.
> - [Critical] FIFO overflow in I3C writes due to unconditionally writing the entire transfer length without progress tracking.
> - [Critical] Out-of-bounds write and pointer offset corruption in `renesas_i3c_rx_isr` during I3C reads.
> - [High] Hardware interrupt registers are modified via non-atomic read-modify-write operations from process context without locking, causing lost mask updates.
> --
> 
> commit 80958e2863c878df9b87948c2774499050e47aee
> Author: Claudiu Beznea <claudiu.beznea.uj@bp.renesas.com>
> 
>      i3c: renesas: Check that the transfer is valid before accessing it
>      
>      The Renesas I3C driver uses an asynchronous model to transfer data. It
>      prepares a struct renesas_i3c_xfer, enqueues it, and waits for completion.
>      The interrupt handler dequeues the transfer, updates/uses it, and signals
>      the waiting thread.
> 
>> diff --git a/drivers/i3c/master/renesas-i3c.c b/drivers/i3c/master/renesas-i3c.c
>> index f39c449922ca2..bc1a0ae1d12d8 100644
>> --- a/drivers/i3c/master/renesas-i3c.c
>> +++ b/drivers/i3c/master/renesas-i3c.c
> 
> [ ... ]
> 
>> @@ -1138,6 +1153,15 @@ static irqreturn_t renesas_i3c_tend_isr(int irq, void *data)
>>   
>>   	scoped_guard(spinlock, &i3c->xferqueue.lock) {
>>   		xfer = i3c->xferqueue.cur;
>> +		if (!xfer) {
>> +			/* Disable interrupts. */
>> +			renesas_clear_bit(i3c->regs, BIE, BIE_TENDIE | BIE_TENDIE);
> 
> [Severity: High]
> Does this duplicated flag fail to mask the NACK interrupt?

Yes, it is a typo.

> 
> It appears the code is meant to mask both the Transmit End and NACK
> interrupts (as the next line clears BST_NACKDF | BST_TENDF).

The scope of the code was to disable the IRQs that are disable on the path were 
the xfer is valid and clear the same bits, to avoid re-triggering the handler 
execution again.

> 
> The failure to include BIE_NACKDIE leaves the NACK interrupt unmasked,
> which could cause an interrupt storm if a NACK triggered the ISR.
> 
>> +			renesas_clear_bit(i3c->regs, NTSTE, NTSTE_TDBEE0);
>> +			/* Clear any status flag. */
>> +			renesas_clear_bit(i3c->regs, BST, BST_NACKDF | BST_TENDF);
>> +			return IRQ_HANDLED;
>> +		}
> 
> [ ... ]
> 
>> @@ -1184,6 +1208,14 @@ static irqreturn_t renesas_i3c_rx_isr(int irq, void *data)
>>   
>>   	scoped_guard(spinlock, &i3c->xferqueue.lock) {
>>   		xfer = i3c->xferqueue.cur;
>> +		if (!xfer) {
>> +			/* Clear any status registers. */
>> +			renesas_clear_bit(i3c->regs, BST, BST_SPCNDDF);
>> +			/* Clear the Read Buffer Full status flag. */
>> +			renesas_clear_bit(i3c->regs, NTST, NTST_RDBFF0);
>> +			return IRQ_HANDLED;
>> +		}
> 
> [Severity: High]
> Can this early return path cause an interrupt storm?
> 
> When a Read Buffer Full interrupt fires, this attempts to handle an aborted
> transfer by simply clearing the status flag NTST_RDBFF0.
> 
> Because the hardware fifo remains full and the interrupt enable bit
> NTIE_RDBFIE0 is not disabled, the interrupt will immediately re-trigger
> when the ISR returns.

I'm not sure if that can happen. The scope of the code was to touch the IRQ 
disable and status bits in the handlers they are handled on the normal path. 
However, I'll review it.

> 
> [ ... ]
> 
>> @@ -1259,6 +1293,12 @@ static irqreturn_t renesas_i3c_start_isr(int irq, void *data)
>>   
>>   	scoped_guard(spinlock, &i3c->xferqueue.lock) {
>>   		xfer = i3c->xferqueue.cur;
>> +		if (!xfer) {
>> +			/* Clear any status registers. */
>> +			renesas_clear_bit(i3c->regs, BST, BST_STCNDDF);
>> +			return IRQ_HANDLED;
>> +		}
> 
> [Severity: High]
> Does this early return path fail to disable the Start Condition interrupt?
> 
> The early return clears the BST_STCNDDF status flag but doesn't disable the
> Start Condition interrupt via BIE_STCNDDIE.

Yes, that should have been done.

-- 
Thank you,
Claudiu

