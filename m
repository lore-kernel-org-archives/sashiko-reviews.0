Received: from mail-ej1-f70.google.com (mail-ej1-f70.google.com [209.85.218.70])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E784A3C1405
	for <sashiko-reviews@lists.linux.dev>; Wed, 30 Sep 2026 11:33:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.70
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790767990; cv=none; b=bl2jDWOySwJnFYUxvQqGpgKq8IEzAZ+inbcdoJPXf4jUNFS/Eanz3lqr4WWbJR1DgSQRwO88KSmdk/nkvTbP27OVp9cvOZFTHSkpRMl+S+ljMbMc1tNHdySovtY+/FUrypes3SLj2ZDhHjuB+ipjvE73LLn7+GJdniPRM5X3ogM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790767990; c=relaxed/simple;
	bh=mqBff2HqWAYtURK1CZ+r882hiNCeMno5K9z5WNC9F2U=;
	h=Date:In-Reply-To:Mime-Version:References:Message-ID:Subject:From:
	 To:Cc:Content-Type; b=dWvMu8eWQ5g1UKaE7y+xmiKB0LO0J0jHRskDnOjxpwtt+Od3w+P70GMcmTWn/ywWt4P8NG+bpFumhX4p7zwGFcywiI2K6uf5P4jj1pc4NPIpLS1OyD1asUy3iHgbOZvsPisyMETZNdGjO0B5jUjF3rc/gWEZtUVhHANBLbg2reY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=flex--tarunsahu.bounces.google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=gkq84l8t; arc=none smtp.client-ip=209.85.218.70
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flex--tarunsahu.bounces.google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="gkq84l8t"
Received: by mail-ej1-f70.google.com with SMTP id a640c23a62f3a-c2d93b92937so343791966b.1
        for <sashiko-reviews@lists.linux.dev>; Wed, 30 Sep 2026 04:33:08 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20251104; t=1790767987; x=1791372787; darn=lists.linux.dev;
        h=content-transfer-encoding:content-type:cc:to:from:subject
         :message-id:references:mime-version:in-reply-to:date:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=MpduhbNkFUuFWigrQQWVYqgTBA32JDerhEvTpfLDHMk=;
        b=gkq84l8tqtpaYuPxd3WUY/trugP6sdXLfEu2GNqohNR/DOJYjP/gJOdbhAoJIcvtjE
         oUGD9dfEIzVgSSY9PZwWypBVWbd2uQrIHPCvhbdVPwSBQ6I8ZjhzzqxJiJMsjrzJKMXR
         hi8vAknBe8U0swPYt/7TnaV9/3g9VPz26b2YWUy2Sr4gEuGNStDKcHzDEbnYmRGFGqg5
         u8cPWyp1GVielJd9FifIjd3cenqJxntRlKeZEPnF03nJbTQ3wGWpC7rcZ9JtfRFoN+3A
         t7D3HdNw8u7JmLWs7+Yn850tSyCDpRts6CGCMxjeZzllxLP4yKd65HyTV1YJBQOosBjT
         MYkg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790767987; x=1791372787;
        h=content-transfer-encoding:content-type:cc:to:from:subject
         :message-id:references:mime-version:in-reply-to:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=MpduhbNkFUuFWigrQQWVYqgTBA32JDerhEvTpfLDHMk=;
        b=ahj1Qn2SFoQbnM4ZAyK9csLoLwYDQmsofRu87Vsfq29BZV2nTT3xBLPQseHOVRWupP
         l9xEuDwKEI2kqqwBdWESKYb1fPux7MAEhPdZG3g3fAqDetEuJN1xvksn/CReJwSVL1Ds
         +OYc/KZMFOUoV5VIrx3Rg1MKNNzNenFDQShrKmqUBibYOhmhhHv/nEw/HMUch03dkFWq
         AYNbQCAUoFBGPNJlrheCBGIMiKZgEOZQzqnsK9hIN40dbrcxowp+am9eenKpImFR+NMS
         mTbpRcaRyxs+aFzHMXxTms+dqi0mZj6llax+cTrRWv/y8KOu59Ng9Ip4DikDEViZ34kG
         AHvQ==
X-Gm-Message-State: AFuF++n4Jf50NrrRqGMcsOko85KnbzUpGcjedwykMIsqVw8Pt4xNu0tD
	VO1n8C/5Sghk0xqpWAWqzD2p7RdbMtvuyrP8kNBzKVxp6vNaVeXFUs9S7Ztmdmsah/7DTZu3lqK
	JtFroaA2+sbH/HxKrTVjT/q/gfc2owEylVuOwQIQ0zXFpjedqYzax5nOQyk6r1jFBXsHA395/Oj
	DoyVKVMMbySLz4bd4+IWZCxSwBQNtfLR6JX5nEYn/TEm6ms5amB4wk3PTJJk1EY/Sj
X-Received: from ejcfs31.prod.google.com ([2002:a17:907:601f:b0:c2d:46db:167a])
 (user=tarunsahu job=prod-delivery.src-stubby-dispatcher) by
 2002:a17:907:3e1a:b0:c25:2d27:5652 with SMTP id a640c23a62f3a-c2e23cae407mr82433966b.11.1790767986551;
 Wed, 30 Sep 2026 04:33:06 -0700 (PDT)
Date: Wed, 30 Sep 2026 11:33:05 +0000
In-Reply-To: <20260926093200.5727C1F000FF@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: sashiko-reviews@lists.linux.dev
List-Id: <sashiko-reviews.lists.linux.dev>
List-Subscribe: <mailto:sashiko-reviews+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:sashiko-reviews+unsubscribe@lists.linux.dev>
Mime-Version: 1.0
References: <20260926092448.4090401-1-tarunsahu@google.com>
 <20260926092448.4090401-2-tarunsahu@google.com> <20260926093200.5727C1F000FF@smtp.kernel.org>
Message-ID: <9huzfqyrrn2m.fsf@tarunix.c.googlers.com>
Subject: Re: [PATCH v3 2/2] memblock: use binary search to locate candidate regions
From: tarunsahu@google.com
To: sashiko-reviews@lists.linux.dev, dmatlack@google.com, 
	Pasha Tatashin <pasha.tatashin@soleen.com>, Andrew Morton <akpm@linux-foundation.org>, 
	Mike Rapoport <rppt@kernel.org>
Cc: kexec@lists.infradead.org, linux-mm@kvack.org, 
	Pratyush Yadav <pratyush@kernel.org>, linux-kernel@vger.kernel.org, dev.jain@arm.com
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: quoted-printable

sashiko-bot@kernel.org writes:

> Thank you for your contribution! Sashiko AI review found 1 potential issu=
e(s) to consider:
> - [Medium] mm: commit message falsely claims O(N log N) worst-case comple=
xity
> --
>
> commit ffd047af563941b5aabcd86a52d569f9b40c01ec
> Author: Tarun Sahu <tarunsahu@google.com>
>
> memblock: use binary search to locate candidate regions
>
> This commit introduces a binary search helper, memblock_bsearch_start(),
> to optimize finding candidate regions in memblock_add_range() and
> memblock_isolate_range(), aiming to reduce boot-time overhead during heav=
y
> memory fragmentation.
>
>> Under heavy memory fragmentation (such as KHO page preservation register=
ing
>> hundreds of thousands of disjoint folios), scanning from index 0 on ever=
y
>> insertion and isolation results in O(N^2) complexity, causing boot-time
>> memory retrieval to take several minutes (~268s for 393k pages).
>>
>> Using binary search reduces the worst-case complexity to O(N log N)
>> (and O(N) for sequential appends), cutting KHO memory retrieval time
>> from ~268s to ~50ms.
>
> [Severity: Medium]
> Is the claim of O(N log N) worst-case complexity mathematically accurate =
here?
>
> While the binary search reduces the time to locate the insertion index to
> O(log N), the regions are still stored in a contiguous array. If disjoint
> memory regions are inserted in an order that requires inserting into the
> middle of the array, the subsequent elements still need to be shifted.
>
> Looking at memblock_insert_region() which is called during insertion:
>
> static void __init_memblock memblock_insert_region(...)
> {
>         ...
>         memmove(rgn + 1, rgn, (type->cnt - idx) * sizeof(*rgn));
>         ...
> }
>
> Because this memory move operation guarantees the worst-case complexity o=
f a
> single insertion remains O(N), wouldn't inserting N disjoint regions in
> descending or scattered order still result in an O(N^2) worst-case time
> complexity overall?

Right. Here is the analysis below

KHO preserved regions is sorted in incremental order. So searching the cand=
idate
is O(1) and insertion cost is O(1). So for N insertion is O(N).

for random regions, worst case (invertedly sorted)
Total Cost:
     Sum(log(i) + i, i=3D0, i=3DN)
     OlogN! + O(N(N+1)/2) ~ O (N^2)

hence, sashiko is right, So how can we improve this:  we cannot.

Incoming regions can overlap and there can be already present
regions in memblock_reserved array that might overlap with incoming
regions. So, only possible solution is one-by-by insertion. So here,
finding the location for insertion using binary search is best we can
do with linear arrays.

As KHO is the only user of having large reserved regions which are
sorted, Patch fulfils its purpose. I will update the commit msg to
correctly populate the time complexities.

~Tarun

>
> The described KHO workload sequentially appends regions, which avoids the
> shifting overhead and achieves O(N) overall. Could the commit message be
> updated to clarify that this patch improves sequential insertion to O(N),
> but the worst-case for fragmented insertions remains O(N^2) due to the ar=
ray
> shifting?
>
> --=20
> Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260926092448.40=
90401-1-tarunsahu@google.com?part=3D2
