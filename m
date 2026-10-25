Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=202.36.163.20
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792954536;
	b=qaUUIF/EZ9wBvOsb7LwF4cRAnEhnfqBLygW2eYQoPrB8FlE7FUdMRaDv/4thEuopfzRu
	 P7hYA5HBH6WAg5zs5slcY66gOpM7NVbp0ospHsQdvNgKOSwhjdyP9S072LiKm+kyxJZmv
	 f8fYnSuAXrfZ2cxQirBwn5X95OXl/kJKBFa3xVYQ+ZbjNdWCHo6Tw0pUAvAoYLYkuSj/l
	 JaUv5JY4Ie5z6yPGLeKUlf9cB5KBGECtpWrOzYWEST0UKKGL43zMQyfpn+BNYHQUMROoi
	 kMEAohanATC5GOoOAtdm8irqcYQMIWcD4SCj9xq/6K8Eo7R9Bi/fKue8HqhuHcoOOkA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792954536;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:Received:From:
	 To:CC:Subject:Thread-Topic:Thread-Index:Date:Message-ID:References:
	 In-Reply-To:Accept-Language:Content-Language:X-MS-Has-Attach:
	 X-MS-TNEF-Correlator:x-originating-ip:Content-Type:
	 Content-Transfer-Encoding:MIME-Version:X-SEG-SpamProfiler-Analysis:
	 X-SEG-SpamProfiler-Score;
	bh=EkyTLH9O2VFlugHBZrm1Y4nRaa319co6IyajjDX9P+A=;
	b=aAff78hORhqDhXFNVFO0W34u/RbXA4cAGsi+FrIoMNfyj2VmZyGI47U/Pz4PvYWN+yFX
	 2tzJ32u/gzZ93m2Hl6tQnPGcYEkDrf2L4O3sPT0Xzeq+d2wgUVj5faRGOgtaQBX1rdqCF
	 TUnrwz1dwb1zUhDOTSWJtSbUBXiD+IvjhZlzFQgFiJ/z24OC9v8tFJTWCsLPZuID5cTew
	 6rQYcMnHtYGyAtfuvgR8A06RtR8+0H2D3XuiCLMJArnw+B4J3ZqmFf4DIwRwCqSsr1zo8
	 0j49poxSNezg+XD7a+Yu1Dzejq+0SQn2c0wbQnji/gQjIrsr26rDMvYt9avizop4bHA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=alliedtelesis.co.nz;
	spf=pass smtp.mailfrom=alliedtelesis.co.nz;
	arc=none smtp.remote-ip=202.36.163.20
Received: from gate2.alliedtelesis.co.nz (gate2.alliedtelesis.co.nz [202.36.163.20])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D7D6E606A31A
	for <sashiko-reviews@lists.linux.dev>; Sun, 25 Oct 2026 18:55:24 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org D7D6E606A31A
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=alliedtelesis.co.nz
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=alliedtelesis.co.nz
Received: from svr-chch-seg1.atlnz.lc (mmarshal3.atlnz.lc [10.32.18.43])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(Client did not present a certificate)
	by gate2.alliedtelesis.co.nz (Postfix) with ESMTPS id 684432C0108;
	Mon, 26 Oct 2026 07:55:16 +1300 (NZDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=alliedtelesis.co.nz;
	s=mail181024; t=1792954516;
	bh=EkyTLH9O2VFlugHBZrm1Y4nRaa319co6IyajjDX9P+A=;
	h=From:To:CC:Subject:Date:References:In-Reply-To:From;
	b=fuvEbl4EKTLelfgrg5rBfeeLx3FWULqW+UtemjtlA3KYDErakqlcU7H2qf3S091/I
	 foIX959VV7a1AJnZLKhtxAzpVHyw0PQ0W/Hj9zUEWPfizOAiyqBEfUm4YDOfcyaTnU
	 5p/PujIIrzyQMRhmYG3c/2+PaEkxDMvsyL5eBY3rafY0CYSAj0Vskoz7Bck/7KNleY
	 brY6l8Wu5Ot1IWiXuE112hOAt2t2d9+VlZG84R5/GQItM/v7DKfKQpHPQzPTFE6T/7
	 m0WRlVlcJCfDZ00YkuZisFIop1OT8zWQbeOLGZRSn7u2NyoFqDIs8BBhCBX5qhzNYv
	 IY1oRidHFPHDQ==
Received: from svr-chch-ex2.atlnz.lc (Not Verified[2001:df5:b000:bc8::76]) by svr-chch-seg1.atlnz.lc with Trustwave SEG (v8,2,6,11305)
	id <B6ade50940000>; Mon, 26 Oct 2026 07:55:16 +1300
Received: from svr-chch-ex2.atlnz.lc (2001:df5:b000:bc8:f753:6de:11c0:a008) by
 svr-chch-ex2.atlnz.lc (2001:df5:b000:bc8:f753:6de:11c0:a008) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.53; Mon, 26 Oct 2026 07:55:03 +1300
Received: from svr-chch-ex2.atlnz.lc ([fe80::a9eb:c9b7:8b52:9567]) by
 svr-chch-ex2.atlnz.lc ([fe80::a9eb:c9b7:8b52:9567%15]) with mapi id
 15.02.2562.053; Mon, 26 Oct 2026 07:55:03 +1300
From: Carl Smith <Carl.Smith@alliedtelesis.co.nz>
To: Wim Van Sebroeck <wim@linux-watchdog.org>, Guenter Roeck
	<linux@roeck-us.net>
CC: "linux-watchdog@vger.kernel.org" <linux-watchdog@vger.kernel.org>,
	"linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
	"sashiko-reviews@lists.linux.dev" <sashiko-reviews@lists.linux.dev>
Subject: Re: [PATCH] watchdog: octeon-wdt: Add a panic_on_timeout parameter
Thread-Topic: [PATCH] watchdog: octeon-wdt: Add a panic_on_timeout parameter
Thread-Index: AQHdYyLqlyPOp/BBjUy/2OPLTlmRs7cKrBOAgAPuoyw=
Date: Sun, 25 Oct 2026 18:55:03 +0000
Message-ID: <9f6fb41b5af14c09818980273307e2ca@alliedtelesis.co.nz>
References: <20261023191530.327734-1-carl.smith@alliedtelesis.co.nz>,<sashiko-outbox-183127@kernel.org>
In-Reply-To: <sashiko-outbox-183127@kernel.org>
Accept-Language: en-NZ, en-US
Content-Language: en-NZ
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable
X-Mailing-List: sashiko-reviews@lists.linux.dev
List-Id: <sashiko-reviews.lists.linux.dev>
List-Post: <mailto:sashiko-reviews@lists.linux.dev>
List-Help: <mailto:sashiko-reviews+help@lists.linux.dev>
List-Subscribe: <mailto:sashiko-reviews+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:sashiko-reviews+unsubscribe@lists.linux.dev>
List-Owner: <mailto:sashiko-reviews+owner@lists.linux.dev>
Precedence: list
MIME-Version: 1.0
X-SEG-SpamProfiler-Analysis: v=2.4 cv=FJW4xPos c=1 sm=1 tr=0 ts=6ade5094 a=Xf/6aR1Nyvzi7BryhOrcLQ==:117 a=xqWC_Br6kY4A:10 a=oKJsc7D3gJEA:10 a=8nJEP1OIZ-IA:10 a=660iZSQnnn4A:10 a=eOYEQobSZ2qJzmjsaD4A:9 a=3ZKOabzyN94A:10 a=wPNLvfGTeEIA:10
X-SEG-SpamProfiler-Score: 0

> Should the new panic_on_timeout parameter in drivers/watchdog/octeon-wdt-=
main.c
> also be documented in Documentation/admin-guide/kernel-parameters.txt (an=
d
> Documentation/watchdog/watchdog-parameters.rst)?

kernel-parameters.txt does not list per-driver watchdog parameters; none
of the watchdog drivers have entries there, including softdog's
soft_panic.

watchdog-parameters.rst has no section for octeon-wdt at all, so its
existing heartbeat, nowayout and disable parameters are not documented
either. I can add an octeon_wdt section there covering all four
parameters, either in a v2 of this patch or as a separate patch,
whichever you prefer.
 =20
Carl=
