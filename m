Received: from mail-wm1-f50.google.com (mail-wm1-f50.google.com [209.85.128.50])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 50AFB4BAA13
	for <sashiko-reviews@lists.linux.dev>; Thu,  3 Sep 2026 14:55:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.50
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788447323; cv=none; b=MTq18J4qz27/MQphW8ZP2QRm1OhOTFg8ZSRr/NcbKnNiPchKKZKf4ycO8RxQEy4GuaFzWtlcTUtAYYtlIe7loQOweIbUodKN3X+QXivoyTX6YvciP9spQTKOBJdKijiILMVE7bQ6JAuJCODO2+3UIW8PbB3HozAuKGZOqXaKJfc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788447323; c=relaxed/simple;
	bh=+H2EOp5Fi3D0NA8DNxkPWlcu5mNPCH1s/JJTkBM2oWg=;
	h=Mime-Version:Content-Type:Date:Message-Id:Cc:Subject:From:To:
	 References:In-Reply-To; b=ZeKmK0ovcfEshr9PbLgbXbZeaXHpQZaSdwOFswzZaoKEcB66W5qKm3Q38EyS8Glprnqkf+I3RvEfkPXTTZXFB72K7+sxe2YIZcDvO23nAau06vQMpTg+hj2Bv3TigwCc9wCYPkeSf7brecgdEBXGWGhcMJj8E7UBjAeteM3ixtk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com; spf=pass smtp.mailfrom=baylibre.com; dkim=pass (2048-bit key) header.d=baylibre.com header.i=@baylibre.com header.b=KIVkPSrl; arc=none smtp.client-ip=209.85.128.50
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=baylibre.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=baylibre.com header.i=@baylibre.com header.b="KIVkPSrl"
Received: by mail-wm1-f50.google.com with SMTP id 5b1f17b1804b1-49ccfbe062eso20147935e9.3
        for <sashiko-reviews@lists.linux.dev>; Thu, 03 Sep 2026 07:55:21 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre.com; s=google; t=1788447319; x=1789052119; darn=lists.linux.dev;
        h=in-reply-to:references:to:from:subject:cc:message-id:date
         :content-type:mime-version:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=+H2EOp5Fi3D0NA8DNxkPWlcu5mNPCH1s/JJTkBM2oWg=;
        b=KIVkPSrlsPzCnbGT/KOBR19YbAtV0OJIiAvwa7JB1ubi1+t+GuEGD5TB7hBWP4uLuY
         ksIJxF1F9hg7edulEdK2eKrAYqFMZblYWBAfuhoC7SbKhiK+7EO20mYWfyXOEXFEojXt
         GkEJeMfr3MvaNI5uH3vCNDwC0IcwZTZbJdB3wOkCjNDioTUrmF1EggPYVnnM/WHBQueu
         xhpBkGZ0O7w1J4GKSEdK0VNm7tGWMKoiPY1BsMXOZ3PCgIYa0/eYVx4P+alWU0juPV9O
         cG4YgZM/8Sm28KuTTHE1iluczipEksRvBAnB2pixNJQ9Sy/7AZlzHXGd8MExldvtLpku
         oi6w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788447319; x=1789052119;
        h=in-reply-to:references:to:from:subject:cc:message-id:date
         :content-type:mime-version:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=+H2EOp5Fi3D0NA8DNxkPWlcu5mNPCH1s/JJTkBM2oWg=;
        b=Q5tFN9zsVeKAA7tjug5DJSc6MiO2K2XYr7YeFac/WV3Ad3rpCsqTmyLOyaTP27JlWG
         xzLXMR0lXtq+oKVh050W+sCeD40TtrO2ktmUyoxyDgh/kAb86dVS0nODjp3Vw4ntCKws
         acnZZUu17L+CT5V7IEBxa5d07BqLIPGh6fiaMWxUaP2rZpshN/deigAmgeiE2NwXs+Uv
         KFMNfqxtzQqq4C6v4mDCGNeEbtFHPBIqOdJDItaD2TWjYRKp3WZAY5Ub97cO/ChWMXNQ
         PrczDhOHBc6bdp18dgcW1O40GkEJ75uQZz0CU+JXhlsRHywxI4J5jGJc2SnAPAWCmvUn
         ReSw==
X-Gm-Message-State: AFuF++knBRil1ikcazih8d30gIE4qu1+QHK9gjushfldPsFWddK/18zn
	skxptJOSF3kEguQZLUIxVoStvHEEWr1FH8GuRdTDHnQQrzMVKQsDTINOteytvjs3gslPtKUOrDq
	71mtG
X-Gm-Gg: AYBFou2AiW9MDCOYzefYI2TQjiOA0n4XbNd1Yu8Os8LEITMOFJs2+4BDSCwtm864A9C
	I4u5JEOVZJTX0PJBX7l+6fRcQ6qjaHZez7DfTtiCMQu5j2ydv40jEDS3YFkIE1nNfkRryOSSVee
	jPV35pgTQMpgegM+HuGosfCYWcayv63ztbP25Yivd8B/m0rNVRiIG8qy81tGeypl60J+eMMRWV5
	FRPRXkEEJFbjda2q4W3HkrjTkztWGmhj9yz8nj72QrM9115JPPwCiEjCTp1noUMRC61YLP0X+0r
	+ggWyhjkonyFHBpHSzFNEv/VzpKbzCk1IVyuV/U2F/x5lMcOZAIEobxq+Jpv7ujbl0DqQKPB70L
	XSPPRq166fLxoauPoSgDStfVk8hYN928nJ6D84tBZuuMfZKIHifD/eOWY6EhtsKfGaCOvD8yNuz
	wcLD313Aj2DZdrxkrUhclTv3XA/b7wVcMdNSdABdjTIg==
X-Received: by 2002:a05:600c:37c3:b0:49c:f5c0:aa79 with SMTP id 5b1f17b1804b1-49cf5c0abbbmr9145495e9.9.1788447319577;
        Thu, 03 Sep 2026 07:55:19 -0700 (PDT)
Received: from localhost ([2001:4090:a244:80d4:489b:7642:1b32:84d6])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-49cee80eda4sm75862735e9.15.2026.09.03.07.55.18
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 03 Sep 2026 07:55:18 -0700 (PDT)
Precedence: bulk
X-Mailing-List: sashiko-reviews@lists.linux.dev
List-Id: <sashiko-reviews.lists.linux.dev>
List-Subscribe: <mailto:sashiko-reviews+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:sashiko-reviews+unsubscribe@lists.linux.dev>
Mime-Version: 1.0
Content-Type: multipart/signed;
 boundary=c74f06d374bcc0063b4971e7e70a63dbdbbbacd3d501b3bcff9aae8712ae;
 micalg=pgp-sha512; protocol="application/pgp-signature"
Date: Thu, 03 Sep 2026 16:55:13 +0200
Message-Id: <DL5RNTPIARVY.10YJNQ9AH2DDR@baylibre.com>
Cc: <conor+dt@kernel.org>, <robh@kernel.org>, <devicetree@vger.kernel.org>
Subject: Re: [PATCH v8 7/9] arm64: dts: ti: k3-am62a: Split r5f memory
 region
From: "Markus Schneider-Pargmann" <msp@baylibre.com>
To: <sashiko-reviews@lists.linux.dev>, "Markus Schneider-Pargmann (TI)"
 <msp@baylibre.com>
X-Mailer: aerc 0.21.0-146-gb5c16ebe1835
References: <20260903-topic-am62a-ioddr-dt-v6-19-v8-0-74c650dfdea6@baylibre.com> <20260903-topic-am62a-ioddr-dt-v6-19-v8-7-74c650dfdea6@baylibre.com> <20260903125534.48D651F000E9@smtp.kernel.org>
In-Reply-To: <20260903125534.48D651F000E9@smtp.kernel.org>

--c74f06d374bcc0063b4971e7e70a63dbdbbbacd3d501b3bcff9aae8712ae
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8

On Thu Sep 3, 2026 at 2:55 PM CEST, sashiko-bot wrote:
> Thank you for your contribution! Sashiko AI review found 2 potential issu=
e(s) to consider:
> - [Critical] ABI breakage causing monolithic firmware loads to fail.
> - [High] SPL memory allocator overwrites DM firmware due to missing bootp=
h-pre-ram tags.

Both of these are not issues. The firmware load in uboot ignores the
devicetree.

Best
Markus

--c74f06d374bcc0063b4971e7e70a63dbdbbbacd3d501b3bcff9aae8712ae
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iKMEABYKAEsWIQSJYVVm/x+5xmOiprOFwVZpkBVKUwUCapmKUhsUgAAAAAAEAA5t
YW51MiwyLjUrMS4xMiwyLDIRHG1zcEBiYXlsaWJyZS5jb20ACgkQhcFWaZAVSlNz
dwEA8VM8z4iKQe16SYr9A8dbm1O50RDaLSYaXDfl44AulxYBANXrSJ8Q1JfZXiht
b86yLKyUJbt+O758WHHoQrEPBAQJ
=Ddbj
-----END PGP SIGNATURE-----

--c74f06d374bcc0063b4971e7e70a63dbdbbbacd3d501b3bcff9aae8712ae--
