Received: from mail-pg1-f178.google.com (mail-pg1-f178.google.com [209.85.215.178])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4D128282F20
	for <sashiko-reviews@lists.linux.dev>; Sat, 10 Oct 2026 00:55:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.215.178
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791593732; cv=none; b=u9ryY+x0Uxc9LWA+Lkl90EhmZAmO1g/dZMJw/ddmbdxT5uZdtb0rMx6ppTx6Px6sitMy1gPa4dKsdscrmT3lMSikzEWg6Jz0JHDHlJPHXUt8vRxsrivfJLwAYWoCg0NkrQ9nONxBczyOnlQ797+A0M4kmil8KWOzS1px5lz2/5A=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791593732; c=relaxed/simple;
	bh=0jYbb/yhRRq8TpdEyhqaIgEEwDVeZQgf0q3aDSLfxbE=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=WAAON8+OXP+VQtEstieY1r3q3yQL9TkmqAuz4Y0ynj5cm7IVroMLm5PylizsnQsCczlaycvDDkyuisfCGoX3eW3KuRpKetlI0bo2wLLb6lHNcbqVb0J5fTn44pTWaWPqchYMbVGSVzRUAZSgg/ikHTOms3yQy2x20XbUPSeo0JU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=b6qQaav6; arc=none smtp.client-ip=209.85.215.178
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="b6qQaav6"
Received: by mail-pg1-f178.google.com with SMTP id 41be03b00d2f7-cc52c1b8286so98190a12.1
        for <sashiko-reviews@lists.linux.dev>; Fri, 09 Oct 2026 17:55:31 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1791593730; x=1792198530; darn=lists.linux.dev;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=O3WY6TRIz4TsQZ9reS0WsRTDwlNOMeXFQmMZEMPkOS4=;
        b=b6qQaav6M9v0l+ZK4FxxMsBhXdESCXO29vRQYaBOSgx82Ec2LmjCre6YkAsWPBXS/Q
         AFs4fHZkLx1Rht/hjtuN4JlN1+AoF9HC1/LMoQvu1WE3V/zktqilucEj0+Hf7cDFQW8I
         gIzSw5VviTvf4XKQKug7Xc+WzLm+e2+qr7NG/V98q7qtj6uhepkvuYsElZKoUNvSWrzc
         FBRfT13FSyNp3xxqmPMI2flNtPPbbzO4z8tDYfpo/NJRClgyUpQcAyZruA74jZYnTvEz
         AwCu1F6QNnNH+vNOykmQ6AY8ZdAvn1mKbC6Sx/HzXEzmfKa1GEzubFEV2a9LudOzy/Ny
         NB5w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791593730; x=1792198530;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=O3WY6TRIz4TsQZ9reS0WsRTDwlNOMeXFQmMZEMPkOS4=;
        b=UD+FwSu/yKqj97H2R66+pI3nmEzaGvL/qxKoHNW9F0qGlQ5Zaz4k+aRqakrhXGEs/L
         sPsxxsHb/J6BNvqKVgaqYCDqYqKvrMzwHwFGPGRM858Ew7pmf4XevO1w/ck+wNfSJHzz
         fBkDYU1SErcwsmwHN1yBAs+oLiSdKZEVeDkXltW6lK8GAvJ507rP4zPQqiZ5VlyHIjy1
         M803RXfqXzy9c8pmgGa6RTj38Of4hn7cOv/R535inUicLVFLDD2Ug7HLNhLnwR/CRGwc
         B3dD7K06ogtPEQuF4aEoixh8Y+71M0IizkiYAXiAF8xH7bxSazxnxTo18XNO6AzEGQXP
         SCaA==
X-Gm-Message-State: AFq9FYI7/+pd8ur1OCHIcDzEzJcWPfVK+FS1oXFuXO4EISvUq8iAv+Hb
	4QSZdlqusImE36Kz+/dNlOuauraCBNBFgweVvkrFQrQIyYBo+1lRxrOS2F3QPlr13r0=
X-Gm-Gg: AYBFou30kpqdJ96plneRtRVREdyvOpFiHK4sRa+hdKq5jkukVIHDbr7pGy3avv1mdnv
	LqIYvaKy8iIuwrNkV2mqYrc+jI8bgF8eoE1KsorU1x2Je1dG5U8K4f4EELMm1xVUUOIvC4XQuuq
	2RrSzrowQAHglNcAVHTt4Bt2rb06vpyuy83tQShG4q346XpjZVNpknPiRYaN5elFVkcPsMsNp77
	ixPGkdapFLu4TDbIOHiWKY1m06se8nnTZ9a8qGCHQbHyE9y1SQgk8NvrlIgHaZGXfBwHvqt1EUe
	+uAtC9N8VElkIhfIYpKJICXz/CmBwfb+teGDqoz14ETb2k/YSvmLc5ycggzdD/m7YvdlS40TCjk
	EMuPnuC0Qbd2pPNGvElv7AK/3qNd1Q8duBFxnQwBsQFV5FdVV7bpO6MpUC5KMPwIhWYp66OpMi7
	NQMdzZAFvvh7lWNhk7Kzna0D1/5rmEGjmO/c7xfjjN2+s3pnOgnnwaOsIVzW50yxG0JHeM8iNc7
	tYdBfVzSdmoXprqGGM=
X-Received: by 2002:a05:6a21:6e91:b0:3e1:84a4:3441 with SMTP id adf61e73a8af0-3e184a43789mr90031637.48.1791593730410;
        Fri, 09 Oct 2026 17:55:30 -0700 (PDT)
Received: from [100.125.248.95] ([124.70.231.46])
        by smtp.gmail.com with ESMTPSA id 41be03b00d2f7-cd3d9e3f5acsm1769490a12.22.2026.10.09.17.55.27
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 09 Oct 2026 17:55:29 -0700 (PDT)
Message-ID: <ec0668cc-cc3f-4e7e-88ac-d5bb64c56c47@gmail.com>
Date: Sat, 10 Oct 2026 08:55:23 +0800
Precedence: bulk
X-Mailing-List: sashiko-reviews@lists.linux.dev
List-Id: <sashiko-reviews.lists.linux.dev>
List-Subscribe: <mailto:sashiko-reviews+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:sashiko-reviews+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v7 08/31] ext4: skip block allocation for holes in the
 data submission path
To: sashiko-reviews@lists.linux.dev, Zhang Yi <yi.zhang@huaweicloud.com>
Cc: tytso@mit.edu, linux-ext4@vger.kernel.org
References: <20261009103033.2920530-1-yi.zhang@huaweicloud.com>
 <20261009103033.2920530-9-yi.zhang@huaweicloud.com>
 <sashiko-outbox-165289@kernel.org>
Content-Language: en-US
From: Zhang Yi <yizhang089@gmail.com>
In-Reply-To: <sashiko-outbox-165289@kernel.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 10/9/2026 6:58 PM, sashiko-bot@kernel.org wrote:
> Thank you for your contribution! Sashiko AI review found 1 potential issue(s) to consider:
> - [High] ext4: silent data loss in atomic extent conversion due to unhandled 0 return

Yeah, this is a pre-existing issue in
ext4_convert_unwritten_extents_atomic(), and Ojaswin had already pointed
this out, he will address this separately.

Thanks,
Yi.

> --
> 
> commit d986a085e4ae32e7076239e912abb3b6e2e97038
> Author: Zhang Yi <yi.zhang@huawei.com>
> 
> ext4: skip block allocation for holes in the data submission path
> 
> When ext4_map_blocks() is called from the data submission path and I/O
> end extent conversion path, it should not allocate blocks if the lookup
> returns a hole. This patch prepares for the buffered iomap writeback
> conversion by filtering out holes and bailing out with an error.
> 
>>      In the ioend extent conversion path, holes are also not expected because
>>      we should wait for folio writeback before punching hole. If one is
>>      encountered, it likely indicates a failure in the concurrency
>>      protection, so ext4_map_blocks() returns zero, and we keep warning and
>>      bail out with -EINVAL to surface the failure rather than continuing
>>      conversion on torn data. Atomic writes in
>>      ext4_convert_unwritten_extents_atomic() already bail out similarly.
> 
> [Severity: High]
> The commit message states that ext4_convert_unwritten_extents_atomic()
> "already bails out similarly" (presumably with an error code like -EINVAL)
> when ext4_map_blocks() returns 0 for a hole.
> 
> However, looking at ext4_convert_unwritten_extents_atomic() in
> fs/ext4/extents.c, it breaks the loop when ret is 0, and returns 0 (success):
> 
> fs/ext4/extents.c:ext4_convert_unwritten_extents_atomic() {
>      ...
> 	while (ret >= 0 && ret < max_blocks) {
> 		map.m_lblk += ret;
> 		map.m_len = (max_blocks -= ret);
> 		ret = ext4_map_blocks(handle, inode, &map, flags);
> 		...
> 		if (ret <= 0)
> 			break;
> 	}
>      ...
> 	if (ret <= 0 || ret2)
> 		ext4_warning(inode->i_sb, ...);
> 
> 	return ret > 0 ? ret2 : ret;
> }
> 
> If ret is 0, the expression ret > 0 ? ret2 : ret evaluates to 0.
> 
> Could this cause a regression where the unwritten extent conversion fails
> due to encountering a hole, but the direct I/O layer is told it succeeded,
> leaving unwritten extents on disk that will return zeroes on subsequent
> reads?
> 
>> diff --git a/fs/ext4/inode.c b/fs/ext4/inode.c
>> index 6b0489cbb1319..778cf539f6df2 100644
>> --- a/fs/ext4/inode.c
>> +++ b/fs/ext4/inode.c
> 
> [ ... ]
> 
>> @@ -830,6 +830,13 @@ int ext4_map_blocks(handle_t *handle, struct inode *inode,
>>   				map->m_flags |= EXT4_MAP_MAPPED;
>>   			goto out;
>>   		}
>> +	} else if (retval == 0) {
>> +		/*
>> +		 * Do not allocate blocks for holes in the context of
>> +		 * data submission path.
>> +		 */
>> +		if (!map->m_flags && (flags & EXT4_GET_BLOCKS_IO_SUBMIT))
>> +			goto out;
>>   	}
>>   
>>   	if (!handle) {
> 

