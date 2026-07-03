Received: from mail-pl1-f182.google.com (mail-pl1-f182.google.com [209.85.214.182])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1C1FA433E63
	for <sashiko-reviews@lists.linux.dev>; Fri,  3 Jul 2026 17:18:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.182
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783099127; cv=none; b=hxYj4GTKy0eLQCSvtM1MBEbWovJfqRMyW3veLkLzsRgCMuP8EPVuA3z7Ch/oEwQt71R6PtHI7Z+wasMuCJ1igbPlgp9ZSDkhA9N3IzPKXKVen8NVE0wlBVMeSbiohN3gO/7ldHa402lo7fAmlD7LdsKxrpjgxqmkSyRSvJn+y80=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783099127; c=relaxed/simple;
	bh=eIggaG2N2f3wRCFefm0wikse4eo8hITiDcLQJmaNhXQ=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=sOh54KxkCFQSzRftXeJ/VV1GMFgyTeqnsbgrXb59KkL7EsSkcoendjGUQNgJCEYg5cZKC33DNZ59Ti1/ehIwZILnIOU8DVLitstEHcDmfrB2DYYnTVe7fRtItANSsJ9Sz8Y4nFFV9NC0UccU8vNmtqq4tzzXMqk83pCihbfbMGo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=hPZwGY8B; arc=none smtp.client-ip=209.85.214.182
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="hPZwGY8B"
Received: by mail-pl1-f182.google.com with SMTP id d9443c01a7336-2caf4496889so1107325ad.1
        for <sashiko-reviews@lists.linux.dev>; Fri, 03 Jul 2026 10:18:44 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1783099124; x=1783703924; darn=lists.linux.dev;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date:from:to
         :cc:subject:date:message-id:reply-to;
        bh=nN+A2NTh4/3eIcKa2Wt9oXaZKo3m4HxZR1ljIVJsVsI=;
        b=hPZwGY8BJJTaRB7JBAJvTADUAwRMoUFDnVouXo/Tp3WFvjGtmdhYJaoOvwrkAqGoWl
         PewXGLb4rsH68zmZDGMhJlSwx7CkpIrydoKNekWVj3k9UbLhJfqTXAcFXKkYiW5anQTE
         6eIncRrvNkqToBekSE3HHBGctnIlfurJHKirQJ880iHVWDLVIQVTf6Plba1bZV/srPG2
         4WH5XqcKiHl5Rzctzq8xRo2E9CujTbd78CECYfCKwa6LmUmn+wCOmRner0p8mog/P02F
         oPeLVtD5RMv69jYN+LyYXK8Gh+v88QCFqes03mx+6bs8V2tPd0UgkIlcCrboYfzcKgNS
         QxUQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1783099124; x=1783703924;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=nN+A2NTh4/3eIcKa2Wt9oXaZKo3m4HxZR1ljIVJsVsI=;
        b=bf441e12FBtxFmLpeK0wiuNQQFt5m3eM2u5zAtWnrPnD0QaA6YlC83LMtXSK39QwOD
         7huW+Az0T8WSZ9VWeqSDog+h5e58kQViP/xdjAS+0EWelg+mtYB1/4ytJLAso2wq2hws
         p/DgRuL/RDi2FsWAmYjoTqlob//YGMBKDQHYyKgMdO3gefCMSkZrv0AS4PI1CfZlp1A9
         7IOxKHUV9vxSal/bSY3byK0o7HZX3mIC/NMcWPmVVmxeqCtRUwx0PmtZkLNRc+e6OVKZ
         IWZdPNZA4pCrmUqc8m+tl8oPqwsiqCtsjgstaxZ5CUsTJH/+00Q5bZxljsUNrfDLQWxb
         hcOg==
X-Gm-Message-State: AOJu0Ywt9Qt2bA4gxQ5edGRvQJfXTJjUaTvba8jrLJGvYhpDwhRLpBoN
	JEdsIEVBN+3VMlwRIAHtM34WfMW6YFNi1DqG8L4mDC4+QtSA8azvNiwOzNlErw==
X-Gm-Gg: AfdE7cnkUoYcYwr+raCEWLCmjsNpkCRkE7m5wtLKBHXsJJ0f0MrfZ9yf6a3L480bqGi
	P7oFbFH6tHisod8jjVlBEYx6kgPuo5Ugu0ffojhLO9u0E4jWJVxEDNm9/Uk7M247qnExJe8jj7Y
	umvTp7Asxhfpav90j0T/8civ8yovcZmzi0dxAjCjiqLNhw5XaV4X/Vze16j9OE4k2EQCNSPa3lV
	tKRrz+4CJljaSCHtRxfHUz4Y2tPwFechlMMdQqrVpIungZpYmQ/0SnDPzPKF9C9Ymk7kFq3UUwF
	tp2mlca1SgaX3o+BmR5vxKnXwpTel/8Wnht6znAP2MxgL4uZ9roOE09a96IaiHqOwAE8FmYyg+u
	8X+rMHyiWfa+o15iFszYSM/83lJqjUU1QNhZuikiP4w33LH1eCW5qkTD2DbpTyboy3hLftFaDqp
	9IdHoGqsKYWV8XRFDIay6IGGCf1Q8t8C3D
X-Received: by 2002:a17:902:ce87:b0:2ca:9a9f:bb10 with SMTP id d9443c01a7336-2cacb196b1emr45488715ad.22.1783099124211;
        Fri, 03 Jul 2026 10:18:44 -0700 (PDT)
Received: from localhost ([2804:30c:1618:8400:e838:86ad:21d4:de00])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-13b3c7ef188sm21275916c88.2.2026.07.03.10.18.42
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 03 Jul 2026 10:18:43 -0700 (PDT)
Date: Fri, 3 Jul 2026 14:19:32 -0300
From: Marcelo Schmitt <marcelo.schmitt1@gmail.com>
To: sashiko-reviews@lists.linux.dev
Cc: Marcelo Schmitt <marcelo.schmitt@analog.com>, robh@kernel.org,
	devicetree@vger.kernel.org, conor+dt@kernel.org,
	linux-iio@vger.kernel.org, marcelo.schmitt1@gmail.com
Subject: Re: [PATCH v5 3/4] iio: adc: ltc2378: Enable high-speed data capture
Message-ID: <akfvJOikt3ukJJWN@debian-BULLSEYE-live-builder-AMD64>
References: <cover.1783028033.git.marcelo.schmitt@analog.com>
 <e285c16edf2e5483effad96a852a2ae110a27899.1783028033.git.marcelo.schmitt@analog.com>
 <20260702220726.718A21F000E9@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: sashiko-reviews@lists.linux.dev
List-Id: <sashiko-reviews.lists.linux.dev>
List-Subscribe: <mailto:sashiko-reviews+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:sashiko-reviews+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20260702220726.718A21F000E9@smtp.kernel.org>

On 07/02, sashiko-bot@kernel.org wrote:
> Thank you for your contribution! Sashiko AI review found 7 potential issue(s) to consider:
> - [Critical] Access to non-existent `offset_ns` field in `struct spi_offload_trigger_periodic` causes a build failure.
> - [Critical] The macro `HZ_PER_GHZ` is used but never defined anywhere in the kernel, causing a build failure.
> - [High] Mismatch between SPI offload transfer length and IIO channel storage bits for 16-bit devices causes buffer data corruption.
> - [High] Unassigned `length` pointer in `ltc2378_read_avail` API callback leaves caller variable uninitialized.
> - [High] Unpredictable phase shift between two independent PWM channels risks hardware data corruption.
> - [High] Forcing unsupported `bits_per_word` breaks single-shot reads on standard SPI controllers.
> - [Medium] `st->offload_trigger_config` is updated in-place and not rolled back on validation failure, corrupting driver state.
> --
> 
> commit 7c29c089819a4620f86fae01e267747bb7a266ff
> Author: Marcelo Schmitt <marcelo.schmitt@analog.com>
> 
> iio: adc: ltc2378: Enable high-speed data capture
> 
> Make use of SPI transfer offloading to speed up data capture, enabling data
> acquisition at faster sample rates (up to 2 MSPS).
> 
> > diff --git a/drivers/iio/adc/ltc2378.c b/drivers/iio/adc/ltc2378.c
> > index b5cf2e974daca..b25602d91bbe1 100644
> > --- a/drivers/iio/adc/ltc2378.c
> > +++ b/drivers/iio/adc/ltc2378.c
> [ ... ]
> > @@ -46,10 +58,19 @@
> >  #define LTC2378_UNIPOLAR_DIFF_CHANNEL(_real_bits)				\
> >  	LTC2378_DIFF_CHANNEL(0, _real_bits, (((_real_bits) > 16) ? 32 : 16), 0)
> >  
> > +#define LTC2378_OFFLOAD_BIPOLAR_DIFF_CHANNEL(_real_bits)			\
> > +	LTC2378_DIFF_CHANNEL(1, (_real_bits), 32, 1)
> > +
> > +#define LTC2378_OFFLOAD_UNIPOLAR_DIFF_CHANNEL(_real_bits)			\
> > +	LTC2378_DIFF_CHANNEL(0, (_real_bits), 32, 1)
> > +
> 
> [Severity: High]
> Does hardcoding the storagebits to 32 here mismatch with the SPI transfer
> length for 16-bit devices?
> 
> When ltc2378_prepare_offload_message() configures the transfer, it sets the
> length to spi_bpw_to_bytes(16), which is 2 bytes. Since the IIO subsystem
> expects 4 bytes per sample based on these channel definitions, could this
> cause buffer reads to be misaligned and return garbage data to userspace?
The available HDL only supports pushing 32-bit data elements to DMA buffers in
CPU endianness. For 16-bit precision parts, 32-bit elements (in CPU endianness)
containing the 16-bit data are pushed to DMA. For the offload use case, the IIO
buffer is configured for 32 storage bits in CPU endianness so data is correctly
aligned in user space (despite 2 out of the 4 bytes being always zeroed). I'll
add a comment with the above explanation.

> 
> [ ... ]
> > @@ -254,7 +344,136 @@ static int ltc2378_read_raw(struct iio_dev *indio_dev,
> >  			*val2 = chan->scan_type.realbits;
> >  
> >  		return IIO_VAL_FRACTIONAL_LOG2;
> > +	case IIO_CHAN_INFO_SAMP_FREQ:
> > +		*val = st->cnv_Hz;
> > +		return IIO_VAL_INT;
> > +	default:
> > +		return -EINVAL;
> > +	}
> > +}
> > +
> > +static int ltc2378_read_avail(struct iio_dev *indio_dev,
> > +			      struct iio_chan_spec const *chan,
> > +			      const int **vals, int *type, int *length, long mask)
> > +{
> > +	struct ltc2378_state *st = iio_priv(indio_dev);
> > +
> > +	switch (mask) {
> > +	case IIO_CHAN_INFO_SAMP_FREQ:
> > +		*vals = st->sample_freq_range;
> > +		*type = IIO_VAL_INT;
> > +		return IIO_AVAIL_RANGE;
> 
> [Severity: High]
> Should this callback also initialize the length pointer?
No.

> 
> Since this returns IIO_AVAIL_RANGE successfully but doesn't assign *length,
> callers like iio_read_channel_info_avail() in the core might use an
> uninitialized stack variable for the array size. Could this lead to
> out-of-bounds array reads?
> 
> > +	default:
> > +		return -EINVAL;
> > +	}
> > +}
> [ ... ]
> > +static int ltc2378_update_conversion_rate(struct ltc2378_state *st, int freq_Hz)
> > +{
> [ ... ]
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
> 
> [Severity: Critical]
> Is HZ_PER_GHZ defined anywhere in the kernel?
https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git/tree/include/linux/units.h?h=v7.2-rc1#n50

> 
> Looking through the tree and include/linux/units.h, this macro doesn't appear
> to exist. Won't this cause an unconditional build failure?
> 
> > +	min_read_offset = LTC2378_TBUSYLH_NS + st->info->tconv_ns + LTC2378_TDSDOBUSYL_NS;
> > +	offload_offset_ns = min_read_offset;
> > +	count = 100;
> > +	do {
> > +		config->periodic.offset_ns = offload_offset_ns;
> 
> [Severity: Critical]
> Does struct spi_offload_trigger_periodic actually have an offset_ns field?
https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git/tree/include/linux/spi/offload/types.h?h=v7.2-rc1#n70

> 
> According to include/linux/spi/offload/types.h, struct
> spi_offload_trigger_periodic only contains the frequency_hz field. This seems
> like it will cause a build error.
> 
> > +		ret = spi_offload_trigger_validate(st->offload_trigger, config);
> > +		if (ret)
> > +			return ret;
> 
> [Severity: Medium]
> If validation fails here, does the in-place modification of the shared config
> struct get rolled back?
> 
> Since config points directly to st->offload_trigger_config, returning early
> leaves the device state with rejected values. If the IIO buffer is later
> enabled, could the driver use these invalid config values to start the
> offload trigger?
Makes no difference. The PWM configurations are recalculated and re-validated
every time the buffer is enabled. There's very little to no benefit in rolling
back PWM configurations.

> 
> > +		offload_offset_ns += 10;
> > +	} while (count-- && config->periodic.offset_ns < min_read_offset);
> [ ... ]
> > +static int ltc2378_offload_buffer_postenable(struct iio_dev *indio_dev)
> > +{
> > +	struct ltc2378_state *st = iio_priv(indio_dev);
> > +	int ret;
> > +
> > +	ret = pwm_set_waveform_might_sleep(st->cnv_trigger, &st->cnv_wf, true);
> > +	if (ret)
> > +		return ret;
> > +
> > +	ret = spi_offload_trigger_enable(st->offload, st->offload_trigger,
> > +					 &st->offload_trigger_config);
> 
> [Severity: High]
> Does starting these two clock sources sequentially result in an unpredictable
> phase shift?
> 
> Since st->cnv_trigger and st->offload_trigger are independent and enabled one
> after the other in software, CPU execution delays might cause an uncontrolled
> phase alignment. The LTC2378 datasheet forbids SCLK toggling during the
> conversion phase. Could this random phase shift cause SPI transactions to
> overlap with the conversion window and corrupt the sampled data?
That's what the offset_ns field is for.

> 
> > +	if (ret)
> > +		goto out_pwm_disable;
> > +
> > +	return 0;
> [ ... ]
> > @@ -330,8 +653,53 @@ static int ltc2378_probe(struct spi_device *spi)
> [ ... ]
> > +		/*
> > +		 * Set single-read transfer bits_per_word so the SPI subsystem
> > +		 * rearanges data to CPU endianness, enabling us to reuse
> > +		 * offload_chan specifications for single-shot reads.
> > +		 */
> > +		st->xfer.bits_per_word = st->info->offload_chan.scan_type.realbits;
> 
> [Severity: High]
> Is it safe to force this bits_per_word on the shared transfer struct used for
> regular single-shot reads?
> 
> Most generic SPI host controllers only natively support standard word widths
> (like 8, 16, 32). If bits_per_word is set to an arbitrary resolution like 18,
> won't the SPI core's __spi_validate reject the transfer with -EINVAL and break
> sysfs single-shot reads?
Correct, offload support assumes a controller capable of supporting fine grained
number of bits_per_word.

> 
> > +	}
> >  
> >  	st->xfer.rx_buf = &st->scan.data;
> >  	st->xfer.len = spi_bpw_to_bytes(indio_dev->channels[0].scan_type.realbits);
> 
> -- 
> Sashiko AI review · https://sashiko.dev/#/patchset/cover.1783028033.git.marcelo.schmitt@analog.com?part=3
