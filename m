Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EBE3D2772D;
	Mon, 25 May 2026 04:16:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779682590; cv=none; b=itocrHay9y7STO+Dk+jHolD9mkKWYeUxP8yMeoPkJGSyPXeufpCCqQ5qMQo/98FVMm2iKkdTaDU65ndWQ38lo4sxxFaVhPocecj7B9h9drKB3zjtCgVrMk2+Sg9+ItaXJbj4nJKgTaiqWNh+QEGu+etVyPK8DZdXqezPPiyNlj4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779682590; c=relaxed/simple;
	bh=m9mXfcPLwWTr6NRf0JAkrVb+sk5502JTMmJyfJZ58VQ=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=IiqdCJ4C+DK6FThsEO4D+do1Fq/nTmrsWGSkn7LEm13z7gH26Kj6t2XRdQv1pQN8qWTQKhGVd3aJzdL3UZg9pF+Dk/KEgZFMTyHS8hZYUVfR7M2s2IbyiQqUf8RMkjIctX1FfuTDeN5bXGO3olU21z0oMgTRLLRoAfca6pDFvDM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=RbAwWRhF; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="RbAwWRhF"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id B8E641F000E9;
	Mon, 25 May 2026 04:16:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1779682588;
	bh=gGfq/JJ5JkvvL8OY5Ff7IIVAT94dPf64MnyTjmKEFxA=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=RbAwWRhFWSS0Rs/Ch80b4y/ni7BUkk9AD76ebP7MfSYEmFpJlpM5VaZbDCMnScj54
	 s6bEPbg3FtzLTmpollQZX4GdLgSKBjFlGyQwYZ5SQRKto1969RNyjKSA0b5rUsn876
	 +l6Buwbl9SxTw5+M85rPVdjC1onC7/xV2XwKsEO8EsDiwfpiQ7fifJHYO5LK3KAUbT
	 vkDNuUB9PzhMlvsa1ZibffGc5JqaakkBfchHqMCKiQ67KlnN6ngI4Gaz+f3Qsp49y2
	 qe/i7/lFx7cgo9fnIJOP7tvF6zy3dMLadiMbqopA7OuEjdjelwLtpDc9TdgJsCTgZX
	 57cV0g3jLfLeQ==
Date: Sun, 24 May 2026 21:16:27 -0700
From: Drew Fustini <fustini@kernel.org>
To: sashiko-reviews@lists.linux.dev
Cc: linux-kernel@vger.kernel.org
Subject: Re: [PATCH RFC v5 07/18] riscv_cbqri: Add capacity controller probe
 and allocation device ops
Message-ID: <ahPNG3exEMp694V_@gen8>
References: <20260524-ssqosid-cbqri-rqsc-v7-0-v5-7-78d3a7ba9dbe@kernel.org>
 <20260525003019.5597A1F000E9@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: sashiko-reviews@lists.linux.dev
List-Id: <sashiko-reviews.lists.linux.dev>
List-Subscribe: <mailto:sashiko-reviews+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:sashiko-reviews+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260525003019.5597A1F000E9@smtp.kernel.org>

On Mon, May 25, 2026 at 12:30:07AM +0000, sashiko-bot@kernel.org wrote:
> > +static int cbqri_cc_alloc_op(struct cbqri_controller *ctrl, int operation,
> > +			     int rcid, enum cbqri_at at)
> > +{
> > +	int reg_offset = CBQRI_CC_ALLOC_CTL_OFF;
> > +	int status;
> > +	u64 reg;
> > +
> > +	lockdep_assert_held(&ctrl->lock);
> > +
> > +	if (cbqri_wait_busy_flag(ctrl, reg_offset, &reg) < 0) {
> > +		pr_err_ratelimited("BUSY timeout before starting operation\n");
> > +		return -EIO;
> > +	}
> > +	FIELD_MODIFY(CBQRI_CONTROL_REGISTERS_OP_MASK, &reg, operation);
> > +	FIELD_MODIFY(CBQRI_CONTROL_REGISTERS_RCID_MASK, &reg, rcid);
> > +
> > +	/*
> > +	 * CBQRI Table 1: AT 0=Data, 1=Code. Program AT on controllers
> > +	 * that report supports_alloc_at_code. On controllers that don't,
> > +	 * AT is reserved-zero and the op acts on both halves.
> > +	 */
> > +	reg &= ~CBQRI_CONTROL_REGISTERS_AT_MASK;
> 
> [Severity: High]
> On 32-bit architectures, does bitwise inversion of a GENMASK macro (which
> evaluates to unsigned long) silently zero the upper 32 bits of the 64-bit
> register variable?
> 
> If the 32-bit inverted mask is zero-extended to 64 bits, this would truncate
> bits 63:32, potentially clearing the STATUS and BUSY fields. Should
> GENMASK_ULL be used for these masks instead?

I will convert everything to GENMASK_ULL.

> > +static int cbqri_probe_feature(struct cbqri_controller *ctrl, int reg_offset,
> > +			       int operation, int *status, bool *access_type_supported)
> > +{
> > +	const u64 active_mask = CBQRI_CONTROL_REGISTERS_OP_MASK |
> > +				CBQRI_CONTROL_REGISTERS_AT_MASK |
> > +				CBQRI_CONTROL_REGISTERS_RCID_MASK |
> > +				CBQRI_MON_CTL_EVT_ID_MASK;
> 
> [Severity: High]
> Is CBQRI_MON_CTL_EVT_ID_MASK defined in this patch? It seems to be missing,
> which might cause a build failure due to an undeclared identifier.

This is a bisectability bug that I missed. I will fix this.

> > +	/*
> > +	 * Resolve cache_size via cacheinfo. cpus_read_lock satisfies
> > +	 * lockdep_assert_cpus_held() inside get_cpu_cacheinfo_level(). If
> > +	 * every cpu_mask member is offline, cache_size stays 0 and the
> > +	 * controller cannot back occupancy monitoring.
> > +	 */
> > +	cpus_read_lock();
> > +	if (!ctrl->cache.cache_size) {
> > +		int cpu = cpumask_first_and(&ctrl->cache.cpu_mask, cpu_online_mask);
> > +
> > +		if (cpu < nr_cpu_ids) {
> > +			struct cacheinfo *ci;
> > +
> > +			ci = get_cpu_cacheinfo_level(cpu, ctrl->cache.cache_level);
> > +			if (ci)
> > +				ctrl->cache.cache_size = ci->size;
> 
> [Severity: High]
> Is this resolution actually lazy? cbqri_probe_cc() is called immediately
> during registration by cbqri_probe_controller(), which happens at
> acpi_arch_init time.
> 
> Since cacheinfo is unpopulated during early boot, won't
> get_cpu_cacheinfo_level() return NULL and leave cache_size as 0 permanently,
> disabling occupancy monitoring?

ACPI parsing for RQSC runs at subsys_initcall. Every CPU in cpu_mask is
online and cacheinfo-populated by the time cbqri_probe_cc() runs. The
edge case is maxcpus= but I would rather wait until the usecase arises.

> > +	/*
> > +	 * SRMCFG encodes RCID in 12 bits.  ACPI's acpi_parse_rqsc() already
> > +	 * caps info->rcid_count at CBQRI_MAX_RCID (1024) so this is unreachable
> > +	 * today, but a future DT discovery path or a malformed firmware table
> > +	 * routed through a different validator could bypass that ceiling.
> > +	 * Catch the violation here rather than silently truncating in every
> > +	 * FIELD_PREP(SRMCFG_RCID_MASK, closid) on the schedule-in fast path.
> > +	 */
> > +	if (WARN_ON_ONCE(ctrl->rcid_count > SRMCFG_RCID_MASK)) {
> 
> [Severity: Medium]
> Does this correctly validate the count limit? If SRMCFG_RCID_MASK is a
> register bitmask (like 0xFFF), won't a hardware limit of 4096 IDs be
> incorrectly rejected because 4096 is greater than 4095?
> 
> Also, should there be a similar bounds check for mcid_count?

I'll fix the off-by-one in v6. However, acpi_parse_rqsc() already caps
both counts at CBQRI_MAX_RCID/MCID = 1024 so the off-by-one is
unreachable today,

> > +		cbqri_controller_destroy(ctrl);
> > +		return -EINVAL;
> > +	}
> > +
> > +	switch (info->type) {
> > +	case CBQRI_CONTROLLER_TYPE_CAPACITY: {
> > +		int level;
> > +
> > +		ctrl->cache.cache_id = info->cache_id;
> > +
> > +		level = find_acpi_cache_level_from_id(info->cache_id);
> 
> [Severity: High]
> Does this unconditional call to ACPI-specific functions break Device Tree
> support?
> 
> If CONFIG_ACPI is disabled, these stubs return -ENOENT. For DT-based
> platforms, these functions might fail to resolve DT cache IDs, potentially
> causing registration to fail entirely.

Device tree discovery path can be created once there is a platform
driver that needs it.

-Drew
