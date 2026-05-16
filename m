Received: from mail-pf1-f169.google.com (mail-pf1-f169.google.com [209.85.210.169])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 21C0538D3E0
	for <sashiko-reviews@lists.linux.dev>; Sat, 16 May 2026 23:50:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.210.169
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778975426; cv=pass; b=A+TKk8LRBgPuXbV8zE6tvwXquw+d5t0CqOvEZjmT2C4GX7BxRmfBVhoUwBEn5i9VuW6K5YAeczdYy6XIX1HoIDy+pVES2+RIdM0TGc7jTUqZgJ5y7LWhValb4t1a3Ze7T8BpiyToPO8l5GctpPj34sLUkZuAElHV4f5GCv2hMH4=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778975426; c=relaxed/simple;
	bh=Ls8MgqgcsH4l0RhCEuS7VvenDTm2U2W/j/zfAviF4qw=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=tuviai4UNgSMUqREVmMeitHyhRpdEOJcL7go3HRT983mqFheIrpNrIfRZCTDpyU3zSfcsac5ecucEWoYD+xGJj6AJD0LOSn51XQGnS3cUlKVQwV+pufukSpeV1PiXXiZE0FxofFezdhfxbk/ChtNIJtP3zgdsA0RFJK6qC0b18U=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=ffwIKxt5; arc=pass smtp.client-ip=209.85.210.169
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="ffwIKxt5"
Received: by mail-pf1-f169.google.com with SMTP id d2e1a72fcca58-824c9da9928so291241b3a.3
        for <sashiko-reviews@lists.linux.dev>; Sat, 16 May 2026 16:50:24 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1778975424; cv=none;
        d=google.com; s=arc-20240605;
        b=LmbepFpbEOTM+XdM4FReMX8M5RGHtV79aNV4fjwNPjj3zWpH7GKtDMgqZRsuTRJyF0
         sCvKZZtSYN3xWAAeTUgLJHyY1o0DigpzjhCLAcM9zoZ7Wzukpr3uBtsKt4fcr3u2tbSm
         eVvaZyuj0mVNIpTyWUKbznoYVZ9D7ONLWy0bSIecJcX2USNINTM9MLP3BXpUhLJyjEmG
         2G2N+A/6dmaVpYy/SEBoItKjH36KYex7T/Z45fF7T8StyEh35wJvBm55RtRVb88u+ukM
         kzFEuz+L9V504gEUQLkmJm4urjCKfG+uuJehmVsgGLNfbgckX4f//ElF9zFWQSERv582
         ZoYQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:dkim-signature;
        bh=aaUVd+PrR+MWOhU16AHCI1f+AVuqzEpKha/ErWOe6+g=;
        fh=clJjuPX1wp73EmI+aQ2kiO/nitl34gvpDqzRs0i0+c0=;
        b=GM0H8mPAM2Ku2ZCrtI7yCVBPCOc8jh1JVGusPGsXjiJ3tMxo7m60+4zw5zAswlgzgs
         NZ1ESuQm0bzVuEtCTE/48tJugZ4HzTTtAxuIDQFfprZbtidMcYqyeFUliv6DfR1nmdww
         Wa+kdeHzJj07wWuqwdPHAbZZg9oq9a702TLx43HTi6GO99uKMriH0Qs1NISpebXePyR9
         23LRsvKbLuhIfY1UZiObQB49BVlTNm/ecU+RonXcY0MrL5D4TrjaUW22Lw5+TSHi2V6c
         OPoW/DEPDu/bhrjzoqXfloL0ofurDeR3F8Yc6Jvo1j42ZFbG6x65NGFIIjq+HAcjz5OC
         iPCg==;
        darn=lists.linux.dev
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1778975424; x=1779580224; darn=lists.linux.dev;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=aaUVd+PrR+MWOhU16AHCI1f+AVuqzEpKha/ErWOe6+g=;
        b=ffwIKxt5Qft0xtG+YKmHIYH3TrDFuSfsA89d7Iz3+OZqUJd9wF41tLWQiQPQTdufcL
         oxPoLsg6i1plScgADhHbBqjBsAk4DTK+/O7TVU0iPSk3lOtQdwGWA9imp6GwcmpnWviD
         XS4Qy2TKHebxtOrpEBUH19WrOQ0Tr4So255kF1Y7g/m18ZUdetrWR2Uq0amROHslXSma
         ALRFf0hipwx0t0mxgxrxo1DECNdcWG7QuA3jVBW1Z4oXoh9vrAwyZR92J6FpL3rAX4Oq
         IJ0P5Pl/SKILpGioUlGR+4gaLm1PMHA3Xhrc8A2a/AXsPz02r2H5a0dtE/A8OVi70LBa
         X7OQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1778975424; x=1779580224;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=aaUVd+PrR+MWOhU16AHCI1f+AVuqzEpKha/ErWOe6+g=;
        b=BZVnLjmkG8Bpawy+Y6unTYBE8r2HOXe1HMjOaLi4ov05eGDVI6vU2fPPPSrGwKdMvY
         tX827Fbr1SmMHx4pVX1vZLzlQ3fQ6RcZFbT7/WOI7yWWmTb6t0zqiXGeEYNczG4I2EY/
         XPcCKUvBI9HDdkmji0u+qegTN9gsWs13HVX7ODmzKYXCGOFUJVVCqyDFrr0npYpRJcZ+
         9Esst2+iRAHJwNbVYmGw1V2l8eIICHYorM4jGM9qS/BG7V13cckTiwm6Miua4QjyjkTn
         5yPulHs2HX80z7Gk18BXNZxPq0U/CRM0Dgg4Ma167v3DtNlLu+2JApJHINlj/48dOD+K
         EeVw==
X-Gm-Message-State: AOJu0YxY4m+RyHs74oGe8XXGGxbk9i29UMuCWTNAaTDvhaYpzTZTKBKO
	2Y5hKQVexwRDZNvD0RgVANlOJkwAl/B3RhZJugSMotZref+6bBioCsaLMq/Lbu8bKUFltjI3XB+
	GAgGZJd//uEx+NtZtmJYMk/buVKJpCoFZiR6t
X-Gm-Gg: Acq92OGcjIc1GufhZRP/Q7rE9grYXv6mhIXeI+TLMTmGPT54SZ67H3A2coA+cGysGli
	wP3rOTESX0+F1hQ0PWFlaH8F4P2hW9g8KdnOm6wLBYH/F45fLvNNKfhvp/CebTxQ8S10q4XpTdN
	fBf+huMZazTNeUpod+R7sDrlhMvhORsmNwWpajmNJQYp1pX6lL/yHwMhKH93Amu83bJcYXs98PA
	mCGknXzgIc9VttFRdyZGS34pHhUXGO8aheNyTUcVbykt3jPJG9n8xlOTbwXFQwmbz6DOQDEobtr
	ur2a9po0jgFC91F6b+KtlznPc4S841aK65Rnar3D
X-Received: by 2002:a05:6a00:3928:b0:837:fe75:104e with SMTP id
 d2e1a72fcca58-83f33bae7d8mr10282417b3a.5.1778975424205; Sat, 16 May 2026
 16:50:24 -0700 (PDT)
Precedence: bulk
X-Mailing-List: sashiko-reviews@lists.linux.dev
List-Id: <sashiko-reviews.lists.linux.dev>
List-Subscribe: <mailto:sashiko-reviews+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:sashiko-reviews+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20260513105003.81880-1-phucduc.bui@gmail.com> <20260514043314.62222C2BCB7@smtp.kernel.org>
 <CAABR9nGhwtBu9Yhbn-BTD1Scykp2h6eQbtQtT13DcnekUdum1A@mail.gmail.com> <CAABR9nGZM3Bnb3DnObdp2nOJmW6ezmXqRSBtgS00Ps2ve4zsbg@mail.gmail.com>
In-Reply-To: <CAABR9nGZM3Bnb3DnObdp2nOJmW6ezmXqRSBtgS00Ps2ve4zsbg@mail.gmail.com>
From: Bui Duc Phuc <phucduc.bui@gmail.com>
Date: Sun, 17 May 2026 06:50:13 +0700
X-Gm-Features: AVHnY4IsUkQfn46YMLJeefxvMG0oEQBhPAdzpdl8m066r_PvU5WUFTx-_5lbq4I
Message-ID: <CAABR9nGsb_zvH1w6GFDqGFNCYjThCGuQ+RC91Bpkwu=h9ypcJg@mail.gmail.com>
Subject: Re: [PATCH] ASoC: sun4i-spdif: Use guard() for spin locks
To: sashiko-reviews@lists.linux.dev, Mark Brown <broonie@kernel.org>
Cc: linux-sunxi@lists.linux.dev, Liam Girdwood <lgirdwood@gmail.com>, 
	Jaroslav Kysela <perex@perex.cz>, Takashi Iwai <tiwai@suse.com>, Chen-Yu Tsai <wens@kernel.org>, 
	Jernej Skrabec <jernej.skrabec@gmail.com>, Samuel Holland <samuel@sholland.org>, 
	Marcus Cooper <codekipper@gmail.com>, Chen Ni <nichen@iscas.ac.cn>, linux-sound@vger.kernel.org, 
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"

Hi all

I would like to make a small correction to my previous email, and
also confirm one additional point before preparing another patch.

Correction:

> However, I also looked at a similar case in the
> micfil_rate_set() function from the fsl_micfil driver:
> https://elixir.bootlin.com/linux/v7.1-rc3/source/sound/soc/fsl/fsl_micfil.c

In my previous email, I referred to the function as
micfil_rate_set(), but the correct name is
micfil_range_set().

Additional point for confirmation:

Currently, in sun4i_spdif_runtime_suspend(), the clocks are
disabled in the following order:

clk_disable_unprepare(host->spdif_clk);
clk_disable_unprepare(host->apb_clk);

Meanwhile, in sun4i_spdif_runtime_resume(), the clocks are
enabled in this order:

clk_prepare_enable(host->spdif_clk);
ret = clk_prepare_enable(host->apb_clk);

I checked the binding documentation here:

https://elixir.bootlin.com/linux/v7.1-rc3/source/Documentation/devicetree/bindings/sound/allwinner,sun4i-a10-spdif.yaml

It describes the clocks as:

properties:
  clocks:
    items:
      - description: Bus Clock
      - description: Module Clock

  clock-names:
    items:
      - const: apb
      - const: spdif

From my understanding, apb_clk is the bus clock, while
spdif_clk is the module clock.

If that understanding is correct, then the suspend path seems
reasonable since the module clock is disabled before the bus
clock.

However, in the resume path, the module clock is currently
enabled before the bus clock. It may make more sense to enable
the bus clock first, followed by the module clock.

If my understanding is correct, I would like to prepare an
additional patch to reorder the clock enable sequence.

Please let me know if this interpretation makes sense.

Best Regard,
Phuc
