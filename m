Received: from mail-pj1-f44.google.com (mail-pj1-f44.google.com [209.85.216.44])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5779D13777E
	for <sashiko-reviews@lists.linux.dev>; Sat, 15 Aug 2026 07:58:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.216.44
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1786780733; cv=none; b=INlEeD6DtUU5qpFyiUxX9eiRmlENRcUV3mEIcK1Sak6iKuAcnvfd0vPwYgp64VKIgM231d6KBdTBt7o9kB2YJRJRM9b1IB+djPFAJgbbOry17Q1loa+dsVJC/hcpye/aFCwKiEOaVg3bru/7Kz2zTPBvQbEEUcj7SyfhAL1E9Xo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1786780733; c=relaxed/simple;
	bh=jIEZZJ7p4KcOZsCVAV4ykuQfceRc8cLyKpOlaq3v5uA=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=NHI+oei6uEy4fHMteLjX1KhA0gVTPLrrxXM2fm9dc/P+NpDyhWon7RXYES+vFyzq3X5X1ZzUmB+beNHba0cvqMnnFXAss2jw1nP1/rZ+hsikAZL1De75f2IRLs2/z2KInjoFzebgGprJ9BVXyYnDv4+wVT4unEZbUu+hnDACFAY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=Fv3/tk++; arc=none smtp.client-ip=209.85.216.44
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="Fv3/tk++"
Received: by mail-pj1-f44.google.com with SMTP id 98e67ed59e1d1-3856d6fbcb3so1597036a91.2
        for <sashiko-reviews@lists.linux.dev>; Sat, 15 Aug 2026 00:58:52 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1786780732; x=1787385532; darn=lists.linux.dev;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=rW377O/wYtB+aBJivfgYjxQSppkLexqA6V8YiPqrC3o=;
        b=Fv3/tk++Dkfm7BcnsZ4mG5Iz44+MX/lJauJmj/qu2Ho4sljEv/0u50oR3z5o6A0Ilf
         240fRONTaJcTDKUdRo4tHKIVX0l2E8EHYJs1+7wNy4grgqQ9GaUqrIADyAEgYSpIwxQU
         CD6hTlAALpZW90KtlASlo1LG94vDhNfZDG5Qz/mMFYJ9NiCrC2tuhB1lTDWzp2XB/IBY
         el5Kv+a+R440P5Msixqmld8F9t69+wczpk05+iKM6zClk5G4g6VIg+eqSBXvJy1X9ot2
         UnGuIJlea9uH8A1ewgNbb4cmi5UjQHFLeDQ8S6mlJ4PDOdHqC/y8ue5f7137dn3RV8Mq
         yxxA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1786780732; x=1787385532;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=rW377O/wYtB+aBJivfgYjxQSppkLexqA6V8YiPqrC3o=;
        b=UU5QV3oVEDEG/6nLTuZ2ePs8GCHdhQPgvgnCWJc3bm3bRPVz/QZvsV+bXUk14Iizis
         U6UsVXSVYgU4uD+WOsq50+CvCLoPVNZTrxyvQsj3m4tEBwTCfi2lx5lCr8caPUuRJJln
         9zmtA9/MSep6UGjVMalXxmQK/2SO9Eob7PH+2SUuurFMCbiRDiq6bGju4YWXR7uVt/w6
         aJN+HiIa7vJ2RjRDbqNpDbNtayMftV8TiaWzwHOl4H/ke5HwwxYs/az8hTgW5c6ZYgiW
         9PQO6xYOpophha/ere+kgtQajC89PfnWwKE1rNbYz+QZgN3G7CTjpHSTweovW8BmdsOl
         UFjg==
X-Gm-Message-State: AOJu0YzZc8WuuWtqlY45bnmjrT+LTejWT8a0G2XzWHGXLugTx3wpafG2
	4KaFbvgOUlpLLZIfWL0nNs2Sw9y0jYHfYLglrhzxouMhCmzZT1IHOF8oYEUB+J1c9eE=
X-Gm-Gg: AR+sD133r5SnOt8WbpbXmijy5if4t8RgdZuYfq/34TX+Iiq2EliIvpvJiPJ96Ut7TXo
	ej8JYYzYjqVSR4ZZp1UD9d4wLI0Nwey8E1U2S3JPPnxbkA/5w8w2zuOKXbjQsu/NKmFHZg5OK/o
	HbAwk3JvJozzNgs7H5zIHmbY9MpBUM+459euKWpZ0ZCOjYF99PMdcAblVN6fnQdNVYsMdKjFX4s
	O33zLrTtFa2YBMwjgdDikE7ENrhLZ9BfRnURL+fENjIkDMRkx4Ixk2VyKYAO+sr6OBLSUWpBPnF
	NOgzKsyTxQxsl5s2p3X4Awe5Oj6uMNnn/ZCyZxZaO1r+nRrm8Pc9SsyWFHT4DiPQqTi4jdmSjcD
	9+gVBl9teoS+wijlAcBm14RcMKebp31MDYmSiXmF5m4poS4zhlmk/G8aHr4CCcqheQgivOGbDtg
	BKZDoOk7rwgX01sQV5nq/WWGlD7vjaJO6B1pC4iBrogJY5rzLV0ylHTIFUMFcDsbXWdhrdtPF9w
	TM6O5tb
X-Received: by 2002:a17:90a:da8f:b0:380:21b7:e727 with SMTP id 98e67ed59e1d1-3933b95e327mr12617846a91.14.1786780731581;
        Sat, 15 Aug 2026 00:58:51 -0700 (PDT)
Received: from [100.125.248.95] ([124.70.231.46])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-394ea99ab1dsm5385654a91.7.2026.08.15.00.58.47
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sat, 15 Aug 2026 00:58:51 -0700 (PDT)
Message-ID: <4b36f0e1-7e76-4567-895d-d3ba525535ae@gmail.com>
Date: Sat, 15 Aug 2026 15:58:23 +0800
Precedence: bulk
X-Mailing-List: sashiko-reviews@lists.linux.dev
List-Id: <sashiko-reviews.lists.linux.dev>
List-Subscribe: <mailto:sashiko-reviews+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:sashiko-reviews+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH -next v5 05/32] ext4: set EXT4_MAP_NEW flag for delayed
 allocated blocks
To: sashiko-reviews@lists.linux.dev, Zhang Yi <yi.zhang@huaweicloud.com>
Cc: linux-ext4@vger.kernel.org, tytso@mit.edu
References: <20260814093331.1703882-1-yi.zhang@huaweicloud.com>
 <20260814093331.1703882-6-yi.zhang@huaweicloud.com>
 <20260814100816.4BBB31F00A3A@smtp.kernel.org>
Content-Language: en-US
From: Zhang Yi <yizhang089@gmail.com>
In-Reply-To: <20260814100816.4BBB31F00A3A@smtp.kernel.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 8/14/2026 6:08 PM, sashiko-bot@kernel.org wrote:
> Thank you for your contribution! Sashiko AI review found 1 potential issue(s) to consider:
> - [High] The newly introduced EXT4_MAP_NEW flag is completely ignored by its only caller, rendering the patch ineffective (dead code) and failing to resolve the underlying bug.
> --
> 
> --- Patch [5]: [PATCH -next v5 05/32] ext4: set EXT4_MAP_NEW flag for delayed allocated blocks ---
> commit f71e7357d8a5fa9c83f4d4fc004cfa3640d60291
> Author: Zhang Yi <yi.zhang@huawei.com>
> 
> ext4: set EXT4_MAP_NEW flag for delayed allocated blocks
> 
> This commit sets the EXT4_MAP_NEW flag in ext4_da_map_blocks() to indicate
> when a new delayed allocation block has been inserted. This aims to allow
> callers to distinguish newly created delayed extents from existing ones.
> 
> Link: https://lore.kernel.org/linux-ext4/cc05c17d-163e-4251-b2c9-aa3a6f9555d7@huaweicloud.com/
> 
>> diff --git a/fs/ext4/inode.c b/fs/ext4/inode.c
>> index 7601fe3618b1f..9dbece14ae569 100644
>> --- a/fs/ext4/inode.c
>> +++ b/fs/ext4/inode.c
>> @@ -1990,7 +1990,7 @@ static int ext4_da_map_blocks(struct inode *inode, struct ext4_map_blocks *map)
>>   		}
>>   	}
>>   
>> -	map->m_flags |= EXT4_MAP_DELAYED;
>> +	map->m_flags |= EXT4_MAP_DELAYED | EXT4_MAP_NEW;
> 
> [Severity: High]
> Does this code actually allow callers to use the newly added flag?
> 
> Looking at ext4_da_get_block_prep(), which calls ext4_da_map_blocks(),
> it unconditionally intercepts EXT4_MAP_DELAYED, sets BH_New, and returns
> early without checking EXT4_MAP_NEW:
> 
> fs/ext4/inode.c:ext4_da_get_block_prep() {
>      ...
> 	if (map.m_flags & EXT4_MAP_DELAYED) {
> 		map_bh(bh, inode->i_sb, invalid_block);
> 		set_buffer_new(bh);
> 		set_buffer_delay(bh);
> 		return 0;
> 	}
>      ...
> }
> 
> Because EXT4_MAP_DELAYED is always set alongside EXT4_MAP_NEW, this branch is
> always taken, and set_buffer_new(bh) is unconditionally called. The code never
> seems to evaluate map.m_flags & EXT4_MAP_NEW.
> 
> Is it possible this patch is incomplete and the underlying issue remains
> unfixed because the new flag is ignored?
> 

The 15th patch ("ext4: implement buffered write path using iomap")
will use this flag, so it's fine. I'll add a note in the commit message
as well, just to keep Sashiko from complaining again.

Thanks,
Yi.

>>   	retval = ext4_insert_delayed_blocks(inode, map->m_lblk, map->m_len);
>>   	if (!retval)
>>   		map->m_seq = READ_ONCE(EXT4_I(inode)->i_es_seq);
> 

