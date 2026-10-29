Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.208.173
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1793268170;
	b=akrbcIdbI0TEa7a5Jv12TkZFagd0AIltUyE53iavGCf5ZIxwnpJJbhxZGsiQESCcovzY
	 fdL2Z5gOVpSpxmwJaJ4aXeSt+9CS0/6suvsWgCkNCicR1pygDuyUT3FQRQuzHJOFO9A0X
	 IM18SwkqLJeqLo1MhVBoRkd9bMK+UmCNyxtDiUZ2lHBlIZJ7/251WKw+7NQs8rkXHc3l/
	 W7hC0K2nHqM3HyfkToTg7AdS2xF3MtdwiJYgzEf9D1JNMDjCNwcjrvJwX8FYErAmdjVo3
	 ggffdQdf4BMpkFRxsh8dctoHK08vw23Hx2gGVZIqwfFlOmbm4qzzTEJRQyyz5nkGOeg==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793268170;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:MIME-Version:References:
	 In-Reply-To:From:Date:X-Gm-Features:Message-ID:Subject:To:Cc:
	 Content-Type:Content-Transfer-Encoding;
	bh=6iQa+csK5IjT3mexfwqthY2wIT9oXO6qpsqrgSw5lko=;
	b=lNVrFLm/t3ucxqoYh4NCiTwq/Q2zj9Bkq2KZTbAojAHCVGFwsae0oZa+62WErm9ChlbK
	 JfuWbKlx7pAjHwYwZNP0FuzVxuizRcCk9P+TezbYdWkkRbHpXNcIWLozE+w0U1qBJ7Llz
	 AcCqVYufDnYDUrGYhN3MJ8NUvzKvhGeJdEuHy0GeU90Mz0PqrdxlitpnTe/qwe5jTfeft
	 TW9WV8uPYR3q7ZTRlH900FeasBW3Sl7o/nPd8j7ssxUZ1EdlLp6r5Hps92PXeqDQu2uXE
	 iZnANwxKbMiSf7LQG2lFNNftrqNf5Fl2appkD1eqXZCjIs7pc+1vYtLCoY0Hu2x5j0g==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=nebusec.ai;
	spf=pass smtp.mailfrom=nebusec.ai;
	dkim=pass header.d=nebusec.ai header.i=@nebusec.ai header.a=rsa-sha256 header.s=google header.b=VNl4jdiC;
	arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.208.173
Received: from mail-lj1-f173.google.com (mail-lj1-f173.google.com [209.85.208.173])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 59C88606A31A
	for <sashiko-reviews@lists.linux.dev>; Thu, 29 Oct 2026 10:02:49 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 59C88606A31A
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=nebusec.ai
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=nebusec.ai
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=nebusec.ai header.i=@nebusec.ai header.a=rsa-sha256 header.s=google header.b=VNl4jdiC
Received: by mail-lj1-f173.google.com with SMTP id 38308e7fff4ca-3a75f960be3so18580881fa.2
        for <sashiko-reviews@lists.linux.dev>; Thu, 29 Oct 2026 03:02:49 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1793268167; cv=none;
        d=google.com; s=arc-20260327;
        b=YkuinJde3g9Z/eUGnRCCn9me9AUfj7t3Gz1lM3/pf3pRhiXEex/D/hpmdiE53gLhGQ
         amYlm/vEfYAHhMuXqjzRsxOtIC6SLZtTO5wuLcqnE7AkTb4O+QnPf8vt+L9mhVhw/ir5
         p0HbyyMWe2lNIx5o40/ibgsZzP4vDWIEz+EA9Qpnc0qpGuxnX6w7uQg5jo+fQh/sekjg
         S9YRexbzUwhj6DaRfm9LWJxeO3hFbEUXQtFQMaqV3wttGXEYRWaCKBk9uaBQCqI229ZR
         vhBAkjU2kjNN5klaeZmfgyTVE2XcDWy7hCB8q0AZw8AEq2xjHJ8JO3gNw2sKwpK7Ui1d
         QXZA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=6iQa+csK5IjT3mexfwqthY2wIT9oXO6qpsqrgSw5lko=;
        fh=UDmiFjDUsl58/oI1pbxKLXmAuoEiB7qNSJQzd9c7Gr0=;
        b=cBoCWljTUq6N8F0ZQKTXwETiwo7JXAhsWGEBDQWakT/89OnNlQziaZWNf58x0kDroV
         SqyrRoFPj0b1ZWqlOC/RRbfApG2B7ROwzh5by1EiQ/TR47gGHLVjh7o2O5aPOEt2XNII
         LkSj3oWpH0g5+yxCOFbzhNBcoXW14DvoyojWEND8taYXcFjhYrKL6g1awkxMVPiTdoxi
         BX5dG6pf/H9OB0c8sD0yXx9rCWFfe/CZROOmO2UtJBJDJbRhjEfDgdaEN4sq9SwN6j/H
         5MIh8tBv5Z7vjIJimQ8n9Ps22dkvm/XTfdKUXy7qJI5QT8LNZkh560jUX6RbyKC16ufb
         V7zA==;
        darn=lists.linux.dev
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=nebusec.ai; s=google; t=1793268167; x=1793872967; darn=lists.linux.dev;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=6iQa+csK5IjT3mexfwqthY2wIT9oXO6qpsqrgSw5lko=;
        b=VNl4jdiCsB71o5Y10hQuL3ImT7yRFd++sfglRyGkqP99kAPmvAgpXpjyWibHpIuAX+
         CH3Ofk6OB6P3Ia9on3YQa3AcuPBvg6WUPMaZlDjhvMciUH35hPxCfKVMcUeQMgKpJ9QP
         bCWQvrAJPNn36qwMu0llNqGAYnNXkdXnnUl1hnNo0sjbROGqHzm2Y1oGg5pliMcxeZwk
         HU3zx57ccovf4a7DP+ytVDAYXdl2sT2umMh0rcQ2MMw5aHEzZqcRAa+P0lsiRA2djarf
         z+66JrYyB3VRkO7zf4ThJK1Hr/iydTE93JOurDyzyfXTCbXGkrlgtf86Vm/8QeZ0CVSz
         448w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793268167; x=1793872967;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=6iQa+csK5IjT3mexfwqthY2wIT9oXO6qpsqrgSw5lko=;
        b=cD6ne5odWXaIn84Ce6g31IDUPGgawHdlCltSxk8q+0s+Ct5EBxm79VQEXHae8puF+n
         sFN4fdtlZ5gUnVlMUo796RKQMqX3Jpz0opftf1BBwl0udLmWrb38jOoP491GvblxRa4+
         gi1T30B6i+61eQGugqqIbNUBR7lPaaLAOSMeCXFjxZ6fLxL0RsnSjaEE6OWF1e3iIU2A
         wSu+4xdF1/48dZBeZ4it3NQLsmvPhjaVfek/qRzFj3iuOgPZcmUQ1JJlG22aDvqepUQP
         Ph8WnJvTJxS/YYbGR+85Gu2g66u7NYYz4+2XbGvw18WQCRFt+xYWfdKZCPI7aza6OU6U
         EOXA==
X-Gm-Message-State: AFq9FYKIUUwJPcM/txKR8GC6DAL2b0F9/o8P3irxCSbBBXzVCjzITfzl
	qn2MgxFTZZkW+UFXIlaS22qufkG8zeVknPOcPvL/AtMjD+3G+9sxSfs+1FPkxFBgPpZHbUVYWzw
	UQfWmanm1PvjM0k6k0svAxdx7DiIoAm7A56QCmaTSqBl18DvFB75wb84Mh9XZaw==
X-Gm-Gg: AYBFou0u26QILSP9vZla5CbRl5MRx8B1zXXKCaG2oyXUw/Ij6eakGX9sgQ9/4K00OdU
	2YqoSRPv6XDLeRcDJAvsv3qXMMLz+H0SFnStR0aLNFDXCzCVBY5YHygKzwyITbQDqAZnmQUW18d
	VMjd6Dqwt7aWbfxbQxGk5DT5/U9rwroVeGlOS9u4UAV4BnF4ClLfs7P4gxkwJVn/CKE288XgIGA
	lDyiOUQDfsTzbl9zUh1bk7VmfYNFOTg+430cyASa3/KKqCayl7WS7r53w6HhbUXUDj2OrzCI590
	8OZedBb2yDqCaNCJ0T+BVQOxhv0l6NOgrYFhRCD4d5AwnxF4Bbq44JtI7fGfuaULel8wQUh05Y9
	FQE63ppMQggA09Fr6+0ra41T4/MLtuVnurzIYSco/C1ntwBsOjOFX29HPnWieZMrBDawO
X-Received: by 2002:a2e:b8ca:0:b0:3ab:48e6:6783 with SMTP id
 38308e7fff4ca-3ac9ce3b947mr11587791fa.2.1793268167152; Thu, 29 Oct 2026
 03:02:47 -0700 (PDT)
X-Mailing-List: sashiko-reviews@lists.linux.dev
List-Id: <sashiko-reviews.lists.linux.dev>
List-Post: <mailto:sashiko-reviews@lists.linux.dev>
List-Help: <mailto:sashiko-reviews+help@lists.linux.dev>
List-Subscribe: <mailto:sashiko-reviews+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:sashiko-reviews+unsubscribe@lists.linux.dev>
List-Owner: <mailto:sashiko-reviews+owner@lists.linux.dev>
Precedence: list
MIME-Version: 1.0
References: <cover.1793259424.git.zihanx@nebusec.ai> <a683b6afb2c21e0d05be0ebe18c4f60b98152d25.1793259424.git.zihanx@nebusec.ai>
 <sashiko-outbox-189012@kernel.org>
In-Reply-To: <sashiko-outbox-189012@kernel.org>
From: zihan xi <zihanx@nebusec.ai>
Date: Thu, 29 Oct 2026 18:02:33 +0800
X-Gm-Features: AclHuK-EkVpjHr16G0lR9YcS6ivNboOau7EQX62qEElvvaaKkBsqoi7q1Ii34po
Message-ID: <CAANe3eSNKGcFtetJurYR=YjUmuR-paWif4FXQpTMwnKMv_4aCg@mail.gmail.com>
Subject: Re: [PATCH net v3 2/3] can: j1939: stop TX sends after session shutdown
To: sashiko-reviews@lists.linux.dev
Cc: linux-can@vger.kernel.org, Marc Kleine-Budde <mkl@pengutronix.de>, 
	Oliver Hartkopp <socketcan@hartkopp.net>, Vincent Mailhol <mailhol@kernel.org>, 
	Oleksij Rempel <o.rempel@pengutronix.de>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Thu, Oct 29, 2026 at 5:15=E2=80=AFPM <sashiko-bot@kernel.org> wrote:
>
> Thank you for your contribution! Sashiko AI review found 5 potential issu=
e(s) to consider:
> - [High] can: j1939: timer callbacks still cancel session after tx_send_s=
hutdown
> - [High] can: j1939: unconditional error notifications outside session st=
ate guards
> - [High] can: j1939: session leak on sk_session_queue when simple TX race=
s rxtimer
> - [Medium] can: j1939: TX sends not shut down before draining timers on c=
ompletion
> - [Medium] can: j1939: spurious netdev_alert() in j1939_session_tx_dat() =
on -ESHUTDOWN
> --
>
> commit 2c11cd00299ff52c942a6b68d469115b501da6d9
> Author: Zihan Xi <zihanx@nebusec.ai>
>
> can: j1939: stop TX sends after session shutdown
>
> This commit introduces a per-session tx_send_lock and tx_send_shutdown ga=
te to
> serialize session data and control frame transmissions against session
> deactivation and incoming XTP ABORT handling. It also suppresses sending =
an
> outbound XTP ABORT frame when tx_send_shutdown has been set.
>
> Link: https://bugtracker.nebusec.ai/f/11143
> Link: https://lore.kernel.org/all/cover.1793012287.git.zihanx@nebusec.ai/
>
> > diff --git a/net/can/j1939/transport.c b/net/can/j1939/transport.c
> > index 0dd08d1b8f755..570e2b8d08263 100644
> > --- a/net/can/j1939/transport.c
> > +++ b/net/can/j1939/transport.c
>
> [ ... ]
>
> > @@ -1363,12 +1398,14 @@ static void __j1939_session_cancel(struct j1939=
_session *session,
> >       struct j1939_priv *priv =3D session->priv;
> >
> >       WARN_ON_ONCE(!err);
> > +     lockdep_assert_held(&session->tx_send_lock);
> >       lockdep_assert_held(&session->priv->active_session_list_lock);
> >
> >       session->err =3D j1939_xtp_abort_to_errno(priv, err);
> >       session->state =3D J1939_SESSION_WAITING_ABORT;
> >       /* do not send aborts on incoming broadcasts */
> > -     if (!j1939_cb_is_broadcast(&session->skcb)) {
> > +     if (!session->tx_send_shutdown &&
> > +         !j1939_cb_is_broadcast(&session->skcb)) {
> >               j1939_xtp_tx_abort(priv, &session->skcb,
> >                                  !session->transmission,
> >                                  err, session->skcb.addr.pgn);
> > @@ -1381,6 +1418,7 @@ static void __j1939_session_cancel(struct j1939_s=
ession *session,
> >  static void j1939_session_cancel(struct j1939_session *session,
> >                                enum j1939_xtp_abort err)
> >  {
> > +     spin_lock_bh(&session->tx_send_lock);
> >       j1939_session_list_lock(session->priv);
> >
> >       if (session->state >=3D J1939_SESSION_ACTIVE &&
> > @@ -1391,6 +1429,7 @@ static void j1939_session_cancel(struct j1939_ses=
sion *session,
> >       }
> >
> >       j1939_session_list_unlock(session->priv);
> > +     spin_unlock_bh(&session->tx_send_lock);
> >
> >       if (!session->sk)
> >               j1939_sk_errqueue(session, J1939_ERRQUEUE_RX_ABORT);
>
> [Severity: High]
> When j1939_xtp_rx_abort_one() processes an incoming XTP ABORT frame, it c=
alls
> j1939_session_tx_send_shutdown(session) and then drains both timers via
> j1939_session_timers_cancel(session) while session->state is still
> J1939_SESSION_ACTIVE:
>
> net/can/j1939/transport.c:j1939_xtp_rx_abort_one() {
>         ...
>         j1939_session_tx_send_shutdown(session);
>         j1939_session_timers_cancel(session);
>         j1939_session_list_lock(priv);
>         if (session->state >=3D J1939_SESSION_ACTIVE &&
>             session->state < J1939_SESSION_ACTIVE_MAX)
>                 session->err =3D j1939_xtp_abort_to_errno(priv, abort);
>         j1939_session_list_unlock(priv);
>         if (session->sk)
>                 j1939_sk_send_loop_abort(session->sk, session->err);
>         else
>                 j1939_sk_errqueue(session, J1939_ERRQUEUE_RX_ABORT);
>         j1939_session_deactivate_activate_next(session);
> }
>
> While j1939_session_timers_cancel() is waiting for txtimer in
> j1939_session_txtimer_cancel() (before j1939_session_rxtimer_cancel_sync(=
)
> increments session->rxtimer_cancelers), a concurrent j1939_tp_txtimer()
> callback that fails prior to j1939_session_tx_send() (for instance with
> -EOVERFLOW in j1939_session_tx_dat(), -ENOENT in j1939_session_tx_cts() o=
r
> j1939_session_tx_eoma(), or -ENOMEM in j1939_tp_tx_dat_new()) can call
> j1939_session_cancel(), or a concurrent j1939_tp_rxtimer() callback can e=
nter
> its non-simple timeout branch.
>
> Because !session->tx_send_shutdown is only checked around j1939_xtp_tx_ab=
ort()
> inside __j1939_session_cancel() rather than gating the cancellation block=
 in
> j1939_session_cancel() and j1939_tp_rxtimer(), won't the timer callback s=
till:
>
> 1. rearm session->rxtimer for J1939_XTP_ABORT_TIMEOUT_MS via
>    j1939_tp_set_rxtimeout_locked() (or record session->rxtimer_pending =
=3D true
>    if rxtimer_cancelers is non-zero),
> 2. overwrite session->err with the local timer error and transition
>    session->state to J1939_SESSION_WAITING_ABORT, and
> 3. immediately call j1939_sk_send_loop_abort(session->sk, session->err),
>    waking session->sk with the wrong sk_err before j1939_xtp_rx_abort_one=
()
>    sets session->err from the received ABORT frame and notifies the socke=
t a
>    second time?
>
> Should j1939_session_cancel() and the timeout branch in j1939_tp_rxtimer(=
)
> check !session->tx_send_shutdown before rearming rxtimer and calling
> __j1939_session_cancel()?
>

Agreed. The shutdown gate currently prevents sends, but does not prevent
timer callbacks from changing session state, rearming the RX timer, or
reporting errors. I will serialize these terminal side effects in the next
revision.

> [ ... ]
>
> > @@ -1460,6 +1498,9 @@ static enum hrtimer_restart j1939_tp_txtimer(stru=
ct hrtimer *hrtimer)
> >                * propagation of the error to user space.
> >                */
> >               break;
> > +     case -ESHUTDOWN:
> > +             /* A terminal path won before this packet could be sent. =
*/
> > +             break;
> >       case -EOVERFLOW:
> >               j1939_session_cancel(session, J1939_XTP_ABORT_ECTS_TOO_BI=
G);
> >               break;
>
> [Severity: Medium]
> Here j1939_tp_txtimer() treats -ESHUTDOWN as an expected race with sessio=
n
> shutdown, but in j1939_tp_txtimer() -> j1939_xtp_txnext_transmiter() ->
> j1939_session_tx_dat(), a -ESHUTDOWN return from j1939_tp_tx_dat() still =
hits
> the error log check:
>
> net/can/j1939/transport.c:j1939_session_tx_dat() {
>         ...
>                 ret =3D j1939_tp_tx_dat(session, dat, len + 1);
>                 if (ret < 0) {
>                         /* ENOBUFS =3D=3D CAN interface TX queue is full =
*/
>                         if (ret !=3D -ENOBUFS)
>                                 netdev_alert(priv->ndev,
>                                              "%s: 0x%p: queue data error:=
 %i\n",
>                                              __func__, session, ret);
>                         break;
>                 }
> }
>
> Will a session shutdown racing with j1939_session_tx_dat() emit a spuriou=
s
> netdev_alert() with -ESHUTDOWN (and still call j1939_tp_set_rxtimeout() i=
f
> pkt_done > 0 from earlier packets in the loop)?

Agreed. -ESHUTDOWN is an expected result when terminal shutdown wins. I
will suppress that alert and avoid rearming the RX timeout after this
shutdown result, including when earlier packets were sent in the loop.
>
> > @@ -1558,6 +1599,7 @@ static enum hrtimer_restart j1939_tp_rxtimer(stru=
ct hrtimer *hrtimer)
> >               /* The message is probably stuck in the CAN controller an=
d can
> >                * be send as soon as CAN bus is in working state again.
> >                */
> > +             spin_lock_bh(&session->tx_send_lock);
> >               j1939_session_list_lock(priv);
> >               if (session->state >=3D J1939_SESSION_ACTIVE &&
> >                   session->state < J1939_SESSION_ACTIVE_MAX) {
> >                       session->err =3D -ETIME;
> >                       j1939_session_deactivate_locked(session);
> >               }
> >               j1939_session_list_unlock(priv);
> > +             spin_unlock_bh(&session->tx_send_lock);
> >               j1939_session_txtimer_cancel_async(session);
> >               j1939_session_rxtimer_cancel(session);
>
> [Severity: High]
> Can this J1939_SIMPLE timeout path in j1939_tp_rxtimer() leak the session=
 on
> jsk->sk_session_queue and hang socket close when it races with
> j1939_simple_txnext()?

Agreed. If the SIMPLE timeout deactivates the session before the send path
advances the socket queue, the queued session can remain pending. I will
ensure the winning terminal path advances or removes it exactly once.

>
> In j1939_tp_txtimer() -> j1939_simple_txnext(), rxtimer is armed before
> j1939_session_tx_send() is called, and j1939_sk_queue_activate_next(sessi=
on)
> is only called if j1939_session_tx_send() succeeds:
>
> net/can/j1939/transport.c:j1939_simple_txnext() {
>         ...
>         j1939_tp_set_rxtimeout(session, J1939_SIMPLE_ECHO_TIMEOUT_MS);
>
>         ret =3D j1939_session_tx_send(session, skb);
>         if (ret)
>                 goto out_free;
>
>         j1939_sk_errqueue(session, J1939_ERRQUEUE_TX_SCHED);
>         j1939_sk_queue_activate_next(session);
> }
>
> If j1939_tp_rxtimer() fires before j1939_session_tx_send() succeeds (eith=
er
> between j1939_tp_set_rxtimeout() and j1939_session_tx_send(), or while tx=
timer
> is retrying after j1939_session_tx_send() returned -ENOBUFS),
> j1939_tp_rxtimer() transitions session->state to J1939_SESSION_DONE via
> j1939_session_deactivate_locked() and cancels both timers without calling
> j1939_sk_queue_activate_next(session).
>
> When j1939_simple_txnext() then calls j1939_session_tx_send(), it sees
> state !=3D J1939_SESSION_ACTIVE and returns -ESHUTDOWN, jumping to out_fr=
ee
> without calling j1939_sk_queue_activate_next(session), and j1939_tp_txtim=
er()
> breaks out of its switch on -ESHUTDOWN.
>
> Doesn't that leave session permanently queued on jsk->sk_session_queue wi=
th
> its queue kref and jsk->skb_pending count held, stalling subsequent queue=
d
> sessions and causing j1939_sk_release() to block indefinitely waiting on
> !j1939_sock_pending_get(&jsk->sk)?
>
> >       } else {
> > +             spin_lock_bh(&session->tx_send_lock);
> >               j1939_session_list_lock(session->priv);
> >               if (!session->rxtimer_cancelers &&
> >                   session->state >=3D J1939_SESSION_ACTIVE &&
> >                   session->state < J1939_SESSION_ACTIVE_MAX) {
> >                       netdev_alert(priv->ndev, "%s: 0x%p: rx timeout, s=
end abort\n",
> >                                    __func__, session);
> >                       j1939_tp_set_rxtimeout_locked(session,
> >                                                     J1939_XTP_ABORT_TIM=
EOUT_MS);
> >                       __j1939_session_cancel(session, J1939_XTP_ABORT_T=
IMEOUT);
> >               }
> >               j1939_session_list_unlock(session->priv);
> > +             spin_unlock_bh(&session->tx_send_lock);
> >
> >               if (!session->sk)
> >                       j1939_sk_errqueue(session, J1939_ERRQUEUE_RX_ABOR=
T);
>
> [Severity: High]
> In this branch of j1939_tp_rxtimer(), as well as in j1939_session_cancel(=
) and
> j1939_xtp_rx_abort_one(), the socket error notification outside the lock =
runs
> unconditionally even when the state check (or !session->rxtimer_cancelers=
)
> evaluates to false.
>
> For example, when an RX session (!session->sk) completes in
> j1939_xtp_rx_dat_one() (when final is true) and calls
> j1939_session_timers_cancel() -> j1939_session_rxtimer_cancel_sync(),
> session->rxtimer_cancelers is incremented while waiting for a running
> j1939_tp_rxtimer() callback to finish. In j1939_tp_rxtimer(), the conditi=
on
> !session->rxtimer_cancelers is false, so __j1939_session_cancel() is skip=
ped
> and session->err remains 0, but j1939_tp_rxtimer() still calls
> j1939_sk_errqueue(session, J1939_ERRQUEUE_RX_ABORT) after dropping the lo=
cks.
>
> Similarly, if j1939_session_cancel() or j1939_xtp_rx_abort_one() finds th=
at
> another path already transitioned session->state out of the active range,=
 it
> still invokes j1939_sk_errqueue() or j1939_sk_send_loop_abort().
>
> Should these error notifications be gated on whether the caller actually =
won
> the state transition?

Agreed. I will make socket error reporting conditional on winning the
relevant state transition, including the session-cancel, RX-timeout, and
incoming-ABORT paths.
>
> > @@ -1671,6 +1716,8 @@ static void j1939_xtp_rx_abort_one(struct j1939_p=
riv *priv, struct sk_buff *skb,
> >                   session, j1939_xtp_ctl_to_pgn(skb->data), abort,
> >                   j1939_xtp_abort_to_str(abort));
> >
> > +     /* Stop TX callbacks before waiting for the timer callbacks to dr=
ain. */
> > +     j1939_session_tx_send_shutdown(session);
> >       j1939_session_timers_cancel(session);
> >       j1939_session_list_lock(priv);
> >       if (session->state >=3D J1939_SESSION_ACTIVE &&
>
> [Severity: Medium]
> Here j1939_xtp_rx_abort_one() calls j1939_session_tx_send_shutdown(sessio=
n)
> before j1939_session_timers_cancel(session), because session->state is st=
ill
> J1939_SESSION_ACTIVE while the timers are being drained.
>
> However, the other paths that call j1939_session_timers_cancel(session) b=
efore
> deactivating or canceling the session do not call
> j1939_session_tx_send_shutdown(session) first:
>
> - j1939_xtp_rx_eoma_one() sets session->pkt.tx_acked =3D session->pkt.tot=
al,
>   calls j1939_session_timers_cancel(session), and only then calls
>   j1939_session_completed(session) -> j1939_session_deactivate().
> - j1939_xtp_rx_dat_one() (both the final completion branch and
>   out_session_cancel) calls j1939_session_timers_cancel(session) before
>   j1939_session_completed(session) or j1939_session_cancel(session, abort=
).
> - j1939_simple_recv() calls j1939_session_timers_cancel(session) before
>   j1939_session_deactivate(session).
> - j1939_xtp_rx_cts_one() (at out_session_cancel) and
>   j1939_xtp_rx_rts_session_active() call j1939_session_timers_cancel(sess=
ion)
>   before j1939_session_cancel().
>
> While j1939_session_timers_cancel() is waiting for an in-flight
> j1939_tp_txtimer() callback in those paths, both session->tx_send_shutdow=
n is
> false and session->state is J1939_SESSION_ACTIVE, so j1939_session_tx_sen=
d()
> still allows packets through (and in j1939_xtp_rx_eoma_one(), a concurren=
t
> j1939_tp_rxtimer() firing before rxtimer_cancelers is incremented can sti=
ll
> send an XTP ABORT frame on a completed session).
>
> Should j1939_session_timers_cancel() itself call
> j1939_session_tx_send_shutdown(session) (or should those callers shut dow=
n TX
> sends before draining the timers)?

Agreed. Completion paths must close the session send gate before waiting
for timer callbacks. I will distinguish terminal shutdown from timer drains
that are temporary and allow the session to continue.
>
> --
> Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/cover.1793259424.=
git.zihanx@nebusec.ai?part=3D2
