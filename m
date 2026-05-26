Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 067683F44D7;
	Tue, 26 May 2026 11:49:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779796196; cv=none; b=bzJ2s/tkW4+3Xx55bY8So7GFFYdTQlctjBJYbrg5KK9UmjKe7kIYOyRkD9RYvmim7U2OP+u3lz5LRxH2oWkMGZBtlxICnnclnL3N9BE6vsNmnvDGK+coBcxKvQut6jr1CmyicwFKjLJU6LtQ27kGRVMFamKdQAoYJjnZ6EMVw5o=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779796196; c=relaxed/simple;
	bh=e20GfM5BgxeuCwgFaRSu5ZbXhAzg3qJfYAw8UDRhSeQ=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=s9UASfFPm2FGZnEeGM+QptvaRoWm2D84uGtp0WXvGQEHocjY9rBNpOb+PSEGp5ZRQ4YT1oE9II1nGxcSDno0eYM/HPF2MXt0CbUtIM/U0seH0urIyMJ7AJTgmI2h1jiHt/Z30L7rBs4NY1tkKZhnwp8gVf3Ja3ZVB784KGluAUA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=os3vYw/c; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="os3vYw/c"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 880E81F000E9;
	Tue, 26 May 2026 11:49:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1779796190;
	bh=Oewj5HcYFK330eHXz8BZaJZwpIxMbMvNQI+V2GTRPwM=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=os3vYw/cWkAeVF6aBK4nxTyzE23JEpd2jQpFYZ/4kM+4LhsR/b0ZbbP+eu/HUygMV
	 UbqEiWoJDWUpgbEhWQu+SBCMAoaAMPn1EMrIRtL7BwQkpFt9Gn7rcttq+gtVJRP4ko
	 Ra0KRcma8hXaZMt+3gEPWWU4KiF7poAAlroT0gJZFWRxNKQIsj+ihhsG0oGwognahS
	 YGBZaKcWUUzls/q90DlMdC0F8c7JBH5Pd8VIz62iiJAhD1if2hAeYAbiFJ9mgqhfq+
	 XL+OgaOkbu53juNjoB7IwzCyDgblL4Vt9bOkh8PNuXxOFaVaZkwcN4QTWnuCt/pSPK
	 1ohwYV2yjKaxw==
Date: Tue, 26 May 2026 13:49:43 +0200
From: Drew Fustini <fustini@kernel.org>
To: sashiko-reviews@lists.linux.dev
Cc: linux-kernel@vger.kernel.org
Subject: Re: [PATCH RFC v5 12/18] riscv_cbqri: resctrl: Add L3 cache
 occupancy monitoring
Message-ID: <ahWI1-6bIvAYvdxJ@gen8>
References: <20260524-ssqosid-cbqri-rqsc-v7-0-v5-12-78d3a7ba9dbe@kernel.org>
 <20260525004606.D82941F000E9@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: sashiko-reviews@lists.linux.dev
List-Id: <sashiko-reviews.lists.linux.dev>
List-Subscribe: <mailto:sashiko-reviews+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:sashiko-reviews+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260525004606.D82941F000E9@smtp.kernel.org>

On Mon, May 25, 2026 at 12:46:06AM +0000, sashiko-bot@kernel.org wrote:
> > resctrl_arch_reset_rmid() re-arms CONFIG_EVENT with EVT_ID=Occupancy.
> > CONFIG_EVENT both resets the counter to 0 and selects the event, so
> > re-arming with the same event keeps the MCID counting after reset rather
> > than relying on sticky-last-event semantics that the CBQRI register
> > definition does not guarantee.
> 
> Does the resctrl core actually invoke resctrl_arch_reset_rmid() for Occupancy
> events?
> 
> The resctrl core only invokes resctrl_arch_reset_rmid() individually for MBM
> events during mon_event_read() (when rr->first is true). For
> QOS_L3_OCCUP_EVENT_ID, mon_event_read() is never called with first = true,
> and the recycle path (__check_limbo()) only reads the counter without
> resetting. 
> 
> Will this cause the Occupancy counter to stop functioning when an RMID is
> recycled since it is never re-armed?

I will drop the Occupancy case from resctrl_arch_reset_rmid() and update
the commit message. resctrl_arch_reset_rmid_all() will still handles
bulk resets.

> >  static struct cbqri_resctrl_res cbqri_resctrl_resources[RDT_NUM_RESOURCES];
> >  
> > +/*
> > + * Per-event controller table. Only events CBQRI can back occupy a
> > + * slot, so other events do not bloat the array.
> > + */
> > +#define CBQRI_MAX_EVENT QOS_L3_OCCUP_EVENT_ID
> > +static struct cbqri_controller *cbqri_resctrl_counters[CBQRI_MAX_EVENT + 1];
> 
> Is this array necessary?
> 
> The patch introduces this per-event controller array and populates it in
> cbqri_resctrl_pick_counters(), but it appears to be unused.
> resctrl_arch_rmid_read() dynamically resolves the controller via
> cbqri_find_ctrl_domain() instead.

I will drop cbqri_resctrl_counters[] and the corresponding
cbqri_resctrl_pick_counters() write. resctrl_arch_rmid_read() finds the
controller via cbqri_find_ctrl_domain() and hw_dom->paired_bc.

> > @@ -500,6 +630,14 @@ static int cbqri_resctrl_control_init(struct cbqri_resctrl_res *cbqri_res)
> >  		res->alloc_capable = ctrl->alloc_capable;
> >  		INIT_LIST_HEAD(&res->ctrl_domains);
> >  		INIT_LIST_HEAD(&res->mon_domains);
> > +
> > +		if (ctrl->mon_capable && res->rid == RDT_RESOURCE_L3) {
> > +			res->mon_scope = RESCTRL_L3_CACHE;
> > +			res->mon.num_rmid = ctrl->mcid_count;
> 
> [Severity: Medium]
> Will this expose an inflated number of RMIDs to userspace if subsequent
> controllers have fewer MCIDs?
> 
> cbqri_resctrl_accumulate_caps() calculates max_rmid as the system-wide
> minimum mcid_count across all controllers, which bounds internal
> resctrl allocations. 
> 
> However, res->mon.num_rmid is initialized here using only the first
> controller's mcid_count. If a subsequent controller has a smaller mcid_count,
> could this cause userspace to receive unexpected "Out of RMIDs" errors when
> creating groups?

I will fix this bug in the next revision.

> > +static void cbqri_detach_cpu_from_l3_mon(struct rdt_resource *res,
> > +					 unsigned int cpu)
> > +{
> > +	struct rdt_l3_mon_domain *mon_dom, *tmp;
> > +
> > +	lockdep_assert_held(&cbqri_domain_list_lock);
> > +
> > +	list_for_each_entry_safe(mon_dom, tmp, &res->mon_domains, hdr.list) {
> > +		if (!cpumask_test_cpu(cpu, &mon_dom->hdr.cpu_mask))
> > +			continue;
> > +		cpumask_clear_cpu(cpu, &mon_dom->hdr.cpu_mask);
> > +		if (cpumask_empty(&mon_dom->hdr.cpu_mask)) {
> > +			cancel_delayed_work(&mon_dom->cqm_limbo);
> > +			if (resctrl_is_mon_event_enabled(QOS_L3_MBM_TOTAL_EVENT_ID))
> > +				cancel_delayed_work(&mon_dom->mbm_over);
> > +			resctrl_offline_mon_domain(res, &mon_dom->hdr);
> > +			list_del(&mon_dom->hdr.list);
> > +			kfree(mon_dom);
> 
> [Severity: High]
> Can this cause a use-after-free if the delayed work is executing?

Yes, I need to fix this in the next rev. 

Drew
