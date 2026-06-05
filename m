Received: from mail-wr1-f54.google.com (mail-wr1-f54.google.com [209.85.221.54])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 71A313B42D6
	for <sashiko-reviews@lists.linux.dev>; Fri,  5 Jun 2026 16:46:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.54
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1780677965; cv=none; b=XXJq0WzdXpMf139vO7YqG7de7eyBgVRelViGGiWs4/XqlkeR1oimeQlAb1c7S2ooBr4x8e7ZSED0OmyVUVneM8HJCyFp4vEs3Fo2Ti6R+JulMKzKktncaom3qr+GUhc1yi5EiS0gxyj/FNzDThdMdMU4mkS6EXCPrY5PxPp/2Jg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1780677965; c=relaxed/simple;
	bh=gl4GXz0pkJkVySBV2UzNtWWuh1RCQRovPgbWfsT5OpU=;
	h=From:Date:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=iXJ11Tj5c6rJ9kldytkZUxu2Z2tOIU09lh4BQXj8ENexBXA80DNgO5qkzBIxU8YRq8A5Ie5dPEz5A3WgVwk8hw9juPCPAbrKW7BHURy/AFwwgY54Q7TOiVN9/X8W8qoV1dG0/VGuMGJpbaYtkEMTdaoOVh5346PLUQMpxXmioOM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=suse.com; spf=pass smtp.mailfrom=suse.com; dkim=pass (2048-bit key) header.d=suse.com header.i=@suse.com header.b=fFnPJXB+; arc=none smtp.client-ip=209.85.221.54
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=suse.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=suse.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=suse.com header.i=@suse.com header.b="fFnPJXB+"
Received: by mail-wr1-f54.google.com with SMTP id ffacd0b85a97d-45fd45e596cso1089017f8f.1
        for <sashiko-reviews@lists.linux.dev>; Fri, 05 Jun 2026 09:46:01 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1780677960; x=1781282760; darn=lists.linux.dev;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:date:from:from:to
         :cc:subject:date:message-id:reply-to;
        bh=7/bVhxDW80Ml2W4z6DxoWwwjha2Agd6LJvMQpClQTGI=;
        b=fFnPJXB+YBQLsjZQ3I15k+IawL6jJkNtSfc16MMBW9t3cHP4d5Emm7j6BV0J7cra7a
         bO5ECg/mejamcfLSbDhcBM6hhmHe4z4e1E5Uxmi6BONjJLL3040pg86p9tvExxtfoYLb
         CF+b/n5A28ZQNDvZyHO43/qQhjj3AewyEo/q63yiqTqoKornbyQXMpwmHT2SxXicMj8O
         tm3dSb0ZQaoxB8iCXWjC33A0E5AfX7ljAV+QoVy+4ADqLnxZoYWo3r6OurkGtZPyNs+o
         lxll+PR76LYt4V2u1Ff/J8XHX6Wz8oRYvO65xy638FxudpAR2j0lnjYHv7zLRQ090sVD
         UcgA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1780677960; x=1781282760;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=7/bVhxDW80Ml2W4z6DxoWwwjha2Agd6LJvMQpClQTGI=;
        b=e7VNN2cPRVmf7QnR9eO2IL7znvXSdGg71AhWnvU3roZPqjDst1S/SqAj18O57w8n4I
         NVC5oQ//HEHCim/6ffRykGrQTEQbiWn0U3TZtXJU6qmfITyzt4zpOjIq7HGcr6zyG+Uo
         ZQP24kfjXZ1e5PowKLL7f5fMmMjQk+h/qYC/XOB6PbGSsSqt2WHWEPSw0ZZyKw2M883j
         fjZEs9lGvuUxGujgi05rokAg/FocEZf2rWCxYRWShZgkkhv4eiRiQw2/+1rwk4BiyOyx
         ZNjuQ2WaECs5g7ifYK9zXSRkp93QvgniSj3tdmHYH1PCQDKAfQN+SB4FbGMkGgGkHz+H
         I8Fw==
X-Forwarded-Encrypted: i=1; AFNElJ/KI2ZcbZ4SzSuL0I+f7M+2cTc47AvRqjiMPl2fmRnT83OEj5AecGE2GsIZxkQwNSYAnOGxkctyL6thfgSOVq4=@lists.linux.dev
X-Gm-Message-State: AOJu0YwhJ7PMusirConhhcyw0qqh+OW53yD4+8pPA7JKnBVpra5GPEc+
	LBR+/9E4r2a1wz0Ky+ANSEfYcwkpn6EVUh2rSnNQ4xBMBqog2+MK91S+FIKpbwe6olU=
X-Gm-Gg: Acq92OECCG3U9txeKcxd4Ix9YU3OsCrPywPugK43kgV5gi1EyIpWu7uFs8yF96Y9mxM
	NHXOGgfRo1NkNp6RTBXesNLye2uM+YxgJMfQ4Ij4qL/QZJV+rDEEmQVuAjRMmr/c9JcSrJkq1mu
	CCNKCIr8lBsVuo7hiRXgMolwmR6rgtUtdN+gDJc6UKxjBjxoiiIdcHiBDDErAAQFfOcJmOsWIHi
	jDcY15rwOT3NYyJ+v2GPIltcv3ZgiElHRqo8TQJbQphMuaV1yM2+3JkyZmSFttd0TdSAP0RbAe8
	nuzM2DMeHsBwCTFOwVQDjcItEqx1l3R9YdZT7PoNsinmpmSEjHVHQO0Ko148wFnqFaunldgCdx0
	OTN0p0+b3/upx1zX/agy8kTWFCuxa407zclEEggIFc08NKDIuvjjs+URtMVILF1PU1nWlchdQs7
	aelQVe4jkJ1tSnHFybW3yeJ3oIwzlMlGA=
X-Received: by 2002:a05:6000:2c08:b0:460:3a90:b2b6 with SMTP id ffacd0b85a97d-4603a90b341mr1676307f8f.11.1780677959574;
        Fri, 05 Jun 2026 09:45:59 -0700 (PDT)
Received: from localhost ([195.94.146.6])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-4601f344762sm29175399f8f.23.2026.06.05.09.45.57
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 05 Jun 2026 09:45:59 -0700 (PDT)
From: Andrea della Porta <andrea.porta@suse.com>
X-Google-Original-From: Andrea della Porta <aporta@suse.de>
Date: Fri, 5 Jun 2026 18:49:17 +0200
To: Uwe =?iso-8859-1?Q?Kleine-K=F6nig?= <u.kleine-koenig@baylibre.com>
Cc: Andrea della Porta <andrea.porta@suse.com>,
	sashiko-reviews@lists.linux.dev, conor+dt@kernel.org,
	devicetree@vger.kernel.org, robh@kernel.org
Subject: Re: [PATCH v4 2/3] pwm: rp1: Add RP1 PWM controller driver
Message-ID: <aiL-DWqU5bnIPL8B@apocalypse>
References: <8eef956a5eb473f051bbda89ec4c9991c1b47de2.1780498640.git.andrea.porta@suse.com>
 <20260603154716.1B5C41F00893@smtp.kernel.org>
 <aiGAINsTG8VZLn28@apocalypse>
 <aiHn5-gQMbjttrR6@monoceros>
Precedence: bulk
X-Mailing-List: sashiko-reviews@lists.linux.dev
List-Id: <sashiko-reviews.lists.linux.dev>
List-Subscribe: <mailto:sashiko-reviews+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:sashiko-reviews+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <aiHn5-gQMbjttrR6@monoceros>

Hi Uwe,

On 23:28 Thu 04 Jun     , Uwe Kleine-König wrote:
> Hello Andrea,
> 
> On Thu, Jun 04, 2026 at 03:39:44PM +0200, Andrea della Porta wrote:
> > On 15:47 Wed 03 Jun     , sashiko-bot@kernel.org wrote:
> > > Thank you for your contribution! Sashiko AI review found 8 potential issue(s) to consider:
> > > - [High] Missing `pwmchip_remove()` on the `of_syscon_register_regmap()` error path leaves a dangling PWM chip.

<...snip...>

> > > > +static int rp1_pwm_round_waveform_tohw(struct pwm_chip *chip,
> > > > +				       struct pwm_device *pwm,
> > > > +				       const struct pwm_waveform *wf,
> > > > +				       void *_wfhw)
> > > > +{
> > > > +	struct rp1_pwm *rp1 = pwmchip_get_drvdata(chip);
> > > > +	u64 period_ticks, duty_ticks, offset_ticks;
> > > > +	struct rp1_pwm_waveform *wfhw = _wfhw;
> > > > +	u64 clk_rate = rp1->clk_rate;
> > > > +	int ret = 0;
> > > > +
> > > > +	if (!wf->period_length_ns) {
> > > > +		wfhw->enabled = false;
> > > > +		return 0;
> > > > +	}
> > > > +
> > > > +	period_ticks = mul_u64_u64_div_u64(wf->period_length_ns, clk_rate, NSEC_PER_SEC);
> > > > +
> > > > +	/*
> > > > +	 * The period is limited to U32_MAX - 1
> > > > +	 * to allow 100% duty cycle.
> > > > +	 */
> > > > +	if (period_ticks > U32_MAX) {
> > > > +		period_ticks = U32_MAX - 1;
> > > 
> > > [Severity: Medium]
> > > Does this limit check break monotonicity for large periods?
> > > 
> > > If the requested period translates to U32_MAX, this condition is false and
> > > the period becomes U32_MAX - 1.
> > > 
> > > If it translates to U32_MAX + 1, it becomes U32_MAX - 1, which is then
> > > subtracted by 1 later, yielding U32_MAX - 2. This makes a larger requested
> > > period result in a smaller actual hardware period.
> > 
> > Ack. I will set period_ticks = U32_MAX in that if.
> > 
> > > 
> > > > +	} else if (!period_ticks) {
> > > > +		period_ticks = 2;
> > > > +		ret = 1;
> > > > +	}
> > > 
> > > [Severity: Medium]
> > > Is returning a positive integer here intentional?
> > > 
> > > The PWM core subsystem expects round_waveform_tohw callbacks to return 0 on
> > > success or a negative error code on failure. Returning 1 could propagate as
> > > an error up to consumer drivers, breaking operation for very small periods.
> > 
> > It should return 1 in case the if any value is rounded, which in this case 
> > is the period.
> 
> Ack. However it's a bit strange that you fixup period_ticks = 0 to 2
> while 1 is kept as is. Either using 1 is invalid, then it should be
> updated to two, too. Or it gives a shorter period than 2, then 0 should
> be fixed up to 1 only.

Right. The condition should be: (period_ticks < 2).

> 
> > > > +	duty_ticks = mul_u64_u64_div_u64(wf->duty_length_ns, clk_rate, NSEC_PER_SEC);
> > > [ ... ]
> > > > +static int rp1_pwm_round_waveform_fromhw(struct pwm_chip *chip,
> > > > +					 struct pwm_device *pwm,
> > > > +					 const void *_wfhw,
> > > > +					 struct pwm_waveform *wf)
> > > > +{
> > > > +	struct rp1_pwm *rp1 = pwmchip_get_drvdata(chip);
> > > > +	const struct rp1_pwm_waveform *wfhw = _wfhw;
> > > > +	u64 clk_rate = rp1->clk_rate;
> > > > +	u32 ticks;
> > > > +
> > > > +	*wf = (struct pwm_waveform){ };
> > > > +
> > > > +	if (!wfhw->enabled)
> > > > +		return 0;
> > > > +
> > > > +	wf->period_length_ns = DIV_ROUND_UP_ULL((u64)(wfhw->period_ticks + 1) * NSEC_PER_SEC,
> > > > +						clk_rate);
> > > 
> > > [Severity: Medium]
> > > Could this encounter a 32-bit integer overflow?
> > > 
> > > Since wfhw->period_ticks is a 32-bit integer, the addition of 1 happens in
> > > 32-bit space before the cast to u64.
> > > 
> > > If the hardware register was configured to 0xffffffff by the bootloader for
> > > a 100% duty cycle, 0xffffffff + 1 wraps around to 0, producing a period of 0.
> > > 
> > > Should the cast be placed before the addition?
> > 
> > Ack. 0xffffffff should be deemed as a non valid value though.
> > 
> > > 
> > > > +
> > > > +	if (!wfhw->inverted_polarity) {
> > > > +		wf->duty_length_ns = DIV_ROUND_UP_ULL((u64)wfhw->duty_ticks * NSEC_PER_SEC,
> > > > +						      clk_rate);
> > > > +	} else {
> > > > +		ticks = wfhw->period_ticks + 1 - wfhw->duty_ticks;
> > > > +		wf->duty_length_ns = DIV_ROUND_UP_ULL((u64)ticks * NSEC_PER_SEC, clk_rate);
> > > 
> > > [Severity: Medium]
> > > Will this subtraction underflow if the hardware is configured for a 100%
> > > duty cycle?
> > > 
> > > The driver allows duty_ticks to exceed period_ticks + 1 to achieve a 100%
> > > duty cycle.
> > 
> > The driver is not allowing this since tohw() has this: 
> > 
> > duty_ticks = min(duty_ticks, period_ticks);
> > 
> > Anyway, if fromhw() is called first and the bootloader has configured 0xffffffff
> > in the period register, should it returns an error? The period should always be
> > at most U32_MAX-1.
> 
> I'm not sure if this triggers a PWM_DEBUG check, but I'd say the right
> thing is to let fromhw() report what the actual setting even if tohw()
> will never result in that setting.

Perfect, so the current behavior is fine.

> 
> Thinking again, the tohw() callback could be a bit more clever and also
> use period_ticks = 0xffffffff, as this fine if duty_ticks is less than
> this value and if duty_ticks = period_ticks = 0xffffffff you can still
> configure the hardware using period_ticks = 0xfffffffe to achieve the
> 100% relative dutycycle. (But keeping the current behaviour is fine for
> me, too.)

I think this is what it's currently doing in this patch iteration. I stand
corrected here when I said that period_ticks should be at max U32_MAX-1: logically
it can be U32_MAX but it's getting 'translated' into U32_MAX-1 as the value which 
is fed to the register. So the period is still U32_MAX, accounting for the extra
tick at the end. So I guess we're on the same page.

> 
> > > > +		wf->duty_offset_ns = wf->period_length_ns - wf->duty_length_ns;
> > > > +	}
> > > > +
> > > > +	return 0;
> > > > +}
> > > > +
> > > > +static int rp1_pwm_write_waveform(struct pwm_chip *chip,
> > > > +				  struct pwm_device *pwm,
> > > > +				  const void *_wfhw)
> > > > +{
> > > > +	struct rp1_pwm *rp1 = pwmchip_get_drvdata(chip);
> > > > +	const struct rp1_pwm_waveform *wfhw = _wfhw;
> > > > +	u32 value, ctrl;
> > > > +
> > > > +	/* early exit if disabled */
> > > > +	regmap_read(rp1->regmap, RP1_PWM_GLB_CTRL, &ctrl);
> > > > +	if (!wfhw->enabled) {
> > > > +		ctrl &= ~RP1_PWM_GLB_CTRL_CHANNEL_ENABLE(pwm->hwpwm);
> > > > +		goto exit_disable;
> > > > +	}
> > > 
> > > [Severity: High]
> > > Does skipping the polarity update here cause the output to erroneously
> > > remain HIGH while disabled?
> > > 
> > > The early exit skips the read-modify-write block that updates
> > > RP1_PWM_CHAN_CTRL_POLARITY.
> > > 
> > > The driver notes state that when disabled, the output is driven to 1 if
> > > polarity is inversed. If a channel previously configured with inverted
> > > polarity is disabled, it seems it will continually output a HIGH signal,
> > > violating the PWM framework expectation.
> > 
> > I'm not sure whether an inverted polarity pin shoudl stay low when disabled.
> > After all, the inactive state for a reversed pin is high.
> 
> Sashiko's concern is correctly stated, if you go from
> 
> 	polarity = inversed, enabled
> 
> to
> 
> 	polarity = normal, disabled
> 
> the output stays high, which is active for polarity = normal.

Ack. I'll set the polarity first so there will be no uncovered corner
case.

> 
> However the behaviour of a disabled PWM isn't specified, so any
> behaviour is fine, the only objective is to save power. And if the
> consumer relies on a constant inactive output, it's supposed to not
> disable it.
> 
> For me both behaviours are fine. Making the hardware emit the inactive
> level might prevent a surprise if the consumer isn't aware of the
> missing guarantee, but being lazy and so surprise the consumer is also
> fine as this might uncover that wrong assumption and allow the consumer
> to be fixed.
> 
> (And not all PWM implementations allow to configure the output level, so
> a guarantee cannot be given. Some go to 0 irrespective of the configured
> polarity, some go to High-Z.)

I was just curious about sashiko saying it's violating the pwm framework
expectations, while according to your words it seems there's no constraints.

BTW, I've tried to install sashiko and use it on my patches but it's obvious
that some custom settings are in order, since all I can get is some error
aborting the review after 3 attempts. Any chance you can share your Settings.toml
or any customization so I can test it in advance before submitting the new patchset
or do you recommend just throwing the new V5 at your script?

Many thanks,
Andrea

> 
> > > [Severity: High]
> > > Also, does registering a devm-managed regmap with the permanent syscon
> > > registry create a teardown asymmetry?
> > > 
> > > The regmap is allocated with devm_regmap_init_mmio(). If the underlying
> > > device is hotplug removed, devres will automatically free the regmap memory.
> > > 
> > > However, the syscon framework does not provide an unregister function,
> > > leaving it with a dangling pointer in its static list that could cause a
> > > use-after-free upon subsequent lookups.
> > 
> > The device is not hotpluggable and the driver cannot be unloaded/unbounded, so
> > there should be no dangling pointer around.
> 
> ack.
> 
> Best regards
> Uwe


