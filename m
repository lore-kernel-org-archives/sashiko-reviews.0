Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D5E4E3515D6;
	Thu, 27 Aug 2026 13:42:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787838160; cv=none; b=hUTnjOsEOeNpv8MAxpmeaaGJuQs9L51h6vtZtXp1Ywi8qnKg8EqB817JRnzyGuS69jyHZymAlBXRRhyPwhZqm6v0wBL+eqkLqm/q9+r4DffmITIkXcpG1aUrmI2VSKoLQOgUkuOSndryc3dpR3zZtMmbnhtffGCblxnosc/GCWY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787838160; c=relaxed/simple;
	bh=xe1CZsAvd5Nq5l/fok0ta53MNzxV2VToxAiFMkpBL2I=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=BoRtuk2ucd1ibbbxn5YNjrLroVbYpFKsK/ySDXnOoK8Vdm7GGNqH7vAlSELc1AzZ8TwxGZ3GgbSkCnLnWcKWJMkORGuZ2NXUDK7pFuI+scFqu8eoDZpeJys51DlsfhO11YcEbOH9f+smrjIpNYI34+RDggOBRSW2+AN+5EOS49k=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=H5VKWu0l; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="H5VKWu0l"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id BDC9A1F000E9;
	Thu, 27 Aug 2026 13:42:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1787838159;
	bh=sBv9iEZo6l85AKyt8o4k3+fBgY61bCbpkMe6Pz/qcIQ=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=H5VKWu0laRUZ2P+Q6/d5Ql+0z2gjeETBRdiT1K6vvWwBUZBXg95b6t+rmEDmyveHY
	 YQWs7/IAdRm7mIBqSdeOPdX9ysCwFAg8vrberZKKYLgd/QJZGTh+47C+aWrNX+hn6U
	 1hbLx+BbFDmsno2xLSFLhumzQkzBGvpY47QdfC/aIX6s33RtydACrrrf/zU2ZfPSES
	 OyL2L7ZnKtmBocbruBwxgvVdHNzSmCl/W1Ni3t8IBgLiCo+BhU7zUYB0uM6INMfxaS
	 noxrH1t2lfNDwSCmoRnIPK+xV5wV/DXoybdzd+d9ry7SB8OYX+EB8I5xHQBR7VDpKH
	 pUHpP0VnSxEgA==
Date: Thu, 27 Aug 2026 14:42:35 +0100
From: Lee Jones <lee@kernel.org>
To: Jerome Brunet <jbrunet@baylibre.com>
Cc: sashiko-bot@kernel.org, Mark Brown <broonie@kernel.org>,
	sashiko-reviews@lists.linux.dev, robh@kernel.org,
	mfd@lists.linux.dev, conor+dt@kernel.org,
	devicetree@vger.kernel.org
Subject: Re: [PATCH RESEND v6 4/5] mfd: axp20x: Add support for AXP318W PMIC
Message-ID: <20260827134235.GN770273@google.com>
References: <20260812-axp318-regulator-v6-0-d6b84b55c000@baylibre.com>
 <20260812-axp318-regulator-v6-4-d6b84b55c000@baylibre.com>
 <20260812214019.CDF921F000E9@smtp.kernel.org>
 <1jldaafmpd.fsf@starbuckisacylon.baylibre.com>
 <20260813095600.GA1072730@google.com>
 <1j33wg6cpk.fsf@starbuckisacylon.baylibre.com>
Precedence: bulk
X-Mailing-List: sashiko-reviews@lists.linux.dev
List-Id: <sashiko-reviews.lists.linux.dev>
List-Subscribe: <mailto:sashiko-reviews+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:sashiko-reviews+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <1j33wg6cpk.fsf@starbuckisacylon.baylibre.com>

On Fri, 14 Aug 2026, Jerome Brunet wrote:

> On dim. 13 janv. 2008 at 11:56, Lee Jones <lee@kernel.org> wrote:
> 
> > On Thu, 13 Aug 2026, Jerome Brunet wrote:
> >
> >> On sam. 12 janv. 2008 at 23:40, sashiko-bot@kernel.org wrote:
> >> 
> >> > Thank you for your contribution! Sashiko AI review found 2 potential issue(s) to consider:
> >> > - [High] The corresponding regulator driver lacks support for
> >> > `AXP318_ID`, causing the `axp20x-regulator` child device probe to fail.
> >> 
> >> Funny sashiko did not pick up on this when v6 was first sent. This is an
> >> ordering problem. The regulator part should be applied before the mfd
> >> one.
> >> 
> >> I could reorder here but there is not much point since the 2 changes will
> >> land in different subsystems but it does bring a valid question:
> >> 
> >> Lee, Mark, are you OK with picking the patches indended for your
> >> subsystem or would you prefer that I split the series, regulator on one
> >> side, mfd on the other (with a dep on the regulator one, of course) ?
> >
> > Does this break existing devices or simply delay support for this new one?
> 
> Existing device are fine and untouched.
> 
> I've just checked and if someone tried to run without PATCH 5 (regulators),
> the main axp driver loads fine but the regulator part gives this
> 
> axp20x-regulator axp20x-regulator.0: Unsupported AXP variant: 8

Can you not enforce the deps with Kconfig?

> Seems sane enough if the regulator part is not present (and no board
> using it has landed yet)
> 
> To completly avoid this, the ID would need to be in its own patch,
> then the regulators, finally the MFD. It seems like an unecessary churn
> but I can do that if you prefer.

-- 
Lee Jones
