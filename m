Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793266269;
	b=lOqM3FXto/OxADsOwOQfy9ZHsV9I4W3fSh+OX3L3Qd7HRNa2tOHTq3ZHzD/51TQT3PDf
	 KRCPoEms+MT+oMtbVOH3rP2rxSeiS6/1Dfn86GuBOI7Mpon3fyFfu+9VWICfbl83LXLJ6
	 vYGIRwEXZjRdukN3A4zZ2n5LqFli1q84JsZP7gp/goyAsauPjZ1JfDXe4dLLkoey2dKzR
	 JBgYkAq+W1Jzd6Nc+c6HJmt4ZUycA4s2mbDvtNujs+4RapPKB3cg9wLcLUDm15TnVHTRi
	 r+A5/gsWRviOqG50yYDOwLgiMVGQkdtjlfROdnleh+Cz3DavUYC+deHPif91DXJ322g==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793266269;
	h=Received:DKIM-Signature:Message-ID:Date:MIME-Version:User-Agent:
	 Subject:From:To:Cc:References:Content-Language:Autocrypt:In-Reply-To:
	 Content-Type:Content-Transfer-Encoding;
	bh=A4SbOCG1TxQMUGBeg+bBhriHHCico/HW3q40uHhJX8A=;
	b=l4QDr8KnGh7uvX9u1tehPTpUZr/vVtdZdXPxESuri3InDSyAViOgBUAtDQSu6vn0GAki
	 27BHCJsu0iJaeRf2j8/lbNyjJHlQSmbV49n19+MRW1hmXW6gV7SqelVZX8YtYYy6ET07J
	 pTVeqq+nJQ1fFyraS2p9+LFNiPP/KQdIIN+4/JmTtlFnHAc+JhqJtU6b4WlFyo3kgMY1z
	 kbQW4nLrl698O0PnT3TQ/Ql7c9G33tDjymkp98SVdp+BUv9jgA0jTx8OEGMK2OZM5wUUw
	 CE+rVVUK+popG7NTtscu089RA9F0EA8j3MCeBG1v7ZRg0cJSg6ZgdvpTx/o5ld2kl/Q==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=E8iBbIM1;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9A4E2606A31E
	for <sashiko-reviews@lists.linux.dev>; Thu, 29 Oct 2026 09:31:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=E8iBbIM1
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 478611F01825;
	Thu, 29 Oct 2026 09:31:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1793266269;
	bh=A4SbOCG1TxQMUGBeg+bBhriHHCico/HW3q40uHhJX8A=;
	h=Date:Subject:From:To:Cc:References:In-Reply-To;
	b=E8iBbIM1Q2HKCAnrrv74V3eRHtpXtmL+xNBAkJLicQXr5r6NaVd+bpo6X3fxlE9si
	 CnKYasaxln/WMHaFu1wmptfrb7uO3kdAPd7rEIBdamKYoyX1uA1y3pYwCi57f2kY9B
	 Vdsmw03hgdyi2qvX7Y6uzjkyk/zwxIlcXGDjcy3ueTdVwwmVOGvhucA1tXUCTjPXa1
	 yQ+pnW9AVRS1iNq1z6iDlyA7rkBp/ysCzfaQzX2vPK56Uc7x9truuKAvUFLZPq7EqQ
	 qecJC8Pdq6tP7BBRIMF4VgS8EFarEweSu+PRBhyufCwUsNYJAw//EpfYTp0QKxFqfM
	 QMGrwc3ahbmSQ==
Message-ID: <dd5c55d5-6922-4392-9161-ba4b6f99595a@kernel.org>
Date: Thu, 29 Oct 2026 10:26:49 +0100
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
Subject: Re: [PATCH v3 06/15] mm/shmem: hold off eviction in shmem_writeout()
From: "David Hildenbrand (Arm)" <david@kernel.org>
To: sashiko-reviews@lists.linux.dev, Andrew Morton
 <akpm@linux-foundation.org>, Gregory Price <gourry@gourry.net>,
 Zi Yan <ziy@nvidia.com>, Joshua Hahn <joshua.hahnjy@gmail.com>,
 Rakie Kim <rakie.kim@sk.com>, Ying Huang <ying.huang@linux.alibaba.com>,
 Johannes Weiner <hannes@cmpxchg.org>,
 Vladimir Davydov <vdavydov.dev@gmail.com>, Michal Hocko <mhocko@suse.com>,
 Hugh Dickins <hughd@google.com>, Baolin Wang
 <baolin.wang@linux.alibaba.com>, Lukas Czerner <lczerner@redhat.com>,
 Carlos Maiolino <cmaiolino@redhat.com>,
 Christian Brauner <brauner@kernel.org>, Jan Kara <jack@suse.cz>,
 Daniel Verkamp <dverkamp@chromium.org>, Jeff Xu <jeffxu@google.com>,
 Muchun Song <muchun.song@linux.dev>, Oscar Salvador <osalvador@suse.de>,
 David Stevens <stevensd@chromium.org>,
 "Matthew Wilcox (Oracle)" <willy@infradead.org>,
 William Kucharski <william.kucharski@oracle.com>,
 Chris Li <chrisl@kernel.org>, Kairui Song <kasong@tencent.com>,
 Nhat Pham <nphamcs@gmail.com>, Miaohe Lin <linmiaohe@huawei.com>,
 Naoya Horiguchi <nao.horiguchi@gmail.com>
Cc: linux-mm@kvack.org, Josef Bacik <josef@toxicpanda.com>,
 Pedro Falcato <pfalcato@suse.de>, "Kiryl Shutsemau (Meta)" <kas@kernel.org>
References: <20261028-fixes_shmem-v3-0-4ce3baf2db4b@kernel.org>
 <20261028-fixes_shmem-v3-6-4ce3baf2db4b@kernel.org>
 <sashiko-outbox-188427@kernel.org>
 <bff8fa50-6b73-4bb1-b944-2d90dd4e41d3@kernel.org>
Content-Language: en-US
Autocrypt: addr=david@kernel.org; keydata=
 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
 qIws/H2t
In-Reply-To: <bff8fa50-6b73-4bb1-b944-2d90dd4e41d3@kernel.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 10/28/26 21:51, David Hildenbrand (Arm) wrote:
> On 10/28/26 21:35, sashiko-bot@kernel.org wrote:
>> Thank you for your contribution! Sashiko AI review found 1 potential issue(s) to consider:
>> - [High] mm/shmem: use-after-free in shmem_evict_inode() on concurrent swapoff
>> --
>>
>> commit bfe337ff80d886d314a9991abae8133932277cd0
>> Author: Josef Bacik <josef@toxicpanda.com>
>>
>> mm/shmem: hold off eviction in shmem_writeout()
>>
>> This commit prevents inode eviction during shmem_writeout() by incrementing
>> info->stop_eviction before removing the folio from the page cache and
>> decrementing it after swap_writeout() and any potential page cache
>> reinsertion complete. It also updates shmem_evict_inode() to always wait at
>> least once for info->stop_eviction to reach zero even if the inode was
>> already removed from the swaplist.
>>
>>> diff --git a/mm/shmem.c b/mm/shmem.c
>>> index e3e4bbbe1d802..eddd5870be072 100644
>>> --- a/mm/shmem.c
>>> +++ b/mm/shmem.c
>>> @@ -1616,6 +1616,17 @@ static int shmem_setattr(const struct mnt_idmap *idmap,
>>>  	return error;
>>>  }
>>>  
>>> +static void shmem_disallow_eviction(struct shmem_inode_info *info)
>>> +{
>>> +	atomic_inc(&info->stop_eviction);
>>> +}
>>> +
>>> +static void shmem_allow_eviction(struct shmem_inode_info *info)
>>> +{
>>> +	if (atomic_dec_and_test(&info->stop_eviction))
>>> +		wake_up_var(&info->stop_eviction);
>>> +}
>>> +
>>>  static void shmem_evict_inode(struct inode *inode)
>>>  {
>>>  	struct shmem_inode_info *info = SHMEM_I(inode);
>>> @@ -1628,16 +1639,21 @@ static void shmem_evict_inode(struct inode *inode)
>>>  		mapping_set_exiting(inode->i_mapping);
>>>  		shmem_truncate_range(inode, 0, (loff_t)-1);
>>>  		shmem_unused_huge_del(inode);
>>> -		while (!list_empty(&info->swaplist)) {
>>> -			/* Wait while shmem_unuse() is scanning this inode... */
>>> +		/*
>>> +		 * Writeout may still use the inode after swapoff has removed it
>>> +		 * from the swaplist, so always wait at least once.
>>> +		 */
>>> +		do {
>>>  			wait_var_event(&info->stop_eviction,
>>>  				       !atomic_read(&info->stop_eviction));
>>> +			if (list_empty(&info->swaplist))
>>> +				break;
>>>  			spin_lock(&shmem_swaplist_lock);
>>>  			/* ...but beware of the race if we peeked too early */
>>>  			if (!atomic_read(&info->stop_eviction))
>>>  				list_del_init(&info->swaplist);
>>>  			spin_unlock(&shmem_swaplist_lock);
>>> -		}
>>> +		} while (!list_empty(&info->swaplist));
>>
>> [Severity: High]
>> Can this loop exit in shmem_evict_inode() while a concurrent shmem_unuse()
>> still holds info->stop_eviction > 0, leading to a use-after-free of info and
>> its embedded vfs_inode?
>>
>> Specifically, two swapoff() syscalls on different swap types (typeA and
>> typeB) can run try_to_unuse() -> shmem_unuse() concurrently while
>> shmem_evict_inode() is evicting an inode:
>>
>> 1. In shmem_evict_inode(), shmem_truncate_range() -> shmem_undo_range() ->
>>    shmem_recalc_inode() frees the swap entries and sets info->swapped = 0
>>    under info->lock (without shmem_swaplist_lock).
>>
>> 2. Just before info->swapped becomes 0, shmem_unuse(typeA) on another CPU
>>    holds shmem_swaplist_lock, sees info->swapped != 0, and is about to call
>>    shmem_disallow_eviction(info):
>>
>>    mm/shmem.c:shmem_unuse() {
>>        ...
>>        list_for_each_entry_safe(info, next, &shmem_swaplist, swaplist) {
>>            if (!info->swapped) {
>>                list_del_init(&info->swaplist);
>>                continue;
>>            }
>>            shmem_disallow_eviction(info);
>>            spin_unlock(&shmem_swaplist_lock);
>>
>>            error = shmem_unuse_inode(&info->vfs_inode, type);
>>        ...
>>    }
>>
>> 3. Before shmem_unuse(typeA) increments info->stop_eviction,
>>    shmem_evict_inode() enters the do-while loop and evaluates
>>    wait_var_event(&info->stop_eviction, !atomic_read(&info->stop_eviction)),
>>    which returns immediately because info->stop_eviction is still 0 (the
>>    "peeked too early" race noted in the comment).
>>
>> 4. shmem_unuse(typeA) then calls shmem_disallow_eviction(info) (setting
>>    info->stop_eviction to 1), drops shmem_swaplist_lock, and begins scanning
>>    &info->vfs_inode in shmem_unuse_inode().
>>
>> 5. A second concurrent swapoff running shmem_unuse(typeB) acquires
>>    shmem_swaplist_lock, sees !info->swapped is now true, and removes the
>>    inode from the list via list_del_init(&info->swaplist) without checking
>>    info->stop_eviction.
>>
>> 6. Back in shmem_evict_inode(), list_empty(&info->swaplist) is now true while
>>    info->stop_eviction is 1. Either the new unlocked
>>    if (list_empty(&info->swaplist)) break; exits the loop immediately, or
>>    shmem_evict_inode() takes shmem_swaplist_lock, skips list_del_init()
>>    because atomic_read(&info->stop_eviction) is non-zero, and then exits the
>>    loop because the while (!list_empty(&info->swaplist)) condition is false.
>>
>> Could shmem_evict_inode() then return and allow the inode to be freed while
>> shmem_unuse(typeA) is still accessing &info->vfs_inode in shmem_unuse_inode()
>> and later calling shmem_allow_eviction(info)?
>>
> 
> Two concurrent swapoffs, what at time to be alive.

Okay, I just realize that this is a preexisting issue. So I will keep this patch
as is.

We'll fix this separately later.

-- 
Cheers,

David
