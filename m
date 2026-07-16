Received: from mail-wm1-f48.google.com (mail-wm1-f48.google.com [209.85.128.48])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D03AF3A0E97
	for <sashiko-reviews@lists.linux.dev>; Thu, 16 Jul 2026 07:18:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.48
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784186298; cv=none; b=DbU7r+9WnpO1jmS625iFfVHGF4SxheUouz6yy5M6WnGkeIMhcrms+uOIggCYs97G0hztldWH9rKA7bPqATYP6xOjliUpaUZQNOGE0XGAT++GeFbiP1+uhuc1D0bW/QALKqGlhsUrjV9Kc+q5Uhgv5BfzywysSrpdyGrK9adUNjU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784186298; c=relaxed/simple;
	bh=wCOrf4Gl1Kcl375uPlXE+ALtdINw1fX6Rz+X+UFuWis=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=iCIinNrAWy6MB7y/jjRCVIswEA0dNXvR181rk5YCmvY76G5X4peHxlJ58wstBXb4s2JO/4fkxu5paROIVXOUZezfCYIvSjJVgGgEU7Zlt/NS+7ehORN1MGcqf0iUQ7FYo6lBAftfOezeUX77e/oknv0dRWHMlsW5mHoHr1CTj1s=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=resnulli.us; spf=none smtp.mailfrom=resnulli.us; dkim=pass (2048-bit key) header.d=resnulli-us.20251104.gappssmtp.com header.i=@resnulli-us.20251104.gappssmtp.com header.b=SLZZHxFs; arc=none smtp.client-ip=209.85.128.48
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=resnulli.us
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=resnulli.us
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=resnulli-us.20251104.gappssmtp.com header.i=@resnulli-us.20251104.gappssmtp.com header.b="SLZZHxFs"
Received: by mail-wm1-f48.google.com with SMTP id 5b1f17b1804b1-493f431e317so21562065e9.0
        for <sashiko-reviews@lists.linux.dev>; Thu, 16 Jul 2026 00:18:13 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=resnulli-us.20251104.gappssmtp.com; s=20251104; t=1784186291; x=1784791091; darn=lists.linux.dev;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=ixWQT49fcvwii9ShrrSJHWLi6DgSNOGFoa6xSTGg1wM=;
        b=SLZZHxFs2wpPmecJrILzJZ7fIFu+M0pdfbi7nv9bxifAV5wwKfJt2zlO/dbeg+9/O3
         aD7MyxvATerfXsAyqU0nqAMxnYdy3ui1rXAJDvBxCbX99ZZ5zjVmDU6JI4L+PrbVZE1S
         r33+1rq6iye1e5mJfZLc7VUlj5dLNIeaamH2Y3V1vQLEsdPfgfz8p+fxbB4QeBVJJMkP
         dmFv1JZdwuGGIdpnU7d1KGezJKKqZhZZ+fpURgqQtRJA3lYjupnfvFP12e3eOZLsfTKu
         x+XKMhsDvULa+Xn5Q6MBIs2W9sEggNnVZUogVg2N18HHNI3BGNiAHhFZMCSu0UbCyMmd
         L1eA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1784186291; x=1784791091;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=ixWQT49fcvwii9ShrrSJHWLi6DgSNOGFoa6xSTGg1wM=;
        b=cpXVClL7+qWjtY2HCbfm+oMF8UrtTXJ6l4wXP6Bluqbe4Ck0hhkWPh7eHlrno11dFs
         lJSOyd7d4eRQbadgcKFCvct/KFIc80k1ZFjJjL3nV7tl//yPxgu+W7N5aYWDebI9JnRm
         fS9Fj5L4mlv3AN3r8XTfjvTBTvO5K07/+2bsqY96L6YIvv7yrM5PrU+Exxv2qNYEI2IA
         MfLD0Gj2kfZNVnQMqnZ2pDFtVXxhqFWMxnY03/W8BHf98pWsAihWi6F0Ad4gadpJApbc
         xIFBT1alH0VU9al2mUUrqE1lxM4TdgZnxW/mkTbuFsjVaoU4qscBX63bBZqB6a8Q1ul0
         x97Q==
X-Gm-Message-State: AOJu0YzZ9W9rDbQn1252DJHEMQqBJBHqkDaHHZOrEBocnsnuPwTrF/fK
	rs7VhWqDVO9secKoXAE/ul1kTZNHxWtItEpCZ971he2qhKLM2c04cLVGGeVUUdxxkP2e8mpTx2d
	cesNj
X-Gm-Gg: AfdE7cnE79abjZRI51yqPdzgiR1DFtxv/L9t+9w8pqNxyeBfWEHZwg0ETyQ+GDwGBTs
	4BEeJGAWR9Q27PjrG6sL5eKmg91MDrbBlDCEnnqIcn/CKJ0FSsrFNLHxx8IKk6PfXjovBZcysGU
	KWammYCaIjBseN96GeFjtJ4MTREoKTfxogcN3quza0FvLAP8VhNKGUVqQHfJVxoWuYJgDKfcGHs
	8GeU3cd3IgaNFJF4bUOFioCIUMXQy9VDyjMIO5zD+/IFJBZU56FrUYTT1mnttYwbXzbERM1UqG9
	PPmXGeXR9kuMQXLAeq2WReS94Bzf4gCUEFMkdF7K3bJ05Nn1xwocFl+12+VyupnCW/dQEnTIWuV
	/FSa2FIROtaAPclZU/BazZz2s9etd/Fq+BbGsZqaleIhTnozki/QYslev3fFZjfFQn1YuJwpibI
	v0nYNMbgnAxH8=
X-Received: by 2002:a05:600c:3e0d:b0:493:f0f5:f2d7 with SMTP id 5b1f17b1804b1-493f87d6118mr220650365e9.7.1784186290293;
        Thu, 16 Jul 2026 00:18:10 -0700 (PDT)
Received: from localhost ([140.209.217.211])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4953c708313sm67561525e9.1.2026.07.16.00.18.08
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 16 Jul 2026 00:18:08 -0700 (PDT)
Date: Thu, 16 Jul 2026 09:18:04 +0200
From: Jiri Pirko <jiri@resnulli.us>
To: sashiko-reviews@lists.linux.dev
Cc: hannes@cmpxchg.org, Vasily Gorbik <gor@linux.ibm.com>, 
	linux-s390@vger.kernel.org, Heiko Carstens <hca@linux.ibm.com>, 
	Alexander Gordeev <agordeev@linux.ibm.com>, tj@kernel.org, mkoutny@suse.com
Subject: Re: [PATCH rdma-next v2 03/14] RDMA/core: Support renaming a device
 when changing its net namespace
Message-ID: <aliFm7wdxDf-56rW@FV6GYCPJ69>
References: <20260714142927.1298897-1-jiri@resnulli.us>
 <20260714142927.1298897-4-jiri@resnulli.us>
 <20260715143041.A46771F000E9@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: sashiko-reviews@lists.linux.dev
List-Id: <sashiko-reviews.lists.linux.dev>
List-Subscribe: <mailto:sashiko-reviews+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:sashiko-reviews+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260715143041.A46771F000E9@smtp.kernel.org>

Wed, Jul 15, 2026 at 04:30:37PM +0200, sashiko-bot@kernel.org wrote:
>Thank you for your contribution! Sashiko AI review found 1 potential issue(s) to consider:
>- [High] Unreachable feature and silent failure in netlink handler for RDMA namespace moves
>--
>
>--- Patch [3]: [PATCH rdma-next v2 03/14] RDMA/core: Support renaming a device when changing its net namespace ---
>commit 4056da04c986796c81666352d7fa9e90d5591d4e
>Author: Jiri Pirko <jiri@nvidia.com>
>
>RDMA/core: Support renaming a device when changing its net namespace
>
>This commit introduces support for renaming an RDMA device when moving
>it to a new network namespace. It preserves the literal-name path for
>user requests and keeps the fallback naming on the teardown path.
>
>> diff --git a/drivers/infiniband/core/nldev.c b/drivers/infiniband/core/nldev.c
>> index 32b6c4d68ca0a..77a7580801486 100644
>> --- a/drivers/infiniband/core/nldev.c
>> +++ b/drivers/infiniband/core/nldev.c
>[ ... ]
>> @@ -1195,7 +1195,7 @@ static int nldev_set_doit(struct sk_buff *skb, struct nlmsghdr *nlh,
>>  		u32 ns_fd;
>>  
>>  		ns_fd = nla_get_u32(tb[RDMA_NLDEV_NET_NS_FD]);
>> -		err = ib_device_set_netns_put(skb, device, ns_fd);
>> +		err = ib_device_set_netns_put(skb, device, ns_fd, NULL);
>
>[Severity: High]
>Does hardcoding NULL here make the newly introduced naming feature
>unreachable from user space?

False positive. "RDMA/nldev: Allow setting the device name while
changing net namespace" adds this.
