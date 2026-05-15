Received: from mail-pl1-f202.google.com (mail-pl1-f202.google.com [209.85.214.202])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id ED3AF3612FB
	for <sashiko-reviews@lists.linux.dev>; Fri, 15 May 2026 23:04:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.202
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778886254; cv=none; b=AY3pIcs6tYEJfF9E+zWP/MNQQ1VkeYuDLJovuAYV4hVzGPPMPgZ5sl5chYe0Wf8LoJoXKj23C1bX7EtYpAp58D1YWF/5FEXTzmONaLqpLLL0G1GYnTMjn22rvD+jUVmVSyMVOT2e0XvY+LlSBDYyGqdOLQ/uZ+ljyG3BmTeWEDI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778886254; c=relaxed/simple;
	bh=bb5ysJcNu53CRVPhD2WY4M0eL4SFH7mVl780sk2znBM=;
	h=Date:In-Reply-To:Mime-Version:References:Message-ID:Subject:From:
	 To:Cc:Content-Type; b=NJbRbBUEmRNyyiczY99W9uJxOAOCQX78BuGJZfWLjkAq8cIQZd/fL7sZ1Yuvd7Jkm8Bf4YgyRjHuXk8DzwYPORT5qdW2XoCW618jHskqC+iskABwWudlKfdNvQVr5dR3stE4STSDagFjqkwjSc11pdDxt/n8Kh6B2/KL63HpanA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=flex--seanjc.bounces.google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=ur5VpaT9; arc=none smtp.client-ip=209.85.214.202
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flex--seanjc.bounces.google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="ur5VpaT9"
Received: by mail-pl1-f202.google.com with SMTP id d9443c01a7336-2bd6cc53fd6so2979865ad.3
        for <sashiko-reviews@lists.linux.dev>; Fri, 15 May 2026 16:04:12 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20251104; t=1778886252; x=1779491052; darn=lists.linux.dev;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:from:to:cc:subject:date:message-id:reply-to;
        bh=tSd6SQzj/M/7k2HqLEnMpGD+gr6VAxiNUNUCcOG58wc=;
        b=ur5VpaT9IPyvJ9mKJpZtahqrlTTI3vUUZMfFSKeHH4//TxEiqF+ep/MRzM0+CEBh1t
         pHC/F2V8u0pPB7fZUqC1qx4KzisSOQjRKq9N99U0WAZOOxN0pK0rHODQbAT3kEEMSBTN
         HtCKZ3bpcij6d/FCXpJ+c4tg9S9EsMe9kvgM3iJPcbLxsYW6ik/fT60T75Jo0+Y6CRRS
         bHKlZ8nViAFiV8pXqV+hCMIH0L5g3uf7KR7DLt11+D1HXaUKnIkiQGV+O7xPGysPsBv4
         pUIkSY8g8DqnkUIYpDSl5Z17zRPcoR+wZkEImye5xyUkMxyCQwbSApBYsn6zxjRWqp7r
         8eQg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1778886252; x=1779491052;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=tSd6SQzj/M/7k2HqLEnMpGD+gr6VAxiNUNUCcOG58wc=;
        b=X2Kcnb5+5/yEoVRs6dkdm9T85YQ8uA4WjWoEN24TTk8Dxv8piOfdXj9PiKGcQ+1VRt
         tLxxyT0qe1vA/zqfeolCF3mKhVs+R2h1uwdHT3dhPZYPPMdEOMC1obinKBYRy4SoIp0/
         CdB6wxSo8InYf8YvvEi5BTCCABnP+sY2fruppHFttLjWPTQ8tQG02d+a0c0JDIVdcS6N
         sYz4UZql4tFoDaIwQayT5RB4WyraVYyjdOns2YfNkmLPhRwNEvsCmsc9oSh7VxRckG7O
         pBLu2CIJsI+X8IBZP1rje6tD1vAVkKhj3yF3OkKjov5gfs3NnvxVjk6hTkbA0puO4zML
         TlMA==
X-Gm-Message-State: AOJu0YwCXP9muynFO92xyg/fCf12UGCVE/RzgFWtndhc/NIilqt5R90R
	sPa+jJV6rP0DuN6NNxnjUhNJvKUDe1xZ+RZK6uCaiNN0IayKtm+fci9B2fCGOvgDXq3qfylSIqg
	i49ylM23ECoJEk8r2MB0WYickaPwp4vBKpyZfj7Sz+jwMggus6Keez1aUozfc8lRbegVfGypJNz
	3qPHBOYHCWr8j6HwUUbiEBz3MVVpnDGd9EfKm+Ezougr/zwbCL
X-Received: from plbli3.prod.google.com ([2002:a17:903:2943:b0:2bc:aee2:8f39])
 (user=seanjc job=prod-delivery.src-stubby-dispatcher) by 2002:a17:902:7044:b0:2b2:d09c:c07c
 with SMTP id d9443c01a7336-2bd7e90e820mr45008385ad.36.1778886251737; Fri, 15
 May 2026 16:04:11 -0700 (PDT)
Date: Fri, 15 May 2026 16:04:11 -0700
In-Reply-To: <20260515195116.E0AFBC2BCB3@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: sashiko-reviews@lists.linux.dev
List-Id: <sashiko-reviews.lists.linux.dev>
List-Subscribe: <mailto:sashiko-reviews+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:sashiko-reviews+unsubscribe@lists.linux.dev>
Mime-Version: 1.0
References: <20260515191942.1892718-41-seanjc@google.com> <20260515195116.E0AFBC2BCB3@smtp.kernel.org>
Message-ID: <agema3no38bvH3Y5@google.com>
Subject: Re: [PATCH v3 40/41] x86/tsc: Add standalone helper for getting CPU
 frequency from CPUID
From: Sean Christopherson <seanjc@google.com>
To: sashiko-reviews@lists.linux.dev
Cc: linux-hyperv@vger.kernel.org
Content-Type: text/plain; charset="us-ascii"

On Fri, May 15, 2026, sashiko-bot@kernel.org wrote:
> Thank you for your contribution! Sashiko AI review found 1 potential issue(s) to consider:
> - [High] Unintended clobbering of the global `cpu_khz` variable in `native_calibrate_tsc()` due to a missing local variable declaration.
> --
> 
> commit 36e45379d4c9f40ae24c5c323b4f0471c94c6bef
> Author: Sean Christopherson <seanjc@google.com>
> 
> x86/tsc: Add standalone helper for getting CPU frequency from CPUID
> 
> This commit extracts the logic for getting the CPU frequency via CPUID into
> a new standalone helper function. It also updates the TSC calibration code
> to use this new helper.
> 
> > diff --git a/arch/x86/kernel/tsc.c b/arch/x86/kernel/tsc.c
> > --- a/arch/x86/kernel/tsc.c
> > +++ b/arch/x86/kernel/tsc.c
> 
> [ ... ]
> 
> > @@ -754,13 +772,8 @@ unsigned long native_calibrate_tsc(void)
> >  	 * clock, but we can easily calculate it to a high degree of accuracy
> >  	 * by considering the crystal ratio and the CPU speed.
> >  	 */
> > -	if (!info.crystal_khz && boot_cpu_data.cpuid_level >= CPUID_LEAF_FREQ) {
> > -		unsigned int eax_base_mhz, ebx, ecx, edx;
> > -
> > -		cpuid(CPUID_LEAF_FREQ, &eax_base_mhz, &ebx, &ecx, &edx);
> > -		info.crystal_khz = eax_base_mhz * 1000 *
> > -			info.denominator / info.numerator;
> > -	}
> > +	if (!info.crystal_khz && !cpuid_get_cpu_freq(&cpu_khz))
> > +		info.crystal_khz = cpu_khz * info.denominator / info.numerator;
> 
> Does this unintentionally clobber the global cpu_khz variable?

Yep.  I don't think I even realized there was such a global variable.  Probably
makes sense to use a different name for the local variables.
