Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.128.51
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794487441;
	b=AZbAkUn6rZBmSxrtKQzVimUlfZGlwiuOBoKIFeBSmFWo10huAnJKPY+AtEhqMj2Ejao0
	 JkAiIlRf4WTChszVPxJE6l1/p8TfldXX/cZ7JF6H1Y2XQ4o3vSABKM5v00ggAgPhTFTpS
	 jTXYl3MpO4tFk5ywixmcWe/AErL44VcUriTtxdqTz43RFjSYaJL7+y8upAeULFLxUep5I
	 Db/wYZzPV7Z8SBsGTWNMUBkLUxQXEABMY7aB/2iPvaJHw1tTHtJUXGy7KEEDZXaMsyBO3
	 W1vSu6d03HQt9F1DiRZeAjodsZl1xOVdSmX+XpNFiKA5Nm2DUhjWpVGImifA5DLrQhg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794487441;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:Received:Message-ID:Date:
	 MIME-Version:User-Agent:Subject:To:Cc:References:Content-Language:
	 From:In-Reply-To:Content-Type:Content-Transfer-Encoding;
	bh=X+6w6EnLhLOmcis6niKVFV2lDAfq98fIm4HzWD5a3o4=;
	b=2KwbkohZmb7z/q3UY4+EWQ7owU6NibS0/VaNIo/eZoYlEai7AhHBY7/qx0taA4WyptsL
	 hISo4U7xp4pWKqUQeoAO2RkCWnBIxOWWVE557r+cR59R3pvaXcJP283OqnqO+WRX9pZPI
	 8yRvNs3NIiGq2YGlD5luoNk2zZxrimaOEfy9Crhl3eMBUO+Ro7vALcksaOhsLj5nQP2Pm
	 2cn7c9GaGw9Hj5n4Fm7U2BRTPrFwtZbX7HBo7V3Q36Bj9Jq9z28HVUdesd+hiqPaxjmOd
	 /F/MkGM11kbWQ7Ka2/Eh0Xxj+nTq7mPEXmKrx0l/WRZJ3xpV00X03dXY4oPp6ZgwyAQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=KXCIg0vq;
	arc=none smtp.remote-ip=209.85.128.51
Received: from mail-wm1-f51.google.com (mail-wm1-f51.google.com [209.85.128.51])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9DD57606A323
	for <sashiko-reviews@lists.linux.dev>; Thu, 12 Nov 2026 12:44:00 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 9DD57606A323
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=KXCIg0vq
Received: by mail-wm1-f51.google.com with SMTP id 5b1f17b1804b1-4a214c5c4c0so41925145e9.3
        for <sashiko-reviews@lists.linux.dev>; Thu, 12 Nov 2026 04:44:00 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794487439; x=1795092239; darn=lists.linux.dev;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=X+6w6EnLhLOmcis6niKVFV2lDAfq98fIm4HzWD5a3o4=;
        b=KXCIg0vqwh5Qbw/JqBvs9NN2PH80XVd8qy+eQm55eGlcK9qi/Wx5oIqzcr4yJsAIdC
         siTcxOis1tGbgbTNLELBt70MgTlwVfiiBVQPpI0pQmJpAYo9QZ5M00aq4t2bK8XFQpOK
         v0KIS84owFO4FStarLm/7vGi5NJ/qGqiWN5cw2yXQlj0JM9wwl6fY35xx/zF27sNmjJz
         706bmOlnUMz8LIWKq5N0cYf0Azyb7I9Epf0JxERyxxnuKIJ8Vxhjoxd9i/HT4+zyank1
         yqbipxR0gfIOrfdISgkN0sKQRMjB8jVJbAC1wEF1i0ReV7PXx2vUzgaaiHNWqFud1h9i
         rO2A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794487439; x=1795092239;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=X+6w6EnLhLOmcis6niKVFV2lDAfq98fIm4HzWD5a3o4=;
        b=eetDF09+fXvWUgwkwcbWRgKi+oKiduro5mJwDP0aybnmDkvCP/fOq61u05DHr2mW0c
         cEIiSulshTubkeWt+gSM9xxeUBBG1AZbjRjTJK2Dtc1r6AaqhYZ74inq/hpjZOxpfSfi
         db2hRcfvWqFc3sgsoYdW6/jJ4YWZlvzz2Q4SbjxZbdS9CpHM5zDP3YTzTmx+JO0a937A
         IvUqFLt00rzjt04aNlDxm/m0j3T4PizlaVbezqP3uUXIu3VQ67k9UtBJqnpYylxmR3Qz
         6DHwLR4uGm8vDtMalUEaOzZeevVuhFN5MNS2YmUDujdh6ufjO5dQUT13TTr6SC/mS/wS
         7V1g==
X-Gm-Message-State: APuU4Z+UgUj82okhnBtzJTzxHNm37m1ojBJUs7tESA0XNfFSCMWwmxQN
	YI0v7bfML4iU7RPQx9Z5Rtom48/q5xIMGg3YBzmaTQNfeXinjxOz1YoolY+2MkcN2eA=
X-Gm-Gg: AYBFou1+SfXHNkPV1onxvI4U+8VGHKpEwZXjpZCcFl/Kag5kyJNQDQRKEeqqll5KYh8
	LX5jDw4BGxE6k5+gRPlJNfGR6NB6HWmGBm4lcZRiCgOpZ3406RNGgG1skw3pnlqJ2R0gTcCNkAd
	SRmye5OuvPNMHWGrfVQd8Y+tcJJguKqVjYf8Mr3bfDYLUrGxzleRugCQRgqCcgFzSZE3irtKAI7
	Y5xdh+g1AT82MjndTeByw6efd7+zyXNXVJj+UrYwrMm4H9Y9IlmuVcwdQ076i9WFE21feOx+U1j
	9JNYRzwVze1MmMF10O3mQQyBmkTInohPNcHB3bOlmwXi+CgZabCkGUzKLgUOEy2GppMwRV8B66M
	9aart6cKNbEm9TObMDohw0cRDR8Pr2RY38zjM33QRVs1+yxc0a/W2HvJnrBIm2QGN4Es1x/HYUe
	Tp7ziyb/PRJXW8cSjf1tW53BkwYh2ZfOoxAsZZT3mvgVbwmPU+YVc7GxcLugm4F3sbxEd1uizsz
	kiV7xNW6VYQs4YuA7LyCji0C4x8fvyE2loufwejfqSPCgNhsVj+5FNjFv1hmYn9L4IfE4C5EnJ8
	jtRB0yL+q97VLN8o42ZtesDk
X-Received: by 2002:a05:600c:3f16:b0:4b6:bb67:bb9 with SMTP id 5b1f17b1804b1-4ba093c8e2fmr93646065e9.29.1794487438821;
        Thu, 12 Nov 2026 04:43:58 -0800 (PST)
Received: from [192.168.1.22] ([83.231.69.9])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4bb4e27a8b0sm69126995e9.15.2026.11.12.04.43.57
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 12 Nov 2026 04:43:58 -0800 (PST)
Message-ID: <dee35546-3f5d-4fd3-83cb-dd135e726e09@gmail.com>
Date: Thu, 12 Nov 2026 13:43:56 +0100
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
Subject: Re: [RFC PATCH 2/2] mm/huge_memory: detect partially mapped shared
 folios without per-page mapcounts
To: sashiko-reviews@lists.linux.dev, David Hildenbrand <david@kernel.org>,
 Zi Yan <ziy@nvidia.com>, Andrew Morton <akpm@linux-foundation.org>,
 Lorenzo Stoakes <ljs@kernel.org>
Cc: Baolin Wang <baolin.wang@linux.alibaba.com>,
 "Liam R. Howlett" <liam@infradead.org>, Nico Pache <nico.pache@linux.dev>,
 Ryan Roberts <ryan.roberts@arm.com>, Dev Jain <dev.jain@arm.com>,
 Barry Song <baohua@kernel.org>, Lance Yang <lance.yang@linux.dev>,
 Usama Arif <usama.arif@linux.dev>, Kiryl Shutsemau <kas@kernel.org>,
 Rik van Riel <riel@surriel.com>, Vlastimil Babka <vbabka@kernel.org>,
 Harry Yoo <harry@kernel.org>, Jann Horn <jannh@google.com>,
 linux-mm@kvack.org, Joanne Koong <joannelkoong@gmail.com>
References: <20261111113535.330078-1-azpijr@gmail.com>
 <20261111113535.330078-3-azpijr@gmail.com> <sashiko-outbox-211031@kernel.org>
Content-Language: en-US
From: "Jose A. Perez de Azpillaga" <azpijr@gmail.com>
In-Reply-To: <sashiko-outbox-211031@kernel.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 11/12/26 12:36 PM, sashiko-bot@kernel.org wrote:
> Thank you for your contribution! Sashiko AI review found 1 potential
> issue to consider:
> - [Medium] mm/huge_memory: deferred_split_scan() runs PMD
>   thp_underused() on mTHPs
> --
> 
> commit 2f9d38ddfb170d3656f9925bef1e82e9b94ecc37
> Author: Jose A. Perez de Azpillaga <azpijr@gmail.com>
> 
> mm/huge_memory: detect partially mapped shared folios without per-page mapcounts
> 
> This commit queues shared anonymous folios onto the deferred split list
> without setting PG_partially_mapped when CONFIG_NO_PAGE_MAPCOUNT cannot tell
> at unmap time whether all subpages remain mapped, and walks the rmap in
> deferred_split_scan() to check them.
> 
>> diff --git a/mm/huge_memory.c b/mm/huge_memory.c
>> index 8c4a69c797edd..f80fa028dd340 100644
>> --- a/mm/huge_memory.c
>> +++ b/mm/huge_memory.c
> 
> [ ... ]
> 
>> @@ -4744,6 +4811,15 @@ static unsigned long deferred_split_scan(struct shrinker *shrink,
>>  		list_lru_unlock_irq(lru);
>>  		rcu_read_unlock();
>>  
>> +		if (!folio_test_partially_mapped(folio) &&
>> +		    folio_needs_mapped_check(folio)) {
>> +			if (!folio_trylock(folio))
>> +				goto requeue;
>> +			/* Sets PG_partially_mapped and puts it back on the queue. */
>> +			if (folio_mapped_shared_partially(folio))
>> +				deferred_split_folio(folio, true);
>> +			folio_unlock(folio);
>> +		}
>>  		if (!folio_test_partially_mapped(folio)) {
>>  			/*
>>  			 * See try_to_map_unused_to_zeropage(): we cannot
>> @@ -4752,7 +4828,7 @@ static unsigned long deferred_split_scan(struct shrinker *shrink,
>>  			 */
>>  			if (folio_test_mlocked(folio))
>>  				goto next;
>> -			underused = thp_underused(folio);
>> +			underused = split_underused_thp && thp_underused(folio);
>>  			if (!underused)
>>  				goto next;
>>  		}
> 
> [Severity: Medium]
> Can deferred_split_scan() now call thp_underused() on a sub-PMD mTHP?
> 
> Previously, only map_anon_folio_pmd_nopf() queued folios with
> partially_mapped == false, so any folio reaching the !folio_test_partially_mapped(folio)
> branch was PMD-sized.  __folio_remove_rmap() now queues shared anonymous
> folios of any order > 1 with partially_mapped == false when a partial unmap in
> one process leaves the folio fully mapped in another.  When
> folio_mapped_shared_partially() returns false for such a sub-PMD mTHP,
> execution falls through to thp_underused(folio):
> 
> mm/huge_memory.c:thp_underused() {
>     ...
> 	for (i = 0; i < folio_nr_pages(folio); i++) {
> 		if (pages_identical(folio_page(folio, i), ZERO_PAGE(0))) {
> 			if (++num_zero_pages > khugepaged_max_ptes_none)
> 				return true;
> 		} else {
> 			if (++num_filled_pages >= HPAGE_PMD_NR - khugepaged_max_ptes_none)
> 				return false;
> 		}
> 	}
>     ...
> }
> 
> Because thp_underused() compares against unscaled HPAGE_PMD_NR and
> khugepaged_max_ptes_none thresholds, any khugepaged_max_ptes_none below
> HPAGE_PMD_NR - 1 causes reclaim to scan subpages with pages_identical() even
> when neither threshold can be reached, or to split fully mapped sub-PMD mTHPs
> and increment THP_UNDERUSED_SPLIT_PAGE.  Checking folio_test_pmd_mappable(folio)
> before calling thp_underused(folio) would avoid this.
> 

okay, seems correct. I'll make thp_underused() return false for folios
that are not PMD-mappable in v2 then.

-- 
cheers,
jose a. p-a
