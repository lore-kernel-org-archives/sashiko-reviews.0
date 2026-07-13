Received: from mail-ed1-f45.google.com (mail-ed1-f45.google.com [209.85.208.45])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 57E0840B388
	for <sashiko-reviews@lists.linux.dev>; Mon, 13 Jul 2026 12:32:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.45
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783945941; cv=none; b=oaZKDvr3bspaMKMaiJp53rIupQtkcj/+zE5TMmrYMMLV8h7YsVboblKUtchx3RijiMQT00cK10XzRbcKe3Z+aUUREqV9CseReD/r3M7urRroK60wT5G8tKgeHDDO2xzM/8OFGzlObo6r8yPkSbpJCH4uxO6QNyFIbKjyhZL3N8w=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783945941; c=relaxed/simple;
	bh=GHwfMfdmDB/k7iCIFX7dPpwYZPHSeTtGeIuOh/UewSA=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=TO1rZ2+wcegnmBLW0FyYeCBm/zRP4s6Qb45ip8hgPjdL6Vyosnm+UMWD2Z3bsSO1DBfRneAZ9hBFk+lyxHvnEFu7YC+4v3XQMkN6LatvvYW3vSOHPlrimjrb0LtN2T/4DX2LwHDjMAr40aNYQqaYLbwtmIOGeCDNfk7j1GZbC40=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=resnulli.us; spf=none smtp.mailfrom=resnulli.us; dkim=pass (2048-bit key) header.d=resnulli-us.20251104.gappssmtp.com header.i=@resnulli-us.20251104.gappssmtp.com header.b=i4g7c1+a; arc=none smtp.client-ip=209.85.208.45
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=resnulli.us
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=resnulli.us
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=resnulli-us.20251104.gappssmtp.com header.i=@resnulli-us.20251104.gappssmtp.com header.b="i4g7c1+a"
Received: by mail-ed1-f45.google.com with SMTP id 4fb4d7f45d1cf-699fbcd23ccso4309030a12.1
        for <sashiko-reviews@lists.linux.dev>; Mon, 13 Jul 2026 05:32:15 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=resnulli-us.20251104.gappssmtp.com; s=20251104; t=1783945934; x=1784550734; darn=lists.linux.dev;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :content-type:mime-version:references:message-id:subject:cc:to:from
         :date:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=qWIlou6pGXT2W8CUCigSSPTJIoq7gvDoH/QUvc3TWhM=;
        b=i4g7c1+aS/GvGejPM0lRz3Iay1lwos0AhKyyI8igUbH6/bVWavLfyg6jZBRCk4+Irq
         enWb1LtdF+mEuAHkNYsnU+qmAuoYelPSZLR3n8Hg1/PjkAhQRT4o2KYDR9IpixI+Xst4
         eReEJ2Nju/bfo7X4JwxH6n2RneyRfAiIcQGNfr3SMfsHuQOu3P4/lMWOmEq01rP+pi61
         b5/kt113FD0MlyHBNnurMca5p4RQ59bFQ1TTFEKbvX7bCLXKpX8ElJdDb7pgeZKSQ422
         5ynv64fwsE7jpaLTtoLgAEV3rVvvQMAWQ/fAAnE16/GlTyS67koUtRlNJcczXWQnwikl
         q1+g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1783945934; x=1784550734;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :content-type:mime-version:references:message-id:subject:cc:to:from
         :date:x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=qWIlou6pGXT2W8CUCigSSPTJIoq7gvDoH/QUvc3TWhM=;
        b=QLxlyMmDVG56D2fdAIlsiBahCAaerZrseCrEfyqsc4d/UDSdnJzWzMGOntq7xrzOAo
         7s2p1MXxtT+iPp3AzEIoyxHKo3N8376GL4JCsV4rX2zZMBC0+xoOCnw8rrj/mf5GHxXB
         BI8fhnK2iIZXpkRQ34Tm5tnJk9i4UVCPeINDlxmiHVC4fPoRuztD1UbIAk2mz3jLx3d0
         DT0G+elEf86RHNg7KtBSu6Zt+BaT7hB6GtKapb23hGO0t4+0+NwBKOQIoazmm0CeFlib
         idlkz4F4JTar0hNikWY82uF53WI01rWh6ktH4tSTMcJmcMnCfRcX3j6EBTlvMk6QrxoL
         VeJw==
X-Gm-Message-State: AOJu0YydiTbd+Yt7ysQdG9MfwPe94sK0kNEGTGci+gWGjJXKxV+gZaoQ
	MiBfE9lJvLa/Kwd2zYPvKFNDc0FP1Z613/AM0B1AiYO9lOv6rqZTIQcdfuZIX7SJKcn2dQMzG7i
	7qKGh
X-Gm-Gg: AfdE7ckS4MfoRf+gO9sJIRowLDQzT2SiPU7nXplMGYgjAc5OCURlDO18W1cTJ4nzdtT
	/RIjYv//x104sI0HGnuI6KvsMm0jP5I6pdvpC8DPIGwkVBmju3z69QALYc7KMpJ244vmb5y4ebB
	lTJKLLO/etl0GcwiUImfaJ76N86hez97ABpnRL63NH6sbQRenq+B2eQox9iwKqfL5WOvBrpPBTj
	YTM4uQhrJayxYU3K0sNqNVNR9a7uYOA658XRnoJSU9+0/j80XE0fRK9XIg7jwNL2aaYkZfNuUPb
	QV9nM++LvFevOz61/biAr5c8jwtClN3CN3uYR4XBkVaCPrSXot7YPB1ItscD2ZJj2IZ4Oc6Mhz4
	l1k6mcGcT1Y2tlgWhCWkk4+AvoNF4qqTIluxtpYxv3KmtIYeP+X6W+ek8jAnNMOLY6QZG9J/g8w
	e87AVF8EPXRsN/cvgLtxY+vQ==
X-Received: by 2002:a05:6402:2345:b0:698:6084:db7f with SMTP id 4fb4d7f45d1cf-69c5ef9b963mr4310709a12.10.1783945934103;
        Mon, 13 Jul 2026 05:32:14 -0700 (PDT)
Received: from localhost ([140.209.217.211])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-69ac41d7ceesm8025465a12.23.2026.07.13.05.32.13
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 13 Jul 2026 05:32:13 -0700 (PDT)
Date: Mon, 13 Jul 2026 14:32:10 +0200
From: Jiri Pirko <jiri@resnulli.us>
To: sashiko-reviews@lists.linux.dev
Cc: Vasily Gorbik <gor@linux.ibm.com>, linux-s390@vger.kernel.org, 
	mkoutny@suse.com, Alexander Gordeev <agordeev@linux.ibm.com>, tj@kernel.org, 
	Heiko Carstens <hca@linux.ibm.com>, hannes@cmpxchg.org
Subject: Re: [PATCH rdma-next 02/13] RDMA/core: Handle device name conflicts
 when changing net namespace
Message-ID: <alTaFHqRYVikIHw0@FV6GYCPJ69>
References: <20260709095532.855647-1-jiri@resnulli.us>
 <20260709095532.855647-3-jiri@resnulli.us>
 <20260710095627.CDAD21F00A3D@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: sashiko-reviews@lists.linux.dev
List-Id: <sashiko-reviews.lists.linux.dev>
List-Subscribe: <mailto:sashiko-reviews+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:sashiko-reviews+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20260710095627.CDAD21F00A3D@smtp.kernel.org>

Fri, Jul 10, 2026 at 11:56:27AM +0200, sashiko-bot@kernel.org wrote:
>Thank you for your contribution! Sashiko AI review found 1 potential issue(s) to consider:
>- [High] User-triggerable WARN() during concurrent RDMA device unregistration and netns exit, leading to DoS on panic_on_warn systems.
>--
>
>--- Patch [2]: [PATCH rdma-next 02/13] RDMA/core: Handle device name conflicts when changing net namespace ---
>commit 05c3f87e2143d43f2f1e27d0f13e1b1f97f35bab
>Author: Jiri Pirko <jiri@nvidia.com>
>
>RDMA/core: Handle device name conflicts when changing net namespace
>
>This commit prepares namespace moves for per-netns names by checking
>user-initiated moves for destination-name conflicts before disabling the
>device. It also ensures teardown moves detach from the exiting namespace
>even if fallback naming fails.
>
>> diff --git a/drivers/infiniband/core/device.c b/drivers/infiniband/core/device.c
>> --- a/drivers/infiniband/core/device.c
>> +++ b/drivers/infiniband/core/device.c
>> @@ -1160,8 +1168,17 @@ static void rdma_dev_exit_net(struct net *net)
>>  
>>  		/*
>>  		 * If the real device is in the NS then move it back to init.
>> +		 * Provide a fallback pattern so a name conflict in init_net
>> +		 * cannot make the teardown move fail.
>>  		 */
>> -		rdma_dev_change_netns(dev, net, &init_net);
>> +		if (net_eq(net, read_pnet(&dev->coredev.rdma_net))) {
>> +			ret = rdma_dev_change_netns(dev, net, &init_net,
>> +						    "ibdev%d");
>> +			if (ret)
>> +				WARN(1,
>> +				     "Failed to move RDMA device %s to init_net on netns exit: %d\n",
>> +				     dev_name(&dev->dev), ret);
>
>[Severity: High]
>Can this WARN(1) be triggered by a concurrent device unregistration?
>
>Looking at rdma_dev_change_netns(), if a device is concurrently unregistered,
>the refcount drops to 0 and the function legitimately returns -ENODEV:
>
>drivers/infiniband/core/device.c:rdma_dev_change_netns() {
>    ...
>    if (refcount_read(&device->refcount) == 0 ||
>        !net_eq(cur_net, read_pnet(&device->coredev.rdma_net))) {
>            ret = -ENODEV;
>            goto out;
>    }
>    ...
>}
>
>If rdma_dev_exit_net() runs concurrently with device unregistration (e.g.,
>module unload, PCI hotplug, or link deletion of a software RDMA device like
>RXE), rdma_dev_change_netns() will return -ENODEV and trigger this warning.
>
>Because an unprivileged user can acquire CAP_NET_ADMIN in a user namespace,
>create an RXE device, and race netns deletion with device deletion, could
>this be used to intentionally crash a host configured with panic_on_warn=1?

Fixed.


>
>> +		}
>>  
>>  		put_device(&dev->dev);
>>  		down_read(&devices_rwsem);
>
>-- 
>Sashiko AI review · https://sashiko.dev/#/patchset/20260709095532.855647-1-jiri@resnulli.us?part=2
