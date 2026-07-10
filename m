Received: from mail-ot1-f54.google.com (mail-ot1-f54.google.com [209.85.210.54])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 74704381B04
	for <sashiko-reviews@lists.linux.dev>; Fri, 10 Jul 2026 23:12:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.54
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783725132; cv=none; b=cFL3rAzMZmaRP23BqvQkpZr7Kt8nwmcnsCXYuLjnUPSSraltO4WIN/gFGbi4Rj964FboazuxzeosqRg/24llOxjUmoozANyC9E+1IKis9piKYeOmUDRktOGz81y3GX23aNfjIkOSNCyJ6lIhmrVi73Acp0J69szAAH0z+ryDud4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783725132; c=relaxed/simple;
	bh=WolUqNqLG8wcbpxo1euYF2zvMyMZNYCNCWIwYPG4YAc=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=r4wnyrVZghDUsQ8Gc3UYNff3M94eW4v53F/9Gm/FXF4NlfGUszWHyl6cro3Gswz0ihJdh4jZQWDOUP5NMzryaOuqWJmxP2A7ukOk8k7YfR6FYYbO6cixC58/OMvkgeqyY8Ii0IxDFKb1Yh/tmCFy4Oux0TGW4oqcvlzyZ6wmjBY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com; spf=pass smtp.mailfrom=baylibre.com; dkim=pass (2048-bit key) header.d=baylibre.com header.i=@baylibre.com header.b=N8Cql/pj; arc=none smtp.client-ip=209.85.210.54
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=baylibre.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=baylibre.com header.i=@baylibre.com header.b="N8Cql/pj"
Received: by mail-ot1-f54.google.com with SMTP id 46e09a7af769-7e9f69ee6f4so1243158a34.2
        for <sashiko-reviews@lists.linux.dev>; Fri, 10 Jul 2026 16:12:10 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre.com; s=google; t=1783725129; x=1784329929; darn=lists.linux.dev;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=orAXM50ok0dlT4J0LLGqek12i5V341QLmN68gXTBWUg=;
        b=N8Cql/pjU8H/wsHPp2qUwu93xYQ4EEMRFP7n6ODysqjEAEEvSKDmhuFnmwsr1TD8i9
         bkXnKk9Rxpn69Cr4bix1Eskasdln8K2hC+Lz2c9aALVKylsdCKBmlta48PgmsrOywxQL
         R1fcXukH+CZd8/dn0MXJ9J2OfFj6NS2YZASBBQrR4PoDatuBmId2c50cwEROpniHwyqC
         AdOvGzbVkXOoKJxAleVF38KTyUum/nJ2D/5clFEZh4v6KescfchEQseaSmAZGGxJaJdy
         XHaseZXd8xL+DYx8UVLdPMv47oauR4wEgdJ+Zw4YvTZKs54iJd34Tp68ZJY5cvgmmqi1
         bXfg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1783725129; x=1784329929;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=orAXM50ok0dlT4J0LLGqek12i5V341QLmN68gXTBWUg=;
        b=rSZ8dLSDzCqwfr4xpLTL+ZsSH/hFhEKVlVDyNoid092Rq4xTXw+97yy89Lp8WdNxC5
         bO23pQgA8fgAAJGSI/u716qAB/kaK4dlX2mc67PA1W/btjLzzST9TLJMAvzAmBeJwgio
         fhhdga8OjubyLWHGBrTljOZr3NzvTsAvVs2lZ2fUs/nHxtN/TADtFq6DY//qLM7u9CIk
         oiVM26psESOQfUGNDYxW//LyFhirI5SnbMbZL4ZNqtd+SREwtutlMzZKMltj4MM8hPvG
         PY2qK0MRItcC5IOiXuPQNBGzdPvyr1eT6kD6btNZw5+kfhpsnmXH6N9rr55CMQCRP2+1
         JUsw==
X-Forwarded-Encrypted: i=1; AFNElJ+x9cEWcW2AnRcyS4tJ2khfixRNfPB/aGD+adLkOH+na+9eTukDKUgB3jFXEW3iHZfYZAKj9B1V1kMKN8nR7vc=@lists.linux.dev
X-Gm-Message-State: AOJu0YyJLASQSLbOpqeWDAE2DJ17Ql8/C3TfjayzuxZcrvxEs7h/+rau
	IN7Taid3iHWc5PLs2LV8rPXFctjYHqZ1Ql8ZZU/nue0kXhV4XS4AtwzCytLZm7U7Vng=
X-Gm-Gg: AfdE7ck8hZMHT6T8nGKxBBXaBRkBOJ17gwISp4fN5Md+CdvO/toIMDgRQHhxshtM85b
	SpZztoPQ9/vVE/mL4MtDVTF5kKbBZlsgvU2wSP2VEZARIgil39DlniOtYoW1UkCUhUT47FvZeGN
	PRBGCY2n21R01xAvlJpQHv0l1p9FGJYTVRZsIASbFSeTrB+Z9njKJJtsFuP8619rqzBbwz4MvCQ
	whFTYuAp4ChhWd1x7NH824+HmDmOEKN0F4DRR8XY96p+OLFvR3PkJ9fmA3dds8D3xyab3jX4iaL
	95oTMFvDlV9vDz547hVQqcbkKent2XiejYsJybojE4feGPOXtuBo6vSlv72XyLCXF5kG9NR0yVp
	C5gff5KRiEyVHh4iS2KoUcpUK0kKi7XgT7ykWxyDnuh965an829XU4BGmo2gq7aEFVX+pkQxzlY
	4aFh0b4nJbmSu5rH8N/SU++olhuu6tfq51sCF6tQhIud6qXEskz98En144Bv3ZjicjAqrzebM=
X-Received: by 2002:a05:6820:178c:b0:6a1:41ae:1bd3 with SMTP id 006d021491bc7-6a39a6b62d2mr734605eaf.42.1783725129440;
        Fri, 10 Jul 2026 16:12:09 -0700 (PDT)
Received: from ?IPV6:2600:8803:e7e4:500:1b03:95c:fbd4:4d00? ([2600:8803:e7e4:500:1b03:95c:fbd4:4d00])
        by smtp.gmail.com with ESMTPSA id 586e51a60fabf-4519124d07dsm6322280fac.2.2026.07.10.16.12.07
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 10 Jul 2026 16:12:08 -0700 (PDT)
Message-ID: <f1c5be4b-6bbd-41d9-a152-ee480988f44d@baylibre.com>
Date: Fri, 10 Jul 2026 18:12:07 -0500
Precedence: bulk
X-Mailing-List: sashiko-reviews@lists.linux.dev
List-Id: <sashiko-reviews.lists.linux.dev>
List-Subscribe: <mailto:sashiko-reviews+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:sashiko-reviews+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3 5/8] dt-bindings: iio: adc: add ti,ads122c14
To: Jonathan Cameron <jic23@kernel.org>, =?UTF-8?Q?Nuno_S=C3=A1?=
 <nuno.sa@analog.com>, Andy Shevchenko <andy@kernel.org>,
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Conor Dooley <conor+dt@kernel.org>, sashiko-reviews@lists.linux.dev
Cc: Chris Hall <c-hall@ti.com>, Patrick Edwards <pedwards@ti.com>,
 Kurt Borja <kuurtb@gmail.com>, Nguyen Minh Tien <zizuzacker@gmail.com>,
 linux-iio@vger.kernel.org, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org
References: <20260710-iio-adc-ti-ads122c14-v3-0-746d52cbf1d0@baylibre.com>
 <20260710-iio-adc-ti-ads122c14-v3-5-746d52cbf1d0@baylibre.com>
Content-Language: en-US
From: David Lechner <dlechner@baylibre.com>
In-Reply-To: <20260710-iio-adc-ti-ads122c14-v3-5-746d52cbf1d0@baylibre.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

Replying to https://sashiko.dev/#/patchset/20260710-iio-adc-ti-ads122c14-v3-0-746d52cbf1d0@baylibre.com?part=5

On 7/10/26 5:50 PM, David Lechner (TI) wrote:
> Add new bindings for ti,ads122c14 and similar devices.
> 
> This is an ADC that is primarily intended for use with temperature
> sensors. There are a few unusual properties because of this. In
> particular, the reference voltage source and current output requirements
> can be different for each measurement, so these are included in the
> channel bindings.
> 
> The REFP/REFN reference voltage is usually just connected to a resistor
> that is being driven by the ADC's current outputs, so there is special
> property for this case rather than requiring a regulator to be defined
> to represent that.
> 

> ti,vref-source is reused from ti,tlv320adcx140.yaml (otherwise might
> have preferred an enum of strings).

This paragraph is leftover from v1 and should be deleted. (If someone
called it out in v2, I missed it.)


> +
> +  interrupts:
> +    minItems: 1
> +    items:
> +      - description: FAULT interrupt (GPIO2 pin)
> +      - description: DRDY interrupt (GPIO3 pin)
> +
> +  interrupt-names:
> +    minItems: 1
> +    maxItems: 2
> +    items:
> +      enum: [fault, drdy]

I know the descriptions are a inconsistent with allowing names to
be in any order. I don't really know a better way to write that
though that allows both

	interrupts = <0>;
	interrupt-names = "fault";

and 

	interrupts = <0>;
	interrupt-names = "drdy";

They are just descriptions, so does it really matter?

> +
> +  gpio-controller: true
> +  '#gpio-cells':
> +    const: 2
> +

No, gpio-conroller should not be required. It is rare to use the GPIOs on
this chip and the pins are shared with other functions.

