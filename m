Received: from mail-wm1-f51.google.com (mail-wm1-f51.google.com [209.85.128.51])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1D36C58E2B2
	for <sashiko-reviews@lists.linux.dev>; Thu, 15 Oct 2026 20:52:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.51
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1792097577; cv=none; b=dOScaA+ktd9NAspu9TYI2pTY3PNJm7Td/F2SQo6QzaNxnmgNg8P/mNjTdaE5yKR8kVQu9gmp8+tuugFQOUkAmZ2WRoTva3mT8ddPW5egxSNtq3ia9THRR6is1JO/i5UzSq8cKj+BdNWqZx8FhvGpK/+F+EjHrq+NeiK4s8QwcRk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1792097577; c=relaxed/simple;
	bh=+MfBuoodSpTuVf6Xq6Jkx3zm9aWgP3dx3tjKSydtSic=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=BRrFNooXXWKW1uxDuC6nJs+v9RECE2g0ilXystiqQF9mPNnmVn5s4CNnlB+s+16aA0oJj8x+IhuIXMRCCg5wnV15XEGYKArba7P8anfLQaLmWJsjpEJxAMa0WamYRDaFcfk9fjBhyqS0zPDIN9V+vhgK/MOZKwc3h22SQUtchco=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=FVAl5Sq3; arc=none smtp.client-ip=209.85.128.51
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="FVAl5Sq3"
Received: by mail-wm1-f51.google.com with SMTP id 5b1f17b1804b1-4a021c28046so3995e9.1
        for <sashiko-reviews@lists.linux.dev>; Thu, 15 Oct 2026 13:52:53 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20251104; t=1792097572; x=1792702372; darn=lists.linux.dev;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :content-type:mime-version:references:message-id:subject:cc:to:from
         :date:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=Ygyq0yonOOmO7DFaCqJWCTyCPPun6haIwjZRgYnZfCY=;
        b=FVAl5Sq3en7MY1IRZzVsWTYMwXulVrh5aRmsFVC9nDrSi0zIeVUxkv3DuUz93fyONQ
         iHK3D9i8BGBObtxGpY5L9VVK1IkHcC+9iCrCEvAnRliquol1thl5+CEGBSrqgNSmP/Yd
         wEmO6mErB4xieUO/eiW2Ik3BHaB93FHGBlWtDTPn4ZmUZl6elBjGpq8h6U2dgbypRD3M
         mI9t0jQty65hxtnUrUQ4RB6sbGDa/Trjw1s9Y5k2v4Bbx6MR2h5JKPNQsxh4k9nfsr3N
         9+dk+f0GZ4H2joGBMlPeRBNoqV1JyTsZeIMPBW1L/57uOvR0LmQAbjr8lv0J+tIeLHBR
         Gv1w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792097572; x=1792702372;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :content-type:mime-version:references:message-id:subject:cc:to:from
         :date:x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=Ygyq0yonOOmO7DFaCqJWCTyCPPun6haIwjZRgYnZfCY=;
        b=eBxz1W2t4A+uww1Bd6VFFJ96p1JJ7YLTnYNHUI+QDAZoyAeafKAcBKoNpIxllxJs5f
         47yEWgVWGmyLHH+d7KoG8/rgP0UzAKdmzMZuuOugZUBi8bSbeCGV44VILChIAE7i9ESN
         Bi0koemHNg4/teUCrdCM9aJ+emSetjDEpqeGo2rBSn8pPeKkh8SAdamvBXLxusn59TQi
         nL+4LR+sTAfv+djcFrL1RShMpL+589mDU47HG7l1l4vamFUJ5Xj6sdrrzvMqwLzt/YTF
         Pt2hA7g98K+oJIccgRvFWD8JdGPVbZh7qcmRrhYJ2AbLL01QyqvLbmr0hAEUu5JB4xBo
         F8wA==
X-Gm-Message-State: AFq9FYKaoDG0JQCfLaBuARQEdGUjKzoSd4XS64ewFU4Rcr5GpNXXeUwD
	oH18+eGEgMKuITLQhlPDG/pQKa9Mgwm5OCOF3P60nJRCkqhEWvAPMm4MIZAkdygfd0Iq0rZyWWX
	vjnkGQw==
X-Gm-Gg: AYBFou35xzPoLAMrXJw91WBpHgWf3dPu/wVijx1jE0IwAFR2wQN86CVBlnIN3b9skIt
	ZKE1a1vTCny/3A7M0iMrFPf4MoyHYuX1wzgN8mwNDUbX3Wsx9CjGTpIdg+wtQiXLP4+xeFOYRpc
	lr8y+34XutqrR1v1Vc470uIrgyRB0/PRYM4s8iOU7xzEYWAzi7QFrsk88oz20mlaqX+PJaM7YBS
	V1mFzViape4h/vKBdaqyMmEhMHRbUEP7l8rkOWSDQ0+g2eJKPK5Z+TScYUNvT6jf41UVahJUbWO
	LNAjYhLNI/fRGgDDJe0swKV4ciOLeeZlaf02QWF67HpwV3WVEIalatDgG0ypBxbbfP9sru1lbpg
	jKwiECPVWCbpcpt66UCsfy04f2bxxBDvpH86vBlOpLa/EAWXP/W/4G1j/5c0WNfjZgGe9NC8dMg
	CrOzyCSyEnsZ2vqBNLs/m6zgVD/lLYgOtmiN9sAwemGgV8sub8NJcCwIidufxgV9Q7524G3zmF8
	evvqYSMIYMdI9G6VoNBtNxQAaTFDkE6l+CSpeUJ
X-Received: by 2002:a05:600c:c112:b0:49f:e1d3:fe03 with SMTP id 5b1f17b1804b1-4a1c8314778mr246605e9.3.1792097571702;
        Thu, 15 Oct 2026 13:52:51 -0700 (PDT)
Received: from google.com (250.192.189.35.bc.googleusercontent.com. [35.189.192.250])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4a1c8a9e382sm4019835e9.2.2026.10.15.13.52.51
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 15 Oct 2026 13:52:51 -0700 (PDT)
Date: Thu, 15 Oct 2026 20:52:47 +0000
From: Mostafa Saleh <smostafa@google.com>
To: sashiko-reviews@lists.linux.dev
Cc: kvmarm@lists.linux.dev, Oliver Upton <oupton@kernel.org>,
	Marc Zyngier <maz@kernel.org>
Subject: Re: [PATCH v9 11/25] iommu/arm-smmu-v3-kvm: Add the kernel driver
Message-ID: <atE9H7wWlnlqYqV3@google.com>
References: <20261015200903.2735565-1-smostafa@google.com>
 <20261015200903.2735565-12-smostafa@google.com>
 <sashiko-outbox-173402@kernel.org>
Precedence: bulk
X-Mailing-List: sashiko-reviews@lists.linux.dev
List-Id: <sashiko-reviews.lists.linux.dev>
List-Subscribe: <mailto:sashiko-reviews+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:sashiko-reviews+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <sashiko-outbox-173402@kernel.org>

On Thu, Oct 15, 2026 at 08:35:03PM +0000, sashiko-bot@kernel.org wrote:
> Thank you for your contribution! Sashiko AI review found 3 potential issue(s) to consider:
> - [Critical] iommu/arm-smmu-v3: native driver fallback bypasses pKVM DMA isolation
> - [High] mm: UAF of smmu due to devres LIFO inversion on deferred probe
> - [Medium] iommu/arm-smmu-v3: aux device creation failure aborts initialization for remaining SMMUs
> --
> 
> commit 989c8869198ba4ebe30e4fc7554bb66910985d0b
> Author: Mostafa Saleh <smostafa@google.com>
> 
> iommu/arm-smmu-v3-kvm: Add the kernel driver
>     
> When KVM runs in protected mode with CONFIG_ARM_SMMU_V3_PKVM, the
> hypervisor owns the SMMUv3 hardware and presents emulated SMMUs to the
> host through trap and emulate. This patch adds the host side of the driver,
> using an auxiliary device approach for the emulated SMMUs.
> 
> > diff --git a/drivers/iommu/arm/arm-smmu-v3/arm-smmu-v3-pkvm-init.c b/drivers/iommu/arm/arm-smmu-v3/arm-smmu-v3-pkvm-init.c
> > new file mode 100644
> > index 0000000000000..5c5f0ff455e3b
> > --- /dev/null
> > +++ b/drivers/iommu/arm/arm-smmu-v3/arm-smmu-v3-pkvm-init.c
> 
> [ ... ]
> 
> > +static int __init kvm_arm_smmu_v3_register(void)
> > +{
> > +	size_t nr_pages = smmu_hyp_pgt_pages();
> > +	int ret;
> > +
> > +	if (!is_protected_kvm_enabled() || !nr_pages)
> > +		return 0;
> > +
> > +	ret = kvm_arm_smmu_array_alloc();
> > +	if (ret)
> > +		goto out_err;
> > +
> > +	ret = platform_driver_probe(&smmuv3_nesting_driver, smmuv3_nesting_probe);
> > +	if (ret)
> > +		goto out_free;
> > +
> > +	ret = pkvm_iommu_register_driver(&kvm_nvhe_sym(smmu_ops), nr_pages);
> > +	if (ret)
> > +		goto out_unregister;
> > +
> > +	/*
> > +	 * These variables are stored in the nVHE image, and won't be accessible
> > +	 * after KVM initialization. Ownership of kvm_arm_smmu_array will be
> > +	 * transferred to the hypervisor as well.
> > +	 */
> > +	kvm_hyp_arm_smmu_v3_smmus = kvm_arm_smmu_array;
> > +	kvm_hyp_arm_smmu_v3_count = kvm_arm_smmu_cur;
> > +	return ret;
> > +
> > +out_unregister:
> > +	platform_driver_unregister(&smmuv3_nesting_driver);
> 
> [Severity: Critical]
> Does this fail-open behavior bypass pKVM DMA isolation?
> 
> If an SMMU is rejected by smmuv3_nesting_probe() (e.g. due to Cavium errata
> or unaligned MMIO), or if pkvm_iommu_register_driver() fails, the affected
> SMMU devices are left unbound or the nesting driver is unregistered.
> 
> Later, the native arm_smmu_driver is registered unconditionally in
> arm-smmu-v3.c and will successfully bind to these unbound SMMU devices.
> Since the hypervisor wasn't given the MMIO regions for the skipped SMMUs,
> it does not enforce stage-2 trapping on them. The host EL1 could then
> program these native SMMUs to perform unrestricted DMA into pKVM-protected
> guest or hypervisor memory, compromising protected VMs.
> 

Also by design as replied in v8:
https://lore.kernel.org/all/arKa-8QbSSQFrUbJ@google.com/

> > +out_free:
> > +	kvm_arm_smmu_array_free();
> > +out_err:
> > +	kvm_arm_smmu_count = 0;
> > +	kvm_arm_smmu_array = NULL;
> > +	return ret;
> > +}
> > +
> > +static int __init smmu_create_aux_device(struct device *dev, void *data)
> > +{
> > +	static int dev_id;
> > +	struct auxiliary_device *auxdev;
> > +
> > +	auxdev = __devm_auxiliary_device_create(dev, "protected_kvm",
> > +						"smmu_v3_emu", NULL, dev_id++);
> > +	if (!auxdev)
> > +		return -ENODEV;
> > +	return 0;
> > +}
> > +
> > +static int __init kvm_arm_smmu_v3_post_init(void)
> > +{
> > +	if (!kvm_arm_smmu_count)
> > +		return 0;
> > +
> > +	/*
> > +	 * If KVM failed to initialise, the host stage-2 is never enabled and
> > +	 * the SMMUs are driven natively through the same path.
> > +	 */
> > +	WARN_ON(driver_for_each_device(&smmuv3_nesting_driver.driver, NULL,
> > +				       NULL, smmu_create_aux_device));
> 
> [Severity: Medium]
> Does this halt initialization for all remaining SMMUs if one fails?
> 
> In kvm_arm_smmu_v3_post_init(), driver_for_each_device() iterates over all
> bound SMMUs. If smmu_create_aux_device() fails (e.g. due to an ID collision
> or memory allocation failure in __devm_auxiliary_device_create()), it
> returns -ENODEV.
> 
> The core driver_for_each_device() function halts iteration and returns
> immediately upon receiving a non-zero value. Consequently, if a single SMMU
> fails aux device creation, all subsequent SMMUs are silently skipped. These
> skipped SMMUs won't be probed by the host's arm_smmu_driver_emu, breaking
> DMA translation for any peripherals behind them.
> 
> Should the callback log the error and return 0 to allow the remaining
> devices to initialize?
> 

If anyone fails the system is not trusted so there is no point of
creating the others.

> > diff --git a/drivers/iommu/arm/arm-smmu-v3/arm-smmu-v3.c b/drivers/iommu/arm/arm-smmu-v3/arm-smmu-v3.c
> > index c2ec33c763a0f..66f38c54742b8 100644
> > --- a/drivers/iommu/arm/arm-smmu-v3/arm-smmu-v3.c
> > +++ b/drivers/iommu/arm/arm-smmu-v3/arm-smmu-v3.c
> 
> [ ... ]
> 
> > +static int arm_smmu_device_probe_emu(struct auxiliary_device *auxdev,
> > +				     const struct auxiliary_device_id *id)
> > +{
> > +	struct device *parent = auxdev->dev.parent;
> > +	void *group;
> > +	int ret;
> > +
> > +	dev_info(&auxdev->dev, "Probing from %s\n", dev_name(parent));
> > +	group = devres_open_group(parent, NULL, GFP_KERNEL);
> > +	if (!group)
> > +		return -ENOMEM;
> > +
> > +	ret = arm_smmu_device_probe(to_platform_device(parent));
> > +	if (ret)
> > +		devres_release_group(parent, group);
> > +	else
> > +		devres_close_group(parent, group);
> > +	return ret;
> > +}
> > +
> > +static void arm_smmu_device_remove_emu(struct auxiliary_device *auxdev)
> > +{
> > +	arm_smmu_device_remove(to_platform_device(auxdev->dev.parent));
> > +}
> 
> [Severity: High]
> Can this lead to a use-after-free of the smmu struct due to devres LIFO
> inversion during a deferred probe retry?
> 
> If arm_smmu_device_probe() returns -EPROBE_DEFER (e.g. from
> iommu_device_register() -> bus_iommu_probe() -> probe_iommu_group()),
> arm_smmu_device_probe_emu() correctly cleans up and returns the error,
> causing the auxiliary bus to defer the probe.
> 
> However, __devm_auxiliary_device_create() has already proceeded to register
> the auxiliary_device_destroy action on the parent's devres list. Later,
> when the deferred probe retries and succeeds, arm_smmu_device_probe()
> allocates the smmu struct via devm_kzalloc() and attaches it to the parent's
> devres list *after* the destroy action.
> 
> On parent platform device removal (e.g. via device tree overlay removal or
> system teardown), devres_release_all(parent) destroys devres actions in LIFO
> order. It first frees the smmu struct, and subsequently executes
> auxiliary_device_destroy. This unregisters the aux device and triggers
> arm_smmu_device_remove_emu(), which then dereferences the freed smmu pointer.

My assumption is that the platform device can't be removed as the
comment above, the overlay support has no in-kernel user nor a uAPI.

Not sure what does "system teardown" mean, but shutdown won't call
devres_release_all(). So I believe there is not path to remove the
platform device in that case.

However, as hardening, I might just call auxiliary_device_create()
instead of __devm_auxiliary_device_create().

Thanks,
Mostafa

> 
> -- 
> Sashiko AI review · https://sashiko.dev/#/patchset/20261015200903.2735565-1-smostafa@google.com?part=11
