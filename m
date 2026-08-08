Received: from mail-pf1-f170.google.com (mail-pf1-f170.google.com [209.85.210.170])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 78DC13C1D44
	for <sashiko-reviews@lists.linux.dev>; Sat,  8 Aug 2026 10:43:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.210.170
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1786185791; cv=pass; b=VWnKquNL2ZXMGaudeolpEWzB/4wTz28/8joxfXKqFH+nVJ0HXnBu+2cNkj7OKIYLelCGv/sdn1BFZHn78tHdxEiYlSvp8EptsZMsvsMU7wLEJLeqaByX+wqXN+skUIx9aHfPpgjKoWdmJMihj6vnxKCxUnz8popWtICGSjGMvnc=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1786185791; c=relaxed/simple;
	bh=mXjI6xLrsgJ/BCByKBCc7QBfdI52WmMfRYnj8yT11hk=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=mpTywugPMwV1wV+lv7Y/Jq43DI8yFxD4CkHlkHsYUPfeMSnn4SXpCRRqF1WPH875OGuUGZ8osQScQPpuAow7U43da/35xeH2M5zRNaTTVhHIv9sBBDDw+u/V+R1gN7QKq4aEECVcG4XpWH3ShPbuc7njGpXJ6rsL30m+fNcKYmM=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=oN2NHSFo; arc=pass smtp.client-ip=209.85.210.170
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="oN2NHSFo"
Received: by mail-pf1-f170.google.com with SMTP id d2e1a72fcca58-8453427d3f4so369493b3a.3
        for <sashiko-reviews@lists.linux.dev>; Sat, 08 Aug 2026 03:43:10 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1786185790; cv=none;
        d=google.com; s=arc-20260327;
        b=i/6uLfSYf5tJ2Cn4yrfGzorlpfAzNczzXY2XlFs+TX9E8QrxyZhLFPYmRrcgJoW8ol
         EZ8luAsLzB/nmy3bIt4nhZo9JbUyLXM6f0QCXXJiD07obf/Ig+2bBiY7H8VSo8PriefQ
         VymUJi1PrILXYa0TpduGr2UNAJX1noMsW3CmW1ZhHgWoZO9gPBw4SOc6K7e091KydTJY
         tR/Aq8Qg+jBHAP9iBIRc9psZo73WBpD47DuRxznwg9W0HeAJGT5ffg4kU2Mls1iIG/Ok
         +6yYfmetAc1PYXlvcQ4MMhgHYMilFnSBwSHJiVA/nPuHTPihmjlcWeTymi2R0YwKqXtk
         GRAw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=TahiDhpqp/N8bPEZcra7/rRwJQuhTtc5hSf7Qko9ehI=;
        fh=3mbWQc2KYnV1YBFEjtPx/1jzUpC/uZUzPfAesf3Pc0M=;
        b=pE/hwtaSXovGRU+bCOyeUGTimz85YD5AjIitUUIK+6y/V26awKfGY/JPBhuYL5Rfij
         sWIdS5M1WDrWqvTOsAejoocMHooLAOAHP7mUNoyFa3MuPBhkJV95XPdCSmSC6D38WwyB
         01wG/LzohJKQDBXnFfdbr+XoB1+uYy0FTTVhV3VTRP3e0N4GaU87FaehLwUI8KuFrZAi
         71oH12DqM0Zdc2JjJHmd8n9s5bqiRp323lTKT7Rz4JC6KixYs0ARE7DJyv++53uBId+f
         uKZFUHDV32RkxxujdkOgd6rsF6gZfI2BLmc+bxFF0fcU6dAAeFq/1zX9BK471z7MdB6G
         iDCg==;
        darn=lists.linux.dev
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1786185790; x=1786790590; darn=lists.linux.dev;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=TahiDhpqp/N8bPEZcra7/rRwJQuhTtc5hSf7Qko9ehI=;
        b=oN2NHSFoWObscXjoAPmj5L9lqtIiWUTLSEIjF2RTeBhrg/FQWPd96IJpzZKle4PexQ
         taAdS7hYXNF9wwJzv6fF+wfK+dn3cdYLVDyASfFuj78aWwTImwmwv5H1q0k/f+4R+6hK
         XhyDX5NNSu74MaRmUCj4/qxjt4K+Rg+ENSb74rpguxI02PvvICDeig67C/VxAI0PkONE
         59KCN+9nFNKaqVhHMZpU2rOTXBdruGMk8qpb4bG9uYiISPqtL07LpbzfqeQDtjVEtrDr
         ik7Au3dcGLABOuMaEf0AgvMNUSiXdyoWAfXKAywrnQ1LtRyzZlkl8fjkLS+s1JWqfKL5
         pcnw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1786185790; x=1786790590;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=TahiDhpqp/N8bPEZcra7/rRwJQuhTtc5hSf7Qko9ehI=;
        b=bL2qMAa2JzK5956wdQLSeD9ye3AjGB6IQ7WMnhI+ZkDu5pCzWn/R1vYFw8+x1kl5WX
         LqLtyMbrVZtIEQfi4s6n7cQOdi52GWmhTks5qfQlsCM7qqc02m19PN0pkdgJPQrcIJ7n
         OmzVOXeUOe82OxpYFBAzBgDd9k+wzNCM7+7geUYtpjf2+CS7amqXRb80blQZFsvSjd9A
         DbmrHysi4whQoYnltZlt2uZkbbvu2i8IBMBEkTikGiKAzvEkCrsFLp3PgKrTwUIUifKR
         w/0tsxFiOGRcCdI5mBnBg5XDpUudJzd4GeS+NtjLqoypy0Ogs4tnAuWQb0E+S6zEko9X
         XwGg==
X-Gm-Message-State: AOJu0Yw9OoJcWfhlZaJ0FFmUuPUELNC7RQ0a4eGgYeKdtVCCPDw1C8tc
	CmxQMoyVLip5HRbyo59l7Yd/fyER3e8TCCW9DfhdoJTarPmkl6BEofh8vfkKfA7CobsVzxnxn67
	/zm6o+K488bJ+LcEdKNnCpfGyD3+icj1av6QX
X-Gm-Gg: AR+sD13aem9ALoGkOaRiGgija0XB6ZxMXpOQX5Dus2BUftYfLfuUV05+DTWypcY+XWG
	egefKo2APvjf6m0Y/9b5xOPvYBstHXcw95eDGpyp1BB9I/nIDP0BhYfqysTG+7OFn8eZU6gSi08
	3bshhzmfS6jyBsWdznEe0TDuKJ/DIsQU0/qJyRHuJyPUbvzk1d0ISxwdbkS4KLxt1VrS/uVdJBu
	kGJDKjvT4ir8dBZXb1o/HuHPCiqdtHRW0XCE9wkzO8l4lRKj3vIrqjRdzeg6LHMljl4x+gTYJ8Q
	9Cxah61HeZQJruYl6vnDyOpZYHJa32zaTgWQ/sesQZNURq5qg2QNMHDD/DkcPqahr5+59ZX3PzH
	RcQB9S1gvKt4vN5BGpm9d9LFCsXiCqwAbylhLndqJNe6Tf/T/pF0o+rZgn0zX2Kt4FAd8ekntyr
	aMVQ/+U8Npyefq+Mg=
X-Received: by 2002:a05:6a00:4293:b0:84a:6540:3389 with SMTP id
 d2e1a72fcca58-84f2dfc53e4mr33552422b3a.10.1786185789775; Sat, 08 Aug 2026
 03:43:09 -0700 (PDT)
Precedence: bulk
X-Mailing-List: sashiko-reviews@lists.linux.dev
List-Id: <sashiko-reviews.lists.linux.dev>
List-Subscribe: <mailto:sashiko-reviews+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:sashiko-reviews+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20260807090945.41690-1-phucduc.bui@gmail.com> <20260807090945.41690-3-phucduc.bui@gmail.com>
 <20260807092245.4730E1F000E9@smtp.kernel.org>
In-Reply-To: <20260807092245.4730E1F000E9@smtp.kernel.org>
From: Bui Duc Phuc <phucduc.bui@gmail.com>
Date: Sat, 8 Aug 2026 17:42:58 +0700
X-Gm-Features: AUfX_mwps0K_oGqDED58AIb5iJaSMgZ8HxJfRxTKu9khW67GW5bUW_-aJvkpS2I
Message-ID: <CAABR9nFW8XYSts6ZxTekZJSTpProDCrVgOm5=5aW1ahXV=wG5g@mail.gmail.com>
Subject: Re: [PATCH 3/3] serial: 8250_mtk: Propagate errors from optional IRQ lookup
To: sashiko-reviews@lists.linux.dev
Cc: Frank.Li@kernel.org, imx@lists.linux.dev
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Fri, Aug 7, 2026 at 4:22=E2=80=AFPM <sashiko-bot@kernel.org> wrote:
>
> Thank you for your contribution! Sashiko AI review found 2 potential issu=
e(s) to consider:
>
> New issues:
> - [Critical] The probe function exits with an error without unregistering=
 the previously registered 8250 port, leading to a port leak and a use-afte=
r-free of devm-allocated memory.
>
> Pre-existing issues:
> - [High] Runtime PM is enabled after the UART port is registered, violati=
ng TTY subsystem guidelines and risking circular wait conditions during pro=
be.
> --
>
> --- Patch [3]: [PATCH 3/3] serial: 8250_mtk: Propagate errors from option=
al IRQ lookup ---
> commit b5b9e4c48c3e7b1094e5e1c9834f9f8130a17c26
> Author: bui duc phuc <phucduc.bui@gmail.com>
>
> serial: 8250_mtk: Propagate errors from optional IRQ lookup
>
> This commit updates mtk8250_probe() to propagate error codes such as
> -EPROBE_DEFER or -EINVAL from platform_get_irq_optional(), rather than
> continuing without an IRQ.
>
> > diff --git a/drivers/tty/serial/8250/8250_mtk.c b/drivers/tty/serial/82=
50/8250_mtk.c
> > index e6a56cf54ae0c..d0d2aecf90059 100644
> > --- a/drivers/tty/serial/8250/8250_mtk.c
> > +++ b/drivers/tty/serial/8250/8250_mtk.c
>
> [ ... ]
>
> > @@ -587,6 +587,8 @@ static int mtk8250_probe(struct platform_device *pd=
ev)
> >               return data->line;
> >
> >       data->rx_wakeup_irq =3D platform_get_irq_optional(pdev, 1);
> > +     if (data->rx_wakeup_irq < 0 && data->rx_wakeup_irq !=3D -ENXIO)
> > +             return data->rx_wakeup_irq;
>
> [Severity: Critical]
> Does this error path leak the registered serial port?
>
> The port was successfully registered earlier in mtk8250_probe() via
> serial8250_register_8250_port(), but there is no call to
> serial8250_unregister_port() before returning the error here.
>
> Could this result in a use-after-free if the tty device is later accessed=
?
> The devm-allocated memory for the data structure will be automatically fr=
eed
> when the probe fails, but the port remains active globally.
>
> >
> >       pm_runtime_set_active(&pdev->dev);
> >       pm_runtime_enable(&pdev->dev);
>

I agree that this makes sense. I'll make the change and send v2.

> [Severity: High]
> This is a pre-existing issue, but should runtime PM be enabled before
> the serial port is registered?
>
> The mtk8250_do_pm() callback invokes pm_runtime_get_sync(). If
> serial8250_register_8250_port() synchronously invokes the pm callback
> during registration, it will attempt to use uninitialized runtime PM
> infrastructure, which can lead to circular wait conditions.
>
> >
> >       return 0;
> >  }
>
> --
> Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260807090945.41=
690-1-phucduc.bui@gmail.com?part=3D3

In mtk8250_probe(), uart.port.pm is set to mtk8250_do_pm:

uart.port.pm =3D mtk8250_do_pm;

In serial8250_register_8250_port(), this part:

if (uart->port.type !=3D PORT_8250_CIR) {
        if (uart_console_registered(&uart->port))
                pm_runtime_get_sync(uart->port.dev);

calls pm_runtime_get_sync() directly on the device, and I don't see a
direct call to port.pm here.
it may be invoked in some other helper function called within
serial8250_register_8250_port() itself.

That said, this is a pre-existing issue, so I'd like to keep this
patch scoped as-is and not address it here.
