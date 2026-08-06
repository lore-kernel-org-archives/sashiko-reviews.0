Received: from mail-wm1-f42.google.com (mail-wm1-f42.google.com [209.85.128.42])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0C2FF311967
	for <sashiko-reviews@lists.linux.dev>; Thu,  6 Aug 2026 18:34:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.42
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1786041257; cv=none; b=SE88yrvcOUxYoeG5MzPMSK5lDGgmz48vfWs7ZYD0Q6sIoWxfQI2obw1fdtALjpIeHe1d5W3hegWyC53VrLAU3kFN2jVoATZII8ky0SOTvaDz3M8U4hFeEM4eO+QqXBCvR0dbpDJw1YFRvKOdAq8Z1MY0sorikkfu20lA1FcEDTg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1786041257; c=relaxed/simple;
	bh=G8P+y1KOAQ0sMjU5M458bgZf/2vH+0bbDZyvKEz7PMM=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=lNaOyUhPYdmgeTKFAssoU2c/7zx506MQxZIC2ssYfHS9r9dZBoyq0Z3keCGdT5bNMdTp+RYJqoms05Mc7mECLxhFXTHA5UpDN5rPQvVej8Kb/cEbBP6jpFjD7m5YbgRb5Kk3MdbOc17Jec68vKR6wLeWG9JzU+cRqCJHNawnz7w=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=N8BLptB8; arc=none smtp.client-ip=209.85.128.42
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="N8BLptB8"
Received: by mail-wm1-f42.google.com with SMTP id 5b1f17b1804b1-4954aff6088so25643095e9.3
        for <sashiko-reviews@lists.linux.dev>; Thu, 06 Aug 2026 11:34:15 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1786041254; x=1786646054; darn=lists.linux.dev;
        h=content-type:mime-version:references:in-reply-to:message-id:date
         :subject:cc:to:from:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=guNARlXxkuof9kUROgwrVcSK0CxwVUDL/WVDz9p8+W8=;
        b=N8BLptB8CAlWZ/ljWnxFT1JuNfnC3nJEN7e8+NQwuYLrJKDUKX85Uq4hLm18rUrd35
         tpzsBDngcY7BR4owTNyVBK/0mbkXKxZfjRNhOIPxLZDn8K7jGYq2ZR3Lvf1k9AvEXhcL
         bnBo+0O935xn2rf2GU2o39Y1K3GGWr4zJ5WmdyDI4Z3Z57tnXHQfr0UIQ1LT/HiPGVKk
         XvVj0euz0hgGixp/77HsRyRK3IzE6zOwxSwBHJD3RYEQZQEwGUW4LiRSb1+9xd4AjSLa
         zKEfmUeKvh18LsAj9F+pqA5HSBBU0EpvaJHHjt3TixJs/9Ag8qSMUbv0OaVl4F/17wL0
         Luxg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1786041254; x=1786646054;
        h=content-type:mime-version:references:in-reply-to:message-id:date
         :subject:cc:to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=guNARlXxkuof9kUROgwrVcSK0CxwVUDL/WVDz9p8+W8=;
        b=OCyugcDTT/ClokZ6TqK5XG5KQRm0V6/1CjfBCIy4dDQrDB0aDY+6tfUAyH9pztlix9
         wbC5hev0bBIW0d7Y3eMkJenpeZMukjzQR1aDmfpLtfmfebEXcbw62J2wh2nTIXFaIegk
         bvmUHaiUaxIr6FA7CW1r/jCgzDf+Ulsg5BsYINHZXoN4LfT/yF3Nk2rd4qx4wXKWTWOv
         0BVBeSr96iYcg2fOLvKAPChrBny48HFe6RPqbF00LQX58KhnwVrsr+s+kZHXxIc1nPoP
         N4N10t24swDmZy2dXfpkA2PSiw/t6YiNJO9Ql21XnttTpcuoj3oVaMqXnSVqOO1K6RsD
         3L3A==
X-Gm-Message-State: AOJu0YxFgR3ZAmKMitR6PeNMOIF6EkOGFRMS1CBjUVR4rAKfassI0m3u
	D9firB0lLPnS+raz1UmZNFWobO45lCjJjHoj98eJ7j6zWAo7z5rEqnhGTZnuvhI8HtNaaQ==
X-Gm-Gg: AR+sD11Ha8l5gfjf+LuDAMpQTZnpqgmB/7pa/wpkpkB4YcjmOGVe9sUumprDNd/Hc54
	hse6mlnsp+j19Eyg8ePwu3bvydG0OEYn9aQVSbCBNNYagxs0BZ1E4UcdA2qQ2auMVR+Oucn9hPu
	RHvNjVCzXMIIjcQUP33QKudHNYuQOxo2WpgQrltfsRUqkhrQ/9Ax8QEb/GByYnzH56qD/TF9MEb
	LECylC13HJaOJjskvfkSj4oS7GRI9G+aUppR5xY/uTxwPabtUwfFHpcDAMTKJpMVeiuTltMmPMB
	pA77BZ8s8WIwGYuk0slwC3rcoxJAQ7IB9Lk40RNivbzr8mUv/lmSgFhqVpK/0WM0XCDhsvqcGm9
	YaYjni5JWotbfAs+/3phBmsfEzJDs4T47KgcI+2pB+iR+9kjPojGABH3CIR1u6fhWCJbSP1bI/G
	cFwMJI1L0pe+/tjBgTvB2a75wcvqHbOr0K2k0DTJB8xExh3D9J4lr1oRdAvZGqkLoUdragEnTlS
	0s=
X-Received: by 2002:a05:600c:8b17:b0:498:14d3:562f with SMTP id 5b1f17b1804b1-4994e7cb3efmr202318785e9.15.1786041254074;
        Thu, 06 Aug 2026 11:34:14 -0700 (PDT)
Received: from silicon.doe.home ([197.250.226.68])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4995c7a3d1dsm14165e9.3.2026.08.06.11.34.09
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 06 Aug 2026 11:34:13 -0700 (PDT)
From: Stefan =?UTF-8?B?RMO2c2luZ2Vy?= <stefandoesinger@gmail.com>
To: sashiko-reviews@lists.linux.dev, Lee Jones <lee@kernel.org>
Cc: vkoul@kernel.org, devicetree@vger.kernel.org, mfd@lists.linux.dev,
 olteanv@gmail.com, conor+dt@kernel.org, neil.armstrong@linaro.org,
 linux-phy@lists.infradead.org, robh@kernel.org
Subject:
 Re: [PATCH v8 04/12] mfd: zx297520v3: Add a clock and reset MFD driver
Date: Thu, 06 Aug 2026 21:33:54 +0300
Message-ID: <MiZ40QjqRtKW-pfFo_ZCYQ@gmail.com>
In-Reply-To: <20260806143103.GN2869284@google.com>
References:
 <20260727-zx29clk-v8-0-7a107b00f1dd@gmail.com>
 <20260727184155.2F0A61F000E9@smtp.kernel.org>
 <20260806143103.GN2869284@google.com>
Precedence: bulk
X-Mailing-List: sashiko-reviews@lists.linux.dev
List-Id: <sashiko-reviews.lists.linux.dev>
List-Subscribe: <mailto:sashiko-reviews+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:sashiko-reviews+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: multipart/signed; boundary="nextPartbZ2Luvy9Smq4ikTWC0Dxgg";
 micalg="pgp-sha256"; protocol="application/pgp-signature"

--nextPartbZ2Luvy9Smq4ikTWC0Dxgg
Content-Transfer-Encoding: 7Bit
Content-Type: text/plain; charset="utf-8"; protected-headers="v1"
From: Stefan =?UTF-8?B?RMO2c2luZ2Vy?= <stefandoesinger@gmail.com>
To: sashiko-reviews@lists.linux.dev, Lee Jones <lee@kernel.org>
Subject:
 Re: [PATCH v8 04/12] mfd: zx297520v3: Add a clock and reset MFD driver
Date: Thu, 06 Aug 2026 21:33:54 +0300
Message-ID: <MiZ40QjqRtKW-pfFo_ZCYQ@gmail.com>
In-Reply-To: <20260806143103.GN2869284@google.com>
MIME-Version: 1.0

Hi Lee,

Am Donnerstag, 6. August 2026, 17:31:03 Ostafrikanische Zeit schrieb Lee 
Jones:
> This is correct.  You must not pass one device registration's (MFD) data
> through another (OF).  Use a defined integer instead and match in a
> switch() statement.  There are lots of examples of this.

That's what I did in Version 9 of the patchset here: https://lore.kernel.org/
linux-arm-kernel/20260802-zx29clk-v9-4-d05530d85d28@gmail.com/

Though I did run afoul of the naming rule (my enum has "MFD" in it, which 
kinda has the implementation detail that the driver is an MFD driver baked 
into it), so I'll address that in v10.

Cheers,
Stefan
--nextPartbZ2Luvy9Smq4ikTWC0Dxgg
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: This is a digitally signed message part.
Content-Transfer-Encoding: 7Bit

-----BEGIN PGP SIGNATURE-----

iQJPBAABCAA5FiEEQxb0tqoFWyeVMl1sPRO8yFRPGiIFAmp005IbFIAAAAAABAAO
bWFudTIsMi41KzEuMTIsMywyAAoJED0TvMhUTxoi2E4QAKy9v/glfkTD822DgZKq
qPzYOORWeaxqfAwwJsjuLkZsEMRDinOZMU6NjOgjam5gH6xFW24xOdsdphnttZCS
PuzRThxDv3kudLgQFG9NA5k2dZ3DVolJBolbNDCrNSCby86zJB/PQo2i0rQe5Y5I
KjnY1/NfOu9eZsQjIYdUSGibnKLebz3FdY/KrwrobpWranqBBXTG2PYZPxtOaTsL
NvpHuzg5X9VdwBMStJGMqowPrGawDzbtS4/P3AWfVrLA9hcLsleni9Dopendlpnk
AyEniQSQ7SnicAeFnutaZfD4q/E+RpaFJejoCmeOnOdDcnJ7SbH0mEoHQqjlz5TJ
hJDo5PBAjLZ3DmD/qOiXFN7UhvMHtDxUEm6jA/UKmOuu/yFQ1zVIO6z8Y3mqYwBY
qDNXuOZ8UN8eZvC9kWDZ8phcVejRJt/YdRG9WNEkZO9pGH0kIxjBWvRcYYgTBWhY
2U0CBCr3lyEtcfsbOL56eJwLbHZinU9zj+B0S60UGEK7frgR//3mGufSaT/szW9H
e1aZAdEiLN677Bmm1DkW+NE16K+QcB6/U1pLyoj+HHhXdOvigOLTZk5wLHBIMBqA
GmEvS+6BcwK/7xy3hGobS4ZMCUbjgyUi8QJaUaTi5k0P6NtQzaxyzmDalcrKWIIq
sCzkCfPHIvDsbbnLIO8Xd2SP
=1FP0
-----END PGP SIGNATURE-----

--nextPartbZ2Luvy9Smq4ikTWC0Dxgg--



