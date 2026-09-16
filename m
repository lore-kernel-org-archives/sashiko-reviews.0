Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.9])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E2EDE451981
	for <sashiko-reviews@lists.linux.dev>; Wed, 16 Sep 2026 08:37:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.9
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789547827; cv=none; b=DGgdOSNClPv0YlFrvNvJX4fMyIZ9MmQfVWt1NU4LGCN75gP+RF0rXcLr7+72VZO9Gv04EwhDsLElF443Gk4QJ4iyFz4sp/+uOO1/AJXTVlkY7SFPUzZ0qdlEtxr9BVANRq3U1Bf+tce0cgvaOnnPClyuKlx4SvQVMEeUqs5SyCw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789547827; c=relaxed/simple;
	bh=nzqpSFJdhBT24epR0tIx+DeqgtVd9AwjcY+bt0Kjxcw=;
	h=Message-ID:Date:MIME-Version:Cc:Subject:To:References:From:
	 In-Reply-To:Content-Type; b=sEk7vozp56SPIx1rjVSa4ttIc1PpiaBDUd61YEhiyyfxOdSevEFrvzGwAzEnIruL0vY1bE8PDnUCVwX1p9CtBaYQNY3j0RBaZs5YxEAMCymuSgttggIcY2o8CqPojI9f31iINdA6pHDLnOASeuEEZY2FcgAwSiJwbqpIStiXmGI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=pass smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=btxkVMvl; arc=none smtp.client-ip=192.198.163.9
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="btxkVMvl"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1789547826; x=1821083826;
  h=message-id:date:mime-version:cc:subject:to:references:
   from:in-reply-to:content-transfer-encoding;
  bh=nzqpSFJdhBT24epR0tIx+DeqgtVd9AwjcY+bt0Kjxcw=;
  b=btxkVMvl/pdBElu0NmI3dB8frxyQViN8AkmYTeduCXdKC+QKH9mMy6nT
   rqfeFbviZ/hVRQmUiPXHXqHkPeUJENsSx1fH9vqquh+XQlty8sRO98KjS
   E+5wUkV90cV1LwBv1hPhMFs0Nwb8c31bqAyPmlGC1j3ZXh/kiNuJZyvmJ
   vUaAfdac60V2YmZ6Wy/DGTwNKrAqK65k10MONXYVCQEGZk98zzWec+FCd
   26fW1qCj1wbyK2Y1m54LIybUYdVw9vErFUVRD7FZ5sAWNZKC2l8fnu3nK
   Lc/Q5is/wPm7gkGHzY/OrbW+9OzHQc65VjN/4VZwdI82fvQHuKiz/bFA+
   w==;
X-CSE-ConnectionGUID: JITOXW3LSCuK8CZd+7X3bQ==
X-CSE-MsgGUID: XXJm/phPRwOTAO1NHI59qA==
X-IronPort-AV: E=McAfee;i="6800,10657,11905"; a="100583890"
X-IronPort-AV: E=Sophos;i="6.27,103,1787036400"; 
   d="scan'208";a="100583890"
Received: from fmviesa007.fm.intel.com ([10.60.135.147])
  by fmvoesa103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 16 Sep 2026 01:37:05 -0700
X-CSE-ConnectionGUID: 7HZFttlaSlePItWGmROmyw==
X-CSE-MsgGUID: gDklz5Q9TYG35AumczGwCA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,103,1787036400"; 
   d="scan'208";a="269997320"
Received: from unknown (HELO [10.238.1.188]) ([10.238.1.188])
  by fmviesa007-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 16 Sep 2026 01:37:04 -0700
Message-ID: <5fae68ba-1fcc-4817-8ed3-3f724a9f807d@linux.intel.com>
Date: Wed, 16 Sep 2026 16:37:02 +0800
Precedence: bulk
X-Mailing-List: sashiko-reviews@lists.linux.dev
List-Id: <sashiko-reviews.lists.linux.dev>
List-Subscribe: <mailto:sashiko-reviews+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:sashiko-reviews+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Cc: baolu.lu@linux.intel.com, kvm@vger.kernel.org
Subject: Re: [PATCH 4/5] iommu/vt-d: Add helpers to set up and tear down TDX
 extensions
To: sashiko-reviews@lists.linux.dev
References: <20260915074235.1219183-1-baolu.lu@linux.intel.com>
 <20260915074235.1219183-5-baolu.lu@linux.intel.com>
 <20260915080449.D960B1F000FF@smtp.kernel.org>
Content-Language: en-US
From: Baolu Lu <baolu.lu@linux.intel.com>
In-Reply-To: <20260915080449.D960B1F000FF@smtp.kernel.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 9/15/2026 4:04 PM, sashiko-bot@kernel.org wrote:
> Thank you for your contribution! Sashiko AI review found 1 potential issue(s) to consider:
> - [Low] iommu: bounds check uses PAGE_SIZE while allocation uses SZ_4K
> --
> 
> commit 4edc662d667d9a3f034b902dc510d5238c7c24a5
> Author: Lu Baolu<baolu.lu@linux.intel.com>
> 
> iommu/vt-d: Add helpers to set up and tear down TDX extensions
> 
> This commit implements per-IOMMU TDX Connect bring-up and tear-down helpers.
> It allocates and populates the IOMMU_MT parameter layout required by
> TDH.IOMMU.SETUP, and handles initialization completion and rollback.
> 
>> diff --git a/drivers/iommu/intel/tdxc.c b/drivers/iommu/intel/tdxc.c
>> index 559c752a15273..b5dfdeeb23dba 100644
>> --- a/drivers/iommu/intel/tdxc.c
>> +++ b/drivers/iommu/intel/tdxc.c
> [ ... ]
> 
>> +static struct tdxc_pages *tdxc_alloc_mt_pages(struct intel_iommu *iommu,
>> +					      unsigned int nr_mt_pages)
>> +{
>> +	unsigned int nr_entries = nr_mt_pages + IQ_BUFFERS_NUM;
>> +	struct tdxc_pages *array;
>> +
>> +	if (!nr_mt_pages || nr_mt_pages > (PAGE_SIZE / sizeof(u64) - IQ_BUFFERS_NUM))
> [Severity: Low]
> Does this bounds check use the wrong size macro? It restricts nr_mt_pages
> based on PAGE_SIZE, but the corresponding root array allocation below is
> hardcoded to SZ_4K. Should this check use SZ_4K to match the allocation size?

I'll use SZ_4K instead of PAGE_SIZE here. The size is fixed at 4KB by
the TDX module ABI, so it should not be expressed in terms of the host
page size, even though this file is x86-only and PAGE_SIZE == SZ_4K
unconditionally. No functional change.

Thanks,
baolu
