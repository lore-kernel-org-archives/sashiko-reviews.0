Received: from mail-ed2-f32.google.com (mail-ed2-f32.google.com [74.125.228.96])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A68533BCD21
	for <sashiko-reviews@lists.linux.dev>; Wed, 30 Sep 2026 10:03:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.228.96
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790762616; cv=none; b=lLA8xn0JCK87kH3cgMBh7aAYCvOb0b2pa9f+2/OOhCH4S1M6h8X7uBXL8DyjxwoqeiJtX6FagfEb2XQoBYT6pgz4zl7jz7sUbsVC9Cg42LNfj4kxvvtPqEOlIeU/ONJKNPXAApsA3fr861irfcS6F8GCkn58L4O0KkXcb/SaQSk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790762616; c=relaxed/simple;
	bh=FIPTA2NjcFOuiHv0JrwA/wRVe/64ghF+VDEcLi/AMS8=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=nar4+Rc9JDxDvEXHQgGGRqW9dR15tDUhT7lKcec61XqX7gBo8mvPb9mSr0cGd2hP6yOJBqC+pmqv3CaXWXzlgmC+XJhmTK26Ewp/wyKJj8gyqTKz3/VM/PNoPXhwnsZi3esAbmCqHPvVA05TKX0RNxvWIe9+xRwwHViff/fF6kI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=N0bIcFux; arc=none smtp.client-ip=74.125.228.96
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="N0bIcFux"
Received: by mail-ed2-f32.google.com with SMTP id 4fb4d7f45d1cf-6acb88abebdso2022664a12.1
        for <sashiko-reviews@lists.linux.dev>; Wed, 30 Sep 2026 03:03:34 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1790762613; x=1791367413; darn=lists.linux.dev;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=eCoj95WhFRCP2kPh50xeXjC6XymL7tbWMA/noa+qpCU=;
        b=N0bIcFuxLjNDneUjFI9WgtikldlINgTz1TgoVJmvvVCz8o8gtDKeCnuwmAGQoxjvWi
         i62MjO8ShM6/JTpA6YHQJOaJYXHw5yNEOqXMeh25VSgopGF81WKsqJMMcHCgxvgi47QB
         qrYwVzoKEVEcYjSzqEs8+zVVYZ/VK5ydtsVOX2hYnY69Xk4pXNVD3EvaXoODgH2MsLP0
         RFGfH73JZIyC2cOF2DSUbKTi8zjQgru3KZYtTEofsbOiYC/J38Ptju1/hXNndxOn/w/F
         j55sV0ue9gANPkh+i3XXD7baDaZ36itQ6ElOnxE22A5P92/2KPr59ZLwvAgjTSUjro/P
         N9oQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790762613; x=1791367413;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=eCoj95WhFRCP2kPh50xeXjC6XymL7tbWMA/noa+qpCU=;
        b=jergs2oEDT/unidwnXpxn8ovVCn3SipV/dEZ3yavs99Adz1RNeT1DD7LGZ9KTFX7Ni
         iXKjf8iFmmh5NAAV+Z9qdViXs7rdf1pjRvC4BwAUljNk9DAQUFFuJTTYzUMGKcqu7nw8
         0D9O7BCQgTbu1NauVC/GjDIboR2t8orq0ypOUkvsu4GiCRXhisLZkiIUKF7ghPbefBVY
         52ff6vApgtZWz9X+S2mUdJPGhVcwqP8YMvRjSud2WwxJycPBPFO+nX4TJF7O65VQnaB9
         9Jc7ZQ7Fj1boIAWADPNh73gngwVlthfJh2qOVpHSnvr4w7duDz1ENxrL+IOupufcBenr
         kvzA==
X-Gm-Message-State: AFuF++keoePZ3oMsyIVgMxDUNMjQywj4w87Ohlzj6aXqQok1ocmwXEk/
	7BaSyYCby3zPSuF5wNUgrRkLmCmqCIzeIvV+edeiHpuMk80melW6gk8k
X-Gm-Gg: AYBFou287ZqytD9ZJfenEnrTKW03+RpcY/p2cf/uE9XYQK6EvoHMF0j/v0Rw39EjHdb
	1+7idrA7Ocyo65gQCpN7JdgeX9/w7WyGAUakdo8ka5qiFNxQhZTaQQRTGFMrgjbqOB/W7pQrrHY
	o1seRROMk24YrQUBWr8b6o6AILlMOxk2goYdsV3ONMpt/bgRP3g2asi+MulLKzBrRfsze+Dcf0s
	6qnYzlUkGI6uNfzLtILbjoQRc6yU22e4y3KdysEzUu92NT8rBk8h/dyPOnRd/9rc4i4erW69NYi
	5//QG2e/5np/1no+PewRzIsjD5GIruGnkl70N78Ym+b8aSfFPTMD9lovbQzkwpC9PKoxYygCaHQ
	F2u84Q7L5w0IYgElJzVG4NtDQmvZqypMl14ba1ST9c4uaF9pvsh2TAQARUHpL7b7q4XE6AYW7fU
	R+AEjQMRj+pHCBY9fyZSVrrqCUfLIedvR8njxUW5r/Kn4lnRxtdYpfOwjQF+9nDhwAH9ONGsKhO
	GmPsFhwutqtpYzPBrh0SSFBHTebaenq3Fq/LP9g1iGsxGIW1FLzYKpddvf0PxnQyAxkWoliUBFO
	JwBq3inhQp+1mc+yvKOW1VYjxY6IHIUZcS7y3tjCaQM25BJOSpaRhTye5ks=
X-Received: by 2002:a17:907:3e97:b0:c29:f5d5:5aa1 with SMTP id a640c23a62f3a-c2e23e1a588mr68319966b.43.1790762611323;
        Wed, 30 Sep 2026 03:03:31 -0700 (PDT)
Received: from ?IPV6:2a01:4b00:bd21:4f00:7cc6:d3ca:494:116c? ([2a01:4b00:bd21:4f00:7cc6:d3ca:494:116c])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-c2e22f4316csm40646266b.15.2026.09.30.03.03.29
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 30 Sep 2026 03:03:30 -0700 (PDT)
Message-ID: <387993f3-9cea-4725-aba8-536fd6234428@gmail.com>
Date: Wed, 30 Sep 2026 11:03:25 +0100
Precedence: bulk
X-Mailing-List: sashiko-reviews@lists.linux.dev
List-Id: <sashiko-reviews.lists.linux.dev>
List-Subscribe: <mailto:sashiko-reviews+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:sashiko-reviews+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v6 01/13] dma-buf: introduce initial file I/O
 infrastructure
To: Matthew Brost <matthew.brost@intel.com>
Cc: sashiko-reviews@lists.linux.dev, media-ci@linuxtv.org,
 dri-devel@lists.freedesktop.org
References: <cover.1789997898.git.asml.silence@gmail.com>
 <5490ee42c4452fd4198b245ead20fcf7438c066e.1789997898.git.asml.silence@gmail.com>
 <20260921135344.035B81F000FF@smtp.kernel.org>
 <17884261-52ab-484e-a39a-01e67f7a1d2e@gmail.com>
 <aryyKMFpgK9JYQr0@gsse-cloud1.jf.intel.com>
Content-Language: en-US
From: Pavel Begunkov <asml.silence@gmail.com>
In-Reply-To: <aryyKMFpgK9JYQr0@gsse-cloud1.jf.intel.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 9/30/26 07:54, Matthew Brost wrote:
> On Tue, Sep 22, 2026 at 10:08:38AM +0100, Pavel Begunkov wrote:
>> On 9/21/26 14:53, sashiko-bot@kernel.org wrote:
>> ...>>   }
>>> [ ... ]
>>>> +int dma_buf_io_init_map(struct dma_buf_io_ctx *ctx, struct dma_buf_io_map *map,
>>>> +			struct sg_table *sgt)
>>>> +{
>>>> +	unsigned seg_shift = ~0U;
>>>> +	struct scatterlist *sg;
>>>> +	unsigned long tmp;
>>>> +	int ret;
>>>> +
>>>> +	for_each_sgtable_dma_sg(sgt, sg, tmp)
>>>> +		seg_shift = min(seg_shift, __ffs(sg_dma_len(sg)));
>>>> +
>>>> +	ret = percpu_ref_init(&map->refs, dma_buf_io_map_refs_release, 0,
>>>> +			      GFP_KERNEL);
>>>
>>> [Severity: High]
>>> Does this GFP_KERNEL allocation violate DMA-buf locking rules?
>>>
>>> dma_buf_io_create_map() calls ctx->dev_ops->map(ctx) while holding the
>>> dmabuf->resv ww_mutex. If the driver then calls dma_buf_io_init_map() under
>>> this lock, the GFP_KERNEL allocation could deadlock if memory reclaim
>>> attempts to acquire dma_resv locks.
>>
>> Most of these look trivial, going to fix them. This one, however,
>> doesn't sound true AFAIU, I haven't heard about any blank ban on
>> GFP_KERNEL allocation under resv lock.
>>
> 
> I can confirm this definitely not correct - see dma_resv_lockdep it
> acquires dma_resv then fs_reclaim_acquire(GFP_KERNEL). Shrinker enter
> direct reclaim and try to take dma-resv locks, but not block on the
> lock.

Just to double check, I believe by "this" you mean that the
sashiko report is incorrect. I'm going to leave it as is, but
let me know if I'm wrong.

-- 
Pavel Begunkov

