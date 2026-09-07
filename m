Received: from mta1.migadu.com (out-230.mta1.migadu.com [95.215.58.230])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7C2873B5DE9
	for <sashiko-reviews@lists.linux.dev>; Mon,  7 Sep 2026 12:14:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=95.215.58.230
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788783289; cv=none; b=keNx1snejAbFR+CpWF02376suZS0QrdaCNnlLslmCK1XOaEm+Au3MiClH8fHjomm1mf1lo95M7Ap74VLygs79ggo/yrvBGaNk33LO114GeO3L80Q35CNMtJcQTSYdavvc4SPlv7YvR2LfT6xD79woR185Cc1x4Ut3GrzVI72esk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788783289; c=relaxed/simple;
	bh=ak/cFN/g44zT2VeKUlPdzjtHjNC1T2zdhoIgW7H/oPw=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=iy5uQPGC4V4cY6XxlYpDzBy4ArlGoYQ7aMOjNdlA3/ccSMkElG1KgAWBd9wbbIIMPMzUXt09oDEc4LFlyxnYpm4NGF1+GBFQWm+85Rx2fx8+HBzokxA/S3e1hcdUm5f0uFo6B0SAQzkCRECf+xYukWw6hH8d3sBO8tTL+UQYcX8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.dev; spf=pass smtp.mailfrom=linux.dev; dkim=pass (1024-bit key) header.d=linux.dev header.i=@linux.dev header.b=FUuP+MrL; arc=none smtp.client-ip=95.215.58.230
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.dev
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.dev
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linux.dev header.i=@linux.dev header.b="FUuP+MrL"
X-Envelope-To: sashiko-reviews@lists.linux.dev
DKIM-Signature: a=rsa-sha256; bh=ak/cFN/g44zT2VeKUlPdzjtHjNC1T2zdhoIgW7H/oPw=;
 c=simple/simple; d=linux.dev;
 h=from:to:subject:date:message-id:mime-version:content-type; s=key1;
 t=1788783285; v=1; x=1789388085;
 b=FUuP+MrL44Hwh22mnV56ekngCSMPAJpzQAesaziWKsQWipZs+KIg0n12PxMuy0c579J1YyKG
 nBWJBuaEe2T0Gu9XYaf58IN3OhsogJ3vvoWRmRGseBFqoZrG06FF4AHz7BJQU/jGS0FlrtuiUL2
 V2vfUFXk7VHeADLDop6xrDPM=
X-Envelope-To: sashiko-reviews@lists.linux.dev
Received: by mta10.migadu.com with ESMTPS id c657c2c61bbabbb8;
	Mon, 07 Sep 2026 12:14:45 +0000
X-Mizu-Trace-ID: c657c2c61bbabbb8
X-Migadu-Flow: FLOW_OUT
Message-ID: <ae4ef478-31ac-4454-baaa-1bdd2c9db0d5@linux.dev>
Date: Mon, 7 Sep 2026 13:14:40 +0100
Precedence: bulk
X-Mailing-List: sashiko-reviews@lists.linux.dev
List-Id: <sashiko-reviews.lists.linux.dev>
List-Subscribe: <mailto:sashiko-reviews+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:sashiko-reviews+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v8 19/27] scsi-multipath: provide callbacks for path state
To: sashiko-reviews@lists.linux.dev, John Garry <john.g.garry@oracle.com>
Cc: linux-scsi@vger.kernel.org
References: <20260907105021.1763236-1-john.g.garry@oracle.com>
 <20260907105021.1763236-20-john.g.garry@oracle.com>
 <20260907120319.678721F00A3A@smtp.kernel.org>
Content-Language: en-US
From: John Garry <john.garry@linux.dev>
In-Reply-To: <20260907120319.678721F00A3A@smtp.kernel.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 9/7/26 13:03, sashiko-bot@kernel.org wrote:
> Thank you for your contribution! Sashiko AI review found 1 potential issue(s) to consider:
> - [High] scsi_mpath_available_path() erroneously returns true for ALUA unavailable/offline states, leading to infinite I/O requeuing.
> --
> 
> commit 4cf5187795e3a1d7ac00b1645759bf9140204feb
> Author: John Garry <john.garry@linux.dev>
> 
> scsi-multipath: provide callbacks for path state
> 
> This patch provides callbacks for .is_disabled, .is_optimized, and
> .available_path. These use scsi_device.sdev_state and access_state, which
> will be driven by ALUA.
> 
>> diff --git a/drivers/scsi/scsi_multipath.c b/drivers/scsi/scsi_multipath.c
>> index 12200664ed676..4055b86c83a03 100644
>> --- a/drivers/scsi/scsi_multipath.c
>> +++ b/drivers/scsi/scsi_multipath.c
>> @@ -306,7 +306,56 @@ static struct bio *scsi_mpath_clone_bio(struct bio *bio)
> [ ... ]
>> +static bool scsi_mpath_available_path(struct mpath_device *mpath_device)
>> +{
>> +	struct scsi_mpath_device *scsi_mpath_dev =
>> +				to_scsi_mpath_device(mpath_device);
>> +	struct scsi_device *sdev = scsi_mpath_dev->sdev;
>> +	enum scsi_device_state sdev_state = READ_ONCE(sdev->sdev_state);
>> +
>> +	if (sdev_state == SDEV_RUNNING || sdev_state == SDEV_QUIESCE ||
>> +	    sdev_state == SDEV_BLOCK || sdev_state == SDEV_CREATED_BLOCK)
>> +		return true;
>> +
>> +	return false;
>> +}
> 
> [Severity: High]
> Does this logic bypass queue_if_no_path limits when devices are in ALUA
> offline or unavailable states?
> 
> Since this only checks sdev_state, if all paths transition to an ALUA
> offline or unavailable state but remain physically connected (SDEV_RUNNING),
> would this function still return true?

ALUA support will be properly added next

> 
> If it returns true for ALUA offline paths, could mpath_bdev_submit_bio()
> indefinitely queue I/O in the requeue_list, ignoring the user's
> configuration for timeout and failure?
> 
> Should this function also check sdev->access_state to prevent treating
> paths as available when they are in ALUA states that can never serve I/O?
> 

