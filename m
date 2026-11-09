Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=91.218.175.138
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794191873;
	b=LoAQlxrzq6rgKnuuMuoTDftvi0m+X7oxue8PPyb5Xwei05kDFxrmb0vBtZc79LcZmItZ
	 jDpROAC0LBltEodADYfdZPOZSf6PVC0YSs4Ip4wnR5hlM/o3MN8ev2U708Gaqg+Xv16WV
	 t00N2hUb/9Y5xw+cdIGjF6ilVnVjqqiXcg1PbIxR99asOnwQpx6inFkrC3r34eY4QlBKf
	 0Hb8Z5AayV4Lbg+I3EwH3Y9pTQbV08/lJeRhiFi1sVOYFQmMraPh6PquYmhyyevtUlFS7
	 dNTsjfUtHovzShou6YBQ4ixnJWjKjws7qjaf4wj9SWRfQVd15Tkz7Cc+ck655+zPTSQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794191873;
	h=DMARC-Filter:X-Envelope-To:DKIM-Signature:X-Envelope-To:Received:
	 X-Mizu-Trace-ID:X-Migadu-Flow:Message-ID:Date:MIME-Version:User-Agent:
	 Cc:Subject:To:References:From:In-Reply-To:Content-Type:
	 Content-Transfer-Encoding;
	bh=AEGX0/KL7mXbSaJY8zHxrw7A5L4IFOgbizn++kyw2IE=;
	b=wHNgS2YxaN8zlX514OriKuRWOkjKO85sU4mF08ZUdyiCvklvINO6GlC8tiO4hAq9KFpv
	 DSfJdl0oy8j+w5FAl05TpCFzHRtxHvlKs8YLyeClPQPWXTGza9h561o8P5DonioMOorFz
	 6SAEAF+zBZRo8NvB2NPyYnz08j9h9G/kD+n+UGdoBCwWAGGunwqE4gSGzaQdAUHAR3YrN
	 XbG8piZUliwS0lqshRAmHgxzLwp8Fu6Xdf60jPVNFWX9CL9ADpWtE+o/VCnmjgBm3fzCZ
	 U7JIdkoJYaaW3v9U41Jdh92N8EHKTTYOujixmo2pn2mGzV6keEZH/cCPNoez8EfiUPA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=linux.dev;
	spf=pass smtp.mailfrom=linux.dev;
	dkim=pass header.d=linux.dev header.i=@linux.dev header.a=rsa-sha256 header.s=key1 header.b=vauqIkAN;
	arc=none smtp.remote-ip=91.218.175.138
Received: from mta0.migadu.com (out-138.mta0.migadu.com [91.218.175.138])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DB13B606A323
	for <sashiko-reviews@lists.linux.dev>; Mon,  9 Nov 2026 02:37:52 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org DB13B606A323
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.dev
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.dev
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key, unprotected) header.d=linux.dev header.i=@linux.dev header.a=rsa-sha256 header.s=key1 header.b=vauqIkAN
X-Envelope-To: sashiko-reviews@lists.linux.dev
DKIM-Signature: a=rsa-sha256; bh=BSLLWUjqysUniWqaKos+1oTfbUDYuJJnNJuIc0pgFwo=;
 c=simple/simple; d=linux.dev;
 h=from:to:subject:date:message-id:mime-version:content-type; s=key1;
 t=1794191870; v=1; x=1794796670;
 b=vauqIkANN+q42z17CGTn9b4GpvGzznQmmNmhzHxYy2szdcI/M8jNj6bt3x3IrCsJjXaqk7L0
 mIgZD/QQ2jQstVSLhW9OvNQL/LnsVCVcTlOMemYJq53/Jqn74WGyV8QrBI97jxLaS57x1E2NDhc
 5PlepZv8GsoucrFf+uPcfe6g=
X-Envelope-To: sashiko-reviews@lists.linux.dev
Received: by smtp.migadu.com with ESMTPS id d646f8317d3d17bd;
	Mon, 09 Nov 2026 02:37:50 +0000
X-Mizu-Trace-ID: d646f8317d3d17bd
X-Migadu-Flow: FLOW_OUT
Message-ID: <16b5464d-d4a2-420e-9de0-2ccddb860e3b@linux.dev>
Date: Mon, 9 Nov 2026 10:37:34 +0800
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
Cc: cui.tao@linux.dev, linux-mm@kvack.org,
 James.Bottomley@HansenPartnership.com, sumit.semwal@linaro.org,
 christian.koenig@amd.com, phasta@kernel.org, joro@8bytes.org,
 will@kernel.org, linux-scsi@vger.kernel.org,
 dri-devel@lists.freedesktop.org, kvm@vger.kernel.org,
 virtualization@lists.linux.dev, linux-trace-kernel@vger.kernel.org,
 bobbyeshleman@meta.com, mathieu.desnoyers@efficios.com,
 robin.murphy@arm.com, mason@kernel.org, aesteve@redhat.com,
 tjmercier@google.com, harry@kernel.org, vbabka@suse.cz, cuitao@kylinos.cn,
 media-ci@linuxtv.org
Subject: Re: [PATCH 6/7] io_uring: account the ring context and SQPOLL thread
 data to memcg
To: sashiko-reviews@lists.linux.dev, akpm@linux-foundation.org,
 dgilbert@interlog.com, mkp@kernel.org, loberman@redhat.com,
 jmeneghi@redhat.com, kraxel@redhat.com, vivek.kasireddy@intel.com,
 mst@redhat.com, jasowangio@gmail.com, eperezma@redhat.com,
 stefanha@redhat.com, sgarzare@redhat.com, rostedt@goodmis.org,
 vdonnefort@google.com, mhiramat@kernel.org, jgg@ziepe.ca,
 kevin.tian@intel.com, axboe@kernel.dk
References: <20261106131829.3228926-1-cui.tao@linux.dev>
 <20261106131829.3228926-7-cui.tao@linux.dev>
 <sashiko-outbox-202923@kernel.org>
From: Tao Cui <cui.tao@linux.dev>
In-Reply-To: <sashiko-outbox-202923@kernel.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

Hi,

在 2026/11/7 21:27, sashiko-bot@kernel.org 写道:
> Thank you for your contribution! Sashiko AI review found 1 potential
> issue to consider:
> - [Low] io_uring: commit message omits rsrc and tctx changes and
>   uncharged allocs
Thanks for catching this.

You're right that the changelog should better match the actual changes.
Besides io_ring_ctx and io_sq_data, this patch also switches the
allocations in io_coalesce_buffer(), io_init_wq_offload(), and
io_uring_alloc_task_context() to GFP_KERNEL_ACCOUNT.  I'll mention
those explicitly in v2.

You're also right that "the last per-ring allocations" overstates the
current state.  Patch 7 still leaves some infrastructure allocations,
such as the percpu pieces and the io-wq cpumask, unchanged.  I'll drop
that wording and instead describe what this patch accounts and what
remains.

As for commits 075d5837bafc and 0b34e7b20a48, this series is based on
linux-next (next-20261104), which already includes the
io_uring-7.4-20261029 tag containing those commits.  If the review is
performed against a tree without that tag, those objects will indeed
still appear uncharged.

Thanks,
Tao
> --
> 
> commit 3d47975c4208930279f98824279734ca99b5e9bd
> Author: Tao Cui <cuitao@kylinos.cn>
> 
>> io_uring: account the ring context and SQPOLL thread data to memcg
>>
>> The io_ring_ctx and the SQPOLL io_sqd are the last per-ring allocations
>> made with plain GFP_KERNEL.  The larger surfaces around them are
>> already charged: io_mapped_ubuf and io_rsrc_node since commit
>> 075d5837bafc ("io_uring/rsrc: charge buffer arrays and nodes to memcg"),
>> the tctx node and its XArrays since commit 0b34e7b20a48 ("io_uring:
>> charge tctx nodes and personalities").
>>
>> Charge the context and the SQPOLL thread data the same way.
>>
>> Signed-off-by: Tao Cui <cuitao@kylinos.cn>
> 
> [Severity: Low]
> Does the commit message match the actual changes and current tree state?
> 
> Alongside io_ring_ctx and io_sq_data, the patch also switches new_array in
> io_coalesce_buffer(), ctx->hash_map in io_init_wq_offload(), and
> io_uring_task in io_uring_alloc_task_context() to GFP_KERNEL_ACCOUNT without
> mentioning them in the subject or changelog.
> 
> The changelog also says these are the last per-ring GFP_KERNEL allocations.
> While commit "io_uring: account the remaining per-object allocations to
> memcg" later in the series converts io_alloc_cache_init() and io_wq_create(),
> percpu_ref_init(&ctx->refs, ...) in io_ring_ctx_alloc(),
> percpu_counter_init(&tctx->inflight, ...) in io_uring_alloc_task_context(),
> and alloc_cpumask_var(&wq->cpu_mask, ...) in io_wq_create() still use plain
> GFP_KERNEL.
> 
> Finally, the cited commits 075d5837bafc ("io_uring/rsrc: charge buffer
> arrays and nodes to memcg") and 0b34e7b20a48 ("io_uring: charge tctx nodes
> and personalities") are not present in the base tree, so io_alloc_imu(),
> io_rsrc_node_alloc(), io_tctx_install_node(), tctx->xa, and
> ctx->personalities remain uncharged.
> 

