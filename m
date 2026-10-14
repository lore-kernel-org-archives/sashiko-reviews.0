Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4DE0D4A64EA
	for <sashiko-reviews@lists.linux.dev>; Wed, 14 Oct 2026 22:25:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.17
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1792016728; cv=none; b=AiBBtJF+v07STKxBzzcwX3T9T+mwe8rE3AbgqleWEAxf9z84ihY62po3Gi3K75R+hqLrof5Zex9rsJTvo0BP1+snRk48IJRql/UsyZY4CGob0CvF8XR3ZikulDlKtC7CxwsvOtlf/+nWZ3RCmfrR2TiObATZsWSocsEW29e1+WI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1792016728; c=relaxed/simple;
	bh=nQ8YG2vU7S0uYgtAkMzTRmzK3bGvs4pmiPwIKEQvb2s=;
	h=From:To:Cc:Subject:In-Reply-To:References:Date:Message-ID:
	 MIME-Version:Content-Type; b=Mosme/F5yZnNwwrAB/MFE3BYY4nerjrVO2W40NJ0w/sWTMzlT9l9fw33tKMUXSwwZS1tWa67f/EH1QyjjB/tgQK93Q932LOQmGLfSkiAcFqQWPKP7d1aQ+TJr8JkC2lD6kOrTbuMCzfAE2BDbRuJr9SAgEOuGqHO+nWkhefraAU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=dvALibTC; arc=none smtp.client-ip=192.198.163.17
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="dvALibTC"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1792016726; x=1823552726;
  h=from:to:cc:subject:in-reply-to:references:date:
   message-id:mime-version;
  bh=nQ8YG2vU7S0uYgtAkMzTRmzK3bGvs4pmiPwIKEQvb2s=;
  b=dvALibTCHEg2MiU3JwesNeVXV9Yv9jJlNty6yDOZVc8Bju/Imjs/v1/p
   NX0OA0T5WWS+qYpRTSBt5VBxoAVpCCFHHNMLtnRn2fMHk2U0AY4BEKh1e
   Ca4G3PFJ5yngpDtpCTj/J/evQSMX61qoweMZkbGyxEOWHASKxFKFLdDAx
   bRDn53xEJnT1QOOP0sjBr6Rlj27RiBOkWDL6qmouzt1NqW4GABqCBJvlT
   tST/AnqwZNsBKOStCGtRySnWG20RCCSxlSF4yWM9baSP6VsC9MPweHQ+P
   x970oj1hUm6/Xpbwvsh60GaPuQ3wjJNACCFZT8KI6GVTVRMenJR7DFCch
   g==;
X-CSE-ConnectionGUID: ZVZX+TGKReGz0BKckk1c8g==
X-CSE-MsgGUID: XRpMRlapRoW8ubXA4cgIUg==
X-IronPort-AV: E=McAfee;i="6800,10657,11935"; a="781548"
X-IronPort-AV: E=Sophos;i="6.27,158,1787036400"; 
   d="scan'208";a="781548"
Received: from orviesa004.jf.intel.com ([10.64.159.144])
  by fmvoesa111.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 14 Oct 2026 15:25:25 -0700
X-CSE-ConnectionGUID: VTXhgDE8QKKkAVhtKK0piA==
X-CSE-MsgGUID: a/7Fo/zyQUude/g0YTkJww==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,158,1787036400"; 
   d="scan'208";a="1551368"
Received: from vcostago-desk1.jf.intel.com (HELO vcostago-desk1) ([10.241.243.117])
  by smtpauth.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 14 Oct 2026 15:25:26 -0700
From: Vinicius Costa Gomes <vinicius.gomes@intel.com>
To: sashiko-reviews@lists.linux.dev
Cc: dmaengine@vger.kernel.org, vkoul@kernel.org, Frank.Li@kernel.org
Subject: Re: [PATCH 6/6] dmaengine: idxd: Do not release interrupt handles
 on terminate_all
In-Reply-To: <sashiko-outbox-168653@kernel.org>
References: <20261012-wt-idxd-fixes-v1-0-30a35a445077@intel.com>
 <20261012-wt-idxd-fixes-v1-6-30a35a445077@intel.com>
 <sashiko-outbox-168653@kernel.org>
Date: Wed, 14 Oct 2026 15:25:25 -0700
Message-ID: <87cxtbj4x6.fsf@intel.com>
Precedence: bulk
X-Mailing-List: sashiko-reviews@lists.linux.dev
List-Id: <sashiko-reviews.lists.linux.dev>
List-Subscribe: <mailto:sashiko-reviews+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:sashiko-reviews+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain

sashiko-bot@kernel.org writes:

> Thank you for your contribution! Sashiko AI review found 3 potential issue(s) to consider:
> - [High] dma: idxd: sleep in atomic context in device_terminate_all()
> - [High] dmaengine: idxd: Hardware UAF and IOMMU faults due to flushing active WQ without disable
> - [Medium] dmaengine: idxd: missing check for INVALID_INT_HANDLE in release
> --
>
> commit dc7ea0d446f4b8c4e4f29fa4595acabcca6b297f
> Author: Vinicius Costa Gomes <vinicius.gomes@intel.com>
>
> dmaengine: idxd: Do not release interrupt handles on terminate_all
>
> This commit splits the interrupt handle teardown from the descriptor
> flushing in idxd_wq_flush_descs(). This prevents the interrupt handle
> from being incorrectly released during dmaengine terminate_all, which
> was causing subsequent runs to time out.
>
>> diff --git a/drivers/dma/idxd/device.c b/drivers/dma/idxd/device.c
>> index 131138483b877..06299f40f5312 100644
>> --- a/drivers/dma/idxd/device.c
>> +++ b/drivers/dma/idxd/device.c
>> @@ -1349,6 +1349,16 @@ void idxd_wq_free_irq(struct idxd_wq *wq)
>>  }
>>  
>>  void idxd_wq_flush_descs(struct idxd_wq *wq)
>> +{
>> +	guard(mutex)(&wq->wq_lock);
>> +
>> +	if (wq->state != IDXD_WQ_ENABLED || wq->type != IDXD_WQT_KERNEL)
>> +		return;
>> +
>> +	idxd_flush_pending_descs(&wq->ie);
>> +}
>
> [Severity: High]
> Does this code introduce a sleep-in-atomic bug when called via the
> dmaengine termination path?
>
> The dmaengine API allows dmaengine_terminate_async() to be called from
> atomic context (such as an interrupt handler or while holding a spinlock).
>
> This routes to idxd_dma_terminate_all(), which then calls
> idxd_wq_flush_descs().
>
> Because idxd_wq_flush_descs() unconditionally acquires wq->wq_lock using
> a sleepable mutex, terminating an asynchronous transfer from atomic
> context could trigger a scheduling-while-atomic panic.
>

Ugh, bad one. Worried that my lockdep tests didn't catch this one. Will
fix.

> [Severity: High]
> Can this flush implementation cause a use-after-free and IOMMU faults?
>
> By calling idxd_flush_pending_descs() without first disabling or halting
> the hardware workqueue, the software descriptors are completed, freed,
> and client memory is unmapped while the hardware may still be actively
> processing them.
>
> Since the hardware continues to execute DMA operations into buffers that
> have already been unmapped, can this result in memory corruption and
> IOMMU faults?
>
>> +
>> +void idxd_wq_release_int_handle(struct idxd_wq *wq)
>>  {
>>  	struct idxd_irq_entry *ie = &wq->ie;
>>  	struct idxd_device *idxd = wq->idxd;
>> @@ -1358,7 +1368,6 @@ void idxd_wq_flush_descs(struct idxd_wq *wq)
>>  	if (wq->state != IDXD_WQ_ENABLED || wq->type != IDXD_WQT_KERNEL)
>>  		return;
>>  
>> -	idxd_flush_pending_descs(ie);
>>  	if (idxd->request_int_handles)
>>  		idxd_device_release_int_handle(idxd, ie->int_handle,
>> IDXD_IRQ_MSIX);

Another pre-existing one. And another potential to be in another series.
I think I might have caught a consequence of this bug when testing
iaa-crypto. Let's see if the fix fits on v2.

>
> [Severity: Medium]
> Is it possible for ie->int_handle to be INVALID_INT_HANDLE here?
>
> If a previous operation leaves the handle as INVALID_INT_HANDLE (-1) but
> the workqueue remains in the IDXD_WQ_ENABLED state, this code will
> unconditionally issue a release command to the hardware using -1 (0xffff).
>
> Should this function include a check for ie->int_handle ==
> INVALID_INT_HANDLE before calling idxd_device_release_int_handle(),
> similar to how it is handled in idxd_wq_free_irq()?
>
>>  	idxd_device_clear_perm_entry(idxd, ie);
>

Will fix.


Cheers,
-- 
Vinicius
