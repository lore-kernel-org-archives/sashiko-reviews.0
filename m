Received: from mail-wm1-f50.google.com (mail-wm1-f50.google.com [209.85.128.50])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 00C3731326B
	for <sashiko-reviews@lists.linux.dev>; Fri, 17 Jul 2026 14:07:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.50
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784297228; cv=none; b=eZxkRuxkb7V30iufZZrgcXNumaY5xvuM+fApeaBWvc8HQO4MZ9v6wJZSpHgx3lQF1Kba41aCxIv34s7krrFFRMdEAt+ZU14fefdcQVaKxOmfB2fFjhgfrE3dO5wjhuU4GmpbYx2eAzNTN180tWdxLc/hAcJXzGCcNQsX9LrU2TM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784297228; c=relaxed/simple;
	bh=niIAMeWp3sfWWDNS+nr3CeGnrS7IWhMy8sB3hlByAiw=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=bW2AxXYws1KQrgTtugHJ1R/M6HRZhmQsJDy7/EVPJG0/74/EnVWazipcpy+sdclUrqaJpJUmewdjmsS0S+laZoZ9UjjvsAApultWE1o0+dd6IoB2OXZxoe7WNgvjBLrlnef+cuVrGg2UZmpl7lGocV/BMYJBO2Sr6lpO+xg9ums=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=resnulli.us; spf=none smtp.mailfrom=resnulli.us; dkim=pass (2048-bit key) header.d=resnulli-us.20251104.gappssmtp.com header.i=@resnulli-us.20251104.gappssmtp.com header.b=TY53abMD; arc=none smtp.client-ip=209.85.128.50
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=resnulli.us
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=resnulli.us
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=resnulli-us.20251104.gappssmtp.com header.i=@resnulli-us.20251104.gappssmtp.com header.b="TY53abMD"
Received: by mail-wm1-f50.google.com with SMTP id 5b1f17b1804b1-493f4638f4aso37704225e9.3
        for <sashiko-reviews@lists.linux.dev>; Fri, 17 Jul 2026 07:07:03 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=resnulli-us.20251104.gappssmtp.com; s=20251104; t=1784297222; x=1784902022; darn=lists.linux.dev;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :content-type:mime-version:references:message-id:subject:cc:to:from
         :date:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=4ZBETXE+xVYVuA7yrbznrJ7UH+vvhmgnrffSRGRbFAk=;
        b=TY53abMDuHpZceGhgiUBRB+CNKQOSN0+A7djnewiBMowniS5sDSarneifIPQWgvrLD
         GVDwauDdFKDa8EWTVTFaOOFdS9sPiBLSWN2RxZTYeL5uvMrV3+GHcQSvJS8QWoQWJluw
         4Q8u26EH4j2R0XDUl03A08QfU4Fju1ZPPzd8F7Yhq+wZMaHTqGnk3+DaJ5aEhfJ9QXPL
         uNepAMJeaLZc/P6bQVYb6AwpwYgpIESttUS05iduzdqTTYyv0H/SgTNuXQBLrcdPB3YZ
         LoD7NMbLLRv252RamASVkRRVkRHvQvzc5CsY35lRQTEPquBPWHNgpTUADDWKlsrBe2nb
         ml5g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1784297222; x=1784902022;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :content-type:mime-version:references:message-id:subject:cc:to:from
         :date:x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=4ZBETXE+xVYVuA7yrbznrJ7UH+vvhmgnrffSRGRbFAk=;
        b=OmRsx3Jl7LOrJ5ARclEI98AZQnmXtq1nlnwTcLn1hoD6aPwokGgv05IN8ke0eSa6xG
         XNGmBehoXzdNruJKDK27EBWuo3Ffh3tAepM8Y3vF2JrftqqqBl/YvsFMuhON3S8eY97J
         LmIdp5j/+dDNxYYctYRQ21NCETGmGGQ+MMbWuL2f9O3dQvBqC02eUh8DgQVakC/YlCzR
         DXiw6yw9X8EdRMrWQZpseynDbhiMtqIvy/hspxv5wY2bt0Z54MquieOdI76hAYSBqvOn
         bTg5uBTmac44KCbeUZjpdVSH1TIpIHuLxfFPo/LWEmtqaLgxQj/bvUBibxELw0ITnZn4
         +eGw==
X-Gm-Message-State: AOJu0YyY5ZMKsS4BT1lenyZSEN/J1tyvubjeIUnYPKn2zOOqD9N+pNJ+
	1nZGRD11dh+ewCX6a/JI3Zdxgx9EIAXQxtpR0OnbEU72gBYF8x4gjKN3EZ8wc9G/p3WTPWhOEeI
	G5dP5
X-Gm-Gg: AfdE7cn4aJKqGMNghdaEcZZPhthjkCVbRqYkhpFBdpogM6iR6rwKVxsBROVbajoq3PT
	r3GASnmvqDu5bcNbrptS2f7C6kAwe3QZkGIh4HpNuAzuJotNDb9g4xx145fCuNK/J0RVCr8BzuV
	vlZnREnIvDsIDhYa2jL/Cmein7z2puDP/qKKgsVnD6SQhN73M9b43t8a60mRBcRLRHzQpn36hlw
	miazbZdXu3tulwgetZqh78wyQMSfy2eOZ3YE5Eo0j8306grTdJ+lFN8SRM4xPNmUrkNVnsmrfXB
	zWLvTApbcrDgXb3/OMEO+6XbkEfK2W6zBHdDIw98vDWGOUKMx3jIBCQLYKNR2/bnEchH0M4S+js
	braCQuVqtt4Gm7vHE7f85RjvKz9GYnMLLA7CiGGzENxOFu62AmzislKfwFKWodrymfEW5vpmqqD
	gMxUlk78qIdWA=
X-Received: by 2002:a05:600c:3553:b0:492:3773:a230 with SMTP id 5b1f17b1804b1-4954a50e75dmr34323345e9.27.1784297221977;
        Fri, 17 Jul 2026 07:07:01 -0700 (PDT)
Received: from localhost ([140.209.217.211])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4954a2edbe4sm53164435e9.12.2026.07.17.07.07.01
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 17 Jul 2026 07:07:01 -0700 (PDT)
Date: Fri, 17 Jul 2026 16:06:57 +0200
From: Jiri Pirko <jiri@resnulli.us>
To: sashiko-reviews@lists.linux.dev
Cc: Heiko Carstens <hca@linux.ibm.com>, tj@kernel.org, mkoutny@suse.com, 
	hannes@cmpxchg.org, linux-s390@vger.kernel.org, Vasily Gorbik <gor@linux.ibm.com>, 
	Alexander Gordeev <agordeev@linux.ibm.com>
Subject: Re: [PATCH rdma-next v3 02/14] RDMA/core: Handle device name
 conflicts when changing net namespace
Message-ID: <alo27vVuMMAb303f@FV6GYCPJ69>
References: <20260716132316.1495242-1-jiri@resnulli.us>
 <20260716132316.1495242-3-jiri@resnulli.us>
 <20260717132424.DD4661F000E9@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: sashiko-reviews@lists.linux.dev
List-Id: <sashiko-reviews.lists.linux.dev>
List-Subscribe: <mailto:sashiko-reviews+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:sashiko-reviews+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20260717132424.DD4661F000E9@smtp.kernel.org>

Fri, Jul 17, 2026 at 03:24:24PM +0200, sashiko-bot@kernel.org wrote:
>Thank you for your contribution! Sashiko AI review found 1 potential issue(s) to consider:
>
>Pre-existing issues:
>- [High] Skipping device_rename() during namespace teardown fallback leaves the sysfs kobject tagged with a dying namespace, leading to Use-After-Free.
>--
>
>--- Patch [2]: [PATCH rdma-next v3 02/14] RDMA/core: Handle device name conflicts when changing net namespace ---
>commit 8e5328bda494a60bcfbc9c96c81fb95f503e0fdd
>Author: Jiri Pirko <jiri@resnulli.us>
>
>RDMA/core: Handle device name conflicts when changing net namespace
>    
>Prepare namespace moves for per-netns names. Check user-initiated moves for
>destination-name conflicts before disabling the device, keep same-netns
>moves as no-ops, and make teardown moves detach from the exiting namespace
>even if fallback naming fails.
>
>> diff --git a/drivers/infiniband/core/device.c b/drivers/infiniband/core/device.c
>> index de610f52c9b23..b55fb075d0aef 100644
>> --- a/drivers/infiniband/core/device.c
>> +++ b/drivers/infiniband/core/device.c
>[ ... ]
>> @@ -1704,30 +1778,63 @@ static int rdma_dev_change_netns(struct ib_device *device, struct net *cur_net,
>>  		goto out;
>>  	}
>>  
>[ ... ]
>>  	/*
>> -	 * At this point no one can be using the device, so it is safe to
>> -	 * change the namespace.
>> +	 * Recompute the destination name under the write side of devices_rwsem
>> +	 * now that the device is disabled, closing races with a concurrent
>> +	 * registration or rename, then publish the new namespace at the sysfs
>> +	 * level.
>>  	 */
>> -	write_pnet(&device->coredev.rdma_net, net);
>> +	down_write(&devices_rwsem);
>> +	ret = rdma_dev_pick_netns_name(device, net, fallback_pattern, buf,
>> +				       sizeof(buf), &new_name);
>> +	if (ret) {
>> +		if (fallback_pattern) {
>> +			WARN(1,
>> +			     "%s: failed to pick device name during namespace teardown: %d\n",
>> +			     __func__, ret);
>> +			write_pnet(&device->coredev.rdma_net, net);
>> +			ret = 0;
>> +		}
>> +		goto rename_done;
>> +	}
>>  
>> -	down_read(&devices_rwsem);
>> -	/*
>> -	 * Currently rdma devices are system wide unique. So the device name
>> -	 * is guaranteed free in the new namespace. Publish the new namespace
>> -	 * at the sysfs level.
>> -	 */
>> -	ret = device_rename(&device->dev, dev_name(&device->dev));
>> -	up_read(&devices_rwsem);
>> +	write_pnet(&device->coredev.rdma_net, net);
>> +	ret = device_rename(&device->dev, new_name);
>>  	if (ret) {
>> -		dev_warn(&device->dev,
>> -			 "%s: Couldn't rename device after namespace change\n",
>> -			 __func__);
>> -		/* Try and put things back and re-enable the device */
>> -		write_pnet(&device->coredev.rdma_net, cur_net);
>> +		if (fallback_pattern) {
>> +			WARN(1,
>> +			     "%s: failed to rename device during namespace teardown: %d\n",
>> +			     __func__, ret);
>> +			ret = 0;
>> +		} else {
>
>[Severity: High]
>This isn't a bug introduced by this patch, but does skipping device_rename()
>during namespace teardown fallback leave the sysfs kobject tagged with a dying
>namespace?
>
>If rdma_dev_pick_netns_name() fails and the code jumps to rename_done, or if
>device_rename() fails and the error is suppressed by setting ret = 0, the
>kernfs_node->ns tag for the device's sysfs directory would appear to remain
>pointing to the dying network namespace.
>
>Once the network namespace is freed, couldn't a subsequent sysfs traversal or
>lookup calling kernfs_ns_id(kn->ns) dereference the freed pointer and result
>in a use-after-free?

unrelated to this patch/set. Ignoring.


>
>> +			dev_warn(&device->dev,
>> +				 "%s: Couldn't rename device after namespace change\n",
>> +				 __func__);
>> +			/* Try and put things back and re-enable the device */
>> +			write_pnet(&device->coredev.rdma_net, cur_net);
>> +		}
>> +	} else {
>> +		strscpy(device->name, dev_name(&device->dev),
>> +			IB_DEVICE_NAME_MAX);
>>  	}
>> +rename_done:
>> +	up_write(&devices_rwsem);
>>  
>>  	ret2 = enable_device_and_get(device);
>>  	if (ret2) {
>
>-- 
>Sashiko AI review · https://sashiko.dev/#/patchset/20260716132316.1495242-1-jiri@resnulli.us?part=2
