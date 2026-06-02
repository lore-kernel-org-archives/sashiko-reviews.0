Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6DC7519D89E;
	Tue,  2 Jun 2026 21:09:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1780434555; cv=none; b=NABh6Fpz1UEzA8ZqFc/nl0pbnkrr1r8vto75GdVj0Nue3x381UdFDsq/M8sr/Aob/wyGkS3+TLZHSz3S8To5T+TLpq1BsH6/3Jw75LF8hJ25HVrSnf4w0RIaMLEYXgDkEsAh317Vsz911sMvpTvkI3xEiR/ThhTWCPVKB8N+YIs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1780434555; c=relaxed/simple;
	bh=0rL/3VRirg5ODbcnOGuyiX7i6mSlhGh3R2znObiaOmg=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=Xk+dITq9BCHm/KTGBMPUG3WWptmxiQrjT/LCEcvf1l0By2bYSy9h1e1s4400wXq0A7qn1/dvHFJP0p6n9mJGPlDXK4iCUvWDOjeFEYE1Z8dtAAEe6LMSd3VNaOMiAuXxPptcgFulOcZg+oP912p1AEPfBYxuFLHnBGj/oqnXyxk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=dlh8n3i3; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="dlh8n3i3"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 2D5311F00893;
	Tue,  2 Jun 2026 21:09:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1780434554;
	bh=jPW4+bDCMwDt1HiLGDLDGJ2r3CAgguA/gXZ5VD5duAU=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=dlh8n3i3W5Z9OiSocXyW3M2GIKcrsUtq4UJVs46xn59FUZl5mQNbX0Btoib20KSKv
	 4xIBbwKDqTpvsYbfOHVjFk0mItNTZDrpXQjF75tNa5LZgmVCkFvJr5E8edlijqUVCS
	 upmJBVbkfchuDsTHLVGqg80nso85vwTOa2CLNM3zHdVCaTEPbVVHxZM6YRQk5neqRv
	 2HHkGnDEp6bDjZbHDMkI4QygERjftoSsBJjBa41ApQ5ZhBr33J8lRSFEcFu07v+l7H
	 Tgo73E1CDWwjrHDLjUHjsWK7/LB29+/Hg0AvZ7U3fio/TSPX4HT9zzNx39jdXAOfHb
	 eyFm0mtsIr/HA==
Date: Tue, 2 Jun 2026 14:09:12 -0700
From: Drew Fustini <fustini@kernel.org>
To: sashiko-reviews@lists.linux.dev
Cc: devicetree@vger.kernel.org, robh@kernel.org, conor+dt@kernel.org
Subject: Re: [PATCH RFC v6 15/18] riscv_cbqri: resctrl: Add mbm_total_bytes
 bandwidth monitoring
Message-ID: <ah9GeBlzrrL/C3kL@x1>
References: <20260601-ssqosid-cbqri-rqsc-v7-0-v6-15-baf00f50028a@kernel.org>
 <20260601210114.88F1B1F00893@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: sashiko-reviews@lists.linux.dev
List-Id: <sashiko-reviews.lists.linux.dev>
List-Subscribe: <mailto:sashiko-reviews+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:sashiko-reviews+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260601210114.88F1B1F00893@smtp.kernel.org>

On Mon, Jun 01, 2026 at 09:01:14PM +0000, sashiko-bot@kernel.org wrote:
> > @@ -184,17 +191,67 @@ void resctrl_arch_mon_event_config_write(void *info)
> >  void resctrl_arch_reset_rmid(struct rdt_resource *r, struct rdt_l3_mon_domain *d,
> >  			     u32 unused, u32 rmid, enum resctrl_event_id eventid)
> >  {
> > +	struct cbqri_resctrl_dom *hw_dom;
> > +	struct rdt_ctrl_domain *cd;
> > +
> > +	if (irqs_disabled())
> > +		return;
> > +
> > +	mutex_lock(&cbqri_domain_list_lock);
> 
> [Severity: High]
> This is a pre-existing issue, but does expanding cbqri_domain_list_lock
> usage here worsen an AB-BA deadlock with rdtgroup_mutex?
> 
> A deadlock can occur during CPU hotplug and sysfs reads due to conflicting
> lock ordering:
> 
> Thread A (CPU Hotplug) takes cbqri_domain_list_lock in
> cbqri_resctrl_online_cpu(), then calls resctrl_online_mon_domain() via
> cbqri_attach_cpu_to_l3_mon(), which blocks waiting for rdtgroup_mutex.
> 
> Thread B (Sysfs read) takes rdtgroup_mutex in rdtgroup_mondata_show(), then
> delegates the read via smp_call_on_cpu() to a worker thread.
> 
> Thread C (Worker) executes resctrl_arch_rmid_read(), which blocks waiting
> for cbqri_domain_list_lock.

This is not a problem. Every rdtgroup_mutex -> cbqri_domain_list_lock
path runs under cpus_read_lock, and the hotplug path runs under
cpus_write_lock.

> > +static void cbqri_resctrl_pick_counters(void)
> > +{
> [ ... ]
> > +	/*
> > +	 * mbm_total_bytes is surfaced on the L3 monitoring domain, so it
> > +	 * needs a mon-capable L3 cache controller as well as a single
> > +	 * mon-capable bandwidth controller.
> > +	 */
> > +	if (l3->ctrl && l3->ctrl->mon_capable && cbqri_find_only_mon_bc())
> > +		resctrl_enable_mon_event(QOS_L3_MBM_TOTAL_EVENT_ID, false, 0, NULL);
> 
> Does passing any_cpu = false here break monitor reads and RMID resets on
> nohz_full systems?
> 
> When any_cpu is false, the resctrl core ensures the read executes on a CPU
> in the target domain. If all CPUs in that domain are nohz_full,
> mon_event_read() falls back from smp_call_on_cpu() (process context) to
> smp_call_function_any() (IPI hardirq context with interrupts disabled).
> 
> Because drivers/resctrl/cbqri_resctrl.c checks for irqs_disabled() in both
> resctrl_arch_rmid_read() and resctrl_arch_reset_rmid() and silently aborts,
> monitor reads and resets will fail on nohz_full systems.

The CBQRI MMIO registers are cpu agnostic so I will register
QOS_L3_MBM_TOTAL with any_cpu=true so the core reads in process context.

> > @@ -854,6 +1054,7 @@ static int cbqri_attach_cpu_to_l3_mon(struct cbqri_controller *ctrl,
> [ ... ]
> >  err_offline:
> >  	/*
> >  	 * cancel_delayed_work avoids deadlocking against the cqm_limbo
> >  	 * worker which takes cpus_read_lock while this hotplug callback
> >  	 * already holds cpus_write_lock. mbm_over is only
> >  	 * INIT_DELAYED_WORK'd when MBM_TOTAL was enabled, so gate the
> >  	 * cancel on the same condition to avoid touching a zeroed work
> >  	 * struct.
> >  	 */
> >  	cancel_delayed_work(&mon_dom->cqm_limbo);
> > +	if (resctrl_is_mon_event_enabled(QOS_L3_MBM_TOTAL_EVENT_ID))
> > +		cancel_delayed_work(&mon_dom->mbm_over);
> >  	resctrl_offline_mon_domain(res, &mon_dom->hdr);
> >  err_listdel:
> >  	list_del(&mon_dom->hdr.list);
> >  err_free:
> >  	kfree(mon_dom);
> >  	return err;
> >  }
> 
> Does this non-blocking cancel_delayed_work() lead to a use-after-free of
> mon_dom?
> 
> In drivers/resctrl/cbqri_resctrl.c:cbqri_attach_cpu_to_l3_mon(),
> resctrl_online_mon_domain() schedules the mbm_over delayed work. If hardware
> initialization fails later in the function, the error path executes
> cancel_delayed_work(), which is non-blocking.
> 
> If the worker thread has already woken up and is actively blocked on
> cpus_read_lock() waiting for the hotplug thread to drop cpus_write_lock(),
> cancel_delayed_work() will return false.
> 
> The hotplug thread will then proceed to free mon_dom and drop the lock.
> Once the lock is dropped, the worker thread resumes execution and will
> access the freed mon_dom.

I don't think that this is a problem. resctrl_offline_mon_domain()
already issues cancel_delayed_work() for mbm_over and cqm_limbo, and x86
frees the domain right after. The mbm_over and cqm_limbo workers take
cpus_read_lock() first, and both the error path and the offline teardown
run under cpus_write_lock().

Drew
