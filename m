Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.217.47
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1792704897;
	b=FzZRIOVvAgRJJ6HVE9PpGgbLpts2XjFY2JT4hqHCB3riCdx/+hzXlmM6nXpLry8pu6QQ
	 qSuSuaYF8LRMn09UjyoC4BJMG5K1VSnDhlxnu7zyL4YZ0xtVIwifkuM8hPpZl++lSdpvL
	 rKwPt8tgL1JtOMqb9nTQAXToZzO4/3HmxZCsmGBSvQjKcmzgIuHfWmmaWyymPbd4kwojb
	 lD5g5NjjeYtiJFwN5tto1g89TNg/Qt8lgYssWPeURhckOl/zcKYOYHOiixeWYm63H403p
	 Qyrf+rG2WSMh/LBaf6OR7b2K+Lj14UREdRt7fZuT2cNXjZvrbLpV5rXIvcKU0/rmLjQ==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792704897;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:MIME-Version:References:
	 In-Reply-To:From:Date:X-Gm-Features:Message-ID:Subject:To:Cc:
	 Content-Type:Content-Transfer-Encoding;
	bh=LA0xVzv55vv90cseImuUZu6G5SXRivgPxKWoy9yziNo=;
	b=iUyrB7Dwfeg9cLt0PugLxGigctqgrnNYAnTImDkiiApZLs1cqRZyqOyRu4XfUO0Cks7k
	 98eo4KNejOmJvSWRsaO/OKtQdMLTmGE05E8C3LdN6uSz7W+wuwKwog/Cx/HQhoTLO8waz
	 ZAGEClEkTlqUeU23AjWEnmu+UYQJSGDhZvA+BaUYu+60+DgonoWuHQslD1l8acsdKu1Qc
	 HWtJL8hh8at/9E2KksE7ojluPinTlpjhcOIGQ1IghCatR71rlozt2nXFhMo8VJbKwGeyG
	 7lj9IuicVQ06cYc2Vfh+Eywwgc66F61GIhjAFtBdq4BgQSEq5ZtAn6oysMjHS0dwhaQ==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b=Ez+CpNtn;
	arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.217.47
Received: from mail-vs1-f47.google.com (mail-vs1-f47.google.com [209.85.217.47])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 637DC606A321
	for <sashiko-reviews@lists.linux.dev>; Thu, 22 Oct 2026 21:34:57 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 637DC606A321
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b=Ez+CpNtn
Received: by mail-vs1-f47.google.com with SMTP id ada2fe7eead31-7cc91ddf447so119134137.2
        for <sashiko-reviews@lists.linux.dev>; Thu, 22 Oct 2026 14:34:57 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1792704896; cv=none;
        d=google.com; s=arc-20260327;
        b=hO71DYyZF/nPOH5nQN4nMQsLhIWx8gJ7Pq+zjDiSyGvCpxysENjkW+P6h+WFr7znU+
         dI8YZW/KnZfhSVysmbdu0ngPag3kAZAQ6AXKb6GCX53XWOb3XtPgVyt1XJTS2jTOOAIH
         V+xfeVpxpvgt956Yyzv1jkCNBlMINGKZv3HiXh7rmReLvTPQGvyBKlT0P3ZvCiehF/Gk
         c7hFV753U4OaZ9jTbGlIpoLf7PCXV8R4tJQA+Gaz5EICYd1eX8Fum5GzjNb/rjdE9wk/
         GfClT/b7USunIUwPDUu8i9AMPJbsBo00kUxNnHI0rb+79ACQ919wg9lkVmCB5GdStwKW
         iKNQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=LA0xVzv55vv90cseImuUZu6G5SXRivgPxKWoy9yziNo=;
        fh=LrM3G6RcmBZ425pLRY8E44TM1XcCb9gU9D3viVl1X8E=;
        b=RZ6fKXGlcxklt4CFmKfb+ZDlAWS4UCXo5GC32yLbg25g1QTYab78F/UFJwJLmGPJAf
         HRuVbzJK2qMlGnH8sDH1h7B0UC5o4Fc8ZpylujLaZrtv4X2tZJC+ht0hNEv4u8nON1nP
         tYFRmM6CtV9i++VkZi/b8bdqkFDmCjGSwfoYcT2Oiz+AggXkGnM8SjBKCPbnHAwu+v0+
         6wTg3FJPUOazUkOlOJkB6SsU+rJUpG1ODcM2rTAS7NCUlVv/EWIPsW97sVnUnI2c9VWL
         YxY7yyfQGsdvq29+QuggQRyGLVv0sr6LZ+GETb/TBecLRrMVn86TTdLzzVaMq2cOB7RW
         /v/Q==;
        darn=lists.linux.dev
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1792704896; x=1793309696; darn=lists.linux.dev;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=LA0xVzv55vv90cseImuUZu6G5SXRivgPxKWoy9yziNo=;
        b=Ez+CpNtnd3UH5o3AIE1Qzg17bdss7C+sMswlXPPa8IGsxVpaRJgpjgWVxqIKhWT4tr
         ThG1cozt7ARrkI7BRULIOtB1aq+Iz4SxolxT4hk22kxm5MoVyqt0gyg2JzLcnyD5wSCp
         kG7q9R7e9H5cx/3wYzeX7seSd2re5lsqSwlO2j4XNeFSc/Sp20k4g5IwR9Ckej1UCxF+
         KmiclW5DISwP0AudfQIqvAEWt3AdtVzcWB0tCkIwkwZYuvN7E/a4nI8LQeUsPMG64YIU
         PW2eBmedI1Hv9ySQIMoF75VwCV2mpxyNtajAGBzAR/8aXaQ/ZxFouxukflm3JUzJS3gW
         Hmgg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792704896; x=1793309696;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=LA0xVzv55vv90cseImuUZu6G5SXRivgPxKWoy9yziNo=;
        b=EzKfjw02FEYNR3E+WkKtj/sxFuQ0hqn0Wysu9oSrUxJ2sMf5gHfpHeBkuQ/erIjV1c
         gNwgUAcP6G6mCrqIYW4DI7AxoEuI7RdaaZK1fbtqAGqXO4EPrTo4GfrszDnTAtpV/IKG
         wYYdh8GW4G7MkNC3VIC9mqF8FlJrmlgbG95iLpP8gy3E2CO2WucC6wVWDAFCaqDo2fcB
         cEO5T5g9WB/dg2n3iTOFyYuP+/7hvttUW/ShzL7+eFv+KyGx3tkng3/+RaeO55ctKgPe
         IjzAo5B8kD3aDG/IrQ+W2fQCP3GAYgwWHOxVJnR8srDXta3GyKutvCd32YIdMzLi9oiv
         YYUg==
X-Gm-Message-State: AFq9FYIb1AUwvSZiDP8HgGNXQcMAriJu6OXRNFjLZrfmxEoPuyQyVPJf
	fbohsqmVNhvodtOpfARv7QG0RkonYPjmQ5C7tmpG2T2OS5gBl5hp5Rh1KpgSdgayE2YKL5cSL0N
	Ybzf9wR8DdJKQWmAQjlJu0PIt9a/6+PsPxBR9A10=
X-Gm-Gg: AYBFou1x81cZc404blg3//teuCl1sKQ0582E7ToYZ242XnzWOt+XuiXQNwK5l6S0FzJ
	CPVIm1QqVY1tvkV6CbeoN/XFD76grrJ1pD490k74gecMI1qnDTOGGcbQAUSJTsdteZbhUaoAem6
	FrjNObQy+7+DDio9ZEDeJK2cGNiSMojqFn0ZSSugV5yOYMaA23uVjC6vDVRPFPsYHtslUgesfej
	hJKe6XCeaLkSdbN00+soeN3l27RbQQNKnP5cnvpOVXFh/huceX8G5fZt4p0rRTCvwjTrWCShwZ5
	nODSKdHxtjtcStL1ZKDUMVr0SNEZNwECjTrEx97GJa8ZGBRf+9fLippwPRLRYGfSWGWe4d6nxzt
	jZI2L6SEmOpkphtfDaYB9Jprvs1woBlnm3hOWF/F7lclN9q5YTvNyVWHLEjxynwUal5hwZcCEes
	rLfdkrQmD/qi8xQHuBTPPOW0BbifOUuqOusP4Ea2Ir5Sv/luwqJnOL836dDhFhqdXbJJy2TDlis
	QtgST4YvnPEYysKe3tyGWLZokQ9+Q==
X-Received: by 2002:a05:6102:4448:b0:7c0:1d48:b2a2 with SMTP id
 ada2fe7eead31-7ccc34426d7mr180886137.31.1792704896300; Thu, 22 Oct 2026
 14:34:56 -0700 (PDT)
X-Mailing-List: sashiko-reviews@lists.linux.dev
List-Id: <sashiko-reviews.lists.linux.dev>
List-Post: <mailto:sashiko-reviews@lists.linux.dev>
List-Help: <mailto:sashiko-reviews+help@lists.linux.dev>
List-Subscribe: <mailto:sashiko-reviews+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:sashiko-reviews+unsubscribe@lists.linux.dev>
List-Owner: <mailto:sashiko-reviews+owner@lists.linux.dev>
Precedence: list
MIME-Version: 1.0
References: <20261022-submit-mtk-uart-dma-terminate-atomic-v1-v1-1-aa498ba5da25@gmail.com>
 <sashiko-outbox-182061@kernel.org>
In-Reply-To: <sashiko-outbox-182061@kernel.org>
From: James Hilliard <james.hilliard1@gmail.com>
Date: Thu, 22 Oct 2026 15:34:45 -0600
X-Gm-Features: AclHuK8XSvw8qsK2rLsmYRH4GbjeZAAeNXGi3DQaPA1mpnSYabxmiTKjlnStHRg
Message-ID: <CADvTj4qMcb48RucqxGxL7qqdu7dDbUw0pSBX7v-t2Q9+MbmfGA@mail.gmail.com>
Subject: Re: [PATCH] dmaengine: mediatek: uart: make channel termination atomic
To: sashiko-reviews@lists.linux.dev
Cc: dmaengine@vger.kernel.org, vkoul@kernel.org, Frank.Li@kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Thu, Oct 22, 2026 at 3:25=E2=80=AFPM <sashiko-bot@kernel.org> wrote:
>
> Thank you for your contribution! Sashiko AI review found 1 potential issu=
e(s) to consider:
> - [High] dmaengine: mediatek: dangling c->desc in mtk_uart_apdma_terminat=
e_all()
> --
>
> commit add32020b23bda4849b015bc2e7b816090491c89
> Author: James Hilliard <james.hilliard1@gmail.com>
>
> dmaengine: mediatek: uart: make channel termination atomic
>
> This commit updates mtk_uart_apdma_terminate_all() to serialize hardware
> channel termination under c->vc.lock using atomic register polling instea=
d of
> sleeping polls and synchronize_irq(). It also checks VFF_INT_FLAG in
> mtk_uart_apdma_irq_handler() under c->vc.lock in case termination already
> acknowledged the interrupt, and aborts descriptor cleanup if stopping the
> channel times out.
>
> > diff --git a/drivers/dma/mediatek/mtk-uart-apdma.c b/drivers/dma/mediat=
ek/mtk-uart-apdma.c
> > index f74e9a3285887..73d4b701ac858 100644
> > --- a/drivers/dma/mediatek/mtk-uart-apdma.c
> > +++ b/drivers/dma/mediatek/mtk-uart-apdma.c
> > @@ -256,6 +256,12 @@ static irqreturn_t mtk_uart_apdma_irq_handler(int =
irq, void *dev_id)
> >       unsigned long flags;
> >
> >       spin_lock_irqsave(&c->vc.lock, flags);
> > +     /* Termination may have acknowledged an interrupt before we got t=
he lock. */
> > +     if (!mtk_uart_apdma_read(c, VFF_INT_FLAG)) {
> > +             spin_unlock_irqrestore(&c->vc.lock, flags);
> > +             return IRQ_NONE;
> > +     }
> > +
> >       if (c->dir =3D=3D DMA_DEV_TO_MEM)
> >               mtk_uart_apdma_rx_handler(c);
> >       else if (c->dir =3D=3D DMA_MEM_TO_DEV)
> > @@ -400,10 +406,12 @@ static int mtk_uart_apdma_terminate_all(struct dm=
a_chan *chan)
> >       LIST_HEAD(head);
> >       int ret;
> >
> > +     spin_lock_irqsave(&c->vc.lock, flags);
> > +
> >       mtk_uart_apdma_write(c, VFF_FLUSH, VFF_FLUSH_B);
> >
> > -     ret =3D readx_poll_timeout(readl, c->base + VFF_FLUSH,
> > -                       status, status !=3D VFF_FLUSH_B, 10, 100);
> > +     ret =3D readx_poll_timeout_atomic(readl, c->base + VFF_FLUSH,
> > +                                     status, status !=3D VFF_FLUSH_B, =
10, 100);
> >       if (ret)
> >               dev_err(c->vc.chan.device->dev, "flush: fail, status=3D0x=
%x\n",
> >                       mtk_uart_apdma_read(c, VFF_DEBUG_STATUS));
> > @@ -415,11 +423,14 @@ static int mtk_uart_apdma_terminate_all(struct dm=
a_chan *chan)
> >        * 3. set stop as 0
> >        */
> >       mtk_uart_apdma_write(c, VFF_STOP, VFF_STOP_B);
> > -     ret =3D readx_poll_timeout(readl, c->base + VFF_EN,
> > -                       status, !status, 10, 100);
> > -     if (ret)
> > +     ret =3D readx_poll_timeout_atomic(readl, c->base + VFF_EN,
> > +                                     status, !status, 10, 100);
> > +     if (ret) {
> >               dev_err(c->vc.chan.device->dev, "stop: fail, status=3D0x%=
x\n",
> >                       mtk_uart_apdma_read(c, VFF_DEBUG_STATUS));
> > +             spin_unlock_irqrestore(&c->vc.lock, flags);
> > +             return ret;
> > +     }
> >
> >       mtk_uart_apdma_write(c, VFF_STOP, VFF_STOP_CLR_B);
> >       mtk_uart_apdma_write(c, VFF_INT_EN, VFF_INT_EN_CLR_B);
> > @@ -429,9 +440,6 @@ static int mtk_uart_apdma_terminate_all(struct dma_=
chan *chan)
> >       else if (c->dir =3D=3D DMA_MEM_TO_DEV)
> >               mtk_uart_apdma_write(c, VFF_INT_FLAG, VFF_TX_INT_CLR_B);
> >
> > -     synchronize_irq(c->irq);
> > -
> > -     spin_lock_irqsave(&c->vc.lock, flags);
> >       vchan_get_all_descriptors(&c->vc, &head);
> >       spin_unlock_irqrestore(&c->vc.lock, flags);
>
> [Severity: High]
> When mtk_uart_apdma_terminate_all() runs while a transfer is active on th=
e
> channel (for example, via dmaengine_terminate_async() from
> serial8250_tx_dma_flush() or serial8250_rx_dma_flush()), does c->desc rem=
ain a
> dangling pointer to freed memory?
>
> When a transfer is started in mtk_uart_apdma_issue_pending(), the active
> descriptor remains on c->vc.desc_issued while c->desc points to it:
>
> drivers/dma/mediatek/mtk-uart-apdma.c:mtk_uart_apdma_issue_pending() {
>         ...
>         if (vchan_issue_pending(&c->vc) && !c->desc) {
>                 vd =3D vchan_next_desc(&c->vc);
>                 c->desc =3D to_mtk_uart_apdma_desc(&vd->tx);
>         ...
> }
>
> The only place that clears c->desc is mtk_uart_apdma_chan_complete_handle=
r(),
> called from mtk_uart_apdma_irq_handler():
>
> drivers/dma/mediatek/mtk-uart-apdma.c:mtk_uart_apdma_chan_complete_handle=
r() {
>         struct mtk_uart_apdma_desc *d =3D c->desc;
>
>         if (d) {
>                 list_del(&d->vd.node);
>                 vchan_cookie_complete(&d->vd);
>                 c->desc =3D NULL;
>         }
> }
>
> In mtk_uart_apdma_terminate_all(), VFF_INT_EN and VFF_INT_FLAG are cleare=
d
> under c->vc.lock (so any pending mtk_uart_apdma_irq_handler() sees
> !mtk_uart_apdma_read(c, VFF_INT_FLAG) and returns IRQ_NONE early), and
> vchan_get_all_descriptors(&c->vc, &head) splices c->vc.desc_issued into h=
ead
> before vchan_dma_desc_free_list(&c->vc, &head) frees the descriptor.
>
> Because c->desc is not cleared during termination, subsequent calls to
> mtk_uart_apdma_issue_pending() will see a non-NULL c->desc and refuse to =
start
> any new transfers on the channel, and any later interrupt on the channel =
would
> dereference the freed descriptor in mtk_uart_apdma_rx_handler() and
> mtk_uart_apdma_chan_complete_handler().
>
> Should mtk_uart_apdma_terminate_all() also set c->desc =3D NULL while hol=
ding
> c->vc.lock?

This issue is fixed separately here:
https://lore.kernel.org/all/20261022-submit-mtk-uart-dma-retire-v1-v1-1-3f9=
b99a9d89a@gmail.com/

>
> >
> >
>
> --
> Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20261022-submit-m=
tk-uart-dma-terminate-atomic-v1-v1-1-aa498ba5da25@gmail.com?part=3D1
