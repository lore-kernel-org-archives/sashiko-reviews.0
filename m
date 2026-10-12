Received: from mail-m1973174.qiye.163.com (mail-m1973174.qiye.163.com [220.197.31.74])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C9F4245517D
	for <sashiko-reviews@lists.linux.dev>; Mon, 12 Oct 2026 08:25:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=220.197.31.74
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791793515; cv=none; b=uP9XXbNCq+E19oFpXBp2ZY3Tiy25/pZPt1uw0BoK9J7FtHoJ4JBKGaNjAP6Z/+ne+Tqd3csDJdnzNMdV3JG+GCHrBN/pN9hHHReHJ1V46J0N5EJKTEQApeo8KQaQ+JQgCspJ8iBtGD2Zg+eIA9uIpBCPXHjo2g102LsYCOrIvY0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791793515; c=relaxed/simple;
	bh=RwxW1GPi2yQzisgRETKHEkCApE33nOoMXY5QRP/SS0I=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=GJd2pZMmTvv5RsSsJ3ucf1te/qGe25TmqOJx6mvV6eDWlM3KWd/YUCUjkxu91Bj6gIVW+XDZa+GPPvcz6IFWZYnafclAxsyTusjUV4NBt8WKfP7dPIl6v2YyPvM/iZV0QJC4ZzG9jHICSB5Ko23k8bUh9h7jFkvqGYAyL8dQOI8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=easystack.cn; spf=pass smtp.mailfrom=easystack.cn; arc=none smtp.client-ip=220.197.31.74
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=easystack.cn
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=easystack.cn
Received: from [192.168.0.59] (unknown [218.94.118.90])
	by smtp.qiye.163.com (Hmail) with ESMTP id 1ff561615;
	Mon, 12 Oct 2026 15:09:29 +0800 (GMT+08:00)
Message-ID: <d980f951-b7db-4f14-aaf4-532a0c43d63a@easystack.cn>
Date: Mon, 12 Oct 2026 15:09:29 +0800
Precedence: bulk
X-Mailing-List: sashiko-reviews@lists.linux.dev
List-Id: <sashiko-reviews.lists.linux.dev>
List-Subscribe: <mailto:sashiko-reviews+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:sashiko-reviews+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 5/6] mm/page_owner: add bpf_page_owner_get_memcg_info()
 kfunc
To: sashiko-reviews@lists.linux.dev
Cc: bpf@vger.kernel.org
References: <20261009112308.240769-1-zhen.ni@easystack.cn>
 <20261009112308.240769-6-zhen.ni@easystack.cn>
 <sashiko-outbox-165554@kernel.org>
From: "zhen.ni" <zhen.ni@easystack.cn>
In-Reply-To: <sashiko-outbox-165554@kernel.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-HM-Tid: 0aa12ef1ee5b0229kunm56d3338b591224
X-HM-MType: 1
X-HM-Spam-Status: e1kfGhgUHx5ZQUpXWQgPGg8OCBgUHx5ZQUlOS1dZFg8aDwILHllBWSg2Ly
	tZV1koWUFJQjdXWRgWCB1ZQUpXWS1ZQUlXWQ8JGhUIEh9ZQVlCGR4aVktNH0seS0tMGU0aS1YVFA
	kWGhdVGRETFhoSFyQUDg9ZV1kYEgtZQVlJSkNVQk9VSkpDVUJLWVdZFhoPEhUdFFlBWU9LSFVCQk
	lOS1VKS0tVSkJLQlkG



在 2026/10/9 20:43, sashiko-bot@kernel.org 写道:
> Thank you for your contribution! Sashiko AI review found 2 potential issue(s) to consider:
> - [Critical] bpf: Missing __sz annotation allows BPF stack overflow in memcg kfunc
> - [High] bpf: missing __sz annotation on size param causes stack buffer overflow
> --
> 
> commit 98bc7e204a48312a6be1bc67be9ade762ffed9ff
> Author: Zhen Ni <zhen.ni@easystack.cn>
> 
> mm/page_owner: add bpf_page_owner_get_memcg_info() kfunc
> 
> This commit introduces a new BPF kfunc to expose per-page memcg information,
> including the cgroup path. It extracts memcg data collection into a new
> helper function that the kfunc calls directly.
> 
>> diff --git a/mm/page_owner_iter.c b/mm/page_owner_iter.c
>> index 907517a291443..e7a8ca1e90e8d 100644
>> --- a/mm/page_owner_iter.c
>> +++ b/mm/page_owner_iter.c
> [ ... ]
>> @@ -170,4 +170,11 @@ __bpf_kfunc int bpf_page_owner_get_nid(struct page_owner_scan *scan)
>>   	return page_owner_get_nid(scan->page);
>>   }
>>   
>> +__bpf_kfunc int bpf_page_owner_get_memcg_info(struct page_owner_scan *scan,
>> +					      struct memcg_info *info,
>> +					      char *buf, u32 size)
> 
> [Severity: Critical]
> Does this size parameter need the __sz suffix for the verifier to track
> memory bounds correctly?
> 
> Because the parameter is named size rather than buf__sz, it appears the
> verifier might treat buf as a fixed 1-byte allocation and size as an
> unconstrained scalar.
> 
> Could this allow a BPF program to pass a 1-byte stack buffer alongside an
> arbitrarily large size value? If so, when this calls into
> get_page_memcg_info() in mm/page_owner.c and executes:
> 
> get_page_memcg_info()
>      ...
>      if (buf && size)
>          cgroup_path(memcg->css.cgroup, buf, size);
> 
> can it overwrite the BPF stack and corrupt adjacent kernel memory?
> 

The size argument will be renamed to buf__sz.

> [Severity: High]
> Do the buf and info parameters also need the __uninit suffix?
> 
> Without this suffix, the verifier might improperly force BPF programs to
> pre-initialize these output variables just to pass verification.
> 
>> +{
>> +	return get_page_memcg_info(scan->page, info, buf, size);
>> +}
>> +
>>   __bpf_kfunc_end_defs();
> 

The __uninit suffix will be added to the buf and info parameters.



Thanks,
Zhen


