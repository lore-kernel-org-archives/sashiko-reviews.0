Received: from mta1.migadu.com (out-16.mta1.migadu.com [95.215.58.16])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E268D33ADAF
	for <sashiko-reviews@lists.linux.dev>; Fri,  4 Sep 2026 09:19:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=95.215.58.16
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788513602; cv=none; b=I/cm6Je5MNIHBa72QjauPzhRsG+I9VjmcHqwJ73cIrINhgLCpuvSXFBrTaCtUXQ8bgYU7Knzsm+AVN5bzk2ipMwWYJ52B1NVr/TATh4euPsgyr94VYvcnqOoIvKlGqrCrKsUz3nOoZRlVZk8RVytvL+bpDErDI9jQNSovoYdlnQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788513602; c=relaxed/simple;
	bh=xKIJgVCJ3T+OKtriETNkZiVRE2zQrLSqDbiOwbqOSYQ=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=fOFjoeNADesOztk+pGbJp1hF9hsEpND/j2uwcoiuUk6L7xTmFekxqhIEFTarN1dLpPk4vkuAoBrFdQR8bKqCwazW/EYeOOY6bFHmKs2bBLtwN5mz5LjBF9bURnUEYUXEV4U3qw1qkYuY8J1Fqh8vlvVJF4faNIhFL8A7fElbIxk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.dev; spf=pass smtp.mailfrom=linux.dev; dkim=pass (1024-bit key) header.d=linux.dev header.i=@linux.dev header.b=tcErx4Yx; arc=none smtp.client-ip=95.215.58.16
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.dev
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.dev
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linux.dev header.i=@linux.dev header.b="tcErx4Yx"
X-Envelope-To: sashiko-reviews@lists.linux.dev
DKIM-Signature: a=rsa-sha256; bh=xKIJgVCJ3T+OKtriETNkZiVRE2zQrLSqDbiOwbqOSYQ=;
 c=simple/simple; d=linux.dev;
 h=from:to:subject:date:message-id:mime-version:content-type; s=key1;
 t=1788513597; v=1; x=1789118397;
 b=tcErx4Yx9eJk922gcxSciQoft7W0O/tY3QroU44cogIVAg6M58Rp3Uqfm0QgznuCC9Mas49/
 HmtUJTd9FDp0iSKuiHbkPwCe445WamkPb20fFeYlnyJM431vNhiWwdKBAdyHmTdPfuvEFA030Fj
 7YjglJSbkneePn4l2+9HrDVc=
X-Envelope-To: sashiko-reviews@lists.linux.dev
Received: by mta11.migadu.com with ESMTPS id 8983a7e9266b85fa;
	Fri, 04 Sep 2026 09:19:57 +0000
X-Mizu-Trace-ID: 8983a7e9266b85fa
X-Migadu-Flow: FLOW_OUT
Message-ID: <1fe7f941-df86-4b6a-91c0-c8b3c74355ca@linux.dev>
Date: Fri, 4 Sep 2026 10:19:52 +0100
Precedence: bulk
X-Mailing-List: sashiko-reviews@lists.linux.dev
List-Id: <sashiko-reviews.lists.linux.dev>
List-Subscribe: <mailto:sashiko-reviews+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:sashiko-reviews+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v7 08/27] libmultipath: Add support for block device IOCTL
To: sashiko-reviews@lists.linux.dev, John Garry <john.g.garry@oracle.com>
Cc: linux-scsi@vger.kernel.org
References: <20260901104526.3850621-1-john.g.garry@oracle.com>
 <20260901104526.3850621-9-john.g.garry@oracle.com>
 <20260901110402.390E61F000E9@smtp.kernel.org>
Content-Language: en-US
From: John Garry <john.garry@linux.dev>
In-Reply-To: <20260901110402.390E61F000E9@smtp.kernel.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 9/1/26 12:04, sashiko-bot@kernel.org wrote:
> Thank you for your contribution! Sashiko AI review found 1 potential issue(s) to consider:
> - [High] AB-BA deadlock in mpath_bdev_ioctl() due to holding SRCU read lock across synchronous underlying ioctl operations.
> --
> 
> commit 5e662d20d610c2b48599b805387034d536eb95fd
> Author: John Garry <john.garry@linux.dev>
> 
> libmultipath: Add support for block device IOCTL
> 
> This commit adds mpath_bdev_ioctl() as a multipath block device IOCTL
> handler. This handler forwards the call into the underlying mpath_device
> bdev fops handler.
> 
>> diff --git a/lib/multipath.c b/lib/multipath.c
>> index 58eb9be5bebbe..f1758d1e60a60 100644
>> --- a/lib/multipath.c
>> +++ b/lib/multipath.c
> 
> [ ... ]
> 
>> @@ -454,11 +454,53 @@ static void mpath_bdev_release(struct gendisk *disk)
>>   	mpath_put_head(mpath_head);
>>   }
>>   
>> +static int mpath_bdev_ioctl(struct block_device *bdev, blk_mode_t mode,
>> +		    unsigned int cmd, unsigned long arg)
>> +{
> 
> [ ... ]
> 
>> +	srcu_idx = srcu_read_lock(&mpath_head->srcu);
>> +	mpath_device = mpath_find_path(mpath_head);
>> +	if (!mpath_device) {
>> +		err = -EWOULDBLOCK;
>> +		goto out_unlock;
>> +	}
>> +
>> +	if (!mpath_device->disk->fops->ioctl) {
>> +		err = -ENOTTY;
>> +		goto out_unlock;
>> +	}
>> +
>> +	err = mpath_device->disk->fops->ioctl(
>> +			mpath_device->disk->part0, mode, cmd, arg);
>> +out_unlock:
>> +	srcu_read_unlock(&mpath_head->srcu, srcu_idx);
> 
> [Severity: High]
> Can this cause an AB-BA deadlock during device removal?
> 
> If the underlying ioctl (e.g., a passthrough command via SG_IO) blocks
> waiting for I/O completion, and a concurrent device removal is triggered
> (e.g., via physical hot-unplug, sysfs deletion, or SCSI error recovery
> offline), could we deadlock here?

If the device is removed, then the IO should complete with failure and 
we can continue.

> 
> A device removal path typically calls:
> sd_mpath_remove() -> mpath_delete_device() -> synchronize_srcu(&mpath_head->srcu).
> 
> That removal thread would block indefinitely waiting for this ioctl thread
> to release the SRCU read lock. Because the device removal is stalled, it
> cannot proceed to tear down the device and abort the pending I/O, leaving
> this ioctl thread permanently stuck waiting for the I/O.
> 
> Would it be safer to acquire a reference to the underlying disk (e.g., via
> get_disk()) and drop the SRCU lock before invoking the potentially unbounded
> ioctl? This appears to be a known structural constraint in block multipathing,
> similar to a fix previously applied in nvme-multipath.

nvme-multipath ensures that any ioctl which can lead to the device being 
removed is not called with the SRCU lock. Furthermore, in that case, we 
are issuing the ioctl to the nvme controller and not the per-path NS.

> 
>> +	return err;
>> +}
>> +
> 

