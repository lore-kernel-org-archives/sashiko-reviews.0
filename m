Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 26AF340681A;
	Thu,  3 Sep 2026 09:38:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788428337; cv=none; b=IZspdYY4jUzzf8GB4XAEWJ0VXD3z5vGgct5OBdJ055zbEo6PpG5renm9fPs4Vv1OdKzo+uA2zENRv1CdyiDWgstVyX52h8wwrkAArK4R4cvoRsX+w8Kh2+Opw/gXNW41B9BtR0gU0lqTBnZGXdwLflxjjKVRvB+4ep8XxYhfl5c=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788428337; c=relaxed/simple;
	bh=QpwwWvo3thnbQbO4vwKRkMl1prQ75G98ldfHHxW8dEY=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=u5bU9WnpsKw6Lf5oZ1eSsUNAxN4FMLHRGzVGVogDMKQs2toyM5lluRieBQMixdN13DTe9wWiTjUJPYxsxfGs8785gWq7fuzgRSS9f6T0Wmqvzh1nv9OIB10Foc57fQLbnbekn6HbhcCSLBw1XBvIei9t9JGgAaGp2QXunOZ82o4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=AtphVniZ; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="AtphVniZ"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id ADEB51F000E9;
	Thu,  3 Sep 2026 09:38:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1788428335;
	bh=tzQxeWzeNdmlQkAR5atfqpj+uPZkq6yJfgG7EvFcv/8=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=AtphVniZcnCz5edc25/iA2dVaXaNgr/jIT0mHpTYXEUr86XScUSqz+AzK1DnhQBGr
	 d0FJydNwJBcw0rJ+mE0WxYEUs2Uv4dNt0xCqfQ8ocwS70WJUzD94jtEyGuVSBGD2W3
	 JPfQb/JlxTss/mZCGj8qlRDPxeqHxiF9V31p1kVCeHdDDqyAAUZ9yyU79PsoyRsxje
	 W2WxfzdA+epzjUFY0dtApbPMZb7v9LFz8b6xf3pJLPsvp7fOO4VJz7nenAoFXVChl8
	 kck6HVtV5ByGKiHQGyaDjTcuz3LBJZNEsEwYgxtSLWW8ByeUmEWLHCuw0NCULS/hiu
	 K9kAuRLWJdJ3Q==
Date: Thu, 3 Sep 2026 10:38:51 +0100
From: Lee Jones <lee@kernel.org>
To: sashiko-reviews@lists.linux.dev
Cc: a0282524688@gmail.com, mfd@lists.linux.dev
Subject: Re: [PATCH v7 10/10] mfd: nct6694: Add Host Interface (HIF) eSPI
 transport driver
Message-ID: <20260903093851.GJ2133376@google.com>
References: <20260821033505.4017901-1-a0282524688@gmail.com>
 <20260821033505.4017901-11-a0282524688@gmail.com>
 <20260821035025.3E5EC1F000E9@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: sashiko-reviews@lists.linux.dev
List-Id: <sashiko-reviews.lists.linux.dev>
List-Subscribe: <mailto:sashiko-reviews+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:sashiko-reviews+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20260821035025.3E5EC1F000E9@smtp.kernel.org>

On Fri, 21 Aug 2026, sashiko-bot@kernel.org wrote:

> Thank you for your contribution! Sashiko AI review found 2 potential issue(s) to consider:
> - [High] Requesting a shared, oneshot threaded IRQ without a primary handler will be rejected by the IRQ core and degrade system performance if bypassed.
> - [High] The IRQ handler is unregistered after the IRQ domain is destroyed, creating a window for a Use-After-Free of the domain pointer during teardown.

These either need addressing or comments from you.

> --
> 
> --- Patch [10]: [PATCH v7 10/10] mfd: nct6694: Add Host Interface (HIF) eSPI transport driver ---
> commit fca991565f4ea259d4b5653b4e67f56e5a45bdd9
> Author: Ming Yu <a0282524688@gmail.com>
> 
> mfd: nct6694: Add Host Interface (HIF) eSPI transport driver
> 
> This commit adds support for the Host Interface (HIF) transport via eSPI
> for the Nuvoton NCT6694 peripheral expander. It initializes the Super-I/O
> and provides a regmap_bus implementation.
> 
> > diff --git a/drivers/mfd/nct6694-hif.c b/drivers/mfd/nct6694-hif.c
> > new file mode 100644
> > index 0000000000000..198838d3e7d87
> > --- /dev/null
> > +++ b/drivers/mfd/nct6694-hif.c
> [ ... ]
> > @@ -546,12 +546,12 @@ static int nct6694_hif_probe(struct platform_device *pdev)
> >  	platform_set_drvdata(pdev, nct6694);
> >  
> >  	/* Request the interrupt first so that devres releases it last */
> >  	ret = devm_request_threaded_irq(dev, irq, NULL, nct6694_hif_irq_handler,
> >  					IRQF_ONESHOT | IRQF_SHARED,
> >  					dev_name(dev), nct6694);
> 
> [Severity: High]
> Will this probe unconditionally fail with -EINVAL?
> 
> The IRQ subsystem typically rejects devm_request_threaded_irq() with
> IRQF_SHARED | IRQF_ONESHOT if there is no primary handler, because it cannot
> determine if the interrupt originated from this device before masking the
> shared line.
> 
> [Severity: High]
> Can this devres ordering lead to a use-after-free of nct6694->domain
> during driver unbind?
> 
> Because the threaded IRQ is requested before the core is probed, devres will
> release it last. During unbind, devres will execute actions in reverse order:
> 
> 1. nct6694_hif_irq_disable() executes, masking the interrupt but not clearing
>    pending status.
> 2. nct6694_hif_core_remove_action() executes, destroying the IRQ domain:
> 
> drivers/mfd/nct6694-core.c:nct6694_core_remove() {
>     ...
>     irq_domain_remove(nct6694->domain);
>     ...
> }
> 
> If another device sharing this IRQ line triggers an interrupt before devres
> finally unregisters this handler, won't nct6694_hif_irq_handler() execute,
> see a pending status, and dereference the freed nct6694->domain in
> irq_find_mapping()?
> 
> >  	if (ret)
> >  		return ret;
> >  
> >  	ret = nct6694_core_probe(dev, nct6694, nct6694_hif_devs,
> >  				 ARRAY_SIZE(nct6694_hif_devs));
> >  	if (ret)
> >  		return ret;
> 
> -- 
> Sashiko AI review · https://sashiko.dev/#/patchset/20260821033505.4017901-1-a0282524688@gmail.com?part=10

-- 
Lee Jones
