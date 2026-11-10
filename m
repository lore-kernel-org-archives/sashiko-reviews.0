Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794315615;
	b=JUi9lqt11dLLU1R7Hjt6ePqY7M01M8mrkFQLoAVTLMAAG7aSabi69XOfd/YyDsTqIeQ2
	 NtTykR+G7WU3MA062u9aSzCjicQqhxb4Dz6XJqwBR/DszO5k7yvUAfaKw9vm/H8VqJLat
	 GfRfkdU6vCrHBjLvYREObXmdLJsxSDn9ZD7FETlPEVWrsCnJ5fnZ7vHOoDzVacesnYJpK
	 8LpmD5fHd3Yqxr5I5Mn0yYXCnS449oy/n3fKxOf2LzYTRzAZFhmXIZBmg+o66HbAJlIRL
	 tZJBtWfq60rFXjUr4dFNjuJer4glynO9BKW1D6CWG7G4DPngMOsmTxlMZPQAf4rCQZw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794315615;
	h=Received:DKIM-Signature:Message-ID:Date:MIME-Version:User-Agent:
	 Subject:To:Cc:References:From:Content-Language:Autocrypt:In-Reply-To:
	 Content-Type:Content-Transfer-Encoding;
	bh=ikrAtB1/8BC2L8FEqSsF9Mnw9ArFG46n+a0Hts48VzQ=;
	b=2891UPP7YGO4XiiNdNUR9rOaUEJCJiBC2WtP5j5rMxr2vC5boFFunnMKozfVc7e9NUVV
	 vQ3MY7UGSQzj+2apSlYVipR7Xy+P5FDuK4ASq/ai/iCnpbdgp57G8HoQ0kBiP35kbXOr4
	 ihNdO4sDWw7ItO59fiP/8ivQMzi0lKn64qgURS54/s3yo/HbgCuVfRfsSY+nUHG//dV1/
	 9FTstyfMNS+WA8ZI/dIFrUkKLU6TsUNdS0PVF3Xh6+ESvhQ2RQuv1QaDwGinux346qvNr
	 yO6So3mhqEM+BDrzmnN9WhQ8/XlPqK1h8mJJE/2AxzsAtnHT8cPukZcQ1yoBoweB84g==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=ZQRh1AAf;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C1F3A606A335
	for <sashiko-reviews@lists.linux.dev>; Tue, 10 Nov 2026 13:00:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=ZQRh1AAf
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 4580B1F0089F;
	Tue, 10 Nov 2026 13:00:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1794315614;
	bh=ikrAtB1/8BC2L8FEqSsF9Mnw9ArFG46n+a0Hts48VzQ=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To;
	b=ZQRh1AAf2mH4+nBlxyXJRlURkhAjeZzhqgklXvdm14VqM9E0SeMytPl/xoIM13LkW
	 fCsS1d/F789U9mDULd1DvmSQPiB2RDSbMw6lcY2Tu/0YEev2KVy12ZtCj+kzHQGwzj
	 Och7eItQFHJ33XEiOjPHYIf6QhmGeXz3wJjKQOEapcAvpF6LxpvxIPeGV0lE3zDW+S
	 yEJ/7PYsbG7rKl64/ywdKQtrh0Uak4KFG/+ixohDdaqjYvdVw+p5P6lyJYsxoBXd6G
	 rqMGtp8knYd8pEulfrGD3pFZGJzI7VvdyRgmGpGet+5pimvjVNCPF+n4bipns6rC09
	 asM4fY5N8BiUA==
Message-ID: <5500d8d0-53ac-4f82-9d1f-f59140b69d0a@kernel.org>
Date: Tue, 10 Nov 2026 14:00:08 +0100
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
Subject: Re: [PATCH v3 2/6] mm: gup: clarify a reason to check pte/pmd in
 gup_fast_pte_range()
To: sashiko-reviews@lists.linux.dev, Yeoreum Yun <yeoreum.yun@arm.com>,
 linux-mm@kvack.org
Cc: Jason Gunthorpe <jgg@ziepe.ca>, John Hubbard <jhubbard@nvidia.com>,
 Peter Xu <peterx@redhat.com>, Lorenzo Stoakes <ljs@kernel.org>,
 "Liam R. Howlett" <liam@infradead.org>, Vlastimil Babka <vbabka@kernel.org>,
 Mike Rapoport <rppt@kernel.org>, Suren Baghdasaryan <surenb@google.com>,
 Michal Hocko <mhocko@suse.com>, Andrew Morton <akpm@linux-foundation.org>,
 Rik van Riel <riel@surriel.com>, Yuan-Hao Hsu <aa9736195201@gmail.com>
References: <20261109-refactor_gup_fast-v3-0-2aaef02df0e1@arm.com>
 <20261109-refactor_gup_fast-v3-2-2aaef02df0e1@arm.com>
 <sashiko-outbox-207030@kernel.org>
From: "David Hildenbrand (Arm)" <david@kernel.org>
Content-Language: en-US
Autocrypt: addr=david@kernel.org; keydata=
 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
 qIws/H2t
In-Reply-To: <sashiko-outbox-207030@kernel.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 11/10/26 13:33, sashiko-bot@kernel.org wrote:
> Thank you for your contribution! Sashiko AI review found 1 potential
> issue to consider:
> - [Low] mm: gup: duplicate comment with typos in gup_fast_pte_range()
> --
> 
> commit a105945d4180d981c8509ad500ce443d7fbb662c
> Author: Yeoreum Yun <yeoreum.yun@arm.com>
> 
> mm: gup: clarify a reason to check pte/pmd in gup_fast_pte_range()
> 
> This commit adds an inline comment in gup_fast_pte_range() explaining why
> the PMD and PTE are rechecked after grabbing the folio.
> 
>> diff --git a/mm/gup.c b/mm/gup.c
>> index 7d43ce717b246..7f9348c633d58 100644
>> --- a/mm/gup.c
>> +++ b/mm/gup.c
>> @@ -2881,6 +2881,14 @@ static unsigned long gup_fast_pte_range(pmd_t pmd, pmd_t *pmdp,
>>  		if (!folio)
>>  			goto pte_unmap;
>>  
>> +		/*
>> +		 * Recheck the PTE after grabbing the folio to detect concurrent
>> +		 * unmapping or protection changes such as by KSM.
>> +		 *
>> +		 * Also, recheck the PMD: THP collpase can detach the PTE table
>> +		 * while its entries remain unchaged. Checking the PTE alone
>> +		 * would not dtect that we are walking a detached page table.
>> +		 */
>>  		if (unlikely(pmd_val(pmd) != pmd_val(pmdp_get_lockless(pmdp))) ||
>>  		    unlikely(pte_val(pte) != pte_val(ptep_get_lockless(ptep)))) {
>>  			gup_put_folio(folio, 1, flags);
> 
> [Severity: Low]
> This isn't a bug, but does this comment duplicate the existing block
> comment directly above gup_fast_pte_range()?
> 
> mm/gup.c:gup_fast_pte_range() {
> /*
>  * GUP-fast relies on pte change detection to avoid concurrent pgtable
>  * operations.
>  *
>  * To pin the page, GUP-fast needs to do below in order:
>  * (1) pin the page (by prefetching pte), then (2) check pte not changed.
>  ...
>  * For THP collapse, it's a bit more complicated because GUP-fast may be
>  * walking a pgtable page that is being freed (pte is still valid but pmd
>  * can be cleared already).  To avoid race in such condition, we need to
>  * also check pmd here to make sure pmd doesn't change (corresponds to
>  * pmdp_collapse_flush() in the THP collapse code path).
>  */
> }

Nothing wrong about spelling it out once more at the relevant place IMHO.

-- 
Cheers,

David
