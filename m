Received: from m16.mail.163.com (m16.mail.163.com [117.135.210.4])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 29C612E718F
	for <sashiko-reviews@lists.linux.dev>; Mon,  8 Jun 2026 07:07:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=117.135.210.4
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1780902462; cv=none; b=FEjqeI4fqKYpZxYX1QZ/6JTgorS9xuL4k6BOwNq7iZKheQuGfNcEdvsEtPrHmLYDDdk/bX73vOjo3jpxWaGYc9OlFgkfZTn7HrhEujYDuJ/PioAs6K+QY/ZkoQ0uxKgM5ZxaedIWTIQPfljo1Gq5AlVmV3fBDK0cYC18LJKdlQY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1780902462; c=relaxed/simple;
	bh=1wn43ZuIJiwUzVbbPvNg2bm0i/arHRHXQPG01WrCRNU=;
	h=Message-ID:Date:MIME-Version:Subject:To:References:From:
	 In-Reply-To:Content-Type; b=uATsiiJyaby59oJOIUXRYyhVZAMx501cBuI8gWdZamj5f1BNuBb/nMLQhwiY2JSUauzSQiKG2IuTk8BlUppVNFz/67eqFGbg+gpMc+uGZXXbHl5ImWr6831jAp7lo226qdX0owKCGvp9Z8MDdduFhXiJgcm53Vv6MgK/sqF3ejE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=163.com; spf=pass smtp.mailfrom=163.com; dkim=pass (1024-bit key) header.d=163.com header.i=@163.com header.b=oqKWwDI/; arc=none smtp.client-ip=117.135.210.4
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=163.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=163.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=163.com header.i=@163.com header.b="oqKWwDI/"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=163.com;
	s=s110527; h=Message-ID:Date:MIME-Version:Subject:To:From:
	Content-Type; bh=jPcPNNOpYwHC0y4pNS/Fc5s9m6xjjQ82cSzGcxKLQGQ=;
	b=oqKWwDI/TPhhoJsXtAPAwC2O6P/zpdtBWEj4OwH2qEEWl27C/naMs39z116kwd
	ATgERf7DxeWMY4PDX5xxatBk5S0V+OSa0MHEsdcLPl+E7BujVHQz4iJcrnfe8o+z
	vLaci/o3xES+D3JkX6d9W6oZT3w88FvCdwwX0DWnmff2U=
Received: from [10.42.12.206] (unknown [])
	by gzga-smtp-mtada-g0-3 (Coremail) with SMTP id _____wAXHhgvaiZqFmajCA--.47572S2;
	Mon, 08 Jun 2026 15:07:28 +0800 (CST)
Message-ID: <dccd78a3-f311-4617-a227-bc1da9f6af95@163.com>
Date: Mon, 8 Jun 2026 15:07:26 +0800
Precedence: bulk
X-Mailing-List: sashiko-reviews@lists.linux.dev
List-Id: <sashiko-reviews.lists.linux.dev>
List-Subscribe: <mailto:sashiko-reviews+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:sashiko-reviews+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] sched_ext/scx_flatcg: Fix cvtime_delta race and add
 hweight scaling to bypass charging
To: sashiko-reviews@lists.linux.dev
References: <20260608042230.3-1-liwanwu9113@163.com>
 <20260608043558.ECBCE1F00893@smtp.kernel.org>
Content-Language: en-US
From: liwanwu9113 <liwanwu9113@163.com>
In-Reply-To: <20260608043558.ECBCE1F00893@smtp.kernel.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-CM-TRANSID:_____wAXHhgvaiZqFmajCA--.47572S2
X-Coremail-Antispam: 1Uf129KBjvJXoWxuryDZw48tF47GFyfZF48tFb_yoW5Ar43pF
	ZYq3W7tF48tF4vgFnrZF1kXry0gw4vy3yUGr45tw4fZrnxW3WrtF12yF43WFsIyrsakF42
	vrZYk3W8C3W0y3DanT9S1TB71UUUUU7qnTZGkaVYY2UrUUUUjbIjqfuFe4nvWSU5nxnvy2
	9KBjDUYxBIdaVFxhVjvjDU0xZFpf9x0ziOJ5xUUUUU=
X-CM-SenderInfo: polzt01zxziiqt6rljoofrz/xtbC3BDKU2omajAVEwAA3F



On 2026/6/8 12:35, sashiko-bot@kernel.org wrote:
> Thank you for your contribution! Sashiko AI review found 1 potential issue(s) to consider:
> 
> Pre-existing issues:
> - [High] Incorrect tracking of cgroup virtual time delta in `fcg_dispatch` leads to double charging on early yield and permanent starvation on slice overrun due to sign inversion and unsigned division of negative values.
> --
> 
> commit 26a5b29cfee7b890fe54a82847b9652c4700912d
> Author: Wanwu Li <liwanwu@kylinos.cn>
> 
> sched_ext/scx_flatcg: Fix cvtime_delta race and add hweight scaling to bypass charging
> 
> This commit fixes a double-charging race condition in cgrp_cap_budget() by
> using __sync_fetch_and_and() to read and clear cvtime_delta atomically. It
> also updates the bypass charging path in fcg_stopping() to scale the raw
> execution time by the inverse of the cgroup hweight before adding it to
> cvtime_delta.
> 
>> diff --git a/tools/sched_ext/scx_flatcg.bpf.c b/tools/sched_ext/scx_flatcg.bpf.c
>> index fec3595818269..0fd214cc61dae 100644
>> --- a/tools/sched_ext/scx_flatcg.bpf.c
>> +++ b/tools/sched_ext/scx_flatcg.bpf.c
> 
> [ ... ]
> 
>> @@ -570,7 +570,8 @@ void BPF_STRUCT_OPS(fcg_stopping, struct task_struct *p, bool runnable)
>>   	cgc = find_cgrp_ctx(cgrp);
>>   	if (cgc) {
>>   		__sync_fetch_and_add(&cgc->cvtime_delta,
>> -				     p->se.sum_exec_runtime - taskc->bypassed_at);
>> +				     (p->se.sum_exec_runtime - taskc->bypassed_at) *
>> +				     FCG_HWEIGHT_ONE / (cgc->hweight ?: 1));
> 
> [Severity: High]
> This is a pre-existing issue, but seeing the hweight scaling logic added
> here brings to mind a potential bug with the same pattern in fcg_dispatch().
> Does the tracking of the cgroup virtual time delta in fcg_dispatch() suffer
> from double-charging and underflow issues?
> 
> In fcg_dispatch(), the unused slice time is calculated as:
> 
> (cpuc->cur_at + cgrp_slice_ns - now)
> 
> Because the cgroup is charged a full slice upfront in try_pick_next_cgroup(),
> should this unused time be refunded by subtracting it from cvtime_delta? The
> current code uses __sync_fetch_and_add() which adds the positive unused time
> and penalizes the cgroup a second time when it yields early.
> 
> Also, if the cgroup overruns its slice (now > cur_at + slice), the
> calculation underflows. Because FCG_HWEIGHT_ONE is an unsigned value
> (1LLU << 16), does the subsequent multiplication and division by cgc->hweight
> destroy the two's complement representation of the negative value?
> 
> This unsigned division would shift zeros into the most significant bits,
> resulting in a huge positive number being added to cvtime_delta. Could this
> push the cgroup's virtual time days into the future and cause permanent
> starvation?
> 
Yes, These issues indeed exist. I will send another patch to fix them soon.
>>   		taskc->bypassed_at = 0;
>>   	}
>>   	bpf_cgroup_release(cgrp);
> 

