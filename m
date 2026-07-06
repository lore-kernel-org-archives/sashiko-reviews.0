Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D98363EDADC;
	Mon,  6 Jul 2026 16:59:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783357159; cv=none; b=auCVS5WUpRYhN8bIR0dM49Hh2lAuj03Gyz8ThE77J5T7eZ+i5+/3qHRkqzF4SkGR5Wi2GwA+VZgxCUfYv8HYEtd9NlwfZLKi/O7FSONl5WZD+0BxGnE3TZ4xwN3ELzXkgIgovEUWcNhyPDsZ6M7gP+yDPfPTwkGlc0SSvdjyKYE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783357159; c=relaxed/simple;
	bh=7Da1g/hUuRErINxmPtf3aaleUiiGPXKLl5MeVgK2E84=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=XieodTol//f1hwqEkl143ywLzFmFiK3WepR6mWkxv/jzhxjuByYLdZmJA56wLjgqzhdPp001SLrnOX2noUY7SYARuZqsf7MTJg48xNQNs1pjwah3p5Jpw7FELpNyYhJZNbOUfhnoSrZh9n/F58DSwIH/lAIRYt70LQRl3sfBv3E=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=ZBmje5lF; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="ZBmje5lF"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 5FD971F00A3A;
	Mon,  6 Jul 2026 16:59:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1783357157;
	bh=G/GJvdohdQUVqTFvcavpouSFzIQxz4hc6MWQM/VTqSc=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=ZBmje5lFq83fDtpNCF4UKpMyPDr5ILuzk67xjRTwgE8hMK19K1akJ/liihNd1XGSu
	 jeXB9/SxlvRXg0Kh2eUtrHumVvD3sbG3Bdz1ZYa2SgsZWJH1qVWFYQA05lNzft9JGR
	 0aVBwMNsmPAw9f/d+WJRaE8UhV4qgUuu24m3cc/0dW3+pRmK2mDScC/2ZeT9a2Ik+O
	 62MaFXgr6wyL81KMZNqVaqXNOvzgyvuzkAcAO99dmRX7v3djo00Sc5f9kNppG1jWrV
	 5Hugdj/JPAisWESVvf/hCVnDqxdAVBS68ukRuylBe2m9PJt4CWFHtqSiSNPPtegeWQ
	 wqkJjbGcyOR/g==
Date: Mon, 6 Jul 2026 09:59:15 -0700
From: Drew Fustini <fustini@kernel.org>
To: sashiko-reviews@lists.linux.dev
Cc: linux-riscv@lists.infradead.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v3 5/8] riscv_cbqri: resctrl: Add cache allocation via
 capacity block mask
Message-ID: <akve44tGHORcofdY@x1>
References: <20260628-dfustini-atl-sc-cbqri-dt-v3-0-c9c1342fe3cf@kernel.org>
 <20260628-dfustini-atl-sc-cbqri-dt-v3-5-c9c1342fe3cf@kernel.org>
 <20260628213426.EB9C01F000E9@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: sashiko-reviews@lists.linux.dev
List-Id: <sashiko-reviews.lists.linux.dev>
List-Subscribe: <mailto:sashiko-reviews+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:sashiko-reviews+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260628213426.EB9C01F000E9@smtp.kernel.org>

On Sun, Jun 28, 2026 at 09:34:24PM +0000, sashiko-bot@kernel.org wrote:
> Thank you for your contribution! Sashiko AI review found 1 potential issue(s) to consider:
> - [High] Dynamically registered capacity controllers bypass capability validation, leading to hardware errors that abort CPU hotplug.
> --
> 
> commit 3d57a44029d899d70e2c81681585f914c01cc700
> Author: Drew Fustini <fustini@kernel.org>
> 
> riscv_cbqri: resctrl: Add cache allocation via capacity block mask
> 
> Wire CBQRI capacity controllers into resctrl as RDT_RESOURCE_L2 and
> RDT_RESOURCE_L3 schemata. Mismatched CC caps at the same cache level
> are treated as a fatal configuration error since fs/resctrl exposes a
> single per-rid cap set. Domains are created lazily in the cpuhp online
> callback so cpu_mask reflects only currently online CPUs.
> 
> > diff --git a/drivers/resctrl/cbqri_resctrl.c b/drivers/resctrl/cbqri_resctrl.c
> > new file mode 100644
> > index 0000000000000..1fb0fbe1b000f
> > --- /dev/null
> > +++ b/drivers/resctrl/cbqri_resctrl.c
> [ ... ]
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
> Does this regression cause CPU hotplug to abort if a capacity controller is
> dynamically registered (e.g., via a device tree overlay) after boot?
> 
> Late-registered controllers bypass the capability validation in
> cbqri_resctrl_pick_caches(). When a CPU sharing this new controller is
> hotplugged, it reaches this point to create a new domain.
> 
> If the late controller supports fewer RCIDs than the global controller,
> cbqri_init_domain_ctrlval() will issue out-of-bounds commands to the hardware
> because it iterates up to the global hw_res->ctrl->rcid_count:
> 
> drivers/resctrl/cbqri_resctrl.c:cbqri_init_domain_ctrlval() {
> ...
> 	for (i = 0; i < hw_res->ctrl->rcid_count; i++) {
> 		for (t = 0; t < CDP_NUM_TYPES; t++) {
> 			err = resctrl_arch_update_one(r, d, i, t, ...
> ...
> }
> 
> The hardware will reject the out-of-bounds RCID commands, and the resulting
> error will bubble up to cbqri_resctrl_online_cpu(), keeping the CPU
> permanently offline.
> 
> Should the capabilities of dynamically registered controllers be validated
> against hw_res->ctrl before attaching them?

cbqri_resctrl_pick_caches() drops a cache level entirely if its
same-level controllers disagree on rcid_count ), so every exposed level
is backed by controllers with a uniform rcid_count.

However, it doesn't hurt to harden it by iterating to the attached
domain's own hw_dom->hw_ctrl->rcid_count.

-Drew
