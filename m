Received: from mail-wr1-f54.google.com (mail-wr1-f54.google.com [209.85.221.54])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BB2E836F8EF
	for <sashiko-reviews@lists.linux.dev>; Mon, 27 Jul 2026 08:47:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.54
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785142065; cv=none; b=VWW8eLZEFN0s+SDauepDkb6ZVQIzcNbDupD72FtHN4PFrl2L9r891iNs5j7kcUTm2/NuVt+OKdMLviBy2fmbPcS4Bydr595L53LlrZhJbYEdA1sltQEsDGHgddWRVW5W7IG29IrEb33C8NWHft1s8jG/12eaYMKNCvu+p/z3Ny0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785142065; c=relaxed/simple;
	bh=moCHXPjBifjRwI8AZil1TQ63ij5HQhScpZjsf2BD6zs=;
	h=Mime-Version:Content-Type:Date:Message-Id:Cc:To:From:Subject:
	 References:In-Reply-To; b=lKzIHUI1WiWH989a4ALwohFqIMLwPB4tpAynk+eij3jbKH2b6rVrFrQSPLJNZqA5c64rqM0H3qqmHGKWpe+GepgdjbPJ68RJYaVTzpRk25KSKBbdUGBwZzZfQpOrp1Bq9esnuIiwYAeRdxHmowrHk2uAYRLflXMqTrgFPeD+2DU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com; spf=pass smtp.mailfrom=baylibre.com; dkim=pass (2048-bit key) header.d=baylibre.com header.i=@baylibre.com header.b=WAPDLLPR; arc=none smtp.client-ip=209.85.221.54
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=baylibre.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=baylibre.com header.i=@baylibre.com header.b="WAPDLLPR"
Received: by mail-wr1-f54.google.com with SMTP id ffacd0b85a97d-4758bd3731bso1760367f8f.0
        for <sashiko-reviews@lists.linux.dev>; Mon, 27 Jul 2026 01:47:43 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre.com; s=google; t=1785142062; x=1785746862; darn=lists.linux.dev;
        h=in-reply-to:references:subject:from:to:cc:message-id:date
         :content-type:content-transfer-encoding:mime-version:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=moCHXPjBifjRwI8AZil1TQ63ij5HQhScpZjsf2BD6zs=;
        b=WAPDLLPRpbsbl86ztD7rcMK+Si0nscSvmbY32DpD5v7MDABxA31HADkRm2iRJx4+Xy
         PheBUZ/DjpMEYjHjrSJED3UqmTuaOTzVhzlmP65i/47yJsHlmdKD5XAiHuF0ZhhYtYcy
         CSFHF9YH5MZpAAqbllDoltCTVQBFrFVkLoEN1p37vEZeRg2T/V6UYedU/hCxdyiyvJnE
         gBWIImEgzvlPw0JFvEcTKiNnQrH3X7YI9gg3PZHo14J8WO0dbSz74D19t2YXha14aVgE
         GyaRxOUorP+SwOnX56LlUbTHDRHDT34mEQ8lcCl9KCFikGsweVrTwgY+nkEEOpgraqIq
         Zjkg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1785142062; x=1785746862;
        h=in-reply-to:references:subject:from:to:cc:message-id:date
         :content-type:content-transfer-encoding:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=moCHXPjBifjRwI8AZil1TQ63ij5HQhScpZjsf2BD6zs=;
        b=Ll+XW79RXl+vv+vrK34stkSoYjYbQ700w+yM4dANlNUrDG98tlQY/Uun3es1wKtTdT
         E5YSkGguQDt3GkH4HTrV8GefAzFXboektVMlv/8xlPzb8LElHzhgn7My66L0UogZTuI3
         aAAgdeACuASJNOcm7MlMUYxauPnXrRz0ZOpnFEcR8EYj0ixNW/4oarL/sbIVZJKEcQwU
         U1lUx7Esa0jcsPRxixiK3K5koCNL697l2BLy6mqQ5AJ4Ro/3Hnh8Xr/U3Spjr8942Bbt
         yd6FF4uRMNU8IOc6RWfNaohrOqKSn23/5+T28Hcz0yiI4OM9RnB0gdxIj1L3E9H9UAaM
         X8eg==
X-Gm-Message-State: AOJu0YxqbYEiC8Ql/bOJQq9RJ7A1pvIRta7+TOrxf1wHRQZdIWJ/zdKk
	9Qt7GznRRMG4KC2H9xUYdb6BmOrT8MuzOxRsvkCA5+TpzmSJsbqT3wNniYpGo+/u/k9jd3QhEw3
	oQyAteQcgDg==
X-Gm-Gg: AR+sD10f3MeG2VGDPBHsGt7/cFi5wh1fH3OjQr6cIcdysKKB9vuhSESEXoik+etyaUT
	r/cEXFRNpXiXE7oMG3hWRATj5V2pY3RLF4a+7/nkxYE05PMQ8lStRXmT9/cBTsPixgpUsRXcY8V
	4xdAOHSa+e+tXA4YqwsQmpJvQPqAA7KO0qYsnE4OqcH+RnwZv3rAKHOWvT3EH2KhGCgatWx5Aqg
	HRjJx5g/v9hLahDbjZsXApcPAGJgfi71r9c61/PbE0eWdr7XVDkLk3iUhamBJxHewVUptT6KTSx
	Y3PNlBiIQ/jvnvtyNTWSqIbihKb+jvZInJMq6eWsY3OrebWfqKpL6/2UNGlTWqrHUhkTRI6Kfdg
	HskdMhW1aGD+AzeeF2XgH1oSE5Guv6hdiSikZXfAuZlBEeRw0mdS4KF+R1HcH4qO04UsT/PS9nM
	pXbn4cVSrBFw8jJwdNL++zrfK0+ma/Ve41udDaMITE0z8PjYiMmvRfR+I608fIuUwyqmY=
X-Received: by 2002:a5d:588e:0:b0:47f:8eb0:c825 with SMTP id ffacd0b85a97d-47f9febcb6cmr9142398f8f.24.1785142062038;
        Mon, 27 Jul 2026 01:47:42 -0700 (PDT)
Received: from localhost (host-87-0-90-136.retail.telecomitalia.it. [87.0.90.136])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-47f85c52fc0sm47215173f8f.23.2026.07.27.01.47.41
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 27 Jul 2026 01:47:41 -0700 (PDT)
Precedence: bulk
X-Mailing-List: sashiko-reviews@lists.linux.dev
List-Id: <sashiko-reviews.lists.linux.dev>
List-Subscribe: <mailto:sashiko-reviews+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:sashiko-reviews+unsubscribe@lists.linux.dev>
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Mon, 27 Jul 2026 10:47:40 +0200
Message-Id: <DK981PFQXYCO.29SKQ2BT5EOPQ@baylibre.com>
Cc: <conor+dt@kernel.org>, <devicetree@vger.kernel.org>, <robh@kernel.org>
To: <sashiko-reviews@lists.linux.dev>, "Carlo Caione" <ccaione@baylibre.com>
From: "Carlo Caione" <ccaione@baylibre.com>
Subject: Re: [PATCH v3] of/address: Fix NULL bus dereference in
 of_pci_range_parser_one()
X-Mailer: aerc 0.21.0
References: <20260727-of-range-parser-null-bus-v3-1-be01b708a4ce@baylibre.com> <20260727084613.6905B1F000E9@smtp.kernel.org>
In-Reply-To: <20260727084613.6905B1F000E9@smtp.kernel.org>

On Mon Jul 27, 2026 at 10:46 AM CEST, sashiko-bot wrote:
> Thank you for your contribution! Sashiko AI review found 1 potential issu=
e(s) to consider:
>
> Pre-existing issues:
> - [High] An integer overflow in the calculation of `np` (`np =3D parser->=
pna + na + ns`) can be triggered by a maliciously crafted Device Tree with =
a large positive `#size-cells` value (e.g., `0x7FFFFFFE`). This results in =
a negative `np` which bypasses the bounds check `parser->range + np > parse=
r->end`.

[...]
> [Severity: High]
> This isn't a bug introduced by this patch, but can this integer calculati=
on
> overflow?

Not going to endless-ly fix pre-existing issues.

--
Carlo Caione
