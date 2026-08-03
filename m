Received: from mail-ej1-f45.google.com (mail-ej1-f45.google.com [209.85.218.45])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9B36140DB54
	for <sashiko-reviews@lists.linux.dev>; Mon,  3 Aug 2026 14:40:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.218.45
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785768050; cv=pass; b=qpRLeH/SvLBeEueBNUiwtMEcmzIPFE/w/KrmveNVNKiTkeM5phYchi4TZy23v8zjbMRVTZ91BksB0LWK126m/Nf/74nyzgeLtgAwWa+FAddz2/M2YOx80sUME4Hx9csi7Z6EGVqt7SfRjVHCfyx7lZEhm/zXHDvXlnbmluwcAfY=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785768050; c=relaxed/simple;
	bh=5kebS8pMZi+Qnu3Pne9n+Gcqlzlf9paHIC1+/HJAbOI=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=NOCNOq7bfihIGtIHsMKbSBTM5TJ8FTBKZNAZsAIuXLgqmUmqkOE2KFuPu0YApNjDmM2GaSbCUs6se0Wh0xgZyGY5y0jmSg//7khQALTsA4YJHHzyaYaSikUYmnSqxTbGVob+w5nE4O/KHBWlRoJR5DHfiirv+Ab2i1sEmfRjGsw=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=HQvjsF1X; arc=pass smtp.client-ip=209.85.218.45
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="HQvjsF1X"
Received: by mail-ej1-f45.google.com with SMTP id a640c23a62f3a-c167bda216fso527737866b.2
        for <sashiko-reviews@lists.linux.dev>; Mon, 03 Aug 2026 07:40:48 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1785768047; cv=none;
        d=google.com; s=arc-20260327;
        b=Ce7lg8w69bTh93eX6C/9FKmbQznhJRdyvA31h89ZrEIvO/hcEp0mkw1+27pJEMt9xt
         zKZJRIxNe6P2E1+Vxa6S+3TstGHzy50dPLbPuikH73JMLxkZXAQAIC8odkxGtC0+kV6v
         7fXBKIoOYaiPJmuHhQllrX8hj1byX9aW8cH7h/kv/JlrzR3fA7sM9NYima9UnHTd8u+m
         QAsaveK5GKn8YQTL30qKhwCdj019UMmob8PFkwagKMaQ3GxNLmxPB2fnldRci5PC2vMS
         +O+Crqyw6co/gJXQ858niibqRQHU9/MmAysOpMIi5iMyOQQINarGkp6YrcKh9kIKfc9g
         qnUg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=43vcEMd1q8IU7lDqptyYtNca+YC1kL3gqmLuBjWx/68=;
        fh=W4zgvaciPvu+gyNBZoCQAqBlb+JTJZHKnm39esXowU8=;
        b=qATAp5hOrzrRvkGUfk6ETiQ2W5xh6Uw+JB0/BH/oHbzS8A5ALDmdjQ59F668Z1Bx3R
         oZi/Vi+aJu7PHh7Jjlhhf8fTK97Y+FSs+FfL5J9AlIaDvg1KXvmgafSCZJDX8HnORWY3
         dh7pMT9nA6MX+EziSc+gHiPTXXawTwya92Y78zuQDUtKDtDthI3yYfgxHhI7eyaqD0xU
         6FKBh/iLzWQjf+FSilHYvT9uv9XwlIyzEamnMV/xsPjn6ISznAzD9zXPXM+qY4N6hlaB
         6wgi5dAR91dQOpGVvvOcrt6xNrTGLE31525+CS9HRbvhXc2la69/VOMBhx9kZdV1Fq15
         LRbg==;
        darn=lists.linux.dev
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1785768047; x=1786372847; darn=lists.linux.dev;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=43vcEMd1q8IU7lDqptyYtNca+YC1kL3gqmLuBjWx/68=;
        b=HQvjsF1XPR337+fO+N6mScJJE2w7/Ib7s2sG4vN5uTrwTJLcqDr++M6JZDSk9w8vQ8
         NgqK9G7uXgMrd6uyD8HnA6Pxo6tUcUYPaYJORCFNNgO2c6WhMPtVEFEGjNZaohcJl9o3
         YVDjg7c3KYomy4r55ploEOxFqESEkOnKuJgAO64jOBOfuRC4p91JIWnHnOBND2X7iLwf
         bVyLTC2ZY7UMx8zZiNHBzIXOMD9SBoXQjeivxP97vKeyLiRXfx3/o7RZ/bCmp1uSrcHn
         7wqpH2aF7PFI3v1OkVpzdJ+94b6JJ9czpG8oKRNoJdbzlPezkGznl7GiU6Rle7dEcmyb
         F4Ew==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1785768047; x=1786372847;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=43vcEMd1q8IU7lDqptyYtNca+YC1kL3gqmLuBjWx/68=;
        b=e0tE2Dp4EFS9Fje0xdCebEBs5okQwTqJqiA75MUNEb2Bm08/c6nRSKxzMsIEvf0sBZ
         rWYyk1Q7/ZSNYDleifJUsD5Q/W/9qEsFlTJ82wN8mqQeQIFSDHMyYPotMvQIs8THHWH8
         NdSKk/5uvJUz4i3VNv3+8Tr94zzE4oc3+il9xWkIZa0FDz+RW+YtKlo55o8coFwNCjYT
         gKFrhwpYpHOTn5T2/mnq6VD/2lh/RG70XsnnkdeTICb6XgwpKcy45tr96zcheRQFN4QK
         Z6g2RY1ZVEuiFKuBYQRQBPg5g87c5RhoZBGP1U994e+0CBYHcL+7KKQnzkeM3uSp/B6Z
         AZ9w==
X-Gm-Message-State: AOJu0YxRnCwhQEJgrOvlRfG8rkXkecXuNE6W0newh8LYlBf8tgAF8C5g
	puV+uU0Fu+w80KIZGfCO8Cr+pDvyYWPhqoEBavN0XUJ4mkZMePQWBbj8695/oKNIqVJc6sihHpD
	FaWhXO39NS02jm1n3l0FOQu9al9lVSYPAiUmWbic=
X-Gm-Gg: AR+sD13zeipTDrHIMpaxsHGnO8HTe/P4fxkJTxptacBeEHH32YlkMS3goSQQrdw1DKr
	CzCwloWWIgN59/wU9kLXKmdw4/5s7Sk4ZSY7HvjHXzsJ/da54Kdx+W8j+VJAx2LiLTSNGjCTFPj
	XfSAwNFoJ0fztGN5RtfSztMT+pfckSwd18Q75PvsWi5mP7o/XBxEqRWMpFLaAvA6nKze7iatEKq
	hDkgCzN9k2EfrRpOAlv2l2s/e+ZlynA2WX3M3li4iPtrZ+dnXGh5PJDiWHkE2h09PgAAob4Dq0L
	0Z6M+pyz68MB1MD9vBNwalWcQwiCSGYdXBExsLBQosHgl7nTqHTUg/Wv7DpHb95AH1eZuUU=
X-Received: by 2002:a17:906:7186:b0:c1c:2aa5:322b with SMTP id
 a640c23a62f3a-c1fe8168601mr589342466b.2.1785768046472; Mon, 03 Aug 2026
 07:40:46 -0700 (PDT)
Precedence: bulk
X-Mailing-List: sashiko-reviews@lists.linux.dev
List-Id: <sashiko-reviews.lists.linux.dev>
List-Subscribe: <mailto:sashiko-reviews+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:sashiko-reviews+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20260803134839.2103051-1-puranjay@kernel.org> <20260803135329.2327280-2-puranjay@kernel.org>
 <20260803143505.2E3D21F00A3A@smtp.kernel.org>
In-Reply-To: <20260803143505.2E3D21F00A3A@smtp.kernel.org>
From: Puranjay Mohan <puranjay12@gmail.com>
Date: Mon, 3 Aug 2026 15:40:32 +0100
X-Gm-Features: AUfX_myg5FkRhhwJrWlROWqtotno0-Pomq3l_iqF2gTN_FLgC2KCpZALE0D3KSY
Message-ID: <CANk7y0g+Yf0Vy0jZCoD6NicDXdJ=wo4WpmiBLo3MPqKaNUXO-w@mail.gmail.com>
Subject: Re: [PATCH v2 2/6] rcu: Make Tiny call_rcu() safe to call from any context
To: sashiko-reviews@lists.linux.dev
Cc: bpf@vger.kernel.org, linux-rt-devel@lists.linux.dev, 
	linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Mon, Aug 3, 2026 at 3:35=E2=80=AFPM <sashiko-bot@kernel.org> wrote:
>
> Thank you for your contribution! Sashiko AI review found 2 potential issu=
e(s) to consider:
> - [High] Relocating `debug_rcu_head_queue()` into `rcu_do_enqueue()` bypa=
sses double-free detection for deferred callbacks, silently corrupting the =
lockless list and inducing a permanent hard livelock during `rcu_defer_drai=
n()`.
> - [Medium] Invalid `WARN_ON_ONCE` in `call_rcu()` falsely flags safe NMI =
executions due to a flawed concurrency assumption.
> --
>
> --- Patch [2]: [PATCH v2 2/6] rcu: Make Tiny call_rcu() safe to call from=
 any context ---
> commit 866e1596ae5a7314657b9b0164dfabf922016c70
> Author: Puranjay Mohan <puranjay@kernel.org>
>
> rcu: Make Tiny call_rcu() safe to call from any context
>
> Give Tiny call_rcu() the same treatment as Tree RCU.  When interrupts are
> disabled and the scheduler is up, stage the callback on a lockless list
> that an irq_work re-issues later.  One global list and irq_work suffice
> since Tiny RCU is uniprocessor, and there is no CPU-offline drain.
>
> > diff --git a/kernel/rcu/tiny.c b/kernel/rcu/tiny.c
> > index dccccd6be9411..5736b964d8ee1 100644
> > --- a/kernel/rcu/tiny.c
> > +++ b/kernel/rcu/tiny.c
>
> [ ... ]
>
> > @@ -42,8 +44,86 @@ static struct rcu_ctrlblk rcu_ctrlblk =3D {
>
> [ ... ]
>
> > +static void call_rcu_defer(struct rcu_head *head, rcu_callback_t func)
> > +{
> > +     /* A re-entrant call_rcu() during the drain would livelock it; dr=
op it. */
> > +     if (rcu_defer_draining && !in_nmi()) {
> > +             WARN_ONCE(1, "call_rcu() re-entered during callback drain=
; leaking callback\n");
> > +             return;
> > +     }
> > +     head->func =3D func;
> > +     if (llist_add((struct llist_node *)head, &rcu_defer_list))
>
> [Severity: High]
> Does moving the debug_rcu_head_queue() check into rcu_do_enqueue() bypass
> double-free detection for deferred callbacks?
>
> If a double-free occurs, llist_add() will be called twice on the same nod=
e here,
> corrupting the lockless list by creating a circular link (head->next =3D =
head).
>
> When the irq_work executes rcu_defer_drain(), won't the llist_for_each_sa=
fe()
> iteration infinitely hang on the circular list before the delayed debug c=
heck
> can prevent the livelock?
>
> > +             irq_work_queue(&rcu_defer_iw);
> > +}
>
> [ ... ]
>
> > @@ -157,29 +237,15 @@ EXPORT_SYMBOL_GPL(synchronize_rcu);
> >   */
> >  void call_rcu(struct rcu_head *head, rcu_callback_t func)
> >  {
> > -     static atomic_t doublefrees;
> > -     unsigned long flags;
>
> [ ... ]
>
> > +     if (should_rcu_defer()) {
> > +             call_rcu_defer(head, func);
> >               return;
> >       }
> >
> > -     head->func =3D func;
> > -     head->next =3D NULL;
> > -
> > -     local_irq_save(flags);
> > -     *rcu_ctrlblk.curtail =3D head;
> > -     rcu_ctrlblk.curtail =3D &head->next;
> > -     local_irq_restore(flags);
> > +     /* An NMI reaching here entered with irqs enabled, so the enqueue=
 can race. */
> > +     WARN_ON_ONCE(IS_ENABLED(CONFIG_PROVE_RCU) && in_nmi());
>
> [Severity: Medium]
> Is this concurrency assumption backwards?
>
> If an NMI interrupted a context where IRQs were enabled, that interrupted
> context could not have been in the middle of rcu_do_enqueue() because
> rcu_do_enqueue() disables IRQs via local_irq_save().
>
> Since it's impossible for the NMI to race with rcu_do_enqueue() in this
> scenario, will this falsely trigger kernel warnings during safe NMI
> executions?

This code assumes that irqs_disabled() returns true in NMI handlers,
so the execution should not reach this warning in NMI handlers.
