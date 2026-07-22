Received: from dggsgout11.his.huawei.com (dggsgout11.his.huawei.com [45.249.212.51])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D57F3471430
	for <sashiko-reviews@lists.linux.dev>; Wed, 22 Jul 2026 07:45:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=45.249.212.51
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784706309; cv=none; b=T+k7w3ca/wQpEDiNgPljq53BRVsQxcNHt+dJQK4Q7/u66hTP2ZQ5QjSQVEieNtKK9D3tynJwl4LKklTQGtJznV3MPUgMywdh6W1lh2+0dyBG1mtK4aZViNu0mOZjJ31mK85EoMRY8nElzJQUwqEn7/3fOA3a43Ng0iN2/xbD1jc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784706309; c=relaxed/simple;
	bh=rFQUOwe4AXBo8Bs5CUbXEo4o0EudZnu+haK/8297ROU=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=EMLfXYYJtzoFpBd/MVGVlEhHqfu2HWAvu3+QVawYvbrtgb0xVkQzPJsniGQQ1c29KCw54fFU9f8UxULwZXoy6DuInrOVOpNh43tsWlIUMN0inQMScSHugcNIDh7b9h/y/NabYjXXM6z1VsYcQMMqMUrJfvJb0sCw5jBxee1cDV4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=huaweicloud.com; spf=pass smtp.mailfrom=huaweicloud.com; arc=none smtp.client-ip=45.249.212.51
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=huaweicloud.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=huaweicloud.com
Received: from mail.maildlp.com (unknown [172.19.163.170])
	by dggsgout11.his.huawei.com (SkyGuard) with ESMTPS id 4h4mVT73FzzYQtkX
	for <sashiko-reviews@lists.linux.dev>; Wed, 22 Jul 2026 15:44:33 +0800 (CST)
Received: from mail02.huawei.com (unknown [10.116.40.128])
	by mail.maildlp.com (Postfix) with ESMTP id A7E164056B
	for <sashiko-reviews@lists.linux.dev>; Wed, 22 Jul 2026 15:45:02 +0800 (CST)
Received: from [10.67.110.68] (unknown [10.67.110.68])
	by APP4 (Coremail) with UTF8SMTPA id gCh0CgDXBlj+dGBq1N6JCA--.34309S2;
	Wed, 22 Jul 2026 15:45:02 +0800 (CST)
Message-ID: <7eaa45a6-22a9-44ab-86a5-5c11b1e24ed6@huaweicloud.com>
Date: Wed, 22 Jul 2026 15:45:02 +0800
Precedence: bulk
X-Mailing-List: sashiko-reviews@lists.linux.dev
List-Id: <sashiko-reviews.lists.linux.dev>
List-Subscribe: <mailto:sashiko-reviews+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:sashiko-reviews+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH bpf v6 2/4] bpf: Fix UAF due to missing link type check in
 mprog
Content-Language: en-US
To: sashiko-reviews@lists.linux.dev
Cc: bpf@vger.kernel.org
References: <20260722072326.1545677-1-pulehui@huaweicloud.com>
 <20260722072326.1545677-3-pulehui@huaweicloud.com>
 <20260722073343.A05751F00A3F@smtp.kernel.org>
From: Pu Lehui <pulehui@huaweicloud.com>
In-Reply-To: <20260722073343.A05751F00A3F@smtp.kernel.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-CM-TRANSID:gCh0CgDXBlj+dGBq1N6JCA--.34309S2
X-Coremail-Antispam: 1UD129KBjvJXoW7KFW5Gw4xKw48Ary7XF1UZFb_yoW8Kr1DpF
	WfJa48Cw4Ygw4293WUZr18u34jqF4qgF1UK3Z5WF10yrnIgrWFqryxurWfZryakFykKw4I
	qrZFqa4qy34UXFDanT9S1TB71UUUUU7qnTZGkaVYY2UrUUUUjbIjqfuFe4nvWSU5nxnvy2
	9KBjDU0xBIdaVrnRJUUUglb4IE77IF4wAFF20E14v26r1j6r4UM7CY07I20VC2zVCF04k2
	6cxKx2IYs7xG6rWj6s0DM7CIcVAFz4kK6r1j6r18M28lY4IEw2IIxxk0rwA2F7IY1VAKz4
	vEj48ve4kI8wA2z4x0Y4vE2Ix0cI8IcVAFwI0_Gr0_Xr1l84ACjcxK6xIIjxv20xvEc7Cj
	xVAFwI0_Gr0_Cr1l84ACjcxK6I8E87Iv67AKxVW8Jr0_Cr1UM28EF7xvwVC2z280aVCY1x
	0267AKxVW0oVCq3wAS0I0E0xvYzxvE52x082IY62kv0487Mc02F40EFcxC0VAKzVAqx4xG
	6I80ewAv7VC0I7IYx2IY67AKxVWUGVWUXwAv7VC2z280aVAFwI0_Jr0_Gr1lOx8S6xCaFV
	Cjc4AY6r1j6r4UM4x0Y48IcVAKI48JMxAIw28IcxkI7VAKI48JMxC20s026xCaFVCjc4AY
	6r1j6r4UMI8I3I0E5I8CrVAFwI0_Jr0_Jr4lx2IqxVCjr7xvwVAFwI0_JrI_JrWlx4CE17
	CEb7AF67AKxVWUXVWUAwCIc40Y0x0EwIxGrwCI42IY6xIIjxv20xvE14v26r1j6r1xMIIF
	0xvE2Ix0cI8IcVCY1x0267AKxVWUJVW8JwCI42IY6xAIw20EY4v20xvaj40_Jr0_JF4lIx
	AIcVC2z280aVAFwI0_Gr0_Cr1lIxAIcVC2z280aVCY1x0267AKxVW8Jr0_Cr1UYxBIdaVF
	xhVjvjDU0xZFpf9x07UWHqcUUUUU=
X-CM-SenderInfo: psxovxtxl6x35dzhxuhorxvhhfrp/


On 2026/7/22 15:33, sashiko-bot@kernel.org wrote:
> Thank you for your contribution! Sashiko AI review found 1 potential issue(s) to consider:
> 
> Pre-existing issues:
> - [High] Missing `rcu_read_lock()` in `bpf_link_show_fdinfo` and `bpf_link_get_info_by_fd` allows Use-After-Free of `link->prog`.
> --
> 
> --- Patch [2]: [PATCH bpf v6 2/4] bpf: Fix UAF due to missing link type check in mprog ---
> commit d6fd76d2df1307731a401336010d5bd9b2102da9
> Author: Pu Lehui <pulehui@huawei.com>
> 
> bpf: Fix UAF due to missing link type check in mprog
> 
> This patch validates the link type in bpf_mprog_link before accessing
> the underlying program type. This prevents a use-after-free when an
> unsupported link is updated concurrently.
> 
>> diff --git a/kernel/bpf/mprog.c b/kernel/bpf/mprog.c
>> index 1394168062e85..b4a1b35ff5693 100644
>> --- a/kernel/bpf/mprog.c
>> +++ b/kernel/bpf/mprog.c
>> @@ -17,7 +17,7 @@ static int bpf_mprog_link(struct bpf_tuple *tuple,
>>   		link = bpf_link_get_from_fd(id_or_fd);
>>   	if (IS_ERR(link))
>>   		return PTR_ERR(link);
>> -	if (type && link->prog->type != type) {
>> +	if (type && link->type != type) {
> 
> [Severity: High]
> This is a pre-existing issue, but I noticed another potential UAF involving
> link->prog being accessed without RCU protection.
> 
> When a BPF link is updated, link->prog is swapped and the old program is freed
> after an RCU grace period. If a thread invokes sys_bpf with
> BPF_OBJ_GET_INFO_BY_FD or reads fdinfo for a BPF link, it accesses link->prog.
> 
> In kernel/bpf/syscall.c:bpf_link_show_fdinfo():
> 
> 	const struct bpf_prog *prog = link->prog;
> ...
> 	if (prog) {
> 		bin2hex(prog_tag, prog->tag, sizeof(prog->tag));
> 		seq_printf(m,
> 			   "prog_tag:\t%s\n"
> 			   "prog_id:\t%u\n",
> 			   prog_tag,
> 			   prog->aux->id);
> 
> Can this dereference a freed prog pointer if a concurrent BPF_LINK_UPDATE
> swaps and frees the program before the grace period expires, since
> rcu_read_lock() is not held?

patch 3 will cover these issue.

> 
> A similar pattern appears in kernel/bpf/syscall.c:bpf_link_get_info_by_fd():
> 
> 	if (link->prog)
> 		info.prog_id = link->prog->aux->id;
> 
> Does this code also need RCU protection against concurrent updates?
> 
>>   		bpf_link_put(link);
>>   		return -EINVAL;
>>   	}
> 

