Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793790002;
	b=wpqbmPQvCfsNHUxrYPyKwSZBVLPnWPHsd4Ihq0UhfQCsnE3Z/MMEgquu6Dib70pFzcMD
	 iRFjTa1f2eShOPsT/aRPUsAQBX3jLw3oubqkwCJusKULnYVeooUSa0BIMSipP+hLVmEkR
	 pANyOZVUVfjPwPu7Si9UVoOEZCPXvjYb+No0lF+x41l+UGsaTuae2T3cUl07oU2crBnFy
	 K+QxO1QxIbQKLaXaJFHJiNswB/XC5+SPWZN8WYSaZRptKX4fo7wApq1jtBe2G5LIQ6taj
	 0EbNKip3D5p4/TYSoWhh68Z0tVRPY7Sy8M3I89IJDQIVLN/SyAay4DlyUsO2OG1JiXg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793790002;
	h=Received:DKIM-Signature:Date:From:To:Cc:Subject:Message-ID:
	 References:MIME-Version:Content-Type:Content-Disposition:
	 Content-Transfer-Encoding:In-Reply-To;
	bh=cB2w1+qKKQFylbHEBDV4N2TN2a0KFOcG2YteZ514jGU=;
	b=BxFp19xWx5+t9IxsWZgcLdyYEfocKjh77u2mabvxFF37Oh5tnLtKyvAo1UxwFBSh0Nkj
	 M5P1GP0GF7SesgN8tsd5Fc52+0z8+G/5jxWkXJKNeS9uxQy71gBJaK4wJvlRaQKePFmgf
	 l1g2Tcd3wh2d9min2Fve1b8noKkAXyaStlD2q/J0a/wkvMJWVhHRF2030n1dKuK11XWkU
	 gxOHBz9r4KUop3BX0LaKSYRngMU26MKhkNtduC+HwcwgU/ujbpOyfOjwsSgTxuTRt0hAy
	 gT6WLWBQ0T7eyrZiWGwHIuYSZuzxLf2WzuXuOnWpu2l2l/SrSJ37ieUvdedNe2VnT+A==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=mKoQw8rA;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5B559606A33D;
	Wed,  4 Nov 2026 11:00:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=mKoQw8rA
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 205711F000C1;
	Wed,  4 Nov 2026 11:00:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1793790001;
	bh=cB2w1+qKKQFylbHEBDV4N2TN2a0KFOcG2YteZ514jGU=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=mKoQw8rAFrF6PDRMdaZpwnRsPP+xnZGdK/clVO8/6Km7MqFqGo530fMrLkNQ2FaSb
	 DUgpI9hdBqJer/hGMUuq6csopofktGraPBChjaZYb9Ck7BEbokvq9NmN7oun99Cz3y
	 LvnBAd68tB5GDh1RBqOgUeCLlH2PoYwDpBfiuuTGiYtv+IxrXJMX3aOzlfpAnuD+Ay
	 sA89765l28yINk4fyJuIfSlP4PKetd4cVLL8dTuDh1vyzhkeRisjDYyOVI8ifGRqNG
	 IH9lYRT/pf60azdD5NlM9MPSC25MSjJKEh3LB5vA3e0ubV4hJtjmnmIGjlWJ06skSW
	 q7srF80ToFYDw==
Date: Wed, 4 Nov 2026 10:59:57 +0000
From: Lee Jones <lee@kernel.org>
To: sashiko-reviews@lists.linux.dev
Cc: Olivier Louvignes <olivier@mgcrea.io>, mfd@lists.linux.dev
Subject: Re: [PATCH 2/7] mfd: axp20x: Add support for the AXP2101
Message-ID: <20261104105957.GJ792264@google.com>
References: <20261023100401.67592-1-olivier@mgcrea.io>
 <20261023100401.67592-3-olivier@mgcrea.io>
 <sashiko-outbox-182663@kernel.org>
X-Mailing-List: sashiko-reviews@lists.linux.dev
List-Id: <sashiko-reviews.lists.linux.dev>
List-Post: <mailto:sashiko-reviews@lists.linux.dev>
List-Help: <mailto:sashiko-reviews+help@lists.linux.dev>
List-Subscribe: <mailto:sashiko-reviews+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:sashiko-reviews+unsubscribe@lists.linux.dev>
List-Owner: <mailto:sashiko-reviews+owner@lists.linux.dev>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <sashiko-outbox-182663@kernel.org>

On Fri, 23 Oct 2026, sashiko-bot@kernel.org wrote:

> Thank you for your contribution! Sashiko AI review found 1 potential issue(s) to consider:
> - [Low] mfd: axp20x: axp2101_cells array is missing static const qualifier

Yes, I think it should.

> --
> 
> commit 4362cae65ca6638f0bab6f82e4bb84e80e901bf4
> Author: Olivier Louvignes <olivier@mgcrea.io>
> 
> mfd: axp20x: Add support for the AXP2101
> 
> This commit adds AXP2101 PMIC support to the axp20x MFD driver, including its
> register map, IRQ definitions, power-off handling, and MFD cells for the
> regulators, USB power supply, and battery charger.
> 
> > diff --git a/drivers/mfd/axp20x.c b/drivers/mfd/axp20x.c
> > index 50df66de24e06..b87d7ef5ba455 100644
> > --- a/drivers/mfd/axp20x.c
> > +++ b/drivers/mfd/axp20x.c
> 
> [ ... ]
> 
> > @@ -1061,6 +1137,21 @@ static struct mfd_cell axp313a_cells[] = {
> >  	MFD_CELL_RES("axp313a-pek", axp313a_pek_resources),
> >  };
> >  
> > +static const struct resource axp2101_usb_power_supply_resources[] = {
> > +	DEFINE_RES_IRQ_NAMED(AXP2101_IRQ_VBUS_PLUGIN, "VBUS_PLUGIN"),
> > +	DEFINE_RES_IRQ_NAMED(AXP2101_IRQ_VBUS_REMOVAL, "VBUS_REMOVAL"),
> > +};
> > +
> > +/* No driver handles its fuel gauge yet. */
> > +static struct mfd_cell axp2101_cells[] = {
> > +	MFD_CELL_NAME("axp20x-regulator"),
> > +	MFD_CELL_OF("axp20x-usb-power-supply",
> > +		    axp2101_usb_power_supply_resources, NULL, 0, 0,
> > +		    "x-powers,axp2101-usb-power-supply"),
> > +	MFD_CELL_OF("axp20x-battery-power-supply",
> > +		    NULL, NULL, 0, 0, "x-powers,axp2101-battery-power-supply"),
> > +};
> 
> [Severity: Low]
> Since axp2101_cells in drivers/mfd/axp20x.c is never modified at probe or
> runtime and is only assigned to axp20x->cells (const struct mfd_cell *) in
> axp20x_match_device(), should it be declared as static const struct mfd_cell
> so that it is placed in read-only memory?
> 
> -- 
> Sashiko AI review · https://sashiko.dev/#/patchset/20261023100401.67592-1-olivier@mgcrea.io?part=2

-- 
Lee Jones
