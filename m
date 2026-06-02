Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 72AE924E4C3;
	Tue,  2 Jun 2026 05:00:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1780376451; cv=none; b=XEB/UzBvXRD3ROtFPpsyM532s0fS0n96aCivUiKmCACGt0zNB6RwSlvreTVTIoKBTjLAxdPb12ty7y3woVzQ6VccBkgBNaU2wLlqFlBHKCdTF85VzSOIul094nGg1wy+8BIm0VqYKS+5oZhUwcP9rtvNzbDjF6h08C6qBeCdHIk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1780376451; c=relaxed/simple;
	bh=lDcJAzOeqoxyirEqgXqAVF1KX4qWnR/3dbT4e+6eQ+I=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=QLW38pImeOqH/QOaxX5P1h62e8HvMk6f1cUptjvPWNeLzwEy5vzVEZQPo+bTx0QeocMiaf0oe0+tCjgTIWbGUJWUXi5dEMsrRuKMQwKPrxF3gDkL83c+p5EJ6doPnPwtKLGmGvK6qN8XLpuO5ZbVEWXs/cH/FGdJeAk4S3dKz5c=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=VlhBxpi6; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="VlhBxpi6"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 26F721F00893;
	Tue,  2 Jun 2026 05:00:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1780376450;
	bh=wBkWJk8W2TpQaFD2Y4FUARE4rkZFHlehakL+Au601kM=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=VlhBxpi6n+2xthuTwdCl/0zkxTERLRunOQj+OLFETxw36uUWBpmUMRhlQ0eWoIMqZ
	 QEjV9PnZyynuW7kwlRhDTmSDSPJLw6vq9m9y/1kena7pBF3Sz0NFVBSAdHlwcpoHMU
	 TGmdUIg9VuXlcsAn9GXfeCVkgBt6RZok9odS5GlaVzPh+NkNB0Gbz9plbRJqH0KABC
	 QQb/rVTc0KzjjI4APbhDO+VRXytjC7ivlIwuWrVp3korwXAwQm8c/zBoL76u42u5Rb
	 YYm/X7hLEEFa6Z5pMn5F45AeAOXKQRXc+UmlYQrqWqeBx/01IbzUb+2DPxjrKyXwzE
	 ty1/v/OWXdK6g==
Date: Mon, 1 Jun 2026 22:00:49 -0700
From: Drew Fustini <fustini@kernel.org>
To: sashiko-reviews@lists.linux.dev
Cc: linux-kernel@vger.kernel.org
Subject: Re: [PATCH RFC v6 13/18] riscv_cbqri: resctrl: Add MB_MIN bandwidth
 allocation via Rbwb
Message-ID: <ah5jgXEHzQUEREV0@gen8>
References: <20260601-ssqosid-cbqri-rqsc-v7-0-v6-13-baf00f50028a@kernel.org>
 <20260601205717.7FDA51F00893@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: sashiko-reviews@lists.linux.dev
List-Id: <sashiko-reviews.lists.linux.dev>
List-Subscribe: <mailto:sashiko-reviews+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:sashiko-reviews+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260601205717.7FDA51F00893@smtp.kernel.org>

On Mon, Jun 01, 2026 at 08:57:17PM +0000, sashiko-bot@kernel.org wrote:
> > diff --git a/drivers/resctrl/cbqri_resctrl.c b/drivers/resctrl/cbqri_resctrl.c
> > index f379058b0114b..1d312004b07d9 100644
> > --- a/drivers/resctrl/cbqri_resctrl.c
> > +++ b/drivers/resctrl/cbqri_resctrl.c
> > @@ -363,6 +363,9 @@ int resctrl_arch_update_one(struct rdt_resource *r, struct rdt_ctrl_domain *d,
> >  	case RDT_RESOURCE_L2:
> >  	case RDT_RESOURCE_L3:
> >  		return cbqri_apply_cache_config_dom(dom, r, closid, t, cfg_val);
> > +	case RDT_RESOURCE_MB_MIN:
> > +		/* sum(Rbwb) <= MRBWB validation runs inside cbqri_apply_rbwb(). */
> > +		return cbqri_apply_rbwb(dom->hw_ctrl, closid, cfg_val, true);
> 
> [Severity: High]
> Does this code leak memory bandwidth capacity when a resctrl group is removed?
> 
> When a resctrl group is removed via rmdir, the CLOSID is freed by the core,
> but no architecture hook is invoked to reset the hardware or software cache.
> This means ctrl->rbwb_cache[closid] permanently retains the deleted group's
> bandwidth allocation.
> 
> Later, when cbqri_apply_rbwb() is called to modify bandwidth for any active
> group, it sums across all ctrl->rcid_count CLOSIDs, including the unallocated
> ones. The stranded bandwidth from deleted groups is included in the sum,
> causing new allocations to be rejected with -EINVAL.
> 
> Can an attacker with mkdir permissions repeatedly create groups, assign high
> bandwidth, and remove them, to permanently starve the default group and
> active processes?

Only root can create directories in /sys/fs/resctrl so I do not think
this is a practical concern.

> > @@ -422,9 +433,22 @@ u32 resctrl_arch_get_config(struct rdt_resource *r, struct rdt_ctrl_domain *d,
> >  	return val;
> >  }
> >  
> > +/*
> > + * RCID 0 carries the remaining MRBWB after every other RCID is seeded with
> > + * the minimum Rbwb of 1. cbqri_probe_bc() rejects a bandwidth controller
> > + * with mrbwb < rcid_count, so this subtraction cannot underflow.
> > + */
> > +static u64 cbqri_rcid0_rbwb(struct cbqri_controller *ctrl)
> > +{
> > +	if (WARN_ON_ONCE(ctrl->bc.mrbwb < ctrl->rcid_count))
> > +		return 1;
> > +	return ctrl->bc.mrbwb - (ctrl->rcid_count - 1);
> > +}
> 
> [Severity: High]
> Does this calculation cause unconditional initialization failure on systems
> where MRBWB exceeds U16_MAX?
> 
> The maximum reserved bandwidth blocks (mrbwb) is a 32-bit field in hardware
> capabilities, but cbqri_apply_rbwb() enforces a strict hardware limitation
> of 16 bits per RCID (rejecting values > U16_MAX).
> 
> If the global mrbwb exceeds 65535, this function returns a value exceeding
> U16_MAX, causing cbqri_apply_rbwb() to reject it with -EINVAL. This in turn
> causes domain initialization to fail, preventing CPUs from coming online
> with resctrl.

This is not a real issue. MRBWB can not exceeds U16_MAX.

> > @@ -439,15 +463,41 @@ void resctrl_arch_reset_all_ctrls(struct rdt_resource *r)
> >  		return;
> >  
> >  	list_for_each_entry(d, &r->ctrl_domains, hdr.list) {
> > -		for (i = 0; i < hw_res->ctrl->rcid_count; i++) {
> > -			for (t = 0; t < CDP_NUM_TYPES; t++) {
> > +		dom = container_of(d, struct cbqri_resctrl_dom,
> > +				   resctrl_ctrl_dom);
> > +
> > +		switch (r->rid) {
> > +		case RDT_RESOURCE_MB_MIN:
> > +			/*
> > +			 * CBQRI section 4.5: Rbwb >= 1, sum(Rbwb) <= MRBWB.
> > +			 * Walk N-1..1 first so RCID 0 lands last with the
> > +			 * remaining budget.
> > +			 */
> > +			for (i = 0; i < hw_res->ctrl->rcid_count; i++) {
> > +				u32 rcid = (i + 1) % hw_res->ctrl->rcid_count;
> > +				u64 rbwb = (rcid == 0) ?
> > +					cbqri_rcid0_rbwb(dom->hw_ctrl) : 1;
> >  				int rerr;
> >  
> > -				rerr = resctrl_arch_update_one(r, d, i, t, default_ctrl);
> > +				rerr = cbqri_apply_rbwb(dom->hw_ctrl, rcid, rbwb, false);
> >  				if (rerr)
> > -					pr_err_ratelimited("rid=%d reset RCID %u type %u failed (%d)\n",
> > -							   r->rid, i, t, rerr);
> > +					pr_err_ratelimited("RBWB reset RCID %u failed (%d)\n",
> > +							   rcid, rerr);
> 
> [Severity: High]
> Does this error handling violate the hardware bandwidth sum invariant?
> 
> If cbqri_apply_rbwb() fails for any RCID (such as an MMIO error), it logs
> the error but continues the loop, leaving that RCID at its previous
> (potentially large) bandwidth.
> 
> When it later blindly writes MRBWB - (N-1) to RCID 0 with check_sum = false,
> the total sum of all RCIDs in the hardware will exceed the hardware's MRBWB
> capacity. Could this violate the CBQRI invariant and potentially lock up the
> controller?

This is not a problem. The reset uses check_sum = false because the
intermediate sums during the walk legitimately exceed MRBWB, but the
hardware enforces sum(Rbwb) <= MRBWB itself. 

> > +	case RDT_RESOURCE_MB_MIN:
> > +		res->name = "MB_MIN";
> > +		res->schema_fmt = RESCTRL_SCHEMA_RANGE;
> > +		/*
> > +		 * resctrl requires a cache scope for MBA-style domains.
> > +		 * Use L3 as a proxy until the resctrl supports non-cache
> > +		 * scopes for bandwidth resources.
> > +		 */
> > +		res->ctrl_scope = RESCTRL_L3_CACHE;
> > +		/* Rbwb is an integer block count, not a percentage. No MBA delay_linear. */
> > +		res->membw.throttle_mode = THREAD_THROTTLE_UNDEFINED;
> > +		res->membw.min_bw = 1;
> > +		res->membw.max_bw = ctrl->bc.mrbwb;
> 
> Does setting max_bw to ctrl->bc.mrbwb expose an unclamped 32-bit maximum
> bandwidth to userspace?
> 
> If ctrl->bc.mrbwb exceeds U16_MAX, exposing this value to userspace allows
> requests that bypass core validation but will ultimately fail at the hardware
> layer in cbqri_apply_rbwb().

I will address this issue in the next revision.

> > +		res->membw.bw_gran = 1;
> > +		/*
> > +		 * CBQRI section 4.5 caps sum(Rbwb) <= MRBWB. Default new
> > +		 * groups to min_bw so mkdir cannot overflow that sum.
> > +		 */
> > +		res->membw.default_to_min = true;
> > +		res->alloc_capable = ctrl->alloc_capable;
> > +		INIT_LIST_HEAD(&res->ctrl_domains);
> > +		INIT_LIST_HEAD(&res->mon_domains);
> 
> [Severity: High]
> Does enabling MB_MIN cause massive memory allocation failures due to an
> unbounded max_rmid?
> 
> In cbqri_resctrl_accumulate_caps(), exposed_mon_capable is set to true if
> any hardware controller has mon_capable == true, which now includes the
> bandwidth controller backing MB_MIN.
> 
> However, max_rmid is conditionally bounded only by the L3 capacity
> controller. If the system has a monitor-capable bandwidth controller but no
> monitor-capable L3 capacity controller, max_rmid remains U32_MAX.
> 
> Later, resctrl_init() invokes rmid_init(), which attempts to allocate
> structures for U32_MAX RMIDs. This will fail with -ENOMEM and completely
> abort resctrl initialization.

I'll address this in the next rev.
> 
> > @@ -893,14 +1054,24 @@ static int cbqri_attach_cpu_to_all_ctrls(unsigned int cpu)
> >  	lockdep_assert_held(&cbqri_domain_list_lock);
> >  
> >  	list_for_each_entry(ctrl, &cbqri_controllers, list) {
> > -		if (ctrl->type != CBQRI_CONTROLLER_TYPE_CAPACITY)
> > -			continue;
> > -		if (!cpumask_test_cpu(cpu, &ctrl->cache.cpu_mask))
> > -			continue;
> > -		if (!ctrl->alloc_capable)
> > +		switch (ctrl->type) {
> > +		case CBQRI_CONTROLLER_TYPE_CAPACITY:
> > +			if (!cpumask_test_cpu(cpu, &ctrl->cache.cpu_mask))
> > +				continue;
> > +			if (!ctrl->alloc_capable)
> > +				continue;
> > +			err = cbqri_attach_cpu_to_cap_ctrl(ctrl, cpu);
> > +			break;
> > +		case CBQRI_CONTROLLER_TYPE_BANDWIDTH:
> > +			if (!cpumask_test_cpu(cpu, &ctrl->mem.cpu_mask))
> > +				continue;
> > +			if (!ctrl->alloc_capable)
> > +				continue;
> > +			err = cbqri_attach_cpu_to_bw_ctrl(ctrl, cpu);
> > +			break;
> > +		default:
> >  			continue;
> > -
> > -		err = cbqri_attach_cpu_to_cap_ctrl(ctrl, cpu);
> > +		}
> >  		if (err) {
> >  			cbqri_detach_cpu_from_all_ctrls(cpu);
> 
> [Severity: High]
> This is a pre-existing issue, but does cbqri_detach_cpu_from_l3_mon() have a
> use-after-free bug due to an unsafe cancel_delayed_work()?
> 
> If cbqri_detach_cpu_from_all_ctrls() eventually calls into
> cbqri_detach_cpu_from_l3_mon():
> 
> drivers/resctrl/cbqri_resctrl.c:cbqri_detach_cpu_from_l3_mon() {
>     ...
>             cancel_delayed_work(&mon_dom->cqm_limbo);
>             ...
>             kfree(mon_dom);
>     ...
> }
> 
> The CPU offline callback runs under cpus_write_lock(). If the worker has
> already dequeued from the workqueue but is preempted right before acquiring
> cpus_read_lock(), cancel_delayed_work() returns false and does not wait.
> 
> The callback then proceeds to kfree(mon_dom). When the hotplug callback
> finishes and releases the write lock, the worker acquires the read lock and
> dereferences the freed mon_dom pointer, resulting in a use-after-free.

I don't believe this a problem.

Drew
