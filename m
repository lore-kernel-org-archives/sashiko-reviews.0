Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.8])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 06D6E47044F
	for <sashiko-reviews@lists.linux.dev>; Wed, 16 Sep 2026 08:25:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.8
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789547116; cv=none; b=mv0qDWdMMUdzcRCzYaxf6sorLY54pnqRhYLFHOQm3fOlzdjaAz5laseLzxcNUgZ8ni5uOLstccl2187uay6hAVGEZcudJ97SNPyhvZumwe47UH9zIdsgtlD9z/ci2R01B5KNFoY68ZUhsJqZGQ73/088LPqo1DMCkG9F7UxcbqQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789547116; c=relaxed/simple;
	bh=d2RsgbI3a5vH2k559izKEhziDtSd1rtlwhsHKltYtMw=;
	h=Message-ID:Date:MIME-Version:Cc:Subject:To:References:From:
	 In-Reply-To:Content-Type; b=jCQ0woXuxW/uonvHfHU+EXau5u9oKXpVqMP7oTy3dIO1SEiWS0Jw7YWTqssziy8Yy67M5IagfUMxbMeQ5wsNpm0k9+e2OYt0X8UUE88jVt3P+m9WoEcJDyfS+xdH8nUF2ZJVBKi+nbII5dZ2920vXs7YSZHMoG4tZ4+MPCC1dFc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=pass smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=gS3PRQOt; arc=none smtp.client-ip=192.198.163.8
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="gS3PRQOt"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1789547112; x=1821083112;
  h=message-id:date:mime-version:cc:subject:to:references:
   from:in-reply-to:content-transfer-encoding;
  bh=d2RsgbI3a5vH2k559izKEhziDtSd1rtlwhsHKltYtMw=;
  b=gS3PRQOtiXbQO8rb4EuS40HcY5kkrhNYtA4zpMHlvweL5KivWGvnN6hf
   mjnWzRD4018BAcHY+uanSO0jtAMGFDBXlhyAtOO5KU7geMPQVxTb3jQEy
   hMPhilQVfBajEWMqQ2Kil8hNgfiIUw1d5h1CBE4dzYRY6bgi5sse0CdbS
   uyPmDfFoID+Z2WD3k5GgSKe7AKuSq1sdkTOaRafhv1clUzO9E0WBh3TAl
   X7M0HCv5aUZwe/M7qwaHnPjO1ON3ZWvpFAWlY5ZLZbt1C757gNk5JPoeq
   5WLBLzA2N4GW4HoZeGNtUtPq134jyZoiumDZvDfgL7LDzuUFXxKXqx4vr
   w==;
X-CSE-ConnectionGUID: X6DQjdsBQEq3bgF7KftBZA==
X-CSE-MsgGUID: xYaBnAktTLWy2DAu2/hbtQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11905"; a="107428826"
X-IronPort-AV: E=Sophos;i="6.27,103,1787036400"; 
   d="scan'208";a="107428826"
Received: from orviesa005.jf.intel.com ([10.64.159.145])
  by fmvoesa102.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 16 Sep 2026 01:25:07 -0700
X-CSE-ConnectionGUID: MAqfUoh/SV+P1jVnNL3Vrw==
X-CSE-MsgGUID: qbs5p9jRQoO3QKGVzVoFlw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,103,1787036400"; 
   d="scan'208";a="277389996"
Received: from unknown (HELO [10.238.1.188]) ([10.238.1.188])
  by orviesa005-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 16 Sep 2026 01:25:06 -0700
Message-ID: <01d08be8-94b3-4ba4-9eb5-0928bbe4a499@linux.intel.com>
Date: Wed, 16 Sep 2026 16:25:03 +0800
Precedence: bulk
X-Mailing-List: sashiko-reviews@lists.linux.dev
List-Id: <sashiko-reviews.lists.linux.dev>
List-Subscribe: <mailto:sashiko-reviews+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:sashiko-reviews+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Cc: baolu.lu@linux.intel.com, kvm@vger.kernel.org
Subject: Re: [PATCH 5/5] iommu/vt-d: Reserve MSB of domain ID space for TDX
 module
To: sashiko-reviews@lists.linux.dev
References: <20260915074235.1219183-1-baolu.lu@linux.intel.com>
 <20260915074235.1219183-6-baolu.lu@linux.intel.com>
 <20260915081150.D79E21F000FF@smtp.kernel.org>
Content-Language: en-US
From: Baolu Lu <baolu.lu@linux.intel.com>
In-Reply-To: <20260915081150.D79E21F000FF@smtp.kernel.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit

On 9/15/2026 4:11 PM, sashiko-bot@kernel.org wrote:
> Thank you for your contribution! Sashiko AI review found 1 potential issue(s) to consider:
> - [High] iommu: missing TDX teardown and mt_pages leak on IOMMU hot-remove
> --
> 
> commit 8a16aba70396ddc74c834953ff8123fae8be9bad
> Author: Lu Baolu <baolu.lu@linux.intel.com>
> 
> iommu/vt-d: Reserve MSB of domain ID space for TDX module
> 
> When an Intel IOMMU is enabled for TDX Connect, the VT-d DID namespace
> must be split so the TDX module can use the MSB-tagged half for trusted
> DMA translations, while the host/VMM uses the lower half.
> 
>> diff --git a/drivers/iommu/intel/tdxc.c b/drivers/iommu/intel/tdxc.c
>> index b5dfdeeb23dba..1ca03257d4563 100644
>> --- a/drivers/iommu/intel/tdxc.c
>> +++ b/drivers/iommu/intel/tdxc.c
> [ ... ]
>> @@ -154,17 +159,27 @@ static int intel_iommu_bringup_tdxc(struct intel_iommu *iommu, unsigned int nr_p
>>   		return -EFAULT;
>>   	}
>>   
>> +	/*
>> +	 * Intel TDX Connect Architecture Specification, Section 2.2 Trusted DMA
>> +	 *
>> +	 * When IOMMU is enabled to support TDX Connect, the IOMMU restricts
>> +	 * the VMM’s DID setting, reserving the MSB bit for the TDX module. The
>> +	 * TDX module always sets this reserved bit on the trusted DMA table.
>> +	 */
>> +	iommu->max_domain_id = ndoms >> 1;
>>   	iommu->tdx_iommu_id = tdx_iommu_id;
>>   	iommu->mt_pages = no_free_ptr(iommu_mt);
>>   
>> -	/* Bring-up is not complete yet; report as unsupported for now. */
>> -	return -EOPNOTSUPP;
>> +	pr_info("%s: trusted DMA for TEE/IO initialized\n", iommu->name);
>> +
>> +	return 0;
> 
> [Severity: High]
> With TDX bring-up now successfully completing here, if this IOMMU is later
> hot-removed, does this leak the TDX metadata pages (iommu->mt_pages) and leave
> dangling hardware state in the SEAM firmware?

This path is basically unreachable in practice. No TDX Connect-capable
platform supports DMAR hotplug.

> 
> When ACPI hotplug invokes dmar_iommu_hotplug() with insert=false, the IOMMU
> is destroyed via:
> 
> drivers/iommu/intel/iommu.c:dmar_iommu_hotplug() {
>      ...
> 		disable_dmar_iommu(iommu);
> 		free_dmar_iommu(iommu);
>      ...
> }

I will add the following check for future proofing:

diff --git a/drivers/iommu/intel/iommu.c b/drivers/iommu/intel/iommu.c
index e88457d96b53..16203604b751 100644
--- a/drivers/iommu/intel/iommu.c
+++ b/drivers/iommu/intel/iommu.c
@@ -2202,6 +2202,10 @@ int dmar_iommu_hotplug(struct dmar_drhd_unit 
*dmaru, bool insert)
         if (insert) {
                 ret = intel_iommu_add(dmaru);
         } else {
+#ifdef CONFIG_INTEL_IOMMU_TDX_CONNECT
+               if (iommu->mt_pages)
+                       return -EBUSY;
+#endif
                 disable_dmar_iommu(iommu);
                 free_dmar_iommu(iommu);
         }

> 
> Because this hot-remove path never calls intel_iommu_teardown_tdxc(), it
> appears iommu->mt_pages is leaked and tdh_iommu_clear() is never called before
> the IOMMU structure itself is freed.
> 

Thanks,
baolu
