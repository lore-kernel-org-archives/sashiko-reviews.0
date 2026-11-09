Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.222.53
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1794203885;
	b=CSdUg8Gjht1o7TyQHhvK7kUx1GClXH5NngKw983U+SWryiZP2STw/sEu9SErg2qsEsGy
	 Pwd5UhdZGH/cO/5dlPvFEwXZTJV7/OmLElbwvFI3AJlxtztN/i259IGGc/2V41KfX8Djh
	 2oE6PUxez/WvAYaRvVMCb8c5Oc1SgZXL/WSVIwVqAkFFcBju24+3ZhJZXpg1MuZYzauZ0
	 lTfqcZP2tThzpfsFxPLKKO6hX/weoTAuC9dOouJoRNvUM6gkcikLR6ltHhFYcxfSNdmci
	 6VpWnqOLW8ip7mX0cDZDnxAvd5TqWe/7xoEzyuO6ZJsONmffYYSRydCfMTOJ9jEopIg==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794203885;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:MIME-Version:References:
	 In-Reply-To:From:Date:X-Gm-Features:Message-ID:Subject:To:Cc:
	 Content-Type:Content-Transfer-Encoding;
	bh=/WzA1TTGgDM/gMmbtBmts5e4EgZIL/YxOR4bvQ02Ea0=;
	b=wMRdCSeY9pfAN3bGjTnVxnUQl6mBtqcTL897KsqW+ew08hIcGhVDKasWUD72iUnEdI76
	 BCTEfeeXrF/SsIzjs00LNOmrXJpDR+Z9JIAGTg3Mb0WijFcMDq3ZD9ccDAvp+BsEYdb1D
	 EQ3FZ7WwGFyrTaNzfqkMhCYCEVvJICkjmzWUcRaH+8wB7C1mMkCKXdUjV9weM/HtrbCdi
	 RYLFG7GgyetivCVMaq+1XhA8wrixRRQHACBAC7B+D4b6oqaQPn3V/Js+mcazH6w84e4p3
	 LZ6MZH9p4tzH84yDBHNEpz46F4DfmqrofYOeGana/aEDQpu9VLBAefFUIaba7fbsP8w==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=StzEGAPI;
	arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.222.53
Received: from mail-ua1-f53.google.com (mail-ua1-f53.google.com [209.85.222.53])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 65CF7606A31C
	for <sashiko-reviews@lists.linux.dev>; Mon,  9 Nov 2026 05:58:05 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 65CF7606A31C
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=StzEGAPI
Received: by mail-ua1-f53.google.com with SMTP id a1e0cc1a2514c-9999f21f617so93701241.1
        for <sashiko-reviews@lists.linux.dev>; Sun, 08 Nov 2026 21:58:05 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1794203884; cv=none;
        d=google.com; s=arc-20260327;
        b=pSVgbwB9LBarj5qumiPBcKQa43F6+cNG3PoWnSRNV8BqLH9ra9zANuf1qXRWftbSJl
         yo4BVhkQUSNZYq2NWuCJhd+lOjjkLJK33zX3YSD/PeyF4WsuPtwECYhxzjMwRS9z1pEZ
         AxG43DdJOiHs4iX9W765k3TkyC/OfGLzROSvw2CF46w6IF3GQcmmHFpwZGbnEK58E/br
         ai6Jhvv6PTT8A53vaMCK1YqCgruBgHpwmHUcTabYJNaSH+ftkBAm2dp/psEXSUbWpHmD
         AcfNjW8lKw52yOGMqlnXYBlp/sjDfE1lbCysJmYUm98WKKxY0q/7gMSySfpyJsBP70iV
         hEQQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=/WzA1TTGgDM/gMmbtBmts5e4EgZIL/YxOR4bvQ02Ea0=;
        fh=LrM3G6RcmBZ425pLRY8E44TM1XcCb9gU9D3viVl1X8E=;
        b=shhZf57PsuAB7sR8lcd8sKXhl2azBnzrQM7HmyhBFMcf9JLjub4EFKEU1S20GmaQGy
         Kd3VyZyIVXSX7MCBintUZ0RTpwVxuKCW4rSEs0Zp+1aFnE2JHEjgoV4/gbt3xy7y6meu
         1O+m5Dnj0pFHPCL6HKkgtVWDEd/pNZRBCN4Z1KZ3SXLnt5rTBYVrHVSJMncdCxEkUhVn
         chPelMrJpFxzfZcTNNscm2415xd9kofXCZm4hRgpzW5q2TQfX/yBh8cg4olGBq3H+AqR
         +UkTd+lTM0Q4wf8R/UkcmYhO+mNyk2OK+Os+uziBLwcwBQ7Q8tMhHeUVG3div0Rtrkf4
         edog==;
        darn=lists.linux.dev
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794203884; x=1794808684; darn=lists.linux.dev;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=/WzA1TTGgDM/gMmbtBmts5e4EgZIL/YxOR4bvQ02Ea0=;
        b=StzEGAPIs7nUImZPBLO9v4C0srPMpR4pOeEuTiuplRz5PUgun4FvMc5Nmto5nFmTEo
         bvJMwbZAZk1ltneghtOK01DklviHJhSGJkvE8nHZsuzxInlva7XzOp6TBDsbCBrdocJz
         sL2XzBeCxGJhYvrrtReMh5R5sGS76oJDmh5ieO+IrzaRyTAhjtcgif6OBiYxSVriFxFM
         HnYb9t19GRxRWah+sIKv2coprsJANbfXdmXCtUonP4GKjCFl1tK/pZ/5FdIwuzJnDkzS
         jyumOJGUk/maoLc9fjV86ynynVheLaW+l+j31niB3tfAn6PINhUS1DUCdYF4M3QUOKyQ
         oNkw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794203884; x=1794808684;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=/WzA1TTGgDM/gMmbtBmts5e4EgZIL/YxOR4bvQ02Ea0=;
        b=0pMbWYHojfbU7Ax+HqOz/d46JeCxr2sxonGfcK3pPP2iRhFKMeHKuCfXLMUXyoGNkH
         9bTkG4lPTFD96Docvz9xLmv6jXyNa95clt+oFKtl16Y/8tf4yiIoTiYo+0wdsctTohrK
         oHaHS0qZ01RoFYB7x7YJdR2RaJs4AkyGImJRqBM1fmXK9FJVbea2RQhJFd6Xpg/tNXoy
         0zhUQn4kS+ZKlqVBA+rjcVASuIbppjoKCimmWjxB7+YtQf+0DAj3k6OXvrgxkhyLiT4o
         /g/LTQ1QTVgWT+5JS2Nw2gf+KYkMQus18Ii5erNl+m6kwy/UHZjZ4pyPBmI+JwPCQErK
         Xpcw==
X-Gm-Message-State: APuU4Z89TKLLuyGNrL1YHg0LSsjHlTOBL/wFkiHudctP8piPPAyMVLB1
	ZhuRtSwdIHAs4wmlwToaJYgjOLLP69PY+Ng3shLBr5gorsUKEQ6hk9q3RPLXY/sUVY+R0WWr6Nh
	KXWZFyBDM2a1j7YN+BEIV1jRzQbYbzKCZBVrECOk=
X-Gm-Gg: AYBFou0BozhIh3NYJ7WeVzHfhqL8PY4dqjnA4Hhmy2Pg4nE/la+rIXF9X4b4Cre7A+B
	uFLiuFI0p/nT8o1N7f7FttRIIIVjLDo5hgKisKpWHSVk8oJ9NvrUoo8mE7MKzOfAFHLXkXST2JI
	utyXAoLQbdW8VvUhx36GljLkwercMz8G08AQV9I4A0p90bqaAkjye0iwnDdfISk/JgkCG5mbTEe
	BdjPWkpNn5iU7EJAcKaiUqkEzVetAVY6mkJkbiD6MlFW1r9z2ZOmfY0C0ctvMHdQOWZ1k/IdFN6
	eCOLb6vTAatepgE+Z7yJUkgNRSLxfKatmynjyxR3BIMQgko/WdHYyGXirTayXEH0iD5Jh3yqTcK
	01NLLVCkjrQaZPmUepGyYvXLTSBhD4wKAzh/O/vMftkhFHp6VWrb+/kbw1FHz38Ndl+cQMfgfR0
	q4Pd3XhpO8W37XJECdr8y/JLLPA3c5IlKkf/fJwp3W+FlXhn6A4QZKftzwDfuejJFF2Dqj+J6IU
	2neyRz5rcUqXX/ztwenvaA374Iuqw==
X-Received: by 2002:a05:6102:161f:b0:7bf:74c1:b606 with SMTP id
 ada2fe7eead31-7d2db271d90mr715189137.34.1794203884276; Sun, 08 Nov 2026
 21:58:04 -0800 (PST)
X-Mailing-List: sashiko-reviews@lists.linux.dev
List-Id: <sashiko-reviews.lists.linux.dev>
List-Post: <mailto:sashiko-reviews@lists.linux.dev>
List-Help: <mailto:sashiko-reviews+help@lists.linux.dev>
List-Subscribe: <mailto:sashiko-reviews+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:sashiko-reviews+unsubscribe@lists.linux.dev>
List-Owner: <mailto:sashiko-reviews+owner@lists.linux.dev>
Precedence: list
MIME-Version: 1.0
References: <20261108-submit-dw-axi-dma-stop-pause-v1-v1-0-c48ec19e9ee4@gmail.com>
 <20261108-submit-dw-axi-dma-stop-pause-v1-v1-3-c48ec19e9ee4@gmail.com> <sashiko-outbox-204425@kernel.org>
In-Reply-To: <sashiko-outbox-204425@kernel.org>
From: James Hilliard <james.hilliard1@gmail.com>
Date: Sun, 8 Nov 2026 22:57:53 -0700
X-Gm-Features: AclHuK9BMIiVNXAgZ5ZFv46VfSdrHHwTcF3dDjHcf25xaomgelb6ZCm9ZeLGtEo
Message-ID: <CADvTj4pFnQUBDvMMXNN-JyKpMNhTApZE-Ot1dqXjLMrkh+3hXw@mail.gmail.com>
Subject: Re: [PATCH 3/3] dmaengine: dw-axi-dmac: preserve suspension status
 until pause observes it
To: sashiko-reviews@lists.linux.dev
Cc: dmaengine@vger.kernel.org, vkoul@kernel.org, Frank.Li@kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Sun, Nov 8, 2026 at 10:17=E2=80=AFPM <sashiko-bot@kernel.org> wrote:
>
> Thank you for your contribution! Sashiko AI review found 2 potential
> issues to consider:
> - [High] dmaengine: dw-axi-dmac: hardware suspend bit left set when
>   is_paused is false
> - [High] dmaengine: dw-axi-dmac: axi_chan_enable() clobbers pause state
>   in cyclic mode
> --
>
> commit 225811462c3128b58ce5d32c533d4264178f3cdc
> Author: James Hilliard <james.hilliard1@gmail.com>
>
> dmaengine: dw-axi-dmac: preserve suspension status until pause observes i=
t
>
> This commit preserves the DWAXIDMAC_IRQ_SUSPENDED status bit across the
> interrupt handler and failed pause polls so dma_chan_pause() only clears
> the status and sets chan->is_paused after observing the hardware
> acknowledgment, while resetting both in axi_chan_enable() and
> dma_chan_terminate_all().
>
> > diff --git a/drivers/dma/dw-axi-dmac/dw-axi-dmac-platform.c b/drivers/d=
ma/dw-axi-dmac/dw-axi-dmac-platform.c
> > index de092f190528a..33340f0e7462a 100644
> > --- a/drivers/dma/dw-axi-dmac/dw-axi-dmac-platform.c
> > +++ b/drivers/dma/dw-axi-dmac/dw-axi-dmac-platform.c
> > @@ -226,6 +226,9 @@ static inline void axi_chan_enable(struct axi_dma_c=
han *chan)
> >  {
> >       u64 val;
> >
> > +     axi_chan_irq_clear(chan, DWAXIDMAC_IRQ_SUSPENDED);
> > +     chan->is_paused =3D false;
> > +
> >       if (chan->chip->dw->hdata->nr_channels >=3D DMAC_CHAN_16) {
> >               val =3D axi_dma_ioread64(chan->chip, DMAC_CHEN);
> >               if (chan->id >=3D DMAC_CHAN_16) {
>
> [Severity: High]
> Can axi_chan_block_xfer_complete() clobber chan->is_paused and
> DWAXIDMAC_IRQ_SUSPENDED on a cyclic channel by calling axi_chan_enable()?
>
> In cyclic mode each segment has CH_CTL_H_LLI_LAST set, so segment
> completion raises DWAXIDMAC_IRQ_DMA_TRF and calls axi_chan_enable() to
> start the next segment:
>
> drivers/dma/dw-axi-dmac/dw-axi-dmac-platform.c:axi_chan_block_xfer_comple=
te() {
>         ...
>         if (chan->cyclic) {
>                 desc =3D vd_to_axi_desc(vd);
>                 if (desc) {
>                         ...
>                         axi_chan_enable(chan);
>                 }
>         }
> }
>
> Because dw_axi_dma_interrupt() reads CH_INTSTATUS before
> axi_chan_block_xfer_complete() takes chan->vc.lock, dma_chan_pause() can
> run in between:
>
> CPU0                              CPU1
> dw_axi_dma_interrupt()
>   status =3D axi_chan_irq_read(chan)
>                                   dma_chan_pause()
>                                     lock(&chan->vc.lock)
>                                     /* sets suspend bit in HW */
>                                     chan->is_paused =3D true;
>                                     unlock(&chan->vc.lock)
>   axi_chan_block_xfer_complete()
>     lock(&chan->vc.lock)
>     axi_chan_enable(chan)
>       axi_chan_irq_clear(..., DWAXIDMAC_IRQ_SUSPENDED);
>       chan->is_paused =3D false;    <-- clobbers pause state
>
> When axi_chan_enable() clears chan->is_paused while the hardware suspend
> bit remains asserted in DMAC_CHSUSPREG or DMAC_CHEN, a later
> dma_chan_resume() sees chan->is_paused =3D=3D false and skips
> axi_chan_resume(), leaving the cyclic channel permanently suspended in
> hardware.  If dma_chan_pause() instead timed out on CPU1,
> axi_chan_enable() also clears the late DWAXIDMAC_IRQ_SUSPENDED
> acknowledgment that a retry would look for.
>
> [ ... ]
>
> > @@ -1206,6 +1211,8 @@ static int dma_chan_terminate_all(struct dma_chan=
 *dchan)
> >
> >       vchan_get_all_descriptors(&chan->vc, &head);
> >
> > +     axi_chan_irq_clear(chan, DWAXIDMAC_IRQ_SUSPENDED);
> > +     chan->is_paused =3D false;
> >       chan->cyclic =3D false;
> >       spin_unlock_irqrestore(&chan->vc.lock, flags);
> >
> > @@ -1225,6 +1232,9 @@ static int dma_chan_pause(struct dma_chan *dchan)
> >
> >       spin_lock_irqsave(&chan->vc.lock, flags);
> >
> > +     if (chan->is_paused)
> > +             goto out;
> > +
> >       if (chan->chip->dw->hdata->nr_channels >=3D DMAC_CHAN_16) {
> >               val =3D axi_dma_ioread64(chan->chip, DMAC_CHSUSPREG);
> >               if (chan->id >=3D DMAC_CHAN_16) {
> > @@ -1258,10 +1268,12 @@ static int dma_chan_pause(struct dma_chan *dcha=
n)
> >               udelay(2);
> >       } while (--timeout);
> >
> > -     axi_chan_irq_clear(chan, DWAXIDMAC_IRQ_SUSPENDED);
> > -
> > -     chan->is_paused =3D true;
> > +     if (timeout) {
> > +             axi_chan_irq_clear(chan, DWAXIDMAC_IRQ_SUSPENDED);
> > +             chan->is_paused =3D true;
> > +     }
> >
> > +out:
> >       spin_unlock_irqrestore(&chan->vc.lock, flags);
> >
> >       return timeout ? 0 : -EAGAIN;
>
> [Severity: High]
> Does leaving chan->is_paused false when dma_chan_pause() times out, or
> clearing chan->is_paused in dma_chan_terminate_all() and axi_chan_enable(=
),
> leave the hardware channel suspend bit set with no way for
> dma_chan_resume() to clear it?
>
> dma_chan_pause() asserts the channel suspend bit in DMAC_CHSUSPREG or
> DMAC_CHEN before polling CH_INTSTATUS, and only axi_chan_resume() clears
> that bit:
>
> drivers/dma/dw-axi-dmac/dw-axi-dmac-platform.c:dma_chan_resume() {
>         ...
>         if (chan->is_paused)
>                 axi_chan_resume(chan);
>         ...
> }
>
> When the poll in dma_chan_pause() times out, DMAC_CHSUSPREG / DMAC_CHEN
> still has the suspend bit set, so the hardware suspends the channel once
> the current burst completes, yet chan->is_paused remains false.  Callers
> that do not retry dmaengine_pause() before calling dmaengine_resume() (or
> that terminate and reuse a paused channel, since neither
> dma_chan_terminate_all() nor axi_chan_enable() clears the suspend bit in
> DMAC_CHSUSPREG / DMAC_CHEN) will never run axi_chan_resume(), leaving the
> channel permanently suspended in hardware.

The failed-pause/resume case is an issue, but successful termination and
reuse are different. The CH_SUSP register description [0] states that
"CH_SUSP is cleared when channel is disabled."

dma_chan_terminate_all() disables the channel and waits for CH_EN to
clear before resetting is_paused. With patch 2/3 applied, a disable
timeout returns an error before reaching that reset. Successful
termination therefore clears the hardware suspend request without
needing axi_chan_resume().

That does not resolve the late-acknowledgment case when the channel
remains enabled after a failed pause.

[0] https://www.scribd.com/document/962771796/DW-Axi-Dmac-Databook

>
> --
> Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20261108-submit-d=
w-axi-dma-stop-pause-v1-v1-0-c48ec19e9ee4@gmail.com?part=3D3
