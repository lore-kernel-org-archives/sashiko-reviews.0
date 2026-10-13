Received: from mail-wm1-f42.google.com (mail-wm1-f42.google.com [209.85.128.42])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5EFE3489FD7
	for <sashiko-reviews@lists.linux.dev>; Tue, 13 Oct 2026 17:35:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.42
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791912910; cv=none; b=oZbND8J+9mnIv6xwAqsrLcgpW8BzojZ15F2nPDavZ97piMtXmvdys/7SZnAm0OWiNROj/6QPQwEA8jrd7V+gZtZb8ZDTa4UuN4RLWRAiRDwE7q4WWzjk2rpy7sMu/errxnImwLLXNCN5sTMOxnf2Ac6WiyYGyGSXC1714Wjsv6w=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791912910; c=relaxed/simple;
	bh=PqaAprE6zhOL8p22rLBYn5eJgHj6opqszjk2fOReKAQ=;
	h=MIME-Version:Content-Type:Subject:From:To:Cc:In-Reply-To:
	 References:Date:Message-Id; b=J2aR3VrFyjgqOTpnFBlxRHARvl3J1MYpzQ9WpJaNtZ5Z9M6ygqd8Ti2PBiu4wNxo2a6xnUIEjJk+zoXd2BAPPqMQ0a2DEI+CxAWM9Vi21fnFGj1Pi9wnGZW3aLs3pQ1GTKCtPh6fUEfP7HH8uJCn2yq+muzOP7XYJYpGtvZ6nzc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com; spf=pass smtp.mailfrom=baylibre.com; dkim=pass (2048-bit key) header.d=baylibre.com header.i=@baylibre.com header.b=U+2EnzOu; arc=none smtp.client-ip=209.85.128.42
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=baylibre.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=baylibre.com header.i=@baylibre.com header.b="U+2EnzOu"
Received: by mail-wm1-f42.google.com with SMTP id 5b1f17b1804b1-4a021c809e3so32141565e9.0
        for <sashiko-reviews@lists.linux.dev>; Tue, 13 Oct 2026 10:35:08 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre.com; s=google; t=1791912906; x=1792517706; darn=lists.linux.dev;
        h=message-id:date:references:in-reply-to:cc:to:from:subject
         :content-transfer-encoding:content-type:mime-version:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=XvXZ6HBIwKrdmh6LJViiFdMYKRVjXSvkOWi1JS6VLBw=;
        b=U+2EnzOuRUwmPn1evt4WAUVVmSZr6nGFpkla/5tk68teYKDXR6H37iGnc+5BNsukQ8
         8PQF54oQfj9+3MuVNMhPRT6ofx32k39bd6G+p0uYCZ+/Dwiw/+fbVKEMDV6zYyMn3/s3
         9kJP4eUTcVYuFD2W9Mn7ZIz2uyYBnW5d9DjMKbmMIjFikesvaQVIeTavHE6U3sm/+pgy
         6p3G/pxw2Iv/naoxfEtHw33VHvxmh4kvuESfQ+Q5I1/KJ8gvGUMeeWwI0r81KoicBYKU
         voqR9WnNXCSyC7qgu8iil0jDKDNxxpJFN+oDHlJN7cYqAmxpK7EOzhWAt8PL+13TcPWk
         udRA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791912906; x=1792517706;
        h=message-id:date:references:in-reply-to:cc:to:from:subject
         :content-transfer-encoding:content-type:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=XvXZ6HBIwKrdmh6LJViiFdMYKRVjXSvkOWi1JS6VLBw=;
        b=uN+vx7QCQ17XCojCgiyiOtjVJ0OH+HAOsGAxZBY5L5O0MvMZVgLp0CnpZ8/1Gku4wH
         9mAOemfjB9Go+Oxk/GY0zYnW21y5ehXkj1QRThq9Xd0PXPDiLzdvlcaJNYZDyDDqRdWv
         RZETaZyx7pthyTy0oCTEW/E48YpmQE0S29a1PnL4Jyy6K2s3W9sbG1IQXfbXlBVw0oeN
         bJa7FahFCEI18fJ4Oh8sFvQ/V3/j3tshGE2wrpJSe/DJtqVhgYnQvxY70Uz7CeThPUi9
         2rhyuZRAxDjCUp4vNQCG22Y5ke9ZVD+YNUEYw3OYqok1+i9JZgEyVFEAaS7pmg/r9OxA
         lZhA==
X-Forwarded-Encrypted: i=1; AKwUvBx1wgQVFfssic4Qx+HG0VSfJ2K1Ye7G+ODHjxR9jHPDlzqbVbWgGiyqRx0I2SrCitfTspSrh4aofa/0rE9qgAE=@lists.linux.dev
X-Gm-Message-State: AFq9FYJTWlgxCeDFSI4NZWtepawiTzWA0YHV4E3nJHAXu98PbBcxnpWD
	lFHXd9aZk3gEaHqOiZTgU2bh035YGjWNAaXf8Pmmb8MrHHUjesjiXzyU5itpYY2KMBXCt9MkW8I
	q0xsLY5I=
X-Gm-Gg: AYBFou3rdqP6SCnLJjjHopPiNYSXx99TKVFdYfCQelHurEoHcMlaaqwT6Hr8Cmk/Dyp
	2EO0loJRmgXD0cDG9ERw9xngTQkKz3rVLWdkBhm7IMvzpZWU26LZzqBc0H4uGlmGNzBJbVIPsax
	oF9WRKjVvhm8QJqywC/qVaukl8Egoir/w7pWBA2LqPzzC7oeM3B3fGWLkdYAiMo+92Ok5sGRPz/
	AHbVIMoBR4BTZ2i3YhbfUJp/yGR1Qn3wIrr07EF20en6tDtAwkzg1CiXUbCjP+Jnmf4KTGivjDy
	GEDAlpMg7V0V7Bg9Y3NMM3RhxsSUF1vUwLq8IjqdTI1LPRQLe+36xbzsW9l69yOAOW/Y5hpV1O3
	bfrZ2fD8j2ILWCliobHMTOnfNARYEvTzOyIpeb5fipCYKu/FitHy6SCtolgH3VcIkAhM8sA7aZx
	aFXcztUZvSkm7GZ8+FXkzqkIyiHYcbfjs8jeFz4ABR76O2qTR7s9vHUbxBEmdf0svzcXAOyKN5/
	03yW1E+EgqKt+1pdUsgCSCHI2/M
X-Received: by 2002:a05:600c:e556:10b0:4a1:93fd:8f2 with SMTP id 5b1f17b1804b1-4a193fd0a16mr140466375e9.6.1791912906474;
        Tue, 13 Oct 2026 10:35:06 -0700 (PDT)
Received: from localhost (82-67-6-57.subs.proxad.net. [82.67.6.57])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4a18bf2343asm684245515e9.9.2026.10.13.10.35.05
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 13 Oct 2026 10:35:05 -0700 (PDT)
Precedence: bulk
X-Mailing-List: sashiko-reviews@lists.linux.dev
List-Id: <sashiko-reviews.lists.linux.dev>
List-Subscribe: <mailto:sashiko-reviews+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:sashiko-reviews+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Subject: Re: [PATCH v8 3/7] clk: nuvoton: ma35d1: Retrieve HXT/LXT from DT
 when possible
From: Jerome Brunet <jbrunet@baylibre.com>
To: Miquel Raynal <miquel.raynal@bootlin.com>
Cc: Jerome Brunet <jbrunet@baylibre.com>, sashiko-bot@kernel.org, 
 sashiko-reviews@lists.linux.dev, conor+dt@kernel.org, 
 linux-clk@vger.kernel.org, devicetree@vger.kernel.org, robh@kernel.org
In-Reply-To: <87fqy9v82c.fsf@bootlin.com>
References: <20261004-perso-ma35d1-upstream-clk-v8-0-e1a106a128c0@bootlin.com>
 <20261004-perso-ma35d1-upstream-clk-v8-3-e1a106a128c0@bootlin.com>
 <20261004205903.E62F91F000FF@smtp.kernel.org> <875wzhjhe6.fsf@bootlin.com>
 <1jmrss7byt.fsf@starbuckisacylon.baylibre.com>
 <87fqy9v82c.fsf@bootlin.com>
Date: Tue, 13 Oct 2026 19:35:04 +0200
Message-Id: <179191290452.266355.16355634952216272745.b4-reply@b4>
X-Mailer: b4 0.17-dev
X-Developer-Signature: v=1; a=openpgp-sha256; l=2308; i=jbrunet@baylibre.com;
 h=from:subject:message-id; bh=PqaAprE6zhOL8p22rLBYn5eJgHj6opqszjk2fOReKAQ=;
 b=owGbwMvMwCW2VtK+WnvWU3HG02pJDFnnsk9M2LU0baczm61fbMG91GMrv1geYA09+f3eywDbx
 X9miKc2dpSyMIhxMciKKbLUcFeLv5PU+jJrus5tmDmsTCBDGLg4BWAiJvmMDL9US31uKJx48rTj
 Tr1oeNhpBvlLn0SD1ANYbrnab2W408Pwv0T0g0rGeTk/SeEuic5eEZOX+Q18pw4oJwnf0Tau0tj
 DCwA=
X-Developer-Key: i=jbrunet@baylibre.com; a=openpgp;
 fpr=F29F26CF27BAE1A9719AE6BDC3C92AAF3E60AED9

On 2026-10-13 19:12 +0200, Miquel Raynal wrote:
> Hi Jerome,
> 
> >>>> -	hws[HXT] = ma35d1_clk_fixed("hxt", 24000000);
> >>>
> >>> [Severity: Critical]
> >>> Does this unconditional removal break ABI compatibility with older device
> >>> trees?
> >>>
> >>> Because HXT (index 0) is exported as a public ABI in the DT bindings,
> >>> removing its explicit registration leaves hws[HXT] as NULL in the provider's
> >>> clock array. If an existing downstream or older device tree consumer explicitly
> >>> references this clock via clocks = <&clk HXT>, won't the provider's
> >>> of_clk_hw_onecell_get() fail to resolve the clock and return an error?
> >>
> >> Jerome, your wisdom matters here :-) For me this is a false positive,
> >> because nobody outside this driver should access hws[HXT] and the clock
> >> is still referenced through the DT, just not provided by this
> >> driver. For me this is not an issue we should consider, let me know
> >> otherwise.
> >
> > Strictly speaking there is (used to be) a clock at this index so it is
> > not a false positive. Someone crazy enough could have gone through here
> > to get the OSC even if does not make a lot of sense.
> >
> > This clock should never have existed to start with but it got in the
> > bindings ... and that is the pain of dealing with bad bindings :/
> >
> > You've got 2 options:
> > * Removing the ID from the bindings explaining clearly that it conflicts
> >   with the fact this clock is actually an input according to the same
> >   bindings. I suspect the DT maintainers won't like this much ...
> >
> > * Keep the bad support binding in the driver: You'll need a pass-through
> >   clock element where the parent data is the fw_name and a fallback to
> >   an `hxt-fake-internal' fixed clock. Feel free to add a comment
> >   explaining how bad it is to use that clock and what user should be
> >   doing instead.
> 
> Too bad. I am pretty sure nobody ever used that yet (since it is both
> very recent and fundamentally broken) but okay, I'll keep registering a
> dummy fixed clock there in case anybody ever cares about that lookup.

Maybe I'm a bit too cautious with this. If you get the DT folks to ack
the removal of the ID, I'm fine with you dropping the workaround.

-- 
Jerome

