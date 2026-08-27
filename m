Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 904662AD3F;
	Thu, 27 Aug 2026 13:52:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787838741; cv=none; b=OAzqz74jimw/2rbgGUUxvdcIk3AsPeBYZ73jpZO3jiRX2dRgKMSYxrKVtvkRyfQKoMZGZPG2HqiOeuzZ2yHSkBrSavBV/vWTeAF4o2HNWJ1M9qnyyeANPa06vy0E8EHp9s2CSfxbHqPFvSycHJjGLP1LoI3jrteFGJU5wOjAEVg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787838741; c=relaxed/simple;
	bh=By0h1sP0w8Rq74uOCgeAPi06TnAexEHqyPuuicHI4ck=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=GvqA86hIstizq1VO+jszx7CLV5IA++xfrzWXlRqaqwByD6wrxHaDsELGZj6OemK1DM67c+HsZfM4Psds2BviSwDm3HSto+z8W7kCr7YT5aWm7O6qL5kLpl5V/jEYwHvhaSMSTndvme0opuzuIq2pHIumKLUpTHeb0EsXOvDVyBE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=StEcf15B; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="StEcf15B"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 6A36D1F000E9;
	Thu, 27 Aug 2026 13:52:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1787838739;
	bh=4Iq2AuTIR3wQCkIceeUDiwZMzX1gHQrm8WEOPB2X7TE=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=StEcf15BUi3qvP3AcskflupGV0hOM3gMaGOoAdYTm4zIwoyMk63xo9cuwZS4dmkKy
	 eIySkklqzcbWqZq1aJXJcteHUFLkpZXSPGFVgFMrPd0Fw5aTFeXKzIHZWM3wCh2hzA
	 Lbo/cfx2HPQKeX8iDu4pUA/96qYJtVY2A+0ehJo/yZuLm1qAsSJ4b1072umBE8it6F
	 miyVfGBoBjZJS7ol7zXLBO06r0JZQPoZ84SMr5c6zbzt9k+HyErJuRXT0fCM654zoB
	 xqlGbZxC+wc765F+qigv7qIZ9jnoqUaIcgAblr87yTcwEyuUlZIDaLCCvx9dxGClR+
	 rOSuvHcoA4+7w==
Date: Thu, 27 Aug 2026 14:52:15 +0100
From: Lee Jones <lee@kernel.org>
To: sashiko-reviews@lists.linux.dev
Cc: =?utf-8?B?0JbQsNC80LHQsNC60LjQtdCyINCg0LDQtNC40Lkg0KDQuNC60LDRgNC00Lg=?=
	=?utf-8?B?0L3QvtCy0LjRhw==?= <r.zhambakiev@prosoftsystems.ru>,
	mfd@lists.linux.dev
Subject: Re: [PATCH v2 3/4] mfd: tps65217: Fix irq_domain leak and
 use-after-free on probe failure
Message-ID: <20260827135215.GO770273@google.com>
References: <20260821123712.260443-1-r.zhambakiev@prosoftsystems.ru>
 <20260821123712.260443-4-r.zhambakiev@prosoftsystems.ru>
 <20260821125049.5551A1F00A3D@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: sashiko-reviews@lists.linux.dev
List-Id: <sashiko-reviews.lists.linux.dev>
List-Subscribe: <mailto:sashiko-reviews+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:sashiko-reviews+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20260821125049.5551A1F00A3D@smtp.kernel.org>

On Fri, 21 Aug 2026, sashiko-bot@kernel.org wrote:

> Thank you for your contribution! Sashiko AI review found 3 potential issue(s) to consider:
> 
> New issues:
> - [High] Race condition and Use-After-Free in the probe error path due to manual IRQ domain destruction while the parent IRQ is still active.

Please review, explain or fix the Sashiko review(s).

If this is a set, this request includes the other patches too.

> Pre-existing issues:
> - [High] Dynamic modification of a shared global static MFD cell array violates MFD subsystem rules and permanently breaks multi-device bindings.
> - [High] Missing validation of `irq_find_mapping()` return value in the interrupt handler causes a kernel oops on unmapped interrupts.
> --
> 
> --- Patch [3]: [PATCH v2 3/4] mfd: tps65217: Fix irq_domain leak and use-after-free on probe failure ---
> commit 1b4bb1d20ba45fa2a7614a8ca5d0feae60617511
> Author: Жамбакиев Радий Рикардинович <r.zhambakiev@prosoftsystems.ru>
> Date:   Fri Aug 21 12:37:23 2026 +0000
> 
>     mfd: tps65217: Fix irq_domain leak and use-after-free on probe failure
>     
>     This commit moves the chip revision read ahead of IRQ initialization and
>     adds a cleanup helper to dispose of IRQ mappings and remove the irq_domain
>     if probe fails. It calls this cleanup helper from the devm_request_threaded_irq
>     and devm_mfd_add_devices error paths.
> 
>     Cc: stable@vger.kernel.org
> 
> > diff --git a/drivers/mfd/tps65217.c b/drivers/mfd/tps65217.c
> > index 9a1528456ffc2..d535d140c2e94 100644
> > --- a/drivers/mfd/tps65217.c
> > +++ b/drivers/mfd/tps65217.c
> > @@ -146,6 +146,24 @@ static const struct irq_domain_ops tps65217_irq_domain_ops = {
> >  	.map = tps65217_irq_map,
> >  };
> >  
> > +static void tps65217_irq_cleanup(struct tps65217 *tps)
> > +{
> > +	unsigned int virq;
> > +	int i;
> > +
> > +	if (!tps->irq_domain)
> > +		return;
> > +
> > +	for (i = 0; i < TPS65217_NUM_IRQ; i++) {
> > +		virq = irq_find_mapping(tps->irq_domain, i);
> 
> [Severity: High]
> This is a pre-existing issue, but irq_find_mapping() can return 0 if a mapping
> does not exist.
> 
> If a spurious interrupt fires or an interrupt fires during teardown after
> mappings are disposed:
> 
> drivers/mfd/tps65217.c:tps65217_irq_thread() {
>     ...
>     handle_nested_irq(irq_find_mapping(tps->irq_domain, i));
>     ...
> }
> 
> Could this pass 0 to handle_nested_irq() and cause a kernel oops when
> irq_to_desc(0) returns NULL?
> 
> Should the return value of irq_find_mapping() be checked in
> tps65217_irq_thread() before passing it to handle_nested_irq()?
> 
> > +		if (virq)
> > +			irq_dispose_mapping(virq);
> > +	}
> > +
> > +	irq_domain_remove(tps->irq_domain);
> > +	tps->irq_domain = NULL;
> > +}
> 
> [ ... ]
> 
> > @@ -337,6 +356,13 @@ static int tps65217_probe(struct i2c_client *client)
> >  		return ret;
> >  	}
> >  
> > +	ret = tps65217_reg_read(tps, TPS65217_REG_CHIPID, &version);
> > +	if (ret < 0) {
> > +		dev_err(tps->dev, "Failed to read revision register: %d\n",
> > +			ret);
> > +		return ret;
> > +	}
> > +
> >  	if (client->irq) {
> >  		ret = tps65217_irq_init(tps, client->irq);
> >  		if (ret)
> 
> [Severity: High]
> This is a pre-existing issue, but this code block mutates the shared global
> tps65217s array just below the lines modified in this diff:
> 
> drivers/mfd/tps65217.c:tps65217_probe() {
>     ...
>     if (client->irq) {
>         ret = tps65217_irq_init(tps, client->irq);
>         if (ret)
>             return ret;
>     } else {
>         int i;
> 
>         /* Don't tell children about IRQ resources which won't fire */
>         for (i = 0; i < ARRAY_SIZE(tps65217s); i++)
>             tps65217s[i].num_resources = 0;
>     }
>     ...
> }
> 
> Since tps65217s is shared module data, will any subsequent probe of a
> TPS65217 device inherit this mutated state and fail to register its IRQ
> resources, even if an IRQ is provided?
> 
> MFD guidelines require cell arrays to be static const. Should this state
> be handled dynamically instead of mutating the static array?
> 
> > @@ -354,13 +380,7 @@ static int tps65217_probe(struct i2c_client *client)
> >  				   tps->irq_domain);
> >  	if (ret < 0) {
> >  		dev_err(tps->dev, "mfd_add_devices failed: %d\n", ret);
> > -		return ret;
> > -	}
> > -
> > -	ret = tps65217_reg_read(tps, TPS65217_REG_CHIPID, &version);
> > -	if (ret < 0) {
> > -		dev_err(tps->dev, "Failed to read revision register: %d\n",
> > -			ret);
> > +		tps65217_irq_cleanup(tps);
> 
> [Severity: High]
> If devm_mfd_add_devices() fails, tps65217_irq_cleanup() manually destroys
> tps->irq_domain and sets it to NULL.
> 
> Since the parent IRQ was registered via devm_request_threaded_irq() earlier
> in probe, it remains active until devres frees it after tps65217_probe()
> returns.
> 
> If an interrupt fires in this window, could tps65217_irq_thread() locklessly
> read the NULL domain, pass it to irq_find_mapping(), and potentially lead
> to a kernel oops?
> 
> Should the IRQ be explicitly disabled (e.g., via disable_irq()) before
> cleaning up the domain?
> 
> >  		return ret;
> >  	}
> 
> -- 
> Sashiko AI review · https://sashiko.dev/#/patchset/20260821123712.260443-1-r.zhambakiev@prosoftsystems.ru?part=3

-- 
Lee Jones
