Received: from va-2-36.ptr.blmpb.com (va-2-36.ptr.blmpb.com [209.127.231.36])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4A7F8388378
	for <sashiko-reviews@lists.linux.dev>; Wed, 24 Jun 2026 06:32:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.127.231.36
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1782282767; cv=none; b=OCPwm7n9a0gXcs3zfaOh5ylbF7mdyWXHCnZS1eqFIE1JmECCJkXfWuqogsINMBc2NWUqi4IdlJ98US9ZEHrQ/GHLJI0x6AYnix3OZ0bh/JdGkl1Kgi/feGhoomRrZoHxa3VMoEkZmnt6q2XkC2SukBILd2PQ/h5tNUTON+0Y55M=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1782282767; c=relaxed/simple;
	bh=QNCFY19qmD7v8/OACFuQ9+AMmsX1HzrtDbFmy8IMb7w=;
	h=From:Subject:To:References:Message-Id:Mime-Version:Content-Type:
	 Date:In-Reply-To:Cc; b=aIW4S5OBRFVYSEgSRUTBBqrnL/LxwVS3mguDT2/cZZto6ZnfPXdiRk74XCorHEdjjrAXzEaVolAZApJyqPIT+uKH/hVbqrBCOQSQdbOez3mWHcs32GCvVojg+HiNkO1l5AdW0HdN6pD5lwwvrXmHcGopLj3gl5q/ktVxt2yelNg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=fnnas.com; spf=pass smtp.mailfrom=fnnas.com; dkim=pass (2048-bit key) header.d=fnnas-com.20200927.dkim.feishu.cn header.i=@fnnas-com.20200927.dkim.feishu.cn header.b=AlzVWoAZ; arc=none smtp.client-ip=209.127.231.36
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=fnnas.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=fnnas.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=fnnas-com.20200927.dkim.feishu.cn header.i=@fnnas-com.20200927.dkim.feishu.cn header.b="AlzVWoAZ"
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 s=s1; d=fnnas-com.20200927.dkim.feishu.cn; t=1782282759;
  h=from:subject:mime-version:from:date:message-id:subject:to:cc:
 reply-to:content-type:mime-version:in-reply-to:message-id;
 bh=Z38jOtd0UchS/P9yGsksjC9qEN9lSSS3lQ6W1XCzxjU=;
 b=AlzVWoAZFvyedmL6ZOpeLgVS1MUPCpxr5x1q7KH72d/zstjpIbc002CLPLN5qpCLLp5RTo
 JpYOWO+2NQHY4oSVcxnLGrUpkPKcUFFSHhlinHzwWHQmwf0mmOx2NrZ7bAfo1a7wbG7MZ6
 qro0V0cUazoBabmiTOIfdS9Z12qu9CvJs+Z/WDittcHGauN5Cq04SwvTuqpM1aCVK+RXoP
 4N+mGlCRmr8/+39+mtGz0F5HKSQwZeEaPac7F7IYq6rpjYyu8ZXyoDClOm6dvSZRBhkouY
 hxDzb/qBdqsnUuBJjuOCz4Wl1/UDpg4MhKbtkh/sZ7v8N6L6kkW3pEb+bNRYsA==
From: "Chen Cheng" <chencheng@fnnas.com>
Subject: Re: [PATCH v6 2/3] md/raid10: resize r10bio_pool for reshape
To: <sashiko-reviews@lists.linux.dev>
References: <20260623123840.2521340-1-chencheng@fnnas.com> <20260623123840.2521340-3-chencheng@fnnas.com> <20260623130100.477FE1F000E9@smtp.kernel.org>
X-Original-From: Chen Cheng <chencheng@fnnas.com>
Message-Id: <05b24fee-b9d9-45b5-9453-abd3d0b6b3d8@fnnas.com>
Precedence: bulk
X-Mailing-List: sashiko-reviews@lists.linux.dev
List-Id: <sashiko-reviews.lists.linux.dev>
List-Subscribe: <mailto:sashiko-reviews+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:sashiko-reviews+unsubscribe@lists.linux.dev>
Mime-Version: 1.0
User-Agent: Mozilla Thunderbird
Content-Type: text/plain; charset=UTF-8
Received: from [192.168.8.62] ([183.34.167.222]) by smtp.feishu.cn with ESMTPS; Wed, 24 Jun 2026 14:32:35 +0800
Date: Wed, 24 Jun 2026 14:32:34 +0800
In-Reply-To: <20260623130100.477FE1F000E9@smtp.kernel.org>
Content-Transfer-Encoding: quoted-printable
X-Lms-Return-Path: <lba+26a3b7a05+f8d120+lists.linux.dev+chencheng@fnnas.com>
Cc: <yukuai@fygo.io>, <linux-raid@vger.kernel.org>

=E5=9C=A8 2026/6/23 21:00, sashiko-bot@kernel.org =E5=86=99=E9=81=93:
> Thank you for your contribution! Sashiko AI review found 1 potential issu=
e(s) to consider:
> - [Medium] The newly allocated `new_pool` is leaked on the `reshape_backw=
ards` error path.
> --
>=20
> commit 2142096170ffdd8a1caabfde6f2461f6e7d64f61
> Author: Chen Cheng <chencheng@fnnas.com>
>=20
> md/raid10: resize r10bio_pool for reshape
>     =20
> When reshape grows raid_disks, the pool must also switch to new geometry
> object size, and allocate a new geometry size pool and replace the old.
>=20
> But not for shrinking reshape, because regular I/O can still use the
> prev geo for sectors that have not crossed reshape_progress yet.
>=20
>> diff --git a/drivers/md/raid10.c b/drivers/md/raid10.c
>> index cee5a253a281d..d740744a97461 100644
>> --- a/drivers/md/raid10.c
>> +++ b/drivers/md/raid10.c
> [ ... ]
>> @@ -4411,6 +4422,11 @@ static int raid10_start_reshape(struct mddev *mdd=
ev)
>>   		return -EINVAL;
>>  =20
>>   	conf->offset_diff =3D min_offset_diff;
>> +	if (mddev->delta_disks > 0) {
>> +		new_pool =3D create_r10bio_pool(new.raid_disks);
>> +		if (!new_pool)
>> +			return -ENOMEM;
>> +	}
>>   	spin_lock_irq(&conf->device_lock);
>>   	if (conf->mirrors_new) {
>>   		memcpy(conf->mirrors_new, conf->mirrors,
>=20
> [Severity: Medium]
> Will this newly allocated new_pool be leaked if the reshape_backwards
> error path is triggered?
>=20
> If an array is configured for a reshape that expands the number of disks
> (delta_disks > 0), the new_pool is allocated here. However, if the
> component device sizes are also reduced such that the array is set to
> reshape backwards, it can hit a pre-existing error check a few lines
> down:

It's impossible use backward reshape while delta disk > 0 or change=20
component size.

>=20
> 	if (mddev->reshape_backwards) {
> 		sector_t size =3D raid10_size(mddev, 0, 0);
> 		if (size < mddev->array_sectors) {
> 			spin_unlock_irq(&conf->device_lock);
> 			pr_warn("md/raid10:%s: array size must be reduce before number of disk=
s\n",
> 				mdname(mddev));
> 			return -EINVAL;
> 		}
>=20
> This direct return skips the standard cleanup path at the abort label,
> causing the mempool_t structure and its preallocated elements to leak.
> Should we add a mempool_destroy(new_pool) here, or change the return to
> a goto abort?
>
