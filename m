Received: from ultrarisc.com (unknown [218.76.62.146])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 7EC82304BDC
	for <sashiko-reviews@lists.linux.dev>; Mon, 15 Jun 2026 07:01:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=218.76.62.146
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1781506911; cv=none; b=QgBb1JbSfh45imwpovKhEBBHwbLfbntnkvS+7OU60WY1xfTefUnCPsHKem8ZSxWrzWxHar6pXlzgNPqIaKRzAFBevKv0poAU9vRhNoZut/bMR+HH0lPC2RnMJmQlCeW0ujK7UnTGCjiER/eW1hX/OKH/uX3j7TUYYjs6LOiZNcA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1781506911; c=relaxed/simple;
	bh=8d71gvCE26obaNdK6alpyZkm3zRLlqDQNYU/BYziUWw=;
	h=MIME-Version:Content-Type:Subject:From:To:Cc:In-Reply-To:
	 References:Date:Message-Id; b=TrxY1pwedwg2JnL3XVFOQl4A7tyrlz5wkWC0CxPzjHBpocSnAGMCBiQt33UZdl6FxadIwyaRvAFYtaYawGwSZv8oSxo/H1qAdPApAHc4ptkAOT9La/kTOQfQUI9QYpRLPbgQWKlqnKhFJOpTerA2fWRNkzHnxKO7rox2qE3LGmw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ultrarisc.com; spf=none smtp.mailfrom=ultrarisc.com; dkim=pass (1024-bit key) header.d=ultrarisc.com header.i=@ultrarisc.com header.b=nv9UbOVd; arc=none smtp.client-ip=218.76.62.146
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ultrarisc.com
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=ultrarisc.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=ultrarisc.com header.i=@ultrarisc.com header.b="nv9UbOVd"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=ultrarisc.com; s=dkim; h=Received:MIME-Version:Content-Type:
	Content-Transfer-Encoding:Subject:From:To:Cc:In-Reply-To:
	References:Date:Message-Id; bh=+ksF9/VRPxakQlox57HhEm2kyt4RNoIz9
	SuYhw4PTng=; b=nv9UbOVdAOmStamKOkljqLlZd5ra4VBq379pep3OcF4aJLdZj
	68ujPpfSEtTv+jWvfzBDpQkvJp2BVRP0phGZp9IY1He5g9jDhrA+0/0P6dDrbVRi
	QtYnBRD9dZ5Ts5gNLydgJ3BqdP9wtyN1YOA0hwmXZywtnnqohYcTDNw0+M=
Received: from [127.0.0.1] (unknown [192.168.100.1])
	by localhost.localdomain (Coremail) with SMTP id AQAAfwAnEkN5oy9qQYQKAA--.9493S2;
	Mon, 15 Jun 2026 15:02:17 +0800 (CST)
Precedence: bulk
X-Mailing-List: sashiko-reviews@lists.linux.dev
List-Id: <sashiko-reviews.lists.linux.dev>
List-Subscribe: <mailto:sashiko-reviews+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:sashiko-reviews+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Subject: Re: [PATCH 2/2] clk: ultrarisc: add DP1000 clock driver
From: Jia Wang <wangjia@ultrarisc.com>
To: sashiko-reviews@lists.linux.dev
Cc: Jia Wang via B4 Relay <devnull+wangjia.ultrarisc.com@kernel.org>, 
 devicetree@vger.kernel.org, robh@kernel.org, conor+dt@kernel.org
In-Reply-To: <20260611095617.765C81F00898@smtp.kernel.org>
References: <20260611-ultrarisc-clock-v1-2-2d93ebb4cc13@ultrarisc.com>
 <20260611095617.765C81F00898@smtp.kernel.org>
Date: Mon, 15 Jun 2026 15:01:41 +0800
Message-Id: <178150690104.3055943.9789165706692446618.b4-reply@b4>
X-Mailer: b4 0.15-dev
X-Developer-Signature: v=1; a=ed25519-sha256; t=1781506901; l=6620;
 i=wangjia@ultrarisc.com; s=20260515; h=from:subject:message-id;
 bh=8d71gvCE26obaNdK6alpyZkm3zRLlqDQNYU/BYziUWw=;
 b=ArJ3st3O9mqu5Xl9BYTv1QDnYqfvvPqcZ2Dns2O5adohSOfKZf37dkWN0nNKTK1mGeRFhQjUO
 Dtk+qDGkI19C1VO5A9vpxZMaaSRD6JOT3qvvl3P6BQzsbGNjpSZUm74
X-Developer-Key: i=wangjia@ultrarisc.com; a=ed25519;
 pk=wGVm18siRScehKOkOz0WKxgxDy7IezHEszhnN4/TUCY=
X-CM-TRANSID:AQAAfwAnEkN5oy9qQYQKAA--.9493S2
X-Coremail-Antispam: 1UD129KBjvJXoW3JFW8Xr15Cr4xKw4xKry8Krg_yoWxXryUpF
	WkGa45Ja1DJFyruwnFqw4xZF18Aw18JFWakryrJr1Iyr90grn5tFW0g3yrCa9rursYkw12
	v3yjv34xCwn0vaDanT9S1TB71UUUUU7qnTZGkaVYY2UrUUUUjbIjqfuFe4nvWSU5nxnvy2
	9KBjDU0xBIdaVrnRJUUUvYb7Iv0xC_Kw4lb4IE77IF4wAFF20E14v26r1j6r4UM7CY07I2
	0VC2zVCF04k26cxKx2IYs7xG6rWj6s0DM7CIcVAFz4kK6r1j6r18M28lY4IEw2IIxxk0rw
	A2F7IY1VAKz4vEj48ve4kI8wA2z4x0Y4vE2Ix0cI8IcVAFwI0_Ar0_tr1l84ACjcxK6xII
	jxv20xvEc7CjxVAFwI0_Gr0_Cr1l84ACjcxK6I8E87Iv67AKxVWxJVW8Jr1l84ACjcxK6I
	8E87Iv6xkF7I0E14v26r4j6r4UJwAS0I0E0xvYzxvE52x082IY62kv0487Mc02F40EFcxC
	0VAKzVAqx4xG6I80ewAv7VC0I7IYx2IY67AKxVWUJVWUGwAv7VC2z280aVAFwI0_Jr0_Gr
	1lOx8S6xCaFVCjc4AY6r1j6r4UM4x0Y48IcxkI7VAKI48JMxkF7I0En4kS14v26r126r1D
	MxkIecxEwVCm-wCF04k20xvY0x0EwIxGrwCFx2IqxVCFs4IE7xkEbVWUJVW8JwC20s026c
	02F40E14v26r1j6r18MI8I3I0E7480Y4vE14v26r106r1rMI8E67AF67kF1VAFwI0_JF0_
	Jw1lIxkGc2Ij64vIr41lIxAIcVC0I7IYx2IY67AKxVWUJVWUCwCI42IY6xIIjxv20xvEc7
	CjxVAFwI0_Jr0_Gr1lIxAIcVCF04k26cxKx2IYs7xG6r1j6r1xMIIF0xvEx4A2jsIE14v2
	6r1j6r4UMIIF0xvEx4A2jsIEc7CjxVAFwI0_Gr0_Gr1UYxBIdaVFxhVjvjDU0xZFpf9x07
	boDGrUUUUU=
X-CM-SenderInfo: pzdqwylld63zxwud2x1vfou0bp/1tbiAQATEWovdsoAOAABsD

On 2026-06-11 09:56 +0000, sashiko-bot@kernel.org wrote:
> Thank you for your contribution! Sashiko AI review found 3 potential issue(s) to consider:
> - [High] Missing clocks in `clk_data->hws` evaluate to `NULL` instead of an error pointer, creating dummy clocks.
> - [High] Read-modify-write operations on clock control registers fail to mask the self-clearing load bit, risking spurious loads and preventing divider updates.
> - [Low] Missing `<linux/module.h>` include.
> --
> 
> commit 8cba5aa205eda7abb58c5b279348bd81f69fdc45
> Author: Jia Wang <wangjia@ultrarisc.com>
> 
> clk: ultrarisc: add DP1000 clock driver
>     
> Add a clock driver for the UltraRISC DP1000 SoC.
>     
> The clock tree is driven by a SYSPLL and provides fixed-factor clocks for
> the subsystem and PCIe, divider-based root clocks for GMAC and the UART,
> I2C, and SPI blocks, and per-instance gate clocks for UART0-3, I2C0-3,
> and SPI0-1.
> 
> > diff --git a/drivers/clk/ultrarisc/clk-ultrarisc.c b/drivers/clk/ultrarisc/clk-ultrarisc.c
> > index 0000000000000..2b970565a4be8
> > --- /dev/null
> > +++ b/drivers/clk/ultrarisc/clk-ultrarisc.c
> > @@ -0,0 +1,417 @@
> [ ... ]
> > +#include <linux/bitfield.h>
> > +#include <linux/clk-provider.h>
> 
> [Severity: Low]
> Should <linux/module.h> be explicitly included here?
> 
> The file uses module macros like MODULE_DESCRIPTION and EXPORT_SYMBOL_GPL(),
> and relying on implicit inclusion can sometimes cause build failures.
>

Thanks. I'll add linux/module.h explicitly.
 
> [ ... ]
> > +static int ultrarisc_divider_set_rate(struct clk_hw *hw, unsigned long rate,
> > +				      unsigned long parent_rate)
> > +{
> [ ... ]
> > +	scoped_guard(spinlock_irqsave, divider->lock) {
> > +		val = readl_relaxed(divider->reg);
> > +		val &= ~(clk_div_mask(divider->width) << divider->shift);
> > +		val |= value << divider->shift;
> > +		writel_relaxed(val, divider->reg);
> 
> [Severity: High]
> Does this read-modify-write sequence need to mask out divider_clk->load_mask
> from the read value before the first write?
> 
> If the hardware hasn't cleared the bit from a previous operation, the first
> write could write it as 1. Then the second write (below) would also write 1,
> failing to provide the required 0->1 transition to trigger the hardware.
>

The load bit is write-only and always reads as 0, so it is not affected by
the read-modify-write sequence. The second write is intentionally used to
trigger the hardware update after programming the divider value.

I will also add a comment to clarify this behavior in the code.

> > +
> > +		if (divider_clk->load_mask) {
> > +			/*
> > +			 * The divider update is triggered by writing 1 to the
> > +			 * self-clearing load bit after programming the new
> > +			 * divider field.
> > +			 */
> > +			writel_relaxed(val | divider_clk->load_mask,
> > +				       divider->reg);
> > +		}
> > +	}
> > +
> > +	return 0;
> > +}
> 
> [ ... ]
> > +static struct clk_hw *
> > +ultrarisc_clk_register_divider(struct device *dev,
> > +			       const struct ultrarisc_divider_desc *desc,
> > +			       struct clk_hw *parent_hw, void __iomem *base,
> > +			       spinlock_t *lock)
> > +{
> [ ... ]
> > +	if (desc->gate_bit != ULTRARISC_CLK_NO_GATE) {
> > +		divider->gate.reg = reg;
> > +		divider->gate.bit_idx = desc->gate_bit;
> > +		divider->gate.flags = desc->gate_flags;
> > +		divider->gate.lock = lock;
> > +		gate_hw = &divider->gate.hw;
> > +		gate_ops = &clk_gate_ops;
> 
> [Severity: High]
> Can using the standard clk_gate_ops here cause spurious loads?
> 
> The standard gate ops perform a generic read-modify-write. If a gate
> operation executes while the load_mask bit is still 1, it will blindly
> write 1 back to the load bit, potentially triggering a spurious hardware
> reload or corrupting the update state machine.
>

On DP1000 the load bit always reads back as 0, so a generic gate
read-modify-write cycle cannot preserve a stale asserted load bit and
write it back as 1.

Because of that, clk_gate_ops does not cause a spurious reload on this
hardware.

> > +	}
> > +
> > +	return devm_clk_hw_register_composite_pdata(dev, desc->name, &pdata, 1,
> > +						    NULL, NULL,
> > +						    &divider->divider.hw,
> > +						    &ultrarisc_divider_ops,
> > +						    gate_hw, gate_ops,
> > +						    CLK_GET_RATE_NOCACHE);
> > +}
> 
> [ ... ]
> > +static int ultrarisc_clk_register_fixed_factors(struct device *dev,
> > +						struct clk_hw_onecell_data *clk_data,
> > +						const struct ultrarisc_clk_soc_data *soc_data)
> > +{
> [ ... ]
> > +		parent_hw = clk_data->hws[desc->parent_id];
> > +		if (!parent_hw)
> > +			return -EINVAL;
> 
> [Severity: High]
> If the clk_data initialization (below) is fixed to use error pointers
> instead of NULL, should this validation check use IS_ERR_OR_NULL() or
> IS_ERR() to avoid dereferencing an ERR_PTR?
> 
> > +
> > +		hw = devm_clk_hw_register_fixed_factor_parent_hw(dev, desc->name,
> > +								 parent_hw,
> 
> [ ... ]
> > +int ultrarisc_clk_probe(struct platform_device *pdev,
> > +			const struct ultrarisc_clk_soc_data *soc_data)
> > +{
> [ ... ]
> > +	clk_data = devm_kzalloc(dev, struct_size(clk_data, hws,
> > +						 soc_data->num_clks),
> > +				GFP_KERNEL);
> 
> [Severity: High]
> Since this array is zero-initialized, any unpopulated clock IDs will remain
> NULL. Does this need to be explicitly filled with ERR_PTR(-ENOENT)?
> 
> When a consumer requests an invalid clock index, of_clk_hw_onecell_get()
> returns this NULL pointer. The clock framework considers NULL a valid
> optional dummy clock, allowing consumer drivers to silently succeed at
> enabling the clock instead of failing. If they then access peripheral
> registers without the clock actually being enabled, it could trigger a bus
> fault.
> 

For the current UltraRISC clock data, all clock IDs in the advertised
[0, num_clks) range are populated before the provider is registered, so
no in-range NULL entry is exposed to consumers.

Within the driver, clk_data->hws[] is zero-initialized and missing
entries are represented as NULL rather than ERR_PTR values, so the
local parent checks only need to handle NULL. I'll add an explicit
hws[] completeness check before provider registration in the next
version.

> > +	if (!clk_data)
> > +		return -ENOMEM;
> 
> -- 
> Sashiko AI review · https://sashiko.dev/#/patchset/20260611-ultrarisc-clock-v1-0-2d93ebb4cc13@ultrarisc.com?part=2
> 

Best regards,
Jia Wang


