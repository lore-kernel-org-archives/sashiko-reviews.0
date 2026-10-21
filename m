Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=194.13.80.246
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792585143;
	b=r/7B+c39YDXmbovdNm9F6D3JOLmuHbMJCBuUfDRswxHEJswvHQd8/MohC0GDe52y3Dag
	 S9Tq+3A51mrX9s1SyJ8mt8bkeJQmQ4zJJFm2IYytsPtkVt/TSGekD/NY+3TiTfaXzMiQq
	 UpdQYHfojQUD83RnbxBxEPVitgxXCTLahjmrcVDr8Bg4/xPASVJnrucW4stNu3qGcLDpT
	 Nx3HRgutlgYcj1dYCXhhQEBf/IZbx0x2+POLdBuNfi08bOdzUefGJBa1QuqlkFL8suDMA
	 0mZZg2CYeleMdvl4lbNYglTc2rxQrxyOoIfqnGI/YYxGHRBkV3DVHc6No0WQPXQq43Q==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792585143;
	h=DMARC-Filter:Received:DKIM-Signature:MIME-Version:Date:From:To:Cc:
	 Subject:In-Reply-To:References:Message-ID:X-Sender:Content-Type:
	 Content-Transfer-Encoding:X-Last-TLS-Session-Version;
	bh=frBNHnaShBpKBfGt5CfA9NjARSyc3ANb0Toqoc8qco8=;
	b=K9lnAKTyfaWHmNl0cn1ZcxTuu+74AuLAlUXYZH+5PI97KOQBe/zEMszSSHa3c7ckHafn
	 bajKc86aXF4yO/E8gzhNbHvRGJk0IC11HaeHcNH+szdkLXyxtu2BwGQzsaYlKcfBZouIa
	 2nPYxURQgcU1GS80qWKvfmNZbGjFaMfUFxWS1wSVs2mR1N/KqAVDqRGJGxwsVnfaJQHnp
	 A4mVmpGYygaBlwGvLkNM6C5h17aBtYZ974K0MoAX5YY8Ex3XeWoAWx3nd/OFRqbjLJjWl
	 2gifugt5y/4d+yOR/kh0ELKHwIdsWnbo+kE9ykC05na+IJdcG12iMMV3WNUrtcwE7Yg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=none header.from=tipi-net.de;
	spf=pass smtp.mailfrom=tipi-net.de;
	dkim=pass header.d=tipi-net.de header.i=@tipi-net.de header.a=rsa-sha256 header.s=dkim header.b="kgn7ca//";
	arc=none smtp.remote-ip=194.13.80.246
Received: from mail.tipi-net.de (mail.tipi-net.de [194.13.80.246])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E9AB2606A319
	for <sashiko-reviews@lists.linux.dev>; Wed, 21 Oct 2026 12:19:02 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org E9AB2606A319
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=tipi-net.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=tipi-net.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=tipi-net.de header.i=@tipi-net.de header.a=rsa-sha256 header.s=dkim header.b=kgn7ca//
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id A5DC7A012B;
	Wed, 21 Oct 2026 14:19:00 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=tipi-net.de; s=dkim;
	t=1792585140; h=from:subject:date:message-id:to:cc:mime-version:content-type:
	 content-transfer-encoding:in-reply-to:references;
	bh=frBNHnaShBpKBfGt5CfA9NjARSyc3ANb0Toqoc8qco8=;
	b=kgn7ca//hKhEcLiABnVUHqmt9qy3ycBfsf6Svzt5Y7r0YRMvCPcm8hLDdY4l00dxENcKiV
	o5sladjqHUa8dYT2lXxBx8DkVyL2AxdcWg6RkYOWd+HN4ca0VvYWr0mnFUxQeSbt6TYNcr
	C6ICUQf4hLD7/g1nGIkjAJ6wBl44BYv0DtvGxk0Xw8KUT+GC/CCwosObwnaWwzK4bVC7Uu
	a2aRE7I1FrInz9mBRWARVAU04isGia8gZvhXcbN3mcb3zQsPAEm9OkX1nObYBKT+6Fxowi
	+hus2Ge96fapJhJRVsnXKa9/nDFiiv/C0K3dIYX+k6Tl6F4oiQsHtnge8wy0yg==
X-Mailing-List: sashiko-reviews@lists.linux.dev
List-Id: <sashiko-reviews.lists.linux.dev>
List-Post: <mailto:sashiko-reviews@lists.linux.dev>
List-Help: <mailto:sashiko-reviews+help@lists.linux.dev>
List-Subscribe: <mailto:sashiko-reviews+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:sashiko-reviews+unsubscribe@lists.linux.dev>
List-Owner: <mailto:sashiko-reviews+owner@lists.linux.dev>
Precedence: list
MIME-Version: 1.0
Date: Wed, 21 Oct 2026 14:19:00 +0200
From: Nicolai Buchwitz <nb@tipi-net.de>
To: sashiko-reviews@lists.linux.dev
Cc: linux-serial@vger.kernel.org
Subject: Re: [PATCH v4 2/2] serial: amba-pl011: keep RS485 transmission
 running on reconfiguration
In-Reply-To: <sashiko-outbox-180213@kernel.org>
References: <20261021-devel-nbuchwitz-pl011-rs485-reconfig-stall-v4-0-ed10e219159a@tipi-net.de>
 <20261021-devel-nbuchwitz-pl011-rs485-reconfig-stall-v4-2-ed10e219159a@tipi-net.de>
 <sashiko-outbox-180213@kernel.org>
Message-ID: <a61f86ea6bec868c75753e3ddc1ff242@tipi-net.de>
X-Sender: nb@tipi-net.de
Content-Type: text/plain; charset=US-ASCII;
 format=flowed
Content-Transfer-Encoding: 7bit
X-Last-TLS-Session-Version: TLSv1.3

On 21.10.2026 14:12, sashiko-bot@kernel.org wrote:

> [...]

> [Severity: Medium]
> During a TIOCSRS485 ioctl, uart_set_rs485_config() invokes
> port->rs485_config() before assigning the new configuration to 
> port->rs485:
> 
> drivers/tty/serial/serial_core.c:uart_set_rs485_config() {
> 	...
> 	scoped_guard(uart_port_lock_irqsave, port) {
> 		ret = port->rs485_config(port, &tty->termios, &rs485);
> 		if (!ret) {
> 			port->rs485 = rs485;
> 	...
> }
> 
> In drivers/tty/serial/amba-pl011.c, pl011_rs485_config() calls
> pl011_rs485_tx_stop() -> pl011_rs485_tx_stop_now(), which reads
> port->rs485.flags rather than the new rs485->flags:
> 
> drivers/tty/serial/amba-pl011.c:pl011_rs485_tx_stop_now() {
> 	...
> 	if (port->rs485.flags & SER_RS485_RTS_AFTER_SEND)
> 		cr &= ~UART011_CR_RTS;
> 	else
> 		cr |= UART011_CR_RTS;
> 	...
> }
> 
> Doesn't this cause three regressions when configuring RS485 via 
> TIOCSRS485?
> 
> First, when RS485 is already enabled and idle (uap->rs485_tx_state == 
> OFF)
> and userspace changes SER_RS485_RTS_AFTER_SEND, 
> pl011_rs485_tx_stop_now()
> programs UART011_CR_RTS using the old port->rs485.flags instead of the 
> new
> rs485->flags.
> 
> Second, because the else-if condition in pl011_rs485_config() checks
> port->rs485.flags & SER_RS485_ENABLED instead of
> rs485->flags & SER_RS485_ENABLED, newly enabling RS485 on an open, idle 
> port
> (where pl011_tx_active(uap) is false and pl011_tx_empty(port) is true) 
> skips
> both pl011_rs485_tx_resume() and pl011_rs485_tx_stop(), leaving
> UART011_CR_TXE enabled and UART011_CR_RTS at its previous non-RS485 
> level.
> 
> Third, when RS485 is reconfigured while a transmission or break is 
> active
> (uap->rs485_tx_state != OFF), all branches in pl011_rs485_config() are
> skipped, so changes to SER_RS485_RTS_ON_SEND or SER_RS485_RX_DURING_TX 
> in
> rs485->flags are not applied to REG_CR for the ongoing transmission.
> 
> Should pl011_rs485_config() check rs485->flags & SER_RS485_ENABLED and 
> apply
> the new rs485->flags when setting the idle or active REG_CR state?

All three predate this series, the branch read port->rs485 the same way 
before.
The cover letter lists them as left for the RS485 rework, which fixes 
them by
applying the new settings in pl011_rs485_config().

IMHO that's too big for these stable fixes.

Thanks,
Nicolai
