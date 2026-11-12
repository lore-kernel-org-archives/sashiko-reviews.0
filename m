Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.214.198
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794501740;
	b=m2gVp6ddvkwTCcPSJ+eE7YDxck+0FV11MKYA1be2BCv5BxBtobciBiwmhkYqO0wWasdx
	 /RumeeeVOq1zBKE3cQ9VyF+1qX/5KMVE3fOWRL167B7ZUYp2wvqk0KY1SzxJgPr86nbjd
	 +tlNM1/rCLawYGcvCXF/YdhXD7hUOzR/99dtJskkYBg8rXmahZC1NZiHtinoejlzs8JMb
	 cDOB+lms1ldZTYNh8HmXf2PjDaFLcR8IPBNhAxFH0SgfZnr7CddBy61w8ug+QGK0eVbtO
	 8r/ihODPGIkSwc8xslpJOpzNKGNPRInefeWc4CUECeo3Q5nFzDPj1mbbv/6OJ9KrRWQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794501740;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Gm-Message-State:X-Received:Date:In-Reply-To:Mime-Version:
	 References:Message-ID:Subject:From:To:Cc:Content-Type;
	bh=AkbVykVZBQUYEeZ40x+qwIRW7yVXsi+IgJgibQddBlo=;
	b=VXOIF+qpjhiyNXGW72zq6D0yVWG9a4egOPUGrvU5SJwYLnGdXCAF5DP3QCS+okO9RZtl
	 1FSLZ9CEI3rPqv0Lyd1PivmGREnwiTU2sVj0ytLLLvnyRjLuJVE7e1sYnD4dWeH6HznH3
	 B7RgDmlaL4qLb2Euphh6Y9Z64SeHI73s5zIRbvZQafFcPVs2y8/cYlCpU2fOU4kpdQQHK
	 hS3ifxBv+i5u8DricYb4R3GLTg/TPfnrUNVdZuxFEyRlsiA5AlKp7Vup0a9KQo7WJpdWN
	 64upzts5c4jWJgRWIsSiMHug/L9gtVAF/gdgNsRmnyEDIecbZ4Ill2ZSFHRuv412kJA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=google.com;
	spf=pass smtp.mailfrom=flex--seanjc.bounces.google.com;
	dkim=pass header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20260707 header.b=T9lSnHv4;
	arc=none smtp.remote-ip=209.85.214.198
Received: from mail-pl1-f198.google.com (mail-pl1-f198.google.com [209.85.214.198])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D5DC5606A327
	for <sashiko-reviews@lists.linux.dev>; Thu, 12 Nov 2026 16:42:19 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org D5DC5606A327
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flex--seanjc.bounces.google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20260707 header.b=T9lSnHv4
Received: by mail-pl1-f198.google.com with SMTP id d9443c01a7336-2eb2437d752so845315ad.0
        for <sashiko-reviews@lists.linux.dev>; Thu, 12 Nov 2026 08:42:19 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20260707; t=1794501739; x=1795106539; darn=lists.linux.dev;
        h=content-type:cc:to:from:subject:message-id:references:mime-version
         :in-reply-to:date:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=AkbVykVZBQUYEeZ40x+qwIRW7yVXsi+IgJgibQddBlo=;
        b=T9lSnHv4SN12DFoFjBJYneFWK5DWGfHjdYi32kkuFhLAbmxdWEHePtTzB7ngj25PCx
         xbGPAYo0Yf6i+u9M/JeKvJC6KLcCdHRMxCucGtAOKW5P8C0OadWppx2kWhIZc15yf9mH
         Xwc2r6ZGn93CHhs2knMebJs251SPUIqxO6pcc3VDNY+lAAXmDCFcpzxpYuVGYFo8q5mQ
         ZbqGFcLi8V+kFntWvz2qDapwWAYOpFmZwSF7QWCsVRpuAuLNbFWfhK/At8jyX/Bi0EAX
         T2Ek9D3j9Ogx4BzBP1ilMr9yimIMyR5VvcYLXPu+zRdSoiBvFM34OnjIdjk83DSOw8/P
         v6VA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794501739; x=1795106539;
        h=content-type:cc:to:from:subject:message-id:references:mime-version
         :in-reply-to:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=AkbVykVZBQUYEeZ40x+qwIRW7yVXsi+IgJgibQddBlo=;
        b=fnpIcIVdfPYSY2nGgS0TkgiM93tCvMLiNOh9S4uaBiPUCAptNImqf5yi64VdcAi26x
         mDvj5W8OwtFX9WTBDB7+n+9vRYf89D4pGwgAQUvvW+jbb9Y0ZXZx/kbVSyN5yowqPobd
         pmpUeIwZbk4IPfiGBGSPTdU2mBpVjCdf4TAIVMiGkwsoq0n5613XJ3VdLkZlTxkQWr7J
         T0VPlZ5Q+CXith0cxqZi/Hvtp2MQFAusFfobsYGHUQ8VDS3RgeO+lP+gqkV2qEyEaPLF
         hbY6qBTVrxp7LJosxqCVareLGEU+hRbNncgjHstp6qKgPy+Giz+LvbDcb4AII22mPkkF
         nfsA==
X-Gm-Message-State: APuU4Z/eOLvMYLLGZGB2ri+04EnT0Km9v/XBRYeXhzbXJHF3MroTLY7g
	2SJU41v1TW4yWKC17E0PPq9vfElqc7HvmWwHCd8dB/zM45J1/GQlMqCB192CmSsUTU3GaN5cNqz
	a5mAkXNoJyLoESx0FYzxP4PHe4VogPPHpg7dM1L38pBzKSacpByHBWCMFPNG0ainvj0AoxS+2Xo
	+kxfWre2gseGavOzJvKmxWkX4VTDpjaurGq4zay4CMcDMr4SZN
X-Received: from pjuw13.prod.google.com ([2002:a17:90a:d60d:b0:3ab:133b:49b6])
 (user=seanjc job=prod-delivery.src-stubby-dispatcher) by 2002:a17:90b:5584:b0:3ac:8fff:5a1b
 with SMTP id 98e67ed59e1d1-3b182edd001mr5732914a91.34.1794501738408; Thu, 12
 Nov 2026 08:42:18 -0800 (PST)
Date: Thu, 12 Nov 2026 08:42:16 -0800
In-Reply-To: <sashiko-outbox-210535@kernel.org>
X-Mailing-List: sashiko-reviews@lists.linux.dev
List-Id: <sashiko-reviews.lists.linux.dev>
List-Post: <mailto:sashiko-reviews@lists.linux.dev>
List-Help: <mailto:sashiko-reviews+help@lists.linux.dev>
List-Subscribe: <mailto:sashiko-reviews+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:sashiko-reviews+unsubscribe@lists.linux.dev>
List-Owner: <mailto:sashiko-reviews+owner@lists.linux.dev>
Precedence: list
Mime-Version: 1.0
References: <57324d544da1e92cf3b30ff7c40595dfbca1933d.1794465097.git.priyankamani2100@gmail.com>
 <sashiko-outbox-210535@kernel.org>
Message-ID: <avXsaIGjGotdeJiR@google.com>
Subject: Re: [PATCH] KVM: nSVM: Check full nested state size before writing to
 user buffer
From: Sean Christopherson <seanjc@google.com>
To: sashiko-reviews@lists.linux.dev
Cc: Priyanka Mani <priyankamani2100@gmail.com>, kvm@vger.kernel.org
Content-Type: text/plain; charset="us-ascii"

On Thu, Nov 12, 2026, sashiko-bot@kernel.org wrote:
> [Severity: High]
> This problem wasn't introduced by this patch, but in the paired setter
> svm_set_nested_state() [1], does a failed nested_svm_load_cr3()
> leave the vCPU in guest mode with an active nested MMU context?
> 
> arch/x86/kvm/svm/nested.c:svm_set_nested_state() {
>     ...
> 	nested_vmcb02_prepare_control(svm);
>     ...
> 	ret = nested_svm_load_cr3(&svm->vcpu, vcpu->arch.cr3,
> 				  nested_npt_enabled(svm), false);
> 	if (ret)
> 		goto out_free;
>     ...
> }
> 
> nested_vmcb02_prepare_control() enters guest mode and initializes the
> nested MMU context, but the out_free error path only frees save and ctl
> without calling leave_guest_mode() or nested_svm_uninit_mmu_context().
> If userspace passes an invalid guest CR3 and then continues running the
> vCPU after KVM_SET_NESTED_STATE fails, the vCPU runs with a corrupted
> nested state and leaked MMU state.

Ya, I have this locally, just need to write a changelog and get it posted:

diff --git arch/x86/kvm/svm/nested.c arch/x86/kvm/svm/nested.c
index 07554089ec05..4b1cdc7798bb 100644
--- arch/x86/kvm/svm/nested.c
+++ arch/x86/kvm/svm/nested.c
@@ -2114,8 +2114,10 @@ static int svm_set_nested_state(struct kvm_vcpu *vcpu,
         */
        ret = nested_svm_load_cr3(&svm->vcpu, vcpu->arch.cr3,
                                  nested_npt_enabled(svm), false);
-       if (ret)
+       if (ret) {
+               svm_leave_nested(vcpu);
                goto out_free;
+       }
 
        svm->nested.force_msr_bitmap_recalc = true;
