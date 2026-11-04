Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793830159;
	b=aixFdEK4q3yBc0DAEY3hSVY0vrZtP7lHE0SRJdtRn/4SCykQ9uFqSTfLsD2wa8M7YY3y
	 5FoRN07Ikv/NKb73epZ8L5yMaR694mboz/GT4biiuHxMnzJxClr62bXE1VlYhL5xeCrVL
	 BJqHfkI/nBNUGqGEMQ2iOc84IdS8n9EWldFiWJRIKLXK3JW5KG4wDD2nPQSKC+X5f16AK
	 +DNEN//vgyeB+O4wdvCXuv1Mzc8K3kuu8rCx1sVLg1wHk+kncRkIXUhaleHoCJ2VSiXja
	 o56LNariKK6jDlk+H6Na6+pRJMj6ZmCeoPJGr1JrXmnoF2XZYANRLzWsnr7CKqNqHlg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793830159;
	h=Received:DKIM-Signature:Date:From:To:Cc:Subject:Message-ID:
	 References:MIME-Version:Content-Type:Content-Disposition:In-Reply-To;
	bh=C25Dh7MRWLftFBeoGzTyfZNFjeA6A0kP3xkpMFR3t54=;
	b=Da+4aQ6B1VlZj1aNuy5969ZefMYfyDQvkVFKygoAsJQLnLAjn3bUerExqYoXiRZYw34W
	 Ql/OGI2DrtgXRPZaWI9TWJ+JFD+IzRs1KYDXW8qRJ7UV/mLarpdBeZIYGvMnmQQAvQhRr
	 LY5QpnSt9vuPJbbBJvhJqHdeQ3NR1TFaQFx5zJMfz+dFt5h6UkvT6HGAq2clLs0uv7DBZ
	 fTLxqAWPNAkbt3CcfYxxbXNH2Bgmd3rYLvOOcfkQz6g8I2hWrGeBbRJo9El1VRzNZVkar
	 kZWWcpuExuCQ6ij2mUIa9Mp5aWBxNG9QarTQBY4fTeZuRn65OKd5vIQ9vNRyKK/RyKw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=HLeBrogx;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0EC00606EE9F;
	Wed,  4 Nov 2026 22:09:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=HLeBrogx
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 8BEB51F000C1;
	Wed,  4 Nov 2026 22:09:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1793830158;
	bh=C25Dh7MRWLftFBeoGzTyfZNFjeA6A0kP3xkpMFR3t54=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=HLeBrogx7aFTt2qQDFxrUQ9XeC87LA7O7TCT6KBn1Z5rIsJD4iaewsU3zzFQGX7A/
	 u8wDow2w24DRGzrPfPboPfFX/9gaOpnAV07IDH3aUF/iMyry4Rjp2gUlBOMRvL6PRk
	 o1ddi4tP75gBCqAeHgxfc1HuV1jFNLhMbB6gUmO/DbOZPQqwDrwv3arK9vonvVUxaY
	 qv85HLM7FRP0jaEdYBLdaEkAaEk26K+a4Tjqu/65rF4VH2w8hJj2NskrhFAXc6A7n9
	 jervBzp8WGC9WIiUC+UV4GAxY5Bh0qd51xocstvINkRHmKuoNoNuoGTgeWzbKjZKo7
	 Heh7lrBbTprQg==
Date: Wed, 4 Nov 2026 14:09:17 -0800
From: Drew Fustini <fustini@kernel.org>
To: sashiko-reviews@lists.linux.dev
Cc: devicetree@vger.kernel.org, robh@kernel.org, conor+dt@kernel.org
Subject: Re: [PATCH v10 2/6] riscv_cbqri: resctrl: Add cache allocation via
 capacity block mask
Message-ID: <auutDXK15MV4tSyH@x1>
References: <20261104-dfustini-atl-sc-cbqri-dt-v10-0-1636a003a3c0@kernel.org>
 <20261104-dfustini-atl-sc-cbqri-dt-v10-2-1636a003a3c0@kernel.org>
 <sashiko-outbox-197711@kernel.org>
X-Mailing-List: sashiko-reviews@lists.linux.dev
List-Id: <sashiko-reviews.lists.linux.dev>
List-Post: <mailto:sashiko-reviews@lists.linux.dev>
List-Help: <mailto:sashiko-reviews+help@lists.linux.dev>
List-Subscribe: <mailto:sashiko-reviews+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:sashiko-reviews+unsubscribe@lists.linux.dev>
List-Owner: <mailto:sashiko-reviews+owner@lists.linux.dev>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <sashiko-outbox-197711@kernel.org>

On Wed, Nov 04, 2026 at 05:06:58PM +0000, sashiko-bot@kernel.org wrote:
> Thank you for your contribution! Sashiko AI review found 2 potential issue(s) to consider:
> - [High] resctrl: cbqri: ZERO_SIZE_PTR deref on CDP mount when rcid_count is 1
> - [Medium] resctrl: cbqri: stale cpu_srmcfg_default and CSR_SRMCFG across cpuhp
> --
> 
> commit ba22d9f49019cdbd30a554bde797ded425016085
> Author: Drew Fustini <fustini@kernel.org>
> 
> riscv_cbqri: resctrl: Add cache allocation via capacity block mask
> 
> This commit wires RISC-V CBQRI capacity controllers into resctrl as L2 and
> L3 cache resources, managing control domains across CPU hotplug and exposing
> capacity block mask configuration.
> 
> > diff --git a/drivers/resctrl/cbqri_resctrl.c b/drivers/resctrl/cbqri_resctrl.c
> > new file mode 100644
> > index 0000000000000..165b0027bbe0f
> > --- /dev/null
> > +++ b/drivers/resctrl/cbqri_resctrl.c
[..]
> [Severity: High]
> What happens if a CBQRI capacity controller reports rcid_count == 1 and
> supports_alloc_at_code == true, and userspace mounts resctrl with CDP
> enabled (-o cdp, -o cdpl2, or -o cdpl3)?
> 
> In drivers/resctrl/cbqri_devices.c, riscv_cbqri_register_cc() only rejects
> rcid_count == 0, so a controller with rcid_count == 1 is accepted. Here,
> cbqri_resctrl_control_init() sets res->cdp_capable =
> ctrl->cc.supports_alloc_at_code without requiring ctrl->rcid_count >= 2, and
> resctrl_arch_set_cdp_enabled() allows enabling CDP whenever res->cdp_capable
> is true.
> 
> When mounting with CDP enabled, rdt_get_tree() -> schemata_list_create() ->
> schemata_list_add() halves num_closid:
> 
>     s->num_closid = resctrl_arch_get_num_closid(r);
>     if (resctrl_arch_get_cdp_enabled(r->rid))
>             s->num_closid /= 2;
> 
> With rcid_count == 1, s->num_closid becomes 0. Next, closid_init() computes
> rdt_min_closid == 0:
> 
>     list_for_each_entry(s, &resctrl_schema_all, list)
>             rdt_min_closid = min(rdt_min_closid, s->num_closid);
> 
>     closid_free_map = bitmap_alloc(rdt_min_closid, GFP_KERNEL);
>     if (!closid_free_map)
>             return -ENOMEM;
>     bitmap_fill(closid_free_map, rdt_min_closid);
> 
>     /* RESCTRL_RESERVED_CLOSID is always reserved for the default group */
>     __clear_bit(RESCTRL_RESERVED_CLOSID, closid_free_map);
> 
> Because bitmap_alloc(0, GFP_KERNEL) returns ZERO_SIZE_PTR, Could
> __clear_bit() immediately fault on ZERO_SIZE_PTR? Should
> cbqri_resctrl_control_init() or resctrl_arch_set_cdp_enabled() require
> rcid_count >= 2 for CDP?

A controller with a single RCID has nothing to allocate between in the
first place, so I will reject an alloc-capable controller with fewer
than two RCIDs in riscv_cbqri_register_cc().

> [Severity: Medium]
> Can CSR_SRMCFG and per_cpu(cpu_srmcfg, cpu) become out of sync with
> per_cpu(cpu_srmcfg_default, cpu) across CPU hotplug?
> 
> When a CPU assigned to a non-default resctrl group is taken offline,
> cbqri_resctrl_offline_cpu() calls resctrl_offline_cpu(cpu), which removes the
> CPU from the group's cpu_mask without resetting cpu_srmcfg_default to (0, 0).
> Because the CPU is no longer in the group's cpu_mask or cpu_online_mask, a
> subsequent rmdir of that group or unmount of resctrl will not clear
> cpu_srmcfg_default on the offline CPU either.
> 
> In addition, riscv/srmcfg:online (registered at arch_initcall in
> arch/riscv/kernel/qos.c) and cbqri:online (registered at late_initcall in
> cbqri_arch_late_init()) both use CPUHP_AP_ONLINE_DYN, so
> riscv_srmcfg_reset_cache() runs before cbqri_resctrl_online_cpu() on CPU
> online and sets per_cpu(cpu_srmcfg, cpu) = U32_MAX while cpu_srmcfg_default
> still holds the stale pre-offline RCID/MCID.
> 
> Inside cbqri_resctrl_online_cpu(), cbqri_attach_cpu_to_all_ctrls(cpu) runs
> before resctrl_arch_set_cpu_default_closid_rmid(cpu, 0, 0) and performs
> operations that can sleep (such as mutex_lock(), kzalloc_obj() with
> GFP_KERNEL, and usleep_range() in cbqri_wait_busy_flag()). If a context
> switch occurs on the onlining CPU during cbqri_attach_cpu_to_all_ctrls(),
> __switch_to_srmcfg() sees cpu_srmcfg == U32_MAX, writes the stale
> cpu_srmcfg_default into CSR_SRMCFG, and caches that stale value in
> cpu_srmcfg.
> 
> When cbqri_resctrl_online_cpu() then calls
> resctrl_arch_set_cpu_default_closid_rmid(cpu, 0, 0), it only updates
> cpu_srmcfg_default in memory and never calls resctrl_arch_sched_in(current)
> to refresh CSR_SRMCFG and cpu_srmcfg on the running CPU.
> 
> Should cbqri_resctrl_offline_cpu() reset the CPU's default CLOSID/RMID and
> refresh CSR_SRMCFG, and should cbqri_resctrl_online_cpu() set the default to
> (0, 0) and call resctrl_arch_sched_in(current) so CSR_SRMCFG and cpu_srmcfg
> stay synchronized?

I will reset the CPU's default RCID and MCID in
cbqri_resctrl_offline_cpu() as x86 does in clear_closid_rmid().

Drew
