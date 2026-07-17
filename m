Received: from mail-wm1-f42.google.com (mail-wm1-f42.google.com [209.85.128.42])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1C9214229A6
	for <sashiko-reviews@lists.linux.dev>; Fri, 17 Jul 2026 14:08:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.42
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784297307; cv=none; b=fHifN4NbTQB4Jyl6rxK3qJBQxkkmWPuHUxvIdC3TvveN3hyAtjZP/aEhEPpbLgmzez14kUUkIZBPr6pnanlQgmscD0l0LLedz6T0+jrtQztSfunSFY+c3ZyR/JjAdyDrWn3D9ChX6NP1yKx4g9KW1Y3mRev4agx3AKUcV359O9M=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784297307; c=relaxed/simple;
	bh=XHrLfrqMhOnwSAqqJE2eiDYz9T7bCK0U/3kXl0cj3MQ=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=VGuZj9v/mnq6V5b+EIA1A3NuOVh7F3H+xfyEXcEU8LwPrR+Y0aAcOeStcjiCWZsjdMxvXDkOM4jgq0rc5rX8xxXrYKk5Tt89tLxWOYuRLI2TnrNo1I7zl5yvmWZ/leh4OwqFif10Tzk00NAxqbl93dR5F9Byz32G2yp6lVs+eW4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=resnulli.us; spf=none smtp.mailfrom=resnulli.us; dkim=pass (2048-bit key) header.d=resnulli-us.20251104.gappssmtp.com header.i=@resnulli-us.20251104.gappssmtp.com header.b=SE6++Dli; arc=none smtp.client-ip=209.85.128.42
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=resnulli.us
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=resnulli.us
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=resnulli-us.20251104.gappssmtp.com header.i=@resnulli-us.20251104.gappssmtp.com header.b="SE6++Dli"
Received: by mail-wm1-f42.google.com with SMTP id 5b1f17b1804b1-490cf322ed0so55997575e9.1
        for <sashiko-reviews@lists.linux.dev>; Fri, 17 Jul 2026 07:08:23 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=resnulli-us.20251104.gappssmtp.com; s=20251104; t=1784297302; x=1784902102; darn=lists.linux.dev;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :content-type:mime-version:references:message-id:subject:cc:to:from
         :date:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=gDShIOzPBvzJyBY084ZK4U4pFvb4W0NeDIeOEkdFeUI=;
        b=SE6++DliTW3xj5+tRq0tykZ2kWjPLD32jL28Oma/5p+DoIVs0NVSczbs1x8/iMC8b9
         lPb7I1y+ZeRYD/8iD6mfEyD9h9zdlkXRgT7eImRzfMtQ4XEfU4DnKyKqmVArELWJ7guz
         YOm4q/Rb7UzZu28ihInfPWVzmzllF83IIYT0D0e98TMScmI0mBOG6kXNSUmAXcq523v2
         9H0iRC1GZUNoUkfDvOuRDViP+9+t/Ztap5YYqpbUwnafX1rg8BWHtDF2Br4euu1WdwuS
         mCplnwybHhHLZy4h8i8C3daDdNYjxzQDaSJr8HkGL/Ccyt5ev7m3vNv+8BjKXw6xEReY
         22CA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1784297302; x=1784902102;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :content-type:mime-version:references:message-id:subject:cc:to:from
         :date:x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=gDShIOzPBvzJyBY084ZK4U4pFvb4W0NeDIeOEkdFeUI=;
        b=QWm+owH/NRPAK6iZWmFSILx9P4V+YznHvYx5kjRwrVMG+ovMMD891fVJ9EwIJkh02u
         g9KL/dXlH8kPb1H3VZGFCwSZF+R0dpbCJXCCrhCk3FGPQ8LtxzN9klViZ2llgP4Hsd7x
         ZjhsI3iJrW8RtvLBlj7Ht5le9PeskYhhRXnEI+/Z6KXTS3n0TfvPdYVe9FKUvZagu0mj
         8nRGsaUf0Hujcbl3ZaWCWXqhzmhkQjQtpt95NW1PD+Py8/ZgOazWLoaPl5ZebbX8Q3Ro
         QahMC+NmcESQKjopVkBZ8nuj8T85CjJ3pqHGCJBmmIfevlHbg5gBj9HIhaBBAwFSMCz5
         wQOw==
X-Gm-Message-State: AOJu0YyHhCaT9WWZDmmlNS8KVBxVMMWjJxdiDbypXC3dpxsNEubmRWve
	ZT9Z540jykBQscom30Fapcg9o9o6v7R42FEyPSykQVPb37RuUsY7c1ICAdIVwJRak5aiyD9SAPz
	YGGAJ
X-Gm-Gg: AfdE7ck4NyjzQnvobIuDdUewGiP5VUFvUssPnz9Fvm3OMKQUEYuuSCCtT1/BoUQya/p
	R9PtJoPldOjaLyROMF1yQUltknqD9GGp21LAFHfvtgcW241ljrtRw61D7f/A9Z/MbaBJiECkwjv
	j/oGY+Od9HQCOMyl9lHhGJ9bvthEb1WsdKiJrqI9c6Nz4LjKD3wrJYulIaI1ezSjnh1fJc14phR
	yUC3l9uV9T5AvTCiUk1BNsNur6QX6217DUHuOvFJeXWzwlIrTgHZTU/zANEtLYYS+2e8K7QPp6r
	E0hkX9Ld/OwAGmhfdkF+vq1zQcXE9iFkQr9zAkM5V7K4FSt8tdDSRep7p2uDdzH0Fdq0dOoIhAt
	2nQekGVkWH5blU4mgS5NhPNXnXkHaLCXOOac/CY/Tdj9dmt2KrsbziG/F0U8ei9U3HHalSRLv6G
	TrBhy4qk2cZOc=
X-Received: by 2002:a05:600c:3b91:b0:495:4c62:9d43 with SMTP id 5b1f17b1804b1-4954c629e5emr24722955e9.34.1784297302169;
        Fri, 17 Jul 2026 07:08:22 -0700 (PDT)
Received: from localhost ([140.209.217.211])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-49549c9c929sm48330635e9.12.2026.07.17.07.08.21
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 17 Jul 2026 07:08:21 -0700 (PDT)
Date: Fri, 17 Jul 2026 16:08:18 +0200
From: Jiri Pirko <jiri@resnulli.us>
To: sashiko-reviews@lists.linux.dev
Cc: tj@kernel.org, Alexander Gordeev <agordeev@linux.ibm.com>, 
	hannes@cmpxchg.org, mkoutny@suse.com, Heiko Carstens <hca@linux.ibm.com>, 
	Vasily Gorbik <gor@linux.ibm.com>, linux-s390@vger.kernel.org
Subject: Re: [PATCH rdma-next v3 06/14] net/smc: Look up the pnetid ib device
 within the net namespace
Message-ID: <alo3Qx6ou7ElY6Un@FV6GYCPJ69>
References: <20260716132316.1495242-1-jiri@resnulli.us>
 <20260716132316.1495242-7-jiri@resnulli.us>
 <20260717132427.82BA81F000E9@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: sashiko-reviews@lists.linux.dev
List-Id: <sashiko-reviews.lists.linux.dev>
List-Subscribe: <mailto:sashiko-reviews+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:sashiko-reviews+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20260717132427.82BA81F000E9@smtp.kernel.org>

Fri, Jul 17, 2026 at 03:24:27PM +0200, sashiko-bot@kernel.org wrote:
>Thank you for your contribution! Sashiko AI review found 1 potential issue(s) to consider:
>
>Pre-existing issues:
>- [Critical] `smc_pnet_find_ib()` and `smc_pnet_find_smcd()` return unreferenced pointers leading to a Use-After-Free during concurrent device removal.
>--
>
>--- Patch [6]: [PATCH rdma-next v3 06/14] net/smc: Look up the pnetid ib device within the net namespace ---
>commit 22bac16fe9606993a05fb72609386eb7b37fed92
>Author: Jiri Pirko <jiri@resnulli.us>
>
>net/smc: Look up the pnetid ib device within the net namespace
>
>Scope smc_pnet_find_ib() to the caller's net namespace so pnetid setup
>cannot bind to a same-named RDMA device from another namespace once names
>become per-netns.
>
>> diff --git a/net/smc/smc_pnet.c b/net/smc/smc_pnet.c
>> index 63e286e2dfaa8..ff9c9c35cc2f5 100644
>> --- a/net/smc/smc_pnet.c
>> +++ b/net/smc/smc_pnet.c
>
>[ ... ]
>
>> @@ -408,8 +413,8 @@ static int smc_pnet_add_eth(struct smc_pnettable *pnettable, struct net *net,
>>  	return rc;
>>  }
>>  
>> -static int smc_pnet_add_ib(struct smc_pnettable *pnettable, char *ib_name,
>> -			   u8 ib_port, char *pnet_name)
>> +static int smc_pnet_add_ib(struct smc_pnettable *pnettable, struct net *net,
>> +			   char *ib_name, u8 ib_port, char *pnet_name)
>>  {
>>  	struct smc_pnetentry *tmp_pe, *new_pe;
>>  	struct smc_ib_device *ib_dev;
>> @@ -419,7 +424,7 @@ static int smc_pnet_add_ib(struct smc_pnettable *pnettable, char *ib_name,
>>  	bool new_ibdev;
>>  
>>  	/* try to apply the pnetid to active devices */
>> -	ib_dev = smc_pnet_find_ib(ib_name);
>> +	ib_dev = smc_pnet_find_ib(net, ib_name);
>
>[Severity: Critical]
>This isn't a bug introduced by this patch, but does returning an unreferenced
>pointer from smc_pnet_find_ib() create a use-after-free window?
>
>Looking at smc_pnet_find_ib(), the function holds smc_ib_devices.mutex while
>finding the device, but then drops the lock and returns the raw ibdev pointer:
>
>net/smc/smc_pnet.c:smc_pnet_find_ib() {
>    ...
>    out:
>        mutex_unlock(&smc_ib_devices.mutex);
>        return ibdev;
>}
>
>If a concurrent device removal path acquires the mutex, removes the device
>from the list, and frees the struct smc_ib_device via kfree(), could the
>netlink thread subsequently dereference the freed pointer?
>
>>  	if (ib_dev) {
>>  		ibdev_applied = smc_pnet_apply_ib(ib_dev, ib_port, pnet_name);
>>  		if (ibdev_applied)
>
>For example, smc_pnet_apply_ib() re-acquires the mutex and writes to
>ib_dev->pnetid, and the caller then reads ib_dev->ibdev->name for logging.
>
>Does this same unreferenced pointer pattern also affect smc_pnet_find_smcd()
>when it is called immediately after?

Unrelated to this patch/set. Ignoring.


>
>-- 
>Sashiko AI review · https://sashiko.dev/#/patchset/20260716132316.1495242-1-jiri@resnulli.us?part=6
