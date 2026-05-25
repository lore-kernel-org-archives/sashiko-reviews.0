Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 128503D25D8;
	Mon, 25 May 2026 07:40:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779694830; cv=none; b=CCk9wdmMAV2b5Rk75aDVc8gx2n/aUMqF0gWh6NpvgTgeWcJnGSwq4DYKCiFhFYO6F8OT0KV30k4XwXn2rKGJHVlL+sbHCkEUANw5u7xht8MHZJFB9hD+aaPCnnrQJHatEU5fxShOGuh23zD3I8bNlkyzYcTjfHEbAeJgthbzVIA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779694830; c=relaxed/simple;
	bh=NitpJTpsU4iTB7ttiSnCvL8YhGwATiGgpx8vlLTHd9Y=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=dPw6I6E21RQaay2bGx8W4Ja7WOv2OKovAqJ2gALH4ISQ31tMfDTzqlYjm7uIrXAO92eLHSAVEEGPALPFcsOgggGB1dBR1OKQ0YtKKr4EKxVvYQxWzAmQxAFSzK4HMh5Om/Ic0ynrqRZNvUA/k7GI0uuJMte+s8leKjnFBPt4Dzs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=dd7ZusdE; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="dd7ZusdE"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 9E69A1F000E9;
	Mon, 25 May 2026 07:40:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1779694828;
	bh=6KgAXZkXOvwmzvcYp1FIbyCJkwjHnYjRp+Tlk2RC/CQ=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=dd7ZusdEFx9RAzIGuLzkoQZxfRRnxUKEhS8RQjzJJ9RTbv35BOLojxrerLCzOVNwk
	 psBOn9xfPeD0X9pgeKlGDh1Qhnixbl3pD/kpyyJ3E9v/COVdOigRtHtwpQJEHmw8tS
	 Whs4xBXdXP8LHMTa8FWSV/WAQoCcz7416s2pOpCfzOJBYtyzQ8vbN42YKOoc3pc91d
	 vX6NFH4qXKmN0kYkj3HUb192cXAUtVkItrw5icFAj1OHu9MHwlbuVv1gncnMFDV/mm
	 1DZASnCnEEtTM3XrlhRY81L/MIdKh9z1Bd8v47iEnwvVfzaTS9m3w7vKnRl/c4AXeg
	 BUQp5cG+CAiqg==
Date: Mon, 25 May 2026 00:40:27 -0700
From: Drew Fustini <fustini@kernel.org>
To: sashiko-reviews@lists.linux.dev
Cc: linux-kernel@vger.kernel.org
Subject: Re: [PATCH RFC v5 11/18] riscv_cbqri: resctrl: Add cache allocation
 via capacity block mask
Message-ID: <ahP868qBD5b-08Ng@gen8>
References: <20260524-ssqosid-cbqri-rqsc-v7-0-v5-11-78d3a7ba9dbe@kernel.org>
 <20260525005056.312281F000E9@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: sashiko-reviews@lists.linux.dev
List-Id: <sashiko-reviews.lists.linux.dev>
List-Subscribe: <mailto:sashiko-reviews+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:sashiko-reviews+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260525005056.312281F000E9@smtp.kernel.org>

On Mon, May 25, 2026 at 12:50:55AM +0000, sashiko-bot@kernel.org wrote:
> > @@ -595,6 +595,7 @@ config RISCV_ISA_SSQOSID
> >  	bool "Ssqosid extension support for supervisor mode Quality of Service ID"
> >  	depends on 64BIT
> >  	default n
> > +	select ARCH_HAS_CPU_RESCTRL
> 
> [Severity: High]
> Could this lead to build failures if the CBQRI driver is not enabled?
> 
> The Kconfig symbol RISCV_ISA_SSQOSID unconditionally selects
> ARCH_HAS_CPU_RESCTRL, which signals to the core kernel that the architecture
> provides the resctrl_arch_* interface. This permits CONFIG_RESCTRL_FS to be
> enabled.
> 
> However, since the implementation resides in drivers/resctrl/cbqri_resctrl.c
> which is only compiled when CONFIG_RISCV_CBQRI_DRIVER is set, enabling
> RISCV_ISA_SSQOSID and RESCTRL_FS without RISCV_CBQRI_DRIVER might cause
> linker errors due to undefined references to the resctrl_arch_* functions.
> Would it be safer to add a dependency on the driver?

The combination of SSQOSID=y RESCTRL_FS=y RISCV_CBQRI_DRIVER=n should
not be reachable.

> > +static int cbqri_resctrl_online_cpu(unsigned int cpu)
> > +{
> > +	struct cbqri_controller *ctrl;
> > +	int err = 0;
> > +
> > +	mutex_lock(&cbqri_domain_list_lock);
> > +
> > +	list_for_each_entry(ctrl, &cbqri_controllers, list) {
> > +		if (ctrl->type != CBQRI_CONTROLLER_TYPE_CAPACITY)
> > +			continue;
> > +		if (!cpumask_test_cpu(cpu, &ctrl->cache.cpu_mask))
> > +			continue;
> > +		if (!ctrl->alloc_capable)
> > +			continue;
> > +
> > +		err = cbqri_attach_cpu_to_cap_ctrl(ctrl, cpu);
> > +		if (err)
> > +			break;
> > +	}
> 
> [Severity: High]
> Does this loop leave the system in an inconsistent state if it fails partway
> through?

Yes, I will update v6 to track the last successfully attached controller
and walk the list backwards from there on error.

> Should we reset the per-CPU default closid and rmid when a CPU comes online?
>
> Does this missing notification leave the generic resctrl subsystem out of sync?

Yes to both. I will make v6 follow the same approach of x86
resctrl_arch_online_cpu().

Drew
