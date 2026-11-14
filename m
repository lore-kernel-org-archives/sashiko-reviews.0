Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.128.47
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794666786;
	b=d6GiBfiYS1/uTKW5VsdmG5rHiss8+nS5E5tPDdR6l+INzS57neEAWi3j971h8mb9DiFs
	 PjWCmlm3t9thnhAHp1j+/z5l6kbXcCMvn28h2DseoXBmoXjAWmfcsE4FXCZA/kmxgA79L
	 qJtzWl8uzE0qrd3TIPIDSf2TJhIpNAvMPwZRdvfFtdmgxTsmfUCxD5xC7Jy3TaVG6y7Ou
	 7FFzL0PpxQl2Y+pMxhPqMSOe1FKVfXST6RijtTabl4GuGuZO0Avrp8riQ4s9prkIEmv8p
	 kCfeSPb3JfYfEt8rJpBTTpHeFBtmkzNSpoCvfJwJyoHf9hEKYPGsOe6jvBYzt85s/Kw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794666786;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:Received:Date:From:To:Cc:
	 Subject:Message-ID:In-Reply-To:References:X-Mailer:MIME-Version:
	 Content-Type:Content-Transfer-Encoding;
	bh=zZTHArb7/cDEOGGmixdYHyste9bMwihASbVf49eSoI4=;
	b=FZyfY36cJuoT+KBkAO5JhLuhB39Ya3nl6I6gm5tfnlP/q9zFBOvpCo77cQ8fbJYJ2U88
	 eAkAp+LCF2VHFf2hd9ETwoKyl4qOjUiVKnTzu0Rpqux+uQDjgwXn7QegajBX53Pax4j8a
	 Q3MYnQiY7AtLwMnkSZ9VjG0FX+bfGRxa+Pg7UAxbTxCbcxgvSosrThuSJg66kdNNeyA6G
	 6NU0ogP8AKj5DR/3xYCbo2ubrx8PI2PxG9WR3CTDbXFJj9QyftvqV7IgbblqjfaJLhT8s
	 uo74gw8HgncmyXsBVY5JxkH5yUnVmObb9+7/YHS12fjGNsXU1cP9sTpY1zXZZUpiSRA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=GNOjdYSE;
	arc=none smtp.remote-ip=209.85.128.47
Received: from mail-wm1-f47.google.com (mail-wm1-f47.google.com [209.85.128.47])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4072E606A323
	for <sashiko-reviews@lists.linux.dev>; Sat, 14 Nov 2026 14:33:06 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 4072E606A323
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=GNOjdYSE
Received: by mail-wm1-f47.google.com with SMTP id 5b1f17b1804b1-4bb55cda775so8717545e9.0
        for <sashiko-reviews@lists.linux.dev>; Sat, 14 Nov 2026 06:33:05 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794666784; x=1795271584; darn=lists.linux.dev;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=zZTHArb7/cDEOGGmixdYHyste9bMwihASbVf49eSoI4=;
        b=GNOjdYSEskf83krpKG5zkBmcwJT36+Dz0KbOoXToU8cWyiPzY3xQHikl6naO2eWXIF
         raKDeg9dg9/BHPxw2vAUpWVNdX3vGEdLq7uVkac6N1TWRSu3x5qHSzf2E/n01YYm3Bes
         jYzB+uKwlyC9IP2VY5ucgXOdJ9bh/aI4xRIWtOKblDQWTcNcinnfv3m3mBrtpOLWhNSV
         G/Uz9/Q6oe3Ui8sqtd2p291OW72xiDndCXvUpx3pwg0yDcH66CCqO2c2Sr7FIc+/yxxJ
         /9fuHIPYBiIpjGBvtp8fQS/4wMXjonM5+mhN809x2YkqzUsomgaicUlvmN0TtW9IjBZ4
         Mp6Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794666784; x=1795271584;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=zZTHArb7/cDEOGGmixdYHyste9bMwihASbVf49eSoI4=;
        b=VEUHIabQZyUbxKmRTNqJiioaePZAuqs+CBNGDvseseNfrYuXAzANux2XBEn90pZJna
         huBZCfGYlc2CfyV2boNr3smSqs+2Ynzqn48/InnEqTCmCCNcPNYwpmNfT5aJ+I8/8BLg
         /5Zce9W6hYO8iw0a6tEHDnr3mxISkFDyGx46QE0lWIp8/NPC5FV9tK+5QUYFkkl4Cm/4
         lo90A/Q/ghCv8bxrbqpCAHn18r9uB4+INMbe6ShM9z1VtDAsYh88Gg79QtJcuHE8Yb1Q
         2T+AmX2+tA9+kN56d9f1affMmPp0QiwkNvrZWmhg5rVPJW3ELBS3MInBtS5gFBveombx
         J1RA==
X-Gm-Message-State: APuU4Z90uHjkkn6faGlNTquJuJJzdj+vCTHY/coTes2jcNV5lPmiHjVm
	eKoEsZ4AmexSDx1LKpRVXD+7eSKde7zb5JnrCLnSX7AmAOZfOH8jdtSH
X-Gm-Gg: AYBFou2e1i/OfRI4uc5WmtAp+UnMMW/MELF/c/u4MkinDtifB4BJMuWFvGGH6rNLKWE
	4RRpNy4V23MEudmU3ReayP3o8jx3KayuGpBqgv55e8u2YtTDsBrMnuRLz/SY4ZSVfs0xjIpzVmN
	iEbYrChQW6FmzepMo7XnZ4TGMyhe16qaCBjCne3gftOVLNavgYLFiWwac0Zr0IuBCsmxHBpahpg
	tub/i/OHddTBjpPyvaSuDB/YQY7MO76/eojenStSrBJ+58VVZ8xEeDJUpgK6Xogs9pxJZqsCH1e
	u0BXax07Nqwv30eki9eHWNQrWHI7dEpdpqitloXlAKIaqVVvPLaWZ0OldtQdPvN4UViXNt0zyN8
	1TtBdwhmWuoeKcjtKB1TxPshYSKnCaN8vFJ/TR71JhyFYuBgbvfPxxi6T2Da/wm8MwBNLXgF+Z2
	uIKrQGUVTKiBUoVUYgZ69yZ8gqqvbXLodf6PzrsmllUMbyUK10JSU184TnIndlSmXaKBCa8CKfc
	Ku+c38TEHRcaBphU9+EBba9w3ga4jKyQn8Zb+IqIZ0Y8Q59Wyxps2Pchho+j1/we/jS3VG6YuLl
	sJRn2dYgm6xxBOWH/b876QIwZNGK/7BGE/sgbZ9urNAqVhzqF30tKyn7CePcx19uKA==
X-Received: by 2002:a05:600c:4691:b0:4bb:5e8c:13bc with SMTP id 5b1f17b1804b1-4bb5e8c13e4mr80850505e9.7.1794666784523;
        Sat, 14 Nov 2026 06:33:04 -0800 (PST)
Received: from pumpkin (82-69-66-36.dsl.in-addr.zen.co.uk. [82.69.66.36])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4bb56fa1062sm95802815e9.5.2026.11.14.06.33.03
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 14 Nov 2026 06:33:04 -0800 (PST)
Date: Sat, 14 Nov 2026 14:33:02 +0000
From: David Laight <david.laight.linux@gmail.com>
To: sashiko-bot@kernel.org
Cc: sashiko-reviews@lists.linux.dev, "Petr Mladek" <pmladek@suse.com>, "Kees
 Cook" <kees@kernel.org>, linux-kbuild@vger.kernel.org, bpf@vger.kernel.org,
 "Jim Cromie" <jim.cromie@gmail.com>, "Lorenzo Stoakes" <ljs@kernel.org>,
 "Luis Chamberlain" <mcgrof@kernel.org>, "Andrey Grodzovsky"
 <andrey.grodzovsky@crowdstrike.com>, "Steven Rostedt"
 <rostedt@goodmis.org>, "Andrii Nakryiko" <andrii@kernel.org>, "Samuel Wu"
 <wusamuel@google.com>, nathan@kernel.org, nsc@kernel.org
Subject: Re: [PATCH v3 next 05/13] kallsyms: Fix selftest startup delay
Message-ID: <20261114143302.3eb7125d@pumpkin>
In-Reply-To: <sashiko-outbox-208986@kernel.org>
References: <20261111115911.1142000-1-david.laight.linux@gmail.com>
	<20261111115911.1142000-6-david.laight.linux@gmail.com>
	<sashiko-outbox-208986@kernel.org>
X-Mailer: Claws Mail 4.1.1 (GTK 3.24.38; arm-unknown-linux-gnueabihf)
X-Mailing-List: sashiko-reviews@lists.linux.dev
List-Id: <sashiko-reviews.lists.linux.dev>
List-Post: <mailto:sashiko-reviews@lists.linux.dev>
List-Help: <mailto:sashiko-reviews+help@lists.linux.dev>
List-Subscribe: <mailto:sashiko-reviews+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:sashiko-reviews+unsubscribe@lists.linux.dev>
List-Owner: <mailto:sashiko-reviews+owner@lists.linux.dev>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit

On Wed, 11 Nov 2026 12:36:03 +0000
sashiko-bot@kernel.org wrote:

> Thank you for your contribution! Sashiko AI review found 1 potential
> issue to consider:
> - [Low] kallsyms: missing Fixes trailer on selftest startup delay fix
> --

Missed because it isn't worth backporting.

David

> 
> commit 06f0c3fe023ccc28da9c2bd9798921899fb0ec63
> Author: David Laight <david.laight.linux@gmail.com>
> 
> > kallsyms: Fix selftest startup delay
> >
> > The kallsym_selftest code clearly intends to sleep until initialisation
> > is complete in order to get more reproducable timings.
> >
> > Replace the schedule_timeout() calls with schedule_timeout_idle()
> > so that the thread actually sleeps.
> > Poll every second (not every 5) for SYSTEM_RUNNING and then wait
> > another 10 seconds before starting the tests, otherwise the tests
> > start as soon an init is executed.
> >
> > This code is in the initial 2022 import of the tests.
> >
> > Signed-off-by: David Laight <david.laight.linux@gmail.com>  
> 
> [Severity: Low]
> Since this fixes the broken schedule_timeout() call from the initial
> selftest import, should it include:
> 
>   Fixes: 30f3bb09778d ("kallsyms: Add self-test facility")
> 

