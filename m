Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=198.175.65.15
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794310904;
	b=EhteFHnmwVRYPBb3Xqr2VcQQVDoBNlQk+CwfGIz+YtXTw/iek3PVysH4ZePAM30KkdnH
	 NyfQlv8ekfSqALyaHc1CciVZkM/fFvVelUfSURLJHQ/fvXdqZVuy/u5DAw8r0vi0QgTaD
	 wADXaJFNaF+TbGqd3XQ1zXMYDWlqww/GkeVrLnCyHDVX4ccO+ucd60Bk61mFim+iUXFf/
	 Z07eSCY+cmZj4njXKXvy5ahELYNGYAu3IaOvMPqxnjxHSrrBHsCb2p32681JNIR7KEATm
	 PgRhtbsMJOVyzDgBO6eCuakHkervcjdp23GJwfQbC/ZdnWDoGkcMFJzQ+6r+drurCbQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794310904;
	h=DMARC-Filter:DKIM-Signature:X-CSE-ConnectionGUID:X-CSE-MsgGUID:
	 X-IronPort-AV:X-IronPort-AV:Received:X-CSE-ConnectionGUID:
	 X-CSE-MsgGUID:X-ExtLoop1:X-IronPort-AV:Received:Message-ID:Date:
	 MIME-Version:User-Agent:Subject:To:References:Content-Language:From:
	 In-Reply-To:Content-Type:Content-Transfer-Encoding;
	bh=JTS26rJUwIrFKSwC41JGXvoI6xZdaHsM8RUwM//Alb4=;
	b=UgK6LHFfDkaJVlP/mtf6Vw+kzpEUscPk8JLBOc8NN5KIcGjJl9//xixv+mNDUI+stK05
	 zZwchmwMTZbl3Q8a1TGaTTEPNbCpswDzC5KbQGH9gwEtT0ODgO1cNDiSDlou4shgf8Kqe
	 zaYxsOvJjug3jkcAnlfdjoLWoEnQ809Z1QVKaRHA0lvS5LYIlnocJRUm1FRTBoZ6h/JBz
	 +8DmF4waFXsNER6RDkca3Mz9SWqxbN9s6fPm3z4RL+8UOhhCk43ruqJKPPguvLTRUAT9c
	 FsA/fvva35HETY2a0IUSDjQZ2GkMYvGqxsSngdOp4pNrAIKP9M6jxPwNtMUkSNC/gPw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=linux.intel.com;
	spf=pass smtp.mailfrom=linux.intel.com;
	dkim=pass header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=IweSLYlC;
	arc=none smtp.remote-ip=198.175.65.15
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.15])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E5FFE606A321
	for <sashiko-reviews@lists.linux.dev>; Tue, 10 Nov 2026 11:41:42 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org E5FFE606A321
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=IweSLYlC
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1794310903; x=1825846903;
  h=message-id:date:mime-version:subject:to:references:from:
   in-reply-to:content-transfer-encoding;
  bh=iM7IWakVCcIz8WMJVolWHC/3np93vJAPlCV71FNMb/w=;
  b=IweSLYlCD4Abd/uXUpbnu2NfBz8pT3wap3HkhNMVuG+QBYhWG3qMQ0qG
   yxkSS0eremUm+0h+kgtd58j77NWF/dz7WlOIzcypAYRdUxYjC0EyQ9Lf4
   fj6BVBW0RojiW0A/zAhE+0Wzzl93m+qq1CCvRL3wVPhxMtX1vrZt6cUvo
   iz2+QMGW9MDH8X+fAaLleVFP4qbjv8zcd522zi6uxUkVGLdg4/g8SvBLK
   2UsitwjWBo39w3FYStWt/Cyr/H0o5EuTj1jGwEAiEFI/WvTZSlMY8m7gU
   aXTfRcQFSoJr6I8PWud/C8j2T10tCByXUS7srcD2Q3YsJapm3HUwtA4N9
   A==;
X-CSE-ConnectionGUID: NJIhTqESSgu1LdvgumAURg==
X-CSE-MsgGUID: 34/Zux+NTqeGMKbvrG9Mpw==
X-IronPort-AV: E=McAfee;i="6800,10657,11961"; a="3053408"
X-IronPort-AV: E=Sophos;i="6.27,205,1787036400"; 
   d="scan'208";a="3053408"
Received: from orviesa009.jf.intel.com ([10.64.159.149])
  by orvoesa107.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 10 Nov 2026 03:41:42 -0800
X-CSE-ConnectionGUID: j5tlAoxkRQy/q3wZA0e94g==
X-CSE-MsgGUID: ushUxuIbTTi204rlZvcNdA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,205,1787036400"; 
   d="scan'208";a="8281806"
Received: from soc-pf6038af.clients.intel.com (HELO [10.217.180.114]) ([10.217.180.114])
  by smtpauth.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 10 Nov 2026 03:41:42 -0800
Message-ID: <413a803a-0978-467f-ace4-1121140418f6@linux.intel.com>
Date: Tue, 10 Nov 2026 12:41:39 +0100
X-Mailing-List: sashiko-reviews@lists.linux.dev
List-Id: <sashiko-reviews.lists.linux.dev>
List-Post: <mailto:sashiko-reviews@lists.linux.dev>
List-Help: <mailto:sashiko-reviews+help@lists.linux.dev>
List-Subscribe: <mailto:sashiko-reviews+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:sashiko-reviews+unsubscribe@lists.linux.dev>
List-Owner: <mailto:sashiko-reviews+owner@lists.linux.dev>
Precedence: list
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2] accel/ivpu: Defer recovery until probe completes
To: sashiko-reviews@lists.linux.dev, dri-devel@lists.freedesktop.org
References: <20261107174215.15818-1-swizzguy76@gmail.com>
 <20261110085003.3527014-1-karol.wachowski@linux.intel.com>
 <sashiko-outbox-206716@kernel.org>
Content-Language: en-US
From: Karol Wachowski <karol.wachowski@linux.intel.com>
In-Reply-To: <sashiko-outbox-206716@kernel.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 10-Nov-26 10:13, sashiko-bot@kernel.org wrote:
> Thank you for your contribution! Sashiko AI review found 1 potential
> issue to consider:
> - [Medium] accel/ivpu: race in ivpu_pm_enable() queues recovery_work
>    twice
> --
> 
> commit 53feec71cd6cb0035da92ea965a242f974fa21d7
> Author: Karol Wachowski <karol.wachowski@linux.intel.com>
> 
> accel/ivpu: Defer recovery until probe completes
> 
> This commit disables recovery_work in ivpu_pm_init() and re-enables and
> flushes it in ivpu_pm_enable() to prevent recovery from running during
> probe before device initialization finishes.
> 
>> diff --git a/drivers/accel/ivpu/ivpu_pm.c b/drivers/accel/ivpu/ivpu_pm.c
>> index aa813262253e4..7aee728b19ef1 100644
>> --- a/drivers/accel/ivpu/ivpu_pm.c
>> +++ b/drivers/accel/ivpu/ivpu_pm.c
>> @@ -415,6 +415,7 @@ void ivpu_pm_init(struct ivpu_device *vdev)
>>   	atomic_set(&pm->engine_reset_counter, 0);
>>   
>>   	INIT_WORK(&pm->recovery_work, ivpu_pm_recovery_work);
>> +	disable_work(&pm->recovery_work);
>>   	INIT_DELAYED_WORK(&pm->job_timeout_work, ivpu_job_timeout_work);
>>   
>>   	if (ivpu_disable_recovery)
>> @@ -439,6 +440,12 @@ void ivpu_pm_enable(struct ivpu_device *vdev)
>>   {
>>   	struct device *dev = vdev->drm.dev;
>>   
>> +	enable_work(&vdev->pm->recovery_work);
>> +	if (atomic_read(&vdev->pm->reset_pending)) {
>> +		queue_work(system_dfl_wq, &vdev->pm->recovery_work);
>> +		flush_work(&vdev->pm->recovery_work);
>> +	}
> 
> [Severity: Medium]
> Can ivpu_pm_enable() race with ivpu_pm_trigger_recovery() and queue
> recovery_work twice for a single fault?
> 
> In ivpu_pm_trigger_recovery(), reset_pending is set to 1 before
> ivpu_hw_diagnose_failure(), ivpu_hw_irq_disable(), and queue_work():
> 
> drivers/accel/ivpu/ivpu_pm.c:ivpu_pm_trigger_recovery() {
> 	...
> 	if (atomic_cmpxchg(&vdev->pm->reset_pending, 0, 1) == 0) {
> 		ivpu_hw_diagnose_failure(vdev);
> 		ivpu_hw_irq_disable(vdev); /* Disable IRQ early to protect from IRQ storm */
> 		queue_work(system_dfl_wq, &vdev->pm->recovery_work);
> 	}
> }
> 
> And reset_pending stays 1 until ivpu_pm_reset_complete() finishes, while
> the workqueue clears WORK_STRUCT_PENDING_BIT as soon as a worker dequeues
> recovery_work:
> 
> CPU0                              CPU1                        kworker
> ivpu_pm_trigger_recovery()
>    atomic_cmpxchg(reset_pending, 0, 1)
>    ivpu_hw_diagnose_failure()
>                                    ivpu_pm_enable()
>                                      enable_work(&recovery_work)
>                                      if (atomic_read(reset_pending))
>                                        queue_work(&recovery_work)
>                                        flush_work(&recovery_work)
>                                                                ivpu_pm_recovery_work()
>    ivpu_hw_irq_disable()
>    queue_work(&recovery_work)  <-- queued a second time
> 
> The same double queueing happens if ivpu_pm_trigger_recovery() runs right
> after enable_work() and a worker starts ivpu_pm_recovery_work() before
> ivpu_pm_enable() checks reset_pending.
> 
> In the first interleaving, ivpu_pm_recovery_work() runs concurrently with
> ivpu_hw_diagnose_failure() and ivpu_hw_irq_disable(), and flush_work()
> only waits for the first execution.  The second queued recovery_work then
> runs after flush_work() returns, performing a second full NPU reset
> concurrently with pm_runtime_allow() and pm_runtime_put_autosuspend() and
> reintroducing the race where recovery disables runtime PM during the
> initial autosuspend request.
> 

I'll send V3 that addresses recovery that leaves the device in D0.

Karol

