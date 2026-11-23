Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=91.218.175.81
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795454163;
	b=MsybNW57dOz+UU/puhrWEpXoByHkBpe8rv/HiL4f3/pQUhphNCvMBtxX82YOTZojzDdz
	 AwtOHBHKbkiKdA2Gt1oDRfiLuzglGAXtNBHQoVnVr05kSD89QcdKExatDbALu/k8Cifxl
	 fgHLO9iAKfSW1VShEssNG25PDsfcUl87q5BGePiQf1mEploRjDZU4XVQQ2HaC7l5hEQ83
	 B1ru0SP1nVVh4qkNgxtoPgJKr9umvK2ftooywMLs+hQ2oiP9wzjySd4LqwcvMrx+NDXEf
	 JOHYz/T9E35cIF+WRagp00o8UEmyax4TIhMACWp7mK/FpK4RkEs21Hf8XljNVtOKeCw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795454163;
	h=DMARC-Filter:X-Envelope-To:DKIM-Signature:X-Envelope-To:Received:
	 X-Mizu-Trace-ID:X-Migadu-Flow:Date:From:To:Cc:Subject:Message-ID:
	 References:MIME-Version:Content-Type:Content-Disposition:In-Reply-To;
	bh=F/JPbpSB/rGyKRm4viwHoAGzFC9uuzP6EhjwxOibHe4=;
	b=mDZn+KW4knhS0smjX1L5LKLXmYzSH57OS25ni4nZ8AvE6lBfm/tvxuP5bqXllFjuegR8
	 t2vsIQaIU0KOzTn6vxyoiDoQ1BegxzwmYi1fhha5fBRqoxQ5FAgbe3G/DVybTZLwlA88m
	 KdiSGyN+jBJU0oj4wwO+knLmBjq1mm+68eNAwwMhoSO1KpgyE6oATrM7Gi6Fyy3lgbiX1
	 1iak7rN64PybXXiKXsfJl008QNdgWz6d840fWLUH96H+CAKKTxS5B2PGfbOD1l63+xCO4
	 3YvvBk2N9SWCxXCDgqZCD+/2YT4phQLrlZHbxrW2qhFwLxudM/sBiWZ6B4IYN+KQzLQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=linux.dev;
	spf=pass smtp.mailfrom=linux.dev;
	dkim=pass header.d=linux.dev header.i=@linux.dev header.a=rsa-sha256 header.s=key1 header.b=BFxBw55+;
	arc=none smtp.remote-ip=91.218.175.81
Received: from mta0.migadu.com (out-81.mta0.migadu.com [91.218.175.81])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D1BB5606A31A
	for <sashiko-reviews@lists.linux.dev>; Mon, 23 Nov 2026 17:16:02 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org D1BB5606A31A
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.dev
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.dev
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key, unprotected) header.d=linux.dev header.i=@linux.dev header.a=rsa-sha256 header.s=key1 header.b=BFxBw55+
X-Envelope-To: sashiko-reviews@lists.linux.dev
DKIM-Signature: a=rsa-sha256; bh=ztivkPdMY2ApJwl6+OnSKU5R/Tv0oGqQG0kTiaequ14=;
 c=simple/simple; d=linux.dev;
 h=from:to:subject:date:message-id:mime-version:content-type; s=key1;
 t=1795454160; v=1; x=1796058960;
 b=BFxBw55+mfjZ7cI6lHPR8s+xH+tbkiAM+Wg5qQBQrcAdQ6B32TPe1Bj94vTDEAgf5r364sOP
 +xKp6txvZA7L2b/pEa/OauEeCimIKUugPm16AosSzwGhJYviapqv/UkNk5ht6bSwlaCaOr1oMp0
 DJ9VbW89lr2VJTxZjQCyUukM=
X-Envelope-To: sashiko-reviews@lists.linux.dev
Received: by smtp.migadu.com with ESMTPS id 21b22ad1ae60e129;
	Mon, 23 Nov 2026 17:16:00 +0000
X-Mizu-Trace-ID: 21b22ad1ae60e129
X-Migadu-Flow: FLOW_OUT
Date: Mon, 23 Nov 2026 09:15:59 -0800
From: Shakeel Butt <shakeel.butt@linux.dev>
To: sashiko-reviews@lists.linux.dev
Cc: Tejun Heo <tj@kernel.org>, Andrew Morton <akpm@linux-foundation.org>, 
	Johannes Weiner <hannes@cmpxchg.org>, Michal Koutny <mkoutny@suse.com>, 
	Christian Brauner <brauner@kernel.org>, Michal Hocko <mhocko@kernel.org>, 
	Roman Gushchin <roman.gushchin@linux.dev>, Muchun Song <muchun.song@linux.dev>, Jan Kara <jack@suse.cz>, 
	Matthew Wilcox <willy@infradead.org>, David Hildenbrand <david@kernel.org>, 
	Vlastimil Babka <vbabka@kernel.org>, Zi Yan <ziy@nvidia.com>, 
	Baolin Wang <baolin.wang@linux.alibaba.com>, Nico Pache <nico.pache@linux.dev>, 
	Usama Arif <usama.arif@linux.dev>, Kiryl Shutsemau <kas@kernel.org>, 
	Lorenzo Stoakes <ljs@kernel.org>, Suren Baghdasaryan <surenb@google.com>, 
	Meta kernel team <kernel-team@meta.com>, linux-mm@kvack.org, dsterba@suse.cz
Subject: Re: [RFC PATCH 6/7] memcg: remove synchronous memory.high enforcement
Message-ID: <awR0p0hSJWt9MlIg@linux.dev>
References: <20261122024737.2741569-1-shakeel.butt@linux.dev>
 <20261122024737.2741569-7-shakeel.butt@linux.dev>
 <sashiko-outbox-227661@kernel.org>
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
In-Reply-To: <sashiko-outbox-227661@kernel.org>

On Sun, Nov 22, 2026 at 03:06:06AM +0000, sashiko-bot@kernel.org wrote:
> Thank you for your contribution! Sashiko AI review found 1 potential
> issue to consider:
> - [High] memcg: memcg_enforce_high() leaves vhost_task PF_USER_WORKER
>   threads unthrottled

Real fix already in flight. 

https://lore.kernel.org/all/AS8P251MB0001F1EACBED6E7A2AFA8A96C8692@AS8P251MB0001.EURP251.PROD.OUTLOOK.COM/
