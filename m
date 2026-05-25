Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 032743A7F52;
	Mon, 25 May 2026 06:58:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779692295; cv=none; b=MLkjnOUUMRdrdK4fm3lp3nRi5pVGtmK+3v8rpjBvopBjG3rNq6Jd5hE+BQ5mRHn40iwp4swWnZ8zFYro0P1AafQm0hKU79xqHZvjXhezmDxy2T7DmNlH2Opj30l4xLNfYvu3kaU0oxmk2mn6Wf9yTYseXxk3E7bxeKMcuU+wIW8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779692295; c=relaxed/simple;
	bh=+Gr3bo/4b6bslzWH5OQc0A7oXbghh7OsNlaAnkLPC64=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=FsnmiEixlk8vb2R+F0NQdhIEfzQ0Tdb2FYiG9IHxMWLaQ0pn3Lmp53yPoAuNlattM3/spRGSMbl6pyZThDF8WWpqMbFLEJneLGXeIgayzSDB6lhlPNzzgr2wuHD6uKgwn26XbrImOCSDevuhKD8sbeMKrbS2HC1Nez6tNJqvAk8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=RzhSYObS; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="RzhSYObS"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 7E3F61F000E9;
	Mon, 25 May 2026 06:58:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1779692290;
	bh=9GMsuVITApWCiCWjCPt+wl5oC/ya7MXvk1NcNbZ+Loc=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=RzhSYObSOslRMXDdFHSY3I9529tqzP3MbZ+XBOZRZ80wJoo7/vadxT0I/6bi9ZmeP
	 zBYuVHVU9hjypuMSut6ohuK/BKm309XY2AC0mkiqJSqbZBU/zh9Pb5r6s5FtbKeFep
	 GsRuA8fgMLpw1dt4xEBdj9IfWJt5YvoLCByYAsysUN+/AMX5QVNYKJAnY4WKc1Nw43
	 aXXqzq+jxlrdWB5R+RI3tHYxGwgx8F0oeNLYOLGlrHdHqUlifsdtBONP8EO0yBKEyB
	 ltzUvp45xZe8+eUCRx8do05mA/ZKVdvzdYOSQ3BbLoANwDFTNA/woiG3xu3PJ0IDFW
	 tDnxsGVi/Eglg==
Date: Sun, 24 May 2026 23:58:09 -0700
From: Drew Fustini <fustini@kernel.org>
To: sashiko-reviews@lists.linux.dev
Cc: devicetree@vger.kernel.org, robh@kernel.org, conor+dt@kernel.org
Subject: Re: [PATCH RFC v5 08/18] riscv_cbqri: Add capacity controller
 monitoring device ops
Message-ID: <ahPzAaVon3TLSq8W@gen8>
References: <20260524-ssqosid-cbqri-rqsc-v7-0-v5-8-78d3a7ba9dbe@kernel.org>
 <20260525002922.B257D1F000E9@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: sashiko-reviews@lists.linux.dev
List-Id: <sashiko-reviews.lists.linux.dev>
List-Subscribe: <mailto:sashiko-reviews+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:sashiko-reviews+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260525002922.B257D1F000E9@smtp.kernel.org>

On Mon, May 25, 2026 at 12:29:22AM +0000, sashiko-bot@kernel.org wrote:
> > +	/* Probe monitoring features */
> > +	err = cbqri_probe_feature(ctrl, CBQRI_CC_MON_CTL_OFF,
> > +				  CBQRI_CC_MON_CTL_OP_READ_COUNTER, &status,
> > +				  &has_mon_at_code);
> 
> [Severity: Medium]
> Is it safe to reuse cbqri_probe_feature() for the MON_CTL register here?
> 
> cbqri_probe_feature() attempts to verify Access Type (AT) support by writing
> to the AT field bits. However, the MON_CTL register does not define an AT
> field, which means this implicitly writes to reserved (WPRI) bits. Could
> this helper be updated to conditionally skip the AT probe sequence for
> monitoring registers?

WPRI tolerates the write so this is not a correctness issue today. But
to avoid confusion, I will split cbqri_probe_feature() so the AT probe
sequence is only run for alloc_ctl registers.

> Will this probe sequence falsely disable monitoring on hardware?
> 
> This invokes cbqri_probe_feature() using the READ_COUNTER operation, which
> zeroes out all other fields including EVT_ID. This sends a read command for
> the NONE event (EVT_ID=0) to an unconfigured slot, which the hardware may
> reject with an error status. If the hardware returns an error, this check
> will fail and disable monitoring. Could this probe instead use
> CONFIG_EVENT or handle expected failure codes?

The NONE event as is a valid configured state. But I will switch the
probe operation to CONFIG_EVENT with a probe-safe EVT_ID to remove the
ambiguity.

> > +/*
> > + * Pre-arm every MCID with the Occupancy event so a subsequent READ_COUNTER
> > + * just snapshots the live counter rather than re-configuring the slot.
> > + * Called once per CC during resctrl-side cpuhp online for the L3 monitoring
> > + * domain.
> > + */
> > +int cbqri_init_mon_counters(struct cbqri_controller *ctrl)
> > +{
> > +	int i, err;
> > +
> > +	for (i = 0; i < ctrl->mcid_count; i++) {
> > +		mutex_lock(&ctrl->lock);
> > +		err = cbqri_mon_op(ctrl, CBQRI_CC_MON_CTL_OFF,
> > +				   CBQRI_CC_MON_CTL_OP_CONFIG_EVENT,
> > +				   i, CBQRI_CC_EVT_ID_OCCUPANCY, NULL);
> 
> [Severity: Medium]
> Does mcid_count need bounds checking against the physical hardware limit?
> 
> The ctrl->mcid_count value is used as the loop boundary, but if firmware
> supplies an erroneously large value, this loop could block the CPU for an
> extended period during hotplug. 
> 
> Additionally, because the MCID field mask is 12 bits, any mcid_count larger
> than 4096 will be truncated in cbqri_mon_op(), causing logical MCIDs to
> incorrectly alias to the same physical hardware slot. Should an upper bound be
> enforced on mcid_count?

I'll add a check in v6.

> > +/* mon_ctl field masks (CC and BC share an identical OP/MCID/EVT_ID/STATUS layout) */
> > +#define CBQRI_MON_CTL_OP_MASK        GENMASK(4, 0)
> > +#define CBQRI_MON_CTL_MCID_MASK      GENMASK(19, 8)
> > +#define CBQRI_MON_CTL_EVT_ID_MASK    GENMASK(27, 20)
> 
> [Severity: High]
> Will using GENMASK() here inadvertently clear the upper 32 bits of the 64-bit
> control register on 32-bit architectures?
> 
> When used with FIELD_MODIFY(), ~(_mask) will evaluate to a 32-bit unsigned
> value which gets zero-extended to 64 bits. When this is bitwise ANDed with
> the 64-bit register variable, it will wipe out the upper 32 bits, corrupting
> the STATUS field before the register is written back. Should these 64-bit
> field masks be defined with GENMASK_ULL() instead?

Yes, I will chnage to GENMASK_ULL.

-Drew
