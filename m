Received: from mail-wr1-f53.google.com (mail-wr1-f53.google.com [209.85.221.53])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 75F3342DFE1
	for <sashiko-reviews@lists.linux.dev>; Thu,  4 Jun 2026 13:36:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.53
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1780580189; cv=none; b=lSBVtY6E0RJRMN8lUzwMRbx7Oi+B1YsoDpBEtztpEVobumrW6rxqGCcFW0xc+o6EtEtXM8jx9dFc44lcxUVa5Y//I01PlKmA95ozhxIZ48EPKLyGR3PNHHk0DE/2iiXoRhGpVmVS/JXF+wa9r2vG4OLLfhGbQNwu3H6oaTukQIY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1780580189; c=relaxed/simple;
	bh=BxsTUewbsv2I+gfWh6SizCCW8tttS8dvRtp/YVKPd90=;
	h=From:Date:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=gyEKi/LsV0EbKdzr2ARGZN4OLoZX2hbmivrtM1gPzpYNgmv4egPocusbAVfGaL4bE7+QIuhrIDVWAL+QT1BvG41yJ00YocdakcSSdjUARO8sBPR+dpvfJNNwh41sSgTbQWbnPE8IJ4QXpKiIRNNmkz5Q0pBUq8vo6o4bjaVzFoo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=suse.com; spf=pass smtp.mailfrom=suse.com; dkim=pass (2048-bit key) header.d=suse.com header.i=@suse.com header.b=D2PKtPLY; arc=none smtp.client-ip=209.85.221.53
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=suse.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=suse.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=suse.com header.i=@suse.com header.b="D2PKtPLY"
Received: by mail-wr1-f53.google.com with SMTP id ffacd0b85a97d-45eedc94d37so390536f8f.3
        for <sashiko-reviews@lists.linux.dev>; Thu, 04 Jun 2026 06:36:26 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1780580185; x=1781184985; darn=lists.linux.dev;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:date:from:from:to
         :cc:subject:date:message-id:reply-to;
        bh=v6GdKVvECywjXiT0mRrreIU+7xtDE0HxPtley59ewis=;
        b=D2PKtPLYiI2pvUJIM96W5d1z4Ib0hMBVHinx3LQoAn2T4fIVpQV7za2U9wypiXYVJ0
         gZ63Xq3qyoPXx/v3G0tk1Ufxo5GiZYtFtYEiTkjlsh7CRvHgfkXSjLIMIQfw2Kylhyv9
         FL8i4iPZ5F+gJRuPyoz7POOI9r6glTBv5Ln49uj80HUwJBHUI80y5VGeWIaUzVcw1ZlK
         sqRicZ3VbgOPrm3K4kXVHe98Q5WJtM2GjySH3SlMXxmULsU8XZA9JMaCNJjBgLEtAPbi
         9rBB4BVeSZyxXalMauWOxQJ9UZAByqY8xIp6DMEuqnc4q1aFlaglk1XBz2il1QPaaPnT
         nSbw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1780580185; x=1781184985;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=v6GdKVvECywjXiT0mRrreIU+7xtDE0HxPtley59ewis=;
        b=p6Hj5nw9XOeoXmcl6dUOLvkLeLvXmbYl2501gc7T47HvPNNMfnQSRJA1Gf3/I83OSN
         kESrCGbAcy3gWUaMdfA8MVOkBp9v7HZSYUnqZBT4JOr+UcTIGwXEBO8JbYYhOIxlOg/W
         ZePkeVNOkj6VzAVM10Y1nWi6weRtICH0rDoAtcPAnwEilIISbu3kqzYfpgXP4w+e0mQv
         WU17uRpR3uqNJrR42+cK0PAyS3z45beyKo3Geq9/cho180vRX4GctS2xv4nbopvKLcQF
         kNNhm1fsYVMYbkyeRZf4lyCPBnMwMLDykwXMRZz4xJX0Qocs8LhNjL5oTd2Y/cA2fu1x
         Cs+w==
X-Gm-Message-State: AOJu0YzpmDt49zvAiO1+HxNODv5XwVy1LuvVAdrKe+d57MwrgVpC9NgW
	nrJLgb7rAC7ozDl4qOZiCsoHOBtwR1wmJtTc97rTByFEnlFBQjrx7qTa6tMYFAiksDGqLV2prWW
	fAnHOQsI=
X-Gm-Gg: Acq92OECi6nC0psb2O9Ai9uudgd5c1hboX4Px9PauCIoVuao74KPUXZ7feyhnvhnCWN
	Su9AOQS2V5bAED4nMBurLeiVCLasUeD9FcDE0s/PSpY/+oodLtSNnbf4WPe44XE2pX/Z7xw6O5D
	7Zz82niT3uHcVkEAx1Q5IUf8hCfCW7DpN0xUal9yuT/bj2JODcHv0aa7ArFYnxcm8clGG7Okree
	9KCj0kcWs/dgorVbVwv9Oq+z/rZ/oo820k8T4jTYWJZzr/qeXqvSfqHDC8v3IYmHSHbRC7sKOTK
	iMveFrH5a1i4b4p9ole21yCpIgCgpnRNLXaQtf/cM85DB8YAfM23u4UDvevmodu0cPRFSUAfh0X
	qULA+XEBqNDN6q5sKdJZJOSGGXsydLm6AwWFVDoqbXftmwvN6jHotfopeaawey4kE1jv+DXF7tA
	B9NEDg5AS/XWU/GqOPoYeI3ep2Z67vrXVGAyf/hKYoPg==
X-Received: by 2002:a05:600c:638d:b0:489:2005:b36e with SMTP id 5b1f17b1804b1-490b5ecc90bmr142484515e9.19.1780580184781;
        Thu, 04 Jun 2026 06:36:24 -0700 (PDT)
Received: from localhost ([195.94.146.6])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-490be1f69bcsm53001575e9.8.2026.06.04.06.36.24
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 04 Jun 2026 06:36:24 -0700 (PDT)
From: Andrea della Porta <andrea.porta@suse.com>
X-Google-Original-From: Andrea della Porta <aporta@suse.de>
Date: Thu, 4 Jun 2026 15:39:44 +0200
To: sashiko-reviews@lists.linux.dev
Cc: Andrea della Porta <andrea.porta@suse.com>, conor+dt@kernel.org,
	devicetree@vger.kernel.org, robh@kernel.org
Subject: Re: [PATCH v4 2/3] pwm: rp1: Add RP1 PWM controller driver
Message-ID: <aiGAINsTG8VZLn28@apocalypse>
References: <8eef956a5eb473f051bbda89ec4c9991c1b47de2.1780498640.git.andrea.porta@suse.com>
 <20260603154716.1B5C41F00893@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: sashiko-reviews@lists.linux.dev
List-Id: <sashiko-reviews.lists.linux.dev>
List-Subscribe: <mailto:sashiko-reviews+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:sashiko-reviews+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20260603154716.1B5C41F00893@smtp.kernel.org>

On 15:47 Wed 03 Jun     , sashiko-bot@kernel.org wrote:
> Thank you for your contribution! Sashiko AI review found 8 potential issue(s) to consider:
> - [High] Missing `pwmchip_remove()` on the `of_syscon_register_regmap()` error path leaves a dangling PWM chip.
> - [High] When disabling a PWM channel, the driver fails to clear the polarity bit, causing the output to erroneously remain HIGH if it was previously inverted.
> - [High] Registering a devm-managed regmap with the permanent syscon registry creates a teardown asymmetry.
> - [High] Hardware channel control registers (`CHAN_CTRL`) are not restored across system suspend/resume.
> - [Medium] Non-monotonic period limit checking in `rp1_pwm_round_waveform_tohw()` causes larger requested periods to result in smaller hardware periods.
> - [Medium] Calculating `period_length_ns` from hardware state suffers from a 32-bit integer overflow before casting to u64, resulting in a zero period.
> - [Medium] Calculating inverted polarity duty length underflows if the hardware is configured for a 100% duty cycle.
> - [Medium] Returning a positive integer (1) from `round_waveform_tohw` incorrectly propagates as an error.
> --
> 
> commit 90d2019e94496c6949f2d04c2605c6a197b16d6a
> Author: Naushir Patuck <naush@raspberrypi.com>
> 
> pwm: rp1: Add RP1 PWM controller driver
> 
> The Raspberry Pi RP1 southbridge features an embedded PWM controller
> with 4 output channels, alongside an RPM interface to read the fan
> speed on the Raspberry Pi 5. Add the supporting driver.
> 
> > diff --git a/drivers/pwm/pwm-rp1.c b/drivers/pwm/pwm-rp1.c
> > new file mode 100644
> > index 0000000000000..052c3ae770569
> > --- /dev/null
> > +++ b/drivers/pwm/pwm-rp1.c
> [ ... ]
> > +static int rp1_pwm_round_waveform_tohw(struct pwm_chip *chip,
> > +				       struct pwm_device *pwm,
> > +				       const struct pwm_waveform *wf,
> > +				       void *_wfhw)
> > +{
> > +	struct rp1_pwm *rp1 = pwmchip_get_drvdata(chip);
> > +	u64 period_ticks, duty_ticks, offset_ticks;
> > +	struct rp1_pwm_waveform *wfhw = _wfhw;
> > +	u64 clk_rate = rp1->clk_rate;
> > +	int ret = 0;
> > +
> > +	if (!wf->period_length_ns) {
> > +		wfhw->enabled = false;
> > +		return 0;
> > +	}
> > +
> > +	period_ticks = mul_u64_u64_div_u64(wf->period_length_ns, clk_rate, NSEC_PER_SEC);
> > +
> > +	/*
> > +	 * The period is limited to U32_MAX - 1
> > +	 * to allow 100% duty cycle.
> > +	 */
> > +	if (period_ticks > U32_MAX) {
> > +		period_ticks = U32_MAX - 1;
> 
> [Severity: Medium]
> Does this limit check break monotonicity for large periods?
> 
> If the requested period translates to U32_MAX, this condition is false and
> the period becomes U32_MAX - 1.
> 
> If it translates to U32_MAX + 1, it becomes U32_MAX - 1, which is then
> subtracted by 1 later, yielding U32_MAX - 2. This makes a larger requested
> period result in a smaller actual hardware period.

Ack. I will set period_ticks = U32_MAX in that if.

> 
> > +	} else if (!period_ticks) {
> > +		period_ticks = 2;
> > +		ret = 1;
> > +	}
> 
> [Severity: Medium]
> Is returning a positive integer here intentional?
> 
> The PWM core subsystem expects round_waveform_tohw callbacks to return 0 on
> success or a negative error code on failure. Returning 1 could propagate as
> an error up to consumer drivers, breaking operation for very small periods.

It should return 1 in case the if any value is rounded, which in this case 
is the period.

> 
> > +
> > +	duty_ticks = mul_u64_u64_div_u64(wf->duty_length_ns, clk_rate, NSEC_PER_SEC);
> [ ... ]
> > +static int rp1_pwm_round_waveform_fromhw(struct pwm_chip *chip,
> > +					 struct pwm_device *pwm,
> > +					 const void *_wfhw,
> > +					 struct pwm_waveform *wf)
> > +{
> > +	struct rp1_pwm *rp1 = pwmchip_get_drvdata(chip);
> > +	const struct rp1_pwm_waveform *wfhw = _wfhw;
> > +	u64 clk_rate = rp1->clk_rate;
> > +	u32 ticks;
> > +
> > +	*wf = (struct pwm_waveform){ };
> > +
> > +	if (!wfhw->enabled)
> > +		return 0;
> > +
> > +	wf->period_length_ns = DIV_ROUND_UP_ULL((u64)(wfhw->period_ticks + 1) * NSEC_PER_SEC,
> > +						clk_rate);
> 
> [Severity: Medium]
> Could this encounter a 32-bit integer overflow?
> 
> Since wfhw->period_ticks is a 32-bit integer, the addition of 1 happens in
> 32-bit space before the cast to u64.
> 
> If the hardware register was configured to 0xffffffff by the bootloader for
> a 100% duty cycle, 0xffffffff + 1 wraps around to 0, producing a period of 0.
> 
> Should the cast be placed before the addition?

Ack. 0xffffffff should be deemed as a non valid value though.

> 
> > +
> > +	if (!wfhw->inverted_polarity) {
> > +		wf->duty_length_ns = DIV_ROUND_UP_ULL((u64)wfhw->duty_ticks * NSEC_PER_SEC,
> > +						      clk_rate);
> > +	} else {
> > +		ticks = wfhw->period_ticks + 1 - wfhw->duty_ticks;
> > +		wf->duty_length_ns = DIV_ROUND_UP_ULL((u64)ticks * NSEC_PER_SEC, clk_rate);
> 
> [Severity: Medium]
> Will this subtraction underflow if the hardware is configured for a 100%
> duty cycle?
> 
> The driver allows duty_ticks to exceed period_ticks + 1 to achieve a 100%
> duty cycle.

The driver is not allowing this since tohw() has this: 

duty_ticks = min(duty_ticks, period_ticks);

Anyway, if fromhw() is called first and the bootloader has configured 0xffffffff
in the period register, should it returns an error? The period should always be
at most U32_MAX-1.

> 
> If inverted polarity is active and duty_ticks is strictly larger than
> period_ticks + 1, this unsigned 32-bit subtraction will wrap around to a
> massive integer, corrupting the duty_length_ns.
> 

This should not happen for the reasono stated above. I'll add the correct cast
anyway for the sake of completion.

> > +		wf->duty_offset_ns = wf->period_length_ns - wf->duty_length_ns;
> > +	}
> > +
> > +	return 0;
> > +}
> > +
> > +static int rp1_pwm_write_waveform(struct pwm_chip *chip,
> > +				  struct pwm_device *pwm,
> > +				  const void *_wfhw)
> > +{
> > +	struct rp1_pwm *rp1 = pwmchip_get_drvdata(chip);
> > +	const struct rp1_pwm_waveform *wfhw = _wfhw;
> > +	u32 value, ctrl;
> > +
> > +	/* early exit if disabled */
> > +	regmap_read(rp1->regmap, RP1_PWM_GLB_CTRL, &ctrl);
> > +	if (!wfhw->enabled) {
> > +		ctrl &= ~RP1_PWM_GLB_CTRL_CHANNEL_ENABLE(pwm->hwpwm);
> > +		goto exit_disable;
> > +	}
> 
> [Severity: High]
> Does skipping the polarity update here cause the output to erroneously
> remain HIGH while disabled?
> 
> The early exit skips the read-modify-write block that updates
> RP1_PWM_CHAN_CTRL_POLARITY.
> 
> The driver notes state that when disabled, the output is driven to 1 if
> polarity is inversed. If a channel previously configured with inverted
> polarity is disabled, it seems it will continually output a HIGH signal,
> violating the PWM framework expectation.

I'm not sure whether an inverted polarity pin shoudl stay low when disabled.
After all, the inactive state for a reversed pin is high.

> 
> > +
> > +	/* set period and duty cycle */
> > +	regmap_write(rp1->regmap,
> [ ... ]
> > +static int rp1_pwm_probe(struct platform_device *pdev)
> > +{
> [ ... ]
> > +	chip->ops = &rp1_pwm_ops;
> > +
> > +	platform_set_drvdata(pdev, chip);
> > +
> > +	ret = pwmchip_add(chip);
> > +	if (ret) {
> > +		dev_err_probe(dev, ret, "Failed to register PWM chip\n");
> > +		goto err_disable_clk;
> > +	}
> > +
> > +	ret = of_syscon_register_regmap(np, rp1->regmap);
> > +	if (ret) {
> > +		dev_err_probe(dev, ret, "Failed to register syscon\n");
> > +		goto err_disable_clk;
> > +	}
> 
> [Severity: High]
> Is there a missing call to pwmchip_remove() on this error path?
> 
> If of_syscon_register_regmap() fails, the function jumps to err_disable_clk
> and returns an error.
> 
> Since the chip was allocated with devm_pwmchip_alloc(), devres will free
> the memory, but the PWM subsystem will retain pointers to the freed chip in
> its IDR mapping, potentially leading to a use-after-free.

Ack.

> 
> [Severity: High]
> Also, does registering a devm-managed regmap with the permanent syscon
> registry create a teardown asymmetry?
> 
> The regmap is allocated with devm_regmap_init_mmio(). If the underlying
> device is hotplug removed, devres will automatically free the regmap memory.
> 
> However, the syscon framework does not provide an unregister function,
> leaving it with a dangling pointer in its static list that could cause a
> use-after-free upon subsequent lookups.

The device is not hotpluggable and the driver cannot be unloaded/unbounded, so
there should be no dangling pointer around.

> 
> > +
> > +	return 0;
> > +
> > +err_disable_clk:
> > +	clk_disable_unprepare(rp1->clk);
> > +
> > +	return ret;
> > +}
> [ ... ]
> > +static int rp1_pwm_resume(struct device *dev)
> > +{
> > +	struct pwm_chip *chip = dev_get_drvdata(dev);
> > +	struct rp1_pwm *rp1 = pwmchip_get_drvdata(chip);
> > +	int ret;
> > +
> > +	ret = clk_prepare_enable(rp1->clk);
> > +	if (ret) {
> > +		dev_err(dev, "Failed to enable clock on resume: %pe\n", ERR_PTR(ret));
> > +		return ret;
> > +	}
> > +
> > +	rp1->clk_enabled = true;
> > +
> > +	return 0;
> > +}
> 
> [Severity: High]
> Should the hardware channel control registers (CHAN_CTRL) be restored across
> resume?
> 
> When the system suspends, the southbridge may lose power and reset its
> registers. During probe, these registers are initialized with required
> configuration bits like MODE_TE_MS and FIFO_POP_MASK.
> 
> This resume function merely re-enables the clock. Because the regmap is not
> configured to cache and restore registers, a subsequent write might update
> only the polarity bit, leaving the channel mode at 0 and breaking PWM
> output.

AFAIK the RP1 is never powered-off, so just shutting down the clock should be ok
and no register are reset to default.

Regards,
Andrea

> 
> -- 
> Sashiko AI review · https://sashiko.dev/#/patchset/cover.1780498640.git.andrea.porta@suse.com?part=2
