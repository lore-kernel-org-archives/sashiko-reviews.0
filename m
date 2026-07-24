Received: from mail-ej1-f41.google.com (mail-ej1-f41.google.com [209.85.218.41])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F3F6134041C
	for <sashiko-reviews@lists.linux.dev>; Fri, 24 Jul 2026 15:00:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.41
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784905242; cv=none; b=qJtXKiywo6lepMUnQHLCWf878FuduT4aSalVgDtfv3lyMpYF6G31fIcyCSUnjWPni1XkIsy7FmFXGSZYbGWIr2po3VYQau3yAyGXU7RIchoOuCG64isb9qjv9ldAdy4AZ2Z7+GGdF0XENaTckGz/OUgYFnCeN1Cj5v3yjOtZPRk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784905242; c=relaxed/simple;
	bh=DGO16UZqE1c7kBKgZWWWmvqwIdGLbbOauuEtxuhSB+U=;
	h=From:Date:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=XGjdzgpYvj4YycqG5FBnF4192y1TrxFIcfGDI7ehxyh8VJrQXLWejngWK41XZYdoKgdDxfUq+ucmFL8OPH4YKVou7dv2kITbF3lCxPvxqZnFjHoQws58rYJC4sPH5ZtKjWikn8RtpJEu6p2iLAD+3RYgvWPTjsOH2TphNT+gOu0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=suse.com; spf=pass smtp.mailfrom=suse.com; dkim=pass (2048-bit key) header.d=suse.com header.i=@suse.com header.b=N76UL+O9; arc=none smtp.client-ip=209.85.218.41
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=suse.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=suse.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=suse.com header.i=@suse.com header.b="N76UL+O9"
Received: by mail-ej1-f41.google.com with SMTP id a640c23a62f3a-c1670dad7a8so84479166b.3
        for <sashiko-reviews@lists.linux.dev>; Fri, 24 Jul 2026 08:00:37 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1784905235; x=1785510035; darn=lists.linux.dev;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :content-type:mime-version:references:message-id:subject:cc:to:date
         :from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=ZagFeF2KNjwSqmz3F8+h72EZ8Dn6xlzEVHPl1dEkLtw=;
        b=N76UL+O9dQMeniFZ30Z7YI0XelcxosoX3WTWtjtFaVvM38Ztp46CBRH2wKGFlw+W7F
         lheA3ezN/4zryht9ApiIsudyV1WIFCfGEhOu34YQETYRjA0lLBQxMQgSB7jBge7MJYCf
         f/8mtiDEi58x9/zIQnlgeg0ybqeoDufIHu9flWb5J44LORv6WyZu1ORWbo8zJYchqFBA
         RvwNYgJ43xvDa5uRyXE6zWkWw+HeryiEF3J6r7gOQBiYr4oW26c3XotpYK30E2GNSOxj
         GMKfuGvukJl2yH728N8+d4/PND3tSxSCBrqqn1S00aHS4L71w8c5MeGwe1nHQoAG3VlX
         kngw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1784905235; x=1785510035;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :content-type:mime-version:references:message-id:subject:cc:to:date
         :from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=ZagFeF2KNjwSqmz3F8+h72EZ8Dn6xlzEVHPl1dEkLtw=;
        b=fk6tdXbevYYjhDnYNQV4pZKz2ch1C9pGR3woy1FzSGdJyBv2FdjZaiyPwxHuWbrIN+
         Qt+6ALeXh+I6VBfKpCRuM/WqsDQ8JmZ8v3sfX+xDMru4TWPDNf8cjTFLbAuRNhSLfVZq
         kSYDdX3TMXz/YnPevhh5/yLXKUYBqUbf6DEtYnhXSI1EBv53K5DprxsvsZRqaXlGGUHK
         9F8cZYAfSskl7NqfDxe/Cigp9aNib53Ysp26AXMtMgcWepyUG+zz24tycAGqzzgB5eem
         L6qfI3C2w40Frb+iCjHnPo3XOt1RMQrNkg7lit9DaRxd7fuI5UUujFSRxVbl7owOG1zO
         dp0Q==
X-Gm-Message-State: AOJu0YzEYetum2oH7lxpN8dMwzQ0MNF9M0gykCij45MD+1ocXK1EgIhp
	3ccC2wr1gscbio+BzTlMoumphM93qFPETgbNGLOmUVx8H0ZvOjVrFI6rPJxH77seprqeD2WO7bf
	ebunHbNw=
X-Gm-Gg: AR+sD11XVIBcZ6gw0l/nZkwXBM4SdKWyhlN6jqLoOrPDIgU2+m8OIT5hE9r3s2uPKOm
	d2W4KtZVStth2544rHFioDgGZvF8CY2F1pMq+aREacQNB2WVsy59cbjBDlpRkxq3tkzYGZAbZKY
	YRVQpzaQCHWzlqg7IwHHwDnUTp+aaP1JGczwwCYsnewcykFuccAgrMb9oRTJUzhNJbdiLYJcCwx
	4n5nZFT9re8zF2utmP3TOYp4Ra3A/tXwP1xp9f353k3LcySG61PmySjTOdWSh1hmyyZH7F54Oeh
	9Nz9HTTCYfOZNs97ioiM3PJHGSBEuUXOEBJjbHihYLy5WCZagIxdfAEepajAHuJpCyexjakBSsU
	HTWfWP0gbJzJLNmbvUo7vB89DBTJFjkoNnvBM7jxOWn9pQsPAGv8a7atLh17yTB4dysl/sY5+bx
	5p
X-Received: by 2002:a17:907:b04d:20b0:c19:fb6e:5ff0 with SMTP id a640c23a62f3a-c1c50978dabmr253423966b.15.1784905235039;
        Fri, 24 Jul 2026 08:00:35 -0700 (PDT)
Received: from localhost ([195.94.145.62])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-c1c32f13cb4sm373963366b.61.2026.07.24.08.00.34
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 24 Jul 2026 08:00:34 -0700 (PDT)
From: Andrea della Porta <andrea.porta@suse.com>
X-Google-Original-From: Andrea della Porta <aporta@suse.de>
Date: Fri, 24 Jul 2026 17:04:04 +0200
To: sashiko-reviews@lists.linux.dev
Cc: Andrea della Porta <andrea.porta@suse.com>, devicetree@vger.kernel.org,
	conor+dt@kernel.org, robh@kernel.org, ukleinek@kernel.org
Subject: Re: [PATCH v7 2/3] pwm: rp1: Add RP1 PWM controller driver
Message-ID: <amN-5B5POX3rNb29@apocalypse>
References: <cover.1784539788.git.andrea.porta@suse.com>
 <a83d65b2d91865eb722337c547c94dce175e6086.1784539788.git.andrea.porta@suse.com>
 <20260720100212.BEF1D1F000E9@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: sashiko-reviews@lists.linux.dev
List-Id: <sashiko-reviews.lists.linux.dev>
List-Subscribe: <mailto:sashiko-reviews+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:sashiko-reviews+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20260720100212.BEF1D1F000E9@smtp.kernel.org>

Hi,

On 10:02 Mon 20 Jul     , sashiko-bot@kernel.org wrote:
> Thank you for your contribution! Sashiko AI review found 3 potential issue(s) to consider:
> - [High] Missing `.remove` callback leads to Use-After-Free in the PWM and Syscon cores and leaks clock resources on driver unbind.
> - [High] Register context loss on suspend/resume silently breaks PWM output.
> - [High] Unclamped hardware duty ticks lead to integer underflow in the PWM core for normal polarity.
> --
> 
> --- Patch [2]: [PATCH v7 2/3] pwm: rp1: Add RP1 PWM controller driver ---
> commit 0c98703d857577902e57d25b42a3d46dfbde5795
> Author: Naushir Patuck <naush@raspberrypi.com>
> 
> pwm: rp1: Add RP1 PWM controller driver
> 
> The Raspberry Pi RP1 southbridge features an embedded PWM controller with
> 4 output channels, alongside an RPM interface to read the fan speed on the
> Raspberry Pi 5. Add the supporting driver.
> 
> > diff --git a/drivers/pwm/pwm-rp1.c b/drivers/pwm/pwm-rp1.c
> > new file mode 100644
> > --- /dev/null
> > +++ b/drivers/pwm/pwm-rp1.c
> 
> [ ... ]
> 
> > +static int rp1_pwm_round_waveform_fromhw(struct pwm_chip *chip,
> > +					 struct pwm_device *pwm,
> > +					 const void *_wfhw,
> > +					 struct pwm_waveform *wf)
> > +{
> > +	struct rp1_pwm *rp1 = pwmchip_get_drvdata(chip);
> > +	const struct rp1_pwm_waveform *wfhw = _wfhw;
> > +	u64 clk_rate = rp1->clk_rate;
> > +	u64 ticks;
> > +
> > +	*wf = (struct pwm_waveform){ };
> > +
> > +	if (!wfhw->enabled)
> > +		return 0;
> > +
> > +	wf->period_length_ns = DIV_ROUND_UP_ULL(((u64)wfhw->period_ticks + 1) * NSEC_PER_SEC,
> > +						clk_rate);
> > +
> > +	if (!wfhw->inverted_polarity) {
> > +		wf->duty_length_ns = DIV_ROUND_UP_ULL((u64)wfhw->duty_ticks * NSEC_PER_SEC,
> > +						      (u32)clk_rate);
> > +	} else {
> 
> [Severity: High]
> Does the normal polarity case need to clamp the duty ticks similar to the
> inverted polarity case?
> 
> If the bootloader configures a continuous-high state where the raw hardware
> duty ticks exceed the period ticks + 1, this path calculates a duty_length_ns
> that is strictly greater than the period_length_ns.
> 
> When the PWM core subsequently reads this initial state, pwm_wf2state()
> handles duty > period by treating it as an inverted polarity and calculating
> duty_cycle = period - duty_length_ns. This subtraction can silently
> underflow, causing the core to interpret the hardware state as having a badly
> corrupted duty cycle.

The conditional right after the opening bracket of this else branch (see below
for the code) is there just for that: clamping the duty to sane values. So it
already takes care of that.

> 
> > +		if (wfhw->duty_ticks > (u64)wfhw->period_ticks + 1) {
> > +			/* 100% duty cycle case */
> > +			ticks = 0;
> > +		} else {
> 
> [ ... ]
> 
> > +static int rp1_pwm_write_waveform(struct pwm_chip *chip,
> > +				  struct pwm_device *pwm,
> > +				  const void *_wfhw)
> > +{
> > +	struct rp1_pwm *rp1 = pwmchip_get_drvdata(chip);
> > +	const struct rp1_pwm_waveform *wfhw = _wfhw;
> > +	u32 value, ctrl;
> > +
> > +	/* set polarity */
> > +	regmap_read(rp1->regmap, RP1_PWM_CHAN_CTRL(pwm->hwpwm), &value);
> > +	if (!wfhw->inverted_polarity)
> > +		value &= ~RP1_PWM_CHAN_CTRL_POLARITY;
> > +	else
> > +		value |= RP1_PWM_CHAN_CTRL_POLARITY;
> > +	regmap_write(rp1->regmap, RP1_PWM_CHAN_CTRL(pwm->hwpwm), value);
> 
> [Severity: High]
> Could the PWM controller lose its hardware configuration after a system
> suspend and resume?
> 
> During rp1_pwm_request(), the channel control register is initialized with
> essential bits like RP1_PWM_CHAN_CTRL_DEFAULT, which includes the
> MODE_TE_MS and FIFO_POP_MASK configurations.
> 
> If the hardware loses power during suspend, the registers reset. On resume,
> when a consumer re-applies its state, this regmap_read() will read the wiped
> hardware register. The driver will then update only the polarity bit and
> write it back, failing to restore the required operational mode bits that
> were initialized during the request phase.

I think I've already answered this here: 
https://lore.kernel.org/all/aiGAINsTG8VZLn28@apocalypse/
so I guess Sashiko is not sotring the entire history as
context, so I'll reply it here:

AFAIK the RP1 is never powered-off, so just shutting down the clock should be ok
and no register are reset to default.

> 
> > +
> > +	/* early exit if disabled */
> 
> [ ... ]
> 
> > +static struct platform_driver rp1_pwm_driver = {
> > +	.probe = rp1_pwm_probe,
> > +	/*
> > +	 * .remove is not needed because this driver cannot be removed/unbound
> > +	 * cause it relies on syscon which cannot be removed
> > +	 */
> > +	.driver = {
> > +		.name = "rp1-pwm",
> 
> [Severity: High]
> Is it safe to omit the remove callback here?
> 
> Even with suppress_bind_attrs set on the driver, if the parent RP1 PCIe
> device is removed, reset, or unbound via sysfs, it will forcibly unbind all
> child devices.
> 
> Without a remove callback to run cleanup, pwmchip_remove() is never called
> and the clock is left enabled. Because the backing memory is devm-managed,
> the devres subsystem will eventually free the pwm_chip and regmap memory.
> This can leave dangling pointers in the core pwm_chips IDR and the global
> syscon_list, which could result in a use-after-free.

This is true. Uwe, I guess I should reintroduce the .remove callback,
what do you think?

Thanks,
Andrea

> 
> > +		.of_match_table = rp1_pwm_of_match,
> > +		.pm = pm_ptr(&rp1_pwm_pm_ops),
> > +		.suppress_bind_attrs = true,
> > +	},
> > +};
> 
> -- 
> Sashiko AI review · https://sashiko.dev/#/patchset/cover.1784539788.git.andrea.porta@suse.com?part=2
