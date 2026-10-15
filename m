Received: from mail-wm1-f51.google.com (mail-wm1-f51.google.com [209.85.128.51])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 262423F54A7
	for <sashiko-reviews@lists.linux.dev>; Thu, 15 Oct 2026 21:11:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.51
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1792098687; cv=none; b=Ek1C3ABLlCJjh4W2wWq1DhHsA35axT+cYmpGm4CEsHo8O9eKTH1N9MgvX9Dxl4cmTie8G28zEdAdw69krgtmfJlITUbDnqDDJ2PdyQ2IJ/hpSJFizcka2mJurxgeSwsSxUHoFNoMOgzdRwBeBsuLy6FhAJ7o3JezCDhoXjmOmeE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1792098687; c=relaxed/simple;
	bh=JjP/EokpswoFwaDs1/CL0b5eTA9ELthAAPeLzPL29K4=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=GPQ9p0+Vb9SPavEZ0LbqY77GhaBQrdpNxsELlyTze3Xx4OajvV38oCUqQoi5+J7RqNUfL89GvamJNKxSAtakAj2bRCtAgahK1WLK8HyisiUh4/+DZSCPqS+G5rVb6LkXNFs1PecjcjlOYGXuFpG92SKuz1yJZCOdHTNZFl1Brsk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=M/ouPCf0; arc=none smtp.client-ip=209.85.128.51
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="M/ouPCf0"
Received: by mail-wm1-f51.google.com with SMTP id 5b1f17b1804b1-4a018493d57so21045e9.0
        for <sashiko-reviews@lists.linux.dev>; Thu, 15 Oct 2026 14:11:18 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20251104; t=1792098677; x=1792703477; darn=lists.linux.dev;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :content-type:mime-version:references:message-id:subject:cc:to:from
         :date:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=SgzekR1/yEOPUyZ+mesYeN33QvO4P+oxwoRz+ghpTK8=;
        b=M/ouPCf0tqjUXNrkqHllatC3p1B3FLfULVccToYI+GzeoGz8xDc7PdTXP3K22P3QBn
         4QiCeFtfVhooFplaLGLFaqKQH7OcSmf0PoLS6m4dHdtx6a6nKtBgwkX5e6Cpb3aQOclv
         wIEcm1DPuAKDow9sZZInkXooySfGCWkuMl4DPlBwxIe7jpGtjJkdn7Zy0rVmm2Yxq7/h
         d9BY4QPfOH2ZeE8nl6Y+GeQ/q5MZR7ELBFOVZqgqmvgOVS8nak/Kl/I5Ac3dQEELd/wU
         d7U2Sq+E3O1CDGgfocwditL/h2QjXnuIpswbtbIV/iweD1alYNwLwWqWS803htq/VvwY
         GYlQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792098677; x=1792703477;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :content-type:mime-version:references:message-id:subject:cc:to:from
         :date:x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=SgzekR1/yEOPUyZ+mesYeN33QvO4P+oxwoRz+ghpTK8=;
        b=uwdvPecRv3hrhz7JXCYxytjoVlMmpxOB1wNetTxLG9G7KZEJNQNFAqsX8L5sBWq0H3
         qN72l4YhbI6tArCIYwuUAHDs9l4p+oFvy87myYq6DvaqHUhUT+v1qjGjKUzCCRGEle61
         JnfpSCGkG2Ptm2QLyy4R0nKwFehuAcaBPlOpipU0Il4oPOXLUZOy/6hQIQDKmzvomxka
         cXxk6BmYCkvEC/5qeBltshORcjuQZcUnFGhwKPztQx7tAsGl/TGR/3xugjzqQcClT4EW
         rw3Jx2jR0ndqP7CaOP6x1fmsjMmK+q+Qgaun0LrW2KXRNhC7uO8qKs8PlAbyVgoLJD33
         6VGQ==
X-Gm-Message-State: AFq9FYKy0LBT2zsqv2e+dhse0n5cP+y8ZwAh97BC0K3d0xr7DOEEebk8
	xkoVd4Q9e8eKkR4G8MAqdl2R9MTTdA/wkmGFSbTRn32qWb+I2/Qb5Ag4m/WkOBZusZj5yLqESiM
	PlkB70A==
X-Gm-Gg: AYBFou041NBTwtLRMOhZt0qKyyXv7f++UFCma2SDWGr6RmAk3eErwa0Nwby8K+E8a2C
	7ZhcBzvr9BFTOfyr0g5FKcB10IwkR3BBuPoGlieRzGWoD3/eYM+exfFmK3yBAYVjfqmQVYd3pA9
	m1Qr3MJYeaY9IG2t01PEA0pouPKP0BXTccd7BTu3q8lsPh0zlvjGLouDsIUs4LYLMLcJ9Egqlm0
	W9IhgRA6yUbi2X/iuFk37y/CyFpaDdarD0hXDEXw4/gSJTJ8d0FnZtUl4fjp3VVEN/TXbOu/kwH
	w2ZcNs12G5X9ntbywiHmxUGrt06nSQq9HNAhIrDMfo1+H/J3kolLYIYMO+Di2rDkQ7NKKk0QVdO
	pMp87nPB5Zve9bJ3KV3lztLCqQgTaEdT2DKB+RnofClswIhxAXj1PAKNBL2nORYwgTYDzksX4+A
	R4PNNZsaeGw2IARzLy4A/W8iCtCTFvHBJgCAI7KGU+2xJMNsekOxrQmbjgTDeaAy/2YJyuaabSr
	BMgwDMALbvr4bEQu92NymzQpZp6cZk1/IPDx7ZD25Vggfdbbw7L
X-Received: by 2002:a05:600c:244:b0:4a1:6d8d:208c with SMTP id 5b1f17b1804b1-4a1c8522843mr192755e9.6.1792098676669;
        Thu, 15 Oct 2026 14:11:16 -0700 (PDT)
Received: from google.com (250.192.189.35.bc.googleusercontent.com. [35.189.192.250])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-48dfd503d78sm455680f8f.50.2026.10.15.14.11.15
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 15 Oct 2026 14:11:16 -0700 (PDT)
Date: Thu, 15 Oct 2026 21:11:12 +0000
From: Mostafa Saleh <smostafa@google.com>
To: sashiko-reviews@lists.linux.dev
Cc: kvmarm@lists.linux.dev, Oliver Upton <oupton@kernel.org>,
	Marc Zyngier <maz@kernel.org>
Subject: Re: [PATCH v9 15/25] iommu/arm-smmu-v3-kvm: Add CMDQ functions
Message-ID: <atFBcILmWPOZYbdk@google.com>
References: <20261015200903.2735565-1-smostafa@google.com>
 <20261015200903.2735565-16-smostafa@google.com>
 <sashiko-outbox-173394@kernel.org>
Precedence: bulk
X-Mailing-List: sashiko-reviews@lists.linux.dev
List-Id: <sashiko-reviews.lists.linux.dev>
List-Subscribe: <mailto:sashiko-reviews+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:sashiko-reviews+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <sashiko-outbox-173394@kernel.org>

On Thu, Oct 15, 2026 at 08:30:05PM +0000, sashiko-bot@kernel.org wrote:
> Thank you for your contribution! Sashiko AI review found 1 potential issue(s) to consider:
> - [High] iommu/arm-smmu-v3-kvm: swapped WFE logic causes queue polling delays
> --
> 
> commit 533e5a914cd22f171b26c2c5c0e2acfb11756ea5
> Author: Mostafa Saleh <smostafa@google.com>
> 
> iommu/arm-smmu-v3-kvm: Add CMDQ functions
> 
> This commit adds command queue accessors for the ARM SMMUv3 in the
> hypervisor. It includes command queuing and synchronization functions,
> with a 1 ms polling timeout that sleeps in WFE when SEV is supported.
> 
> > diff --git a/drivers/iommu/arm/arm-smmu-v3/pkvm/arm-smmu-v3-hyp.c b/drivers/iommu/arm/arm-smmu-v3/pkvm/arm-smmu-v3-hyp.c
> > index 02e7c61758329..c9fc21e405e79 100644
> > --- a/drivers/iommu/arm/arm-smmu-v3/pkvm/arm-smmu-v3-hyp.c
> > +++ b/drivers/iommu/arm/arm-smmu-v3/pkvm/arm-smmu-v3-hyp.c
> [ ... ]
> > @@ -77,6 +113,85 @@ static int smmu_unshare_pages(phys_addr_t addr, size_t size)
> [ ... ]
> > +static int smmu_add_cmd(struct hyp_arm_smmu_v3_device *smmu,
> > +			struct arm_smmu_cmd *cmd)
> > +{
> > +	int ret;
> > +
> > +	hyp_assert_lock_held(&smmu->hw_lock);
> > +	ret = smmu_wait(smmu->features & ARM_SMMU_FEAT_SEV,
> > +			!smmu_cmdq_full(&smmu->cmdq));
> 
> [Severity: High]
> Does this cause the CPU to stall until a timer event?
> 
> When the hypervisor inserts a batch of commands that exceeds the command
> queue size, smmu_add_cmd() waits for queue space and passes
> smmu->features & ARM_SMMU_FEAT_SEV as the __use_wfe argument to
> smmu_wait(), executing wfe().
> 
> However, the SMMU only generates an SEV on a CMD_SYNC with CS_SEV. Since
> hw_lock prevents concurrent insertions and the hypervisor only inserts
> CMD_SYNC at the end of the batch, no SEVs are generated while the queue
> drains. The CPU sleeps in wfe() and relies solely on the timer event
> stream to wake up, introducing massive artificial delays. Stalling EL2
> with interrupts masked for milliseconds degrades system stability and
> risks triggering timeouts.
> 

Not true, the SMMU generates an event when queue become non-full check:
arm_smmu_cmdq_poll_until_not_full()

Also in the spec: 4.1.2
    When SMMU_IDR0.SEV == 1, the SMMU triggers a WFE wake-up event
    when a Command queue becomes non-full and an agent external to the SMMU
    could have observed that the queue was previously full.

> > +	if (ret)
> > +		return ret;
> > +
> > +	smmu_add_cmd_raw(smmu, cmd->data);
> > +	writel(smmu->cmdq.llq.prod, smmu->cmdq.prod_reg);
> > +	return 0;
> > +}
> > +
> > +static int smmu_sync_cmd(struct hyp_arm_smmu_v3_device *smmu)
> > +{
> > +	int ret;
> > +	struct arm_smmu_cmd cmd;
> > +
> > +	hyp_assert_lock_held(&smmu->hw_lock);
> > +	cmd = arm_smmu_make_cmd_sync(CMDQ_SYNC_0_CS_SEV, 0);
> > +	ret = smmu_add_cmd(smmu, &cmd);
> > +	if (ret)
> > +		return ret;
> > +
> > +	return smmu_wait(false, smmu_cmdq_empty(&smmu->cmdq));
> 
> [Severity: High]
> Is the WFE logic swapped between smmu_add_cmd() and smmu_sync_cmd()?
> 
> Here, smmu_sync_cmd() inserts a CMD_SYNC with CS_SEV, which will
> explicitly generate an SEV upon completion. Yet it passes false for
> __use_wfe to smmu_wait(), forcing a busy-wait (cpu_relax()) and ignoring
> the precise hardware SEV wakeup it requested.

I guess the sync command can leverage the WFE also, as I was focused
on the empty condition when I wrote it, but that is just an
optimization.

Thanks,
Mostafa

> 
> > +}
> 
> -- 
> Sashiko AI review · https://sashiko.dev/#/patchset/20261015200903.2735565-1-smostafa@google.com?part=15
