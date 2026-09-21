Received: from mail-pz2-f12.google.com (mail-pz2-f12.google.com [74.125.228.12])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E45094A3F34
	for <sashiko-reviews@lists.linux.dev>; Mon, 21 Sep 2026 20:48:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.228.12
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790023732; cv=none; b=sI1u20WrJWG28PXaWdr8lznlh1P/oPzSlrpkFNjvyuWqf4Maafw+UGJERT25fOI53LUV7XLrbBb0rLFTWXztjwmuzq6JDoAFr8RoFJodKWqAO7/MAjx5OprJujCtl+KhV0oF8wFJplQh/8genYni6nnyHZwksspXuOTZhHrrLMM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790023732; c=relaxed/simple;
	bh=duuqjqeee1gxRjF5xn4L1VFmmMHLBdcH21nRueFfC6A=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=fodLq14RkGoTPWDiEbua1IAjMSgt/DRA530OfjaAgtzZbXFVIhQPnHyZN5nxh92TUk4SNlZALsRv5DJcmz+4E2UHeqZ8J5azO2kiOgwUYPgmAp2Y+f4ZDE6Aj/oLj+fSDEWYB8BhmUYsLy4r7ykoMYDpvBSYDGyiOXwOyB1qt3o=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=NVxL5mcm; arc=none smtp.client-ip=74.125.228.12
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="NVxL5mcm"
Received: by mail-pz2-f12.google.com with SMTP id d2e1a72fcca58-85469f20513so2870095b3a.0
        for <sashiko-reviews@lists.linux.dev>; Mon, 21 Sep 2026 13:48:50 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20251104; t=1790023730; x=1790628530; darn=lists.linux.dev;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=9RpdHbEhaZD0mMR4lSv7YIPkc3oHh9/Jw4xKi9A6gsk=;
        b=NVxL5mcmOgpdhozK8W/f40/Ob+z13WLprC1KLQMzmbHCFTqfYWyDXRD1c0mTfAvrBR
         EBAbjzL+AJxKX2CUIRCc8PuEM8NVpWefVAKblxIkrDnz1uQyb2IcRf9mKeq27h8YFQUz
         hZ0187z1AJ0v2zIhUDwTvFxSAE5ItOm046l3u7dTv0RWK+7VpesH6XspJ1zx5QsF+IEd
         iQ3zoJPD9cnfIvPiQFu0vQUhS9MCkQF+igI41soBCq75HEczTaMBO+6qUBc6158uN1gI
         BygdRthpMO/iPVavOpdDMQeTgebDSwWLYjpiSb9gvGkl6gpfE1Thyw0bYxQF2vuFiNvn
         rfuw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790023730; x=1790628530;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=9RpdHbEhaZD0mMR4lSv7YIPkc3oHh9/Jw4xKi9A6gsk=;
        b=dUy3Sz5N5lQkxloJoenDCKCq00F9WAXoLNcN+yM6+FgJD1Wk9adl+TqiZwuGQ6ZdKL
         J2PwJHWLrHusI5mcSGWy7ryqP+mJnh5h4biyND+suHgC7wKOn4Tuu6rTFktoJ9Tz2D5h
         MeqtLzoV67Ovc6WM9GsCo5JWxocE1eXDxcsPVJ1U27I1nzm7hULjFHm8RZsBUS6ykzAv
         EaKHQhB3rzuohh4moxQ/TqcQx3W279NvCTp7xwBMtbTGFHXkgla98Ez8y1J4PFyDRwd7
         eCCTGNEQjMsV0cJo9aZ1TD+5ry2g/gDl1HftPReidkPjX3nGFezL9z1r+DTUYb7oQsg1
         m+KQ==
X-Gm-Message-State: AFuF++mQiTxAiCJQi2vbP/jII1bYl7NHO0iL5xzKzgrbyJnTy/ywT3rJ
	4/NhNhw5tecl898UvHVrniyiPUrXRlpeKQTlehmpMH5nebqB+Ib/UfXrJNjMjmwW8w==
X-Gm-Gg: AYBFou0PdrTLnA6nNqI7k7Ab8w7shbajOPeTYuLPIpXnQ90I5VmLbiSPfcDliz3Soq+
	E+fbx50upnTyE2HHSohbxtKti0Bhhx3bV6nkr9F+ZV24K8tqwlfPhUPu3ZNtJB+KpR15LhDGKH1
	8JOecjLbdZTrDW1njezeA7iqZxcfqQJJ15xmzwpBYuvMGywSJJ17nu4r6mSkfrG7mtBn2S2jQzc
	shC/Ztn0S8g+1eWioMBLRjWMS3OpGdczFBxeQ7bqhCsagaZA/x2psRRllnWj2xKNYSWao1cWSC6
	QIRfS7HJn1Z/T4TDhBKdDZdOVlG+VZp8I0rwznWuOkKzH+Fh574X04vYwguzWdsDzKds0CN//Az
	yiGrpepaVOvhoYNbGgf3ZLX+SF3n5Gimlta5o+97jCwwnrkijPoTsjkVwUTPaNe0KypeF3Eld/o
	5eEp3b5UHG4ZbmTCIcuF7tiPWWUsdSTNxHBuiyv3HbWtEK+QGgOE+5dox5HwwR5uqmysO8ZCcOC
	jGeVXbFVtEtR6WCsbsSvk3IUAKfIK2a0fFc1NtDVBbfYJYXdJ4=
X-Received: by 2002:a05:6a00:6c97:b0:878:34b8:2320 with SMTP id d2e1a72fcca58-87834b82455mr8559084b3a.40.1790023729351;
        Mon, 21 Sep 2026 13:48:49 -0700 (PDT)
Received: from google.com (192.150.203.35.bc.googleusercontent.com. [35.203.150.192])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-87bf84b6859sm44247b3a.52.2026.09.21.13.48.48
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 21 Sep 2026 13:48:48 -0700 (PDT)
Date: Mon, 21 Sep 2026 20:48:45 +0000
From: David Matlack <dmatlack@google.com>
To: Jason Gunthorpe <jgg@nvidia.com>
Cc: sashiko-reviews@lists.linux.dev, kvm@vger.kernel.org,
	linux-rdma@vger.kernel.org, Sean Christopherson <seanjc@google.com>
Subject: Re: [PATCH v6 06/10] vfio: selftests: Allow drivers to specify
 required region size
Message-ID: <arGYLavnr25ZSyuw@google.com>
References: <6-v6-8af36cf7b73f+e2-mlx5st_jgg@nvidia.com>
 <20260917235245.CAAE41F00898@smtp.kernel.org>
 <20260918115217.GA11142@nvidia.com>
 <CALzav=f4NTb4Csn2BoK5kk=MckFRvbVnOdO9yiCz8MLXdRMPOg@mail.gmail.com>
 <20260918200000.GB11142@nvidia.com>
Precedence: bulk
X-Mailing-List: sashiko-reviews@lists.linux.dev
List-Id: <sashiko-reviews.lists.linux.dev>
List-Subscribe: <mailto:sashiko-reviews+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:sashiko-reviews+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260918200000.GB11142@nvidia.com>

On 2026-09-18 05:00 PM, Jason Gunthorpe wrote:
> On Fri, Sep 18, 2026 at 07:58:58AM -0700, David Matlack wrote:
> > > >
> > > > [Severity: Medium]
> > > > Since this changes the vfio test to use the dynamic driver->region.size
> > > > instead of SZ_2M, should tools/testing/selftests/kvm/irq_test.c be updated
> > > > as well?
> > > >
> > > > It looks like vfio_setup_msi() in kvm/irq_test.c still forcefully overwrites
> > > > the dynamically probed size back to 2MB:
> > > >
> > > > tools/testing/selftests/kvm/irq_test.c:vfio_setup_msi() {
> > > >       ...
> > > >       region = &device->driver.region;
> > > >       region->size = SZ_2M;
> > > >       region->iova = iova_allocator_alloc(allocator, region->size);
> > > >       ...
> > > > }
> > > >
> > > > Will this cause the KVM irq_test to fail with a VFIO_ASSERT_GE during driver
> > > > initialization via vfio_pci_driver_init() when tested with a driver that
> > > > requires a larger region, such as the mlx5 driver mentioned in the commit
> > > > message?
> > >
> > > I have no idea, Dave? Did kvm start using this stuff?
> > 
> > Yes, KVM started linking in the VFIO selftests library in 7.3 and
> > irq_test.c is the first test using it.
> 
> Okay, so I think this is all that is needed:
> 
> @@ -101,7 +100,6 @@ static int vfio_setup_msi(struct vfio_pci_device *device)
>         allocator = iova_allocator_init(device->iommu);
>  
>         region = &device->driver.region;
> -       region->size = SZ_2M;
>         region->iova = iova_allocator_alloc(allocator, region->size);
>         region->vaddr = kvm_mmap(region->size, prot, flags, -1);
>         TEST_ASSERT(region->vaddr != MAP_FAILED, "mmap() failed\n");
> 
> > Looks like that is also causing the dma_rmb/wmb() redefinition
> > compiler warning from the kernel-test-robot.
> 
> Yeah, for some reason kvm defined them in its private headers instead
> of putting them in the right place :(
> 
> I think I can just delete the kvm definitions.
> 
> I don't have an arm system or userspace cross compiler to test it with
> though..

Wait, really? I can help with building and running the KVM/arm64
selftests if that's what you need.

> Are we good on everything else, can Alex pick it up after I fix this?

Yes all good from my pov after we address this feedback. I am no longer
seeing failures[1] when using the IGB driver with this series applied.

[1] https://lore.kernel.org/all/anzvkibgzTae9eV9@google.com/
