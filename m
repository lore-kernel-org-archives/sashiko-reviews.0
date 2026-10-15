Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.15])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 46ABD50B417
	for <sashiko-reviews@lists.linux.dev>; Thu, 15 Oct 2026 10:17:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.15
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1792059423; cv=none; b=ke6bT3d52nHAGAYEEbozM/m9LU1otN00JfSsZ4PaCN5GJQutnPXGcP9oXuw9QdukEm0Xf/riahLfjK71V6B6XLZJuZlDDtk7OhdSdhNMkOSNDXsTaP7150ocHGqXHWJ4ool5DWHc5E/KauMQ+BKGX52W7JPASttrgCLZKzdWiPI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1792059423; c=relaxed/simple;
	bh=vyj4agNJiZRxkAKpl5feqeUyiBH/nIfLCcYra2ER/xY=;
	h=Message-ID:Date:MIME-Version:Subject:To:References:From:
	 In-Reply-To:Content-Type; b=YyjQ0YJ7Z0qZ6YlujD28ulPCWkrv+4HDzgoXDByCXQmK6H7nt9/vPD8A6OosrFwnvlt3C0oWgwVPCNZuVRi1V1ck+uD9RDISuTpWhST8pGBXbak4qWkHD8haeTQWoLsCIpZAvAZh+7Wx05+u2HYWv+ASMhZc1QqFTSfwRBZIHEw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=LYte268Q; arc=none smtp.client-ip=198.175.65.15
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="LYte268Q"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1792059422; x=1823595422;
  h=message-id:date:mime-version:subject:to:references:from:
   in-reply-to:content-transfer-encoding;
  bh=vyj4agNJiZRxkAKpl5feqeUyiBH/nIfLCcYra2ER/xY=;
  b=LYte268Qhzrbe9z/m7Ouort+4OD1L9Z8GFiKtSCjQKpnmr8RAEqwHj/R
   mWXvJGgu8a+5H+UPCNPc9vP7Fziu5GBWXboXMnFk4qA3Gs+3avqhuP8gs
   PENlcJi+aGHB7ZggooalB09Xi0OUoW9hnViXWQvCKGSuBNCu2LPAMnZYT
   C23MT75wbJkCiLPBIy7VF0jwuZ7dkQWnTJVjklCcxAoauumxUHZhqNb/l
   WzEg7u5eSI1nDi6VZoQ8ebAcXysdVdEn21e3EUACCdUWp44BDEtSm3ZIF
   GCWifR4xihHbeWBQG1efENb2tWozvWFhKXBXb8wl6tMkbt4RTamay+OXp
   w==;
X-CSE-ConnectionGUID: fX62BMyoRVyFlvvtu/leMA==
X-CSE-MsgGUID: 4+/NiukqQTCS0ZsBcj2IGg==
X-IronPort-AV: E=McAfee;i="6800,10657,11935"; a="819849"
X-IronPort-AV: E=Sophos;i="6.27,159,1787036400"; 
   d="scan'208";a="819849"
Received: from fmviesa009.fm.intel.com ([10.60.135.149])
  by orvoesa107.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 15 Oct 2026 03:17:01 -0700
X-CSE-ConnectionGUID: SPqsP8wARDSM8ZrKS7jj1g==
X-CSE-MsgGUID: Nk6m9gnyTu6piARMeYrLsQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,159,1787036400"; 
   d="scan'208";a="2015682"
Received: from abityuts-desk1.ger.corp.intel.com (HELO [10.245.244.143]) ([10.245.244.143])
  by smtpauth.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 15 Oct 2026 03:17:00 -0700
Message-ID: <e9796636-3272-440f-9050-fb10a5fa29de@intel.com>
Date: Thu, 15 Oct 2026 11:16:57 +0100
Precedence: bulk
X-Mailing-List: sashiko-reviews@lists.linux.dev
List-Id: <sashiko-reviews.lists.linux.dev>
List-Subscribe: <mailto:sashiko-reviews+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:sashiko-reviews+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 2/2] drm/xe: revamp hw reserved PAT index checking
To: sashiko-reviews@lists.linux.dev, intel-xe@lists.freedesktop.org
References: <20261015095516.403932-4-matthew.auld@intel.com>
 <20261015095516.403932-6-matthew.auld@intel.com>
 <sashiko-outbox-172627@kernel.org>
Content-Language: en-GB
From: Matthew Auld <matthew.auld@intel.com>
In-Reply-To: <sashiko-outbox-172627@kernel.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 15/10/2026 11:05, sashiko-bot@kernel.org wrote:
> Thank you for your contribution! Sashiko AI review found 1 potential issue(s) to consider:
> - [Low] drm/xe: missing array_index_nospec for pat_index
> --
> 
> commit c33d7dbef37f797548fdacd3eb5da040ca907442
> Author: Matthew Auld <matthew.auld@intel.com>
> 
> drm/xe: revamp hw reserved PAT index checking
> 
> This commit replaces indirect checks of valid PAT indices with a direct
> check of pat.valid. It also adds additional WARN_ON checks to ensure
> coherency modes are valid.
> 
>> diff --git a/drivers/gpu/drm/xe/xe_pat.c b/drivers/gpu/drm/xe/xe_pat.c
>> index 18e26f04169ab..d0dac1ebd4784 100644
>> --- a/drivers/gpu/drm/xe/xe_pat.c
>> +++ b/drivers/gpu/drm/xe/xe_pat.c
> [ ... ]
>>   u16 xe_pat_index_get_coh_mode(struct xe_device *xe, u16 pat_index)
>>   {
>>   	WARN_ON(pat_index >= xe->pat.n_entries);
>> +	WARN_ON(!xe->pat.table[pat_index].coh_mode ||
>> +		xe->pat.table[pat_index].coh_mode > XE_COH_2WAY);
>>   	return xe->pat.table[pat_index].coh_mode;
>>   }
> 
> [Severity: Low]
> Does this code leak information via a Spectre v1 side channel?
> 
> When handling the MADVISE ioctl with DRM_XE_MEM_RANGE_ATTR_PAT, the raw
> user input args->pat_index.val is passed into check_pat_args_are_sane()
> without being clamped by array_index_nospec():
> 
> xe_vm_madvise_ioctl()
>    check_pat_args_are_sane(xe, &madvise_range, args->pat_index.val)
>      xe_pat_index_get_coh_mode(xe, pat_index)
> 
> Under speculative execution, a user-controlled, out-of-bounds pat_index
> could bypass the earlier bounds check in madvise_args_are_sane(). This
> would cause xe_pat_index_get_coh_mode() to read out-of-bounds memory
> when indexing xe->pat.table[pat_index]. The resulting coh_mode is then
> used in branch conditions in check_pat_args_are_sane(), creating a
> potential side channel.
> 
> Could args->pat_index.val be clamped with array_index_nospec() before
> being passed to check_pat_args_are_sane(), or could the already-clamped
> pat_index local variable be reused in xe_vm_madvise_ioctl()?

Fair, but I would view this as more of a pre-existing issue.

> 

