Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1FC4E3233E8;
	Tue,  2 Jun 2026 00:58:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1780361915; cv=none; b=OWCR2zNrRc2NtrMwXnhG+cr5wf+Pd8yRkfov1Bsm2vk6Hl+dpjT3ZAkv8NZ7keNBgh/sFReb5ioPAtzrtse+H+4TL4F6+Lh1zkhhCsU+s+YrH4B56B5LqG22XcU0APot8a58uILL04UTzK9vLT2Xil+sc2PSH2Z/3MQ/4fU6INQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1780361915; c=relaxed/simple;
	bh=qHIi6loeHCzOz3PGmJgUJwuuT9oemk9vUaecvxn7BwI=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=qG0DOcCLj7K6ItaS8dE7YrEhZIKDmKn8Njqd/6/xoCd7pm1GB0iJOLq0NAuFWc/Z+l9/ti0a6lJULxKXmsZyWCymD3IaPBEVDG10G/4iGYnQ18okoKVuz84Dh4BixqkZ6XpyHVHmxhK9alzOY/qzTe/Kw0sHB8x/X6QsQ5nOHjU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=SXtxrQuC; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="SXtxrQuC"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id A946B1F00893;
	Tue,  2 Jun 2026 00:58:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1780361913;
	bh=aTwjXVCS0umd91DdCRRqg7Xju1FYRY90ByJytSgrlrk=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=SXtxrQuCE9GLngf/JpXIicbrBBLSkaxTVCgY0ELauZiLn3PnSWKHBRjzYqavuUsLd
	 lH2dQdlLNB1HSYO1H51/exhua/uqWmuaBUN1FdBT4jkcxZA/K9u5SvjycfGpw9jhNe
	 vy/wzLvYsjvIdE3bzZNx5L/W8KrjjdYsB1vzMNsYINqOGr2KXS5kh0cmjf8r4k9RUx
	 OS4xzJP6NI7vlp3+SrisNhorbAwLl1Og3/9Zhflg6TAERPVhNVqpN3SiNGQ4lLZggY
	 7XbrUHAjgq+L/PnmksjvB6G0fUEpczEgXOzSAzvSzhBzTf5fWSF9YR+cpr7ztMIGI/
	 4BAiJf5TH86jw==
Date: Mon, 1 Jun 2026 17:58:32 -0700
From: Drew Fustini <fustini@kernel.org>
To: sashiko-reviews@lists.linux.dev
Cc: linux-kernel@vger.kernel.org
Subject: Re: [PATCH RFC v6 03/18] riscv: add support for srmcfg CSR from
 Ssqosid extension
Message-ID: <ah4quNFhfVu2NpY7@x1>
References: <20260601-ssqosid-cbqri-rqsc-v7-0-v6-3-baf00f50028a@kernel.org>
 <20260601204931.3A9481F00893@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: sashiko-reviews@lists.linux.dev
List-Id: <sashiko-reviews.lists.linux.dev>
List-Subscribe: <mailto:sashiko-reviews+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:sashiko-reviews+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260601204931.3A9481F00893@smtp.kernel.org>

On Mon, Jun 01, 2026 at 08:49:30PM +0000, sashiko-bot@kernel.org wrote:
> Thank you for your contribution! Sashiko AI review found 3 potential issue(s) to consider:
> > +/*
> > + * Invalidate the cache on offline too. The sentinel persists across the
> > + * offline period, so a CPU brought back online finds the cache already
> > + * invalidated before it is schedulable. This closes the window where a
> > + * task scheduled before riscv_srmcfg_online() runs could match a stale
> > + * cache and skip the CSR write while the hardware CSR was reset across
> > + * hart stop/start.
> > + */
> > +static int riscv_srmcfg_offline(unsigned int cpu)
> > +{
> > +	per_cpu(cpu_srmcfg, cpu) = U32_MAX;
> 
> [Severity: High]
> Will this U32_MAX sentinel be overwritten before the CPU actually halts?
> 
> Because riscv_srmcfg_offline() executes at CPUHP_AP_ONLINE_DYN, the dying CPU
> continues tearing down and eventually context switches to the idle thread to
> physically offline.
> 
> This context switch invokes __switch_to_srmcfg(), which writes the hardware
> CSR and overwrites the cpu_srmcfg cache with the idle task's value,
> permanently losing the U32_MAX sentinel.
> 
> When the CPU comes back online, its hardware CSR is in an implementation
> defined reset state, but the software cache holds a valid value. Any early
> tasks sharing this stale value might skip the CSR write and execute with
> incorrect QoS tags until riscv_srmcfg_online() is reached.

This is not a problem. riscv_srmcfg_online() writes U32_MAX again on
bring-up, and it runs at CPUHP_AP_ONLINE_DYN before the CPU becomes
schedulable.

> > +	return 0;
> > +}
> > +
> > +/*
> > + * CPU PM notifier: invalidate the cached srmcfg on resume from a deep
> > + * idle / suspend. Ssqosid v1.0 leaves CSR_SRMCFG state across low-power
> > + * transitions implementation-defined, and the boot CPU never goes
> > + * through the cpuhp online callback during system suspend, so without
> > + * this hook __switch_to_srmcfg() would skip the CSR write when the
> > + * outgoing task happens to share its srmcfg with the pre-suspend cache.
> > + */
> > +static int riscv_srmcfg_pm_notify(struct notifier_block *nb,
> > +				  unsigned long action, void *unused)
> > +{
> > +	switch (action) {
> > +	case CPU_PM_EXIT:
> > +	case CPU_PM_ENTER_FAILED:
> > +		__this_cpu_write(cpu_srmcfg, U32_MAX);
> 
> [Severity: High]
> Does this notifier need to eagerly restore the hardware CSR for the currently
> executing thread?
> 
> It sets cpu_srmcfg to U32_MAX to force a CSR write on the next context
> switch. However, upon waking from low-power states like suspend-to-RAM, the
> CPU does not immediately context switch.
> 
> It unwinds the suspend stack, resumes executing the interrupted thread, and
> services pending interrupts. 
> 
> Because the hardware CSR is not explicitly restored here, all code executing
> between wakeup and the first context switch might run with the hardware's
> implementation defined reset value for CSR_SRMCFG instead of the task's
> assigned QoS tags.

This is not a problem. Before userspace runs on this CPU again,
__switch_to_srmcfg() writes the CSR from the next task's thread.srmcfg.

> > +	/*
> > +	 * cpuhp_setup_state() invokes the startup callback locally on every
> > +	 * already-online CPU, so no separate seed loop is needed here.
> > +	 */
> > +	err = cpuhp_setup_state(CPUHP_AP_ONLINE_DYN, "riscv/srmcfg:online",
> > +				riscv_srmcfg_online, riscv_srmcfg_offline);
> > +	if (err < 0) {
> > +		pr_warn("srmcfg cpuhp registration failed (%d), cpus brought online after boot will not invalidate the CSR_SRMCFG cache\n",
> > +			err);
> > +		return err;
> 
> [Severity: Medium]
> Is it intentional to skip PM notifier registration if CPU hotplug setup fails?
> 
> This early return skips cpu_pm_register_notifier() entirely. 
> 
> While cpuhp_setup_state() failures are rare, PM notifiers do not strictly
> depend on CPU hotplug registration. If this error path is taken, tasks waking
> from suspend could run with incorrect QoS tags because the PM notifier is never
> registered.

This is very unlikely. I will not be making any changes.

Drew
