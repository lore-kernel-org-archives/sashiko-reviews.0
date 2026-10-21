Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.128.48
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792565044;
	b=g0iQVIEfi3r/0VId34TuB6CQpi8Ikx8akhXfAEtbBthwqqCoewDB85yr/4/glyfnzH+C
	 9R5/QImTIsCtjIqpfaz6RJi+jLN8uYUJA8lNQ4uWwgA8KqE1sz5Xzr9jhGEgpqiwzEFUZ
	 4CjMQGy2KsRI6MG0zA9bSLw7b1rApK3E1fxlR/FYf+YKcN9DGz23sF9o2MWgBwfifZQcD
	 FnoKjVp78sFdgx3vNNc67Wk+bZQksy8FuL936g8ECZpLSUX95AXNSmhE0ZlOLmV5FINAH
	 qboxRrhfzJzYGgQSVjsXCOENY7yD3LPg8dzR0MLWqw91l0vD8Nsj43J7tUukTmwbqqg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792565044;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:Received:Message-ID:Date:
	 MIME-Version:User-Agent:Subject:To:Cc:References:From:
	 Content-Language:In-Reply-To:Content-Type:Content-Transfer-Encoding;
	bh=gmpMha6rkUSceH66l+SaQI4dr3KOtNdSfkv9cp7hnbE=;
	b=KbCgjShv7tVvEBNRocHegx7rKRs97czufLoDFvQRQ8IxP8mWrHL9Ps1ocIWYVu5urdEa
	 5p4OcbiSYpyNb/l+YQGvlNWhQesdvKlm0FdsTuL64MevL/VRokAvAdAEKROWMzRjzxsHx
	 WauMqI0Hwaz2NFUakOzDqsWKIdWWL2O0WLNW9bgx5oJEYy/EeswIqbOEhNZotulLrv1UU
	 vDNhxC9QZS/YdrAg7UGPwk5jNN6Vquc/uEsdq+93tOWIfn5/icyeppyZofCEveY4hPuJY
	 lG6oOo4QqpP+zeZJuGBptG7NMsErcT+lroDyPUeCsA5mouzpsicAFkLRp7DKJveyn7g==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=suse.com;
	spf=pass smtp.mailfrom=suse.com;
	dkim=pass header.d=suse.com header.i=@suse.com header.a=rsa-sha256 header.s=google header.b=dWH+5bpS;
	arc=none smtp.remote-ip=209.85.128.48
Received: from mail-wm1-f48.google.com (mail-wm1-f48.google.com [209.85.128.48])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C261E606A31C
	for <sashiko-reviews@lists.linux.dev>; Wed, 21 Oct 2026 06:44:03 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org C261E606A31C
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=suse.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=suse.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=suse.com header.i=@suse.com header.a=rsa-sha256 header.s=google header.b=dWH+5bpS
Received: by mail-wm1-f48.google.com with SMTP id 5b1f17b1804b1-4a1e154e4c6so223555e9.3
        for <sashiko-reviews@lists.linux.dev>; Tue, 20 Oct 2026 23:44:03 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1792565042; x=1793169842; darn=lists.linux.dev;
        h=content-transfer-encoding:content-type:in-reply-to:content-language
         :from:references:cc:to:subject:user-agent:mime-version:date
         :message-id:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=gmpMha6rkUSceH66l+SaQI4dr3KOtNdSfkv9cp7hnbE=;
        b=dWH+5bpSN0gSZMGRsd8/UTV4/Ho5AZGdV4yJE6/eOmpoG6hsi96C7Z3/MA92ayt5oG
         vgTkrT3BPYioaMdmnsUuYEp4lNzFAcrPDuRKOvCPjrKtV9RxoUB4RKy2ni+HvY8Dms0u
         BhXsTM6h73YB6MCIV6C0AA7rtxGq2gUlnQPx4v8kg8NFmvDzgBBZ0m6OzqIK5ahoAGMd
         Yf7wmnMw35xrY+cq9WyBP9ZR1YBLvlImLzFaSu2UuxgqOmB2lZXq6r7nNZaZGqf/pmTL
         B0fa2H9UaaRmpLkVK6sd8LAOsqmfEWlZBV4gCigj+Ox4ejDQIf9o6WHXB1iKLpgG156Y
         vP/g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792565042; x=1793169842;
        h=content-transfer-encoding:content-type:in-reply-to:content-language
         :from:references:cc:to:subject:user-agent:mime-version:date
         :message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=gmpMha6rkUSceH66l+SaQI4dr3KOtNdSfkv9cp7hnbE=;
        b=EAWe0CRMghdAgC96WMKmyt3Rjr4U+Ef7AIn/685K+oaOARhEaMVMUlHzFTp2Ta4X0j
         xjzM/Q/QWzfja1aiic8USEXnaA/u/Ujo+jag5NVArKb4LPtbItdJ/DQd6A+NLMYjjZ/L
         DJ+Y1u/POn9OJyklqVL04ezYE3eIXPMnDraQbe5UaZqKevF5eI1kJrWXat724Dqh0BK9
         RzT2VBZqQNtyaVPwEP3U8RHpf0L2fsUB48V0c7g/uxbbJUi0M7osXhLQYBaVsw7QJsmr
         Ix48hfVt8xbFUDQdBO2x5IjzeIfUNep+JpArRqx0dsWaG6rQihc6aiwfnRxEF6PcO/gH
         CeLA==
X-Gm-Message-State: AFq9FYJApq6JGQxDHKSFWgJK3DEPAS88IDzZu/S2NevC9EfETCYdjgMC
	grHGj9XApE+eCDUVBC58uuMkzfarF9Ln8yk4EUHgtO2gne7tcXqFAd0yd0YdC8VJ+IICMUSvtqq
	B/QjCSkk=
X-Gm-Gg: AYBFou3wRgGPTo4FdTZDj/f1+lLwcfHv1DF/HDCEkuuglKI7vPz8vc2sVlSF7v31t2p
	PkWNFtYXo2XChbXUa70YVtlTJftCIAVlBGa9HM3Dc90ZV4IPFZZxrcFBrf2UZelRPRU954j+xBO
	c0SIzvQo+W+lGdALLe9qgmHrJEXJD9dbUVZgo537mGajQKiMmcFfKhKMfa0t2Hy3MOUVgVMKSWW
	4zkWgCvxSVuQhkDEzN0WsDNqisUM5JyxgvMRtg+lSv3QcJzI5+/IbTlX4MHGS4CrTXduoN9ZlBM
	+PprFZSx+QO3tSYVk0NDePIRxO5fVkq/5U29kZsosZgpgGJTWpZpwO7UyrpGEKVzAkAoTI8pAnU
	XtDHNmCk0CXSAWcqbZdTsiQ9T6a7GFvOq2UNysumnt821RXjrsEroxhkfAo8dSDsGyUTNkagSz1
	1zcMOIoi775xQCXyGEGPHLvNH/G2gOsnkmxWHWdKd4O/s9AC1qJl+Kej4Ksp5U845zixr+1PrJI
	h5CZjs3wkJu+Jhm0b5R4k0BfcAjTja+gHcF0k5VcM2/KMV+/5xEq421mU/IpOYLA/T6Aov6dUrs
	4eqJ4o0=
X-Received: by 2002:a05:600c:e547:20b0:4a2:1a:a115 with SMTP id 5b1f17b1804b1-4a2001aa3a8mr3552875e9.0.1792565041908;
        Tue, 20 Oct 2026 23:44:01 -0700 (PDT)
Received: from [10.202.112.30] ([202.127.77.110])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2ea3b4ada70sm6614735ad.72.2026.10.20.23.43.59
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 20 Oct 2026 23:44:00 -0700 (PDT)
Message-ID: <eae4f468-ad74-4923-a0e8-74f02dad4779@suse.com>
Date: Wed, 21 Oct 2026 14:43:50 +0800
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
Subject: Re: [RFC PATCH v3 1/4] ocfs2: Add new ocfs2_map_blocks() to introduce
 iomap feature
To: sashiko-reviews@lists.linux.dev
Cc: Mark Fasheh <mark@fasheh.com>, Joel Becker <jlbec@evilplan.org>,
 Joseph Qi <joseph.qi@linux.alibaba.com>
References: <20261018143319.22329-1-heming.zhao@suse.com>
 <20261018143319.22329-2-heming.zhao@suse.com>
 <sashiko-outbox-176213@kernel.org>
From: Heming Zhao <heming.zhao@suse.com>
Content-Language: en-US
In-Reply-To: <sashiko-outbox-176213@kernel.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 10/18/26 22:46, sashiko-bot@kernel.org wrote:
> Thank you for your contribution! Sashiko AI review found 3 potential issue(s) to consider:
> - [High] ocfs2: ocfs2_map_blocks() truncates 64-bit map->len to signed int
> - [Medium] ocfs2: ocfs2_map_blocks() leaves stale map->flags and omits UNWRITTEN mask
> - [Low] ocfs2: tautological unwritten check and dead else branch in ocfs2_map_blocks()
> --
> 
> commit bbd9a5b12f2907ae3d2ebf7b854a6e0542a61540
> Author: Heming Zhao <heming.zhao@suse.com>
> 
> ocfs2: Add new ocfs2_map_blocks() to introduce iomap feature
> 
> This commit introduces ocfs2_map_blocks(), struct ocfs2_map_block, and the
> OCFS2_MAP_* flags in preparation for converting OCFS2 direct I/O to the iomap
> framework.
> 
>> diff --git a/fs/ocfs2/aops.c b/fs/ocfs2/aops.c
>> index 4acdbb70882cd..3215e2dda2be0 100644
>> --- a/fs/ocfs2/aops.c
>> +++ b/fs/ocfs2/aops.c
>> @@ -126,6 +126,89 @@ static int ocfs2_lock_get_block(struct inode *inode, sector_t iblock,
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
>> +
>> +	if (p_blkno) {
>> +		if (ext_flags & OCFS2_EXT_UNWRITTEN) {
>> +			map->flags |= OCFS2_MAP_UNWRITTEN;
>> +		} else if (!(ext_flags & OCFS2_EXT_UNWRITTEN)) {
>> +			/* Treat the unwritten extent as a hole for zeroing purposes. */
>> +			map->flags |= OCFS2_MAP_MAPPED;
>> +		} else {
>> +			/* TODO: handling other OCFS2_MAP_XX in the future */
>> +		}
>> +	}
> 
> [Severity: Medium]
> Should ocfs2_map_blocks() clear map->flags on entry (similar to how
> ext4_map_blocks() initializes map->m_flags = 0)?
> 
> Right now, ocfs2_map_blocks() only modifies map->flags via bitwise OR (or
> clears OCFS2_MAP_DIRTY and OCFS2_MAP_UPTODATE on a sparse hole with create).
> If a caller does not zero map->flags before calling ocfs2_map_blocks(), or
> reuses the same struct ocfs2_map_block across consecutive calls (for example,
> in the subsequent patch where ocfs2_iomap_begin() calls ocfs2_map_blocks() on
> the overwrite fast path and then resets only map.len before calling
> ocfs2_iomap_alloc() -> ocfs2_dio_wr_map_blocks() -> ocfs2_map_blocks()), stale
> flags like OCFS2_MAP_MAPPED or OCFS2_MAP_UNWRITTEN will remain set even if the
> next lookup hits a hole or a different extent type.

accept the above suggestion.

> 
> [Severity: Low]
> In the p_blkno block above, the else-if condition checks
> !(ext_flags & OCFS2_EXT_UNWRITTEN), which is the exact negation of the
> preceding if condition. Does this make the final else branch unreachable dead
> code?
> 

I will remove the else branch in next version.

> Also, the comment "Treat the unwritten extent as a hole for zeroing purposes"
> appears to be carried over from ocfs2_get_block(), where unwritten extents
> were left unmapped, whereas here unwritten extents are mapped with
> OCFS2_MAP_UNWRITTEN in the first branch and written extents get
> OCFS2_MAP_MAPPED in the second branch.

disagree. The logic in ocfs2_map_blocks() is the same as in ocfs2_get_block():
unwritten extents are marked as mapped.

> 
>> +
>> +	if (!ocfs2_sparse_alloc(osb)) {
>> +		if (map->pblk == 0) {
>> +			err = -EIO;
>> +			mlog(ML_ERROR,
>> +			     "iblock = %llu p_blkno = %llu blkno=(%llu)\n",
>> +			     (unsigned long long)map->lblk,
>> +			     (unsigned long long)map->pblk,
>> +			     (unsigned long long)OCFS2_I(inode)->ip_blkno);
>> +			mlog(ML_ERROR, "Size %llu, clusters %u\n",
>> +			     (unsigned long long)i_size_read(inode),
>> +			     OCFS2_I(inode)->ip_clusters);
>> +			dump_stack();
>> +			goto bail;
>> +		}
>> +	}
>> +
>> +	past_eof = ocfs2_blocks_for_bytes(inode->i_sb, i_size_read(inode));
>> +
>> +	if (create && (map->lblk >= past_eof))
>> +		map->flags |= OCFS2_MAP_NEW;
>> +
>> +bail:
>> +	if (err < 0)
>> +		return err;
>> +	else
>> +		return map->len;
>> +}
> 
> [Severity: High]
> Can returning map->len from ocfs2_map_blocks() overflow or truncate the
> 64-bit block count into a negative signed int?
> 
> In struct ocfs2_map_block, len is a u64, while ocfs2_map_blocks() returns a
> 32-bit signed int without clamping count or max_blocks to INT_MAX (unlike
> ext4_map_blocks()).
> 
> When a caller such as ocfs2_iomap_begin() (introduced in the next patch of
> this series, which bounds block numbers to OCFS2_MAX_LOGICAL_BLOCK =
> 0xfffffffe and sets map.len up to 0xffffffff) passes map->len > INT_MAX and
> queries a hole at or past the end of existing extents:
> 
> ocfs2_map_blocks()
>    ocfs2_extent_map_get_blocks()
>      ocfs2_get_clusters()
>        ocfs2_figure_hole_clusters()
>          *num_clusters = UINT_MAX - v_cluster;
> 
> ocfs2_extent_map_get_blocks() converts num_clusters into a 64-bit block count
> that can be >= 0x80000000. Because ocfs2_map_blocks() only bounds count by
> u64 max_blocks = map->len, returning map->len as an int turns values in
> 0x80000000..0xffffffff into negative numbers and truncates values >= 2^32,
> causing callers checking ret < 0 to treat valid mappings as errors.

Agree. I will change ocfs2_map_blocks() to return the "err" (negative value on
failure, 0 on success), and have callers use input parameter map->len to check
the write length.

> 
>> diff --git a/fs/ocfs2/ocfs2.h b/fs/ocfs2/ocfs2.h
>> index e3bb3cc0b25a2..f4fd412c616a5 100644
>> --- a/fs/ocfs2/ocfs2.h
>> +++ b/fs/ocfs2/ocfs2.h
> 
> [ ... ]
> 
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
>> +				 OCFS2_MAP_DIRTY | OCFS2_MAP_UPTODATE |\
>> +				 OCFS2_MAP_NEEDS_VALIDATE |\
>> +				 OCFS2_MAP_DEFER_COMPLETION)
> 
> [Severity: Medium]
> Should OCFS2_MAP_FLAGS also include OCFS2_MAP_UNWRITTEN? OCFS2_MAP_UNWRITTEN
> is defined just above and set by ocfs2_map_blocks(), so omitting it from
> OCFS2_MAP_FLAGS will drop the unwritten state whenever flags are masked with
> OCFS2_MAP_FLAGS.

Agree. Btw, currently no function uses OCFS2_MAP_FLAGS.

- Heming
> 
> [ ... ]
> 
>> +struct ocfs2_map_block {
>> +	u64 pblk; /* physical block# */
>> +	u64 lblk; /* logical block# */
>> +	u64 len;  /* number of block */
>> +	unsigned int flags;
>> +};
> 
> [ ... ]
> 
>>
>> -- 
>> 2.51.2
>>
> 

