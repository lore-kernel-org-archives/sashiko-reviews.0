Received: from mail-pl1-f169.google.com (mail-pl1-f169.google.com [209.85.214.169])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8417E1C5F13
	for <sashiko-reviews@lists.linux.dev>; Mon,  1 Jun 2026 16:01:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.169
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1780329682; cv=none; b=eJcJob8NhQO5XuPb7vqqcK/h8JdQ918icWsT+VoClBDUhmZIVI4cB5HsTCaMbH2VXrTLik7T4+NI3FNpv7FdP4u6YnC+wvh9aCQ5ZzklVioRnz2S9+sCB0/liLkY5leDDSYRCbNdy8AuYGjriQ23W6yj5hK1TDL0r+29zPMC+4s=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1780329682; c=relaxed/simple;
	bh=tqyb8j/dV7maTDE6A53XUG/pllUilNmVuiuRAuhvyMM=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=cNjGCBZxj1v0IHN92ljKMnztlt0PqcnBD3Fc3HZGIHNH0De22ctm6pkSO4GWpZSHsHZuHOxnEXPgii0X1zdT0deSyz6AW4QfSXRnIxoB5fN31STawoNLWkcS6bQGCSJe9wisRuFY2LrT589l0/25+MsJU7FE4EIMkYnRKpAcCnE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=jHEdnOdz; arc=none smtp.client-ip=209.85.214.169
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="jHEdnOdz"
Received: by mail-pl1-f169.google.com with SMTP id d9443c01a7336-2bf2d865383so1645ad.1
        for <sashiko-reviews@lists.linux.dev>; Mon, 01 Jun 2026 09:01:21 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20251104; t=1780329681; x=1780934481; darn=lists.linux.dev;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=JqeyGtP1BtIlNo5CtVdhbiR2kLYidnVAzCET6d04Mv0=;
        b=jHEdnOdzR1rWGymEXTTF8PZC5Z59qwSWt29O3azN5aQ47uYO9rDi4+jSLt6Srg9mEW
         owGv6vVgk3/+Tfh/Cb4KPfwKlP5qtscbpNrPkBMQtjuJSnTo/M9O8Gq5ahwZ8z4Hh3xy
         y3M7/RNfFe99dfR7DBjnI8JWO/ywJLH6ytPpBG0PMwpwIDCV/PHMfdcxBmDHRdCZbYJG
         tEMiqdDpUso3rQgeJCfrY8gWrgLa2XhDOU83hgVM2HwtFah7g+V5r++w/805jEGNMRw6
         2lRNfJTk+b6x0DpyOc4gzQ6Z9fUGv8+9+95URh5D+XQD8mn9VxYRwchWdnaSeDGXDT/c
         VTsA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1780329681; x=1780934481;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=JqeyGtP1BtIlNo5CtVdhbiR2kLYidnVAzCET6d04Mv0=;
        b=HsrZcRSpWYA6Bzf/vXJq1rUHC5P0+1qkck0s+cIHwDv4b4ZNqDdN187g/69AxrTgpK
         CY30sP/BQQylkW3E6mjEVkHU2ssblDvFore0FXFlOE8+Ip8RUglAEjChimPJVeOGlgks
         2B0oWD/DxnTKcfRtyqG56iY/nrM8NuAiL7dKs/Yq5eXRv5yRCBXokcflKhflqXFEREm9
         6XHNpEz6w1EwLftxwtOInq3N9fV2CxCpW9q6BIxeUy2KnZVa56onw7yfnrXX9caiCxpK
         KJqbHVk7j3Oq8xLbjkm9kd/8G6UIDVeXFOZyXUWLVyehJavF+EqBiG2M1Gp1vsZb3waw
         g5dA==
X-Gm-Message-State: AOJu0Yzow+oAFJpL5kKtsQuZvuGPgpvSXhXNDzV6gERHjY9Vm0rTRcIz
	oa1r3wzsc+ZjcRPNLn3dIy4SIkFUQO2uDg9HofRLiG8fGhOfGNl2KBvKyh+0+bsT/fu9c2pc+W+
	aj1RhAw==
X-Gm-Gg: Acq92OFXBWmlsXN2iZBcY0ChpHuqjlxpodnYey/UkfiixVYrkNlUF2vPjOgPESC1i5n
	SI4HRnueKn/+h2kurpWFlmCx8aR9B9Iz2KWlOpMaDHjtdLO5MaHfCZbpkg4tsOwKIwJnBuQFHs4
	OGABj8pyS2HiDzgm0oWje+UHtPE1jg9jl6F99Dgptq/jdS6ve3mmv7l271lzK+9YqnvClZhDghE
	/mReH2vypNrwe9BwVgEIXGNXevqGljO/bgNlLkgVc6gkeUfBnV8Fg+pWTor0k10T6UfCg4CVMj3
	kNuyDdBEhdHCOcdO7EBpfz7kfGVGVoFiKml7v7QB9MGDaNIVP4TnA+1/CBJFORw3mwslnQfY0PS
	1ozyoTqUrQsIDKBFWYxtOsWdfQ0ksemNyXlQ5wGMNXndVInazUNIgnOwWp6MRwClk4P0HYsQIbT
	N4CJWGiYZwbiJJR4wRar3gIjYGEejH1DMs3/B5LGhnuY474O+jzYEYkdQLEoO2V7oPgiotoU4=
X-Received: by 2002:a17:902:ccc8:b0:2c0:b1b0:376e with SMTP id d9443c01a7336-2c0b1b0389emr3865105ad.8.1780329679954;
        Mon, 01 Jun 2026 09:01:19 -0700 (PDT)
Received: from google.com (199.255.142.34.bc.googleusercontent.com. [34.142.255.199])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-84214c9252bsm10773325b3a.39.2026.06.01.09.01.18
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 01 Jun 2026 09:01:19 -0700 (PDT)
Date: Mon, 1 Jun 2026 16:01:13 +0000
From: Pranjal Shrivastava <praan@google.com>
To: sashiko-reviews@lists.linux.dev
Cc: linux-pci@vger.kernel.org
Subject: Re: [PATCH v7 5/5] iommu/vt-d: Fail probe on ATS configuration
 failure
Message-ID: <ah2syZ_FmVusREQx@google.com>
References: <20260601143644.2358771-6-praan@google.com>
 <20260601153032.36C861F00893@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: sashiko-reviews@lists.linux.dev
List-Id: <sashiko-reviews.lists.linux.dev>
List-Subscribe: <mailto:sashiko-reviews+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:sashiko-reviews+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260601153032.36C861F00893@smtp.kernel.org>

On Mon, Jun 01, 2026 at 03:30:31PM +0000, sashiko-bot@kernel.org wrote:
> Thank you for your contribution! Sashiko AI review found 1 potential issue(s) to consider:
> 
> Pre-existing issues:
> - [High] Unconditional call to `device_rbtree_remove(info)` in the error path causes rbtree corruption for non-ATS devices.
> --
> 
> commit 73f5ec2d0aa9d509723e686b4cbf5b853c3a39c6
> Author: Pranjal Shrivastava <praan@google.com>
> 
>     iommu/vt-d: Fail probe on ATS configuration failure
>     
>     Update the Intel VT-d driver to handle ATS configuration and enablement
>     more strictly. Specifically, update the device probe to fail if
>     pci_prepare_ats() returns an error. This ensures that any ATS-capable
>     master reaching the attach phase is guaranteed to have a valid config.
> 
> > diff --git a/drivers/iommu/intel/iommu.c b/drivers/iommu/intel/iommu.c
> > index 4d0e65bc131d7..22308e4911e1f 100644
> > --- a/drivers/iommu/intel/iommu.c
> > +++ b/drivers/iommu/intel/iommu.c
> [ ... ]
> > @@ -3288,7 +3294,10 @@ static struct iommu_device *intel_iommu_probe_device(struct device *dev)
> >  
> >  	dev_iommu_priv_set(dev, info);
> >  	if (pdev && pci_ats_supported(pdev)) {
> > -		pci_prepare_ats(pdev, VTD_PAGE_SHIFT);
> > +		ret = pci_prepare_ats(pdev, VTD_PAGE_SHIFT);
> > +		if (ret)
> > +			goto free;
> > +
> >  		ret = device_rbtree_insert(iommu, info);
> >  		if (ret)
> >  			goto free;
> 
> [Severity: High]
> This is a pre-existing issue, but does the error path in this function
> unconditionally call device_rbtree_remove() on failure, even for non-ATS
> devices?
> 
> If intel_pasid_alloc_table() fails later in intel_iommu_probe_device(), it
> jumps to clear_rbtree:
> 
>         if (sm_supported(iommu) && !dev_is_real_dma_subdevice(dev)) {
>                 ret = intel_pasid_alloc_table(dev);
>                 if (ret) {
>                         dev_err(dev, "PASID table allocation failed\n");
>                         goto clear_rbtree;
>                 }
> 
> clear_rbtree unconditionally removes the info from the rbtree:
> 
> clear_rbtree:
>         device_rbtree_remove(info);
> 
> Since info->node is zero-initialized via kzalloc_obj(), calling rb_erase()
> on it for a non-ATS device (which was never inserted into the rbtree) causes
> the rbtree implementation to treat it as a root node and overwrite
> iommu->device_rbtree.rb_node with NULL.
> 
> This silently destroys the entire rbtree and detaches all previously
> registered ATS devices. Could we add a check to verify if the device was
> actually inserted before calling device_rbtree_remove(info)?

All of these have already been fixed in the Intel series:
https://lore.kernel.org/all/20260531170254.60493-1-praan@google.com/

Thanks,
Praan
