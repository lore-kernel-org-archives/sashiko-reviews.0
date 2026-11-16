Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.221.174
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1794804381;
	b=fEWM2/QWczDA9XdU98qi4aEvfxUg8mi97AeGuclIgl0T9eVr6XyIBLNDgkZZ/mGtkPoP
	 u1vdmfR9ULiLYoBBfGXFjnflMhlpgtq5Jy3D+5leQ4tifLuULJrlLGXknnxuYn9qX/3Fs
	 4O9fahAbyw4AbGi2mNU0twLAFPQLvqYiHVZNsWF2q2xYNeKnHffMSOXdtM9Ii8A2ECfer
	 CJwz05eFeAsGULFiKyVJWu0zORV+hMcBOLqV5EGBMdjUTD0IKzTFCHM2p1WDBrtCevDUL
	 EzgafnD+yAt98P9KlmepHLKLgwlTJ4E2h+oFvo4hEO4mpLhXYn0BLl3e3VdYEgoppvQ==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794804381;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:MIME-Version:References:
	 In-Reply-To:From:Date:X-Gm-Features:Message-ID:Subject:To:Cc:
	 Content-Type:Content-Transfer-Encoding;
	bh=w7erbnR19mqIv74o/0UajIn9fUvIg8kyqoliwm7QkJE=;
	b=F448Eu8gvvP5hVq3PnKgm8rvJye+NKPi2U2rKzeT4d2e9FwZ5h1SpGxDKQuoeDFys5sr
	 kOeqln8o935UBmkVPakXl179DweV9OQKacSCCfwi73ka6OFeV2lO7l+vg5IHnkgza43vd
	 NrXpAQ0S8MWqo6BAXzN4Wi6OaHcN0yStsb858TP+hPmIbbNCbkYWWORd0qi7NbSd3zYbo
	 zRaiKkc+snu0pFKQ/PA4G6JuA3lz5pPrl2uHh9w6F1soot+LetY/vyC03hgPm7gdwX6hf
	 2FITLgmeh1GdPcSXlXIwKhP6dZOYKFqZDu2tMXuEXndSclTWAzjsRSfOmniMDe7Ruqg==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=Ur7PgMEx;
	arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.221.174
Received: from mail-vk1-f174.google.com (mail-vk1-f174.google.com [209.85.221.174])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 30341606A321
	for <sashiko-reviews@lists.linux.dev>; Mon, 16 Nov 2026 04:46:20 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 30341606A321
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=Ur7PgMEx
Received: by mail-vk1-f174.google.com with SMTP id 71dfb90a1353d-5eac01ff101so993031e0c.2
        for <sashiko-reviews@lists.linux.dev>; Sun, 15 Nov 2026 20:46:20 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1794804380; cv=none;
        d=google.com; s=arc-20260327;
        b=f1DJep4yXK9HI0nWUeqxBLHtMpXiMX/YLe/zzC7WxK9X63rO/LXubHO7uVDtL7C5hx
         rmBUFTq7A29r+IytdGwuu8qTGJbUtbyMhkuYkfujQFQFW4QTDvM7ElBBv1WSZIEYQAJH
         Mk4VvZt3kYC1NYK0phXqM4mpNrGD6jg1GKjSzf3vB8EZuy/Q87P5T17MK8To0jezSZVL
         w8abNupneVILbUFOT+Oo1+kGZJyT+1R6J9/Wt4wlbYGLUNdzDLKawwpf5ehDD5Ngun1v
         IR2jIGjbUmxumNSplqr+RUlqumatRmk2uQc418wV7VmYfYd3FDgNvsmS9cH7VdeXThUN
         oLyg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=w7erbnR19mqIv74o/0UajIn9fUvIg8kyqoliwm7QkJE=;
        fh=LrM3G6RcmBZ425pLRY8E44TM1XcCb9gU9D3viVl1X8E=;
        b=VkyIpvBEgvZw4WYxIZzShRIpeDLTl5uD5v0gbYLJvycGWmSpR79MnsiJlHhGLFGSE+
         /EQdq0NgwQD95BuUleF6BxPDYf2p66KO370nUWOz3QVJjCssVYNAGmDYOuzSenRe3Sms
         5gizY3TW7bVfvg5fD1Da1WeWe7ZMKXVnBWE93e3CCGl92Lde5o1Unsl9kpX/VwUaqPAg
         URKJLliUjvUGbP0E/bSfPzwPDQZrGrdy20Qna9sXqprF0/M3iECF11yNFXCX4nfWjxSz
         2Zm309lWEvEVrpRnSF5pfG7k3W2sO7kAGkpJXI7Y7FXnBIPSysptAldtFdorUFTpCPyn
         VNrQ==;
        darn=lists.linux.dev
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794804380; x=1795409180; darn=lists.linux.dev;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=w7erbnR19mqIv74o/0UajIn9fUvIg8kyqoliwm7QkJE=;
        b=Ur7PgMEx3iPOienhDwnmTLd41NiTMXAIYEaJt+ex9YgWdaSQjAbdId2xmXgwOOlFyb
         arNFC7YMxzaM2HWaXQ8E+aSK22iTHDWHxgi5OfPLo5eXAFzNB9ZSvaRELLQCza7b4x9s
         hO4DzbTJyJ01NUXeA5DOTEQZlllKQr33Vx3VDu3JMocQlMVycAs2+YgLF3509zWshBa+
         BDKtDXdizI0+acYyoBoWhs1itP5tQ92kEBLT3Ih38sAxIA01BDU25NbmD7u3aTe7+Thx
         LCSOC+2P6Rj8yE8nE83W9cWGVPEFsjnYKFeAg8Sn5IARzh46btEqLqh0p00zSu9L1OXu
         fvQw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794804380; x=1795409180;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=w7erbnR19mqIv74o/0UajIn9fUvIg8kyqoliwm7QkJE=;
        b=MoNRavzACM8oYFPDNdsX+D6pz0rqf9zmGVZH5+3oE46A/rfdJBZIrizyVnlkzbjjUT
         0CxlAR4/R3XlDbx0AjQ4HwX0QqkOG31vNyTGpicuMk3/dHcC2wR2zhlERWOw7bjgVcv1
         qVyIAoimBdFt1V8oYQ/4np1xgPU6qFMQsgnmauWX7+N4bKRIAautbJe7VhXQ2HC/s6Kf
         oaM8QuLSGq3Ori7xKdwcBHSIBvnPhRb7hbtPY7rgpAqLAgXxOiMmy1kawK8Gu5R1NmEc
         sMpbSmRHU7wuNsEb4vkT3VYz5Q4IslaZWPFIJA1maX+kOvZJm4wF0giS9ZnxEG8rtc6K
         liOg==
X-Gm-Message-State: APuU4Z88WLMNp0bNZlH8Jhnig34SDM8IvG/M7hsQFqlDXeVJ2bc3F+2R
	e1/vnX4xKY53zhdCimpfH6ipSip11B2u+jLKmvoQnW+9S4SwD9BJu4TaMyTeXn0yqYpjCfQ77N8
	KerZ8MNAKspzBWGD5z6zkVOR7K5ZBHgFEg3qw
X-Gm-Gg: AYBFou1ojrNn/NFOzD51WZmsni6o6GsdKMNYnB/h67+Onzv0djH3G3Oxdvb+b9Zhk8l
	0aVJars4RTk2vqJvK8SHCt5QB18ppQHXVYaOvm2z4SkjB55DjS7PRKU+QRAyQNmaLk0+1Rvqwx6
	W3o5JcRoHafbw0xl+BTPdKgmHQNeYtKCzU2da+7mFFrJh/c3vGzEfP3JI/wXiVN1Axrp005b+fK
	b0lNiz+Rythlz2Y1Vy9LZvkH7urBmydzLK+fJ5k6ATxGm3o5g2GrnsvpBgwU/8/0/M23MrE+h2q
	MLuiZirjo9Ol4ATPkmO+89YwbGHR7POzQswy1kYVgnjj1QFwxjFCBZBrBRe9cJCTSgt8h6Un7Qd
	zrP+CLfmdSQSA/SpN/yaBQn7KLGSdi76n6n+pkEnJxDr9OYjjPkPxOvfpfntsPvrBMJ/4Bh3G+1
	rfJaRfWHp/mahCNE4vAJ8zaKP2G81g0uq01Ign5it/N0GK4kAsALMJFzDd30cZ5djeaTHXVrAce
	xPRfFiF/b/sYUVgsMwu2gu5GY08G0unjGMdmj9HFVYDjgP0bvA=
X-Received: by 2002:a05:6102:6891:b0:7d0:3ed0:c61c with SMTP id
 ada2fe7eead31-7d64d766e5amr2397924137.16.1794804379752; Sun, 15 Nov 2026
 20:46:19 -0800 (PST)
X-Mailing-List: sashiko-reviews@lists.linux.dev
List-Id: <sashiko-reviews.lists.linux.dev>
List-Post: <mailto:sashiko-reviews@lists.linux.dev>
List-Help: <mailto:sashiko-reviews+help@lists.linux.dev>
List-Subscribe: <mailto:sashiko-reviews+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:sashiko-reviews+unsubscribe@lists.linux.dev>
List-Owner: <mailto:sashiko-reviews+owner@lists.linux.dev>
Precedence: list
MIME-Version: 1.0
References: <20261113-submit-dw-axi-dma-stop-pause-v1-v5-0-8523a27b5788@gmail.com>
 <20261113-submit-dw-axi-dma-stop-pause-v1-v5-5-8523a27b5788@gmail.com> <sashiko-outbox-212590@kernel.org>
In-Reply-To: <sashiko-outbox-212590@kernel.org>
From: James Hilliard <james.hilliard1@gmail.com>
Date: Sun, 15 Nov 2026 21:46:08 -0700
X-Gm-Features: Aa3M54o7ZTXqLrtiGZcfu8iVaGxtj5OKcZ657f_U_Ri-n6PYVX8QpmTaqx6061s
Message-ID: <CADvTj4q34rEXg1LTnz3ywqxuXzzf8z5qCatSEyjtHMrYQWZFBA@mail.gmail.com>
Subject: Re: [PATCH v5 5/5] dmaengine: dw-axi-dmac: preserve pending pause requests
To: sashiko-reviews@lists.linux.dev
Cc: dmaengine@vger.kernel.org, vkoul@kernel.org, Frank.Li@kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Fri, Nov 13, 2026 at 2:56=E2=80=AFAM <sashiko-bot@kernel.org> wrote:
>
> Thank you for your contribution! Sashiko AI review found 1 potential
> issue to consider:
> - [Medium] dmaengine: dw-axi-dmac: cyclic completion in
>   axi_chan_block_xfer_complete() bypasses suspend cleanup
> --
>
> commit d0a0ce5ca0c535aeb1aa58ba2ac57a8edf27e326
> Author: James Hilliard <james.hilliard1@gmail.com>
>
> dmaengine: dw-axi-dmac: preserve pending pause requests
>
> This commit tracks pending pause requests and active descriptors across
> polling timeouts, interrupt handling, and cyclic transfer completions so
> that pause and resume operations do not lose hardware suspend
> acknowledgments or prematurely restart transfers.
>
> > diff --git a/drivers/dma/dw-axi-dmac/dw-axi-dmac-platform.c b/drivers/d=
ma/dw-axi-dmac/dw-axi-dmac-platform.c
> > index 1a53fbc951a91..cd9a5b45d295a 100644
> > --- a/drivers/dma/dw-axi-dmac/dw-axi-dmac-platform.c
> > +++ b/drivers/dma/dw-axi-dmac/dw-axi-dmac-platform.c
>
> [ ... ]
>
> > @@ -1134,11 +1145,18 @@ static void axi_chan_block_xfer_complete(struct=
 axi_dma_chan *chan)
> >                       }
> >               }
> >
> > -             axi_chan_enable(chan);
> > +             if (chan->pause_requested) {
> > +                     chan->is_paused =3D true;
> > +                     chan->cyclic_restart =3D true;
> > +             } else {
> > +                     axi_chan_enable(chan);
> > +             }
>
> [Severity: Medium]
> Does setting chan->is_paused =3D true here bypass the suspend cleanup in
> axi_chan_wait_for_suspend() when a cyclic segment completes after
> dma_chan_pause() times out?

It bypasses the wait, but the channel has already completed its transfer.

This handler processes DWAXIDMAC_IRQ_DMA_TRF, rather than an intermediate
block-completion event. The driver marks the last LLI of each cyclic
segment accordingly. The Synopsys DW_axi_dmac v1.02a databook [0]
documents that hardware clears CH_EN after the final destination
transfer completes, and that disabling the channel clears CH_SUSP.

Setting is_paused here therefore records that the completed segment is
being held stopped, without restarting the next segment.

>
> If dma_chan_pause() writes the channel suspend bit and times out with
> -EAGAIN, and the cyclic segment then finishes in hardware before the
> caller retries dma_chan_pause() or calls dma_chan_resume(), this branch
> sets chan->is_paused =3D true without calling axi_chan_disable() or
> clearing DWAXIDMAC_IRQ_SUSPENDED.  A subsequent dma_chan_pause() or
> dma_chan_resume() will then hit the early return in
> axi_chan_wait_for_suspend(), skipping axi_chan_is_suspended() (which
> calls axi_chan_disable() for completed transfers) and leaving any late
> DWAXIDMAC_IRQ_SUSPENDED status uncleared across pause retries.

The sticky SUSPENDED interrupt status is separate from the CH_SUSP
request bit. That status can remain set across pause retries, but those
retries leave the channel disabled.

On resume, the early return only skips the wait helper.
dma_chan_resume() still calls axi_chan_resume(), which clears the
suspend request and DWAXIDMAC_IRQ_SUSPENDED before the cyclic-restart
path calls axi_chan_enable(). The old status therefore does not carry
over into the restarted transfer.

Under the documented channel-disable semantics, I don't see a
functional failure in this sequence: the channel remains stopped
during pause retries, and resume clears the status before restarting.

[0] Synopsys DW_axi_dmac Databook, version 1.02a, Table 5-9:
  CH1_SUSP on page 188 and CH1_EN on page 195 (public mirror).
https://web.archive.org/web/20251219165400/https://picture.iczhiku.com/reso=
urce/eetop/wyKEEOUFJDggQnvB.pdf

>
> --
> Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20261113-submit-d=
w-axi-dma-stop-pause-v1-v5-0-8523a27b5788@gmail.com?part=3D5
