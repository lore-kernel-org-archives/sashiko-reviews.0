Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 175F91E515;
	Wed,  1 Jul 2026 00:24:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1782865500; cv=none; b=VKaZkw0QQsGoTPk8aPF7AE2SJgfxLOmjuh+wG3OnE3zvdS+BeP2RGgmRN1tjLMfQHhSuGIhyzCbWwCxHxbv+zZ+3VZSBxem4Th6Jz78prVRGQAh78rNdYlefUw/34AEzmlw5pEqAYtz+6nGairLbI+ROpZFQPQezlDLnJCN2ZQU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1782865500; c=relaxed/simple;
	bh=vrP2eF8TpH/JyvWNMP3bJ0MqXzXIP0C5JjTRPP9RZLQ=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=nAt+VJ2kMoDcCCAM+I3KxoFW2dbU8lFxmINi/Yg4bHTe1gFBsTtZuEYTF9tT1MNq3TsOI2fVwDKRtjG/t17OoaLdaUtu41FKPn4jRoNnM64OTYR5vOSIw3jgXRxGta4eNO0JaS1k4tGeioFbgZuCm7PHpL01t7CpQqHcsjU7O9U=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=foX0Ox/Q; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="foX0Ox/Q"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id AB94E1F000E9;
	Wed,  1 Jul 2026 00:24:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1782865498;
	bh=dci6dX6+MP6gKFnB5cQVptU1hDsXvIN+MC/UNHCIfHQ=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=foX0Ox/QwIvyIleWA2WFWcoNl7Zwe7QcewaoAY2tu2MSXtSQlxkdP9idrRq6oIPd2
	 FwXoxH+6DXIVebeRVKDms+XGKkBbFgACM3qE+PS3ZsEgb6wn2lNVZ5uZtfpFBR2Bya
	 LsEd1TQbW+fO1cs1LA/395KjC58z8odqcLEKOgHhzOywrhNu0ICHgDaR32Li7P0Ki5
	 rgmtyzSaFxp7LVM7rV7qZdEifyHU3R05ceoMZW272Ok/7P/SsDPttz0e9I6+zObO0Q
	 sUmnrLp2N1+dT6sMtQY5EFEa99wqb4MqTeO/FA33k7cEsCJtqid7XZU9lODDydXFfI
	 2uLKCzM3Rzqlg==
Date: Tue, 30 Jun 2026 17:24:57 -0700
From: Drew Fustini <fustini@kernel.org>
To: sashiko-reviews@lists.linux.dev
Cc: linux-kernel@vger.kernel.org, linux-riscv@lists.infradead.org
Subject: Re: [PATCH v3 4/8] riscv_cbqri: Add capacity controller probe and
 allocation device ops
Message-ID: <akReWcXqVmmIxPmM@thelio>
References: <20260628-dfustini-atl-sc-cbqri-dt-v3-0-c9c1342fe3cf@kernel.org>
 <20260628-dfustini-atl-sc-cbqri-dt-v3-4-c9c1342fe3cf@kernel.org>
 <20260628212810.05F6D1F00A3A@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: sashiko-reviews@lists.linux.dev
List-Id: <sashiko-reviews.lists.linux.dev>
List-Subscribe: <mailto:sashiko-reviews+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:sashiko-reviews+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260628212810.05F6D1F00A3A@smtp.kernel.org>

On Sun, Jun 28, 2026 at 09:28:09PM +0000, sashiko-bot@kernel.org wrote:
> Thank you for your contribution! Sashiko AI review found 1 potential issue(s) to consider:
> - [Medium] Unspecified evaluation order in `cbqri_readq` causes a torn read during hardware polling, leading to false AT capability detection.
> --
> 
> commit a52377aec62b1aa81e5439ad733c3839af6693c6
> Author: Drew Fustini <fustini@kernel.org>
> 
> riscv_cbqri: Add capacity controller probe and allocation device ops
> 
> Add support for the RISC-V CBQRI capacity controller. A platform driver
> passes a cbqri_controller_info descriptor together with the cache level
> to riscv_cbqri_register_cc_dt(), which probes the controller and adds it
> to the controller list.
> 
> > diff --git a/drivers/resctrl/cbqri_devices.c b/drivers/resctrl/cbqri_devices.c
> > new file mode 100644
> > index 0000000000000..69df46e07df17
> > --- /dev/null
> > +++ b/drivers/resctrl/cbqri_devices.c
> [ ... ]
> > +static u64 cbqri_readq(void __iomem *addr)
> > +{
> > +	return (u64)readl(addr) | ((u64)readl(addr + 4) << 32);
> > +}
> 
> [Severity: Medium]
> Could the unspecified evaluation order here cause a torn read during hardware
> polling?
> 
> Since the C standard does not specify the evaluation order of the operands
> to the bitwise OR operator, the compiler may emit the lower 32-bit read
> before the upper 32-bit read.
> 
> During the polling loop, if the final iteration reads the lower 32 bits
> while the busy flag is still set, and then the hardware completes the
> operation and clears the busy flag before the upper 32-bit read executes,
> the loop will terminate and return this torn value.

A tear is theoretically possible, but it is harmless here because the
two halves carry independent fields. BUSY and STATUS both live in the
high word, so a single readl(addr + 4) reads both at once. AT lives in
the low word, which the poll never inspects. The poll consumes only BUSY
and STATUS, so a tear cannot change when it ends or the STATUS it
returns.

> [ ... ]
> > +static int cbqri_probe_feature(struct cbqri_controller *ctrl, int reg_offset,
> > +			       int operation, int *status, bool *access_type_supported)
> > +{
> [ ... ]
> > +		writel(lower_32_bits(reg), ctrl->base + reg_offset);
> > +		if (cbqri_wait_busy_flag(ctrl, reg_offset, &reg) < 0) {
> > +			pr_err("BUSY timeout setting AT field\n");
> > +			return -EIO;
> > +		}
> > +
> > +		/*
> > +		 * If the AT field value has been reset to zero,
> > +		 * then the AT support is not present
> > +		 */
> > +		at = FIELD_GET(CBQRI_CONTROL_REGISTERS_AT_MASK, reg);
> > +		if (at == CBQRI_CONTROL_REGISTERS_AT_CODE)
> > +			*access_type_supported = true;
> 
> [Severity: Medium]
> Does the torn read from cbqri_readq() result in misdetecting capability
> support here?
> 
> If cbqri_wait_busy_flag() returns a torn value with a stale lower half, the
> driver may incorrectly detect Access Type support on hardware that does not
> support it.
> 
> This could break cache allocation isolation guarantees, as the driver will
> split capacity blocks into CODE and DATA masks, but the hardware will silently
> treat them as a single pool.

No. The AT read back is the result of the drivers's own AT=CODE write,
not a live hardware status. A tear cannot catch it mid-change. Per the
CBQRI spec, a controller without AT support makes AT read-only zero. The
write is dropped and AT reads 0, never transiently CODE. On hardware
that does support AT, the write takes effect and AT reads back CODE, so
that direction is correct too.

-Drew
