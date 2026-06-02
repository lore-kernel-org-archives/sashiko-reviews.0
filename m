Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5B1161A680C;
	Tue,  2 Jun 2026 04:47:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1780375660; cv=none; b=tupSZAkTEufDgMWXLBfQHZSbHb0nhi154+ZcLlmVUMfWqjpvygG9CzifvLBaWVN+4/RxZ0V0A1g3AltHo/bHAD+ryHiIH/zhoraHxwAG7peO/FJ94uAdCSqjNFL9iGMbo4C2QehWsK2QsUVkp9PyKaHUKxwP01AlhJJiZzH3VBs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1780375660; c=relaxed/simple;
	bh=figzwIQjLJ6/wYOhbtThrg5JL20rtRu0/W7QFMh7uKw=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=KVVr1MR1pMQNVuJo6CL6to462qQOZEtWyfwMvTg37bLWMaTctHEnJTZH33+68axVbVPLgwxI6+HyiRZleEyH1AT1lt8/A3VzYJSFVncqOc3tcJhEkivinG6IpKNYR8KUHr//Od/faEwqu4waSR2I8fSF+RripomZgynyB+yUGT8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=eJL5X6Z6; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="eJL5X6Z6"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id E15551F00893;
	Tue,  2 Jun 2026 04:47:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1780375659;
	bh=BTEDAuQRMmoOnsNXUwkiwi5b8kYjVRTDKcS8cYhKsd4=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=eJL5X6Z6aaigF6HZQG5aAe4ACuuIx4HJw8xtFt7t2WxjPwIrk8o9JR+z8N5PSFv9L
	 HoFJcucvfW4UGlzfVkzTTK7s8ZIreBTq5sEW/WHPfbvq65nJi8hhEW0Bu441um+FOa
	 KaI1+Gr+vmAV9upRWviiuMTKu6nlifCGfA3VIk2nkwcfKN4hVMxuSFu7ABJsJYKqH4
	 WUKkFOQzAWpSX6FAkn1AJqrNP7uo++ew48+v83zpqiQts0yaMOhfDm3pGkM3WlwOqr
	 fuH4Lrc3y3unpjcJXwYzh9yAM5lnIjF72NJoa3rQG+mvdSPwaDGlwIb7y4Y27Tyx8A
	 A0Vk25WBDiJgA==
Date: Mon, 1 Jun 2026 21:47:09 -0700
From: Drew Fustini <fustini@kernel.org>
To: sashiko-reviews@lists.linux.dev
Cc: linux-kernel@vger.kernel.org
Subject: Re: [PATCH RFC v6 12/18] riscv_cbqri: resctrl: Add L3 cache
 occupancy monitoring
Message-ID: <ah5gTWvnnkMcTP4s@gen8>
References: <20260601-ssqosid-cbqri-rqsc-v7-0-v6-12-baf00f50028a@kernel.org>
 <20260601205837.C1AC91F00893@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: sashiko-reviews@lists.linux.dev
List-Id: <sashiko-reviews.lists.linux.dev>
List-Subscribe: <mailto:sashiko-reviews+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:sashiko-reviews+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260601205837.C1AC91F00893@smtp.kernel.org>

On Mon, Jun 01, 2026 at 08:58:37PM +0000, sashiko-bot@kernel.org wrote:
> > +	/*
> > +	 * cbqri_domain_list_lock serialises the list walk against
> > +	 * cbqri_detach_cpu_from_ctrl_domains().
> > +	 */
> > +	mutex_lock(&cbqri_domain_list_lock);
> 
> [Severity: High]
> During CPU hotplug, cbqri_resctrl_online_cpu() acquires
> cbqri_domain_list_lock and eventually calls resctrl_online_mon_domain()
> which acquires the core framework rdtgroup_mutex.
> 
> However, when reading monitoring data, the core framework acquires
> rdtgroup_mutex and then invokes resctrl_arch_rmid_read() which acquires
> cbqri_domain_list_lock here.
> 
> Does this establish an AB-BA lock inversion between cbqri_domain_list_lock
> and rdtgroup_mutex?
> 
> [Severity: High]
> Additionally, when a CPU goes offline, cbqri_resctrl_offline_cpu() acquires
> cbqri_domain_list_lock before initiating domain teardown.
> 
> If the domain is torn down, the resctrl core flushes busy RMIDs by calling
> __check_limbo(), which invokes this resctrl_arch_rmid_read() hook.
> 
> Since this hook unconditionally attempts to acquire cbqri_domain_list_lock,
> does this cause a self-deadlock when offlining a CPU with active monitoring
> traffic?

For the next rev, I will drop the list lock around the teardown so the
limbo flush does not re-enter it.

> > @@ -500,6 +582,13 @@ static int cbqri_resctrl_control_init(struct cbqri_resctrl_res *cbqri_res)
> [ ... ]
> > +		if (ctrl->mon_capable && res->rid == RDT_RESOURCE_L3) {
> > +			res->mon_scope = RESCTRL_L3_CACHE;
> > +			resctrl_enable_mon_event(QOS_L3_OCCUP_EVENT_ID,
> > +						 false, 0, NULL);
> > +			res->mon_capable = true;
> > +		}
> 
> [Severity: Medium]
> The L3 occupancy event is registered with any_cpu set to false. This
> requires the core to read the event from a specific CPU using
> smp_call_function_any().
> 
> If that CPU is configured as nohz_full, the read executes in an IPI context
> with interrupts disabled. Since resctrl_arch_rmid_read() correctly returns
> -EIO when irqs_disabled(), will userspace reads fail on nohz_full CPUs?
> 
> Could any_cpu be true here to avoid cross-CPU IPIs, since the MMIO reads
> can be safely executed from any CPU?

I will switch QOS_L3_OCCUP and QOS_L3_MBM_TOTAL to any_cpu = true in the
next rev.

> > @@ -510,6 +599,7 @@ static int cbqri_resctrl_control_init(struct cbqri_resctrl_res *cbqri_res)
> [ ... ]
> > +	l3_ctrl = cbqri_resctrl_resources[RDT_RESOURCE_L3].ctrl;
> > +	if (l3_ctrl && l3_ctrl->mon_capable)
> > +		max_rmid = min(max_rmid, l3_ctrl->mcid_count);
> > +
> > +	if (!exposed_mon_capable) {
> > +		max_rmid = 1;
> > +		return;
> >  	}
> 
> [Severity: High]
> If the hardware has an L2 monitoring controller but no L3 monitoring,
> exposed_mon_capable becomes true but max_rmid is never narrowed from its
> initial U32_MAX value.
> 
> When the core framework mounts the filesystem, it will query
> resctrl_arch_system_num_rmid_idx() which returns max_rmid. Will this
> cause an immediate OOM panic when it attempts to allocate
> U32_MAX * sizeof(struct rmid_entry)?

For the next rev, I will only set exposed_mon_capable when an event is
actually enabled and clamp max_rmid.

> > @@ -560,13 +673,89 @@ static struct rdt_ctrl_domain *cbqri_create_ctrl_domain(struct cbqri_controller
> [ ... ]
> > +err_offline:
> > +	/*
> > +	 * cancel_delayed_work avoids deadlocking against the cqm_limbo
> > +	 * worker which takes cpus_read_lock while this hotplug callback
> > +	 * already holds cpus_write_lock. mbm_over is only
> > +	 * INIT_DELAYED_WORK'd when MBM_TOTAL was enabled, so gate the
> > +	 * cancel on the same condition to avoid touching a zeroed work
> > +	 * struct.
> > +	 */
> > +	cancel_delayed_work(&mon_dom->cqm_limbo);
> > +	if (resctrl_is_mon_event_enabled(QOS_L3_MBM_TOTAL_EVENT_ID))
> > +		cancel_delayed_work(&mon_dom->mbm_over);
> > +	resctrl_offline_mon_domain(res, &mon_dom->hdr);
> > +err_listdel:
> > +	list_del(&mon_dom->hdr.list);
> > +err_free:
> > +	kfree(mon_dom);
> > +	return err;
> > +}
> 
> [Severity: High]
> If a worker thread is currently executing but blocked waiting for
> cpus_read_lock(), cancel_delayed_work() will return immediately because
> the work is no longer pending in the queue.
> 
> After the hotplug thread drops cpus_write_lock(), the worker could unblock
> and continue executing, accessing the mon_dom structure after it was freed.
> Does this create a use-after-free window?

This is not a problem. The non-sync cancel is the resctrl core's own pattern

Drew
