Received: from mail-wm1-f54.google.com (mail-wm1-f54.google.com [209.85.128.54])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 136A449E5DA
	for <sashiko-reviews@lists.linux.dev>; Thu, 15 Oct 2026 21:20:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.54
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1792099255; cv=none; b=h/hONRcxx5rBRCRwfDxmn1qxl+9/CymnUMCdNkNifXBLApM/kgun0QbquWdr/xAkwPctnIPY+9kNJCXq3h4msmBLai0VipPRwnIL565RzE/dyt+QVfGkyVdSIxrN6CDVHCgnYQHhqwyhWTqqwGAy3dA7as27L0q30svNYz5GqFE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1792099255; c=relaxed/simple;
	bh=Yj7QpJ6iyLJp+q4iSF4BxN/HXKQJV7Rin6lEq+jWuVo=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=SKEjRuePHkqhgqLm0LEaOxOewPlhhdgDkZRL66ArBV0Rb8jOdU3PSH32ly9owkEMorHoZxYJh5omJM3B3NYvhxz7AraGZL2ua2o0iPc1ZyNeudb+WBnKe+kSaLtxp3UMM+8uPPeeHytE/rHBq/XhxRalmifx/ax5/hJo5LHrRsw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=JPX6WjOL; arc=none smtp.client-ip=209.85.128.54
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="JPX6WjOL"
Received: by mail-wm1-f54.google.com with SMTP id 5b1f17b1804b1-4a18617ae90so22725e9.0
        for <sashiko-reviews@lists.linux.dev>; Thu, 15 Oct 2026 14:20:51 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20251104; t=1792099250; x=1792704050; darn=lists.linux.dev;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :content-type:mime-version:references:message-id:subject:cc:to:from
         :date:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=d/SCp3soHlE0ZHF/n58Ck0SA2pQz3WeYqKxv+5snRHI=;
        b=JPX6WjOLAa9zW1lb2gC3oX44X6AAGStFK+D19g9asM1c1w5fnVIl9LaQDyPB2M/bZl
         C46U8tOUlSsjNjlpVyoM1C4o1vT6BG9uzv84eGQMStBHSGQ1uuxsp874QK5GivE9tLLg
         86tkgkc8vUFCV4ZiCxqBGYjyInQ0mj6h4GnBTJ67aUqwwhXxeIpHVkAq9OVEO3Kyw7FK
         hfxRfXZvsFZDfvbddFe25d9xjg0jXTpR3j9C5ELBcwmL3KOnc/mV/JD2f+vWSCAltYLD
         9tOK0Y1wHVCNh2sLRcG7G3/1MInlYi9vMrD2pGl2F4ZClz//P4oQG/oyJEYbQaAzOUbp
         Fd0w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792099250; x=1792704050;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :content-type:mime-version:references:message-id:subject:cc:to:from
         :date:x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=d/SCp3soHlE0ZHF/n58Ck0SA2pQz3WeYqKxv+5snRHI=;
        b=MBHQrfrabQUcdydCV4IzFsueMvxzUooJKjYGVuvxs+kvvbumHit6nsEaYOpLzQouTY
         aWkpFI+lyqmJKzhzigA2VtPMmBjsiSl1ckQiGjvteX5Bbmg/0s/wIsxne2M/p24jmhOC
         SZ+otyC6CdpQX2UJ//ny/lNrVfLzBxTBV6Sj3LAQ/SZBVtKw9hX6qx0/aAhueXlxC0iL
         m4Aay6lmB+i9+McQDtgLPLG6Vqg2hKxOtK7YIVlCyEuQxtCgHDuWI0z4AZHsy+dsUA1I
         oOV38zbKDWJKZvx0aMAsZ/IaStqueKRvMCi15msZGGwQHcvHrcx+am7/yHJOHHX9PcUJ
         vkqA==
X-Gm-Message-State: AFq9FYLNRFwThkwKHPzdyYGN5Jgcrt3J/lFB0C3HTJaZC9MjDpd2zHyo
	Hc/xj4vEPuSm17iHT6D1SN2zVSp2nhoM+dSFkPfIRnRHRgWeGirWkwBHowOxKYe4ziodiK3f7Vx
	SWerP+A==
X-Gm-Gg: AYBFou16lPxmfJvtJJNJ2g/09hoLcuFfHOzWnJUc+PhBdYIQeg8vfExy1ToizpS2FD4
	8bCWnWk1DUzGp/BWnZ2UXEDBJkxrNh4G8zc9JqPvbB4EuH9STTEtKcTcfKigSAVVV3RDD8pj+C9
	SDBOpT6MKJ0lVBP3oU0kok+5ZJWnxKlVWRTwmI28LyuNKsDCGZR8KYMWxpu2I9xyncrmzD0O9S/
	XnxnvBNWv/shDZCWTm3GaahsTrwww+4rkaEV9p5ZGR9SnRZWujWkI0hZ+DvwtLuj8naJkWyf8Hy
	cVOSNyeL3CtehLmBK++F0+loHKByrJg/1IwMyBF+2YyOiwMD7Nztdnpigw+ijgdiQPvfsgNLq5V
	IAvsf6q6jpRJ9YP885p1pEAt9OkrPFmGHxnQp6BJwlu0FCaZSaFhyQS45ZgoeDPXfeuSnGq7arU
	wTUsSpjNNa5qETgXZ/5thk8AGOIZ6poFWG7Rtfm8RrEEMnc+ubFXsqFcrcy1gyHSW+mnny+TOMI
	O0OAxR4zIef7ZOH0ykrh8BtR0v+yCRkpRhxXoso
X-Received: by 2002:a05:600c:530e:b0:4a0:1ca4:2741 with SMTP id 5b1f17b1804b1-4a1c8ac51acmr127955e9.9.1792099249597;
        Thu, 15 Oct 2026 14:20:49 -0700 (PDT)
Received: from google.com (250.192.189.35.bc.googleusercontent.com. [35.189.192.250])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-48dfd503862sm524181f8f.46.2026.10.15.14.20.48
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 15 Oct 2026 14:20:48 -0700 (PDT)
Date: Thu, 15 Oct 2026 21:20:45 +0000
From: Mostafa Saleh <smostafa@google.com>
To: sashiko-reviews@lists.linux.dev
Cc: kvmarm@lists.linux.dev, Oliver Upton <oupton@kernel.org>,
	Marc Zyngier <maz@kernel.org>
Subject: Re: [PATCH v9 17/25] iommu/arm-smmu-v3-kvm: Shadow stream table
Message-ID: <atFDraQXAgVAEJlS@google.com>
References: <20261015200903.2735565-1-smostafa@google.com>
 <20261015200903.2735565-18-smostafa@google.com>
 <sashiko-outbox-173398@kernel.org>
Precedence: bulk
X-Mailing-List: sashiko-reviews@lists.linux.dev
List-Id: <sashiko-reviews.lists.linux.dev>
List-Subscribe: <mailto:sashiko-reviews+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:sashiko-reviews+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <sashiko-outbox-173398@kernel.org>

On Thu, Oct 15, 2026 at 08:30:54PM +0000, sashiko-bot@kernel.org wrote:
> Thank you for your contribution! Sashiko AI review found 2 potential issue(s) to consider:
> - [High] iommu/arm-smmu: missing length check for STRTAB_BASE corrupts hyp state
> - [Low] iommu/arm-smmu-v3-kvm: Incorrect WARN_ON usage panics hypervisor on invalid host config
> --
> 
> commit 9c237aa634fe8fc969bb3e8a3f07ec53bd303b77
> Author: Mostafa Saleh <smostafa@google.com>
> 
> iommu/arm-smmu-v3-kvm: Shadow stream table
> 
> This commit allocates the shadow stream table per SMMU, sized up to 1MB
> for the 2-level host table case. Host writes remain passthrough for now,
> and the stream table is shared/unshared on SMMU enable/disable.
> 
> > diff --git a/drivers/iommu/arm/arm-smmu-v3/pkvm/arm-smmu-v3-hyp.c b/drivers/iommu/arm/arm-smmu-v3/pkvm/arm-smmu-v3-hyp.c
> > --- a/drivers/iommu/arm/arm-smmu-v3/pkvm/arm-smmu-v3-hyp.c
> > +++ b/drivers/iommu/arm/arm-smmu-v3/pkvm/arm-smmu-v3-hyp.c
> [ ... ]
> > @@ -441,6 +502,46 @@ static int smmu_emulate_cmdq_insert(struct hyp_arm_smmu_v3_device *smmu)
> [ ... ]
> > +static void smmu_emulate_enable(struct hyp_arm_smmu_v3_device *smmu)
> > +{
> > +	/* Enabling SMMU without CMDQ, means TLB invalidation won't work. */
> > +	if (WARN_ON(!is_cmdq_enabled(smmu)))
> > +		return;
> > +
> > +	WARN_ON(smmu_update_ste_shadow(smmu, true));
> > +}
> 
> [Severity: Low]
> Does this panic the hypervisor on invalid host configuration?  These
> assertions evaluate host-supplied states and configurations, which causes a
> fatal EL2 BUG() when the host makes an invalid transition.
> 
> According to the pKVM Threat Model, host availability against itself is not
> guaranteed, making this a hardening improvement rather than a security bug.
> However, per the pKVM WARN_ON semantics guide, WARN_ON must only be used
> for EL2 internal invariant violations.  Validating host-supplied inputs with
> WARN_ON is a correctness violation, as the hypervisor should gracefully
> handle or ignore invalid state transitions rather than panicking.

Same as replied in v8:
https://lore.kernel.org/all/arKjzVDb56JmHJMc@google.com/

> 
> [ ... ]
> > @@ -528,7 +629,23 @@ static bool smmu_dabt_device(struct hyp_arm_smmu_v3_device *smmu,
> >  		}
> >  	/* Passthrough the register access for bisectability, handled later */
> >  	case ARM_SMMU_STRTAB_BASE:
> > +		if (is_write) {
> > +			/* Must only be written when SMMU_CR0.SMMUEN == 0. */
> > +			if (is_smmu_enabled(smmu))
> > +				break;
> > +			smmu->host_ste_base = val;
> > +		}
> > +		mask = read_write;
> > +		break;
> 
> [Severity: High]
> Is a length check missing here?  The missing len == sizeof(u64) check
> allows a 32-bit access to capture the full 64-bit CPU register, corrupting
> host_ste_base.
> 
> A 32-bit write to STRTAB_BASE will assign the entire 64-bit
> regs->regs[rd] (including uninitialized upper 32 bits) to
> smmu->host_ste_base.  Unlike the ARM_SMMU_CMDQ_BASE trap handler which
> explicitly ensures the access is the correct width (if (len !=
> sizeof(u64)) break;), this handler omits the validation.
> 

Yes, for bisectability, that is fixed next.

> >  	case ARM_SMMU_STRTAB_BASE_CFG:
> > +		if (is_write) {
> > +			/* Must only be written when SMMU_CR0.SMMUEN == 0. */
> > +			if (is_smmu_enabled(smmu))
> > +				break;
> > +			smmu->host_ste_cfg = val;
> > +		}
> > +		mask = read_write;
> > +		break;
> 
> [Severity: High]
> Similarly, is a length check missing for this 32-bit register?  The missing
> len == sizeof(u32) check allows 64-bit writes to pass through to a 32-bit
> register offset.
> 
> A 64-bit write to STRTAB_BASE_CFG will invoke writeq_relaxed() on a
> 32-bit register offset (0x88), causing an unaligned or oversized write to
> Device memory which triggers a fatal EL2 alignment fault.

Same as above.

Thanks,
Mostafa

> 
> -- 
> Sashiko AI review · https://sashiko.dev/#/patchset/20261015200903.2735565-1-smostafa@google.com?part=17
