Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.214.181
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793850629;
	b=ANeNRx8gZ7hNzG1pLj4ZK8GiKmxbR0Lmh2UNKM5VOVM0OIqUIqHZw/aZeFgHNkxRbcSP
	 3lRZxj3DC7E2LA2pNVhsgvrtKR1WUMc0WYP1iG34udwLLUFVOHJ04oVJMXyqG65GW5B5F
	 +6vwbdqUZwNPrBAPWBCaYQSmbWRwUShFkmQ1/1wrwaVjDzlpWwOCeYVhQgKJynWhs7F4C
	 qqpu/nOuqbnECxBcZHSqI8OrFSnyt7bSiEZ2wsk8rpabfkO2hVUyAQpHlE9Jp5HX40ViI
	 Flg/Cpur2yYHcvXEllp+6sTZW47Q0Zt4GJ29L3zQFH2o8Rs60DYiUB2jvVEfMwFvRvA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793850629;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Transfer-Encoding;
	bh=FTQt/DKzExkg2Hajv9Ngnf1BFMIHptWE7Rva4W1+tQA=;
	b=da46j9RGvN5HjlV8F0LzbAPNzxpdCrtCVH4Ipov/BvPoxlNj4MC2fKr+QjjQvEX2+3fO
	 6fotSCQPvAsDkgJVKdC3hrYNZsaAfIHImi9xr//L2b8X8rOajhaS1WIjnbO/T/OmqWaM1
	 ZuYsI5lydpli+lTVCz6IWu+9b+HP2zG3W5Pnls+G4HW1cZTdC1a+xJw51lTZjiJ229aBh
	 YMhe6vIyvsQ1S1K5dAN56cQwFnBPMjttcK8xV4M1XqbRo+MCZJBItbyQkLll0WJCTtzZ4
	 t9Aaz6UJSIuZWdn/fdEEEt7oY9X1LjRm/n9JOvlHVJzVeoDDHAjpvh/JBoNLGejfljw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=none header.from=reznichenko.net;
	spf=none smtp.mailfrom=dpplabs.com;
	dkim=pass header.d=reznichenko.net header.i=@reznichenko.net header.a=rsa-sha256 header.s=google header.b="S7pNGCy/";
	arc=none smtp.remote-ip=209.85.214.181
Received: from mail-pl1-f181.google.com (mail-pl1-f181.google.com [209.85.214.181])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D62FE606A32D
	for <sashiko-reviews@lists.linux.dev>; Thu,  5 Nov 2026 03:50:28 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org D62FE606A32D
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=reznichenko.net
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=dpplabs.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=reznichenko.net header.i=@reznichenko.net header.a=rsa-sha256 header.s=google header.b=S7pNGCy/
Received: by mail-pl1-f181.google.com with SMTP id d9443c01a7336-2ed0890476fso8022845ad.0
        for <sashiko-reviews@lists.linux.dev>; Wed, 04 Nov 2026 19:50:28 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=reznichenko.net; s=google; t=1793850628; x=1794455428; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=FTQt/DKzExkg2Hajv9Ngnf1BFMIHptWE7Rva4W1+tQA=;
        b=S7pNGCy/Y7gNW847je3BeJ/owIXBo/V3ZQU+ooPPKOWeLmGGTSENfb56M/8YL+BCWm
         O83038j3HevxdQlwhuZUyVq+wRhVdhQgj5oFTHOZ23x/rx+bkv0bcGRB5/72Wvd4xZVS
         DZV4hwKxpuzli8hZgVW+OzgHZZ/VgCiYE3pEoReVhP2ipiDNI74HS3SvcFV+JPPUMb3o
         CL5IO0vu5T2gA0yrTOTfACo6rur//4fAwUKBttnELFydZVoPnsD58V43RDI+uQH7kHAc
         Bkkin0yx0OQHemhNs+1QsVkqmS3/qX2Kn1dEIcTV9EX1z5MikwPIm6fEy5SUREWbO7GH
         G0yw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793850628; x=1794455428;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=FTQt/DKzExkg2Hajv9Ngnf1BFMIHptWE7Rva4W1+tQA=;
        b=mOAX0xFTM3FtswLuPxEWbuPM2ZydfABAGVBzDJCThFsWHqhcDKJXVSOUj0rvQbqBjP
         KmliP8iHFioMqS+JtgXZqtF0GYD9ZSjSJu+AoqRZZcNf5UWflO7ozG1czMNFF6iV8HE1
         I/83b7OPN5NvVEOn3VocT1IA8mT9i+siBCWWaQqt3hUwdfGYCmtTc2ERJvKrZOlhv2pU
         3XFHHb7oDBZRiCaQ9Q9D5L0hZqOs/xpcQl2l2dvrmzGqyCKdHRze2dbYETcmdz7pyb9k
         ph0JhPFVO8w2VRIEq19i2UdOWWKek9tqLrZIZ6nj+/bK8eDjD9QGxHQRfzm8lAD4JRiV
         euZQ==
X-Forwarded-Encrypted: i=1; AKwUvBzMtnXSvZwfmnbYkkqWuyFzhEEpxbtn22zNkpVOOtABQj6ksFX11cjgESP4sotz7QD8X2ytaL0UswbhkGFJhXM=@lists.linux.dev
X-Gm-Message-State: APuU4Z/PKxCbrP1SU7zmgL08+tWESUtHE1EOwvvCl8e0ZOBa/viau/QM
	jYdGOHYRqLn5RDuxk86L5mAXi8iCjVBinlIm/OEZGnLGtnfoA9DW64cMvpMfF3xNKwY=
X-Gm-Gg: AYBFou2FFSwoyQAQ9J+NTpv31eYK+NEJN1XitmNAcW4vBuorA1ApW1ljevWBInr/WQk
	Juz2bjFbIr/ioAPWse0PRa+U7JzjkVakcJYDbPd4LNw8B0z0FmUL93lDRLwBBkTHJl+ftu7AKAh
	xXZmwzlFAS/LVxcUCqeJHkw4DB0w7Xm7mQRZuiVWd/maQUrbRJiUANpW/Sb6aLVtbpCo3vwoljj
	nsLjdHR0XSHRVlxucxPP3A9tDbllh/q3AF6a0SGAa4lwdLHeJ3P2T2MwGLt7+AYt70Yb2hqWfdl
	vilC5SLClWeDX/PKA+vGeCGQoEXsyb5Hux4+yk+x3WInxsm4a9WivBLvKEczdSZzXYxavGc9gfn
	rZtesyk+PsnYIMKRAolkltkXHgX4VP2dXpn9miWluJFgMpm0GyT4B/bFig8lC1gsyMA3Ual8+qJ
	MsbDSeBN0zBgQ6yy3k4tPVT9WVHRuJHTJu3MivK6JpZJJEhsP9XgB2rZUEYv+ik6SCW1C8e3rUE
	yPx0aPau/axXgHQdlJHAU+Dyqv31L0+acZkXdPNazI5vHCQHCG4DHUoqkmXmjH+0/ChyH6Mqkej
	7LGUKbBWKrYw4LLqLWcy+Js=
X-Received: by 2002:a17:902:ec85:b0:2e9:a23b:643d with SMTP id d9443c01a7336-2eb364d253fmr159592395ad.35.1793850628135;
        Wed, 04 Nov 2026 19:50:28 -0800 (PST)
Received: from z440.. ([24.21.231.36])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2ed09127d9fsm12557955ad.51.2026.11.04.19.50.26
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 04 Nov 2026 19:50:27 -0800 (PST)
From: Igor Reznichenko <igor@reznichenko.net>
To: romain.tisserand@gmail.com
Cc: airlied@gmail.com,
	conor+dt@kernel.org,
	devicetree@vger.kernel.org,
	dri-devel@lists.freedesktop.org,
	igor@reznichenko.net,
	jesszhan0024@gmail.com,
	krzk+dt@kernel.org,
	linux-kernel@vger.kernel.org,
	maarten.lankhorst@linux.intel.com,
	mripard@kernel.org,
	neil.armstrong@linaro.org,
	robh@kernel.org,
	sashiko-reviews@lists.linux.dev,
	simona@ffwll.ch,
	tzimmermann@suse.de
Subject: Re: [PATCH 3/4] dt-bindings: display: panel: ilitek, ili9488: add the PocketGo S30 panel
Date: Wed,  4 Nov 2026 19:50:25 -0800
Message-ID: <20261105035025.25540-1-igor@reznichenko.net>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20261103110524.2812831-4-romain.tisserand@gmail.com>
References: <20261103110524.2812831-4-romain.tisserand@gmail.com>
X-Mailing-List: sashiko-reviews@lists.linux.dev
List-Id: <sashiko-reviews.lists.linux.dev>
List-Post: <mailto:sashiko-reviews@lists.linux.dev>
List-Help: <mailto:sashiko-reviews+help@lists.linux.dev>
List-Subscribe: <mailto:sashiko-reviews+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:sashiko-reviews+unsubscribe@lists.linux.dev>
List-Owner: <mailto:sashiko-reviews+owner@lists.linux.dev>
Precedence: list
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Reviewed-by: Igor Reznichenko <igor@reznichenko.net>
