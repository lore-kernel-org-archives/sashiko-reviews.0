Received: from mail-pj1-f48.google.com (mail-pj1-f48.google.com [209.85.216.48])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2E8C035DA53
	for <sashiko-reviews@lists.linux.dev>; Sat, 10 Oct 2026 03:36:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.216.48
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791603406; cv=none; b=Hk7ty5mjDInCKjfyYCFoXXFB+aD/2pXej8Z1w7ucdSD6PIpgbwoSg1IVnEHFrz986fawXLmo0GVVmyZMwL2zFivyJeGzrIkU5hQ6+6b7EWf20NkDPlSbkvYksAPx2mFArzxbo1BMU80Ybw2Xb4Rk6+zB3gahupohmtU0C+6SHAw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791603406; c=relaxed/simple;
	bh=vrmn4nG402Wh3eHdFr2XcFsAZ4yPsZBXLalOOYJaJEQ=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=UHQv/kpjhNPv/QN2t96oW6IS8cYeq3zK2XIlk1f2QEgnJnywShwfagsJhUviSPQljVrT7dgpblx06Eoni4Lb/J5PxBObLKhIl/qbxPww8lnhwAGDyAKrhKiaicO4YH2StRUMXtBVLc5d8kzy/qfyRcH61BEWUGIMIt79OiE+idc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=jh3xzj1X; arc=none smtp.client-ip=209.85.216.48
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="jh3xzj1X"
Received: by mail-pj1-f48.google.com with SMTP id 98e67ed59e1d1-3ab27c7e68aso123526a91.3
        for <sashiko-reviews@lists.linux.dev>; Fri, 09 Oct 2026 20:36:44 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1791603402; x=1792208202; darn=lists.linux.dev;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=O6kHV2F6sry3hV9XtseqLh6TDAjuJvKbQ4qmJDdtGtk=;
        b=jh3xzj1XB4LTZgUq6L/kNvfb1rr3CqaqJ2sujgL15Fy0uVqyu7fTkY0ha4+KIq/Wz5
         ZPO2qSk/vQlMkTw9VBiEnfOnuXT2UDTMlNkunG1POEkUSfSAWErqPjeCT+uGRE5dBd/D
         1+5zzCDXheLTKxjfGG4gtDty7KdkhnxZVvt+ndnArWeNVE4RNYvIgEGeNeVTN69qTk6s
         uzRqLeitQn9EX0+76XWYSVYT7xTpLhViwlPc41WvxRpMLQqhP2rUTuxQFSeNYtMm3whg
         EQnNca+PNAhXVGIkk3YbNmJsxkC8gEO0bv0LoJ4xvpvL9LiCiilBGpKoKvtLjsEfjso5
         3oEw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791603402; x=1792208202;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=O6kHV2F6sry3hV9XtseqLh6TDAjuJvKbQ4qmJDdtGtk=;
        b=CBlPbmKNkqUefJq2Dt9CHcZsKPWCIccSYoZQlRocLxnQYW+qkUY2UH8ne5vq1YQLKo
         oVP3lArPMamWKoLx6h0FMvde3HMxIhfWEg7rAgac1TPSxwQKMF2PFWdUKGTuYov8XTPo
         yRkDmyXIb6Xpvd5jBr1OJCGWsUpmRZp4AI2Gx1hw10nj3qMYxVtgr0Zo8NotLsl1bH+D
         c+auDUbRk7llXuY2AS8hupBFpPxXbZ0b8vhcKg8sdpBq2f8+eCIbKK2pjEtTJloyHcIQ
         DkG+JQ9kuxdevcoUozA06+uGQJ8ptKGhCJD9LvjoOX06+wxkf3HIbMPM4mcFAavy7+Jp
         PlYw==
X-Gm-Message-State: AFq9FYJQ3acaoHK2vS2PBQkL2xehdn0Usw24+y7T2KLjkFgIWX2x8CG0
	rflrFkLpYtlPCjWY1BUqB70rmhj8/mFQnXkvROiGV1QkCQEiP1Vi3ptmX0B7pxXcAsQ=
X-Gm-Gg: AYBFou1DokB3GA0SIJaRpvEN2Q+bnAHaHtLgXfbpTfsICkagV73qiyGoGbF/KfnK6yu
	xbHlZig+YXg3slzyVlqu2vTAxODpt1NlGuOy1bjeoRlyW8lQMIcUgONlpAcUWzLgjKJnCwlGww+
	+LqyDh2O6tVPF3dW9rnfXRQ4Ia7GNb1Pudv2GKqPipNlazd4NZB6nqaaRy/GFStVtL1cGLue+q0
	sgnRKS9v/SgzCNDMhlG2jMr0frW6VVJIVG/mmH5wyqRgsF2JG9Z3R4cx3v+8vNVrhAhc8s25/mD
	RXyITBMYtgg1CkRb7H9vK4ZRyCo0UeZRLZjz8lrCXOZd8dRpuK5JqNlhPytbMQn4D1DCQkot/ks
	oaPunjVMmJZhfNEUNOY1TCwWZiY1aHZG9XW65coNfKny6Z7771XEaRfOzvlksBaCrAgYUI6pmH1
	VoCsPVS0OgbSaI281xzo1SYQMzlPWWzid2Rxo7X9pSCZL+62c3WNzkE+r14SjxteD05EHLLY9Wt
	qvE/ajP95vvfvrG/Mw=
X-Received: by 2002:a17:90b:1dc1:b0:39e:4c7f:7304 with SMTP id 98e67ed59e1d1-3ab3ac9f622mr2746875a91.27.1791603402360;
        Fri, 09 Oct 2026 20:36:42 -0700 (PDT)
Received: from [100.125.248.95] ([124.70.231.46])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2e8421b1347sm19336765ad.44.2026.10.09.20.36.39
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 09 Oct 2026 20:36:41 -0700 (PDT)
Message-ID: <2efbfcf1-b7af-4ae0-937e-9ae5eb2b4818@gmail.com>
Date: Sat, 10 Oct 2026 11:35:59 +0800
Precedence: bulk
X-Mailing-List: sashiko-reviews@lists.linux.dev
List-Id: <sashiko-reviews.lists.linux.dev>
List-Subscribe: <mailto:sashiko-reviews+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:sashiko-reviews+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v7 24/31] ext4: defer i_disksize update while
 DISKSIZE_GROW_PENDING is set
To: sashiko-reviews@lists.linux.dev, Zhang Yi <yi.zhang@huaweicloud.com>
Cc: linux-ext4@vger.kernel.org, tytso@mit.edu
References: <20261009103033.2920530-1-yi.zhang@huaweicloud.com>
 <20261009103033.2920530-25-yi.zhang@huaweicloud.com>
 <sashiko-outbox-165359@kernel.org>
Content-Language: en-US
From: Zhang Yi <yizhang089@gmail.com>
In-Reply-To: <sashiko-outbox-165359@kernel.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 10/9/2026 7:21 PM, sashiko-bot@kernel.org wrote:
> Thank you for your contribution! Sashiko AI review found 1 potential issue(s) to consider:
> - [High] ext4: torn reads of 64-bit i_disksize cause missed updates and data loss
> --

This is a pre-existing and long-standing issue, which can only be
triggered with a very small probability at the 32-bit file size
boundary. It won't be handled in this series.

Thanks,
Yi.

> 
> commit 9dbea84318a994dcee69fb96db7cef1b2100ff28
> Author: Zhang Yi <yi.zhang@huawei.com>
> 
> ext4: defer i_disksize update while DISKSIZE_GROW_PENDING is set
> 
> This commit defers i_disksize updates while EXT4_STATE_DISKSIZE_GROW_PENDING
> is set to prevent exposing stale data on a crash. It introduces a fast-path
> check in ext4_update_inode_size() to avoid taking i_data_sem when no
> size update is needed.
> 
>> diff --git a/fs/ext4/ext4.h b/fs/ext4/ext4.h
>> index 089dbd39c5c24..b26ce3183bacb 100644
>> --- a/fs/ext4/ext4.h
>> +++ b/fs/ext4/ext4.h
> [ ... ]
>> @@ -3605,30 +3605,67 @@ do {								\
> [ ... ]
>>   static inline int ext4_update_inode_size(struct inode *inode, loff_t newsize)
>>   {
>>   	int changed = 0;
>>   
>> +	if (newsize <= inode->i_size && newsize <= EXT4_I(inode)->i_disksize)
>> +		return 0;
>> +
> 
> [Severity: High]
> On 32-bit architectures, can reading the 64-bit EXT4_I(inode)->i_disksize
> locklessly here result in a torn read?
> 
> Because i_disksize can be concurrently updated by ioend workers under
> i_data_sem (for example, when crossing a 4GB boundary), a torn read could mix
> the high 32 bits of a new value with the low 32 bits of an old value,
> producing a falsely large value.
> 
> If a falsely large value is read, this new fast-path check could erroneously
> evaluate to true. This would cause the function to return 0 and skip acquiring
> i_data_sem to update i_disksize.
> 
> Could this leave i_disksize permanently short of newsize during operations
> like ext4_zero_range or non-delalloc buffered writes, potentially resulting
> in data loss if a system crash truncates the file to the smaller i_disksize?
> 
>> +	down_write(&EXT4_I(inode)->i_data_sem);
>>   	if (newsize > inode->i_size) {
>>   		i_size_write(inode, newsize);
>>   		changed = 1;
> 

