Received: from mail-pj1-f50.google.com (mail-pj1-f50.google.com [209.85.216.50])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 500562FD1B3
	for <sashiko-reviews@lists.linux.dev>; Fri, 16 Oct 2026 00:54:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.216.50
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1792112058; cv=none; b=i0EIgSOWHYvoU665F2BFms7KFa1ABrPyAauZSA/KuBjc7FDMMLph4ptLylR0JQG53i8fWAInq6HLh0jioc2Lb1UrwPs5CCITAfyX6BdJsa3p8HMCAoqO7rQjY/9XCQ5HO7dWTTg7Arj6KVlGGEuMa0lMaI++JFMdKaHmKvb/uUg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1792112058; c=relaxed/simple;
	bh=y2S2p85XrYRMEFaB+AUkeq3zgnM1R+m3ZgZ/S2NwUWk=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=eUbtgQhOZB9/pZFE2c8NltJxSPDcS4tg5DqprkmHcY1mLkbZSL6VXR/R+iLD+pFAjqmwls2l4rBL51p/TZ4IN1MZB0arBsqHvf8n5Id+RNDBTFiE1xAypriZwimMkRyS3n0kc36T3Qz+TgCHNLifpFz705u0wUL/IAQNdSwuowc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=k1gPCReq; arc=none smtp.client-ip=209.85.216.50
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="k1gPCReq"
Received: by mail-pj1-f50.google.com with SMTP id 98e67ed59e1d1-3ac451e128cso2078859a91.1
        for <sashiko-reviews@lists.linux.dev>; Thu, 15 Oct 2026 17:54:17 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1792112056; x=1792716856; darn=lists.linux.dev;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=En6nr/29qMF2MF48NebNTT+fHkP95F8yYos87+u+ZFA=;
        b=k1gPCReqvBxnoz1ZADQ1+ZvSvgDVeaT5EwD6Yk3A+msM5onnaox2ry/xetC3fpnF0c
         ftvxkxTaPYtRdfMZVN12xWi9ulfYjuuVscSNISgMEC0Hd4B8eV48PwzpCk/rcuRf0OtG
         KLqonGOioy/JVl+RKd+Ah5366ki5+vG17PmpuiwbcBXtgGjAVMVh7i2m+c/x9nkwdf32
         ymHz9u/G4GhG8Z8GzsSDPFaWOq+9BylKfNgXcN8kLSs6EmDBp8MEeJ7LEPqJEU2qCl++
         Ua3e7IsOdJ8ZR6TX3kL3yVZC5J9D0YAs+MwaMz7y69C0Z+dO7N9ybY6zClji6Xl8leMV
         3Y5Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792112056; x=1792716856;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=En6nr/29qMF2MF48NebNTT+fHkP95F8yYos87+u+ZFA=;
        b=MdL4Ke9Q6+kvF3L1aCobCNE6vRDXQOrYW0nXb639HYlYLmT7sB5WYVv6MK9Zv0P/DZ
         JTHwg7qupoq3XmGg3HHlxMnmxeVhFiQUSl3w1WpW9nI6fJXPmOPSE8TMNoEuI1O/TShg
         JjCa7RXOdk3XrpXQo+ec81XRtf6fEAHO6cL7+lSJNbc8Dq5SGDy4m190SInw/nVUYtl4
         BeI6V2/2NkOr7Dbfpi9zdNxa4VYqeIQDV8dfvY79qDSdZO2JWl23ATo26Q7zUQPgIXuM
         0c2lpdSh5R7eeVlEPuFVDe28p2jB+VmL6EuCPDiNHvEZvfmSyjkugtFAHonM93TtrUo8
         Rz8g==
X-Gm-Message-State: AFq9FYJ1fEJwPzBmAKsgXkEfkAYJnvjYUkll2nKcRyk2Nyn/kCJ6e4tq
	66Y+o97bNHYcDJwPOJFZki8laXiEiRwfH8di//CO2z/u4f1J+jF8AdLeO8Gmxg==
X-Gm-Gg: AYBFou2MXr0horYE3OxBMzlkZqzDWMwFF6jmuUQYRWJWxVAnYO4LQvYWKcmBLzF/qe9
	CacvqL0lFGNAn1yohAA2hAZ+k1LGKpVcGuGRl47oqwX2vZy1yD/zT6BljyfslFszYt74UCaSiP6
	JdvfqpEIkk7v4YV+XmDca8Zms6x71gQ0k+DtfwEQv/4YGRDByXGPnkT1j9z+kC+t7jWMoIiFTu1
	LycUFwIFvTGyvTrqq5MYKZtaSxZziFv8GAX4tbPGwOzAFqpJmln2L1W/lQlqTstf8YWSsOxii36
	8zzVplPitgEAdRwXJcoii00Hc0beA32fyhMjgcTxviHmv7fqpW7fQQsO/AWhY43i/gLHTFBKk8d
	QYfjSYS0F6On0QUNf7YLWh2hoxyY11Qj0qB9EJ04tMM8e0L04OxUw9edsAZUJ5UPq3OUsuTkeh3
	zslqlEaqJMrsJfCTL1EJoyDBfGCEJd6fBz7JrI7TVcSdZQobwqJU2uH1RzGZ28gDWypqDqQBj4Q
	EwIL5wWLKkWxup/xNNHTi6Uravbj2Qayz9ZbND8pVfYDA==
X-Received: by 2002:a17:90b:35d0:b0:3ac:450a:fa46 with SMTP id 98e67ed59e1d1-3ac450b7738mr8255081a91.10.1792112056369;
        Thu, 15 Oct 2026 17:54:16 -0700 (PDT)
Received: from [172.19.1.48] (60-250-196-139.hinet-ip.hinet.net. [60.250.196.139])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3acc9d266d6sm483645a91.1.2026.10.15.17.54.11
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 15 Oct 2026 17:54:13 -0700 (PDT)
Message-ID: <c91448a3-fbb6-45ba-b12e-71a66d4672b1@gmail.com>
Date: Fri, 16 Oct 2026 08:54:08 +0800
Precedence: bulk
X-Mailing-List: sashiko-reviews@lists.linux.dev
List-Id: <sashiko-reviews.lists.linux.dev>
List-Subscribe: <mailto:sashiko-reviews+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:sashiko-reviews+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v11 2/3] i2c: ma35d1: Add Nuvoton MA35D1 I2C driver
 support
To: sashiko-reviews@lists.linux.dev
Cc: conor+dt@kernel.org, robh@kernel.org, devicetree@vger.kernel.org
References: <20261001075101.489660-1-zychennvt@gmail.com>
 <20261001075101.489660-3-zychennvt@gmail.com>
 <20261001080813.9183C1F000FF@smtp.kernel.org>
Content-Language: en-US
From: zychen <zychennvt@gmail.com>
In-Reply-To: <20261001080813.9183C1F000FF@smtp.kernel.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit



sashiko-bot@kernel.org 於 2026/10/1 下午 04:08 寫道:
> Thank you for your contribution! Sashiko AI review found 6 potential issue(s) to consider:
> - [High] i2c: ma35d1: data race in transfer initialization corrupts state machine
> - [High] i2c: ma35d1: TOCTOU race in target registration leads to NULL pointer dereference
> - [Medium] i2c: ma35d1: ignored return value in target receive allows buffer overrun
> - [Medium] i2c: ma35d1: inconsistent IO accessors for MA35_DAT register
> - [Medium] i2c: ma35d1: resource leak on suspend error path leaves wake-up enabled
> - [Medium] i2c: ma35d1: multi-master target mode broken due to unconditional AA bit clear
> --
> 
> commit deb266e66e11836eee266a00ecd16f32efa64cf8
> Author: Zi-Yu Chen <zychennvt@gmail.com>
> 
> i2c: ma35d1: Add Nuvoton MA35D1 I2C driver support
>     
> Add I2C support for Nuvoton MA35D1 SoC.
> The controller supports standard, fast and fast-plus modes,
> and provides controller/target functionality.
> 
>> diff --git a/drivers/i2c/busses/i2c-ma35d1.c b/drivers/i2c/busses/i2c-ma35d1.c
>> new file mode 100644
>> index 0000000000000..2a4985dc22c6e
>> --- /dev/null
>> +++ b/drivers/i2c/busses/i2c-ma35d1.c
> [ ... ]
>> +static void ma35d1_i2c_write_ctl(struct ma35d1_i2c *i2c, unsigned int ctl)
>> +{
>> +	unsigned int val;
>> +
>> +	guard(spinlock_irqsave)(&i2c->lock);
>> +	val = readl(i2c->regs + MA35_CTL0);
>> +	val &= ~(MA35_CTL_SI_AA);
>> +	val |= ctl;
>> +	writel(val, i2c->regs + MA35_CTL0);
>> +}
> 
> [Severity: Medium]
> Will this unconditionally clear the Assert Acknowledge (AA) bit during
> controller transfers?
> 
> When ma35d1_i2c_doxfer() calls this with just MA35_CTL_STA, the AA bit is
> omitted and stripped from the register. In a multi-master environment, if
> arbitration is lost and another controller addresses this device as a
> target, won't it fail to ACK its target address and break the multi-master
> target fallback mechanism?
> 
Clearing AA is intentional, not an unintended behavior of controller/target coexistence.
MA35D1 prioritizes controller transactions, and `ma35d1_i2c_write_ctl()` clears AA when
starting a controller transfer. Therefore, target requests received during a controller
transaction are expected to be NACKed. Once the controller transaction completes, the
driver re-enables AA if a target is registered. This is the intended controller-priority
policy and does not require changes.

> [ ... ]
>> +static irqreturn_t ma35d1_i2c_irq_target_trx(struct ma35d1_i2c *i2c,
>> +					     unsigned long i2c_status)
>> +{
>> +	unsigned char byte = 0;
>> +	int ret;
>> +
>> +	switch (i2c_status) {
> [ ... ]
>> +	case MA35_S_RECE_DATA_ACK:
>> +		/*
>> +		 * Previously address with own SLA address Data has been received;
>> +		 * ACK has been returned
>> +		 */
>> +		byte = readb(i2c->regs + MA35_DAT);
>> +		i2c_slave_event(i2c->target, I2C_SLAVE_WRITE_RECEIVED, &byte);
>> +		break;
> 
> [Severity: Medium]
> Is it possible for i2c_slave_event() to return an error here when the backend
> buffer is full? 
> 
> By ignoring the return value, target_reject remains false, causing the
> controller to blindly ACK subsequent bytes and potentially overrun the backend
> buffer instead of NACKing the next byte.
> 
When MA35D1 reports `MA35_S_RECE_DATA_ACK`, the byte has already been received and ACKed,
so the driver can no longer NACK it. Propagating the callback error to the next byte is also
incorrect, as `I2C_SLAVE_WRITE_RECEIVED` applies only to the current byte.

> [ ... ]
>> +static irqreturn_t ma35d1_i2c_irq_controller_trx(struct ma35d1_i2c *i2c,
>> +						 unsigned long i2c_status)
>> +{
>> +	unsigned char byte;
> [ ... ]
>> +	case MA35_M_TRAN_ADDR_ACK:
>> +	case MA35_M_TRAN_DATA_ACK:
>> +		/* SLA+W has been transmitted and ACK has been received */
>> +		if (i2c_status == MA35_M_TRAN_ADDR_ACK) {
>> +			if (is_last_msg(i2c) && i2c->msg->len == 0) {
>> +				ma35d1_i2c_stop(i2c, 0);
>> +				return IRQ_HANDLED;
>> +			}
>> +		}
>> +
>> +		if (!is_msgend(i2c)) {
>> +			byte = i2c->msg->buf[i2c->msg_ptr++];
>> +			writel(byte, i2c->regs + MA35_DAT);
>> +			ma35d1_i2c_write_ctl(i2c, MA35_CTL_SI);
>> +		} else if (!is_last_msg(i2c)) {
> 
> [Severity: Medium]
> Why is 32-bit writel() used to write data but 8-bit readb() used to read
> from the exact same MA35_DAT register below? 
> 
> If the ARM SoC's peripheral bus dictates 32-bit aligned accesses, could
> readb() trigger a bus fault or return invalid data? Both paths should use
> consistent accessor sizes (e.g. readl(reg) & 0xff).
> 
The peripheral bus supports byte accesses, and only bits [7:0] of `I2C_DAT`
contain data. Therefore, using `writel()` to transmit and `readb()` to receive
is valid on this hardware.

> [ ... ]
>> +	case MA35_M_RECE_DATA_ACK:
>> +	case MA35_M_RECE_DATA_NACK:
>> +		/* DATA has been received and ACK/NACK has been received */
>> +		byte = readb(i2c->regs + MA35_DAT);
>> +		i2c->msg->buf[i2c->msg_ptr++] = byte;
> [ ... ]
>> +static int ma35d1_i2c_doxfer(struct ma35d1_i2c *i2c, struct i2c_msg *msgs,
>> +			     int num)
>> +{
>> +	unsigned long timeout;
>> +	unsigned int val;
>> +	int ret, err;
>> +
>> +	i2c->msg = msgs;
>> +	i2c->msg_num = num;
>> +	i2c->msg_ptr = 0;
>> +	i2c->msg_idx = 0;
>> +	i2c->err = 0;
>> +
>> +	ma35d1_i2c_write_ctl(i2c, MA35_CTL_STA);
> 
> [Severity: High]
> Does this expose the transfer state to the active interrupt handler before
> setup is fully complete and protected? 
> 
> If a spurious interrupt or bus error fires during this window, the ISR
> could concurrently modify these fields. The ISR might set msg_num=0 and
> err=-EIO, which the process context then overwrites with err=0 before
> sending a START, potentially leaving the hardware hanging.
> 
The IRQ is dedicated to this I2C controller and is not shared with other devices.
Disabling the IRQ while initializing the transfer state prevents the interrupt
handler from accessing partially initialized transfer data. The IRQ is re-enabled
after the transfer has been started.

> [ ... ]
>> +static int ma35d1_i2c_xfer(struct i2c_adapter *adap, struct i2c_msg *msgs,
>> +			   int num)
>> +{
>> +	struct ma35d1_i2c *i2c = i2c_get_adapdata(adap);
>> +	int ret;
>> +
>> +	ret = pm_runtime_resume_and_get(i2c->dev);
>> +	if (ret)
>> +		return ret;
>> +
>> +	ret = ma35d1_i2c_doxfer(i2c, msgs, num);
>> +
>> +	if (i2c->target)
>> +		ma35d1_i2c_write_ctl(i2c, MA35_CTL_AA);
>> +	pm_runtime_put_autosuspend(i2c->dev);
>> +
>> +	return ret;
>> +}
> 
> [Severity: High]
> Is there a TOCTOU race condition here?
> 
> If ma35d1_unreg_target() clears i2c->target and calls synchronize_irq()
> right after ma35d1_i2c_xfer() checks it but before it sets the AA bit, this
> could enable target mode interrupts while i2c->target is NULL. A subsequent
> target transaction would then fire the ISR and dereference the NULL pointer.
> 
The I2C core serializes target registration and removal with controller transfers,
so unreg_target() should not run concurrently with master_xfer(). 

> [ ... ]
>> +static int ma35d1_unreg_target(struct i2c_client *target)
>> +{
>> +	struct ma35d1_i2c *i2c = i2c_get_adapdata(target->adapter);
>> +	int ret;
>> +
>> +	if (!i2c->target)
>> +		return -EINVAL;
>> +
>> +	writel(0, i2c->regs + MA35_ADDR0);
>> +	/* Clear AA bit */
>> +	ma35d1_i2c_write_ctl(i2c, 0);
>> +
>> +	synchronize_irq(i2c->irq);
>> +	i2c->target = NULL;
> [ ... ]
>> +static int ma35d1_i2c_suspend(struct device *dev)
>> +{
>> +	struct ma35d1_i2c *i2c = dev_get_drvdata(dev);
>> +	unsigned int val;
>> +	int ret;
>> +
>> +	/* Prepare for wake-up from I2C events if target mode is active */
>> +	if (i2c->target) {
>> +		ma35d1_i2c_write_ctl(i2c, MA35_CTL_AA);
>> +
>> +		/* Setup wake-up control */
>> +		writel(0x1, i2c->regs + MA35_WKCTL);
>> +
>> +		/* Clear pending wake-up flags */
>> +		val = readl(i2c->regs + MA35_WKSTS);
>> +		writel(val, i2c->regs + MA35_WKSTS);
>> +
>> +		ret = enable_irq_wake(i2c->irq);
>> +		if (ret)
>> +			return ret;
>> +		return 0;
>> +	}
>> +	return pm_runtime_force_suspend(dev);
>> +}
> 
> [Severity: Medium]
> If enable_irq_wake() fails, this returns early without clearing MA35_WKCTL. 
> 
> Will this leave the hardware wake-up control active during normal runtime,
> potentially causing spurious wakeups or interrupt storms?
> 
Clear the wake-up control register if enabling IRQ wakeup fails, so the hardware
state is rolled back when the suspend operation cannot proceed.



Regards,
Zi-Yu Chen
