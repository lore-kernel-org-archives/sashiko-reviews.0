Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 077363368AB;
	Thu, 30 Jul 2026 02:11:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785377477; cv=none; b=DDf4unet3F9FlVW2ip4kJZDH8+bg9daX6PAr+NG1R/iSOKR+DwSE+zRDqfAA7/wfFNsCvYWIna8ECIOJaE1XDgbDQjiyiL9L4qLnctgO08IOTVPJVWtZmV23sU/2TCWc59k6QZSC69qBSeNssSSpM59mIRFBIqDsfm9blEc9puA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785377477; c=relaxed/simple;
	bh=e/Af/nzBfE7LqO8K1ft310x0aNlG5g3YC2nn5TzID7Q=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=jSy5Q9qW9nQco9VsuGvZwEuBN3oqhJ9E+hi9V+52mZu1gQedEOumxXE7DmuxdLeNKQnh2PYFa7QOWraB0Khv9nkYDKYebPVJDzutkoeMCT9auK+OzFB1nGAmt3DKrO5NoKc5KKYYbbsTGPy7VzaMvcx0q8rdUDBs6W+J4XCOXVg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=C950DDBy; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="C950DDBy"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 8E0B01F000E9;
	Thu, 30 Jul 2026 02:11:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1785377475;
	bh=aNuc4Ik3xOnyGP9BZ+ZsPjNIOV0G0RbYnsDe9E+gi9Q=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=C950DDBygp5ooMNkiSpyVSvI43pUyVmN2Pq2i7Y7AkkA/B5P1MckOnDYJTiqnaa47
	 aUf2erAc8hGT4xbIdaRPbg9o7rMsCzcAJ9xlm3e5kaWqimSQZZj7XAQci+flS5lKT9
	 WVlDAeXCzKNhK8b8OS786Lks6zTfLRBRqt9jkMMbZNSqKeNhX3CkjkdXdy5gxY8KK1
	 5IH6PhkdpeH7d7fhhfSacZqlygyVA91TLky/zu2cFRuF45WjC2neDHYTEDqPHFmzrz
	 3yP9FRU15M2cbDYIwZAoZmwv4TnfLq8yDJYyM96s+znEfN8RoWFkhJFrYogfTkJW2U
	 rr78cbDG9I8rQ==
Date: Wed, 29 Jul 2026 19:11:14 -0700
From: Drew Fustini <fustini@kernel.org>
To: sashiko-reviews@lists.linux.dev
Cc: linux-riscv@lists.infradead.org, linux-kernel@vger.kernel.org,
	x86@kernel.org
Subject: Re: [PATCH v6 8/8] riscv_cbqri: Add CBQRI capacity allocation
 platform driver
Message-ID: <amqywoRHZO9xKD+V@x1>
References: <20260729-dfustini-atl-sc-cbqri-dt-v6-0-7c22b05d461b@kernel.org>
 <20260729-dfustini-atl-sc-cbqri-dt-v6-8-7c22b05d461b@kernel.org>
 <20260730012125.2DA611F000E9@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: sashiko-reviews@lists.linux.dev
List-Id: <sashiko-reviews.lists.linux.dev>
List-Subscribe: <mailto:sashiko-reviews+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:sashiko-reviews+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260730012125.2DA611F000E9@smtp.kernel.org>

On Thu, Jul 30, 2026 at 01:21:24AM +0000, sashiko-bot@kernel.org wrote:
> Thank you for your contribution! Sashiko AI review found 1 potential issue(s) to consider:
> - [Medium] The probe function unconditionally fails if the `riscv,cbqri-rcid` device tree property is missing, which breaks support for monitoring-only capacity controllers.
> --
> 
> --- Patch [8]: [PATCH v6 8/8] riscv_cbqri: Add CBQRI capacity allocation platform driver ---
> commit 954af62b51bb07d376a8671fb6db032a2ae482bc
> Author: Drew Fustini <fustini@kernel.org>
> 
> riscv_cbqri: Add CBQRI capacity allocation platform driver
> 
> This commit adds a device-tree platform driver for the RISC-V CBQRI capacity
> controller. It binds to the "riscv,cbqri-capacity-controller" compatible,
> determines the cache domain, and registers the controller with the resctrl
> framework.
> 
> > diff --git a/drivers/resctrl/cbqri_capacity.c b/drivers/resctrl/cbqri_capacity.c
> > new file mode 100644
> > index 0000000000000..0670a676bdb1f
> > --- /dev/null
> > +++ b/drivers/resctrl/cbqri_capacity.c
> [ ... ]
> > +static int cbqri_capacity_probe(struct platform_device *pdev)
> > +{
> [ ... ]
> > +	res = platform_get_resource(pdev, IORESOURCE_MEM, 0);
> > +	if (!res)
> > +		return -EINVAL;
> > +
> > +	ret = of_property_read_u32(dev->of_node, "riscv,cbqri-rcid", &rcid_count);
> > +	if (ret) {
> > +		dev_err(dev, "missing riscv,cbqri-rcid\n");
> > +		return ret;
> > +	}
> 
> [Severity: Medium]
> Will this unconditionally failing check prevent monitoring-only controllers
> from probing?
> 
> The core registration logic in riscv_cbqri_register_cc_dt() indicates that
> monitoring-only controllers do not need an RCID count.
> 
> However, by returning an error when the riscv,cbqri-rcid property is absent,
> the driver appears to reject valid monitoring-only controllers before they
> can be registered.
> 
> Would it be better to treat this property as optional and default rcid_count
> to 0 if it is missing?

This series only implements allocation, so there is no monitoring-only
controller to describe yet.

Drew
