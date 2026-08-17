Received: from mail-pl1-f173.google.com (mail-pl1-f173.google.com [209.85.214.173])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8661A1EFF93
	for <sashiko-reviews@lists.linux.dev>; Mon, 17 Aug 2026 02:15:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.173
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1786932907; cv=none; b=LSw9MIpci5IBK15EyA4CMcUx4KUA1sXodutAN7jFxpJ5RDxemQ0eAazYTL2wZEANZoiFxAFU9EkqncN9PIdLqVxvXJc4XLcD4UEQxSkxZmP0zdDiR9gN/DzGiZ7Aeh0xmB1DJ0o9eOCgoRDFrepbX4/EjLNIWdyI0IwPDmeGVj4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1786932907; c=relaxed/simple;
	bh=4PDxVHxzEtixMQxj375u5qupcw8HmdOETUyxhxESZ+Y=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=GlbwZf+Twti7k23Ni8OZlYMssJEDhBukQbdPiGkFRkEkQxOPZJWZBVtoVyCnVipk20tQ+gXy3BhScqCDcRpQb0bT894k3BNxxRGgIscYNWJgHvyW/SGdLMX1S1xwP8bTdnvAzu3ogZsL8FmHT5S+fsZyzb7sLeCeppRbNg6EbA8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=hLde4/PC; arc=none smtp.client-ip=209.85.214.173
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="hLde4/PC"
Received: by mail-pl1-f173.google.com with SMTP id d9443c01a7336-2d58efc7356so4694895ad.1
        for <sashiko-reviews@lists.linux.dev>; Sun, 16 Aug 2026 19:15:05 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1786932904; x=1787537704; darn=lists.linux.dev;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=aTuatPTaLF+hATnCNZpEBrhBXHe7FOsOaL8XbwX/BY8=;
        b=hLde4/PCMQ15fV/+expyBsBCtAHy2zOCDZ8DSQuXhxSq7XmkCG/f99R9qADNrx3qIY
         wC7DzkBP1ZK4yHlNJxKRSiOola3Xwzw7hS+fOta3gfuljFmHmUX/GxLYffngsutqp+az
         ivsd+aCzNpwq3KNqUgh7a62ezKo/IKB9yvmSheLQRtKcAQ6P5gLgFShE6tiWw7lN0ceq
         LtSdrPHSJwOJRlVo1I92oMv1Cdgn0TmHbqehGFiGJApKrey1hmXgtnmkJdyeFeUiGvy8
         Yzo73omyEZk5qLbah6qXmyPfkbIR1fnULD9e0gunjjzCLRaRc8JLEWjaE0iACWhAdCyB
         dX9Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1786932904; x=1787537704;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=aTuatPTaLF+hATnCNZpEBrhBXHe7FOsOaL8XbwX/BY8=;
        b=GIMC90SC6VlLSsKhxP0hD6CleqNpdjr+y0mrm0+R4u5jJX+PR+/UuLIi/ERKWLdYkb
         s3wpiu5jIrI0C+r7ap3XeY75MDg/rBaKS+sVFD7rQqlhVQD4+cIPrqESMzTqp3J3nY8l
         p7y2V3eFmZA7gOPV6X53zlChfGrlmjbnGeXhYY9dzOOnJDiOePKB0WBeCrCWGrodZIHb
         22BbonFV2wFuLvwJlohDeZ3sWWvq86zfPPnQgzun7c/xrVEFWJbFjmjuPAJWjG2mkaHG
         GRNfuONva0qGW4H2ArT9R0FJ3NfpmgpM444JIop0qI5mFbKUnrvymqWUD8axDyieBN9X
         M7IQ==
X-Gm-Message-State: AOJu0YykBYCmKK7kz1oaJLGDqO8W3XgcsvYq5QKJ3c560Dfyf0KcIpGx
	E18QKMnK/+qRH7QWfvBTzeV7+39on3bG+sYrRyBtE5MUFAMWzJYeHvSxGF54miKeiio=
X-Gm-Gg: AR+sD12qLheJefTua9IuJZbVkuV5aQT30Sp/2j0TbWXhcYl78mWqcwVDJeCP6qsecvZ
	n28YBZfHX7dRj+Z9/HoaA/UGoK/2JLidO5yLFSdKCUrFAoY75k5DNAs4284jGjGVSo342T0hxzL
	Cq2G6DE0eYci/QPkSmDQKJwHuS6i+qEwk8tnV20Wcxdu3LI0hKGGu4gDTqRGv4vZRiQTARsYZ6u
	GElxpZ8ONNpt42DCOWyS+SdFbwxmFZO35t7hrsaxxl6ujtUVPMRa38Kb7ISitTF4KOneKqNto78
	It5bBTAf+atyPGVzhxODcx1nluK2osAgx5YSI65KlDXO/Z8qFBgpAQ2Wu/0BE7gik8xlWisTJdk
	mKAK4VCpcidUv9UQmhxMgZdbgt9hwo3m6KQeDkhCINk8HjBgzrgKJtGAvM86p/KNo/QKzRJhJUX
	wpi5xAk/Me94tJSlc62W6dwbTq2nftSPaw+ltvegKcy+Lb37Cwoe3ZUgH2j6TZ+qCPchdMyChdC
	5ibmJdMRn9APQgSNNw=
X-Received: by 2002:a17:90b:4f:b0:38e:ad9d:1161 with SMTP id 98e67ed59e1d1-3933b833613mr26020542a91.0.1786932904324;
        Sun, 16 Aug 2026 19:15:04 -0700 (PDT)
Received: from [100.125.248.95] ([124.70.231.46])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3954d2b6efcsm321769a91.1.2026.08.16.19.15.00
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sun, 16 Aug 2026 19:15:03 -0700 (PDT)
Message-ID: <915be46d-de6f-4d61-80ce-2236c7208028@gmail.com>
Date: Mon, 17 Aug 2026 10:14:57 +0800
Precedence: bulk
X-Mailing-List: sashiko-reviews@lists.linux.dev
List-Id: <sashiko-reviews.lists.linux.dev>
List-Subscribe: <mailto:sashiko-reviews+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:sashiko-reviews+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH -next v5 10/32] ext4: skip block allocation for holes in
 the data submission path
To: sashiko-reviews@lists.linux.dev, Zhang Yi <yi.zhang@huaweicloud.com>
Cc: linux-ext4@vger.kernel.org, tytso@mit.edu
References: <20260814093331.1703882-1-yi.zhang@huaweicloud.com>
 <20260814093331.1703882-11-yi.zhang@huaweicloud.com>
 <20260814101554.428AA1F000E9@smtp.kernel.org>
Content-Language: en-US
From: Zhang Yi <yizhang089@gmail.com>
In-Reply-To: <20260814101554.428AA1F000E9@smtp.kernel.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 8/14/2026 6:15 PM, sashiko-bot@kernel.org wrote:
> Thank you for your contribution! Sashiko AI review found 1 potential issue(s) to consider:
> - [High] ext4_convert_unwritten_extents_atomic() silently aborts conversion if it encounters a hole, leading to data loss for the rest of the atomic write range.
> --
> 
> --- Patch [10]: [PATCH -next v5 10/32] ext4: skip block allocation for holes in the data submission path ---
> commit 741674f6128ebda7382e0529fd0b709e4ae876be
> Author: Zhang Yi <yi.zhang@huawei.com>
> 
> ext4: skip block allocation for holes in the data submission path
> 
> This commit updates ext4_map_blocks() to avoid allocating blocks for holes
> in the data submission path, returning 0 instead. To prevent data loss
> during extent conversion, ext4_convert_unwritten_extents() is modified
> to skip over unexpected holes and continue converting subsequent blocks.
> 
>> diff --git a/fs/ext4/extents.c b/fs/ext4/extents.c
>> index 76038b6c36552..0d62d9312284e 100644
>> --- a/fs/ext4/extents.c
>> +++ b/fs/ext4/extents.c
>> @@ -5167,11 +5167,15 @@ int ext4_convert_unwritten_extents(handle_t *handle, struct inode *inode,
>>   				      EXT4_GET_BLOCKS_IO_CONVERT_EXT |
>>   				      EXT4_EX_NOCACHE);
>>   		if (ret <= 0) {
>> +			/*
>> +			 * If the ret is zero, an unexpected hole may cause
>> +			 * conversion to fail.  To avoid data loss during I/O
>> +			 * end conversion, skip the hole and continue
>> +			 * converting subsequent blocks.
>> +			 */
>>   			ext4_warning(inode->i_sb,
>>   				     "inode #%llu: block %u: len %u: ext4_map_blocks returned %d",
>>   				     inode->i_ino, map.m_lblk, map.m_len, ret);
>> -			if (unlikely(ret == 0))
>> -				ret = -EINVAL;
>>   		} else {
>>   			conv_blocks += map.m_len;
>>   		}
> 
> [Severity: High]
> Since ext4_map_blocks() will now return 0 for holes when
> EXT4_GET_BLOCKS_IO_SUBMIT is set, should
> ext4_convert_unwritten_extents_atomic() also be updated to handle holes?
> 
> In ext4_convert_unwritten_extents_atomic():
> 
> 	int flags = EXT4_GET_BLOCKS_IO_CONVERT_EXT | EXT4_EX_NOCACHE;
> ...
> 	while (ret >= 0 && ret < max_blocks) {
> 		map.m_lblk += ret;
> 		map.m_len = (max_blocks -= ret);
> 		ret = ext4_map_blocks(handle, inode, &map, flags);
> ...
> 		if (ret <= 0)
> 			break;
> 	}
> 
> It looks like if ext4_map_blocks() returns 0 for a hole, the loop will
> break early and the function will return 0. Will this leave the remaining
> blocks in the atomic write range unconverted and cause data loss?
> 

For atomic writes, if we hit an unexpected hole during conversion,
there's no point in continuing the loop since the data is already
torn. We should just return early.

Thanks,
Yi.

