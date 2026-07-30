Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4FC39222597;
	Thu, 30 Jul 2026 02:09:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785377366; cv=none; b=BOcmPYdRj62s/ih/chjGYTiifGczJ0z6/QVmPXaJLdCwGNCu863tBvVX7uAKW/544ggf+sB/qpe73X3GvvHwgVdPR8B06ohzbzyse+VgFLVxwyCiVhiMTOE5GzTDqG9gegBvkWCwY+dXl2quIBRp3csd3rVWMivuPIWQtuFRb7w=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785377366; c=relaxed/simple;
	bh=+7apY1NOvAIndpyoqKS9iB2fvXPYfS9wh/46ya+PYiI=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=e9BkBvq2oPS7j/omK6IjD/IEgPk2OTGmpY5nrxZ5CA7Pcq76yPlXGNj/hgabwhnD9uFA+52oiNXCBgEY+XIaUwksjcAmiFh2GkchuMxruA7TYoTmtnUvxSnVLNZoReoKJEF8EBKW8VdGqIki3sjhEOvyZnG1Cl4NgQVAlHkeFuM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=D477bWzR; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="D477bWzR"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id D0C9C1F000E9;
	Thu, 30 Jul 2026 02:09:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1785377364;
	bh=rC7XJL1MEmVzJmoF0ZyVUyVyMkq3ME78sp4/7MgIVyE=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=D477bWzRDA4+HkK5wu0NO4fz1pwMbc7oirxhk+GVTNm37ZRPFU28XYT3XoLqrqETq
	 kUtdDc/Wg5tKmoOdXCEANRbWGXudFhXFC/BpPHISvWQZlnhPVUAgXvMymxj4rh4Yv1
	 f01rTeJRoxGkHWRRWIF056XiJpRVnq1SS+c9oAJIYSuVCufXptYM1buqk2w7R7clsl
	 3dGOtCDpBUiZ0bqpK4SKHrLU8vwD0g/XhBG7tqdZo8XmpNYX0JzYzXj3uEZLb63cEK
	 Hj0kcglDHPO3g9ewf4nfsoLacriMwccx3mtHNdD4418kHW+V50SySDa7YHfkcM3AGu
	 V/RqpMcMbzKiQ==
Date: Wed, 29 Jul 2026 19:09:23 -0700
From: Drew Fustini <fustini@kernel.org>
To: sashiko-reviews@lists.linux.dev
Cc: linux-riscv@lists.infradead.org, linux-kernel@vger.kernel.org,
	x86@kernel.org
Subject: Re: [PATCH v6 5/8] riscv_cbqri: resctrl: Add cache allocation via
 capacity block mask
Message-ID: <amqyUyUaUVRtH4Og@x1>
References: <20260729-dfustini-atl-sc-cbqri-dt-v6-0-7c22b05d461b@kernel.org>
 <20260729-dfustini-atl-sc-cbqri-dt-v6-5-7c22b05d461b@kernel.org>
 <20260730012722.A77E71F000E9@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: sashiko-reviews@lists.linux.dev
List-Id: <sashiko-reviews.lists.linux.dev>
List-Subscribe: <mailto:sashiko-reviews+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:sashiko-reviews+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260730012722.A77E71F000E9@smtp.kernel.org>

On Thu, Jul 30, 2026 at 01:27:22AM +0000, sashiko-bot@kernel.org wrote:
> Thank you for your contribution! Sashiko AI review found 1 potential issue(s) to consider:
> - [High] Capacity controllers registered after boot bypass capability validation, which can cause resctrl failures and hardware writes with out-of-bounds parameters.
> --
> 
> --- Patch [5]: [PATCH v6 5/8] riscv_cbqri: resctrl: Add cache allocation via capacity block mask ---
> commit b95a917a4c4e682ec805c748e42c4a7bedae47b2
> Author: Drew Fustini <fustini@kernel.org>
> 
>     riscv_cbqri: resctrl: Add cache allocation via capacity block mask
> 
> This commit wires CBQRI capacity controllers into resctrl as RDT_RESOURCE_L2
> and RDT_RESOURCE_L3 schemata. It handles domain creation during the cpuhp
> online callback for offline CPUs, and defines context-switch and capability
> checks for RISC-V.
> 
> > diff --git a/drivers/resctrl/cbqri_resctrl.c b/drivers/resctrl/cbqri_resctrl.c
> > index 0000000000000..0c4bfa2a7f433
> > --- /dev/null
> > +++ b/drivers/resctrl/cbqri_resctrl.c
> [ ... ]
> > +static int cbqri_attach_cpu_to_all_ctrls(unsigned int cpu)
> > +{
> > +	static const u32 levels[] = { 2, 3 };
> > +	struct cbqri_controller *ctrl, *c;
> > +	struct cbqri_resctrl_res *hw_res;
> > +	struct rdt_ctrl_domain *d;
> > +	struct cacheinfo *ci;
> > +	int i, rid;
> [ ... ]
> > +		/* The controller backing this CPU's cache at this level. */
> > +		ctrl = NULL;
> > +		list_for_each_entry(c, &cbqri_controllers, list) {
> > +			if (c->type == CBQRI_CONTROLLER_TYPE_CAPACITY &&
> > +			    c->alloc_capable &&
> > +			    c->cache.cache_level == levels[i] &&
> > +			    c->cache.cache_id == ci->id) {
> > +				ctrl = c;
> > +				break;
> > +			}
> > +		}
> > +		if (!ctrl)
> > +			continue;
> > +
> > +		d = cbqri_find_ctrl_domain(&hw_res->resctrl_res.ctrl_domains,
> > +					   ci->id);
> > +		if (d) {
> > +			cpumask_set_cpu(cpu, &d->hdr.cpu_mask);
> > +			continue;
> > +		}
> > +
> > +		d = cbqri_create_ctrl_domain(ctrl, &hw_res->resctrl_res, cpu,
> > +					     ci->id);
> 
> [Severity: High]
> Does this code allow a late-registered controller to bypass the capability
> validation?
> 
> During boot, cbqri_resctrl_pick_caches() validates that all controllers at a
> given cache level have identical capabilities (like ncblks and rcid_count)
> using cbqri_cc_caps_agree().
> 
> However, in the CPU hotplug path, if a new cache controller is probed
> after boot, cbqri_attach_cpu_to_all_ctrls() finds it and creates a
> domain without verifying it matches the baseline hw_res->ctrl.

This is not a problem as there is no path that registers a controller
after boot.

Drew
