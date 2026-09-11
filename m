Received: from mail-wr1-f54.google.com (mail-wr1-f54.google.com [209.85.221.54])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F0773298CAF
	for <sashiko-reviews@lists.linux.dev>; Fri, 11 Sep 2026 11:30:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.221.54
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789126261; cv=pass; b=D9adbEAyw8hgKDgJn83Nh3mZauMcOUdft4L7Wz7pqEpgAyqIOjMyXYub+1gavyHIk0rXRzRmRjnYJEG/UvEGoh00cPtsCu46yZv6r+y0Gc7MlA2r2oRsG1QzOhXzi8UK9KBB2HldBI/NVz4oGt47bHXIPPKwxueXKAiy2d8Ks+Q=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789126261; c=relaxed/simple;
	bh=8oBNrn73qh+O/Q5uT6gV+BncjX+bawSkeldQVubHZBU=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=Sbz1VB68eqQljnA2WlQNpDgKQSLhDS9GDZ63cOm+ALFycPghwpT7OUiV2fwbEFohd0nw840kRFGpTCm0lnIbESQokPJCyqePOrowlQlc/vkFHQO6kOQ0gu1boCy9jpS0LRcOtjIjWe2g6N3CqDkYkEezEBTk+DhhFO/XC8rQBts=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=DRvdELUJ; arc=pass smtp.client-ip=209.85.221.54
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="DRvdELUJ"
Received: by mail-wr1-f54.google.com with SMTP id ffacd0b85a97d-486e934b0c9so244331f8f.2
        for <sashiko-reviews@lists.linux.dev>; Fri, 11 Sep 2026 04:30:53 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1789126250; cv=none;
        d=google.com; s=arc-20260327;
        b=oL6X8ii56C6hSY38Xq4hpBSSa7ylTP35weM8GtwrHLGedir+8DOKH37MSwY8KGm7iC
         9w94QwSR3HLAqn8PZ/E4ey1wIhBV20aa1fGYB7WbBBS+4EloOZ1yHuZ8YQ7NOttsMnZu
         cmRllm2wOAGSU5deRXwV+MQ26dp1M/d2LdRUJTvGYERX/+ddoRZHZzYGqq5sPz80yz7B
         nSE0CtK9xwzs+n/cJ8CThYzG6XKNkgXPvoFQ2u2/lHLRxEvutXpQksF7zpfbkfSCPm3p
         blVnlBGsxneekB0wDgsnKjLhsCzsPaMAoQ78jijpeSOvUYJ2bGZ2ErY0n8ac2nY56Mea
         PAOg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=EeNgemAb7lsaMF3mg8j+vPdtgIOxXFzORulJF8ZPymc=;
        fh=+F14bOWQxS5MgDtf7mpFT6gjA360FyLL7QkzK9DDYsQ=;
        b=rR9qXfDXMG8dBt/AHwtB+t+xpblKP2czD0zW8rO8+9KOPznhHjcjl5O33pFh8l8cuY
         uMHztTHN77LP/Dcb3IphA8UL8iTfM77uj5MFfxJfQ2a1J8UE4qZVr5lsq1/z1ZFvVhEx
         Aw/Bx7F+0LZOHyWyoDphj0CA9wLrSW1GYPtSFOtlEzumj2HtvAmBEa8OeGC4QpsJ6EHp
         FmeoS9/X5kdBei7kDZyIHskp8+FXBBfDgDlwz10y7FTaZjrCoEdKgfgIOpqEiFF+lWko
         Fwn2cySZRJyJxRgTYGJ/GfnEJobvg8vbK0J3YktMFhyadhnHkbZeH5m3/71N+GmCjG/K
         wuhw==;
        darn=lists.linux.dev
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1789126250; x=1789731050; darn=lists.linux.dev;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=EeNgemAb7lsaMF3mg8j+vPdtgIOxXFzORulJF8ZPymc=;
        b=DRvdELUJ2z1d3x773kOBPkS9Va/1Kc1ODZDyikbuFppADElhWDHcndplsMJ974Geds
         nXNKvCjr07WXz+vFPGXQmJaKZRibhp1lYMG7Xb7UvfRa0p0GfJs1ausCW17nQbIjRyN6
         zzrdSbg/Qi/uvogexH1WZDFaUL2RTV1n2IEZbRO+rX14thN22/CJzW6NV5d+NkBjkXfe
         ch5Jxt2/aKCbKk3D+cocQeVRoqTx4iabnfzQ8l8T6mwFrLXNkcu6UP8zRHCLXwVYxjX2
         /lfRjMDIvyznu6J7jHg/Acgspz0k5B+eof2ed8ygVWoDSwSq39e3EvabG/moLQYBVbNB
         nwLA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1789126250; x=1789731050;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=EeNgemAb7lsaMF3mg8j+vPdtgIOxXFzORulJF8ZPymc=;
        b=X1XO0dUQeOaEQtqw4gfh2nUYFS07MwI3kT7WJtyJj23KsW2H4QpPlM5rsKTHzlVZ76
         WALmpTj0Ekva7odUMTV1zmuCPRHVzG1UhQwqe1i/BEp0/yF8IuNFpwkifCZda224a1aR
         LM1ZGoRW1QoKfkdAA9w2GwVj4wS9IWyMs2kNGVCVL/6hQ+0gnHq5q7Yx46VNHOKMsplL
         YGVNkfc83CZLT2023044hsvF/ZngGVIbr0u+S1WFwFXX+TN6kZaAcS/E58SAxWu/DZ1Q
         qIJktoGOiyqLDlPklCjEUZA/EpxgHyWzTntG+UtwcKRpfZQDZRvjShuCqheWcmCAuIh8
         vNoA==
X-Gm-Message-State: AFuF++nYtyIhznDE8Phx0EMX6D9an+0WwpkPvOOt9p+amvs2BhRyMCOP
	32KpHOT+9NV0fDC+KN/E0mHftl5Wun3NB2B7rLWe/MXXg6yOG/Yyyvftcdo0sLMTRXpcFlXdWh3
	Ugd3UImU1Vvql7jovepJrefqcYq1yRfokEdHs9hzWiQ==
X-Gm-Gg: AYBFou2U2hias0pAXhd2NiJCL74o3lF7rYcFEjxCbT6WyxUsZYsv5AyfhjOpyCKv7/r
	oJ53SwkfpcU6cs/jp6VFPiyAkYwtb0gZ2yiyK7/cpDw4ZyR47Sq85HRNuUOFaH3lLmsRCHk3+YI
	xkzT5zMQsjtItylvXJkXjjrS4qtUeu2FoYbIZEFxwStxLYWWu/qqpHiRzsefqKWBtnvjohMWOlp
	gAAYnwk5UxvULkD71DTL4RwF3WeHHl0xcSEDhhThyFZ9m92l8qH213amwf0D22aPRn/aZ3PKdJb
	AAEBUHvTrO5XcYabLdmSvsHJW9RGgAP8SuxH8e/UWgACUFWUretFtng0A99XjNkhAuN9zIX4meF
	7crw6kD1tnya+8aYys5wbHyBhBiDXE/1eSIP4bhUIt/Y6KwXRuj/8/w7GV2bs5gMgeSnOXzFgHQ
	==
X-Received: by 2002:a5d:494e:0:b0:486:e73f:586a with SMTP id
 ffacd0b85a97d-486eb3046cemr2794052f8f.37.1789126249695; Fri, 11 Sep 2026
 04:30:49 -0700 (PDT)
Precedence: bulk
X-Mailing-List: sashiko-reviews@lists.linux.dev
List-Id: <sashiko-reviews.lists.linux.dev>
List-Subscribe: <mailto:sashiko-reviews+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:sashiko-reviews+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20260911111731.3404308-1-prabhakar.mahadev-lad.rj@bp.renesas.com>
 <20260911111731.3404308-4-prabhakar.mahadev-lad.rj@bp.renesas.com> <20260911112607.3239E1F00893@smtp.kernel.org>
In-Reply-To: <20260911112607.3239E1F00893@smtp.kernel.org>
From: "Lad, Prabhakar" <prabhakar.csengg@gmail.com>
Date: Fri, 11 Sep 2026 12:30:22 +0100
X-Gm-Features: AcwNN1WtZyh7B-ne7h4Obd9ZeApvbyPgvZ7Ss5X-8P5TGBqm7FWkrnhW56vuKck
Message-ID: <CA+V-a8vt0Y_9Qi7-KY2_206Be_H9GwG1g57aHwnVgx++A7_bEQ@mail.gmail.com>
Subject: Re: [PATCH v5 3/8] watchdog: rzv2h: Propagate WDTDCR access errors
To: sashiko-reviews@lists.linux.dev
Cc: conor+dt@kernel.org, robh@kernel.org, linux-watchdog@vger.kernel.org, 
	devicetree@vger.kernel.org, wsa+renesas@sang-engineering.com
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi Sashiko,

On Fri, Sep 11, 2026 at 12:26=E2=80=AFPM <sashiko-bot@kernel.org> wrote:
>
> Thank you for your contribution! Sashiko AI review found 1 potential issu=
e(s) to consider:
> - [High] The error path in rzv2h_wdt_stop() leaves the watchdog unconfigu=
red and missing a required delay after reset deassertion.
> --
>
> commit 3f7bad2568920b818b4bdb62349364febc443827
> Author: Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
>
> watchdog: rzv2h: Propagate WDTDCR access errors
>
> The WDTDCR helpers currently access the register directly, but this will
> change to use regmap, which can fail. This commit propagates errors from
> rzt2h_wdt_wdtdcr_count_start() and rzt2h_wdt_wdtdcr_count_stop() and unwi=
nds
> the resources if an error occurs.
>
> > diff --git a/drivers/watchdog/rzv2h_wdt.c b/drivers/watchdog/rzv2h_wdt.=
c
> > index 7c6a4855bd8ad..cbf414e0c9a3c 100644
> > --- a/drivers/watchdog/rzv2h_wdt.c
> > +++ b/drivers/watchdog/rzv2h_wdt.c
> [ ... ]
> > @@ -169,8 +179,13 @@ static int rzv2h_wdt_stop(struct watchdog_device *=
wdev)
> >       if (ret)
> >               return ret;
> >
> > -     if (priv->of_data->wdtdcr)
> > -             rzt2h_wdt_wdtdcr_count_stop(priv);
> > +     if (priv->of_data->wdtdcr) {
> > +             ret =3D rzt2h_wdt_wdtdcr_count_stop(priv);
> > +             if (ret) {
> > +                     reset_control_deassert(priv->rstc);
> > +                     return ret;
> > +             }
> > +     }
> >
> >       pm_runtime_put(wdev->parent);
>
> [Severity: High]
> Does this error path leave the hardware in an uninitialized state?
>
> When rzt2h_wdt_wdtdcr_count_stop() fails in rzv2h_wdt_stop(), the code ca=
lls
> reset_control_deassert() to bring the hardware out of reset. However, it
> does not include the mandatory udelay(3) wait for clock stabilization or
> restore the watchdog register configuration via rzv2h_wdt_setup().
>
The udelay(3)is not required as we are not reprogramming the WDT in
the rzv2h_wdt_stop().

> This leaves the hardware out of reset but unconfigured, which might trigg=
er an
> immediate spurious reboot if default timeouts are active, or fail to rebo=
ot
> the system during a hang if the watchdog remains dormant.
>
> Could this error handling be updated to fully restore the previous watchd=
og
> state?
>
Yes it does, if the rzt2h_wdt_wdtdcr_count_stop() fails in
rzv2h_wdt_stop() we revert back things so that further pings from the
WDT core continue without any issues.

Cheers,
Prabhakar
