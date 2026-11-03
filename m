Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=91.218.175.87
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793697112;
	b=PFADgKwFtDOyp+p4d8f+W2vMCd5hatUt95MNdarM98GEbAWlED5Ivpq/dmwH1B3Wlkdb
	 5vXS8PUXoOpxEgnNsNoc1g8NbHZiIoneNt/rBI7jD3FEejNMxne+fBlo1Ym1VauXn9J1U
	 UoU6NOpYjrX8mOsQaM31Bi9KwwKrCXl8FDwc0gsUbkfYLwPpzBMoHifXHOdi0ZiYKl4La
	 AMNsqYZI+ncJ2weq4GIe0AxlJDw5qS0CrC7OtmXbUNXdx4oYLYxk7pS2q4zFIlCpTRMJH
	 TbWjPLFy30ig6ww66zmdWS689C1oSWgo5XLq+Ceo1XGFQYjAkv7eqlyopqr/zor11iA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793697112;
	h=DMARC-Filter:X-Envelope-To:DKIM-Signature:X-Envelope-To:Received:
	 X-Mizu-Trace-ID:X-Migadu-Flow:Message-ID:Date:MIME-Version:User-Agent:
	 Subject:To:Cc:References:From:In-Reply-To:Content-Type:
	 Content-Transfer-Encoding;
	bh=L/rwbEY90TsE31orsIbmoYEBsIiiZzgORGDGsve2QT0=;
	b=pMbDuB9Xsnz8pVe8ZJIpzPMJjyF/eKrh3A5gscmHBV0clhtpst5VuQ7H/j4cMZjSvxk6
	 IVq4P9+DhPWNUz2hxHzglT2hBp/VPQNouTv22nZFa8Oj4PM3clDODNBPEhQICVmPhwzQY
	 AU324KaAm3Hz8UwLJLIsC/GUN5QfaojBJMhmn1I9K6T9swkKO3m5fem7XQsYZajql0mzj
	 NDwjM1HSM6n1tKdBQW/uKBZqzKN7gpTvfaZ9lcAmhUm1bNru+LXaHMJijKkQJ7tdFl4qa
	 rFLp4sO5UCNC50e+gvas+Ev+xyupOWN/X86amDyDkQUiPfAL2eLtTYKRH8VloK2CSzw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=linux.dev;
	spf=pass smtp.mailfrom=linux.dev;
	dkim=pass header.d=linux.dev header.i=@linux.dev header.a=rsa-sha256 header.s=key1 header.b=hWhGAMYn;
	arc=none smtp.remote-ip=91.218.175.87
Received: from mta0.migadu.com (out-87.mta0.migadu.com [91.218.175.87])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 624AB606A326
	for <sashiko-reviews@lists.linux.dev>; Tue,  3 Nov 2026 09:11:49 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 624AB606A326
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.dev
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.dev
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key, unprotected) header.d=linux.dev header.i=@linux.dev header.a=rsa-sha256 header.s=key1 header.b=hWhGAMYn
X-Envelope-To: sashiko-reviews@lists.linux.dev
DKIM-Signature: a=rsa-sha256; bh=4izyozmbuMGIzwBXwOGfCjpLSN/9aWgvEh8DalxY9c8=;
 c=simple/simple; d=linux.dev;
 h=from:to:subject:date:message-id:mime-version:content-type; s=key1;
 t=1793697108; v=1; x=1794301908;
 b=hWhGAMYnBWhe3NfVoxNafdUdTJ1qC/oGhHK7lSWu2kfOXs8GDMfIUqyVR+Zar7r+naniL2DB
 Y3XdksAVun3fVK6BXo5jmmq7slXW+o+6OuNAlthBKQlgPdr1v4kmMszOtXoaLlp1xSfQS0O/XAI
 Ph57qygITpzKfnDJXgJwcRrw=
X-Envelope-To: sashiko-reviews@lists.linux.dev
Received: by smtp.migadu.com with ESMTPS id 736b6edb0d423b19;
	Tue, 03 Nov 2026 09:11:48 +0000
X-Mizu-Trace-ID: 736b6edb0d423b19
X-Migadu-Flow: FLOW_OUT
Message-ID: <d9ebae9f-7a3e-412f-bb1c-f753b83ede59@linux.dev>
Date: Tue, 3 Nov 2026 17:11:39 +0800
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
Subject: Re: [PATCH 3/4] mm: hugetlb: skip CMA when direct reclaim is
 disallowed
To: sashiko-reviews@lists.linux.dev, muchun.song@linux.dev,
 osalvador@suse.de, david@kernel.org, akpm@linux-foundation.org,
 azpijr@gmail.com
Cc: linux-mm@kvack.org, Qi Zheng <zhengqi.arch@bytedance.com>
References: <cover.1793692578.git.zhengqi.arch@bytedance.com>
 <325d33655f29a2799a0859c788c48625feeb85f1.1793692578.git.zhengqi.arch@bytedance.com>
 <sashiko-outbox-194875@kernel.org>
From: Qi Zheng <qi.zheng@linux.dev>
In-Reply-To: <sashiko-outbox-194875@kernel.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit



On 11/3/26 4:47 PM, sashiko-bot@kernel.org wrote:
> Thank you for your contribution! Sashiko AI review found 1 potential issue(s) to consider:
> - [Medium] mm: hugetlb: hugetlb_cma_alloc_frozen_folio() breaks MPOL_PREFERRED_MANY
> --
> 
> commit c96d52d66d643a77abaa96a17e392b7ab0f36ccd
> Author: Qi Zheng <qi.zheng@linux.dev>
> 
> mm: hugetlb: skip CMA when direct reclaim is disallowed
> 
> This commit updates hugetlb_cma_alloc_frozen_folio() to return NULL when
> gfpflags_allow_blocking(gfp_mask) is false, avoiding direct reclaim inside
> cma_alloc_frozen_compound() when __GFP_DIRECT_RECLAIM was cleared by the
> caller.
> 
>> diff --git a/mm/hugetlb_cma.c b/mm/hugetlb_cma.c
>> index dde1c866406fb..90f8d718a1f16 100644
>> --- a/mm/hugetlb_cma.c
>> +++ b/mm/hugetlb_cma.c
>> @@ -59,7 +59,7 @@ struct folio *hugetlb_cma_alloc_frozen_folio(int order, gfp_t gfp_mask,
>>   	const nodemask_t *nmask;
>>   	unsigned int cpuset_mems_cookie;
>>   
>> -	if (!hugetlb_cma_size)
>> +	if (!hugetlb_cma_size || !gfpflags_allow_blocking(gfp_mask))
>>   		return NULL;
> 
> [Severity: Medium]
> Does returning NULL from hugetlb_cma_alloc_frozen_folio() whenever
> !gfpflags_allow_blocking(gfp_mask) break MPOL_PREFERRED_MANY for gigantic
> surplus HugeTLB allocations?
> 
> In mm/hugetlb.c, alloc_buddy_hugetlb_folio() implements MPOL_PREFERRED_MANY
> as a two-pass allocation:
> 
> mm/hugetlb.c:alloc_buddy_hugetlb_folio() {
> 	if (mpoli->mode == MPOL_PREFERRED_MANY) {
> 		gfp_t gfp = gfp_mask & ~(__GFP_DIRECT_RECLAIM | __GFP_NOFAIL);
> 
> 		folio = alloc_surplus_hugetlb_folio(h, gfp, mpoli->nid,
> 						    nodemask);
> 
> 		/* Fallback to all nodes if page==NULL */
> 		nodemask = NULL;
> 	}
> 
> 	if (!folio) {
> 		folio = alloc_surplus_hugetlb_folio(h, gfp_mask, mpoli->nid,
> 						    nodemask);
> 	}
> }
> 
> This reaches hugetlb_cma_alloc_frozen_folio() via:
> 
>    alloc_buddy_hugetlb_folio()
>      -> alloc_surplus_hugetlb_folio()
>        -> alloc_fresh_hugetlb_folio()
>          -> only_alloc_fresh_hugetlb_folio()
>            -> alloc_gigantic_frozen_folio()
>              -> hugetlb_cma_alloc_frozen_folio()
> 
> On the first pass, __GFP_DIRECT_RECLAIM is cleared while nodemask points to
> the preferred nodes (pol->nodes), and on the second pass nodemask is cleared
> to NULL. Because hugetlb_cma_alloc_frozen_folio() now returns NULL on the
> first pass, it never sees the MPOL_PREFERRED_MANY nodemask.
> 
> In mm/hugetlb.c:alloc_gigantic_frozen_folio():
> 
> 	folio = hugetlb_cma_alloc_frozen_folio(order, gfp_mask, nid, nodemask);
> 	if (folio)
> 		return folio;
> 
> 	if (hugetlb_cma_exclusive_alloc())
> 		return NULL;
> 
> 	folio = (struct folio *)alloc_contig_frozen_pages(1 << order, gfp_mask,
> 							  nid, nodemask);
> 
> When hugetlb_cma_exclusive_alloc() is false, returning NULL from
> hugetlb_cma_alloc_frozen_folio() on the first pass falls through to
> alloc_contig_frozen_pages() on the preferred nodes, bypassing the dedicated
> hugetlb_cma pool on the preferred nodes in favor of non-CMA memory.
> 
> When hugetlb_cma_exclusive_alloc() is true (or when non-CMA allocation fails
> on the preferred nodes), the first pass returns NULL and the second pass
> invokes hugetlb_cma_alloc_frozen_folio() with nodemask set to NULL. Since
> mm/mempolicy.c:policy_nodemask() leaves *nid as numa_node_id() when
> pol->home_node is NUMA_NO_NODE:
> 
> mm/mempolicy.c:policy_nodemask() {
> 	case MPOL_PREFERRED_MANY:
> 		nodemask = &pol->nodes;
> 		if (pol->home_node != NUMA_NO_NODE)
> 			*nid = pol->home_node;
> 		break;
> }
> 
> hugetlb_cma_alloc_frozen_folio() on the second pass tries
> hugetlb_cma[numa_node_id()] and then iterates cpuset_current_mems_allowed
> from node 0, allocating from non-preferred CMA nodes even when preferred
> nodes in pol->nodes have free CMA pages.
> 
> Prior to commit 9bda131c6093 ("mm: cma: add cma_alloc_frozen{_compound}()"),
> cma_alloc_folio() forwarded gfp_mask down to alloc_contig_frozen_range(),
> where __alloc_contig_verify_gfp_mask() preserved the cleared
> __GFP_DIRECT_RECLAIM bit so CMA on the preferred nodemask was tried on the
> first pass without entering direct reclaim. Would forwarding gfp_mask to

Thanks for catching this. You're right: in CMA-only mode, this check
skips the preferred-node attempt entirely. The fallback can then
allocate from a non-preferred node even when the preferred nodes have
usable CMA memory.

> cma_alloc_frozen_compound() (in mm/cma.c) preserve both the non-reclaiming
> first pass and the MPOL_PREFERRED_MANY nodemask?

Make sense.

I'll replace the check with GFP-mask propagation through
cma_alloc_frozen_compound(). This restores the preferred-node CMA
attempt while preserving the caller's __GFP_DIRECT_RECLAIM setting.

Like the following:

diff --git a/include/linux/cma.h b/include/linux/cma.h
index 8555d38a97b1..caedd59bde03 100644
--- a/include/linux/cma.h
+++ b/include/linux/cma.h
@@ -53,7 +53,8 @@ extern bool cma_release(struct cma *cma, const struct 
page *pages, unsigned long

  struct page *cma_alloc_frozen(struct cma *cma, unsigned long count,
  		unsigned int align, bool no_warn);
-struct page *cma_alloc_frozen_compound(struct cma *cma, unsigned int 
order);
+struct page *cma_alloc_frozen_compound(struct cma *cma, unsigned int order,
+				       gfp_t gfp);
  bool cma_release_frozen(struct cma *cma, const struct page *pages,
  		unsigned long count);

diff --git a/mm/cma.c b/mm/cma.c
index a10ea37a261d..c2605967d77a 100644
--- a/mm/cma.c
+++ b/mm/cma.c
@@ -929,9 +929,10 @@ struct page *cma_alloc_frozen(struct cma *cma, 
unsigned long count,
  	return __cma_alloc_frozen(cma, count, align, gfp);
  }

-struct page *cma_alloc_frozen_compound(struct cma *cma, unsigned int order)
+struct page *cma_alloc_frozen_compound(struct cma *cma, unsigned int order,
+				       gfp_t gfp)
  {
-	gfp_t gfp = GFP_KERNEL | __GFP_COMP | __GFP_NOWARN;
+	gfp |= __GFP_COMP | __GFP_NOWARN;

  	return __cma_alloc_frozen(cma, 1 << order, order, gfp);
  }
diff --git a/mm/hugetlb_cma.c b/mm/hugetlb_cma.c
index 90f8d718a1f1..250b5c10d954 100644
--- a/mm/hugetlb_cma.c
+++ b/mm/hugetlb_cma.c
@@ -59,7 +59,7 @@ struct folio *hugetlb_cma_alloc_frozen_folio(int 
order, gfp_t gfp_mask,
  	const nodemask_t *nmask;
  	unsigned int cpuset_mems_cookie;

-	if (!hugetlb_cma_size || !gfpflags_allow_blocking(gfp_mask))
+	if (!hugetlb_cma_size)
  		return NULL;

  	if (current->flags & PF_MEMALLOC_PIN)
@@ -74,14 +74,16 @@ struct folio *hugetlb_cma_alloc_frozen_folio(int 
order, gfp_t gfp_mask,
  	}

  	if (hugetlb_cma[nid] && node_isset(nid, *nmask))
-		page = cma_alloc_frozen_compound(hugetlb_cma[nid], order);
+		page = cma_alloc_frozen_compound(hugetlb_cma[nid], order,
+						 gfp_mask);

  	if (!page && !(gfp_mask & __GFP_THISNODE)) {
  		for_each_node_mask(node, *nmask) {
  			if (node == nid || !hugetlb_cma[node])
  				continue;

-			page = cma_alloc_frozen_compound(hugetlb_cma[node], order);
+			page = cma_alloc_frozen_compound(hugetlb_cma[node], order,
+							 gfp_mask);
  			if (page)
  				break;
  		}

Thanks,
Qi

> 

