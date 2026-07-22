Received: from mail.loongson.cn (mail.loongson.cn [114.242.206.163])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id ED6333624DB
	for <sashiko-reviews@lists.linux.dev>; Wed, 22 Jul 2026 03:44:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=114.242.206.163
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784691885; cv=none; b=GAzVxE3vOAqJq2DQrgqrHsCC5oXYeLArvPgpbco84yrUempcQOxtqm0h3G2Q2dxGQ4arNQaBSS6lAL3ORFuk8o2pZJXGzGuUC8yYKKb+cp1IsHc70k3nzNNi+xUyqZV95t3Ji5k+69fd5Q06irzR6lSg+gYh3RmENOFUOxKfeXo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784691885; c=relaxed/simple;
	bh=SZnFaIx5YAgzpvznmAnX2fr1m30+Y87+ASv46q4G6wA=;
	h=From:Subject:To:Cc:References:Message-ID:Date:MIME-Version:
	 In-Reply-To:Content-Type; b=TlpwPFxAYAG0dnufVd5k241HgEfe6QbrB8CHvEKN68pHtAe7Dy36d7KQZdt0miubNzPTPKvUhWD4xgopMnlE2/M/1GIzpHIQ8Tjh080oSUieT6AEDJKIZGSYya41ZSLIHDc7VLGq3fcRNYoqfpCjFyRaVFUwMcldqM/RKOjmwfM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=loongson.cn; spf=pass smtp.mailfrom=loongson.cn; arc=none smtp.client-ip=114.242.206.163
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=loongson.cn
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=loongson.cn
Received: from loongson.cn (unknown [10.20.42.101])
	by gateway (Coremail) with SMTP id _____8AxReqnPGBqSOEFAA--.21817S3;
	Wed, 22 Jul 2026 11:44:39 +0800 (CST)
Received: from [10.20.42.101] (unknown [10.20.42.101])
	by front1 (Coremail) with SMTP id qMiowJAxDcWIPGBqRLIUAA--.21957S3;
	Wed, 22 Jul 2026 11:44:38 +0800 (CST)
From: Hongliang Wang <wanghongliang@loongson.cn>
Subject: Re: [PATCH v8 2/2] i2c: ls2x: Add clocks property parsing and adjust
 bus speed
To: sashiko-reviews@lists.linux.dev
Cc: robh@kernel.org, conor+dt@kernel.org, devicetree@vger.kernel.org
References: <20260721122604.12717-1-wanghongliang@loongson.cn>
 <20260721122604.12717-3-wanghongliang@loongson.cn>
 <20260721123838.C79B81F000E9@smtp.kernel.org>
Message-ID: <30d03259-54cc-0d78-fe86-7756c96352f6@loongson.cn>
Date: Wed, 22 Jul 2026 11:41:55 +0800
User-Agent: Mozilla/5.0 (X11; Linux loongarch64; rv:68.0) Gecko/20100101
 Thunderbird/68.7.0
Precedence: bulk
X-Mailing-List: sashiko-reviews@lists.linux.dev
List-Id: <sashiko-reviews.lists.linux.dev>
List-Subscribe: <mailto:sashiko-reviews+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:sashiko-reviews+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
In-Reply-To: <20260721123838.C79B81F000E9@smtp.kernel.org>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 8bit
Content-Language: en-US
X-CM-TRANSID:qMiowJAxDcWIPGBqRLIUAA--.21957S3
X-CM-SenderInfo: pzdqwxxrqjzxhdqjqz5rrqw2lrqou0/
X-Coremail-Antispam: 1Uk129KBj93XoWxurWUWw4fGryUAryDKw1fKrX_yoWrXw17pF
	WrKayrGr1DtFWvgwnFvr1UZFyjyws5JayjkF1UAF1xWF1rCr1kXFy3trWFg3y8Ar1IyayF
	vas8WFn7CF1qvagCm3ZEXasCq-sJn29KB7ZKAUJUUUUU529EdanIXcx71UUUUU7KY7ZEXa
	sCq-sGcSsGvfJ3Ic02F40EFcxC0VAKzVAqx4xG6I80ebIjqfuFe4nvWSU5nxnvy29KBjDU
	0xBIdaVrnRJUUUvYb4IE77IF4wAFF20E14v26r1j6r4UM7CY07I20VC2zVCF04k26cxKx2
	IYs7xG6rWj6s0DM7CIcVAFz4kK6r1Y6r17M28lY4IEw2IIxxk0rwA2F7IY1VAKz4vEj48v
	e4kI8wA2z4x0Y4vE2Ix0cI8IcVAFwI0_Jr0_JF4l84ACjcxK6xIIjxv20xvEc7CjxVAFwI
	0_Gr0_Cr1l84ACjcxK6I8E87Iv67AKxVW8JVWxJwA2z4x0Y4vEx4A2jsIEc7CjxVAFwI0_
	Gr1j6F4UJwAS0I0E0xvYzxvE52x082IY62kv0487Mc804VCY07AIYIkI8VC2zVCFFI0UMc
	02F40EFcxC0VAKzVAqx4xG6I80ewAv7VC0I7IYx2IY67AKxVWUJVWUGwAv7VC2z280aVAF
	wI0_Jr0_Gr1lOx8S6xCaFVCjc4AY6r1j6r4UM4x0Y48IcVAKI48JMxk0xIA0c2IEe2xFo4
	CEbIxvr21l42xK82IYc2Ij64vIr41l4I8I3I0E4IkC6x0Yz7v_Jr0_Gr1lx2IqxVAqx4xG
	67AKxVWUJVWUGwC20s026x8GjcxK67AKxVWUGVWUWwC2zVAF1VAY17CE14v26r126r1DMI
	IYrxkI7VAKI48JMIIF0xvE2Ix0cI8IcVAFwI0_Jr0_JF4lIxAIcVC0I7IYx2IY6xkF7I0E
	14v26r1j6r4UMIIF0xvE42xK8VAvwI8IcIk0rVWUJVWUCwCI42IY6I8E87Iv67AKxVWUJV
	W8JwCI42IY6I8E87Iv6xkF7I0E14v26r1j6r4UYxBIdaVFxhVjvjDU0xZFpf9x07j0FALU
	UUUU=

Hi,

On 2026/7/21 下午8:38, sashiko-bot@kernel.org wrote:
> Thank you for your contribution! Sashiko AI review found 3 potential issue(s) to consider:
> - [High] 32-bit arithmetic overflow in prescaler calculation can cause a divide-by-zero kernel panic.
> - [High] Calculating the prescaler `val` can underflow to -1 and wrap to 65535, causing the I2C bus to stall.
> - [Medium] Abuse of standard 'clocks' property name to pass an integer frequency in ACPI.
> --
>
> --- Patch [2]: [PATCH v8 2/2] i2c: ls2x: Add clocks property parsing and adjust bus speed ---
> commit 6ae7434ddbd04758b9a4e167725900c5fa4d51c1
> Author: Hongliang Wang<wanghongliang@loongson.cn>
>
> i2c: ls2x: Add clocks property parsing and adjust bus speed
>
> The i2c-ls2x driver supports dts and acpi parameter passing.
> In dts, uses clock framework, by parsing clocks property to
> get i2c bus reference clock, and define the div of reference
> clock by device data.
> In acpi, by passing clocks property to describe i2c bus reference
> clock and clock-div property to describe the div of reference clock.
>
>> diff --git a/drivers/i2c/busses/i2c-ls2x.c b/drivers/i2c/busses/i2c-ls2x.c
>> index b475dd27b7af9..25f8301ae14fe 100644
>> --- a/drivers/i2c/busses/i2c-ls2x.c
>> +++ b/drivers/i2c/busses/i2c-ls2x.c
> [ ... ]
>
>> @@ -107,12 +116,13 @@ static void ls2x_i2c_adjust_bus_speed(struct ls2x_i2c_priv *priv)
>>   	else
>>   		t->bus_freq_hz = LS2X_I2C_FREQ_STD;
>>   
>> +	val = (priv->pclk * 10) / (priv->div * t->bus_freq_hz) - 1;
> [Severity: High]
> Can this calculation overflow using 32-bit arithmetic?
>
> If the numerator (priv->pclk * 10) exceeds roughly 429.49 MHz, it will
> overflow. Additionally, if an ACPI table specifies a clock-div and bus_freq_hz
> such that (priv->div * t->bus_freq_hz) is exactly a multiple of 2^32, the
> denominator could silently wrap to 0, resulting in a divide-by-zero panic.
>
> [Severity: High]
> Could this calculation also underflow to -1 if the requested bus frequency
> is higher than what the reference clock supports?
>
> If (priv->pclk * 10) is less than (priv->div * t->bus_freq_hz), the integer
> division evaluates to 0. Subtracting 1 would underflow to -1, which then
> wraps to 65535 when cast to the u16 val. This maximum prescaler value would
> slow the i2c bus down to a crawl without returning an error.
On LoongArch platform, under the right parameter passing, there will be no
overflow and underflow, so I think this potential issue can be ignored.
> [ ... ]
>
>> @@ -304,6 +315,29 @@ static int ls2x_i2c_probe(struct platform_device *pdev)
>>   	if (irq < 0)
>>   		return irq;
>>   
>> +	if (dev_of_node(dev)) {
>> +		clk = devm_clk_get_optional_enabled(dev, NULL);
>> +		if (IS_ERR(clk))
>> +			return PTR_ERR(clk);
>> +		if (clk)
>> +			priv->pclk = clk_get_rate(clk);
>> +		else
>> +			priv->pclk = LS2X_I2C_PCLK_FREQ;
>> +
>> +		priv->div = (unsigned long)device_get_match_data(dev);
>> +		if (!priv->div)
>> +			priv->div = LS2X_I2C_2K_CLOCK_DIV;
>> +	} else {
>> +		/* clocks and clock-div are only ACPI properties. */
>> +		ret = device_property_read_u32(dev, "clocks", &priv->pclk);
> [Severity: Medium]
> Does this abuse the standard clocks property name in ACPI?
>
> The clocks property is typically reserved by devicetree and ACPI _DSD
> bindings for an array of clock provider references (phandles). Overloading
> it here to pass a raw 32-bit integer frequency breaks generic property
> parsers and firmware validation tools.
>
> Would it be better to use a vendor-specific property name like
> loongson,clock-frequency when reading a raw integer?
Does clocks property must to be replaced? If not, keep this usage to
compatible for released firmware.
>> +		if (ret)
>> +			priv->pclk = LS2X_I2C_PCLK_FREQ;
>> +
>> +		ret = device_property_read_u32(dev, "clock-div", &priv->div);
>> +		if (ret || !priv->div)
>> +			priv->div = LS2X_I2C_7A_CLOCK_DIV;
>> +	}
Best regards,
Hongliang Wang

