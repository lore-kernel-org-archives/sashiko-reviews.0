Received: from mail-wm1-f44.google.com (mail-wm1-f44.google.com [209.85.128.44])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 267B2560AD2
	for <sashiko-reviews@lists.linux.dev>; Tue, 22 Sep 2026 15:55:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.44
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790092543; cv=none; b=LnECHVckc8blHIpzhBLOnIF5e5dR7mqePo3agugqi7Qd5KwUUcW97Ti5eaZqV+pEzvrz2ZAVsHoNX8EQehT/k+KNNx3MvcnyFBbeS3nmA4xG3ea4h76nvEAkvU6xPLNBxQxrDKXwsrPsmBTjAHVCofTRG32hlTHussN2/XtP3wU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790092543; c=relaxed/simple;
	bh=VVkOHEfpLNHHPekd6apPADeBF484ltkflWoqjU0FKWw=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=SMSKa/zHsLQda8Iv2SzTnnJpMs6jWmO95dKyemKbfeMr/atnqL0199Trgx3JDHqZr7Om10Q+lRt3asCvRv1Gxo4RoTW5UOGR4WJdP40Cl6QGA65fxu0qHOXUtBvAEwk+QQLBiar2bODpi3ufMwPZquDkh/0hRMD3hVtTvmUWci0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=YGjAMV6S; arc=none smtp.client-ip=209.85.128.44
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="YGjAMV6S"
Received: by mail-wm1-f44.google.com with SMTP id 5b1f17b1804b1-498012a61f6so49895e9.0
        for <sashiko-reviews@lists.linux.dev>; Tue, 22 Sep 2026 08:55:41 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20251104; t=1790092540; x=1790697340; darn=lists.linux.dev;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :content-type:mime-version:references:message-id:subject:cc:to:from
         :date:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=cpMsG9oOzAQyeQrLMHpiW+jZDIl7k+NHgCmMQE42PTc=;
        b=YGjAMV6SkZEXgepHbn8c/itK17ZGxN2PJ7WYf3nu6JirX31g81bqL5A7XCV8PAOncW
         nmAmSaJ1vwkTs0RaUxeHrX3kOPexVJt1Ty2j8g08p10r9fGosR21Kl2BqdHFjO8tSqg0
         Kc5Oofy6V8o3qN9SC9ZNqOjpNWJf4tMdIV2m4/5YZ2VeYPnVnIgvEyWuxHl/nnxRhaxk
         +lI6V9+HcZMJcR+KCO97jV7udev0mdXby+R0EQFJRCmnKBAV8kweheq0EkPInXkTIaom
         D9hj4LisbGilJvcYTMqf7sAFjQR/piUA/SRJ6rFBWW4cmKivIB8YE3anlws8xikpf+aW
         7M9A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790092540; x=1790697340;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :content-type:mime-version:references:message-id:subject:cc:to:from
         :date:x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=cpMsG9oOzAQyeQrLMHpiW+jZDIl7k+NHgCmMQE42PTc=;
        b=GQsUozTVAZe26IXu3NN56vsPLUHwpI7O0fCbyvLVnDJC4no785ZQdOezsZL1OidwD1
         RCRi06eL3HnVT/sm4d+Mj0Esv77XXsUfkorApBQSLFyxZMER+lWQhfKsImX8A+a15LtI
         miJkALfi8eJUjS2pffEPorILjmDJImIAK/meUVKkGtIUEhveAFXyv7VD2VggCWF54zn2
         McirBNTKehnkop8oBW/X0tyWoUAEySXDB8HbZaLWfYv2hI8dp1RAYQCn+sxVr3hI6g+n
         48W1VMMC76tH1s8Gyq+ijRAA4TqLKcdc5FRO+tf86hFyEtw4qZSw3mtjkXgdSl21rDze
         Rt9A==
X-Gm-Message-State: AFuF++mio/x1ge33pxgPHu7OWtVmhzjY7A5SeYxx6MioWqhzCIeT/zdZ
	5f4mUj66jyYxSTCfRPMpbZApvn2FDRhTy+8HoeoO/THIZEnplWsnfhzlQjHlfB9YqdTIhzVbm6X
	6jS1hiQ==
X-Gm-Gg: AYBFou37+YxPSynjmuuYA58xbfiIhxLSQGvwOvz8leE5Snk685Qdfb2UD/tQWeCziwE
	ZiSwBtPS4o7Jhapr1rwwcnvPt9eSK/MRgCl4fMlVaPddvsmFfjdm0fIGKjhr7PFR2omjEr2rwTW
	2Z/lhzyTts/hfaxHpMUrQEm5HydkW9Z42vE5nvTWS6XHs2+Nr+EbyWxlHhSIlBgljPFTzrwW2Fo
	EBe4Fu+A3YvDb16YRiwrWmwJzXvm61vaT9ozp3/kYWI4NvcjrlKe1JDhT6vw9K1zJWB3hjMJXqL
	hP+RPzdGgu7pbyyTGzfmLl1IbAnhfNWkAznTV4LuWjuVp0Y75Bo+BFKSlXu041OQ7Q3SihDeXZX
	jLpTHnMB2hMOqxx7k0Hdj9gs7smt6l/LrTgYCIBFOXh1VVRD4mOBCgsP8Gxs4woq3+i09Y4Aobm
	BcDueT6yza7Zx8Y3dgwLy02yY9yVX2Ln74LlXeRY+YB1hqG8MQRHx/0E3aAIIEns+ELSR+eCk3H
	5MfFs7EunTp71KZjVEDY4ywH58ZIxf/EKuVD+ma
X-Received: by 2002:a05:600c:6005:b0:49e:642a:9279 with SMTP id 5b1f17b1804b1-49fdd97d911mr142685e9.4.1790092539769;
        Tue, 22 Sep 2026 08:55:39 -0700 (PDT)
Received: from google.com (250.192.189.35.bc.googleusercontent.com. [35.189.192.250])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-49fde199c21sm204675e9.9.2026.09.22.08.55.38
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 22 Sep 2026 08:55:38 -0700 (PDT)
Date: Tue, 22 Sep 2026 15:55:35 +0000
From: Mostafa Saleh <smostafa@google.com>
To: sashiko-reviews@lists.linux.dev
Cc: Marc Zyngier <maz@kernel.org>, kvmarm@lists.linux.dev,
	Oliver Upton <oupton@kernel.org>
Subject: Re: [PATCH v8 23/25] iommu/arm-smmu-v3-kvm: Invalidate the SMMU TLBs
Message-ID: <arKk9x6Oy8hFQiyp@google.com>
References: <20260922131259.2975334-1-smostafa@google.com>
 <20260922131259.2975334-24-smostafa@google.com>
 <20260922134512.180151F000FF@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: sashiko-reviews@lists.linux.dev
List-Id: <sashiko-reviews.lists.linux.dev>
List-Subscribe: <mailto:sashiko-reviews+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:sashiko-reviews+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20260922134512.180151F000FF@smtp.kernel.org>

On Tue, Sep 22, 2026 at 01:45:11PM +0000, sashiko-bot@kernel.org wrote:
> Thank you for your contribution! Sashiko AI review found 1 potential issue(s) to consider:
> - [Medium] iommu/arm-smmu-v3-kvm: dead-branch traps and incorrect WARN_ON usage at EL2
> --
> 
> commit 12e407f77295df6bfe7066853a3a177e9465aaf7
> Author: Mostafa Saleh <smostafa@google.com>
> 
> iommu/arm-smmu-v3-kvm: Invalidate the SMMU TLBs
> 
> This commit implements the io-pgtable flush operations to invalidate the
> shadow stage-2 in every SMMU. It tracks whether the SMMU command queue is
> enabled and issues invalidation commands to the hardware when active.
> 
> > diff --git a/drivers/iommu/arm/arm-smmu-v3/pkvm/arm-smmu-v3.c b/drivers/iommu/arm/arm-smmu-v3/pkvm/arm-smmu-v3.c
> > index 6f0ea3a4e48df..5417a5c2bf58a 100644
> > --- a/drivers/iommu/arm/arm-smmu-v3/pkvm/arm-smmu-v3.c
> > +++ b/drivers/iommu/arm/arm-smmu-v3/pkvm/arm-smmu-v3.c
> 
> [ ... ]
> 
> > @@ -221,17 +220,139 @@ static int smmu_send_cmd(struct hyp_arm_smmu_v3_device *smmu,
> >  	return smmu_sync_cmd(smmu);
> >  }
> >  
> > +static int smmu_tlb_inv_vmid(struct hyp_arm_smmu_v3_device *smmu)
> 
> [ ... ]
> 
> > +static void smmu_tlb_inv_range(unsigned long iova, size_t size, size_t granule,
> > +			       bool leaf)
> > +{
> > +	struct hyp_arm_smmu_v3_device *smmu;
> > +
> > +	for_each_smmu(smmu) {
> > +		hyp_spin_lock(&smmu->hw_lock);
> > +		/*
> > +		 * Don't bother if CMDQ is disabled, this would be useful for the case
> > +		 * when RPM is supported to avoid touching the SMMU MMIO when disabled.
> > +		 * The hypervisor also asserts CMDQEN is enabled before the SMMU is
> > +		 * enabled. As otherwise the host can prevent the hypervisor from doing
> > +		 * TLB invalidations.
> > +		 * When the SMMU is re-enabled the hypervisor cleans the TLBs.
> > +		 */
> > +		if (smmu->cmdq_active)
> > +			WARN_ON(smmu_tlb_inv_range_smmu(smmu, iova, size,
> > +							granule, leaf));
> 
> [Severity: Medium]
> Does this WARN_ON() panic the hypervisor if the hardware command queue
> stalls?
> 
> At EL2, WARN_ON() expands to a fatal BRK instruction. If the SMMU command
> queue is full or stalls for >1ms, smmu_wait() returns -ETIMEDOUT, which
> will bubble up here and cause an unrecoverable hypervisor panic.

There is no way to recover a command queue timeout, ignoring the error
might lead to TLB not being invalidated and leaking the memory content
so WARN_ON() is suitable for that.

> 
> > +		hyp_spin_unlock(&smmu->hw_lock);
> > +	}
> > +}
> 
> [ ... ]
> 
> > @@ -725,6 +873,8 @@ static void smmu_emulate_enable(struct hyp_arm_smmu_v3_device *smmu)
> >  		return;
> >  
> >  	WARN_ON(smmu_update_ste_shadow(smmu, true));
> > +	/* Clean the TLBs each time the SMMU is enabled. */
> > +	WARN_ON(smmu_flush_all_tlb(smmu));
> >  }
> 
> [Severity: Medium]
> This isn't a bug introduced by this patch, but looking at the existing code
> just above this in smmu_emulate_enable():
> 
> 	if (WARN_ON(!is_cmdq_enabled(smmu)))
> 		return;
> 
> Does this create a dead-branch trap? Because WARN_ON() is fatal at EL2, the
> intended graceful return on an invalid host state is unreachable, as the
> warning itself panics the hypervisor.
> 

Same as discussed before.

> [ ... ]
> 
> > @@ -745,6 +895,13 @@ static void smmu_emulate_cmdq_enable(struct hyp_arm_smmu_v3_device *smmu)
> >  
> >  static void smmu_emulate_cmdq_disable(struct hyp_arm_smmu_v3_device *smmu)
> >  {
> > +	/*
> > +	 * We can not enable the SMMU if the CMDQ is disabled and similarly
> > +	 * we can not disable the CMDQ if the SMMU is enabled, as that can
> > +	 * lead to stale TLBs.
> > +	 */
> > +	WARN_ON(is_smmu_enabled(smmu));
> 
> [Severity: Medium]
> Does this allow the host to trivially panic the hypervisor by issuing an
> invalid sequence?
> 
> Since WARN_ON() expands to a panic at EL2, asserting directly on
> host-controlled state (disabling the CMDQ while the SMMU is enabled)
> turns a host misconfiguration into a hypervisor panic, bringing down the
> host and all protected guests.

Yes, the host can panic the system in many ways.

> 
> > +
> >  	WARN_ON(smmu_unshare_pages(smmu->cmdq_host.base_dma,
> >  				   cmdq_size(&smmu->cmdq_host)));
> >  }
> 
> [ ... ]
> 
> > @@ -1020,6 +1177,20 @@ static bool smmu_dabt_device(struct hyp_arm_smmu_v3_device *smmu,
> >  		else
> >  			writel_relaxed(val & mask, smmu->base + off);
> >  
> > +		/*
> > +		 * Make sure writes to CR0 are immediately observed, that is important
> > +		 * when synchronizing with TLB invalidation as reading CR0 is not enough
> > +		 * to deduce the SMMU state, and we have to enforce the ack with the
> > +		 * hw_lock acquired.
> > +		 */
> > +		if (off == ARM_SMMU_CR0) {
> > +			u32 cr0 = val;
> > +
> > +			WARN_ON(smmu_wait(false,
> > +					  readl_relaxed(smmu->base + ARM_SMMU_CR0ACK) == cr0));
> 
> [Severity: Medium]
> Could this strict equality check predictably time out and panic the
> hypervisor if the host writes reserved bits?
> 
> If the host writes RES0 bits to CR0, the hardware drops them, making the
> strict readl_relaxed(...) == cr0 check fail. The poll will then time out,
> and the WARN_ON() will fatally panic the hypervisor.

See above.

Thanks,
Mostafa

> 
> > +			smmu->cmdq_active = !!(cr0 & CR0_CMDQEN);
> > +		}
> > +
> >  		hyp_spin_unlock(&smmu->hw_lock);
> >  		return true;
> >  	}
> 
> -- 
> Sashiko AI review · https://sashiko.dev/#/patchset/20260922131259.2975334-1-smostafa@google.com?part=23
