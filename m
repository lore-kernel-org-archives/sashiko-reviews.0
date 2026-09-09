Received: from mail-pj1-f46.google.com (mail-pj1-f46.google.com [209.85.216.46])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B3EEA3DAAC6
	for <sashiko-reviews@lists.linux.dev>; Wed,  9 Sep 2026 07:13:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.216.46
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788938013; cv=none; b=FPJBhW4Agm+a7sv/fZZVXALBjUzKFcvAVRlYEcZHIQaKWFEvPSpKqXgVXV7Y5j1EG0IZCW5PAq2Eo/xQxSmBudt4I4b5oeAbWmjM1s7g+MPl08DlrKiiJdakvGXgSTOBxh/3YI/pzOSF8MVHvnzOzY4EdEhlZU/fvR4qpLS5C90=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788938013; c=relaxed/simple;
	bh=LTVFBw1hSJ6M2PAwj04DsQmmsRYrojmmHyvl7FB056o=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=QgUs/CkJA5vbm2TIs1Js8vSkRTsLKrc6cSQV/Zok62samoDi7VHrhqXzNoW4FAo1worzYp8oTIZgoMZQIjWwiUVPepYrooltzawSZ1xgv71rU/jKNAnIvNrmvCzzEp+29VrWjYLEJ3YT+Z8a9fhi6Ise4jsWG1NQDq73JdAxiVY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=BweRSWgK; arc=none smtp.client-ip=209.85.216.46
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="BweRSWgK"
Received: by mail-pj1-f46.google.com with SMTP id 98e67ed59e1d1-3964e480f76so6402934a91.1
        for <sashiko-reviews@lists.linux.dev>; Wed, 09 Sep 2026 00:13:30 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1788938009; x=1789542809; darn=lists.linux.dev;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=QBO8rVGosvhALT/C34PTNGcCszbZ+EEDDPxlTfv6RKo=;
        b=BweRSWgKe6nEKKd1DFfjcqG3u16nSWIRzz3bry7gOWgtxZ+BjMxbEjXfE6PVW9fZ21
         bPIv3CleV4yVUgbhc+E/P/EWzF9jFdpe093zIGjtB6xtVHN0JK1rdfZM4Oui9kCKqyt1
         1lcdMVL2k6+reo4KZ3zFh3x32KUWG9lindhnP27HYLI0RFSir0lGbAzbPuwWPLOMH3AP
         bvcW88ZCdU4ES3E25Vorg8CMHmz/eeENBagNKRsK+eGLdEU8lmVbWfCmUKTnNBJzfKNl
         23N8+wwO5gN6zIlXWumk9XnV9cSGZeWMQHt0VRop8/mVSrLDzNpqi3inv1zFErWZNHKo
         19Pw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788938009; x=1789542809;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=QBO8rVGosvhALT/C34PTNGcCszbZ+EEDDPxlTfv6RKo=;
        b=XeWrcKSWpZ0VFkYDBTW6KuF5sAyxk5w26auMzLtZJL9w2OUfcpMTY+tPBKGSwsFw4J
         UhWWLTc6EgPDljWjI0lTWaTyqAHm7DefUDDMyb6eBryQe+e+iaKj+u6EVli6qoO8mIAw
         cn/1bbSLNwaISkRMD/jOSaSX09PGyXcKESn/fpH2pqs7QnFx2xRqzmNc+FIEfsFpuTFr
         YDkI2QRASCbUIX3A9S/uqQRgv2KHDJkqXDfGF44+41slJ9VHsVWS8nWuy+r73sESBueU
         tj0qACo9jLdt6QvPAU8etoqSnrLsOLkxyryz1bhUfH6cROceQCkkr6jLqiGcIFZu8y6T
         gitw==
X-Gm-Message-State: AFuF++mKqztM4gVHzGy2rkYK62HezeXAq8g5Rc8gVTYlCcEeO3QifaHk
	ji7OW0LzbRnJ5woaORxb1VkGRFUPP0OrjF2hgTCLgqNnVHsUDDMxmYqgOPLruQ==
X-Gm-Gg: AYBFou11Bngkqn9IUdQ09c7uyU2trmehREOJXDh/wuuLpxIKi+C1q9Sk9VB5M0nxDx/
	3PxSs1piidqRplNTE+ZuANdehsAC3h07eMQXe8efSVEhOBEg47hLIPwLLl6I/62Lna5tmr4hakM
	ARzOVQMc5+3qhkFuouR4pmjQleTIcGff9XVINhuylRgrUkb1d5796uI2C7KP0QukEg3z9l/WCcb
	hgVGpL2qYXo/ptYu9Ms5Zxt/z1d0HM+PV3Z2rriYC2Pl/exiLu4Xp5h9g5P55xnBwJnu1ro6T4W
	nerXY0zSt2Qk8blZdsod661nkNCRIP9Vp2XPq3rh95YrgsobKq1PmAsBD3hUh/wOapPzpnOm6q0
	koxS6dr61KVnzp6cP4WTz4x43Kph4srA0h6Vi1SmTkCzZpIMMXKpq4WjZM7vaVX46iHgGt8fpB+
	4zEiwdEYQUJwKCORp0FR4+6KlPOCvBgbHMcu9CHbh5ER01JIid6PmBIshOnxnJnDTmOPzZec0+w
	S70cQkV0sMfns8ajLA=
X-Received: by 2002:a17:90a:1188:b0:39b:a8d8:985 with SMTP id 98e67ed59e1d1-39ba8d80b06mr4301146a91.12.1788938009449;
        Wed, 09 Sep 2026 00:13:29 -0700 (PDT)
Received: from [100.125.248.95] ([124.70.231.46])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-39b08d0d845sm37456830a91.17.2026.09.09.00.13.26
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 09 Sep 2026 00:13:29 -0700 (PDT)
Message-ID: <8356eaaf-ff5e-4777-9760-3c596204fc49@gmail.com>
Date: Wed, 9 Sep 2026 15:13:22 +0800
Precedence: bulk
X-Mailing-List: sashiko-reviews@lists.linux.dev
List-Id: <sashiko-reviews.lists.linux.dev>
List-Subscribe: <mailto:sashiko-reviews+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:sashiko-reviews+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v6 09/31] ext4: skip block allocation for holes in the
 data submission path
To: sashiko-reviews@lists.linux.dev
Cc: linux-ext4@vger.kernel.org, tytso@mit.edu,
 Zhang Yi <yi.zhang@huaweicloud.com>
References: <20260903123543.2302999-1-yi.zhang@huaweicloud.com>
 <20260903123543.2302999-10-yi.zhang@huaweicloud.com>
 <20260903134626.1771E1F00AC4@smtp.kernel.org>
Content-Language: en-US
From: Zhang Yi <yizhang089@gmail.com>
In-Reply-To: <20260903134626.1771E1F00AC4@smtp.kernel.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 9/3/2026 9:46 PM, sashiko-bot@kernel.org wrote:
> Thank you for your contribution! Sashiko AI review found 1 potential issue(s) to consider:
> - [Critical] mpage_map_one_extent() fails to check for err == 0 from ext4_map_blocks(), leading to dirty buffers being mapped to block 0 and silently overwriting the filesystem superblock on inconsistencies.
> --
> 
> commit 0c0032b57a5cee4a0ac28f30d5e6fc9a53e4e923
> Author: Zhang Yi <yi.zhang@huawei.com>
> 
> ext4: skip block allocation for holes in the data submission path
> 
> This commit modifies ext4_map_blocks() to return 0 without allocating blocks
> when encountering a hole during the data submission path. It aims to discard
> dirty bits for holes without submitting I/O.
> 
>> diff --git a/fs/ext4/inode.c b/fs/ext4/inode.c
>> index 1473263dd82f1..81c4625de752a 100644
>> --- a/fs/ext4/inode.c
>> +++ b/fs/ext4/inode.c
>> @@ -825,6 +825,13 @@ int ext4_map_blocks(handle_t *handle, struct inode *inode,
>>   			map->m_flags |= EXT4_MAP_MAPPED;
>>   			goto out_handle;
>>   		}
>> +	} else if (retval == 0) {
>> +		/*
>> +		 * Do not allocate blocks for holes in the context of
>> +		 * data submission path.
>> +		 */
>> +		if (!map->m_flags && (flags & EXT4_GET_BLOCKS_IO_SUBMIT))
>> +			goto out_handle;
> 
> [Severity: Critical]
> Does this new return path create an unhandled condition in
> mpage_map_one_extent() for the buffer_head writeback path?
> 
> When ext4_map_blocks() is called by mpage_map_one_extent() and returns 0 due
> to this new logic, the caller only checks for err < 0:
> 
> fs/ext4/inode.c:mpage_map_one_extent() {
> 	...
> 	err = ext4_map_blocks(handle, inode, map, get_blocks_flags);
> 	if (err < 0)
> 		return err;
> 	...
> }
> 
> Because err == 0 is ignored, mpage_map_one_extent() proceeds as if blocks
> were successfully allocated. The zero m_pblk is then used by
> mpage_map_and_submit_buffers(), which sets bh->b_blocknr = 0 and clears the
> delay flag.
> 
> Could this result in ext4_bio_write_folio() submitting I/O to the mapped
> physical block 0 and silently overwriting the filesystem superblock on
> inconsistencies?
> 

This should not happen in practice. mpage_add_bh_to_extent() only
collects delayed or unwritten buffers into the extent to map. Hole
buffers are filtered out there and never reach ext4_map_blocks(), so
when mpage_map_one_extent() runs, ext4_map_blocks() can only return a
positive number on allocation or a negative error, never zero.

That said, I agree a defensive check is better than relying on that
invariant alone. I'll add the following to guard against an unexpected
hole.

	/*
	 * A hole? This should never happen since mpage_add_bh_to_extent()
	 * has filtered it out.
	 */
	if (WARN_ON_ONCE(!err))
			return -EINVAL;

Thanks,
Yi

>>   	}
>>   
>>   	if (!handle) {
> 

