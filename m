Received: from mail-ot1-f48.google.com (mail-ot1-f48.google.com [209.85.210.48])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 335563769F9
	for <sashiko-reviews@lists.linux.dev>; Fri, 29 May 2026 22:37:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.48
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1780094254; cv=none; b=RuuFq930VNKzMBbdwlYIODqUjKDR/kWJxH/waNy4cXt58GNylLYbruTjRTRXPFhJbZZNhkt0XpCrosXQuR3gdqiPg03TWMqZNim8G9j75BVcignBAYkXjncDB7MUagl3m42HzZ6fSeeR0lu2xm9iCBihK9m3GrSz1oD1p49H4DI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1780094254; c=relaxed/simple;
	bh=FginVhoNglPXigc//BEnYWTzVxWWHnXA48qMiUZpl3A=;
	h=Mime-Version:Content-Type:Date:Message-Id:Cc:Subject:From:To:
	 References:In-Reply-To; b=PkdrIBDI1uZgb30BsQaUAWXO3DVi30fKaHMbBy8KFQmgAL6YduriTYHG42KwipPcRHEZi5H1xyyb7J1D1vwL0/a1PHJvMt7NFx4pDnQ8mMlCa03aTrQApSYFNYRkDnMW62K7JQ0CUwPvAtDkU3XX3p8THxYN2PQDTpgExeL6+vs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=NIi8tRBv; arc=none smtp.client-ip=209.85.210.48
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="NIi8tRBv"
Received: by mail-ot1-f48.google.com with SMTP id 46e09a7af769-7e6a306fec0so199059a34.0
        for <sashiko-reviews@lists.linux.dev>; Fri, 29 May 2026 15:37:31 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1780094251; x=1780699051; darn=lists.linux.dev;
        h=in-reply-to:references:to:from:subject:cc:message-id:date
         :content-transfer-encoding:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=X4KBaLHtpd4tBbBBMqaBEm/aPrD0ixQqzF08JWKnme4=;
        b=NIi8tRBvaRkxsVw5QVPuMkpI0oPNk5gtX7qpCKfR8JJae/JFuAbXGGGr1/jTXmBv0m
         lWicfPb8QArc11CzsBYk5V9Sgu6ufiVTH968xjsZy9aM4Ahdjp597LZh9uffpaQW1Bb3
         q1VoNroUjHx/VkRLWwCXUg3mBeTcenMrd+qUF39hA0e2NiygyLNtY1fUtt0AoGBqVeyD
         GJQBga4Se6M4nLQJxmowbD8F07amFy74ivY3T1PmTBO1r9k7bTeHCYZKGQniBuQtKAVf
         C1m0zIsFtqJzXgf8uWDp34QPrnRu40gaD1X10kDdCj5ZEmwflKhr28HPyziS4MDgcLeU
         u0NA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1780094251; x=1780699051;
        h=in-reply-to:references:to:from:subject:cc:message-id:date
         :content-transfer-encoding:mime-version:x-gm-gg:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=X4KBaLHtpd4tBbBBMqaBEm/aPrD0ixQqzF08JWKnme4=;
        b=CbTQkmvNcu5QpIFPNoc1guK4dnbUvncw6n3T1wscgq/SISFMijqRenG2HkwyczShaT
         GGuf3gG6NE8mtLYphztryoENIT50UBTkQeSKbxsNlM2cOmJg7mQrUqSrT8Y3CclJHFii
         jKKzlw869ScFzS6a03dChSRC3bLxxlXezaxqXfWF+jFb3gxgixpz1mEknKGllWhAZuMB
         QUyRmDIYnXSYjPRJqqjJfKDWQBhdad3wPbL2x83P2u6IRAX/rXwT9IFH533EAW5vGK8L
         YPAlHPySp8FJ3NVFJ39ziJIzuDW081XZ8ZlXp9XhANMCYIxxQemuBv8znBeWbIsT7eBz
         xamw==
X-Gm-Message-State: AOJu0YxcVRDq8bP5yAppnOCRgLZ7yGmQkUe1WMV9pb37sk3LRN7CM3NE
	+kKGNnpKV/j1W3mfAjtxYkuRuvA5g/9PrpHmERZJofBE3VNd9nF1QM78yFntfQ==
X-Gm-Gg: Acq92OHF541dfCsBIWMIgNGAIzemLBQh6UJ1q2FujJC3uM21wrRJBiedVzw9+ERTC+O
	8gDNPz65z/PhxayNhVoEbFDzquv+p9nHdbcV9VB9mhRA9dS3dLEJrKAppYPhqCkMOlGbCniibuK
	XmGvQPrYlbgR77Bb5kB0zWMcw3ltMoWqgaLHyeZ+5QJkoEaNyy8yRYvkedxRT2Gn+VuCcv7eMAg
	lhb4IONEhcr7oBDAA4LdL6aZHmEgk9I2K3A97XzDS3SHOJlZ/rrc/Uof0x17XoguPbp2J+rhhsx
	/NhaGzCiF5bTy9zpTq1E8CVGgtqAiIiTuKLhzkVs7nkbovGuztOrBa/lOpXBj9JuWz/+FINkFHh
	k8gusAGGGWyZCDwLbkiIP4z6/LLxNTjexoyK9KBboZ1jFzTV0Ng06LtBXGKKpuF22C4dqShvt3+
	3g4RmCLrptFMcfiuXR1vfexu3hPwaddzGQglfRQIVSybsivXIV0vyGhWsPT5z0CRSkDCw7ddQhi
	6BlXZdmYpx89Y6J4U5BRfdZ
X-Received: by 2002:a05:6820:2d0b:b0:696:7f3d:a75d with SMTP id 006d021491bc7-69e0ff718femr609756eaf.27.1780094251002;
        Fri, 29 May 2026 15:37:31 -0700 (PDT)
Received: from localhost ([2a03:2880:10ff::])
        by smtp.gmail.com with ESMTPSA id 006d021491bc7-69e067e911csm1753298eaf.5.2026.05.29.15.37.29
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 29 May 2026 15:37:30 -0700 (PDT)
Precedence: bulk
X-Mailing-List: sashiko-reviews@lists.linux.dev
List-Id: <sashiko-reviews.lists.linux.dev>
List-Subscribe: <mailto:sashiko-reviews+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:sashiko-reviews+unsubscribe@lists.linux.dev>
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Fri, 29 May 2026 15:37:29 -0700
Message-Id: <DIVIQWQ6F4JO.2R4XIOS9DDDS@gmail.com>
Cc: <bpf@vger.kernel.org>
Subject: Re: [PATCH bpf-next 1/4] slab: Introduce kmem_cache_alloc_nolock()
From: "Alexei Starovoitov" <alexei.starovoitov@gmail.com>
To: <sashiko-reviews@lists.linux.dev>
X-Mailer: aerc
References: <20260529202438.16408-2-alexei.starovoitov@gmail.com>
 <20260529212021.380AC1F00893@smtp.kernel.org>
In-Reply-To: <20260529212021.380AC1F00893@smtp.kernel.org>

On Fri May 29, 2026 at 2:20 PM PDT, sashiko-bot wrote:
> Thank you for your contribution! Sashiko AI review found 1 potential issu=
e(s) to consider:
> - [Critical] Deadlock in NMI context due to synchronous freeing on memcg =
charging failure
> --
>
> commit 831b8a379d6dfbde2570286ba8453174bc236695
> Author: Alexei Starovoitov <ast@kernel.org>
>
> slab: Introduce kmem_cache_alloc_nolock()
>
> This commit introduces kmem_cache_alloc_nolock_noprof() and its wrapper=
=20
> kmem_cache_alloc_nolock(). It is designed to allocate an object from a
> specific cache and aims to be safe to call from any context, including NM=
I
> and IRQ-off environments.
>
>> diff --git a/mm/slub.c b/mm/slub.c
>> index a2bf3756ca7d0..601986aaebdfc 100644
>> --- a/mm/slub.c
>> +++ b/mm/slub.c
> [ ... ]
>> @@ -5402,6 +5402,45 @@ void *kmalloc_nolock_noprof(size_t size, gfp_t gf=
p_flags, int node)
>>  }
>>  EXPORT_SYMBOL_GPL(kmalloc_nolock_noprof);
>> =20
>> +/**
>> + * kmem_cache_alloc_nolock - Allocate one object from a specific cache,
>> + * safe from any context (including NMI/IRQ-off), like kmalloc_nolock()=
.
>> + *
>> + * Returns NULL on failure (including the trylock paths that may transi=
ently
>> + * fail under contention).
>> + */
>> +void *kmem_cache_alloc_nolock_noprof(struct kmem_cache *s, gfp_t gfp_fl=
ags,
>> +				     int node)
>> +{
>> +	gfp_t alloc_gfp =3D __GFP_NOWARN | __GFP_NOMEMALLOC | gfp_flags;
>> +	void *ret;
>> +
>> +	VM_WARN_ON_ONCE(gfp_flags & ~(__GFP_ACCOUNT | __GFP_ZERO |
>> +				      __GFP_NO_OBJ_EXT));
> [ ... ]
>> +	maybe_wipe_obj_freeptr(s, ret);
>> +	slab_post_alloc_hook(s, NULL, alloc_gfp, 1, &ret,
>> +			     slab_want_init_on_alloc(alloc_gfp, s),
>> +			     s->object_size);
>
> [Severity: Critical]
> Does this sequence risk a hard deadlock if called from NMI context?
>
> The function permits __GFP_ACCOUNT, but if memory cgroup charging fails
> inside memcg_slab_post_alloc_hook(), it synchronously aborts the allocati=
on:
>
> mm/slub.c:memcg_slab_post_alloc_hook() {
>     ...
>     if (memcg_alloc_charge_slab(s, alloc_gfp, lru, p, size)) {
>         for (i =3D 0; i < size; i++)
>             memcg_alloc_abort_single(s, p[i]);
>     ...
> }
>
> This calls memcg_alloc_abort_single(), which immediately attempts to free
> the object:
>
> mm/slub.c:memcg_alloc_abort_single() {
>     ...
>     if (likely(slab_free_hook(s, object, slab_want_init_on_free(s), false=
)))
>         __slab_free(s, slab, object, object, 1, _RET_IP_);
>     ...
> }
>
> Both slab_free_hook() (via kmemleak and kfence hooks) and __slab_free()
> will attempt to acquire non-NMI-safe spinlocks like n->list_lock. If the
> interrupted context was holding these locks, wouldn't this synchronous fr=
ee
> cause a deadlock, breaking the "safe from any context" guarantee?

sashiko should have said that it's a pre-existing issue,
since kmalloc_nolock() follows exact same pattern.
Also patch 3 switches __slab_free() to use trylock.
So not really an issue.

