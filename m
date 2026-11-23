Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=161.97.139.27
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795469196;
	b=tUOzLw8rUJCWHXfN7UIwj3F3B+vVrP0NU3dSusQjLTzS3sgregh2wEZlb8GP7vtaPcoy
	 hB9q7eF+9qYMwEJeAoO5Uhp3vz2P9AULt0cg5BYyQgz/gLl0qkBN3ZsDyq9QiCo3PE0hq
	 QNXhjL9vm4Xq7f7mpiUjY8gICh+MH6cCELKOtzKClr+DOczUNePnOi1jln6DBNJvnumtm
	 iyH65tg0IOBldACrLIClm+s3cGheRG3yUS99de9/yhMbb1JESuuLU1f0LNypuvvCyV5/z
	 a6R+dcuUwXL9tyCR7NfT/bwoQki0lCEh+aHZFDgncm6iEc7HbRIr0DWHXvUmQerQgeg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795469196;
	h=DMARC-Filter:Received:DKIM-Signature:Date:From:To:Cc:Subject:
	 Message-ID:In-Reply-To:References:X-Mailer:MIME-Version:Content-Type:
	 Content-Transfer-Encoding;
	bh=wsF3FcMOWXNGCdyKh3w151th1Q3GCd1mjJvb9cvO8Jg=;
	b=2Z8pNJZw+UwbBfw8iNHfOC7f/csuV2kdPc7EA8G0MGOL6ENFkX6JyNIeMPfFkaG8Fy58
	 J0EJBBaAY8gA3FovcLxOlSQ6bEhvr8C4Sba+YgAkXWO1WD5t+0qxGBdI8QOPtJZk/9gRq
	 3b+4U/N9F5oxhcjrqqPpi0QaC83gWhD4o6ULiNaq/gbdXSPfsKV0MQ0livX2DPL4ZgVaY
	 cFYNzzrhFgAFqMQ6pquq4RTPZFVwYuIOBPwzL+/pHWgcXUWgzYLvz9aJKkyh7h7LbO/Zk
	 s7yEev5oEmT7XnbkjI/EPoGuQJCGrqilJKVZnieq/NDQre+wHsh2YVWy/YEna8WbxHA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=kemnade.info;
	spf=pass smtp.mailfrom=kemnade.info;
	dkim=pass header.d=kemnade.info header.i=@kemnade.info header.a=rsa-sha256 header.s=20220719 header.b=3AqY3M+0;
	arc=none smtp.remote-ip=161.97.139.27
Received: from mail2.andi.de1.cc (vmd64148.contaboserver.net [161.97.139.27])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (prime256v1) server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 11646606A691;
	Mon, 23 Nov 2026 21:26:35 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 11646606A691
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=kemnade.info
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=kemnade.info
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kemnade.info header.i=@kemnade.info header.a=rsa-sha256 header.s=20220719 header.b=3AqY3M+0
Received: from mail.andi.de1.cc ([2a02:c205:3004:2154::1])
	by mail2.andi.de1.cc with esmtps  (TLS1.3) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
	(Exim 4.98.2)
	(envelope-from <andreas@kemnade.info>)
	id 1xVbYX-00000003fl6-3qTn;
	Mon, 23 Nov 2026 22:26:33 +0100
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=kemnade.info; s=20220719; h=References:In-Reply-To:Subject:Cc:To:From:
	Reply-To:Content-ID:Content-Description;
	bh=wsF3FcMOWXNGCdyKh3w151th1Q3GCd1mjJvb9cvO8Jg=; t=1795469193; x=1796678793; 
	b=3AqY3M+0c8wCrwD9t/+PoxjSY2837wkPHLfuaRHHXRKebuKD08wWslrlgNwNZTserStUiVI7FuW
	hx94Z1iFqFiK0c7Sf+S7OrhpNnMuA71Cvwfbkv/7V0ij16gzoYlqLLywCqj+a2gO+7Mk6bT3p10xe
	K6sWnQ1AQXMjNYWUQklWWf0Ngn8lnEjUedaTT6FrXcJpnx0riVvc47Vt7qWIalhwwpUP2E3aegrHG
	delNMQJ5/HT0NGLIL9LAYVokNswg6hKIH6wiiSY7Bt7AnATGjLsV91x4OuKtksdpHd7jWZaQd5RXO
	Ux2sdE4EQm/xgBWB5bm12giw2GN59Fdu7Tow==;
Date: Mon, 23 Nov 2026 22:26:15 +0100
From: Andreas Kemnade <andreas@kemnade.info>
To: sashiko-bot@kernel.org
Cc: sashiko-reviews@lists.linux.dev, imx@lists.linux.dev,
 devicetree@vger.kernel.org, robh@kernel.org, conor+dt@kernel.org,
 Frank.Li@kernel.org, Russell King <linux@armlinux.org.uk>, Sascha Hauer
 <s.hauer@pengutronix.de>, Pengutronix Kernel Team <kernel@pengutronix.de>,
 Fabio Estevam <festevam@gmail.com>, Daniel Lezcano
 <daniel.lezcano@kernel.org>, Thomas Gleixner <tglx@kernel.org>, Conor
 Dooley <conor+dt@kernel.org>, linux@yoavmoshe.com
Subject: Re: [PATCH 3/3] ARM: dts: imx: kobo-clarahd: Use 32K clock for the
 timer
Message-ID: <20261123222615.7ef78105@kemnade.info>
In-Reply-To: <sashiko-outbox-230043@kernel.org>
References: <20261123-imx6-idlestop-v1-0-e32f1f44e46f@kemnade.info>
	<20261123-imx6-idlestop-v1-3-e32f1f44e46f@kemnade.info>
	<sashiko-outbox-230043@kernel.org>
X-Mailer: Claws Mail 4.3.1 (GTK 3.24.49; aarch64-unknown-linux-gnu)
X-Mailing-List: sashiko-reviews@lists.linux.dev
List-Id: <sashiko-reviews.lists.linux.dev>
List-Post: <mailto:sashiko-reviews@lists.linux.dev>
List-Help: <mailto:sashiko-reviews+help@lists.linux.dev>
List-Subscribe: <mailto:sashiko-reviews+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:sashiko-reviews+unsubscribe@lists.linux.dev>
List-Owner: <mailto:sashiko-reviews+owner@lists.linux.dev>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

On Mon, 23 Nov 2026 20:59:52 +0000
sashiko-bot@kernel.org wrote:

> Thank you for your contribution! Sashiko AI review found 2 potential
> issues to consider:
> - [High] ARM: dts: imx: kobo-clarahd: missing Signed-off-by trailer in
>   commit message
> - [High] ARM: dts: imx: overriding gpt1 per clock with 32K CKIL degrades
>   system timer
> --
>=20
> commit f6e6f44334678659ba2ecc2406ebe0d33a2e4544
> Author: Andreas Kemnade <andreas@kemnade.info>
>=20
> > ARM: dts: imx: kobo-clarahd: Use 32K clock for the timer
> >
> > To avoid depending on PLL infrastructure for timekeeping, use 32K timer
> > for the timer. =20
>=20
> [Severity: High]
> The commit message is missing a Signed-off-by: tag.

$ ~/b4/b4.sh prep --check
Checking patches using:
  [...]/kernel/scripts/checkpatch.pl -q --terse --no-summary --mailback --s=
howfile=20
---
=E2=97=8F 6bea654204f1: ARM: imx: enable STOP-ON mode in idle if wakeup req=
uirements permit
=E2=97=8F 3e7a75764adb: timer-imx-gpt: Allow 32K clock to be used as a cloc=
k source
=E2=97=8F 54e9ec84fcf0: ARM: dts: imx: kobo-clarahd: Use 32K clock for the =
timer
---
Success: 3, Warning: 0, Error: 0

That is weird. Checkpatch called via b4 does not complain.=20
but direct call does complain

 scripts/checkpatch.pl -g HEAD
ERROR: Missing Signed-off-by: line(s)

total: 1 errors, 0 warnings, 11 lines checked

NOTE: For some of the reported defects, checkpatch may be able to
      mechanically convert to the typical style using --fix or --fix-inplac=
e.

Commit 54e9ec84fcf0 ("ARM: dts: imx: kobo-clarahd: Use 32K clock for the ti=
mer") has style problems, please review.

>=20
> > diff --git a/arch/arm/boot/dts/nxp/imx/imx6sll-kobo-clarahd.dts b/arch/=
arm/boot/dts/nxp/imx/imx6sll-kobo-clarahd.dts
> > index 1000ee8b807aa..2e907c4163629 100644
> > --- a/arch/arm/boot/dts/nxp/imx/imx6sll-kobo-clarahd.dts
> > +++ b/arch/arm/boot/dts/nxp/imx/imx6sll-kobo-clarahd.dts
> > @@ -46,6 +46,11 @@ &gpio_keys {
> >  	pinctrl-0 =3D <&pinctrl_gpio_keys>;
> >  };
> > =20
> > +&gpt1 {
> > +	clocks =3D <&clks IMX6SLL_CLK_GPT_BUS>,
> > +		 <&clks IMX6SLL_CLK_CKIL>;
> > +};
> > +
> >  &i2c1 {
> >  	pinctrl-names =3D "default","sleep";
> >  	pinctrl-0 =3D <&pinctrl_i2c1>; =20
>=20
> [Severity: High]
> Does overriding gpt1's per clock with the 32.768 kHz IMX6SLL_CLK_CKIL
> degrade system timekeeping on i.MX6SLL, where gpt1 is the only system
> timer?
>=20
> In drivers/clocksource/timer-imx-gpt.c, mxc_clockevent_init() registers
> the clockevent device with a hardcoded min_delta of 0xff ticks:
>=20
> drivers/clocksource/timer-imx-gpt.c:mxc_clockevent_init() {
> 	...
> 	clockevents_config_and_register(ced, clk_get_rate(imxtm->clk_per),
> 					0xff, 0xfffffffe);
> 	...
> }
>=20
probably that min_delta should be set to 3 with a 32.768kHz clock as
other drivers do.

> At 32768 Hz, 255 ticks is ~7.78 ms, so clockevents_program_event() clamps
> every timer or hrtimer wakeup below 7.78 ms (including scheduler ticks at
> CONFIG_HZ >=3D 200 and short cpuidle sleeps) to 7.78 ms.
>=20
> At 32768 Hz, mxc_clocksource_init() also reduces sched_clock and
> clocksource resolution to ~30.5 us, and register_current_timer_delay()
> rejects imx_delay_timer because its resolution exceeds 1000 ns, falling
> back to loop-based udelay() on a board with cpufreq scaling.  In addition,
> the GPT clock inputs are internal to the i.MX6SLL SoC, so overriding the
> per clock in the board DTS does not describe board-specific hardware.
>=20
As stated, using that 32K clock has drawbacks, so it is a tradeoff.
Only if this additional idle state improves PM, that drawbacks should be
imposed on boards.=20

Regards,
Andreas
