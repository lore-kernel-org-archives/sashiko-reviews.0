Received: from mail-pl1-f181.google.com (mail-pl1-f181.google.com [209.85.214.181])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1E22A3D7D88
	for <sashiko-reviews@lists.linux.dev>; Mon,  1 Jun 2026 15:05:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.181
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1780326348; cv=none; b=HflZ29Qh5JvRRFXCA6kfKe7jUtM0pZGLCu59fJPIT8JbJcbRcIWx+UKLTulZmENN0DEVF0xuLlhNsjbp4JcALXY4pPAG0HVqoqm1oavR/wtsEWf+PVuqtF+GHjaVpe+mx2GXROD+kwJthEV2eAIBensqi11EVMuMhqX2/giYfWU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1780326348; c=relaxed/simple;
	bh=9x+cMbphP6dLbrW7AUFxUKgjFD1luiDCeRrJCZurggg=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=iIerzXWEBdZuSpBe9xFlO9y2qRi2bYwS1Z4YktEgda5WCX41plE8KYX97Ize+4dGeuXeQm7hBCsD94uAIwNM5/7i8yDS1Z/me9V1ifESuZxuHenxpatvZjbvv0ldnt5nXyGL6FRx9atOqTu1erBoaE3FjMUazRa2ihWgsHABYCs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=lo0Ykc8G; arc=none smtp.client-ip=209.85.214.181
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="lo0Ykc8G"
Received: by mail-pl1-f181.google.com with SMTP id d9443c01a7336-2bf2911f93cso22165ad.1
        for <sashiko-reviews@lists.linux.dev>; Mon, 01 Jun 2026 08:05:43 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20251104; t=1780326343; x=1780931143; darn=lists.linux.dev;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=RGNrvQu3MsUANR6m8Aw6nTCtzJ6XjXkmgI7B+ElRctQ=;
        b=lo0Ykc8GUMyQZg+/fzqQP7JX+wiBkA2P2FoBliONcY5cPdZVn9WZJ8a1sDanS6Qc8T
         LRVYyoRwB2DYXvFbBdNW1c6AWQTTjvXCTgWsoloUp9DlAaWOl6Em8btsgMoIyzbkUaPc
         1qveGkZqWrNbg4tjON/jKKTSVkBstBAE/2l01A9I2w2JF7fY4fz4PzH9fGl0bGipPZiy
         EXaBMTTSBH/pPDdD4VAP+Vevo/PVCpBJIZmzbuPccPiI/OgQDw61cbaC8UteOZMZP8ra
         l2zVcXPtM7IBFnEYoIq9BJeOyfDyPk7lFjt/fJTTWcn7Vvv2vivyZaERtzme7RMbt7+r
         sI7Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1780326343; x=1780931143;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=RGNrvQu3MsUANR6m8Aw6nTCtzJ6XjXkmgI7B+ElRctQ=;
        b=k8DWJTBDvKdeHB8grOVskHzZuAAjT7cQ430+Z1w/DEUvFy7JH5Jik1RfiSAj9l6Hvy
         Gh60cWWbqzDduJBgjjDLF5J07P+3yWjGhGu9QZA4yERFyb99QkpwR/iGkM65r0Vv6nTJ
         9TigWEvaL4nHC9viApsydH9D+5VGPtrSTGymQd1QdDbzd3Xy63TCawcPgJqS84kKJpEN
         UqqaPNSwDJ9jGfBRzmJLvvBGJs9lZ8bAljRZ5vDSTmjFBLB0YcxzmYCyOOdlrwv/4QA1
         inRiNX7MRXFeIo+Clb8Y/ID9oJyRRhZ8B16yVYea4cd75I1Fyh4KSQo2bJGbp3sGNElZ
         xvwQ==
X-Gm-Message-State: AOJu0Yxo49+uZVQbWRUCIiOFi3C/pX6ABU6rnlpMLz0ki+73OWtCTdeE
	YI02r5704iPxjTdQS1zlYNNRhpCC/QB/Cb8WH8abgBeHooqwTvpI10H9w5eKyoMazhN/09V5ukA
	d6eNbTQ==
X-Gm-Gg: Acq92OFsHz8h7UaqkBm3TMDx/aJ+deqzWZ8Bct/2M2zX1qOXQ4DEc/uDBuWVmeZm3TJ
	h7AacFTT0HsRDOJfYkv8l5P+3O1lLrBppA3MGjIelCJ33pNq1Sj4L0jHBoV+5XP21t8/+rQ+SjV
	HIHg92UcmflTXvljrHIhUYI6qZBsKMVIdI7yEzxv25Lxeor4y6rNIs1Etc/bMGWd6+aZ+FQFD7K
	hBcjSB0IvYk02J8CjYET+hLYxJtD8v3v6gr6/YQDUfY3rulD5dyT3EcI6kGGUHpkTbdDxeAF5Xk
	xfmeovAiAWgavNI0Q48R3aM0rIMIqaCEablxY+B78w04ReG0grVECAsWFTZ2Cisqr/dwh40Hcw6
	xINFzEJTOUBgtzhIAxeHLuCbkBvGv+LjTKtVD8aSI2DrjLWp635vDcsBmyoLEkAMIdtbW3jv7ME
	I7TYC/j+5hG0Gzm+cgMB1fbjCVL23CAqQ0BexljTVgNSpPtn8ihPr+2kKBcdRO2GNsGUL/zAI=
X-Received: by 2002:a17:903:388d:b0:2b0:aee4:afe7 with SMTP id d9443c01a7336-2bf97501295mr7147535ad.10.1780326342401;
        Mon, 01 Jun 2026 08:05:42 -0700 (PDT)
Received: from google.com (199.255.142.34.bc.googleusercontent.com. [34.142.255.199])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2bf23c30646sm104919005ad.68.2026.06.01.08.05.41
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 01 Jun 2026 08:05:41 -0700 (PDT)
Date: Mon, 1 Jun 2026 15:05:37 +0000
From: Pranjal Shrivastava <praan@google.com>
To: sashiko-reviews@lists.linux.dev
Cc: linux-pci@vger.kernel.org
Subject: Re: [PATCH 5/6] iommu/amd: Fail probe on ATS configuration failure
Message-ID: <ah2fwcxzdhx8N0FR@google.com>
References: <20260601134204.2150602-6-praan@google.com>
 <20260601150126.3E04E1F00893@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: sashiko-reviews@lists.linux.dev
List-Id: <sashiko-reviews.lists.linux.dev>
List-Subscribe: <mailto:sashiko-reviews+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:sashiko-reviews+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260601150126.3E04E1F00893@smtp.kernel.org>

On Mon, Jun 01, 2026 at 03:01:25PM +0000, sashiko-bot@kernel.org wrote:
> Thank you for your contribution! Sashiko AI review found 1 potential issue(s) to consider:
> - [High] The newly added WARN_ON(ret) in pdev_enable_cap_ats() can be spuriously triggered for SR-IOV Virtual Functions (VFs) if the Physical Function (PF) was not properly configured for ATS.
> --
> 
> commit 40ae1c6d486f021eadc253f746299ffa4ca11dff
> Author: Pranjal Shrivastava <praan@google.com>
> 
> iommu/amd: Fail probe on ATS configuration failure
> 
> This commit updates the AMD IOMMU driver to call pci_prepare_ats() during
> device probe, failing the probe if it returns an error. It also adds a
> WARN_ON() in pdev_enable_cap_ats() to catch failures from pci_enable_ats().
> 
> > diff --git a/drivers/iommu/amd/iommu.c b/drivers/iommu/amd/iommu.c
> > index 4ef6024c5a4ea..783f53cb85996 100644
> > --- a/drivers/iommu/amd/iommu.c
> > +++ b/drivers/iommu/amd/iommu.c
> > @@ -566,10 +566,17 @@ static inline int pdev_enable_cap_ats(struct pci_dev *pdev)
> >  	if (amd_iommu_iotlb_sup &&
> >  	    (dev_data->flags & AMD_IOMMU_DEVICE_FLAG_ATS_SUP)) {
> >  		ret = pci_enable_ats(pdev, PAGE_SHIFT);
> > -		if (!ret) {
> > -			dev_data->ats_enabled = 1;
> > -			dev_data->ats_qdep    = pci_ats_queue_depth(pdev);
> > -		}
> > +
> > +		/*
> > +		 * pci_enable_ats() should not fail here because earlier
> > +		 * checks have already verified support & config.
> > +		 */
> > +		if (WARN_ON(ret))
> > +			return ret;
> 
> [Severity: High]
> Can this WARN_ON() trigger spuriously for SR-IOV Virtual Functions (VFs) if
> the Physical Function (PF) was not properly configured for ATS?
> 
> Looking at pci_prepare_ats(), it has a fast-path that returns 0 immediately
> for VFs without checking or configuring the PF's Smallest Translation Unit
> (STU):
> 
> int pci_prepare_ats(struct pci_dev *dev, int ps)
> {
>     ...
>     if (dev->is_virtfn)
>         return 0;
>     ...
> }
> 
> Later, when pdev_enable_cap_ats() calls pci_enable_ats() for the VF, the
> actual validation happens there:
> 
> int pci_enable_ats(struct pci_dev *dev, int ps)
> {
>     ...
>     if (pdev->ats_stu != ps)
>         return -EINVAL;
>     ...
> }
> 
> If the PF failed its IOMMU probe or was explicitly bypassed by the driver,
> its ats_stu would remain 0.
> 
> When VFs are subsequently probed, pci_prepare_ats() would blindly succeed,
> but pci_enable_ats() would fail with -EINVAL, triggering this new WARN_ON().
> 
> Could this lead to unnecessary bug reports or kernel crashes on systems
> configured with panic_on_warn?

No.. this error won't be hit because the path highlighted above is being
changed in the ATS series:

https://lore.kernel.org/all/20260601143644.2358771-3-praan@google.com/

Thanks,
Praan
