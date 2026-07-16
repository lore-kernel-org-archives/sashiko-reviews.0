Received: from mail-wm1-f41.google.com (mail-wm1-f41.google.com [209.85.128.41])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C189A3A8734
	for <sashiko-reviews@lists.linux.dev>; Thu, 16 Jul 2026 07:18:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.41
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784186338; cv=none; b=OjcvyzaAbh0VMdmkLfnYERA0DfkI1sy4Vrkg5UvyeBdhm0/1DWChCoq1XgD755b9RCWgtQ/p+iDsZbCO82EYjjZa3C6AVEw+pLpgJeYgYU4prn7FZkJXdI2Ehhq8VqoD8DIMvyO5aPGE8dpbSLVfQ6eM5RVrwnJBB2X3pDyBUrI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784186338; c=relaxed/simple;
	bh=8nnOASWEJf9wnFPTtpSZl+pGkbaX09Rm/eaNCoyaCSo=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=H23JOV0ir6x4o7tTYWlYItt2CI7GfwH8saR43mB+7ZLZDV/d/R0Yw3WbMH3MbxgYbFTJ9IKltoblsQSzV8lgbhcUkCaJTbYpSWK1hzPx9LsCmNkwke8DFzMu12AI/RhlbHOWYbH2U5CFiVuAH8E4A1Lzm3MgsOMiWdQQDl+x7+g=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=resnulli.us; spf=none smtp.mailfrom=resnulli.us; dkim=pass (2048-bit key) header.d=resnulli-us.20251104.gappssmtp.com header.i=@resnulli-us.20251104.gappssmtp.com header.b=vKLp/SCG; arc=none smtp.client-ip=209.85.128.41
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=resnulli.us
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=resnulli.us
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=resnulli-us.20251104.gappssmtp.com header.i=@resnulli-us.20251104.gappssmtp.com header.b="vKLp/SCG"
Received: by mail-wm1-f41.google.com with SMTP id 5b1f17b1804b1-493b966dd74so25221665e9.3
        for <sashiko-reviews@lists.linux.dev>; Thu, 16 Jul 2026 00:18:50 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=resnulli-us.20251104.gappssmtp.com; s=20251104; t=1784186325; x=1784791125; darn=lists.linux.dev;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=5DeKdX/3Smbb9NgVSq5evfrMeYX1J7raVEFT32QHvpg=;
        b=vKLp/SCGSSbY4JGMrlT7HDCKWtk3Z7ouOMc8a7tRzfLwGq2mF3qFyI7lPTfFReXoPn
         aqfo18l1PpTEtML44boc61o0sui03/VU8F0mR+O3TCuHKXcY2CDBfHwXcLJ3BvGLCgBi
         0/gdS58NVyo49aHt3I3zvC9/h0NTVUskJKnYXkjsrdgNkTWheF2FjbDKFtI2Tw9rVqJc
         hb2KMQ7wYHTarMu8YXbPRAc0/Ck6jYZDo3g2RdIrB1FCE0wS2hPlhC3oWpk5rEtncB9f
         pdidnxuwUriTXOpJEXm8wOge0kSj1sXcz6H5WHwv2I2di5x9JQlX/FuOpmlOqc5TtlyK
         z+Dg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1784186325; x=1784791125;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=5DeKdX/3Smbb9NgVSq5evfrMeYX1J7raVEFT32QHvpg=;
        b=iDVYwmcIFbhkX0BOfSiypf5v9ABH6R0cSdvI9pZejuVOPaBPo5HpQDdMz+TrMh4N0Q
         3mdffV6cELUwrahjVCxzx7xZB2kssacy+f2sd2D2M2UQF6gz6LcU8PcyQF1/J2PiSdux
         bDsAOKFMwDEpRZ+aZ/9xbp2C2Wj5T+f1iu9hl7cGqusKr/Yb1xUVD32VgXx7yBBMFnUL
         Rr2q1JA8WM87macomYi2BeLhsbiajT3WNvt22NpChSgYMcSmBp+VlHfGGpusjnYLGJ7s
         t7BDusP2Xkd1kIrMZvSAW4IyustLDKyz3YSReVGGTPsX4Pn+zswMYIIYL22goY0aEfDx
         lCPA==
X-Gm-Message-State: AOJu0YyWfJ7sFwFwYGV2CG6XM3xNFLEFjMS8awcp/89ZhBCQ8IDMuKtR
	0DEWDGFVpnTP6eS818grGpQx8/RBHuLuVHYR05ZMUFOaRtSq5gjuZdEUYqao/WZ1LxmD7NvPq35
	vPmdF
X-Gm-Gg: AfdE7cn6Z8hgdtJLhCgFS8LkU4PkqAjrBrmOMAhG9sqG0lIIwDBlUUzr59AgFOaLDQ4
	aqXblIGrlPN5Tlex4JpNVVHjWmWKdcsoxQGAalYe6Rsk37pH67606bVoOtlZfGrNTFx8tIQCK5f
	QCXG5YIxzuU2Jom7YRUElIemUtpByNPN3iFxrrO9bavzVZXXnMjBE8T+2sBPnllH9appbqeB2Cv
	xLCYlaVOXizt/o8C/UH8gBSEeXX5N2Ea6Z7MopDR6TRyjW15lmXnCHjf4T7fAew17smU2XRd3bb
	8B4K8lnuCNxuL9MgTm7f++2SLmPxrERW6UmZDju0KQnQE5m7hObLsWl2FjMv7k6foJ8dmBj73RK
	aToNMpoDJ2WBD/OY4ZS8rnOMU9sN0V7YBZ7qY+RGrOfaJ2dYtP2fInUbvVGPI6fYmzZ6PQGZNyw
	cws/bIzx79PfA=
X-Received: by 2002:a05:600c:b8d:b0:493:f5bf:4dc6 with SMTP id 5b1f17b1804b1-4953c14ef45mr61678205e9.7.1784186325189;
        Thu, 16 Jul 2026 00:18:45 -0700 (PDT)
Received: from localhost ([140.209.217.211])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-47f464a9879sm23000181f8f.22.2026.07.16.00.18.43
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 16 Jul 2026 00:18:44 -0700 (PDT)
Date: Thu, 16 Jul 2026 09:18:36 +0200
From: Jiri Pirko <jiri@resnulli.us>
To: sashiko-reviews@lists.linux.dev
Cc: Vasily Gorbik <gor@linux.ibm.com>, tj@kernel.org, mkoutny@suse.com, 
	hannes@cmpxchg.org, Heiko Carstens <hca@linux.ibm.com>, linux-s390@vger.kernel.org, 
	Alexander Gordeev <agordeev@linux.ibm.com>
Subject: Re: [PATCH rdma-next v2 11/14] RDMA/core: Make device names unique
 per net namespace
Message-ID: <aliFulxrT8aFLNXi@FV6GYCPJ69>
References: <20260714142927.1298897-1-jiri@resnulli.us>
 <20260714142927.1298897-12-jiri@resnulli.us>
 <20260715143044.E91711F000E9@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: sashiko-reviews@lists.linux.dev
List-Id: <sashiko-reviews.lists.linux.dev>
List-Subscribe: <mailto:sashiko-reviews+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:sashiko-reviews+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260715143044.E91711F000E9@smtp.kernel.org>

Wed, Jul 15, 2026 at 04:30:44PM +0200, sashiko-bot@kernel.org wrote:
>Thank you for your contribution! Sashiko AI review found 1 potential issue(s) to consider:
>
>Pre-existing issues:
>- [Critical] Format String Vulnerability / Arbitrary Memory Write
>--
>
>--- Patch [11]: [PATCH rdma-next v2 11/14] RDMA/core: Make device names unique per net namespace ---
>commit db3597c8065e66f96858593e01ba04bca7a7d075
>Author: Jiri Pirko <jiri@nvidia.com>
>
>RDMA/core: Make device names unique per net namespace
>
>This commit updates RDMA device name lookups and index allocations to be
>scoped within the relevant net namespace. It uses rdma_dev_access_netns()
>to ensure name uniqueness per namespace while maintaining system-wide
>behavior in shared mode.
>
>> diff --git a/drivers/infiniband/core/device.c b/drivers/infiniband/core/device.c
>> --- a/drivers/infiniband/core/device.c
>> +++ b/drivers/infiniband/core/device.c
>
>[ ... ]
>
>> @@ -452,7 +457,7 @@ static int __alloc_name_id(struct net *net, const char *name,
>>  	xa_for_each (&devices, index, device) {
>>  		char buf[IB_DEVICE_NAME_MAX];
>>  
>> -		if (device == skip)
>> +		if (device == skip || !rdma_dev_access_netns(device, net))
>>  			continue;
>>  		if (sscanf(dev_name(&device->dev), name, &i) != 1)
>>  			continue;
>
>[Severity: Critical]
>This isn't a bug introduced by this patch, but is it possible that the
>sscanf call here is vulnerable to a format string injection?

Unrelated to this patch/set. Ignoring.
