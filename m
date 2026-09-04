Received: from mail-wm1-f47.google.com (mail-wm1-f47.google.com [209.85.128.47])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 72B55379EE7
	for <sashiko-reviews@lists.linux.dev>; Fri,  4 Sep 2026 07:36:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.47
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788507367; cv=none; b=kWBlEAEq51FhDJh77FZVVFqYOx8eHHW1/XiO2eHAi/Qip0haFE6u5800uY9fGwanZqrn+KMWj0WPlqDRsuycVnhrWMxYXdrTndSnpFnMVKhOhVG2QQsanMWnJUVWKaF1FPXFuccp+zrqwrW2aBcP3kZxMgvu45SZzs8WAooe8h4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788507367; c=relaxed/simple;
	bh=nd/5ek9o+FS89AY/wB0lPXbQLZpXH5CZcMEcmmo1y+I=;
	h=Mime-Version:Content-Type:Date:Message-Id:Cc:Subject:From:To:
	 References:In-Reply-To; b=aj71MW78u/xT6VV03bZ1iDKSYzq/tuehq94ULhEBv13JAZgZ7e5YDRZ7XfGWx2GW83cgMXQtfNIuC5lDCxEwKtosIpjOm8H8RgTMIazn5LulbMxC7BgcikfWdmQYcj2Q5GHSoky11OW69j+NV4It+O3lsv7ooivFY5WL3JNfzzs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com; spf=pass smtp.mailfrom=baylibre.com; dkim=pass (2048-bit key) header.d=baylibre.com header.i=@baylibre.com header.b=mm20QABw; arc=none smtp.client-ip=209.85.128.47
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=baylibre.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=baylibre.com header.i=@baylibre.com header.b="mm20QABw"
Received: by mail-wm1-f47.google.com with SMTP id 5b1f17b1804b1-49b392ccaacso10823715e9.2
        for <sashiko-reviews@lists.linux.dev>; Fri, 04 Sep 2026 00:36:02 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre.com; s=google; t=1788507361; x=1789112161; darn=lists.linux.dev;
        h=in-reply-to:references:to:from:subject:cc:message-id:date
         :content-type:mime-version:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=nd/5ek9o+FS89AY/wB0lPXbQLZpXH5CZcMEcmmo1y+I=;
        b=mm20QABwFB6ZISQNX7ihZpJ1uQ3yuYgEFZbctKLF5ArXwGkg8bmi+2CcWhgCY5honJ
         vbnu/093QLCfqOfG/B3F0Wt75wSPw/1ts+ZyoA0raemjJFBavpgtwJ2bKb9rEkY6Aj5L
         ShsHeAHvWS6mxfXSHa/Ml8RFQSnn97V/duuU3sObdGg4WKdE5ASG4GCPgMJWOI4+3X0t
         ZytA2LAJ29/6TmNyJMTPnb/iwjE1kgOJ/Q3Sdzxnl7pWSrCkB8jAeewlqUYeORi3AO2L
         zfqD+1ZqwwKJSGbowEcDZpQPJjL43C92pfubiiGaKVnzMc2hOZoR+Qa76dhdi1vwzz7o
         9CvA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788507361; x=1789112161;
        h=in-reply-to:references:to:from:subject:cc:message-id:date
         :content-type:mime-version:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=nd/5ek9o+FS89AY/wB0lPXbQLZpXH5CZcMEcmmo1y+I=;
        b=sJ/dgru1/SBR4FtyGJgSpPX11/Ly0vDyUUoG1mNtiX6fU0Ir9vJ9LzM18tNQie7oNa
         3DmK1nmDC0+e8+Tv7MxFg2pUnZ3Cw6UMOIHFLkmBwyF70i8C4SFXplUpUxdZ2ubUumdJ
         UdsYqZ2nlNXOe8Baa5NNfd2TYxwKRq7oL9pa+ZOxO1ueZGhzdSCeNS74YMA+Yr+swZNZ
         utMH7WCVGzliLJHvIlXmgwR0XBnf6aJ4vtNu2DbNk/bSPGdVl4/EpDsLpEdVjXwoWNEo
         3sLrgVSqWTlkJ6Ix9hcZ86SAtEuuSzWiZnpHHZXCR8Ol1k/m6XGUkY1HFcjIlmHKDnyH
         c1/g==
X-Gm-Message-State: AFuF++kztTmwyWjyPQZcVrDdCRBUD8eQA90eV9t1YkS7LmSYNnTZbuPq
	bsZ9om0tOpRddSHi7AGRDIl+wsyX7QDslwv6hoEjEzcih8E0FXAWsctjcnGSfs2m6lziS8nwHTK
	jH1h9
X-Gm-Gg: AYBFou0Cxdg3h7PPbFVismOdC3bzIRkX57+gzEc3/aaXLeUX7Gemkuysjf94VITC6gP
	E6nraR2qZM1B7P4eZD83PeJSYG3Jfeux9PtHzQllaoX6iwHoCiMHzQolpoSeBtGZ3VXD0/Q0JFN
	dkzVI2RPtqcntxeYXGc3Uxkl2oR6QrQpb4a3ryJ5Vd860Bzq8edBV9VvaBxjomKJNyrtJH+vQNh
	lqjmi5XyOvAHcjNj5ZPbhBkj8c9Q18ieyp3rATSiHaYo/+UHU4iUZM3jU0yvE0m2tBziClTo5CF
	3X8vH1y3tQP1hqlG1TQbXHRfTrRIg8tgBUjf5A1mnKAd0uGmM69S/EwWR+k+dKSxJ/heH0JbcO9
	LMF6J4S/Gf7YdiSgjDsKcrCEDSTFZp+4PZpJV8TS4bf+h4ikPu+KLb8EGw2o32Jl/pM5lbdv+Ts
	CxsewJcwnvJQk+PXOLKoTHqRxzOUJM+zeq7xlAjrLRbJZ9oQMZ5TnSXVy4
X-Received: by 2002:a05:600c:5251:b0:499:9eb8:a1d7 with SMTP id 5b1f17b1804b1-49cf825c45emr36885685e9.9.1788507360982;
        Fri, 04 Sep 2026 00:36:00 -0700 (PDT)
Received: from localhost ([2001:4090:a244:80d4:489b:7642:1b32:84d6])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-49cf772692dsm57176265e9.10.2026.09.04.00.35.59
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 04 Sep 2026 00:36:00 -0700 (PDT)
Precedence: bulk
X-Mailing-List: sashiko-reviews@lists.linux.dev
List-Id: <sashiko-reviews.lists.linux.dev>
List-Subscribe: <mailto:sashiko-reviews+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:sashiko-reviews+unsubscribe@lists.linux.dev>
Mime-Version: 1.0
Content-Type: multipart/signed;
 boundary=841e05f6ba8ef64d6b8a02f12b4668f6f7f66f4ea31d2002dde784c4a325;
 micalg=pgp-sha512; protocol="application/pgp-signature"
Date: Fri, 04 Sep 2026 09:35:52 +0200
Message-Id: <DL6CXYXHGWQU.193HZVLMKGI0F@baylibre.com>
Cc: <robh@kernel.org>, <conor+dt@kernel.org>, <devicetree@vger.kernel.org>
Subject: Re: [PATCH v8 8/9] arm64: dts: ti: k3-am62p: Split r5f memory
 region
From: "Markus Schneider-Pargmann" <msp@baylibre.com>
To: <sashiko-reviews@lists.linux.dev>, "Markus Schneider-Pargmann (TI)"
 <msp@baylibre.com>
X-Mailer: aerc 0.21.0-146-gb5c16ebe1835
References: <20260903-topic-am62a-ioddr-dt-v6-19-v8-0-74c650dfdea6@baylibre.com> <20260903-topic-am62a-ioddr-dt-v6-19-v8-8-74c650dfdea6@baylibre.com> <20260903125747.881481F00A3A@smtp.kernel.org>
In-Reply-To: <20260903125747.881481F00A3A@smtp.kernel.org>

--841e05f6ba8ef64d6b8a02f12b4668f6f7f66f4ea31d2002dde784c4a325
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8

On Thu Sep 3, 2026 at 2:57 PM CEST, sashiko-bot wrote:
> Thank you for your contribution! Sashiko AI review found 1 potential issu=
e(s) to consider:
> - [High] Splitting the single firmware memory region into multiple smalle=
r regions breaks kernel-side firmware loading for existing firmware binarie=
s whose ELF segments do not perfectly align with the newly introduced exact=
 boundaries.

I am not aware of any kernel-side firmware loading.

Best
Markus

--841e05f6ba8ef64d6b8a02f12b4668f6f7f66f4ea31d2002dde784c4a325
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iKMEABYKAEsWIQSJYVVm/x+5xmOiprOFwVZpkBVKUwUCapp02BsUgAAAAAAEAA5t
YW51MiwyLjUrMS4xMiwyLDIRHG1zcEBiYXlsaWJyZS5jb20ACgkQhcFWaZAVSlNZ
WgD+NOs4vTIHWzhIMsJOdeF7z0fBc0JvIu28ZPevBdcx+LEA/3Xa8ZHnO8gHH9tw
J+lWbd7woSAs7d6ayJjBNAMhlIcG
=Wtn6
-----END PGP SIGNATURE-----

--841e05f6ba8ef64d6b8a02f12b4668f6f7f66f4ea31d2002dde784c4a325--
