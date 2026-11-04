Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.128.42
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793758944;
	b=wErN1auhO7ufKnVT2y2C2hZozREN9LBecuIs0ZxsarexYewx+vfFXzqq9geqMYqB8pE7
	 6p51NxZCw9kydFGhoD5WZkmaj/LLAxAOQc40sD8c1n4th2RRTtlQRVIr3XJUt+eRHvEzP
	 O7/hbu9gAdgepAefGKtLwan3tdiH6Sf5ddL5ctkd2BqFJrLF4jxCfqlfDjn36nySXi081
	 CCAi+KuJudH704VKnX6JC1jrfTN9tILZyaEw14QdhFAGVbMYO2uhWRXOpc8s5b90f5svp
	 oUC9KVYeRnCAfh2+IH6Hi7A0kk6RLsKlPVBr08AakXwK3hDn5QcGFhxisk63ApPylgg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793758944;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:Received:Message-ID:Date:
	 MIME-Version:User-Agent:Subject:To:Cc:References:From:
	 Content-Language:In-Reply-To:Content-Type:Content-Transfer-Encoding;
	bh=l+55oeCflUALLbGcLlOw+3vWGBQ+M5aDXfE+QkznVx8=;
	b=3kFd/Uj+n7cgFfIAmLpBxZsv8EMkZEd++Oh7ryuCuwTJ33uzasaZXBqsMzTByIslFZVD
	 8gH5GQH1rRZ6dKPykJXD3CuA1dkgw3MpvCvAJZ7DvfrYIutVR+TNWr9odMTMgGXWedttZ
	 m0IDCt24VGUUtn5IQ8tKJ93/kCOr6JfeY0XM/V6Qr9uTSUCCVZbJUZRta9HsNq7dd9kV7
	 dDYe1QFzg2ahqIz2cL7iIdbuYngj0WsVD6kJYrLPTJ0J8J48MEulWOl8ReIb51fCBMCWA
	 LUUC0+aJPmkIxbcv5iey+0tx1x7DQtrU02JkPJkZRKadNzXK9OICSUrMm4h7wGi1UpQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=suse.com;
	spf=pass smtp.mailfrom=suse.com;
	dkim=pass header.d=suse.com header.i=@suse.com header.a=rsa-sha256 header.s=google header.b=WJRbByMi;
	arc=none smtp.remote-ip=209.85.128.42
Received: from mail-wm1-f42.google.com (mail-wm1-f42.google.com [209.85.128.42])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0FE9E606A31B
	for <sashiko-reviews@lists.linux.dev>; Wed,  4 Nov 2026 02:22:23 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 0FE9E606A31B
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=suse.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=suse.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=suse.com header.i=@suse.com header.a=rsa-sha256 header.s=google header.b=WJRbByMi
Received: by mail-wm1-f42.google.com with SMTP id 5b1f17b1804b1-4a599e9110eso954705e9.0
        for <sashiko-reviews@lists.linux.dev>; Tue, 03 Nov 2026 18:22:23 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1793758942; x=1794363742; darn=lists.linux.dev;
        h=content-transfer-encoding:content-type:in-reply-to:content-language
         :from:references:cc:to:subject:user-agent:mime-version:date
         :message-id:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=l+55oeCflUALLbGcLlOw+3vWGBQ+M5aDXfE+QkznVx8=;
        b=WJRbByMi58F/3bB2dcNv4TQo6WN3hd9j+YeONZcqHsEx6LRXX0VqUVKs/6me3t0MUE
         f7KerWyKMz/p1pmjLj0kigcmFhEqpzB3c7joR7Ov5YEU/5zuD4glfS5AgcwZ5sUCROhY
         3sq1pxMsxxSAZH8mvVHVYZxamzYR7pjw0bsjgd7tK5exxgnIfbyzEiCbJwjLsL1Lb0V5
         OvzvEfx3xpz8J3vKMFWmRC/ZBdUK7pfI9zcaGOpX1kXxvIMxlP+AZiJGDRN+X8uKA5uR
         JYSIhq5aXzdXL5ARodLxj7S03iRF5Ae9yOTFls6tcTrjwDmr9SAGcgNv++ivTyjfGyoh
         MNwA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793758942; x=1794363742;
        h=content-transfer-encoding:content-type:in-reply-to:content-language
         :from:references:cc:to:subject:user-agent:mime-version:date
         :message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=l+55oeCflUALLbGcLlOw+3vWGBQ+M5aDXfE+QkznVx8=;
        b=225gSTiAF73+ubfUYKga0HORPoI6bHN0NC+0Pw+w3k2BAbRmyE8CsGaFwWtQlgr9Ji
         I6wmn8O1/7Dc9nBNMXSPxEGG3jmyRsONQK9S1gFUJcOV+SNxTfHOWT2mcZs2DsVHKLFT
         e0o0CpVLYBQECon/VtCyQL3zY5plsbUMa+oT2ghNZFtH2ubQgUybmq0sjYt0hPGY1Aec
         Ev1/4fnJmCngs5em+FaE6IlTqJqBwoDzRcJRiYfBiWUSCJvXIMb24xY+aEBMC7XfWLxP
         V0h0rmGvgw1cotgSkIWFsdpZSeK2tWKF7/qVpD58VTn571PSsBYsV5IVWtZi9oyucyye
         vJbQ==
X-Gm-Message-State: APuU4Z9xa2rcuZMz3Uta+dfGfEDVTXGHVrHRLpq+gDt1aC+qQAsDQSp+
	bAaYFY1GI3U/u2B7Gde8jEBzGPgCz0XD66WtPDud7vy5v8P3FOcBMAllUtb2gMf0X8OdOCPJrqL
	2U8IYccI=
X-Gm-Gg: AYBFou2x3yQLfJJBrgTMFrT221t/4Ze6D2TejvenfTg5g429BPkcaw8XXzjMGvEl4eh
	/jZAQtl+rWIBc1dZKKYi523R1Nzp6gf5i2hW8jDICysL5UoWpDsCSJelZI2iH5SwYEsURlAXKoj
	Gz2cFm+TrMk+Z2zlITnqA+C6N0EnecR+oKRJ+rQZuFPNn4WFUc4hD0h4axnIk5vWqAAlzk9U3gW
	nIK9oLfH5mt7+ZoHB/PLGG6/86FYRJ2oht55E+RWG6NqNuFrhe38bnV3fSGBs6+j877ARxHP4X9
	nYy3X8yQjx3+hbLhtNNX6W8HGPrQLuV0pN3p0iVED8rU2Xs1N0NwX3ED2JaRd50AFQx+cv94OFg
	4t0gd14FIPDubx17G9YRt/aGmI3zOj6tJM4L6i4Aid3NBl53AtMw1AtfYJpqhzSse/6GM3RPOVy
	suHmPZYpppq+kbxAD26YXLU31OHpXCl3lGVvBI65SmfJ94rhLsQebjjdqFTshbhIQjGD/wXaDPe
	cteIk9fvXxsbCr5xIZ4MMGRXNaJ9AgXmFh/Rps3nPN05Zk8mgkzATnBU8tO2By+O1Uv6Bvogvxj
	mcCrBPdH79RopVn0cePRhpVZ2ujsnEYPhQ==
X-Received: by 2002:a05:600c:a010:b0:4a1:7dcf:be1f with SMTP id 5b1f17b1804b1-4ac166ee4d6mr331835985e9.1.1793758942300;
        Tue, 03 Nov 2026 18:22:22 -0800 (PST)
Received: from [10.202.112.30] ([202.127.77.110])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-36ca39b3b7esm2211234eec.28.2026.11.03.18.22.19
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 03 Nov 2026 18:22:21 -0800 (PST)
Message-ID: <dda484be-1474-44a2-8979-31a88d9d902e@suse.com>
Date: Wed, 4 Nov 2026 10:22:17 +0800
X-Mailing-List: sashiko-reviews@lists.linux.dev
List-Id: <sashiko-reviews.lists.linux.dev>
List-Post: <mailto:sashiko-reviews@lists.linux.dev>
List-Help: <mailto:sashiko-reviews+help@lists.linux.dev>
List-Subscribe: <mailto:sashiko-reviews+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:sashiko-reviews+unsubscribe@lists.linux.dev>
List-Owner: <mailto:sashiko-reviews+owner@lists.linux.dev>
Precedence: list
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [RFC PATCH v4 1/4] ocfs2: Add new ocfs2_map_blocks() to introduce
 iomap feature
To: sashiko-reviews@lists.linux.dev
Cc: Mark Fasheh <mark@fasheh.com>, Joel Becker <jlbec@evilplan.org>,
 Joseph Qi <joseph.qi@linux.alibaba.com>
References: <20261103135605.22943-1-heming.zhao@suse.com>
 <20261103135605.22943-2-heming.zhao@suse.com>
 <sashiko-outbox-195415@kernel.org>
From: Heming Zhao <heming.zhao@suse.com>
Content-Language: en-US
In-Reply-To: <sashiko-outbox-195415@kernel.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 11/3/26 22:05, sashiko-bot@kernel.org wrote:
> Thank you for your contribution! Sashiko AI review found 3 potential issue(s) to consider:
> - [Low] ocfs2: dead flag clearing on zeroed map->flags in ocfs2_map_blocks()
> - [Low] ocfs2: contradictory unwritten extent comment in ocfs2_map_blocks()
> - [Low] ocfs2: leftover WIP comments and unused map flags in ocfs2.h
> --
> 
> commit 791fe09f6bb59c97fe72b8aefb0b1b37ffcf96df
> Author: Heming Zhao <heming.zhao@suse.com>
> 
> ocfs2: Add new ocfs2_map_blocks() to introduce iomap feature
> 
> This commit adds ocfs2_map_blocks() and associated OCFS2_MAP_* flags to
> provide block mapping for the upcoming iomap direct I/O conversion in
> OCFS2.
> 
>> diff --git a/fs/ocfs2/aops.c b/fs/ocfs2/aops.c
>> index 4acdbb70882cd..c612244690a10 100644
>> --- a/fs/ocfs2/aops.c
>> +++ b/fs/ocfs2/aops.c
>> @@ -126,6 +126,85 @@ static int ocfs2_lock_get_block(struct inode *inode, sector_t iblock,
>>   	return ret;
>>   }
>>   
>> +int ocfs2_map_blocks(struct inode *inode, struct ocfs2_map_block *map,
>> +		    int flags)
>> +{
>> +	int err = 0;
>> +	unsigned int ext_flags;
>> +	u64 max_blocks = map->len;
>> +	u64 p_blkno, count, past_eof;
>> +	struct ocfs2_super *osb = OCFS2_SB(inode->i_sb);
>> +	int create = flags & OCFS2_GET_BLOCKS_CREATE;
>> +
>> +	if (OCFS2_I(inode)->ip_flags & OCFS2_INODE_SYSTEM_FILE)
>> +		mlog(ML_NOTICE, "map_block on system inode 0x%p (%llu)\n",
>> +		     inode, inode->i_ino);
>> +
>> +	map->flags = 0;
>> +	err = ocfs2_extent_map_get_blocks(inode, map->lblk, &p_blkno, &count,
>> +					  &ext_flags);
>> +	if (err) {
>> +		mlog(ML_ERROR, "get_blocks() failed, inode: 0x%p, "
>> +		     "block: %llu\n", inode, map->lblk);
>> +		goto bail;
>> +	}
>> +
>> +	if (max_blocks < count)
>> +		count = max_blocks;
>> +
>> +	map->pblk = p_blkno;
>> +	map->len = count;
>> +
>> +	/*
>> +	 * ocfs2 never allocates in this function - the only time we
>> +	 * need to use MAP_NEW is when we're extending i_size on a file
>> +	 * system which doesn't support holes, in which case MAP_NEW
>> +	 * allows __block_write_begin() to zero.
>> +	 *
>> +	 * If we see this on a sparse file system, then a truncate has
>> +	 * raced us and removed the cluster. In this case, we clear
>> +	 * the buffers dirty and uptodate bits and let the buffer code
>> +	 * ignore it as a hole.
>> +	 */
>> +	if (create && map->pblk == 0 && ocfs2_sparse_alloc(osb)) {
>> +		map->flags &= ~(OCFS2_MAP_DIRTY | OCFS2_MAP_UPTODATE);
>> +		goto bail;
>> +	}
> 
> [Severity: Low]
> In ocfs2_map_blocks() in fs/ocfs2/aops.c, map->flags is unconditionally
> initialized to 0 at entry and is not modified before reaching the
> (create && map->pblk == 0 && ocfs2_sparse_alloc(osb)) check.
> 
> Unlike ocfs2_get_block(), which operates on a page-cache struct
> buffer_head that might have BH_Dirty or BH_Uptodate set, struct
> ocfs2_map_block is a transient mapping descriptor. Is clearing
> OCFS2_MAP_DIRTY and OCFS2_MAP_UPTODATE on map->flags (along with the
> comment referencing __block_write_begin() and buffer dirty/uptodate bits)
> a leftover from ocfs2_get_block()?

I will remove this line.
> 
>> +
>> +	if (p_blkno) {
>> +		if (ext_flags & OCFS2_EXT_UNWRITTEN) {
>> +			map->flags |= OCFS2_MAP_UNWRITTEN;
>> +		} else {
>> +			/* Treat the unwritten extent as a hole for zeroing purposes. */
>> +			map->flags |= OCFS2_MAP_MAPPED;
>> +		}
>> +	}
> 
> [Severity: Low]
> As reported by Sashiko on RFC v3 [1], in ocfs2_map_blocks() in
> fs/ocfs2/aops.c, when p_blkno is non-zero and ext_flags &
> OCFS2_EXT_UNWRITTEN is set, the first branch sets OCFS2_MAP_UNWRITTEN
> rather than leaving the extent unmapped like ocfs2_get_block() did.
> 
> In the else branch (where !(ext_flags & OCFS2_EXT_UNWRITTEN), meaning a
> regular written extent), the comment says "Treat the unwritten extent as a
> hole for zeroing purposes." right before setting OCFS2_MAP_MAPPED. Should
> this copied comment be removed or updated to match ocfs2_map_blocks()?

ignore, this is on purpose.
> 
> [ ... ]
> 
>> diff --git a/fs/ocfs2/ocfs2.h b/fs/ocfs2/ocfs2.h
>> index e3bb3cc0b25a2..7c75def1ef4c3 100644
>> --- a/fs/ocfs2/ocfs2.h
>> +++ b/fs/ocfs2/ocfs2.h
>> @@ -514,7 +514,51 @@ struct ocfs2_super
>>   	struct ocfs2_filecheck_sysfs_entry osb_fc_ent;
>>   };
>>   
>> -#define OCFS2_SB(sb)	    ((struct ocfs2_super *)(sb)->s_fs_info)
>> +/*
>> + * Bits on bh->b_state used by ocfs2.
>> + *
>> + * These MUST be after the JBD2 bits.  Hence, we use BH_JBDPrivateStart.
>> + */
>> +enum ocfs2_state_bits {
>> +	BH_NeedsValidate = BH_JBDPrivateStart,
>> +};
>> +
>> +/* Expand the magic b_state functions */
>> +BUFFER_FNS(NeedsValidate, needs_validate);
>> +
>> +/*
>> + * Logical to physical block mapping, used by ocfs2_map_blocks()
>> + *
>> + * This structure is used to pass requests into ocfs2_map_blocks()
>> + * as well as to store the information returned by ocfs2_map_blocks().
>> + * It takes less room on the stack than a struct buffer_head.
>> + */
>> +#define OCFS2_MAP_NEW			BIT(BH_New)
>> +#define OCFS2_MAP_MAPPED		BIT(BH_Mapped)
>> +#define OCFS2_MAP_UNWRITTEN		BIT(BH_Unwritten)
>> +/* useless? #define OCFS2_MAP_BOUNDARY		BIT(BH_Boundary) */
>> +/* useless? #define OCFS2_MAP_DELAYED		BIT(BH_Delay) */
>> +#define OCFS2_MAP_DIRTY			BIT(BH_Dirty)
>> +#define OCFS2_MAP_UPTODATE		BIT(BH_Uptodate)
>> +#define OCFS2_MAP_NEEDS_VALIDATE	BIT(BH_NeedsValidate)
>> +#define OCFS2_MAP_DEFER_COMPLETION	BIT(BH_Defer_Completion)
>> +#define OCFS2_MAP_FLAGS		(OCFS2_MAP_NEW | OCFS2_MAP_MAPPED |\
>> +				 OCFS2_MAP_UNWRITTEN |\
>> +				 OCFS2_MAP_DIRTY | OCFS2_MAP_UPTODATE |\
>> +				 OCFS2_MAP_NEEDS_VALIDATE |\
>> +				 OCFS2_MAP_DEFER_COMPLETION)
> 
> [Severity: Low]
> This isn't a bug, but in fs/ocfs2/ocfs2.h there are two commented-out
> work-in-progress definitions (OCFS2_MAP_BOUNDARY and OCFS2_MAP_DELAYED),
> and BH_NeedsValidate was moved out of fs/ocfs2/buffer_head_io.c solely to
> define OCFS2_MAP_NEEDS_VALIDATE, which (along with OCFS2_MAP_DIRTY,
> OCFS2_MAP_UPTODATE, OCFS2_MAP_DEFER_COMPLETION, and OCFS2_MAP_FLAGS) does
> not appear to be used by ocfs2_map_blocks() or its callers. Could these
> unused flags and commented-out lines be dropped, keeping BH_NeedsValidate
> local to fs/ocfs2/buffer_head_io.c?
> 
> [1] https://lore.kernel.org/r/20261018143319.22329-2-heming.zhao@suse.com
> 

will remove OCFS2_MAP_BOUNDARY and OCFS2_MAP_DELAYED, keep others.


Thanks,
Heming
