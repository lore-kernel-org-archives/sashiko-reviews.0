Received: from mail-yw1-f180.google.com (mail-yw1-f180.google.com [209.85.128.180])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 467FA3B2FE4
	for <sashiko-reviews@lists.linux.dev>; Fri, 10 Jul 2026 21:14:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.180
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783718069; cv=none; b=hoNbiPHyPP26yFh0PmsnaPZ+DAmoo68YFcuCvogMsl+BPp+mClY4B43/Gxcag1Wfah/mK3i06G/lBMsXlxF9qLVjNKIENyq9jbC0/jq+P8r501KH4ZWeOh2q2nKLWWIar8kRHsdVtlcSReKZBajs/5edTgEUIgt27iORRxuLCik=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783718069; c=relaxed/simple;
	bh=/MHLEQNMWxLpfWTWwhvlzLz4+MIMJenat62fWPKTec8=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=QAaRI7k2eS/0C+u6DztcwrwYBUwo027O7ecSUSQjcQamlQQy4KeQHUOT9ssET8gReOxV8mfn7kxr+fCbNKtPtcwrx+jieEqlFtsotckjJ83PPLqmAE7ho4YjJvoNjjsmKuNL9+/5UhErzvzhymNvg8i7Iwn4ZcNDh6IZtPBjW20=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=APuph9uk; arc=none smtp.client-ip=209.85.128.180
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="APuph9uk"
Received: by mail-yw1-f180.google.com with SMTP id 00721157ae682-7dbcb505578so15603907b3.3
        for <sashiko-reviews@lists.linux.dev>; Fri, 10 Jul 2026 14:14:28 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1783718067; x=1784322867; darn=lists.linux.dev;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=Ito17Ylev/a9CxopzLHejL/a08tEt9HCGC3Am4P7UkE=;
        b=APuph9ukwN1QrJQOSo0c7YNpno4E70IcQjhLuI/rNrmh7YiBBjnLG5z6ntyliTeR9Y
         ONhdAAfuRSKCxUBq8coOdKNDqk+CtOD6Ba8jY04ow1CKOoVoTSqlADDeZLXf+v5vIu3w
         td0N+IiwvXL7AWCW3yhXSC+/r/WLt4FlBl6xEYLIBASeDZchAP91OQl1uu4L4xZMvPEb
         +SvoB4i0dux0QkslVkiovSHbYACmmBRAQ2M2JrAIp6n7bmVEtb4OUVieaWE3WPDbuPgA
         R+m2odxXCSELsCj8xQpBhDMDg1CgqsZEn0mjS8QO3//NQZuMjWLsOCAOOZ45kN7Orpc+
         drnQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1783718067; x=1784322867;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=Ito17Ylev/a9CxopzLHejL/a08tEt9HCGC3Am4P7UkE=;
        b=DOZpdQ/gSFujP+pQH0O0C0/5cI/XyY7zinWLh9wF2BMSzRGFH/2STN37HNGWy2cXfc
         A5Da6MeTkr7Z+qDu7HcJxbMBV11NoYyXFXKCtUdfeWeT8bCAXOhMvjx0q6bOi6wuQT3T
         x8plrxYfaFLKim8YyrsXo/+rGE6l6ekLcoLZvtMu+MPIszc2wg9nPB5zMM8xesWKtnvh
         obMEAqbRkqmD/7YYd/bGo8UQMxMNwzcgpZLr8dqv1xapbH7LjFwvyPXqEeWLF7cx4q0Y
         aP4RzdGxnYA94B+T0ISGRTjEViGqIwFnT4l2do2XRGRebPnd12w/o9kkPYgOcEdaYfhO
         pqpA==
X-Gm-Message-State: AOJu0Yym416fuPdemvwoORvhxA8yKCw2jnpWFZlaCsrYWjQ3x3k05g5u
	zU0y2Lhd2w7oqGykI8HpDSYqjheWJbQDsSmqv8vx/QMuunGCObr6s0yWfGD2nQ==
X-Gm-Gg: AfdE7cnFQXamqGAM3npAWMw5Nrzy5Za7vSqQIEebpapYC21y+dFa0gtOGAWOLlaqQEr
	tcVFWOxfu5zyLCP4Ur4wQXEB6H22H+mlHMkEAEpXNNWbyGzfM7xHRh33JoYSfsX6eLJLg1H8ho3
	gT5F3edSd9WIDSGuo0HeEDb3HeeOD4kC1pWUZkniWO+dTGKeaVnmIY4Dqy/q07ZTgyFa7NJAc1+
	LTMWI0LMK/gG67D97PNpJHMNaDcPEvoDFqkZDlkYXa2u2rtXAvYh32KkWDQ++8caZjOThtu8ulf
	5oVq3pYYAybFjCIF3irnSliQRfy4Qr8R1EZReybSpVKvWpV8qxFHxtfGHeqkQ6Zu0EtHWyD/mea
	hGEH+Mc1DIoM0KNCH4dUjlzWPaPRrSpeNpUTkfqs93mtm3nKX2zzBADw+xVfm8myE2vQfZNRsRK
	tXYaL4J8OdRbQrBFfZhJiakw==
X-Received: by 2002:a05:690c:638a:b0:81e:6a3a:a562 with SMTP id 00721157ae682-81e9003dde0mr4858867b3.17.1783718067290;
        Fri, 10 Jul 2026 14:14:27 -0700 (PDT)
Received: from localhost ([2804:30c:1f09:b400:47f8:7933:2105:dd41])
        by smtp.gmail.com with ESMTPSA id 00721157ae682-81e6c212f14sm56630587b3.42.2026.07.10.14.14.26
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 10 Jul 2026 14:14:26 -0700 (PDT)
Date: Fri, 10 Jul 2026 18:15:21 -0300
From: Marcelo Schmitt <marcelo.schmitt1@gmail.com>
To: sashiko-reviews@lists.linux.dev
Cc: Marcelo Schmitt <marcelo.schmitt@analog.com>,
	devicetree@vger.kernel.org, robh@kernel.org, conor+dt@kernel.org
Subject: Re: [PATCH v6 3/4] iio: adc: ltc2378: Enable high-speed data capture
Message-ID: <alFg6RVbM4ohZLsi@debian-BULLSEYE-live-builder-AMD64>
References: <cover.1783629101.git.marcelo.schmitt@analog.com>
 <4d4b5cac52b6f4a341d97bd41562a451e8e757f7.1783629101.git.marcelo.schmitt@analog.com>
 <20260709232444.40EE11F000E9@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: sashiko-reviews@lists.linux.dev
List-Id: <sashiko-reviews.lists.linux.dev>
List-Subscribe: <mailto:sashiko-reviews+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:sashiko-reviews+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260709232444.40EE11F000E9@smtp.kernel.org>

On 07/09, sashiko-bot@kernel.org wrote:
> > +	/*
> > +	 * Configure SPI offload PWM trigger.
> > +	 * The trigger should fire after tBUSYLH + tCONV + tDSDOBUSYL.
> > +	 * Minimum time needed: TBUSYLH (13ns) + TCONV (part-specific) + TDSDOBUSYL (5ns)
> > +	 *
> > +	 * Use the same period as CNV PWM to avoid timing issues.
> > +	 * Convert back from period to frequency for the SPI offload API.
> > +	 */
> > +	offload_period_ns = cnv_wf.period_length_ns;
> > +	config->periodic.frequency_hz = DIV_ROUND_UP(HZ_PER_GHZ, offload_period_ns);
> > +	min_read_offset = LTC2378_TBUSYLH_NS + st->info->tconv_ns + LTC2378_TDSDOBUSYL_NS;
> > +	offload_offset_ns = min_read_offset;
> > +	count = 100;
> > +	do {
> > +		config->periodic.offset_ns = offload_offset_ns;
> > +		ret = spi_offload_trigger_validate(st->offload_trigger, config);
> > +		if (ret)
> > +			return ret;
> 
> [Severity: High]
> Does modifying config directly leave the device state out of sync if
> validation fails?
> 
> Here config aliases to &st->offload_trigger_config, and its frequency_hz and
> offset_ns fields are mutated. If spi_offload_trigger_validate() returns an
> error, the function returns without restoring the old configuration.
> 
> However, st->cnv_wf is only updated at the end of the function. If the
> buffer is later enabled, could this result in the PWM running with the old
> frequency while the SPI offload engine tries to use the new, rejected
> frequency?
> 
Ok, v7 will come with a local variable to hold offload trigger configuration
until all checks pass and both st->offload_trigger_config and st->cnv_wf can
be updated.

> > +		offload_offset_ns += 10;
> > +	} while (count-- && config->periodic.offset_ns < min_read_offset);
> > +
> > +	/* Check the minimum CNV to SCLK delay is met */
> > +	if (config->periodic.offset_ns < min_read_offset)
> > +		return -EDOM;
> > +
> > +	/* Check the PWM periods remain the same */
> > +	offload_period_ns = div64_u64(HZ_PER_GHZ, config->periodic.frequency_hz);
> > +	if (cnv_wf.period_length_ns != offload_period_ns)
> > +		return -EDOM;
> 
> [Severity: Medium]
> Could this strict equality check unintentionally reject valid sample
> frequencies due to integer math rounding?
> 
> If a requested frequency produces a period (cnv_wf.period_length_ns) that
> does not perfectly divide 1,000,000,000, DIV_ROUND_UP() might round the
> frequency up. Converting that frequency back to a period via div64_u64()
> would yield a slightly smaller period.
> 
> For example, 133,333 Hz yields a 7500 ns period. 10^9 / 7500 = 133333.33,
> which rounds up to 133334. Then 10^9 / 133334 = 7499 ns. Since 7500 != 7499,
> this check would fail and return -EDOM.

The setup for SPI offload support uses two PWM sources. One PWM drives CNV to
periodically start new conversions, the other signals to the SPI controller when
it can start fetching data. CNV and trigger PWMs must be offset by some ns. In
addition to that, the PWM sources must be synchronized such that the PWM
connected to the controller doesn't fire too early nor too late. And, finally,
the user might want to run the data capture for an arbitrarily long period of
time, requiring the PWM sources to remain synchronized to be able to
consistently read valid samples.

Those requirements pretty much imply the PWM sources to have the same period.
Though, our peripheral device driver only knows about the SPI controller
PWM through the offload_trigger abstraction. After spi_offload_trigger_validate(),
the client driver has no way to know whether the new frequency value is a result
of integer rounding or PWM hardware not supporting the requested period/frequency.
Even though the divergence in the provided example seems to be caused by integer
rounding, it might not always be the case.

> 
> > +
> > +	st->cnv_wf = cnv_wf;
> > +	st->cnv_Hz = DIV_ROUND_CLOSEST_ULL(HZ_PER_GHZ, cnv_wf.period_length_ns);
> > +
> > +	return 0;
> > +}
The other comments seem to make sense.
