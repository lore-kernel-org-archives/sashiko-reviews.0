Received: from mail-wr1-f49.google.com (mail-wr1-f49.google.com [209.85.221.49])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 037D7306752
	for <sashiko-reviews@lists.linux.dev>; Thu,  4 Jun 2026 21:28:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.49
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1780608503; cv=none; b=ELc5qjASphucIRuMTnw4a5rKwB5l6w/DXdwCjGF9+ErprlOuoEYbw6QbnpYEff9qxy6xmA7z+4SbZTmpY2CHXftA/ZIJqiX2ZW1+vTR3O6FMLdjzvjHJuE7lwCkBnMS1D5Oyzqhg/MHDKuMUhujwdMedSB34OiM3KdT5kKBi5B8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1780608503; c=relaxed/simple;
	bh=guM8AybZ1+IU9qZayrO9KXkeRUyEWwMinPXSB3XMltk=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=h4S92CvUYxIAU4r54S7tn2xUB/7wbEQxRssEsiubGB9WTLHVgtkasxnrZcgIyEV7cQ7lXDmDqGF+pKvT5p7y19Zt1lmj2yI4gImSnZqMrL4tjlwuZ5trDdGgpjJeFWS9ZD9LeHvAhIAs153GV+4Kc06IBjwnRQgZrp9mqdEQYVM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com; spf=pass smtp.mailfrom=baylibre.com; dkim=pass (2048-bit key) header.d=baylibre.com header.i=@baylibre.com header.b=ZQjo6Wnp; arc=none smtp.client-ip=209.85.221.49
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=baylibre.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=baylibre.com header.i=@baylibre.com header.b="ZQjo6Wnp"
Received: by mail-wr1-f49.google.com with SMTP id ffacd0b85a97d-45f3cf907ceso580787f8f.2
        for <sashiko-reviews@lists.linux.dev>; Thu, 04 Jun 2026 14:28:19 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre.com; s=google; t=1780608498; x=1781213298; darn=lists.linux.dev;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=qpl5grPgHkRob0EdUgg6PK1X+hPbOSCgLrqMSmwFqaM=;
        b=ZQjo6Wnpcwr1ol1mXFIHScqjTNEppnUYx+HOOReX7QSQbhruFmI/7xaE3YMeDOVMQE
         0NNfqsuOwjO8sX6R7GCfdH90mYK2vgH2bE6/rS35r1clK1s/JYti1u2PlKs8ytasnSFh
         10ylxOGu4SAU705dEFIN7ec56pdGdN9b/1dG8TQi7z3+i/OBL5ZSZH4jCCKw9hgLOTc8
         po9AlXYoZWQDuHyiA+HlZxDUe8LceKNhSpSPLDpZkAH7G2pSc4FPfUYf8+9QMSyZoJH9
         2Vu/pn1hj2pZ1jNI0ewfYPKkoX9QTGWa5qvTDYE4tppIHfmrJyIO6PyiBbqtP/NUpXBL
         8Mng==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1780608498; x=1781213298;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=qpl5grPgHkRob0EdUgg6PK1X+hPbOSCgLrqMSmwFqaM=;
        b=UHwzhhVFXCk3i1i+Yck0I6bgqkB+Slva2hA1x0hdPhnCbiVFlvNLT9VSDRJuY5uW5J
         ofmbciNJuzQ86fSOmCnvm37urgDMnQvXdOgGhiy70ikoWpTErCyEkfCMROW0iD+BGs7i
         G85i3Y0WZOYXspaQUOO74iw2IYRQQ5cI8VoOwz3qkv0IWwSplAjdFdRgl4KneKG3Ag4W
         wGQAacfn+Q4L1NIQU6RmPGddgmvCIjzFXu7zY0BobyW2MeQk+PFolwf/vL4YU5yuxwkg
         0H3uEzIpzBQ58CT2tXJT/y+cvwsE1YmAtaOvR9tbSsmC+PEY1CkwlGlXYIVXDM0I9sAN
         oKOw==
X-Gm-Message-State: AOJu0Yw3x8HTz5WkDp9ZIof7WrmTtBlgskrqBsogF2LxeXG9Bcdf+M/G
	Z432kqrXNeN9omIM9neVKPZFM49s8u5gv6B0NvlfftWX4ZxbHMyUNbITdd7QRDbHTf0=
X-Gm-Gg: Acq92OGIvCBfsxu20g1XTm+GK8D0AM5g0ugvXQZzoStPzhXBhjpcjhUIJeePpwMv2F4
	/h7/uCugbqBdM7DdzM0MYHnu/PpMc5urBqUdgL0DgtsX8bUFiYv1R/St90C5se5vVk5x0eETev+
	kJDOgPpV4Z1cZKdkm7bgT02I2HIZso00CJkEOfp8rbC/RyDQaHcC0DLMPR2xSNoXZRkS0jHGTvP
	Yd11Q0HWEOPyntMkSPbsXsIxsHHJojVPCrWSEJTk1TSJBGW/al0EQ0a66Y0DIkLEVOoeUQdv7ZU
	H4Hy3kwkcLM8HNQPjDy+rAjtyDnioDSV9bzIkA9OPkj0cCjsyzqF03GRfgdpRPzXi15UXXGzp6Y
	X4IP7zKCEXbifTHkyrV3nJ80saLxIYLh/8wrp7BoBro8ozIzDYG2jvNUIT5vJiaZ76JwbiLLzVh
	yvbyFBNRT1s4Vsecc/pg9N3/kb2infHxeHIESyJuhAVugGtMQUfgeFqIWUgjs2fpsDkpEZuCOd+
	c3TndrihMw=
X-Received: by 2002:a05:6000:1241:b0:460:2ee5:67b8 with SMTP id ffacd0b85a97d-46030640671mr861000f8f.36.1780608498311;
        Thu, 04 Jun 2026 14:28:18 -0700 (PDT)
Received: from localhost (cust-east-par-46-193-69-147.cust.wifirst.net. [46.193.69.147])
        by smtp.gmail.com with UTF8SMTPSA id ffacd0b85a97d-4602cda3651sm6645312f8f.32.2026.06.04.14.28.17
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 04 Jun 2026 14:28:17 -0700 (PDT)
Date: Thu, 4 Jun 2026 23:28:16 +0200
From: Uwe =?utf-8?Q?Kleine-K=C3=B6nig?= <u.kleine-koenig@baylibre.com>
To: Andrea della Porta <andrea.porta@suse.com>
Cc: sashiko-reviews@lists.linux.dev, conor+dt@kernel.org, 
	devicetree@vger.kernel.org, robh@kernel.org
Subject: Re: [PATCH v4 2/3] pwm: rp1: Add RP1 PWM controller driver
Message-ID: <aiHn5-gQMbjttrR6@monoceros>
References: <8eef956a5eb473f051bbda89ec4c9991c1b47de2.1780498640.git.andrea.porta@suse.com>
 <20260603154716.1B5C41F00893@smtp.kernel.org>
 <aiGAINsTG8VZLn28@apocalypse>
Precedence: bulk
X-Mailing-List: sashiko-reviews@lists.linux.dev
List-Id: <sashiko-reviews.lists.linux.dev>
List-Subscribe: <mailto:sashiko-reviews+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:sashiko-reviews+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="e2kbaxapkhawq6wa"
Content-Disposition: inline
In-Reply-To: <aiGAINsTG8VZLn28@apocalypse>


--e2kbaxapkhawq6wa
Content-Type: text/plain; protected-headers=v1; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable
Subject: Re: [PATCH v4 2/3] pwm: rp1: Add RP1 PWM controller driver
MIME-Version: 1.0

Hello Andrea,

On Thu, Jun 04, 2026 at 03:39:44PM +0200, Andrea della Porta wrote:
> On 15:47 Wed 03 Jun     , sashiko-bot@kernel.org wrote:
> > Thank you for your contribution! Sashiko AI review found 8 potential is=
sue(s) to consider:
> > - [High] Missing `pwmchip_remove()` on the `of_syscon_register_regmap()=
` error path leaves a dangling PWM chip.
> > - [High] When disabling a PWM channel, the driver fails to clear the po=
larity bit, causing the output to erroneously remain HIGH if it was previou=
sly inverted.
> > - [High] Registering a devm-managed regmap with the permanent syscon re=
gistry creates a teardown asymmetry.
> > - [High] Hardware channel control registers (`CHAN_CTRL`) are not resto=
red across system suspend/resume.
> > - [Medium] Non-monotonic period limit checking in `rp1_pwm_round_wavefo=
rm_tohw()` causes larger requested periods to result in smaller hardware pe=
riods.
> > - [Medium] Calculating `period_length_ns` from hardware state suffers f=
rom a 32-bit integer overflow before casting to u64, resulting in a zero pe=
riod.
> > - [Medium] Calculating inverted polarity duty length underflows if the =
hardware is configured for a 100% duty cycle.
> > - [Medium] Returning a positive integer (1) from `round_waveform_tohw` =
incorrectly propagates as an error.
> > --
> >=20
> > commit 90d2019e94496c6949f2d04c2605c6a197b16d6a
> > Author: Naushir Patuck <naush@raspberrypi.com>
> >=20
> > pwm: rp1: Add RP1 PWM controller driver
> >=20
> > The Raspberry Pi RP1 southbridge features an embedded PWM controller
> > with 4 output channels, alongside an RPM interface to read the fan
> > speed on the Raspberry Pi 5. Add the supporting driver.
> >=20
> > > diff --git a/drivers/pwm/pwm-rp1.c b/drivers/pwm/pwm-rp1.c
> > > new file mode 100644
> > > index 0000000000000..052c3ae770569
> > > --- /dev/null
> > > +++ b/drivers/pwm/pwm-rp1.c
> > [ ... ]
> > > +static int rp1_pwm_round_waveform_tohw(struct pwm_chip *chip,
> > > +				       struct pwm_device *pwm,
> > > +				       const struct pwm_waveform *wf,
> > > +				       void *_wfhw)
> > > +{
> > > +	struct rp1_pwm *rp1 =3D pwmchip_get_drvdata(chip);
> > > +	u64 period_ticks, duty_ticks, offset_ticks;
> > > +	struct rp1_pwm_waveform *wfhw =3D _wfhw;
> > > +	u64 clk_rate =3D rp1->clk_rate;
> > > +	int ret =3D 0;
> > > +
> > > +	if (!wf->period_length_ns) {
> > > +		wfhw->enabled =3D false;
> > > +		return 0;
> > > +	}
> > > +
> > > +	period_ticks =3D mul_u64_u64_div_u64(wf->period_length_ns, clk_rate=
, NSEC_PER_SEC);
> > > +
> > > +	/*
> > > +	 * The period is limited to U32_MAX - 1
> > > +	 * to allow 100% duty cycle.
> > > +	 */
> > > +	if (period_ticks > U32_MAX) {
> > > +		period_ticks =3D U32_MAX - 1;
> >=20
> > [Severity: Medium]
> > Does this limit check break monotonicity for large periods?
> >=20
> > If the requested period translates to U32_MAX, this condition is false =
and
> > the period becomes U32_MAX - 1.
> >=20
> > If it translates to U32_MAX + 1, it becomes U32_MAX - 1, which is then
> > subtracted by 1 later, yielding U32_MAX - 2. This makes a larger reques=
ted
> > period result in a smaller actual hardware period.
>=20
> Ack. I will set period_ticks =3D U32_MAX in that if.
>=20
> >=20
> > > +	} else if (!period_ticks) {
> > > +		period_ticks =3D 2;
> > > +		ret =3D 1;
> > > +	}
> >=20
> > [Severity: Medium]
> > Is returning a positive integer here intentional?
> >=20
> > The PWM core subsystem expects round_waveform_tohw callbacks to return =
0 on
> > success or a negative error code on failure. Returning 1 could propagat=
e as
> > an error up to consumer drivers, breaking operation for very small peri=
ods.
>=20
> It should return 1 in case the if any value is rounded, which in this cas=
e=20
> is the period.

Ack. However it's a bit strange that you fixup period_ticks =3D 0 to 2
while 1 is kept as is. Either using 1 is invalid, then it should be
updated to two, too. Or it gives a shorter period than 2, then 0 should
be fixed up to 1 only.

> > > +	duty_ticks =3D mul_u64_u64_div_u64(wf->duty_length_ns, clk_rate, NS=
EC_PER_SEC);
> > [ ... ]
> > > +static int rp1_pwm_round_waveform_fromhw(struct pwm_chip *chip,
> > > +					 struct pwm_device *pwm,
> > > +					 const void *_wfhw,
> > > +					 struct pwm_waveform *wf)
> > > +{
> > > +	struct rp1_pwm *rp1 =3D pwmchip_get_drvdata(chip);
> > > +	const struct rp1_pwm_waveform *wfhw =3D _wfhw;
> > > +	u64 clk_rate =3D rp1->clk_rate;
> > > +	u32 ticks;
> > > +
> > > +	*wf =3D (struct pwm_waveform){ };
> > > +
> > > +	if (!wfhw->enabled)
> > > +		return 0;
> > > +
> > > +	wf->period_length_ns =3D DIV_ROUND_UP_ULL((u64)(wfhw->period_ticks =
+ 1) * NSEC_PER_SEC,
> > > +						clk_rate);
> >=20
> > [Severity: Medium]
> > Could this encounter a 32-bit integer overflow?
> >=20
> > Since wfhw->period_ticks is a 32-bit integer, the addition of 1 happens=
 in
> > 32-bit space before the cast to u64.
> >=20
> > If the hardware register was configured to 0xffffffff by the bootloader=
 for
> > a 100% duty cycle, 0xffffffff + 1 wraps around to 0, producing a period=
 of 0.
> >=20
> > Should the cast be placed before the addition?
>=20
> Ack. 0xffffffff should be deemed as a non valid value though.
>=20
> >=20
> > > +
> > > +	if (!wfhw->inverted_polarity) {
> > > +		wf->duty_length_ns =3D DIV_ROUND_UP_ULL((u64)wfhw->duty_ticks * NS=
EC_PER_SEC,
> > > +						      clk_rate);
> > > +	} else {
> > > +		ticks =3D wfhw->period_ticks + 1 - wfhw->duty_ticks;
> > > +		wf->duty_length_ns =3D DIV_ROUND_UP_ULL((u64)ticks * NSEC_PER_SEC,=
 clk_rate);
> >=20
> > [Severity: Medium]
> > Will this subtraction underflow if the hardware is configured for a 100%
> > duty cycle?
> >=20
> > The driver allows duty_ticks to exceed period_ticks + 1 to achieve a 10=
0%
> > duty cycle.
>=20
> The driver is not allowing this since tohw() has this:=20
>=20
> duty_ticks =3D min(duty_ticks, period_ticks);
>=20
> Anyway, if fromhw() is called first and the bootloader has configured 0xf=
fffffff
> in the period register, should it returns an error? The period should alw=
ays be
> at most U32_MAX-1.

I'm not sure if this triggers a PWM_DEBUG check, but I'd say the right
thing is to let fromhw() report what the actual setting even if tohw()
will never result in that setting.

Thinking again, the tohw() callback could be a bit more clever and also
use period_ticks =3D 0xffffffff, as this fine if duty_ticks is less than
this value and if duty_ticks =3D period_ticks =3D 0xffffffff you can still
configure the hardware using period_ticks =3D 0xfffffffe to achieve the
100% relative dutycycle. (But keeping the current behaviour is fine for
me, too.)

> > > +		wf->duty_offset_ns =3D wf->period_length_ns - wf->duty_length_ns;
> > > +	}
> > > +
> > > +	return 0;
> > > +}
> > > +
> > > +static int rp1_pwm_write_waveform(struct pwm_chip *chip,
> > > +				  struct pwm_device *pwm,
> > > +				  const void *_wfhw)
> > > +{
> > > +	struct rp1_pwm *rp1 =3D pwmchip_get_drvdata(chip);
> > > +	const struct rp1_pwm_waveform *wfhw =3D _wfhw;
> > > +	u32 value, ctrl;
> > > +
> > > +	/* early exit if disabled */
> > > +	regmap_read(rp1->regmap, RP1_PWM_GLB_CTRL, &ctrl);
> > > +	if (!wfhw->enabled) {
> > > +		ctrl &=3D ~RP1_PWM_GLB_CTRL_CHANNEL_ENABLE(pwm->hwpwm);
> > > +		goto exit_disable;
> > > +	}
> >=20
> > [Severity: High]
> > Does skipping the polarity update here cause the output to erroneously
> > remain HIGH while disabled?
> >=20
> > The early exit skips the read-modify-write block that updates
> > RP1_PWM_CHAN_CTRL_POLARITY.
> >=20
> > The driver notes state that when disabled, the output is driven to 1 if
> > polarity is inversed. If a channel previously configured with inverted
> > polarity is disabled, it seems it will continually output a HIGH signal,
> > violating the PWM framework expectation.
>=20
> I'm not sure whether an inverted polarity pin shoudl stay low when disabl=
ed.
> After all, the inactive state for a reversed pin is high.

Sashiko's concern is correctly stated, if you go from

	polarity =3D inversed, enabled

to

	polarity =3D normal, disabled

the output stays high, which is active for polarity =3D normal.

However the behaviour of a disabled PWM isn't specified, so any
behaviour is fine, the only objective is to save power. And if the
consumer relies on a constant inactive output, it's supposed to not
disable it.

For me both behaviours are fine. Making the hardware emit the inactive
level might prevent a surprise if the consumer isn't aware of the
missing guarantee, but being lazy and so surprise the consumer is also
fine as this might uncover that wrong assumption and allow the consumer
to be fixed.

(And not all PWM implementations allow to configure the output level, so
a guarantee cannot be given. Some go to 0 irrespective of the configured
polarity, some go to High-Z.)

> > [Severity: High]
> > Also, does registering a devm-managed regmap with the permanent syscon
> > registry create a teardown asymmetry?
> >=20
> > The regmap is allocated with devm_regmap_init_mmio(). If the underlying
> > device is hotplug removed, devres will automatically free the regmap me=
mory.
> >=20
> > However, the syscon framework does not provide an unregister function,
> > leaving it with a dangling pointer in its static list that could cause a
> > use-after-free upon subsequent lookups.
>=20
> The device is not hotpluggable and the driver cannot be unloaded/unbounde=
d, so
> there should be no dangling pointer around.

ack.

Best regards
Uwe

--e2kbaxapkhawq6wa
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEP4GsaTp6HlmJrf7Tj4D7WH0S/k4FAmoh7ewACgkQj4D7WH0S
/k6fNwf+N7edcJWSugcWqE0upNf4HZ4E0IT9Rl2WgzOUbeXigZOTdSOz2YbYAXhu
Oz2f83BvVx69KHmFAfxJdksfWyyH6vD5c4tiZObBXx/8W0sYVkaX9BXpm87Kj8Us
HOtvA513rjQ4XU5DneeMZncfWuAMeRsj5EEsaXUF045WFi54UcC2yVUEeMHu4ezl
ho6Ac7qp3Q8CrXJq559KKyCaB5z+Z3Ez6cIshPtgcTYccGSRVB6cNuhOi2AKmAr8
Ksx86Yzz15LouEb2WFb4IrFTekwMnU9QEpIoHgGP2H6MmJnUOw/k9UiqBqtGdM3/
hFD9r1jDDQunkpUB2KnLv5dgb+ZYJw==
=ziwr
-----END PGP SIGNATURE-----

--e2kbaxapkhawq6wa--
