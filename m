Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 89E403FC5C1;
	Tue,  2 Jun 2026 17:35:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1780421741; cv=none; b=BdCEP/LMJmjzFopQEKvK7kE/ji0CYA3E2pfN+Y96TCeEw1vexnezq3Ci6+UvhfTWIm+BMznMeLGZ2IrI7BJ5Iy+YBfjisLD2X6DaEU+kTBmvDEH7xjBefL5mJfGTEURZKwO8He4GyCxk3Z/KrWGEn5n0i/X0xyuruhPI2dajgow=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1780421741; c=relaxed/simple;
	bh=hAVCgVMsUH36PqmlREmHCi6f/cTGgYb0ZmnFXZiFjLA=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=pvmk4hbt/+Ww7AUl5xJk/POPdk/1vMtN/ZFfPqEM4jOnJ6QIZWQtfFM64rnALCMk2e9i3jBYwerNn9ld887Qyzb96PE4jIM0K+jrEn8LSG3D1R9yguKN9d6KlUWG+tVrENwHehAtcZ/He2CVwL2k1gutf3RXO3rQUb+M5B6hJY4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=UVM0hYG5; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="UVM0hYG5"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 34D971F00893;
	Tue,  2 Jun 2026 17:35:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1780421740;
	bh=6iOKCxrF+VwVFlLhu2aGZMzAZ5aG4XD13YMUU1/MUkk=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=UVM0hYG5LJxcPfg11/K4mMyi4KkFbaSUD7VSvddD4WUy5Yn+mozloZ+Lyuby1T03R
	 SgZVj5HgRz3TfDUCUR0xMhgBC+2RC2TuI6aSZQDmncjTseT2YUT+KxNd2FMJd4ymbx
	 UdCpdlexvLL3nNcwPR3afQRa9wdnvD1k5ZpE4UMbfZ0tgSs1PeRl9hrtI2rPscwOER
	 bFE3xrG7NXYywUM5U1LkEnhrl+iXh4DFsjaBaNSeAr4ayggljJajYSYoK6pnrvSnTk
	 GiqWtmGhHn+KMWzDVceweTRpaOAAuShHDOM2i2k8ikpC4CNj6JcxhfrhFfLs+XPLRu
	 RySPgwmVnkogQ==
Date: Tue, 2 Jun 2026 10:35:39 -0700
From: Drew Fustini <fustini@kernel.org>
To: sashiko-reviews@lists.linux.dev
Cc: linux-kernel@vger.kernel.org
Subject: Re: [PATCH RFC v6 14/18] riscv_cbqri: resctrl: Add MB_WGHT bandwidth
 allocation via Mweight
Message-ID: <ah8Ua/oX9fWlO5lf@x1>
References: <20260601-ssqosid-cbqri-rqsc-v7-0-v6-14-baf00f50028a@kernel.org>
 <20260601205734.76D021F00893@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: sashiko-reviews@lists.linux.dev
List-Id: <sashiko-reviews.lists.linux.dev>
List-Subscribe: <mailto:sashiko-reviews+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:sashiko-reviews+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260601205734.76D021F00893@smtp.kernel.org>

On Mon, Jun 01, 2026 at 08:57:34PM +0000, sashiko-bot@kernel.org wrote:
> > +	case RDT_RESOURCE_MB_WGHT: {
> > +		u64 mweight;
> > +
> > +		err = cbqri_read_mweight(ctrl, closid, &mweight);
> 
> [Severity: High]
> This isn't a bug introduced by this patch, but the newly added
> cbqri_read_mweight() called here duplicates a pre-existing flaw.
> 
> Can this corrupt data by writing to staging registers before ensuring the
> hardware is not busy?
> 
> In cbqri_read_mweight(), the driver interacts with the hardware by writing to a
> staging register, writing a control register, and waiting for the BUSY flag to
> clear.
> 
> If a previous operation times out (such as the 1ms limit in
> cbqri_wait_busy_flag()), the driver returns -EIO and releases ctrl->lock, but
> the hardware might still be processing.
> 
> The next caller acquires the lock and immediately calls cbqri_set_bc_bw_alloc()
> to read-modify-write the staging register before cbqri_bc_alloc_op() verifies
> the BUSY flag is 0.
> 
> Would modifying the staging register of an in-flight hardware operation cause
> undefined behavior, misconfiguration, or WPRI field corruption?

This is not a problem:

 - cbqri_apply_bc_field() waits for BUSY = 0 before staging so there is
   no corruption on the apply path.
 - cbqri_bc_alloc_op() waits at entry, so a staging write only lands
   during BUSY on an already-faulted controller.
 - cbqri_set_bc_bw_alloc() stages both fields from the caches, so there
   is no unmodified field to corrupt. 

> > +static void cbqri_detach_cpu_from_one_bw_res(struct cbqri_controller *ctrl,
> > +					     enum resctrl_res_level rid,
> > +					     unsigned int cpu)
> > +{
> > +	struct cbqri_resctrl_res *hw_res = &cbqri_resctrl_resources[rid];
> > +	struct rdt_resource *res = &hw_res->resctrl_res;
> > +	struct rdt_ctrl_domain *domain;
> > +	int dom_id = ctrl->mem.prox_dom;
> > +
> > +	lockdep_assert_held(&cbqri_domain_list_lock);
> > +
> > +	if (!hw_res->ctrl)
> > +		return;
> > +
> > +	domain = cbqri_find_ctrl_domain(&res->ctrl_domains, dom_id);
> > +	if (!domain || !cpumask_test_cpu(cpu, &domain->hdr.cpu_mask))
> > +		return;
> > +
> > +	cpumask_clear_cpu(cpu, &domain->hdr.cpu_mask);
> > +	if (cpumask_empty(&domain->hdr.cpu_mask)) {
> > +		resctrl_offline_ctrl_domain(res, domain);
> 
> This isn't a bug introduced by this patch, but the newly added
> cbqri_detach_cpu_from_one_bw_res() replicates a broken lock ordering.
> 
> Could this lead to an AB-BA deadlock between rdtgroup_mutex and
> cbqri_domain_list_lock?
> 
> If a user reading a monitor data file triggers rdtgroup_mondata_show(), it
> acquires rdtgroup_mutex, then calls mon_event_read() ->
> resctrl_arch_rmid_read(), which acquires cbqri_domain_list_lock.
> 
> Concurrently, when a CPU is taken offline, cbqri_resctrl_offline_cpu()
> acquires cbqri_domain_list_lock, then calls cbqri_detach_cpu_from_all_ctrls()
> -> cbqri_detach_cpu_from_one_bw_res(). If the domain becomes empty, it calls
> resctrl_offline_ctrl_domain(), which attempts to acquire rdtgroup_mutex.
> 
> Would these two paths race and cause a permanent AB-BA deadlock?

This is not a problem. cpu_hotplug_lock serializes the two lock orderings:

 - Every rdtgroup_mutex -> cbqri_domain_list_lock path runs under
   cpus_read_lock
 - The cbqri_domain_list_lock -> rdtgroup_mutex path is the cpuhp
   online/offline callback under cpus_write_lock.

Those are mutually exclusive, so the orders never overlap.
> 
> > +		list_del(&domain->hdr.list);
> > +		kfree(container_of(domain, struct cbqri_resctrl_dom,
> > +				   resctrl_ctrl_dom));
> 
> [Severity: High]
> This is a pre-existing issue, but the new cbqri_detach_cpu_from_one_bw_res()
> replicates it here.
> 
> Can this result in a Use-After-Free on the res->ctrl_domains list?
> 
> VFS read paths in fs/resctrl (like rdtgroup_schemata_show()) traverse the
> res->ctrl_domains list using list_for_each_entry while holding only
> rdtgroup_mutex.
> 
> When the CPU mask becomes empty, resctrl_offline_ctrl_domain() is called above,
> which takes and releases rdtgroup_mutex. After it returns, list_del() and
> kfree() are executed without holding rdtgroup_mutex or using RCU primitives.
> 
> Could a concurrent list traversal under rdtgroup_mutex dereference the freed
> domain pointer and crash?

This is not a problem:

 - The VFS readers of res->ctrl_domains hold cpus_read_lock in addition
   to rdtgroup_mutex
 - The detach that does list_del() and kfree() is the cpuhp offline
   callback under cpus_write_lock.  
 - They cannot run concurrently so list_del()/kfree() is fine.

Drew
