Received: from mail-ej1-f44.google.com (mail-ej1-f44.google.com [209.85.218.44])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C64193DA7ED
	for <sashiko-reviews@lists.linux.dev>; Mon, 10 Aug 2026 12:46:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.218.44
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1786365977; cv=pass; b=dpnHOIZLCtNXH/y7nPWGlM6V+hqP7Iux9Gca/U+VTN3xbeqUyPFsiAoIdY46DpDgEcMCAGaR5O/8473Y1vwiF8PTFJposeIknLAQq5j4I3ttS10Hhqw2GB/IuIuQXVnnYNpw97zZI1GIFwAHum1iPpUXo46VIh3c21C23CIh9Jk=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1786365977; c=relaxed/simple;
	bh=fC5scpO7qB1WJtBVuvM5ZMx/R6ROE9ZcFEteFfw1clQ=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=EYZGrvC/i8xUC/KnnoD3mx4yL7rls6xZJHimVK4YFnTKoncd4u05paWZqnoBufIG3rg/WLle7EIAWnp7u/i2aM6OhFVBAQX1gmcIy1Tf+2llvWYjjBdf2ag/a6t0/KDSU9ri2hu0cWKj4EL6GMPbKtV3Uw9jfHDGJMKxupdzg88=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=V7DnEv0x; arc=pass smtp.client-ip=209.85.218.44
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="V7DnEv0x"
Received: by mail-ej1-f44.google.com with SMTP id a640c23a62f3a-c2020421077so284321766b.3
        for <sashiko-reviews@lists.linux.dev>; Mon, 10 Aug 2026 05:46:14 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1786365973; cv=none;
        d=google.com; s=arc-20260327;
        b=MLw0cA0k8/3zcUIJYOKkBeuFWLISg1+vCUjwQiL0i/34FpZ61GZhlS60rcWE0+D+MW
         UtPM6hU7rN2rhVZ8AxS3Ig/htivCTWQtlK0zjdZDaIVVYRKiZ4uhFtFNCymRuiE/XiKI
         LtPQ1nlfoZT0pwf9WY9ZaKy5B/FtyRiehqxP9PQjDJmNI6FYGnmMtUK5+zIMfj1ujqwg
         K2YQfsrcmY2KMD4aZ6amr56zks0jH51wngunrGeoM67xEK1q+98DyiJIYvEKi5r+kKMB
         hMXGZfXTS/zEuJWzw70RK0gSh6zuOx+4JD7OSae2+9VUqTIo/bOkadWcCskrgcRNzGrK
         /E6Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=fsow79yVgjfnSj31xvsO1YjaEkdqg7wriMmgcGrZl6Q=;
        fh=wJLqPHjuuMG2916G6j4aClUPHAJGtpTC0KrTXfTlKBo=;
        b=VziviCvx+0ToUw213Z62+hkm1gSQMEyS1r2OLJT9N2h4m7DP/xspMbd/EBThckBBDj
         imodok4K45Bq1YHE1BJqsRKsUKeDWWwnVlaAdsrEFTrqgxB09traBUyeUfDaIIJN6PTr
         fQ2Nc+sWkhwRf8sBwNfoPoPi3jyjmq+FO6zWQWYfcjgDDSBnGQwGF1JhFvO83h6FOis9
         1Dd61fXvWmMm/KFOvgI6w4uZ9KiG8Oz4JnDsGK0UdhLn/IO5BZdXezZSX9Bxj7O6LP90
         0aNW6/cJbBmDqqvLnfnvKvoREZSURVofEbJmpcKIPoDrkQ8SwO0XMryoKuO3WoiSjSCT
         fSrQ==;
        darn=lists.linux.dev
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1786365973; x=1786970773; darn=lists.linux.dev;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=fsow79yVgjfnSj31xvsO1YjaEkdqg7wriMmgcGrZl6Q=;
        b=V7DnEv0xPiWbz3H/+iKUpyCBFfu9LiPMWDLjpVkiRZ+Pyb/3Y7fl+MDFqr4i687NP2
         dqTXSIjRItLLa0pkH32h0CoHr8pezCVtv2LRPXeGoaGBJBI6EGECiNPGdg8rDTtsM843
         wPa6fVd3wSeTefbqi2a58k3ZpOH4cToRpiEubxbInzPGNNam68xhdv8/IkLOHHIb+w/T
         dyv4IY7SExc0GO2779yHeO/BqgXP4npH+R5JTG0DNTWdeTqX1lIfaOMOSftSSUyQI7JT
         yiyoczDffuoVAvQ9kr2vpo80nUIDb0/xCQaDd17x4DnvM7XPjAit/swXnk4DtT0jmq67
         petQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1786365973; x=1786970773;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=fsow79yVgjfnSj31xvsO1YjaEkdqg7wriMmgcGrZl6Q=;
        b=ZK7YDuWNPpFS8wVggQeyyE2uj+nadABVFOB3076w+jF/CkuiVJi/zJYaDoBGxumLFK
         4ew15Uj9dKFwlhFgXozOKpbmIEBUIipjrtdYtQ2qFKT5QkigqyE9HV49P5JbBLEvRxw9
         JmXT4xq5r8t2VJhEGVoxEc6Ds9Rnv2nie3f6HVTgHDNy6QHPP96GtKv5HHNA7LxvIEI9
         FXONrcjx13H0v6YwKbzPLx2u4PjqF9cQ3t0zr9htdHW1vHy9ZrcvyId8vJe5n81J153I
         Nk53+8TqtyCBu8IKwTZUjCsrLHDWWIjqF3ZDYvORxXpSlpfEX3RyYBnpe00wartv2ifq
         ZWmA==
X-Gm-Message-State: AOJu0YzqcfsfOsaiAOHf4qhnOK+EmUNOa3rVsw5O2lmflxDIMyQsKlh5
	IIyHvTN8V6otuy2PL56YjErp9C1s20vKDKBg73KMOsCV2pGOYcR/caXd2MirRjhYERz13vG15fc
	AxeJal3551Haq1ixaOI4n+sBVWN/sX8q0ayQqfTpLOw==
X-Gm-Gg: AR+sD13WwyvBsT4xgdYRDbaUAXa7zPtOfFeCeG5O4jivxfOU9g+nz3ORgUI92ND8nzs
	howiASU6YM/534NG50x62mJ7HT2opu3KB8jyWxfDtiWu6aoHDV02pos6r72enQ+SMEb8sUSPAzy
	tNmCsfx8xycowlE7imCxcMXnQRwXjVK+HVoIcMdiOqaAGCq2U7x5NBRSqr4m1hIUXWBOPlgo6o1
	K/Oe7HtrLygfb+Nkfqzg5fgcLErWf35kp6ppE7wsn4Ivbu5dVzTh0vWVs5XEXSnc9otKG3dJrse
	G9aoKNlfWynRJvWMcM5OrDkq749IPE3rPoiPrXSzRjIzYhmJZeUvBlhH3oOZ
X-Received: by 2002:a17:906:fe46:b0:c20:1ec5:feb8 with SMTP id
 a640c23a62f3a-c20c6a09bccmr70511066b.29.1786365973030; Mon, 10 Aug 2026
 05:46:13 -0700 (PDT)
Precedence: bulk
X-Mailing-List: sashiko-reviews@lists.linux.dev
List-Id: <sashiko-reviews.lists.linux.dev>
List-Subscribe: <mailto:sashiko-reviews+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:sashiko-reviews+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20260810122758.183765-1-puranjay@kernel.org> <20260810122758.183765-3-puranjay@kernel.org>
 <20260810124300.6F6F61F000E9@smtp.kernel.org>
In-Reply-To: <20260810124300.6F6F61F000E9@smtp.kernel.org>
From: Puranjay Mohan <puranjay12@gmail.com>
Date: Mon, 10 Aug 2026 13:45:58 +0100
X-Gm-Features: AUfX_my7sbKVXUQi_BH5L2H9-539lpsxcbJXElUuAGQoqY3CI2Fhbga_HcDN4KA
Message-ID: <CANk7y0gXovcHspdT9T3SRdnW5_R5z3-25G+CJnHTD3UPPFSLRw@mail.gmail.com>
Subject: Re: [PATCH v4 2/6] rcu: Make Tiny call_rcu() safe to call from any context
To: sashiko-reviews@lists.linux.dev
Cc: linux-kernel@vger.kernel.org, bpf@vger.kernel.org, 
	linux-rt-devel@lists.linux.dev
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Mon, Aug 10, 2026 at 1:43=E2=80=AFPM <sashiko-bot@kernel.org> wrote:
>
> Thank you for your contribution! Sashiko AI review found 1 potential issu=
e(s) to consider:
> - [High] Moving `debug_rcu_head_queue()` into `rcu_do_enqueue()` bypasses=
 debugobjects tracking for deferred RCU callbacks, masking use-after-free b=
ugs and causing list corruption on double frees.
> --
>
> --- Patch [2]: [PATCH v4 2/6] rcu: Make Tiny call_rcu() safe to call from=
 any context ---
> commit b9d1d9e1aa870c19c3d9b30019cdb1bc509b6703
> Author: Puranjay Mohan <puranjay@kernel.org>
>
> rcu: Make Tiny call_rcu() safe to call from any context
>
> This commit updates Tiny call_rcu() to handle interrupts-disabled context=
s
> when the scheduler is active. It defers the callback on a lockless list
> which is re-issued later via an irq_work, similar to Tree RCU.
>
> > diff --git a/kernel/rcu/tiny.c b/kernel/rcu/tiny.c
> > index dccccd6be9411..656b6a682e31a 100644
> > --- a/kernel/rcu/tiny.c
> > +++ b/kernel/rcu/tiny.c
> [ ... ]
> > @@ -157,29 +251,19 @@ EXPORT_SYMBOL_GPL(synchronize_rcu);
> >   */
> >  void call_rcu(struct rcu_head *head, rcu_callback_t func)
> >  {
> > -     static atomic_t doublefrees;
> > -     unsigned long flags;
> > -
> > -     if (debug_rcu_head_queue(head)) {
> > -             if (atomic_inc_return(&doublefrees) < 4) {
> > -                     pr_err("%s(): Double-freed CB %p->%pS()!!!  ", __=
func__, head, head->func);
> > -                     mem_dump_obj(head);
> > -             }
> > +     if (should_rcu_defer()) {
> > +             call_rcu_defer(head, func);
> >               return;
> >       }
>
> [Severity: High]
> Does moving debug_rcu_head_queue() into rcu_do_enqueue() bypass debugobje=
cts
> tracking for deferred RCU callbacks?
>
> Execution is routed to call_rcu_defer() before debug_rcu_head_queue() can
> activate the object in the debugobjects tracker. Adding to the lockless l=
ist
> in call_rcu_defer() overwrites head->next without verifying if the RCU he=
ad
> is already enqueued.
>
> If a caller erroneously frees the object or double-queues it during the
> deferral window before the timer tick issues the irq_work drain, could th=
is
> mask use-after-free bugs or create cyclic structures on double frees?

double calling call_rcu() is already a BUG and doing it from NMI is
one level more. debug_rcu_head_queue() can't be called from NMI, until
we have something that can work from NMI we have to go with the
current implementation.
