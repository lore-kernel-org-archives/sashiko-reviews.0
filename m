Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 23FC72C11F1;
	Mon, 29 Jun 2026 22:46:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1782773195; cv=none; b=SAiPAONBheJi3JURc5BWJPBS+dHK0rKtwsYmhBSJONWIwLyTY8k/ZAMTWf0W7pKnJl53YgPzylalJKl91wUkakU8SUGdXtVLRLGdcumBxhpt/1QzoHA5KWfQbqtqe7lT4d1IHB/hL91oMJuo46twc7iCNdtsrgN4rJ7W2sATxgI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1782773195; c=relaxed/simple;
	bh=lui/TN3E1W3uzarPwSNOLf+T0svkDeV8Nw/Plsdjcwk=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=RtcyKX6xr3xh0px0AmYCSDjopzhWQ7FDbGeq0o5mIKKYSTIrHXsloJGw1b6gQmjzgPV/QuyqfhfH3a4bw0qsUzBcLBji7zLnbV5t0RLhN0kDcdhmzl9UnC2CBW6QrUKg4zmHeO1mznKOgRuwUiWpFppGmeF+Or0dNgEmabJvUlM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=FBqEbyp1; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="FBqEbyp1"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id B335A1F000E9;
	Mon, 29 Jun 2026 22:46:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1782773193;
	bh=LvtQOT1w607AXJpvAZlCEHoTQld1qa57ANws1Ah1o4Q=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=FBqEbyp1/Tnko9boOmLGRtzfous7Vq7W+sng5mOBVtL9TaWeZlznguqKG83b6e3yE
	 bmW1Hwp78yaArZlt5Y2wn+iKt6HZJYKNWxv9QA0kicCqbHPjscQUrGBgOOgTj4JfFP
	 vNVu4Ar1LG8D/Nv3szsMQt2IBUsmxPPdIylukXs6bcNh5WxwfU6FUK8fNBlZn8NHHi
	 Bc0TDzbzXMtaq+WUWSF8LkE3TGeCeekAV0q8xA8RopbafHSMZAJzRcnQDHrro3M16B
	 OVNEMuUL/eGdI4ph607NXIIL2FztQZvQwjAUfcPItMXgoz+aJjKFclrgZe6ixpNutR
	 BH0c4uAo0uNlQ==
Date: Mon, 29 Jun 2026 15:46:32 -0700
From: Drew Fustini <fustini@kernel.org>
To: sashiko-reviews@lists.linux.dev
Cc: linux-kernel@vger.kernel.org, linux-riscv@lists.infradead.org
Subject: Re: [PATCH v3 3/8] riscv: Add support for srmcfg CSR from Ssqosid
 extension
Message-ID: <akL1yNTmMvfB3uzy@x1>
References: <20260628-dfustini-atl-sc-cbqri-dt-v3-0-c9c1342fe3cf@kernel.org>
 <20260628-dfustini-atl-sc-cbqri-dt-v3-3-c9c1342fe3cf@kernel.org>
 <20260628212820.D0DD51F000E9@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: sashiko-reviews@lists.linux.dev
List-Id: <sashiko-reviews.lists.linux.dev>
List-Subscribe: <mailto:sashiko-reviews+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:sashiko-reviews+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260628212820.D0DD51F000E9@smtp.kernel.org>

On Sun, Jun 28, 2026 at 09:28:20PM +0000, sashiko-bot@kernel.org wrote:
> Thank you for your contribution! Sashiko AI review found 1 potential issue(s) to consider:
> - [Medium] Failing cpuhp_setup_state skips PM notifier registration, silently breaking QoS IDs across system suspend/resume.
> --
> 
> commit e3ff463a672a85eb328bf3048323a464af88e408
> Author: Drew Fustini <fustini@kernel.org>
> 
> riscv: Add support for srmcfg CSR from Ssqosid extension
> 
> This commit adds support for the srmcfg CSR defined in the Ssqosid ISA
> extension. It introduces a per-task thread field and a per-CPU cache to track
> Resource Control ID (RCID) and Monitoring Counter ID (MCID) fields, updating
> the CSR during context switches.
> 
> Link: https://github.com/riscv/riscv-ssqosid/releases/tag/v1.0
> 
> [ ... ]
> 
> > diff --git a/arch/riscv/kernel/qos.c b/arch/riscv/kernel/qos.c
> > new file mode 100644
> > index 0000000000000..c8900d91996f2
> > --- /dev/null
> > +++ b/arch/riscv/kernel/qos.c
> 
> [ ... ]
> 
> > +static int __init riscv_srmcfg_init(void)
> > +{
> > +	int err;
> > +
> > +	if (!riscv_has_extension_unlikely(RISCV_ISA_EXT_SSQOSID))
> > +		return 0;
> > +
> > +	/*
> > +	 * cpuhp_setup_state() invokes the startup callback locally on every
> > +	 * already-online CPU, so no separate seed loop is needed here.
> > +	 */
> > +	err = cpuhp_setup_state(CPUHP_AP_ONLINE_DYN, "riscv/srmcfg:online",
> > +				riscv_srmcfg_reset_cache, riscv_srmcfg_reset_cache);
> > +	if (err < 0) {
> > +		pr_warn("srmcfg cpuhp registration failed (%d), cpus brought online after boot will not invalidate the CSR_SRMCFG cache\n",
> > +			err);
> > +		return err;
> 
> [Severity: Medium]
> If cpuhp_setup_state() fails and returns early here, the
> cpu_pm_register_notifier() registration is skipped, but the hardware
> capability RISCV_ISA_EXT_SSQOSID remains active.
> 
> Because returning an error from an arch_initcall does not halt the boot
> process, the QoS feature will remain active in the kernel.
> 
> If the PM notifier is not registered to invalidate the software cache upon
> exit from low-power states, will subsequent context switches find a cache
> match, mistakenly bypass the csr_write(), and execute tasks with the wrong
> hardware QoS ID?

Yes, it is possible. The early return in riscv_srmcfg_init() does skip
cpu_pm_register_notifier(), and that notifier is what invalidates the
per-cpu srmcfg cache across suspend/resume, so __switch_to_srmcfg()
could find a stale match and skip the csr write.

The risk is low, though. CPUHP_AP_ONLINE_DYN is a valid state, the
registration name is not null, and riscv_srmcfg_reset_cache() cannot
fail, so the only way cpuhp_setup_state() can fail is when no dynamic
hotplug states remain.

However, the fix is simple. The PM notifier is independent of the cpuhp
state, so I'll change riscv_srmcfg_init() to register it even if the
cpuhp setup failed.

Thanks,
Drew
