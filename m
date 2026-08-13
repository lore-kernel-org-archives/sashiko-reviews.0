Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1E78243D4FA;
	Thu, 13 Aug 2026 09:56:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1786614966; cv=none; b=oPFnN35hJu2F/ruIPbPP4n5RXLqQObX8/uccPIhAJpLEvpBMdOvH/dFcLKmQ2OzjJQWJrwcv4+Cz9UnQhr8Fs4EXcfeFxyPTAF30ciXJ89PioUy3FzTZs6nR1FhYL2wogFjQDHY+Ey/JknMsU7LRRrBBXj9aMq6iLGJwRci6Ozs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1786614966; c=relaxed/simple;
	bh=Q5UrNWP2cgzd9JwQj0u8Wlpr2r4pBGqbcj9N5hEn2XQ=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=fSMyvSyzbXvv04WUlqwr+p3y8/Hk7v7S/43iwkAqfsNh7cnCDVdPx9MVuWxnLLRbumRqLy+eh3zQufYDKqMW+rL2ZwzPrd/e4cqpeplkdT5LKUohfJuJ+ORzSrAMXaToGJBQrwguAbb7ledyq3JD7yAJiRgH4H2bc6a7OITcnlo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=Iuplm4bl; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="Iuplm4bl"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id C97361F000E9;
	Thu, 13 Aug 2026 09:56:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1786614964;
	bh=k7IRT7w488lOfR9xkeYXBX2k2JLbjwVizA4fzP0b7UI=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=Iuplm4blHS2c8/DcK3dPZ84Lb9r9AaJdZIf04Sd1H84ArTJvE5rlfZTiFJMmbaeIu
	 wyExIBXnR/cya7T2jDLkmkZJFmaluDJUbgcSaoGRjRJ4wnmN4waylUVPbBzKiIIB5M
	 274tr+T64x9X3N5eLeBsbKUTYnEhatPykRzyFlC4fNaUXZj+dhQMwjI09vNUp+Rt4m
	 O/FkDadodLP06MVUp9mQ2XgREtJeGFU5aEzkn3sTHRgFCAbOWfeTxiWojQDLX4vW8I
	 dsPZBLz2Ci49soTnctPyjLbjyldC5KO3vKCmTJaC5HOuSMXJ96IhFRIfuLZUd1+ZFY
	 HlMS6hw/NUfEQ==
Date: Thu, 13 Aug 2026 10:56:00 +0100
From: Lee Jones <lee@kernel.org>
To: Jerome Brunet <jbrunet@baylibre.com>
Cc: sashiko-bot@kernel.org, Mark Brown <broonie@kernel.org>,
	sashiko-reviews@lists.linux.dev, robh@kernel.org,
	mfd@lists.linux.dev, conor+dt@kernel.org,
	devicetree@vger.kernel.org
Subject: Re: [PATCH RESEND v6 4/5] mfd: axp20x: Add support for AXP318W PMIC
Message-ID: <20260813095600.GA1072730@google.com>
References: <20260812-axp318-regulator-v6-0-d6b84b55c000@baylibre.com>
 <20260812-axp318-regulator-v6-4-d6b84b55c000@baylibre.com>
 <20260812214019.CDF921F000E9@smtp.kernel.org>
 <1jldaafmpd.fsf@starbuckisacylon.baylibre.com>
Precedence: bulk
X-Mailing-List: sashiko-reviews@lists.linux.dev
List-Id: <sashiko-reviews.lists.linux.dev>
List-Subscribe: <mailto:sashiko-reviews+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:sashiko-reviews+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <1jldaafmpd.fsf@starbuckisacylon.baylibre.com>

On Thu, 13 Aug 2026, Jerome Brunet wrote:

> On sam. 12 janv. 2008 at 23:40, sashiko-bot@kernel.org wrote:
> 
> > Thank you for your contribution! Sashiko AI review found 2 potential issue(s) to consider:
> > - [High] The corresponding regulator driver lacks support for `AXP318_ID`, causing the `axp20x-regulator` child device probe to fail.
> 
> Funny sashiko did not pick up on this when v6 was first sent. This is an
> ordering problem. The regulator part should be applied before the mfd
> one.
> 
> I could reorder here but there is not much point since the 2 changes will
> land in different subsystems but it does bring a valid question:
> 
> Lee, Mark, are you OK with picking the patches indended for your
> subsystem or would you prefer that I split the series, regulator on one
> side, mfd on the other (with a dep on the regulator one, of course) ?

Does this break existing devices or simply delay support for this new one?

-- 
Lee Jones
