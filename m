Received: from mail-wm1-f46.google.com (mail-wm1-f46.google.com [209.85.128.46])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 88D4140F74F
	for <sashiko-reviews@lists.linux.dev>; Mon,  3 Aug 2026 19:35:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.46
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785785725; cv=none; b=lb8JgyS0KVZ7vd/UzKMb/DynYoNhGyih3SGLNAKjWEonrIuAORfv9jMvPfoHA4bLZxbC5fOauHNqSv6WrTSuVmIilnHjzixXk0t/BLPN4T9HuyGlSrc2P8mlW34+qzRcNgJowzS75JtjfX3N2HcbjcOmHbJN2Tg25puGyKZ6PlE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785785725; c=relaxed/simple;
	bh=VjAnPKkOhrNzBBj74/3IQ5jyXGO7ZA3AmQIZeJkp3YE=;
	h=Date:From:To:Cc:Subject:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=rdO+osQbPk59GEf1wo6SMjIkLVP1cagu8UjUbzpSVGWiv3eQwJMZ5k5jgvKqhGq7U9gO5B6YCGFbT0QT5CLlHHcQ1mDeT4vTUEWNOp+aJgYRyLL8NWo6GZmoIZxMaLFICtqf0JU/RD8i5KUbOK4wwWUDI6azUiZmIHBtNLRAhyw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=bZoJVZEJ; arc=none smtp.client-ip=209.85.128.46
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="bZoJVZEJ"
Received: by mail-wm1-f46.google.com with SMTP id 5b1f17b1804b1-49558ce01afso19472785e9.1
        for <sashiko-reviews@lists.linux.dev>; Mon, 03 Aug 2026 12:35:23 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1785785722; x=1786390522; darn=lists.linux.dev;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=rIsx6zbYaQEdLVAaackOaf7e88l+t3puadax1/1AhNI=;
        b=bZoJVZEJpllPA7xVMs1BlvGgagk559IfraA1U1ePTuQsbXNYw5yhFskBGFrEABS9yC
         fJd9JTaYW9bS3yrwKmINb/M4vDY90srMbBOdBnA3q8Pq6okYRq7odZQNhwhc2BgPNnjX
         vNmpU5AfO5AVQpgZNw+6tCQHtMuE5v7B3oqGVN26Y8TN1ZGTaiYLFi4CM0KTMQMQOsdK
         560TTGqCL5r/uPPFVF2c/7EbBiXN62KfcekB7AyG3WhSS6yfLDDb9JWugPCEkcop4WdN
         /kuEQDudUwgjmjogSuBvU9nWMrb/WrnG6lukhk/WEhZFWM91O3k4fT7UL/gjD+MNoySq
         BsFA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1785785722; x=1786390522;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=rIsx6zbYaQEdLVAaackOaf7e88l+t3puadax1/1AhNI=;
        b=Pc+anr1HtMNGHG9fGzl9x2piBfJhtZXHaGC61Hrx39+O7YxF68MgCcxGMss50v613g
         +5GhX6nwIGgqDumS93j/t2lLXPlPF6EWKrNRAseRXQobDgjJG257pw8n7dmjW5LIFArR
         EhTxmwAT4AwhxNe/o748Q3mtnWSo/vDWYJQrlOwwEntCpO2MBdV7kIc1BDwr3ZuYBLYY
         PnGrufzpSzG2jdqLdBD3DOEz8iF0BCFzOIBQnDWP/Ten6TAErFWZtgiq6uHWC4f5t9m1
         DecILc68X5TGuMlBamYRWnJ6M9A9n2mt4VWvDYP79/ykX+rA9a2YHKNhmvK5aIXXr4vp
         8y5g==
X-Gm-Message-State: AOJu0YxVtT/6AjuG/XGR+wn52YlJ3ptlMEycN6xU6eJzjUnSkcaFQWMW
	qdGTx5CyU3giSZVttJJ8rDWGmefUh7QRiVaG/jFAW/tAbx8K5Aj9XmaG
X-Gm-Gg: AR+sD10NJSb5u4MoC3DuMT+Xq2KtW7N+RhyKeH3qKDTkWXV/EbO1MrWzSYIBV5KH9xJ
	yzmXFU7bJ/WG7KVVVI2OrE1rfyzx+wWCPRP49cNH3kcJ4VQXQvurkVLK7Hcbg/eP4JeUdQMHa/r
	3QkdZWosZCzOe7donkF+Dy/hDayzjgQpgLbOr2OkTKDcKmI49jn+x/2otW2Mu4nCm7LDg99x8JL
	K2EESNpm/2yBQfahaY5MvAeuyOd41X+HOb8piZvj4tIXDup2VxHne3yk/hGAvSH8m55d7VVgJ38
	BqO03BoZ+mYWgEGVpnUTCI37CUSH4cINJQInkiYH4VPROn0Nta2KDhv56g9m8xvnqP2ioeppDhp
	zvQo3ePxeTiXFCvOo7+2yZmynpfz1qyjXde+rG6GRroqJvozNBJg1ujLCwYAVrjIa67d7CiwjND
	eLa2PIhv4Y1LxU9rAXljhzCJTS0BtKKrGYt71rzQdTvF9oKm9zByg15LqTYsJ+IlWQDWaEnY/Op
	q+aB4IwuHMxErF1m32UiO+lajiCLiYa0+3NKRxAOT4HknO+NlDUGnro1p97EQc6wdJri1BzBKeR
	zmBVAsFZ+kVgKpK3FDQ44ZBFMFiJ5Pny2ajN7LaaNghND7Tqvb4AkgkqhCSqNinFX3mPpUht6xa
	Eh0mythTCLF8ZpFoSwTzGoKdCLtviO+Fw
X-Received: by 2002:a05:600c:3b99:b0:498:519:e660 with SMTP id 5b1f17b1804b1-4980c66d8b0mr265523695e9.4.1785785721474;
        Mon, 03 Aug 2026 12:35:21 -0700 (PDT)
Received: from systembl0wer ([2a02:8308:4092:11f0::f9f])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-47fd456220esm36742356f8f.18.2026.08.03.12.35.20
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 03 Aug 2026 12:35:21 -0700 (PDT)
Date: Mon, 3 Aug 2026 21:35:19 +0200
From: Joshua Crofts <joshua.crofts1@gmail.com>
To: sashiko-bot@kernel.org
Cc: sashiko-reviews@lists.linux.dev, devicetree@vger.kernel.org,
 robh@kernel.org, conor+dt@kernel.org, linux-iio@vger.kernel.org,
 jic23@kernel.org, dlechner@baylibre.com, nuno.sa@analog.com,
 andy@kernel.org
Subject: Re: [PATCH v3 1/2] dt-bindings: iio: dac: add support for mcp47a1
Message-ID: <20260803213519.7d3d241e@systembl0wer>
In-Reply-To: <20260803180717.4BE651F000E9@smtp.kernel.org>
References: <20260803-mcp47a1-add-support-v3-0-540e71b4fd2e@gmail.com>
	<20260803-mcp47a1-add-support-v3-1-540e71b4fd2e@gmail.com>
	<20260803180717.4BE651F000E9@smtp.kernel.org>
X-Mailer: Claws Mail 4.4.0 (GTK 3.24.52; x86_64-redhat-linux-gnu)
Precedence: bulk
X-Mailing-List: sashiko-reviews@lists.linux.dev
List-Id: <sashiko-reviews.lists.linux.dev>
List-Subscribe: <mailto:sashiko-reviews+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:sashiko-reviews+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit

On Mon, 03 Aug 2026 18:07:16 +0000
sashiko-bot@kernel.org wrote:

> Thank you for your contribution! Sashiko AI review found 2 potential issue(s) to consider:
> - [Medium] The I2C addresses specified in the schema and example appear to be 8-bit write addresses instead of the 7-bit addresses required by the DT specification.
> - [Low] The `reg` property schema applies an integer `enum` directly to a matrix array element, which will cause `dt_binding_check` validation to always fail.
> --
> 
> --- Patch [1]: [PATCH v3 1/2] dt-bindings: iio: dac: add support for mcp47a1 ---
> commit 441e840b5a2a3f037c3520c49013a55b7dc4c1bd
> Author: Joshua Crofts <joshua.crofts1@gmail.com>
> 
> dt-bindings: iio: dac: add support for mcp47a1
> 
> The Microchip MCP47A1 is a 6-bit volatile Digital-to-Analog converter
> which communicates via I2C.
> 
> > diff --git a/Documentation/devicetree/bindings/iio/dac/microchip,mcp47a1.yaml b/Documentation/devicetree/bindings/iio/dac/microchip,mcp47a1.yaml
> > new file mode 100644
> > index 0000000000000..b181fe73dce84
> > --- /dev/null
> > +++ b/Documentation/devicetree/bindings/iio/dac/microchip,mcp47a1.yaml  
> [ ... ]
> > +properties:
> > +  compatible:
> > +    const: microchip,mcp47a1
> > +
> > +  reg:
> > +    items:
> > +      - enum: [0x2e, 0x3e]  
> 
> [Severity: Low]
> Will this cause dt_binding_check validation to fail?

No, this is a perfectly valid dt-schema which passes dt_binding_check.

> 
> Since dt-schema parses reg values into a uint32-matrix (an array of arrays),
> the items array applied to it defines a tuple schema for the outer array's
> elements. This means the inner array [0x2e] will be matched against the
> integer enum [0x2e, 0x3e], which will mathematically fail since an array
> is not an integer.
> 
> [Severity: Medium]
> Are these 8-bit write addresses instead of the 7-bit addresses required by
> the Device Tree specification?
> 
> If these are indeed 8-bit addresses (as indicated by the 0 LSB and typical
> Microchip datasheet conventions), they must be shifted right by 1. That would
> make the correct 7-bit DT addresses 0x17 and 0x1f.

No clue what Sashiko is on about since these are indeed 7-bit addresses which
do work when tested on the actual hardware.

-- 
Kind regards,
Joshua Crofts
