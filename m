Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6659C2D97B7;
	Mon,  6 Jul 2026 17:09:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783357797; cv=none; b=gTbsTl95XEso7nnU+EBu5kH2DR7VD4G1la74nQJdB/m1ZLBnNg7HHihwg/XwmLbSrwtIf92A9iZNXSO3AgIrqyC8vrgwmtLHD2AAqpy2r+/pLXJsZhxwAg5FnJHmC3BlNJF+6KkCoP3INZb+mckncjApevgp6QKtLD1KGdy835g=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783357797; c=relaxed/simple;
	bh=FZnVAyPoKE0HqUsvNE//u/0600UjdpOmFaGh5S4ecI8=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=a26B/y16AdCjYtUxaXU++wbobbGmE7A2il/zD0r9wx703LiQnHs1LvQB8RcTb84IRh1jquLA8u8kkzfSsqKYkHSZ9jS0eWPxeZw/FAxINcOxqfoH8YECHFKJkHNhy6l/3ta98Ynrz8bVtTiah3Ui1plVsSmRavny0QenozskGHY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=Fu3xXM12; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="Fu3xXM12"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id E8AE01F000E9;
	Mon,  6 Jul 2026 17:09:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1783357796;
	bh=yB4oIgQGO46PMb4gsctC7iLJbIKv1QcdvH35LXpZ/A0=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=Fu3xXM12KkAoeUJxxRJD4DNhzvpS5+vhRXhqM2DAYemlpuUZqBJd/Dqc0Uqy/U6T8
	 pn/Qq6KBxvtS1SFe8AeA8qLHUdm0nyxN1jx6Iug65VGdVamzbsSGVc75gT0uBpzDY8
	 m6bqNX5nHSa5Hu4Wp7EAUPSA+FxLF8lFsywKBvTlRUFJQkGVQOGceqRS7qAJAn3T6I
	 0iqqAeyegZiAeznbBIw4o0EBATTcEkFIc039i2nYQ9t2RL7bUE5qHjGvPbSBQIEOKI
	 ZJ17SF7TCUGzAAGeli3KZcO9xlt2jDFQvNRasm2ib+FvRjVOF5Z9mS8ULSi3vQyh5o
	 LQgZ23V9IezPQ==
Date: Mon, 6 Jul 2026 10:09:54 -0700
From: Drew Fustini <fustini@kernel.org>
To: sashiko-reviews@lists.linux.dev
Cc: linux-riscv@lists.infradead.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v3 8/8] riscv_cbqri: Add CBQRI capacity allocation
 platform driver
Message-ID: <akvhYsHxMsTfBEnv@x1>
References: <20260628-dfustini-atl-sc-cbqri-dt-v3-0-c9c1342fe3cf@kernel.org>
 <20260628-dfustini-atl-sc-cbqri-dt-v3-8-c9c1342fe3cf@kernel.org>
 <20260628212744.1AD731F000E9@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: sashiko-reviews@lists.linux.dev
List-Id: <sashiko-reviews.lists.linux.dev>
List-Subscribe: <mailto:sashiko-reviews+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:sashiko-reviews+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260628212744.1AD731F000E9@smtp.kernel.org>

On Sun, Jun 28, 2026 at 09:27:43PM +0000, sashiko-bot@kernel.org wrote:
> Thank you for your contribution! Sashiko AI review found 1 potential issue(s) to consider:
> - [Medium] cbqri_capacity_probe() incorrectly uses get_cpu_cacheinfo_level() to find the cacheinfo, which will fail for split caches (e.g., L1I/L1D).
> --
> 
> commit 1a6b06fa1768e5d101b318b8e5167a959fc10696
> Author: Drew Fustini <fustini@kernel.org>
> 
> riscv_cbqri: Add CBQRI capacity allocation platform driver
> 
> This commit adds a device-tree platform driver for the RISC-V CBQRI capacity
> controller. It reads the cache level from the device tree and matches it
> against the system's cacheinfo to get the resctrl domain ID and shared harts.
> 
> > diff --git a/drivers/resctrl/cbqri_capacity.c b/drivers/resctrl/cbqri_capacity.c
> > new file mode 100644
> > index 0000000000000..2172432eb3287
> > --- /dev/null
> > +++ b/drivers/resctrl/cbqri_capacity.c
> [ ... ]
> > +static int cbqri_capacity_probe(struct platform_device *pdev)
> > +{
> [ ... ]
> > +	/*
> > +	 * Associate the controller with its cache instance via
> > +	 * cacheinfo. The matching cache provides the cache id and the
> > +	 * set of harts that share the cache.
> > +	 */
> > +	cache_id = -1;
> > +	cpus_read_lock();
> > +	for_each_online_cpu(cpu) {
> > +		struct cacheinfo *ci = get_cpu_cacheinfo_level(cpu, cache_level);
> 
> [Severity: Medium]
> Could this fail to match split caches, like an L1 data cache?
> 
> The get_cpu_cacheinfo_level() function unconditionally returns the first
> cacheinfo leaf it finds at the requested level and stops searching. If the
> given level has multiple leaves (for example, L1 instruction and L1 data),
> and the device tree node refers to the second leaf, this loop will miss it.
> This would cause the fw_token check to fail and the probe to return -ENODEV.

riscv,cbqri-cache points at a separate unified cache node. Split L1 I/D
come from i-cache-size/d-cache-size on the CPU node which have no
phandle. Per the CBQRI spec, the capacity controller governs a unified
shared cache, so a split private L1 is not a valid allocation target.

-Drew
~                                                                                                                                        
~                        
