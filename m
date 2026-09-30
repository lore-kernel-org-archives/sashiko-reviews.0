Received: from mail-pl1-f197.google.com (mail-pl1-f197.google.com [209.85.214.197])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 20B9E4E3245
	for <sashiko-reviews@lists.linux.dev>; Wed, 30 Sep 2026 20:20:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.197
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790799626; cv=none; b=TCGXjYY1s95JHdK+kB3IE6W9oL5Za0IayZJiYRGe4oIwe1mSO3yEjXsWuAHniOFduCcWXKzyIXGeeiE5m/Q+CCmtOwveYITOwrGxRLVLOVxEmU9RL/ZbaMPQ2wYloh22H4VI/xcqdcaMiPCxoupBXl1/ysDolkUOqHfMi7QvN+Y=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790799626; c=relaxed/simple;
	bh=pROM/d8TjYItyczd0ZLvs1b3rVntUprmiozAkwXTu5g=;
	h=Date:In-Reply-To:Mime-Version:References:Message-ID:Subject:From:
	 To:Cc:Content-Type; b=Hruhr0B7vZlAnIFklAP13EWmRFkRU8BgfhKNjxqJyIAl8vrhpiOdWy6QprrNeAyO735DhXEDyFCzyw+I5+iB3KBFpJhTmDFNtGHs9uBPT3Kt/y5zbG/Kwi5lddWhEEdcVx9DIFQ2M+HbNRETBt4a1xyMWslxStt5BuZtT8UdtDg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=flex--seanjc.bounces.google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=Sd5+eTEV; arc=none smtp.client-ip=209.85.214.197
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flex--seanjc.bounces.google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="Sd5+eTEV"
Received: by mail-pl1-f197.google.com with SMTP id d9443c01a7336-2e2d3a3ff86so23707085ad.0
        for <sashiko-reviews@lists.linux.dev>; Wed, 30 Sep 2026 13:20:24 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20251104; t=1790799624; x=1791404424; darn=lists.linux.dev;
        h=content-type:cc:to:from:subject:message-id:references:mime-version
         :in-reply-to:date:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=/BSGxIvKKiTIcHT7dHMyFdt77JSPWeT71yIZ+PkBTxY=;
        b=Sd5+eTEVyeDg2KH9sH1YVia/xCrkpdKMSB+odBqhQASGYqlnZ2y18hqWbE88B9q0Z8
         nbIVHfdmirpP7+YRP+/oYffDi3dj3G0frDGc6FX8KCY2d825z8EiBqjOuiAOqjUU1RMN
         /SEeMh/V5YUARabqhYJzbcPO1yIAu3gdiBayDNzo/N+BlE34wPoBvliZTjn0gTA9tm2d
         15LoZkGJCHCVPYLeO9eIBDakSFL/Sfd58oCCYs3i6z6jQyrt6cP6dvU/ZI6Vg6sit7xS
         gvgfggJ87Wt93s0vuj5IFZwVkiFGfNlTEtDkLQM0/UGoN+F2A/qRlE1ie72J5e3oBTeU
         fdFQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790799624; x=1791404424;
        h=content-type:cc:to:from:subject:message-id:references:mime-version
         :in-reply-to:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=/BSGxIvKKiTIcHT7dHMyFdt77JSPWeT71yIZ+PkBTxY=;
        b=DqTi5rP2YqTzd/Fy7NukXn61nrGu1qYVFjBoBj7GQzNfFARtg+tiGAuPPYIB1RE0Ks
         2zqjkXWjc93uT7SzBh8YKjUcV2RTzosdcWBUpEC5v8e9s3T01a0fDE4Ncpymzr4lJdlt
         Tf6FccCAxzt5FXuD5hE6JSxGMLYeRV9JRXwC55K1RdVYTVd5voWIuLrfF/Qy9W3TXTRd
         aL2gk1Z4B/NrFWtX8IH3e3LWsb+qxWX/RdzKDl8eJexG1eTnfdqNDL0OzIgv1JD3OJue
         UxNJGoB4GgcasGCc74ZJ7ZaewHXK+0+uskObHSz4ShuQC3U8tKhcERmJDjEdPq/B/d8K
         XTnw==
X-Gm-Message-State: AFq9FYI8QrFy4Oi8Rhn23pg4ZxEMx1Y+4cS8Jb+5CUmJTRAED+2wjp3g
	jsSTfrW1UUbygdxF3gtCTQu8Svl6t4CMz+0S5TRRvdurr4nC51cj/8ka1+vKO4iTTCGcLosl+Wb
	YN/oXFCxF4sCqX69gw6LdyIpV//fRkj43vUHOMLUNBzmN/YLpDW5UDtLqvOsNZhYKdkqYq98/+Z
	t51UBp0glajGziyxXRSLtt/XSiRMOHsEwZUDwa7zqO6Ku1OuYd
X-Received: from pldy20.prod.google.com ([2002:a17:902:cad4:b0:2df:a5ff:bf3])
 (user=seanjc job=prod-delivery.src-stubby-dispatcher) by 2002:a17:903:4587:b0:2db:63cb:1b17
 with SMTP id d9443c01a7336-2e2e4b5b242mr23140155ad.18.1790799623967; Wed, 30
 Sep 2026 13:20:23 -0700 (PDT)
Date: Wed, 30 Sep 2026 13:20:23 -0700
In-Reply-To: <20260930195407.28A811F000FF@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: sashiko-reviews@lists.linux.dev
List-Id: <sashiko-reviews.lists.linux.dev>
List-Subscribe: <mailto:sashiko-reviews+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:sashiko-reviews+unsubscribe@lists.linux.dev>
Mime-Version: 1.0
References: <20260930193634.3415089-1-seanjc@google.com> <20260930193634.3415089-13-seanjc@google.com>
 <20260930195407.28A811F000FF@smtp.kernel.org>
Message-ID: <ar1vB2BtBggBIxzp@google.com>
Subject: Re: [PATCH v6 12/12] KVM: SVM: Add support for virtualizating Bus
 Lock Detect
From: Sean Christopherson <seanjc@google.com>
To: sashiko-reviews@lists.linux.dev
Cc: kvm@vger.kernel.org
Content-Type: text/plain; charset="us-ascii"

On Wed, Sep 30, 2026, sashiko-bot@kernel.org wrote:
> > diff --git a/arch/x86/kvm/svm/svm.h b/arch/x86/kvm/svm/svm.h
> > index c3380d865b751..6d0242966dc87 100644
> > --- a/arch/x86/kvm/svm/svm.h
> > +++ b/arch/x86/kvm/svm/svm.h
> [ ... ]
> > @@ -789,7 +789,12 @@ BUILD_SVM_MSR_BITMAP_HELPERS(void, set, __set)
> >  
> >  static inline u64 svm_get_supported_debugctl(struct kvm_vcpu *vcpu)
> >  {
> > -	return DEBUGCTLMSR_LBR;
> > +	u64 debugctl = DEBUGCTLMSR_LBR;
> > +
> > +	if (guest_cpu_cap_has(vcpu, X86_FEATURE_BUS_LOCK_DETECT))
> > +		debugctl |= DEBUGCTLMSR_BUS_LOCK_DETECT;
> > +
> 
> [Severity: Medium]
> Does this restrict host-initiated MSR restoration? By making the
> DEBUGCTLMSR_BUS_LOCK_DETECT bit strictly dependent on guest_cpu_cap_has(),
> this might reject host-initiated writes to MSR_IA32_DEBUGCTLMSR if the VMM
> restores MSRs before initializing the guest CPUID.
> 
> In svm_set_msr(), the rejection happens unconditionally:
> 
> svm_set_msr()
>     if (data & ~svm_get_supported_debugctl(vcpu))
>         return 1;
> 
> Since svm_set_msr() does not appear to check msr->host_initiated before
> enforcing this capability limit, could this regression break live
> migration when userspace sends KVM_SET_MSRS before the CPUID is fully
> configured?

By design.  The msr->host_initiated exemption is "legacy" KVM behavior that we're
actively trying to remove.
