Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.160.176
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794642613;
	b=0wRvgayo3uTKYfUXfSQnLuu4AwvWb5LJCFBSO9wXx3IehVZiTRqtrwTpDzUkYaIvwXQ+
	 8YcLnUhOHXsRc5nMvzGO6k7IjplH3tGfMcZWBJtEHg446VfaNQdEGc19h5hHGjRydkcTN
	 SLfwMuxQG6eNCzSYcIYFSS2hlKcr3tB1TVRuxwz0GABBl2YeQLb2/fkN6uABTxiBo/Dp/
	 YIq/KYa4WVGN8hUhVy/Hu002/trIhZciJng25hy0eIaik8R+gtlsEl3nVKpMLTpRHD2tm
	 q3GZXHekgUcK3lc4PAdfmAEy1R0UbvtY/KORoHfCwcgy2Goj5nY4qkz/onZcKT9OEaQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794642613;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:Received:MIME-Version:
	 Content-Type:Content-Transfer-Encoding:Subject:From:To:Cc:In-Reply-To:
	 References:Date:Message-Id:X-Mailer;
	bh=cGbHDC4e4qa3gSIc5H3tZOXqH9VLSX3BMg1aP/6Q428=;
	b=N6v1xMw6R4YGrIs3JHO1X6YB2bRwBkrSvjD/u2juL2rKaCIcA0QBNYW+I7yr62GyVjdw
	 IWpto9uBdkSycMJf2aLGg7zde3rZLQ183IFEAHgaZd3Pjs9jQR4wNAyADkMd6MmqRrl+C
	 U6QCqxwqgEAZSELihrgX91iXUyEGMEifahhUDvww+4W8laGbMtGW0/HToKWEZDyYQlO+K
	 crzMgu1Bhz2BAPcYwoMtc78hlg1rrtVdQxHQCOXLAe6H2Uu56Kjbjc8tx6oIrMDRqZAH5
	 d6zmE/+eUdyd2FAYNroGEQJ4Q05Zcuyt1agB1yQkxnTCQ4BlNsKEVCYGmn6soa9Qluw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=none header.from=gourry.net;
	spf=pass smtp.mailfrom=gourry.net;
	dkim=pass header.d=gourry.net header.i=@gourry.net header.a=rsa-sha256 header.s=google header.b=KWBuS8ym;
	arc=none smtp.remote-ip=209.85.160.176
Received: from mail-qt1-f176.google.com (mail-qt1-f176.google.com [209.85.160.176])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D7159606A32D
	for <sashiko-reviews@lists.linux.dev>; Sat, 14 Nov 2026 07:50:12 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org D7159606A32D
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=gourry.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gourry.net
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gourry.net header.i=@gourry.net header.a=rsa-sha256 header.s=google header.b=KWBuS8ym
Received: by mail-qt1-f176.google.com with SMTP id d75a77b69052e-53bb57f1310so29601771cf.2
        for <sashiko-reviews@lists.linux.dev>; Fri, 13 Nov 2026 23:50:12 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gourry.net; s=google; t=1794642612; x=1795247412; darn=lists.linux.dev;
        h=message-id:date:references:in-reply-to:cc:to:from:subject
         :content-transfer-encoding:content-type:mime-version:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=cGbHDC4e4qa3gSIc5H3tZOXqH9VLSX3BMg1aP/6Q428=;
        b=KWBuS8ymLgXMeowcI1ln8kTP/fjpRDBzRphtqoLoepiRZFzYj3a8MB16alM+Wm9SKm
         7LoqcYo36AZKsIld/Ponzjsfal8aL6plzpvWOSWRPzYLW0Vjsnohdu6jCjrapTXIxWH7
         D1bXMDUZZVB9ICGGcLvxjYZd/HF5kiWgrIZaja4WyvgIl+xCTLMLCb3637NoSxE59m24
         HZQoKeyfG0+Ip7hVtf2y1hpJ+7ExCN01lqnNrC0fXhmS/EE40M/dteDvKDFgAXSbVfNm
         8cwxlkmVc2M1z0yKGzbici/vRhXich/7BIoYvUUE+rpljKDtmrsF18Wg8Tjk8pkuBwT6
         mu4w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794642612; x=1795247412;
        h=message-id:date:references:in-reply-to:cc:to:from:subject
         :content-transfer-encoding:content-type:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=cGbHDC4e4qa3gSIc5H3tZOXqH9VLSX3BMg1aP/6Q428=;
        b=Hj7hw9jYRHViUSxF6t1hNpRtBQBwwIpxVndPEzc9w7wcGKVutiA2JrjF8Q1G+v50PH
         PHIX0C80fVJre7RUGDGDPYoySZuO+aLH369uDwfYmLklo1xMxGklpJ4IFOrp5bEOCaZs
         zlikt/BtxRu/trcLgpfxkndDSM5q1jcPxywUo/NLqc+/NoZNns68xjY2rk7m1zElafWr
         y+whUkr2bCvk3xv+LszFby+4vTugGAuhxbaN+6jaOvpsGednQ4H5PfUGaxbD61Tovlog
         AFuBOFC57ermPmxM7bkDZK8+XLWl8KJGNGc7ver9t3D5UKJBZLDE9XicIidHPKnxkx7w
         /E7Q==
X-Gm-Message-State: APuU4Z8PBebJev/inILAohElENdRQHD644E5DXIEXqW6TfJ1Huz8dDML
	HAn4dlypGH2BtGjznBwStJ46vbzK4P2iLynlmL00hi/v4DMVypM+ZBEwDu/rXc3p16I=
X-Gm-Gg: AYBFou3LTGr7vTUtYhQuP/JF84AkgUb5rE5prJhYAFahkRhLC+k2LOgAXpD4zd45tKG
	xJOwl2TCtFCI8OXpZhXXpQxgcTT+RSyUEGOcxCQR4FmqfUU7WqFKeuHJzRk3P4nJ7G/GMSA+OGq
	8p1it9uFhULyx2Nx0PdsqGzMND/JvOxlGmFuiidlj3lLiGD47F1wbGSO/j7TMCISEmlmtK8MUcT
	ix19dWsONb1clNkqgdO7iAcA4YenWdSwVld8co/m+PdK/WloLd7iUMe47B2ji8VeTYx1xAckaZD
	P51Z0ODHSRi3WKmpsOu04XP/tIeFdwsLuSPMn9oLkf0cDMy0rdCRQeNEbD63AYsz0ZyE7xgxZ+2
	XHx+g3T1odXxH3YMoaTEYZcELKu4BW3orEPDN5TgwvUvcd6rdxXZcv0DOtBocW9Xj6GLT1ctmLn
	HkPUBVI527Je1zhn1LgRa06iXf5eHRpe4YtmFdbGhcckoBxwIprhIA+fipgXWJMkiUr+v2CwKD/
	A30CXyuRb4mcDjUwRUENScPk8I/7Wjbp5STJvbQvmKBbbqmSTusI8jAhoinJuNjoNTXaPBstieV
	oQOwHdnfqNoYRs4/OMErDMnmbRZp1KiPmgAuUgvNC+j2hXp9o4AuPpyWcoPVYVkNu9vkWQ8PN/X
	cf3vlshQ=
X-Received: by 2002:a05:622a:4890:b0:536:6378:c80d with SMTP id d75a77b69052e-55ac7d4f0e5mr76447071cf.32.1794642611571;
        Fri, 13 Nov 2026 23:50:11 -0800 (PST)
Received: from [192.168.50.231] (pool-71-191-145-202.washdc.fios.verizon.net. [71.191.145.202])
        by smtp.gmail.com with ESMTPSA id 6a1803df08f44-91f23d445d1sm38109806d6.8.2026.11.13.23.50.10
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 13 Nov 2026 23:50:11 -0800 (PST)
X-Mailing-List: sashiko-reviews@lists.linux.dev
List-Id: <sashiko-reviews.lists.linux.dev>
List-Post: <mailto:sashiko-reviews@lists.linux.dev>
List-Help: <mailto:sashiko-reviews+help@lists.linux.dev>
List-Subscribe: <mailto:sashiko-reviews+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:sashiko-reviews+unsubscribe@lists.linux.dev>
List-Owner: <mailto:sashiko-reviews+owner@lists.linux.dev>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Subject: Re: [PATCH 20/22] PM: hibernate: size the image from common memory
From: "Gregory Price (Meta)" <gourry@gourry.net>
To: sashiko-reviews@lists.linux.dev
Cc: "Gregory Price (Meta)" <gourry@gourry.net>, linux-mm@kvack.org, 
 kernel-team@meta.com, linux-serial@vger.kernel.org, damon@lists.linux.dev, 
 linux-cxl@vger.kernel.org, akpm@linux-foundation.org, david@kernel.org, 
 liam@infradead.org, vbabka@kernel.org, rppt@kernel.org, surenb@google.com, 
 mhocko@suse.com, corbet@lwn.net, skhan@linuxfoundation.org, 
 rdunlap@infradead.org, gregkh@linuxfoundation.org, rafael@kernel.org, 
 dakr@kernel.org, johan@kernel.org, jirislaby@kernel.org, kasong@tencent.com, 
 qi.zheng@linux.dev, shakeel.butt@linux.dev, baohua@kernel.org, 
 axelrasmussen@google.com, yuanchu@google.com, weixugc@google.com, 
 baoquan.he@linux.dev, baolin.wang@linux.alibaba.com, yury.norov@gmail.com, 
 linux@rasmusvillemoes.dk, pavel@kernel.org, lenb@kernel.org, 
 hannes@cmpxchg.org, brendan.jackman@linux.dev, ziy@nvidia.com, 
 sj@kernel.org, muchun.song@linux.dev, osalvador@suse.de, 
 nico.pache@linux.dev, ryan.roberts@arm.com, dev.jain@arm.com, 
 lance.yang@linux.dev, usama.arif@linux.dev, kas@kernel.org, 
 xu.xin@linux.dev, chengming.zhou@linux.dev, joshua.hahnjy@gmail.com, 
 rakie.kim@sk.com, ying.huang@linux.alibaba.com, matthew.brost@intel.com, 
 byungchul@sk.com, apopple@nvidia.com, rientjes@google.com
In-Reply-To: <sashiko-outbox-214264@kernel.org>
References: <20261114070959.3490008-1-gourry@gourry.net>
 <20261114070959.3490008-21-gourry@gourry.net>
 <sashiko-outbox-214264@kernel.org>
Date: Sat, 14 Nov 2026 02:50:09 -0500
Message-Id: <179464260972.482102.15351839494267219366.b4-reply@b4>
X-Mailer: b4 0.17-dev

On 2026-11-14 07:34 +0000, sashiko-bot@kernel.org wrote:
> > @@ -2011,9 +2013,10 @@ static int enough_free_mem(unsigned int nr_pages, unsigned int nr_highmem)
> >  	struct zone *zone;
> >  	unsigned int free = alloc_normal;
> >  
> > -	for_each_populated_zone(zone)
> > +	for_each_populated_zone_state(zone, N_MEMORY_COMMON) {
> >  		if (!is_highmem(zone))
> >  			free += zone_page_state(zone, NR_FREE_PAGES);
> > +	}
> >  
> >  	nr_pages += count_pages_for_highmem(nr_highmem);
> >  	pr_debug("Normal pages needed: %u + %u, available pages: %u\n",
> 
> [Severity: Medium]
> Should count_free_highmem_pages() also iterate over N_MEMORY_COMMON zones?
> 
> On CONFIG_HIGHMEM systems, enough_free_mem() calls count_pages_for_highmem(),
> which calls count_free_highmem_pages():
> 
> kernel/power/snapshot.c:count_free_highmem_pages() {
> 	struct zone *zone;
> 	unsigned int cnt = 0;
> 
> 	for_each_populated_zone(zone)
> 		if (is_highmem(zone))
> 			cnt += zone_page_state(zone, NR_FREE_PAGES);
> 
> 	return cnt;
> }
> 
> Because count_free_highmem_pages() still sums all populated zones,
> enough_free_mem() continues to count free highmem pages on non-common nodes as
> available room for the image, undercounting the normal pages needed to back
> highmem copies.
> 
> In addition, alloc_highmem_pages() and prepare_highmem_image() use
> count_free_highmem_pages() to bound loops that call alloc_image_page() or
> alloc_page() with __GFP_HIGHMEM and pass the returned page directly to
> page_to_pfn() or swsusp_page_is_free() without a NULL check, which can
> dereference NULL when highmem on N_MEMORY_COMMON nodes is exhausted while
> non-common nodes still have free highmem pages.
> 

HIGHMEM can't exist on a private node.  Private nodes require NUMA which
require 64-bit.  As far as I know HIGHMEM is 32-bit only.

Trivial to update though, so for consistency i can add it. 

-- 

--- a/kernel/power/snapshot.c
+++ b/kernel/power/snapshot.c
@@ -1291,16 +1291,17 @@ static void mark_free_pages(struct zone *zone)
 /**
  * count_free_highmem_pages - Compute the total number of free highmem pages.
  *
- * The returned number is system-wide.
+ * Only common memory counts, since image pages come from common memory.
  */
 static unsigned int count_free_highmem_pages(void)
 {
        struct zone *zone;
        unsigned int cnt = 0;

-       for_each_populated_zone(zone)
+       for_each_populated_zone_state(zone, N_MEMORY_COMMON) {
                if (is_highmem(zone))
                        cnt += zone_page_state(zone, NR_FREE_PAGES);
+       }

        return cnt;
 }
