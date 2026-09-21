Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.4])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EF7EB4AEBD0
	for <sashiko-reviews@lists.linux.dev>; Mon, 21 Sep 2026 14:51:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.4
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790002269; cv=none; b=g6eDEr7nnvK/bTSjP27TF0Gg8YCTX2wqcmQAGWkAtvWFZhNRPaB5/vXRbxEg3fRMMq+dI6JQexN5G9zSo4+kLd87Yc/JwLbo+2HJ9nTxhVd3JftCEkUyETOzBfwuZQsgQwRHX9Vla9XjfrAFQsrgMXf2F/ZUqHvlKa2VLDznPZw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790002269; c=relaxed/simple;
	bh=dZEwI7g4dYES7aErZZpGKM/HppoAmrsp+BlvEEDOJ7k=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=X3XwHM5bqs87Ttt6P8P4Z/SvCzPOCsHZLUIxm80RR293xqFW7Z+jPzWNDvSU8dagpLYXxJsOCXb27ik4V3+UT4ZAPfuOPcXF+VM818++4bf0WOQaGmtn/Kzdm0T4UmF+RgbxaN//jW22exY48sAe2DvWo2Ea4cBWugHXJqDr6as=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=pass smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=B9wgEk6U; arc=none smtp.client-ip=192.198.163.4
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="B9wgEk6U"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1790002268; x=1821538268;
  h=message-id:date:mime-version:subject:to:cc:references:
   from:in-reply-to:content-transfer-encoding;
  bh=dZEwI7g4dYES7aErZZpGKM/HppoAmrsp+BlvEEDOJ7k=;
  b=B9wgEk6UQrdlQN9DrGjJcbKKcPexr7CpGdKuZNYKH0USjTBN4m+aGSTj
   TTrprUbLX5SIEhSUmGEoDV9w7XUGZ7giwMjD86lehodLW1QJf/CbyNeJp
   yGvUsSF/3meveN8ibruxxaHYigJHQ27qVjtfwwzY8wqs/HKD9La8oVY5H
   hCUrP1MuzAZ3fNcm+bZ1ZafXjkDzxZo6HVmB9OhdeON9HiUs/1hUzDh+q
   TTh80wCqhFuMtqQhoJFjBC4le/4gqFu419mN/xKYlyCuBbQKvIPtTT216
   og+oRBcigx2Ak0Z/FfwvcVKCb+qJ3bEQYSuyDYJ/kMqct6WafrfUsXa0F
   A==;
X-CSE-ConnectionGUID: UdGf1FHOQmmThPEIFzVywg==
X-CSE-MsgGUID: vwLfjkHjQuCx4c0liDZCGA==
X-IronPort-AV: E=McAfee;i="6800,10657,11912"; a="1022996"
X-IronPort-AV: E=Sophos;i="6.27,114,1787036400"; 
   d="scan'208";a="1022996"
Received: from fmviesa011.fm.intel.com ([10.60.135.151])
  by fmvoesa114.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 21 Sep 2026 07:50:18 -0700
X-CSE-ConnectionGUID: FXg7ZlbpSJehyE9nPrXfHQ==
X-CSE-MsgGUID: 7AC8FencRbitjVrOOKL8OA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,114,1787036400"; 
   d="scan'208";a="3727613"
Received: from slopesdx-mobl.gar.corp.intel.com (HELO [10.246.16.95]) ([10.246.16.95])
  by smtpauth.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 21 Sep 2026 07:50:17 -0700
Message-ID: <e4754250-8d0f-45db-982a-cc0b64c0aa47@linux.intel.com>
Date: Mon, 21 Sep 2026 16:50:13 +0200
Precedence: bulk
X-Mailing-List: sashiko-reviews@lists.linux.dev
List-Id: <sashiko-reviews.lists.linux.dev>
List-Subscribe: <mailto:sashiko-reviews+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:sashiko-reviews+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2] accel/ivpu: Use separate flag for job timeout
To: sashiko-reviews@lists.linux.dev
Cc: dri-devel@lists.freedesktop.org
References: <20260914084301.894028-1-karol.wachowski@linux.intel.com>
 <20260914085805.09BF61F000FF@smtp.kernel.org>
Content-Language: en-US
From: "Wachowski, Karol" <karol.wachowski@linux.intel.com>
In-Reply-To: <20260914085805.09BF61F000FF@smtp.kernel.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 14-Sep-26 10:58, sashiko-bot@kernel.org wrote:
> Thank you for your contribution! Sashiko AI review found 1 potential issue(s) to consider:
> 
> Pre-existing issues:
> - [High] Lockless `xa_load` without RCU read lock and RCU-deferred freeing leads to a potential Use-After-Free of `file_priv`.
> --
> 
> commit 267f0542c58f023dad2c373ec173ea2fa96d1b24
> Author: Jakub Pawlak <jakub.pawlak@intel.com>
> 
> accel/ivpu: Use separate flag for job timeout
>      
> Use separate flag to mark a job timeout as a reason
> of starting context_abort_work. This allows to distinguish
> engine reset reason and clearly adjust reset procedure flow.
> 
>> diff --git a/drivers/accel/ivpu/ivpu_mmu.c b/drivers/accel/ivpu/ivpu_mmu.c
>> index 41efd8985fa67..b2025274f91de 100644
>> --- a/drivers/accel/ivpu/ivpu_mmu.c
>> +++ b/drivers/accel/ivpu/ivpu_mmu.c
> [ ... ]
>> @@ -964,7 +964,6 @@ void ivpu_mmu_irq_evtq_handler(struct ivpu_device *vdev)
>>   		file_priv = xa_load(&vdev->context_xa, ssid);
>>   		if (file_priv) {
>>   			if (!READ_ONCE(file_priv->has_mmu_faults)) {
>> -				atomic_set(&vdev->faults_detected, 1);
>>   				ivpu_mmu_dump_event(vdev, event);
>>   				WRITE_ONCE(file_priv->has_mmu_faults, true);
>>   			}
> 
> [Severity: High]
> This is a pre-existing issue, but is it possible for file_priv to be freed
> concurrently while it is being accessed here?
> 
> xa_load() internally acquires and releases rcu_read_lock(), so the returned
> file_priv pointer is unprotected once xa_load() returns.
> 
> If a userspace application triggers an MMU fault and immediately closes the
> file descriptor, could ivpu_postclose() drop the last reference and invoke
> file_priv_release() before the hardware event queue is processed?
> 
> If file_priv_release() erases the entry from the xarray via xa_erase_irq()
> and frees it synchronously via kfree(), does this lead to a use-after-free
> when ivpu_mmu_irq_evtq_handler() subsequently accesses
> file_priv->has_mmu_faults?
> 

Thanks for the review.

Right, the race is real: xa_load() returns file_priv without
any protection, and the entry can be erased and the object freed before
has_mmu_faults is updated.

However, this is pre-existing and orthogonal to this patch: v2 only
removes atomic_set(&vdev->faults_detected, 1) from that block, so it
neither introduces nor worsens the race.

I will address it in a separate patch, with a proper Fixes: tag and
Cc: stable@vger.kernel.

At the same time I would like to proceed with this patch.

Thanks,
Karol

