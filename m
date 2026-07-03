Received: from mail.loongson.cn (mail.loongson.cn [114.242.206.163])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 4395925DB0D
	for <sashiko-reviews@lists.linux.dev>; Fri,  3 Jul 2026 15:53:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=114.242.206.163
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783094020; cv=none; b=B8EGUQutcAZxet+6umQ1ym9qRB4QNEwCCwr8XfoqywmXA8BjOXl6fa9OkjRpBRRJRxMfZh46aL4L7YKufWw0yCn2v16xt9w+x/vXumYyI0zPMvslmPb0jh3WTfOD5uSO0z6dZ3JaB3dMlF1qgdBgrMz1Sn0AGPnTIqnDdmUQ71w=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783094020; c=relaxed/simple;
	bh=ga/N/vBtzfO+IZylxG56H4ajtXQ9g0Gj8X7rY8yUQ6A=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=TvTTssNgvhIWq1v5tBeBo/uPFOfFlUjxYNsNx133F9Lgv9V+WdzwIJrdpRv7RCeeT0Z637blktvlaUkAre1G8AIF3KkIzUrRCCoahG7e+T0cWpfpsm+0KTtGQbnDHNwa/H3hGaMYv11pEsrLpUYkh0WLfMwlKRJcbDM/7M0xn9g=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=loongson.cn; spf=pass smtp.mailfrom=loongson.cn; arc=none smtp.client-ip=114.242.206.163
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=loongson.cn
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=loongson.cn
Received: from loongson.cn (unknown [36.44.120.111])
	by gateway (Coremail) with SMTP id _____8Axz+v92kdqz2IBAA--.1848S3;
	Fri, 03 Jul 2026 23:53:34 +0800 (CST)
Received: from [192.168.0.111] (unknown [36.44.120.111])
	by front1 (Coremail) with SMTP id qMiowJCxvsL62kdqqjC+AA--.32184S3;
	Fri, 03 Jul 2026 23:53:31 +0800 (CST)
Message-ID: <c56c20eb-00f9-046e-70a4-261499d0f2ae@loongson.cn>
Date: Fri, 3 Jul 2026 23:53:36 +0800
Precedence: bulk
X-Mailing-List: sashiko-reviews@lists.linux.dev
List-Id: <sashiko-reviews.lists.linux.dev>
List-Subscribe: <mailto:sashiko-reviews+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:sashiko-reviews+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.4.0
Subject: Re: [PATCH bpf-next v7 1/2] bpf: Introduce jit_required flag and
 refactor kfunc path
Content-Language: en-US
To: Leon Hwang <leon.hwang@linux.dev>, sashiko-reviews@lists.linux.dev
Cc: bpf@vger.kernel.org, Alexei Starovoitov <ast@kernel.org>,
 KaFai Wan <kafai.wan@linux.dev>
References: <20260702143656.28845-1-yangtiezhu@loongson.cn>
 <20260702143656.28845-2-yangtiezhu@loongson.cn>
 <20260702145855.07C6B1F000E9@smtp.kernel.org>
 <7cce1695-eaa2-816b-2877-9cb2f117aa27@loongson.cn>
 <42e59c6f-5040-4b50-91ce-10066551a32c@linux.dev>
 <c6aca1e2-1f7a-7e01-62c8-81d0658a20fe@loongson.cn>
 <ed816369-e1f6-47aa-9532-5f3ccf6d6794@linux.dev>
From: Tiezhu Yang <yangtiezhu@loongson.cn>
In-Reply-To: <ed816369-e1f6-47aa-9532-5f3ccf6d6794@linux.dev>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-CM-TRANSID:qMiowJCxvsL62kdqqjC+AA--.32184S3
X-CM-SenderInfo: p1dqw3xlh2x3gn0dqz5rrqw2lrqou0/
X-Coremail-Antispam: 1Uk129KBj93XoW7tFykCryUJr4fCrykAr4kXwc_yoW8KrWDpF
	n5tFyqkFZYqw1rua42k3W8Zry5t3W8J3W7Kr1kJaySvrnFqF4vga1Uur9Ig34ftr48Cr40
	y34S9FW2vw1UZagCm3ZEXasCq-sJn29KB7ZKAUJUUUUr529EdanIXcx71UUUUU7KY7ZEXa
	sCq-sGcSsGvfJ3Ic02F40EFcxC0VAKzVAqx4xG6I80ebIjqfuFe4nvWSU5nxnvy29KBjDU
	0xBIdaVrnRJUUUB2b4IE77IF4wAFF20E14v26r1j6r4UM7CY07I20VC2zVCF04k26cxKx2
	IYs7xG6rWj6s0DM7CIcVAFz4kK6r106r15M28lY4IEw2IIxxk0rwA2F7IY1VAKz4vEj48v
	e4kI8wA2z4x0Y4vE2Ix0cI8IcVAFwI0_Jr0_JF4l84ACjcxK6xIIjxv20xvEc7CjxVAFwI
	0_Jr0_Gr1l84ACjcxK6I8E87Iv67AKxVW8Jr0_Cr1UM28EF7xvwVC2z280aVCY1x0267AK
	xVW8Jr0_Cr1UM2kKe7AKxVWUXVWUAwAS0I0E0xvYzxvE52x082IY62kv0487Mc804VCY07
	AIYIkI8VC2zVCFFI0UMc02F40EFcxC0VAKzVAqx4xG6I80ewAv7VC0I7IYx2IY67AKxVWU
	XVWUAwAv7VC2z280aVAFwI0_Jr0_Gr1lOx8S6xCaFVCjc4AY6r1j6r4UM4x0Y48IcVAKI4
	8JMxk0xIA0c2IEe2xFo4CEbIxvr21l42xK82IYc2Ij64vIr41l4I8I3I0E4IkC6x0Yz7v_
	Jr0_Gr1l4IxYO2xFxVAFwI0_Jrv_JF1lx2IqxVAqx4xG67AKxVWUJVWUGwC20s026x8Gjc
	xK67AKxVWUGVWUWwC2zVAF1VAY17CE14v26r126r1DMIIYrxkI7VAKI48JMIIF0xvE2Ix0
	cI8IcVAFwI0_Jr0_JF4lIxAIcVC0I7IYx2IY6xkF7I0E14v26r1j6r4UMIIF0xvE42xK8V
	AvwI8IcIk0rVWUJVWUCwCI42IY6I8E87Iv67AKxVW8JVWxJwCI42IY6I8E87Iv6xkF7I0E
	14v26r4j6r4UJbIYCTnIWIevJa73UjIFyTuYvjxU2G-eUUUUU

On 7/3/26 22:14, Leon Hwang wrote:
> On 2026/7/3 14:59, Tiezhu Yang wrote:
> [...]
>>>> ```
>>>> diff --git a/kernel/bpf/verifier.c b/kernel/bpf/verifier.c
>>>> index f496b45b9da4..1f5824c1c691 100644
>>>> --- a/kernel/bpf/verifier.c
>>>> +++ b/kernel/bpf/verifier.c
>>>> @@ -2772,7 +2772,7 @@ int bpf_add_kfunc_call(struct bpf_verifier_env
>>>> *env, u32 func_id, u16 offset)
>>>>
>>>>    bool bpf_prog_has_kfunc_call(const struct bpf_prog *prog)
>>>>    {
>>>> -       return !!prog->aux->kfunc_tab;
>>>> +       return prog->jit_required && !!prog->aux->kfunc_tab;
>>>
>>>
>>> When 'prog->jit_required' is used for JIT-inlineable helper call, this
>>> change could also cause false positive for the above pruned kfunc case.
>>>
>>> If you don't want bpf_fixup_call_args() rejects the program with -EINVAL
>>> for the pruned kfunc case, suggest moving 'if (!func_id && !offset)'
>>> before the tab allocation in bpf_add_kfunc_call().
>>
>> How about this:
>>
>> ```
>> diff --git a/kernel/bpf/verifier.c b/kernel/bpf/verifier.c
>> index 25aea4271cd0..c34cc524651a 100644
>> --- a/kernel/bpf/verifier.c
>> +++ b/kernel/bpf/verifier.c
>> @@ -2770,7 +2770,7 @@ int bpf_add_kfunc_call(struct bpf_verifier_env
>> *env, u32 func_id, u16 offset)
>>
>>   bool bpf_prog_has_kfunc_call(const struct bpf_prog *prog)
>>   {
>> -       return !!prog->aux->kfunc_tab;
>> +       return prog->aux->kfunc_tab && prog->aux->kfunc_tab->nr_descs > 0;
> 
> 
> NIT: drop '> 0'
> 
> Looks better.

OK, will do it in v8.

> 
>>   }
>>
>>   static int add_subprog_and_kfunc(struct bpf_verifier_env *env)
>> ```
>> IMO, there are no side effects for the following four cases:
>>
>> 1. Pure JIT-inlined Helper
>> 2. Pure Pruned kfunc
>> 3. Pruned kfunc + Inlined Helper
>> 4. Active (Unpruned) kfunc
>>
> 
> This change allows pruned kfunc + interpreter fallback and pruned kfunc
> + bpf_fixup_call_args(), when CONFIG_BPF_JIT_ALWAYS_ON is off.
> 
> Does it look like a pre-existing issue?

I think so.

> 
> Pls read "Support kernel module function calls from eBPF" [1] to
> understand the background of introducing func_id=0 kfunc.
> 
> [1] https://lore.kernel.org/bpf/20211002011757.311265-1-memxor@gmail.com/
> 
> Thanks,
> Leon

Thanks,
Tiezhu

