Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B6F843E0258
	for <sashiko-reviews@lists.linux.dev>; Mon, 29 Jun 2026 16:39:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.17
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1782751197; cv=none; b=EMeAVTZRhhMuFJEhW45yUwmz+LaLgBj7m4x/FiydrP24/GPvJC3E4B/kybrv969Qc/n2Dn/MC3X7yrVzWNdowtEFpisgzft8y4FVnZXbeogoEXkZh/UKLuoGx1s5rx3Wfl/iprcZm9fBh1bGfbQgUTkbJwUXn6WKenxda6NZn1E=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1782751197; c=relaxed/simple;
	bh=rk+fcp/Nx5n12PENhkJjTIYWeWfMBeypQ+PtPKa/mV8=;
	h=Date:From:To:Cc:Subject:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=jHwHCZNrOXnWVCSnlwWvGn6XXFoHrVlLhaqeLJg/LK4mbZhaN29oMFdgKLecuO1i21ejifsEPub5gKa8NJXuElxdZ6m+JAHY/pYfAkTLagcNwRy1vi72/SSQ4F/g+7lEly6nomEkIP4lAb+bmv/9JlO1PMwewkq4rQXQdzyo7H8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=pass smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=gE7Y3gxk; arc=none smtp.client-ip=198.175.65.17
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="gE7Y3gxk"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1782751193; x=1814287193;
  h=date:from:to:cc:subject:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=rk+fcp/Nx5n12PENhkJjTIYWeWfMBeypQ+PtPKa/mV8=;
  b=gE7Y3gxkvqOL/Fb52pOaREILmxD+N4l3y5A2pic/XePrD4xubTeuHkJw
   l3zsjuPeeTdkjiB2bsmkC6m/0NIeDFBwFsukSldwlKCfzKDfqG3dBy5wu
   LwN0b1C5fAE20LOkCPAMGPng1htjXY6BWOe2CT7JED/R1vU2hgrxx1g32
   yM2NVYZqoaKd++XpZzEz/wp1wA2cMZYf/ZTOi1LC9sJQkyDmacDOCYgFb
   2pD9UWwT0lJ9qxmMXkXd99Hx4IbercuTQYbwZp2hAb4xBjtGJt+b/ekGN
   DEWjjXCoa3c5OHB6zU1s9RpJTZOsAaIEF2Q/3DZHRJt7tWiq1l29q/b1E
   w==;
X-CSE-ConnectionGUID: nnumqJVqQ6eRj6lsIJ6NpQ==
X-CSE-MsgGUID: tJMXPJ+VSB2N4melua35Cg==
X-IronPort-AV: E=McAfee;i="6800,10657,11832"; a="83478493"
X-IronPort-AV: E=Sophos;i="6.24,232,1774335600"; 
   d="scan'208";a="83478493"
Received: from fmviesa009.fm.intel.com ([10.60.135.149])
  by orvoesa109.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 29 Jun 2026 09:39:52 -0700
X-CSE-ConnectionGUID: PgMeUyf4RfmWnnSrBthNQQ==
X-CSE-MsgGUID: npdxnBrIT2O6yPY8N1sqxg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.24,232,1774335600"; 
   d="scan'208";a="245650298"
Received: from patelni-desk.amr.corp.intel.com (HELO localhost) ([10.2.248.44])
  by fmviesa009-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 29 Jun 2026 09:39:51 -0700
Date: Mon, 29 Jun 2026 09:39:50 -0700
From: Nirmal Patel <nirmal.patel@linux.intel.com>
To: sashiko-bot@kernel.org
Cc: sashiko-reviews@lists.linux.dev, linux-pci@vger.kernel.org
Subject: Re: [PATCH v6] PCI: vmd: Add feature to scan BIOS enumerated
 devices.
Message-ID: <20260629093950.00006c85@linux.intel.com>
In-Reply-To: <20260623012058.D9C2C1F000E9@smtp.kernel.org>
References: <20260623011305.134792-1-nirmal.patel@linux.intel.com>
	<20260623012058.D9C2C1F000E9@smtp.kernel.org>
X-Mailer: Claws Mail 4.2.0 (GTK 3.24.41; x86_64-w64-mingw32)
Precedence: bulk
X-Mailing-List: sashiko-reviews@lists.linux.dev
List-Id: <sashiko-reviews.lists.linux.dev>
List-Subscribe: <mailto:sashiko-reviews+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:sashiko-reviews+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit

On Tue, 23 Jun 2026 01:20:58 +0000
sashiko-bot@kernel.org wrote:

> Thank you for your contribution! Sashiko AI review found 1 potential
> issue(s) to consider:
> - [Medium] The IRQ domain and its associated fwnode are permanently
> leaked for devices with VMD_FEAT_USE_BIOS_INFO due to an
> unconditional early return in vmd_remove_irq_domain(). --
> 
> commit 0711c95d550249c54951b1f20ee8a7fe26dafc0b
> Author: Nirmal Patel <nirmal.patel@linux.intel.com>
> 
> PCI: vmd: Add feature to scan BIOS enumerated devices.
> 
> This commit adds support for newer VMD hardware (like device ID
> 0x28c1) by using BIOS-configured shadow registers and bus ranges
> instead of manually configuring them.
> 
> > diff --git a/drivers/pci/controller/vmd.c
> > b/drivers/pci/controller/vmd.c --- a/drivers/pci/controller/vmd.c
> > +++ b/drivers/pci/controller/vmd.c
> > @@ -374,6 +393,9 @@ static void vmd_set_msi_remapping(struct
> > vmd_dev *vmd, bool enable) 
> >  static void vmd_remove_irq_domain(struct vmd_dev *vmd)
> >  {
> > +	if (!!(vmd->features & VMD_FEAT_USE_BIOS_INFO))
> > +		return;
> > +  
> 
> [Severity: Medium]
> Does this early return cause an IRQ domain and fwnode resource leak?
> 
> When a VMD device like 0x28c1 (which has VMD_FEAT_USE_BIOS_INFO) is
> probed, vmd_enable_domain() can conditionally create an IRQ domain if
> running under Xen or if the BIOS-configured shadow registers
> offset[0] or offset[1] are non-zero.
> 
> If the driver is unloaded or fails later in the probe process, this
> return causes the function to exit immediately before calling
> irq_domain_remove() and irq_domain_free_fwnode(). Should the IRQ
> domain teardown still execute even if VMD_FEAT_USE_BIOS_INFO is set?
> 
Fair point. xen can cause irq domain deletion failure. Let me remove
the return statement from vmd_remove_irq_domain.
