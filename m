Received: from mail-yw1-f176.google.com (mail-yw1-f176.google.com [209.85.128.176])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D4AB73F99E1
	for <sashiko-reviews@lists.linux.dev>; Fri, 17 Jul 2026 16:34:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.176
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784306061; cv=none; b=DJAbH2jUzOzU404GGFuU/Q4IiIFDl+HF9pufI1hQcPo+h+H490tiyqjI5i2kpA56YAIId94UFk4UXaKAWZv7MJpkf9l/yhZrB9oqG3DYXpi0BijiL8Dkfq/2TKDSX3Dm96g2nXnjK+90yDQDJI5w5hfDpgJsahhu5UdqoXArVXw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784306061; c=relaxed/simple;
	bh=6wnDDJQBQfpjll1dAST5KuLlqAlQD+gfIzZDEDQKs6o=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=iL9bQn+lo8gfbX6Br23+0fP42XhqIhbjbPCJ84s2iyYfsszaz8QpeZOJ7u7HNl5UEaVXpH960b5GD7WcLNhIh3KLcxVpDPIq9Mznqxby/59SZEkRE2D/74fqqaD96C9RqBlNnAsHyjT28e+IzMBW5tVUfRunla2bC+uh2egPwUE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=Afi9nzk9; arc=none smtp.client-ip=209.85.128.176
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="Afi9nzk9"
Received: by mail-yw1-f176.google.com with SMTP id 00721157ae682-80814edb536so49226917b3.2
        for <sashiko-reviews@lists.linux.dev>; Fri, 17 Jul 2026 09:34:17 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1784306056; x=1784910856; darn=lists.linux.dev;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :content-type:mime-version:references:message-id:subject:cc:to:from
         :date:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=SN6iKB84XjlCdyQZDXiTIhq7M2trG088S3ZqcAJw8RI=;
        b=Afi9nzk95b+meu0d1+PeHNWhcTAjQNDEG9SgtoyBF3Ut3U+UmLXr8FaLKILYJwyOG0
         /B+GcRh6sgN+DRCRJjJs9w8RlblsMm/Upzp7qT+SWkfo49YSPuFoMKbjjztJdtmhucLG
         jtONJbBM6BIILer4SFZ6Lom9QkswaiyFZ2/hFLBzFBP2w1ww2SUT6YKFCAocLlW++ajM
         WEPi9sAcmAbWfnC0733Q3ugMrdr0PV3ts8SxaYX9B7TQ5MrGyQwxA6FlCjMjDH/J4j8f
         pxu6X+tZx7OdoVO27r+Bz5At/65Ds13P+4f8tfesCcyMxMHgKIGI0Ocl/48e/cXw9Naq
         MrLA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1784306056; x=1784910856;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :content-type:mime-version:references:message-id:subject:cc:to:from
         :date:x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=SN6iKB84XjlCdyQZDXiTIhq7M2trG088S3ZqcAJw8RI=;
        b=L2a5luY/SCwo4SZhy9E1L19fQkFlHx0xTT8wRQJuwj9Q8d7yBqctf8YqkvzEQ2+v5s
         NPN/rhpNF90Usr6RScOexsGufl/qTeuZwGy4vC6qLeVKtSzXNKX6aRaDiaXDDKYAZWHF
         VEo0CzSu/6fd4DWGYbTRbSkMJmejn1RYZHPpe9zPSFmltyU8BX0tXxo5e7Pi0/t/3Yvg
         WJxrHcCr4lPkzUFB45gXiTxp5ZJLeBdRJXZqMWQ4c3ieAEj0rEs4PScKxFoWq81nPh1I
         I1+unDnJPEwhe391S5H8GD+kOLccJN7SPkWUKyUeOeM5OKk0OWDd0GekCtPHtmaWA3Cv
         RUSQ==
X-Gm-Message-State: AOJu0YyJFRI9E1Cj/Yvv3DwurHzCi3bYpak5MwcWi/3QYhRatfmWgz1h
	lFQUqMhAMyv28Cmo5f+v8tvXU51YetZS8HZ5/xv2bjgknjXSS9jURgLQ7NOUzQ==
X-Gm-Gg: AfdE7ck+lmwcIpKZ4V+lcUxxN6+F1p0X2GZBADKvOpfB2Sc9dx5RMd1hwo19t+BVRT4
	TkQ7alTjYgRRtLtDHPhb+FG/FrZYCJxRmGZrhnkj5D+Uf8eHMDr5SHmJSUnOC0b2rHqNOZV4s5d
	i5AVLCtGmSnn9e4EF4Cor2Uf6IyPFSFjh3dFg50MV8tiOfMxgUbKOAVEuFTHJWoW/Q0nHa2YTdS
	b+vkCecfq9fZZXCXUGR9xSzy/4gzknOubqrneOiRg80Q0zEwD1vED4hbNucu54QOWZE98Y+wrTb
	nZPWR/mmT+d5Yz1LtmgaARuQh5e5QQ3FE/iwfF0UNs2oJ/dM2Zz6d/RBrw3sR/lKm7fwkMb2I9S
	fQaaYxtVEjruMZL9eLqTgsADpA+fFysBPmmHA4aZ67x7hxqofa103d5E+WsiZRn34FwrZisVuKP
	16ZNRXBXTPCSI=
X-Received: by 2002:a05:690c:6107:b0:81e:bbcd:f5c3 with SMTP id 00721157ae682-81ef25e16eamr11174017b3.36.1784306056131;
        Fri, 17 Jul 2026 09:34:16 -0700 (PDT)
Received: from localhost ([2804:30c:1f09:b400:47f8:7933:2105:dd41])
        by smtp.gmail.com with ESMTPSA id 00721157ae682-81efe45416fsm53397b3.6.2026.07.17.09.34.14
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 17 Jul 2026 09:34:14 -0700 (PDT)
Date: Fri, 17 Jul 2026 13:35:14 -0300
From: Marcelo Schmitt <marcelo.schmitt1@gmail.com>
To: sashiko-reviews@lists.linux.dev
Cc: Marcelo Schmitt <marcelo.schmitt@analog.com>, robh@kernel.org,
	conor+dt@kernel.org, devicetree@vger.kernel.org,
	linux-iio@vger.kernel.org, marcelo.schmitt1@gmail.com
Subject: Re: [PATCH v7 3/4] iio: adc: ltc2378: Enable high-speed data capture
Message-ID: <alpZwoau3QVPtBsP@debian-BULLSEYE-live-builder-AMD64>
References: <cover.1784235595.git.marcelo.schmitt@analog.com>
 <564b975c2c62d28ee6733f86bd5632c41a7c80e4.1784235595.git.marcelo.schmitt@analog.com>
 <20260716212451.923951F000E9@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: sashiko-reviews@lists.linux.dev
List-Id: <sashiko-reviews.lists.linux.dev>
List-Subscribe: <mailto:sashiko-reviews+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:sashiko-reviews+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20260716212451.923951F000E9@smtp.kernel.org>

On 07/16, sashiko-bot@kernel.org wrote:
> Thank you for your contribution! Sashiko AI review found 1 potential issue(s) to consider:
> - [High] Integer divide-by-zero leading to kernel panic in `ltc2378_update_conversion_rate` when a sampling frequency of 1 Hz is requested and the PWM driver rounds the period length above 1 second.
> --
> 
> --- Patch [3]: [PATCH v7 3/4] iio: adc: ltc2378: Enable high-speed data capture ---
> commit ef54f2c79f2cac1649922032814adc7fcc5f9684
> Author: Marcelo Schmitt <marcelo.schmitt@analog.com>
> Subject: iio: adc: ltc2378: Enable high-speed data capture
> 
> This commit enables high-speed data capture for the ltc2378 ADC driver by
> utilizing SPI transfer offloading. It allows data acquisition at faster sample
> rates up to 2 MSPS.
> 
> > diff --git a/drivers/iio/adc/ltc2378.c b/drivers/iio/adc/ltc2378.c
> > index 5600c820c7f45..7d29f021cb7b4 100644
> > --- a/drivers/iio/adc/ltc2378.c
> > +++ b/drivers/iio/adc/ltc2378.c
> 
> [ ... ]
> 
> > +	/*
> > +	 * Configure SPI offload PWM trigger.
> > +	 * The trigger should fire after tBUSYLH + tCONV + tDSDOBUSYL.
> > +	 * Minimum time needed: TBUSYLH (13ns) + TCONV (part-specific) + TDSDOBUSYL (5ns)
> > +	 *
> > +	 * Use the same period as CNV PWM to avoid timing issues.
> > +	 * Convert back from period to frequency for the SPI offload API.
> > +	 */
> > +	offload_period_ns = cnv_wf.period_length_ns;
> > +	config.periodic.frequency_hz = div_u64(HZ_PER_GHZ, offload_period_ns);
> > +	min_read_offset = LTC2378_TBUSYLH_NS + st->info->tconv_ns + LTC2378_TDSDOBUSYL_NS;
> > +	offload_offset_ns = min_read_offset;
> > +	count = 100;
> > +	do {
> > +		config.periodic.offset_ns = offload_offset_ns;
> > +		ret = spi_offload_trigger_validate(st->offload_trigger, &config);
> > +		if (ret)
> > +			return ret;
> > +		offload_offset_ns += 10;
> > +	} while (count-- && config.periodic.offset_ns < min_read_offset);
> > +
> > +	/* Check the minimum CNV to SCLK delay is met */
> > +	if (config.periodic.offset_ns < min_read_offset)
> > +		return -EDOM;
> > +
> > +	/* Check the PWM periods remain the same */
> > +	offload_period_ns = div64_u64(HZ_PER_GHZ, config.periodic.frequency_hz);
> 
> [Severity: High]
> Could this result in a kernel panic due to an integer division by zero?
> 
> If a user writes 1 to the IIO in_voltage_sampling_frequency sysfs attribute,
> ltc2378_update_conversion_rate() is called with freq_Hz = 1, and the initial
> requested PWM period is calculated as 1,000,000,000 ns.
> 
> If the underlying hardware PWM driver rounds the period slightly upwards
> (e.g., to 1,000,000,001 ns) during pwm_round_waveform_might_sleep() due to
> clock granularity, offload_period_ns will exceed HZ_PER_GHZ.
> 
> This causes config.periodic.frequency_hz = div_u64(HZ_PER_GHZ, offload_period_ns)
> to evaluate to 0.
> 
> When div64_u64(HZ_PER_GHZ, config.periodic.frequency_hz) is subsequently called,
> it divides by zero.

If we have cnv_wf.period_length_ns == NSEC_PER_SEC + 1 after the offset_ns loop
and config.periodic.frequency_hz == 0 as suggested, then spi_offload_trigger_validate()
will fail the frequency_hz check and ltc2378_update_conversion_rate() errors
out with -EINVAL before reaching div64_u64(HZ_PER_GHZ, config.periodic.frequency_hz).
https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git/tree/drivers/spi/spi-offload-trigger-pwm.c?h=v7.2-rc3#n48

> 
> > +	if (cnv_wf.period_length_ns != offload_period_ns)
> > +		return -EDOM;
> > +
> > +	st->offload_trigger_config = config;
> > +	st->cnv_wf = cnv_wf;
> > +	st->cnv_Hz = DIV_ROUND_CLOSEST_ULL(HZ_PER_GHZ, cnv_wf.period_length_ns);
> > +
> > +	return 0;
> > +}
> 
> -- 
> Sashiko AI review · https://sashiko.dev/#/patchset/cover.1784235595.git.marcelo.schmitt@analog.com?part=3
