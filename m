Received: from mail-ed1-f46.google.com (mail-ed1-f46.google.com [209.85.208.46])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5A1D433859A
	for <sashiko-reviews@lists.linux.dev>; Sat, 30 May 2026 04:18:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.208.46
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1780114719; cv=pass; b=SlfQSDrgLZij3Qfce1B/9KdXm3y1dUSYr/oXQVZGwqb2if0SVqS0A0Fd/R1FeNDaBonS7GnPZxfB0r67OdUYJGw5a/6rxG5jL6CCcnL8Us9aK7RkPf72NwIuyhYTQDmrj4WQHMbdBjG518VTdMTr4ii7zUiSKCeyYnxkjXzoTcY=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1780114719; c=relaxed/simple;
	bh=wt7vymfuvb00mlogfJIV49ibnO1dnFDAFSRvrqXEuRA=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=gOBw535404zXk8TIwUWqXUgI3vJgTOgEEaFirpMmwwl/xLoXVL7eX133eI9imupYv0CCl3bjq9yafNpdVtsx+YAZ30CVAO2abcUrskKxO3CeaZcMxEgr5MT+aQLVxRm6O9HeAibQ7nHHVAD7saj6/FJyvvo5z95FVDZzAb7Bn64=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=frTqE4Zr; arc=pass smtp.client-ip=209.85.208.46
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="frTqE4Zr"
Received: by mail-ed1-f46.google.com with SMTP id 4fb4d7f45d1cf-68c1653ea0cso1885535a12.2
        for <sashiko-reviews@lists.linux.dev>; Fri, 29 May 2026 21:18:37 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1780114716; cv=none;
        d=google.com; s=arc-20240605;
        b=JkhbyKbNu7Cu3CFRejPCMU3XsPCj2CPlB5HBnsul23xekwOQgRoRGL459dwltDGZwn
         D6JqZwRFYwmKr4J+VDj8p7bN6GaBboRbBistI1EDkC7bcEIxUlDl/LoXQFOOmhM17nsE
         DIYghLsGCHFwpSECnxmVkgsA/2NglD9DMHX/9MVh22ZX8sYmVzk8C/mfZy953NOzvbOw
         SVYUUaMDCHWzzWiEtUJc+wfAgwvYJM1Af7aL2R9a/BPE75oNATDWSyDn/4soDGrP0wq7
         eoj08bDyHrmDuFhdtkW4+Mp/3CV5CofiXU76DEilNDrQ2syjLfbpuj8lpptMRlK14wSu
         kukQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=hErNnC1lMlzvaZQ75VA5piTpzFVvISuyV2i8pxTk4yY=;
        fh=dZD3NgG1X7s6kpr5hZ2U8f/WHSVkfsXTB6YiQT1XEfs=;
        b=GoTtknz1BMfYqptcJrcRbw/JHpiuAuW8uMmj1kqQXyb3dMHiG4aIA9wpw2TrkH074v
         WQmBaMODWiPlVvGjr+2j2gkTBfFaTNXiUiC23Dy7ItbEkQh3396USBgpCa4pl7gPWaJN
         2T1Rvalc4MuvGMGr17J2odm0/b2n7oFWcOyErXxvYYPVNEOqzgkJaJN00O8ejf0PHB6y
         J5HNeZwruuU+qMPAlccKaj27z+rqwU0FN8spohpBHgSr//8lyyfc3d928xaA2zuaxxOa
         GBDH4Ze218FGnD/cJ3T0kVoFmQUAIxGWcd7l4RlFI9Phek9qzESKZOeT1U8bxbE4Vt+Y
         2VSg==;
        darn=lists.linux.dev
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1780114716; x=1780719516; darn=lists.linux.dev;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=hErNnC1lMlzvaZQ75VA5piTpzFVvISuyV2i8pxTk4yY=;
        b=frTqE4ZrSoGL1OxO4Btu8c7F+zHZgdUZeTQeZ+3HRk+Qp4mERJX749RJKeR/3jUm8B
         IYet491q5dr/bIatTHMAzJbEkhng/IRvEYR9+JD6c3H35Ik5RXq47f6tA6N1ov5h8otL
         YNGYHZxh1mTi5UWGnylT14G9YHXIS4C97kI6dMHY/uz+FLSK/fPpOaxjCf4T37CGmgG8
         JoVbJI+lshKkbOCynvskXLrx1AFfpzQLcJ6RPDkdD5Qn52cnL9FE0qhAUyi3ST0CakUc
         mxGzJlr7PsT5Ya25fVVpWjyAz0U7Zg1NNaNoeQjVOxC3CwHuyk3A/xzlC1O0UJF7AYJ8
         7I4g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1780114716; x=1780719516;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=hErNnC1lMlzvaZQ75VA5piTpzFVvISuyV2i8pxTk4yY=;
        b=XvQVHr4lLqoRDxZMVRNJrxXtZYGO7X8+/2xuXxIDCr2kUb17v4m0DFiXxAJJmIWmbm
         snCf8sJKY7ImZZ8QnToBcsy39dy++4PO7E/DKgj+14SkwH41v/68taiC0hDUWulj1cPa
         BycKOLy5Y1uY1nbftDOxvkgvI2RrIBrOXrw4AYWA9SChBeDA+DcrkXbjCa3eyI/3nBPO
         MjHmrS3RNJoWuJDqUIhosDYK+qe23fuogWKvCGJ+pFVd+iaByK2mLBBXO2Lo0wjTRGRB
         p5X4KkSXXlms0bgU1nVC2n93zhRHeTj8nSP/e/KSopj/ArU9D1qLCb+dJMmqmTJwkXhj
         alLw==
X-Gm-Message-State: AOJu0YyyOkJQ4IK+fSPWkRR+qCABPsHTLOvwLScNF3DoRlgQdAqglJ4k
	WkMRtg1oyMaXTJzzXCjUNQr8/eZuRAcn1eF+STbkulUE+fKoebg2JbgNSASmOsse8vCTSCLV7EF
	a8MBm7rTDaxxFrIIZfVXsDZ5WUYMThFXxeQsf
X-Gm-Gg: Acq92OF19wgpLB2KvynXv/kxWcL0deiLwMfNQkzwKgqFInsEZCazyhgO8OEIi16lEcq
	O1P+cNONM5YPPDWqJ2CpbZPaP6hpuw43Rs441+4FEsPj1B1sDBTdSm1HRo8ZA11qrb2YhC/Ztk+
	rXCF/YcIVqQcVvyD5NSIPPA+mK8tJd5IfbCSkrQZJ714x7IDAfh+2gjfDttW72/rT0Uq3BUbwwy
	E3+cSNur2CGn1RyvWBioN33AS7aFMJV3KFdlCUAzE+K/qMvSoACudtQhKFkfFiHAxdOC8AgyNwQ
	v+JXQtCABQ9IHDoKgBJocdeW5AL4IILSve5b0jtUI3q26Y5TaS4FA74CvT9P37t+POZa6VkhCxb
	ySqSwmXyqYrKlRaXyRzi3ww4N1Hc7BQhHuODvSz6IKJ7b0CEpVwZA8tHlIOBdGWOFj/LTMrQJLz
	XJl+Y=
X-Received: by 2002:a50:cc4b:0:b0:687:7fc4:1ea5 with SMTP id
 4fb4d7f45d1cf-68c8d0076fbmr934151a12.23.1780114715584; Fri, 29 May 2026
 21:18:35 -0700 (PDT)
Precedence: bulk
X-Mailing-List: sashiko-reviews@lists.linux.dev
List-Id: <sashiko-reviews.lists.linux.dev>
List-Subscribe: <mailto:sashiko-reviews+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:sashiko-reviews+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20260530030152.49759-1-rosenp@gmail.com> <20260530031259.A630B1F00893@smtp.kernel.org>
In-Reply-To: <20260530031259.A630B1F00893@smtp.kernel.org>
From: Rosen Penev <rosenp@gmail.com>
Date: Fri, 29 May 2026 21:18:23 -0700
X-Gm-Features: AVHnY4LE4rbusb4FylXC6QnjDFW8i-P8aeafMpSxzTJ-JOOmjN1LqDrPgB91-lM
Message-ID: <CAKxU2N_Vc1CuONb0gwi-3afzLoEfo0+d0M9w9R9GtO-q6GpgRg@mail.gmail.com>
Subject: Re: [PATCH] bestcomm/gen_bd: fix out-of-bounds access in PSC
 parameter lookup
To: sashiko-reviews@lists.linux.dev
Cc: vkoul@kernel.org, dmaengine@vger.kernel.org, Frank.Li@kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Fri, May 29, 2026 at 8:13=E2=80=AFPM <sashiko-bot@kernel.org> wrote:
>
> Thank you for your contribution! Sashiko AI review found 1 potential issu=
e(s) to consider:
>
> Pre-existing issues:
> - [Critical] Unchecked array access in `mpc512x_psc_alloc_clock` and rela=
ted clock functions where `psc_num` derived from device tree is used to ind=
ex arrays, causing out-of-bounds reads and writes.
> --
>
> commit 7a3c433b5cd814a1fd0d2b57113cd41cb03279a5
> Author: Rosen Penev <rosenp@gmail.com>
>
> bestcomm/gen_bd: fix out-of-bounds access in PSC parameter lookup
>
> This commit fixes an out-of-bounds access issue in bcom_psc_gen_bd_rx_ini=
t()
> and bcom_psc_gen_bd_tx_init() by properly using ARRAY_SIZE() for bounds
> checking on psc_num. It also removes an unused forward declaration in
> bcom_psc_gen_bd_tx_init().
>
> > diff --git a/drivers/dma/bestcomm/gen_bd.c b/drivers/dma/bestcomm/gen_b=
d.c
> > index 8a24a5cbc2633..75d1a6f543df9 100644
> > --- a/drivers/dma/bestcomm/gen_bd.c
> > +++ b/drivers/dma/bestcomm/gen_bd.c
> > @@ -315,7 +315,7 @@ static struct bcom_psc_params {
> >  struct bcom_task * bcom_psc_gen_bd_rx_init(unsigned psc_num, int queue=
_len,
> >                                          phys_addr_t fifo, int maxbufsi=
ze)
> >  {
> > -     if (psc_num >=3D MPC52xx_PSC_MAXNUM)
> > +     if (psc_num >=3D ARRAY_SIZE(bcom_psc_params))
>
> [Severity: Critical]
> This is a pre-existing issue, but while looking at this fix for the psc_n=
um
> bounds checking, I noticed a similar unchecked array access regression ve=
ctor
> using psc_num in drivers/tty/serial/mpc52xx_uart.c.
cross driver review. Impressive. How is anyone supposed to get anything mer=
ged?
>
> In mpc512x_psc_alloc_clock(), psc_num is calculated directly from
> port->mapbase:
>
> drivers/tty/serial/mpc52xx_uart.c:mpc512x_psc_alloc_clock() {
>         ...
>         psc_num =3D (port->mapbase & 0xf00) >> 8;
>         ...
>         psc_mclk_clk[psc_num] =3D clk;
>         ...
> }
>
> Because port->mapbase comes from the device tree via
> of_address_to_resource(), a malformed device tree could supply an address
> like 0x11F00, allowing psc_num to evaluate up to 15.
>
> Since psc_mclk_clk and psc_ipg_clk are arrays sized to MPC52xx_PSC_MAXNUM
> (which is 12 when CONFIG_PPC_MPC512x is defined), wouldn't this allow an
> out-of-bounds write of a pointer to the BSS section?
>
> The exact same unchecked psc_num calculation also appears in
> mpc512x_psc_relse_clock() and mpc512x_psc_endis_clock(), leading to simil=
ar
> out-of-bounds reads and writes.
>
> >               return NULL;
> >
> >       return bcom_gen_bd_rx_init(queue_len, fifo,
> [ ... ]
>
> --
> Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260530030152.49=
759-1-rosenp@gmail.com?part=3D1
