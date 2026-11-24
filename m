Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=95.215.58.10
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795504882;
	b=oMC22lu+WUvV/EmRuX4jAZEg0qCgvEo8A98nHaoPUqMpGm9LADxqmhcKf64gWs8C4R4o
	 sVgjt6VqkupiqlnFjY/q0BQjlaF+YRbxvAfWwQLKmHzHbYqZ+HQnm/l4zU2CjnULy3AlL
	 kUydGRpGOiWKw6NxfXxtXiBLGzO9BkBcMz71uXU3xOfkwXYUDKWPTdxMLBomNfu2ybQmr
	 9WBzHOOIWZCSZCA6CAsrrATV8i6eHcIjh0LG7+Lvt5pJ/544MSPMkgLdS+WUaS6C4+lH1
	 1j8cU00UNs4Efwdgmo6K7B2ohDnYSi2lmivEM0Q07Tij1GIzSvNp5tcah71L2s8TziQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795504882;
	h=DMARC-Filter:X-Envelope-To:DKIM-Signature:X-Envelope-To:Received:
	 X-Mizu-Trace-ID:X-Migadu-Flow:Date:From:To:Cc:Subject:Message-ID:
	 References:MIME-Version:Content-Type:Content-Disposition:
	 Content-Transfer-Encoding:In-Reply-To;
	bh=fuY33GUF0eUP0SwseynPFkH435CSn9417a8iUr7BK7k=;
	b=krGkRqv9PqIrpfPHngayQaFhUubWkRyirQevIhgrAilewrXRCb1m/vYGyenot5uE/rGU
	 /4FKUS8pQRDt7fjxV4q50Xli37yJAgpiLpJDFsi2Q6huSo9ebXjq/rGmbW7vJfqTQs48L
	 uUtibJ7ToUq0Fb2qfEAgRioWgoGlgrMhBwzlkdo8ivz6gmyslyh9X5l8z8FL1wCF12oEy
	 xZACV4Z5HZP396OJEdrNeMCelp1W6o0/qWK8MdYbAxw5Io58ZiAKk5RLuS0idV98xoA4M
	 gPpkVcAicnEVFh0SPOQ+RDiUhWJRNg3ABHMlEwmE/Kg6RvB1rqZDRDd7o2jorR+kFCg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=linux.dev;
	spf=pass smtp.mailfrom=linux.dev;
	dkim=pass header.d=linux.dev header.i=@linux.dev header.a=rsa-sha256 header.s=key1 header.b=EtRK0xDX;
	arc=none smtp.remote-ip=95.215.58.10
Received: from mta1.migadu.com (out-10.mta1.migadu.com [95.215.58.10])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 758A3606A31E
	for <sashiko-reviews@lists.linux.dev>; Tue, 24 Nov 2026 07:21:20 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 758A3606A31E
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.dev
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.dev
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key, unprotected) header.d=linux.dev header.i=@linux.dev header.a=rsa-sha256 header.s=key1 header.b=EtRK0xDX
X-Envelope-To: sashiko-reviews@lists.linux.dev
DKIM-Signature: a=rsa-sha256; bh=dsrRPagJG7IpTBUtHaN37ZSV+UIhydva5xu3fPf5Il8=;
 c=simple/simple; d=linux.dev;
 h=from:to:subject:date:message-id:mime-version:content-type; s=key1;
 t=1795504878; v=1; x=1796109678;
 b=EtRK0xDX48aYVGns5qZl8sf1U4gRqygL/LQNdOk6NK/48fwI9CtxppbezuodiaNUOk9Jdh2o
 1+9FffH7K8rFvsxYYcCiY5q5PDTn/a/vV7ThX65V3Ye76zWWzqH4EPEcKxGw1vxQav1W7ak4O4H
 6QiNWSga/nNj4sHyQ/epgPcU=
X-Envelope-To: sashiko-reviews@lists.linux.dev
Received: by mta10.migadu.com with ESMTPS id bb0ec5bee1dfc514;
	Tue, 24 Nov 2026 07:21:18 +0000
X-Mizu-Trace-ID: bb0ec5bee1dfc514
X-Migadu-Flow: FLOW_OUT
Date: Tue, 24 Nov 2026 15:21:08 +0800
From: Baoquan He <baoquan.he@linux.dev>
To: sashiko-reviews@lists.linux.dev
Cc: linux-mm@kvack.org, akpm@linux-foundation.org, david@kernel.org,
	kasong@tencent.com, baohua@kernel.org, qi.zheng@linux.dev,
	shakeel.butt@linux.dev, axelrasmussen@google.com,
	yuanchu@google.com, weixugc@google.com,
	baolin.wang@linux.alibaba.com, Baoquan He <hebaoquan@kylinos.cn>
Subject: Re: [PATCH 1/4] mm/mglru: add MM_WALK_EMPTY stats and tracepoint
Message-ID: <awU65FQ4XGGdwMpG@bogon>
References: <20261120085806.781225-1-baoquan.he@linux.dev>
 <20261120085806.781225-2-baoquan.he@linux.dev>
 <sashiko-outbox-226848@kernel.org>
X-Mailing-List: sashiko-reviews@lists.linux.dev
List-Id: <sashiko-reviews.lists.linux.dev>
List-Post: <mailto:sashiko-reviews@lists.linux.dev>
List-Help: <mailto:sashiko-reviews+help@lists.linux.dev>
List-Subscribe: <mailto:sashiko-reviews+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:sashiko-reviews+unsubscribe@lists.linux.dev>
List-Owner: <mailto:sashiko-reviews+owner@lists.linux.dev>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <sashiko-outbox-226848@kernel.org>

On 11/21/26 at 08:59am, sashiko-bot@kernel.org wrote:
> Thank you for your contribution! Sashiko AI review found 1 potential
> issue to consider:
> - [Medium] mm/mglru: inconsistent MM_LEAF_ASSOCIATED accounting across
>   mm_has_notifiers()
> --
> 
...snip...
> > @@ -3682,6 +3685,8 @@ static void walk_pmd_range_locked(pud_t *pud, unsigned long addr, struct vm_area
> >  		if (!folio)
> >  			goto next;
> >  
> > +		walk->mm_stats[MM_LEAF_ASSOCIATED]++;
> > +
> >  		if (!pmdp_test_and_clear_young_notify(vma, addr, pmd + i))
> >  			goto next;
> >  
> 
> [Severity: Medium]
> Does MM_LEAF_ASSOCIATED count all leaf entries belonging to the target
> lruvec (as described in the commit message), or only young leaf entries
> in the target lruvec (as described in the header comments)?

Agreed, and the counter is not worth keeping. MM_LEAF_YOUNG already
counts the leaves we care about: it is incremented after get_pfn_folio()
confirms the folio belongs to this lruvec. So v5 drops MM_LEAF_ASSOCIATED.

> 
> In walk_pte_range() and walk_pmd_range_locked(), get_pte_pfn() and
> get_pmd_pfn() filter out non-young entries before get_pfn_folio() is
> reached whenever !mm_has_notifiers(vma->vm_mm):
> 
> mm/vmscan.c:get_pte_pfn() {
> 	...
> 	if (!pte_young(pte) && !mm_has_notifiers(vma->vm_mm))
> 		return -1;
> 	...
> }
> 
> When !mm_has_notifiers(vma->vm_mm), every entry that reaches
> get_pfn_folio(pfn, memcg, pgdat) is already young, so MM_LEAF_ASSOCIATED
> is identical to MM_LEAF_YOUNG (which also only counts young entries after
> get_pfn_folio() verifies the folio belongs to this lruvec), and an mm
> with old folios in the lruvec is still counted as MM_WALK_EMPTY.
> 
> Conversely, when mm_has_notifiers(vma->vm_mm) is true (such as KVM
> guests), get_pte_pfn() and get_pmd_pfn() let non-young entries through so
> secondary MMU notifiers can be checked by
> test_and_clear_young_ptes_notify() and pmdp_test_and_clear_young_notify().
> Because MM_LEAF_ASSOCIATED is incremented before those notify calls, it
> counts both old and young entries when mm_has_notifiers(vma->vm_mm) is
> true, giving MM_LEAF_ASSOCIATED and MM_WALK_EMPTY different meanings
> depending on whether the mm has MMU notifiers registered.
> 
> -- 
> Sashiko AI review · https://sashiko.dev/#/patchset/20261120085806.781225-1-baoquan.he@linux.dev?part=1
