Received: from mail-wm1-f42.google.com (mail-wm1-f42.google.com [209.85.128.42])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 742DA4349B6
	for <sashiko-reviews@lists.linux.dev>; Thu, 15 Oct 2026 21:00:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.42
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1792098010; cv=none; b=taZMq8uKThw3ssFsA4sg7xASjTxBzzkJnfKC02pLBS7jJvbyouf6oZJqI80trW3MBCMduvScxGWEVIAEIDnNrddtBUptC2frUSuO2Xk2MGeqsnU/Us3Rq9fBl2pPnSrJal2bg+JhM8+MptEfsO857nzlKHPwF5q4iEQDwGSlXI8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1792098010; c=relaxed/simple;
	bh=Xa7nD3n6mjT7i/Y5Cbo7vd4OEnKnMlJ9CUNAfbld3rM=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=EHS78PLDE9gY+XAOLfEWRkmyRUwJ0jGLlUcREE7cziU043p3KIVwGtnaXDgM1hAnLOQBIFcPTRLNWGEOcI0ymKMeCl3s7/xfhQtTRxhQuZPC3Rk/gszTLFS9AfUsd7hdTEUbnEfKr01fT3LS9oAQhsSgfWU+3KaeyEUZhAvFb6w=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=EiBzXokW; arc=none smtp.client-ip=209.85.128.42
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="EiBzXokW"
Received: by mail-wm1-f42.google.com with SMTP id 5b1f17b1804b1-4a021c28046so4325e9.1
        for <sashiko-reviews@lists.linux.dev>; Thu, 15 Oct 2026 14:00:08 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20251104; t=1792098007; x=1792702807; darn=lists.linux.dev;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :content-type:mime-version:references:message-id:subject:cc:to:from
         :date:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=Lfjo2UUCfy9LtemPhtrDOegai3WrH7Ts3lTNM18z7J8=;
        b=EiBzXokWYpamkIp7yWmgPPPOhgP6cnneA2n25bV6N0abqRQZhqU7GrNX164klV5B3l
         uqdHa+P5VJ2ChsrIganWK4V26vqdi4nvyDuLxZNp7/P46G/Fss+Da5J04RGn1tnSe1a7
         L2axYAO5HoGyufs2G70tlm+EWYztgsCSd3Bh365N4FlnSYAamWgdj3IiOcfkuLm0MOmm
         e+CTWILZb8HtdSNFRMBYT8jmO1Er5ShHi2eWqoqVTJomZRYEpg2S/Iad+NLINLY8UdSq
         OGvp1sZ/bLF/MnWub1enPshW1SnaB5LFctfO9BO+/G0AlOY230Ddao6uQ5s3gZr294ks
         BHdA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792098007; x=1792702807;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :content-type:mime-version:references:message-id:subject:cc:to:from
         :date:x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=Lfjo2UUCfy9LtemPhtrDOegai3WrH7Ts3lTNM18z7J8=;
        b=CA5FzmfjzqS/R/wP0Ob6/PJDzVjIKGCnIa3e3xa4W9x8xqXi9Hl8WFG4Rqf+MOYYIS
         VqM0qKgsxJrmhd90m4TnTQ1ZiUNXDMHW9mdTnDncGXjG//s6p2TMLE9GL9Z1DZupcPG5
         Qn4o3/e7+P1LS1eWLPnof22zkNx2lOm8LRSEKXuZDdKWBdD1ciIXCelHd/eP2rIYCIjz
         +GnukM2eKqpkEYEwbvqvHE1+XwJ+gaACnUcdHNvNNIUmoHuyJ8m/DfVVcb1LbV4Lj4gB
         h5400neDC8AJp9BO/cHwb5szosdSh4QvbB1i8utsxmqdoyefXzAwM50Y3076llQChfxW
         MuqQ==
X-Gm-Message-State: AFq9FYIy3JXSdsjo4Nwzk3O3/4gP5kWdQ8ItS9MD1LSZFVwX+4HOLwqm
	QUoQAkTC70EsFyk3okBDpWBk1ZtKPmwjbppsj4R4JPwnYTBZhYFVOCkHGSNG+4jbfcNQbSDrFyQ
	IBhYi1A==
X-Gm-Gg: AYBFou2aaUU7+DaSkj21LzcoXLwkqjGJPApeiPBtxlJ3byBjBERzWWb7cJX4Sgh0VGx
	mLoZmq+brTkO5NvtSIrG3KfEHCjBiclmGW89huAvHoE8ekCpwlrqe9tc+fuRDQYFSHnqPeAJoST
	DOe9GNtgAiIOXOmtnjtrwH9NNAb7tzLcFyCYbW0RDU8aPLw40YQeZiswq70OdfuYdwdzwswhIxY
	EINGr/6qrJ7ChokUL5gg0IKzJrD/5NZHk5J26b9NMxsbCHavPFjp2iXrUpJJZX8W/gbdxsZippe
	NDejqlNK26TII9QXxFNFOfhvOXqyGKivbFD+ITYzCiI9xSYA0nyGt5hvKyP3WzLtNayoA/bDlE4
	bEbrVYdLBtJjqfg0DiLe94keHTzjIQJI01JRBqaa5oojZMfGtOMRLq0R379P0LarsI4N6nzz4AK
	wUv4DpFHG8YEJgZhx1I2Jx7z1hkeb7kjo76HWe0k21K563GKVhaTpciGRreKat86leuE3jzezND
	1NDjdFZywr40E8LqlJUQqNoBwR+oozEf9UHSbz0
X-Received: by 2002:a05:600d:8646:20b0:4a1:96a5:3672 with SMTP id 5b1f17b1804b1-4a1c8abd6b0mr72025e9.7.1792098006120;
        Thu, 15 Oct 2026 14:00:06 -0700 (PDT)
Received: from google.com (250.192.189.35.bc.googleusercontent.com. [35.189.192.250])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4a1bd68585csm61787935e9.4.2026.10.15.14.00.05
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 15 Oct 2026 14:00:05 -0700 (PDT)
Date: Thu, 15 Oct 2026 21:00:01 +0000
From: Mostafa Saleh <smostafa@google.com>
To: sashiko-reviews@lists.linux.dev
Cc: kvmarm@lists.linux.dev, Oliver Upton <oupton@kernel.org>,
	Marc Zyngier <maz@kernel.org>
Subject: Re: [PATCH v9 13/25] iommu/arm-smmu-v3-kvm: Add MMIO emulation
Message-ID: <atE-0eX2chHOLWJJ@google.com>
References: <20261015200903.2735565-1-smostafa@google.com>
 <20261015200903.2735565-14-smostafa@google.com>
 <sashiko-outbox-173397@kernel.org>
Precedence: bulk
X-Mailing-List: sashiko-reviews@lists.linux.dev
List-Id: <sashiko-reviews.lists.linux.dev>
List-Subscribe: <mailto:sashiko-reviews+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:sashiko-reviews+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <sashiko-outbox-173397@kernel.org>

On Thu, Oct 15, 2026 at 08:30:38PM +0000, sashiko-bot@kernel.org wrote:
> Thank you for your contribution! Sashiko AI review found 1 potential issue(s) to consider:
> - [High] iommu: mmio emulation bitwise logic corrupted on big-endian hosts
> --
> 
> commit 5a437530a55c608782e029a478141ad9b342c024
> Author: Mostafa Saleh <smostafa@google.com>
> 
> iommu/arm-smmu-v3-kvm: Add MMIO emulation
> 
> This commit adds a data abort handler for the SMMUs to handle MMIO emulation.
> Currently, most registers act as a passthrough, and upcoming patches will
> add CMDQ/STE emulation with logic for specific register access.
> 
> > diff --git a/drivers/iommu/arm/arm-smmu-v3/pkvm/arm-smmu-v3-hyp.c b/drivers/iommu/arm/arm-smmu-v3/pkvm/arm-smmu-v3-hyp.c
> > --- a/drivers/iommu/arm/arm-smmu-v3/pkvm/arm-smmu-v3-hyp.c
> > +++ b/drivers/iommu/arm/arm-smmu-v3/pkvm/arm-smmu-v3-hyp.c
> [ ... ]
> > @@ -128,6 +132,170 @@ static int smmu_init(void)
> > +static bool smmu_dabt_device(struct hyp_arm_smmu_v3_device *smmu,
> > +			     struct user_pt_regs *regs,
> > +			     u64 esr, u32 off)
> > +{
> [ ... ]
> > +	bool is_xzr = (rd == 31);
> > +	u64 val = is_xzr ? 0 : regs->regs[rd];
> 
> [Severity: High]
> Does extracting the register value directly from the CPU context here bypass
> endianness conversion on big-endian hosts?

mmm, I haven't considered that before.
However, BE support was removed on arm64 [1]
https://lore.kernel.org/all/20260918145217.1669-1-will@kernel.org/

So, I'd say keep it as is.

> 
> When the host (EL1) uses writel_relaxed() on a big-endian machine, it
> byte-swaps the native value to little-endian representation before issuing
> the store. The MMIO trap then retrieves this raw, byte-swapped value
> directly into val.
> 
> > +
> > +	switch (off) {
> > +	case ARM_SMMU_IDR0:
> [ ... ]
> > +	case ARM_SMMU_CR0:
> > +		if (len != sizeof(u32))
> > +			break;
> > +
> > +		if (is_write) {
> > +			/* Enforce ATS checks. */
> > +			if (smmu->features & ARM_SMMU_FEAT_ATS)
> > +				val |= CR0_ATSCHK;
> 
> [Severity: High]
> Can this bitwise operation corrupt the configuration on big-endian hosts?
> 
> Because val contains a byte-swapped value, applying a native bitmask like
> CR0_ATSCHK modifies bits at the wrong offset.
> 

Same as above.

> > +			mask = read_write;
> > +		} else {
> > +			mask = read_write & ~CR0_ATSCHK;
> > +		}
> > +		break;
> [ ... ]
> > +	if (is_write) {
> > +		if (len == sizeof(u64))
> > +			writeq_relaxed(val & mask, smmu->base + off);
> > +		else
> > +			writel_relaxed(val & mask, smmu->base + off);
> 
> [Severity: High]
> Will this double-swap the corrupted value?
> 
> Since val was already byte-swapped by the host's write, writing it back
> using EL2's writel_relaxed() applies a second byte-swap, propagating the
> incorrect state to the SMMU hardware.
> 
> Read paths face a similar issue where the readl_relaxed() output is passed
> directly to the guest without being swapped back into the format expected by
> the guest's own le32_to_cpu() calls.
> 

Same as above.

Thanks,
Mostafa

> > +
> > +		hyp_spin_unlock(&smmu->hw_lock);
> > +		return true;
> > +	}
> 
> -- 
> Sashiko AI review · https://sashiko.dev/#/patchset/20261015200903.2735565-1-smostafa@google.com?part=13
