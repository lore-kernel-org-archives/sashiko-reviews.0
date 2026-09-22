Received: from mail-wm1-f54.google.com (mail-wm1-f54.google.com [209.85.128.54])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2120839F17F
	for <sashiko-reviews@lists.linux.dev>; Tue, 22 Sep 2026 15:13:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.54
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790089989; cv=none; b=dsY2D+BAnJ+GkxrmULc/uEXLoSVHwra2Yz6+V10WfV2OZRH/HekfBqaEQXibKhavgD3BKmfXoU77sRvV8eFG35IPiFo9wflL8u8mPyQqXCcfihPjpy74yVfmeAAG6YMoy+1dhXt+lDGlZzVLr4ETlxmcKT1VT15bUbLL0yujGvE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790089989; c=relaxed/simple;
	bh=BYdjDLssy8JKv6FM/v/3nDxGoG02feMVhVR5WwpnGqo=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=bz65ADZ56Z+FyjcnviwkykexrSeSSjTl2zV5vadJhY8FsU3LLTz2XFkxilvRXddTBhuXZLjZ5wLUCKb28gBPSmoXujciKEHFCIr1JscULjbBmsoQEXuDu2bZZxXCnHM5GcODIr8sjwKa8h00GwC5hxa/p7kynfXVQVSfU9jFfK4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=bjJFsP4G; arc=none smtp.client-ip=209.85.128.54
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="bjJFsP4G"
Received: by mail-wm1-f54.google.com with SMTP id 5b1f17b1804b1-49ccf12bed0so51525e9.1
        for <sashiko-reviews@lists.linux.dev>; Tue, 22 Sep 2026 08:13:06 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20251104; t=1790089984; x=1790694784; darn=lists.linux.dev;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :content-type:mime-version:references:message-id:subject:cc:to:from
         :date:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=ycaWp9SoS5hGz6SolD0/sJBzyQ5A16vDCKKDe4NgaW8=;
        b=bjJFsP4GTgbWlBulSEBf28nbfc5dQjMqcZaXuSYH1oQj7n3YmpoGzUuwMuL6Rab0hP
         /RKLamWatRGjFKlUCIegib5bzzWukpCdWcfizCUaXmeSTkWs0hIpxW4WOc0xOYX5ayra
         FVTHbrQj8xRpdF0cTMKk8okg6KSe5RmTwBnJkWtMXfY1zwrJ3se98uBCA+80oKtkrcpz
         xXBRDK2xKmTVpZvx9NsG5D3EuzBKpl8F+hSk1c4wi864m+wiGUP0fNlxhO3VzSaco3hU
         aX7GcORDsVy15gAECWDQ77GToOi6qzIr2osjc18+hdoWLCMCjpoL/RnZB4FpbGgMflrS
         YlKQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790089984; x=1790694784;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :content-type:mime-version:references:message-id:subject:cc:to:from
         :date:x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=ycaWp9SoS5hGz6SolD0/sJBzyQ5A16vDCKKDe4NgaW8=;
        b=Kv4QLdfhcDFE2pjJUFk12GQz4/Y4zYGoFWrb8M0Mn7EtBdv0Chx2vrwr+w/EhEJMNP
         kA5JHiVimTQfhBSLRm3+8bS/rfo9CuDh7T94CkfzYbsZ75ftChVzGr5o5bKKgqOtp1yF
         uwek73DpW1MPTAVFZ0T2YUSPbp7kCrZy+WQdYrTrn03dMBQJlEDQ5jBu/WVIKZVPgil+
         gamPGdikKdxinzBqw9lfoBCG73JNr4mjCOKwr6KS7utlTuSBYvTCP8jD3NdIpwlj3IGd
         CCf6dWn3jctx6RDzNhG5n/Wft6eABiStJvuN2QMaw00fXHDii0Sg19VDHnYhlZpiI8nJ
         UrDA==
X-Gm-Message-State: AFuF++mG+nU7Em8yJVhRksidTUgW6ZgK/KBWVKbr5g87LbE3A9M0l1sh
	Yb9m9FcYubrX7Dvm6it1C4189VK5nMzWiOsV+zDHjJ15H1mijzbgldGj6hCfKyYv2wq/oBB1k/0
	XdihZDQ==
X-Gm-Gg: AYBFou2AahFC9zsQlB2NXY9AVEZRQPL98HrpMkUjv4cZdjfNNpuXZRTmXdTZolVlaNd
	iPaZDVLWz7m74OfJOZPV9s5WqBYfeXf/wUcH/Q9asifka0LAmtJyvM3Dx6IrPbv15rGT6L8iWNn
	8+nLuHRSmDLwLkUOaC0hR/+U6GVq4zvyV+I/6tk6bwIgiXT1N8uYgooR/EN7cSKFwMsKcUM+IDH
	bnrb0GHSpDuFr4z7T8F7jeantk+nzutXgs6vy0jNXgdEPIJWfwQcssChOr/yenf1Fe7G8FLnK4j
	i7mqGucYo4tuuulihBuL5E+IQKW93WDfjteTuTXmoXb5z4xXqv8Gh3x0zQY5EE704BSvzUk9jXo
	pt+n8fyUyRFMzJrNPAb10wiupiL6dkYGPaB+Oc549IeDp3gWI95REJ0a9D42x+VB6QowkWcz/Ti
	KTCWaQDCOjEv1GbkJtnkoZcoUgfBpOtrHegIQXps4OeX+33jYKH8b+tRzlp2lNcQupJfhtZHzWy
	OytdXk7Qg/3tMIyR2N9grVLO1n5224s8L+ZtpHhpA==
X-Received: by 2002:a05:600c:6005:b0:49e:642a:9279 with SMTP id 5b1f17b1804b1-49fdd97d911mr116335e9.4.1790089983699;
        Tue, 22 Sep 2026 08:13:03 -0700 (PDT)
Received: from google.com (250.192.189.35.bc.googleusercontent.com. [35.189.192.250])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-49fddfdce15sm1497315e9.10.2026.09.22.08.13.03
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 22 Sep 2026 08:13:03 -0700 (PDT)
Date: Tue, 22 Sep 2026 15:12:59 +0000
From: Mostafa Saleh <smostafa@google.com>
To: sashiko-reviews@lists.linux.dev
Cc: Oliver Upton <oupton@kernel.org>, Marc Zyngier <maz@kernel.org>,
	kvmarm@lists.linux.dev
Subject: Re: [PATCH v8 11/25] iommu/arm-smmu-v3-kvm: Add the kernel driver
Message-ID: <arKa-8QbSSQFrUbJ@google.com>
References: <20260922131259.2975334-1-smostafa@google.com>
 <20260922131259.2975334-12-smostafa@google.com>
 <20260922132814.D398D1F000FF@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: sashiko-reviews@lists.linux.dev
List-Id: <sashiko-reviews.lists.linux.dev>
List-Subscribe: <mailto:sashiko-reviews+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:sashiko-reviews+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20260922132814.D398D1F000FF@smtp.kernel.org>

On Tue, Sep 22, 2026 at 01:28:14PM +0000, sashiko-bot@kernel.org wrote:
> Thank you for your contribution! Sashiko AI review found 2 potential issue(s) to consider:
> - [Critical] iommu: pKVM DMA isolation bypass via unbound SMMUs falling back to host driver
> - [High] iommu: Use-after-free of smmu during platform_device removal
> --
> 
> commit a8ae8dbe858fbefdcb8b149d519f07175f91d794
> Author: Mostafa Saleh <smostafa@google.com>
> 
> iommu/arm-smmu-v3-kvm: Add the kernel driver
> 
> This commit introduces the pKVM host driver for the Arm SMMUv3, allowing
> the hypervisor to trap and emulate SMMU management when KVM runs in
> protected mode. The driver probes these SMMUs and creates auxiliary
> devices for them on the aux bus.
> 
> > diff --git a/drivers/iommu/arm/arm-smmu-v3/arm-smmu-v3-kvm.c b/drivers/iommu/arm/arm-smmu-v3/arm-smmu-v3-kvm.c
> > new file mode 100644
> > index 0000000000000..9947d3a44304b
> > --- /dev/null
> > +++ b/drivers/iommu/arm/arm-smmu-v3/arm-smmu-v3-kvm.c
> [ ... ]
> > +static int smmuv3_nesting_probe(struct platform_device *pdev)
> > +{
> > +	struct hyp_arm_smmu_v3_device *smmu = &kvm_arm_smmu_array[kvm_arm_smmu_cur];
> > +	struct device *dev = &pdev->dev;
> > +	struct resource *res;
> > +
> > +	/* Only device tree, ACPI not supported. */
> > +	if (!dev->of_node)
> > +		return -EINVAL;
> 
> [Severity: Critical]
> Can an adversary bypass pKVM stage-2 memory protections here?
> 
> If an SMMU fails to bind to the hypervisor due to early returns in this
> probe function (like missing a device tree node or hitting the cavium
> erratum below), it is excluded from kvm_arm_smmu_array and the hypervisor
> does not trap its MMIO.
> 
> When the native host arm_smmu_driver registers at device_initcall, it can
> successfully bind to this unbound SMMU. Does this allow an adversary host
> kernel at EL1 to natively program this untrapped SMMU to perform arbitrary
> DMA into hypervisor or guest memory?

Yes, nothing really we can do about this, the system might have:
- Incompatible SMMUv3 instance.
- Device behind another IOMMUs.
- Devices without IOMMUs.

A system shipping this code should ensure that the driver is probed
successfully on their HW.

> 
> > +
> > +	if (kvm_arm_smmu_cur >= kvm_arm_smmu_count)
> > +		return -ENOSPC;
> > +
> > +	res = platform_get_resource(pdev, IORESOURCE_MEM, 0);
> > +	if (!res)
> > +		return -ENODEV;
> > +
> > +	if (of_property_read_bool(dev->of_node, "cavium,cn9900-broken-page1-regspace"))
> > +		return -EINVAL;
> [ ... ]
> > diff --git a/drivers/iommu/arm/arm-smmu-v3/arm-smmu-v3.c b/drivers/iommu/arm/arm-smmu-v3/arm-smmu-v3.c
> > index 2043c6dc1bdf8..d6d1e2d30ef63 100644
> > --- a/drivers/iommu/arm/arm-smmu-v3/arm-smmu-v3.c
> > +++ b/drivers/iommu/arm/arm-smmu-v3/arm-smmu-v3.c
> [ ... ]
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
> 
> [Severity: High]
> Can this devres setup lead to a use-after-free during platform device
> removal?
> 
> If the parent physical platform device is destroyed (for example, via
> dynamic DT overlay removal), the driver core calls devres_release_all()
> which processes cleanups in reverse order of addition (LIFO).
> 
> Because arm_smmu_device_probe() adds the smmu allocation to the parent's
> devres list after the auxiliary device was created in
> smmu_create_aux_device(), the smmu memory gets freed first.

Two points:
1) At the moment the device can't be released as suppress_bind_attrs is
   true. There is no kernel user for the dynamic overlay it is added
   for testing AFAIU.

2) AFAICT, __devm_auxiliary_device_create() calls, devm_add_action_or_reset()
   for the device destroy, so the aux device will destroyed before the
   platform device.

> 
> Following that, the auxiliary_device_destroy devres action executes,
> unregistering the aux device and triggering driver unbind via
> arm_smmu_device_remove_emu() and arm_smmu_device_remove(). Does this
> result in dereferencing the already freed smmu struct?
> 

Same as above.

Thanks,
Mostafa

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
> -- 
> Sashiko AI review · https://sashiko.dev/#/patchset/20260922131259.2975334-1-smostafa@google.com?part=11
