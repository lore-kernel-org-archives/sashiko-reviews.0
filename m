Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.218.41
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792510778;
	b=KzDJTwxH70ZgswWOgMKJwPb2NID1ENlRjNYJ4j9yYc7CV+Ix1K+aP0hkF3A3SJe/3s2c
	 bucwFhFOUYg4/wMBxsRY32r6/zXmzLH+gjqpmtAc47tLaxDefRLYePJBwqetG8EH0KiIw
	 PU5ba433zqAbY1JhhleFII36F12pZtc2NnYuDd4Z0M9uje+iG0VEJcJrTfPMJlbqWQf4j
	 TFnjWK5FabEyXYg+aMsP80wmiTKjASHBcQJ1QHN9Vg0f6p6KjYSC59S2fiJlQxhK7xEzO
	 1//yiNtH5Jfw+rb6KYZ7f/mlryqyWqrNr0yLFB0CfaMbY4cmYqH+kYLJ5LCdSkfF94A==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792510778;
	h=DMARC-Filter:Received:X-Google-DKIM-Signature:X-Gm-Message-State:
	 X-Gm-Gg:X-Received:Received:Received:X-Received:MIME-Version:
	 References:In-Reply-To:From:Date:X-Gmail-Original-Message-ID:
	 X-Gm-Features:Message-ID:Subject:To:Cc:Content-Type;
	bh=uOdggBIS0MQjP7rBXZTasAv93vWRuNQG4pH4+meS/uA=;
	b=Jq/ypVzsD4Z6WfxHxi/8PimUCIud/n6KQzKuSs9P6kdw2mH1RKPaeyZrzGXJz8lo19iX
	 UuFVXngz8wvR1Pr0Tu3oOb32mYQ5GTv+nDyCjR42zS6qA0UV4VJWdR8MTVrDyvIjACQy+
	 4HVx0XvHsbG4nt1/SA+uIg4r+OiakjdLKAOO+fW2rf0MB5WmlA8S1Ixkg2bMTg2c7mJPh
	 kVZEodSIGhOfUfhQ/UNIeVX848GkLxKIx/sdsh7/A5FsXyL+nmMvW8BXFg9MainzKOJ8U
	 38HqJLifLWbaEpSHPZwVRtjWJJbe3csqS7LK3sdWsWVfAWWnttWwYDC2AICh/lITccg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=none header.from=linux-m68k.org;
	spf=pass smtp.mailfrom=gmail.com;
	arc=none smtp.remote-ip=209.85.218.41
Received: from mail-ej1-f41.google.com (mail-ej1-f41.google.com [209.85.218.41])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 12087606A31C
	for <sashiko-reviews@lists.linux.dev>; Tue, 20 Oct 2026 15:39:38 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 12087606A31C
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-ej1-f41.google.com with SMTP id a640c23a62f3a-c2dc63f8d8aso568955766b.0
        for <sashiko-reviews@lists.linux.dev>; Tue, 20 Oct 2026 08:39:37 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792510776; x=1793115576;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=uOdggBIS0MQjP7rBXZTasAv93vWRuNQG4pH4+meS/uA=;
        b=GdB8mfhGEsov3U4e1qX3jQCGzQnGHlEJHxoJZbfLx2G8oXeKIh8UIdPEAqKmSTA3u0
         GpbM7KtuIeOeUbjpX77hnbEDxDB3+/vr9o6v06tgjjLPcS2WMibmnG9iHNqu7pFKvuoI
         mZTOdBmADL3Q64nR1s95dIJmMK0W+tSXqGFnn3Q8ETgJ/fMeph9v0ICyWjF/kiXQUbI5
         uOEwPMN6DfuoS3RMuzV/y2MfEMj484Ghmrwe8sCA7OwfzvHdP32yM1z9WMkEGKPIncHM
         BmDBo47twb3aP4xGnRedo0+YkiQZCNz1654uTYgzKW968jdVX5O9BxYZbYaYAMWASAU1
         sfvw==
X-Gm-Message-State: AFq9FYKuAFl7bE2fVKTakm3YweBTvl+u5yKWSoRubnt34XsvovQKLyyv
	V2Vpy5huBPbKa9RYcC3No2jR5mVkfwSAJDggk+XYIWI8ZyaH6YQ23hgZbtdd8gdme2s=
X-Gm-Gg: AYBFou1AqsQgcJf2e58E3InSlfaDmHU8X7I9MpA4U23XmLBo7lcWCtZJU0eRWTfwWn3
	l/Cg05nvFidtnhvAkyKSuInex7fglhylZC7Vu28fFJSkVJGVDWXnJXxKzc5bT+QesRwMGsVs/MJ
	59j+gZLHPdohKL4WHLZD6Pm6XHO7txTMyWjwdYCOao2j3MmU2jlt7KOpfeQGe8T7gs+/52Xc8Ln
	K6334ouhtw/kZ0ru6efBNyaVF2JVOE3fPnXbOYPvapJ+aTzXTR6w3R0SzBel4OHWK3oy+2oqwZb
	cBUG/aaHT3RbQwssq7eAhghJ+ygmQqGUKKScFqo3qG37iNnUwk1VlWsJgcfFcJFgJausoWmKUj3
	Sc21r0K8vJ0ES7ldF1RJAddLfQPPM/z6SgZQwYSGGzThxjyV8VaXcVsltEm2rkLQqYH/8odRQgP
	bxXYmUgnXhx+IvykI9PT3YG/2rRjWk42jpU3Iw/FtIbzBf7A5JvnYcs5oygxi0YLxadu1bt1pQc
	ZwCj8yIaf3wTL+lQSz7kmKUkGhNSK+/tf1O
X-Received: by 2002:a17:907:c244:b0:c34:e9fe:82ed with SMTP id a640c23a62f3a-c419ea3872cmr776519466b.28.1792510776349;
        Tue, 20 Oct 2026 08:39:36 -0700 (PDT)
Received: from mail-ej1-f42.google.com (mail-ej1-f42.google.com. [209.85.218.42])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-c466ced4995sm68156166b.8.2026.10.20.08.39.34
        for <sashiko-reviews@lists.linux.dev>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 20 Oct 2026 08:39:35 -0700 (PDT)
Received: by mail-ej1-f42.google.com with SMTP id a640c23a62f3a-c2dc63f8d8aso568943966b.0
        for <sashiko-reviews@lists.linux.dev>; Tue, 20 Oct 2026 08:39:34 -0700 (PDT)
X-Received: by 2002:a17:907:c819:b0:c40:bbd2:62f6 with SMTP id
 a640c23a62f3a-c419dd3942bmr740265666b.19.1792510774520; Tue, 20 Oct 2026
 08:39:34 -0700 (PDT)
X-Mailing-List: sashiko-reviews@lists.linux.dev
List-Id: <sashiko-reviews.lists.linux.dev>
List-Post: <mailto:sashiko-reviews@lists.linux.dev>
List-Help: <mailto:sashiko-reviews+help@lists.linux.dev>
List-Subscribe: <mailto:sashiko-reviews+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:sashiko-reviews+unsubscribe@lists.linux.dev>
List-Owner: <mailto:sashiko-reviews+owner@lists.linux.dev>
Precedence: list
MIME-Version: 1.0
References: <889ae6695b19ce57ca4b17526c69b48c9414f5ae.1792508601.git.geert+renesas@glider.be>
 <sashiko-outbox-179228@kernel.org>
In-Reply-To: <sashiko-outbox-179228@kernel.org>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Tue, 20 Oct 2026 17:39:21 +0200
X-Gmail-Original-Message-ID: <CAMuHMdW6hm1aGOKMLZfvS2oU7SBa7p5Eup3+iYqw3LaD_pv9uw@mail.gmail.com>
X-Gm-Features: AclHuK-Vu3hkTIFpilSQsdE4giSc01tkJXVlYbgJEZ6QBjeQmSjSTzB8n2GcoFo
Message-ID: <CAMuHMdW6hm1aGOKMLZfvS2oU7SBa7p5Eup3+iYqw3LaD_pv9uw@mail.gmail.com>
Subject: Re: [PATCH] PCI/pwrctrl/gpio: Correct GPIO_TC9563 /
 PCI_PWRCTRL_TC9563 dependency
To: sashiko-reviews@lists.linux.dev
Cc: linux-pci@vger.kernel.org, linux-gpio@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"

Hi Sashiko,

Thanks for your report!

On Tue, 20 Oct 2026 at 17:11, <sashiko-bot@kernel.org> wrote:
> Thank you for your contribution! Sashiko AI review found 1 potential issue(s) to consider:
> - [Low] PCI/pwrctrl: missing select AUXILIARY_BUS in PCI_PWRCTRL_TC9563
> --
>
> commit a7730129e4c039c8e8c890c4f31a553b4c62308d
> Author: Geert Uytterhoeven <geert+renesas@glider.be>
>
> PCI/pwrctrl/gpio: Correct GPIO_TC9563 / PCI_PWRCTRL_TC9563 dependency
>
> This commit reverses the Kconfig dependency between GPIO_TC9563 and
> PCI_PWRCTRL_TC9563 so that GPIO_TC9563 depends on PCI_PWRCTRL_TC9563 ||
> COMPILE_TEST instead of PCI_PWRCTRL_TC9563 depending on GPIO_TC9563.
>
> > diff --git a/drivers/pci/pwrctrl/Kconfig b/drivers/pci/pwrctrl/Kconfig
> > index 38aab596aa04b..1952ab4f29b69 100644
> > --- a/drivers/pci/pwrctrl/Kconfig
> > +++ b/drivers/pci/pwrctrl/Kconfig
> > @@ -29,7 +29,6 @@ config PCI_PWRCTRL_TC9563
> >       select PCI_PWRCTRL
> >       default m if ARCH_QCOM
> >       depends on I2C
> > -     depends on GPIO_TC9563
> >       select REGMAP_I2C
> >       help
> >         Say Y here to enable the PCI Power Control driver of TC9563 PCIe
>
> [Severity: Low]
> Does PCI_PWRCTRL_TC9563 also need to select AUXILIARY_BUS when dropping the
> dependency on GPIO_TC9563?
>
> Previously, depending on GPIO_TC9563 transitively selected AUXILIARY_BUS.
> Without that dependency, if PCI_PWRCTRL_TC9563 is enabled with GPIO_TC9563=n
> and nothing else selects AUXILIARY_BUS, drivers/base/auxiliary.o is not
> built:
>
> drivers/base/Makefile:
>     obj-$(CONFIG_AUXILIARY_BUS) += auxiliary.o
>
> Meanwhile, tc9563_pwrctrl_adev_add() in
> drivers/pci/pwrctrl/pci-pwrctrl-tc9563.c unconditionally calls
> auxiliary_device_init() and auxiliary_device_add():
>
> drivers/pci/pwrctrl/pci-pwrctrl-tc9563.c:tc9563_pwrctrl_adev_add() {
>     ...
>         ret = auxiliary_device_init(adev);
>         if (ret) {
>                 ida_free(&tc9563_pwrctrl_ida, id);
>                 of_node_put(adev->dev.of_node);
>                 kfree(adev);
>                 return ret;
>         }
>
>         ret = auxiliary_device_add(adev);
>     ...
> }
>
> Can this cause undefined reference link errors for auxiliary_device_init and
> __auxiliary_device_add when CONFIG_AUXILIARY_BUS is not enabled?

Indeed, both GPIO_TC9563 and PCI_PWRCTRL_TC9563 need to select
AUXILIARY_BUS.  I will fix this in v2.

Gr{oetje,eeting}s,

                        Geert

-- 
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds
