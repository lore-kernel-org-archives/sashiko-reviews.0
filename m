Received: from smtpout-03.galae.net (smtpout-03.galae.net [185.246.85.4])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0827D3A6B66
	for <sashiko-reviews@lists.linux.dev>; Fri, 12 Jun 2026 09:12:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=185.246.85.4
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1781255572; cv=none; b=GCEPUZyWkdwEXQ3YNkKruydougEbGkn1M+eXLn9K/Y9M75sOJyA7CANdC2XarZVTmDZFQF4yHxV9VkGQtnhXQ+iPM3GIAspcJDaKS7S885B5xIUiVbKNJtj84Kjesg93kLwkJydaPtj3HHj77UpGiq2Dou1BpoZGL7f0Z+CtQjQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1781255572; c=relaxed/simple;
	bh=cRz05VYqaWC0pFjf9pY+Rd9eeGNGJS+XDW7NASxs2tU=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=n4xki09MNZsn2hyGHqYFwQDoICj/Os8z9Vp2xko2xPfawU+FNQZFKFS8Y4hxDeO1jcPiaN00CIj2bO7u7X720O37B47wBTmWuQCo4HUoeQiu3o0+/SRZT3nLxgQhNHMc9FVZXpsJgyd7VLVQSastXGHdIPhhJZdvrNVb0oGkLmw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=bootlin.com; spf=pass smtp.mailfrom=bootlin.com; dkim=pass (2048-bit key) header.d=bootlin.com header.i=@bootlin.com header.b=qMnh+rbn; arc=none smtp.client-ip=185.246.85.4
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=bootlin.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=bootlin.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bootlin.com header.i=@bootlin.com header.b="qMnh+rbn"
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
	by smtpout-03.galae.net (Postfix) with ESMTPS id 87E0A4E42E58;
	Fri, 12 Jun 2026 09:12:46 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
	by smtpout-01.galae.net (Postfix) with ESMTPS id 5C8C960012;
	Fri, 12 Jun 2026 09:12:46 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id 3ABD1106C8346;
	Fri, 12 Jun 2026 11:12:45 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=dkim;
	t=1781255565; h=from:subject:date:message-id:to:cc:mime-version:content-type:
	 content-transfer-encoding:in-reply-to:references;
	bh=hTCnNttXNkRyQ/Mkgo6gIH9yy650MmiE74yN+rCH3aA=;
	b=qMnh+rbnDB4R3RJ7VJJobF2eQkHuKmZ4RuqvoAtwLnvcWIf8uv0Zz2PPIcEHFpG85DVPo1
	f8Y2z7kg0r5q6Nf7MtWP76cYK2wZAr7QLdLRS17u5yfxJNEIRfo4fG6Jm/C+uy/tRLQ/4V
	F6kn2sOMUrXcuIzsBMYJDZljLNfpljjeWzLCJT0HG40IfJAj1KxV79m8430w6HUe5zqWUk
	CLq+2KFQqbvfhGs6X2TxRhSXhzHpsYRZ1yX9LWOGUQbVLlg9f/S0ARikcnu+4x1QAIXdIt
	Us/1KZ2HW9x9NxSwahdj9m77/d0riRBNOztQt0O2NWnIYtBZfY+25r5ECbLpCw==
From: =?UTF-8?B?QmVub8OudA==?= Monin <benoit.monin@bootlin.com>
To: sashiko-reviews@lists.linux.dev
Cc: conor+dt@kernel.org, robh@kernel.org, devicetree@vger.kernel.org
Subject: Re: [PATCH v8 9/9] clk: eyeq: Add EyeQ7H compatibles
Date: Fri, 12 Jun 2026 11:12:44 +0200
Message-ID: <AETjc-68TFets9m9JpDAsg@bootlin.com>
In-Reply-To: <20260604134302.BD19F1F00893@smtp.kernel.org>
References:
 <20260604-clk-eyeq7-v8-9-53f618174cf6@bootlin.com>
 <20260604134302.BD19F1F00893@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: sashiko-reviews@lists.linux.dev
List-Id: <sashiko-reviews.lists.linux.dev>
List-Subscribe: <mailto:sashiko-reviews+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:sashiko-reviews+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset="utf-8"
X-Last-TLS-Session-Version: TLSv1.3

On Thursday, 4 June 2026 at 15:43:02 CEST, sashiko-bot@kernel.org wrote:
=2E..
> [Severity: High]
> This isn't a bug introduced by this patch, but do these calculations sile=
ntly
> overflow and truncate on 32-bit architectures?
>=20
> The variables *mult and *div are unsigned long pointers, which are 32 bits
> wide on 32-bit systems. When *div is multiplied by (1ULL << 24) and then
> by 2048 (if DOWN_SPREAD is enabled), it evaluates to ref_div * (1 << 35).
> If ref_div is 32, this becomes 1 << 40, which truncates to exactly 0.
>=20
> This truncated 0 is later passed to clk_hw_register_fixed_factor_pdata(),
> which can cause an immediate division-by-zero panic in the Common Clock
> Framework when clk_factor_recalc_rate() divides by fix->div.
>=20
This driver is specific to EyeQ SoCs, and Mobileye EyeQ SoCs are 64 bits.
So no risk of overflow here.

> > +
> > +	if (!*mult || !*div)
> > +		return -EINVAL;
> > +
> > +	if (r2 & (JFRACR_PCSR2_RESET | JFRACR_PCSR2_DIS_SSCG)) {
> > +		*acc =3D 0;
> > +	} else {
> > +		/* spread spectrum is identical to FRACG PLL */
> > +		spread =3D FIELD_GET(JFRACR_PCSR2_SPREAD, r2);
> > +		*acc =3D DIV_ROUND_CLOSEST(spread * 1000000000, 1024 * 2);
>=20
> [Severity: High]
> This is a pre-existing issue in the FRACG code duplicated here, but does
> this spread spectrum accuracy calculation overflow on 32-bit architecture=
s?
>=20
> The operation spread * 1000000000 is evaluated in 32-bit math. If spread
> is greater than 4, it wraps around UINT_MAX, resulting in an incorrect
> clock accuracy.
>=20
Same as above. No risk of overflow on EyeQ SoCs.

> [ ... ]
>=20
> > @@ -339,6 +481,32 @@ static int eqc_probe_pll_fracg(struct device *dev,=
 struct device_node *np,
> >  	return 0;
> >  }
> > =20
> > +static int eqc_probe_pll_jfracr(struct device *dev, struct device_node=
 *np,
> > +				const struct eqc_clock *clk, void __iomem *base,
> > +				struct clk_hw_onecell_data *cells)
> > +{
>=20
> [ ... ]
>=20
> > +	hw =3D clk_hw_register_fixed_factor_pdata(dev, np, clk->name, &parent=
_data, 0, mult,
> > +						div, acc, CLK_FIXED_FACTOR_FIXED_ACCURACY);
>=20
> [Severity: Medium]
> This isn't a new bug as it exists in the FRACG probe function as well, but
> does passing CLK_FIXED_FACTOR_FIXED_ACCURACY unconditionally override the
> parent clock accuracy when Spread Spectrum is disabled?
>=20
> When the DIS_SSCG bit is set, the driver calculates acc =3D 0. By always
> providing this flag, the Common Clock Framework treats the PLL's absolute
> accuracy as exactly 0 ppb error. This wipes out and fails to inherit the
> parent clock's natural accuracy, which could break downstream consumers
> that rely on accurate tolerance reporting.
>=20
The clock structure of Mobileye EyeQ SoC is such that PLLs with a spread
spectrum modulator (FRACG, JFRACR) are fed by the main oscillator, or a
fixed factor from the oscillator. So the parent clock of those PLLs has an
accuracy of 0 ppb.

> [ ... ]
>=20
> > @@ -411,6 +579,22 @@ static int eqc_probe(struct platform_device *pdev)
>=20
> [Severity: Medium]
> This is a pre-existing issue in eqc_probe(), but does the error path leak
> resources?
>=20
> At the end of eqc_probe(), if of_clk_add_hw_provider() fails, the function
> returns directly without unmapping the I/O memory from ioremap(), freeing
> the cells array from kzalloc_flex(), or unregistering the previously
> initialized clocks.
>=20
> Because the clocks are registered with clk_hw_register_fixed_factor_pdata=
()
> (which bypasses the devm_ auto-cleanup wrapper), failing to unregister th=
em
> manually leaves orphaned clock objects in the system.
>=20
If the clock driver fails to probe, the SoC wont be functional anyway. I do
not think it is worth adding code for a code path that only leads to a dead
system when reached.

Best regards,
=2D-=20
Beno=C3=AEt Monin, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com



