Received: from mail-4320.protonmail.ch (mail-4320.protonmail.ch [185.70.43.20])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4240A4314B5
	for <sashiko-reviews@lists.linux.dev>; Thu, 16 Jul 2026 17:32:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=185.70.43.20
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784223144; cv=none; b=D7HBRWSecJXVfFlxPvD3CcPcK5UKFbb4r4mhsmwuPVjohd0XYu2OnqpVs/z7p30tekXmak2AxDjBL+/GMRDvjkQGrNxJCOGQUWZQjUlK3K1CGgVdTdbPd7EE+elxxZrWRHrtJJO80DmhjBFQh2Hcotb5uGDio1Vkah+gLmZ3rvw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784223144; c=relaxed/simple;
	bh=b41BGWI35zuaBsqDYUZC+2NepKzUXdwyYIZzuJAqvuc=;
	h=Date:To:From:Subject:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=jj8cuJJFK2Da8dg6ZZA7CV9YByLX0MFycymhT7kSsjT+8TXmgFPxM7a2C5+yT4NgOXGFNLO5WsUxJ6H1zAbHKZZFPXe+KhgEqrOhD755LqGg01BBF+8Vm9ylrnMMU0ABLyvqs5853is/VJk4ptf9UtzWF5pv30nN1HZ0JZD5PiY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=chimac.ro; spf=pass smtp.mailfrom=chimac.ro; dkim=pass (2048-bit key) header.d=chimac.ro header.i=@chimac.ro header.b=sWbPg5gw; arc=none smtp.client-ip=185.70.43.20
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=chimac.ro
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=chimac.ro
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=chimac.ro header.i=@chimac.ro header.b="sWbPg5gw"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=chimac.ro;
	s=protonmail3; t=1784223129; x=1784482329;
	bh=OryP4DwZ3rpepIET6F4yqu1dFUupcoglDwhWe9KuEvQ=;
	h=Date:To:From:Subject:Message-ID:In-Reply-To:References:
	 Feedback-ID:From:To:Cc:Date:Subject:Reply-To:Feedback-ID:
	 Message-ID:BIMI-Selector;
	b=sWbPg5gw4PriRnl/iMkKKsHWnHI9E54Ut4FpEzKb1eUQxuOUOHA7IXNcAlGHimkNV
	 F44flBixBVCXpsn0c2tOYZhYzUOBYyAk1hNoon7ZnJaZbD6CS6316szgV83ZsY2FA1
	 6f7jL7n4BsZVIMRqaji75x3fZLDwF+C7Oi9saO3OwW6POuAEw7vFQtkSBnA2vwEqkM
	 ZzpuS5YduqA994cpJPRHc9+53n+m5ATfO93C9n9A8KNxfSIcBkC23kac1IaeGOrFDS
	 L4twJBo1XWzbrcSgggykTZ48ypYc38PXpR3vV6wV/ZTa6/x7K4oRFmUt/Up81SfVXz
	 XOvZs6f/hhisg==
Date: Thu, 16 Jul 2026 17:32:06 +0000
To: sashiko-reviews@lists.linux.dev
From: Alexandru Chimac <alex@chimac.ro>
Subject: Re: [PATCH v2 1/5] dt-bindings: clock: samsung: Add Exynos9610 CMU bindings
Message-ID: <SbPtxHjgow0vaHCuj1jtZ-iFkC1Ur8qV7AITruEuAZlwq_Ov78N8kBiV6A--CTjphlzGQCYk6kOBVhXGmFSVAcfde6xR3LPWZMw5y_jTH78=@chimac.ro>
In-Reply-To: <20260716172128.6910F1F000E9@smtp.kernel.org>
References: <20260716-exynos9610-clocks-v2-0-c13ce8ef1861@chimac.ro> <20260716-exynos9610-clocks-v2-1-c13ce8ef1861@chimac.ro> <20260716172128.6910F1F000E9@smtp.kernel.org>
Feedback-ID: 139133584:user:proton
X-Pm-Message-ID: 38e46a69c0e9628fe012cf8e77c6afbbc71f7573
Precedence: bulk
X-Mailing-List: sashiko-reviews@lists.linux.dev
List-Id: <sashiko-reviews.lists.linux.dev>
List-Subscribe: <mailto:sashiko-reviews+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:sashiko-reviews+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable

Hello!

On Thursday, 16 July 2026 at 8:21 PM, sashiko-bot@kernel.org <sashiko-bot@k=
ernel.org> wrote:

> Thank you for your contribution! Sashiko AI review found 2 potential issu=
e(s) to consider:
> - [High] Clock IDs for CMU_CMGP muxes and dividers overlap, reusing IDs 0=
 through 6, causing ID collisions.
> - [Low] Incorrect header file referenced in the YAML binding description.
> --
>=20
> --- Patch [1]: [PATCH v2 1/5] dt-bindings: clock: samsung: Add Exynos9610=
 CMU bindings ---
> commit 23fcebc1c69a1cfdcd9b3f745d13b2ff694b6b10
> Author: Alexandru Chimac <alex@chimac.ro>
>=20
> dt-bindings: clock: samsung: Add Exynos9610 CMU bindings
>=20
> This commit adds the device tree binding documentation for the Exynos9610=
 clock
> controller. It defines the compatible strings and properties for various =
clock
> management units, and introduces the corresponding header file with clock=
 IDs.
>=20
> > diff --git a/Documentation/devicetree/bindings/clock/samsung,exynos9610=
-cmu.yaml b/Documentation/devicetree/bindings/clock/samsung,exynos9610-cmu.=
yaml
> > new file mode 100644
> > index 0000000000000..4406c25545229
> > --- /dev/null
> > +++ b/Documentation/devicetree/bindings/clock/samsung,exynos9610-cmu.ya=
ml
> [ ... ]
> > @@ -0,0 +1,335 @@
> [ ... ]
> > +description: |
> > +  Exynos9610 clock controller is comprised of several CMU units, gener=
ating
> > +  clocks for different domains. Those CMU units are modeled as separat=
e device
> > +  tree nodes, and might depend on each other. The root clock in that r=
oot tree
> > +  is an external clock: OSCCLK (26MHz). This external clock must be de=
fined
> > +  as a fixed-rate clock in the device tree.
> > +
> > +  CMU_TOP is a top-level CMU, where all base clocks are prepared using=
 PLLs and
> > +  dividers; all other clocks of function blocks (other CMUs) are usual=
ly
> > +  derived from CMU_TOP.
> > +
> > +  Each clock is assigned an identifier and client nodes can use this i=
dentifier
> > +  to specify the clock which they consume. All clocks available for us=
age
> > +  in clock consumer nodes are defined as preprocessor macros in
> > +  'include/dt-bindings/clock/samsung,exynos9610.h'.
>=20
> [Severity: Low]
> This isn't a bug, but there is a typo in the header file name here. Shoul=
d
> it be samsung,exynos9610-cmu.h instead of samsung,exynos9610.h?
>=20
> > +
> > +properties:
> > +  compatible:
> [ ... ]
> > diff --git a/include/dt-bindings/clock/samsung,exynos9610-cmu.h b/inclu=
de/dt-bindings/clock/samsung,exynos9610-cmu.h
> > new file mode 100644
> > index 0000000000000..c07093bae253e
> > --- /dev/null
> > +++ b/include/dt-bindings/clock/samsung,exynos9610-cmu.h
> [ ... ]
> > @@ -0,0 +1,722 @@
> [ ... ]
> > +/* CMU_CMGP muxes */
> > +#define CLK_MOUT_CLK_CMGP_ADC=09=09=090
> > +#define CLK_MOUT_CLK_CMGP_I2C=09=09=091
> > +#define CLK_MOUT_CLK_CMGP_USI00=09=09=092
> > +#define CLK_MOUT_CLK_CMGP_USI01=09=09=093
> > +#define CLK_MOUT_CLK_CMGP_USI02=09=09=094
> > +#define CLK_MOUT_CLK_CMGP_USI03=09=09=095
> > +#define CLK_MOUT_CLK_CMGP_USI04=09=09=096
> > +
> > +/* CMU_CMGP dividers */
> > +#define CLK_DOUT_CLK_CMGP_ADC=09=09=090
> > +#define CLK_DOUT_CLK_CMGP_I2C=09=09=091
> > +#define CLK_DOUT_CLK_CMGP_USI00=09=09=092
> > +#define CLK_DOUT_CLK_CMGP_USI01=09=09=093
> > +#define CLK_DOUT_CLK_CMGP_USI02=09=09=094
> > +#define CLK_DOUT_CLK_CMGP_USI03=09=09=095
> > +#define CLK_DOUT_CLK_CMGP_USI04=09=09=096
>=20
> [Severity: High]
> Does this overlap in clock IDs cause a collision within the CMU_CMGP cloc=
k
> controller domain?
>=20
> Since both the muxes and dividers share the same IDs (0 through 6), it se=
ems
> one clock will overwrite the other in the provider's clock array. Will co=
nsumers
> requesting a divider receive the corresponding mux instead, breaking devi=
ce
> drivers that depend on CMGP clocks like the ADC, I2C, and USI?

I may not like LLMs, but this is a good catch. Will fix in v3.

> > +
> > +/* CMU_CMGP gates */
> > +#define CLK_GOUT_CMGP_CMU_PCLK=09=09=097
>=20
> --
> Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260716-exynos96=
10-clocks-v2-0-c13ce8ef1861@chimac.ro?part=3D1
>=20

Regards,
Alexandru Chimac <alex@chimac.ro>
