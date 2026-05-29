Received: from mail-pg1-f201.google.com (mail-pg1-f201.google.com [209.85.215.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 91B17400E18
	for <sashiko-reviews@lists.linux.dev>; Fri, 29 May 2026 18:24:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.215.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1780079093; cv=none; b=lkLjMTTEGtrNVN4Z/xBETQbEjQRVHd9MhYZWv9oVRINh+e5qbZw8r1fIJ0RwekRTeOuw5GdSMxBewsRMtTi3yNYFRkb0HoxQ2adlDWs4Y+R9vNygubQih/NC9AWByfSHMmL0GNDeSvbl0cmWzpOPTqeSRExq+a+P0OzVTt8ZFxM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1780079093; c=relaxed/simple;
	bh=UeHE8FngsFzOqtRt38sTx5XiaHaRF+B7JZgy2Sp2ZT8=;
	h=Date:In-Reply-To:Mime-Version:References:Message-ID:Subject:From:
	 To:Cc:Content-Type; b=HkoXE+jLVchdxDqxGHL32UsE44xPh+V2dkBB+V6TyTWFIr57d6IaB/vqY3lgKAGvPvX/EL2gleWHYJhFgvCO/xFbubyEps3vJVL3vtOzIjFAXVYTf7WFE9sik3i5WTL/Icdu5fH8CM31R62IciHFMvhCNq5wCsj8Rl2eUSG2nUI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=flex--seanjc.bounces.google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=gDVuH4tq; arc=none smtp.client-ip=209.85.215.201
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flex--seanjc.bounces.google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="gDVuH4tq"
Received: by mail-pg1-f201.google.com with SMTP id 41be03b00d2f7-c82ac893940so7210704a12.1
        for <sashiko-reviews@lists.linux.dev>; Fri, 29 May 2026 11:24:52 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20251104; t=1780079092; x=1780683892; darn=lists.linux.dev;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:from:to:cc:subject:date:message-id:reply-to;
        bh=7KC7JwfT5evfbnVHlmq0f2yFu9P+G1LslL1SBdd7A1I=;
        b=gDVuH4tqhMvoGlKKGOACG/Oe65zGb0xOMvWkaSG06azfGrO0bAv9+Yzk5HLNi8LdsT
         ncKjJegGnEc7/fpup4HO6T7TqLx5OnYkjO5eHNS76YMJppne5P3mOzG6EEu9fO1zHpXs
         VXBMhDYa1/eOtDumL/K2T0298KgQNrCziv0vT8mmxmJgMVlmCuCh+Mr1t6UD+cm09qPE
         roE3Nypx2ULzRqeYH7q6Fy+lZZTcMxeUz5So4SSk0+9UmMnX4u/EwbdOa9XBfuMHWnN6
         WQAvNR2VsbO2nc5zXPY6/nljuPTgvowtdRCudJ9vqTLQch4EnY2tyysXMfy7d0qMSmhn
         fJRg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1780079092; x=1780683892;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=7KC7JwfT5evfbnVHlmq0f2yFu9P+G1LslL1SBdd7A1I=;
        b=cROiir+DyOCs0mHPNfGM2kNQTlI+VEPSQmrr7kCQlz42vE37GTjJ69l8uIx4ftk/G0
         /J0J1k0Ur9A7IeS/3y6cCFcosc6smQgr5z1yi5GfuKWScFci73XoMrhWvx46Qurgee6K
         OaN1WHPLkxm4aDAL8/+6/LlkGECBtDI7VUNG5aRPSxZ9sXJak0Kg/v1vJ+ld7/KcWhtM
         qe0Bm6t4Z3lvgRN99uEHQ24B/Gmm/hLnh7XapF/dS3oagGD5P/ew6HZPgSYlgp7lv5Ny
         LP9ZLetstTrgDK9yWxnr1/M+Lhw7DaBb6PiS4J04n1gFJNM6r67sfEzhJEVK/pY7Gv2k
         qoKQ==
X-Gm-Message-State: AOJu0YxI8vf0tlu0picenCKgkcuBtrvNhX7/tkMYHjz62EAn+3xMcoSQ
	WW3C+x7M/dQCVcofov2Y3CLH4gIjQf3l1fEBkHp8DTXiuH1t7dCnX1JV5yb0z9VJFxpiIIZLXo2
	dOM+15XzbBDsIJTr8+RkMtu9q+NRdmy/v+0yOYq7DRlenu4QQFrdZesuSvb8guzioK5DhKH9lxn
	A/SF+BM/GgX4cJYHi/D2s1hdoj+aEkm4PpG727tulsJYKZpzCe
X-Received: from pgnb26.prod.google.com ([2002:a63:715a:0:b0:c85:71af:a857])
 (user=seanjc job=prod-delivery.src-stubby-dispatcher) by 2002:a05:6300:189:b0:3a2:c683:fa84
 with SMTP id adf61e73a8af0-3b427f6d141mr406494637.27.1780079091312; Fri, 29
 May 2026 11:24:51 -0700 (PDT)
Date: Fri, 29 May 2026 11:24:50 -0700
In-Reply-To: <20260529181207.5E7D81F00898@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: sashiko-reviews@lists.linux.dev
List-Id: <sashiko-reviews.lists.linux.dev>
List-Subscribe: <mailto:sashiko-reviews+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:sashiko-reviews+unsubscribe@lists.linux.dev>
Mime-Version: 1.0
References: <20260529144435.704127-19-seanjc@google.com> <20260529181207.5E7D81F00898@smtp.kernel.org>
Message-ID: <ahnZ8tuHFVFTeofW@google.com>
Subject: Re: [PATCH v4 18/47] x86/kvm: Get local APIC bus frequency from PV
 CPUID Timing Info
From: Sean Christopherson <seanjc@google.com>
To: sashiko-reviews@lists.linux.dev
Cc: linux-hyperv@vger.kernel.org, kvm@vger.kernel.org
Content-Type: text/plain; charset="us-ascii"

On Fri, May 29, 2026, sashiko-bot@kernel.org wrote:
> > diff --git a/arch/x86/kernel/kvm.c b/arch/x86/kernel/kvm.c
> > index 4fe9c69bf40b3..c1139182121d5 100644
> > --- a/arch/x86/kernel/kvm.c
> > +++ b/arch/x86/kernel/kvm.c
> 
> [ ... ]
> 
> > @@ -1039,6 +1040,13 @@ static void __init kvm_init_platform(void)
> >  			x86_init.hyper.get_tsc_khz = kvm_get_tsc_khz;
> >  			x86_init.hyper.get_cpu_khz = kvm_get_tsc_khz;
> >  		}
> > +
> > +#ifdef CONFIG_X86_LOCAL_APIC
> > +		/* The leaf also includes the local APIC bus/timer frequency.*/
> > +		apic_khz = cpuid_ebx(timing_info_leaf);
> > +		if (apic_khz)
> > +	               lapic_timer_period = apic_khz * 1000 / HZ;
> 
> [Severity: High]
> Could the intermediate multiplication of apic_khz * 1000 overflow here?
> 
> Since apic_khz is a u32, the multiplication is evaluated in 32-bit unsigned
> arithmetic. If the hypervisor reports an APIC timer frequency greater than
> ~4.29 GHz (apic_khz > 4294967), this calculation will silently overflow.

Hmm, easy enough to use mul_u64_u32_div() (I think that's the write helper for
this?).

But this problem pre-exits in almost every other path that sets lapic_timer_period.
So while I tried to avoid doing yet more tangentially related cleanup, it seems
like adding a helper to set lapic_timer_period is the way to go.  That would also
allow making lapic_timer_period local to arch/x86/kernel/apic/apic.c.

*sigh*
