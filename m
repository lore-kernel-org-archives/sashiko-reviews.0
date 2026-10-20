Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=198.175.65.20
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792489950;
	b=POf+gpQLcnDQ9xwgw9k2gvikvkUBMmnNn87gmROjKNs1KQiWCZagOjQF2KGwx+2iHFef
	 zAakwh4+wbEgQDAeqwieY4+1BozAqmf0W9OB4lS+JSY5GxjM3694hKcgT49X5fBgj1u5O
	 TwfcDZrx95ZPxiIt6pnLta9oSma42PzkFWgV1+/wbRIK8drXEchjscFopkoMSmYhNKGAA
	 uxrHxGRWNx726BtCHCyPXTx9mJvoX5R6ZM5duKyVNKnVXVJGY4GhWLYBsYpnvrDt/cI89
	 DyzoOsUqm3lOokR4cvGNDnOmFYj4u8c1+uFLXsKwpplIBuueiurs+s9vB3dae4vmqbQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792489950;
	h=DMARC-Filter:DKIM-Signature:X-CSE-ConnectionGUID:X-CSE-MsgGUID:
	 X-IronPort-AV:X-IronPort-AV:Received:X-CSE-ConnectionGUID:
	 X-CSE-MsgGUID:X-ExtLoop1:X-IronPort-AV:Received:Message-ID:Date:
	 MIME-Version:User-Agent:Subject:To:References:Content-Language:From:
	 In-Reply-To:Content-Type:Content-Transfer-Encoding;
	bh=9RA34eAKRDsHc610G/efk/DmF3S23pMiDtfSgVsnHq0=;
	b=06/IhKZubZSlHyVf+z68tyloteQ1b3cYXi9QJ6Nmos27ifIkh+GUYHCz+2iWslR5Pod2
	 BLmavgBU3Vs+ynhyP585ZqteuNeqCMTZFb1B2l7KtrF0MM+vVNOE8iEMGvuYq/gRYYSrm
	 r5/bLn2w3AtD6GeOn7PLhpuZfRcuxkDUIGtT889JgUfat958SaEmIbV8wD/Kjp8nbMkxW
	 SZ1NFPs0yoHk6Gq52K4hef+daERrq/h9hWBTWxO2/xv/S13zfUtcDhupAKC2R8VHBEwfZ
	 R9ST0Bg6SKgs+Bp5/XZcFIjjaqanQfsInVLG3H4yX9QKIrk3hgVsTSpiy8kPx2i8tWA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=intel.com;
	spf=pass smtp.mailfrom=intel.com;
	dkim=pass header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=CmMrdAk8;
	arc=none smtp.remote-ip=198.175.65.20
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.20])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 14BE7606A31D
	for <sashiko-reviews@lists.linux.dev>; Tue, 20 Oct 2026 09:52:27 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 14BE7606A31D
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=CmMrdAk8
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1792489948; x=1824025948;
  h=message-id:date:mime-version:subject:to:references:from:
   in-reply-to:content-transfer-encoding;
  bh=IAPImBUfyp3bdkqhbMsCUAHxauF0onLlZjRETWAVSAk=;
  b=CmMrdAk8A6mcI5ohusV6ReYQ/hOO5jiUQK5nFkDT7PND8KwTvaSTJbl3
   PU7Twl02ZXJ8Zt1fWBfYoyQmUOn4BBKmSjlRma4o/jv8221NF/O5Va/7I
   UwHO9A+gmZ/3pmqHEzPXBHze9QWxJHagS0t+mXFWGKu9RLbx+vU3o5FfN
   40wuWsRHoU4vUzei7rtFSUNaRMj/3LvIax6fqLntqwYIYxW8F6XKZxJYE
   cI7QK8oyniniCAtgpdL73gj9eBdg3WUMawqG3gZzrfoVHnfangJtLqjQU
   BPYfXIY7Z6W/eIY+IHVmclI2zPMtZN4C++V7xR0krjBYVfgDjPeqhqMno
   A==;
X-CSE-ConnectionGUID: 4PMxHN4FQ9eNQ4p6dCxtvA==
X-CSE-MsgGUID: TgkxbAQ5QfCY7ERst7bgsw==
X-IronPort-AV: E=McAfee;i="6800,10657,11940"; a="1199296"
X-IronPort-AV: E=Sophos;i="6.27,168,1787036400"; 
   d="scan'208";a="1199296"
Received: from orviesa009.jf.intel.com ([10.64.159.149])
  by orvoesa112.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 20 Oct 2026 02:52:24 -0700
X-CSE-ConnectionGUID: PL3RNsQXTLK+LLqLYIoqUg==
X-CSE-MsgGUID: VLvf3u29Rne+Sacfrjbj7A==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,168,1787036400"; 
   d="scan'208";a="2757227"
Received: from smoticic-mobl1.ger.corp.intel.com (HELO [10.245.244.166]) ([10.245.244.166])
  by smtpauth.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 20 Oct 2026 02:52:23 -0700
Message-ID: <30e81db2-a56a-464b-93ea-c74aa161fdde@intel.com>
Date: Tue, 20 Oct 2026 10:52:21 +0100
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
Subject: Re: [PATCH v5 1/2] gpu/buddy: restore two-pass clear/dirty guard for
 range-biased allocation
To: sashiko-reviews@lists.linux.dev,
 Arunpravin Paneer Selvam <arunpravin.paneerselvam@amd.com>,
 dri-devel@lists.freedesktop.org, intel-gfx@lists.freedesktop.org,
 intel-xe@lists.freedesktop.org
References: <20261020055537.1640552-1-arunpravin.paneerselvam@amd.com>
 <sashiko-outbox-178464@kernel.org>
Content-Language: en-GB
From: Matthew Auld <matthew.auld@intel.com>
In-Reply-To: <sashiko-outbox-178464@kernel.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 20/10/2026 09:00, sashiko-bot@kernel.org wrote:
> Thank you for your contribution! Sashiko AI review found 1 potential issue(s) to consider:
> - [High] gpu/buddy: block_incompatible() mishandles split and mixed blocks in __alloc_range_bias()
> --
> 
> commit 6dff7f0e6dce9c68ecb98f2d911199843d2b4401
> Author: Arunpravin Paneer Selvam <Arunpravin.PaneerSelvam@amd.com>
> 
> gpu/buddy: restore two-pass clear/dirty guard for range-biased allocation
> 
> This commit introduces a two-pass search in __gpu_buddy_alloc_range_bias()
> using block_incompatible() in the strict pass to prevent range-restricted
> allocations from splitting opposite-class (clear vs. dirty) blocks unless
> no matching blocks exist in the range.
> 
>> diff --git a/drivers/gpu/buddy.c b/drivers/gpu/buddy.c
>> index 503f7d5934e4b..91935c71c5255 100644
>> --- a/drivers/gpu/buddy.c
>> +++ b/drivers/gpu/buddy.c
>> @@ -1240,11 +1240,19 @@ static void __gpu_buddy_undo_splits(struct gpu_buddy *mm,
>>   	}
>>   }
>>   
>> +static bool block_incompatible(struct gpu_buddy_block *block, unsigned int flags)
>> +{
>> +	bool needs_clear = flags & GPU_BUDDY_CLEAR_ALLOCATION;
>> +
>> +	return needs_clear != gpu_buddy_block_is_clear(block);
>> +}
>> +
>>   static struct gpu_buddy_block *
>>   __alloc_range_bias(struct gpu_buddy *mm,
>>   		   u64 start, u64 end,
>>   		   unsigned int order,
>> -		   unsigned long flags)
>> +		   unsigned long flags,
>> +		   bool fallback)
>>   {
> 
> [ ... ]
> 
>> @@ -1298,6 +1304,9 @@ __alloc_range_bias(struct gpu_buddy *mm,
>>   				continue;
>>   		}
>>   
>> +		if (!fallback && block_incompatible(block, flags))
>> +			continue;
>> +
>>   		if (contains(start, end, block_start, block_end) &&
>>   		    order == gpu_buddy_block_order(block)) {
>>   			/*
>> @@ -1315,38 +1324,8 @@ __alloc_range_bias(struct gpu_buddy *mm,
>>   				goto err_undo;
>>   		}
>>   
>> -		/*
>> -		 * Top-down is a strict address-placement policy, so when it is
>> -		 * requested we ignore clear steering and simply descend the
>> -		 * right (higher-address) child first. Only a non-top-down clear
>> -		 * request biases the descent towards clear/has_clear subtrees.
>> -		 */
>> -		if ((flags & GPU_BUDDY_CLEAR_ALLOCATION) &&
>> -		    !(flags & GPU_BUDDY_TOPDOWN_ALLOCATION)) {
>> -			struct gpu_buddy_block *prefer;
>> -
>> -			if (gpu_buddy_block_is_clear(block->right))
>> -				prefer = block->right;
>> -			else if (gpu_buddy_block_is_clear(block->left))
>> -				prefer = block->left;
>> -			else if (block->right->has_clear)
>> -				prefer = block->right;
>> -			else if (block->left->has_clear)
>> -				prefer = block->left;
>> -			else
>> -				prefer = block->right;
>> -
>> -			if (prefer == block->right) {
>> -				list_add(&block->left->tmp_link, &dfs);
>> -				list_add(&block->right->tmp_link, &dfs);
>> -			} else {
>> -				list_add(&block->right->tmp_link, &dfs);
>> -				list_add(&block->left->tmp_link, &dfs);
>> -			}
>> -		} else {
>> -			list_add(&block->left->tmp_link, &dfs);
>> -			list_add(&block->right->tmp_link, &dfs);
>> -		}
>> +		list_add(&block->left->tmp_link, &dfs);
>> +		list_add(&block->right->tmp_link, &dfs);
>>   	} while (1);
> 
> [Severity: High]
> Does calling block_incompatible() on every visited node in
> __alloc_range_bias() before checking whether the block is split or mixed
> mishandle internal GPU_BUDDY_SPLIT nodes and coalesced GPU_BLOCK_MIXED free
> blocks?
> 
> First, when mark_split() transitions a block to GPU_BUDDY_SPLIT, it leaves
> the previous GPU_BUDDY_HEADER_CLEAR bit intact on the internal node:
> 
> drivers/gpu/buddy.c:mark_split() {
> 	block->header &= ~GPU_BUDDY_HEADER_STATE;
> 	block->header |= GPU_BUDDY_SPLIT;
> 	...
> }
> 
> Because gpu_buddy_init() initializes roots as dirty, any root or ancestor
> split while dirty keeps gpu_buddy_block_is_clear(block) == false while any
> descendant remains allocated. Conversely, a clear block that is split and
> later has a descendant freed as dirty keeps gpu_buddy_block_is_clear(block)
> == true on the split ancestor.
> 
> When __gpu_buddy_alloc_range_bias() runs the first pass (fallback = false),
> __alloc_range_bias() evaluates block_incompatible(block, flags) on those
> GPU_BUDDY_SPLIT ancestors and skips the entire subtree without descending
> into its children. If no other root satisfies the request, the first pass
> returns -ENOSPC and __gpu_buddy_alloc_range_bias() falls back to the second
> pass (fallback = true), where block_incompatible() is disabled and the
> clear/has_clear child-ordering preference has been removed, causing the
> search to split the highest-address extent regardless of class.
> 
> Second, __gpu_buddy_free() coalesces adjacent clear and dirty free buddies
> into a single GPU_BUDDY_FREE block with state GPU_BLOCK_MIXED, which has
> gpu_buddy_block_is_clear(block) == false and block->has_clear == true:
> 
> 1. For clear range allocations (flags & GPU_BUDDY_CLEAR_ALLOCATION), Pass 1
>     sees gpu_buddy_block_is_clear(block) == false on a GPU_BLOCK_MIXED block
>     and skips it via block_incompatible() without splitting it to reach the
>     clear sub-blocks inside. Pass 2 then splits the mixed block without clear
>     child-steering and unconditionally visits block->right first, returning a
>     dirty block whenever the clear half is in block->left.
> 
> 2. For dirty range allocations (!(flags & GPU_BUDDY_CLEAR_ALLOCATION)),
>     block_incompatible() returns false on a higher-order GPU_BLOCK_MIXED
>     block because gpu_buddy_block_is_clear(block) is false. Pass 1 then calls
>     split_block(mm, block), which reclassifies block->left and block->right
>     via mark_free(). If the child overlapping [start, end) is clear while the
>     dirty child lies outside [start, end), Pass 1 rejects the clear child via
>     block_incompatible() and skips the other child without calling
>     __gpu_buddy_undo_splits().
> 
> Wouldn't leaving that split GPU_BLOCK_MIXED block unmerged keep both
> children in GPU_BUDDY_FREE state, preventing ancestor coalescing on teardown
> and triggering gpu_buddy_assert(gpu_buddy_block_is_free(mm->roots[i])) while
> leaking the split child gpu_buddy_block structures in gpu_buddy_fini()?

Analysis looks correct to me. We assume if you get as far as doing an 
actual split, then that must mean there is something in there which is 
compatible, either you find it with some number of splits or one of the 
split calls hits an error, which takes care to undo the splits. But now 
with that compat check, this breaks, since we don't know ahead of time 
if it will find something which is also compat. Arun, thoughts?

> 
> [ ... ]
> 

