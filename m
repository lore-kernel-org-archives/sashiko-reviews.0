Received: from mail-wr1-f49.google.com (mail-wr1-f49.google.com [209.85.221.49])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5A4012DEA89
	for <sashiko-reviews@lists.linux.dev>; Mon, 13 Jul 2026 12:17:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.49
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783945049; cv=none; b=XTZJmqJildW6AUHHff5NXjGbfU7qXZhQigZM1q68KFWlR9uYAqpKhmnmcwmTdgMWcXOyihwrw+R/Kt1vAXaFF2xbIPXaFTxKBdZmX6CtIGYI5LVrJzU9mTSPF6gPn+xfTGvh3N3v4ynbLfqH8OIgZOPj6gH6nFgcMJbzjYL9veI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783945049; c=relaxed/simple;
	bh=9i51v8tN1xgJRrJ9WSgLuUY1ovtA8zvPwAWbhpfAuAY=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=P5E7NxQgHd1EnGBtqysShJ798Hz3Iw3K3tAHWKjsK7AYe2HCjrjBFzfyXjaPz89EnimBLS/y8bk8S/nPiEdCswk+rEBO56LGWT6Z51eClJK0/sTd2O+wE9cBtV1jr5iZBMco8Y+mciQuxFmEOD0VHURihGNw4y/iReNiS61nbXo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=resnulli.us; spf=none smtp.mailfrom=resnulli.us; dkim=pass (2048-bit key) header.d=resnulli-us.20251104.gappssmtp.com header.i=@resnulli-us.20251104.gappssmtp.com header.b=R18zIUDO; arc=none smtp.client-ip=209.85.221.49
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=resnulli.us
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=resnulli.us
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=resnulli-us.20251104.gappssmtp.com header.i=@resnulli-us.20251104.gappssmtp.com header.b="R18zIUDO"
Received: by mail-wr1-f49.google.com with SMTP id ffacd0b85a97d-4758bd3731bso2097063f8f.0
        for <sashiko-reviews@lists.linux.dev>; Mon, 13 Jul 2026 05:17:23 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=resnulli-us.20251104.gappssmtp.com; s=20251104; t=1783945042; x=1784549842; darn=lists.linux.dev;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :content-type:mime-version:references:message-id:subject:cc:to:from
         :date:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=6CvvO5eNtwchP3KekI8fxlbAhhKHVpfXdj5FV7ePCzQ=;
        b=R18zIUDOlynyBC0i6UR9fC06sTX8Ns6sIIsJ+RNjB6GuNWo4a0NJHWOwcNNdNFI54I
         n7yCIYbCIxMQ51W7CL0makQZsL0vCBw5ojQ0kYNiQ9+3OMMwIrlxboTE1V1UpiOwvfBo
         nLbi+JWeIapyZt1qrqT3i5/hJzwdnekaZs/dhQs5pWp63UrM2lJAHUgtToFE8k+sYo3L
         H8nfiXrfq+O78qnhv/yt0DJOduaPymR4m26LU5APM/I7tqK4gjBKm8eBygnE2DXTv8Vp
         Ip6uRm5Alubj4ngfCVeDiEO5+cZrfCA9AlP01D/Zq0jCdkbn2yUtj3eYY01rRmysR8FT
         nQlA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1783945042; x=1784549842;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :content-type:mime-version:references:message-id:subject:cc:to:from
         :date:x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=6CvvO5eNtwchP3KekI8fxlbAhhKHVpfXdj5FV7ePCzQ=;
        b=iYu7hpOJl8YbFsUZ3RKRpko28NpmLIfPuHopn98Y8m7F05MkM6aJPHk3yHV5o2MT+Y
         F5PVq8iXcGLJnSlwA0GmYtmDIYiGQGBd3yUGBBpqEMkqOzomqf5Uqtmd/XPbeKP5mb2n
         Aem8tTFB+Jo81iMYIDjf8DW/Y7r1HySMH8IuM0qc6amooe7A8IyJOs0IcxHyd379BNOd
         aJG5E0xDtbPEtpXR6i3peE/3okLDGkvMClEy+QFyez+eUSWfM6UBjazl/jUbAcy0IQ3Y
         5YdncpOv+ZbKcnJnQrnYy6ivQUPo1Oz0c0wzh01/OTjdTp7drYEbkF2WX7i/hPcl9V4q
         MDhw==
X-Gm-Message-State: AOJu0Yyj+DCS3Q4rU4hcsPxtsUYVq6Y5jU0YQd7LY4okBbOduq65CzW+
	VDakbl7vi4iRJ09hWPXH6R5BZo80zACdTdlgesTZsQvOXA7mUoBGJOBpaEnD+xJJEKbJojA4neM
	ZB99C
X-Gm-Gg: AfdE7cn2ERbLjeXGeeKJymhlHQW1s6Yu5S8u95EBwt+79zjAhGbE/PHy/MROVKboitF
	gShh/Hy683Jl8U5W6YTxuoEz1QkVzjMM1IQRdN2xZY7UDESZwwfaFiLtgFJk96OwRBuXKCMfOWT
	jvkRq6DIy75UPOGoHGYIpUQpBWyvbKtYA8L9G+yqgO37/4s1YX0dxSW+8Wmtg+cJW5jANk4uHNA
	M9FK6jaUo2u/o8dMPirqv8bB4fKrjzZ8w1z6cCyn4VT+EFQ17NX467OM7oSGQGSWzgqoX01fbWR
	4Gj1lqX/WqqmhBr+kyWspppRiuq//saZICT1r+qTOqC6ols/JPYQOErMBv6srbMW5l5fRZv1AwR
	pR7Lfi6xXzfVup5RPU7TsSmB/U5QnRFtxs0T+ldYeEbPsaf+RH4ALsZ7P79A4G9ZXYIK/+Gs9t3
	grPDTzFFSH7toYRasZQf9/Kw==
X-Received: by 2002:a05:6000:2307:b0:474:88ef:cdec with SMTP id ffacd0b85a97d-47f2dc79e64mr11292771f8f.6.1783945042394;
        Mon, 13 Jul 2026 05:17:22 -0700 (PDT)
Received: from localhost ([140.209.217.211])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-47aa09608d4sm85576467f8f.25.2026.07.13.05.17.21
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 13 Jul 2026 05:17:22 -0700 (PDT)
Date: Mon, 13 Jul 2026 14:17:18 +0200
From: Jiri Pirko <jiri@resnulli.us>
To: sashiko-reviews@lists.linux.dev
Cc: mkoutny@suse.com, Vasily Gorbik <gor@linux.ibm.com>, 
	hannes@cmpxchg.org, tj@kernel.org, linux-s390@vger.kernel.org, 
	Heiko Carstens <hca@linux.ibm.com>, Alexander Gordeev <agordeev@linux.ibm.com>
Subject: Re: [PATCH rdma-next 03/13] RDMA/core: Support renaming a device
 when changing its net namespace
Message-ID: <alTXKYuAhGdT_oG_@FV6GYCPJ69>
References: <20260709095532.855647-1-jiri@resnulli.us>
 <20260709095532.855647-4-jiri@resnulli.us>
 <20260710095626.D434B1F000E9@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: sashiko-reviews@lists.linux.dev
List-Id: <sashiko-reviews.lists.linux.dev>
List-Subscribe: <mailto:sashiko-reviews+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:sashiko-reviews+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20260710095626.D434B1F000E9@smtp.kernel.org>

Fri, Jul 10, 2026 at 11:56:26AM +0200, sashiko-bot@kernel.org wrote:
>Thank you for your contribution! Sashiko AI review found 1 potential issue(s) to consider:
>- [Medium] The destination device name requested by userspace is ignored during a net namespace move because NULL is hardcoded in the netlink handler.
>--
>
>--- Patch [3]: [PATCH rdma-next 03/13] RDMA/core: Support renaming a device when changing its net namespace ---
>commit 481a893ec5cd10a7f8be8c8de249d86cc283c470
>Author: Jiri Pirko <jiri@nvidia.com>
>
>RDMA/core: Support renaming a device when changing its net namespace
>
>This patch updates the RDMA core to allow requesting a destination device
>name when moving a device to a different network namespace. It modifies
>ib_device_set_netns_put to take a requested name and implements the naming
>rules during namespace teardown.
>
>> diff --git a/drivers/infiniband/core/nldev.c b/drivers/infiniband/core/nldev.c
>> index 3a9ec43a16f1a..3540cb0b9d4fb 100644
>> --- a/drivers/infiniband/core/nldev.c
>> +++ b/drivers/infiniband/core/nldev.c
>> @@ -1194,7 +1194,7 @@ static int nldev_set_doit(struct sk_buff *skb, struct nlmsghdr *nlh,
>>  		u32 ns_fd;
>>  
>>  		ns_fd = nla_get_u32(tb[RDMA_NLDEV_NET_NS_FD]);
>> -		err = ib_device_set_netns_put(skb, device, ns_fd);
>> +		err = ib_device_set_netns_put(skb, device, ns_fd, NULL);
>
>[Severity: Medium]
>Does this hardcode NULL instead of extracting and passing the user-provided
>device name?
>
>The commit message mentions allowing namespace moves to request a destination
>device name, but it appears ib_device_set_netns_put is always called with
>NULL here.
>
>How does this interact with the rename logic in nldev_set_doit? If a user
>supplies both the RDMA_NLDEV_ATTR_DEV_NAME and RDMA_NLDEV_NET_NS_FD
>attributes in the netlink command, will the code enter the rename logic first
>and return, completely skipping the net namespace change instead of moving and
>renaming the device?

False positive. "RDMA/nldev: Allow setting the device name while changing
net namespace" is doing this.



>
>>  		if (err == -EEXIST)
>>  			NL_SET_ERR_MSG(extack,
>>  				       "Device name already exists in the target net namespace");
>
>-- 
>Sashiko AI review · https://sashiko.dev/#/patchset/20260709095532.855647-1-jiri@resnulli.us?part=3
