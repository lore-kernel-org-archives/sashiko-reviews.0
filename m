Received: from mail-pl1-f201.google.com (mail-pl1-f201.google.com [209.85.214.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5FF982D94BA
	for <sashiko-reviews@lists.linux.dev>; Wed,  1 Jul 2026 20:10:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1782936657; cv=none; b=MPtsZy3cDGjIWMDEjcQcqqLYL+F6u64tyhELmfyTS6K0krSAEI6fWItUpnpaHSJb16dXasLOHcJMXVvmiLwmqDqf8duT3aWaK6a3nhTiALravLc/rZ8e4rjNRNMIh5yIZlhKZMqyhx7KkgB2f15kc2VeVAjj3N/h+Vw+FYChpbY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1782936657; c=relaxed/simple;
	bh=43WttSzZ/4iTDPskppZ059v5eB4O8aQemipf1MF1YBg=;
	h=Date:In-Reply-To:Mime-Version:References:Message-ID:Subject:From:
	 To:Cc:Content-Type; b=fs33Mz4oIIC9XiK4F0Eph3nrt2nbEJRaAfyNGjkNVP/iw8+IkhIwq8VwML1nwtoHP4A5n97iwowhuAgm78nEXehdjz5dQiSKKBoYqWA14BgXG1SILKozGoXjes9qLWnMBdU3cGl7LSnj1URasUYpmzLFCZwzOuPkgiTckgi+1J8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=flex--seanjc.bounces.google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=OoFK8v+G; arc=none smtp.client-ip=209.85.214.201
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flex--seanjc.bounces.google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="OoFK8v+G"
Received: by mail-pl1-f201.google.com with SMTP id d9443c01a7336-2c6a20348ceso13936795ad.1
        for <sashiko-reviews@lists.linux.dev>; Wed, 01 Jul 2026 13:10:56 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20251104; t=1782936656; x=1783541456; darn=lists.linux.dev;
        h=content-type:cc:to:from:subject:message-id:references:mime-version
         :in-reply-to:date:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=9pJ28VwnY7W5YCQbhrbSfDCIDP0Ys0N8XOcjlnDCvHU=;
        b=OoFK8v+GE3NL5qovRMCBFGe6G9tTqHhrCqZrRuOIbPXU89oqQnIsm6dmhCWQYELsKW
         ht1hEz/gqdTxjbGpjfkdz/bMbZMMpIDPNb+6nL5Jhrg3kZ73vRM7yGdDfLGmD9oX3wXJ
         0z1k6ldlVjWh9WxqX39OjboyJ0jE916Nn6asTJSxlS8I8Q0w8W49lpo29yvr0kKR6Z8r
         9k0PV9CphZOKmJTPAp99LS7939aT5trOtWhb75UelyzVav8+IKzTHMiJzUDprpaW7u08
         FaEJ+FBPl+oYHlDOCeYByf9hPcZ21xtr+4GNytmyE0hSXjw7G2PAtWDpe83VADxvFd0b
         Z2jQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1782936656; x=1783541456;
        h=content-type:cc:to:from:subject:message-id:references:mime-version
         :in-reply-to:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=9pJ28VwnY7W5YCQbhrbSfDCIDP0Ys0N8XOcjlnDCvHU=;
        b=IAwQf+ihha6H4+aJ+uCfE/8ZZWOBAQmL4nGv7nxbems6OtYUm0xbUryKwvKH2nR6Gi
         eXe1Xs73a9w1942zEW12hRdBreqPBdS9pNn7KthdXf2Uweya7jIPKKG8PX2NZvgaPz+v
         0d1ZUcmIiAX6eKAVmWc/SreeZbYWaSuov+lPEwFqB66LPVzeHloy343P/QfURPdmeAyS
         xLIMEi0g7N9w5oFaQOc7eTL/AuR791RQ4yWgB+ZKBXGszuBFbExZP5EzKmzLYFLtaVlG
         akd52v5wC4whPOdaORGhUXuRLxqLJR061eYhPddd1LLtua8Yz35QpCUedyIvDhNDB0O5
         Ue2g==
X-Gm-Message-State: AOJu0Yz+unzwU2O7eW7pWIBhEHyiqKE9MIttZkLnXO0xXp/Vj5knWQ2U
	wDE+QmroXOoE4vu6RopBAMWpD9pjCYck3Nkx1MJ0+x2c3eVaIFoBUOjoevnEsFBj8UbZO9EGPg0
	2q+MnK47DIa1b85O89vqiGJYPdZL9yNWbqai7AEPSgapB6mjKgROGSCk4A6TIlTbZWUeh81DVdD
	ysx0iN3meGm85D4GGUgymi/smPEkTW4rLrcWRDyTD5285fxCUS
X-Received: from plbkw11.prod.google.com ([2002:a17:902:f90b:b0:2c6:9f4f:f3b8])
 (user=seanjc job=prod-delivery.src-stubby-dispatcher) by 2002:a17:903:3c65:b0:2c9:c083:cd50
 with SMTP id d9443c01a7336-2ca9114e60bmr21403685ad.17.1782936655509; Wed, 01
 Jul 2026 13:10:55 -0700 (PDT)
Date: Wed, 1 Jul 2026 13:10:54 -0700
In-Reply-To: <20260701195245.467DB1F00A3A@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: sashiko-reviews@lists.linux.dev
List-Id: <sashiko-reviews.lists.linux.dev>
List-Subscribe: <mailto:sashiko-reviews+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:sashiko-reviews+unsubscribe@lists.linux.dev>
Mime-Version: 1.0
References: <20260701193212.749551-1-seanjc@google.com> <20260701193212.749551-13-seanjc@google.com>
 <20260701195245.467DB1F00A3A@smtp.kernel.org>
Message-ID: <akV0ToNvWYKi8HVm@google.com>
Subject: Re: [PATCH v5 12/51] x86/acrn: Register TSC/CPU frequency callbacks
 iff frequency is actually in CPUID
From: Sean Christopherson <seanjc@google.com>
To: sashiko-reviews@lists.linux.dev
Cc: linux-hyperv@vger.kernel.org, kvm@vger.kernel.org
Content-Type: text/plain; charset="us-ascii"

On Wed, Jul 01, 2026, sashiko-bot@kernel.org wrote:
> > diff --git a/arch/x86/kernel/cpu/acrn.c b/arch/x86/kernel/cpu/acrn.c
> > index ad8f2da8003b3..dc71a6fdd4613 100644
> > --- a/arch/x86/kernel/cpu/acrn.c
> > +++ b/arch/x86/kernel/cpu/acrn.c
> [ ... ]
> > @@ -26,13 +28,19 @@ static u32 __init acrn_detect(void)
> >  
> >  static unsigned int __init acrn_get_tsc_khz(void)
> >  {
> > -	return cpuid_eax(ACRN_CPUID_TIMING_INFO);
> > +	return acrn_tsc_khz_cpuid;
> >  }
> >  
> >  static void __init acrn_init_platform(void)
> >  {
> >  	/* Install system interrupt handler for ACRN hypervisor callback */
> >  	sysvec_install(HYPERVISOR_CALLBACK_VECTOR, sysvec_acrn_hv_callback);
> > +
> > +	acrn_tsc_khz_cpuid = cpuid_eax(ACRN_CPUID_TIMING_INFO);
> 
> [Severity: High]
> This is a pre-existing issue, but does hardcoding ACRN_CPUID_TIMING_INFO to
> 0x40000010 without dynamically applying the base offset break nested setups?
> 
> If Linux is booted as an L2 guest with an L0 hypervisor like KVM occupying
> the base 0x40000000 leaf, and L1 ACRN resides at 0x40000100, acrn_detect()
> correctly finds ACRN using cpuid_base_hypervisor() at the 0x40000100 base.
> 
> However, acrn_init_platform() hardcodes the fetch:
> 
> arch/x86/include/asm/acrn.h:
> #define ACRN_CPUID_TIMING_INFO        0x40000010
> 
> Will this bypass the dynamic base detected earlier and read the timing info
> from the wrong hypervisor's CPUID space (e.g., KVM's L0 frequency)?
> 
> If nested under a hypervisor that returns garbage for 0x40000010, could
> acrn_tsc_khz_cpuid be populated with a non-zero bogus value and corrupt
> guest timekeeping?

Yes, but it's not at all clear that ACRN supports advertising itself anywhere
but at 0x40000000.  Regardless, this can and should be addressed separately.
