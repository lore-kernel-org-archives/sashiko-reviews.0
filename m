Received: from mail-wm1-f45.google.com (mail-wm1-f45.google.com [209.85.128.45])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 367BF282F14
	for <sashiko-reviews@lists.linux.dev>; Tue, 28 Jul 2026 13:16:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.45
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785244566; cv=none; b=OqoFLUQ19CDOnwu0IuVZJkN2kfi6dhgJMYJjvDjgJk7vmhvU6nGukI8hTLF0Zp8mevXZCCN/txuzbSiMdV2txoFtiqaVX/1lz2IMotVbLvd0z+ah4tBKlyL9U40eWsZCeeTGu1C3jybF+G2FeMl4Ir5DCtyAnGDXbFA7n9NfY2c=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785244566; c=relaxed/simple;
	bh=cLH93zo8+5LFvseU1ydD9VGz5QwjgSRbVRGQwkX1r9U=;
	h=Date:From:To:Cc:Subject:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=eIGAO9y6rbyhpAyNi+YoE11P6PxO13UoiX8ScYprpPeT32Le9e376AF7ahuTMCEk+GEMcu31YA9gZYTAcnHyNZBdDJMy2PwT4Rz5FUQb9vmuvOZUW9s3aN3e6Jo0tVGSnMErlkusHbUesMnbOo2q+aoIHEtpFFWHUdI8i9fBM5U=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=ll7JLAUg; arc=none smtp.client-ip=209.85.128.45
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="ll7JLAUg"
Received: by mail-wm1-f45.google.com with SMTP id 5b1f17b1804b1-49548e01d02so19413035e9.0
        for <sashiko-reviews@lists.linux.dev>; Tue, 28 Jul 2026 06:16:04 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1785244562; x=1785849362; darn=lists.linux.dev;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=NJ8Sz4jZn4MiZdWgUS+toUmyc9X4AmjEUEaGs5iVrDk=;
        b=ll7JLAUgRCLzxRqCVf9G2OzK4rbA2a/ztJreTP0oUfq5Gw/owpkGhwAALxo8VC2x0d
         uDt+eTYdLEbNanzzVCR2MkYdb+P9Jlh3o5G4BEMOAmcENUqYP8BEOq4qWGu4UZc54wR/
         bafk9VAGAKjC2jZhIhNBcuBFa+MRyT/9rAzUmomCz2p8erORCHqD4bvwA4Wl19V2Y029
         A0F+PXIeBH4kVKdAD+dgajZe500O0AVsJyTApct9pAbojH5pcDJ9njR1VmBnJx6qvtqc
         kFFE6g0gT0KkJElXfRP3uW/BrHidJaW1YY7WQolZ/8mFQNr6WDFee210CPb/DOd+gD3h
         6tjA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1785244562; x=1785849362;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=NJ8Sz4jZn4MiZdWgUS+toUmyc9X4AmjEUEaGs5iVrDk=;
        b=eQ3ZuhdrWscpCsQwD6hSIhcCGjvgwK9A4lMm/utHWtyiGRmxdxmCtZyTPDDHbrigcm
         Daji/zgNNDtX+FnYsiyWeTbkgk4hc2d6982WV3xqrvtArlLbvyrm1DiB9q/3N0rZxcZz
         AM6ZcIZYJwkwpinMkfXZFmKBR0V7khuyltivgaJj3nWz6Kb+pw37wzjY5zqF48FbuthK
         T3thGDODGziHNuE+BuN8OFWVimC8uDDDpxR3sjMdL92c3Em+LBiK5GUOUQ9prGYM+uMC
         5CPdSSO3xRIY0vf2lQ9T56VC4yXH/fsZYN/yhQk7f6DUVnVg/Vfir2LbtDXVIaR34PZP
         8K1A==
X-Gm-Message-State: AOJu0YxDokLV7WzXTe/Tx+O48HfhQCpeKQbibaVvVB22SSZxHuAj+aY5
	chkSOkpc9Bjexx8RTMA6C6AlwEgAMCYg7gxp7quir2/2wK1mHPodT2pC
X-Gm-Gg: AR+sD10SLJJyN7J3xJjmitoOO36CC1IEiQv/YC0B1w7cCQeW6A0cqEp1gHKIidZtjb2
	OWHo42fY39IojdsRVZqxn6nlvHCJT4X6yqdr3KBl2ysxNLykOIkoQ7xrZeXzSJkwTV7FLGSS4hY
	csAUtzCnfFkg9Ms6C5W7DOuDM6TuDSZFCgFLkgwALI5ZOl3jxk1315r/0Aua8JPVnSAlD0tQB3B
	r8jSqt4zPOTWsDSc3KprycNQj9ktAkhxtxw+u/dGehyRyAt4U7IZCdEO6MHpHSS3C/u+WwRtt3I
	29p8ZM4SBo2VLkJDJ6t5Cd+Ilruj5DA5yaFb0B7RQNz+6VRZVXRsWg0nFvTK9+uXYmLkpVZ2ge3
	i8ldvrIQzqvqnsPZ3wwx07BiRU8Sdm39jaIHwZ5DIzx20Exyf5mw5eZKnS1+CIqe5HnOwlKSifJ
	V0DmQtCAnOMZTsm1SWtJFC09nXdHNK/a4SorjJxSmv4Ya7KclFAs5nKf0/pDPxxYXhxScSb/O1k
	pHYLB52YVuAAxXmHFaHzQlPBrya7+TzkXM37zlQXgg0nH2eSlbX6PUs9C0jPbNst8q0WnrvL+ZQ
	Z26CIOdGdK/1YtSxBcRYDwM+rXkQzd1BWNeeMmoJArJ6MeiHiUDGeBFRvQwSjFTe37jZLyzw+rE
	t2/sWr21qHQKI
X-Received: by 2002:a05:600c:1d04:b0:495:4e12:6ae5 with SMTP id 5b1f17b1804b1-496c6571d21mr26130575e9.26.1785244562007;
        Tue, 28 Jul 2026 06:16:02 -0700 (PDT)
Received: from localhost (90-182-112-124.rcp.o2.cz. [90.182.112.124])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-496c44af19bsm74777785e9.3.2026.07.28.06.16.01
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 28 Jul 2026 06:16:01 -0700 (PDT)
Date: Tue, 28 Jul 2026 15:15:59 +0200
From: Joshua Crofts <joshua.crofts1@gmail.com>
To: sashiko-bot@kernel.org
Cc: sashiko-reviews@lists.linux.dev, devicetree@vger.kernel.org,
 conor+dt@kernel.org, robh@kernel.org, linux-iio@vger.kernel.org,
 jic23@kernel.org, andy@kernel.org, nuno.sa@analog.com,
 dlechner@baylibre.com
Subject: Re: [PATCH v2 2/2] iio: dac: mcp47a1: add support for new device
Message-ID: <20260728151559.000067ef@gmail.com>
In-Reply-To: <20260727184226.DFC1E1F000E9@smtp.kernel.org>
References: <20260727-mcp47a1-add-support-v2-0-d4591a2ce69e@gmail.com>
	<20260727-mcp47a1-add-support-v2-2-d4591a2ce69e@gmail.com>
	<20260727184226.DFC1E1F000E9@smtp.kernel.org>
X-Mailer: Claws Mail 4.4.0 (GTK 3.24.51; x86_64-w64-mingw32)
Precedence: bulk
X-Mailing-List: sashiko-reviews@lists.linux.dev
List-Id: <sashiko-reviews.lists.linux.dev>
List-Subscribe: <mailto:sashiko-reviews+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:sashiko-reviews+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit

On Mon, 27 Jul 2026 18:42:26 +0000
sashiko-bot@kernel.org wrote:

> Thank you for your contribution! Sashiko AI review found 1 potential issue(s) to consider:
> - [Medium] Potential off-by-one in DAC scale calculation denominator.
> --

Responding to Sashiko's comment.

> --- Patch [2]: [PATCH v2 2/2] iio: dac: mcp47a1: add support for new device ---
> commit 38bec2fbb020c3f749c52a26e5cc3e78e72eeaf5
> Author: Joshua Crofts <joshua.crofts1@gmail.com>
> 
> iio: dac: mcp47a1: add support for new device
> 
> The Microchip MCP47A1 is a 6-bit volatile Digital-to-Analog converter
> which communicates via I2C.
> 
> > diff --git a/drivers/iio/dac/mcp47a1.c b/drivers/iio/dac/mcp47a1.c
> > new file mode 100644
> > index 0000000000000..140e93ff2ba01
> > --- /dev/null
> > +++ b/drivers/iio/dac/mcp47a1.c  
> [ ... ]
> > +static int mcp47a1_read(struct iio_dev *indio_dev,
> > +			struct iio_chan_spec const *chan,
> > +			int *val, int *val2, long mask)
> > +{
> > +	struct mcp47a1_data *data = iio_priv(indio_dev);
> > +	int ret;
> > +
> > +	switch (mask) {  
> [ ... ]
> > +	case IIO_CHAN_INFO_SCALE:
> > +		*val = data->vref_mV;
> > +		*val2 = MCP47A1_MAX_STEP;  
> 
> [Severity: Medium]
> Does this code use the correct denominator for the scale calculation?
> 
> Since this is a 6-bit DAC, shouldn't the scale denominator be 64 (2^6)
> instead of the maximum step value of 63? Using MCP47A1_MAX_STEP (63) here
> introduces an off-by-one error that could cause userspace to calculate
> output voltages with a ~1.5% LSB scaling error when reading the sysfs
> attribute.

Yes, the max amount of steps is 64, which should be passed here. I'll
add a separate macro for this in v3.

-- 
Kind regards,
Joshua Crofts
