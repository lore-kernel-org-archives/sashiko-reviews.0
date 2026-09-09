Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A1B2C57D20B;
	Wed,  9 Sep 2026 16:01:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788969689; cv=none; b=GlAlPid8PIXMeQ5Y5o42Ht/vjNUjyQ5UufUTf/iY8dLhKQg+gi2xgW5XuA+i1sH34dvSd3RTaujKoAqkLpmSr6IBPpGHNCBgFtW0zg++Bnjq+9caR+tK+9UXIbNxiKsMP1a3nf16AMypLYSWDIvCLM6irayRYf4sJSH3bDk1uX8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788969689; c=relaxed/simple;
	bh=mzbAZMEyh21T6vSxffj37XLmXnWfRgwN51I0/AX5/sA=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=Yvsi5thsja9kSL77vJJNqQWqAipHjP8pBE7h8WKYVw5P6q3BqyGrex7C4SEWzcHKe1yaW/g5K3c+KZ199WSxMuykcey1fsM7h+O4YypdhB29aXG2JpnFt9VVliJRmi3a63gpY336QxToRkB0Ne9S8Cc/7AOajTopxF6aHcKm9Ek=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=XxjZk56z; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="XxjZk56z"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id A46531F00A3A;
	Wed,  9 Sep 2026 16:01:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1788969687;
	bh=sdIlJj0OagNdJrulDXbYQgaF9FvZ/jpz9k+rLG0FpVE=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=XxjZk56z0aT52foHuSXyAA8RQ77/DbBwkT7QqWTo42d+ObCBKEZgVqLGm5iCw2Iu1
	 XmusjRBjObGrHyFmSXPbnTodqNDpUQ67TB5e4Vvxg8l4zkhWZgmWG16AEgggjiBIr5
	 sAPBzr7IHqpQojZktHm6k8rYnPLZysVyxk5Q9XXKokXFPUqgdWt7oZvSOX97omLfau
	 n/MVnuudtVTLHFiY1Sm2+nveNcpZTq5Y5UZeI2uJMjy+6PiK9UAsrP/xmuXHTzyxH3
	 pfkyY1CjNHb76TwLiL6whcBgBMwtKvu33V1StHkPC/ykncL1w3OEWfh3ZTcVqzuw4V
	 XXg8ejeKschGw==
Date: Wed, 9 Sep 2026 17:01:23 +0100
From: Lee Jones <lee@kernel.org>
To: sashiko-reviews@lists.linux.dev
Cc: Eric Anderson <ejona86@gmail.com>, mfd@lists.linux.dev
Subject: Re: [PATCH] mfd: rk8xx: Register poweroff handler in atomic phase
Message-ID: <20260909160123.GD2133376@google.com>
References: <20260908-veyron-shutdown-v1-1-066ecb80f5f2@gmail.com>
 <20260908193358.E8D4D1F00A3A@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: sashiko-reviews@lists.linux.dev
List-Id: <sashiko-reviews.lists.linux.dev>
List-Subscribe: <mailto:sashiko-reviews+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:sashiko-reviews+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20260908193358.E8D4D1F00A3A@smtp.kernel.org>

On Tue, 08 Sep 2026, sashiko-bot@kernel.org wrote:

> Thank you for your contribution! Sashiko AI review found 2 potential issue(s) to consider:
> 
> New issues:
> - [High] The patch moves the power-off handler to `SYS_OFF_MODE_POWER_OFF`, which executes in an atomic context (local interrupts disabled and secondary CPUs halted). The handler calls `regmap_update_bits()`, which unconditionally attempts to acquire a sleepable regmap mutex, leading to a system deadlock if the mutex is held by a stopped CPU.

Please review, explain or fix the Sashiko review(s).

If this is a set, this request includes the other patches too.

> Pre-existing issues:
> - [High] The restart handler `rk808_restart()` identically calls `regmap_update_bits()` from an atomic context, presenting a pre-existing deadlock risk during system reboot.
> --
> 
> commit 9ca348a7dffb994afa6516d011f6fbab7c173e09
> Author: Eric Anderson <ejona86@gmail.com>
> 
> mfd: rk8xx: Register poweroff handler in atomic phase
> 
> This commit fixes a poweroff regression on Google Veyron devices by moving
> the power-off handler registration from SYS_OFF_MODE_POWER_OFF_PREPARE to
> SYS_OFF_MODE_POWER_OFF. This change causes the handler to execute with local
> interrupts disabled to enable polling I/O for device power down.
> 
> > diff --git a/drivers/mfd/rk8xx-core.c b/drivers/mfd/rk8xx-core.c
> > index 3dcf6abfda74f..21182df45d1b6 100644
> > --- a/drivers/mfd/rk8xx-core.c
> > +++ b/drivers/mfd/rk8xx-core.c
> > @@ -875,7 +875,7 @@ int rk8xx_probe(struct device *dev, int variant, unsigned int irq, struct regmap
> >  	if (device_property_read_bool(dev, "system-power-controller") ||
> >  	    device_property_read_bool(dev, "rockchip,system-power-controller")) {
> >  		ret = devm_register_sys_off_handler(dev,
> > -				    SYS_OFF_MODE_POWER_OFF_PREPARE, SYS_OFF_PRIO_HIGH,
> > +				    SYS_OFF_MODE_POWER_OFF, SYS_OFF_PRIO_HIGH,
> >  				    &rk808_power_off, rk808);
> 
> [Severity: High]
> Does this change introduce a deadlock risk during system shutdown?
> 
> Moving the power-off handler to SYS_OFF_MODE_POWER_OFF means it executes in an
> atomic context where local interrupts are disabled and secondary CPUs are halted
> via smp_send_stop().
> 
> However, the handler calls regmap_update_bits():
> 
> drivers/mfd/rk8xx-core.c:rk808_power_off() {
> 	...
> 	ret = regmap_update_bits(rk808->regmap, reg, bit, bit);
> 	...
> }
> 
> regmap_update_bits() attempts to acquire a sleepable regmap mutex. If a
> secondary CPU was stopped while holding this mutex during a background regmap
> operation, the primary CPU will block indefinitely with interrupts disabled,
> preventing the system from shutting down.
> 
> [Severity: High]
> This is a pre-existing issue, but does rk808_restart() have the same
> deadlock risk during system reboot?
> 
> The restart handler is similarly registered using SYS_OFF_MODE_RESTART, which
> also executes in an atomic context with secondary CPUs halted.
> 
> Like the power-off handler, it issues a regmap_update_bits() call:
> 
> drivers/mfd/rk8xx-core.c:rk808_restart() {
> 	...
> 	ret = regmap_update_bits(rk808->regmap, reg, bit, bit);
> 	...
> }
> 
> This poses the same structural deadlock risk if another CPU was stopped while
> holding the sleepable regmap mutex.
> 
> >  		if (ret)
> >  			return dev_err_probe(dev, ret,
> >  					     "failed to register poweroff handler\n");
> 
> -- 
> Sashiko AI review · https://sashiko.dev/#/patchset/20260908-veyron-shutdown-v1-1-066ecb80f5f2@gmail.com?part=1

-- 
Lee Jones
