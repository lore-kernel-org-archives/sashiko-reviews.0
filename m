Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AA534519929
	for <sashiko-reviews@lists.linux.dev>; Wed, 14 Oct 2026 13:39:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791985155; cv=none; b=LLocByrHZOMY7Cf7HBJl2Qluc18EoZvXfPQK0vDyDaL7Sn+/VEM3mktC010v+Bgb1HPFRM5G1lOoN+07nYdkFNdUkrJ1WhcmqGWl3X2KNTuBroO5SsSBNqpbi0xVgoYaKXPeN2PAM/6rn04nvM0ynoBeYT8VjYnTpZsvv6foROo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791985155; c=relaxed/simple;
	bh=+3qYcgOjJGVR23QzBAYhRazL5cLj28BmI+rmuw/UDKI=;
	h=From:To:Cc:Subject:In-Reply-To:References:Date:Message-ID:
	 MIME-Version:Content-Type; b=m/e+UQL8soAP3a/6l+7heOPZvIq5KoygsPoSXNKzUlZTLXrjyAuBJgNX9lb8xXdJX7rFZDUoQhTZilvgdv6mM6pleOatbOBJdWjDZk6Sb3YYNB1m2zn7RgBhhnZ9JF2MzyjKlhro19E0E11DxbFY1PT9FJ3jHYRB3J9mnGecaMQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=j08Do2wF; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="j08Do2wF"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 963201F000FF;
	Wed, 14 Oct 2026 13:39:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1791985153;
	bh=KeAUB6ZxZwwTDAP+QZu/Wb9oM9Eo94NycgbH1JijO+o=;
	h=From:To:Cc:Subject:In-Reply-To:References:Date;
	b=j08Do2wFYG6/Um1aRNiQ05eoZuB8AAlPnGfra7QiROemMesaLcT19X+2jmrzjzRuB
	 8JgXYYS1HPkEXRDQe1bL8JW2c0FWHnalCGkhk61UAZBTbk6Ai6JxTSmZTvZqUR33fR
	 YQp5Ymnxyga19xW29g4HQxhKkOu9lWGtpxfcjV7vBbTb/foypPLZYXR0ys69+aEqVQ
	 XPHWg+jLPOV9zBIvC9wCub9E6boaBBzYsIEFVTyVpBG96hC0dwpmzbIyq5RecHDWbt
	 y2cOHFDEaZDa2CRVxtBoHaRNbAQ6c8tCvUxV0Pg9YrUfLBgl2HqPBwgGpo5PW1aiB0
	 p648uKxV6gi1g==
From: Pratyush Yadav <pratyush@kernel.org>
To: sashiko-bot@kernel.org
Cc: "Pratyush Yadav" <pratyush@kernel.org>,  "Mike Rapoport"
 <rppt@kernel.org>,  "Pasha Tatashin" <pasha.tatashin@soleen.com>,
  "Alexander Graf" <graf@amazon.com>,  sashiko-reviews@lists.linux.dev,
  kexec@lists.infradead.org,  "Bing Jiao" <bingjiao@google.com>
Subject: Re: [PATCH] kho: do not reserve empty per-node bootmem areas
In-Reply-To: <sashiko-outbox-171352@kernel.org> (sashiko-bot@kernel.org's
	message of "Wed, 14 Oct 2026 13:27:27 +0000")
References: <20261014131547.259138-1-pratyush@kernel.org>
	<sashiko-outbox-171352@kernel.org>
Date: Wed, 14 Oct 2026 15:39:10 +0200
Message-ID: <2vxzecdsiept.fsf@kernel.org>
User-Agent: Gnus/5.13 (Gnus v5.13)
Precedence: bulk
X-Mailing-List: sashiko-reviews@lists.linux.dev
List-Id: <sashiko-reviews.lists.linux.dev>
List-Subscribe: <mailto:sashiko-reviews+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:sashiko-reviews+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain

On Wed, Oct 14 2026, sashiko-bot@kernel.org wrote:

> Thank you for your contribution! Sashiko AI review found 1 potential issue(s) to consider:
> - [High] kho: incomplete fix for zero-size memblock allocations in bootmem
> --
>
> commit 67ab500bd948f5a3b52f1c8170626cb8f1dfc6c3
> Author: Pratyush Yadav (Google) <pratyush@kernel.org>
>
> kho: do not reserve empty per-node bootmem areas
>
> Some nodes do not allocate any early boot memory, causing memblock to
> return an address without reserving anything when requested with zero size.
> This address is recorded in kho_bootmem with a size of 0, and can cause KHO
> to fail to initialize. This patch skips bootmem reservation for memoryless
> nodes entirely.
>
>> diff --git a/kernel/liveupdate/kexec_handover.c b/kernel/liveupdate/kexec_handover.c
>> index 7018e25e4eda1..6f1f55fe31819 100644
>> --- a/kernel/liveupdate/kexec_handover.c
>> +++ b/kernel/liveupdate/kexec_handover.c
>
> [ ... ]
>
>> @@ -882,6 +882,9 @@ static void __init kho_reserve_bootmem(void)
>>  	 */
>>  	for_each_node_state(nid, N_MEMORY) {
>>  		size = bootmem_size_node(nid);
>> +		if (!size)
>> +			continue;
>> +
>>  		addr = memblock_alloc_range_nid(size, BOOTMEM_ALIGNMENT_BYTES,
>
> [Severity: High]
> This adds a zero-size check for per-node bootmem allocations, but does the
> same issue exist for bootmem_size_lowmem and bootmem_size_global?

Valid point, but that should be solved by the general bootmem sizing
patches being developed separately.

[...]

-- 
Regards,
Pratyush Yadav
