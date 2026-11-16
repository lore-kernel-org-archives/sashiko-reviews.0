Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=91.218.175.150
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794815749;
	b=Kx5Z+bCYIWzytOMIcj5Izk3J5vQcEBnLAGJxDJyfrYPdzznI2wae/9PbVnzov5hIIhQu
	 nDfeH9Zcr2tDeOr3V9u1grEXYU2pysLek7o8cJ6tu/WqKMp+z/4aXiMYLhWeEGQa9+fSA
	 /JH7LY4I+yAxME8Zm731+kEp7wsEWlkSyWMSIOnNKeIxEll1jpgvlfVAdNjIOeuZIXq+S
	 sRmwDu6U+cbaTejprPjgkKJMeZWgXqvVQ344HgIohWVWXJuawybmqMKFQZWazwBQYDdTz
	 /WgzJ1vfjKGlhBLmaiAGGO5ODbY8HKaOshoHzHdgzSnMMs8iQgseABB9ltyrrNjvuoA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794815749;
	h=DMARC-Filter:X-Envelope-To:DKIM-Signature:X-Envelope-To:Received:
	 X-Mizu-Trace-ID:X-Migadu-Flow:From:To:Cc:Subject:Date:Message-ID:
	 X-Mailer:In-Reply-To:References:MIME-Version:Content-Type:
	 Content-Transfer-Encoding;
	bh=jdhXKIihT2dq6nnPB/zLM5Tz5DslhafhE4G3biwkqn0=;
	b=0kCF8IOej+Y9kaa+TlLvsAunnQ18nwEbDQ94SHe3hIS6lj5E6pQGUYkl+lglSlSAR5Rl
	 hX3CnVGh1xdYlXwle9rdC4q4DB6Kpg4Hql5YH+kXz//Y+W5KePDubDGN2rnkjy+dyF2en
	 hYhtjNXa8bxaRPzR6+ZLW3YaKVDd1IftsMBU56MG5hmzqXegVB3FF5KTkC8YlLkWREi+X
	 Bqb02faFmB1Y/VXA6ugQhj90Pbp5S3n9scVF7G32VmhVITd33qZ3VddA4RASFwbcrsxlp
	 AHJaALatNWXg24faOrE93tdkBlX0f6C9xQfjLncsA5Ci/fEEPFgdMM56yeORjx/7tnA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=linux.dev;
	spf=pass smtp.mailfrom=linux.dev;
	dkim=pass header.d=linux.dev header.i=@linux.dev header.a=rsa-sha256 header.s=key1 header.b=bu46ZPCU;
	arc=none smtp.remote-ip=91.218.175.150
Received: from mta0.migadu.com (out-150.mta0.migadu.com [91.218.175.150])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6C980606A332
	for <sashiko-reviews@lists.linux.dev>; Mon, 16 Nov 2026 07:55:47 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 6C980606A332
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.dev
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.dev
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key, unprotected) header.d=linux.dev header.i=@linux.dev header.a=rsa-sha256 header.s=key1 header.b=bu46ZPCU
X-Envelope-To: sashiko-reviews@lists.linux.dev
DKIM-Signature: a=rsa-sha256; bh=P3aWyo9qWXr+tiJ3CVI0TxPUiud8q0JaCtkx0CdstEc=;
 c=simple/simple; d=linux.dev;
 h=from:to:subject:date:message-id:mime-version:content-type; s=key1;
 t=1794815746; v=1; x=1795420546;
 b=bu46ZPCUJLj7jhQVy6BLO/fx9drzfdKaV7Wi4+gmm7DttpIEz38dSEKnS2wDfwHWPquQYxt3
 cTD7neVdTQ9nE/fcQNmQOyp91KWt0Hf2RoZg8kg2AayqVh50gmqczVsA9agnr3kMxCEFpdTudlv
 alNGfxzZqbcIObh1jPN2B9Ts=
X-Envelope-To: sashiko-reviews@lists.linux.dev
Received: by smtp.migadu.com with ESMTPS id 112ad70d5ab5acbf;
	Mon, 16 Nov 2026 07:55:46 +0000
X-Mizu-Trace-ID: 112ad70d5ab5acbf
X-Migadu-Flow: FLOW_OUT
From: Lance Yang <lance.yang@linux.dev>
To: muchun.song@linux.dev
Cc: sashiko-reviews@lists.linux.dev,
	songmuchun@bytedance.com,
	akpm@linux-foundation.org,
	david@kernel.org,
	osalvador@suse.de,
	rppt@kernel.org,
	lizhe.67@bytedance.com,
	apopple@nvidia.com,
	balbirs@nvidia.com,
	ljs@kernel.org,
	liam@infradead.org,
	vbabka@kernel.org,
	surenb@google.com,
	mhocko@suse.com,
	jthoughton@google.com,
	lance.yang@linux.dev,
	qi.zheng@linux.dev,
	linux-mm@kvack.org
Subject: Re: [PATCH v2 02/14] mm/hugetlb: optimize bootmem hugepage tail vmemmap init
Date: Mon, 16 Nov 2026 15:55:40 +0800
Message-ID: <20261116075540.51374-1-lance.yang@linux.dev>
X-Mailer: git-send-email 2.49.0
In-Reply-To: <D1F34237-066F-43E8-89F5-2D7A6217D72B@linux.dev>
References: <D1F34237-066F-43E8-89F5-2D7A6217D72B@linux.dev>
X-Mailing-List: sashiko-reviews@lists.linux.dev
List-Id: <sashiko-reviews.lists.linux.dev>
List-Post: <mailto:sashiko-reviews@lists.linux.dev>
List-Help: <mailto:sashiko-reviews+help@lists.linux.dev>
List-Subscribe: <mailto:sashiko-reviews+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:sashiko-reviews+unsubscribe@lists.linux.dev>
List-Owner: <mailto:sashiko-reviews+owner@lists.linux.dev>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit


On Fri, Nov 13, 2026 at 12:10:13PM +0800, Muchun Song wrote:
>
>
>> On Nov 13, 2026, at 12:07, sashiko-bot@kernel.org wrote:
>> 
>> Thank you for your contribution! Sashiko AI review found 1 potential
>> issue to consider:
>> - [Low] mm/hugetlb: commit message mismatches
>>  memmap_init_page_from_template()
>> --
>> 
>> commit 7cc97c08b2296fc2518d9ae6da5950cb731c48eb
>> Author: Li Zhe <lizhe.67@bytedance.com>
>> 
>> mm/hugetlb: optimize bootmem hugepage tail vmemmap init
>> 
>> This commit speeds up boot-time HugeTLB tail page vmemmap initialization
>> by seeding a template from the first tail page and initializing the
>> remaining tail pages with memmap_init_page_from_template().
>> 
>>> Initialize the first tail page normally, then initialize the remaining
>>> tails with hugetlb_init_tail_page().  This copies the already
>>> initialized first tail page with memcpy() and refreshes only the
>>> PFN-dependent fields in the destination page, while avoiding the full
>>> __init_single_page() and prep_compound_tail() sequence for state that is
>>> identical across tail pages in the same huge page.
>> 
>> [Severity: Low]
>> This isn't a bug, but the commit message appears to describe an earlier
>> version of the patch.  hugetlb_folio_init_tail_vmemmap() copies the first
>> tail page into a stack template and calls memmap_init_page_from_template()
>> (which refreshes the template before copying) rather than a
>> hugetlb_init_tail_page() helper.  The commit message also omits the change
>> in memmap_init_page_from_template() that restricts memcpy_nontemporal() to
>> ZONE_DEVICE pages and uses memcpy() for other zones.
>
>My bad. I forgot to update the commit message, the corrected commit message
>is as follows:
>
>Boot-time HugeTLB allocation has to initialize tail struct pages itself
>when HugeTLB vmemmap optimization (HVO) is unavailable or fails.  For
>gigantic pages, this can cover a large number of tail pages.  Most state
>installed by __init_single_page() and prep_compound_tail() is identical
>for every tail page in the same huge page, so repeating the full
>initialization sequence for each tail page is unnecessary.
>
>Initialize the first tail page normally and use it as a template for the
>remaining tail pages.  Before each copy,
>memmap_init_page_from_template() refreshes the PFN-dependent fields in
>the template, avoiding repeated initialization of state shared by all
>tail pages.
>
>This extends memmap_init_page_from_template() from ZONE_DEVICE to normal
>memory.  Keep memcpy_nontemporal() for ZONE_DEVICE pages and use
>memcpy() for pages in other zones.  memcpy_nontemporal() was also tested
>for the HugeTLB path, but did not provide a similar benefit; on x86-64,
>memcpy() performed better for this workload.
>
>The fallback path was measured on a v7.4-rc2 base with a temporary
>jiffies-based printk modeled after the existing timing in
>memmap_init_zone_device(), using 4K base pages and 64 boot-time 1G
>hugepages.  HVO is unavailable on arm64; on x86-64,
>hugetlb_free_vmemmap=off was used to exercise the fallback path.
>
>  arch    base      with this patch  reduction
>  arm64   360.8 ms  256.0 ms         29.05%
>  x86-64  171.0 ms  165.0 ms          3.51%
>

with the updated commit message, LGTM!

Reviewed-by: Lance Yang <lance.yang@linux.dev>
