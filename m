Received: from mail-pj1-f48.google.com (mail-pj1-f48.google.com [209.85.216.48])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3D1B633F5B0
	for <sashiko-reviews@lists.linux.dev>; Mon,  8 Jun 2026 11:11:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.216.48
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1780917089; cv=pass; b=e8PObL8NQeFB5FfWmZaI2T3EVVMflSzYa/n6EoiFKVV5bDd1xWUPWjlY/nfIC1hk7dovYeXRrPn3n3HHzl507L7kYvPhulv8IFQgjag1I00+1lr/2Ir4NsYnQbrqXIlbCB1HSwdJVKaF+IuRKbOkld1wsDBqzIdJUpodvSYCV6E=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1780917089; c=relaxed/simple;
	bh=OKAvcLw4cVnHLWqBGIC1hLC9PId30JwifAN6/6lExq4=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=mn8XtIYlShUQzLBfFrlLtDoT1WYwIWf0N3OqsGqAhfbPBkBX5rD22FGyb0+55DEtdVd2j3Tv3rmYpzSZTJCmb5n5POFC4gd+KAXoUCeTsfuqlhEH6EoPnhAMqkwRfafh/JqrnykOuGeAaBZo4oVKynqM+da1HXSjCZo5QJk9o+Y=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=PbbajdBa; arc=pass smtp.client-ip=209.85.216.48
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="PbbajdBa"
Received: by mail-pj1-f48.google.com with SMTP id 98e67ed59e1d1-36d98b68d68so2703986a91.2
        for <sashiko-reviews@lists.linux.dev>; Mon, 08 Jun 2026 04:11:27 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1780917086; cv=none;
        d=google.com; s=arc-20240605;
        b=iHi59mt/Caae+gG82FDCunlcmKren1eHbvYZ+EqKwjgE/GflpZvL5ASmekDeHtGgx1
         Q4UVssWFJ+Ydsm4BOfHo16laaNkp0xONB145BJfd1EAXHCIHfs9L8Em4elyyowZBtdo6
         hSqPHn0IuuxHVDK36nlt8hORkntojQdppy+ERSvdqjfkBcYBQ2kFZ1BjAN5ZSUwKoaKu
         0TMgfcsNXMx4SDH9vzW20/VyM/2ULj0+9MZks207WGSsp+2jEx4TkCjrobsIhWPxUfe4
         k3DwWTFmRWFAIZBuhKSxd/YZZnm1THhJbRsfV0/4NemFrO73C6lAhgCm7H6w92AwRqrM
         U5GQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:dkim-signature;
        bh=wcRJm9Mj5HN9MDIGpueIj3AGF7buVGW3wX3A5PTznAs=;
        fh=XBOPQ3X6Qb5smFHfwOBHVpR+PN6XHuOYgtFR56NFUho=;
        b=OlTJo0T9BigBK/i1KBcQgNzww24VmkPbSUg3x08saVAtjgbb4FMmhRXLgUiKi4P0Qa
         r5PeousZI9zC5kl2SALsXhNJxQwsF4bDx5nHlpHtahz+f5BpWw0LxYDGtxPraydxTE6x
         76Kpad0McOyxkzP0JnvFvmQvOgt1yX86st+rVTNM0XZQYE+ffmMCVJKVwdgXWTfyjeX4
         VYrl6qgS2xXA/Z2NBwtC1uaQjipYIkw660wO7qcYWrADXcuxH3EB0wQmxkQwO7xQwxOl
         +6FlvgGShebaOfVHNUsYg3KjRrYZzATAqAmfY8cDnYJjX4yn7va35W+Ex3oCTGTFdbhP
         zI1w==;
        darn=lists.linux.dev
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1780917086; x=1781521886; darn=lists.linux.dev;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=wcRJm9Mj5HN9MDIGpueIj3AGF7buVGW3wX3A5PTznAs=;
        b=PbbajdBatVVPBzKJf83ZiwGfxG/4B+TlkiPV7oIa5z8oiQT69AREunlklJlCR0K4U9
         6ciLT3qBvRDBy2b1vH2iT4fIiAz1dJ4QYZd/8ky2gqrqneDcgESh88KD0wxqtC84CN1u
         V9h7P1t/GYVgmVGwP6MZXa0MiXWBLl0WLK5iUznMsg+E3s4V2cw9AHLF+UvzrLS/FK7A
         xF/9sK9OlT64PqutK1U/eH0kPGH4FHUL73hvc4lik1wHNPI1bw6i5PO0L7yocHrbqJoe
         kjZPsxj1QjGfwV8E1j+xcE11frg0A9LkktHzBXVRPdIr67IrJ870+80IUk9pVvRsMXAA
         O2VA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1780917086; x=1781521886;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=wcRJm9Mj5HN9MDIGpueIj3AGF7buVGW3wX3A5PTznAs=;
        b=rBGLvwfYvaqyrXnhoKu5P5/N01yQocHeQ3Hf9rZaqQIHp69hOlwG1zfT1NRkx/Wa6d
         9laghG7asibPcRUVdghxQClQjZbzEoOx+gAwbWi02HDjlM6gKzhB7CxIiAycLTa2Umqr
         hsIl7Bs5YmS2AcOln5MUIaoLpXKuKV8HCgdpWtfmR4mNJ8FOszJ3GwZDw/TMmUR4rfNu
         NU06x59yxJrXrWBm8amqXw2uRj92Sy8kOL7etIQjNBlulso25Frtczl1UasLMfnLdRL4
         248QIaPJ+ReJ1tlTYN1DNJMGQJZqaUEnLMuPp+kSK9CC/o2K75I9l1eTpjVm/f6kynFb
         88sA==
X-Gm-Message-State: AOJu0YzdXNeWgRe7j3iw/ICSRztAc9+4tDagkWNeO/XWncGFT0ean7fc
	nDg0jGG+DmPaOT0DqeRQD1FBidlVOO566SU0FNw0uVvAML1TlN4reRX2AmzQnbg7H7VA8Hxr9NS
	1PD+kCOTB0tungyFHyuArVRRttveXOFjGpSc1
X-Gm-Gg: Acq92OFC7pBkQh3JcP4y8B8R96M4GnUsWjv68p8iue3ZMr4miRyQ10qzriGUeFxy8KR
	PftYGrUF4mQoUsytwmC4BWnQyQms/k3RKZFX1sj+p1aQqEoEszP2UU/Z6LTqizv0qNrTYe73v6f
	swU8ujNuMZdP9PjHIYHpFTLBeFOaQbhXij3xTnwyKMJp6k/FdjRQoAvCIMUbsXzKC/VBnbe0QBi
	qjSjymvNtOY5uj6+vx+rwKUz0wh4wgaTksl0tfpl2jcYdf2GkZK2g815BrHMyKhhXMbkQ73l7q3
	i8UWKdqagy1hC7CzNANnLuX639iOcz9meIBocAauBVMArbqR
X-Received: by 2002:a05:6a21:390:b0:3b4:9027:712 with SMTP id
 adf61e73a8af0-3b4ccdcedecmr18063543637.20.1780917086441; Mon, 08 Jun 2026
 04:11:26 -0700 (PDT)
Precedence: bulk
X-Mailing-List: sashiko-reviews@lists.linux.dev
List-Id: <sashiko-reviews.lists.linux.dev>
List-Subscribe: <mailto:sashiko-reviews+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:sashiko-reviews+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20260605121955.105661-9-phucduc.bui@gmail.com> <20260605140412.CB2A81F00898@smtp.kernel.org>
In-Reply-To: <20260605140412.CB2A81F00898@smtp.kernel.org>
From: Bui Duc Phuc <phucduc.bui@gmail.com>
Date: Mon, 8 Jun 2026 18:11:15 +0700
X-Gm-Features: AVVi8Cfj24AI7Q02Va6L_5BIzBfLSjfFWoU6OIzNmPm5u6Uc3Eq4xA22OJ0Hpkg
Message-ID: <CAABR9nEpbhK6L2xkSGUaFKw0NtefzjaX9sAUG8sNamokzjR+MA@mail.gmail.com>
Subject: Re: [PATCH v4 08/10] ASoC: renesas: fsi: refactor clock initialization
To: sashiko-reviews@lists.linux.dev
Cc: devicetree@vger.kernel.org, wsa+renesas@sang-engineering.com, 
	robh@kernel.org, conor+dt@kernel.org
Content-Type: text/plain; charset="UTF-8"

Thank you for pointing this out.

> > @@ -898,6 +904,11 @@ static int fsi_clk_set_rate_cpg(struct device *dev,
> >       int ackmd, bpfmd;
> >       int ret = -EINVAL;
> >
> > +     if (!ick || !div) {
> > +             dev_err(dev, "ick clock or div clock is missing\n");
> > +             return -EINVAL;
> > +     }
> > +
>
> [Severity: High]
> This isn't a bug introduced by this patch, but does this clock initialization
> path ultimately lead to sleeping while atomic?
>
> The ASoC framework invokes fsi_dai_trigger() in an atomic context with the
> PCM stream spinlock held and IRQs disabled. For the start command, the call
> chain executes:
>
> fsi_dai_trigger()
>   fsi_hw_startup()
>     fsi_clk_enable()
>       fsi_clk_set_rate_cpg()
>         clk_set_rate()
>
> clk_set_rate() attempts to acquire the global prepare_lock mutex in the common
> clock framework, which will trigger a scheduling-while-atomic panic when
> called from the atomic trigger path.
>

I agree that moving `clk_set_rate()` to `.hw_params()` would be a
cleaner design.
However, this is a pre-existing behavior and outside the scope of this series.
I would prefer to address it separately in a future cleanup.

> [ ... ]
>
> > @@ -1985,6 +2000,9 @@ static int fsi_probe(struct platform_device *pdev)
> >       fsi->master     = master;
> >       fsi_port_info_init(fsi, &info.port_b);
> >       fsi_handler_init(fsi, &info.port_b);
> > +     ret = fsi_clk_init(&pdev->dev, fsi);
> > +     if (ret)
> > +             return ret;
> >       ret = fsi_stream_probe(fsi, &pdev->dev);
> >       if (ret < 0) {
> >               dev_err(&pdev->dev, "FSIB stream probe failed\n");
>
> [Severity: High]
> If this fails, does the direct return bypass the cleanup for FSIA?
>
> Earlier in fsi_probe(), FSIA is probed and successfully allocates
> non-devres managed DMA channels. If fsi_clk_init() subsequently fails for
> FSIB (for example, returning -EPROBE_DEFER for an unavailable clock), the
> error path directly returns instead of executing the cleanup routine.
>
> Would this lead to a permanent leak of the DMA channels and other stream
> resources allocated for FSIA? Might a goto statement targeting the exit_fsia
> label be needed here so that fsi_stream_remove() can safely clean up?
>

Good catch. I will update the error handling path to ensure proper
cleanup and include the
fix in the next version of the patch.
