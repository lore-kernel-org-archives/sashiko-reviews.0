Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 25A463BC696
	for <sashiko-reviews@lists.linux.dev>; Wed,  7 Oct 2026 16:18:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791389883; cv=none; b=S5CpvCcO38VQEg9btl6Bj62If6OfMtaTIjnBEMlUCm9kmcU8nVxGAj1DLMgUopQh13FJ+kkz9NVPup2oYQa3bMxEhAY0MGozpEbgO1iCdPX77pVmVUgTw1Yu8zecblPXgToc6Q2kTJBwH03z/MMCm7TONXDtbG2mRNQAApINznw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791389883; c=relaxed/simple;
	bh=QoUzk8J5g1hjckbO218Bq/04HkLzeJUa0Q5nUI1QfU8=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=LU99GyKEqdggu0E4yuvhomA6IQLsphtvQQZbCQ2XYzKR18NNtT3gfXvMEJ/WnwY+M8mq0oKSy7rVOjmkgEF4oFdHil+0L8Ueo0ec+0gk72kyVYc4Awzi86OEmpAOViL9K6KIT2MIaoU19GEKmJCoGwum/wUdeNCcXrfIeCXAibA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=pass smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=k3A4y0gJ; arc=none smtp.client-ip=192.198.163.18
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="k3A4y0gJ"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1791389882; x=1822925882;
  h=message-id:date:mime-version:subject:to:cc:references:
   from:in-reply-to:content-transfer-encoding;
  bh=QoUzk8J5g1hjckbO218Bq/04HkLzeJUa0Q5nUI1QfU8=;
  b=k3A4y0gJITzoqxMaZvFxll+sBrXlHia3y2c9D5qMOsLsmyVykd58BXIw
   dMmdqoHwuy5NV2NydElOrqqQKrr+m/0BKQtmmMvSXHCu6EpmbB+9yESJy
   oqwa5R6Vld3zrRLlyOWSv+v1AGhZ7sPMFJmsdL7abAfRYTOkfN49ZqFkR
   hIV9qwi0ijNmTwgSzCoutHfETLmn6DoCzzOKNLTqK5b3fiBQ9Rx39aQ/b
   oWjDw6YAUt0lhdg2EZx2VE08yMIa9ZBSmd2cY63DHEfxha5LDjCY2lHcW
   lwwEqPuS3EFDXDiTPbCFqA4Nf4og7lAsmOrzuWVp5XneEOU0Jbp7rDn+W
   g==;
X-CSE-ConnectionGUID: 8IYj40uxRWWo9elda2uGtw==
X-CSE-MsgGUID: qctH5TA2TS2ySb2V1rbCsg==
X-IronPort-AV: E=McAfee;i="6800,10657,11928"; a="165966"
X-IronPort-AV: E=Sophos;i="6.27,144,1787036400"; 
   d="scan'208";a="165966"
Received: from fmviesa004.fm.intel.com ([10.60.135.144])
  by fmvoesa112.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 07 Oct 2026 09:18:01 -0700
X-CSE-ConnectionGUID: 8AEPxnKqQ4qLJzptFxz1ow==
X-CSE-MsgGUID: RMI+MXeYSt6Ml15UXMUMkg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,144,1787036400"; 
   d="scan'208";a="282297087"
Received: from orewaldx-mobl.ger.corp.intel.com (HELO [10.245.113.139]) ([10.245.113.139])
  by fmviesa004-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 07 Oct 2026 09:17:59 -0700
Message-ID: <f3030543-45f3-4719-b8a9-4fd6226263e6@linux.intel.com>
Date: Wed, 7 Oct 2026 18:17:46 +0200
Precedence: bulk
X-Mailing-List: sashiko-reviews@lists.linux.dev
List-Id: <sashiko-reviews.lists.linux.dev>
List-Subscribe: <mailto:sashiko-reviews+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:sashiko-reviews+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] accel/ivpu: Improve IVPU_TEST_MODE_FW_TEST handling
To: sashiko-reviews@lists.linux.dev
Cc: dri-devel@lists.freedesktop.org
References: <20261007102414.2661045-1-andrzej.kacprowski@linux.intel.com>
 <sashiko-outbox-162864@kernel.org>
Content-Language: en-US
From: Andrzej Kacprowski <andrzej.kacprowski@linux.intel.com>
In-Reply-To: <sashiko-outbox-162864@kernel.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 07-Oct-26 12:38 PM, sashiko-bot@kernel.org wrote:
> Thank you for your contribution! Sashiko AI review found 1 potential issue(s) to consider:
> - [High] accel/ivpu: IRQ disable depth leak in FW_TEST mode due to unbalanced disable_irq()
> --
> 
> commit 03c00af9f26af13756e29777951597b1aedc577d
> Author: Andrzej Kacprowski <andrzej.kacprowski@linux.intel.com>
> 
> accel/ivpu: Improve IVPU_TEST_MODE_FW_TEST handling
> 
> When driver is operating in IVPU_TEST_MODE_FW_TEST debug mode
> it should boot the firmware, but skip communication with
> the firmware. There is no need to enable interrupts or send messages.
> The output of the firmware test will be available in the
> firmware log.
> 
>> diff --git a/drivers/accel/ivpu/ivpu_drv.c b/drivers/accel/ivpu/ivpu_drv.c
>> index 647684219e9d3..d66abf645e7b9 100644
>> --- a/drivers/accel/ivpu/ivpu_drv.c
>> +++ b/drivers/accel/ivpu/ivpu_drv.c
> 
> [ ... ]
> 
>> @@ -487,6 +484,9 @@ int ivpu_boot(struct ivpu_device *vdev)
>>   		return ret;
>>   	}
>>   
>> +	if (ivpu_test_mode & IVPU_TEST_MODE_FW_TEST)
>> +		return 0;
>> +
> 
> [Severity: High]
> Does this early return cause an IRQ disable depth leak?
> 
> Since ivpu_boot() skips the call to enable_irq() when IVPU_TEST_MODE_FW_TEST
> is enabled, it breaks the enable/disable symmetry.
> 
> Later, during teardown paths like ivpu_prepare_for_reset(), disable_irq()
> is called unconditionally:
> 
> drivers/accel/ivpu/ivpu_drv.c:ivpu_prepare_for_reset() {
>      ...
>      disable_irq(vdev->irq);
>      ...
> }
> 
> Calling disable_irq() without a matching enable_irq() increments the disable
> depth on each suspend/resume cycle. If the user dynamically disables FW_TEST
> mode via sysfs, subsequent enable_irq() calls will only decrement the
> accumulated depth by 1, leaving the physical interrupt permanently disabled.
> 
>>   	ret = ivpu_wait_for_ready(vdev);
>>   	if (ret) {
>>   		ivpu_err(vdev, "Failed to boot the firmware: %d\n", ret);
> 
Will be addressed in v2 patch.
