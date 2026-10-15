Received: from mail-wm1-f43.google.com (mail-wm1-f43.google.com [209.85.128.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6DBF5599A47
	for <sashiko-reviews@lists.linux.dev>; Thu, 15 Oct 2026 21:01:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.43
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1792098116; cv=none; b=SFXPzU+zqihpXoAP7BlfHM+Bq8XiZGnVuUz9vkXA1Pp+xiZhMGm43d4EXXxqoqoAjfnPuXF/GwSkXLT3+lRPZrsvRpF2pDd+Jhi8vQSXXtdGNc+a1JhX4Jn1YtHcp67GsiHhcNCKmTcbDu/7zw8TETTT+5ssk6QB+VuFmvjkVbU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1792098116; c=relaxed/simple;
	bh=zXc6Ys/gWWkzmEliuQdASNz6ds2YWjzdc3KtsxCtxrw=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=loxi6vEvpgzdYJlgmIjr12wsVnzIgU720IAr4OyCmW0nzY8m4G8B4MhEeuyqsO9pMrgNv3oGi0FgaHbBXDpOTiUsR5bw9RFnTYErn0+o5P+xnmA7PYl1qMFYgP3jku4OLetf+BpyIbEQ8DkMhx6MK16Jrg0rcZ28FifMh0RR5bA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=ELxK4pas; arc=none smtp.client-ip=209.85.128.43
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="ELxK4pas"
Received: by mail-wm1-f43.google.com with SMTP id 5b1f17b1804b1-4a018493d57so20335e9.0
        for <sashiko-reviews@lists.linux.dev>; Thu, 15 Oct 2026 14:01:51 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20251104; t=1792098109; x=1792702909; darn=lists.linux.dev;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :content-type:mime-version:references:message-id:subject:cc:to:from
         :date:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=XwTlxJIqTOSxTH9UHFtQ7dio6tQl6wFCUesbKwWeJcI=;
        b=ELxK4pashQs6Eq/yOflKGitDmK/v5suj7+XLsQNP8x9wF9OcBColvQpH5nS7um59yP
         npmmWpU60ZzVrLMXhoZUt2ldfMG/AkhoV3/zLqAcCUaFNWhesPlgr9WUpWm7xiXDOwMd
         L4kCoazZxP5/JK9xoeRwDB+JtW8F1C6bG+2lTg3uW8bNB9U7v058ru8KhLjZZajLpLW2
         D1FznsJnMbDNnag6bC134ZQ4TbRpju8oaMBgSUb7g5O2ClX4JBo2SfrVV7pgdoVXaDBn
         MPUHr3H5X3/j+BUyZRZzS76denN0eX06oV2TZJfgsZTR3gEGnrQPje7MmvgqaTzmZM4I
         ijBw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792098109; x=1792702909;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :content-type:mime-version:references:message-id:subject:cc:to:from
         :date:x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=XwTlxJIqTOSxTH9UHFtQ7dio6tQl6wFCUesbKwWeJcI=;
        b=ZVTLriUbQqeYdFrMLIRmckot37q12I+Ysib6szmtp9zbkBgJU2vbQSErCH3wiJxAH5
         bChYMCtqk1/KeMhrPwxzFS4JrUBQnGRa0Vt/UVOz2vI2Af1dM62SsJoFd8jLFuP6vXA4
         Faa52FQamgALPnNbyuln8pgd83l2FaA5atfpaCW+oRQRQeRBvpj/0ug1Iyk3l/Zf6yAb
         sPsmREPceMw0whNtWvvXXbGTBu1v7THsVmJU6LWXF8Dg0dr65HlvD+gQN2aS97gTFan7
         sFUV7VVP0FQK9LBcfSe44/YQr2ktOfQaoPacFMKRlgKlawhR+TYDUyFHpLIoKJR0W1Pc
         MTEQ==
X-Gm-Message-State: AFq9FYLHJouhMHCHOyM4/6mTyXWhWOMFh+3Z/2em+5jwP1+BEUsLX3H5
	QogMzMNuyjR3zEenFHhYf0x2X6wU5vFm2qQIZy2vO+JxE54leFRxG2SBuKgWXuuvf/dtBDF5gZ1
	eztxL9Q==
X-Gm-Gg: AYBFou1cVZWENRlZ50J9CGNjobnFZoZQy0YMlaco1gx179ynfthpf6nX97qGwGyDFKh
	6etEfavfyGsHg45eEShgRGRQH1VBX0c2ZgePk7FX27l2GXUmPNazHDrncHdu5UbP0iXXO4kGNKr
	VuEbWidCo2hDYo+DdDIIlsaUTHeP9bW0MmyWHGxH+I9agk1K8LrGqr+CgeSx2anHyA9tnXo1RZj
	5+pFY2K4NaAIyi78vt+VPNOP6fSV9hcUN/2XHUeZpvshNtcDIpHyQHBbMJ7xk8HJtmIvSYWXFFQ
	bZfTiw72Dey1C5nXoBgAuYaaZThoTfqwDSinlxhAVhMObIpReU/1crtyMxPn3+gpG97YpAMTqaJ
	YK4IQKDUYZSlN+xlmQrc/s/26D1m0cCaLFeTLARQDBD/6WEcZ0gX6zn2Jbd3qyIbQ6xwLGup7Fo
	i4vm5+bjxJTI1mJjjX7TvOEZMQbpGODT7An5tqDK1EzrTrZP588bXVi/667vvmmAS/0MQKVZg1k
	1g+chSQZWkXwDsPckL+VZEeq7QSeINlwkeD5hN6
X-Received: by 2002:a05:600c:4307:b0:4a1:6f41:90f9 with SMTP id 5b1f17b1804b1-4a1c8adfdf2mr75015e9.14.1792098109159;
        Thu, 15 Oct 2026 14:01:49 -0700 (PDT)
Received: from google.com (250.192.189.35.bc.googleusercontent.com. [35.189.192.250])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-48dfd471a1fsm425481f8f.3.2026.10.15.14.01.46
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 15 Oct 2026 14:01:48 -0700 (PDT)
Date: Thu, 15 Oct 2026 21:01:43 +0000
From: Mostafa Saleh <smostafa@google.com>
To: sashiko-reviews@lists.linux.dev
Cc: kvmarm@lists.linux.dev, Oliver Upton <oupton@kernel.org>,
	Marc Zyngier <maz@kernel.org>
Subject: Re: [PATCH v9 14/25] iommu/arm-smmu-v3-kvm: Shadow the command queue
Message-ID: <atE_N51rZ7kcxBWv@google.com>
References: <20261015200903.2735565-1-smostafa@google.com>
 <20261015200903.2735565-15-smostafa@google.com>
 <sashiko-outbox-173389@kernel.org>
Precedence: bulk
X-Mailing-List: sashiko-reviews@lists.linux.dev
List-Id: <sashiko-reviews.lists.linux.dev>
List-Subscribe: <mailto:sashiko-reviews+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:sashiko-reviews+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <sashiko-outbox-173389@kernel.org>

On Thu, Oct 15, 2026 at 08:28:01PM +0000, sashiko-bot@kernel.org wrote:
> Thank you for your contribution! Sashiko AI review found 2 potential issue(s) to consider:
> - [Medium] iommu/arm-smmu-v3-kvm: wrong WARN_ON() causes hyp panic on invalid host MMIO
> - [Medium] iommu/arm-smmu-v3-kvm: WARN_ON used to validate host input in SMMU emulation
> --
> 
> commit bf6dcb76ab39be1d82600f47f81d772f4c08b9a6
> Author: Mostafa Saleh <smostafa@google.com>
> 
> iommu/arm-smmu-v3-kvm: Shadow the command queue
> 
> This patch allocates a shadow command queue per SMMU to be used by the
> hypervisor at boot. The host command queue is pinned in a shared state
> when enabled to avoid donation issues and prevent untrusted host access
> from reaching the hypervisor state.
> 
> > diff --git a/drivers/iommu/arm/arm-smmu-v3/pkvm/arm-smmu-v3-hyp.c b/drivers/iommu/arm/arm-smmu-v3/pkvm/arm-smmu-v3-hyp.c
> > --- a/drivers/iommu/arm/arm-smmu-v3/pkvm/arm-smmu-v3-hyp.c
> > +++ b/drivers/iommu/arm/arm-smmu-v3/pkvm/arm-smmu-v3-hyp.c
> 
> [ ... ]
> 
> > @@ -132,6 +225,23 @@ static int smmu_init(void)
> >  	return ret;
> >  }
> >  
> > +static void smmu_emulate_cmdq_enable(struct hyp_arm_smmu_v3_device *smmu)
> > +{
> > +	u32 shift = smmu->cmdq_host.q_base & Q_BASE_LOG2SIZE;
> > +
> > +	smmu->cmdq_host.llq.max_n_shift = min(shift, smmu->cmdq_max_shift);
> > +	smmu->cmdq_host.base_dma = smmu->cmdq_host.q_base & Q_BASE_ADDR_MASK;
> > +	smmu->cmdq_host.base_dma &= ~(cmdq_size(&smmu->cmdq_host) - 1);
> > +	WARN_ON(smmu_share_pages(smmu->cmdq_host.base_dma,
> > +				 cmdq_size(&smmu->cmdq_host)));
> 
> [Severity: Medium]
> Will this cause a fatal hypervisor panic if the host provides an invalid
> physical address or an unshareable memory range?
> 
> At EL2, the WARN_ON() macro behaves as a fatal exception. If the host
> configures the emulated SMMU with an invalid address, smmu_share_pages()
> can fail and return an error. Wrapping this fallible, host-influenced
> operation in WARN_ON() will crash the hypervisor. Could this path safely
> ignore the invalid configuration or return an error instead?
> 

By design as replied in v8:
https://lore.kernel.org/all/20260922133309.CD1F51F000FF@smtp.kernel.org/

> > +}
> > +
> > +static void smmu_emulate_cmdq_disable(struct hyp_arm_smmu_v3_device *smmu)
> > +{
> > +	WARN_ON(smmu_unshare_pages(smmu->cmdq_host.base_dma,
> > +				   cmdq_size(&smmu->cmdq_host)));
> 
> [Severity: Medium]
> Does this also have the same issue with WARN_ON() panicking the hypervisor
> if the host-provided memory range fails to unshare?

By design as above.

> 
> > +}
> > +
> 
> [ ... ]
> 
> > @@ -158,6 +268,14 @@ static bool smmu_dabt_device(struct hyp_arm_smmu_v3_device *smmu,
> >  		break;
> >  	/* Passthrough the register access for bisectability, handled later */
> >  	case ARM_SMMU_CMDQ_BASE:
> > +		if (is_write) {
> > +			/* Not allowed by the architecture */
> > +			if (is_cmdq_enabled(smmu))
> > +				break;
> 
> [Severity: Medium]
> If the host kernel makes an invalid MMIO write to ARM_SMMU_CMDQ_BASE while
> the CMDQ is enabled, the switch statement breaks and leaves the mask set
> to 0.
> 
> Later in smmu_dabt_device(), there is a pre-existing check:
> 
> 	if (WARN_ON(!mask))
> 		goto out_ret;
> 
> Since WARN_ON() is fatal at EL2, will this turn an invalid host MMIO access
> into a hypervisor panic? It seems like the access should be gracefully
> ignored or rejected without triggering a fatal assertion.

Yes, by design, if the host makes violates the architecture we just
panic.

Thanks,
Mostafa

> 
> > +			smmu->cmdq_host.q_base = val;
> > +		}
> > +		mask = read_write;
> > +		break;
> 
> -- 
> Sashiko AI review · https://sashiko.dev/#/patchset/20261015200903.2735565-1-smostafa@google.com?part=14
