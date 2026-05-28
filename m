Received: from mail-pl1-f180.google.com (mail-pl1-f180.google.com [209.85.214.180])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 83EA03B6BFE
	for <sashiko-reviews@lists.linux.dev>; Thu, 28 May 2026 17:37:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.180
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779989825; cv=none; b=Iu4Kqe4uF1Dny530cIRrQJKestKjgJ6Jush16yk5v+cURy7UWbpHTnVXeB6blhv4NBwg5VlCCyNabFIXWDqrtop1iCBvqs3wM21wmdd96a6rDFJ+QuEst83LEDucOYftbxwU4CaRL5WMG0vN98zzalE0uexCvdu00XR2UcA8MqQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779989825; c=relaxed/simple;
	bh=ODRFnjIkUAQww/q3dLtAxcGbYW1BaTBmjW2k6uhC1K8=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=cF9bQSqMcdB14EQWy0FsLDRwj/qxsUY/2GeNutEwvehDmaHOr8Ef9GpTIFEQ9Ls/VSEVw1MTZ3TiSdY69qfS2lRmJ1rcRsmSmfCdierq/SaRptWqyGXFuipq3y856lEqhMeEIMrrPAqihvO2qIQ4zzuLtktRKCiC4PjjqSQoPpk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=X3crl19h; arc=none smtp.client-ip=209.85.214.180
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="X3crl19h"
Received: by mail-pl1-f180.google.com with SMTP id d9443c01a7336-2b46da8c48eso1565ad.1
        for <sashiko-reviews@lists.linux.dev>; Thu, 28 May 2026 10:37:03 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20251104; t=1779989823; x=1780594623; darn=lists.linux.dev;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=Qk/MAQeMcth0WKh9OHkZ/HSNe18bg7+51E9FEIaNkro=;
        b=X3crl19hK/WIhZn10bTdJu3RpZWaBo6lwk/Xf51qWt3rsGiWl9jThRd+F7KRRqneRm
         tEunqViaSpbk2fjBM9I5Ml786E0hQ1ldBPheAY/TTLjlGxEetReVWDO6t85oat0rffcB
         gCi1JJUBfWfc3hxXi43W9z9Uad7lBUcVaochu7cqPKT+KL40mobOLD9Gh3+DQjDUnEDi
         NsD2NGyoe5eO2tJ4xZ28jSJuX8m4G7k7JHejwzQuTdzdVo90UU4gC9ilFKsDUcmm4RpF
         FNiyX92eaz6wbqKFYpcDoQ4ZOx0pkITW8EKDtl9WE/7U2/VODznpk+LE+gQqZdA7HAS4
         O2TQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1779989823; x=1780594623;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=Qk/MAQeMcth0WKh9OHkZ/HSNe18bg7+51E9FEIaNkro=;
        b=FZPIdPlc64JVehP/OrZhHnYxkp2NqV0Tp3odODS6vFmVP0e+GvDnPnEMX1L1PUvvyp
         dS0oSoFEJn6OlPerWIGGiXsRqRZ3INQmbm3xV+innLJnMs1oY6GAeZ7wgjdV5e2R575Z
         KUC6gmka1ixLlt0hjDkf0G7WzUL3mZWCqMgvLYwrhjFEj17fgl2n9+j6X6kj1mKzFTY1
         tAgzxtHAdMODaRUMVlUWZ2KfxbUMsBMbmfV5gWv2KWccivZ84yT9++l9vtV/VuKC+4c5
         cmA/UtwLl8N8iy5PWRpYlFumiAH2+DssM6zW1VkqkeIThsS9ieN8rIIlXvhxwUjgOKoe
         qlhQ==
X-Gm-Message-State: AOJu0YyjcgKqgFvvZw/Q5V10VNKof8i/A1IGZtvG3XmHfI6wUFzT9UAX
	zMO1wINDCRreQxogXZMrpb9atNwsAS/HGM5tf3sjAYe30QTw71fddy2cu0Z/Rype3czLWBGSPM0
	jtcZ4Gg==
X-Gm-Gg: Acq92OFuDrTlLBFZxZglhtyGOzS1t42bCQ6QLk99coHrrnR6qfvxJSrG5IIKS+70LRc
	p4LwNnUNz25p0cWmFwj3TTh1DvEOiRtxhOrplOAVef1iTyyl0wehC2Qd19bacKw/KGRdp6RapUt
	Ss+OAXSi1f/Ccg+M3VulGabp0L/7J6kuuMqmqzV1thy6st4kHGn/EE7ws8GDJGqxBXW5GWG901N
	fzL6Gcu0W/+IpXymJVYvuHnjatiIBT3sOXsserWo/pEd1dfnCritjDJEGyDMJeoDMSr/GLNryFR
	lOTcS52Rz6L2RTqAK1yKDpUWXd563nfuR8+SJZ2WUsohIoOIm92GEzu2KPHv7+8u81sfLiJjV9z
	C8k8xXshJiFNMaaQG4h/2g5Cso6m3Z+2Bio9cUJbjkNsquBjgvtrCrgmihWHPs2ZBKPqtCw4c7g
	hGFq9D0DjDtAvVtOcmkNsGsggpWvT91X3Jpxh0okqCcdPA9uEgiAhW6+tudooPRlgv7Xqu
X-Received: by 2002:a17:903:2b05:b0:2bf:749:55c with SMTP id d9443c01a7336-2bf1dea9685mr19605ad.21.1779989822247;
        Thu, 28 May 2026 10:37:02 -0700 (PDT)
Received: from google.com (44.234.124.34.bc.googleusercontent.com. [34.124.234.44])
        by smtp.gmail.com with ESMTPSA id 41be03b00d2f7-c852056db34sm15614699a12.27.2026.05.28.10.37.00
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 28 May 2026 10:37:01 -0700 (PDT)
Date: Thu, 28 May 2026 17:36:57 +0000
From: Pranjal Shrivastava <praan@google.com>
To: Baolu Lu <baolu.lu@linux.intel.com>
Cc: sashiko-reviews@lists.linux.dev, linux-pci@vger.kernel.org
Subject: Re: [PATCH v4 4/5] iommu/vt-d: Fail probe on ATS configuration
 failure
Message-ID: <ahh9ORDm6EcQ7aKS@google.com>
References: <20260525184347.4059549-5-praan@google.com>
 <20260525205628.CD4431F000E9@smtp.kernel.org>
 <17ab0d76-6df7-48f6-a7fd-387934f95c0f@linux.intel.com>
Precedence: bulk
X-Mailing-List: sashiko-reviews@lists.linux.dev
List-Id: <sashiko-reviews.lists.linux.dev>
List-Subscribe: <mailto:sashiko-reviews+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:sashiko-reviews+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <17ab0d76-6df7-48f6-a7fd-387934f95c0f@linux.intel.com>

On Thu, May 28, 2026 at 01:19:13PM +0800, Baolu Lu wrote:
> On 5/26/26 04:56, sashiko-bot@kernel.org wrote:
> > > @@ -3288,7 +3294,10 @@ static struct iommu_device *intel_iommu_probe_device(struct device *dev)
> > >   	dev_iommu_priv_set(dev, info);
> > >   	if (pdev && pci_ats_supported(pdev)) {
> > > -		pci_prepare_ats(pdev, VTD_PAGE_SHIFT);
> > > +		ret = pci_prepare_ats(pdev, VTD_PAGE_SHIFT);
> > > +		if (ret)
> > > +			goto free;
> > > +
> > >   		ret = device_rbtree_insert(iommu, info);
> > >   		if (ret)
> > >   			goto free;
> > [Severity: High]
> > This is a pre-existing issue, but does unconditional removal of the rb-node
> > on the error path cause tree corruption for non-ats devices?
> > 
> > If a device does not support ats, the info structure skips the
> > device_rbtree_insert() call here, leaving info->node zero-initialized.
> > 
> > However, if a subsequent operation like intel_pasid_alloc_table() fails,
> > the error path jumps to clear_rbtree:
> > 
> > intel_iommu_probe_device()
> >      ...
> >      clear_rbtree:
> >              device_rbtree_remove(info);
> >      free:
> >              kfree(info);
> > 
> > Calling device_rbtree_remove() on this zero-initialized node causes the
> > rb-tree logic to treat it as a root node with no parent, ultimately
> > overwriting the actual tree root with null and corrupting the device_rbtree.
> 
> Perhaps we can fix it like this?
> 
> diff --git a/drivers/iommu/intel/iommu.c b/drivers/iommu/intel/iommu.c
> index 4d0e65bc131d..849d06dfe1ae 100644
> --- a/drivers/iommu/intel/iommu.c
> +++ b/drivers/iommu/intel/iommu.c
> @@ -157,7 +157,10 @@ static void device_rbtree_remove(struct
> device_domain_info *info)
>         unsigned long flags;
> 
>         spin_lock_irqsave(&iommu->device_rbtree_lock, flags);
> -       rb_erase(&info->node, &iommu->device_rbtree);
> +       if (!RB_EMPTY_NODE(&info->node)) {
> +               rb_erase(&info->node, &iommu->device_rbtree);
> +               RB_CLEAR_NODE(&info->node);
> +       }
>         spin_unlock_irqrestore(&iommu->device_rbtree_lock, flags);
>  }
> 
> @@ -3254,6 +3257,7 @@ static struct iommu_device
> *intel_iommu_probe_device(struct device *dev)
> 
>         info->dev = dev;
>         info->iommu = iommu;
> +       RB_CLEAR_NODE(&info->node);
>         if (dev_is_pci(dev)) {
>                 if (ecap_dev_iotlb_support(iommu->ecap) &&
>                     pci_ats_supported(pdev) &&

Ack. Yes. I'll add it to the next version.

Thanks,
Praan
