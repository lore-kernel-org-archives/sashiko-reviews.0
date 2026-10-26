Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=170.10.129.124
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793038336;
	b=WDcZhvd5cR+hv02TltZlFho7nDECyu7M3hojoOB9dLa29Dw/Ba/JW3MoEnBQCNJXkXoi
	 x+E3wfINP/fK7XOiBoKynUsJRysoVZAPywwV6EniSs9fFkqECTZPdjPWxknT3BCYVmi+R
	 gArVu5db2Has0PmpiGwj68Z0RzajMs2ir5OuxkF5lEA86ut2efckWonftcL3HtmuUreUT
	 1KayidK3ecZ5NfDPnlmuYLi96PGn4RFlRx87zl0TnlcHrGyx0oTxY2Yu7ZkwKkO8iP4kl
	 4k5dbr2I3v6oBYfvGkxkGxalNJcddAJn6HwsAI+hj1NoBNhvRlq9qS+u910E9eS3Nxw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793038336;
	h=DMARC-Filter:DKIM-Signature:Received:X-MC-Unique:
	 X-Mimecast-MFC-AGG-ID:Received:X-Google-DKIM-Signature:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:MIME-Version:
	 References:In-Reply-To:From:Date:X-Gm-Features:Message-ID:Subject:To:
	 Cc:X-Mimecast-Spam-Score:X-Mimecast-MFC-PROC-ID:X-Mimecast-Originator:
	 Content-Type:Content-Transfer-Encoding;
	bh=q5LRojRVuKvX7mEgiFNp5sY87D/Oh0+01py2kiHB1uk=;
	b=3G+g1G7xY6NNgC+KU4r6d+UB/K1K6PT02KAlEpmuv2epsAW0x9wqP26EXDjn7ptyFhIm
	 YM6nSVugqVzFrPWhV/6VZ0sZnlj0TQTrawAQkTCu+VDQUcPAWg/LfRjao6+Z7r6D3SNG3
	 LEdmzniijZS9z1kcnKcu24qEzv8HdPzBUdmBsp2RPV2Qmz1JEK2r2hWjZyPuwMIgcypIT
	 elVmp69a6Q7qNuQ2/XD6shvyKePHXwUDS9LcT/JigcRJd3JRrN1518iyOQBEfWqU/DLsU
	 ERZ/I+GKmzaZL+nRFYmkEeeVTVdpw+ijb/A3RWJhoYTvcjaJqMYOQtBBXv/IVFcihfg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=redhat.com;
	spf=pass smtp.mailfrom=redhat.com;
	dkim=pass header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=mimecast20190719 header.b=FWAXJW4P;
	arc=none smtp.remote-ip=170.10.129.124
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 465AB606A31E
	for <sashiko-reviews@lists.linux.dev>; Mon, 26 Oct 2026 18:12:15 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 465AB606A31E
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key, unprotected) header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=mimecast20190719 header.b=FWAXJW4P
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1793038334;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=q5LRojRVuKvX7mEgiFNp5sY87D/Oh0+01py2kiHB1uk=;
	b=FWAXJW4Pif4ia1yY5VWlNPMCoF4HzsjAQCeM1kUExCmBvSNOTp8fabxJZaFK3fh0iV0sxG
	OEOiPTHtlkCi1uCduyiQMeF4ezu/1SpB2s8sy5TFDumSVYlmSsiorxdFW5UlyN2V1Kq5R6
	ET2XxGnBrTgvtWh1xr/KgHPv4FlIo6A=
Received: from mail-lj1-f198.google.com (mail-lj1-f198.google.com
 [209.85.208.198]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-511-H4EJYShcOsqf9LGhJjf5FA-1; Mon, 26 Oct 2026 14:12:12 -0400
X-MC-Unique: H4EJYShcOsqf9LGhJjf5FA-1
X-Mimecast-MFC-AGG-ID: H4EJYShcOsqf9LGhJjf5FA_1793038331
Received: by mail-lj1-f198.google.com with SMTP id 38308e7fff4ca-3ab2bd84bd3so3077321fa.0
        for <sashiko-reviews@lists.linux.dev>; Mon, 26 Oct 2026 11:12:12 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793038331; x=1793643131;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=q5LRojRVuKvX7mEgiFNp5sY87D/Oh0+01py2kiHB1uk=;
        b=LQiBUacc4eEHzNZUQSBl0cEBdOXdTEaB7DLbT4uT2i4kuXbnfUn8SxkJgtnwDpVKOg
         FNlK7VMuH66Y9XSh1mMjAgexhC1LuPvFX64bnsBr+UqxcQRML9RdaIn9otkIT2CG1Pyu
         Vi1T0bQsEh2DUSmH166W0TYOyTHKAkfByHCUhRKXDP7PGex14w62DWsBfSFlTwBHm7MB
         ySFJFvZTuDRPQb11V6G0bQF1EdbEtqeBM499zZp8f2TmEspiH2iF37k0+GK27+vmKoJU
         ib1KKk6lx2DZJdRY7FqVARX8J51KG1zFL012mxOqpzjZgKsnEK0jbUSMqOwbkZhuPmB9
         U1+g==
X-Gm-Message-State: AFq9FYI26VDCZEWW45ZJEjD9XQrNp5j/gV3w+c6e7wo/A3C4+SeQ4QY8
	0QEToaWRqt3zK4dddRgfD54PKFwtaiXpmANOwaKE8E708UAiyV+lI+EWs4VDIva0+IBVPZzyeWk
	sw5zxAFn22fsbbCX1C8LuKfxs1FTOkRTr0UNjb6QhlCEvVN0rTXzNQfqGAWDk/nzOnFlBRIFhp6
	4z68wgB1sLGqhyE5qWnqiHgXo/T5kx0xjSmRmMncGO8fZSDshWubHWagA=
X-Gm-Gg: AYBFou0YiZRt/rIaK83PwmEmWOE1IiFzGhW8gMTMPhOax0XpJGFc602307jxBNULZTM
	yy7r78dF6icqR4MLFRIdNoe0odUBX0jGp7Jn/WzRYcOHkDmhfYn4E8qaf1u5ewedZNB0m2y4yjh
	/KhnKxDU1rF/NjnCd7+LeuPDr4BLBwpR1bpsOc8I3pUkNctSIgvHeJziuL
X-Received: by 2002:a2e:80d1:0:b0:3a6:5cdf:d9a4 with SMTP id 38308e7fff4ca-3ac6fca987dmr13222231fa.2.1793038331216;
        Mon, 26 Oct 2026 11:12:11 -0700 (PDT)
X-Received: by 2002:a2e:80d1:0:b0:3a6:5cdf:d9a4 with SMTP id
 38308e7fff4ca-3ac6fca987dmr13222151fa.2.1793038330658; Mon, 26 Oct 2026
 11:12:10 -0700 (PDT)
X-Mailing-List: sashiko-reviews@lists.linux.dev
List-Id: <sashiko-reviews.lists.linux.dev>
List-Post: <mailto:sashiko-reviews@lists.linux.dev>
List-Help: <mailto:sashiko-reviews+help@lists.linux.dev>
List-Subscribe: <mailto:sashiko-reviews+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:sashiko-reviews+unsubscribe@lists.linux.dev>
List-Owner: <mailto:sashiko-reviews+owner@lists.linux.dev>
Precedence: list
MIME-Version: 1.0
References: <20261026-nxp-stm-fixes-v1-0-20a64a4ea454@redhat.com>
 <20261026-nxp-stm-fixes-v1-2-20a64a4ea454@redhat.com> <sashiko-outbox-184830@kernel.org>
In-Reply-To: <sashiko-outbox-184830@kernel.org>
From: Enric Balletbo i Serra <eballetb@redhat.com>
Date: Mon, 26 Oct 2026 19:11:59 +0100
X-Gm-Features: AclHuK81-1LK4q_yytgG1uMwQPIDanhJ70i6Kw8EPDWxX6uc0SJ6PQv6pFkREWI
Message-ID: <CALE0LRuWsWm-i3PPvdsJV66MAUmm9GZgWJRvXfD6iNp10McfLQ@mail.gmail.com>
Subject: Re: [PATCH 2/3] clocksource/drivers/nxp-stm: Fix missed comparator
 match in set_next_event
To: sashiko-reviews@lists.linux.dev
Cc: linux-rt-devel@lists.linux.dev, linux-kernel@vger.kernel.org
X-Mimecast-Spam-Score: 0
X-Mimecast-MFC-PROC-ID: nAZo3GS20ptTVV8e9Kighjo1ZgprUecb7pjA4puLBIU_1793038331
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi,

On Mon, Oct 26, 2026 at 10:50=E2=80=AFAM <sashiko-bot@kernel.org> wrote:
>
> Thank you for your contribution! Sashiko AI review found 1 potential issu=
e(s) to consider:
> - [High] clocksource: nxp-stm: overshoot race in nxp_stm_clockevent_set_n=
ext_event()
> --
>
> commit 45f273b782a28cec6ef30880d738a9cb690edce9
> Author: Enric Balletbo i Serra <eballetb@redhat.com>
>
> clocksource/drivers/nxp-stm: Fix missed comparator match in set_next_even=
t
>
> This patch fixes the overshoot check in nxp_stm_clockevent_set_next_event=
()
> by using a signed comparison between the target comparator value and the
> current counter value to avoid missed matches and 32-bit wraparound stall=
s.
>
> > diff --git a/drivers/clocksource/timer-nxp-stm.c b/drivers/clocksource/=
timer-nxp-stm.c
> > index ee249fed1b918..ed7662a4e2bc4 100644
> > --- a/drivers/clocksource/timer-nxp-stm.c
> > +++ b/drivers/clocksource/timer-nxp-stm.c
> > @@ -247,7 +247,7 @@ static int nxp_stm_clockevent_shutdown(struct clock=
_event_device *ced)
> >  static int nxp_stm_clockevent_set_next_event(unsigned long delta, stru=
ct clock_event_device *ced)
> >  {
> >       struct stm_timer *stm_timer =3D ced_to_stm(ced);
> > -     u32 val;
> > +     u32 val, now;
> >
> >       nxp_stm_clockevent_disable(stm_timer);
> >
> > @@ -258,16 +258,12 @@ static int nxp_stm_clockevent_set_next_event(unsi=
gned long delta, struct clock_e
> >       writel(val, STM_CMP0(stm_timer->base));
> >
> >       /*
> > -      * The counter is shared across the channels and can not be
> > -      * stopped while we are setting the next event. If the delta
> > -      * is very small it is possible the counter increases above
> > -      * the computed 'val'. The min_delta value specified when
> > -      * registering the clockevent will prevent that. The second
> > -      * case is if the counter wraps while we compute the 'val' and
> > -      * before writing the comparator register. We read the counter,
> > -      * check if we are back in time and abort the timer with -ETIME.
> > +      * If the counter reached or passed 'val' during or before the
> > +      * write to the comparator, the hardware match will be missed,
> > +      * resulting in a full 32-bit (32.2s) wraparound lockup.
> >        */
> > -     if (val > nxp_stm_clockevent_read_counter(stm_timer) + delta)
> > +     now =3D nxp_stm_clockevent_read_counter(stm_timer);
> > +     if ((int)(val - now) <=3D 0)
> >               return -ETIME;
> >
> >       nxp_stm_clockevent_enable(stm_timer);
>
> [Severity: High]
> Can the counter still advance past val before nxp_stm_clockevent_enable()
> arms the channel comparator in drivers/clocksource/timer-nxp-stm.c?
>
> At the beginning of nxp_stm_clockevent_set_next_event(), channel 0 is
> disabled before programming STM_CMP0:
>
>         nxp_stm_clockevent_disable(stm_timer);
>         ...
>         val =3D nxp_stm_clockevent_read_counter(stm_timer) + delta;
>         writel(val, STM_CMP0(stm_timer->base));
>
> Unlike timer-imx-gpt where the compare interrupt remains enabled while
> writing TCMP, writing STM_CMP0 in the NXP STM does not arm the comparator
> until nxp_stm_clockevent_enable() writes STM_CCR_CEN to STM_CCR0.
>
> Because now is read from STM_CNT before nxp_stm_clockevent_enable() is
> called, if now is sampled just below val (so (int)(val - now) <=3D 0 is f=
alse)
> and STM_CNT reaches or passes val before the subsequent write to STM_CCR0
> takes effect in hardware, the match occurs while channel 0 is still disab=
led
> and is missed.
>
> Should nxp_stm_clockevent_enable(stm_timer) be called before reading now =
for
> the overshoot check, with nxp_stm_clockevent_disable(stm_timer) called on
> the -ETIME path?
>

The race is possible but I believe it cannot occur in practice with
the current min_delta:

set_next_event is called with local interrupts disabled, so
nothing can preempt or extend that window. The gap between reading
now and the writel in nxp_stm_clockevent_enable() is a
comparison, a branch, and a single MMIO write. With min_delta =3D 2us, the
check is still close to the write.

Reordering to enable-before-check introduces a different problem: if
the comparator match fires between nxp_stm_clockevent_enable() and
reading now, the interrupt handler delivers the event via
ced->event_handler(ced) and then we also return -ETIME, causing
the clockevents layer to program another event =E2=80=94 a double delivery.

This check-then-enable ordering is also pre-existing in the original
driver; this series only fixes the comparison logic, not the
sequencing.

> --
> Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20261026-nxp-stm-=
fixes-v1-0-20a64a4ea454@redhat.com?part=3D2
>

