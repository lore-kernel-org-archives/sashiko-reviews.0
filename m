Received: from mail-ed1-f48.google.com (mail-ed1-f48.google.com [209.85.208.48])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3FAF71EB5C2
	for <sashiko-reviews@lists.linux.dev>; Mon, 18 May 2026 14:26:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.48
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779114390; cv=none; b=TuZKp5H8Dz3QMWvixlSXYMFSHJfcBNM1gf3ZsCSmwiOaYoZJsm4O0vwa13qukiD2tWttgghB0l7xJ2U2R40elL8+F/u3M8cIJDbBeooL6j0Dpd9U2r9V+ImS7VsvVR5fw+fFwWY/dCW6VTmY97GV1SwzVVs4yUCdbLYweuolaUE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779114390; c=relaxed/simple;
	bh=jj8C42vP8d402qhEj5BRNKUYabfpNU3fCaowD0OVNto=;
	h=From:Date:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=iq33j4ByYbynpQfL2MMI7RaSGuo+J1QledaKM05csViopn/QZ8Mmd2YotTOUDGfyZSpeiCJ6o8fwE8vV/ePmWTz1NXfH9ebPRJB1W8l8QoTJ0SeDXKR98WNlGGpcFhVSKHFiex5zKjGbIcMKnPMiJ1dgTdNUAEyIYYx1Bf8vhQ4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=VNMpJ2Ej; arc=none smtp.client-ip=209.85.208.48
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="VNMpJ2Ej"
Received: by mail-ed1-f48.google.com with SMTP id 4fb4d7f45d1cf-6746d0b2b4aso4069981a12.3
        for <sashiko-reviews@lists.linux.dev>; Mon, 18 May 2026 07:26:25 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1779114382; x=1779719182; darn=lists.linux.dev;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:date:from:from:to
         :cc:subject:date:message-id:reply-to;
        bh=IkhDiryJOpnQp+hMnQvA4acbZ3NW2ct6Ye+UJkfo1fw=;
        b=VNMpJ2EjO+VjPwh74i7OFU5Yv5zkCwoYQaS94wsiTaZaI/dWPGvuRGYuuJto1QB/3F
         VExcXnCSkQiixwyrvxMSHdsFiimhKVjf5676wLyzDLlRfVDhLL/xMRYQvcsgjBmGplTP
         3M7EfcRpD38uicXKj4GnqCGWKu63l1i5NFjvPvFtMmAGq5iJgqyRpTG9kenLTQV8t65X
         pAjmSWuOhsPjwFTtXxPNd7gOzGB/cy6CGiiuQlzAgIwiWESCSVR/tVHThXCltqDE+y/i
         yLdid98FHD+fQJczfsRSplROpoYRF6LZxd2q0kqqa/n1jEbyZ9FptL30U2rHJ0H8j/jV
         R0jg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1779114382; x=1779719182;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=IkhDiryJOpnQp+hMnQvA4acbZ3NW2ct6Ye+UJkfo1fw=;
        b=q7Dj693n6DJc6pwuYR8lBQbuIslRlbhNCzBpOtDrv+jsob5B47x7xMhtsn5RHh4Aql
         PjCX5iTKKmiPgD4sDQGpOf+KmeIQmW6tQQvjFkdThhGXWzBC8vI4o6vt+uhSz5qNFnmw
         TTlQmfIf7w+cLP8WdjZ2DhLsxKTadonDMSuJdXE68P1fePIFA+y2hwL2vryy5iQrrs2u
         mA8C/IdQQVXQMPOL4H73YM+dWIdSvMaQpZUkCMDauBwYa3R2kVerZsYQm3BT+odTxXfT
         2/6qQ3PPpU+p0u4dHPJ5EbFvVv5awbhHhDq8snzkGrQGebpCJ0EhIu0HmtvMFXSjmW+7
         kLYA==
X-Gm-Message-State: AOJu0YyYmK+m5qVAR9J+5RTbg2Unulx1hNnKQ8R4uwkN3On2qMn40XyS
	HwQGUG7bvuv0scHISduLrRtotpuBHbqgptG87DygoZqwyzqm0MpKFo/UJndRuTUk
X-Gm-Gg: Acq92OFT9hro0USz2OkYx/fsxL+dU1TL8DiK+5WZ3U9+m1rQ4hz9Rbj3eILW/sAhHYU
	KBX9lZRsgE6CPRn/uQuC1JJGgNdSz3Q6oDzLhDOUItuZ3Y/ovYuNFM9es34fDWIpbd0n16gjOcV
	Rpl3WmhhzqmYTr0BrxzaJc6gNw3ofOj7pc+P1fYWo10ZtOaz14wO/9W7K+BswwjuZ+jyz2foctG
	AinXlx+7H4deaFCsBIVA+w6k/NUEO2s/22qivI4N5ZaJ6QeIEw6A5/W9l/EMChH0yS/OwKf4MVB
	tQmVw+QyMKg+7AvFTYH3vD3W829S2xo1Z3n091G/UJ2FT6heumNnoF2uGtr4JzJn/fXhj6T+cPD
	/DLSPhyCiqfy5DKMsSHhVSLBoVveJrm08mRVLvII/9cbtUNvmcvDWmYAUteC2X+EML+SGmbarEN
	2Bo1RfZ+mx/2SGIn/Wa1Ad9O1Qs5OJ1Hrwqaq1BMOBDTgGPcA1r+PDtTcL/jLFBuuKKm9pO4mFl
	KjPWcXaBVHQZyA2fIId3izhiCEZKwg8283sTXCUd0O3PbJzkYqGQ3+7XurKVGpmbqWFevw=
X-Received: by 2002:a17:907:9705:b0:bd5:9a2:6c7d with SMTP id a640c23a62f3a-bd5177d6672mr847883566b.4.1779114382418;
        Mon, 18 May 2026 07:26:22 -0700 (PDT)
Received: from RDEALENC-L01.ad.analog.com (24.206.116.103.netskope-rdns.com. [24.206.116.103])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-684744d13aesm2764498a12.18.2026.05.18.07.26.19
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 18 May 2026 07:26:21 -0700 (PDT)
From: Rodrigo Alencar <455.rodrigo.alencar@gmail.com>
X-Google-Original-From: Rodrigo Alencar <rdealenc@rdealenc-l01.ad.analog.com>
Date: Mon, 18 May 2026 15:26:15 +0100
To: sashiko-reviews@lists.linux.dev, 
	Rodrigo Alencar via B4 Relay <devnull+rodrigo.alencar.analog.com@kernel.org>
Cc: devicetree@vger.kernel.org, conor+dt@kernel.org, robh@kernel.org
Subject: Re: [PATCH v5 03/13] iio: core: add hierarchical channel
 relationships
Message-ID: <vlasqyhpdcxtdw7isyapmpxaqw6wwpni3el2jzckfh22i6bgiy@7ikszah6elga>
References: <20260517-ad9910-iio-driver-v5-3-31599c88314a@analog.com>
 <20260517185618.4810EC2BCB0@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: sashiko-reviews@lists.linux.dev
List-Id: <sashiko-reviews.lists.linux.dev>
List-Subscribe: <mailto:sashiko-reviews+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:sashiko-reviews+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20260517185618.4810EC2BCB0@smtp.kernel.org>

On 26/05/17 06:56PM, sashiko-bot@kernel.org wrote:
> Thank you for your contribution! Sashiko AI review found 1 potential issue(s) to consider:
> - [Medium] Exposing the hierarchical relationship via channel labels creates an ambiguous UAPI for userspace.
> --
> 
> commit 64c6f961f1d7645c58f732e4bd4c11200b999e93
> Author: Rodrigo Alencar <rodrigo.alencar@analog.com>
> 
> iio: core: add hierarchical channel relationships
> 
> This commit introduces a parent-child relationship between IIO channels.
> It adds a parent pointer to the iio_chan_spec struct and exposes this
> relationship to userspace through a new "parent" sysfs attribute that
> returns the parent channel's label.
> 
> > diff --git a/drivers/iio/industrialio-core.c b/drivers/iio/industrialio-core.c
> > index 5c8404efd0a56..348ac7a597385 100644
> > --- a/drivers/iio/industrialio-core.c
> > +++ b/drivers/iio/industrialio-core.c
> 
> [ ... ]
> 
> > @@ -1263,6 +1271,31 @@ static int iio_device_add_channel_label(struct iio_dev *indio_dev,
> >  	return 1;
> >  }
> >  
> > +static int iio_device_add_channel_parent(struct iio_dev *indio_dev,
> > +					 struct iio_chan_spec const *chan)
> > +{
> > +	struct iio_dev_opaque *iio_dev_opaque = to_iio_dev_opaque(indio_dev);
> > +	int ret;
> > +
> > +	if (!chan->parent || (!indio_dev->info->read_label &&
> > +			      !chan->parent->extend_name))
> > +		return 0;
> 
> Is relying on channel labels robust enough for programmatic parent resolution?
> 
> IIO channel labels are optional, human-readable descriptors and are not
> guaranteed by the core to be unique. If multiple channels within a device
> share the same label, how can userspace definitively resolve which specific
> channel is the parent?
> 
> Also, if a driver establishes a hierarchy where chan->parent is set, but the
> parent channel lacks a label, this attribute is silently omitted, hiding the
> relationship entirely.
> 
> Would it be more reliable to expose a definitive, unique identifier (such as
> the parent channel's sysfs prefix or index) rather than relying on an optional
> descriptive string?

A bit impressive that sashiko can comment on that architecture level.

Those are all good points. I suppose I went for this because otherwise it would
require refactoring core code to get the needed parts from __iio_device_attr_init()
that gets you the channel name without the attribute part.

Maybe we should have a function that outputs a channel name into a buffer based on
__iio_device_attr_init() behavior, and that could be reused.

> > +
> > +	ret = __iio_add_chan_devattr("parent",
> > +				     chan,
> > +				     &iio_read_channel_parent,
> > +				     NULL,
> > +				     0,
> > +				     IIO_SEPARATE,
> > +				     &indio_dev->dev,
> > +				     NULL,
> > +				     &iio_dev_opaque->channel_attr_list);
> > +	if (ret < 0)
> > +		return ret;
> > +
> > +	return 1;
> > +}
> 
> -- 
> Sashiko AI review · https://sashiko.dev/#/patchset/20260517-ad9910-iio-driver-v5-0-31599c88314a@analog.com?part=3

-- 
Kind regards,

Rodrigo Alencar
