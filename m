Received: from mail-ed2-f29.google.com (mail-ed2-f29.google.com [74.125.228.93])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 201834DE716
	for <sashiko-reviews@lists.linux.dev>; Mon, 28 Sep 2026 14:41:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.228.93
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790606498; cv=none; b=S8lekM8yv3mmpw0RuMjcMButi5XcWpjlkaP8RgeveP7HFFGhYsf3IMDsLMfquwT0+5QK0lBD/g4zmVZXFXl/43RGYbDbi08m1AFouu/NRLvBPRIAoFlyCZujICAyDfjxHWrbGrhaN24Sk/uYHuwVRopLJnahUlITAZ+xMgq2M94=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790606498; c=relaxed/simple;
	bh=r1C08sQk0GHVIvDGj1//j8XkroBMKx8uoljNRrjhUSY=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=I9gmqPI7Av9KhycqebGlWGQex1ZqVNNiivxXOVcPx8OB/y6tB0v9sszHx83wJur+36Rd/tTyT+4OhiLjpvbBJgSUOL6wQyIUgL/R5Sg0F4HVTtKRoHIyh+0+9zcrl3Z04/Mcoo80kfvjPRpGLDpmgeOCTBMYQsQolF5dugfHE7M=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=rhRLxE17; arc=none smtp.client-ip=74.125.228.93
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="rhRLxE17"
Received: by mail-ed2-f29.google.com with SMTP id 4fb4d7f45d1cf-6aa0ee64afdso3633783a12.0
        for <sashiko-reviews@lists.linux.dev>; Mon, 28 Sep 2026 07:41:33 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1790606490; x=1791211290; darn=lists.linux.dev;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=gdKbC3riLBZ98r8oodQbbP8SrsBHoTyLl7tB6yhXYEA=;
        b=rhRLxE17+rLMfp8HeO8Dbm7q5IoCUNeuSJkL+IbgAR3IpEoeqanoW8fvYi2tT4VZuJ
         txsSod9s97cbFziYxPunMDzWxY2H1tXSkt6+t4oFgO/EiGDgeu0s7L0iek0nNgJYiuBh
         gneP6yAB/Ezl8figyazegt+4EMeBS+6Ti3LvcqZtP5101eBYLhKao6PqAJxQ+T+CL4uY
         pKm8CpiPARZ49bnoRcXlaaUFHBDoYXGQmqSF46FyWM58ZWo+du9IH3P7h1P4Ti0aXhg7
         L/FXuU9VjdYGFokUU7XC3JtMoUn8DuuM3MBx/VV2jO67NtpMmL7Leb6Q+CoGYeH5aAik
         z9CA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790606490; x=1791211290;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=gdKbC3riLBZ98r8oodQbbP8SrsBHoTyLl7tB6yhXYEA=;
        b=X9PJXT/enc3nhN7kcdI63JjQ9D7MR/+CcKBaHOEt2h/wPfQBsOuNVzY9fpR6UEmN/z
         ueteAdCCdJq/boPT/cLDZl1X1I9CKWUlHrj5yuTldNSI/fdfDUNK3r31XNUZkSRrcbpo
         cT5FzlECkAYXO0v0jzl/jX8c9qhpkGLrx/Bjhjy5wqkx9VlVmphHRl8nTGCio4nMF8Mv
         GfzGYxObngnyTRSFU/4eobIuNcndno+xeEhBaE4EYO6NsFVnMnhRa6kNOjNo9iZ9L83Y
         Q2TFeX5eScbA/TVQoZGkHCJIek0jKZ5Tv2t8dpHgK7BHP01rLcYgib/3w0/ay35bnuKP
         Lxug==
X-Gm-Message-State: AFuF++nzfkYciLxTPkR918r7r72zzKgH+9cU249idBwAtDxSHl6Nssh0
	N6PVzf9R16zhLYGeoahdYv7Zhf/YqnD09hMuwjG8EO3lNNlJz7Kp34bLviQruw==
X-Gm-Gg: AYBFou2Ix9GJV3kFW+ZIWiq1XxwzVb8o2yec+4czvjjDrWcEH5paIroGAa1tIEjcjsZ
	AS2JnP0QTK1m6HG7wmUWnMOoZ3ywDEYf8gWPQ4bBZnwU8VzT19OLHJ8PMCnZXFkId8CObAgo8EA
	jXTeV23yYFlpIQDeEtWPUq2m9PkgfULAdwuY922DPXuCub3uRCnVtWRC0xXOGJxdHVR65qRlUh8
	hf+C4YMHhmKkeR95Y5Gk6hLuJUxavR+5FQomh/aUa2+Inyv8CjeXZzTk3eS0R+P8kNnGaAI3wd+
	DvLl69gvt7pB7eIXX43s4zWCEuM3p4Yta0D8yELHRTlCOB0QYti+v/phv3yCdqWCTBbJAFTYuXs
	HHcGE/o27/IVmk+4Cz+/6Yr7rySU4buB9sEm+J0zKK6DIvK46KgALjVmxjXN6qjYLU5sH1v8dqI
	3iwNjVvitz5Jr/9bBXWycBoKOAhHSd7h/4dlY/HlZH1HU5pqFivezTlAzfdcJZzi06OfpBA9yUH
	hHBchiWhdmyVK3RlCFg/3FviBpNuzF1ZwWMErA2ZM4PlFejtRkZSlRSaEiI/Kl+S5aWWICF6NLU
	hJpRIJ0Yi7RxaYDKN1KCXzfJCVAooEBnbtgrSayiqHutHESz
X-Received: by 2002:a17:907:7b8c:b0:c2d:c33d:a9d4 with SMTP id a640c23a62f3a-c2dc33dada2mr388838266b.10.1790606489807;
        Mon, 28 Sep 2026 07:41:29 -0700 (PDT)
Received: from ?IPV6:2a01:4b00:bd21:4f00:7cc6:d3ca:494:116c? ([2a01:4b00:bd21:4f00:7cc6:d3ca:494:116c])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-c2b769429ddsm355555066b.51.2026.09.28.07.41.28
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 28 Sep 2026 07:41:29 -0700 (PDT)
Message-ID: <38f81e58-44ca-4fe6-ba72-97557b7625e9@gmail.com>
Date: Mon, 28 Sep 2026 15:41:28 +0100
Precedence: bulk
X-Mailing-List: sashiko-reviews@lists.linux.dev
List-Id: <sashiko-reviews.lists.linux.dev>
List-Subscribe: <mailto:sashiko-reviews+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:sashiko-reviews+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v7 06/13] nvme-pci: implement dma-buf backed requests
To: sashiko-reviews@lists.linux.dev
Cc: media-ci@linuxtv.org, dri-devel@lists.freedesktop.org
References: <cover.1790602223.git.asml.silence@gmail.com>
 <e99dd5221c71cbf9aafb5737468d814cb83b9174.1790602223.git.asml.silence@gmail.com>
 <20260928140208.0C56B1F000FF@smtp.kernel.org>
Content-Language: en-US
From: Pavel Begunkov <asml.silence@gmail.com>
In-Reply-To: <20260928140208.0C56B1F000FF@smtp.kernel.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 9/28/26 15:02, sashiko-bot@kernel.org wrote:
...>> +	nvme_dmabuf_map_sync_for_device(nvmeq->dev, req);
>> +
>> +	if (length <= 0) {
>> +		prp2_dma = 0;
>> +		goto done;
>> +	}
>> +
>> +	if (length <= NVME_CTRL_PAGE_SIZE) {
>> +		prp2_dma = dma_list[map_idx];
> 
> [Severity: Critical]
> Is map_idx checked against map->nr_entries here?
> 
> If dmabuf->size is 4608 bytes, nr_entries is truncated to 1, allocating 1

It'd be rejected, not truncated, see below.

> array element. Userspace could submit a 4608-byte IO. The driver calculates
> 'length' up to 4608 and advances 'map_idx' to 1 for the remaining 512 bytes.
> It reads 'dma_list[1]' (which is out-of-bounds) and uses it as 'prp2_dma',
> potentially resulting in arbitrary physical DMA (read or write).
> 
>> +		goto done;
>> +	}
> 
> [ ... ]
> 
>> +free_prps:
>> +	iod->cmd.common.dptr.prp1 = cpu_to_le64(prp1_dma);
>> +	iod->cmd.common.dptr.prp2 = cpu_to_le64(prp2_dma);
>> +	nvme_free_descriptors(req);
>> +	return BLK_STS_RESOURCE;
> 
> [Severity: High]
> Does this code leave iod->nr_descriptors greater than 0 on the error path?

I can clear it, but unless I missed sth that's what e.g.
nvme_pci_setup_data_prp() already does.

nvme_pci_setup_data_prp() // goto bad_sgl:
	nvme_unmap_data()
		nvme_free_descriptors();


> If dma_pool_alloc() fails in nvme_rq_setup_dmabuf_map(), it jumps to
> 'free_prps:', which calls nvme_free_descriptors() but leaves
> 'iod->nr_descriptors' unchanged. The block layer may requeue the failed
> request.
> 
> If the queue is subsequently torn down, the cancellation path invokes
> nvme_unmap_data() -> nvme_rq_clean_dmabuf_map(). Seeing the non-zero
> 'nr_descriptors', it calls nvme_free_descriptors() again, resulting in a
> double free.
> 
>> +}
> 
> [ ... ]
> 
>> +static struct dma_buf_io_map *nvme_dma_buf_io_map(struct dma_buf_io_ctx *ctx)
>> +{
>> +	unsigned nr_entries = ctx->dmabuf->size / NVME_CTRL_PAGE_SIZE;
>> +	struct nvme_dma_buf_io_ctx *nvme_ctx = ctx->dev_priv;
>> +	struct dma_buf_attachment *attach = nvme_ctx->attach;
>> +	unsigned long tmp, i = 0;
>> +	struct nvme_dmabuf_map *map;
>> +	struct scatterlist *sg;
>> +	struct sg_table *sgt;
>> +	int ret;
>> +
>> +	dma_resv_assert_held(ctx->dmabuf->resv);
>> +
>> +	map = kvmalloc_flex(*map, dma_list, nr_entries);
>> +	if (!map)
>> +		return ERR_PTR(-ENOMEM);
>> +
>> +	sgt = dma_buf_map_attachment(attach, ctx->dir);
>> +	if (IS_ERR(sgt)) {
>> +		ret = PTR_ERR(sgt);
>> +		sgt = NULL;
>> +		goto err;
>> +	}
>> +
>> +	for_each_sgtable_dma_sg(sgt, sg, tmp) {
>> +		dma_addr_t dma_addr = sg_dma_address(sg);
>> +		unsigned long sg_len = sg_dma_len(sg);
>> +
>> +		if ((sg_len % NVME_CTRL_PAGE_SIZE) ||
>> +		    (dma_addr % NVME_CTRL_PAGE_SIZE)) {
>> +			ret = -EINVAL;
>> +			goto err;
>> +		}
>> +		while (sg_len) {
>> +			map->dma_list[i++] = dma_addr;
> 
> [Severity: High]
> Does this loop overflow dma_list[]?
> 
> 'nr_entries' is computed via integer division of dmabuf->size. If the dmabuf
> size is not page-aligned (e.g., 4097 bytes), nr_entries truncates down (to 1).

It'll fail on the alignment check in this loop for [4096, 4097)

> However, exporters often pad sg_table allocations to full pages (e.g., 8192
> bytes).
> 
> The loop unconditionally writes all sg_len chunks to 'dma_list', exceeding the
> allocated 'nr_entries' capacity.
> 
>> +			dma_addr += NVME_CTRL_PAGE_SIZE;
>> +			sg_len -= NVME_CTRL_PAGE_SIZE;
>> +		}
>> +	}
>> +
>> +	ret = dma_buf_io_init_map(ctx, &map->base, sgt);
>> +	if (ret)
>> +		goto err;
>> +	map->nr_entries = nr_entries;
>> +	map->sgt = sgt;
>> +	return &map->base;
>> +err:
>> +	if (sgt)
>> +		dma_buf_unmap_attachment(attach, sgt, ctx->dir);
>> +	kfree(map);
> 
> [Severity: High]
> Is it safe to free a kvmalloc_flex() allocation with kfree()?

Going to fix.

-- 
Pavel Begunkov

