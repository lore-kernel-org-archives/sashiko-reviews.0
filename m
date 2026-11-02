Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=124.71.93.112
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793580790;
	b=X7ZdFb2uNDeWWkacLAYi1shctXAHXeSPpbvG5mccOSQF6A6isWP2ZRg5CDnh6HuNEbdF
	 qmUw3NZXiLhDV9YB31TosYt4X43NDcwfsPTQAl8flSLzgwobNNUcmQq0+Xe0kvNTqzx1X
	 9R7o2FvwI0CASPyiN0A8OjQdBLyv8dXEYylsxN1FBhCbJoJgjjfViSnUBDmx38HokIWc+
	 rJZED8nbVHscwo0Bg24MdXTNcRzDKNjk9KGtJTALp+cJWEE26MJZUtDJsCUiPx6UTA8aa
	 O8UGTscJqWG/IQSRWkykBF9Oio37ojJzzZAJYDUnSkoZ6RSvvW8RU3t0s+Rkd6f6GDA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793580790;
	h=DMARC-Filter:Received:Received:Received:Message-ID:Date:MIME-Version:
	 User-Agent:Subject:To:Cc:References:Content-Language:From:In-Reply-To:
	 Content-Type:Content-Transfer-Encoding:X-CM-TRANSID:
	 X-Coremail-Antispam:X-CM-SenderInfo;
	bh=efENr5abTBnv9LorGAvHvCoxrm853APMJedhZonGDAI=;
	b=S4kyAwG/qqIA1tlg1rIIsaEgad4+zNRZcgC51vCqOna86NNn2dH3vxPQmZIKn7fp+dW1
	 v7EeCDIGMyRiYjfbHoqBUYlGGSukXfZuICHwnyRfQdbuLkypIU0pdfkM9E7qXefD1WHkX
	 JYoakGDt5olxSF9F0H3A5YN6U4oPUXvv6vV5WfzLMbG3g2/QSkHxZlGPfaDVP6f+OuKZJ
	 w1pRfRHhK7Zv5szpquufRD9WivQJ0GVc7GLKp8VLc/iZ8nxfoTCztHbs24/vgoVB2f6gg
	 gDW6kugcnnQtXVfixGZJj6yekptVQn8eNTyDfDreIgg7S9sQHv3yt0jDQApfvmHb80g==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=none header.from=huaweicloud.com;
	spf=none smtp.mailfrom=huaweicloud.com;
	arc=none smtp.remote-ip=124.71.93.112
Received: from dggmsgout12.his.huawei.com (dggmsgout12.his.huawei.com [124.71.93.112])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 08974606A326
	for <sashiko-reviews@lists.linux.dev>; Mon,  2 Nov 2026 00:53:07 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 08974606A326
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=huaweicloud.com
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=huaweicloud.com
Received: from mail.maildlp.com (unknown [172.19.163.177])
	by dggmsgout12.his.huawei.com (SkyGuard) with ESMTP id 4jHtTd3QZtz1yGw
	for <sashiko-reviews@lists.linux.dev>; Mon,  2 Nov 2026 08:52:37 +0800 (CST)
Received: from mail02.huawei.com (unknown [10.116.40.75])
	by mail.maildlp.com (Postfix) with ESMTP id 24D73405A1
	for <sashiko-reviews@lists.linux.dev>; Mon,  2 Nov 2026 08:52:59 +0800 (CST)
Received: from [10.67.110.36] (unknown [10.67.110.36])
	by APP2 (Coremail) with UTF8SMTPA id Syh0CgBXJuzp3udqS4HYCg--.53925S2;
	Mon, 02 Nov 2026 08:52:59 +0800 (CST)
Message-ID: <f145e32a-d181-4af7-afa7-4d26e6f8caa3@huaweicloud.com>
Date: Mon, 2 Nov 2026 08:52:57 +0800
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
Subject: Re: [PATCH] perf/core: Prevent duplicate sigtrap task work enqueue
To: sashiko-reviews@lists.linux.dev
Cc: linux-perf-users@vger.kernel.org
References: <20261031114520.642476-1-wutengda@huaweicloud.com>
 <sashiko-outbox-191929@kernel.org>
Content-Language: en-US
From: Tengda Wu <wutengda@huaweicloud.com>
In-Reply-To: <sashiko-outbox-191929@kernel.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-CM-TRANSID:Syh0CgBXJuzp3udqS4HYCg--.53925S2
X-Coremail-Antispam: 1UD129KBjvJXoW7KFWrAFy3Cw13Zw4kWFy8Xwb_yoW5Jrykp3
	9xtrn0ka1UXr1qq345tr97Ar18Ww10qan8A3yqka4SqF1YvryDta47Wa1YqFs8ArnrAa4f
	Aw4j9rZru347JFDanT9S1TB71UUUUU7qnTZGkaVYY2UrUUUUjbIjqfuFe4nvWSU5nxnvy2
	9KBjDU0xBIdaVrnRJUUUglb4IE77IF4wAFF20E14v26r1j6r4UM7CY07I20VC2zVCF04k2
	6cxKx2IYs7xG6rWj6s0DM7CIcVAFz4kK6r1j6r18M28lY4IEw2IIxxk0rwA2F7IY1VAKz4
	vEj48ve4kI8wA2z4x0Y4vE2Ix0cI8IcVAFwI0_JFI_Gr1l84ACjcxK6xIIjxv20xvEc7Cj
	xVAFwI0_Jr0_Gr1l84ACjcxK6I8E87Iv67AKxVW8Jr0_Cr1UM28EF7xvwVC2z280aVCY1x
	0267AKxVW8Jr0_Cr1UM2AIxVAIcxkEcVAq07x20xvEncxIr21l5I8CrVACY4xI64kE6c02
	F40Ex7xfMcIj6xIIjxv20xvE14v26r1j6r18McIj6I8E87Iv67AKxVWUJVW8JwAm72CE4I
	kC6x0Yz7v_Jr0_Gr1lF7xvr2IY64vIr41l42xK82IYc2Ij64vIr41l4I8I3I0E4IkC6x0Y
	z7v_Jr0_Gr1lx2IqxVAqx4xG67AKxVWUJVWUGwC20s026x8GjcxK67AKxVWUGVWUWwC2zV
	AF1VAY17CE14v26r1Y6r17MIIYrxkI7VAKI48JMIIF0xvE2Ix0cI8IcVAFwI0_Jr0_JF4l
	IxAIcVC0I7IYx2IY6xkF7I0E14v26r1j6r4UMIIF0xvE42xK8VAvwI8IcIk0rVWUJVWUCw
	CI42IY6I8E87Iv67AKxVWUJVW8JwCI42IY6I8E87Iv6xkF7I0E14v26r1j6r4UYxBIdaVF
	xhVjvjDU0xZFpf9x07UE-erUUUUU=
X-CM-SenderInfo: pzxwv0hjgdqx5xdzvxpfor3voofrz/



On 2026/10/31 19:58, sashiko-bot@kernel.org wrote:
> Thank you for your contribution! Sashiko AI review found 1 potential issue(s) to consider:
> - [Low] perf/core: redundant store to event->pending_work in __perf_event_overflow()
> --
> 
> commit badcfdb790f5048e93691fc4bd20053f8cc9e2d2
> Author: Tengda Wu <wutengda@huaweicloud.com>
> 
> perf/core: Prevent duplicate sigtrap task work enqueue
> 
> This commit uses cmpxchg() to atomically claim event->pending_work before
> calling task_work_add() in __perf_event_overflow() so that a nested NMI
> cannot enqueue the same sigtrap pending_task twice.
> 
>> diff --git a/kernel/events/core.c b/kernel/events/core.c
>> index 457d75ea71420..f1e4e153c49a4 100644
>> --- a/kernel/events/core.c
>> +++ b/kernel/events/core.c
>> @@ -10925,16 +10925,18 @@ static int __perf_event_overflow(struct perf_event *event,
>>  
>>  		notify_mode = in_nmi() ? TWA_NMI_CURRENT : TWA_RESUME;
>>  
>> -		if (!event->pending_work &&
>> -		    !task_work_add(current, &event->pending_task, notify_mode)) {
>> -			event->pending_work = pending_id;
>> -			local_inc(&event->ctx->nr_no_switch_fast);
>> -			WARN_ON_ONCE(!atomic_long_inc_not_zero(&event->refcount));
>> -
>> -			event->pending_addr = 0;
>> -			if (valid_sample && (data->sample_flags & PERF_SAMPLE_ADDR))
>> -				event->pending_addr = data->addr;
>> -
>> +		if (cmpxchg(&event->pending_work, 0, pending_id) == 0) {
>> +			if (!task_work_add(current, &event->pending_task, notify_mode)) {
>> +				event->pending_work = pending_id;
> 
> [Severity: Low]
> Is this store to event->pending_work in __perf_event_overflow() in
> kernel/events/core.c still needed when task_work_add() succeeds?
> 
> The outer cmpxchg(&event->pending_work, 0, pending_id) == 0 check already
> sets event->pending_work to pending_id before calling task_work_add(), and
> nothing can clear or modify event->pending_work while inside this branch
> (interrupts are disabled, perf_pending_task() cannot run until return to
> user space or task exit, and any nested NMI sees a non-zero value in
> cmpxchg()).
> 
> Leaving this assignment also performs an unmarked plain write to
> event->pending_work, whereas the rest of this change accesses it via
> cmpxchg() and READ_ONCE(). Can this redundant assignment be dropped?
> 

Yes, it can be dropped, the assignment is redundant. I'll send v2 to fix it.

Thanks,
Tengda

