Received: from mail-pj2-f12.google.com (mail-pj2-f12.google.com [74.125.227.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D8F1D3A83A8
	for <sashiko-reviews@lists.linux.dev>; Tue, 15 Sep 2026 09:31:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.227.140
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789464690; cv=none; b=Kn+DSB+It5XyonLNywioTI2PuXZbl4MXj9NO9BFr1Fmppq/PeQ3BSWODgzJEPeo2jWri13YLWaCkKt/Yxd62S/9OV3LkhZHh7JImkjfAp5r/C/MD7MpkjYEbYbpxvK2KVCBcL6lM0jnykPf6ckq/iHQ5qZ0OCZsrLacJYMDNwqk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789464690; c=relaxed/simple;
	bh=MBIDlzLETZ6Ke7JEueJiw1A6EOnNx0E46KmQ8mc7A2M=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=GZjj1IAenA0WbGRqhQ95eBj5at50jDIsZsnny8ZlC7MIVQZP2vCxHdpZ8gvUmYJen6JnqyGcsfEAvFLg2+JuZSNY6VpFAcYPIJLFfhJjzfvVFWNBJXvGitdzU3XV+lAujhIBG/8fGyAAPB8a5FszUAh6fh5wN0OTk/C5093YSaE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=bytedance.com; spf=pass smtp.mailfrom=bytedance.com; dkim=pass (2048-bit key) header.d=bytedance.com header.i=@bytedance.com header.b=RCB93lnW; arc=none smtp.client-ip=74.125.227.140
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=bytedance.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=bytedance.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bytedance.com header.i=@bytedance.com header.b="RCB93lnW"
Received: by mail-pj2-f12.google.com with SMTP id 98e67ed59e1d1-396ccb1a98fso2291193a91.1
        for <sashiko-reviews@lists.linux.dev>; Tue, 15 Sep 2026 02:31:26 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bytedance.com; s=google; t=1789464684; x=1790069484; darn=lists.linux.dev;
        h=content-transfer-encoding:content-type:in-reply-to:from:references
         :cc:to:subject:user-agent:mime-version:date:message-id:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=gvUI2dEtuuIaSyk3LqlQfrXzsUcahMFLkx7ziY5U1Xs=;
        b=RCB93lnWgIONsWLNp5tyqDYfSvZDFZ4SwgyWe1iHCqenJV85nJ1HyGXapSmg6nCJ5T
         zvrP1HVAzDXoLzKR8G+LWAhnn0qDSzg9dU3Vuw8cpDYBEt1ObAX05KVcIVKWQ2WR14XR
         WlTF4dfUM2fMlXIbP7I6mDfy6PzUfHKPhQIvk/0KMDXJG9ulrnKwjbn4upKdh86+l6IQ
         n7JoRuLm6fu/4l950xv0Si9EQ4PGtTibOmu1x4yk9VNxLZy7zzyD5jXs8QpRzKRcWs6n
         D05UYifpZDseeEeSAL7i13BerRNSYSjwaYnGJMSe2JeReSdyc9qLLpRpNX3o8L56Gts4
         MCOA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1789464684; x=1790069484;
        h=content-transfer-encoding:content-type:in-reply-to:from:references
         :cc:to:subject:user-agent:mime-version:date:message-id:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=gvUI2dEtuuIaSyk3LqlQfrXzsUcahMFLkx7ziY5U1Xs=;
        b=MQcI+l/XaAtS4iU/5ILfTLlb3p/e4yQtKk6FhV8vMbw0H/0gmWK4D+WaB3J/TrE5tF
         naGX7KnA2JgUcCkXSEnepjs57kOYYT+tGBs7b5jQaSwxqIfwqcQ3EVGwtc2vxumOnCGO
         FzY1LzCyejtw33pbg6yX7BMO4C98EIdBxa6mkzWpb7MIBgVYqmlkKiraNVZEz5plVIny
         Zq7yg0TlB0ZvBUvkorZwyd8QbbBe3pGFNsebu2Rcp4nAPvB8hTq2pilPI3IeBGLHUZGj
         VOO0d6EIJerd+EsRNw2bLtJO9RtddiXTb0xuM+bhPEbIlwBv/NbIL7Fd8wz5dunzP8wT
         94Fw==
X-Gm-Message-State: AFuF++nwwintWmB4quSNVtQVm6zhvoVZfzsuKEzIUTs/TI/VTc5DTaMN
	DHGXxi4IOFrBdo7RcOMgMh+1jiTcGifMVaq0Mwbc2tz12k3xheWZx0kVvKDGj3E53M+DO6Mc19q
	y26HbL0Q=
X-Gm-Gg: AYBFou3Vo/00MBL4P9G0M509LYpne+4zlePS9CPaG5Ft/bALP7QAEgz5xUc/T+vhqE8
	4cAi+zZgb2nhiq8Og7o3X553CxkoGbBWEOmLp8RdbzIXPNEHR/ao1RjGfkT9/FNYCuawWvKIDa8
	946ng7NPYGTXuadMjfAXi1szrr4oiJ3B2fQPXuf4czkoxxEAjWu88zsJjHsryybvVvw9G+fNuuD
	tNV9Br2LGoIi/KSjsqWdpcbdPV3CVcpBPbL2K4SQmyxHlPlpU/CgAZ3vroqJFbYjOR9NMFUBQ7H
	pw6s7xa4snTtQ94AmA3JGTH5ndXNaWWQBsCEZi3cSll07xhSkK8h80rnHKnJ/Ny86ByqIRmZprL
	mBg605rbHqOuJiWv/1PEKm+Wo/e9X2ILSAQT5It2zYOJK+KTGoRbCRZtwc+bsQz0sy6u9/pMJf/
	kPcohfkEdtm6otToweLCv5PlG4k4ZheP5cQ2GtyFjbJcIWzDHN0syzPnPFLhDeUW/OXEfPOK4FY
	vf4GOqbpd5VJtINIDRFVk1/cZW6T3tH2tL5Uiv/Ct8=
X-Received: by 2002:a17:90a:6d97:b0:39d:ec43:df74 with SMTP id 98e67ed59e1d1-39dec43dfbbmr8690045a91.12.1789464684362;
        Tue, 15 Sep 2026 02:31:24 -0700 (PDT)
Received: from [100.81.12.150] ([61.213.176.57])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-39dfdacc559sm4074101a91.13.2026.09.15.02.31.22
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 15 Sep 2026 02:31:24 -0700 (PDT)
Message-ID: <d7c0e570-f21f-4545-be57-9c6a13d72b8a@bytedance.com>
Date: Tue, 15 Sep 2026 17:31:21 +0800
Precedence: bulk
X-Mailing-List: sashiko-reviews@lists.linux.dev
List-Id: <sashiko-reviews.lists.linux.dev>
List-Subscribe: <mailto:sashiko-reviews+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:sashiko-reviews+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v5 2/3] memcg,writeback: flush foreign bdev mappings
 separately from owner wbs
To: sashiko-reviews@lists.linux.dev
Cc: mkoutny@suse.com, tj@kernel.org, hannes@cmpxchg.org
References: <20260915083406.3471036-1-sunjunchao@bytedance.com>
 <20260915083406.3471036-3-sunjunchao@bytedance.com>
 <20260915085732.786A51F00893@smtp.kernel.org>
From: Julian Sun <sunjunchao@bytedance.com>
In-Reply-To: <20260915085732.786A51F00893@smtp.kernel.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 9/15/26 4:57 PM, sashiko-bot@kernel.org wrote:
> Thank you for your contribution! Sashiko AI review found 1 potential issue(s) to consider:
> - [Medium] mm: foreign bdev tracking blindly overwrites slot 0 causing cache thrashing
> --
> 
> commit f85768a9e7b14a40d0dd4c42452c25af0163f55e
> Author: Julian Sun <sunjunchao@bytedance.com>
> memcg,writeback: flush foreign bdev mappings separately from owner wbs
> 
> This commit introduces a separate tracking and flushing mechanism for foreign
> dirty events on block device inodes. It records the device numbers
> independently and flushes their mappings using a dedicated workqueue to
> prevent writing unrelated file data.
> 
>> diff --git a/mm/memcontrol.c b/mm/memcontrol.c
>> --- a/mm/memcontrol.c
>> +++ b/mm/memcontrol.c
> [ ... ]
>> @@ -3845,6 +3847,41 @@ void mem_cgroup_wb_stats(struct bdi_writeback *wb, unsigned long *pfilepages,
> [ ... ]
>> +static void mem_cgroup_track_foreign_bdev(struct mem_cgroup *memcg, dev_t dev)
>> +{
>> +	struct bdev_frn_flush_ctx *ctx;
>> +	unsigned long flags;
>> +	int i;
>> +
>> +	/*
>> +	 * __folio_mark_dirty() takes mapping->i_pages with xa_lock_irqsave()
>> +	 * before reaching this helper. Use irqsave here as well so frn_lock's
>> +	 * IRQ protection does not depend on that outer locking.
>> +	 */
>> +	spin_lock_irqsave(&memcg->frn_lock, flags);
>> +	for (i = 0; i < MEMCG_CGWB_FRN_CNT; i++) {
>> +		if (memcg->bdev_frn[i].dev == dev)
>> +			goto out;
>> +	}
>> +
>> +	for (i = 0; i < MEMCG_CGWB_FRN_CNT; i++) {
>> +		ctx = &memcg->bdev_frn[i];
>> +		if (ctx->inflight)
>> +			continue;
>> +		ctx->dev = dev;
>> +		break;
>> +	}
> 
> [Severity: Medium]
> Does this slot selection logic cause cache thrashing?
> 
> By greedily picking the first non-inflight slot without checking if it is
> empty (such as checking if ctx->dev == 0) or prioritizing older entries, it
> appears that events for different devices will repeatedly overwrite slot 0
> when it is not currently inflight.
> 
> This would effectively act as a single-slot cache, losing flush hints for
> multiple devices and leading to less efficient writeback or potential memcg
> dirty throttling.

Makes sense. I'll fix it in the next version. However, records may still
be lost when all slots are full. This is expected, since tracking remains
best effort, just like the original foreign-flush mechanism.
> 
>> +out:
>> +	spin_unlock_irqrestore(&memcg->frn_lock, flags);
>> +}
> 

Thanks,
-- 
Julian Sun <sunjunchao@bytedance.com>
