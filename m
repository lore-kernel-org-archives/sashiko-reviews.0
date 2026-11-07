Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.221.52
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1794039602;
	b=3Y9X7aZTT0yUkgj3oul25l/eOQGEGJm4r1y6KMgLUoAISn6mEyNJ4iyJh1SYrRq88PEA
	 08gyOh5EI6EaYBuL36lHLy/kBU20U+AkhT0BDTZ6dz9KUdacaz3oH9Py81LmA/S1m1hnz
	 OPvQ4eteCdTEUK9v0mhZskhLo3JfMjovmLm47hj3tgK6hvuiUH0QR+jqMHpJUdvXsY0+D
	 K4FkWBc9fKCQt/bC6py/sCblrZR3uZ2LhPIi3sF9LQBf5dxAikVPvySE0PzPBlS6SjqDa
	 oT6InNfAKxWrfGpk9y2K77pV4UO27f97QtVIBjslY+M9LFMyyURXQryAevn2MHT3RDA==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794039602;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:MIME-Version:References:
	 In-Reply-To:From:Date:X-Gm-Features:Message-ID:Subject:To:Cc:
	 Content-Type;
	bh=BWwZfF80258/+F+GHEmqApJo8cN5FKx3RYuWlNDDhXY=;
	b=K55/Gbh0ASDcpuWgC5+NaQ7PI9gaIkCLQ5brBYXpxML0Y5R5R6pjR2av269qhEiXVSkc
	 l1v8Nqw6EHVN/6MHEhHiV4dQyshZ7YRiIO45JDfCuSuE4v2lwb6BbmD2xDm1/zUs/Ip4A
	 Lgty4ZwY/3PXs0DI52obLNxdOa5TFs2hW5HJxDxFMjQxAAqLxgLUC42WjwWwG59WMKceu
	 NdJPpKq8eU3SgEovsACQoVZRfpPhZwfouDR0Iy+iNl+dXFowTQf06zkWkUFPuToCcdc9j
	 W0Ib1UDky8nCmCyQzOjosPSBC+y29ILdgOkW4XUj3/CDEjCL2NjNh1YI8xDjQ0yysNw==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=qCjVsbY3;
	arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.221.52
Received: from mail-wr1-f52.google.com (mail-wr1-f52.google.com [209.85.221.52])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C9D2F606A326
	for <sashiko-reviews@lists.linux.dev>; Sat,  7 Nov 2026 08:20:01 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org C9D2F606A326
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=qCjVsbY3
Received: by mail-wr1-f52.google.com with SMTP id ffacd0b85a97d-48e47347279so776625f8f.1
        for <sashiko-reviews@lists.linux.dev>; Sat, 07 Nov 2026 00:20:01 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1794039600; cv=none;
        d=google.com; s=arc-20260327;
        b=Th3RbXwoUgj+NIm3kN+9F3WfYFtdPQ2rt+i/h5IZOJNstKf/60bcxbuU4y74klh8f5
         qTSb4pqOW+xgj5+14nrWAuuI0SR5M/PdaxsA61Fscua3Qi1J/WbUvhhRtsJTFvh2Th/6
         NOa0jZUb0Was4nQAE59S2ebJ/MMTH48Lqe5ENfLu4IeZmn8wPqlHYx/OqmpDeHUXqLXg
         EURLM7hDMXxBvEE/JV0Y0IeFb5QggUhyCR8xfde7IPPtQNtyD9XXRYUCnbeo5rVEGfHf
         V8aXp4/GBdaPwhuxRzOWjKYDKLYEOLxWVMKbsAqXnraroHY3asrJCEWhoglUxMmJSnzH
         iudg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:dkim-signature;
        bh=BWwZfF80258/+F+GHEmqApJo8cN5FKx3RYuWlNDDhXY=;
        fh=rqHhackACu+shRfvmHC74oWZ5M5C/pKvq2iZ66Lq2VA=;
        b=WTR3iLXJg+qwBoheLt2QLtMqpjNtAZ9NIIj5yRP0fxnEQ1UpQXlAaIhUPBEnlQqWHS
         9Q0fw/rWw+MLDPXhcpjXkEMuqoPdrivIU12dXVYrG6CwAD81PLMBRORa33wCdZYPrhiw
         IThuH6Q3zqRBBCz4OTwc4ZvcUxIitisqBF8xXUiQWquMi6swoqDIFBkjJQwEtkxslBU8
         v9XFm+76Fk28+RULIvRMsuQ2+mHvoWwwt4yVT4xw0c+D4QA7jzNVPZIdew43+ilRaOD+
         3xVfOZo4iEeiaJCz58P0xVod28Y2zNiYqkz6L9sc+LRAgjWAkwKZVsq5r0FpPQ0RKyQQ
         F3Xg==;
        darn=lists.linux.dev
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794039600; x=1794644400; darn=lists.linux.dev;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=BWwZfF80258/+F+GHEmqApJo8cN5FKx3RYuWlNDDhXY=;
        b=qCjVsbY3l8dLNVmymFUDr5PB5tOQ+stq97iOL2I4qRBujjCt6WtgGqNxCpJ7EOkWVx
         HSGBA8G83RAm5qkU0W4JdQKwichWXcbnS3JjX2p1jcs+x2fl4f+jMobVRvp6WoAPLxbw
         w7yZ6k6QTLTaWpQYc26HUknlp2phfzMsmAtFC2ynonhYM1cVLxobWRqVXEMW375Svpnq
         EgnqknOYIpmB5MVC3JhKJujarNLN33KPhwILbk7dpKvBpdZOJbITYlVmXQt68z6XVfEi
         2suZEZXRgkzCPrDg8VFR5NaFsdYtvLeL81IF09fPG1kbW+eA1xZWCcdHGNIeptZJg/Uo
         iDEQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794039600; x=1794644400;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=BWwZfF80258/+F+GHEmqApJo8cN5FKx3RYuWlNDDhXY=;
        b=F20MqgRiB0WccWOmLiyXvIVtQ8azwP/R9UaRE/rpYLYpYoR3PIISp8h3/nrrE1ZqO0
         smvIIqGGSXJsxC8/6cAdZgMyZSAJ/bT9BnUMmxeDs1+nDOuylE9DtnBrju4FEUac+GVg
         XOdyCYnaCDZz+i3Sv4R2yjo4Vnc3NfuvEQmI/EtDnwqTaXU+mQHFwEvpfMne0aRpwkeQ
         6QhhSnSuDBVrGBKDBxoaNQahpKux1nvhTAB5iYl9O6JVzJ6gHqDV174EaCZoPcWtXqcl
         g3kiOD/gxQxuQEXZg8PsQhhFnPB8GEtVP/WRGtrnJfTgs0eEti1kus8VaVNxhw29xrKR
         DvyA==
X-Gm-Message-State: APuU4Z/JkQqIejsPeNP9MgntWJxFx79E3Ro92KaSnFrvBTHL8pThA7xr
	M0hP8bGuunsLj8MUaQtvJa0Ow9ONz8ghy7NRa+m+eQzOL4np3BsnBr6ZuDaSMZPPd3hf4Y+aGvF
	zjJVf25Ytw3Pl8Bvh66U+0Rhb8zO6YhxbEPkrD88=
X-Gm-Gg: AYBFou3jnTx49y2QvgIrUIXCBFxzknoFFPjtPmSrrupKWGdulPjPjB/RKgxbEp2/Zlk
	1wYjGYi2+nmiWMBTUh/r6LYr14iSwvm0XbDhblXe/SIp+vXIBpG6+V3L+8HX9ukOCDno1W8A7Ck
	XIVM5a4uIsm6AxnqEmEXk+yamBzjjg0HnEgpNg3+NbWLcGiisCIHCd5BGCl5r2pgIOMI+cvJAno
	Ap6BLEkPJzAn/4cnQJpJREXbc8DC3vz0y76PQ+DeV6m1iFvKQjaWYL/FmTpGkL33+UvhEwefl7U
	NNQfc6bS2tR+7pHYukxiAzlc0WlkaoV8dAoeIgVDsA1wDzFc8n0TnSRnoSALoBOHqrPieamqlEm
	7Q+QTG8k7ZXHP2I/yTBrma81Ag5uqii2Wiy6F6Q==
X-Received: by 2002:a05:6000:400a:b0:48d:cda6:4dd7 with SMTP id
 ffacd0b85a97d-4927f78fe8cmr9200523f8f.44.1794039599942; Sat, 07 Nov 2026
 00:19:59 -0800 (PST)
X-Mailing-List: sashiko-reviews@lists.linux.dev
List-Id: <sashiko-reviews.lists.linux.dev>
List-Post: <mailto:sashiko-reviews@lists.linux.dev>
List-Help: <mailto:sashiko-reviews+help@lists.linux.dev>
List-Subscribe: <mailto:sashiko-reviews+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:sashiko-reviews+unsubscribe@lists.linux.dev>
List-Owner: <mailto:sashiko-reviews+owner@lists.linux.dev>
Precedence: list
MIME-Version: 1.0
References: <20261103101658.766905-1-jiangwenxiaomi@gmail.com>
 <20261103101658.766905-10-jiangwenxiaomi@gmail.com> <sashiko-outbox-197081@kernel.org>
In-Reply-To: <sashiko-outbox-197081@kernel.org>
From: Wen Jiang <jiangwenxiaomi@gmail.com>
Date: Sat, 7 Nov 2026 16:19:48 +0800
X-Gm-Features: AclHuK8xVs7cZe9aVBZpOoOS5AW56CL1lPNfImzX0W7yFxv2KA4L34W4gYXh93Q
Message-ID: <CAHKocdED6i52rn38qsWOFwEF=kYZ54iqoqg4fHCk_n5Cso8Ahw@mail.gmail.com>
Subject: Re: [PATCH v11 09/10] mm/vmalloc: map contiguous pages in batches for
 vmap() if possible
To: sashiko-reviews@lists.linux.dev
Cc: akpm@linux-foundation.org, catalin.marinas@arm.com, linux-mm@kvack.org, 
	urezki@gmail.com, will@kernel.org, Xueyuan Chen <xueyuan.chen21@gmail.com>, 
	ajd@linux.ibm.com, anshuman.khandual@arm.com, baohua@kernel.org, 
	chleroy@kernel.org, david@kernel.org, dev.jain@arm.com, jiangwen6@xiaomi.com, 
	leo.yan@arm.com, maddy@linux.ibm.com, mpe@ellerman.id.au, npiggin@gmail.com, 
	rppt@kernel.org, ryan.roberts@arm.com
Content-Type: text/plain; charset="UTF-8"

On Wed, 4 Nov 2026 at 18:19, <sashiko-bot@kernel.org> wrote:

> [Severity: Critical]
> Can vmap_pages_range_batched() overrun a physical chunk and map unowned
> physical memory when a coalesced batch of same-order chunks straddles a PMD
> boundary?
>
> [...]
>
> Should get_vmap_mapping_order() also bound the mapping order by the virtual
> address alignment of the current page or by the supported architectural map
> size?
>

Confirmed, this is a real overrun, and the same root cause applies to the
Critical findings on patches 05 and 10 as well. The batched walk coalesces
physically discontiguous chunks, and when a PMD boundary splits such a batch
in the middle of a chunk, the resumed PFN is still CONT_PTE_SIZE-aligned, so
arch_vmap_pte_range_map_size() maps past the end of the contiguous run.
I'll clamp each mapping in vmap_pages_pte_range() to the remainder of the
current chunk, so it never crosses a chunk boundary. Bounding the order by
VA alignment instead would split large chunks into smaller orders and
defeat the batching.

> [Severity: High]
> Could switching vmap() to vmap_pages_range_batched() without setting
> VM_UNINITIALIZED on area expose a race with vread_iter() when a PMD is
> promoted to a huge page?
>
> [...]
>
> Should vmap() set VM_UNINITIALIZED when allocating the vm_struct and clear it
> via clear_vm_uninitialized_flag() after vmap_pages_range_batched() finishes?
>

Confirmed. vmap() can now promote a PMD to huge via
pmd_free_pte_page() while vread_iter() walks the page tables without the
mmap lock. I'll set VM_UNINITIALIZED when allocating the area in vmap()
and clear it with clear_vm_uninitialized_flag(), as
__vmalloc_node_range_noprof() already does.

Both will be fixed in v12.

Thanks,
Wen
