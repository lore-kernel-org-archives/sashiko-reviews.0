Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=170.10.133.124
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793656062;
	b=KLgKRwi1JM8QNO3phMKVHmUXaJudPJQe6rXpefhDv/q9BCXr9EM1ZAw0PQBaS5wzh2ku
	 LdsAsTPrub3tEAECvkMkJZfwPdwGjCXTU84Nmmx+A3Gb+xoZSRvJA4ueYbVjU4J01F4uB
	 09nzQmUAEuvUgjswGRRvriOvkSM8zh++mrTgvLI8H34uCehQ4c2CVySBDhfzqWjtBKbSI
	 2pL3EGfX39mi3A8txaAhYkq3ESdZnPqY6yPnK56MsU023gkjx0cbFEI6BpxG+lHdmuBFa
	 Ri5k5C2y6DoR5w0PXjBopkILocXJxIR6FItj4nYxfBINYEtvuCsTmo7lSN6JirgBm8w==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793656062;
	h=DMARC-Filter:DKIM-Signature:Received:X-MC-Unique:
	 X-Mimecast-MFC-AGG-ID:Received:X-Google-DKIM-Signature:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:MIME-Version:
	 References:In-Reply-To:From:Date:X-Gm-Features:Message-ID:Subject:To:
	 Cc:X-Mimecast-Spam-Score:X-Mimecast-MFC-PROC-ID:X-Mimecast-Originator:
	 Content-Type:Content-Transfer-Encoding;
	bh=zVy3cyl0CvXI2khtfqIyMnjKNtXJR5EIeczb7Nf6ZU4=;
	b=J+uprySTLppMcLr35viaqXwkdOiVL7/LZMLAc+G90OJjvs6qfDYZKS1mWx5q6Ab7Z2Hy
	 X1VyMn2OrzaYPyeT6pc9Tc9glNk5xeejHxImAW0Lqyu+Q8JukI9/nfAX1wM0V7+egXF64
	 1h403ax16Z/6t9NmwhyRpqwrnHblDTn5SY/mD+viHJeGquWrMazin3Lbnb+VTzSLX4ERq
	 jmfvA+GS6mo6EAXuBMY6Scdlwva1HDgrW5w9s9yqJIiuGn+PhVUwutRHN5DdSI1Ib8N4n
	 0jH1UhDod+WZXV5Rztsr2HoV1r+mMSzU7klcU33ckXmL7v7Y6OJe6i9/34vyzuX8pTw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=redhat.com;
	spf=pass smtp.mailfrom=redhat.com;
	dkim=pass header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=mimecast20190719 header.b=BeWnDXQM;
	arc=none smtp.remote-ip=170.10.133.124
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F053E606A333
	for <sashiko-reviews@lists.linux.dev>; Mon,  2 Nov 2026 21:47:41 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org F053E606A333
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key, unprotected) header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=mimecast20190719 header.b=BeWnDXQM
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1793656060;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=zVy3cyl0CvXI2khtfqIyMnjKNtXJR5EIeczb7Nf6ZU4=;
	b=BeWnDXQMcjCcSrc+GKPv1TFkislztmiwd6gX2sLlIGr6G8FnoMuZRWfj1Jj2v5tn2/fJ/g
	5T7h9/H/XuppvzwO9mMA/9fNF3+OQuXWpV7S/NPs5kRGidJlXF4dA45Ow3wJfrvUdFJaB9
	q7doOXVmY7m2LgZ9/ep1Y4QTzwG049Y=
Received: from mail-lj1-f200.google.com (mail-lj1-f200.google.com
 [209.85.208.200]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-464-6NhZircbOwG2wvpNDFnSHA-1; Mon, 02 Nov 2026 16:47:39 -0500
X-MC-Unique: 6NhZircbOwG2wvpNDFnSHA-1
X-Mimecast-MFC-AGG-ID: 6NhZircbOwG2wvpNDFnSHA_1793656058
Received: by mail-lj1-f200.google.com with SMTP id 38308e7fff4ca-3ac4d85f3beso2882651fa.2
        for <sashiko-reviews@lists.linux.dev>; Mon, 02 Nov 2026 13:47:39 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793656058; x=1794260858;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=zVy3cyl0CvXI2khtfqIyMnjKNtXJR5EIeczb7Nf6ZU4=;
        b=IWQ1hAqpy3K8KeFuQq8ctPbKLnhtpMx6p/P8O3IZR4fbfI9XAZ2D/U02P3IygHC77k
         G7kJoflcEqhlFU7dLvN0Vj8pMHUOUv/cBMDqAeffINOAlWTDzCCoF2yo3+wy3Pm6xwec
         vXOrcnWGyAsZ64H2kIpaiSvVEVydNFpGh/WzRCjnyb2fa2IJTJkTsdp0eBj7N/3YefTN
         I8A1jGLA7EdOm+dDHdfMRKVoDij/Dyx+ZTJMe7aCr/94Pww85PBpaG3t1O+0pLhW/IKR
         LG03G30DfTBCn9zPdQwlzWXs6ieOG0H9DEtZ+mr6OdQFCpu3H1XfnVWkLw3084BYasg3
         YY2w==
X-Gm-Message-State: APuU4Z+AaVkXRbigHjq/ahZj2dcjgXlF59FhTWipZF0Hg3z9V3O5DEe8
	bYXLMWOV6WP0j5uSp9rpS66Pf3V2RB7ow+3aIk6yF/I4TDl/eRoTUsGJyl2vH74T7BMZxG48EFw
	Hx4lbbZqynbv8fVoETvlQiAsq/a8xbqX56QjUktCKrCofJBgDO7WEbF1un3AkMV0uMHT68shTni
	pjT2/ywokXT68YWSFRR0U1yh8MdVvIx8Pk77DwesbO3o3wMVuLPxwTcx0=
X-Gm-Gg: AYBFou0/t2j7AIL7omgYIULIqJ+TZNW0xCqXG5IJ0Kyu1pd1y9/+bv4NdWaBM9d3/WX
	ehgwu1Oo+XiDg3uMrdKqvweBqLJ0/4gVk8KYtb/zi4952sSC6mkISxrdgqpVJBbi8iD3ssA7W+X
	KdTi18QiCsiYZSF86B6ayWo/xb2U6mnUoFmvBc/o3+Tl9z4UwhyV5wlEps
X-Received: by 2002:a05:651c:435a:10b0:3ac:b2df:c518 with SMTP id 38308e7fff4ca-3acb788bd42mr19471391fa.0.1793656058043;
        Mon, 02 Nov 2026 13:47:38 -0800 (PST)
X-Received: by 2002:a05:651c:435a:10b0:3ac:b2df:c518 with SMTP id
 38308e7fff4ca-3acb788bd42mr19471361fa.0.1793656057467; Mon, 02 Nov 2026
 13:47:37 -0800 (PST)
X-Mailing-List: sashiko-reviews@lists.linux.dev
List-Id: <sashiko-reviews.lists.linux.dev>
List-Post: <mailto:sashiko-reviews@lists.linux.dev>
List-Help: <mailto:sashiko-reviews+help@lists.linux.dev>
List-Subscribe: <mailto:sashiko-reviews+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:sashiko-reviews+unsubscribe@lists.linux.dev>
List-Owner: <mailto:sashiko-reviews+owner@lists.linux.dev>
Precedence: list
MIME-Version: 1.0
References: <20261102-nxp-stm-fixes-v2-0-8ca2706f30ef@redhat.com>
 <20261102-nxp-stm-fixes-v2-3-8ca2706f30ef@redhat.com> <sashiko-outbox-194195@kernel.org>
In-Reply-To: <sashiko-outbox-194195@kernel.org>
From: Enric Balletbo i Serra <eballetb@redhat.com>
Date: Mon, 2 Nov 2026 22:47:26 +0100
X-Gm-Features: AclHuK_0a2IjcCcwCHH8GxxfGTwals0LlMjXS0TnljknwHPEB3JJYJs346FUJyM
Message-ID: <CALE0LRstkO4x4R9ohB-L+zGUH3xzTNj2Yswg69wtwmvRXo44HQ@mail.gmail.com>
Subject: Re: [PATCH v2 3/3] clocksource/drivers/nxp-stm: Increase min_delta to
 20us for PREEMPT_RT
To: sashiko-reviews@lists.linux.dev
Cc: linux-rt-devel@lists.linux.dev, linux-kernel@vger.kernel.org
X-Mimecast-Spam-Score: 0
X-Mimecast-MFC-PROC-ID: atSbkiKzvNjWAybLyquVZtJ4ybc2kK528_0S9iryL6M_1793656058
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi,

On Mon, Nov 2, 2026 at 10:25=E2=80=AFPM <sashiko-bot@kernel.org> wrote:
>
> Thank you for your contribution! Sashiko AI review found 1 potential issu=
e(s) to consider:
> - [Medium] clocksource/drivers/nxp-stm: overshoot check precedes channel =
enable
> --
>
> commit 1283cc4078852e277605e923b00287b73e75d175
> Author: Enric Balletbo i Serra <eballetb@redhat.com>
>
> clocksource/drivers/nxp-stm: Increase min_delta to 20us for PREEMPT_RT
>
> This commit increases the clockevent min_delta from 2us to 20us in
> nxp_stm_clockevent_starting_cpu() to prevent 32-second timer wraparound
> lockups under heavy bus contention on PREEMPT_RT kernels.
>
> > diff --git a/drivers/clocksource/timer-nxp-stm.c b/drivers/clocksource/=
timer-nxp-stm.c
> > index ed7662a4e2bc4..a1a0e23d33426 100644
> > --- a/drivers/clocksource/timer-nxp-stm.c
> > +++ b/drivers/clocksource/timer-nxp-stm.c
> > @@ -335,14 +335,18 @@ static int nxp_stm_clockevent_starting_cpu(unsign=
ed int cpu)
> >       /*
> >        * The timings measurement show reading the counter register
> >        * and writing to the comparator register takes as a maximum
> > -      * value 1100 ns at 133MHz rate frequency. The timer must be
> > -      * set above this value and to be secure we set the minimum
> > -      * value equal to 2000ns, so 2us.
> > +      * value 1100 ns at 133MHz rate frequency. However, under heavy
> > +      * bus contention on PREEMPT_RT, 2us is too tight and can allow
> > +      * the counter to pass the match value before the channel-enable
> > +      * write takes effect, leading to 32s wraparounds.
> >        *
> > -      * minimum ticks =3D (rate / MICRO) * 2
> > +      * Increase to 20us to guarantee the comparator channel is fully
> > +      * enabled before the match value is reached.
> > +      *
> > +      * minimum ticks =3D (rate / MICRO) * 20
> >        */
> >       clockevents_config_and_register(&stm_timer->ced, stm_timer->rate,
> > -                                     (stm_timer->rate / MICRO) * 2, 0x=
7FFFFFFFU);
> > +                                     (stm_timer->rate / MICRO) * 20, 0=
x7FFFFFFFU);
>
> [Severity: Medium]
> As reported by Sashiko on v1 [1], does increasing min_delta to 20us in
> nxp_stm_clockevent_starting_cpu() actually guarantee that the comparator
> channel is enabled before the match value is reached?
>
> Looking at drivers/clocksource/timer-nxp-stm.c:
>
> static int nxp_stm_clockevent_set_next_event(unsigned long delta, struct =
clock_event_device *ced)
> {
>         struct stm_timer *stm_timer =3D ced_to_stm(ced);
>         u32 val, now;
>
>         nxp_stm_clockevent_disable(stm_timer);
>
>         stm_timer->delta =3D delta;
>
>         val =3D nxp_stm_clockevent_read_counter(stm_timer) + delta;
>
>         writel(val, STM_CMP0(stm_timer->base));
>         ...
>         now =3D nxp_stm_clockevent_read_counter(stm_timer);
>         if ((int)(val - now) <=3D 0)
>                 return -ETIME;
>
>         nxp_stm_clockevent_enable(stm_timer);
>
>         return 0;
> }
>
> nxp_stm_clockevent_disable() clears STM_CCR_CEN in STM_CCR0, and the
> hardware only generates a match event when STM_CNT equals STM_CMP0 while
> STM_CCR0[CEN] is enabled. Because nxp_stm_clockevent_enable() is called
> after reading now and checking (int)(val - now) <=3D 0, the latency of wr=
iting
> STM_CCR_CEN to STM_CCR0 is not covered by the -ETIME overshoot check.
>
> For any programmed delta (20us or larger), if bus contention, an NMI, or
> hypervisor/firmware delay between the two counter reads leaves val - now =
as
> a small positive number of ticks, the overshoot check passes while the
> channel is still disabled, and STM_CNT can pass val before the subsequent
> nxp_stm_clockevent_enable() write takes effect in hardware.
>
> Should nxp_stm_clockevent_set_next_event() enable the comparator channel
> before reading now for the overshoot check (and call
> nxp_stm_clockevent_disable() if (int)(val - now) <=3D 0 before returning
> -ETIME) so the counter read is ordered after the STM_CCR0 write on the bu=
s?
>

I answered this in the first version of the PATCH 2/3, this describes
the same race you pointed in the PATCH 2/3 and I think the race is
possible but I believe it cannot occur in practice with the current
min_delta:

set_next_event is called with local interrupts disabled, so
nothing can preempt or extend that window. The gap between reading
now and the writel in nxp_stm_clockevent_enable() is a
comparison, a branch, and a single MMIO write. With min_delta =3D 2us, the
check is still close to the write.

Reordering to enable-before-check introduces a different problem: if
the comparator match fires between nxp_stm_clockevent_enable() and
reading now, the interrupt handler delivers the event via
ced->event_handler(ced) and then we also return -ETIME, causing, if
I'm not mistaken
the clockevents layer to program another event, causing a double delivery.

Thanks,
   Enric

> [1] https://lore.kernel.org/r/20261026-nxp-stm-fixes-v1-3-20a64a4ea454@re=
dhat.com
>
> --
> Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20261102-nxp-stm-=
fixes-v2-0-8ca2706f30ef@redhat.com?part=3D3
>

