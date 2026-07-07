Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0C40A175A7F;
	Tue,  7 Jul 2026 00:45:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783385133; cv=none; b=XYC7GnC3ogaiM94EpvNhA7GtuHQ0CunBEOtWXnz+rRwK/JiNmXb4QaZxjen8/wYxvmRzO1jS9+1CCiuK6oiSGpiUUuMuYstFWlWsahCW0cYA0bTDOF6o4m/vUs40a5V0+tL2AhyxDuhZvr6lpIr9cTPcy0y9q4GrZN8TkA2dc4k=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783385133; c=relaxed/simple;
	bh=yyb/81niolsmOWWtWPuTd4lpMEIsk0B0UCqwq04KSug=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=bgX4afnc8gCONTZvez7UiVUT8xGe8ul5AK47/pRohvtJjThRyDEgMmoVbTjB5QMHzjZssSy5btT5SOGg3tTz+CvL8Ugu6Q7PGokE9BI4Jk55gb5Fp6Uc6cySc/ZffRCzSD8rx0Ys91E3Qoqp+BUu7ZeYhspLSBR8i4Onq7w0qKs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=lPyatc3X; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="lPyatc3X"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 8A9DF1F000E9;
	Tue,  7 Jul 2026 00:45:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1783385131;
	bh=v8+K3znB3MAe4tgPmMUKy+aJKRXY6ZUDTmKIVv/zF2I=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=lPyatc3XbY4QpTKASirQKvVOei2XGodtwEsqv7qNKOJNtVz4LUwphPMGJeGuyE8a9
	 1WMJRRODm0LOePEKcMFQ4TYjCd+b4MBVl4susQP8tyANodhrBYQA68r+PAZAf8uaU7
	 PxuT05LmVE/RdcpkGivLyJAaLKQhE92gJE5FLimVoNUjZ3bP1EmeTc88T9qDR3wm3A
	 Uad3qcdB/Oyds14r/oQJp0pIOp0zjzdrzXGtWbQtHULZe56ugdZslBYXhF3JMQ1bZo
	 yXvaPVlDrvZZrXfnLK9BlNnSYXLAKUPj9TEUZO/9GSg5RbM2IiKYysS+a69dpmsIS6
	 vHjROyR/dxZDQ==
Date: Mon, 6 Jul 2026 17:45:30 -0700
From: Drew Fustini <fustini@kernel.org>
To: sashiko-reviews@lists.linux.dev
Cc: linux-riscv@lists.infradead.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v4 5/8] riscv_cbqri: resctrl: Add cache allocation via
 capacity block mask
Message-ID: <akxMKn6HVbCfvAPE@x1>
References: <20260706-dfustini-atl-sc-cbqri-dt-v4-0-e75c20201d64@kernel.org>
 <20260706-dfustini-atl-sc-cbqri-dt-v4-5-e75c20201d64@kernel.org>
 <20260706232031.D95C21F000E9@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: sashiko-reviews@lists.linux.dev
List-Id: <sashiko-reviews.lists.linux.dev>
List-Subscribe: <mailto:sashiko-reviews+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:sashiko-reviews+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260706232031.D95C21F000E9@smtp.kernel.org>

On Mon, Jul 06, 2026 at 11:20:31PM +0000, sashiko-bot@kernel.org wrote:
> Thank you for your contribution! Sashiko AI review found 2 potential issue(s) to consider:
> - [High] CBQRI controllers registered after system boot are not validated for mismatched capabilities when attached to resctrl domains.
> - [Medium] Missing ARCH_HAS_CPU_RESCTRL selection in RISC-V Kconfig prevents RESCTRL_FS from being enabled.
> --
> 
> --- Patch [5]: [PATCH v4 5/8] riscv_cbqri: resctrl: Add cache allocation via capacity block mask ---
> commit bf65a655f2aedc980d538dde50ae87b2b9ea72e4
> Author: Drew Fustini <fustini@kernel.org>
> 
> riscv_cbqri: resctrl: Add cache allocation via capacity block mask
> 
> Wire CBQRI capacity controllers into resctrl as RDT_RESOURCE_L2 and
> RDT_RESOURCE_L3 schemata. Domains are created lazily in the cpuhp online
> callback so cpu_mask reflects only currently online CPUs.
> 
> > diff --git a/drivers/resctrl/Kconfig b/drivers/resctrl/Kconfig
> > index 92b9c82cf9f39..f8566c003d495 100644
> > --- a/drivers/resctrl/Kconfig
> > +++ b/drivers/resctrl/Kconfig
> > @@ -42,3 +42,7 @@ menuconfig RISCV_CBQRI
> >  if RISCV_CBQRI
> >  
> >  endif
> > +
> > +config RISCV_CBQRI_RESCTRL_FS
> > +	bool
> > +	default y if RISCV_CBQRI && RESCTRL_FS
> 
> [Severity: Medium]
> Will this feature ever be enabled? Since the RISC-V architecture Kconfig does
> not currently select ARCH_HAS_CPU_RESCTRL, it appears RESCTRL_FS can never be
> satisfied, making this newly added support unreachable.

RISCV_CBQRI selects ARCH_HAS_CPU_RESCTRL in drivers/resctrl/Kconfig, so
RESCTRL_FS becomes selectable once CBQRI is enabled. The select is in
the CBQRI menuconfig rather than arch/riscv/Kconfig.

> > diff --git a/drivers/resctrl/cbqri_resctrl.c b/drivers/resctrl/cbqri_resctrl.c
> > new file mode 100644
> > index 0000000000000..cb12a868561b9
> > --- /dev/null
> > +++ b/drivers/resctrl/cbqri_resctrl.c
> 
> [ ... ]
> 
> > +static int cbqri_attach_cpu_to_cap_ctrl(struct cbqri_controller *ctrl,
> > +					unsigned int cpu)
> > +{
> > +	struct cbqri_resctrl_res *hw_res;
> > +	struct rdt_ctrl_domain *domain;
> > +	struct rdt_resource *res;
> > +	int dom_id;
> > +	int rid;
> > +
> > +	rid = cbqri_cache_level_to_rid(ctrl->cache.cache_level);
> > +	if (rid < 0)
> > +		return 0;
> > +	hw_res = &cbqri_resctrl_resources[rid];
> > +
> > +	if (!hw_res->ctrl)
> > +		return 0;
> > +
> > +	res = &hw_res->resctrl_res;
> > +	dom_id = ctrl->cache.cache_id;
> > +
> > +	domain = cbqri_find_ctrl_domain(&res->ctrl_domains, dom_id);
> > +	if (domain) {
> > +		cpumask_set_cpu(cpu, &domain->hdr.cpu_mask);
> > +		return 0;
> > +	}
> > +
> > +	domain = cbqri_create_ctrl_domain(ctrl, res, cpu, dom_id);
> 
> [Severity: High]
> Can a mismatched controller be attached here if it is probed after system boot?
> 
> While cbqri_resctrl_pick_caches() verifies that all controllers agree on
> capabilities like rcid_count and ncblks during boot, this function seems to
> unconditionally create a new control domain for late-attached controllers
> without similar validation against the baseline hw_res->ctrl capabilities.
> 
> If a deferred probe or late module load brings up a controller with fewer
> capabilities (such as a smaller capacity block mask or fewer RCIDs), could
> the resctrl core's use of the baseline capabilities lead to out-of-bounds
> hardware writes when programming this new controller?

That is not possible. This driver is always built-in when enabled and
the probe never returns deferred. The resctrl setup that calls
cbqri_resctrl_pick_caches() runs later at late_initcall(), so every
controller is already on cbqri_controllers by the time pick_caches()
validates the set.

Drew
