Received: from mail-wm1-f48.google.com (mail-wm1-f48.google.com [209.85.128.48])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 906364963A4
	for <sashiko-reviews@lists.linux.dev>; Wed, 22 Jul 2026 11:02:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.48
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784718161; cv=none; b=mInUO4Rf7soPVC3a2gFSGbgX5uJwCWiJekyO7W+t9SDb9lU65TEDq6T6BFNAdvax04QtYDllEo5GcJgZFTfZXLSQB536JT6T6PUTzPAmD69ggAtjOumsj720bI9EaAPg8ga3F9SyVhZ+rjfwTIJP84o6mQ62QYUvidYdSJ5y/+4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784718161; c=relaxed/simple;
	bh=PoWrgcilFVeYgz1LhgAuDmmYN6nV3HHnRHjqs6a7dyU=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=Qy7uI5kpKUdG0HEb7lTqezfcj1TI2AB/NYOJ6Sx1o8wtBqAbZpHzAFXhCx7qKg63bJd/STMBqdFBpuZv76H9ft1xR6pOiu78KM8zBWAbIlM1KBWI+sjXBiO8pk7U+PiGRiwaE0rxqIRMn9C0Vt6uJTDoRsPgsTjK3+h/QWOebcI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=resnulli.us; spf=none smtp.mailfrom=resnulli.us; dkim=pass (2048-bit key) header.d=resnulli-us.20251104.gappssmtp.com header.i=@resnulli-us.20251104.gappssmtp.com header.b=BiGBxKyd; arc=none smtp.client-ip=209.85.128.48
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=resnulli.us
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=resnulli.us
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=resnulli-us.20251104.gappssmtp.com header.i=@resnulli-us.20251104.gappssmtp.com header.b="BiGBxKyd"
Received: by mail-wm1-f48.google.com with SMTP id 5b1f17b1804b1-49548aebcd8so35674585e9.3
        for <sashiko-reviews@lists.linux.dev>; Wed, 22 Jul 2026 04:02:37 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=resnulli-us.20251104.gappssmtp.com; s=20251104; t=1784718155; x=1785322955; darn=lists.linux.dev;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :content-type:mime-version:references:message-id:subject:cc:to:from
         :date:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=puSHlHrcZhn/nHHDjTYsLB+/0H1pwaKLgByKszhMo9Y=;
        b=BiGBxKydHkWBH7JIBBCluCfUb5DbAlhVwnDPw/996W74nYLkyP5YDx2V1rMViSmZSM
         QsxSbXzjl9DY3gvka/oUpvDPHZ2DhKhT6zzpQVP9v+5S9JjQD/zxRSw3iPZAZ7YRbqhw
         iFnhoXzkY4C8CVJo3IRlmJRK05nY6ZvxvFcg8pjbpdULze7LZl260iJaoIT5PV85kUJg
         Gt4ddBEh7r7Kdwo18NSBzrfOgdYJ8qMnKMAgp5UaZKBlmAD82ohni1MX8c1msVxlM2Jr
         3KVot5eVonkjntmryjjEP55eYtRxOLgrTuoDRv58W72fsCZ1zen9vpEJRpxlg5TyTO6n
         qZCw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1784718155; x=1785322955;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :content-type:mime-version:references:message-id:subject:cc:to:from
         :date:x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=puSHlHrcZhn/nHHDjTYsLB+/0H1pwaKLgByKszhMo9Y=;
        b=kZxlRM2LK5pitIJaI+O2qqMeRfIbptSlHU8SqnciPVoARn1dA/AJuUBzylXCfHSrF8
         3gt0Duwf/yhqlyNvFPJ6Uv6iUpBfOW10WOQYWeBXurGIEWKghEzrsGlpiM67KO4mfuvO
         2H35X7MymVo8Lw8+ZcsiXQSiEIxOeq5an2qpLrypWJ2oFXU1m61GPvVE/blWiDzBuP/h
         N+YTOjjqwrV6Y524d+nyp4weCc6K3WDpAb02P2mtQYOUYtG3Vx1Bh2C1A0OQDYa48vIg
         mh66xjp7vZT7+slKojCDYhNDGIienm+1jTfuSXlb1VIMTyIH0/K+AYYeC2gZ+jkhT1dC
         nBsA==
X-Gm-Message-State: AOJu0YyMzBbT5Sah9mkY5Q9HP9IAnCqtLQlrmrUDzZa8qEznOF+NwVhs
	DrPKkiW5fbMCQD/WjjE8fsX9Nat9LsCt6HoWbQVvwqvzgTlMW4WcfI3gwKQs231fHJ6XKPJXpeh
	vdYuh
X-Gm-Gg: AR+sD13FCgsSeWnBVYCq+ciI9zNTv8uiDVS3gfpQvZPaIMcKhLoTEEn8rr8b7v42Nb2
	q860CRlEtgYdacmVIS3FnyZTeJue/2oqSKbnYwvBDU4j4DZhyELwi3+LF3H8s/1BrGbjBRig5hM
	Nv26C62q3JoeIP3SFC2tZeIe8S3FL+jUH/LLw5HLz/ew/75v/9Lrd214gghzdM0pJrQHlxO6MXL
	/lF9vqQ159i554bDlEhP5OymuSjTuyWzCjNTH5gl1VtKv+5aDPWEB+lAGbEng6Eqba/ZngDGjWF
	IvI4nXC6v2vkxedcbIWmKAKYN8VsANEQRaz+qDcNbq9pS5qJd2rbXpAlMYhstveOjVv4QN595v1
	jMt0486y6fRJwcPlNFxkh+pK2JgIXh4FywJYeKIqtDkrFsVJ0hsEUMj2uFLBUp25lYRVVAWc9UW
	UITg2opBOa53yqC/K4/IWMWg==
X-Received: by 2002:a05:600c:4f92:b0:495:f31:7340 with SMTP id 5b1f17b1804b1-4954a3d06e4mr247929605e9.5.1784718155392;
        Wed, 22 Jul 2026 04:02:35 -0700 (PDT)
Received: from localhost ([140.209.217.211])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4956a500dbfsm57223855e9.6.2026.07.22.04.02.34
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 22 Jul 2026 04:02:34 -0700 (PDT)
Date: Wed, 22 Jul 2026 13:02:32 +0200
From: Jiri Pirko <jiri@resnulli.us>
To: sashiko-reviews@lists.linux.dev
Cc: tj@kernel.org, linux-s390@vger.kernel.org, 
	Vasily Gorbik <gor@linux.ibm.com>, Alexander Gordeev <agordeev@linux.ibm.com>, hannes@cmpxchg.org, 
	mkoutny@suse.com, Heiko Carstens <hca@linux.ibm.com>
Subject: Re: [PATCH rdma-next v3 03/14] RDMA/core: Support renaming a device
 when changing its net namespace
Message-ID: <amCjGk45wKDz5Z2u@FV6GYCPJ69>
References: <20260716132316.1495242-1-jiri@resnulli.us>
 <20260716132316.1495242-4-jiri@resnulli.us>
 <20260717132428.686441F00A3A@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: sashiko-reviews@lists.linux.dev
List-Id: <sashiko-reviews.lists.linux.dev>
List-Subscribe: <mailto:sashiko-reviews+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:sashiko-reviews+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20260717132428.686441F00A3A@smtp.kernel.org>

Fri, Jul 17, 2026 at 03:24:28PM +0200, sashiko-bot@kernel.org wrote:
>Thank you for your contribution! Sashiko AI review found 1 potential issue(s) to consider:
>- [Medium] The netlink handler fails to pass the requested device name to `ib_device_set_netns_put` during a network namespace change, and ignores namespace moves entirely if a rename is also requested.
>--
>
>--- Patch [3]: [PATCH rdma-next v3 03/14] RDMA/core: Support renaming a device when changing its net namespace ---
>commit 65e19be4bcb60d41b06e567081d99cee8fd2722c
>Author: Jiri Pirko <jiri@resnulli.us>
>
>RDMA/core: Support renaming a device when changing its net namespace
>
>This commit adds support for renaming a device at the same time it is moved
>to a new network namespace. It allows namespace moves to request a specific
>destination device name, falling back to a trusted kernel-controlled pattern
>if none is provided.
>
>> diff --git a/drivers/infiniband/core/nldev.c b/drivers/infiniband/core/nldev.c
>> index 32b6c4d68ca0a..77a7580801486 100644
>> --- a/drivers/infiniband/core/nldev.c
>> +++ b/drivers/infiniband/core/nldev.c
>> @@ -1195,7 +1195,7 @@ static int nldev_set_doit(struct sk_buff *skb, struct nlmsghdr *nlh,
>>  		u32 ns_fd;
>>  
>>  		ns_fd = nla_get_u32(tb[RDMA_NLDEV_NET_NS_FD]);
>> -		err = ib_device_set_netns_put(skb, device, ns_fd);
>> +		err = ib_device_set_netns_put(skb, device, ns_fd, NULL);
>
>[Severity: Medium]
>Does this hardcoded NULL prevent the core feature from being reached?
>
>It appears the newly added name parameter in ib_device_set_netns_put() is 
>never populated with the requested device name from the netlink attributes 
>in nldev_set_doit(). 
>
>If a user provides both RDMA_NLDEV_ATTR_DEV_NAME and RDMA_NLDEV_NET_NS_FD,
>the rename-during-move functionality cannot be used. Additionally, if the
>name attribute is parsed in a separate block, the function appears to take
>an early exit path, bypassing the namespace move entirely.
>
>Could this be updated to properly process both attributes and pass the
>requested device name during the move?

False possitive. Next patch changes this.


>
>>  		if (err == -EEXIST)
>>  			NL_SET_ERR_MSG(extack,
>>  				       "Device name already exists in the target net namespace");
>
>-- 
>Sashiko AI review · https://sashiko.dev/#/patchset/20260716132316.1495242-1-jiri@resnulli.us?part=3
