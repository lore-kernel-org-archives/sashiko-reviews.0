Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.208.182
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1793268331;
	b=oQ31KWoZOh9tZrQpY+Fbvjv70831UfdNfxdHNhOFit0b9R39tgsfAbkox41UxS3NgTJf
	 NTDPq7h5fpMZjsz/FPDVIaWvkAUET5ZgjNCsuiPTOtGQVqqXofiH4vBL3UDeiklk3Bm7n
	 tNB/z13t9j8FwkxC5q2ipcxP7wRpX2GI8d40/jC3XDmkjdTh9R4G0jP+3Wk5/O2fD/1T6
	 KIsUbJ7ESfTZ1/xfCW+gJHHHjGh5vzyJqMxujkM36wR5cTDrM8hG+nOw1nFPLJ0IS6abF
	 uAQabppsH11uCrbsdzgZiyrcZO1HSplNzdQV3CdZ4oNP+Vt9H1YeJrS/p48UTztfcOQ==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793268331;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:MIME-Version:References:
	 In-Reply-To:From:Date:X-Gm-Features:Message-ID:Subject:To:Cc:
	 Content-Type:Content-Transfer-Encoding;
	bh=lUEnBpbmyK1lAnXn3sWR32YdltYe9krCbMJrqDsRXrg=;
	b=wwhIjrTjHBvCkxYqLF+dO4rK/KwYcUuv/pSsvtzxIT+VOnIpKIIOeijrWdYOk96d6JG0
	 jrbwYt1QVSbgZB/OcM7w2clkeRzugV3U0KS6HkMvzfwl6aLaqBPrctSy4NyhG/PWj51qV
	 jG6f4C03kWeI7ucZlACGQ7/lYDhKUnCc4M93hZ+/v0g029s2lDHdWHIA7SPDovQwIvT7A
	 MmBqfbZhTgwBwr+nILjDkHLfsXSUqVQH88FgLvxiqHvUPfro0ZvOaAQI923eUb8oSxU8i
	 2FWJrCdkEbUEvEY3kDLj+eqINEt2iVzzGD05Od/qemFML8UOoMvasW/ToZ/ZuySPeyQ==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=nebusec.ai;
	spf=pass smtp.mailfrom=nebusec.ai;
	dkim=pass header.d=nebusec.ai header.i=@nebusec.ai header.a=rsa-sha256 header.s=google header.b=fiJrM2As;
	arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.208.182
Received: from mail-lj1-f182.google.com (mail-lj1-f182.google.com [209.85.208.182])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4AEEC606A31E
	for <sashiko-reviews@lists.linux.dev>; Thu, 29 Oct 2026 10:05:31 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 4AEEC606A31E
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=nebusec.ai
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=nebusec.ai
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=nebusec.ai header.i=@nebusec.ai header.a=rsa-sha256 header.s=google header.b=fiJrM2As
Received: by mail-lj1-f182.google.com with SMTP id 38308e7fff4ca-3ab07d956f2so16040201fa.0
        for <sashiko-reviews@lists.linux.dev>; Thu, 29 Oct 2026 03:05:31 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1793268329; cv=none;
        d=google.com; s=arc-20260327;
        b=fYMRs1AgEhVhVmA4+ZvhqputG8iync1NjlVFCeC9cl/+BGAlrNEoouBF6VxFDUk4RC
         e30Hro8l+pyZK4tfChV8VJnObJVBnEiQeizfO7knyQ8ygpM583evOTu1lLwLtZ+6MaAf
         +UFP+uK1mvsQbSK5+0Hfnu8lN0sr9xCTJXwO6dH0RV8MbcczVBnKAkKMWP/7lh+6uErN
         vz088hEjvTHPgVRX7lCou69vXCdclgq8pJlxF+SKodHhCOlsAvx7tbPX8KD12syGX3Xi
         OoPMa4ibJJxPuh9g1ki2MNRG1N94Bm3cWwAD0iTIvGlVYkPBg51sUlIze9EP6Y28RBsG
         /FIg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=lUEnBpbmyK1lAnXn3sWR32YdltYe9krCbMJrqDsRXrg=;
        fh=UDmiFjDUsl58/oI1pbxKLXmAuoEiB7qNSJQzd9c7Gr0=;
        b=K52AWXCbD4LETHcZAICtHsONAPJEei9WNGs+Tmn03bX46/M9CpK33aJTP/rGqO5tWX
         4aH0QuwSLj0mL9gf43f5CdKC+q6hfOMeBC6R9QQow1KEMrL03ZegYHi3D+ggnu/Phxbu
         3xOZvFaSu5dZxw7pJSdBtB/hjsQlg6GvAfMMTJprowcn8lnSo9fBLT1In+Gd0S1JLFZI
         hZZjVssSNmjOSVs1fYor7ArKMRP2/TGLCkBxJ9yYOK7vr+QeroIHJVb1vmwT9BKCBpy7
         ijgAvoUEeI6yO11Z2Tw4XfUPjkpISxuhLx9ZGgO1Vl2E3f0l7EMJ1G6zZ3RgO/f/VgS7
         MGmw==;
        darn=lists.linux.dev
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=nebusec.ai; s=google; t=1793268329; x=1793873129; darn=lists.linux.dev;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=lUEnBpbmyK1lAnXn3sWR32YdltYe9krCbMJrqDsRXrg=;
        b=fiJrM2Ass9AMxJQigFSRQvTpY7i5CjGVkjH0OYR2EhU9hu3NZkDSEPiNqI1Aip4jmC
         TdLOJY+33fVZJ0SDfX1MAvh+r0lRXOXVDWw3d904z9XzEpKkr8jZMcEkguwhNSX2rUsB
         HgUQ7CN+6bAFFV0Z6paJe+WJrRh/BurFhBEEXqS2fxGiApTB0R9mjvMDVw26lsKbGe5/
         ENmOaX+ix9Ug4KZczJ8eBAdpwtTGAB0etr1r8ZL3z69Ve9pV+QwVoPwbWu9C5SFr5DAR
         zlVpfGNazinkkLmJpRxuz0fo+IfqdHpGaiA6CrGQ0mmHrj2xqMab1fE8QxLyrT1x4NgI
         HppQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793268329; x=1793873129;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=lUEnBpbmyK1lAnXn3sWR32YdltYe9krCbMJrqDsRXrg=;
        b=dv3jliQB3pquKvzFCwvTwn9zP11uGWec46X8T7UaIIfs6chdab4A2ZvN+YK3v9J+kg
         luYnQk6To2mYwX5tsFiSh7Fa//2exHfqjmdcGaWm6oojlEwX5NkWSXM32nuRCASlDWO4
         p/aL3Oz7c1tKHIxBxWRo25qi3voMKAxoopxunwUm7KfT/fwt9HIoGx+HDgDGIkgCJYW4
         H+f/EX7yYCie34rFE+4tpqu34t2BHJyAeBy8xhUEJvxgUU+wA70tQ49bxP1ZF3X+DM/y
         JoEzqQiJtfPWcRjzZFdXM94mI3+4AiZ7QIBgCffAxeBABvh9/MFc2/f5qfCVuCnbAJ3y
         d6xA==
X-Gm-Message-State: AFq9FYK98/jSfjPCLTJ0f/ZomNI9p7QxxBt7uzGCRDS4BtxdjRbYX8Zh
	/A8b5C4ltZsjwfXcyV3u/W1X5mkMfk2RAhJPGmnVc9s7lc0ooIJXmiOWIAMFLo7ytsUGswt8Jcu
	uM+4pjLhZtWka+37u6Zt4AxbqKLogVukQWrr903xbSqgqtktNd97IE3NwWxC57g==
X-Gm-Gg: AYBFou2pmgMVoV7j4ChZOmehkrZsSOro1+7oOForTJztbo3VckCf9+hytGp+yD2HdBt
	iGZGM3EY3p3CCverkSHdpDgFtkKMeYU40Ykg5e2NkcMN7Keyv54qkUxHUJzun6C1Ys4HJ62rNwr
	6lsQpXbOo6VVbU20Yw+hiwk8Y6N5zsQH3+edwZlevoWMyQRmUYxXbKOlWNB3uij1ZNBjq4VS/MU
	fDyIiRjSU/6fOwwWTsAXr+ZLQtr38Z/xhzz/JAftwOZEITcFP63l/avUgjxaO/5sMSYhaYWczs1
	WhafuqVLTHzVTL6+xwb+Jg7CGbtR0va/IW3yI59BMG7JxsNu2/HZtHkSJI9GoEy81+ON2yFRftu
	QmIeXM0f3dagkeyRlKcMjLz4HRDK2vCECxMdF4BbdikZqLvanj6EQ424iMUeMRlXVbBBI4CTCRE
	9J98NWEoMmY/n0
X-Received: by 2002:a05:651c:1466:b0:3a9:c0d2:2d64 with SMTP id
 38308e7fff4ca-3ac9cf3b945mr13197751fa.11.1793268329112; Thu, 29 Oct 2026
 03:05:29 -0700 (PDT)
X-Mailing-List: sashiko-reviews@lists.linux.dev
List-Id: <sashiko-reviews.lists.linux.dev>
List-Post: <mailto:sashiko-reviews@lists.linux.dev>
List-Help: <mailto:sashiko-reviews+help@lists.linux.dev>
List-Subscribe: <mailto:sashiko-reviews+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:sashiko-reviews+unsubscribe@lists.linux.dev>
List-Owner: <mailto:sashiko-reviews+owner@lists.linux.dev>
Precedence: list
MIME-Version: 1.0
References: <cover.1793259424.git.zihanx@nebusec.ai> <21bf54f2fbab33155e924e0743f17b1e47655255.1793259424.git.zihanx@nebusec.ai>
 <sashiko-outbox-189017@kernel.org>
In-Reply-To: <sashiko-outbox-189017@kernel.org>
From: zihan xi <zihanx@nebusec.ai>
Date: Thu, 29 Oct 2026 18:05:15 +0800
X-Gm-Features: AclHuK9YdqclwE_WskCFAtR7OoZMuVkTIaZYNqXUMGh1GHA-yLCrO8WOO8-2vZA
Message-ID: <CAANe3eQpqdXtGRDVOXqeux0kXcuf3_sLR9mvQCm5CpyD7Q4=Tg@mail.gmail.com>
Subject: Re: [PATCH net v3 1/3] can: j1939: fix session reference leaks on
 timer rearm
To: sashiko-reviews@lists.linux.dev
Cc: linux-can@vger.kernel.org, Marc Kleine-Budde <mkl@pengutronix.de>, 
	Oliver Hartkopp <socketcan@hartkopp.net>, Vincent Mailhol <mailhol@kernel.org>, 
	Oleksij Rempel <o.rempel@pengutronix.de>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Thu, Oct 29, 2026 at 5:17=E2=80=AFPM <sashiko-bot@kernel.org> wrote:
>
> Thank you for your contribution! Sashiko AI review found 5 potential issu=
e(s) to consider:
> - [High] can: j1939: uncancelled rearmed timers on session deactivation
> - [Medium] can: j1939: missing rxtimer_cancelers check in j1939_tp_rxtime=
r()
> - [Medium] can: j1939: spurious RX abort errqueue in j1939_tp_rxtimer()
> - [Medium] can: j1939: unconditional abort report in j1939_xtp_rx_abort_o=
ne()
> - [Medium] can: j1939: race between j1939_xtp_rx_cts_one() and running j1=
939_tp_txtimer()
> --
>
> commit 7eba1ba447e6468d3fbb3a6bd7b54eae6d683f35
> Author: Zihan Xi <zihanx@nebusec.ai>
>
> can: j1939: fix session reference leaks on timer rearm
>
> This patch separates queued timer and running callback references for J19=
39
> session TX and RX hrtimers to avoid leaking session references on timer
> rearming. It also drains terminal timers outside state locks and moves
> next-session timer scheduling outside the socket queue lock.
>
> Link: https://bugtracker.nebusec.ai/f/11143
> Link: https://lore.kernel.org/all/cover.1793012287.git.zihanx@nebusec.ai/
>
> > diff --git a/net/can/j1939/transport.c b/net/can/j1939/transport.c
> > index 8fcfd13e5e6f8..0dd08d1b8f755 100644
> > --- a/net/can/j1939/transport.c
> > +++ b/net/can/j1939/transport.c
> > @@ -301,22 +302,139 @@ void j1939_session_put(struct j1939_session *ses=
sion)
> >       kref_put(&session->kref, __j1939_session_release);
> >  }
> >
> > +static void j1939_session_txtimer_cancel_async(struct j1939_session *s=
ession)
> > +{
> > +     bool put_qref =3D false;
> > +     int ret;
> > +
> > +     spin_lock_bh(&session->txtimer_lock);
> > +     session->txtimer_shutdown =3D true;
> > +     ret =3D hrtimer_try_to_cancel(&session->txtimer);
> > +     if (ret =3D=3D 1) {
> > +             WARN_ON_ONCE(!session->txtimer_qref);
> > +             session->txtimer_qref =3D false;
> > +             put_qref =3D true;
> > +     }
> > +     spin_unlock_bh(&session->txtimer_lock);
> > +
> > +     if (put_qref)
> > +             j1939_session_put(session);
> > +}
>
> [ ... ]
>
> > +/* Cancel a queued RX timer without waiting; caller may be in softirq =
context. */
> >  static void j1939_session_rxtimer_cancel(struct j1939_session *session=
)
> >  {
> > -     if (hrtimer_cancel(&session->rxtimer))
> > +     bool put_qref =3D false;
> > +     int ret;
> > +
> > +     j1939_session_list_lock(session->priv);
> > +     ret =3D hrtimer_try_to_cancel(&session->rxtimer);
> > +     if (ret =3D=3D 1) {
> > +             WARN_ON_ONCE(!session->rxtimer_qref);
> > +             session->rxtimer_qref =3D false;
> > +             put_qref =3D true;
> > +     }
> > +     j1939_session_list_unlock(session->priv);
> > +
> > +     if (put_qref)
> >               j1939_session_put(session);
> >  }
>
> [ ... ]
>
> > @@ -1127,6 +1342,11 @@ static bool j1939_session_deactivate(struct j193=
9_session *session)
> >       active =3D j1939_session_deactivate_locked(session);
> >       j1939_session_list_unlock(priv);
> >
> > +     if (active) {
> > +             j1939_session_txtimer_cancel_async(session);
> > +             j1939_session_rxtimer_cancel(session);
> > +     }
> > +
> >       return active;
> >  }
>
> [ ... ]
>
> > @@ -1226,13 +1472,37 @@ static enum hrtimer_restart j1939_tp_txtimer(st=
ruct hrtimer *hrtimer)
> >               if (session->skcb.addr.type !=3D J1939_SIMPLE) {
> >                       j1939_session_cancel(session, J1939_XTP_ABORT_OTH=
ER);
> >               } else {
> > -                     session->err =3D ret;
> > +                     j1939_session_list_lock(priv);
> > +                     if (session->state >=3D J1939_SESSION_ACTIVE &&
> > +                         session->state < J1939_SESSION_ACTIVE_MAX)
> > +                             session->err =3D ret;
> > +                     j1939_session_list_unlock(priv);
> >                       j1939_session_rxtimer_cancel(session);
> >                       j1939_session_deactivate_activate_next(session);
> >               }
> >       }
> >
> > -     j1939_session_put(session);
> > +txtimer_done:
> > +     spin_lock_bh(&session->txtimer_lock);
> > +     WARN_ON_ONCE(!session->txtimer_cb_running ||
> > +                  !session->txtimer_cbref);
> > +     session->txtimer_cb_running =3D false;
> > +     if (txtimer_delay && !session->txtimer_shutdown &&
> > +         !session->txtimer_qref) {
> > +             /* Transfer the callback pin to its rearmed timer. */
> > +             session->txtimer_cbref =3D false;
> > +             session->txtimer_qref =3D true;
> > +             hrtimer_start(&session->txtimer, ms_to_ktime(txtimer_dela=
y),
> > +                           HRTIMER_MODE_REL_SOFT);
> > +     } else {
> > +             /* An external qref, if present, owns the next firing. */
> > +             session->txtimer_cbref =3D false;
> > +             put_cbref =3D true;
> > +     }
> > +     spin_unlock_bh(&session->txtimer_lock);
> > +
> > +     if (put_cbref)
> > +             j1939_session_put(session);
> >
> >       return HRTIMER_NORESTART;
> >  }
> > @@ -1257,8 +1527,25 @@ static enum hrtimer_restart j1939_tp_rxtimer(str=
uct hrtimer *hrtimer)
> >                                                    struct j1939_session=
,
> >                                                    rxtimer);
> >       struct j1939_priv *priv =3D session->priv;
> > +     enum j1939_session_state state;
> > +     bool active;
> > +
> > +     j1939_session_list_lock(priv);
> > +     if (!session->rxtimer_cbref) {
> > +             WARN_ON_ONCE(session->rxtimer_cb_running);
> > +             WARN_ON_ONCE(!session->rxtimer_qref);
> > +             session->rxtimer_qref =3D false;
> > +             session->rxtimer_cbref =3D true;
> > +     }
> > +     session->rxtimer_cb_running =3D true;
> > +     state =3D session->state;
> > +     active =3D state >=3D J1939_SESSION_ACTIVE &&
> > +             state < J1939_SESSION_ACTIVE_MAX;
> > +     j1939_session_list_unlock(priv);
> >
> > -     if (session->state =3D=3D J1939_SESSION_WAITING_ABORT) {
> > +     if (!active) {
> > +             /* A terminal path won before this callback started its w=
ork. */
> > +     } else if (state =3D=3D J1939_SESSION_WAITING_ABORT) {
> >               netdev_alert(priv->ndev, "%s: 0x%p: abort rx timeout. For=
ce session deactivation\n",
> >                            __func__, session);
> >
> > @@ -1271,18 +1558,24 @@ static enum hrtimer_restart j1939_tp_rxtimer(st=
ruct hrtimer *hrtimer)
> >               /* The message is probably stuck in the CAN controller an=
d can
> >                * be send as soon as CAN bus is in working state again.
> >                */
> > -             session->err =3D -ETIME;
> > -             j1939_session_deactivate(session);
> > +             j1939_session_list_lock(priv);
> > +             if (session->state >=3D J1939_SESSION_ACTIVE &&
> > +                 session->state < J1939_SESSION_ACTIVE_MAX) {
> > +                     session->err =3D -ETIME;
> > +                     j1939_session_deactivate_locked(session);
> > +             }
> > +             j1939_session_list_unlock(priv);
> > +             j1939_session_txtimer_cancel_async(session);
> > +             j1939_session_rxtimer_cancel(session);
>
> [Severity: High]
> Can a rearmed timer remain queued holding session->rxtimer_qref or
> session->txtimer_qref after the session is deactivated?

Partly agreed. A running callback can leave a queued timer reference when
hrtimer_try_to_cancel() returns -1; the current callback should later
observe shutdown/inactive state and release it, so this shows delayed
resource release rather than a proven permanent leak. I will address the
terminal cleanup race in the next revision.

>
> In kernel/time/hrtimer.c:hrtimer_try_to_cancel():
>
>         if (!hrtimer_callback_running(timer)) {
>                 ret =3D remove_hrtimer(timer, base, HRTIMER_STATE_INACTIV=
E);
>                 if (ret)
>                         trace_hrtimer_cancel(timer);
>         }
>
> whenever the callback is currently executing (base->running =3D=3D timer)=
,
> hrtimer_try_to_cancel() returns -1 without removing the timer from the
> hrtimer queue, even if the timer was concurrently rearmed with
> hrtimer_start().
>
> When j1939_session_deactivate() (or the J1939_SIMPLE branch in
> j1939_tp_rxtimer()) deactivates a session, j1939_session_deactivate_locke=
d()
> removes the session from priv->active_session_list and sets session->stat=
e
> to J1939_SESSION_DONE, and then calls j1939_session_txtimer_cancel_async(=
)
> and j1939_session_rxtimer_cancel().
>
> If a timer was rearmed while its callback was running:
>
> 1. In j1939_tp_rxtimer(), the J1939_SESSION_WAITING_ABORT and J1939_SIMPL=
E
>    branches call j1939_session_rxtimer_cancel() from inside
>    j1939_tp_rxtimer() itself. Since hrtimer_callback_running() is true,
>    hrtimer_try_to_cancel(&session->rxtimer) always returns -1. If a
>    concurrent j1939_tp_set_rxtimeout() rearmed session->rxtimer before
>    session->state became J1939_SESSION_DONE, the epilogue of
>    j1939_tp_rxtimer() only drops session->rxtimer_cbref and leaves
>    session->rxtimer queued with session->rxtimer_qref =3D true.
>
> 2. In the active XTP branch of j1939_tp_rxtimer(), the callback rearms
>    session->rxtimer for J1939_XTP_ABORT_TIMEOUT_MS (setting
>    session->rxtimer_qref =3D true) and drops active_session_list_lock. If=
 a
>    concurrent j1939_tp_txtimer() error path calls
>    j1939_session_rxtimer_cancel() and j1939_session_deactivate_activate_n=
ext()
>    before j1939_tp_rxtimer() finishes executing in __run_hrtimer(),
>    hrtimer_try_to_cancel(&session->rxtimer) returns -1 and leaves the abo=
rt
>    timeout queued.
>
> 3. Similarly, if a concurrent j1939_tp_schedule_txtimer() rearms
>    session->txtimer while j1939_tp_txtimer() is running (setting
>    session->txtimer_qref =3D true) and j1939_session_txtimer_cancel_async=
()
>    runs before j1939_tp_txtimer() exits, hrtimer_try_to_cancel() returns =
-1.
>    At txtimer_done, session->txtimer_shutdown is true, so it takes the el=
se
>    branch and only drops session->txtimer_cbref, leaving session->txtimer
>    queued with session->txtimer_qref =3D true.
>
> Because the session has already been removed from priv->active_session_li=
st,
> j1939_cancel_active_session() during socket close or netdev teardown will=
 no
> longer find the session to synchronously drain the remaining queued timer=
,
> delaying j1939_session_destroy() until the timer expires.
>
> >       } else {
> >               j1939_session_list_lock(session->priv);
> > -             if (session->state >=3D J1939_SESSION_ACTIVE &&
> > +             if (!session->rxtimer_cancelers &&
> > +                 session->state >=3D J1939_SESSION_ACTIVE &&
> >                   session->state < J1939_SESSION_ACTIVE_MAX) {
> >                       netdev_alert(priv->ndev, "%s: 0x%p: rx timeout, s=
end abort\n",
> >                                    __func__, session);
> > -                     j1939_session_get(session);
> > -                     hrtimer_start(&session->rxtimer,
> > -                                   ms_to_ktime(J1939_XTP_ABORT_TIMEOUT=
_MS),
> > -                                   HRTIMER_MODE_REL_SOFT);
> > +                     j1939_tp_set_rxtimeout_locked(session,
> > +                                                   J1939_XTP_ABORT_TIM=
EOUT_MS);
> >                       __j1939_session_cancel(session, J1939_XTP_ABORT_T=
IMEOUT);
> >               }
> >               j1939_session_list_unlock(session->priv);
>
> [Severity: Medium]
> Should the state =3D=3D J1939_SESSION_WAITING_ABORT and
> session->skcb.addr.type =3D=3D J1939_SIMPLE branches in j1939_tp_rxtimer(=
) also
> check session->rxtimer_cancelers?

Agreed. The temporary-drain gate must cover the SIMPLE and WAITING_ABORT
branches as well as the general XTP branch. I will make the timeout action
conditional on the state and drain status under the appropriate lock.
>
> Callers such as j1939_simple_recv() and j1939_xtp_rx_abort_one() drain
> timers via j1939_session_timers_cancel(session) before updating session->=
err
> or deactivating the session:
>
> j1939_simple_recv()
>   j1939_session_timers_cancel(session)
>     j1939_session_rxtimer_cancel_sync(session, true)
>       session->rxtimer_cancelers++;
>       j1939_session_list_unlock(session->priv);
>       hrtimer_cancel(timer);
>   j1939_session_deactivate(session);
>
> Because j1939_tp_rxtimer() only checks !session->rxtimer_cancelers in the
> final else branch, a concurrent j1939_tp_rxtimer() running while
> j1939_simple_recv() is waiting in hrtimer_cancel() will enter the
> J1939_SIMPLE branch, set session->err =3D -ETIME, and deactivate the sess=
ion,
> reporting a timeout error for a simple message that was already received.
> Likewise, in the J1939_SESSION_WAITING_ABORT branch, j1939_tp_rxtimer() w=
ill
> deactivate the session while j1939_xtp_rx_abort_one() is waiting in
> j1939_session_timers_cancel(), preventing j1939_xtp_rx_abort_one() from
> recording the abort error code in session->err.
>
> >
> >               if (!session->sk)
> >                       j1939_sk_errqueue(session, J1939_ERRQUEUE_RX_ABOR=
T);
> >       }
>
> [Severity: Medium]
> If j1939_tp_rxtimer() skips __j1939_session_cancel() in the else branch
> because session->rxtimer_cancelers is non-zero or session->state is no
> longer active, won't this still unconditionally call
> j1939_sk_errqueue(session, J1939_ERRQUEUE_RX_ABORT) when !session->sk?

Agreed. The RX_ABORT errqueue notification must only be sent when the
callback actually wins and performs the abort transition. I will gate it
accordingly.
>
> For example, when an incoming broadcast BAM session completes in
> j1939_xtp_rx_dat_one() and calls j1939_session_timers_cancel(session),
> session->rxtimer_cancelers is incremented while hrtimer_cancel() waits fo=
r a
> concurrently running j1939_tp_rxtimer(). j1939_tp_rxtimer() sees
> session->rxtimer_cancelers !=3D 0 and skips __j1939_session_cancel(), but
> after unlocking it still queues a spurious J1939_ERRQUEUE_RX_ABORT with
> session->err =3D=3D 0 to subscribed sockets.
>
> [ ... ]
>
> > @@ -1372,7 +1672,11 @@ static void j1939_xtp_rx_abort_one(struct j1939_=
priv *priv, struct sk_buff *skb,
> >                   j1939_xtp_abort_to_str(abort));
> >
> >       j1939_session_timers_cancel(session);
> > -     session->err =3D j1939_xtp_abort_to_errno(priv, abort);
> > +     j1939_session_list_lock(priv);
> > +     if (session->state >=3D J1939_SESSION_ACTIVE &&
> > +         session->state < J1939_SESSION_ACTIVE_MAX)
> > +             session->err =3D j1939_xtp_abort_to_errno(priv, abort);
> > +     j1939_session_list_unlock(priv);
> >       if (session->sk)
> >               j1939_sk_send_loop_abort(session->sk, session->err);
> >       else
> >               j1939_sk_errqueue(session, J1939_ERRQUEUE_RX_ABORT);
> >       j1939_session_deactivate_activate_next(session);
>
> [Severity: Medium]
> In j1939_xtp_rx_abort_one(), if the session transitions to
> J1939_SESSION_DONE while j1939_session_timers_cancel(session) is waiting
> outside active_session_list_lock, session->err is not updated, but
> j1939_sk_send_loop_abort() or j1939_sk_errqueue() is still called
> unconditionally afterwards.

Agreed. The incoming-ABORT path must report only if it wins the terminal
state transition; otherwise it can send a stale or duplicate error
notification. I will add winner-based reporting.
>
> Should reporting the abort also be skipped when the session was already
> deactivated?
>
> > @@ -1486,7 +1790,6 @@ j1939_xtp_rx_cts_one(struct j1939_session *sessio=
n, struct sk_buff *skb)
> >                       if (session->pkt.tx_acked)
> >                               j1939_sk_errqueue(session,
> >                                                 J1939_ERRQUEUE_TX_SCHED=
);
> > -                     j1939_session_txtimer_cancel(session);
> >                       j1939_tp_schedule_txtimer(session, 0);
> >               }
> >       } else {
>
> [Severity: Medium]
> Is it safe to remove j1939_session_txtimer_cancel(session) from
> j1939_xtp_rx_cts_one() when j1939_tp_txtimer() may already be running on
> another CPU?

Agreed. The CTS handler and TX callback access the same packet-window
state, and the timer lock does not serialize those accesses. I will add a
safe synchronization scheme without waiting under a lock needed by the
callback.
>
> Previously, j1939_xtp_rx_cts_one() called hrtimer_cancel(&session->txtime=
r)
> before calling j1939_tp_schedule_txtimer(session, 0), waiting for any
> in-flight j1939_tp_txtimer() callback to finish.
>
> Without that wait, if j1939_tp_txtimer() is dispatched on CPU 0 (for
> instance, from a packet-delay or -ENOBUFS retry timer) while
> j1939_xtp_rx_cts_one() runs on CPU 1:
>
> CPU 1 (j1939_xtp_rx_cts_one)
>   updates session->pkt.tx_acked, session->pkt.last, session->pkt.tx
>   session->last_cmd =3D dat[0];
>   j1939_tp_schedule_txtimer(session, 0)
>     hrtimer_try_to_cancel(&session->txtimer) -> returns -1
>     session->txtimer_qref =3D true;
>     hrtimer_start(&session->txtimer, 0, ...);
>
> CPU 0 (j1939_tp_txtimer)
>   j1939_xtp_txnext_transmiter(session, &txtimer_delay)
>     j1939_session_tx_dat(session, &txtimer_delay)
>
> CPU 0 then transmits using the CTS state just written by CPU 1. At
> txtimer_done on CPU 0:
>
>         if (txtimer_delay && !session->txtimer_shutdown &&
>             !session->txtimer_qref) {
>                 ...
>         } else {
>                 /* An external qref, if present, owns the next firing. */
>                 session->txtimer_cbref =3D false;
>                 put_cbref =3D true;
>         }
>
> Because session->txtimer_qref is already true from CPU 1, CPU 0 either dr=
ops
> its computed txtimer_delay (losing j1939_tp_packet_delay or the -ENOBUFS
> retry backoff in favor of the 0ms timer) or, if CPU 0 already transmitted
> all packets up to session->pkt.total, leaves the 0ms timer queued so the
> next j1939_tp_txtimer() firing sees session->pkt.tx =3D=3D session->pkt.t=
otal,
> fails j1939_session_skb_get_by_offset() with NULL, and triggers -ENOBUFS
> retries.
>
> --
> Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/cover.1793259424.=
git.zihanx@nebusec.ai?part=3D1
