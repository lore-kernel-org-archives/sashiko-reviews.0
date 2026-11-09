Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.221.182
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1794202705;
	b=1wfxQKW8h0Jf1H2jzrGiCn2ENP1K1n6xPHjkUodhD8qyOY4KyPiQH9JGGD5PcIhEtQov
	 31AcM7tZHG3nbX39RX3qh85fqhKL8v/fNQzgSage2NbVSYlAn/VPW2qGcyTNyc9sxVd5w
	 xb9k1KjVzclFBHXg1tv3YviIFEs/mii4RwBg3xk+e7Tk1B1Cn+Fd6rKi/SCHwrMQUeihG
	 lef/ww4E/w4oyZC3yzf+nhr1FESqWd8/Hqgg/g2RQyHY4tzLOiPa9dkXl85U+7OZuCCnI
	 z/mUhEkold3UoHw6vSWITqxRYhYZ4Th1/iWZZoTbl64AZuqwJVzK+y32BZbYXgXe0GQ==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794202705;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:MIME-Version:References:
	 In-Reply-To:From:Date:X-Gm-Features:Message-ID:Subject:To:Cc:
	 Content-Type:Content-Transfer-Encoding;
	bh=o0MMk1rhn2GHNymm8G8vhOPCDLA+ZYhjWLyxYb6DoMM=;
	b=U5anoHy768ntUcOTYZqDTBs2QAO20jVkdCRUkmPG2ilfQRv/mFRJyfSiOduplpYLgPuU
	 tEJKKyWrT3tHhGm0YxFUum4Zp9O/pPYA2b7SC1qDI+UxD9X8XVMPfDsrXyjAjImZ79nNX
	 zVuroAjuL/oqpyQt9jcUReBmaDRBI5Qe6UuZBUkAe8AfZwpI88LEus6lUCpdaEeZKULTD
	 fJK3ZsmPcxRQE1NDsDPXnqXMG/Q/IBpxmU3TZRLrMjhF15Mne91mOHlPyQmikVtPmVBnc
	 4KOopehUPhbtcSW5hjTcEhAp5lwXOTm5tmHmj0N/z4evuWx7lNJUzOlnOI4ITStIczw==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=cWYuh8CP;
	arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.221.182
Received: from mail-vk1-f182.google.com (mail-vk1-f182.google.com [209.85.221.182])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5CD2A606A321
	for <sashiko-reviews@lists.linux.dev>; Mon,  9 Nov 2026 05:38:25 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 5CD2A606A321
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=cWYuh8CP
Received: by mail-vk1-f182.google.com with SMTP id 71dfb90a1353d-5e948e56af3so177318e0c.2
        for <sashiko-reviews@lists.linux.dev>; Sun, 08 Nov 2026 21:38:25 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1794202704; cv=none;
        d=google.com; s=arc-20260327;
        b=r9gAV2cORgAIKwmdI69y+lRXUgZWBbRB5zEpreE+9VCtKrIvisNPZVbS9ln2/CbKNN
         1aNeukQGd8CHnV4x+JpN2cx3+31bw0RH9uXGJ63UAPKivcKjRDy+f0WclwQ4AX0r75wQ
         7rlsgT4i9RK5p4zo5kccofKgVBhEvqHp280UzCgrYSe3AX77RGFKl73QdAU/KMzbOjBf
         AusYElXDvUQvA8s07dHk1eWyjZalKjUKC3/jPA54KowJytYjYRr314OB6s2Nqe0JjrnZ
         YKl9OER/7U1f7R85LQA2DZP2yxXlBjVch2DzsFmOm+FbbWZt+WV9CQHumnkstyX5OtWy
         cS8w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=o0MMk1rhn2GHNymm8G8vhOPCDLA+ZYhjWLyxYb6DoMM=;
        fh=LrM3G6RcmBZ425pLRY8E44TM1XcCb9gU9D3viVl1X8E=;
        b=K6hhXAQt5soEfqN5XufeJ8mIzj1ZT9J8Yfz/o84yjQZxyeV5zeJL6WD3NIGMlEPW10
         EUDSaxMGdL+fCt6oLxUTFflWj8w1rM837apLV50oxomlQJ+xztwoL9pxOogYUskMs+xm
         V7SL/U+j+0VofeZmebRvBECvNs5NynC3UkKcCBh4HQMSknMhFeoreqEjJgukQVZVOkXJ
         cWtcwU6JBmFwJqhjgh/I7jvnTLdpyvP0HS0Z6RLKkMCw9ch5zcKQmxHUfH8MeFZpT23Y
         axD962y1iAI3D3zNSAttGwO0dz1XUw0nFt9zwy1qwN+aCdm3q4ln6Lulvgxqk2L3xkLk
         9Ycw==;
        darn=lists.linux.dev
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794202704; x=1794807504; darn=lists.linux.dev;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=o0MMk1rhn2GHNymm8G8vhOPCDLA+ZYhjWLyxYb6DoMM=;
        b=cWYuh8CPslkZeIlSGf0XbqTkMBtxRjuT5c6MQLty3o7ldEFSONwO7WY7qjLQF0nT62
         nph2f99Sxpy5EKZ+wA0/m1bcQLgTMaa9GwNGt3MaMehmWHBZk+NwXZ1Z8wTbRVwqg0+z
         fivrA3v2ogz5DTw9bt1MUPFYdsTnjFA4d7Bcybkvpbt50YmTPaSuGvtnzJFVzE9SYz5C
         tNjKaWlh+4KIkxSjNsPmiFeAusb7k2xokxrryMlEdN1BYjwVyyjKoPiW6xtPZfBijbam
         mm+YBroPdhSLdnKGs0r2/9nyjKPPem6JJmftZsp5mBMG8XqB9K3oX1RNf+npBA+apYZt
         8Zpw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794202704; x=1794807504;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=o0MMk1rhn2GHNymm8G8vhOPCDLA+ZYhjWLyxYb6DoMM=;
        b=sbTgtFxpSL5Biixw8oX4sZihZHKM4NQd34rGkSMZRoDAqS9WCZRSlMFnfq8QQK9UXR
         mOme5nf5aESX+6/bHcwjXZwYQoE/lzim9AsA1W0vshWwHmMfonG2qnMs/bx7q98IiBd6
         V8VW9g3l//q/0kaY2QwE1DM7FN+UWoFdXv62DjlUEcXNvd2j7JJ6j28g/ELAVq6HIMRi
         IU0gS6Bh3Ro3DWPbCZRr82abykmYnoZkUkJgBSa5HZ6053WpY50zCaJDGXFuoxSHoM7G
         oTE+8W21DC4fE1MF4MCWTf6axQ0EotOWmbljTvslV5VrA2IlRuYmCTeAlNWSNS7R3E8r
         7IMQ==
X-Gm-Message-State: APuU4Z9OkSvn8URq5hveanAzWeG5AHd/GtwSWu6/DY8lr34RiogYj73U
	S+t3dD4atKiJgM4BfuxTK1nQ1+WQmXiKAY0OapbMx2NmUnWnmHqaCuq57S7IzKXhAolYRqClYnK
	oNnhGFvnfS8XLV+Phlvl5ZXvLVExvNhaBultx78U=
X-Gm-Gg: AYBFou3kp7W8dXj4iGgkYKJ1ZcbHWrVEDWXZ0X34cJ0HRMQOo+3r0lWKHUyuj6wxH85
	2iB59AaWu4vzYcwzXqqpEj6u+ZdAHRML32B6botQENt5rmQMN6IGi7RQQLN5VzBDF6s6Gn3xqEj
	o/OMlkDU+lIJCsODNxIQmrSQQHYcBq6mMh4NKck6LjOmghS9qwpSkgPgvcyVZ/nUzYjhinQJa0Q
	rfTEnVs2dEKTZJFmUAf8o2O4cZ994THyz6V/fqI7EW62wBT5fWlDr2xCFLSa1Bs6TqlzCdfIMky
	XZsQag0zPoJXkEC6lOY1bT5UMTb2dPNVOduBXgYhwm8K1esmeBAlNpYCVXfCPc8z7G8CY7zxaEZ
	fLKqRjap5jZojgPYBvN9OvhwsEoqycwUp1w1BGfQPXM+/iQCAkdYzIqKFmZ9ZUcT3Oi03/7JTAU
	R8NASMwomF3LSHlSnaht4fO2dLvzANgciSr9RGtUiVWPinEZloH1HrM19z5u0Mx4cowO9UVv1k3
	05XIT2v1DAKscJdDBZyJYZ/4fCYfw==
X-Received: by 2002:a05:6122:514:b0:5ec:4a13:8aae with SMTP id
 71dfb90a1353d-5ece725c28fmr859093e0c.17.1794202704155; Sun, 08 Nov 2026
 21:38:24 -0800 (PST)
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
 <20261108-submit-dw-axi-dma-stop-pause-v1-v1-1-c48ec19e9ee4@gmail.com> <sashiko-outbox-204416@kernel.org>
In-Reply-To: <sashiko-outbox-204416@kernel.org>
From: James Hilliard <james.hilliard1@gmail.com>
Date: Sun, 8 Nov 2026 22:38:13 -0700
X-Gm-Features: AclHuK9ASlVQAUTJlWniAV85BUmqurDEuGUQWWbXGFT2lkxlkDeZIeDsjnLZAkU
Message-ID: <CADvTj4rtM+HpSvfktbneuEfCEctTHpyJ+Bo=BsbpVt4X_8bueA@mail.gmail.com>
Subject: Re: [PATCH 1/3] dmaengine: dw-axi-dmac: poll the correct enable bit
 during termination
To: sashiko-reviews@lists.linux.dev
Cc: dmaengine@vger.kernel.org, vkoul@kernel.org, Frank.Li@kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Sun, Nov 8, 2026 at 10:10=E2=80=AFPM <sashiko-bot@kernel.org> wrote:
>
> Thank you for your contribution! Sashiko AI review found no new issues
> in this patch, but noticed 1 related pre-existing issue it does not
> introduce:
> - [Critical] dmaengine: dw-axi-dmac: use-after-free in
>   dma_chan_terminate_all() [1]
> --
>
> commit af0999f332d674abe73e6d4b71aee90f2aef6ba8
> Author: James Hilliard <james.hilliard1@gmail.com>
>
> dmaengine: dw-axi-dmac: poll the correct enable bit during termination
>
> This commit updates dma_chan_terminate_all() to poll axi_chan_is_hw_enabl=
e()
> so that upper-bank channel enable bits (channels 16 through 31) are check=
ed
> before freeing descriptors.
>
> > diff --git a/drivers/dma/dw-axi-dmac/dw-axi-dmac-platform.c b/drivers/d=
ma/dw-axi-dmac/dw-axi-dmac-platform.c
> > index 7520c78f55ccf..49f65486e8626 100644
> > --- a/drivers/dma/dw-axi-dmac/dw-axi-dmac-platform.c
> > +++ b/drivers/dma/dw-axi-dmac/dw-axi-dmac-platform.c
> > @@ -1181,16 +1181,15 @@ static irqreturn_t dw_axi_dma_interrupt(int irq=
, void *dev_id)
> >  static int dma_chan_terminate_all(struct dma_chan *dchan)
> >  {
> >       struct axi_dma_chan *chan =3D dchan_to_axi_dma_chan(dchan);
> > -     u32 chan_active =3D BIT(chan->id) << DMAC_CHAN_EN_SHIFT;
> >       unsigned long flags;
> > -     u32 val;
> > +     bool enabled;
> >       int ret;
> >       LIST_HEAD(head);
> >
> >       axi_chan_disable(chan);
> >
> > -     ret =3D readl_poll_timeout_atomic(chan->chip->regs + DMAC_CHEN, v=
al,
> > -                                     !(val & chan_active), 1000, 50000=
);
> > +     ret =3D read_poll_timeout_atomic(axi_chan_is_hw_enable, enabled, =
!enabled,
> > +                                   1000, 50000, false, chan);
>
> [Severity: Critical]
> This problem wasn't introduced by this patch, but can dma_chan_terminate_=
all()
> race with dma_chan_issue_pending() [1] and free descriptors while the
> channel is active?

Patch 2/3 [0] moves the acquisition of chan->vc.lock before
axi_chan_disable() and holds it through the stop poll and
vchan_get_all_descriptors().

Since dma_chan_issue_pending() takes the same lock, it cannot restart
the channel between the stop check and descriptor detachment as shown
above.

[0] https://lore.kernel.org/r/20261108-submit-dw-axi-dma-stop-pause-v1-v1-2=
-c48ec19e9ee4@gmail.com/

>
> axi_chan_disable() and the poll loop run before chan->vc.lock is acquired=
:
>
> CPU0                                  CPU1
> dma_chan_terminate_all()
>   axi_chan_disable(chan)
>   read_poll_timeout_atomic(...)
>                                       dma_chan_issue_pending()
>                                         spin_lock_irqsave(&chan->vc.lock,=
 ...)
>                                         vchan_issue_pending(&chan->vc)
>                                         axi_chan_start_first_queued(chan)
>                                         spin_unlock_irqrestore(...)
>   spin_lock_irqsave(&chan->vc.lock, ...)
>   vchan_get_all_descriptors(&chan->vc, &head)
>   spin_unlock_irqrestore(...)
>   vchan_dma_desc_free_list(&chan->vc, &head)  <-- use-after-free by DMA
>
> Because CPU1 re-enables the channel after the poll finishes, the hardware
> continues processing descriptors that CPU0 then collects and frees.
>
> [1] https://sashiko.dev/#/bug/linux-d3e7b3db-d97f-48be-a317-9ef1a4cd9953
>
> --
> Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20261108-submit-d=
w-axi-dma-stop-pause-v1-v1-0-c48ec19e9ee4@gmail.com?part=3D1
