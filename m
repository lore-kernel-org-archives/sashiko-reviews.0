Received: from mail-pl1-f175.google.com (mail-pl1-f175.google.com [209.85.214.175])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4DDDF388E6F
	for <sashiko-reviews@lists.linux.dev>; Thu, 14 May 2026 18:16:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.175
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778782590; cv=none; b=A0sAutGBZHydQ9TVlBnPxFbgqKw8GpFDtJfm232WDmxQ0Ju+34AUmy8MJ9lux87ncnMl57+q6/cozB+90wM3xDM5KyVANR/lgFDjv9CoUJgRyWzhZNagKmfEu7efthjYnCLThBzV1dGls9rmtaYh7gobLHkSWGSx0jjcn6OdbBw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778782590; c=relaxed/simple;
	bh=LlKBPVfZt6k55SzB3EeP58F5fOxBhXQRYxzjH7+tFVE=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=i/uK6ZbpNUbokxLPV4LhzTqC3yWEflLGT5zI/LYn3HAuTfedNGQWJ/YJIKCaQtMVYhmyw9AJYlPn3AWdK9it/HmLYIATO39xfkdIhB/soKD0+wQRY07ls2UppIBf0jIyFIznPEeP3KR4ycNmJa0VnmFfo02XcRHtsKwGUbhgDXE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=mAYP7cFG; arc=none smtp.client-ip=209.85.214.175
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="mAYP7cFG"
Received: by mail-pl1-f175.google.com with SMTP id d9443c01a7336-2b7d3ecc10dso82193275ad.2
        for <sashiko-reviews@lists.linux.dev>; Thu, 14 May 2026 11:16:29 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20251104; t=1778782588; x=1779387388; darn=lists.linux.dev;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date:from:to
         :cc:subject:date:message-id:reply-to;
        bh=cC7g+W3PbRFAIT/5EGy8Wrg/Kml67wts/KuJpeskYOY=;
        b=mAYP7cFGOuQrbl5xaFcwXFWeNTBg9FX+a9UN/CtPkzLWyE+mtfahvJZ8VIdC63w4Ch
         aIGBVuw/ZTFJaxnCS3hbTWqw/h570mvshvLQ5YlUaMsFdjuR5sRROEyER8skTfrcAO4Z
         SqyOIg1nVVT6SfE3N2cMX9U3+fBYrV0GGmcMyO8RhEP6vsEddhVlEQyL94K8PiDVLLCS
         szcyEtQDuOLWa72Gu31GONCPqn4ks2D6ZDGpit1OsPo+K1uaK3jXs2gMNnnkyVzSL0E/
         DNsL+ZxBc+sP58imAsLiFCuAVfWHG4f24x4s/wOTyx+qPSctvSO9QsC4Ct8HtZ4Z5uWm
         IY4Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1778782588; x=1779387388;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=cC7g+W3PbRFAIT/5EGy8Wrg/Kml67wts/KuJpeskYOY=;
        b=I+9k9kUa2FxOZoGO5Avx3Um+97ticwLMgDAsqMAtl210ORy0FZZrgNTqjyinj2bOB9
         vr6/AX9AmvGN9SMgoB7zLUVOaHwCq9l0phSVj3iWThSkLNpH+wicfgw4SZTaxC7vuB6A
         u+VLUdAj65rLW1M0C8OnzGTxBJyIpg1FXmbXcaSWGpvtLSJcwV9D8hNUrVHul0d7VXv8
         2uOZ3hVbAMnFJq1n7G6/t84cUOqnGjXf0Fiq6GBRFH4CaveINkks1L4pE5YHu8vcISq6
         IXN0jnFk6gR++Ts8bzxCvLAVFXkx4DYIm9iL+EbAu/x0S5j3mcmH16HqEZOgSC+nxYG0
         4BRg==
X-Gm-Message-State: AOJu0YxErZmTnzOMuJ+naqksKhbrfyfFmCYlWLaPzmZgZpuFACEua5GQ
	plW2E2YLKmdh1SJ1JVplYxeBK9ykXOZloefGw1/s71r7CZStyZDDOBtpOhlHyi3Fw+Rd01zt0b8
	Qn7q/vQ==
X-Gm-Gg: Acq92OGPB6QOeY8MyuGYwPRbkd4UuDopGPFax+mABP4RlT/61UIRWTUs9YSc1ivpX6T
	JZL54z3yAjw+7noK8ST08x06zmBy961Y30cleBeW3wSdkw/1lpjoL3qNO9gZIgpxkT8QZzwAqa2
	d5//m2Kvpi2AYVuB2fKVSMgaGbfYAJstmKxnQ5AdtbtLWtWqUqkVABz43QdnlIyt9xmykXxhB+f
	TUu4k4ySGWeR7MXmPmol99NcCZRBPfvQxNyDFUQpeHKCValcuk9ed35szVqTrqveTfosf2ezjuG
	nrUDSqba51X4Ieq9BQtYqTyRzsLJgZtu+YhMvG/tE95a4nU055hOqqMMeTDR09Bo+s/3IxkybeY
	uUrj53n9ukRiiehD9QUOH5TdQxYk1wpvKNE8cfA1aiAvFZOpQvcUqieC2v1aIGcxf9JoLUN98bR
	Ssa2Gv4fvcztxqGWV0KphA/ZnkhmSZXSm8A9tYxsv3q+49aQVAlfqeL6kij4g7iKRdEewL60QS
X-Received: by 2002:a17:903:22cc:b0:2b2:6b58:9317 with SMTP id d9443c01a7336-2bd7e91e3a2mr6066215ad.39.1778782587583;
        Thu, 14 May 2026 11:16:27 -0700 (PDT)
Received: from google.com (56.149.168.34.bc.googleusercontent.com. [34.168.149.56])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2bd5c263a0fsm33093835ad.37.2026.05.14.11.16.26
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 14 May 2026 11:16:27 -0700 (PDT)
Date: Thu, 14 May 2026 18:16:23 +0000
From: David Matlack <dmatlack@google.com>
To: sashiko-reviews@lists.linux.dev
Cc: linux-pci@vger.kernel.org
Subject: Re: [PATCH v5 02/11] PCI: liveupdate: Track outgoing preserved PCI
 devices
Message-ID: <agYRd0xQs0r8OOKA@google.com>
References: <20260512184846.119396-3-dmatlack@google.com>
 <20260514003111.4F10AC19425@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: sashiko-reviews@lists.linux.dev
List-Id: <sashiko-reviews.lists.linux.dev>
List-Subscribe: <mailto:sashiko-reviews+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:sashiko-reviews+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20260514003111.4F10AC19425@smtp.kernel.org>

On 2026-05-14 12:31 AM, sashiko-bot@kernel.org wrote:
> Thank you for your contribution! Sashiko AI review found 2 potential issue(s) to consider:
> - [Critical] Dangling pointer in dev->liveupdate.outgoing causes Use-After-Free memory corruption and state leaks if a device is not properly unpreserved.
> - [High] Missing `kho_is_enabled()` check in `pci_flb_preserve()` violates KHO subsystem guidelines.
> --
> 
> commit f946f5d8b0614325899345e29b5315ff6d5139e9
> Author: David Matlack <dmatlack@google.com>
> 
> PCI: liveupdate: Track outgoing preserved PCI devices
> 
> This patch adds APIs to allow drivers to notify the PCI core of which devices
> are being preserved across a Live Update. It allocates a struct pci_ser via
> the KHO subsystem to track the outgoing preserved devices.
> 
> > diff --git a/drivers/pci/liveupdate.c b/drivers/pci/liveupdate.c
> > --- a/drivers/pci/liveupdate.c
> > +++ b/drivers/pci/liveupdate.c
> 
> [ ... ]
> 
> > @@ -74,27 +110,30 @@ static int pci_flb_preserve(struct liveupdate_flb_op_args *args)
> >  
> >  	size = struct_size_t(struct pci_ser, devices, max_nr_devices);
> >  
> > -	ser = kho_alloc_preserve(size);
> > -	if (IS_ERR(ser))
> > -		return PTR_ERR(ser);
> > +	outgoing->ser = kho_alloc_preserve(size);
> 
> Does this allocation need to be gated by kho_is_enabled()?

No, if kho_is_enabled() is false then liveupdate_register_flb() would
have returned -EOPNOTSUPP and thus this callback would never be run.

> 
> If KHO is disabled, kho_alloc_preserve() will silently add tracking state
> that will never be used.
> 
> > +	if (IS_ERR(outgoing->ser)) {
> > +		kfree(outgoing);
> > +		return PTR_ERR(outgoing->ser);
> > +	}
> >  
> >  	pr_debug("Preserved struct pci_ser with room for %u devices\n",
> >  		 max_nr_devices);
> 
> [ ... ]
> 
> >  static void pci_flb_unpreserve(struct liveupdate_flb_op_args *args)
> >  {
> > -	struct pci_ser *ser = args->obj;
> > +	struct pci_flb_outgoing *outgoing = args->obj;
> >  
> > -	WARN_ON_ONCE(ser->nr_devices);
> > -	kho_unpreserve_free(ser);
> > +	WARN_ON_ONCE(outgoing->ser->nr_devices);
> > +	kho_unpreserve_free(outgoing->ser);
> > +	kfree(outgoing);
> 
> If a driver fails to unpreserve a device before the FLB is torn down, this
> WARN_ON_ONCE triggers, but the memory is still freed.
> 
> Does this leave dev->liveupdate.outgoing pointing to freed memory?

Yes, if a driver unpreserves a device without notifying the PCI core
then that would lead to the PCI core having a pointer to freed memory.

I can make this code more robust against buggy drivers in v6.

> 
> >  
> >  	pr_debug("Unpreserved struct pci_ser\n");
> >  }
> 
> [ ... ]
> 
> > +void pci_liveupdate_unpreserve(struct pci_dev *dev)
> > +{
> > +	struct pci_flb_outgoing *outgoing = NULL;
> > +	struct pci_dev_ser *dev_ser;
> > +	struct pci_ser *ser;
> > +	int ret;
> > +
> > +	ret = liveupdate_flb_get_outgoing(&pci_liveupdate_flb, (void **)&outgoing);
> > +
> > +	if (ret || !outgoing) {
> > +		pci_warn(dev, "Cannot unpreserve device without outgoing Live Update state\n");
> > +		return;
> > +	}
> > +
> > +	guard(mutex)(&outgoing->lock);
> > +	ser = outgoing->ser;
> > +
> > +	guard(write_lock)(&dev->liveupdate.lock);
> > +
> > +	dev_ser = dev->liveupdate.outgoing;
> > +	if (!dev_ser) {
> > +		pci_warn(dev, "Cannot unpreserve device that is not preserved\n");
> > +		return;
> > +	}
> > +
> > +	pci_info(dev, "Device will no longer be preserved across next Live Update\n");
> > +	ser->nr_devices--;
> > +	memset(dev_ser, 0, sizeof(*dev_ser));
> 
> If dev->liveupdate.outgoing was left dangling from a previous torn-down
> session, can this corrupt memory?
> 
> If a new Live Update session starts, pci_liveupdate_unpreserve() would
> fetch the new outgoing FLB but operate on the old dangling
> dev->liveupdate.outgoing pointer.
> 
> Does this code cause a use-after-free in the memset() here, as well as
> corrupt the new session's counter when decrementing ser->nr_devices?

I will clean up any dangling pointers during pci_flb_unpreserve() in v6
to protect the PCI core against buggy drivers.

> 
> > +	dev->liveupdate.outgoing = NULL;
> > +}
> 
> -- 
> Sashiko AI review · https://sashiko.dev/#/patchset/20260512184846.119396-1-dmatlack@google.com?part=2
