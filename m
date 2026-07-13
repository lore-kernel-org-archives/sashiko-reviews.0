Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.10])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6D7292FFFA4
	for <sashiko-reviews@lists.linux.dev>; Mon, 13 Jul 2026 17:13:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.10
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783962822; cv=none; b=FFo6K+dnlsUT1ivi2S2xXACq591MPsYjNngt9ZtsGy65nia382KshNZtDPQpJ23cb717kMLP+lO1iXgzztuX2m6awnbMQ8ui5bdjQDxyIjyEOpBW388J/J6tKcUDoorBoVeypaDoeW3ZzG2IIfacRMnaR6dX8nas0Nbu9XujKl0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783962822; c=relaxed/simple;
	bh=5oxj3vvHEgTfwqNINOmt0/SP0khXE8MNUvRqLxRms6Q=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=jhBh86LripVMFDcHthsviWOxCws1oa23VZsGLGjDJmmqz1v48GHzPtvs6oQywwgiK4IEjirVyQm63tyaOGCPJtSCfd0n4D14yyuyXyIUA1i3ayt+2b5vuSQb+O5KzsX1AXVuJdaHnRlsgSo5EvAtENB2w3dRN0a00u/prWq4lLk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=pass smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=AnaP83sN; arc=none smtp.client-ip=198.175.65.10
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="AnaP83sN"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1783962820; x=1815498820;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=5oxj3vvHEgTfwqNINOmt0/SP0khXE8MNUvRqLxRms6Q=;
  b=AnaP83sNCc7tpfEC+sRqe3dZT6fI+6XAkBbx2ImYduUKzDlPVBYd5cYA
   MW4F4F7A/StS0PXj8V66KnDn/UuEyMhnMIssbMypmibXY8Zh53odLWc8V
   cR+8FOxviBl2WfupdGd45HmClkxmOHbHd6VgszaPN9KL32+oOkgHD6SKw
   6PJfSJaWFfKMe5eUzb05fmJXKe0EdYwpI2hwE9pM6vP1gJpasbQm/TjRi
   nidXay3/Ew2KIQjL/vBBcGV/PXV1AkmsuxMybKU94LzQTMj6eeiBIz2CL
   s5vR+NBIIEKTLw9fm4vZ1Qep31CUmfGfof7VRYQOkjA26gE2tDvd45g5i
   Q==;
X-CSE-ConnectionGUID: WlyqzTIHTDC0zVpX/URXjQ==
X-CSE-MsgGUID: qPtFxZWZRRiMX9ofFSG/6A==
X-IronPort-AV: E=McAfee;i="6800,10657,11841"; a="102003665"
X-IronPort-AV: E=Sophos;i="6.25,154,1779174000"; 
   d="scan'208";a="102003665"
Received: from fmviesa009.fm.intel.com ([10.60.135.149])
  by orvoesa102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 13 Jul 2026 10:13:40 -0700
X-CSE-ConnectionGUID: gj8jA3VpQNiY8xHQdAHPCQ==
X-CSE-MsgGUID: mFKYidqPTJqVFgpZy/OP8g==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.25,154,1779174000"; 
   d="scan'208";a="249251344"
Received: from guptapa-desk.jf.intel.com (HELO desk) ([10.165.239.46])
  by fmviesa009-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 13 Jul 2026 10:13:40 -0700
Date: Mon, 13 Jul 2026 10:13:32 -0700
From: Pawan Gupta <pawan.kumar.gupta@linux.intel.com>
To: sashiko-reviews@lists.linux.dev
Cc: bpf@vger.kernel.org
Subject: Re: [PATCH 7.1.y 2/6] x86/bugs: Enable IBPB flush on BPF JIT
 allocation
Message-ID: <eey2q4s3oolarx3nflw4ky6p2ylcxbd4vys5e3iymjed57ce43@jzztbgueqoqt>
References: <20260709-cbpf-jit-spray-hardening-7-1-y-v1-0-5ac5a2d6797f@linux.intel.com>
 <20260709-cbpf-jit-spray-hardening-7-1-y-v1-2-5ac5a2d6797f@linux.intel.com>
 <20260709223715.93C851F00A3E@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: sashiko-reviews@lists.linux.dev
List-Id: <sashiko-reviews.lists.linux.dev>
List-Subscribe: <mailto:sashiko-reviews+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:sashiko-reviews+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260709223715.93C851F00A3E@smtp.kernel.org>

On Thu, Jul 09, 2026 at 10:37:15PM +0000, sashiko-bot@kernel.org wrote:
> Thank you for your contribution! Sashiko AI review found 2 potential issue(s) to consider:
> - [High] Incomplete Spectre v2 / BHI mitigation for BPF JIT spraying on CPUs with RRSBA.
> - [High] Unprivileged local Denial of Service (DoS) via synchronous IPI broadcast storm.
> --
> 
> --- Patch [2]: [PATCH 7.1.y 2/6] x86/bugs: Enable IBPB flush on BPF JIT allocation ---
> commit 9b68eba3d351f7dea03fa0a56d5f7eb7c06e801c
> Author: Pawan Gupta <pawan.kumar.gupta@linux.intel.com>
> 
> x86/bugs: Enable IBPB flush on BPF JIT allocation
> 
> Enable hardening against JIT spraying when Spectre-v2 mitigations are in
> use. Specifically, issue an IBPB flush on BPF JIT memory reuse. Skip
> enabling the IBPB flush if the BPF dispatcher is already using a retpoline
> sequence.
> 
> > diff --git a/arch/x86/kernel/cpu/bugs.c b/arch/x86/kernel/cpu/bugs.c
> > index 83f51cab0b1e3..d9af230c05125 100644
> > --- a/arch/x86/kernel/cpu/bugs.c
> > +++ b/arch/x86/kernel/cpu/bugs.c
> [ ... ]
> > @@ -2238,6 +2251,27 @@ static void __init spectre_v2_update_mitigation(void)
> >  		pr_info("%s\n", spectre_v2_strings[spectre_v2_enabled]);
> >  }
> >  
> > +#ifdef CONFIG_BPF_JIT
> > +static void __bpf_arch_ibpb(void *unused)
> > +{
> > +	write_ibpb();
> > +}
> > +
> > +void bpf_arch_ibpb(void)
> > +{
> > +	on_each_cpu(__bpf_arch_ibpb, NULL, 1);
> > +}
> 
> [Severity: High]
> Does this expose the system to a Denial of Service (DoS) attack from
> unprivileged users?

Partially, but it does not open a new attack vector. Sending IPIs via
unprivileged userspace is already possible with other interfaces like
membarrier().

> Since this static call is invoked during BPF JIT allocations (e.g. via
> bpf_arch_pred_flush() in bpf_prog_pack_alloc()), an unprivileged user can
> repeatedly attach and detach classic BPF socket filters using
> setsockopt(SO_ATTACH_FILTER).
> 
> This would trigger on_each_cpu(..., 1) repeatedly, overwhelming all online
> CPUs with a synchronous IPI broadcast and waiting for them to complete the
> expensive write_ibpb() operation.

These are blocking IPIs, and are serialized by the pack_mutex. Allocating a
new BPF program does become slower, but it does not block other CPUs
(unless they are also trying to allocate a BPF program). Since allocating a
BPF program is not a frequent operation, this is not a significant concern.
Although, it is good to watch out for this case if it proves to be a
problem.

> > +
> > +static bool __init cpu_wants_ibpb_bpf(void)
> > +{
> > +	/* A genuine retpoline already neutralizes ring0 indirect predictions */
> > +	if (retpoline_seq_enabled())
> > +		return false;
> 
> [Severity: High]
> Is it safe to assume retpolines are a complete mitigation here without also
> verifying that RRSBA is safely disabled?
> 
> In other mitigation paths like bhi_apply_mitigation() and spectre_bhi_state(),
> the kernel checks rrsba_disabled along with retpoline_seq_enabled() because
> an RSB underflow on CPUs with Restricted Return Stack Buffer Alternate (RRSBA)
> behavior can cause RET instructions to fall back to the BTB (which could be
> poisoned by an attacker).
> 
> If a system has RRSBA that cannot be disabled, skipping the IBPB flush here
> could leave the BPF JIT spraying mitigation incomplete.

If the system is using retpoline for spectre-v2 mitigation, it either means
that it is safe to use retpoline or the user has accepted the risk of using
retpoline. This hardening honors the mitigation choice already made.
