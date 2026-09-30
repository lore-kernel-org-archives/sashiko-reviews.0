Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5C8523BBFBB
	for <sashiko-reviews@lists.linux.dev>; Wed, 30 Sep 2026 11:52:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790769156; cv=none; b=bqZFkTPj6+GefdYm/xMmjl5qvnegnTKcBX0p/xcAOvuiNkNWOiXdo1RQ0w4Gog6EkYJ7WR6lRB7pQKD+yVVn3Yez3sMaDbwusySnov4jqE0qdDqtoOV7E9U5LcQro3HxrGOR8fQjOizEV0EM+lhyJpp6UOYUv8LeJbkbmZOy1Mk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790769156; c=relaxed/simple;
	bh=jQf4RzOrnvTtopAWomEgffIVtp1dfdQKMMT2a4t41s4=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=iCZWitxfRlAwcDhlufuuC1IKch3S9SqHm5cpbllimwjwlkq2DCYAs3AYlKm3tgLc/Lgn7ZUcD1jbtuCioSCf5pTO4s+prxIplSjw/OR5yMUIWZwB9HJOAC6LU8nOyhSryFb90k3hdNP0oULV8MgmQTylqgIciTDqoZBWdKcr5EE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=mDJ1jVtY; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="mDJ1jVtY"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 4994B1F000FF;
	Wed, 30 Sep 2026 11:52:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1790769155;
	bh=gxYxNZzDeVuaR0kHtBi1lxp+gKcX+Q3q3h7snJzMS2c=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=mDJ1jVtYKrylk9FoBnzYRGNnYzm9Qqb1imba6IhnOdaM+Mx5qbZKZ66MWevBJUXuh
	 EuR6olQr9kMQU+xj1D1/mNQz0kizmN7a8j6b8yTfhkwdO6SGfncWcJu+gkDyu0XMdW
	 yXf+PP3G7jJGFzmK2UOgPbZcf8BP1WhGC6qabkYoN5EplmUV/2owDCvCmimwFTSCKm
	 EbqEkX6Rh140cf4tQyinjV2/NANSyC88mhmL+FSvnzI5Hv+egKns6ewHdemR1hfSfR
	 ou1rwVHC/xRyNubpzDlJSnV0O5T0BDi0aqqV1ygC2bd7a8BghOZAM9a/rxGIs8uTVE
	 itQb47Gg8njXA==
Date: Wed, 30 Sep 2026 12:53:05 +0100
From: Jean-Philippe Brucker <jpb@kernel.org>
To: sashiko-reviews@lists.linux.dev
Cc: Ryan Roberts <ryan.roberts@arm.com>, dri-devel@lists.freedesktop.org
Subject: Re: [RFC PATCH v1 3/8] misc/arm-cla: Probe firmware-described devices
Message-ID: <20260930115305.GC480985@myrica>
References: <20260717104759.123203-1-ryan.roberts@arm.com>
 <20260717104759.123203-4-ryan.roberts@arm.com>
 <20260717105709.172911F000E9@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: sashiko-reviews@lists.linux.dev
List-Id: <sashiko-reviews.lists.linux.dev>
List-Subscribe: <mailto:sashiko-reviews+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:sashiko-reviews+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260717105709.172911F000E9@smtp.kernel.org>

On Fri, Jul 17, 2026 at 10:57:08AM +0000, sashiko-bot@kernel.org wrote:
> > diff --git a/drivers/misc/arm-cla/cla-topology.c b/drivers/misc/arm-cla/cla-topology.c
> > --- /dev/null
> > +++ b/drivers/misc/arm-cla/cla-topology.c
> 
> [ ... ]
> 
> > +struct cla_domain *cla_dev_domain_get(struct cla_dev *dev)
> > +{
> > +	int ret;
> > +	unsigned int domain_id;
> > +	struct cla_domain *domain;
> > +
> > +	/* Domain ID is provided by firmware */
> > +	ret = of_property_read_u32(dev->dev->of_node, "domain", &domain_id);
> > +	if (WARN_ON(ret))
> > +		return ERR_PTR(-EINVAL);
> > +
> > +	domain = xa_load(&cla_domains, domain_id);
> > +	if (domain) {
> > +		domain->nr_devs++;
> > +		domain->devs = krealloc_array(domain->devs, domain->nr_devs,
> > +					      sizeof(*domain->devs), GFP_KERNEL);
> 
> [Severity: High]
> Does this code leak the original domain->devs array if krealloc_array() fails
> and returns NULL?

Yes, needs fix

> Also, since domain->nr_devs was unconditionally incremented,
> will a subsequent call to cla_domains_finalise() dereference the NULL
> pointer at domain->devs[j]?

No subsequent call

> 
> > +		if (!domain->devs)
> > +			return ERR_PTR(-ENOMEM);
> > +		domain->devs[domain->nr_devs - 1] = dev;
> > +		return domain;
> > +	}
> > +
> > +	domain = cla_domain_alloc(dev, domain_id);
> > +	if (IS_ERR(domain))
> > +		return domain;
> > +
> > +	cla_nr_domains = max(domain_id + 1, cla_nr_domains);
> 
> [Severity: Medium]
> Can this calculation overflow to 0 if firmware provides a domain_id of
> UINT_MAX? If it overflows, will cla_domains_finalise() skip its loop and
> leave the device uninitialized in the lookup tables?

FW does not provide UINT_MAX as domain ID

