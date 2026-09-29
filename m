Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.11])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9EED72931DF
	for <sashiko-reviews@lists.linux.dev>; Tue, 29 Sep 2026 04:52:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.11
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790657574; cv=none; b=scFerpJ52unevQ62J6cV3z1ODdjDTjAFu89CLr33p891H4slcK4H82cOTwWgPKDQIzqqUGlmBmH0ouo09c4AkVa4xcj+b9YkoR1FPpKB8LkF+oiLYsIF+hb+kz7l99asyaYorv1XLaq/J61/6Yc3aPEdGOYVnr71Vfrb5Pm6vJM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790657574; c=relaxed/simple;
	bh=2fp2od85mOgG29trnedjFlVlk/StEn9F4v2Bf5U7kxg=;
	h=Message-ID:Date:MIME-Version:From:Subject:To:Cc:References:
	 In-Reply-To:Content-Type; b=ep6khSHDRsD85/UzkNECXZ8gijcbieivLE1CHEiS0gP4yaxHS0uDxok9iajz33KHbvgqLnmRn3dhgMOjABp6m6j4K/wd06Y6G8f08qArTgZNO+U+McXoIU1eUF78dKV1ssZkJW+PeWEFbUajNwWZJs8V2fz5qlbdz82MUPdIgKA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=Intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=LL92kmA+; arc=none smtp.client-ip=192.198.163.11
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=Intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="LL92kmA+"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1790657573; x=1822193573;
  h=message-id:date:mime-version:from:subject:to:cc:
   references:in-reply-to:content-transfer-encoding;
  bh=2fp2od85mOgG29trnedjFlVlk/StEn9F4v2Bf5U7kxg=;
  b=LL92kmA+aoKvnXaoUCILH5j0DS5arpjLa3y6j+d1gAHr4SVhoqTsbaga
   /84vNsIQmXxgg1SVVscSU2HYyALljzYInHVcUPb0lOO7fZpX7dA7l7l9N
   Jau+LNjuaxIcpeQbC8Q3mThYwgHsD6diBTGO4vccGClvgy9eX2hWC3oyz
   RAGf6wnBtD8W8P3Z+GGytxpouzSNqjLzTQJmeBIPVkK4SfIgPaSM/Rrv/
   mtEgLzWdVbXnTAnuF5fwFwMedMpa8qXHRFpMCjmp2Zwl8Xhf0IMsmPHNs
   wxElTbpYrlCwTWQNfzsmGyWjwrfxzz3ZjgAPTxLYIfZNYWz6+yA+VV6xC
   Q==;
X-CSE-ConnectionGUID: ZrrJv+wUTruFcYeLW5rFDQ==
X-CSE-MsgGUID: qCUvepeVRZ20+DlYdTrexg==
X-IronPort-AV: E=McAfee;i="6800,10657,11919"; a="101937227"
X-IronPort-AV: E=Sophos;i="6.27,129,1787036400"; 
   d="scan'208";a="101937227"
Received: from fmviesa005.fm.intel.com ([10.60.135.145])
  by fmvoesa105.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 28 Sep 2026 21:52:52 -0700
X-CSE-ConnectionGUID: vWgnRSQXRMOHqO7tMtMIIQ==
X-CSE-MsgGUID: OeD0c+NRR/yBi8+vsZZgDw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,129,1787036400"; 
   d="scan'208";a="283337930"
Received: from dbhadane-mobl1.gar.corp.intel.com (HELO [10.66.117.203]) ([10.66.117.203])
  by fmviesa005-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 28 Sep 2026 21:52:51 -0700
Message-ID: <77862b03-640a-49e3-a7a7-82cddb106b05@Intel.com>
Date: Tue, 29 Sep 2026 10:22:49 +0530
Precedence: bulk
X-Mailing-List: sashiko-reviews@lists.linux.dev
List-Id: <sashiko-reviews.lists.linux.dev>
List-Subscribe: <mailto:sashiko-reviews+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:sashiko-reviews+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
From: Dnyaneshwar Bhadane <dnyaneshwar.bhadane@Intel.com>
Subject: Re: [PATCH v4 10/12] drm/xe/lmtt: Report invalidation errors using
 structured xe_log API
To: sashiko-reviews@lists.linux.dev
Cc: intel-xe@lists.freedesktop.org
References: <20260928092114.1610203-1-dnyaneshwar.bhadane@intel.com>
 <20260928092114.1610203-11-dnyaneshwar.bhadane@intel.com>
 <20260928093659.4A08F1F000FF@smtp.kernel.org>
Content-Language: en-US
Organization: intel
In-Reply-To: <20260928093659.4A08F1F000FF@smtp.kernel.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit



On 28-Sep-26 3:06 PM, sashiko-bot@kernel.org wrote:
> Thank you for your contribution! Sashiko AI review found 1 potential issue(s) to consider:
> - [Low] xe_lmtt: missing newline in xe_log_err format string
> --
> 
> commit d8b97ea5041b192b44dac80a8e9209e9058d6519
> Author: Dnyaneshwar Bhadane <dnyaneshwar.bhadane@intel.com>
> 
> drm/xe/lmtt: Report invalidation errors using structured xe_log API
> 
> This commit replaces xe_tile_sriov_err() with xe_log_err() using the LMTT
> component tag for LMTT and MERT invalidation failures. It preserves the
> SR-IOV prefix in the newly structured log messages.
> 
>> diff --git a/drivers/gpu/drm/xe/xe_lmtt.c b/drivers/gpu/drm/xe/xe_lmtt.c
>> index 0c726eda93906..fe77b3ec06807 100644
>> --- a/drivers/gpu/drm/xe/xe_lmtt.c
>> +++ b/drivers/gpu/drm/xe/xe_lmtt.c
> 
> [ ... ]
> 
>> @@ -302,14 +303,15 @@ void xe_lmtt_invalidate_hw(struct xe_lmtt *lmtt)
>>   
>>   	err = lmtt_invalidate_hw(lmtt);
>>   	if (err)
>> -		xe_tile_sriov_err(tile, "LMTT invalidation failed (%pe)",
>> -				  ERR_PTR(err));
>> +		xe_log_err(tile, LMTT, err, "%s invalidation failed.",
>> +			   xe_sriov_printk_prefix(xe));
> 
> [Severity: Low]
> Does this format string need a trailing newline?
> 
> Without a trailing '\n' in xe_log_err(), the kernel printk system might leave
> the log line unterminated, potentially causing subsequent logs to be
> concatenated to this line.
Noted,I will update in the next patch.
>>   	if (xe_device_has_mert(xe) && xe_tile_is_root(tile)) {
>>   		err = xe_mert_invalidate_lmtt(xe);
>>   		if (err)
>> -			xe_tile_sriov_err(tile, "MERT LMTT invalidation failed (%pe)",
>> -					  ERR_PTR(err));
>> +			xe_log_err(tile, LMTT, err,
>> +				   "%s MERT invalidation failed.\n",
>> +				   xe_sriov_printk_prefix(xe));
>>   	}
>>   }
> 

