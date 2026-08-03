Received: from mail-wm1-f46.google.com (mail-wm1-f46.google.com [209.85.128.46])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A7AD93C6600
	for <sashiko-reviews@lists.linux.dev>; Mon,  3 Aug 2026 19:42:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.46
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785786174; cv=none; b=V0SN73FCbOkHCOhqNZFwFGiUNaA3uRSbXsg6ufPw768pkDTAfcaJfiU2PyRkdLQBINmSn/PCcvhXnyVHJ6+xKm08la7CXvzYYPfuO2mSJlo4m5LVXdIaz6sn7F+E3qiSqpGCVTujAi1QwpDYZoFliKRD3bTmmXZ6RHvW91b7/XE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785786174; c=relaxed/simple;
	bh=BvCniH3Sbd0cmDdkACSU9x4ggDHaCilOtJtpFfl20KQ=;
	h=Date:From:To:Cc:Subject:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=KXyLyuRRaTG/tfEP2CCGdc7XPARjZmOg19U2+hPkBuwzLK4liDfWomJ7OnMjcYrHRiIlsonKfhS4+pbZ4PcqmcjA2UpkzHiBMiCpLVk/1w2lEXuqXk/FB0Id5s5izyouPqBj7MvgcoVFY05QmE0Pw9F6cWCLUXy/SQkklN9/IxE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=RL4StU5H; arc=none smtp.client-ip=209.85.128.46
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="RL4StU5H"
Received: by mail-wm1-f46.google.com with SMTP id 5b1f17b1804b1-4954a32cf1eso11629045e9.3
        for <sashiko-reviews@lists.linux.dev>; Mon, 03 Aug 2026 12:42:52 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1785786171; x=1786390971; darn=lists.linux.dev;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=08zz6IkbTGpUfV4/ganG7khNzW8wQ7cGp51Ff0F/wZA=;
        b=RL4StU5H8DHHXK4LgOp02SGSwZRnKGNayAcLMALbE21ZW/EFbZF/ahMCi9S27Frh4A
         vkTD9OjVVaR8+5Al7cQMF4Io+Sd75qSevntv+WMHdxuSKOTH3p6PsKJbgT6IQXqDLmbq
         15EOoKDeJynFzmJzVUmgnZvQG0aPMNG8MiLwjlQT7s5ltujMS8zqjGuIeLd8hQTz+bFR
         s1NAemorL3SgD36kPf8eeJvXDDHZgRZK/BaA90ihBV1PiLUe0hyFck2BpJaiL3OzO8RJ
         llll9+BvBGJaMM3qqO8Qvugg/Bhl2lmeNHsGCDqVRsDCYG8JyqhEG97+OXis3c0tZ3iV
         2awg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1785786171; x=1786390971;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=08zz6IkbTGpUfV4/ganG7khNzW8wQ7cGp51Ff0F/wZA=;
        b=YzunBpQXICMl1yIuMvYz/mJtT1N8YrduVHqxDePD0ml5vU6yNtiiXmqepDhAHbpFS0
         K1y0bFoUN0vjmTptziP8nw0w23wNu4uEmZXyXWhACxOTQVipANIpFQyiEP4Vm/XL/j9W
         UvmPWdKWw4DAFc3Z1ZI+LoMAGkC9TuHUAzJG3rEqdSlT1jGw4vCwhDM79qGkcZrgymou
         h7oYKYVJBiRXF7D6BWzmF1+JYR0BzmXsuJFrPIYjuAow+wbPFonjxiYfkncOJ6vhUpUO
         DirUS8+KvlTAUJem2c0440Mde34G1hvgG040xLRoa503YxTznIqwELQXS01w8P/6wpCu
         I5hA==
X-Gm-Message-State: AOJu0Yx2I8OT0nVvNf0+2EceVmjqxRn3xfm+mHrluo+vSOkUaMKHg0ie
	spguI8dOF7Z6ba0Ni5Zf3y0eA4AZP1mo0MBwws7AEj5SNWbb6/X5E6fq
X-Gm-Gg: AR+sD12MWe1HDdJyZZCcNd3kEZzuqq3JT4zkd5jVqaik66/BPZSoWFYqr9e+kzcAqOX
	/RTvnNpXfPUCMpd6QoTxQqWajMvIZO4ZpkdraBFXBFZ3c6cWG9Akyd0OAdNbcfQthjBp8Y+NzqY
	h8zFnS9qD+M0DzDALldDFsPqC7RxcAxDZkbEC5Hcm17xHdJceo5Ulq8ZXdgqE7DpY4K1VXC5iw4
	jx77NqgNuBMpRtHu4GPQ/fJ5MDAoFA8zcmjAy4w9N13gDLURQ54bjMbvlpeR4WQqjLSxDKV4jNr
	jLb/qkRmK7XRkz6U3kiTlO7BIC3C6Otmi+B6Z3KSGB+kmQOTuJlsU8Jahr6N0HNTS4S+zoHWqAW
	L0wkczAyuxoXcDzH93AA9bED/P6ysu6Wh5UvjkPlL03AhQ4K5MHc1Sqg3pv31fyNwtH1u4InS8r
	94D+yMrewQ8XsFjTJB7lTu5u+oxL18FWXB1rLiT55RDVOPNL+iDV+vLV0vYG4n+uaogL1pIo1sv
	hfXcklOrPhjfAui81qilrBRLK6BWmy5BdPDIoOFHeAhTbDF/FqZWwzNjcyPKsQfKWK12vxbYVrp
	1otlxWaZipU+hPeNCXZHYq7XqJK73QSkSW38M7K1nrbqTuLU6krlBa8NXxj9ajWpFEgcmkNbGo1
	F2mLUqN/W1VY4UKlXsB3wHb+Zo91iL+DApg==
X-Received: by 2002:a05:600c:34c6:b0:493:a966:d5b5 with SMTP id 5b1f17b1804b1-4980c66b50emr287430705e9.2.1785786170789;
        Mon, 03 Aug 2026 12:42:50 -0700 (PDT)
Received: from systembl0wer ([2a02:8308:4092:11f0::f9f])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-49807b5b4a2sm305796885e9.1.2026.08.03.12.42.50
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 03 Aug 2026 12:42:50 -0700 (PDT)
Date: Mon, 3 Aug 2026 21:42:48 +0200
From: Joshua Crofts <joshua.crofts1@gmail.com>
To: sashiko-bot@kernel.org
Cc: sashiko-reviews@lists.linux.dev, robh@kernel.org, conor+dt@kernel.org,
 devicetree@vger.kernel.org, jic23@kernel.org, dlechner@baylibre.com,
 andy@kernel.org, nuno.sa@analog.com, linux-iio@vger.kernel.org
Subject: Re: [PATCH v3 2/2] iio: dac: mcp47a1: add support for new device
Message-ID: <20260803214248.69c3c96b@systembl0wer>
In-Reply-To: <20260803174441.294171F000E9@smtp.kernel.org>
References: <20260803-mcp47a1-add-support-v3-0-540e71b4fd2e@gmail.com>
	<20260803-mcp47a1-add-support-v3-2-540e71b4fd2e@gmail.com>
	<20260803174441.294171F000E9@smtp.kernel.org>
X-Mailer: Claws Mail 4.4.0 (GTK 3.24.52; x86_64-redhat-linux-gnu)
Precedence: bulk
X-Mailing-List: sashiko-reviews@lists.linux.dev
List-Id: <sashiko-reviews.lists.linux.dev>
List-Subscribe: <mailto:sashiko-reviews+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:sashiko-reviews+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit

On Mon, 03 Aug 2026 17:44:40 +0000
sashiko-bot@kernel.org wrote:

> Thank you for your contribution! Sashiko AI review found 1 potential issue(s) to consider:
> - [Medium] Incorrect SMBus commands send extra bytes and corrupt the DAC hardware state.
> --
> 
> --- Patch [2]: [PATCH v3 2/2] iio: dac: mcp47a1: add support for new device ---
> commit f73263d5ea24798a693c0c4cfa738627794988ba
> Author: Joshua Crofts <joshua.crofts1@gmail.com>
> 
> iio: dac: mcp47a1: add support for new device
> 
> This commit introduces a new driver for the Microchip MCP47A1 6-bit volatile
> DAC. It supports writing and reading the raw values and exposing the scale
> using I2C.
> 
> > diff --git a/drivers/iio/dac/mcp47a1.c b/drivers/iio/dac/mcp47a1.c
> > new file mode 100644
> > index 0000000000000..0bf994aa0e4f5
> > --- /dev/null
> > +++ b/drivers/iio/dac/mcp47a1.c  
> 
> [ ... ]
> 
> > +static int mcp47a1_write(struct iio_dev *indio_dev,
> > +			 struct iio_chan_spec const *chan,
> > +			 int val, int val2, long mask)
> > +{
> > +	struct mcp47a1_data *data = iio_priv(indio_dev);
> > +
> > +	switch (mask) {
> > +	case IIO_CHAN_INFO_RAW:
> > +		if (!in_range(val, 0, MCP47A1_MAX_STEPS))
> > +			return -EINVAL;
> > +
> > +		return i2c_smbus_write_byte_data(data->client, MCP47A1_CMD_CODE,
> > +						 val);  
> 
> [Severity: Medium]
> Could this corrupt the DAC hardware state by sending an extra byte?
> 
> If the MCP47A1 expects a single byte without a command code, using
> i2c_smbus_write_byte_data() will send a 2-byte payload, writing 0x00 to the
> DAC before the actual value. This could potentially cause an output glitch.
> 
> > +	default:
> > +		return -EINVAL;
> > +	}
> > +}
> > +
> > +static int mcp47a1_read(struct iio_dev *indio_dev,
> > +			struct iio_chan_spec const *chan,
> > +			int *val, int *val2, long mask)
> > +{
> > +	struct mcp47a1_data *data = iio_priv(indio_dev);
> > +	int ret;
> > +
> > +	switch (mask) {
> > +	case IIO_CHAN_INFO_RAW:
> > +		ret = i2c_smbus_read_byte_data(data->client, MCP47A1_CMD_CODE);  
> 
> [Severity: Medium]
> Does this destructively reset the DAC on every read?
> 
> If the device does not expect a command code and interprets it as a data byte,
> calling i2c_smbus_read_byte_data() will perform a write of 0x00 before reading,
> destructively resetting the DAC output to 0.

No, this is a false positive. The MCP47A1 is SMBus compatible, it will interpret
the command as an instruction, not a data byte.

-- 
Kind regards,
Joshua Crofts
