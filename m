Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.11])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3B7D954EECB
	for <sashiko-reviews@lists.linux.dev>; Tue,  8 Sep 2026 14:21:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.11
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788877297; cv=none; b=QxHGghONsr71CaWhQhHmciENdxEmmRvJI84EdP2RH0CAY+nrifyH35dlqDYWVVxaEbwy8p7vTbAWaFC+LSfW3SaqKKBkiiM8BQXxlBi7a3q0ihGFzXBfjndnEa7UuojaXbf55js0A4ESwj+PMAxZiG1yGp49XaEiSyARXAdRTi0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788877297; c=relaxed/simple;
	bh=mB/XhwkwJLA6+3AyhNOyImgvzOpeqPa3jvKuimpVrcw=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=kDrUK1MzP+5RE0tJAQ6EB8fsQtkb4h/2/uSZlNh7U6i6KZksOWhL2sgk+IfaSeRLF/nmQ0EfLn+Rl5WirgfQtBubLHtatf0tOOXryL9A3udAnfopmLovb8FX8/K3UNaFdf39n5tmcNGUQCxhInRvKAVoaa/YQNRaac56IPq1Ris=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=DaXvzG75; arc=none smtp.client-ip=192.198.163.11
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="DaXvzG75"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1788877290; x=1820413290;
  h=message-id:date:mime-version:subject:to:cc:references:
   from:in-reply-to:content-transfer-encoding;
  bh=mB/XhwkwJLA6+3AyhNOyImgvzOpeqPa3jvKuimpVrcw=;
  b=DaXvzG75Xe20lhgoizRxjFyHVQhybn7nRdOmgHJxomkIRIVdQ8+2vV0C
   x4yg6XvnOgG1i8byid52CaZDHB2wylHWegqX2ZaVg1O80h1kKN06tD1nT
   pXA5VEvH1LXuuG33c7anUuIXO0AxTZggVkkIkMW8TUdok3mdqoZyAb09x
   Smg/I3qH2tx8Yz+3fH6jiuda+AEFBHMj3QzCKIjLJiHE9DFog00DX9cyt
   Hxb+mDD3yRxVVVdb9cFKismJPb+VqHn7dWVf1qmMZwgUOz8uToo14HWtY
   mitNEiFYijylgTfsRM7iD0k1SEvLDjHzkMhSXHgUAECRHeeYEmXKpEhav
   g==;
X-CSE-ConnectionGUID: VvicpHP6Q6O0Ro1Jy872pQ==
X-CSE-MsgGUID: qmkQ1kxiRH6oPTG/Z8P1tw==
X-IronPort-AV: E=McAfee;i="6800,10657,11899"; a="99873728"
X-IronPort-AV: E=Sophos;i="6.25,269,1779174000"; 
   d="scan'208";a="99873728"
Received: from fmviesa006.fm.intel.com ([10.60.135.146])
  by fmvoesa105.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 08 Sep 2026 07:21:13 -0700
X-CSE-ConnectionGUID: Tkl/mJqISJG5v9+Hs7LlIw==
X-CSE-MsgGUID: RwYKX+fITHWwdhe8UK/6RA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.25,269,1779174000"; 
   d="scan'208";a="266694082"
Received: from rvuia-mobl.ger.corp.intel.com (HELO [10.245.244.158]) ([10.245.244.158])
  by fmviesa006-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 08 Sep 2026 07:21:12 -0700
Message-ID: <f8ca23eb-193a-4c12-8d5b-be943fa820bc@intel.com>
Date: Tue, 8 Sep 2026 15:21:10 +0100
Precedence: bulk
X-Mailing-List: sashiko-reviews@lists.linux.dev
List-Id: <sashiko-reviews.lists.linux.dev>
List-Subscribe: <mailto:sashiko-reviews+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:sashiko-reviews+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v4 8/8] drm/xe: convert PCI barrier mmap to use
 xe_mmio_gem
To: sashiko-reviews@lists.linux.dev
Cc: intel-xe@lists.freedesktop.org
References: <20260908134955.1344429-10-matthew.auld@intel.com>
 <20260908134955.1344429-18-matthew.auld@intel.com>
 <20260908140939.CD9811F00A3A@smtp.kernel.org>
Content-Language: en-GB
From: Matthew Auld <matthew.auld@intel.com>
In-Reply-To: <20260908140939.CD9811F00A3A@smtp.kernel.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 08/09/2026 15:09, sashiko-bot@kernel.org wrote:
> Thank you for your contribution! Sashiko AI review found 1 potential issue(s) to consider:
> - [High] The migration of the PCI barrier mmap to use `xe_mmio_gem` removed the `VM_READ` restriction, allowing userspace to map and read from the doorbell register.
> --
> 
> commit 545a53278606e03a94bbfc5ae72975b8ad8c6cae
> Author: Matthew Auld <matthew.auld@intel.com>
> 
> drm/xe: convert PCI barrier mmap to use xe_mmio_gem
> 
> This commit converts the PCI barrier mmap over to use xe_mmio_gem, simplifying
> the codebase and replacing the hard coded fake offset design. It introduces the
> first user of xe_mmio_gem for mapping the PCIe doorbell register.
> 
>> diff --git a/drivers/gpu/drm/xe/xe_device.c b/drivers/gpu/drm/xe/xe_device.c
>> --- a/drivers/gpu/drm/xe/xe_device.c
>> +++ b/drivers/gpu/drm/xe/xe_device.c
> [ ... ]
>> -static int xe_pci_barrier_mmap(struct file *filp,
>> -			       struct vm_area_struct *vma)
>> -{
> [ ... ]
>> -	if (vma->vm_flags & (VM_READ | VM_EXEC))
>> -		return -EINVAL;
>> -
>> -	vm_flags_clear(vma, VM_MAYREAD | VM_MAYEXEC);
> 
> [Severity: High]
> Does removing this VM_READ restriction allow userspace to map the PCIe
> doorbell register with read permissions?
> 
> The original xe_pci_barrier_mmap implementation explicitly restricted mappings
> to write-only by rejecting VM_READ and clearing VM_MAYREAD. By migrating to
> the generic xe_mmio_gem_mmap implementation in xe_mmio_gem.c, this read
> restriction is dropped, as the generic code only restricts VM_EXEC:
> 
> drivers/gpu/drm/xe/xe_mmio_gem.c:xe_mmio_gem_mmap() {
>          if (vma->vm_flags & VM_EXEC)
>                  return -EINVAL;
> 
>          vma->vm_page_prot = pgprot_noncached(vma_get_page_prot(vma));
>          vm_flags_mod(vma, VM_IO | VM_PFNMAP | VM_DONTEXPAND | VM_DONTDUMP |
>                       VM_NORESERVE, VM_MAYEXEC);
> }
> 
> Reading from write-only PCIe doorbell registers can trigger an Unsupported
> Request or PCIe completion timeout, resulting in a Machine Check Exception
> and a full system hang. Because this mapping is accessible to unprivileged
> userspace, could this introduce a denial of service vulnerability?

I think you could anyway do that with write + fault and then do a read 
to get past it. At least on x86 where there is no 
write-only/read-disable bit in the PTE. So no way to actually prevent 
it. Also, for upcoming usecase I want read support for mmio_gem, so 
figured just drop this so I don't have to special case it later.

> 

