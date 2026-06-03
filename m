Received: from galois.linutronix.de (Galois.linutronix.de [193.142.43.55])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5B6EA3AD511;
	Wed,  3 Jun 2026 15:20:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=193.142.43.55
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1780500018; cv=none; b=ae6vG3qnLqRSTf0y04SxIMH37TXulyJYsjIzvJHBVz04+BPSoLPCm0OI8f0P3FsBjFaXU/jLO8+HDxc8blJKMU+WhgCNu6AuqfIJKmFqL6k0xT6xV45HqMYfVS5d1EK+5Dg7ZMos2qgC2uqfUuWqBH+OPJ278uYWijA7oSYb4Z0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1780500018; c=relaxed/simple;
	bh=/1rg91WC0iA3cVxLCiZqN6U2HNvFDaqQwmPncMp9lwg=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=BnTgr4ByWc/nsJLoq9syka8XGJiKwvyIldl1BsxX2rDtVmWoUOFuMsLuScqEmvDEGzVCPINc0goESSr+904hBgRet2SSlQwi91LzgjE8E6Htid0RoOpeHAmj6lbnqm5eNdfcxj8IQHtCTJM2vPq+E0pWmtaLrqyXJxKWzmttl5k=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linutronix.de; spf=pass smtp.mailfrom=linutronix.de; dkim=pass (2048-bit key) header.d=linutronix.de header.i=@linutronix.de header.b=ZYMV8I/r; dkim=permerror (0-bit key) header.d=linutronix.de header.i=@linutronix.de header.b=jdBc5Suw; arc=none smtp.client-ip=193.142.43.55
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linutronix.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linutronix.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linutronix.de header.i=@linutronix.de header.b="ZYMV8I/r";
	dkim=permerror (0-bit key) header.d=linutronix.de header.i=@linutronix.de header.b="jdBc5Suw"
Date: Wed, 3 Jun 2026 17:20:14 +0200
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020; t=1780500015;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=lGnmC+Gh7F7v/Ou7NDWRc7Y28ZnesYKDvvwwk/AN9bk=;
	b=ZYMV8I/rE/LP2dYzqpM59OGFL+/lwfJv7Z6gRa0JzHIBtvb3z2UN/u7Mp3ZSZNsxEzEbTw
	L+wVAhcDEOvCqFdQXL2lOJT4gXX7pTLN/aj2zJmwKNgnVyIg5szYuyhsNWbVUtBFoR9JCg
	nYZgVG1T50BHtI8uatiXU0m++vOmk3vF3U+AoNKFmPWBzOInVGl5hdBKOA6VaEVVPa3bII
	qRVARt0oEZ6XN717swZM1jwaoHv2tMkT6707LI9eX9SCtCTRmeRGk81Y8mU+xZXPrknbcQ
	mgAEUa7j2zampA7VdVYPBt2RBkp48Ynh6NneRbSvrnrYAnEWYdCvFgxxqwVhFg==
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020e; t=1780500015;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=lGnmC+Gh7F7v/Ou7NDWRc7Y28ZnesYKDvvwwk/AN9bk=;
	b=jdBc5SuwfrVnuEPVMxc8+d4+KS6Ni6ph8kK8ODdhQ71VIC0vPpsn7vCxx9QXclQEqDGXe0
	aTVmVebGVUmdFVBw==
From: Sebastian Andrzej Siewior <bigeasy@linutronix.de>
To: sashiko-reviews@lists.linux.dev
Cc: Frank.Li@kernel.org, imx@lists.linux.dev
Subject: Re: [PATCH v2 8/9] mailbox: imx: Don't force-thread the primary
 handler
Message-ID: <20260603152014.LHMaWInm@linutronix.de>
References: <20260603-imx_mbox_rproc-v2-8-a0059dc3b69a@linutronix.de>
 <20260603143109.19A6F1F00893@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: sashiko-reviews@lists.linux.dev
List-Id: <sashiko-reviews.lists.linux.dev>
List-Subscribe: <mailto:sashiko-reviews+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:sashiko-reviews+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable
In-Reply-To: <20260603143109.19A6F1F00893@smtp.kernel.org>

On 2026-06-03 14:31:08 [+0000], sashiko-bot@kernel.org wrote:
> While reviewing the driver, I noticed a few other potential regressions o=
utside
> the diff hunks above:
>=20
> [Severity: High]
> This is a pre-existing issue, but can the timeout loop in imx_mu_generic_=
tx()
> lead to silent transmission failures?
>=20
> When processing IMX_MU_TYPE_TXDB_V2, the code loops up to 10 times waiting
> for the readl_poll_timeout() condition:
>=20
> drivers/mailbox/imx-mailbox.c:imx_mu_generic_tx() {
>     ...
>     while (ret && (count < 10)) {
>         ret =3D readl_poll_timeout(priv->base + priv->dcfg->xCR[IMX_MU_GC=
R], val,
>                                  !(val & IMX_MU_xCR_GIRn(priv->dcfg->type=
, cp->idx)),
>                                  0, 10000);
>         if (ret) {
>             dev_warn_ratelimited(...);
>         }
>     }
>     break;
>     ...
> }
>=20
> If all 10 attempts time out, ret is left as -ETIMEDOUT and the while loop
> exits. The code then breaks from the switch block and unconditionally hits
> return 0 at the end of the function instead of returning ret.
>=20
> Falsely returning success causes the mailbox framework to drop the messag=
e,
> leading to silent data loss. Should this return the error code instead?

Guess it wouldn't hurt to forward the error to the caller.

> [Severity: High]
> This is a pre-existing issue, but does the use of time APIs and polling
> with local interrupts disabled lead to hard lockups?
>=20
> Mailbox transmission (priv->dcfg->tx) is invoked via mbox_send_message()
> with the channel lock (spin_lock_irqsave) held, meaning local interrupts
> are disabled.
>=20
> Inside imx_mu_tx_waiting_write(), the code polls a hardware register while
> checking time_is_after_jiffies64():
>=20
> drivers/mailbox/imx-mailbox.c:imx_mu_tx_waiting_write() {
>     ...
>     do {
>         status =3D imx_mu_read(priv, priv->dcfg->xSR[IMX_MU_TSR]);
>         can_write =3D status & IMX_MU_xSR_TEn(priv->dcfg->type, idx % 4);
>     } while (!can_write && time_is_after_jiffies64(timeout_time));
>     ...
> }
>=20
> Because interrupts are disabled, jiffies will not advance on UP systems,
> causing an infinite loop (deadlock).

Interrupts are disabled. Better it does not time out=E2=80=A6
It waits IMX_MU_SECO_TX_TOUT which is 3seconds here. I would suggest to
have a udelay(10) or so and then count the loops.

Sebastian
