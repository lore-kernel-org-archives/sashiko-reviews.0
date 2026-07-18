Received: from mail-ed1-f45.google.com (mail-ed1-f45.google.com [209.85.208.45])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E2993199FAB
	for <sashiko-reviews@lists.linux.dev>; Sat, 18 Jul 2026 05:31:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.208.45
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784352701; cv=pass; b=sL2+BpB6zpdK4oYM6ETbzr3vmS5DhaXlJodOwQre9mLWYvg55m+avTrJaQtCKwD34dRACGWfvv8Wt0YzoLJK3M5cTKD7AnyDdDELnY27BRbv7wfepICxplw3dDI9PdeqjW7ZWe94IljncSjnKau0P2YjVlWNDoUcYCHlopjNG+Q=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784352701; c=relaxed/simple;
	bh=IMFfzfkyR/jKEMWGgu6BEv7/SxyIqAEI3PRVNndgoWk=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=TRCnI1iK4RG9Lcmd2y6ZrQP5eUEKwpoyRBh22Dg9Nqz7sAEglf9zNjFhZV/HYiuva0XQypKdJlASSWNPS1EDI+x5suKVixqN2P9JUb8viwrNfkVjRhYL5xZNmMcuVN9qdBPB/WRLzMXUlkSaEnVKPPsp2az3o47JNflr3PTEePc=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=a7nB+AdZ; arc=pass smtp.client-ip=209.85.208.45
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="a7nB+AdZ"
Received: by mail-ed1-f45.google.com with SMTP id 4fb4d7f45d1cf-69c1220bd51so8792396a12.3
        for <sashiko-reviews@lists.linux.dev>; Fri, 17 Jul 2026 22:31:39 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1784352698; cv=none;
        d=google.com; s=arc-20260327;
        b=AlTCFzw6OK0m/aWM0/+ZWAl4mkdiuXGwjiNri8py9TvuuYzYTrxvC8OgE07VO2slcy
         1w0Wuwe7dpzConGhR2UOweLXhiXMDbI2AO5ECA5Q+Qnhy6yC7xNS8aoYbDC+/ub5VPBK
         3k4Vxzhx8SLo7Z9wBhkltlcq+8nmptujBlXPmWFOPv8WQCnyoNpFyvMgI5b3rEp2wG5y
         WAp1SEHLs0AcmFFIKZog2iEYqvE5z38e2BVTRrNP1w7AZDV5XeOTEzooAmUy0U7l3Jc4
         Do1Trb0OPbfe5jRPXq12vrkTmAXXvT452g1cIwkC8CUJRlV2ejlnXg/rMk4KkgT4NFtE
         USfg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=bY/0bpvSuBX4pBrYgChn9XFDAOyGIiKVR1a8UoxdhOk=;
        fh=dZD3NgG1X7s6kpr5hZ2U8f/WHSVkfsXTB6YiQT1XEfs=;
        b=FdC79cjnSzdibwByLkrV0/1R25UmdZ39jsMSy8mdh7j5FuHfqES/yKPGJlMyKzhXyx
         AmS3h7qhEWago4gCHK+oGGdT9WftjOgFSmkv7dGw1T6VmsTMykbmSDq9BnBwrI3XvsoE
         sJiyrx35PnF3bRisLxvmGd61wKa5/AyYE8xhU1+YKnc2b53qveBYTcseU5kBQuqWgbdd
         x3TxkwfjlsljD56gNGsG6ygjXGSMwdu17vxjnhtnodcVSQc+kQ9Js5CWL9u1KlybOYaT
         gKsAIEoWPs3suMhbrU4ZGgUwUV1vdTpP173EcPsWMqY4CLyKubdzEpzxCDy1Tz59yKOW
         xm/w==;
        darn=lists.linux.dev
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1784352698; x=1784957498; darn=lists.linux.dev;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=bY/0bpvSuBX4pBrYgChn9XFDAOyGIiKVR1a8UoxdhOk=;
        b=a7nB+AdZor5guCz7CyFvVWp6gz5nDdZjGJS/QdDIOD+86Ywf8KIiyMyk+NmJUeOgR6
         MwHZqyOQQi2LNLeBRJKw2naPrA5NZK8ACNWYKzgfbzOpzJA930fGo6dPUSMct7XufNiu
         u1W9Jji0nLf9okpLKHBBJoZA+FfhVr948xZ2htIkxFCwkDlEsPt2KEFTuo0aC8iWUPV/
         zODlLgMzlPuRCjqBqENyxsRhf/lWwH7MlLA1PdsRYI4CxrBTG2LqV4Dv/kW4uGy1/GeM
         rdA2Lf7Uiyjakj3o1w5+JMq4Ir5/ZO/Gcde5lfpcmBJOO+wp+z+sx++K2Si5FzSMjk2U
         157g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1784352698; x=1784957498;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=bY/0bpvSuBX4pBrYgChn9XFDAOyGIiKVR1a8UoxdhOk=;
        b=d3JS2Wdz2iHPibJU7mL6vcDFcAWRtpU4WR4iHUNzmK0W2IV1NDAY3jlIszrFOifZP6
         TbNH3hSP/Fzbwc3fuNUz1aYjazHJoLSMRWZf5tpMgJiAAbAYoNA9DyGW9/P/qzDucv4l
         XKZa/5wNJLTTC3OgQakTpooFyufS+hUdVm50AH/ZZMTTK5xUoOMOALcsFr9djIeODEnp
         3kvKnNPiDIhnCLfFqdlLPGwPw+x52Y09dA7oxXPfhPaG7VT2x6OjAq+qKfNNy6IV2Tyf
         hhwAZ4DbEDdW1MLsMmNBh+uV3AR03/Ld8HCWpQzOL8YO3LsMWcZMYn0lbySduYs9Yn1a
         Eusw==
X-Gm-Message-State: AOJu0YxZS7m3vh+aW8FThkZbveuN+7Ao391ALZO8JWD51SsqJFojIvHg
	8RiEbnKig4FeLa2yeG9xFWCZjxacoAtSxcJW5U98M8Amp/mbdIzGuCjaoQbvjWxosZzT1Fx+8vD
	aFaTZziGhkHGQJiUMjl39NOOa3y1jrq2qHA==
X-Gm-Gg: AfdE7ck0LShEt3FfSq0rIXk6cDm6WYFd0en2LS7p2vPCKFmEaCPOFWWqvrmuDi86DIt
	7IPXl0izdvAXfspwWzlAXZxM164x05njvHrLLD9SFiMNO0YZSH5mKieIndpWKfmcVeNno9prr8i
	g3Y0elE9NP3HrOFnr3/Fjlx6kzsEoUOpPIQDJ84bVLiAL9fslVqx1LJidPKH6AY34fCEMJyhHDA
	t32eK9Zye0JnWV6ZwJHpfYpAXA3mFo9oyBq1MKIMsLqgXx58m9i9v5AI+hv6C4MdRhNNR44+nK0
	Pzma5tlkICwd851z61TK/RI8lqhCWy+OPW8FUqYpj6lAixdd0joUsR4bxWczvS27SIqQuKcxy+l
	fk6CLy5FzWRgI+ix14D1esPTVltTxo2alW6hLiqGV8ajHb12j+xcExt5KUoQvGDQTLTzFtdG8EX
	2X5AtoRoQ=
X-Received: by 2002:a05:6402:3884:b0:698:663d:d7bd with SMTP id
 4fb4d7f45d1cf-69e652730cbmr2055740a12.11.1784352697891; Fri, 17 Jul 2026
 22:31:37 -0700 (PDT)
Precedence: bulk
X-Mailing-List: sashiko-reviews@lists.linux.dev
List-Id: <sashiko-reviews.lists.linux.dev>
List-Subscribe: <mailto:sashiko-reviews+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:sashiko-reviews+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20260718033122.2372985-1-rosenp@gmail.com> <20260718034659.0A03B1F000E9@smtp.kernel.org>
In-Reply-To: <20260718034659.0A03B1F000E9@smtp.kernel.org>
From: Rosen Penev <rosenp@gmail.com>
Date: Fri, 17 Jul 2026 22:31:26 -0700
X-Gm-Features: AUfX_mx0m19_QeTggddpkvrYszagFFHMcDqnfmkRbjd7z_tDC3DatRC7LaSALCc
Message-ID: <CAKxU2N_TBzHSu9e8pgD4DA3uJ8+VQfSdDOrgfWbz-bwrnJe+1g@mail.gmail.com>
Subject: Re: [PATCH] dmaengine: fsl_raid: replace in_be32/out_be32 with ioread32be/iowrite32be
To: sashiko-reviews@lists.linux.dev
Cc: vkoul@kernel.org, dmaengine@vger.kernel.org, Frank.Li@kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Fri, Jul 17, 2026 at 8:47=E2=80=AFPM <sashiko-bot@kernel.org> wrote:
>
> Thank you for your contribution! Sashiko AI review found 4 potential issu=
e(s) to consider:
>
> Pre-existing issues:
Based on these. I think this should be defered.
> - [Critical] `request_irq` is used without `devm_` and is never freed on =
error paths or during device removal, leading to Use-After-Free in the inte=
rrupt handler.
> - [High] The driver configures a 40-bit DMA mask but incorrectly programs=
 the 64-bit ring base addresses, truncating upper address bits and incorrec=
tly placing the lowest 4 bits into the high address register, causing silen=
t memory corruption for high memory allocations.
> - [High] Deadlock in `fsl_re_dequeue` due to invoking DMA client callback=
 with the channel spinlock held.
> - [High] Unchecked return value of `fsl_re_chan_probe` causes a NULL poin=
ter dereference during device removal.
> --
>
> --- Patch [1]: [PATCH] dmaengine: fsl_raid: replace in_be32/out_be32 with=
 ioread32be/iowrite32be ---
> commit 9a55b4c8c34b72fe5484852d6708a7ea677fc0df
> Author: Rosen Penev <rosenp@gmail.com>
>
> dmaengine: fsl_raid: replace in_be32/out_be32 with ioread32be/iowrite32be
>
> This commit replaces ppc4xx-specific accessors (in_be32/out_be32) with
> generic portable helpers (ioread32be/iowrite32be) in the fsl_raid driver.
> It also enables COMPILE_TEST for extra compile coverage.
>
> > diff --git a/drivers/dma/fsl_raid.c b/drivers/dma/fsl_raid.c
> > index 2d86f61105e52..e559c636bf552 100644
> > --- a/drivers/dma/fsl_raid.c
> > +++ b/drivers/dma/fsl_raid.c
> [ ... ]
> > @@ -167,7 +167,7 @@ static void fsl_re_dequeue(struct tasklet_struct *t=
)
> >       fsl_re_cleanup_descs(re_chan);
> >
> >       spin_lock_irqsave(&re_chan->desc_lock, flags);
> > -     count =3D FSL_RE_SLOT_FULL(in_be32(&re_chan->jrregs->oubring_slot=
_full));
> > +     count =3D FSL_RE_SLOT_FULL(ioread32be(&re_chan->jrregs->oubring_s=
lot_full));
>
> [Severity: High]
> This is a pre-existing issue, but can this lead to a deadlock?
>
> Looking at fsl_re_dequeue(), it acquires the desc_lock spinlock using
> spin_lock_irqsave() and holds it while processing completed descriptors:
>
> spin_lock_irqsave(&re_chan->desc_lock, flags);
> ...
> if (found) {
>         fsl_re_desc_done(desc);
>         list_move_tail(&desc->node, &re_chan->ack_q);
> }
>
> The fsl_re_desc_done() function synchronously invokes the client callback
> via dmaengine_desc_get_callback_invoke().
>
> If the DMA client callback submits a new request, would it call
> fsl_re_tx_submit() and attempt to reacquire the exact same desc_lock,
> resulting in a deadlock?
>
> >       while (count--) {
> >               found =3D 0;
> >               hwdesc =3D &re_chan->oub_ring_virt_addr[re_chan->oub_coun=
t];
> [ ... ]
> > @@ -708,30 +707,23 @@ static int fsl_re_chan_probe(struct platform_devi=
ce *ofdev,
> >       }
> >
> >       /* Program the Inbound/Outbound ring base addresses and size */
> > -     out_be32(&chan->jrregs->inbring_base_h,
> > -              chan->inb_phys_addr & FSL_RE_ADDR_BIT_MASK);
> > -     out_be32(&chan->jrregs->oubring_base_h,
> > -              chan->oub_phys_addr & FSL_RE_ADDR_BIT_MASK);
> > -     out_be32(&chan->jrregs->inbring_base_l,
> > -              chan->inb_phys_addr >> FSL_RE_ADDR_BIT_SHIFT);
> > -     out_be32(&chan->jrregs->oubring_base_l,
> > -              chan->oub_phys_addr >> FSL_RE_ADDR_BIT_SHIFT);
> > -     out_be32(&chan->jrregs->inbring_size,
> > -              FSL_RE_RING_SIZE << FSL_RE_RING_SIZE_SHIFT);
> > -     out_be32(&chan->jrregs->oubring_size,
> > -              FSL_RE_RING_SIZE << FSL_RE_RING_SIZE_SHIFT);
> > +     iowrite32be(chan->inb_phys_addr & FSL_RE_ADDR_BIT_MASK, &chan->jr=
regs->inbring_base_h);
> > +     iowrite32be(chan->oub_phys_addr & FSL_RE_ADDR_BIT_MASK, &chan->jr=
regs->oubring_base_h);
> > +     iowrite32be(chan->inb_phys_addr >> FSL_RE_ADDR_BIT_SHIFT, &chan->=
jrregs->inbring_base_l);
> > +     iowrite32be(chan->oub_phys_addr >> FSL_RE_ADDR_BIT_SHIFT, &chan->=
jrregs->oubring_base_l);
>
> [Severity: High]
> This is a pre-existing issue, but does this correctly program the 64-bit
> DMA base addresses?
>
> The driver advertises 40-bit DMA address support in fsl_re_probe() by
> calling:
>
> dma_set_mask(dev, DMA_BIT_MASK(40));
>
> However, when writing the physical addresses here in fsl_re_chan_probe(),=
 it
> shifts the address right by FSL_RE_ADDR_BIT_SHIFT into inbring_base_l, an=
d
> extracts the lowest bits via FSL_RE_ADDR_BIT_MASK into inbring_base_h.
>
> If a DMA buffer is allocated above the 64GB boundary, will this drop the
> upper bits and extract the lowest bits into the high register, leading to
> the hardware reading or writing the wrong physical memory?
>
> [Severity: Critical]
> This is a pre-existing issue, but is there a missing IRQ cleanup here?
>
> Earlier in fsl_re_chan_probe(), the driver requests an interrupt without
> using the managed devm_ wrapper:
>
> ret =3D request_irq(chan->irq, fsl_re_isr, 0, chan->name, chandev);
>
> If fsl_re_chan_probe() fails later, or if the driver is unbound and
> fsl_re_remove_chan() is called, free_irq() is never called to unregister
> the handler.
>
> Since the chan structure is allocated with devm_kzalloc, will a dangling
> interrupt firing after the device is removed cause fsl_re_isr() to
> dereference the freed chan pointer and crash?
>
> > +     iowrite32be(FSL_RE_RING_SIZE << FSL_RE_RING_SIZE_SHIFT, &chan->jr=
regs->inbring_size);
> > +     iowrite32be(FSL_RE_RING_SIZE << FSL_RE_RING_SIZE_SHIFT, &chan->jr=
regs->oubring_size);
> [ ... ]
> > @@ -766,15 +758,15 @@ static int fsl_re_probe(struct platform_device *o=
fdev)
> >       re_priv->base =3D re_regs;
> >
> >       /* Program the RE mode */
> > -     out_be32(&re_regs->global_config, FSL_RE_NON_DPAA_MODE);
> > +     iowrite32be(FSL_RE_NON_DPAA_MODE, &re_regs->global_config);
>
> [Severity: High]
> This is a pre-existing issue, but are we missing an error check on the
> return value of fsl_re_chan_probe()?
>
> Later in fsl_re_probe(), the driver iterates over child nodes and calls
> fsl_re_chan_probe(), but ignores the return value and unconditionally
> increments total_chans:
>
> for_each_child_of_node(np, child) {
>         rc =3D of_device_is_compatible(child,
>                                      "fsl,raideng-v1.0-job-ring");
>         if (rc) {
>                 fsl_re_chan_probe(ofdev, child, ridx++, off);
>                 re_priv->total_chans++;
>         }
> }
>
> If fsl_re_chan_probe() fails (for example, failing to map an IRQ), the ar=
ray
> element re_priv->re_jrs[ridx] remains uninitialized.
>
> During module unload, fsl_re_remove_chan() unconditionally dereferences t=
he
> pointer when calling tasklet_kill(&chan->irqtask).
>
> Will this result in a NULL pointer dereference on cleanup if any channel
> failed to probe?
>
> >
> >       /* Program Galois Field polynomial */
> > -     out_be32(&re_regs->galois_field_config, FSL_RE_GFM_POLY);
> > +     iowrite32be(FSL_RE_GFM_POLY, &re_regs->galois_field_config);
>
> --
> Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260718033122.23=
72985-1-rosenp@gmail.com?part=3D1
