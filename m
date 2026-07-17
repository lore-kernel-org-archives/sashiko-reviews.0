Received: from mail-wr1-f44.google.com (mail-wr1-f44.google.com [209.85.221.44])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E1B9436B076
	for <sashiko-reviews@lists.linux.dev>; Fri, 17 Jul 2026 15:51:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.44
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784303501; cv=none; b=AyNJwMy3heDTuYlC6LWnopIdR04ur6f192SNnCCKwLK/bm+u129f2ZdItrSyHATJu69sNyOoKr4QJKjQGayiNMaiDOKhsu7HrlTJLe3L8iuKperg3k8xIsprq3Ji7jAuf6FadJwpcJjhVt3VHaw/TDOrNKuNvpKPaHxkl2T8dhs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784303501; c=relaxed/simple;
	bh=G0LQMD1gwDkFu+2A3fwory5Rbbxiac7YFZLMKCoAqyY=;
	h=Date:From:To:Cc:Subject:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=Oo7zMoy8R15kNbxfxVqafU+Myc6akchO9XkFZXohNevJ0BprULlgdpPKLZr75sYVz16ToCOIE/BjYuseuKFMHyF60If+n6P0ijKqlV9qiI29iqPyC1etKqwpnPeiA4faS3Bfs4Z4gJT4Y5TCUyxBMBhMjszM72TBeccNMJM06Jw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=suse.com; spf=pass smtp.mailfrom=suse.com; dkim=pass (2048-bit key) header.d=suse.com header.i=@suse.com header.b=Q06O0ZB+; arc=none smtp.client-ip=209.85.221.44
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=suse.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=suse.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=suse.com header.i=@suse.com header.b="Q06O0ZB+"
Received: by mail-wr1-f44.google.com with SMTP id ffacd0b85a97d-46f88060e8dso1195757f8f.2
        for <sashiko-reviews@lists.linux.dev>; Fri, 17 Jul 2026 08:51:39 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1784303498; x=1784908298; darn=lists.linux.dev;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=qN8qo5HLDZfVutpj/7D5Up9Ad2jxvpUua4OXmY0wtBg=;
        b=Q06O0ZB+Ri4HRUrpGnXR3mTtmMRGAjdU3XVI0hKb7U9RcNjRSVMzdXUlUFj2njJ2aK
         WA4NN5kvfPwzXqtoljRIEpxEB+0I4caTytsZgaewGvkkwk2OMKwvg3Wjxe5zUJMHRExn
         +3pvbJNx3gx20/PQjBB/Y44VNYxtX4cKhJibArmjtiDR+3cjPeuGc2qMCfCGH/P2ifWe
         h9TKTsAOpA+VeW6L9RutT45AP9e9WAi80v0PQb1CkJA8EDbKe5CEUXjoY5AVuYdKoJaN
         FiZFIeYadlw4SoZAK0u7irLyqOCQWnVtIAtWrM68HmEu9ZfJbnzMXdaURPeuZGRPh4mo
         hVBQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1784303498; x=1784908298;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=qN8qo5HLDZfVutpj/7D5Up9Ad2jxvpUua4OXmY0wtBg=;
        b=H57mmguDlN+3/kpw0Hi5YVKp9Sd6iYNgboCJ63VcdR0wEPne2q1v1StkgdsK8Zeyro
         uN3xttBVjrWJG/XYO6rlB9XrgkLHlXX3eXXTuXEwSUCKsndAv80cUlCh2Q73GplnPE6a
         e8JtMRjE+xBrX8ZebU0HlHi90MSUQq/U+0E51n4D0jOoLOhXIaHmqa4fswGFgHE1BH4f
         ye+7DJTcIf8g2/085N9CxN1RhCj2YLmHrQlAkPIavG9SI5L2pDmKTlq5Bx7Hj1iJl826
         EOGgDjlPWp0J20jSwV5wIBWnJ8apNTDzMp1n0u2K1N8aiWUuwuh3zXZgMr+KA5DqWq/t
         +G/g==
X-Gm-Message-State: AOJu0YzdE7G7kInpj1IW+GlNXSX2uJRRQ1/l8CLEgwzcEfyfzoE57gZH
	Ec/+8nBDXGQDPgaEguZaFN1wNxqbed735MdeNSQSte3294pIVRZD2HfzcYbVOYuk5BNxZtl3UuV
	Ot3DB4Fw=
X-Gm-Gg: AfdE7cmWJjdO8rNVCp7cNHkfV13ixbeAGdVF18CxSrfQnQ6E5GuFPxTSq219Uu2WN6Y
	dcT6bxthu7ZEoirHpOWCQ76iFtrCuj7te+2iZbxcRkAH+rmBPbvQc2nDUmmWtI+MdM8YvZgUiMW
	4sLA5PAGMwdOxxn0G75ahbTttMyY6BYSpsbPwUSFosD+HwglHPAPuChWrIVuVhw0uHGl3Qgrrrl
	UA5JcP06jvnyPho7j1iEZWctw1ei8+KdHIgC8yey5tbEYbvZF+6RAdbDUA0XDmyZiKod2zYwOV/
	5C5LollmLVjFFdKo/KKB5LPyAVHZyGDvt0x9TZMmWwxSSwdEvnVC0owGRUcoY3P6l0Gjn+CPudv
	7+rYLvlSmHi4D2igRUOSZLBBzysNMZMQbf/ygC+v92D6GVKuX2NexYG7GQKYctihzbWYybVdDjq
	tYNEnw4QZ/g0H2OIE9G4oZARo8/6uZguTxR31y1wELSXQ7bhHa0HBDopa6sJR80dstaLKH/i4QP
	HKa3g==
X-Received: by 2002:a05:6000:4284:b0:47d:2a79:a2eb with SMTP id ffacd0b85a97d-47f62322529mr2342313f8f.5.1784303498047;
        Fri, 17 Jul 2026 08:51:38 -0700 (PDT)
Received: from mordecai (dynamic-2a00-1028-83b8-1e7a-3010-3bd6-8521-caf1.ipv6.o2.cz. [2a00:1028:83b8:1e7a:3010:3bd6:8521:caf1])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-47f63edd7d3sm4157882f8f.25.2026.07.17.08.51.37
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 17 Jul 2026 08:51:37 -0700 (PDT)
Date: Fri, 17 Jul 2026 17:51:35 +0200
From: Petr Tesarik <ptesarik@suse.com>
To: Tony W Wang-oc <TonyWWang-oc@zhaoxin.com>
Cc: sashiko-reviews@lists.linux.dev, linux-perf-users@vger.kernel.org,
 x86@kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH 1/1] perf/x86: Do not read fixed counter control
 register if there is none
Message-ID: <20260717175135.450f2788@mordecai>
In-Reply-To: <20260717151858.8ED701F000E9@smtp.kernel.org>
References: <20260717150315.2868314-1-ptesarik@suse.com>
	<20260717151858.8ED701F000E9@smtp.kernel.org>
X-Mailer: Claws Mail 4.4.0 (GTK 3.24.52; x86_64-suse-linux-gnu)
Precedence: bulk
X-Mailing-List: sashiko-reviews@lists.linux.dev
List-Id: <sashiko-reviews.lists.linux.dev>
List-Subscribe: <mailto:sashiko-reviews+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:sashiko-reviews+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit

On Fri, 17 Jul 2026 15:18:58 +0000
sashiko-bot@kernel.org wrote:

> Thank you for your contribution! Sashiko AI review found 3 potential issue(s) to consider:
> 
> New issues:
> - [Medium] Using `x86_pmu.fixedctr` as a capability flag is conceptually flawed and suppresses valid debug output on Zhaoxin.
> 
> Pre-existing issues:
> - [High] Zhaoxin PMU fails to initialize `x86_pmu.fixedctr`, leading to broken fixed counters and unsafe RDMSR accesses.
> - [High] Undefined behavior in `GENMASK_ULL` during Zhaoxin PMU initialization if fixed counters are missing.
> --
> 
> --- Patch [1]: [PATCH 1/1] perf/x86: Do not read fixed counter control register if there is none ---
> commit d0dd53a6709a65141e2d105b19abad4d851825d4
> Author: Petr Tesarik <ptesarik@suse.com>
> 
> perf/x86: Do not read fixed counter control register if there is none
> 
> This patch skips reading the MSR_ARCH_PERFMON_FIXED_CTR_CTRL register
> during perf debug output if fixed counters are not implemented. This avoids
> a #GP on AMD CPUs with PerfMonV2 that do not implement this register.
> 
> > diff --git a/arch/x86/events/core.c b/arch/x86/events/core.c
> > index 576baa9a52c5b..3055d59e0e82f 100644
> > --- a/arch/x86/events/core.c
> > +++ b/arch/x86/events/core.c
> > @@ -1572,13 +1572,16 @@ void perf_event_print_debug(void)
> >  		rdmsrq(MSR_CORE_PERF_GLOBAL_CTRL, ctrl);
> >  		rdmsrq(MSR_CORE_PERF_GLOBAL_STATUS, status);
> >  		rdmsrq(MSR_CORE_PERF_GLOBAL_OVF_CTRL, overflow);
> > -		rdmsrq(MSR_ARCH_PERFMON_FIXED_CTR_CTRL, fixed);
> >  
> >  		pr_info("\n");
> >  		pr_info("CPU#%d: ctrl:       %016llx\n", cpu, ctrl);
> >  		pr_info("CPU#%d: status:     %016llx\n", cpu, status);
> >  		pr_info("CPU#%d: overflow:   %016llx\n", cpu, overflow);
> > -		pr_info("CPU#%d: fixed:      %016llx\n", cpu, fixed);
> > +
> > +		if (x86_pmu.fixedctr) {  
> 
> [Severity: Medium]
> Is it safe to use x86_pmu.fixedctr as a capability flag here?

Good question. In fact, I thought about it, and yes, introducing a new
flag would be the cleanest solution, but it seemed overkill just for
this debugging output.

AFAIK the MSR offset of the fixed perf counters cannot be zero, because
those MSR addresses have been assigned to other architectural MSRs since
Pentium times...

> The x86_pmu.fixedctr field is an MSR address, not a boolean capability
> flag. While this check works for most architectures, the Zhaoxin PMU driver
> fails to initialize this field, leaving it as 0. Because of this, the check
> evaluates to false and inadvertently suppresses the debug output of
> MSR_ARCH_PERFMON_FIXED_CTR_CTRL on Zhaoxin systems.

I don't know about Zhaoxin. Do these syste have fixed performance
counters and a corresponding global control register?

Adding Tony W Wang to the recipient list...

Petr T

--

> > +			rdmsrq(MSR_ARCH_PERFMON_FIXED_CTR_CTRL,
> > fixed);
> > +			pr_info("CPU#%d: fixed:      %016llx\n",
> > cpu, fixed);
> > +		}
> >  		if (pebs_constraints) {
> >  			rdmsrq(MSR_IA32_PEBS_ENABLE, pebs);
> >  			pr_info("CPU#%d: pebs:       %016llx\n",
> > cpu, pebs);  
> [ ... ]
> 
> 
> [Severity: High]
> This is a pre-existing issue and was not introduced by the patch under
> review, but the lack of initialization for x86_pmu.fixedctr causes
> other issues.
> 
> In the Zhaoxin PMU driver setup:
> 
> arch/x86/events/zhaoxin/core.c:zhaoxin_pmu
> static const struct x86_pmu zhaoxin_pmu __initconst = {
>     ...
>     /* missing .fixedctr = MSR_ARCH_PERFMON_FIXED_CTR0 */
> };
> 
> Because this remains 0, x86_pmu_fixed_ctr_addr() returns 0 + idx
> instead of the correct MSR. This causes fixed counter 0 to silently
> return without updating in x86_perf_event_update():
> 
> arch/x86/events/core.c:x86_perf_event_update() {
>     ...
>     if (unlikely(!hwc->event_base))
>         return 0;
>     ...
> }
> 
> It also leads to unsafe MSR reads when iterating over the fixed
> counter mask in perf_event_print_debug():
> 
> arch/x86/events/core.c:perf_event_print_debug() {
>     ...
>     for_each_set_bit(idx, fixed_cntr_mask, X86_PMC_IDX_MAX) {
>         ...
>         rdmsrq(x86_pmu_fixed_ctr_addr(idx), pmc_count);
>         ...
>     }
> }
> 
> Could this lead to reads from arbitrary low MSRs like MSR 0, 1, or 2,
> potentially triggering a system crash if a user programs fixed counter
> events or triggers SysRq-P?
> 
> 
> [Severity: High]
> This is a pre-existing issue and was not introduced by the patch under
> review, but does this bitmask generation in the Zhaoxin PMU
> initialization risk undefined behavior?
> 
> arch/x86/events/zhaoxin/core.c:zhaoxin_pmu_init() {
>     ...
>     x86_pmu.fixed_cntr_mask64 =
> GENMASK_ULL(edx.split.num_counters_fixed - 1, 0); ...
> }
> 
> If a hypervisor configures the CPU to report 0 fixed counters,
> edx.split.num_counters_fixed - 1 wraps to -1. Expanding
> GENMASK_ULL(-1, 0) results in a right-shift by 64, which is undefined
> behavior in C. On x86, this yields ~0ULL, making the kernel assume 64
> fixed counters exist.
> 
> Could this cause the kernel to attempt reading 64 undefined MSRs
> during debug output or event initialization, leading to #GP
> exceptions?
> 

