Received: from mail-wm1-f48.google.com (mail-wm1-f48.google.com [209.85.128.48])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 314AD440A3D
	for <sashiko-reviews@lists.linux.dev>; Thu, 15 Oct 2026 21:35:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.48
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1792100115; cv=none; b=MJTKHg8xjULHt+KrhtBi8H3BgD22vkKcoW45fKFWlWFR9VGidUjp7f/AStXrvRiLGS/5nGB3KyiGPBwwHJ6eVNXGThdnilVslP//eIVfa7ap38xbblkSrhDrHDwXH/BJIIkMKRDBXNuuXFjSjqI4pFFjKn39zMle82KnE1Jfi34=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1792100115; c=relaxed/simple;
	bh=YLJ+esWXIpOv6zjtmXJDyZYxVF2ULGD/KkT3OdWxOHw=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=CUXYG3LlQgCR7CIPu1eInzLvFApjPnH/sPyPZhVqraBCibeoWQ+9DXJSHv36nu83WZEAN3kNd9sNC/wxQwRcc+9Hl8CJhX/1EYH6exXDUeA70zcHyd5ytXCp0aYh39CKhMUVo+0JngYkOn32KFwF0ULnZOk0O1+nSRR7ZMVCp0s=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=fpNpuxEh; arc=none smtp.client-ip=209.85.128.48
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="fpNpuxEh"
Received: by mail-wm1-f48.google.com with SMTP id 5b1f17b1804b1-4a018493d57so22385e9.0
        for <sashiko-reviews@lists.linux.dev>; Thu, 15 Oct 2026 14:35:13 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20251104; t=1792100112; x=1792704912; darn=lists.linux.dev;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :content-type:mime-version:references:message-id:subject:cc:to:from
         :date:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=eZTNoCVWIGqXbfEtghpL4XvetlCTxSjuBCrt1vW+mNc=;
        b=fpNpuxEhmYhm88wI/idImKh0dlRiKAxEl2Cfuj1k6XWJ70JoSmUU1H6LPwQCOp4iE7
         +XERNPVImHLubBaUSVBy94Ie+Bxa0ZPxCssEvM7QJRpAOja9YsW5t/agbGSVvOpmDFU7
         HTYeU3QYjP+WvBCLX4xYkDGXydqdoW+Ut3U2cgCiTbXKgwiNVC6xwqfoVwq2YuEGKNMz
         Gr+rE47W203xqEuNpFPXFjLkwRhYF4kxkHn9aTvsM9ltDJKfkSWDuInGIbEcwto5+oht
         QsrcPVQr5e0Ko5fhgRvdjRly7SHgRXcQv0JxWmfyXhUfCg9IQlaI8neei6RkNcmzAgXm
         JzTw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792100112; x=1792704912;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :content-type:mime-version:references:message-id:subject:cc:to:from
         :date:x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=eZTNoCVWIGqXbfEtghpL4XvetlCTxSjuBCrt1vW+mNc=;
        b=ZDw63FBttoGq1NpfRNlk0zcyFa7FbsqW6T29QZ0eW44P+JbT5T4kgvhb8fsWZg8S4m
         A7807fPs+pfCgKXGIIouTNF7Sjf36VISt2bu/kymicQdcDaCPjpnqvpTOslQThzIopcs
         2WyDzVyxh1k3swAKOhv/opxtgjIjASs3X9GSgQHVJ5N968mrMvUSa7SoXnFltjSuZ+cw
         kwamy2WOcnSS6KAIMDdipgSiqBxa2RxZkHTQ8/ZX6XgeXOx4iDoynJ+yE7oDVeg911yB
         vGqCPOEeoFT3bR/Qr4HnNC/0/UmO5MLl9HkvJJniDnVK9P4USEjeVVGxsvJMuHC/n0mO
         TT8w==
X-Gm-Message-State: AFq9FYIekkSGkMF+bBFANaRovpvyPCK2J6kPoYJ68TxEfAsb9POP6c+W
	d1SSscEALUzst4rr29bwv2OJ7P9SuI/SUT1uaKLCOnhI3rA7gSHKPzYHR+7EQsLMQCmspQxCcn5
	0+uoHQg==
X-Gm-Gg: AYBFou0M1Grmg43XV3/zXZqW3xFKpJ/L/wkMf2F38CARn8Lt48pus3gwjQtk1dROwBF
	mlhwIiLxFwcazObZUY8Mpe8ZaUCxWvmBXi7IqemAOIFDHBG/2mlIMNE8OYAe+twrPjoNtf7YmPB
	jkqMpdl1ImXrEtw09mKZUeP2z2grkdGKTWLr1RhWLzMnK96AXbkhzF2YdPxQWFhEmRVZZ6ZPgOd
	qKA6I5zIeISfhSQ6zDE5ox7C23oFrBc0qxvqDHwtyfo8v9sipYPVXLateRUgl0DDzE0SFeoDiq4
	g56k6na+EPl6YWtyFaPg/8m3Ar/MS/vZJC7UjKOjwaXoe3QSEZF56r964+WLLTCOiF3gsiyILPS
	zj8yJt5lTvDYucTnq7AGCyQteLJFzHNoJH5LLn1IYxWEQ+PlMtFi/lkV3zgK0ymKUVyOrvYgkWQ
	iKW01oD4bb/Jm9hKzKetqeDxOH7frPa59RkcJ9gTYpwyhXubjzVPjDX2RIkMXVYakLoZM3mkrgh
	D9+a6BYx+2JKNp2CoKjF9AGNgNEJdJKqV3VXQXY
X-Received: by 2002:a05:600c:4894:b0:4a1:68a3:9c2e with SMTP id 5b1f17b1804b1-4a1c8517f98mr219715e9.5.1792100111845;
        Thu, 15 Oct 2026 14:35:11 -0700 (PDT)
Received: from google.com (250.192.189.35.bc.googleusercontent.com. [35.189.192.250])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4a1bd91c55bsm88227875e9.0.2026.10.15.14.35.11
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 15 Oct 2026 14:35:11 -0700 (PDT)
Date: Thu, 15 Oct 2026 21:35:07 +0000
From: Mostafa Saleh <smostafa@google.com>
To: sashiko-reviews@lists.linux.dev
Cc: kvmarm@lists.linux.dev, Oliver Upton <oupton@kernel.org>,
	Marc Zyngier <maz@kernel.org>
Subject: Re: [PATCH v9 23/25] iommu/arm-smmu-v3-kvm: Invalidate the SMMU TLBs
Message-ID: <atFHCwMBFXQwQocw@google.com>
References: <20261015200903.2735565-1-smostafa@google.com>
 <20261015200903.2735565-24-smostafa@google.com>
 <sashiko-outbox-173391@kernel.org>
Precedence: bulk
X-Mailing-List: sashiko-reviews@lists.linux.dev
List-Id: <sashiko-reviews.lists.linux.dev>
List-Subscribe: <mailto:sashiko-reviews+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:sashiko-reviews+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <sashiko-outbox-173391@kernel.org>

On Thu, Oct 15, 2026 at 08:28:22PM +0000, sashiko-bot@kernel.org wrote:
> Thank you for your contribution! Sashiko AI review found 2 potential issue(s) to consider:
> - [High] arm-smmu-v3: incorrect WARN_ON usage at EL2 for hardware timeouts and host inputs
> - [Medium] arm-smmu-v3: guaranteed timeout and hyp panic if host writes reserved bits to CR0
> --
> 
> commit a876edb8ca1cb558cf1336f7a093e9a259c78f18
> Author: Mostafa Saleh <smostafa@google.com>
> 
> iommu/arm-smmu-v3-kvm: Invalidate the SMMU TLBs
> 
> This commit implements the io-pgtable TLB operations to invalidate the shadow
> stage-2 entries across all SMMUs in pKVM. It manages invalidation commands
> and ensures the command queue is active before flushing TLBs.
> 
> > diff --git a/drivers/iommu/arm/arm-smmu-v3/pkvm/arm-smmu-v3-hyp.c b/drivers/iommu/arm/arm-smmu-v3/pkvm/arm-smmu-v3-hyp.c
> > --- a/drivers/iommu/arm/arm-smmu-v3/pkvm/arm-smmu-v3-hyp.c
> > +++ b/drivers/iommu/arm/arm-smmu-v3/pkvm/arm-smmu-v3-hyp.c
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
> [Severity: High]
> Under pKVM at EL2, WARN_ON() expands to a fatal BUG() instruction which
> crashes the hypervisor.
> 
> Could this WARN_ON() trigger a panic if the hardware SMMU is slow to drain
> its command queue? The call chain goes through smmu_tlb_inv_range_smmu(),
> smmu_send_cmd(), smmu_sync_cmd(), and ultimately smmu_wait(), which returns
> -ETIMEDOUT if the hardware polls for too long. Should this gracefully handle
> the error or ignore it instead of asserting?
> 
> > +		hyp_spin_unlock(&smmu->hw_lock);
> > +	}
> > +}
> 
> [ ... ]
> 
> > @@ -721,6 +821,33 @@ static int smmu_update_ste_shadow(struct hyp_arm_smmu_v3_device *smmu, bool enab
> >  static void smmu_emulate_enable(struct hyp_arm_smmu_v3_device *smmu)
> >  {
> >  	/* Enabling SMMU without CMDQ, means TLB invalidation won't work. */
> >  	if (WARN_ON(!is_cmdq_enabled(smmu)))
> >  		return;
> >  
> >  	WARN_ON(smmu_update_ste_shadow(smmu, true));
> > +	/* Clean the TLBs each time the SMMU is enabled. */
> > +	WARN_ON(smmu_flush_all_tlb(smmu));
> 
> [Severity: High]
> Does this code panic the hypervisor if the SMMU hardware times out during
> the TLB flush on enablement? Similar to the above, smmu_flush_all_tlb() can
> return -ETIMEDOUT from smmu_wait() if the hardware is unresponsive.
> 

No way to recover from -ETIMEDOUT as discussed before, at this HW is
propably in a really bad state.

> >  }
> 
> [ ... ]
> 
> > @@ -748,6 +877,13 @@ static void smmu_emulate_cmdq_enable(struct hyp_arm_smmu_v3_device *smmu)
> >  static void smmu_emulate_cmdq_disable(struct hyp_arm_smmu_v3_device *smmu)
> >  {
> > +	/*
> > +	 * We can not enable the SMMU if the CMDQ is disabled and similarly
> > +	 * we can not disable the CMDQ if the SMMU is enabled, as that can
> > +	 * lead to stale TLBs.
> > +	 */
> > +	WARN_ON(is_smmu_enabled(smmu));
> 
> [Severity: High]
> Is it safe to panic the hypervisor here based on host-supplied configuration?
> If the host kernel supplies a CR0 value that disables the CMDQ while the
> SMMU is still enabled, this will trigger the EL2 WARN_ON() and crash the
> entire host.
> 

The kernel can panic itself in many other ways.

> > +
> >  	WARN_ON(smmu_unshare_pages(smmu->cmdq_host.base_dma,
> >  				   cmdq_size(&smmu->cmdq_host)));
> >  }
> 
> [ ... ]
> 
> > @@ -1033,6 +1169,20 @@ static bool smmu_dabt_device(struct hyp_arm_smmu_v3_device *smmu,
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
> Can this sequence cause a guaranteed timeout and hypervisor panic if the host
> writes reserved bits to CR0?
> 
> The variable cr0 holds the raw, unmasked host input val. When the hypervisor
> writes to the hardware CR0 register, the hardware will update CR0ACK to
> reflect the accepted state, ignoring any reserved bits.
> 
> If the host writes a value with any bit set that the hardware ignores,
> readl_relaxed(smmu->base + ARM_SMMU_CR0ACK) == cr0 will never evaluate
> to true. This would cause smmu_wait() to poll until it hits its timeout and
> return -ETIMEDOUT, triggering the WARN_ON() panic.
> 


Same as above.

Thanks,
Mostafa

> > +			smmu->cmdq_active = !!(cr0 & CR0_CMDQEN);
> > +		}
> 
> -- 
> Sashiko AI review · https://sashiko.dev/#/patchset/20261015200903.2735565-1-smostafa@google.com?part=23
