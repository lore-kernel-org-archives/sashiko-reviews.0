Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794563197;
	b=b8qv7gD2Zs4rbEr8CzZS5P4g8eu2hqr+73ey8Y+BuETxtnL/N65L1rZEsBybjc385NJd
	 t71URX+TvMEqeQL5PIWB2JKDgMPjO58oEf1m4m9LcWemazFHfBfryjq1HCW/SBKW0O+1f
	 x1Ai+KP/P1kXZ1Uv64n806Kqa3g3HBJNJhWooxqzi8964eZBzRbu4vpcV1QZEMMQ2jit0
	 gMU+Z5Mggb8Xe/gSBt40M/LwG5m38XhOf3gdHsTnyPsizhyNM+6Fu1Ev158Q0DjWCkd5Z
	 UBUKNVtggeNODAFORLrUXVed9SsZEuSQNz790PSlTxOXB3pEF2ECZ8YeCwqI+svUqUA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794563197;
	h=Received:DKIM-Signature:Message-ID:Date:MIME-Version:User-Agent:
	 Subject:To:Cc:References:From:Content-Language:Autocrypt:In-Reply-To:
	 Content-Type:Content-Transfer-Encoding;
	bh=CNSsFWdcrTQ/0r3gvA1QB3No3JzCN9wfrK4VNlh9/Os=;
	b=HyzXzVysxO1XdxAOK+w7aOQIkexzzSP2hUAKK69WCTd5a6CwZ6cvMW7dsIAY1XRQl880
	 Sanddnno8lPZv+ZcK1qa40kWR5yqszOo38bHFhCrEZcfBlWdQFNudXYW+hieKs2uqF8cF
	 MRX6F4K8HGShF4baP3rI7cuHtdOF022E7i4KfwHEkg9VyvKcSGVRZOpCO8/RY0NfTWdG2
	 E2brWSlYqWRz21ElFtr2QKkBef4rKG7d6s++EyBoxdG16wxuADq+l7G2EWja2v6k0zUFb
	 xFZbLKXe5IKOyaPgCKNFdqKtJexTHsktPUDFTbNcJvdWQRJrrnIoP5HFZs0GODSN5EA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=bXdmJW2A;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F147A606A31C
	for <sashiko-reviews@lists.linux.dev>; Fri, 13 Nov 2026 09:46:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=bXdmJW2A
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 27C461F000C4;
	Fri, 13 Nov 2026 09:46:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1794563196;
	bh=CNSsFWdcrTQ/0r3gvA1QB3No3JzCN9wfrK4VNlh9/Os=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To;
	b=bXdmJW2AhK4ybiIjNURjUv7rtnCcp318POTFLSM+2nmLsh3ZR7Mrz+ouif5/rTCMS
	 L9LpRv3mlSoLRPUpRLYZIiPKGWCCt0OZqxrkIFduxcdtNP0kWhbVAXiYdN6umEF4iX
	 K5GxkicOD8JvJ1MStN4h4m34uBdPum5mrm4vJkel5G/R/HmQLOWIw9tp0grbS1mJKL
	 bnf82+fKZ3ZwfT2FbkEbUUVWQDzEGA61EQ090/qBuh9utVw0e9lBzZMUoR9TzMf7Nz
	 NCFvZM08LHvak4XH+9LnM9EY0w5YUSXTue9qeoa5PljrB6pEMwJwtc4TGQ8VDBF/3b
	 G16djJG/vO66w==
Message-ID: <a78bd75b-dc4c-4007-b855-f1e58d2a435e@kernel.org>
Date: Fri, 13 Nov 2026 10:46:31 +0100
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
Subject: Re: [PATCH] mm/shmem: drop the second folio batch from
 shmem_undo_range()
To: sashiko-reviews@lists.linux.dev, Qiliang Yuan <qiliang.yuan@linux.dev>,
 Hugh Dickins <hughd@google.com>, Baolin Wang
 <baolin.wang@linux.alibaba.com>, Andrew Morton <akpm@linux-foundation.org>,
 Jan Kara <jack@suse.cz>, Qiliang Yuan <odys.yuan@gmail.com>,
 Roman Gushchin <roman.gushchin@linux.dev>,
 "Lorenzo Stoakes (Arm)" <ljs@kernel.org>
Cc: linux-mm@kvack.org, kernel test robot <lkp@intel.com>
References: <20261111-bug-mm-shmem-undo-frame-v1-1-e50a95b8f9b2@linux.dev>
 <sashiko-outbox-212134@kernel.org>
From: "David Hildenbrand (Arm)" <david@kernel.org>
Content-Language: en-US
Autocrypt: addr=david@kernel.org; keydata=
 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
 qIws/H2t
In-Reply-To: <sashiko-outbox-212134@kernel.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 11/13/26 04:39, sashiko-bot@kernel.org wrote:
> Thank you for your contribution! Sashiko AI review found no new issues
> in this patch, but noticed 1 related pre-existing issue it does not
> introduce:
> - [Critical] mm/shmem: skipped boundary zeroing on swapin failure in
>   shmem_undo_range() [1]
> --
> 
> commit 785bd3384006f8bb06c3c8f9b1b5d455eba3d449
> Author: Qiliang Yuan <qiliang.yuan@linux.dev>
> 
> mm/shmem: drop the second folio batch from shmem_undo_range()
> 
> This commit removes the second folio_batch from shmem_undo_range() by
> passing fbatch directly to delete_from_page_cache_batch() after removing
> swap entries, and using truncate_inode_folio() when undoing a failed
> fallocate().
> 
>> diff --git a/mm/shmem.c b/mm/shmem.c
>> index 156469423a866..5bcbdd6078a73 100644
>> --- a/mm/shmem.c
>> +++ b/mm/shmem.c
>> @@ -1352,9 +1352,6 @@ static void shmem_undo_range(struct inode *inode, loff_t lstart, uoff_t lend,
>>  	index = start;
>>  	while (index < end && find_lock_entries(mapping, &index, end - 1,
>>  			&fbatch, indices)) {
>> -		struct folio_batch remove;
>> -
>> -		folio_batch_init(&remove);
>>  		for (i = 0; i < folio_batch_count(&fbatch); i++) {
>>  			folio = fbatch.folios[i];
>>  
>> @@ -1366,13 +1363,14 @@ static void shmem_undo_range(struct inode *inode, loff_t lstart, uoff_t lend,
>>  				continue;
>>  			}
>>  
>> -			if (!unfalloc || !folio_test_uptodate(folio)) {
>> +			if (!unfalloc)
>>  				truncate_cleanup_folio(folio);
>> -				folio_batch_add(&remove, folio);
>> -			}
>> +			else if (!folio_test_uptodate(folio))
>> +				truncate_inode_folio(mapping, folio);
>>  		}
>> -		delete_from_page_cache_batch(mapping, &remove);
>>  		folio_batch_remove_exceptionals(&fbatch);
>> +		if (!unfalloc)
>> +			delete_from_page_cache_batch(mapping, &fbatch);
>>  		for (i = 0; i < folio_batch_count(&fbatch); i++)
>>  			folio_unlock(fbatch.folios[i]);
>>  		folio_batch_release(&fbatch);
> 
> [Severity: Critical]
> This problem wasn't introduced by this patch, but can shmem_undo_range()
> leave partial boundary ranges unzeroed when swapping in a boundary folio
> fails [1]?

Roman, why is Sashiko back with these preexisting things that keep distracting
people in unreasonable ways?

Turn that feature off for MM please. Let all preexisting stuff go to the
maintainer-accessible, where we will work through them in a controlled way.

The least we need right now is getting bombarded with more of these things.

-- 
Cheers,

David
