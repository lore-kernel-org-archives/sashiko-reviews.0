Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9FE0231A55B;
	Mon, 25 May 2026 07:21:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779693720; cv=none; b=ssOmuqZfus8lHCm4ZEZBKuAVDCGVVEOOBrzh1H7GqWwkrI7hs7gPKU0ulHZrc2R9d8Ag3UiROnqOoOqP55e2nWuRCjHsVYQVIap8Is6CbMCbDx0NuwQViOSBLi5IAW4R48JvAcZ/HybA2iShVdwJc3i5lRodlRBMsWPM09ZuODw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779693720; c=relaxed/simple;
	bh=BuFSeOlnaoKLoISZGLh1Gmq6PiBuECWaiGWsrQEbBRM=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=HHjdXS2cNxDZn4hHpfbJwvjYQTljOt/ZuunkDr5JaFQWVUmWZhPREcewKjVY5DCAMpRi9/ZbLaCbGVe6SbkGlLkVLUatADpwwr8/cGR691ORMv4FjWnkdyIMWOz/NJZZxrEZVnStkcJjgbk2rMAaC8MzsEDP6oOx7dLgWu/WNDw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=PpV1qKL6; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="PpV1qKL6"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 1A4381F000E9;
	Mon, 25 May 2026 07:21:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1779693719;
	bh=mAD+alw+FgLr2aTRZdvREfefs+UUzu4yYSDyn+O281Q=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=PpV1qKL66RN0w+s4Z35uXVbWPBhdKV8HZnQPnHDurGhevFAYLIwJqTvy++WNaFjJW
	 BMmGiOgWUt+5spvWa1d0Hyt4vrLkiSxwHI4BTB/t5VG8KLsdyywf3WZTt0Crmc6boF
	 SOCDprfR9ZOgiktp6UAEIqwkWLYlxMzIzavZIJQHmhVuMzqdpvirQFnD0ls3I7QhiV
	 cahxUJ3OvYhEkJIe0y63gmvA/dftNDHiVKOxwEr+qHISi113lzVq/T2OmBiw4aBZ3P
	 gqmUJg6k5HxCoO6a2v/bCuHGTXegT0VBr5t+zC99IQ636Cja+S6pWVVCcp8gAB/h1o
	 XMCZi3VdutQaA==
Date: Mon, 25 May 2026 00:21:57 -0700
From: Drew Fustini <fustini@kernel.org>
To: sashiko-reviews@lists.linux.dev
Cc: robh@kernel.org, conor+dt@kernel.org, devicetree@vger.kernel.org
Subject: Re: [PATCH RFC v5 09/18] riscv_cbqri: Add bandwidth controller probe
 and allocation device ops
Message-ID: <ahP4lWprbwqdO_14@gen8>
References: <20260524-ssqosid-cbqri-rqsc-v7-0-v5-9-78d3a7ba9dbe@kernel.org>
 <20260525003040.9E4E41F000E9@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: sashiko-reviews@lists.linux.dev
List-Id: <sashiko-reviews.lists.linux.dev>
List-Subscribe: <mailto:sashiko-reviews+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:sashiko-reviews+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260525003040.9E4E41F000E9@smtp.kernel.org>

On Mon, May 25, 2026 at 12:30:40AM +0000, sashiko-bot@kernel.org wrote:
> > +static int cbqri_bc_alloc_op(struct cbqri_controller *ctrl, int operation, int rcid)
> > +{
> > +	int reg_offset = CBQRI_BC_ALLOC_CTL_OFF;
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
> > +	iowrite64(reg, ctrl->base + reg_offset);
> 
> [Severity: High]
> Does this operation inadvertently preserve the Access Type (AT) field left over
> by firmware or prior probe operations?

I'll match cbqri_cc_alloc_op() and clear AT.

> > +static int cbqri_apply_bc_field(struct cbqri_controller *ctrl, u32 closid,
> > +				enum cbqri_bc_field field, u64 val)
> > +{
> > +	u64 rbwb = ctrl->rbwb_cache[closid];
> > +	u64 mweight = ctrl->mweight_cache[closid];
> > +	u64 readback;
> > +	int ret;
> > +
> > +	lockdep_assert_held(&ctrl->lock);
> > +
> > +	if (field == CBQRI_BC_FIELD_RBWB)
> > +		rbwb = val;
> > +	else
> > +		mweight = val;
> > +
> > +	cbqri_set_bc_bw_alloc(ctrl, rbwb, mweight);
> > +
> > +	ret = cbqri_bc_alloc_op(ctrl, CBQRI_BC_ALLOC_CTL_OP_CONFIG_LIMIT, closid);
> 
> Could modifying the hardware staging register before verifying the controller
> is ready cause a silent corruption of the unmodified field?

Yes, I'll change it to wait for BUSY=0 before the staging write.

> > +/*
> > + * Read the Rbwb (reserved bandwidth blocks) for closid via READ_LIMIT.
> > + */
> > +int cbqri_read_rbwb(struct cbqri_controller *ctrl, u32 closid, u64 *rbwb_out)
> > +{
> > +	int err;
> > +
> > +	mutex_lock(&ctrl->lock);
> > +	err = cbqri_bc_alloc_op(ctrl, CBQRI_BC_ALLOC_CTL_OP_READ_LIMIT, closid);
> > +	if (err == 0)
> > +		*rbwb_out = cbqri_get_rbwb(ctrl);
> > +	mutex_unlock(&ctrl->lock);
> > +	return err;
> > +}
> > +
> > +/*
> > + * Read the Mweight (opportunistic weight) for closid via READ_LIMIT.
> > + */
> > +int cbqri_read_mweight(struct cbqri_controller *ctrl, u32 closid, u64 *mweight_out)
> > +{
> > +	int err;
> > +
> > +	mutex_lock(&ctrl->lock);
> > +	err = cbqri_bc_alloc_op(ctrl, CBQRI_BC_ALLOC_CTL_OP_READ_LIMIT, closid);
> > +	if (err == 0)
> > +		*mweight_out = cbqri_get_mweight(ctrl);
> > +	mutex_unlock(&ctrl->lock);
> > +	return err;
> > +}
> 
> [Severity: High]
> Are these standalone read functions vulnerable to the same silent READ_LIMIT
> no-op hardware bug described in the commit message?
> 
> Since they execute a bare READ_LIMIT without the pre-write sentinel validation
> used in cbqri_apply_bc_field(), could they return stale data from a prior
> operation if the hardware bug triggers?

I'll fix this in v6 with sentinel.

-Drew

