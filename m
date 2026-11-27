Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.128.45
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795769256;
	b=1Gz/t15WLdIRfJrE90ke1c37IwduM6lkzNyz18zpfG7POH9odDWMqbk2VAWy8aKxQs88
	 72Aqw889CRRPTPEoZbhDhSGckxkET+OreSsNjy3lpK57tX+2CuV9Z01ZsBWj0I5ksTTRJ
	 E6fWpHnRTZenSR2hm6bJFIX2tgMcii6HxohSHuQbLZBTLvSM9cfcQCLMQp+KF7AZ/Sqmg
	 4gKoSkgL5YDnsP00FAeURgX964006DBpEip7h6APh3m8i78Xfio/bbNGbgHjl7wID0cLk
	 pFIvQzse4NdvlLobQx0YLrKimOppTpEh0V7ajRPIQJoiqDqqKy22lFaI+DcCwMb7cbA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795769256;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To;
	bh=hFWAeWghUobS1SNh2HR/z8yfcl8Q4/5YjOR9+nLiaM8=;
	b=hLEFrocIPD64IOZqEcGyaXjL5AuD+2CblU4rHGGfFOTfX7EPt/aHQ4YVGRBWu6u1MVve
	 Ci1bNIGnM0ZgtKjCIv72kS/jiESr1hkdPOPPj7RZCQs9aT/I6nhOjR5cORHSlPLV1Btls
	 VnyYxjD3MoM0J/Zlmi2olFIk02WFM6LnayHNPubkYlG8DZg2+Z/dU3KQAjV3mJ793oahQ
	 wwLJdAXD2//vi1g5MDJ4ha5qOOIY22A3uBroR6VShUL/t2B/tUySsKHhRwQ3Y66xVjBJN
	 50YE4SUdoJDemrY/cC0vtvSE5hKsm/chAAyiPiJnzwozw56coXWaS0JxgJ5LV+K/iJw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=baylibre.com;
	spf=pass smtp.mailfrom=baylibre.com;
	dkim=pass header.d=baylibre.com header.i=@baylibre.com header.a=rsa-sha256 header.s=google header.b=icK5eoNv;
	arc=none smtp.remote-ip=209.85.128.45
Received: from mail-wm1-f45.google.com (mail-wm1-f45.google.com [209.85.128.45])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5D8CF606A31C
	for <sashiko-reviews@lists.linux.dev>; Fri, 27 Nov 2026 08:47:36 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 5D8CF606A31C
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=baylibre.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=baylibre.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=baylibre.com header.i=@baylibre.com header.a=rsa-sha256 header.s=google header.b=icK5eoNv
Received: by mail-wm1-f45.google.com with SMTP id 5b1f17b1804b1-4bb70074ab2so82956445e9.0
        for <sashiko-reviews@lists.linux.dev>; Fri, 27 Nov 2026 00:47:36 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre.com; s=google; t=1795769255; x=1796374055; darn=lists.linux.dev;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=hFWAeWghUobS1SNh2HR/z8yfcl8Q4/5YjOR9+nLiaM8=;
        b=icK5eoNvIW93ZiAYSC/tfRamK+jw1gY0h6s5zno1ZC7ds3M8reGOZ3uozN5/r8y4l9
         Sht6o7Erah1vzmcVHfe/QjGS4r+k14pIQo0LQ0y2lq5y4dDzHif9qq+fwxOENNBv/IYG
         pVtVzvSZAjU5Ri7Tn2hVE3zDtdZGynqgPIZEJ4UtgnLEHCJPBhc2D5AMPxPINVpBKJJk
         hcY0fnBOxJMWO9FLuX62fVsXlmR7k55iF99e/jvMdYRlHeg9lU1STXaJKElCqtTW2sp2
         4OgOb9LRu7QZwzALmby9ZUOZSYysSgEBwcOI4/GYpCZXS+TEH9WFMGzgSD/aL+dN5TWf
         zVOQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795769255; x=1796374055;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=hFWAeWghUobS1SNh2HR/z8yfcl8Q4/5YjOR9+nLiaM8=;
        b=qEukTqoeI7cjjCzJV4C4i6SvWJHL3I60lBjeSb+4NcyUy/vzmqtIYMCILLloCrm/Rz
         71Tzzh/ILbM6U9madBgN31QdxhUIaxZtVoGEWleY2H+uyN5AbHDQ6yQV5BrwlMXkJCIb
         FfscOHoxHJROjILAU3A0flCK9elnypLpsa139/zijG5excTTfd6DuWa7WxMautVT7sm1
         GjWr7vda6dwetIKXvSFBh4/2rMwgjMSD90uyryszfOYVzD6YTbMMBcM6Iv0/yVr6p4Et
         FKDg5VHaxbtRGyZ/XQIHIO/ITYfApHfeXxG5JJKI+EQBMIlX3Uh2TGVNAT1ZvGkPq3SC
         12Sw==
X-Forwarded-Encrypted: i=1; AL+hErERvtWN6Ni4xAe27Leotkvgi4edRQQm+AxWrobVHdSTshgSEliqz/CC1IbSbD6jATUJ0fqqmr7v5yvPsqOsTVU=@lists.linux.dev
X-Gm-Message-State: APuU4Z+/R4cv9U716yB3+IjvAoLqVYqtXSUdj8yKBLO9LxlEsv9doBZy
	eKRXhMH7Hw7WGjnEEskKLfTfCoMGIUSFr41qvqydL1a/z6rD0iKvMhNDrfk1mNG32Vw=
X-Gm-Gg: AZFdTZfBQVcN8FR3K3hw+fU8vDMI2w7WxNfPVeDYs6htHQj8+09mhg0TPhUIzW+z54X
	wra0TdT7IUVAOD/eFCjn0PdDHBsskSaNnj1cDwwUk6OHst1OFhKXrUcjNgrf/OaNz0AWtAeeMXO
	u6dUy/8YwRGSD6IVzGuLEgnXkJMrYK0w7JIkApv8WuFd/uDZdSepBHLjCRYJRWgxLfDLvVOckZN
	KYKxmbj6d70cjHgBiW/h1VcEajF+9OFqOCnv8i/vjanlG4yrhMoWVriQubx+BoLyfFxP1tF79zK
	Myu4B+KhFDZtKadtZZQ3LpdtL4OIjhiDF+xkAYMNpK09FMnw9P2W/A6sczXFQNV77obGAoct1nc
	KbxN554jF1sB7e5DfCuy7o2srwkwYEk5Qcfy6/Lp9+jG+38ZGzGtuMaaXCPbUris02UCLfK5417
	0lycLHSVMXT7tBFiK8nOOkiCUTXnFpicwzdLB3HmnaZgWAxvlm1Fpmssa1dYOCudePlRimVgRto
	xJoIhsZyVi4q5aYBqd7VM7quWYPBpz+A+c4KaUH8sZy8J/NQh4c9D5ujLyJvS75w59F2QYkug/6
	Zi4a7p5ufIdWSIBOAu56taZxt6f3zDf3zpfszkOQLaWjKxkUGXlK3o6oXsCjimoleOVhUrbUBcZ
	80UtxSg78nRC5mKVv
X-Received: by 2002:a05:600c:4e0d:b0:4a5:e6fd:65e5 with SMTP id 5b1f17b1804b1-4bb88922a67mr460696165e9.31.1795769254732;
        Fri, 27 Nov 2026 00:47:34 -0800 (PST)
Received: from localhost (p200300f65f19a90496f529fbcf0b312d.dip0.t-ipconnect.de. [2003:f6:5f19:a904:96f5:29fb:cf0b:312d])
        by smtp.gmail.com with UTF8SMTPSA id 5b1f17b1804b1-4bb884a3a3dsm662489995e9.10.2026.11.27.00.47.33
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 27 Nov 2026 00:47:33 -0800 (PST)
Date: Fri, 27 Nov 2026 09:47:32 +0100
From: Uwe =?utf-8?Q?Kleine-K=C3=B6nig?= <u.kleine-koenig@baylibre.com>
To: Romain TISSERAND <romain.tisserand@gmail.com>
Cc: Jonathan Cameron <jic23@kernel.org>, 
	David Lechner <dlechner@baylibre.com>, Nuno =?utf-8?B?U8Oh?= <nuno.sa@analog.com>, 
	Andy Shevchenko <andy@kernel.org>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, linux-iio@vger.kernel.org, 
	devicetree@vger.kernel.org, linux-sunxi@lists.linux.dev, linux-kernel@vger.kernel.org, 
	sashiko-reviews@lists.linux.dev
Subject: Re: [PATCH 2/4] iio: adc: Add the Miyoo A30 analog stick MCU
Message-ID: <awlCneo6rrSJPgky@monoceros>
References: <20261127012612.1589039-1-romain.tisserand@gmail.com>
 <20261127012612.1589039-3-romain.tisserand@gmail.com>
X-Mailing-List: sashiko-reviews@lists.linux.dev
List-Id: <sashiko-reviews.lists.linux.dev>
List-Post: <mailto:sashiko-reviews@lists.linux.dev>
List-Help: <mailto:sashiko-reviews+help@lists.linux.dev>
List-Subscribe: <mailto:sashiko-reviews+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:sashiko-reviews+unsubscribe@lists.linux.dev>
List-Owner: <mailto:sashiko-reviews+owner@lists.linux.dev>
Precedence: list
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="kmxikfi6vr3vqamf"
Content-Disposition: inline
In-Reply-To: <20261127012612.1589039-3-romain.tisserand@gmail.com>


--kmxikfi6vr3vqamf
Content-Type: text/plain; protected-headers=v1; charset=us-ascii
Content-Disposition: inline
Subject: Re: [PATCH 2/4] iio: adc: Add the Miyoo A30 analog stick MCU
MIME-Version: 1.0

Hello Romain,

On Fri, Nov 27, 2026 at 02:26:10AM +0100, Romain TISSERAND wrote:
> +#include <linux/mod_devicetable.h>
> [...]
> +#include <linux/serdev.h>

Please rely on <linux/serdev.h> to provide struct of_device_id and drop
the include for <linux/mod_devicetable.h>. The latter pulls in several
more header files that are not needed and that introduce build
dependencies that are not needed.

Same for patch #4 with <linux/i2c.h> providing i2c_device_id and
of_device_id.

There is no need to Cc: me for new revisions of this patch set.

Best regards
Uwe

--kmxikfi6vr3vqamf
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEP4GsaTp6HlmJrf7Tj4D7WH0S/k4FAmsJQ6EACgkQj4D7WH0S
/k7MsQgAmXkeM4wMAFcot67XUVVbBIBHe14nNZchUfh2WmvpAi0XpKPNzsTIHhjj
/GUImj+kXS7eSvVQxGljXF5pczIDQsuen39afEPHvvhSyg6oxGFTEXp7SfEeuHAD
vg+2SwwGvurRKj5+owpBWNRDeCDTZnwZratfLSZdfT9kL4xjk49xBptg1K/Ev1GK
oz7iX7B2LJSQr71EV4/vWigA10VXxR6nsgBwhKbQmBLv3jBGoiU6UQdZ/O/BewLM
kvwT7M6MH34lt3X1gC97PXjO4XwqYOdg4tQG9eDWqJ4kh4TUCIKB03AzOEGJ8n82
VMq7sXMm64yM6YZAUq6tCbzxKjFNag==
=yo0y
-----END PGP SIGNATURE-----

--kmxikfi6vr3vqamf--
