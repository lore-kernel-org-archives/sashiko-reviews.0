Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B79B91A0BE0;
	Tue,  7 Jul 2026 00:25:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783383930; cv=none; b=jBAex2UE2FoHGqJGk1Zn+mmqrW7b4nVsp8nWBqPTXZ8AV4MSsiuiaZaN+qrJp75oYPhCIHR6pxQKXs8RMgrm3wrHwriYWvCZ+Iw21k3z6vjTnb97jO3ymnm2ZL/CMf3AdkgLXI8iYYJyU0paPHaZqmvmutvwUI0FtQtjUkQa93A=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783383930; c=relaxed/simple;
	bh=TgH+11zGAgLITx2jMpeSnPIvd36fNAjQ5Urbv0m8C1o=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=PZx2r3Jj9Ajd2cnifJvcEA9bkNTiPc0dZSDEhqTA4L1Vt6BFuMyTEw93MIyGMs3o6NXZgQlsR8y49rSKvk7ZRvYOt7uMramr6oav9DWuQ6paiodBj7bwk4zaAHkB9f17HLk+T6R9gj6MGOGSvDWQ3sYZEjruvE2yK983DFPu2t8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=dAYIfgr1; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="dAYIfgr1"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 4E5EC1F000E9;
	Tue,  7 Jul 2026 00:25:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1783383929;
	bh=EX5bDRcbg6XLyzbbFsSspBE0R+ovIvkBly+FTEt8N+A=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=dAYIfgr1MViVwVg/Yqkt+wcVz2lRJcY0KvgY2dq01taupm/EqWjSaSH4rCaFU8Jsz
	 G4WnwXIAgI/POODehFp0KUxnfSs5owh+p1PBlOhHOflltQrzgdnZGgb99DC/0vK79n
	 W50yJMIHr4WDC0O0iQzrUriej/gfxGEtyu9NXDrS51Wyty1fITNMX71sFAmx4nc9Bw
	 nxE62D2bHzbU+nMZF68PNdheBGPs5qNFszED6ZcJinP1MO959JT18IpVJRgXci/drF
	 Y7MjjAJ5xXmb4j8PWkHCxNYaVz9H7Y2X3smMVWZJNb+un5waCJCaUPXFu8/s2ZlMIz
	 J3Y4I0CYb8WDg==
Date: Mon, 6 Jul 2026 17:25:28 -0700
From: Drew Fustini <fustini@kernel.org>
To: sashiko-reviews@lists.linux.dev
Cc: linux-riscv@lists.infradead.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v4 3/8] riscv: Add support for srmcfg CSR from Ssqosid
 extension
Message-ID: <akxHeAstGx+DWxPz@x1>
References: <20260706-dfustini-atl-sc-cbqri-dt-v4-0-e75c20201d64@kernel.org>
 <20260706-dfustini-atl-sc-cbqri-dt-v4-3-e75c20201d64@kernel.org>
 <20260706231704.C4A741F000E9@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: sashiko-reviews@lists.linux.dev
List-Id: <sashiko-reviews.lists.linux.dev>
List-Subscribe: <mailto:sashiko-reviews+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:sashiko-reviews+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260706231704.C4A741F000E9@smtp.kernel.org>

On Mon, Jul 06, 2026 at 11:17:04PM +0000, sashiko-bot@kernel.org wrote:
> Thank you for your contribution! Sashiko AI review found 2 potential issue(s) to consider:
> - [High] Late CPU hotplug cache invalidation allows newly onlined CPUs to execute with implementation-defined CSR values and potentially bypass the CSR update.
> - [Medium] Missing resctrl architecture callbacks and generic subsystem integration, rendering the srmcfg context-switch logic functionally dead code.
> --
> 
> --- Patch [3]: [PATCH v4 3/8] riscv: Add support for srmcfg CSR from Ssqosid extension ---
> commit 5baf8388a55d26b8cdc1b9f1025583f7b6a3e4f3
> Author: Drew Fustini <fustini@kernel.org>
> 
> riscv: Add support for srmcfg CSR from Ssqosid extension
> 
> Add support for the srmcfg CSR defined in the Ssqosid ISA extension.
> The CSR contains two fields: Resource Control ID (RCID) and Monitoring
> Counter ID (MCID) for tracking resource usage.
> 
> Link: https://github.com/riscv/riscv-ssqosid/releases/tag/v1.0
> 
> >     resctrl_arch_set_closid_rmid() updates it when a task is assigned to a
> >     resctrl control or monitoring group.
> >     
> >     A per-cpu cpu_srmcfg_default holds the default srmcfg for each CPU, set
> >     by resctrl_arch_set_cpu_default_closid_rmid() on CPU group assignment.
> 
> [Severity: Medium]
> Are these resctrl architecture callbacks missing from this patch series?
> 
> The commit message mentions resctrl_arch_set_closid_rmid() and
> resctrl_arch_set_cpu_default_closid_rmid(), but they do not appear to be
> implemented.
> 
> Without these integration functions, the new srmcfg field in thread_struct
> and the cpu_srmcfg_default per-CPU variable are never updated.
> 
> Does this leave the context-switch tracking as functionally dead code that
> only ever zeroes the CSR?

They are added later in the series. This patch adds only the srmcfg CSR
plumbing that those callbacks drive.

> > +	err = cpuhp_setup_state(CPUHP_AP_ONLINE_DYN, "riscv/srmcfg:online",
> > +				riscv_srmcfg_reset_cache, riscv_srmcfg_reset_cache);
> 
> [Severity: High]
> Does this late CPU hotplug cache invalidation allow newly onlined CPUs to
> execute with implementation-defined CSR values?
> 
> The CPU cache invalidation happens at CPUHP_AP_ONLINE_DYN, which runs on the
> target CPU itself. This means the CPU has already booted and context-switched
> into the hotplug thread before riscv_srmcfg_reset_cache() is called.
> 
> If a CPU is offlined while its software cpu_srmcfg cache happens to be 0, and
> then powered back on, its hardware SRMCFG register initializes to an
> implementation-defined value.
> 
> When the CPU context-switches to the cpuhp thread (which has a default
> srmcfg of 0), __switch_to_srmcfg() might see that the incoming thread's 0
> matches the stale software cache's 0.
> 
> Could this bypass the necessary CSR write, leaving the CPU to run with
> garbage values in the SRMCFG hardware CSR until the next context switch?

No, this won't happen. riscv_srmcfg_reset_cache() is the startup
callback of a CPUHP_AP_ONLINE_DYN state, which is ordered before
CPUHP_AP_ACTIVE. Only the idle task and per-cpu kthreads can run before
it, and their QoS tag does not matter.

Drew
