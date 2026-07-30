Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D0BC521CC5C;
	Thu, 30 Jul 2026 02:05:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785377102; cv=none; b=odvFZAtw5wyV0lu3VK1pjCZ568daPU0VgQLoFA2mQ3CBK8fXMPw6svwZf5gf0WW+LD5I9yJgYY5hVsCs9Lb5lz/FwxMkvlFtSnNG9DWlJ7s8BJYHaHMqY8bCo3dN1p4R7UOfD4CcSZ9/5pk8YWKxYePRXlS3f+4hzX5U2TkOnyU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785377102; c=relaxed/simple;
	bh=5ajcVEgtfiyqq06PDC6huseIZRAnqYZ+dfC6RHjoLms=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=g5DUSVURYa3yh31KxTQ8fH56oo/rb3au35JgYvsYUv60g0BloYjrqz4cXwrY/iO3OyaYCtywWqsEFmYKdxDJjzOLCvurJWaZ9scKyeGKF5rjBZSSrQFPa+LSDJ/r2tRRt4UsEyIixp9juVniihd42xmx2WQ0LYI37n2sq7aSD3g=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=mVav8ruB; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="mVav8ruB"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 577981F000E9;
	Thu, 30 Jul 2026 02:05:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1785377100;
	bh=2h/UiwhfC8NhEeNz6SwfkBcRk32SdeEgA/eWffwd11U=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=mVav8ruBQx3ZjBROniP7omxBRdJzUlSfjgjBGwo1Cmw5ROZ/3VTKdyCBqvXNUU0LQ
	 gHa4a1I0vKjtimTUOskSPw+bd4U9IZow86IdwrJdI450pPLUQ3dEVTcLlYCNAKtkTC
	 Pga5RYeiwlz4A7kV4PgEama44e/g37tpGlcPWkerYbZ5P7ZVAfVkMtxErjIXHvymyJ
	 lP6flSNv+6KWqWyL8bVDOgT2ISJFjc1fucHeeB2Gw18bs+CmNWqt5zyLV6hEVEsKyT
	 jF5jFzyK+UPGIeBpYVbrkYot5IccnQo5A3BkdDmptduKaefA21rCaLgsJsMN+sQ/HY
	 l0MYRX6fvkTQQ==
Date: Wed, 29 Jul 2026 19:04:58 -0700
From: Drew Fustini <fustini@kernel.org>
To: sashiko-reviews@lists.linux.dev
Cc: linux-riscv@lists.infradead.org, linux-kernel@vger.kernel.org,
	x86@kernel.org
Subject: Re: [PATCH v6 3/8] riscv: Add support for srmcfg CSR from Ssqosid
 extension
Message-ID: <amqxSpkxWw6/zXcq@x1>
References: <20260729-dfustini-atl-sc-cbqri-dt-v6-0-7c22b05d461b@kernel.org>
 <20260729-dfustini-atl-sc-cbqri-dt-v6-3-7c22b05d461b@kernel.org>
 <20260730012227.58F5C1F000E9@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: sashiko-reviews@lists.linux.dev
List-Id: <sashiko-reviews.lists.linux.dev>
List-Subscribe: <mailto:sashiko-reviews+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:sashiko-reviews+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260730012227.58F5C1F000E9@smtp.kernel.org>

On Thu, Jul 30, 2026 at 01:22:26AM +0000, sashiko-bot@kernel.org wrote:
> Thank you for your contribution! Sashiko AI review found 2 potential issue(s) to consider:
> - [High] The `srmcfg` CSR is not initialized during early boot or CPU hotplug bringup, leaving CPUs running with undefined QoS tags.
> - [Medium] The architecture-specific resctrl setters `resctrl_arch_set_closid_rmid()` and `resctrl_arch_set_cpu_default_closid_rmid()` are missing.
> --
> 
> --- Patch [3]: [PATCH v6 3/8] riscv: Add support for srmcfg CSR from Ssqosid extension ---
> commit a02eee11a5e49e74d1e00459d9acc1ec4a1982fa
> Author: Drew Fustini <fustini@kernel.org>
> 
> riscv: Add support for srmcfg CSR from Ssqosid extension
> 
> Add support for the srmcfg CSR defined in the Ssqosid ISA extension.
> The CSR contains two fields: Resource Control ID (RCID) and Monitoring
> Counter ID (MCID) for tracking resource usage.
> 
> Link: https://github.com/riscv/riscv-ssqosid/releases/tag/v1.0
> 
> > The context-switch path writes the field to the CSR, and
> > resctrl_arch_set_closid_rmid() updates it when a task is assigned to a
> > resctrl control or monitoring group.
> > 
> > A per-cpu cpu_srmcfg_default holds the default srmcfg for each CPU, set
> > by resctrl_arch_set_cpu_default_closid_rmid() on CPU group assignment.
> 
> [Severity: Medium]
> Neither resctrl_arch_set_closid_rmid() nor
> resctrl_arch_set_cpu_default_closid_rmid() appear to be implemented in this
> patch. 
> 
> Since they are missing, are thread_struct.srmcfg and cpu_srmcfg_default ever
> actually modified from their initial zero values?

Both are added in patch 5 along with the rest of the resctrl glue. I
already explained that this is not a problem but sashiko doesn't read
replies.

> > diff --git a/arch/riscv/kernel/qos.c b/arch/riscv/kernel/qos.c
> > index 0000000000000..99925c0e93dd8
> > --- /dev/null
> > +++ b/arch/riscv/kernel/qos.c
> > @@ -0,0 +1,101 @@
> 
> [ ... ]
> 
> > +	/*
> > +	 * cpuhp_setup_state() invokes the startup callback locally on every
> > +	 * already-online CPU, so no separate seed loop is needed here.
> > +	 */
> > +	err = cpuhp_setup_state(CPUHP_AP_ONLINE_DYN, "riscv/srmcfg:online",
> > +				riscv_srmcfg_reset_cache, riscv_srmcfg_reset_cache);
> 
> [Severity: High]
> Does this software cache correctly handle CPU hotplug and early boot?
> 
> When a CPU is offlined, it continues context-switching as it goes down, which
> overwrites the U32_MAX cache sentinel with a valid tag (such as 0 for the idle
> thread).
> 
> When the CPU is brought back online, its hardware srmcfg CSR is reset to an
> implementation-defined value. If the software cache cpu_srmcfg is still 0, the
> first context switch to a task with a 0 tag in __switch_to_srmcfg() will see
> thread_srmcfg == cpu_srmcfg and skip the CSR write:
> 
> arch/riscv/include/asm/qos.h:__switch_to_srmcfg() {
>     ...
>     if (thread_srmcfg != __this_cpu_read(cpu_srmcfg)) {
>         __this_cpu_write(cpu_srmcfg, thread_srmcfg);
>         csr_write(CSR_SRMCFG, thread_srmcfg);
>     }
>     ...
> }
> 
> This leaves the hardware CSR undefined until this CPUHP_AP_ONLINE_DYN startup
> callback runs. Is CPUHP_AP_ONLINE_DYN too late to prevent the CPU from running
> with undefined QoS tags?

This is not a problem. Only the idle task and per-cpu kthreads run in
that window, and they run with the hart's reset srmcfg value.

Drew
