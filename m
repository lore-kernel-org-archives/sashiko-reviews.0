Received: from ms1.novatek.com.tw (ms2.novatek.com.tw [210.202.87.108])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8ECC9466B44
	for <sashiko-reviews@lists.linux.dev>; Wed,  5 Aug 2026 12:16:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=210.202.87.108
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785932175; cv=none; b=Ev0ZwMbSCym/K31PkhrZkKl40y+zsSQZlqmEDZrg89ZG+Yi1LU4v3AW6gw4+WjZr7aUTbyOi/dhtS/Nx6r57sxzDQIYQq/b3XFEBpmGNMKIaL+Hpm/qW+2+IbMTYWWtLuLis6vMkau/tNg+aY4W0KMLCNPRwUx9eHMahKbprf4s=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785932175; c=relaxed/simple;
	bh=xkD5Yy2r/DtLj+ijpR/sEWj9oStc9GAc2o8L8jYbqW4=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=JiWv97nv0QxppLH/413G1Olrc2yEZuLwzhLj2FSJlV/ciicxREAR4WXkcBGZOmMGrgToelpNjP2ObcaibqacLj18O99CUgBRWCVvYeVaU3ssuZelOR34exMvvso8lBC8Zdf5Umhlg91jxmME0037gZRT+AnQ+P/XLgFZp45pjWY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=novatek.com.tw; spf=pass smtp.mailfrom=novatek.com.tw; dkim=pass (1024-bit key) header.d=novatek.com.tw header.i=@novatek.com.tw header.b=C3Y2BTWw; arc=none smtp.client-ip=210.202.87.108
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=novatek.com.tw
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=novatek.com.tw
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=novatek.com.tw header.i=@novatek.com.tw header.b="C3Y2BTWw"
X-UUID: 6cfc6fb890c711f181a149c3f3c08161-20260805
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=novatek.com.tw; s=dk;
	h=Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From; bh=9vAGUMnrIZqxPt2fO27VyUWPGN/C8Vm6LVqFSR4teUU=;
	b=C3Y2BTWw5S5eF/0f3Ti9Z8LDa4fMlB20jdZy7jHCm+MxAE86XkuRHltJeg1R3Lefb7wTPlCAEpSXiHNYB85T5FrdEnPrNW8bwRKc5GGTN41b3H+Es7gdEcp0nuenTlQ4L6H6JIWl6R4KE6HVRtVuZMfbSlImKa4Z4fZR9usFImw=;
X-UUID: 6cfc6fb890c711f181a149c3f3c08161-20260805
Received: from spmgt1 [(172.20.13.10)] by ms1.novatek.com.tw
	(envelope-from <sp_isw1_at@novatek.com.tw>)
	(Generic MTA)
	with ESMTP id 98501722; Wed, 05 Aug 2026 20:16:02 +0800
Received: from oabuild50.novatek.com.tw (oabuild50.novatek.com.tw [172.20.13.160])
	by spmgt1 (Postfix) with ESMTP id 9BC521A1E1C;
	Wed,  5 Aug 2026 20:16:02 +0800 (CST)
Received: by oabuild50.novatek.com.tw (Postfix, from userid 1005)
	id 007C3C600CF; Wed,  5 Aug 2026 20:16:01 +0800 (CST)
From: nina_kuo@novatek.com.tw
To: sashiko-bot@kernel.org
Cc: conor+dt@kernel.org,
	devicetree@vger.kernel.org,
	nina_kuo@novatek.com.tw,
	robh@kernel.org,
	sashiko-reviews@lists.linux.dev,
	shihpei_hsu@novatek.com.tw,
	toby_chui@novatek.com.tw,
	Ben Huang <Ben_Huang@novatek.com.tw>
Subject: Re: [PATCH v5 2/3] i2c: nt72676: Add Novatek NT72676 I2C controller driver
Date: Wed,  5 Aug 2026 20:13:22 +0800
Message-Id: <20260805121321.760496-1-nina_kuo@novatek.com.tw>
X-Mailer: git-send-email 2.26.1
In-Reply-To: <20260804034515.BF09C1F000E9@smtp.kernel.org>
References: <20260804034515.BF09C1F000E9@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: sashiko-reviews@lists.linux.dev
List-Id: <sashiko-reviews.lists.linux.dev>
List-Subscribe: <mailto:sashiko-reviews+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:sashiko-reviews+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Ben Huang <Ben_Huang@novatek.com.tw>

On Tue, 04 Aug 2026 03:45:15 +0000, sashiko-bot@kernel.org wrote:
>> +static irqreturn_t nvt_i2c_isr(int irq, void *dev_id)
>> +{
>> +	struct nvt_i2c_bus *i2c = dev_id;
>> +	struct i2c_msg *msg = i2c->current_msg;
>> +	unsigned int status = nt72676_i2c_readl(i2c, I2C_REG_INTR);
>> +	unsigned int clr = 0;
>> +	int do_complete = 0;
>> +
>> +	if (!(status & I2C_IRQ_FLAG) || !i2c->current_msg)
>> +		return IRQ_NONE;
>
> [Severity: High]
> Could this early return cause an interrupt storm if a spurious interrupt
> fires, or if current_msg is NULL after a timeout? Since it returns
> IRQ_NONE without writing to the clear register, the level-triggered
> hardware interrupt might remain asserted indefinitely.

The potential issue of IRQ storm under the condition !i2c->current_msg will
be fixed by clearing all IRQs.

>> +
>> +	if (status & I2C_IRQ_NACK) {
>> +		i2c->error_code = -ENXIO;
>> +		clr |= I2C_IRQ_NACK << 8;
>> +	} else if (status & I2C_IRQ_RX_FULL) {
>
> [Severity: High]
> What happens if the hardware asserts I2C_IRQ_CLK_STR_TIMEOUT? The
> I2C_IRQ_ENABLE_SETTING macro enables this interrupt (bit 12), but it is
> omitted from this if/else chain. Does this mean it won't be added to
> the clr variable, leaving it asserted and causing an interrupt storm?

Apologies for loss of handling IRQ I2C_IRQ_CLK_STR_TIMEOUT.
The flow of I2C_IRQ_CLK_STR_TIMEOUT will be added.

>> +	ret = wait_for_completion_timeout(&i2c->msg_complete, i2c->adapter.timeout);
>> +	if (ret == 0) {
>> +		i2c->error_code = -ETIMEDOUT;
>> +		nvt_i2c_reset(i2c);
>> +	}
>> +	if (i2c->error_code)
>> +		dev_err(i2c->dev, "[%s]: write failed (err:%d); SA[0x%X]\n",
>> +			i2c->adapter.name, i2c->error_code, msg->addr);
>> +
>> +	i2c->current_msg = NULL;
>
> [Severity: High]
> Can the timeout path race with the interrupt handler here? If the transfer
> times out, current_msg is set to NULL and the function returns, leading the
> caller to free the message buffer. If the ISR executes concurrently on another
> CPU, could it access the freed buffer via current_msg before it gets fully
> nullified, causing a use-after-free?

Spin lock for current_msg and the interrupt register will be added.

>> +static int nvt_i2c_xfer(struct i2c_adapter *adap,
>> +			struct i2c_msg msgs[],
>> +			int num)
>> +{
>> +	struct nvt_i2c_bus *i2c = i2c_get_adapdata(adap);
>> +	int ret = 0, i = 0;
>> +	struct i2c_msg *msg = NULL;
>> +
>> +	nvt_i2c_ctrl_init(i2c);
>> +
>> +	if (num == 2) {
>> +		nvt_i2c_set_subaddr(i2c, &msgs[0]);
>> +		msg = &msgs[1];
>
> [Severity: High]
> Is it correct to unconditionally treat the first message of any 2-message
> transfer as a subaddress write? If a user-space caller sends a 2-message array
> where the first message is a read, has a length > 4, or targets a different
> device address, won't this silently drop or misinterpret the first message and
> only execute the second one?

For the 2-message transfer, the flow of checking msg[0] is a sub-address write and
with the maximum length of 4 bytes (32 bits) will be added.

>> +	ret = nvt_i2c_init(i2c);
>> +	if (ret)
>> +		return ret;
>> +
>> +	/* Setup I2C adapter */
>> +	i2c->adapter.owner = THIS_MODULE;
>> +	i2c->adapter.algo = &nvt_i2c_algo;
>> +	i2c->adapter.dev.of_node = pdev->dev.of_node;
>> +	i2c->adapter.dev.parent = &pdev->dev;
>> +	i2c->adapter.timeout = 3 * HZ;
>> +	strscpy(i2c->adapter.name, dev_name(&pdev->dev), sizeof(i2c->adapter.name));
>> +	i2c_set_adapdata(&i2c->adapter, i2c);
>> +
>> +	ret = i2c_add_adapter(&i2c->adapter);
>> +	if (ret)
>> +		return dev_err_probe(&pdev->dev, ret, "Failed to add adapter\n");
>
> [Severity: Medium]
> Does this error path need to disable the hardware interrupts that were
> enabled earlier in nvt_i2c_init()? Returning directly might leave
> interrupts enabled on a shared IRQ line.

nvt_i2c_init() will be moved after successful i2c_add_adapter().
If nvt_i2c_init() fails, no interrupts are enabled and i2c_del_adapter() will be
called for releasing the adapter resources.

>> +
>> +	platform_set_drvdata(pdev, i2c);
>> +
>> +	return 0;
>> +}
>> +
>> +static void nvt_i2c_remove(struct platform_device *pdev)
>> +{
>> +	struct nvt_i2c_bus *i2c = platform_get_drvdata(pdev);
>> +
>> +	nt72676_i2c_writel(I2C_IRQ_DISABLE_SETTING, i2c, I2C_REG_INTR);
>> +	nt72676_i2c_writel(nt72676_i2c_readl(i2c, I2C_REG_CTRL) & ~I2C_ENABLE,
>> +			   i2c, I2C_REG_CTRL);
>> +	i2c_del_adapter(&i2c->adapter);
>
> [Severity: High]
> Should the adapter be deleted before disabling the I2C controller hardware?
> Disabling interrupts and clocks first could break concurrent ongoing
> transfers or client device removal operations that happen during
> i2c_del_adapter().

i2c_del_adapter() will be moved before disabling the I2C controller.


The issues above will be fixed at the next iteration.

Sincerely,
Ben Huang
