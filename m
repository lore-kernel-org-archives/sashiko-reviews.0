Received: from mail-yw1-f171.google.com (mail-yw1-f171.google.com [209.85.128.171])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7E6442EC571
	for <sashiko-reviews@lists.linux.dev>; Fri, 17 Jul 2026 16:37:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.171
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784306229; cv=none; b=Z0A2lzZbuY2AKMW8zX0txxfesBNS3jijtTcWisXYb2jla6ZVpGQh2gp/Om7nYAOC71a2Uyb7Ry5f+LfaiqhB0qiLpDpKD/wva7oIBTksrYvFW+v28K7CXfj1Rca2C9EUDg/EgiAMgwMCEKmUqEFkr8CPxxEyjaRA1/oUBOB/AW8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784306229; c=relaxed/simple;
	bh=tGwzjYdByfoFaIh4ZwoemqEAXz0OnUd03AbzuPL+9IA=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=A11N1CAskrtaSP1O6qWy7Fb77sbGeFxwq1mBdJ2YTVUqe5D95lMlZWd90F7mVU9osDW8nJbfiStrBuBONMKQNmwX69IB9PssmdzQT0JzV4yFQ5e8fSpLD/boi8iSzY0xbBqDZPsIf4jXe4a/AFdUhI98DBNE5Duc50gwH7BNIn8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=dlvnZBfr; arc=none smtp.client-ip=209.85.128.171
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="dlvnZBfr"
Received: by mail-yw1-f171.google.com with SMTP id 00721157ae682-81e6f0b4610so84723397b3.2
        for <sashiko-reviews@lists.linux.dev>; Fri, 17 Jul 2026 09:37:08 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1784306227; x=1784911027; darn=lists.linux.dev;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :content-type:mime-version:references:message-id:subject:cc:to:from
         :date:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=UnLMXcEn62d3oMMgJrrwZa8KdOiLTui4IgFDQmHHq2Q=;
        b=dlvnZBfr/gOlPSgPVKRQBeO2ajFkVTGIZbyP9s9vns1U9QY3NItsEMuaccfbuCFwKZ
         pQqElTy5E8j+Y6l7a3nHhnhaJ5qIur3U/hq/FqCDOIZKr3275mn7zwiK4LXfRDCu/84m
         kqWT09lnpYLk33wnWNZ3HWcTfnTGEyFv57EyaY2i6bBD2wOf7iOe6THeZgARSaQ8RCZJ
         RZPP5xH/5PSfsjUEMU+2kJ5QECFusM4hMxAXN/jx0wsuH0iNnSrbQw7faopZ6OLYI/uy
         cHaFwvV6mgJt8hNsrMluRsJ3J8yZEwGqVBU8SOk68N1RaK4Cdh0Y4mplg8U+ipgrbjXx
         vAsg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1784306227; x=1784911027;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :content-type:mime-version:references:message-id:subject:cc:to:from
         :date:x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=UnLMXcEn62d3oMMgJrrwZa8KdOiLTui4IgFDQmHHq2Q=;
        b=otsHjtBZGmQmGg59lmDhFVJGyAfYthAhvGOSpe1VZ5Z3r/ZXJjcaZcPXh0lWShe9zR
         AjNJvPu56hfSlDvzFpzPOYR9WEBode/EoS3IeMNUXwqb6uvqI/jTPQSss7GPKjkshM4r
         L35t234mQFqslXIgq11W7m0EOut388tm+2Bmx62dCf6lUjV0gTdL8nddwp4xiEZVoqno
         vePlasK3psI5F8e3q51wcmaSHwTYg6ApCgIkR+GVfG5uNcg63nKK7ylJb4NiOWCV4Bqx
         LqRIMmqxYiEWQjv+tSskyLWmDuRBEsp7Rf5igpQdMnjxEgjcqXYRYy2zOiVqFi/L62Cf
         2xxA==
X-Gm-Message-State: AOJu0YxuW2MKooG/yzXKLeKlWaXOiUh041sUmWMUv+9h6P5izYuSAN4+
	HtzC2Wv5tv0M3fTq+yS5lnI2dOkWMOctz4qImEtNWRvIbdDHDGPQe19WT7qj9Q==
X-Gm-Gg: AfdE7clKyBYJZtTGnNHg+Gtg5MoV/PPYVM7MHe7EbwB6QPomiKcYe7RulxLUmmCL6og
	mPgeqig1P3dXZ43+++ZNp/Gfl8I8a78gwAZ1NvEaYanwq0kKcRJpV4q+3DP+bVVWcK7GU34vH2f
	HknRUsJTclwm6kth9pQA6wfbkweerulkhJC2CmDIXjkZ7EBDDtkHRj0jyJaMeWaVy7KZx8/w0eM
	sFviNFl/z6sEnzRZkX0HIDtHvpW/6mV56TdZpdgkBctngXLWo2xpOggPvmDJtdJpyiKVGkiAcx/
	SkzpkpJjd+IgGVa9J+3B5aDJ7sriEzhwZRHh9yF9oD1DPmMvFkF/C+ikIg7WnvMWDtQ6L2Oq397
	vXejQuc1KL1sEgrtcjeiNS2uYEgzXrzO2h60gTY6jdm2gabf1VcbUccDCxY9G/Nja52zO1TsAqc
	b3LDpBzT4/tNk=
X-Received: by 2002:a05:690c:6888:b0:81e:dc5a:a4f2 with SMTP id 00721157ae682-81ef26a5f43mr12401847b3.41.1784306227436;
        Fri, 17 Jul 2026 09:37:07 -0700 (PDT)
Received: from localhost ([2804:30c:1f09:b400:47f8:7933:2105:dd41])
        by smtp.gmail.com with ESMTPSA id 00721157ae682-81ef42c4ef3sm14017747b3.40.2026.07.17.09.37.06
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 17 Jul 2026 09:37:06 -0700 (PDT)
Date: Fri, 17 Jul 2026 13:38:07 -0300
From: Marcelo Schmitt <marcelo.schmitt1@gmail.com>
To: sashiko-reviews@lists.linux.dev
Cc: Marcelo Schmitt <marcelo.schmitt@analog.com>, conor+dt@kernel.org,
	devicetree@vger.kernel.org, robh@kernel.org,
	linux-iio@vger.kernel.org, marcelo.schmitt1@gmail.com
Subject: Re: [PATCH v7 2/4] iio: adc: ltc2378: Add support for LTC2378-20 and
 similar ADCs
Message-ID: <alpab2gBs4nPDU5g@debian-BULLSEYE-live-builder-AMD64>
References: <cover.1784235595.git.marcelo.schmitt@analog.com>
 <5108c89986ae8723139419058db1b2f2e74daff6.1784235595.git.marcelo.schmitt@analog.com>
 <20260716212838.95B3F1F000E9@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: sashiko-reviews@lists.linux.dev
List-Id: <sashiko-reviews.lists.linux.dev>
List-Subscribe: <mailto:sashiko-reviews+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:sashiko-reviews+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20260716212838.95B3F1F000E9@smtp.kernel.org>

On 07/16, sashiko-bot@kernel.org wrote:
> Thank you for your contribution! Sashiko AI review found 1 potential issue(s) to consider:
> - [Medium] The `LTC2378_DIFF_CHANNEL` macro defines an IIO channel that is intended to be differential but lacks the `.differential = 1`, `.indexed = 1`, `.channel = 0`, and `.channel2 = 1` attributes.
> --
> 
> --- Patch [2]: [PATCH v7 2/4] iio: adc: ltc2378: Add support for LTC2378-20 and similar ADCs ---
> commit 5710d5f25b45906977e2522567c1964b1d3219f8
> Author: Marcelo Schmitt <marcelo.schmitt@analog.com>
> 
> iio: adc: ltc2378: Add support for LTC2378-20 and similar ADCs
> 
> This commit adds a new driver for the Analog Devices LTC2378-20 and
> similar analog-to-digital converters.
> 
> > diff --git a/drivers/iio/adc/ltc2378.c b/drivers/iio/adc/ltc2378.c
> > new file mode 100644
> > index 0000000000000..5600c820c7f45
> > --- /dev/null
> > +++ b/drivers/iio/adc/ltc2378.c
> > @@ -0,0 +1,416 @@
> [ ... ]
> > +#define LTC2378_DIFF_CHANNEL(_sign, _real_bits, _storage_bits)			\
> > +{										\
> > +	.type = IIO_VOLTAGE,							\
> > +	.info_mask_separate = BIT(IIO_CHAN_INFO_RAW) |				\
> > +			      BIT(IIO_CHAN_INFO_SCALE),				\
> > +	.scan_index = 0,							\
> 
> [Severity: Medium]
> Does this macro need to set .differential = 1, .indexed = 1, .channel = 0,
> and .channel2 = 1? The name suggests these are differential channels, but
> without these attributes, the IIO ABI will expose them as single-ended
> (e.g., in_voltage_raw instead of in_voltage0-voltage1_raw).

For parts with multiple inputs and configurable differential channels (e.g.
AD4130-8, MCP3561/2/4R, NAFE13388 [1, 2, 3]), the voltageY-voltageZ ABI helps
clarifying what physical inputs make up a channel. For differential only parts,
the ABI seems to be flexible by only requiring a 'consistent labeling' (either
voltageY or voltageY-voltageZ IIUC). Will set the channel with the differential
ABI if maintainers believe that's the best way to have it. Might slightly tweak
the channel macros to keep .differential = 0 for pseudo-differential chips
(e.g.LTC2369-18).

[1]: https://www.analog.com/media/en/technical-documentation/data-sheets/ad4130-8.pdf
[2]: https://ww1.microchip.com/downloads/aemDocuments/documents/APID/ProductDocuments/DataSheets/MCP3561_2_4R-Data-Sheet-DS200006391C.pdf
[3]: https://www.nxp.com/docs/en/data-sheet/NAFE13388.pdf

> 
> > +	.scan_type = {								\
> > +		.format = _sign ? IIO_SCAN_FORMAT_SIGNED_INT :			\
> > +				  IIO_SCAN_FORMAT_UNSIGNED_INT,			\
> > +		.realbits = _real_bits,						\
> > +		.storagebits = _storage_bits,					\
> > +		.shift = _storage_bits - _real_bits,				\
> > +		.endianness = IIO_BE,						\
> > +	},									\
> > +}
> > +
> > +#define LTC2378_BIPOLAR_DIFF_CHANNEL(_real_bits)				\
> > +	LTC2378_DIFF_CHANNEL(1, _real_bits, (((_real_bits) > 16) ? 32 : 16))
> > +
> > +#define LTC2378_UNIPOLAR_DIFF_CHANNEL(_real_bits)				\
> > +	LTC2378_DIFF_CHANNEL(0, _real_bits, (((_real_bits) > 16) ? 32 : 16))
> > +
> [ ... ]
> 
> -- 
> Sashiko AI review · https://sashiko.dev/#/patchset/cover.1784235595.git.marcelo.schmitt@analog.com?part=2
