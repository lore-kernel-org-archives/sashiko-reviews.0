Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.208.180
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1793009423;
	b=vFRpDmBV5azffoToeVQlkDxW/M1Zxmuva9KqWTKXUhsdBO/0WCkHPWeUq8NJXOlUxXlh
	 pyUjFIDAz2pAO2DgNd+eR27mAiWqdbmtM1th1Y50t4ai9vfdjH3tJ8qbAp1QvtqAeuH5N
	 xgemBNwxEQ6xah3Dx+n1uSA0dCsB0iteboMROBMDZF9AXAJ3PKeNFa10QCPUucsgCpdKV
	 l93kzCFUjJDRAVM7GcDSLzpAiKmoEN5Q/QBnd+CPJodLM5Kf/mIqgCkkaHru0mUfh+U06
	 90lLSwyAZgoV/M8XdTOrH8p+lGOEHzZ4wa/6tvXJFK3wQcO3y2xq+A4XTONKosDQiHg==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793009423;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:MIME-Version:References:
	 In-Reply-To:From:Date:X-Gm-Features:Message-ID:Subject:To:Cc:
	 Content-Type:Content-Transfer-Encoding;
	bh=WIfVKwsrPjLWsh90vbkt1d0E7lY5jGAHXwNPjz5Yee4=;
	b=JEELCaRaPUKM7sNO9sRpx6G9adwf7FZoQwmoAVxcYcaF1ShELzem9JWsR4Rmlt9tL+qc
	 D5pmf5OVW1wD6VZTVLcACo/QTw6/11o0qhJcoQaoeRCgjnGrmcp1xf64rfX9hKVRHZ8Fy
	 KVvBq36tVvxMj5CfwRDNNkURCQpWQbDg9yjmUOOpdBbx36EkQlfULuyX9FT18GEnl4WgJ
	 0/dJTpQWooA9mYSDNHBfE4K0x4pMgv97kuI3/1HLHevDAVERwW8D79Wxy7bF55h9ZxwVF
	 4F6TFKqIoPKIDaAL3wcf2IFSvD7y26XfYenyTonGV5lMp/F9RZ6ouOBn9v8lfcmTt9g==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=nebusec.ai;
	spf=pass smtp.mailfrom=nebusec.ai;
	dkim=pass header.d=nebusec.ai header.i=@nebusec.ai header.a=rsa-sha256 header.s=google header.b=OZxeVrCc;
	arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.208.180
Received: from mail-lj1-f180.google.com (mail-lj1-f180.google.com [209.85.208.180])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 17E3F606A320
	for <sashiko-reviews@lists.linux.dev>; Mon, 26 Oct 2026 10:10:22 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 17E3F606A320
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=nebusec.ai
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=nebusec.ai
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=nebusec.ai header.i=@nebusec.ai header.a=rsa-sha256 header.s=google header.b=OZxeVrCc
Received: by mail-lj1-f180.google.com with SMTP id 38308e7fff4ca-3ab4c608a6dso20336301fa.1
        for <sashiko-reviews@lists.linux.dev>; Mon, 26 Oct 2026 03:10:22 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1793009421; cv=none;
        d=google.com; s=arc-20260327;
        b=jp0meCGl0icNPnJrD2pVqx8rbhiaqfWLD+OqvhWk8ZTpluK1YTJOGhMSUdYYLbZ65C
         BiBW2Atw1H2FKDmQUkH40jXVV0RRMSMcEWv5rNSyoVXk95Wq9yhQAgfn5iiK1sBYXBQJ
         R4ximLV9iXCGKr6NRkD9qQJB4wks0fGp3yLlyfKMPmQTt50781g0reHkbnrCmDh/618e
         oXqtpQLmxWOg5s/xfunTCrsIKliL612uzSwR++HN6Yf9hvOb1a37ytciRGN/jzV7/yhg
         tH2o8EeBVr7hX7gd9Qz4reSKAXkhStvD7zxPtfgwdxfyOlgjWaYvOad3mmVJRfCUgjex
         rlAA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=WIfVKwsrPjLWsh90vbkt1d0E7lY5jGAHXwNPjz5Yee4=;
        fh=UDmiFjDUsl58/oI1pbxKLXmAuoEiB7qNSJQzd9c7Gr0=;
        b=ArbwwpQcKntJlHCOtDKv8Kd67u9737nUEb7JgJHKsGOburjrVhV/wFgnr7bcd8qK2v
         x7OJmOQxCsSN2BajmkCvf5SWz1ZsLDSRQh1FmtoBdcwvugzDYpln8+5yTvc6jtcsEiZz
         tnDrvnzoIBKiRKYfdUhhHV1Ibbr7DWHlyP7LMEsteIMB49VAhDEQ0IjV/KyD8ADLFmV+
         TE1vZP6MkJtcD2vIqyZFYTkvyrOFcdQ4pkin+kMp1SeC1UEAq2/YRgKvOI/svIWySDJ+
         ZP+ho0UJtNYAnQzb1uVVjFgsg6hG+NxjXRqDH9A3cINWRg8i7ZVfVm18w85MMybA9kCQ
         AjKw==;
        darn=lists.linux.dev
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=nebusec.ai; s=google; t=1793009421; x=1793614221; darn=lists.linux.dev;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=WIfVKwsrPjLWsh90vbkt1d0E7lY5jGAHXwNPjz5Yee4=;
        b=OZxeVrCcmOn3xMPbYAi6cDdhwNUN4P3qfqGMCellFqK1bM2V0BTAo6+ZztLQL7BJ85
         iMBGYT2qLxs5qvoEv0G/V0qkz2JUpeb/l6iQjMnQGZ8tzkGk0QWpTo5ucseL5trXZtuf
         bzCcg7mGzYuF7VvsZJVWGSL8gELbTmk1V35aLgApwX0IT6Irk3PFJiDeYX8P1wiojFu1
         GIGl63CogNhLtk1+VTHClJJFGDTtqRVjgxpJlLDOfG06YFU1JTXzg6YWGSlImrjkPzuS
         oK7KkuaaGGJ3Z5PvnN5hLudkp7XuElNRuEz/rKWdEmCFrS8gFHIe3J+AoSAvB8IaP2ev
         HU7w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793009421; x=1793614221;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=WIfVKwsrPjLWsh90vbkt1d0E7lY5jGAHXwNPjz5Yee4=;
        b=JV6MQaUCJhq4EmnjR7hCOfSIGsDTWVyUooKsXQ1oo8xtkamGp8giCojDUfz6kSObXT
         zyc7OCMdD0KzJhEQ933g8YlyOs+2bI/gEZXgkMU5C/hngR0KTfrW0d5uD2h5lvEyo/Ru
         W4rXl+l2avrGkcgeTWhypFjdjMmInwSiLEm6CHESmImmi84g5xi0EuTnEdG6XWdotsuP
         IfMHtJaIAlhPpjlhvoOd6RAHwgnI/6N8ox78DUNQ9dN8uMdLdl3ONHIsHYuOOHvDix0W
         DMZF1efnNXAO/gXoguscOrlWafmCORlP1IF9eKFiflf+H5O/6RjnRpO2erhR/GS3v4Ou
         f/Lw==
X-Gm-Message-State: AFq9FYL4gIVMgZrQljS6POLxxBMNR/nnUvIjm2IxtxNzCTqsV3w4l4/J
	Y8lapDrBlmfEyJwWX1SsDH46NMvgW9ibREfIDZSS3j/gYOfKKjEht9VaK24juVnCE5i3B8/LBDn
	1T2qCmHHcv/yPxf6BatVQ5/8QCd2+oacTglMPBCTRiURSrDJsVXlYZ1DmqKApCQ==
X-Gm-Gg: AYBFou2+fU+gr35JLV3HJ/TfX1cSrKHLgF8xc+5oG8WVx6byzmsnLkRey/XPZORAJTW
	/lwnMq+Xe4ubETvKyHH1TyGgctQ3lKFQfXx5isgJHx9M5Wd2ZjvegiXANiwQn+UsFWs55n1kUcc
	/3YHJgVtiuoonJoFJhdqgcbxA7SdCQ9LlJAo/x1jRAc77HL96LyJ3sEqKRy/oh29sBBrc5TlEsH
	qeNUsztVe6n5J0ljFBhk60/hoBKnckEUMQXxkmjT6Wrl+VzyjuKBom6Woe6Pv86AQHigBADQGMK
	ncv9zEpIteUl137UYx/kD870B08ZP3tpBIYwgYSuqiHa18nkezZncaRS4eLkeRwCaVDzhKoR0HF
	F8NWaThtVdqAi4ojLdjmswIfbO+OejEODXPBLQQo2pSsx1QhvGGgWAoJTILKAHygvWFXX
X-Received: by 2002:a05:651c:a143:b0:3ab:540b:f4a7 with SMTP id
 38308e7fff4ca-3ac6fcaf492mr11424881fa.8.1793009421188; Mon, 26 Oct 2026
 03:10:21 -0700 (PDT)
X-Mailing-List: sashiko-reviews@lists.linux.dev
List-Id: <sashiko-reviews.lists.linux.dev>
List-Post: <mailto:sashiko-reviews@lists.linux.dev>
List-Help: <mailto:sashiko-reviews+help@lists.linux.dev>
List-Subscribe: <mailto:sashiko-reviews+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:sashiko-reviews+unsubscribe@lists.linux.dev>
List-Owner: <mailto:sashiko-reviews+owner@lists.linux.dev>
Precedence: list
MIME-Version: 1.0
References: <cover.1792979091.git.zihanx@nebusec.ai> <6bbcca411ac9433ae4ed8b8e64f56ff16dfc20b0.1792979091.git.zihanx@nebusec.ai>
 <sashiko-outbox-184711@kernel.org>
In-Reply-To: <sashiko-outbox-184711@kernel.org>
From: zihan xi <zihanx@nebusec.ai>
Date: Mon, 26 Oct 2026 18:10:09 +0800
X-Gm-Features: AclHuK9mL9U7eY2u3lf4XfdQUvXs_JXzYKSaspkKJwT8jnFIkLa-JlQEAUVocso
Message-ID: <CAANe3eQrZjWanuiFgNjhsoQb7W5fRm+JVFjnGOtD03Z3aNyTCQ@mail.gmail.com>
Subject: Re: [PATCH 1/1] can: j1939: fix session reference leak on TX timer restart
To: sashiko-reviews@lists.linux.dev
Cc: linux-can@vger.kernel.org, Marc Kleine-Budde <mkl@pengutronix.de>, 
	Oliver Hartkopp <socketcan@hartkopp.net>, Vincent Mailhol <mailhol@kernel.org>, 
	Oleksij Rempel <o.rempel@pengutronix.de>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Mon, Oct 26, 2026 at 4:57=E2=80=AFPM <sashiko-bot@kernel.org> wrote:
>
> Thank you for your contribution! Sashiko AI review found 2 potential issu=
e(s) to consider:
> - [Critical] can: j1939: session refcount underflow in j1939_tp_schedule_=
txtimer()
> - [High] can: j1939: race between j1939_tp_schedule_txtimer() and txtimer=
 cancellation
> --
>
> commit 132d2449245f60a20ddade9b51a9c2efc0a02136
> Author: Zihan Xi <zihanx@nebusec.ai>
>
> can: j1939: fix session reference leak on TX timer restart
>
> This patch adds a spinlock to serialize TX timer rearming in
> j1939_tp_schedule_txtimer() and reuses the existing session reference whe=
n
> restarting an already queued TX timer.
>
> Link: https://bugtracker.nebusec.ai/f/11143
>
> > diff --git a/net/can/j1939/transport.c b/net/can/j1939/transport.c
> > index 8fcfd13e5e6f8..e9af8547c69b4 100644
> > --- a/net/can/j1939/transport.c
> > +++ b/net/can/j1939/transport.c
> > @@ -716,9 +716,17 @@ static int j1939_xtp_tx_abort(struct j1939_priv *p=
riv,
> >
> >  void j1939_tp_schedule_txtimer(struct j1939_session *session, int msec=
)
> >  {
> > -     j1939_session_get(session);
> > +     int ret;
> > +
> > +     spin_lock_bh(&session->txtimer_lock);
> > +     /* Keep the timer's reference when only changing its expiry. */
> > +     ret =3D hrtimer_try_to_cancel(&session->txtimer);
>
> [Severity: High]
> Could temporarily dequeuing session->txtimer here race with callers that
> cancel the timer without holding session->txtimer_lock?
>
> In net/can/j1939/transport.c, neither j1939_session_txtimer_cancel() nor
> j1939_cancel_active_session() acquires session->txtimer_lock:
>
> static void j1939_session_txtimer_cancel(struct j1939_session *session)
> {
>         if (hrtimer_cancel(&session->txtimer))
>                 j1939_session_put(session);
> }
>
> and in j1939_cancel_active_session():
>
>         if (hrtimer_try_to_cancel(&session->txtimer) =3D=3D 1)
>                 j1939_session_put(session);
>
> Previously, j1939_tp_schedule_txtimer() called hrtimer_start() directly o=
n
> an already queued timer, updating its expiry under the hrtimer base lock
> without transitioning hrtimer_active(&session->txtimer) to false.
>
> With this change, when session->txtimer is queued and its callback is not
> running, hrtimer_try_to_cancel(&session->txtimer) dequeues the timer and
> returns 1, making hrtimer_active(&session->txtimer) false until
> hrtimer_start() runs.
>
> If another CPU calls j1939_session_txtimer_cancel() (for example via
> j1939_session_timers_cancel() on session abort or completion, or from
> j1939_xtp_rx_cts_one()) or j1939_cancel_active_session() during that wind=
ow,
> hrtimer_cancel() / hrtimer_try_to_cancel() will see the timer as inactive
> and return 0. j1939_tp_schedule_txtimer() will then call hrtimer_start() =
and
> re-arm session->txtimer on a session whose timers were already cancelled.

The refcount race is valid: the queued-state check is not atomic with
callback completion, expiry, or cancellation. I=E2=80=99ll rework the
timer-reference ownership protocol before resubmitting.
>
> > +     /* A running callback may already have requeued the timer. */
> > +     if (ret !=3D 1 && !hrtimer_is_queued(&session->txtimer))
> > +             j1939_session_get(session);
> >       hrtimer_start(&session->txtimer, ms_to_ktime(msec),
> >                     HRTIMER_MODE_REL_SOFT);
>
> [Severity: Critical]
> What prevents a queued session->txtimer from expiring or being cancelled
> between the lockless hrtimer_is_queued() check and hrtimer_start(), causi=
ng
> a refcount underflow on session->kref?
>
> In kernel/time/hrtimer.c, hrtimer_try_to_cancel() leaves the timer queued
> and returns -1 whenever the timer callback is currently running:
>
>         if (!hrtimer_callback_running(timer)) {
>                 ret =3D remove_hrtimer(timer, base, HRTIMER_STATE_INACTIV=
E);
>                 if (ret)
>                         trace_hrtimer_cancel(timer);
>         }
>
> Consider the following sequence across two CPUs when j1939_tp_txtimer() i=
s
> running on CPU 0 and has already requeued session->txtimer once (holding =
one
> session->kref reference for the running callback and a second reference f=
or
> the queued timer):
>
> 1. CPU 1 calls j1939_tp_schedule_txtimer() and takes session->txtimer_loc=
k.
>    Because j1939_tp_txtimer() is still running on CPU 0,
>    hrtimer_try_to_cancel(&session->txtimer) returns -1 without removing t=
he
>    queued timer.
>
> 2. CPU 1 checks hrtimer_is_queued(&session->txtimer), which observes
>    timer->is_queued =3D=3D 1, so CPU 1 skips j1939_session_get(session) i=
ntending
>    to reuse the queued timer's reference.
>
> 3. Before CPU 1 enters hrtimer_start() and takes the hrtimer base lock, t=
he
>    running j1939_tp_txtimer() callback on CPU 0 finishes (dropping its ow=
n
>    reference via j1939_session_put(session)), and the queued timer either=
:
>    - immediately expires in __hrtimer_run_queues() / __run_hrtimer() (whi=
ch
>      does not take session->txtimer_lock), dequeuing the timer and runnin=
g a
>      second j1939_tp_txtimer() that drops the second session->kref refere=
nce:
>
>         j1939_session_put(session);
>
>         return HRTIMER_NORESTART;
>
>    - or is cancelled by an unlocked j1939_session_txtimer_cancel() or
>      j1939_cancel_active_session() on another CPU, which also dequeues th=
e
>      timer and drops the second session->kref reference.
>
> 4. CPU 1 then executes hrtimer_start(&session->txtimer, ...), which enque=
ues
>    session->txtimer from the inactive state without having taken a new
>    session reference.
>
> When that newly started timer subsequently fires in j1939_tp_txtimer() or=
 is
> cancelled, j1939_session_put(session) will drop a reference that was neve=
r
> taken, underflowing session->kref and freeing struct j1939_session while =
it
> is still in use.

The cancellation race is also valid: cancellation is not serialized
with rearming. I=E2=80=99ll address both races together and re-review the
callback and teardown paths.
>
> --
> Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/cover.1792979091.=
git.zihanx@nebusec.ai?part=3D1
