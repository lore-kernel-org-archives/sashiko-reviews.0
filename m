Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1B13543B6FA;
	Thu,  3 Sep 2026 09:03:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788426214; cv=none; b=ZD4YtKHk7z2PO1PDTOK2KaxtZh+YYne8dhOjFUMPYM5iDqWKVShOguqdzNRdBkY+JSRByXjA7fk8srxF6cwbDsIZMyiVWWUsgTyb+qFA6kF1noYrKUT7z1/9aHDx9+a6We79XQiKgwmWs8eDUtOt1WKgdMZzyXfFG32c/9OcPfU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788426214; c=relaxed/simple;
	bh=hRkjM0yzQ6WmrGWTntChxmZqt6ivRkc1XdsAK65SfVc=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=tfl2bS8eiTVQGY1qhvhMh6wRU+fHwjU5R6pEifkTNh4J/GTlrTNfwRGMaQcXof4SXOK5/5oMr3o8aPPPIySO2BFzjzrkpyeZQcLLqCQXXVFgF1zdDkwf0+rd/TVli+Fl5ooXXWmVx24Gx+ofYAxDxKoZ2Ngak69Ndz/Mz3eT1i4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=MsCiTxVV; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="MsCiTxVV"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id E94191F000E9;
	Thu,  3 Sep 2026 09:03:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1788426212;
	bh=sLnLys5bKsTRiofKBLQiGluhfjQKjyc41X0t9mJHY6E=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=MsCiTxVVZ17bbPc2qoWOKXByaQzFVWm1T40v3UKmC+mZXT4QOwjiczDWASfZO5bNm
	 rKLXaSMnI3+io2rcbTw0rXTNWz9hlyImlIpPisCax26MDYBySkXFTYOmB4TmpbwjbJ
	 hDC1qIEy9CXvhTd52b/Ms9XsngAjmWqx7dZkJ2aM2MZnVzPAaWia/AWSnDrAw6c9HR
	 BIqbfvtWJO2xAmzNmnFYXvh8Trvj3mV4dJFfAqX/o02LpglnRj+PJg9g2eX4hxkU7Z
	 eCK0QOnT0N8qc8Tlf3L7eISZ11Yig7u/wykA5RAyB6pBdxwRUtAI9VpcDYgRF1a01b
	 Mz/EyjHBblhMw==
Date: Thu, 3 Sep 2026 10:03:28 +0100
From: Lee Jones <lee@kernel.org>
To: Jerome Brunet <jbrunet@baylibre.com>
Cc: sashiko-bot@kernel.org, Mark Brown <broonie@kernel.org>,
	sashiko-reviews@lists.linux.dev, robh@kernel.org,
	mfd@lists.linux.dev, conor+dt@kernel.org,
	devicetree@vger.kernel.org
Subject: Re: [PATCH RESEND v6 4/5] mfd: axp20x: Add support for AXP318W PMIC
Message-ID: <20260903090328.GH2133376@google.com>
References: <20260812-axp318-regulator-v6-0-d6b84b55c000@baylibre.com>
 <20260812-axp318-regulator-v6-4-d6b84b55c000@baylibre.com>
 <20260812214019.CDF921F000E9@smtp.kernel.org>
 <1jldaafmpd.fsf@starbuckisacylon.baylibre.com>
 <20260813095600.GA1072730@google.com>
 <1j33wg6cpk.fsf@starbuckisacylon.baylibre.com>
 <20260827134235.GN770273@google.com>
 <1jld9j8pfg.fsf@starbuckisacylon.baylibre.com>
Precedence: bulk
X-Mailing-List: sashiko-reviews@lists.linux.dev
List-Id: <sashiko-reviews.lists.linux.dev>
List-Subscribe: <mailto:sashiko-reviews+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:sashiko-reviews+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <1jld9j8pfg.fsf@starbuckisacylon.baylibre.com>

On Wed, 02 Sep 2026, Jerome Brunet wrote:

> On jeu. 27 août 2026 at 14:42, Lee Jones <lee@kernel.org> wrote:
> 
> > On Fri, 14 Aug 2026, Jerome Brunet wrote:
> >
> >> On dim. 13 janv. 2008 at 11:56, Lee Jones <lee@kernel.org> wrote:
> >> 
> >> > On Thu, 13 Aug 2026, Jerome Brunet wrote:
> >> >
> >> >> On sam. 12 janv. 2008 at 23:40, sashiko-bot@kernel.org wrote:
> >> >> 
> >> >> > Thank you for your contribution! Sashiko AI review found 2 potential issue(s) to consider:
> >> >> > - [High] The corresponding regulator driver lacks support for
> >> >> > `AXP318_ID`, causing the `axp20x-regulator` child device probe to fail.
> >> >> 
> >> >> Funny sashiko did not pick up on this when v6 was first sent. This is an
> >> >> ordering problem. The regulator part should be applied before the mfd
> >> >> one.
> >> >> 
> >> >> I could reorder here but there is not much point since the 2 changes will
> >> >> land in different subsystems but it does bring a valid question:
> >> >> 
> >> >> Lee, Mark, are you OK with picking the patches indended for your
> >> >> subsystem or would you prefer that I split the series, regulator on one
> >> >> side, mfd on the other (with a dep on the regulator one, of course) ?
> >> >
> >> > Does this break existing devices or simply delay support for this new one?
> >> 
> >> Existing device are fine and untouched.
> >> 
> >> I've just checked and if someone tried to run without PATCH 5 (regulators),
> >> the main axp driver loads fine but the regulator part gives this
> >> 
> >> axp20x-regulator axp20x-regulator.0: Unsupported AXP variant: 8
> >
> > Can you not enforce the deps with Kconfig?
> 
> This is not a build problem so I do not think Kconfig will change
> anything here. There is no specific config per chip.
> 
> It is just a runtime ordering matter and not a problem. regulator and
> mfd are split so at some point the support is incomplete.
> 
> * MFD first, it is fine it just cant instantiate the regulator until it
>   lands. it is (mostly) useless without it, which is fine.
> * Regulator first. regulator will never be instanciate until MFD support
>   lands, just as useless.

Okay, this is normal.  So there are no deps between them?

-- 
Lee Jones
