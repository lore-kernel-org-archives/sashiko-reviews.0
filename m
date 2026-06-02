Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 02AEA14A8B;
	Tue,  2 Jun 2026 04:32:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1780374747; cv=none; b=akq1phZ+CVWvGyOz+w4dyqlpzx9hZ7D5pnz/eUM3l5ShvV7lLt/V9GHHZ0Ev8ED2s3WNEarJ21QAND1E6CHEeGOGVfLyTIpHd8a5ymhIdYjyl28IcMxgoj/nBG73pzOmAQU7zofa7c5j6K3XrdLlUBw/eypQ/S8A96IHiejYPYg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1780374747; c=relaxed/simple;
	bh=Gf8Kkf5+WgD+8BCdBzRCuiTPvdPXZeXmP+v1xmws//w=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=YEvSxfLTFv8obUSzRjBjA/loSpFVWjDgmAfN3aLRgjq6K+BYKEgsiM8Wyxe0KlQcAm0XwGVPbSELiOrCOyZl0aTn81R+DmqX8rHtC6phRmMGZsHIi7NtaOxFKWA0ss+qwANEsDOuSbBhTcAagfY2ebJQ7IShI6mOvUYOMi5/VzY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=mnELyeQi; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="mnELyeQi"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id A4E7E1F00893;
	Tue,  2 Jun 2026 04:32:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1780374746;
	bh=ZCR8z9TRk89y9aR68XfemeQQYeqN3XdefKmdyRl1IeY=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=mnELyeQi5PCD66+BMAKZf0NFvzxjGhfYZHn9AUOJ0aigprt2Mm/z8UoOVZuYx5QHT
	 UTu8nDW8LwdQJu+l9c1fPgma9ic/ry8xg8oma7n21sAfd2ACmxp4vkDTr4pox2oYXn
	 7kzcKTEjkJhsNt6OL5E6/B+R1ji8wkrKK7ZFJZyABV/hXSPOIdao56iuaOGDL6IQAg
	 XsjDAHs0jPLd/6bKPXngx15Dou+9o6pYouD+/4foWQN2GTAaYkZJwIZ+bn0ZWM1TCH
	 DcL0+mn43o3HkN7CCNL+eIFnVWFymv3YjoCnfhSRkDgR/IWH17ttaW6fyVicCgar0V
	 2/sgc+t5UImPw==
Date: Mon, 1 Jun 2026 21:31:57 -0700
From: Drew Fustini <fustini@kernel.org>
To: sashiko-reviews@lists.linux.dev
Cc: linux-kernel@vger.kernel.org
Subject: Re: [PATCH RFC v6 11/18] riscv_cbqri: resctrl: Add cache allocation
 via capacity block mask
Message-ID: <ah5cvQ6QHqzQYd46@gen8>
References: <20260601-ssqosid-cbqri-rqsc-v7-0-v6-11-baf00f50028a@kernel.org>
 <20260601205608.D86481F00893@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: sashiko-reviews@lists.linux.dev
List-Id: <sashiko-reviews.lists.linux.dev>
List-Subscribe: <mailto:sashiko-reviews+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:sashiko-reviews+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260601205608.D86481F00893@smtp.kernel.org>

On Mon, Jun 01, 2026 at 08:56:08PM +0000, sashiko-bot@kernel.org wrote:
> > @@ -595,6 +595,7 @@ config RISCV_ISA_SSQOSID
> >  	bool "Ssqosid extension support for supervisor mode Quality of Service ID"
> >  	depends on 64BIT
> >  	default n
> > +	select ARCH_HAS_CPU_RESCTRL
> 
> Does selecting ARCH_HAS_CPU_RESCTRL here unconditionally allow RESCTRL_FS
> to be enabled, even if the RISC-V backend driver isn't built?
> 
> Since the backend implementation in cbqri_resctrl.c is gated by
> RISCV_CBQRI_DRIVER:
> 
> config RISCV_CBQRI_RESCTRL_FS
>     bool
>     default y if RISCV_CBQRI_DRIVER && RESCTRL_FS
> 
> Could this result in a linker error for missing resctrl_arch_* symbols if
> RISCV_ISA_SSQOSID is enabled but RISCV_CBQRI_DRIVER is disabled?

This is not reachable. RESCTRL_FS cannot be enabled without the backend that provides the resctrl_arch_* symbols.

> > +		cbqri_res = &cbqri_resctrl_resources[rid];
> > +		if (cbqri_res->ctrl) {
> > +			/*
> > +			 * CCs at the same cache level must agree on every cap
> > +			 * resctrl exposes globally. Reject mismatches at pick
> > +			 * time so the inconsistency is visible at boot.
> > +			 */
> > +			if (cbqri_res->ctrl->rcid_count != ctrl->rcid_count ||
> > +			    cbqri_res->ctrl->cc.ncblks != ctrl->cc.ncblks ||
> > +			    cbqri_res->ctrl->cc.supports_alloc_at_code !=
> > +				    ctrl->cc.supports_alloc_at_code ||
> > +			    cbqri_res->ctrl->alloc_capable != ctrl->alloc_capable) {
> 
> Is this alloc_capable mismatch check dead code?
> 
> Because the earlier loop condition explicitly skips controllers where
> alloc_capable is false:
> 
>     if (!ctrl->alloc_capable) {
>         ...
>         continue;
>     }
> 
> Will both cbqri_res->ctrl and the current ctrl always have alloc_capable
> set to true at this point in cbqri_resctrl_pick_caches? This seems to
> cause non-alloc-capable controllers to be silently ignored rather than
> triggering the fatal configuration error described in the commit message.

It is harmless, but I will drop the dead term in v7 for clarity.

Drew
