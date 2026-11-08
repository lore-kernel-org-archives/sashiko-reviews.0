Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=74.125.82.172
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1794144944;
	b=eafkJ0G5KdkQUtxoPxQTWZlklgq5AmiM4D7oXBll1QvhO/HNVj4YzslaGAT6jddzpfkc
	 YPVF99I+kmYyViwRiD/44eaaOdJ0hcDlJq2zGKF0Mqt/0PrWLtsOY1E2lbbi7mlOgjHgC
	 VJODxzfe7Pwn1KTzhRl9dalPdZ7XGH6M4GqaDbjaQ2eLnJkcWjSTxxtqFrExv+gYiC52l
	 jaGEjINtPAVorxo1fnxWQkizvatvs8xFAzIBYVYnDGH9UgwZcjiVBkq3oUcQsDfBMPcpv
	 vSPE+n4GclBFO/hsQ2nYPS5HTwoHKY/pDZJ5/5wAAb+wmnfLCCqSN8Q/BQogbWSke9A==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794144944;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:MIME-Version:References:
	 In-Reply-To:From:Date:X-Gm-Features:Message-ID:Subject:To:Cc:
	 Content-Type:Content-Transfer-Encoding;
	bh=gk8o2feJpKFPqHlXDx7aVEibTMtdptWD0yMos3nMJCA=;
	b=Wssyn//7TzwYWJKsl3lHOdX+syfyc0GH9EypvRhEb526zDo2KimxDxD3re4QRuGUzWsQ
	 +nw1P7txXqGX+QLNkIJhAv0jOV9EOobuwj4WY6BekTm9cfh+AUN1W+zOkzjDgU3pyYiBg
	 mBrv9LavoffjDR2IUVtP5pWw0rVqVcHTCHg2nGHrolJIXxPis1FqhkvrwxN50iieTb+5c
	 VbQT9xICNTKE5TbT0uv4+MQ0dspU46JEQEOqnMcGTZI0mLiNTqFdDZSmWbs2PiyMp8385
	 bT6VgrbRcRQBQwGeENF8fhyIZm2tfoYt3S1PSPeGpBFLN/gbVL1evIWCBgkCX44HG5w==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=EhHnTtlb;
	arc=pass header.oldest-pass=0 smtp.remote-ip=74.125.82.172
Received: from mail-dy1-f172.google.com (mail-dy1-f172.google.com [74.125.82.172])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1D9B9606A320
	for <sashiko-reviews@lists.linux.dev>; Sun,  8 Nov 2026 13:35:43 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 1D9B9606A320
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=EhHnTtlb
Received: by mail-dy1-f172.google.com with SMTP id 5a478bee46e88-37071c0f42aso225264eec.0
        for <sashiko-reviews@lists.linux.dev>; Sun, 08 Nov 2026 05:35:43 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1794144942; cv=none;
        d=google.com; s=arc-20260327;
        b=sXXldHQbOy9i+ATbiKoBXd6zdTBE+Lpd5N8isXbQZxw0Au/9Qa4a0a2ClVtChN3dcP
         Dgg5An02KIAOu8pV2u13ie547rCJoNUcl6M6DrusP1M+SQZ287RCi52QjDwNt+RDgeM8
         9ivkdU2OaLfCrFRBegppkNpPdEFfnfOFpCG7OgmZuhthWl5AssulPw0Sh34nX1bPPJWJ
         YJSUgjsMTYbReftjXqwu1e4YnYZEDCRN/qq4iWGV+Rbj568dqZ0Q/btxAfkLQja4qQ1n
         QTP+dOEuNxY1p59ahMnkQ1kAb002whWcLmzTrCpSXU9hJv7rc6BSC5G8l7p3fOOn2mUP
         uU/Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=gk8o2feJpKFPqHlXDx7aVEibTMtdptWD0yMos3nMJCA=;
        fh=/XafWwXInU6xSAMitUKTVJtcnn7zkW/jx5Qszu7SSug=;
        b=VZ1WFQ6JtgB6FOipp/LCh93LVMRoDzY+C1kIGiE4k2nK7K529XOSUzdis5kSWPdMz/
         Mz/DsPQXbsEzVSXv+5lVoQdXFrSghOtV32yR8Tt5f7E6S/L80L9BvBvZuTbuYbzzmEil
         PP1TZ69bnwZ9j+LmeUfI8xX5LA/SumZJ/JTGMoK8nxPzsUUh3iJ+NZFw+a3Bi2+Q1Csm
         XK3nvBC1lA/DFQwg3xphumLmZOyH1anTzzMClAPUErRxFODTThFaEro7vesCRX+SHKBt
         bXqF7zF1hy5SC7W39k6JJmJEEilY2XsqIxN00iLazUsNAjIc6dYiPWwPdkSKfbkz36Ex
         WNaQ==;
        darn=lists.linux.dev
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794144942; x=1794749742; darn=lists.linux.dev;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=gk8o2feJpKFPqHlXDx7aVEibTMtdptWD0yMos3nMJCA=;
        b=EhHnTtlbkqbMMZ+8gvNsWV9dhOOhzvgBn1lDv35/2O5Sffw8eoO5c5b10YFtCsDOtH
         vJ1wxmw6+Sml00lPsbY5V+KWlUMAK96b0mDqvqdfYcXUGM1YfTJHXgp3HjwGGYytrzim
         wvyVtii+47dKWdKDXkR3xQI/v7MbV2V6e+0n8b+VF8t5Ty0B2nZi4WoNNjjBcoJ9NThI
         ebRjv992BrgiWqXivhBDxpzTwcHb6j+GBCsAH8vXY0f+sKrCm5Z5kq1aVDSAAvDcA1tG
         creZjf3sFAxi1Ienba+ltHu7jobfEBp5ATYie+IVO9QI59lJy7zxomuJB9RqpeQsZa1x
         4szA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794144942; x=1794749742;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=gk8o2feJpKFPqHlXDx7aVEibTMtdptWD0yMos3nMJCA=;
        b=owW2COwkUG51J9bUgzVAjnqMp9lxlgy3SUedi4XXDTksBRs3j2Z7TXwPb5PFxo20yG
         7LoLY6Jx2nUMu6Ljqq65YGH24y/Lr7TUCQBepL8XanT31bzuzmMXn7Lhm+P/NFA2cgKY
         w9F0SnU/V2+e8gwuqYRCHjKOiWc53YM0yAtR0t61d0F0jALBeFTkdkTSIiENEpVxP1ET
         EVhOWD6kKtu7SvhbhmxXFsZHXBms5/3jf384hbsZgbfRUyvoXBuvbaHwbo4ZMBF5w00N
         K3kJx6EOFQlhnanJOUixOx14pWf2KTN+2uCxgNxIsEK7a7TIG/Rpm5Cmm/U/faPLYXTL
         snEw==
X-Gm-Message-State: APuU4Z8guiSNRuMuJMowYNn+JJE93OCrkQZcZp+wPkj1UANIQIPYFFb8
	GEpyg1n+sBYbf96GlxoIHYrTWi3ojrEwUdGar2YSru95Jg7qeqgWW4n2nwxTUG9XomLCDVWgG3w
	YctkVx7jrFrG57GsuJLlQkICDFjDfNzQuO5KESsY=
X-Gm-Gg: AYBFou0VjHflG6lKpjtNMNtAExsCv3EsSZxYiv9fzqmK5g7ldrLjPJh/5LskifO7s7i
	VRvLbzWH4MP1M3iwhIAW1KOjgXpxtoJ0pIBxUs/zg1mfJreU3FiVaOQFInlYpJJ19rcv6x/QOq0
	xYT2OY2TVIMxUenweAzrP48VwiJ0JTe3b/wNfNd8fm7H+iR42bLerAAcn8bgfw9gB/c5VkA70Sn
	w4ConK3hs4w1PBZ4nUbmF/473ct2GWaBNFrikmy3lK4HPbJCkuFgWsCkgqc0HlWFZiHji5p7Fwv
	WitHYUcgfRoKPQBXtIVcoL4X7jHrLwj4QqC0JQyFPp0rn+TaaPp6zLn0YC3vR1MqNn4m1nCiRFJ
	ymdBoFKyfzTweggey+MIkKvTxGtA8UeaUYp8TSccuLqfxDIZo4Q8/dOMC+w1PdE6yYVoq
X-Received: by 2002:a05:7300:cf89:b0:36d:4560:dd38 with SMTP id
 5a478bee46e88-3725e82942emr2721522eec.37.1794144940645; Sun, 08 Nov 2026
 05:35:40 -0800 (PST)
X-Mailing-List: sashiko-reviews@lists.linux.dev
List-Id: <sashiko-reviews.lists.linux.dev>
List-Post: <mailto:sashiko-reviews@lists.linux.dev>
List-Help: <mailto:sashiko-reviews+help@lists.linux.dev>
List-Subscribe: <mailto:sashiko-reviews+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:sashiko-reviews+unsubscribe@lists.linux.dev>
List-Owner: <mailto:sashiko-reviews+owner@lists.linux.dev>
Precedence: list
MIME-Version: 1.0
References: <20261108122645.421721-1-hj351016@gmail.com> <sashiko-outbox-203739@kernel.org>
In-Reply-To: <sashiko-outbox-203739@kernel.org>
From: khj <hj351016@gmail.com>
Date: Sun, 8 Nov 2026 22:35:29 +0900
X-Gm-Features: AclHuK-pGFa6y3sLHukoLPfkHy3oRR92QDfa9ZBb280rSu8vVIPpTGP6gkqKNqU
Message-ID: <CAGr5VtP_ps6hZa3CQ8yPt0bdUPfcDCkBSHRP6X0WdTmR6anTPQ@mail.gmail.com>
Subject: Re: [PATCH] usb: gadget: f_uac1_legacy: disable OUT ep and drain work
 on teardown
To: sashiko-reviews@lists.linux.dev
Cc: linux-usb@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Thanks -- all three are correct.

You're right that f_audio_disable() runs in atomic context (reset_config()
under cdev->lock), so cancel_work_sync() there is a sleep-in-atomic bug. v3
keeps only usb_ep_disable() (which is safe in that context) in
f_audio_disable() to give back the outstanding requests, and moves
cancel_work_sync(&audio->playback_work) to f_audio_free(), where sleeping
is allowed, before gaudio_cleanup().

I've also dropped the play_queue/copy_buf drain: as you note, audio->copy_b=
uf
can alias a buffer already on play_queue and can hold ERR_PTR(-ENOMEM), so
freeing it there was a double-free / error-pointer deref. That buffer leak
plus the copy_buf aliasing is a separate pre-existing issue I'll address on
its own rather than fold into this fix.

Fixes: tag corrected to c6994e6f067c.

2026=EB=85=84 11=EC=9B=94 8=EC=9D=BC (=EC=9D=BC) =EC=98=A4=ED=9B=84 9:41, <=
sashiko-bot@kernel.org>=EB=8B=98=EC=9D=B4 =EC=9E=91=EC=84=B1:
>
> Thank you for your contribution! Sashiko AI review found 3 potential
> issues to consider:
> - [High] usb: gadget: f_uac1_legacy: sleep in atomic in
>   f_audio_disable()
> - [High] usb: gadget: f_uac1_legacy: double free and ERR_PTR deref in
>   f_audio_disable()
> - [Low] usb: gadget: f_uac1_legacy: inaccurate Fixes tag in commit
>   message
> --
>
> commit 167ec12aa25bf4c3879c873681717d3fce869739
> Author: Hyunjung Ko <hj351016@gmail.com>
>
> > usb: gadget: f_uac1_legacy: disable OUT ep and drain work on teardown
> >
> > f_uac1_legacy enables the OUT endpoint in f_audio_set_alt() and queues
> > usb_requests whose completion handler f_audio_complete() dereferences t=
he
> > f_audio (req->context) and audio->out_ep, and which schedules
> > audio->playback_work. However f_audio_disable() is empty and neither
> > f_audio_unbind() nor f_audio_free() disables the endpoint or drains the
> > work, so on teardown:
> >
> >  - f_audio_complete() can run after kfree(audio) (the UDC gives back
> >    pending requests on the still-enabled endpoint during unbind), using
> >    freed memory -- a use-after-free; and
> >  - a playback_work still pending runs f_audio_playback_work() against t=
he
> >    freed f_audio -- a second use-after-free.
> >
> > Implement f_audio_disable() to quiesce the function properly: disable t=
he
> > OUT endpoint (which gives back outstanding requests, so f_audio_complet=
e()
> > stops touching @audio and no new work is queued), then cancel_work_sync=
()
> > the playback work, then free the buffers left on audio->play_queue and
> > audio->copy_buf (f_audio_playback_work() is the only consumer, so a
> > cancelled work would otherwise leak them).
> >
> > The endpoint is disabled before the work is cancelled, and the work is
> > cancelled before f_audio_free() runs gaudio_cleanup() on audio->card th=
at
> > u_audio_playback() dereferences, so none of them race the teardown.
> >
> > Found by static analysis and an automated reviewer; the playback_work
> > use-after-free was reproduced with KASAN under dummy_hcd (slab-use-afte=
r-
> > free in u_audio_playback() from f_audio_playback_work() after
> > f_audio_free(); a delay was added to the streaming path to make the
> > schedule-vs-free race deterministic). The out_ep/f_audio_complete
> > use-after-free is established by code inspection.
> >
> > Fixes: f3a3406b3f56 ("usb: gadget: f_uac1: convert to new function inte=
rface with backward compatibility")
> > Cc: stable@vger.kernel.org
> > Signed-off-by: Hyunjung Ko <hj351016@gmail.com>
>
> [Severity: Low]
> The empty f_audio_disable() stub and the teardown lifecycle without
> disabling out_ep or draining playback_work date back to the initial drive=
r
> commit rather than f3a3406b3f56 ("usb: gadget: f_uac1: convert to new
> function interface with backward compatibility").  Should the Fixes tag b=
e:
>
>   Fixes: c6994e6f067c ("USB: gadget: add USB Audio Gadget driver")
>
> > diff --git a/drivers/usb/gadget/function/f_uac1_legacy.c b/drivers/usb/=
gadget/function/f_uac1_legacy.c
> > index 7c8d60c7e87d1..0f937a7bd33b0 100644
> > --- a/drivers/usb/gadget/function/f_uac1_legacy.c
> > +++ b/drivers/usb/gadget/function/f_uac1_legacy.c
> > @@ -697,7 +697,35 @@ static int f_audio_get_alt(struct usb_function *f,=
 unsigned intf)
> >
> >  static void f_audio_disable(struct usb_function *f)
> >  {
> > -     return;
> > +     struct f_audio *audio =3D func_to_audio(f);
> > +     struct f_audio_buf *buf;
> > +
> > +     /*
> > +      * Disable the OUT endpoint first: the UDC gives back any outstan=
ding
> > +      * usb_requests, so f_audio_complete() stops dereferencing @audio=
 and
> > +      * no new playback_work is queued. Then drain the work and free t=
he
> > +      * buffers it would otherwise have consumed, before the function =
is
> > +      * unbound and freed.
> > +      */
> > +     if (audio->out_ep)
> > +             usb_ep_disable(audio->out_ep);
> > +
> > +     cancel_work_sync(&audio->playback_work);
>
> [Severity: High]
> Can cancel_work_sync(&audio->playback_work) be called from
> f_audio_disable()?
>
> The usb_function.disable callback is invoked by reset_config() while
> holding spinlocks in atomic context, for example via
> __composite_disconnect() under spin_lock_irqsave(&cdev->lock, flags) or
> via composite_setup() -> set_config() -> reset_config() under
> spin_lock(&cdev->lock) in UDC interrupt context.  Because cancel_work_syn=
c()
> calls might_sleep() and blocks waiting for f_audio_playback_work() to
> finish, a USB disconnect, reset, or reconfiguration will sleep in atomic
> context and can deadlock.
>
> > +
> > +     /*
> > +      * The endpoint is disabled and the work is drained, so nothing e=
lse
> > +      * can touch the queue now; free the leftover buffers.
> > +      */
> > +     while (!list_empty(&audio->play_queue)) {
> > +             buf =3D list_first_entry(&audio->play_queue,
> > +                                    struct f_audio_buf, list);
> > +             list_del(&buf->list);
> > +             f_audio_buffer_free(buf);
> > +     }
> > +     if (audio->copy_buf) {
> > +             f_audio_buffer_free(audio->copy_buf);
> > +             audio->copy_buf =3D NULL;
> > +     }
> >  }
>
> [Severity: High]
> Can freeing audio->copy_buf here cause a use-after-free and double free, =
or
> dereference an error pointer?
>
> When the host selects altsetting 0 in f_audio_set_alt(), audio->copy_buf =
is
> queued onto audio->play_queue without clearing audio->copy_buf:
>
> drivers/usb/gadget/function/f_uac1_legacy.c:f_audio_set_alt() {
>     ...
>                 } else {
>                         struct f_audio_buf *copy_buf =3D audio->copy_buf;
>                         if (copy_buf) {
>                                 list_add_tail(&copy_buf->list,
>                                                 &audio->play_queue);
>                                 schedule_work(&audio->playback_work);
>                         }
>                 }
>     ...
> }
>
> The same stale pointer is left behind if f_audio_buffer_alloc() fails in
> f_audio_out_ep_complete() after adding copy_buf to audio->play_queue.  Wh=
en
> f_audio_disable() later runs, that buffer has already been freed by
> f_audio_playback_work() or by the play_queue loop right above, so
> f_audio_buffer_free(audio->copy_buf) reads audio_buf->buf from freed memo=
ry
> and double-frees both allocations.
>
> In addition, f_audio_buffer_alloc() returns ERR_PTR(-ENOMEM) on failure,
> which f_audio_set_alt() stores directly in audio->copy_buf; checking
> if (audio->copy_buf) treats ERR_PTR(-ENOMEM) as non-NULL and dereferences
> it in f_audio_buffer_free().
>
> --
> Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20261108122645.42=
1721-1-hj351016@gmail.com?part=3D1
