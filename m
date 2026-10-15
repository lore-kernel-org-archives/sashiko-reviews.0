Received: from mail-wm1-f42.google.com (mail-wm1-f42.google.com [209.85.128.42])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D6337288C96
	for <sashiko-reviews@lists.linux.dev>; Thu, 15 Oct 2026 21:24:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.42
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1792099494; cv=none; b=eZLVDFvIhyQ/oy5OlDOsa6GDznLEhTKKAocrP/mQbiz9HOJkJJuSZ1/BMKEF3EBiBVxIJShr0xIEJ2koRMEFrZDEGg/jfXFp4JwvQ9MvjmIR9Y9sjMX2+0aU7RYbpX4f2jeek4OvMae46J3WyViU3RGPVZAkw6NAcxmC5UTzUyQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1792099494; c=relaxed/simple;
	bh=TkXwC6R+EndTetkst/D63lP4L+OGrSsZEzFiPRMyMRA=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=eJ0yAanclhtwfxAYoDuKAtxfJX29sRDC/QKhsh6/fdwH0eBW0wt24AQkdKw0AcrHu9iEoAI6uV7GuS49TGRGxKi3xkRaNyrmlNgeEVYePHwSI5hC+S3bq3qA5lUvkzIlbKv+ucxmk/dcFnR6d+3tF+GEQrzHi8G9V36+pjVW4sY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=HBU9/f+v; arc=none smtp.client-ip=209.85.128.42
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="HBU9/f+v"
Received: by mail-wm1-f42.google.com with SMTP id 5b1f17b1804b1-4a18617ae90so22965e9.0
        for <sashiko-reviews@lists.linux.dev>; Thu, 15 Oct 2026 14:24:52 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20251104; t=1792099491; x=1792704291; darn=lists.linux.dev;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :content-type:mime-version:references:message-id:subject:cc:to:from
         :date:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=Bq4PgBio1E8gV2wDn/JrOT5yHUjnH8pSBRTBpqMY8oM=;
        b=HBU9/f+v6gpiQNfRv+VLzw7/LOs+GGM6ZW+TSAKkWkfYI8zCU2BIuxV4DzhKVUeatt
         6Yec8LgXYi6XI+yIc1l3RxBny1ck5oWIEvTWHuo30rPXeuk9ZBs0VGevqfpSfK8v3ALp
         1JXb8VzilEvsJ8MrFrobDDP/6Ps/JJ+du13lUFUHdxM8ThiHhn9fFsD/HOrGhVLYgNp/
         kt9i8wqy5aqVFNnvX8GPjcSDIpe8dNoyasd5pwEDbnHx7jgVtJYDDW1gOTkFy/Ni2uiD
         lmLrn8bt6bX/0PjI64JZzmgtYtcxshaStoD0WcxcNAGOSO5xhlbVtn99Mofh/kOVEPHy
         RshA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792099491; x=1792704291;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :content-type:mime-version:references:message-id:subject:cc:to:from
         :date:x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=Bq4PgBio1E8gV2wDn/JrOT5yHUjnH8pSBRTBpqMY8oM=;
        b=iqDpNV1fq7iigw5jJbnIruo5tctqALXvlBr9tJssNiZiv/KvD6EM9qtOxqfbP2+BRF
         E3a5D6Le+WhFeA2cYqfEGDCub/Ha5zPSekaJtcJEeri6bY7oy+NTYLwos+HucX/8leKQ
         87kEzhHUpDGSfHUpPyU7/pbnmjbhCZ3ddRC0141sYtTZeik/6gSf0/WM7n7GK0+AkpRS
         mw84Wuuk7CL1Xh4Gz0JO/dyOOWshs/3UAeO2tblxAtXl3m3bSGEIFtfBvUx1VXoF5HXc
         vlb3OsJZQNoi5n0nBekf4/9Vnbt05JGQKUNuIrn42I0cyENBQTuQQts8i4OIP7DHREIn
         NC9w==
X-Gm-Message-State: AFq9FYLXvjefQwHGcn9taCdKs9S7C20m/ytUINcIlZP7gzWu+T/rz8U+
	Fmu5MWzz36gjCLAd/fohjVz4t5sbpsHNen698PnPz0Pmw0vg2c4N6CAobNS6BLD3dX7ZxQgyzt+
	27K/tpw==
X-Gm-Gg: AYBFou0w2S/g+AWeQ+Y0x/LOhM0TOfW9FHlgtdGJLMuG9czuDEs+RJBOW7BhyrbQAAb
	D/5+2f428qZoe72yN0soUxtYQI0/yP3a1ifii6lVSa23XRo+f3SOhIbccEBqMUhmHsOgq5LPq/u
	YG9aAFFnn+YtgAqlqvTXLEyFDtBIyKDlny2QmizQg+YUdhH35i7Ryl7xpDFwrB08rAXZlaRuN8L
	km8t+xApZqCOwsu3Z6Cjj2tN25f5Wa8opKMBmWWagyxTwRe2mSLie90VkiCEKbo3cGiQadeUizu
	6COayZaC2fajCDktJ9uKTsBxHE4Dd6Ql5sY7kw+W6eu/cyNv/3+8d9k4XF+1gFQif5LPzYPz3s/
	WSN/q+jgF6MtU/YLJY4ORFG/Tcu4qzCDJuC4vpwbgJpujixtXdCTF3Wg8Ce7CvNJ/kCso8MEHxn
	M+6gQzWXcdtM1L5+juSA6A+C+/wZ9CyU5IsaKG45zwKT3lsrHQJT3FocckUuaacpFgWO2pKd+x7
	VWKtXIjQ4Erw4qdx67mBJzKPJ+qtAsTXQ1hd8lR
X-Received: by 2002:a05:600c:a40a:b0:4a1:98b1:1de9 with SMTP id 5b1f17b1804b1-4a1c8adda89mr155615e9.13.1792099490706;
        Thu, 15 Oct 2026 14:24:50 -0700 (PDT)
Received: from google.com (250.192.189.35.bc.googleusercontent.com. [35.189.192.250])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-48dfd4f8bb6sm566051f8f.34.2026.10.15.14.24.49
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 15 Oct 2026 14:24:49 -0700 (PDT)
Date: Thu, 15 Oct 2026 21:24:46 +0000
From: Mostafa Saleh <smostafa@google.com>
To: sashiko-reviews@lists.linux.dev
Cc: kvmarm@lists.linux.dev, Oliver Upton <oupton@kernel.org>,
	Marc Zyngier <maz@kernel.org>
Subject: Re: [PATCH v9 21/25] iommu/io-pgtable-arm: Support io-pgtable-arm in
 the hypervisor
Message-ID: <atFEnvRG2-AyPuTe@google.com>
References: <20261015200903.2735565-1-smostafa@google.com>
 <20261015200903.2735565-22-smostafa@google.com>
 <sashiko-outbox-173386@kernel.org>
Precedence: bulk
X-Mailing-List: sashiko-reviews@lists.linux.dev
List-Id: <sashiko-reviews.lists.linux.dev>
List-Subscribe: <mailto:sashiko-reviews+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:sashiko-reviews+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <sashiko-outbox-173386@kernel.org>

On Thu, Oct 15, 2026 at 08:26:45PM +0000, sashiko-bot@kernel.org wrote:
> Thank you for your contribution! Sashiko AI review found 1 potential issue(s) to consider:
> - [Low] arch: layering violation by including SMMUv3 header in generic io-pgtable-arm.h
> --
> 
> commit 251567dd4618edfaa4984ef7282b71a0da331297
> Author: Mostafa Saleh <smostafa@google.com>
> 
> iommu/io-pgtable-arm: Support io-pgtable-arm in the hypervisor
> 
> To be able to populate the shadow stage-2 in the hypervisor, compile
> io-pgtable-arm object for the hypervisor. This requires the hypervisor
> to provide the iommu-pages allocator, redefine the address conversion
> helpers, and stub out the DMA API.
> 
> [ ... ]
> 
> > diff --git a/drivers/iommu/io-pgtable-arm.h b/drivers/iommu/io-pgtable-arm.h
> > index ba7cfdf7afa03..4278da41e406d 100644
> > --- a/drivers/iommu/io-pgtable-arm.h
> > +++ b/drivers/iommu/io-pgtable-arm.h
> > @@ -27,4 +27,13 @@
> >  #define ARM_LPAE_TCR_PS_48_BIT		0x5ULL
> >  #define ARM_LPAE_TCR_PS_52_BIT		0x6ULL
> >  
> > +#ifndef __KVM_NVHE_HYPERVISOR__
> > +#include "iommu-pages.h"
> > +#define arm_lpae_alloc_data(obj)	kmalloc_obj(obj)
> > +#define arm_lpae_free_data(p)		kfree(p)
> > +
> > +#else
> > +#include "arm/arm-smmu-v3/pkvm/io-pgtable-arm-hyp.h"
> 
> [Severity: Low]
> Is this an intended architecture layering violation? The generic ARM LPAE page
> table header drivers/iommu/io-pgtable-arm.h explicitly includes the
> driver-specific header arm/arm-smmu-v3/pkvm/io-pgtable-arm-hyp.h when
> compiled for the hypervisor. This tightly couples generic IOMMU framework code
> directly to the SMMUv3 driver path.
> 
> Should the hypervisor stubs be placed in a generic NVHE include directory
> (e.g., arch/arm64/kvm/hyp/include/nvhe/) to maintain subsystem independence,
> even if SMMUv3 is currently the only user?
> 

No strong opinion, I think keeping it anywhere under drivers/iommu is
fine.

Thanks,
Mostafa

> > +#endif
> > +
> >  #endif /* IO_PGTABLE_ARM_H_ */
> 
> -- 
> Sashiko AI review · https://sashiko.dev/#/patchset/20261015200903.2735565-1-smostafa@google.com?part=21
