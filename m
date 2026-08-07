Received: from mail-pf1-f181.google.com (mail-pf1-f181.google.com [209.85.210.181])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5A1453B42C0
	for <sashiko-reviews@lists.linux.dev>; Fri,  7 Aug 2026 07:18:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.181
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1786087090; cv=none; b=a+wbPko7fKW4DrNpmymGfNtzVg2aXWRFktJ5qQORdwy6vcBLnrqB/83OhqsGZkGTObCyBxkq5C5S964Extvie0RIRcpglULidOBmiPqAyokHDzLCJrPEzNdm/BLb3r0aGYa09hgSq0rEK3A12VuRXpSPO38gOBWt0Vl/l/ZkBcs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1786087090; c=relaxed/simple;
	bh=8rE4idcUKxQQ+px+vkwWlZkphY3J4f7ZSBLYbBU0Txg=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=qcPVZ4gWn7I2derdEqnvimFRkbk+c8nsYamHgnNQojTzSG3wly0fQf0LkNuK/Q5SGfa2KtY8zn27maa68RJbqPGb7/x+LXjgGzMeWvw7qA2zzti0wT2tA/DuZ/mcwMmfSF/nAVREjU06dozoJMliLjSTJykuidpcqfAJbzNHpnA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=J9bhsFMf; arc=none smtp.client-ip=209.85.210.181
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="J9bhsFMf"
Received: by mail-pf1-f181.google.com with SMTP id d2e1a72fcca58-8486ac3f347so1966539b3a.1
        for <sashiko-reviews@lists.linux.dev>; Fri, 07 Aug 2026 00:18:08 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1786087087; x=1786691887; darn=lists.linux.dev;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=wWRiuEYvxeApf3WCErrX4QKIxHG44lrxaPCuF1YNriM=;
        b=J9bhsFMfuXGdUxBgIm6wvtXc87n1KwG8Hh1fxlD+Xoj4oCgccy3qEL3eOVvcqoQuVd
         JyvkPxot1tUIvB0oSjrpih4gutvW3q9CfPxHstOEMBhQ/y+xhTNaftC5uwVT0AFjctFN
         T0GvIWejxFxkxSY2Cazhd7zJTP+GuhFJtBo4RrCetW2qxPPrqQadErf7nSlZVE/L4maz
         zIiajTheNCzRo5yLFZdKA4+kRXe0Fq9sYS6idxnetY1Z/elBzD0cvx7WciliTvDf3hA1
         0Cj1avdSTmQUREZypIJzMioo5FYqn4nuGDPZzImAGjZbwUzxD18Ku5ndZ54os6LW1317
         legw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1786087087; x=1786691887;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=wWRiuEYvxeApf3WCErrX4QKIxHG44lrxaPCuF1YNriM=;
        b=hu5DaRUrPSyfdKtgwNTsGew1NVFL/CFw+5sgyN4t1u2tCGKhsZSY3jUN2Y+3sg5x6j
         pm0jUreqUjWwSLAPyN2YW01NEI3F0BBHgfdV0FWWXq2AKCDqLrLpSL8FSWJkXQWTsRVk
         bg6YQQ0Fl8CB1ZLx60xou1w21ZEWIZ45eb0svlnKpqhl2clO9lg6smmdO6GywuIurTaN
         BHmglmvIVi2MF7UAlbkJO/VzEJ+E+K1K4r60fxfdzGh+TBjEgxvzLYej3SPqNTmDH5UO
         vrztcr6k1/+ZVVvvLF+vWEJHYmUGQxw5kEAlHIS4R4BZ40ga8dhyDdRTTM2xMxTfj2GZ
         EETQ==
X-Gm-Message-State: AOJu0YyY0PN97+5asM1gWbKY85O6/4KkHWLs5eUykoqEpHe9pz5XfG0G
	m5Ahueve1vKdAeVZCtrLGpzCp3C6Z/s0A9aW76hGaUoczf5AqYqoYapYG7KuUQ==
X-Gm-Gg: AR+sD12E/EHy9MIFXHUfVyVGChR8Ean0jLDurYOxQmpWrQZx77tTLdowyC1PjXhN1KJ
	R3Pktc+bV/VX0XMikV90og+xowqJ8+FaDeWjbozfIk4/QgAg5SIsmYAifiPfsjiYzFLifnByiub
	4+/ppNjhW0x/D7jB1fDQRZ50sAA2aFWL0YyrRhoUicqYyztl7uKJPHhnEeIHItJG4/l+sb+5OOv
	FulU7Cy5k6fiBDIirh0lRrJWbXaGPfSv0Wxx1m3ooD+c9ebn9lu32lt2z46UN4yt0faMBlAuJsl
	l+Ao5TgeacY1U55HIoXyF8cq7U8UVo9OwDkwsuL1zgVgQV5Kz7bvALQvaBXUnZJRPlq2u/TarEq
	boRJPFUxPs0CrPFuD0oWH2ZeJWohoCj+00MOE/Ad4ymex5t2xu4j5KakfDI+y4tixExeD8528kq
	rCXDnHl35BLHftbpQ5XAN2Z+4ThKdy6fLIjXud4x9npNkp0gT83xjqLenFRsHNQAHFsnJQ8UqIX
	S0RF1Tw1XGbuIX8tXe+icZmb4Wz0RylZCwH
X-Received: by 2002:a05:6a20:3d82:b0:3a3:adea:83bc with SMTP id adf61e73a8af0-3cba2aea1efmr10198445637.15.1786087087424;
        Fri, 07 Aug 2026 00:18:07 -0700 (PDT)
Received: from [172.19.1.48] (60-250-196-139.hinet-ip.hinet.net. [60.250.196.139])
        by smtp.gmail.com with ESMTPSA id 41be03b00d2f7-cbe8f1988besm255803a12.3.2026.08.07.00.18.05
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 07 Aug 2026 00:18:07 -0700 (PDT)
Message-ID: <8a1f643e-8aa1-4476-aaea-61342dd45985@gmail.com>
Date: Fri, 7 Aug 2026 15:18:04 +0800
Precedence: bulk
X-Mailing-List: sashiko-reviews@lists.linux.dev
List-Id: <sashiko-reviews.lists.linux.dev>
List-Subscribe: <mailto:sashiko-reviews+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:sashiko-reviews+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v9 2/3] i2c: ma35d1: Add Nuvoton MA35D1 I2C driver support
To: sashiko-reviews@lists.linux.dev
Cc: robh@kernel.org, conor+dt@kernel.org, devicetree@vger.kernel.org
References: <20260807060400.2047517-1-zychennvt@gmail.com>
 <20260807060400.2047517-3-zychennvt@gmail.com>
 <20260807061851.698081F000E9@smtp.kernel.org>
Content-Language: en-US
From: zychen <zychennvt@gmail.com>
In-Reply-To: <20260807061851.698081F000E9@smtp.kernel.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit



sashiko-bot@kernel.org 於 2026/8/7 下午 02:18 寫道:
> Thank you for your contribution! Sashiko AI review found 6 potential issue(s) to consider:
> - [High] Unhandled `MA35_BUS_RELEASED` status causes spurious errors and randomly aborts ongoing I2C transfers.
Not applicable.
According to the MA35D1 TRM, MA35_BUS_RELEASED (0xf8) won't raise interrupt.

> - [High] Missing NULL checks for `i2c->target` and race conditions during target unregistration lead to a NULL pointer dereference in the ISR.
Not applicable.
The target mode is disabled before synchronize_irq(), and i2c->target is cleared only after synchronize_irq() completes. Thus, any pending or
running target interrupt is handled before the pointer is cleared, and a NULL check is not required.

> - [High] Unprotected initialization of shared transfer state in `ma35d1_i2c_doxfer` races with asynchronous I2C interrupts.
Not applicable.
The target mode interrupt path does not access the controller transfer state variables. No additional locking is required.

> - [Medium] Missing `pm_runtime_mark_last_busy()` defeats the autosuspend delay, causing immediate suspension.
Not applicable.
pm_runtime_put_autosuspend() already calls pm_runtime_mark_last_busy() internally.

> - [Medium] Missing reset assertion on driver remove or probe error leaves the hardware in a dirty state.
Not applicable.
reset_control_deassert() is only used to ensure the controller is released from reset, as it may have been left asserted by the bootloader.
The controller is fully reinitialized during probe, so reasserting the reset line on driver removal is unnecessary.

> - [Medium] Unconditional `disable_irq_wake()` during resume causes a kernel warning if `enable_irq_wake()` failed.
Not applicable.
The MA35D1 I2C interrupt is a dedicated wake-capable IRQ, so enable_irq_wake() is expected to succeed on this platform.

> --
> 
> --- Patch [2]: [PATCH v9 2/3] i2c: ma35d1: Add Nuvoton MA35D1 I2C driver support ---
> commit a1da9304aab06d4fdb61f6ee5807d7913cc199b8
> Author: Zi-Yu Chen <zychennvt@gmail.com>
> Subject: i2c: ma35d1: Add Nuvoton MA35D1 I2C driver support
> 
> This commit adds I2C controller driver support for the Nuvoton MA35D1 SoC.
> The driver provides both controller and target functionality across
> standard, fast, and fast-plus modes.
> 
>> diff --git a/drivers/i2c/busses/i2c-ma35d1.c b/drivers/i2c/busses/i2c-ma35d1.c
>> new file mode 100644
>> --- /dev/null
>> +++ b/drivers/i2c/busses/i2c-ma35d1.c
> [ ... ]
>> +static irqreturn_t ma35d1_i2c_irq_target_trx(struct ma35d1_i2c *i2c,
>> +					     unsigned long i2c_status)
>> +{
>> +	unsigned char byte = 0;
>> +
>> +	switch (i2c_status) {
>> +	case MA35_S_RECE_ARB_LOST:
> [ ... ]
>> +	case MA35_S_RECE_ADDR_ACK:
>> +		/* Own SLA+W has been receive; ACK has been return */
>> +		i2c_slave_event(i2c->target, I2C_SLAVE_WRITE_REQUESTED, &byte);
> 
> [Severity: High]
> Can this result in a NULL pointer dereference if a target interrupt is
> pending during unregistration?
> 
> When ma35d1_unreg_target() calls synchronize_irq() and sets i2c->target
> to NULL, pending interrupts in the irqchip might still fire immediately
> after. 
> 
> If that happens, i2c_slave_event() will dereference i2c->target without
> a NULL check. Could a defensive check be added here, or could the teardown
> synchronization be adjusted?
> 
>> +		break;
> [ ... ]
>> +static irqreturn_t ma35d1_i2c_irq(int irqno, void *dev_id)
>> +{
>> +	struct ma35d1_i2c *i2c = dev_id;
>> +	unsigned long status;
>> +
>> +	status = readl(i2c->regs + MA35_STATUS0);
> 
> [Severity: High]
> Does this interrupt handler properly process the MA35_BUS_RELEASED (0xf8)
> status code?
> 
> If a spurious interrupt occurs and the status is 0xf8, this falls through
> to the default cases in the transaction handlers, which log an error and
> call ma35d1_i2c_restore_idle().
> 
> This would unconditionally abort any active controller transfers via
> ma35d1_i2c_stop(i2c, -EIO). Could this be addressed by explicitly checking
> for 0xf8 and returning IRQ_NONE early?
> 
>> +
>> +	if (status == MA35_BUS_ERROR) {
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
> 
> [Severity: High]
> Could this lockless initialization race with asynchronous I2C interrupts?
> 
> These transfer state variables are set in process context without holding
> i2c->lock or disabling interrupts. If a target mode event or spurious
> interrupt fires concurrently, the ISR could execute
> ma35d1_i2c_controller_complete() and clear the i2c->msg pointer.
> 
> When doxfer() then sends the START command, the controller might see a null
> message pointer and incorrectly abort the transfer. Does this section need
> lock protection?
> 
>> +
>> +	ma35d1_i2c_write_ctl(i2c, MA35_CTL_STA);
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
> 
> [Severity: Medium]
> Does this bypass the autosuspend delay?
> 
> Calling pm_runtime_put_autosuspend() without first updating the timestamp
> via pm_runtime_mark_last_busy() will cause the PM core to evaluate based
> on an outdated timestamp.
> 
> This could result in the device suspending immediately rather than waiting
> for the 5000ms delay configured in the probe function.
> 
>> +
>> +	return ret;
>> +}
> [ ... ]
>> +static int ma35d1_i2c_suspend(struct device *dev)
>> +{
>> +	struct ma35d1_i2c *i2c = dev_get_drvdata(dev);
>> +	unsigned int val;
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
>> +		enable_irq_wake(i2c->irq);
>> +
>> +		return 0;
>> +	}
>> +	return pm_runtime_force_suspend(dev);
>> +}
>> +
>> +static int ma35d1_i2c_resume(struct device *dev)
>> +{
>> +	struct ma35d1_i2c *i2c = dev_get_drvdata(dev);
>> +	unsigned int val;
>> +
>> +	if (i2c->target) {
>> +		/* Disable wake-up */
>> +		writel(0x0, i2c->regs + MA35_WKCTL);
>> +
>> +		/* Clear pending wake-up flags */
>> +		val = readl(i2c->regs + MA35_WKSTS);
>> +		writel(val, i2c->regs + MA35_WKSTS);
>> +
>> +		disable_irq_wake(i2c->irq);
> 
> [Severity: Medium]
> Can this cause a kernel warning if enable_irq_wake() fails during suspend?
> 
> The return value of enable_irq_wake() is ignored in ma35d1_i2c_suspend().
> If the irqchip does not support wakeup, the wake depth remains zero.
> 
> Unconditionally calling disable_irq_wake() here will then trigger an
> "Unbalanced IRQ wake disable" warning. Should the driver record whether
> enabling wake succeeded before disabling it?
> 
>> +		return 0;
>> +	}
> [ ... ]
>> +static int ma35d1_i2c_probe(struct platform_device *pdev)
>> +{
> [ ... ]
>> +	i2c->rst = devm_reset_control_get_exclusive(&pdev->dev, NULL);
>> +	if (IS_ERR(i2c->rst))
>> +		return dev_err_probe(dev, PTR_ERR(i2c->rst),
>> +				     "failed to get reset control\n");
>> +
>> +	ret = reset_control_deassert(i2c->rst);
>> +	if (ret)
>> +		return dev_err_probe(dev, ret, "failed to deassert reset line\n");
> 
> [Severity: Medium]
> Is a cleanup action required to assert the reset line?
> 
> The reset line is deasserted during initialization, but there appears to be
> no corresponding reset_control_assert() on the error path or driver
> unbind.
> 
> If the module is unloaded and reloaded, the hardware could remain in a
> dirty state from the previous session, potentially causing unexpected
> behavior like spurious interrupts. Could a devm action be added to handle
> re-asserting the reset line?
> 
>> +
>> +	/* Setup info block for the I2C core */
>> +	strscpy(i2c->adap.name, "ma35d1-i2c", sizeof(i2c->adap.name));
> 

Regards,
Zi-Yu Chen
