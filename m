Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=220.197.31.3
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794996007;
	b=wRHtvys4aKi+4bsp6bBFpE15Ep4MOnXAskICQJeG8QpMNZK6Mot+mtFyKE855DwgVi+G
	 0mdXlJ84lXxAi5pTf7R6MhqH2xt75+4iJ94Wnc7a8iQYT5FRvo9T5X1smeFkP4z4yTS4l
	 fwKsmdIfWX6EuUv16uWmKWTzt2bpshejxanRMEO9X2Wd/eBDs++WU1nze49Y3VnGKGRaD
	 3aVQT8cq3yBRrH+fQx/UakZZQqN8kl1pZickJa3fmEBuXR/4++fmRG4GQQLUxWKB+JnOl
	 eF0v3X5nnfORClACQD5sFXQWsJesAEVWlDtETdoD0hSEDzC3WMeIW7qPPsb9P8Y+U6g==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794996007;
	h=DMARC-Filter:DKIM-Signature:Message-ID:Date:MIME-Version:User-Agent:
	 Subject:To:Cc:References:Content-Language:From:In-Reply-To:
	 Content-Type:Content-Transfer-Encoding:X-CM-TRANSID:
	 X-Coremail-Antispam:X-CM-SenderInfo;
	bh=bfNWy4jxJ26Nw2UaBqxzBElnixZLSqhE35Hwm9J3T4I=;
	b=znDaI73bcOFFUCgG2uBAxO7Wr/kFEFIfTdk8kCidSwEBAf58c6SFlWPKkNDkvk0BihTE
	 fqcWkv/KAYRNAdwvOTMDg4hHfsDFhvpm98XLbQd7ykBWAKZoaVHLoZRfmGLFSteef6eUJ
	 rwv4t5qj7oGT+RdcXWbdAi0z90vI/7SMTbgG7ayrgUTcOayfS+arkd5jMj/HWQHw0FDM/
	 g9eyQzfzGAiZYQmA/QaPyAQql7nbFmgRSMVUFYzrgFYtkgj04R3prpKHqV75VaIZ+mywS
	 f5nQ3fJgD3jc1kX6zVhE5KV7gwuWXH83K7nGacGlKx09skAtqU2apXRhNlxAqT/vphw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=163.com;
	spf=pass smtp.mailfrom=163.com;
	dkim=pass header.d=163.com header.i=@163.com header.a=rsa-sha256 header.s=s110527 header.b=igh8NavK;
	arc=none smtp.remote-ip=220.197.31.3
Received: from m16.mail.163.com (m16.mail.163.com [220.197.31.3])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AB192606A32C
	for <sashiko-reviews@lists.linux.dev>; Wed, 18 Nov 2026 10:00:04 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org AB192606A32C
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=163.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=163.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key, unprotected) header.d=163.com header.i=@163.com header.a=rsa-sha256 header.s=s110527 header.b=igh8NavK
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=163.com;
	s=s110527; h=Message-ID:Date:MIME-Version:Subject:To:From:
	Content-Type; bh=bfNWy4jxJ26Nw2UaBqxzBElnixZLSqhE35Hwm9J3T4I=;
	b=igh8NavKo8KN9G07EI1Qpi6saEF2oByoH/7gOoxsfmwKFivv+VBLb/okFezPBE
	+x0R/ymbgWhZ9WqpbmRf+eTOGmGlQF5V5eahqyYrvWI3peIHpVFe/VF0sGuSQzrb
	RUiQse9w1Il0GOiW/YaaXp3bzK7MYSJ9z7WDieQVnvr54=
Message-ID: <e934279b-0cb6-4cc6-991e-88ac3b88c1f2@163.com>
Date: Wed, 18 Nov 2026 17:59:59 +0800
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
Subject: Re: [PATCH bpf-next v3 1/6] bpf: Mark task work FREED before
 detaching it
To: sashiko-reviews@lists.linux.dev
Cc: bpf@vger.kernel.org
References: <20261111024333.228633-1-luyun_611@163.com>
 <20261111024333.228633-2-luyun_611@163.com>
 <sashiko-outbox-208194@kernel.org>
Content-Language: en-US
From: luyun <luyun_611@163.com>
In-Reply-To: <sashiko-outbox-208194@kernel.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-CM-TRANSID:_____wD3v98fd_1qpExBHw--.3044S2
X-Coremail-Antispam: 1Uf129KBjvJXoWxAw4rGF1UKr47Gw17Cw13XFb_yoW5ur4Dpr
	ZxKay8Aw1qqFn0yF1qqa1xZryrWwn3tw45Cr98KryktF45WFn2gr1kKa4IgFZxGr1kJF42
	vr4qgrW3uF4j9FDanT9S1TB71UUUUU7qnTZGkaVYY2UrUUUUjbIjqfuFe4nvWSU5nxnvy2
	9KBjDUYxBIdaVFxhVjvjDU0xZFpf9x0zKYLPbUUUUU=
X-CM-SenderInfo: pox130jbwriqqrwthudrp/xtbC7AEAzmr9dyEAdQAA3X


在 2026/11/11 11:26, sashiko-bot@kernel.org 写道:
> Thank you for your contribution! Sashiko AI review found 1 potential
> issue to consider:
> - [Medium] bpf: race in bpf_task_work_cancel_and_free() on concurrent
>    cancellation
> --
>
> commit ba93530a5f1bdfb22fe067f66a5dec0d9c8f3f5a
> Author: Yun Lu <luyun@kylinos.cn>
>
> bpf: Mark task work FREED before detaching it
>
> This commit marks a BPF task work context as BPF_TW_FREED before clearing
> the map value's context slot in bpf_task_work_cancel_and_free() so a
> concurrent map deletion does not observe an empty slot while a detached
> context can still transition to BPF_TW_RUNNING.
>
>> diff --git a/kernel/bpf/helpers.c b/kernel/bpf/helpers.c
>> index 937a0d7d68390..4b252ca61166b 100644
>> --- a/kernel/bpf/helpers.c
>> +++ b/kernel/bpf/helpers.c
>> @@ -5174,11 +5174,21 @@ void bpf_task_work_cancel_and_free(void *val)
>>   	struct bpf_task_work_ctx *ctx;
>>   	enum bpf_task_work_state state;
>>   
>> -	ctx = xchg(&twk->ctx, NULL);
>> +	/* Another canceller can release the map-owned context reference. */
>> +	guard(rcu)();
>> +	/* Order a preceding unlink before observing an empty slot. */
>> +	smp_mb();
>> +	ctx = READ_ONCE(twk->ctx);
>>   	if (!ctx)
>>   		return;
>>   
>> +	/* Stop callbacks before making the context invisible to deletion. */
>>   	state = xchg(&ctx->state, BPF_TW_FREED);
>> +	/* Only the first FREED transition detaches ctx and owns the map's ref. */
>> +	if (state == BPF_TW_FREED)
>> +		return;
>> +	WRITE_ONCE(twk->ctx, NULL);
> [Severity: Medium]
> Can a second concurrent bpf_task_work_cancel_and_free() return with the
> BPF_TW_FREED context still attached to twk->ctx, or miss a newly published
> context?
>
> array_map_update_elem() updates an element in place and calls
> bpf_obj_cancel_fields() without a lock:
>
>    array_map_update_elem()
>      bpf_obj_cancel_fields()
>        bpf_task_work_cancel_and_free()
>          ctx = READ_ONCE(twk->ctx)
>          xchg(&ctx->state, BPF_TW_FREED)
>          <irq>
>            array_map_update_elem()
>              bpf_obj_cancel_fields()
>                bpf_task_work_cancel_and_free()
>                  ctx = READ_ONCE(twk->ctx)
>                  state = xchg(&ctx->state, BPF_TW_FREED)
>                  if (state == BPF_TW_FREED)
>                    return;
>              bpf_task_work_schedule_signal()
>                bpf_task_work_acquire_ctx()
>                  bpf_task_work_fetch_ctx()  <-- sees old BPF_TW_FREED ctx
>          WRITE_ONCE(twk->ctx, NULL)
>
> Because twk->ctx has not been cleared when the second canceller returns,
> bpf_task_work_fetch_ctx() sees the non-NULL pointer and returns the dead
> BPF_TW_FREED context instead of allocating a new one, causing
> bpf_task_work_acquire_ctx() to fail with -EBUSY.
>
> Conversely, if the second canceller reads the old context C1 before the
> first canceller clears twk->ctx, and a concurrent bpf_task_work_fetch_ctx()
> installs a new context C2 once twk->ctx becomes NULL, the second canceller
> sees C1->state == BPF_TW_FREED and returns without detaching or cancelling
> C2.
A schedule can return -EBUSY while the first canceller has marked C1 
FREED and
is still detaching it. That canceller clears the slot and disposes of 
the map's reference.
A canceller that already read C1 leaves a subsequently published C2 
alone. I'll keep
this in next version.

---

Thanks,
Yun Lu

