Received: from mail-pj2-f34.google.com (mail-pj2-f34.google.com [74.125.227.162])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 93D3B481643
	for <sashiko-reviews@lists.linux.dev>; Wed, 30 Sep 2026 09:26:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.227.162
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790760411; cv=none; b=m9KVWrm8sHYOxiiyGbXAiEynEz/MSVMKq44wIyCm1pEPqWlqnwSZdFnYY9vD1ckJRZ9NXBROYLInPiqTv47KgvGmcrbT8etHv1ajsT2ppzIr5Y46FhV10P1fz8aKPdYJ08yfuHWuBUsHGXZ4VP6KkDvJ7qlO1RpJ5N42MJ5r8Gc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790760411; c=relaxed/simple;
	bh=snYKkPjnHGJooB6kj297NyQPWFGTNVA4fRfr9ZoU6TI=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=LAS+0uvXjJ+xS9vI7Y+PB2wPL0gn2PBfSWEJqDUjV0gLhhUcWkVJJDUhm2TEySU8qKZJoM8Bm+rxNICUQp6E6mOMhvBY2JnNFK6s4SWtmsnYiffqcHTjLUL+FrN3fq3q/bH3WsLd2EkNOncHvfntrgtzoW0dpOy8UPJUaGGHLLc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=ffNiYFii; arc=none smtp.client-ip=74.125.227.162
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="ffNiYFii"
Received: by mail-pj2-f34.google.com with SMTP id d9443c01a7336-2d747eb79f7so22893415ad.1
        for <sashiko-reviews@lists.linux.dev>; Wed, 30 Sep 2026 02:26:49 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1790760409; x=1791365209; darn=lists.linux.dev;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=A2RZCydg1GnPh0uZBpAyDaAyXiDgTW77a8vZNMqkqA4=;
        b=ffNiYFiipUyQu+7FG3c5Sbz6RfEPayY8BEr0Y+BOiiVpB7JcdEn/6QjmImxLezNZHt
         m4QaaYjKbF2EeZmJt0a3eaqAbsF2ajC1y4E+0Gku+zR33SiCDswq/z8sjVnnlpGvNh8a
         Wb8FBYp67Y7sgCwFbQ/iUiWbzQjNzClt6oZukMU7M83jzaTWBJ2N2uV8uL0RTx7bKwqb
         QOTasCASI27zp/TkfXVmfoIMl7J8YkBeV8EVoI4ADlrf9A5Wx+vRDNiIUKGN/NwRcjkN
         o3oP3gRAlptQtaJeQL9pT+x/sS2P2h/bFAX5eVTY0rup4VpNlh7TFYn+hEXjmIgYgrOm
         WgnA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790760409; x=1791365209;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=A2RZCydg1GnPh0uZBpAyDaAyXiDgTW77a8vZNMqkqA4=;
        b=GHOQzez7NJLuCW+oXGA48Lx68kvnncorSiPO6UlPKu7YIZO1FT4RB27LyJt4H/14FL
         oQIvGR8StRQJALTfGFqoZaxpn8lebwa4xlJu/OVpRZZsRh6VeM31Eoilou1rEUs20RY7
         F3LlRjEkrdCAEdMFh12v4MwzKCNNsxIDczJj6U9B+bFLIw+Junfm1qnW/7uWBGGwdnD7
         OhPh+WxMIvodj8WTLDuYdm5fpfbSYnoCTzj3DaRAEbT6F5I87EqIL45xre44OchK9F1/
         VmyLAwRSjG8WuGSp5fingXsdsTicIHnHj1IwHxsyxPAS556vB4wm/OJ5sakcvZAMol/i
         rueA==
X-Gm-Message-State: AFq9FYJoEI8HsIZ4fCKpnrRRbb9HHLrpYhQvrKT4LC/j37H4PzqqDj+y
	OTrAIErztGFUg3eloGnvTn4P56WYMlxJLMt5k6b2e3f8J0Cp4g+GpHH9
X-Gm-Gg: AYBFou3GeSTTF+Vi7M6h3rBdZ2GbJkrRfKSDljaDrHn3gYzUJ9YObBloDeI+WGsWOUo
	ymzHeqQaNL0SD725CUjkie4Ssc3KsBfVqpBOHV9DR6iwLdEH/A98H/Y6XUPurtcDKL0Ff5eGRrx
	BJuzC8ZjbR9Ir3Nz9Irs+U2mBP0IXpwNZ+ERAewtcvQaFH4T3utWDNL4H+lVXL7Cd8DWXzRGnYm
	Go4GmsBhWdsjM8sVOgwka4rhATy9E6py24gK1fZkUt4sRCI+xX18e8lMdvgdcpAIET/PVfD24wh
	uYk6PJhlJx8VH+jHLrGFBRZFxUbZQE0n30m98A0/qK9bwkSnl6Z5UfjzRaGMVF3mPSZCL8Rt86T
	BbNzScfKRwM/68VQlPFkhQW4c6AR3iSe0TSM+/e0hHvPDojeN/v9MSmW4KwkhvlQGOSF7+Gcmdy
	CD3BwLV75/iyr7L+FQSKfsMEn6JXxJgObQfL5qjTXjuI6vp1RUaLE4f7IHqOn9naN6iVI40g0sm
	8yx+MAyboc0Uf2TvcE=
X-Received: by 2002:a17:903:19cd:b0:2dd:ad73:c984 with SMTP id d9443c01a7336-2e2e4b399fbmr6115365ad.28.1790760408671;
        Wed, 30 Sep 2026 02:26:48 -0700 (PDT)
Received: from [100.125.248.95] ([124.70.231.46])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2e2e587d193sm4405945ad.6.2026.09.30.02.26.45
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 30 Sep 2026 02:26:48 -0700 (PDT)
Message-ID: <217106f8-bad8-4834-bc1a-30f3197bfc63@gmail.com>
Date: Wed, 30 Sep 2026 17:26:40 +0800
Precedence: bulk
X-Mailing-List: sashiko-reviews@lists.linux.dev
List-Id: <sashiko-reviews.lists.linux.dev>
List-Subscribe: <mailto:sashiko-reviews+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:sashiko-reviews+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v6 15/31] ext4: implement writeback path using iomap
To: Ojaswin Mujoo <ojaswin@linux.ibm.com>
Cc: sashiko-reviews@lists.linux.dev, Zhang Yi <yi.zhang@huaweicloud.com>,
 linux-ext4@vger.kernel.org, tytso@mit.edu
References: <20260903123543.2302999-1-yi.zhang@huaweicloud.com>
 <20260903123543.2302999-16-yi.zhang@huaweicloud.com>
 <20260903133650.EDC101F00A3D@smtp.kernel.org>
 <bda020e4-2145-4c30-9330-ff8f9a6ff517@gmail.com>
 <arzNeYSTqq-Z4gXM@li-dc0c254c-257c-11b2-a85c-98b6c1322444.ibm.com>
Content-Language: en-US
From: Zhang Yi <yizhang089@gmail.com>
In-Reply-To: <arzNeYSTqq-Z4gXM@li-dc0c254c-257c-11b2-a85c-98b6c1322444.ibm.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 9/30/2026 4:51 PM, Ojaswin Mujoo wrote:
> On Sat, Sep 12, 2026 at 04:28:52PM +0800, Zhang Yi wrote:
>> On 9/3/2026 9:36 PM, sashiko-bot@kernel.org wrote:
>>> Thank you for your contribution! Sashiko AI review found 2 potential issue(s) to consider:
>>> - [Critical] Journal Credits Exhaustion / Panic in `ext4_iomap_finish_ioend()` due to arbitrarily large merged ioends.
>>> - [High] Infinite loop in `ext4_iomap_map_writeback_range` due to open-coded ENOSPC retry logic without limits.
>>> --
>>>
>>> commit e7cc5164579a940550c93afb2dfec1f186e079ed
>>> Author: Zhang Yi <yi.zhang@huawei.com>
>>> ext4: implement writeback path using iomap
>>>
>>> This commit adds the iomap writeback path for ext4 buffered I/O, introducing
>>> new writeback operations and end I/O handlers. It maps and allocates blocks
>>> as unwritten extents during writeback to prevent stale data exposure.
>>>
>>>> diff --git a/fs/ext4/inode.c b/fs/ext4/inode.c
>>>> index 1f18854b9cdd3..f7d7610197a1c 100644
>>>> --- a/fs/ext4/inode.c
>>>> +++ b/fs/ext4/inode.c
>>>
>>> [ ... ]
>>>
>>>> +static int ext4_iomap_map_writeback_range(struct iomap_writepage_ctx *wpc,
>>>> +					  loff_t offset, unsigned int dirty_len)
>>>> +{
>>>
>>> [ ... ]
>>>
>>>> +retry:
>>>> +	map.m_lblk = index;
>>>> +	map.m_len = min_t(unsigned int, MAX_WRITEPAGES_EXTENT_LEN, blk_len);
>>>> +	ret = ext4_map_blocks(NULL, inode, &map,
>>>> +			      EXT4_GET_BLOCKS_CREATE_UNWRIT_EXT |
>>>> +			      EXT4_GET_BLOCKS_METADATA_NOFAIL |
>>>> +			      EXT4_GET_BLOCKS_IO_SUBMIT |
>>>> +			      EXT4_EX_NOCACHE);
>>>> +	if (ret < 0) {
>>>> +		if (ext4_emergency_state(sb))
>>>> +			return ret;
>>>> +
>>>> +		/*
>>>> +		 * Retry transient ENOSPC errors, if
>>>> +		 * ext4_count_free_blocks() is non-zero, a commit
>>>> +		 * should free up blocks.
>>>> +		 */
>>>> +		if (ret == -ENOSPC && journal && ext4_count_free_clusters(sb)) {
>>>> +			jbd2_journal_force_commit_nested(journal);
>>>> +			goto retry;
>>>> +		}
>>>
>>> [Severity: High]
>>> Could this open-coded retry loop result in an infinite hang under certain
>>> conditions?
>>>
>>> If a non-root user fills the disk up to the threshold of root-reserved
>>> blocks, ext4_map_blocks() will return -ENOSPC because the block allocator
>>> denies access to reserved blocks for non-root users.
>>>
>>> However, ext4_count_free_clusters() returns the total free space including
>>> those root-reserved blocks. Because the count evaluates as non-zero, the code
>>> will force a journal commit and goto retry indefinitely, without any loop
>>> limits.
>>>
>>> Should this retry logic use a limit like ext4_should_retry_alloc(), or
>>> specifically account for root-reserved blocks to prevent a soft lockup in
>>> the writeback worker thread?
>>>
>>
>> This logic is inherited from the existing buffer_head writeback path
>> (the -ENOSPC handling in ext4_do_writepages()), which also retries after
>> a forced commit without any limit, so it does not introduce a new class
>> of problem.  That said, I agree that bounding the number of retries is
>> better, and I will add a limit in the next version.
>>
>>
>>>> diff --git a/fs/ext4/page-io.c b/fs/ext4/page-io.c
>>>> index 0236b6b9785a2..9b0e12b5463cf 100644
>>>> --- a/fs/ext4/page-io.c
>>>> +++ b/fs/ext4/page-io.c
>>>
>>> [ ... ]
>>>
>>>> +static void ext4_iomap_finish_ioend(struct iomap_ioend *ioend)
>>>> +{
>>>
>>> [ ... ]
>>>
>>>> +	/*
>>>> +	 * We may need to convert one extent, update the i_disksize and
>>>> +	 * dirty the inode.
>>>> +	 */
>>>> +	credits = ext4_chunk_trans_blocks(inode,
>>>> +			EXT4_MAX_BLOCKS(size, pos, inode->i_blkbits));
>>>> +	handle = ext4_journal_start(inode, EXT4_HT_EXT_CONVERT, credits);
>>>> +	if (IS_ERR(handle)) {
>>>> +		ret = PTR_ERR(handle);
>>>> +		goto out_err;
>>>> +	}
>>>
>>> [ ... ]
>>>
>>>> +void ext4_iomap_end_io(struct work_struct *work)
>>>> +{
>>>> +	struct ext4_inode_info *ei = container_of(work, struct ext4_inode_info,
>>>> +						  i_rsv_conversion_work);
>>>> +	struct iomap_ioend *ioend;
>>>> +	struct list_head ioend_list;
>>>> +	unsigned long flags;
>>>> +
>>>> +	spin_lock_irqsave(&ei->i_completed_io_lock, flags);
>>>> +	list_replace_init(&ei->i_rsv_conversion_list, &ioend_list);
>>>> +	spin_unlock_irqrestore(&ei->i_completed_io_lock, flags);
>>>> +
>>>> +	iomap_sort_ioends(&ioend_list);
>>>> +	while (!list_empty(&ioend_list)) {
>>>> +		ioend = list_entry(ioend_list.next, struct iomap_ioend, io_list);
>>>> +		list_del_init(&ioend->io_list);
>>>> +		iomap_ioend_try_merge(ioend, &ioend_list);
>>>> +		ext4_iomap_finish_ioend(ioend);
>>>> +	}
>>>> +}
>>>
>>> [Severity: Critical]
>>> Is there a risk of exhausting journal credits and panicking JBD2 when ioends
>>> are merged?
>>>
>>> In ext4_iomap_end_io(), iomap_ioend_try_merge() merges contiguous completions
>>> into an arbitrarily large ioend. When this merged ioend is later passed to
>>> ext4_iomap_finish_ioend(), it requests credits using ext4_chunk_trans_blocks().
>>>
>>> However, ext4_chunk_trans_blocks() internally hardcodes the extent count to 1,
>>> allocating credits sufficient for modifying only a single extent on disk.
>>>
>>> If a user writes a very large contiguous file (e.g., larger than 128MB), the
>>> merged ioend will exceed the maximum size of a single unwritten extent in ext4
>>> (which is 32,768 blocks). This will cause ext4_convert_unwritten_extents() to
>>> loop over multiple extents using the same transaction handle.
>>>
>>> Could this exhaust the single-extent credits provided by the transaction
>>> handle, resulting in a JBD2 panic during writeback?
>>>
>>
>> This is right.  ext4_convert_unwritten_extents() converts every extent
>> covered by the ioend using a single transaction handle, but that handle
>> was sized by ext4_chunk_trans_blocks() for one extent only, so a large
>> enough merged ioend can run out of credits.  This is hard to hit in
>> practice, since the end I/O worker normally runs promptly and not many
>> completed ioends accumulate before the merge, but to be safe I will
>> still fix it: call ext4_journal_ensure_credits() before each extent in
>> the conversion loop, so that the transaction is extended, or restarted
>> once it is full, as needed, and correct the estimation to
>> ext4_meta_trans_blocks(inode, max_blocks, 1, 0) at the same time, as no
>> data blocks are allocated there.
> 
> Yes I agree that it seems like a valid issue. I'm a bit unfamiliar
> with the journal ensure credits logic but seems like it would be
> stopping the running txn and starting a new transaction right?

Yes, the change is also very simple, please see:

https://github.com/zhangyi089/linux/commit/d8078ca0dd93bd92c0fa0904e1c76b112339f48d

> 
> If so, maybe lets move the idisksize update after the the conversion so
> that its updated in the final transaction, once the conversion is
> complete, which is a bit cleaner.
> 

That won't work. Since the conversion may be split across different
transactions, a single transaction can no longer provide the atomicity
guarantee for both the conversion and the i_disksize update. If we do
the conversion first and then lose power after some of the conversion
transactions have committed, we would end up with written extents beyond
EOF, which would make fsck complain.

Thanks,
Yi.

