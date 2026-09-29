Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.11])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CC2312931DF
	for <sashiko-reviews@lists.linux.dev>; Tue, 29 Sep 2026 04:52:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.11
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790657537; cv=none; b=VhZJgg8esvFz62iE8WUIanfcPzDqW91ZF5hN0y7f4XvP1yPJYbLCan4+zoIevrI0AaJKJOIfATC2GNBLZ6bdjc402WVxDtneVNDuiIHt3rjxyzY8ulg964JDyyuUCItRxSqdltfrxMiCcqSUDa3UnyR9643B/5ka72MkntGcmUY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790657537; c=relaxed/simple;
	bh=PwMLk34qWKagabLQ9+IIQQeqb+RvhTZ+cbxDzXd1sJQ=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=G3N3RS9+tOOsoPpLsXQMMS7B+p2SOo5PD4O76D4nx9pWe7Uv6MNReWgTjgWSFJk9we/9s4gk2J7b0sbpBSClvckLHMAAtUXE4DKZWBquX+UHrmJuRkajGxLalwANl2e5nZkVFEfzWahDoH+6tQ2GO/NymQYbN16yEP9ZmCqB3Ng=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=Intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=au39UJuT; arc=none smtp.client-ip=192.198.163.11
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=Intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="au39UJuT"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1790657534; x=1822193534;
  h=message-id:date:mime-version:subject:to:cc:references:
   from:in-reply-to:content-transfer-encoding;
  bh=PwMLk34qWKagabLQ9+IIQQeqb+RvhTZ+cbxDzXd1sJQ=;
  b=au39UJuTQ1igdRH8sV8rHZWZ+xMuPu5w8t7Fc8g+2BCuUkrZQtAAFmNM
   9Rfse+GFTlpgU7+OkWvpIQOVQkH7TqqQ03vUgtd40WdReLNiWidx65KWK
   kLWMhrl4/MHEC2R290G5ZAYN245GoC/WxgDNN5eUF/9vBdjpwexuunMUO
   lz6n6wLlxUCteeN9E2UyCUbq7g+dvuBRQBEqqyyqcB4ilt8daVDE1HP+F
   /e+BlxJOUwRXmfnqGTOw3Gu1IAstACNpD/TneaSaHo3F+LjfZOxBwR+Hz
   I8pZNJ9tXWNPcEZFBs9496/f45h483FoVntjLhNBHZT8L7QVfjum0R+Aw
   A==;
X-CSE-ConnectionGUID: TAcO2V9sSf67XK6Mbmj2zw==
X-CSE-MsgGUID: 2reBfIb4Q8GxldY3INus7w==
X-IronPort-AV: E=McAfee;i="6800,10657,11919"; a="101937203"
X-IronPort-AV: E=Sophos;i="6.27,129,1787036400"; 
   d="scan'208";a="101937203"
Received: from fmviesa005.fm.intel.com ([10.60.135.145])
  by fmvoesa105.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 28 Sep 2026 21:52:13 -0700
X-CSE-ConnectionGUID: yWVVWPZfSPevUUmgTLwwJA==
X-CSE-MsgGUID: WxjIjcQjSZqNdgqo9fpRdQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,129,1787036400"; 
   d="scan'208";a="283337842"
Received: from dbhadane-mobl1.gar.corp.intel.com (HELO [10.66.117.203]) ([10.66.117.203])
  by fmviesa005-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 28 Sep 2026 21:52:12 -0700
Message-ID: <6a2bca71-3ad5-4d0f-98b0-9b90b03a8130@Intel.com>
Date: Tue, 29 Sep 2026 10:21:50 +0530
Precedence: bulk
X-Mailing-List: sashiko-reviews@lists.linux.dev
List-Id: <sashiko-reviews.lists.linux.dev>
List-Subscribe: <mailto:sashiko-reviews+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:sashiko-reviews+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v4 10/12] drm/xe/lmtt: Report invalidation errors using
 structured xe_log API
To: sashiko-reviews@lists.linux.dev
Cc: intel-xe@lists.freedesktop.org
References: <20260928092114.1610203-1-dnyaneshwar.bhadane@intel.com>
 <20260928092114.1610203-11-dnyaneshwar.bhadane@intel.com>
 <20260928093659.4A08F1F000FF@smtp.kernel.org>
Content-Language: en-US
From: Dnyaneshwar Bhadane <dnyaneshwar.bhadane@Intel.com>
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
Noted,I will update in the next patch. >
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

