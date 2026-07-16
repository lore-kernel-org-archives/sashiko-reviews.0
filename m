Received: from mail-wm1-f50.google.com (mail-wm1-f50.google.com [209.85.128.50])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EDC4B3A9612
	for <sashiko-reviews@lists.linux.dev>; Thu, 16 Jul 2026 07:19:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.50
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784186380; cv=none; b=s2JPwmMPUkzfdXqthgv3SY+zhvzS1An4+P1WcAblE2HAm+4Nm6IUgGPM/CEAkpqtmxJOP48tRUW2022ETjhfCNqonDKzpd7jYwo0FRoJd4q8CObaD5hSU9+sgK2A27KunmYcvIEKqH8s3jLouUlRS6Tj8cOTqS0AQqmVynAt2V4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784186380; c=relaxed/simple;
	bh=y4yHZGxT74a6MspUjQGJIAo038r7XXw7zxCaM56ULQQ=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=SLEWn5j+S5HwmB3HD6SqbtwxvXYg86foAg/uIruXAGH5dQkYqH8SH8lOJ1G0hBdNqCfwFu+7yVavED+FtYD6lD1zn5mMwRyT51sns3mfxyzMtSK4DQcslo5ou2vagJvCVstlens6S2b4vqClNIfQ/0CREq3Qy38Od0Upla+IfTs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=resnulli.us; spf=none smtp.mailfrom=resnulli.us; dkim=pass (2048-bit key) header.d=resnulli-us.20251104.gappssmtp.com header.i=@resnulli-us.20251104.gappssmtp.com header.b=Xnf/hPFF; arc=none smtp.client-ip=209.85.128.50
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=resnulli.us
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=resnulli.us
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=resnulli-us.20251104.gappssmtp.com header.i=@resnulli-us.20251104.gappssmtp.com header.b="Xnf/hPFF"
Received: by mail-wm1-f50.google.com with SMTP id 5b1f17b1804b1-493f4638f4aso24997415e9.3
        for <sashiko-reviews@lists.linux.dev>; Thu, 16 Jul 2026 00:19:30 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=resnulli-us.20251104.gappssmtp.com; s=20251104; t=1784186364; x=1784791164; darn=lists.linux.dev;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=Xo+t1wRWpFilpcKELYi9v4ykQHKL/M+Rp1FsYxe7xSM=;
        b=Xnf/hPFFbRjwLrZIfVOFm7JJmKgE86zquV6QS/31G9SDsdM09J0OL8lP9Dk7lAxroB
         LAnmkv/5AxhcYy4iwOz0EgSuy1XzTxuP9Mu4TNQDXGQsO6r3KfSUSl0KigDYlhXcNcuI
         ppS1Or6DC3oXFqZ5gNloFC34sGEK42joT17rChU78OHM3R35NFaCeDh+Ya+BC30C1QAg
         QyW3ILk2wwV8NX0hvR7apthl+ChtcBkNOC0jQX9ZYqVDm52oY1LBgwNLw8y6hQcwCCum
         A1r4XYqcBZKZXEDlj1PCBWTDAt7gFQQlxq4i1UAYvmVslu5s0LoklXfWQwFav9CRkKar
         mWJA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1784186364; x=1784791164;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=Xo+t1wRWpFilpcKELYi9v4ykQHKL/M+Rp1FsYxe7xSM=;
        b=e/YZPjho4kmEc15NAnvOVmBWDRr2+T7q6tvV4S4RsfjJWwnD4020T8rQTEHU2C98Oi
         AswZwrn+8juRvBPKGQM6zO6yFCsj2norBKE69ZDx7fG/ETNAdwV0HrdzjtQsLmjAAuKH
         jF7aaC6INpsoDOC5K3MsrIq2cCYm3DNZ9DD3M5i0fjFWE9tgdU+QkB5mni1PpqItWAFa
         NeUE855nJ/8ZVa+MzoX1tTPBNzb/chQV/m6ztDmAdDLkvygBPm02Gz6Cvto/mrx7KnJ9
         l7aIHyy9hFilez046kcBH7sJuCUJb5Q4uvlBr6WrjRrzf6cGvEHK07SdU5+t7i5lvjHO
         pz9w==
X-Gm-Message-State: AOJu0YxYWkmNm61XadF020vg8jvkdG5QBiwu9aN0eqcTL1YkhJo+I6Y9
	gI/ivr+SWytNzwt1/8LvYryORs5Be8oWqhUM42ZRtbyMlyg84O//FS1BCHroiuAFVXBTvh0x/Qg
	lFIbP
X-Gm-Gg: AfdE7clKt9Z21wcktmoGfqxJaTB1O/bvo7yhj+deKKObhWy1zOBnA6eE+xCi+ybgCJn
	Gvuod/1p5cKFWnKk5VLq8CUqwuRxNSiD0cuWrtXz3mseqtpe1Z7oS8optboex803Ie7VcHKiJvt
	bE7hFZ8ja64SE5kXx7VCuhFMtKZGwv2Qku/1ZJDMAGr/81aJ1Rdci0HRTgGhuLRXAXxRrGYo0gU
	+m8xkIZsYq/FKgKx3tUyBD3SkR+OpFgDSFn5cz+ccBp1fgTCqIoyvwb+ufzZ/VtiEuakUV8WECt
	N6fM7w7uEyVo9vB6MHB/eyHdEfVpp6XIFxIX49ihtxJM2HTJrGeJNQHrwUgGzA7v74bqjbnIYZ8
	flzlwn38I+6uVzavSqWoFHtzuW3SEs1DqzfiuFsuSMD852S1P1CMhi2l4vcAyl8RIsel0ucU88R
	2eZGsLbxFJEHs=
X-Received: by 2002:a05:600c:528d:b0:493:b4cf:d37f with SMTP id 5b1f17b1804b1-493f87e5e0dmr226727475e9.16.1784186364315;
        Thu, 16 Jul 2026 00:19:24 -0700 (PDT)
Received: from localhost ([140.209.217.211])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-49541e9a7bbsm36681925e9.13.2026.07.16.00.19.23
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 16 Jul 2026 00:19:23 -0700 (PDT)
Date: Thu, 16 Jul 2026 09:19:20 +0200
From: Jiri Pirko <jiri@resnulli.us>
To: sashiko-reviews@lists.linux.dev
Cc: tj@kernel.org, hannes@cmpxchg.org, mkoutny@suse.com, 
	linux-s390@vger.kernel.org, Heiko Carstens <hca@linux.ibm.com>, 
	Vasily Gorbik <gor@linux.ibm.com>, Alexander Gordeev <agordeev@linux.ibm.com>
Subject: Re: [PATCH rdma-next v2 06/14] net/smc: Look up the pnetid ib device
 within the net namespace
Message-ID: <aliF6MhKWL_iilRP@FV6GYCPJ69>
References: <20260714142927.1298897-1-jiri@resnulli.us>
 <20260714142927.1298897-7-jiri@resnulli.us>
 <20260715143043.4F3CC1F00A3A@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: sashiko-reviews@lists.linux.dev
List-Id: <sashiko-reviews.lists.linux.dev>
List-Subscribe: <mailto:sashiko-reviews+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:sashiko-reviews+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260715143043.4F3CC1F00A3A@smtp.kernel.org>

Wed, Jul 15, 2026 at 04:30:42PM +0200, sashiko-bot@kernel.org wrote:
>Thank you for your contribution! Sashiko AI review found 1 potential issue(s) to consider:
>
>Pre-existing issues:
>- [High] Returning unreferenced device pointers from `smc_pnet_find_ib()` and `smc_pnet_find_smcd()` causes Use-After-Free vulnerabilities when devices are concurrently removed.
>--
>
>--- Patch [6]: [PATCH rdma-next v2 06/14] net/smc: Look up the pnetid ib device within the net namespace ---
>commit 4529cf06709604767797679d2d489bb89001f950
>Author: Jiri Pirko <jiri@nvidia.com>
>Date:   Tue Jul 14 14:29:19 2026 +0000
>
>    net/smc: Look up the pnetid ib device within the net namespace
>    
>    Scope smc_pnet_find_ib() to the caller's net namespace so pnetid setup
>    cannot bind to a same-named RDMA device from another namespace once names
>    become per-netns.
>
>> diff --git a/net/smc/smc_pnet.c b/net/smc/smc_pnet.c
>> index 63e286e2dfaa8..ff9c9c35cc2f5 100644
>> --- a/net/smc/smc_pnet.c
>> +++ b/net/smc/smc_pnet.c
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
>[Severity: High]
>This is a pre-existing issue, but can this lead to a use-after-free?

Unrelated to this patch/set. Ignoring.
