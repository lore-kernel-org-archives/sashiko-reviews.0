Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=95.215.58.196
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794819913;
	b=cuwm0h3G+Ki3cc5iocg9dsZmsxeYvZ0u63wleaFvlCM2rVtACDuSeV4eVywTFS+kDc7i
	 gBu+IRSaBvPk4e9KR+RPRVOaVNzFxaHBiBfCUR4T8EwuMmlW/VSrh/c3d6aqdBWOEDJVg
	 DswjHV6bFnAkI338StNUUfwelkuwPAe4jwnyksrxATD0WEnwKCenId+vzvMeOvobPiy+O
	 l0utLNPzCjGNIBoWcm4J6mGB7w8/m3laCBLP+GdPivUR902klLp1dwUJ4mfD3Jhx36G7W
	 kNYJkCpNSGzwq5xK312t/H0XYC7dBln0Gd/yr3m9tWA/gEdaVLvdE/uQ1aBBd/SEYng==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794819913;
	h=DMARC-Filter:X-Envelope-To:DKIM-Signature:X-Envelope-To:Received:
	 X-Mizu-Trace-ID:X-Migadu-Flow:Date:From:To:Cc:Subject:Message-ID:
	 References:MIME-Version:Content-Type:Content-Disposition:In-Reply-To;
	bh=BLOOvo9HqJFBKWuVFOAMt7QamPs3Ec3ERw2/y0kWeTM=;
	b=VYzvffz4UARgdJkUIa0oO2F3SmQKFm+KVwXFKeKHf+KH7V5S6j7ZvHLwWPkWjGKjmsm/
	 EFl4KafDcK1vRuxP7zlqrZlI4G8FtZkZWfcywYmgMb74+SU7U4r0JNMR+kCgZJD/g07E+
	 mGdUZgI6QeQeAiPKM+Pt8tTAm5IybXB1RENrlM6ssOjSeLQeWhyUBqzcePPiwPmCyBcg5
	 +PyBVj68E5SwupPAr2N04oyBYS5CEzJonVzmoMDnQT7jjIZd7KwdeAHGYMD7N0BdzOpjd
	 BV0UW3e/e423YY9tbYKCOC9UINKEQO/7VhGyMr90T5rzzzoNXVi6X6A5PhgkQfx8tSA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=linux.dev;
	spf=pass smtp.mailfrom=linux.dev;
	dkim=pass header.d=linux.dev header.i=@linux.dev header.a=rsa-sha256 header.s=key1 header.b=TPVmuSnq;
	arc=none smtp.remote-ip=95.215.58.196
Received: from mta1.migadu.com (out-196.mta1.migadu.com [95.215.58.196])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B30CF606A337
	for <sashiko-reviews@lists.linux.dev>; Mon, 16 Nov 2026 09:05:11 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org B30CF606A337
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.dev
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.dev
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key, unprotected) header.d=linux.dev header.i=@linux.dev header.a=rsa-sha256 header.s=key1 header.b=TPVmuSnq
X-Envelope-To: sashiko-reviews@lists.linux.dev
DKIM-Signature: a=rsa-sha256; bh=QJBgTWrTnvInnZrf7o7guiV0SN7Rty/Dlh67CgBtKnQ=;
 c=simple/simple; d=linux.dev;
 h=from:to:subject:date:message-id:mime-version:content-type; s=key1;
 t=1794819909; v=1; x=1795424709;
 b=TPVmuSnqx3Gol+Aa/rqc0BVnaU00Ak+fAkaKzeebKIorrFBvfYhctKgH7ypr6IrT6rOViBYD
 q7uGGaiOzZVNcEZH+INrVqbAW53gSdvaNpeDuIiw2XHryZyPDPJH8hpx42edhad6NyeaLF6G/1H
 fWaM/ZHykb8o4jKCuVQEnI7k=
X-Envelope-To: sashiko-reviews@lists.linux.dev
Received: by mta10.migadu.com with ESMTPS id d4bf1921e088497c;
	Mon, 16 Nov 2026 09:05:09 +0000
X-Mizu-Trace-ID: d4bf1921e088497c
X-Migadu-Flow: FLOW_OUT
Date: Mon, 16 Nov 2026 17:04:56 +0800
From: "Xu Xin (vivo)" <xu.xin@linux.dev>
To: sashiko-reviews@lists.linux.dev
Cc: chengming.zhou@linux.dev, david@kernel.org, linux-mm@kvack.org,
	ljs@kernel.org
Subject: Re: [PATCH v2 2/2] mm/ksm: add initialization helpers for
 scan_get_next_rmap_item()
Message-ID: <avrHOAm9pHXss3dT@dgvxl46587.localhost.localdomain>
References: <20261115075832.132109-1-xu.xin@linux.dev>
 <20261115080049.132515-1-xu.xin@linux.dev>
 <sashiko-outbox-216493@kernel.org>
X-Mailing-List: sashiko-reviews@lists.linux.dev
List-Id: <sashiko-reviews.lists.linux.dev>
List-Post: <mailto:sashiko-reviews@lists.linux.dev>
List-Help: <mailto:sashiko-reviews+help@lists.linux.dev>
List-Subscribe: <mailto:sashiko-reviews+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:sashiko-reviews+unsubscribe@lists.linux.dev>
List-Owner: <mailto:sashiko-reviews+owner@lists.linux.dev>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <sashiko-outbox-216493@kernel.org>

On Mon, Nov 16, 2026 at 08:01:01AM +0000, sashiko-bot@kernel.org wrote:
> Thank you for your contribution! Sashiko AI review found 1 potential
> issue to consider:
> - [High] mm/ksm: uninitialized mm_slot dereference in
>   scan_get_next_rmap_item()
> --
> 
> commit c379de4f41203759cd851dbc9790adb7f3dde0fd
> Author: Xu Xin (vivo) <xu.xin@linux.dev>
> 
> mm/ksm: add initialization helpers for scan_get_next_rmap_item()
> 
> This commit extracts the new scan cycle check into
> scan_should_start_new_cycle() and adds scan_get_first_mm() to advance the
> scan cursor to the first mm_slot in scan_get_next_rmap_item().
> 
> > diff --git a/mm/ksm.c b/mm/ksm.c
> > index b81a49c65030b..7d0f4bad53b28 100644
> > --- a/mm/ksm.c
> > +++ b/mm/ksm.c
> 
> [ ... ]
> 
> > @@ -2662,8 +2690,7 @@ static struct ksm_rmap_item *scan_get_next_rmap_item(struct page **page)
> >  	if (list_empty(&ksm_mm_head.slot.mm_node))
> >  		return NULL;
> >  
> > -	mm_slot = ksm_scan.mm_slot;
> > -	if (mm_slot == &ksm_mm_head) {
> > +	if (scan_should_start_new_cycle()) {
> >  		advisor_start_scan();
> >  		trace_ksm_start_scan(ksm_scan.seqnr, ksm_rmap_items);
> >  
> > @@ -2682,17 +2709,8 @@ static struct ksm_rmap_item *scan_get_next_rmap_item(struct page **page)
> >  		ksm_prune_migrate_nodes();
> >  		ksm_reset_unstable_trees();
> >  
> > -		spin_lock(&ksm_mmlist_lock);
> > -		slot = list_entry(mm_slot->slot.mm_node.next,
> > -				  struct mm_slot, mm_node);
> > -		mm_slot = mm_slot_entry(slot, struct ksm_mm_slot, slot);
> > -		ksm_scan.mm_slot = mm_slot;
> > -		spin_unlock(&ksm_mmlist_lock);
> > -		/*
> > -		 * Although we tested list_empty() above, a racing __ksm_exit
> > -		 * of the last mm on the list may have removed it since then.
> > -		 */
> > -		if (mm_slot == &ksm_mm_head)
> > +		mm_slot = scan_get_first_mm();
> > +		if (!mm_slot)
> >  			return NULL;
> >  next_mm:
> >  		ksm_scan.address = 0;
> 
> [Severity: High]
> Does removing mm_slot = ksm_scan.mm_slot leave mm_slot uninitialized when
> a scan cycle is already in progress?
> 
> mm_slot is now only assigned inside the scan_should_start_new_cycle()
> block:
>

That was missed yes, V3 already fix it:
https://lore.kernel.org/all/20261116014655.310486-1-xu.xin@linux.dev/ 
