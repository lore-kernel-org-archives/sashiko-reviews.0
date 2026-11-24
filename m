Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.128.45
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795546719;
	b=QKU3SZvCCQ9zSpymzdWETkn4fajWM8BlF+H7trScbk+lfO/A7wgwGp6ZCjJMXsVleSIl
	 J0R9lHKdbV4qj55A4Q5uhW3j9ew8x4wBRJjb0pRIQ0TtqVtozf5e/jNpNLylz01yvLIJ3
	 CVHcekPno/MqZN+CrMgHTSSaQIbrvKIe/OSPhXy4Se0uAyw6bGSE0KHC/M/Qxq7k59G4U
	 Ok+RXaxusTLrrtjYjiunvsFNy1bL41RYHbCch+sn7BDv97e7/nqC1qgB9t/aU5g8WpluE
	 qhgUled9aFeE4VHiswxRi1bpX72YsaGYEG6p1u393zmaEqDVTd5gdu916wplKhaKv/Q==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795546719;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:Received:Date:From:To:Cc:
	 Subject:Message-ID:References:MIME-Version:Content-Type:
	 Content-Disposition:In-Reply-To;
	bh=rKVd0WB9GKER5oLiGhqXKhoz1U/fSQCfKOepi4KUjiM=;
	b=rWlLMvw9muTu1Wv2DfgBwbbuLBve4T1R2IsGiWUx+pf0lsqKOoGTaKHTVWiwZ0Usw1oj
	 E/e3Qq/oL2N4QQ2t23C57nDywlkiGv28NLLIIlUR+kUt5hTRyx3qk7esLFwx06AE+7mfG
	 SKwmDuUrInm60VKAfmm4LEbVfNgBLCPkPz2VNFyq//hE8WYmPXyW6NcemtBuhx+XukGdF
	 V+Pcyr1e8VK+bH1+MMYZq4Eb4JJ5nlPb+ee60ZFuxJtY21mt43kKfzUBAcnFvdkJnhmgz
	 +m/IIMaSfZYHq2WtqNQevbHzNmXvFa/o6WUfrqOMnB7nz8tXOeh9mpyjfrjk3vW+eWg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=chromium.org;
	spf=pass smtp.mailfrom=chromium.org;
	dkim=pass header.d=chromium.org header.i=@chromium.org header.a=rsa-sha256 header.s=google header.b=fHg+aG4X;
	arc=none smtp.remote-ip=209.85.128.45
Received: from mail-wm1-f45.google.com (mail-wm1-f45.google.com [209.85.128.45])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1218E606A338
	for <sashiko-reviews@lists.linux.dev>; Tue, 24 Nov 2026 18:58:37 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 1218E606A338
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=chromium.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.a=rsa-sha256 header.s=google header.b=fHg+aG4X
Received: by mail-wm1-f45.google.com with SMTP id 5b1f17b1804b1-4bb666304fdso52631235e9.0
        for <sashiko-reviews@lists.linux.dev>; Tue, 24 Nov 2026 10:58:37 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1795546716; x=1796151516; darn=lists.linux.dev;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=rKVd0WB9GKER5oLiGhqXKhoz1U/fSQCfKOepi4KUjiM=;
        b=fHg+aG4X2P1ATKa/cPZRAMvwj8sfd2vGn/69eGznevPqBP98ydgqfydgjAWn+YvD+Z
         +STpRBFGyGiXgv0tQr0+QrZmFfbzpow8CP4EEhgv452HYBoNycFdBK69IzwOYlznIHL1
         lVz6vgu55/1XmNMRaxBRrHifqpWvqzTwE2muk=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795546716; x=1796151516;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=rKVd0WB9GKER5oLiGhqXKhoz1U/fSQCfKOepi4KUjiM=;
        b=11TtcnMpnTjqnp/sBV5SD19PVxqoKEXxcJunH2+8mYrlSjBXeLJ0EQB3deUETmTsWE
         iVrhppYRrCI9OwMh9mqD62O6ZQTwjjzJByAON+2i9xlMN5jyAn6kCx7hKj4WVYGkXz18
         Y/boEwSse+4aKIfviakH+GGVfEhvgoXzAWTsgAruKpQ++cm5Wmh/4AlwAQKeqnUzdvkY
         lW03i8/dfcwNvc+ahixf4WEtSZzTPT/iXnEEtDBC8Nwuy4gzI50B467vkxPAGvCaiVaj
         4Bab+SVJh1TPVMfeWtr/Vq0f5bTtVuMIE24HxZXJ9VJLc9rSvbiCZkAHo0lOx0oMTfhP
         pwbg==
X-Gm-Message-State: APuU4Z8BOFJcZwjUm4WUBHw9PskXnkwBLRxgfaxnGqiak8ctu6UTu+xO
	hyvh26Oggd3S+MD7oP/kzZQBU3MszO4YQdRpb/ap36IpJ3GyaTLm5Fm6zf9vrpEpf4PyCd4b8J6
	Y4v3EZA==
X-Gm-Gg: AZFdTZc4MqqxBzotxyERYumUmc/jU9nTIa6kxaiwE/0Ktw0bpgukPeUUSd3KoVKteHW
	OgaD5zrFmkmIIz7OMwadxYqEuLz0xeTDkroD7kElGmLbFWb8ChGM6zvQD9C6+HysewkIZcEEKsB
	uMQWRxHHkoT4OdGJmtLChTanF2igaB5WPcpdgQ+rz4pN6rq3A+8lP6g4kupaN6KSkbWOk6+Klr9
	MSsn8u9F/uGWSmsX5iA2pu59F7ueJX7c7R1acoDsnphh35WFLZS0J7chgHQPlz5Zho5e6DmNsOx
	d5n5bc+xOVqlnlZ6j68jfTRL+pJsQWZBV/iZh9p/Ifo7lOiDSceqX92FrBeflr8Bk0FH82UI3vG
	k+ld8O6HN0IYZwg7qTVUb5CMfsLJoWrHY5cCQ+P1nsTV41lP6WSFkCQjMF1dYf+36EnScgYWE5l
	Qp7f/FVon5ZGp/onbetjPvAjkXuX+2uKGCo5WL1dTPCmYWATx21SffMsmhfzzyMn2nxHf1HIdxq
	ffQ89zK4273DZQcJmOYpqqqS84WSvk2ABg3UhETZTbEqfhR9sdOwnT00AW93GelvgQgeMFZeV5j
	5o9jFnfV5a1ZzIvX/0w5HdNbrBHYtsa8MCQldbSIpXYqOAr6bpXncQ1Yqnt2rJuJ
X-Received: by 2002:a05:600c:4585:b0:4a1:c6f5:2450 with SMTP id 5b1f17b1804b1-4bb8881b8e4mr321879025e9.17.1795546716413;
        Tue, 24 Nov 2026 10:58:36 -0800 (PST)
Received: from google.com ([2a00:79e0:285b:8:af0c:c5f1:ee8a:b81f])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4bb853ca452sm445870355e9.15.2026.11.24.10.58.34
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 24 Nov 2026 10:58:35 -0800 (PST)
Date: Tue, 24 Nov 2026 19:58:31 +0100
From: Dmytro Maluka <dmaluka@chromium.org>
To: sashiko-reviews@lists.linux.dev
Cc: Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	Lu Baolu <baolu.lu@linux.intel.com>,
	Bjorn Helgaas <bhelgaas@google.com>,
	Dmitry Torokhov <dtor@google.com>,
	David Woodhouse <dwmw2@infradead.org>,
	Bjorn Helgaas <helgaas@kernel.org>, iommu@lists.linux.dev,
	Jean-Philippe Brucker <jpb@kernel.org>,
	Joerg Roedel <joro@8bytes.org>, Joshua Peraza <jperaza@google.com>,
	Jesse Barnes <jsbarnes@google.com>, Len Brown <lenb@kernel.org>,
	linux-acpi@vger.kernel.org, linux-kernel@vger.kernel.org,
	linux-pci@vger.kernel.org,
	Mika Westerberg <mika.westerberg@linux.intel.com>,
	Oliver O'Halloran <oohall@gmail.com>,
	Pavel Machek <pavel@kernel.org>,
	"Rafael J. Wysocki" <rafael@kernel.org>,
	Rajat Jain <rajatja@google.com>, Rajat Jain <rajatxjain@gmail.com>,
	Will Deacon <will@kernel.org>,
	Suravee Suthikulpanit <suravee.suthikulpanit@amd.com>,
	Robin Murphy <robin.murphy@arm.com>,
	Vineeth Pillai <vineeth@bitbyteword.org>,
	Aashish Sharma <aashish@aashishsharma.net>,
	Grzegorz Jaszczyk <jaszczyk@chromium.org>,
	Tomasz Nowicki <tnowicki@google.com>,
	Dmytro Maluka <dmaluka@chromium.org>
Subject: Re: [PATCH v11 1/2] PCI/ACPI: Support Microsoft's "DmaProperty"
Message-ID: <awXeV5Jo4WTjLc8c@google.com>
References: <20261123235845.564027-1-dmaluka@chromium.org>
 <20261123235845.564027-2-dmaluka@chromium.org>
 <sashiko-outbox-230247@kernel.org>
X-Mailing-List: sashiko-reviews@lists.linux.dev
List-Id: <sashiko-reviews.lists.linux.dev>
List-Post: <mailto:sashiko-reviews@lists.linux.dev>
List-Help: <mailto:sashiko-reviews+help@lists.linux.dev>
List-Subscribe: <mailto:sashiko-reviews+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:sashiko-reviews+unsubscribe@lists.linux.dev>
List-Owner: <mailto:sashiko-reviews+owner@lists.linux.dev>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <sashiko-outbox-230247@kernel.org>

On Tue, Nov 24, 2026 at 12:15:46AM +0000, sashiko-bot@kernel.org wrote:
> Thank you for your contribution! Sashiko AI review found 2 potential
> issues to consider:
> - [Medium] PCI/ACPI: platform_optin_force_iommu() ignores DmaProperty
>   devices
> - [Medium] PCI: SR-IOV VFs do not inherit untrusted flag from
>   DmaProperty PF
> --
> 
> commit 534ec8c0dc4ebcebaa88d905d9760f867ca5b38f
> Author: Rajat Jain <rajatja@google.com>
> 
> PCI/ACPI: Support Microsoft's "DmaProperty"
> 
> This commit adds support for the Microsoft ACPI _DSD "DmaProperty" to mark
> PCI devices as untrusted when the property is set to 1.
> 
> Link: [1] https://docs.microsoft.com/en-us/windows-hardware/drivers/pci/dsd-for-pcie-root-ports#identifying-internal-pcie-ports-accessible-to-users-and-requiring-dma-protection
> Link: [2] https://docs.microsoft.com/en-us/windows/security/information-protection/kernel-dma-protection-for-thunderbolt
> 
> > diff --git a/drivers/pci/pci-acpi.c b/drivers/pci/pci-acpi.c
> > index 1150f2fbabf41..5971ffc2a375a 100644
> > --- a/drivers/pci/pci-acpi.c
> > +++ b/drivers/pci/pci-acpi.c
> > @@ -1427,12 +1427,34 @@ static void pci_acpi_set_external_facing(struct pci_dev *dev)
> >  		dev->external_facing = 1;
> >  }
> >  
> > +static int pci_dev_has_dma_property(struct pci_dev *dev)
> > +{
> > +	struct acpi_device *adev;
> > +	const union acpi_object *obj;
> > +
> > +	adev = ACPI_COMPANION(&dev->dev);
> > +	if (!adev)
> > +		return 0;
> > +
> > +	/*
> > +	 * Property used by Microsoft Windows to enforce IOMMU DMA
> > +	 * protection from any device, that the system may not fully trust;
> > +	 * we'll honour it the same way.
> > +	 */
> > +	if (!acpi_dev_get_property(adev, "DmaProperty", ACPI_TYPE_INTEGER,
> > +				   &obj) && obj->integer.value == 1)
> > +		return 1;
> > +
> > +	return 0;
> > +}
> > +
> >  void pci_acpi_setup(struct device *dev, struct acpi_device *adev)
> >  {
> >  	struct pci_dev *pci_dev = to_pci_dev(dev);
> >  
> >  	pci_acpi_optimize_delay(pci_dev, adev->handle);
> >  	pci_acpi_set_external_facing(pci_dev);
> > +	pci_dev->untrusted |= pci_dev_has_dma_property(pci_dev);
> 
> [Severity: Medium]
> Should platform_optin_force_iommu() also check for devices marked via
> DmaProperty?
> 
> In drivers/iommu/intel/iommu.c, platform_optin_force_iommu() only checks
> has_external_pci(), which tests pdev->external_facing:
> 
> drivers/iommu/intel/iommu.c:has_external_pci() {
> 	...
> 	for_each_pci_dev(pdev)
> 		if (pdev->external_facing) {
> 			pci_dev_put(pdev);
> 			return true;
> 		}
> 	return false;
> }
> 
> On systems with CONFIG_INTEL_IOMMU_DEFAULT_ON=n where firmware sets the
> DMAR platform opt-in flag and marks internal ports or devices with
> DmaProperty instead of ExternalFacingPort, has_external_pci() returns
> false.  platform_optin_force_iommu() then returns early without enabling
> DMAR_FORCE_ON, and intel_iommu_init() disables the IOMMU, leaving those
> devices without DMA remapping protection.

Makes sense to me. As I understand, prior to this patch,
platform_optin_force_iommu() was technically not buggy, since
pdev->untrusted was only set for devices downstream of external-facing
ports; whereas with this patch, internal (e.g. SoC-integrated) devices
may also be marked as untrusted i.e. requiring DMA protection, thus
platform_optin_force_iommu() should check pdev->untrusted along with
checking pdev->external_facing.

Baolu, do you agree?

> [Severity: Medium]
> Do SR-IOV Virtual Functions inherit pci_dev->untrusted when DmaProperty is
> placed directly on an endpoint Physical Function?
> 
> When VFs are created via pci_iov_add_virtfn() -> pci_iov_scan_device() ->
> pci_setup_device(), set_pcie_untrusted() checks pci_upstream_bridge(dev).
> Because pci_upstream_bridge() resolves pci_physfn(dev) first and returns
> the bridge upstream of the PF (or NULL on a root bus) rather than the PF
> itself, and VFs do not share the PF's ACPI companion, virtfn->untrusted
> remains 0.  IOMMU and DMA paths then treat the VFs of an untrusted PF as
> trusted.

Yeah, similarly agree. Looks like pci_iov_add_virtfn() is implicitly
relying on an assumption that pdev->untrusted is *only* true for PFs
downstream of external-facing ports, which happens to be the case
without this patch, but is no longer the case with this patch.

...Although, independently of this series, looks like
set_pcie_untrusted() is completely buggy on non-x86 since v6.13, since
it solely relies on arch_pci_dev_is_removable(). I've just reported that
at https://lore.kernel.org/all/awXXSfrhLHK7TNbp@google.com/
