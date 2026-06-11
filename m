Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.11])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3AEE13594A
	for <sashiko-reviews@lists.linux.dev>; Thu, 11 Jun 2026 06:19:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.11
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1781158788; cv=none; b=QynNlNJZBneGtFxTZWnuqZXmpFBavAU2Nkruc1TD9kDlVftMp3zLhyvDAUAbzxgy4s9lQGPo6SDPnQ5zNqRuHXfWZk0iSfaSQbS4mnppT9K9VXHaFgV/rFxWMoMB9a8IUNTyQJiY23lvYJfIV2p0qcZpdNWg7jqlzuAbCKYIAio=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1781158788; c=relaxed/simple;
	bh=hBXnRB0R6yHxKRHRTif1KRxBcy29ysP13P8/VY89VG4=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=hjhO4U2EHM/HFhjhrli4veewnz38MWB9Q7IOSmwBjnQDvurBhfa2TML+k/G3s1teRiBg0PWyfaaTlckt9IVIWy+L5pewmhjNxTCGZ5PCA9U54UjtiMeMsloCzIZAdimwv0e/clx2MvqZjwSBbBVpmF8q/jc9rQS/1zHo6BWjEHw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=pass smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=Gp3goM3s; arc=none smtp.client-ip=192.198.163.11
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="Gp3goM3s"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1781158787; x=1812694787;
  h=message-id:date:mime-version:subject:to:cc:references:
   from:in-reply-to:content-transfer-encoding;
  bh=hBXnRB0R6yHxKRHRTif1KRxBcy29ysP13P8/VY89VG4=;
  b=Gp3goM3sZyvobOy7AUXxr+S2qODcdGxalqaagw80Fex2fCxUT8Dl+sE0
   hESjqBuUi8PktiJOu/PxNSDZ/gQTYEoNQBIEYTciMP9uG8w9XkHYwhXHu
   98ziOdA4P1zhxngySQJQCZ1BKH/ShOCp/FjVWIVKOly+oXV1fLT2FpzFz
   GqeXmhyl4yjWYj5/mc55YnD9XtXAj8vdVd3ezEmv3lASo13KVdYakBMoC
   SxhbkHHCA+/gWdLIQPTQTWiYnTX0czaekFWiouudZ3aZbT/bYFOc8p5U/
   d8LJ2SzQcG8KepClpNiMH9CP8t0zURPuGdq2+P+Se7MLzSQ2gstbA8NyM
   w==;
X-CSE-ConnectionGUID: SXXKcQOJTn2tMWZIxxE7MQ==
X-CSE-MsgGUID: yu8T/XkISoeIFWVrKbSuEA==
X-IronPort-AV: E=McAfee;i="6800,10657,11813"; a="92530305"
X-IronPort-AV: E=Sophos;i="6.24,198,1774335600"; 
   d="scan'208";a="92530305"
Received: from fmviesa008.fm.intel.com ([10.60.135.148])
  by fmvoesa105.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 10 Jun 2026 23:19:46 -0700
X-CSE-ConnectionGUID: alTVU2sRRi++BD0esf5TMQ==
X-CSE-MsgGUID: aY8JGNmXTtOhXy6bQyEtKg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.24,198,1774335600"; 
   d="scan'208";a="243932571"
Received: from jkollber-mobl1.ger.corp.intel.com (HELO [10.246.16.106]) ([10.246.16.106])
  by fmviesa008-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 10 Jun 2026 23:19:46 -0700
Message-ID: <79ea7cf7-e1e1-4bcf-a431-d82f538d7e5c@linux.intel.com>
Date: Thu, 11 Jun 2026 08:19:43 +0200
Precedence: bulk
X-Mailing-List: sashiko-reviews@lists.linux.dev
List-Id: <sashiko-reviews.lists.linux.dev>
List-Subscribe: <mailto:sashiko-reviews+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:sashiko-reviews+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] accel/ivpu: Use threaded IRQ for IPC callback processing
To: sashiko-reviews@lists.linux.dev
Cc: dri-devel@lists.freedesktop.org
References: <20260611055201.948726-1-karol.wachowski@linux.intel.com>
 <20260611060901.6D9AC1F00893@smtp.kernel.org>
Content-Language: en-US
From: "Wachowski, Karol" <karol.wachowski@linux.intel.com>
In-Reply-To: <20260611060901.6D9AC1F00893@smtp.kernel.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 11-Jun-26 8:09, sashiko-bot@kernel.org wrote:
> Thank you for your contribution! Sashiko AI review found 1 potential issue(s) to consider:
> - [High] Firmware command queue leak and duplicate hardware initialization on the retry path in `ivpu_job_submit`.
> --

This is pre-existing issue that will exhibit even without this patch.
It is already addressed with:
https://lore.kernel.org/all/20260611055140.948684-1-karol.wachowski@linux.intel.com/

Karol

> 
> commit 91623d3f3cc1b38781bd2f9f2354ef0fa3591d50
> Author: Karol Wachowski <karol.wachowski@linux.intel.com>
> 
> accel/ivpu: Use threaded IRQ for IPC callback processing
> 
> Dispatching IPC callbacks from system_percpu_wq adds scheduling latency
> that is neither bounded nor predictable, which hurts job completion
> turnaround. Handle them from a threaded IRQ instead, and defer job
> resource teardown to a dedicated unbounded workqueue.
> 
>> diff --git a/drivers/accel/ivpu/ivpu_job.c b/drivers/accel/ivpu/ivpu_job.c
>> index 521931d1f7fca..7320c97762832 100644
>> --- a/drivers/accel/ivpu/ivpu_job.c
>> +++ b/drivers/accel/ivpu/ivpu_job.c
> [ ... ]
>> @@ -709,6 +748,14 @@ static int ivpu_job_submit(struct ivpu_job *job, u8 priority, u32 cmdq_id)
>>   	}
>>   
>>   	ret = ivpu_cmdq_register(file_priv, cmdq);
>> +	if (ret == -EBUSY && !flushed) {
>> +		/* Doorbell may be held by jobs pending deferred cleanup */
>> +		mutex_unlock(&file_priv->lock);
>> +		mutex_unlock(&vdev->submitted_jobs_lock);
>> +		flush_work(&vdev->job_destroy_work);
>> +		flushed = true;
>> +		goto retry;
>> +	}
> 
> [Severity: High]
> Does this retry loop cause duplicate firmware queue initialization and leak
> resources?
> 
> If ivpu_cmdq_register() successfully calls ivpu_hws_cmdq_init() but then
> ivpu_register_db() fails with -EBUSY, the function returns -EBUSY without
> undoing the firmware queue initialization and leaves cmdq->db_id as 0:
> 
> drivers/accel/ivpu/ivpu_job.c:ivpu_cmdq_register() {
>      ...
> 	if (vdev->fw->sched_mode == VPU_SCHEDULING_MODE_HW) {
> 		ret = ivpu_hws_cmdq_init(file_priv, cmdq, VPU_ENGINE_COMPUTE, cmdq->priority);
> 		if (ret)
> 			return ret;
> 	}
> 
> 	ret = ivpu_register_db(file_priv, cmdq);
> 	if (ret)
> 		return ret;  // Returns -EBUSY here, db_id is 0
>      ...
> }
> 
> When the goto retry path is taken, ivpu_cmdq_register() is called again
> with the same cmdq. Because cmdq->db_id is still 0, the early bailout is
> skipped, and ivpu_hws_cmdq_init() is called a second time.
> 
> Furthermore, if the retry also fails (or is not attempted), will this
> leak the firmware resource? The unregister path seems to bail early if
> db_id is 0:
> 
> drivers/accel/ivpu/ivpu_job.c:ivpu_cmdq_unregister() {
> 	if (!cmdq->db_id)
> 		return 0;
>      ... // ivpu_jsm_hws_destroy_cmdq() is skipped
> }
> 
>>   	if (ret) {
>>   		ivpu_err(vdev, "Failed to register command queue: %d\n", ret);
>>   		goto err_unlock;
> 

