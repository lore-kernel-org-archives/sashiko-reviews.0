Received: from mail-wm1-f46.google.com (mail-wm1-f46.google.com [209.85.128.46])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4696B394797
	for <sashiko-reviews@lists.linux.dev>; Sat, 17 Oct 2026 14:53:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.46
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1792248793; cv=none; b=hFpQgeBsjNFxhyYBDgLE4deecTABPaIQ/Sb2+Hli7FLXwRvRTddy7p3L2xh9FWPNqFqDnILpEyY3r5QV/zSCat9Sxu4yINA69vGCcp6pWSlJpZ77Y6JIUmwHC/B/sgnnYZon2Qjdlt8aZYAo/r2ZPxmp2PuRcMNAT5E9BvxLBHY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1792248793; c=relaxed/simple;
	bh=Fvka/I8Qk9HOFH62SbLDTdQOv+/n4Lr6xbNErwQYZ88=;
	h=MIME-Version:Content-Type:Subject:From:To:Cc:In-Reply-To:
	 References:Date:Message-Id; b=S3/rX6XUIZLNUhddkUI78dis751BiihQvNtkYRI+Uy8YPDDbY+p+WhWPmklzPZ0UoqKiYjaS0xeBoAEHS/jL1RaApakro2UXf25wkTIsYUfaFvmXEviYTMkb0NwhdwIgtvupc1xDZf+9IGxrQQoLhgChcblvAqVU2fbCdh9p8XY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com; spf=pass smtp.mailfrom=baylibre.com; dkim=pass (2048-bit key) header.d=baylibre.com header.i=@baylibre.com header.b=K+IVm1Yx; arc=none smtp.client-ip=209.85.128.46
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=baylibre.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=baylibre.com header.i=@baylibre.com header.b="K+IVm1Yx"
Received: by mail-wm1-f46.google.com with SMTP id 5b1f17b1804b1-4a180fbeef5so6235755e9.1
        for <sashiko-reviews@lists.linux.dev>; Sat, 17 Oct 2026 07:53:11 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre.com; s=google; t=1792248789; x=1792853589; darn=lists.linux.dev;
        h=message-id:date:references:in-reply-to:cc:to:from:subject
         :content-transfer-encoding:content-type:mime-version:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=+66VnjPF/YyVU7Vru1kQeXTRwhm4W1VNOEJvI0QSylg=;
        b=K+IVm1Yx9EXK/HK8fG+yXLEcF2a5SKT2ievpvKmUmz/0hHqIG+r5LFJ94hCD/eUaJ7
         j+27JtGvvHa9psvg4GkMLfxuBNycFtM2fIDozyFsMDpoa5PXbhRFIU87yI9E9vRlZdAf
         QG1rOPLDu//I6gNM7L4fBgxmo83SL9IMe4BiKt+a0THRefwcS6I+cM792CWM0JskEJKv
         PL5UT8CJDn3I8p5746JONeUBxnewGkhz8eqEHS5UrUxNPOpQmwm2UNI9ME4T6wkR38oz
         U9s9AzqRE6elpqf2rC1r8WtWbfbU29ox5APkPyg0zhSF0inig0+t/E0Vbf7RnLiBIsGB
         EhlA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792248789; x=1792853589;
        h=message-id:date:references:in-reply-to:cc:to:from:subject
         :content-transfer-encoding:content-type:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=+66VnjPF/YyVU7Vru1kQeXTRwhm4W1VNOEJvI0QSylg=;
        b=EbOrkqx/77Xum5nnY21Ef6S7H20GpJNa8ZBZKQyBrEDKuirFWs9w9ee5VUXN8r4j3F
         Ry/YtjdzJ/F135M9W4Al7b3Tu7NRjbat/1MD/2pfNGrWTEpcHHiAWnaIEgtcGkspXA9E
         OXjtnhWfQShc0f7CJEugHPOHhEEd7t0jiQPvw/5yd1NTudLq2dMzhJs+mcuS/8iYuNwq
         or4VhbWnZpk3deKeNWJbUv+eHlHdf5xT820JPxAlnXGoqOi4bAotYYIuIh5QCeJ1OEbv
         QsU2+F6mCmd54qz0efAGT/r0HRlFIB1za8flsdR9SzVHGI1VxljbpQJDSn0/tmofRgCP
         tVMg==
X-Forwarded-Encrypted: i=1; AKwUvBxZOHso7mRytW+tHaV+/eKGKG+45R213PsO0Ged0lfMZFn+6ei78nofj881bQo2p/844F781H4wWNhRn4Ih5RA=@lists.linux.dev
X-Gm-Message-State: AFq9FYKsPhqc5GIvZO3uyaqo4ForEVj641heu1iOzZHjCYNPiwLxSBMu
	fl6ky/MNqZ+cbvxIJkf7vPe6WVYtiwCDvEN31axWj49kWeq14jZvj5w1zPW4C6cxihQ=
X-Gm-Gg: AYBFou05MYy+vOzQwflrMzzWDIKuXQ5z0oq7RtVr3e70kGXSVshllZWylVZwNY4+Prv
	v+W4jMc/4xTZUoibbKQ8Se40KlzGGSMvG5jE0rkWYagKJZzYudqC8vfqv1+11YBeH4PDt6rb2mj
	fkKyMWbNjM1tsVI3nLj1F5FBJs8INPTSWbHagdpqMbeWZ6KU4vKFKCDvqMGefDPdDOSM3zHKzvL
	qTsQ6moQ/wNSlpeay0f3dwyEFR0DH/bXT2XKgV9ZJscjgx5ADFPmhv0aafs1g6HO4rfJ5dvyWu9
	b1l0KC+Q9fSiGn3GTj+BHeBwHUzcJpRpkd2PkTfstDTuOIWnFocgmIv1GW6VDZyVMcjRsUTPd7v
	s7ZS0MfC2EzmpjQLxvtk9gmG8/FdccCrHTO/s4oJhF+A0bEV9l5eUrUyEotZVwiig02AmwOj2uN
	Q6KGcO7+T7HlwS5oDP/GBTyDSFEZ552h0S8Q6kwuVMTe54rjXmFJEUChKEcDip7IjFhY5yHDHF8
	1XMFjgoAEtAHEPfxQ==
X-Received: by 2002:a05:600c:81c8:b0:4a1:9661:14b5 with SMTP id 5b1f17b1804b1-4a1d7616576mr55179145e9.29.1792248789113;
        Sat, 17 Oct 2026 07:53:09 -0700 (PDT)
Received: from localhost (82-67-6-57.subs.proxad.net. [82.67.6.57])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4a1cbedb6f7sm148500265e9.2.2026.10.17.07.53.08
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 17 Oct 2026 07:53:08 -0700 (PDT)
Precedence: bulk
X-Mailing-List: sashiko-reviews@lists.linux.dev
List-Id: <sashiko-reviews.lists.linux.dev>
List-Subscribe: <mailto:sashiko-reviews+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:sashiko-reviews+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Subject: Re: [PATCH v10 04/10] clk: nuvoton: ma35d1: Reparent the gates
 correctly
From: Jerome Brunet <jbrunet@baylibre.com>
To: Miquel Raynal <miquel.raynal@bootlin.com>
Cc: sashiko-bot@kernel.org, sashiko-reviews@lists.linux.dev, 
 linux-clk@vger.kernel.org, devicetree@vger.kernel.org, robh@kernel.org, 
 conor+dt@kernel.org
In-Reply-To: <877bjivrf5.fsf@bootlin.com>
References: <20261015-perso-ma35d1-upstream-clk-v10-0-47c97b54a809@bootlin.com>
 <20261015-perso-ma35d1-upstream-clk-v10-4-47c97b54a809@bootlin.com>
 <sashiko-outbox-173157@kernel.org> <877bjivrf5.fsf@bootlin.com>
Date: Sat, 17 Oct 2026 16:53:07 +0200
Message-Id: <179224878757.859276.836775392883899374.b4-reply@b4>
X-Mailer: b4 0.17-dev
X-Developer-Signature: v=1; a=openpgp-sha256; l=909; i=jbrunet@baylibre.com;
 h=from:subject:message-id; bh=Fvka/I8Qk9HOFH62SbLDTdQOv+/n4Lr6xbNErwQYZ88=;
 b=kA0DAAoWrRk/eyua5RcByyZiAGrTi9PIr3jXzkL3hPmoR9xxFK/1/LlW3qSqHNJrkRmkyxJ0Q
 4h1BAAWCgAdFiEEfAt7F+4ZKvSalyzbrRk/eyua5RcFAmrTi9MACgkQrRk/eyua5RdugwD/XtK0
 ki15jlcgtzwga2FiiBGlGPxqB3vuFhbG5OxU+zMA/27a5Sk09wWvbJM3JiKm9WZLUwkc6mDyoYu
 dFvDeCKsB
X-Developer-Key: i=jbrunet@baylibre.com; a=openpgp;
 fpr=F29F26CF27BAE1A9719AE6BDC3C92AAF3E60AED9

On 2026-10-15 18:50:54+02:00, Miquel Raynal wrote:
> > Thank you for your contribution! Sashiko AI review found 1 potential issue(s) to consider:
> > - [Medium] clk: nuvoton: CCAP muxes registered with 1-bit width but 4
> > parents
> 
> This is a pre-existing issue. I will wait for the maintainers to comment
> on the rest of the series. If they ask for other changes, I'll include
> this to the next revision. If not, I will send a dedicated patch for it.

It is too late for cycle for this cycle and I'll wait for rc1.

Best would be sent the next versions without the DT stuff, so we can apply
the series using the cover as merge description . It makes it easier for
us to then provide an immutable branch, should you need it for the DT side.

You can fold pre-existing issue fixups in your series if you want to,
or you can send follow-ups later. Fine with me either way.

-- 
Jerome

