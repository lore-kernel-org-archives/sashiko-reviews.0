Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6090843DEAB;
	Thu, 17 Sep 2026 22:07:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789682873; cv=none; b=sx3yaFEi6EGKjr9K29rP3zi6N9Dvq1+aZQWoDxF0iXmPQyQU6rTSdK4Bnio2vSamdehmG9jRuXq03hQpeA6fmCjj+ArYaSMg1eFonVDzek2+GauqTRTNFD3QykfHNssCknIDSnLgnjVcFcM7iP4ZpakteCwT6mZatnFp6hz/YRE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789682873; c=relaxed/simple;
	bh=j+UbY1H+vpXgccHxYXfuNA9zAgQCCsghT3wMm3gu7MM=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=RFhYIEpdEkG/nmWzN2378yEx03wwnN7XKTH0FYhc6am3kUEyhxgtxUtxD8c+4GbpLNa1ST5pr8LZFYPZqmux5F8a/SgrePyepQ4c4TIwccbWQAkfxoB/v6HYt8lSAOhtEG2RSDvU4aai8ku8ykDPqG76VMQElmKN1/kQy0+qEKU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=Cujtwz84; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="Cujtwz84"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id B45D11F000FF;
	Thu, 17 Sep 2026 22:07:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1789682871;
	bh=QOF+LD6Hf1s/Wnqrk97hdi50PbTpz77VKYY+JRqWNdc=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=Cujtwz84abGWT5Z96tfsiqDU5vtW1DxqUx3o3HkQDKHWSDR396JoSdYYonJM1uShU
	 GngacMHLuyK4BeXtJI+FnyK0CayrUyr35j8Yp5QNLUv7wQzhKUQNtBA45W/zAE81+E
	 meN3JdRoIgI7vfcKqHquMbCqgm3gkb6tK06jzLKtNif82gCf553NMGdKlYuF1K2EqG
	 Har4HWzihLWMOHAd/iCvbNNwlMCuj706IDalgxyJhc6osYGD4A/xHtwtahfI271Ffy
	 VHk6inzWyEd3u9a+eWdIXU2wmJ4SFoPeD5k+GeP8dafmhVM3OKqgJ5qhrym5nUkUt3
	 Cf5WZiAAo8NKQ==
Date: Thu, 17 Sep 2026 17:07:50 -0500
From: Rob Herring <robh@kernel.org>
To: sashiko-reviews@lists.linux.dev
Cc: Wandun Chen <chenwandun1@gmail.com>, devicetree@vger.kernel.org,
	conor+dt@kernel.org
Subject: Re: [PATCH v6 09/10] of: reserved_mem: mark /memreserve/ entries as
 MEMBLOCK_NODUMP
Message-ID: <20260917220750.GA4013814-robh@kernel.org>
References: <20260902073116.802752-1-chenwandun1@gmail.com>
 <20260902073116.802752-10-chenwandun1@gmail.com>
 <20260902090211.9DA891F000E9@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: sashiko-reviews@lists.linux.dev
List-Id: <sashiko-reviews.lists.linux.dev>
List-Subscribe: <mailto:sashiko-reviews+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:sashiko-reviews+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260902090211.9DA891F000E9@smtp.kernel.org>

On Wed, Sep 02, 2026 at 09:02:11AM +0000, sashiko-bot@kernel.org wrote:
> Thank you for your contribution! Sashiko AI review found 2 potential issue(s) to consider:
> - [High] FDT /memreserve/ entries marked as MEMBLOCK_NODUMP can be later freed to the buddy allocator, causing active kernel memory to be silently omitted from crash dumps.
> - [Medium] 64-bit FDT reserve entries are checked for overlap in 64-bit space but implicitly truncated to phys_addr_t when marked as NODUMP, potentially corrupting dumpable regions on 32-bit systems.
> --
> 
> commit f6e6bcd14fb6f4946f258fc34089bbbdcd52f624
> Author: Wandun Chen <chenwandun@lixiang.com>
> 
> of: reserved_mem: mark /memreserve/ entries as MEMBLOCK_NODUMP
> 
> This patch marks /memreserve/ entries in the device tree as MEMBLOCK_NODUMP
> so they are excluded from kernel crash dumps. It explicitly leaves regions
> that overlap with a dumpable region unmarked.
> 
> > diff --git a/drivers/of/of_reserved_mem.c b/drivers/of/of_reserved_mem.c
> > index f29a07e8fb23e..a42cf6eac55b5 100644
> > --- a/drivers/of/of_reserved_mem.c
> > +++ b/drivers/of/of_reserved_mem.c
> [ ... ]
> > @@ -251,6 +251,39 @@ static void __init __rmem_check_for_overlap(void)
> >  	}
> >  }
> >  
> > +void __init fdt_mark_memreserve_nodump(void)
> > +{
> > +	u64 base, size;
> > +	int n;
> > +	const void *fdt = initial_boot_params;
> > +
> > +	if (!IS_ENABLED(CONFIG_CRASH_DUMP))
> > +		return;
> > +
> > +	if (!fdt)
> > +		return;
> > +
> > +	for (n = 0; ; n++) {
> > +		int i;
> > +
> > +		if (fdt_get_mem_rsv(fdt, n, &base, &size))
> > +			break;
> > +		if (!size)
> > +			break;
> > +
> > +		for (i = 0; i < reserved_mem_count; i++) {
> > +			struct reserved_mem *rmem = &reserved_mem[i];
> > +
> > +			if (rmem->dumpable &&
> > +			    base < (u64)rmem->base + (u64)rmem->size &&
> > +			    (u64)rmem->base < base + size)
> > +				break;
> > +		}
> > +		if (i == reserved_mem_count)
> > +			memblock_mark_nodump(base, size);
> 
> [Severity: Medium]
> Will this corrupt dumpable regions on 32-bit systems?
> 
> base and size are u64, so the overlap check evaluates safely in 64-bit
> space. However, memblock_mark_nodump() takes phys_addr_t. On 32-bit
> systems, could a 64-bit FDT reserve entry > 4GB correctly pass the overlap
> check above, but then get implicitly truncated to a 32-bit address when
> passed to memblock_mark_nodump(), incorrectly marking a lower 32-bit
> physical address as NODUMP without having checked it for overlap?

Unlikely. Such a system would probably enable LPAE or equivalent.
 
> [Severity: High]
> Can this cause active kernel memory to be silently omitted from crash dumps?
> 
> If the bootloader specifies a /memreserve/ entry for memory that the kernel
> later frees (such as the initrd), this memory is returned to the buddy
> allocator.
> 
> Since the MEMBLOCK_NODUMP flag is never cleared, will this cause reused
> pages to be incorrectly skipped and omitted from the crash dump later on?

This seems like an issue. Both the FDT and initrd are typically in 
/memreserve/ and can be moved.

Rob
