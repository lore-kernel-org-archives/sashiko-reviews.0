Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.128.51
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794983739;
	b=HCf5Z6zEwWvELsPmKPpxtejklKiOE+rqBn/vOjiD+KcAIJj2JSZmECpmdp8gRXZuLt5f
	 cYmmDVnpdzhtTzraiFpguHxKtpr6LhybaAaqulMZWzMLR3NGwblbRzZ7OeVO4sm1FzQbD
	 myf4yxv3Y4nuzh1S/q4LiIq8TRanNo9G0ji+8Mgb8z3LuJyLPjBSfsWxcWlyaf0kwsZl8
	 NkH0c+dwfVhrLLq9Q4np7lKhz3OSl6/fFnVrLoyXwic1GDvTZrQUaPOUv+1epKhc/or9O
	 x0wojjVpWY4pZbgsWW39/IlSldt3UbENazOSnMpTY1AYO4CTTOlxkkw1SZ41Rt5z9hg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794983739;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:Received:From:To:Cc:Subject:
	 Date:Message-ID:X-Mailer:In-Reply-To:References:MIME-Version:
	 Content-Transfer-Encoding;
	bh=RLInY9Pas2VGdZHhoGedVfli2rsw8GnKGiuTBZLrurs=;
	b=PfJuMqQxBWhv2GaqayewA+WXvld40MzdEfajQWXF7pSyIcKEtN/urGN0CdzzxipWAyBQ
	 2YEq0+2ro/mjS/6nLk9D0WRlQcuKMGwoW/F4RIKLb6RU6R4lpVg2V+yiTsztZJiXwdG4P
	 K971jn2WSPnm9wtxUi62vz8K6A7BAbcbpndHJzgQveKK47DG2xUquX4YXv0Bk6u1azKCW
	 9ABHP84fdM8/SIy0ChcU60jAS9nX3d8rjEoOIplz6dB2H9Z2xD76r2zmDEDYai+Byg6uO
	 yztCMfJFA0xX9WtOzmInlW78/pjxZSC6TUPcEkm1KDmsXJvneVgS7XyDCreuMUNMQHQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=CswlLiiU;
	arc=none smtp.remote-ip=209.85.128.51
Received: from mail-wm1-f51.google.com (mail-wm1-f51.google.com [209.85.128.51])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 39E14606A325
	for <sashiko-reviews@lists.linux.dev>; Wed, 18 Nov 2026 06:35:39 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 39E14606A325
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=CswlLiiU
Received: by mail-wm1-f51.google.com with SMTP id 5b1f17b1804b1-4a5b2be99a8so5403725e9.2
        for <sashiko-reviews@lists.linux.dev>; Tue, 17 Nov 2026 22:35:38 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794983737; x=1795588537; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=RLInY9Pas2VGdZHhoGedVfli2rsw8GnKGiuTBZLrurs=;
        b=CswlLiiUKTsSdKPQh/Ff+T/BO/KS4U8SCZwEYehqEziOFSy6fc6hglBk6vtAPnbAiq
         nUhR/JSuVOs8LU6KA7gTNTPtczOilgB6Zt/MkgNl5U6Z/XxPSZTjKkrS1GHYn9qFBShD
         Y5gJFIWwzClPoBqw93yCydcSf+PpDHbE/YMuxu8YBKkL8R/exAOvqyE8qZcJxpZF2O85
         0K4TpDxXTHhN5YbvRBOqxaY6u41MOc544TiOA9EAjnJhmd3+dFFY2MVg8yKvJUgjXH3C
         BeZJTusWSyW4cx0NmM5OVVEBO/GsLFEIdsvkTq3IKa7Y7zSb3dHcQhe2ETf43sKo7bcD
         1sOg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794983737; x=1795588537;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=RLInY9Pas2VGdZHhoGedVfli2rsw8GnKGiuTBZLrurs=;
        b=cjsOGPJa5Ju+QiEH2zcDzb0Jh6yRIdZrhBxfKr4TFCFSiTSNjgSIEACHsbxKqQfS8u
         fnnlJk0QdF7P5QI8ZtXv4DKfrUjn3TZzuNeyWnQljLdocjQAPG1LpH5SaD42nVeOrbIj
         M+pkTIIaOoknZ6GjCWdZ/OZAKJBAnrab4dnQBFg2XpQ8ua1eUD6nqZap8ONBUbe/LS4u
         GvWBFR5L9LCXEymcJci/uGTtMnnOzTKeZBS9zuAy6FNLHECU+wHTIRJlDpDo9rusSz1C
         IeO9tncZwoq90wavGYSJGR3kMxQ430ZLecBAT8U5hb5Z01px9FGMuQ1H1QruKubThyRz
         z1bA==
X-Gm-Message-State: APuU4Z/OTqt+xq2l8xvUA+viGFIKd1kIM5N3uvyYyXoSlo0GE3kMf8sa
	ocSYCokDh35q8Ro4YAt0MduM7jTdIKiKmuTPel04gtzaR0Z+lTqx1octF7f3Pz0vH+U=
X-Gm-Gg: AYBFou3bn+iFqIhdgDWP0rY9n+KXJ/sfucltQZr4HzqyNRiLg1d2ju2cX1DRSIzNodI
	fhxYh4kddzsfAgJOYUNRIeJBtSkYkO2OldWhUMsrkx4uT/JpbNyxxHF6Bf5k7c5vWKBZXWAgDy8
	9DV+b8twPhcjne1Q7DiWiI4kcR4rzd8ircLqVxfvSINJKWUgbSd4K849SSwYzGfGIX+WcrKFkK0
	RN4F5HBeQzZJULpKjD07dOuqFw75AwWDmrS2jQzMyVfqhi15sWWfVJklJRp3F86duKPR/NyTk5N
	fxe7G98Rh+uW1pYKQ7qyUw1oK9l4pD7AYUV++c6hZELHiTGeuITqUWua/4WBYyMuGxQqoHKyPbK
	Ms770No8oPVnzekKsJqw9yJyXcKodmBeaN8AoZVvrMSfbxhsAhGcwFtdU/lfVCADPwxH0zwNY5f
	v+5KcYEIO1m8h1WkXwxc02a9DM/NVgrQMBM3PNlPEdSeR000NsxAgHcjFNopgBZ+Y/UqbsekWjP
	7BZPIRMh+CL61i+K2rPYhjvMB3BwRjQc2kFunVpv2EgJDxkAj3YkEaje5UQ8HdEY5yaVOZcnyE4
	X+peVDTlL4hCeeKMQW2+YwkoUWDTgwl5OP9CSuwgh7jAZMB8ow/mfoa3RA+c2FREZprYJ4u+Lwn
	PZcCOmJCakDc6tSCzsk50vNeIjVgqL7YHnK6xXPSN0mPHnpg=
X-Received: by 2002:a05:600c:8b02:b0:4bb:6752:8400 with SMTP id 5b1f17b1804b1-4bb7da1b48dmr25981005e9.17.1794983737429;
        Tue, 17 Nov 2026 22:35:37 -0800 (PST)
Received: from center.jhjvjihww5qejoy14qwv1cc4td.frax.internal.cloudapp.net ([131.189.143.225])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-4a65560ab70sm3069822f8f.30.2026.11.17.22.35.36
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 17 Nov 2026 22:35:36 -0800 (PST)
From: Orgad Shaneh <orgads@gmail.com>
To: sashiko-reviews@lists.linux.dev
Cc: miquel.raynal@bootlin.com,
	richard@nod.at,
	vigneshr@ti.com,
	tsbogend@alpha.franken.de,
	linux-mtd@lists.infradead.org,
	linusw@kernel.org,
	kaloz@kernel.org,
	ulli.kroll@googlemail.com,
	john@phrozen.org,
	nico@fluxnic.net,
	dwmw2@infradead.org,
	corbet@lwn.net
Subject: Re: [PATCH v4 4/4] MIPS: Octeon: flash: use the simple map accessors without a shared eMMC
Date: Wed, 18 Nov 2026 06:35:35 +0000
Message-ID: <20261118063535.4001217-1-orgads@gmail.com>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <sashiko-outbox-219726@kernel.org>
References: <20261117214141.3826637-1-orgads@gmail.com> <20261117214141.3826637-5-orgads@gmail.com> <sashiko-outbox-219726@kernel.org>
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

> Does calling simple_map_init(map) break mtd_point() on little-endian
> Octeon kernels (CONFIG_CPU_LITTLE_ENDIAN=y)?

It does. memcpy_fromio() stays correct there (unswizzled 64-bit reads,
swizzled byte reads), but loads through a pointed address get no
swizzle. v5 keeps the semaphore accessors on little-endian kernels.

Miquel, Richard, Vignesh: please don't apply v4; v5 with these three
fixes follows in a few days.
