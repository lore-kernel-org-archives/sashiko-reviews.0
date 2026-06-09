Received: from mail-pf1-f202.google.com (mail-pf1-f202.google.com [209.85.210.202])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C0D2522AE48
	for <sashiko-reviews@lists.linux.dev>; Tue,  9 Jun 2026 00:29:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.202
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1780964965; cv=none; b=N2/DEKDy8BTRWdJHD4MlbpmlddSy+dU5YSxaNGDOz4mrcllNgASbsThFDPyXHhr28b2uOm0Vt4ReaPcCvkUbzA1cxteVYU+gduzKNgiJvO+aNQuLbWY0uRzOMjcGj52KlPXlsjbz9Mk8ODfkWMH21e7k5ZWli+h3wIVN4/0Kqag=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1780964965; c=relaxed/simple;
	bh=okCLjjcx6Ed0kcVEOGQC7olTqLps3Bv3+utUO7Z5QBk=;
	h=Date:In-Reply-To:Mime-Version:References:Message-ID:Subject:From:
	 To:Cc:Content-Type; b=Oy5H2m1Z+1feI6kof+qFeWb/0qAde6ur97oZfiqdVCyX/kpzTCO6WRS19wuYwAQDIDVeiOEmEodanus6gWvDWQzZ8sBevkE1dOY19/DWsnGMGA24WYA3Lj4ceagNUB7PZehUIggxhjoUiCkZ8+1raKVgrcR52eZPAOcf6L9IVGE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=flex--seanjc.bounces.google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=IyAcJnwt; arc=none smtp.client-ip=209.85.210.202
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flex--seanjc.bounces.google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="IyAcJnwt"
Received: by mail-pf1-f202.google.com with SMTP id d2e1a72fcca58-8423efbfb61so3202170b3a.0
        for <sashiko-reviews@lists.linux.dev>; Mon, 08 Jun 2026 17:29:24 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20251104; t=1780964964; x=1781569764; darn=lists.linux.dev;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:from:to:cc:subject:date:message-id:reply-to;
        bh=7x3B1HPEV4Wpd1aCcBTxaYdKxkJL89lmWQlqj4XB55Y=;
        b=IyAcJnwt0lkWjeVFi97/TKMkqTWJQ+uTEXZElWNJjS/fSjnudnAfdZvfV6skwsg7PX
         jO8eKEu3P8DP9VawpFZoKrv+aOsI4Avkx+M7k4rsBfWEoXkdMMTLDDJCio7FD21jwdjl
         xD+45rEKAC2BrioWT2WhShkYPWAAf+/icGs2BSEqz/sygehAp7VRA95k8Whtov999XR8
         ZYjeQxmZVQJzDyl0bIE7K17/zDVGzxty/PAs94JQsazA2e2o1l/GCu22lgyCmFmECsaV
         v6KEi06komjQ5LbNWys7TORupgVrGDp/HyOfc4VOBBs24QJh37LFQl8nlguIlX1I/X0g
         0RTw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1780964964; x=1781569764;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=7x3B1HPEV4Wpd1aCcBTxaYdKxkJL89lmWQlqj4XB55Y=;
        b=Qkkdop0Qf6dNej2hJzlxaWMT6CoBrhprQS/PArTM8BjPOucjRjQpUkaqUMA9b03sIv
         x+ZHryJFzoa8d4/lZFQzqwPgeKKDVP2X83RAjWpGsSJwhbrzu8t6OZctTfgNoD1f/ujR
         WDSHx32Y/IKV85EyiLRllEDED0Dy+ZJDZVdMWxL8qtHm1pJWdkVU8myhWGrKtMkoBi1E
         WZ0v7hKkyHq9irK7tZfzjyFRcTdys2vBDI7svF2agj6bXxKGXe+X6FOTGxNwCtGc2b21
         124WS+nhQSMSt5lufr+51dlcEyYBbpGiB5/Hs/Ybqh4lYiJBnmvaB2oaasqLSqHgv0Xl
         j61g==
X-Gm-Message-State: AOJu0Yz+g7MV6Mnn4w/Rn60WFfJpRL9tzIqmN48YRq5ilrf9+Xlbwmvy
	ByReWDnx5UMLT6ix+dHtNLfr3ZW/U+JiqXRvWDqV0aAAYy86xllxvfKIoTYqiOmTCiKiGjSGmRX
	vDpwyKvYqSNzs6adp95Rmf1U2/0IWDHiAimVMNJ1EPEE3Zx54QGq+bOwKcE3wPxdc3NWI2B2pbg
	7ujRDB5zFGTOrfuvCwFirUPUr8Bnrx2mBWHTW+rcVBoMnRFrlB
X-Received: from pffy10.prod.google.com ([2002:aa7:93ca:0:b0:838:ec6d:449c])
 (user=seanjc job=prod-delivery.src-stubby-dispatcher) by 2002:a05:6a00:90a7:b0:842:3aee:12c1
 with SMTP id d2e1a72fcca58-842b0e8312bmr17335107b3a.18.1780964963660; Mon, 08
 Jun 2026 17:29:23 -0700 (PDT)
Date: Mon, 8 Jun 2026 17:29:22 -0700
In-Reply-To: <20260530063531.D034A1F00898@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: sashiko-reviews@lists.linux.dev
List-Id: <sashiko-reviews.lists.linux.dev>
List-Subscribe: <mailto:sashiko-reviews+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:sashiko-reviews+unsubscribe@lists.linux.dev>
Mime-Version: 1.0
References: <20260529144435.704127-22-seanjc@google.com> <20260530063531.D034A1F00898@smtp.kernel.org>
Message-ID: <aideYkFmpELRfcX5@google.com>
Subject: Re: [PATCH v4 21/47] x86/xen: Obtain TSC frequency from CPUID if present
From: Sean Christopherson <seanjc@google.com>
To: sashiko-reviews@lists.linux.dev
Cc: kvm@vger.kernel.org, linux-hyperv@vger.kernel.org
Content-Type: text/plain; charset="us-ascii"

On Sat, May 30, 2026, sashiko-bot@kernel.org wrote:
> > diff --git a/arch/x86/xen/time.c b/arch/x86/xen/time.c
> > index 487ad838c4418..36d66abf53796 100644
> > --- a/arch/x86/xen/time.c
> > +++ b/arch/x86/xen/time.c
> > @@ -42,6 +42,17 @@ static unsigned int __init xen_tsc_khz(void)
> >  {
> >  	struct pvclock_vcpu_time_info *info =
> >  		&HYPERVISOR_shared_info->vcpu_info[0].time;
> > +	u32 base = xen_cpuid_base();
> > +	u32 eax, ebx, ecx, edx;
> > +
> > +	/*
> > +	 * If Xen provides the guest TSC frequency directly in CPUID
> > +	 * (leaf 3, sub-leaf 0, ECX), use that instead of reverse-
> > +	 * calculating from the pvclock mul/shift.
> > +	 */
> > +	cpuid_count(base + 3, 0, &eax, &ebx, &ecx, &edx);
> > +	if (ecx)
> > +		return ecx;
> 
> [Severity: High]
> Is it possible for the hypervisor to support a maximum leaf of base + 2,
> resulting in an out-of-bounds CPUID query here?
> 
> Looking at xen_cpuid_base(), it calls cpuid_base_hypervisor(XEN_SIGNATURE, 2)
> which only guarantees that the hypervisor supports up to leaf base + 2.
> 
> If the hypervisor does not support base + 3, this CPUID query could be out
> of bounds. Processors handling out-of-bounds CPUID requests typically return
> data from the maximum basic leaf.

Heh, depends on the hypervisor.  This quirk is specific to Intel CPUs, and so
KVM emulates this behavior only when the advertised vCPU vendor is Intel.

Anyways, AFAICT, Sashiko is right to be skeptical, I don't see anything obvious
that guarantees +3 will be supported.

David, can you send this as a standalone patch, and either address Sashiko's
concern or add a blurb/comment explaining why it's safe?  Unlike the KVM changes,
this won't conflict with any of the other changes in this series.  So while it's
themetatically very related to this series, in practice it can go in separately,
and I'd strongly prefer to let the Xen folks handle this one.
