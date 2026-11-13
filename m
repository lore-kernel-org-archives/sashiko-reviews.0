Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=115.124.30.112
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794570897;
	b=Nf3c8ESQtsKYfjY8tCg2MNkuxNNyhVc2wqa2vkAg7K9R7ycHKED/7jcc3b2jED7mKu+g
	 kwjO0nuZeC9dvjESld3ArlnW8Oceh9vh9wt+9QFhl2/NhIj/sYRvSanmWbxdMpakweSUo
	 PBkmSWBqXiolSAv/Ti101qrbJeL0k+8WQc9GjvvJJJsqABjU9NZ0C3LMlBsKu6/4WVuA+
	 s5a8FhX6QACmtc2as37G9YOtSQCx+nsHS2ERRoyB56fMcrqJkhluq07dwNtIbIfkIYnI9
	 2Ah5gRZFF3LIoGqIUEnLVNlol2jHtQOEyRLrq3oOu94rVOVVCYAoeiL9Q00AhmQkkCQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794570897;
	h=DMARC-Filter:DKIM-Signature:X-Alimail-AntiSpam:Received:Message-ID:
	 Date:MIME-Version:User-Agent:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type:Content-Transfer-Encoding;
	bh=jqJ295QKfxdTGGYRv7XqY6kexSmTE646xCDgSnYdGuY=;
	b=hocUZamOJdaYiuJ1IiSdtq6NQTNTdsjIFRY6cO9bedI1IkMDDBoSqGB3GM0BmksCfnWh
	 7MMWkS5S7s2+eo+gdigZ+WlNuE0jpS9L4yb+7+xvpFyXnwi2ErdggZ+yZNHoab+QcFtas
	 58Sd7oODbE2gcSCB3V25WUNBH2HILCpcGmxPaU+Y4HvWMh7zmeVIXE5jkPAQ4098Fuc09
	 eKLfNd0CVa0gw84jYRTxSlEVYH6ImNtC4q8+y3PJ70+Pf3sYv3C6T13jcFtxpE4BIeh7w
	 oWUyFRSviD6O/QPdGMpNZcDJVw9vnGp5thR+ifYycV3AWuL1JRPyrUfY4PnMX84VRzA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=linux.alibaba.com;
	spf=pass smtp.mailfrom=linux.alibaba.com;
	dkim=pass header.d=linux.alibaba.com header.i=@linux.alibaba.com header.a=rsa-sha256 header.s=default header.b=Ba4Awe12;
	arc=none smtp.remote-ip=115.124.30.112
Received: from out30-112.freemail.mail.aliyun.com (out30-112.freemail.mail.aliyun.com [115.124.30.112])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2D958606A321
	for <sashiko-reviews@lists.linux.dev>; Fri, 13 Nov 2026 11:54:55 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 2D958606A321
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.alibaba.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.alibaba.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key, unprotected) header.d=linux.alibaba.com header.i=@linux.alibaba.com header.a=rsa-sha256 header.s=default header.b=Ba4Awe12
DKIM-Signature:v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=linux.alibaba.com; s=default;
	t=1794570892; h=Message-ID:Date:MIME-Version:Subject:To:From:Content-Type;
	bh=jqJ295QKfxdTGGYRv7XqY6kexSmTE646xCDgSnYdGuY=;
	b=Ba4Awe12236AJlIYNr+sNJXOA6xZFyOAiEGQegfkPouGA+YABwze+cszRPn1ztf3AqjRN6ByJRyb/NLkhr4row58ZD2Al9f6CNqImGFMAJUWp07Njwl72MhDJvTH/hKnzlVJTB/mqX035yFjVn1Cpo1Ymvx7YuR13oI3h8fiXb4=
X-Alimail-AntiSpam:AC=PASS;BC=-1|-1;BR=01201311R201e4;CH=green;DM=||false|;DS=||;FP=0|-1|-1|-1|0|-1|-1|-1;HT=maildocker-contentspam033037033178;MF=baolin.wang@linux.alibaba.com;NM=1;PH=DS;RN=14;SR=0;TI=SMTPD_---0XEezp1N_1794570891;
Received: from 30.74.144.124(mailfrom:baolin.wang@linux.alibaba.com fp:SMTPD_---0XEezp1N_1794570891 cluster:ay36)
          by smtp.aliyun-inc.com;
          Fri, 13 Nov 2026 19:54:51 +0800
Message-ID: <9f0d2468-b086-457a-ad3b-a452020305f0@linux.alibaba.com>
Date: Fri, 13 Nov 2026 19:54:50 +0800
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
Subject: Re: [PATCH] mm: mglru: use pte_table_clamped_end() helper to
 calculate the end
To: sashiko-reviews@lists.linux.dev, akpm@linux-foundation.org,
 david@kernel.org, hannes@cmpxchg.org, kasong@tencent.com
Cc: baohua@kernel.org, axelrasmussen@google.com, yuanchu@google.com,
 weixugc@google.com, baoquan.he@linux.dev, qi.zheng@linux.dev,
 shakeel.butt@linux.dev, mhocko@kernel.org, linux-mm@kvack.org
References: <b2386c5da61f9a15e60daa421b033bc1e0bcdd41.1794481498.git.baolin.wang@linux.alibaba.com>
 <sashiko-outbox-212685@kernel.org>
From: Baolin Wang <baolin.wang@linux.alibaba.com>
In-Reply-To: <sashiko-outbox-212685@kernel.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit



On 11/13/26 7:13 PM, sashiko-bot@kernel.org wrote:
> Thank you for your contribution! Sashiko AI review found 1 potential
> issue to consider:
> - [High] mm: mglru: call to undeclared pte_table_clamped_end() in
>    lru_gen_look_around()
> --
> 
> commit 921adf1dcfd3cc8b15e0745e6085a76a09ac3fb5
> Author: Baolin Wang <baolin.wang@linux.alibaba.com>
> 
> mm: mglru: use pte_table_clamped_end() helper to calculate the end
> 
> This commit replaces the open-coded PTE table and VMA end address
> calculation in lru_gen_look_around() with pte_table_clamped_end().
> 
>> diff --git a/mm/vmscan.c b/mm/vmscan.c
>> index 25a224746c36d..cb8635e41a38a 100644
>> --- a/mm/vmscan.c
>> +++ b/mm/vmscan.c
>> @@ -4340,7 +4340,7 @@ bool lru_gen_look_around(struct page_vma_mapped_walk *pvmw, unsigned int nr)
>>   	walk = current->reclaim_state ? current->reclaim_state->mm_walk : NULL;
>>   
>>   	start = max(addr & PMD_MASK, vma->vm_start);
>> -	end = min(addr | ~PMD_MASK, vma->vm_end - 1) + 1;
>> +	end = pte_table_clamped_end(addr, vma->vm_end);
> 
> [Severity: High]
> Does this break the build when CONFIG_LRU_GEN is enabled?
> pte_table_clamped_end() is not declared or defined anywhere in the tree,
> so compiling mm/vmscan.c fails with an implicit function declaration
> error.

No. Because you applied the patch to the wrong tree (mm/mm-new). The 
helper has already been picked up in David's mm/core.git tree.
