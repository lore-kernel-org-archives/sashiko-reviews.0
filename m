Received: from mail-wr1-f41.google.com (mail-wr1-f41.google.com [209.85.221.41])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4BD10390999
	for <sashiko-reviews@lists.linux.dev>; Fri, 29 May 2026 17:53:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.41
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1780077201; cv=none; b=BPTbtaIyHggqMSRFabUfkF2IwVW4tSPCEiuLTrn5wikk2dS5iZK/MSc0C0/x16h5hJiQYt6I+7vE8AI2P4skNjVQF9PJ/qI/m+QI2Un7EhXajbSM7P/GCkNO2m2wU2pYGXzTM6uMPxGZYKzCgqqP8UX3QF3JjKekaWMJWxE69UI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1780077201; c=relaxed/simple;
	bh=4eX2IheEfKEGXzQj5ef3fBL4UR13GXoPaLn+BRITsTE=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=kNQYiawshf+tsJEZje04SxlGh1SmFVatKz9aSlTs2sAECR/RYI7hW4Z1fEZZinwUGadHSSavj8lOFNgNzGKD/8HYzRUA9QZegsQZJhSkKtP/VD4R2y+ADznE6l3/us1sO4bulaMUj0ihRJr64zYfqb3An4n19NL2q4kPdi3EFmY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=I4uzGY2+; arc=none smtp.client-ip=209.85.221.41
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="I4uzGY2+"
Received: by mail-wr1-f41.google.com with SMTP id ffacd0b85a97d-459bf19e87bso8598979f8f.1
        for <sashiko-reviews@lists.linux.dev>; Fri, 29 May 2026 10:53:20 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1780077199; x=1780681999; darn=lists.linux.dev;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=Zao36TtWYxh/e80MWBb+whUA2eRiMTH3Yxx7v4i0ShY=;
        b=I4uzGY2+WhOgvOiI9/lhfcTaCyHJb6ARtZRFDz5ir55z/BRj2f/va0wombgO5MQedv
         3eOecmWU2l067U1iF9efZE3GgCjvHnnQkXfGKqmaz21wgK7Zlen2+xZuSRZKpfTjYlzP
         t/pFHz++bw5KuY4845oPpiUcDjrUr11KJKszF/Nrpl+vuuhxQA/8tpkBLn/g4D5KwD9O
         xUbSFcQrBAlu9EVT9ouceloK0WHuO7PL8cwGjUWvlcUnpV6kvzBMcwxF1rLkC2HDJwrN
         3f9JNXgKEWgUPqXCEZcyfpP00GH+/NgvfB1kLj8paGFJwezxFshlBbfThQLjicPyaaSA
         K4yA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1780077199; x=1780681999;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=Zao36TtWYxh/e80MWBb+whUA2eRiMTH3Yxx7v4i0ShY=;
        b=ouvZ5VGB4tErfvuCSJt1GnvoDYjMHYoWB3SyX8RT9Y4CHZiV6YxtbjQTMKzBnqQRlm
         vlKiZqfg5XVter1GSqnRDLLGseiPNWhUlN5JTLobqhE2bhxxifObrj8qd7dquUc6aEgU
         dqMwkqA2LBrPcW94JlPft+FB6wc9S7GnU8dbC7fy5XZl7iv8JPQcLFoIaxlJUiRLzn0I
         jIvvFtZ14rLksbhw0Ou5YIED8ri/2c4/qLAQ+7McgtDkwJDF+uYOEKmnFZtqF0dVLXYe
         4RnPap0SqmtsRtkWQ38Tj4WozzocBYTxlEn+miDaNdzcW+AAn4uQKnqBl/NxM4RtemdV
         tzyg==
X-Gm-Message-State: AOJu0YwAS9lDCeJDKwkymjnENsqfAXtqMIwrrMBfDcVS2EC8gpPak+l4
	4IrSt2brovjwIPXZub5kVgyyQZn3CFYqDlDim0MbSElcuzZVvMWvhMRLtp/jy8dV
X-Gm-Gg: Acq92OG/zMbuD8Y6qNq6deZzzu3f/uvTEF3vBSKyVneEEZ9PsNNU0cjTa/c5Xf2gE8Y
	lPz/ebE9q7MT/pJYVlKYdI4+7QzT0ijcKY7YSh/OeFGCKmmRwC2oOMdroCqjBH/RB+MA7OOAbd2
	tUILWh7CaI8WVZnzXcU66/72Cf2oyAILxAuLRGFRK6y7rKtDStuOOJn6ZHkWG6wHmnx6RSFkxf/
	CnYms16lfFZ06Cr0WrOQgpQbM0CDsieMufg2u+Y+CgUjOaI5aJ7Nh2l582UdMJppYagQHWrFrzJ
	pAjC++jGcH4N6ko+hfG8kEMBbYV5i/sSxL9aOOc6t1JSLt2tlVXcPrK1U04aV13OVM8lfW/PWb3
	t6Ypvim3GVwAgefLFAgzgGbubvNMsonlCmVgoItq/a/ybETbq6jjy2dsquch1gdp608ZbuD1vbu
	z61/qCH+NUAP5YYf+1B+RHo6VFduS+Ds/11xNBoJk3GZzTY4ZCCY2WnF7nnav9mzS9QuFwAFCyp
	ET/GwJslEDoMlEdMG0N33EUwJkwiyV9
X-Received: by 2002:adf:f2cf:0:b0:45e:f672:40fb with SMTP id ffacd0b85a97d-45ef6b4f72bmr1207924f8f.22.1780077198422;
        Fri, 29 May 2026 10:53:18 -0700 (PDT)
Received: from ?IPV6:2a01:4b00:bd1f:f500:f867:fc8a:5174:5755? ([2a01:4b00:bd1f:f500:f867:fc8a:5174:5755])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-45ef358c07bsm5227305f8f.36.2026.05.29.10.53.17
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 29 May 2026 10:53:18 -0700 (PDT)
Message-ID: <c8acb23e-ac1f-48d3-8e33-64c40bba16eb@gmail.com>
Date: Fri, 29 May 2026 18:53:17 +0100
Precedence: bulk
X-Mailing-List: sashiko-reviews@lists.linux.dev
List-Id: <sashiko-reviews.lists.linux.dev>
List-Subscribe: <mailto:sashiko-reviews+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:sashiko-reviews+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH bpf-next v5 04/11] bpf: Implement iteration ops for
 resizable hashtab
To: sashiko-reviews@lists.linux.dev
Cc: bpf@vger.kernel.org
References: <20260528-rhash-v5-4-7205191b6c57@meta.com>
 <20260528182814.AD3771F000E9@smtp.kernel.org>
Content-Language: en-US
From: Mykyta Yatsenko <mykyta.yatsenko5@gmail.com>
In-Reply-To: <20260528182814.AD3771F000E9@smtp.kernel.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit



On 5/28/26 7:28 PM, sashiko-bot@kernel.org wrote:
> Thank you for your contribution! Sashiko AI review found 3 potential issue(s) to consider:
> - [Critical] Missing error pointer check in `rhtab_map_get_next_key` leads to unhandled error pointer dereferences and kernel panics.
> - [High] `bpf_each_rhash_elem` illegally calls `cond_resched()` and drops `rcu_read_lock()` from within a BPF map iterator callback, which will trigger kernel panics in atomic contexts.
> - [High] Batch lookup and `seq_file` iterators prematurely terminate when encountering concurrent deletions, breaking BPF map iteration guarantees and causing silent data omission.
> --
> 
> commit afc331365f30658242015d82e7bdd35a014f432d
> Author: Mykyta Yatsenko <yatsenko@meta.com>
> 
> bpf: Implement iteration ops for resizable hashtab
> 
> Implement rhtab_map_get_next_key(), batch lookup/lookup-and-delete,
> and the seq_file BPF iterator for BPF_MAP_TYPE_RHASH.
> 
>> diff --git a/kernel/bpf/hashtab.c b/kernel/bpf/hashtab.c
>> index 8944c9f070ca8..a03fa5fa6545b 100644
>> --- a/kernel/bpf/hashtab.c
>> +++ b/kernel/bpf/hashtab.c
>> @@ -3021,10 +3021,363 @@ static void rhtab_map_free_internal_structs(struct bpf_map *map)
>>  }
>>  
>>  static int rhtab_map_get_next_key(struct bpf_map *map, void *key, void *next_key)
>> +	__must_hold_shared(RCU)
>>  {
>> -	return -EOPNOTSUPP;
>> +	struct bpf_rhtab *rhtab = container_of(map, struct bpf_rhtab, map);
>> +	struct rhtab_elem *elem;
>> +
>> +	elem = rhashtable_next_key(&rhtab->ht, key, rhtab_params);
>> +
>> +	/* if not found, return the first key */
>> +	if (PTR_ERR(elem) == -ENOENT)
>> +		elem = rhashtable_next_key(&rhtab->ht, NULL, rhtab_params);
>> +
>> +	if (!elem)
>> +		return -ENOENT;
>> +
>> +	memcpy(next_key, elem->data, map->key_size);
> 
> [Severity: Critical]
> Could this dereference an error pointer if rhashtable_next_key() returns
> ERR_PTR(-EAGAIN)? 
> 
> The first check only handles -ENOENT. If we get -EAGAIN (which can happen
> during concurrent resizing), it bypasses the PTR_ERR check, passes the
> !elem check since it isn't NULL, and then passes the error pointer directly
> into memcpy().
> 

-EAGAIN is never returned from rhashtable_next_key(), but the error check
can be made more reliable. I'll address this for the v6

>> +	return 0;
>> +}
> 
> [ ... ]
> 
>> +static long bpf_each_rhash_elem(struct bpf_map *map, bpf_callback_t callback_fn,
>> +				void *callback_ctx, u64 flags)
>> +{
>> +	struct bpf_rhtab *rhtab = container_of(map, struct bpf_rhtab, map);
>> +	void *prev_key = NULL;
> 
> [ ... ]
> 
>> +	rcu_read_lock();
>> +	/*
>> +	 * Best-effort iteration: if rhashtable is concurrently resized or
>> +	 * elements are deleted/inserted, there may be missed or duplicate
>> +	 * elements visited.
>> +	 */
>> +	while ((elem = rhashtable_next_key(&rhtab->ht, prev_key, rhtab_params))) {
>> +		if (IS_ERR(elem))
>> +			break;
>> +		num_elems++;
>> +		ret = callback_fn((u64)(long)map,
>> +				  (u64)(long)elem->data,
>> +				  (u64)(long)rhtab_elem_value(elem, map->key_size),
>> +				  (u64)(long)callback_ctx, 0);
>> +		if (ret)
>> +			break;
>> +
>> +		prev_key = elem->data;	/* valid while RCU held */
>> +
>> +		if (need_resched()) {
>> +			memcpy(key_buf, elem->data, map->key_size);
>> +			rcu_read_unlock();
>> +			cond_resched();
> 
> [Severity: High]
> Can this cond_resched() trigger "BUG: scheduling while atomic" panics?
> 
> BPF programs using the bpf_for_each_map_elem helper often run in
> non-sleepable contexts (like XDP, TC, or tracing) under an outer RCU read
> lock or with preemption disabled. 
> 
> While this drops the inner RCU lock, it doesn't exit the outer atomic
> context, so sleeping here might violate those constraints and cause system
> instability.
> 

yes, I'll remove cond_resched() from here. Dropping and re-acquiring rcu lock,
though may still be needed.

>> +			rcu_read_lock();
>> +			prev_key = key_buf;
>> +		}
>> +	}
>> +	rcu_read_unlock();
> 
> [ ... ]
> 
>> +static int __rhtab_map_lookup_and_delete_batch(struct bpf_map *map,
>> +					       const union bpf_attr *attr,
>> +					       union bpf_attr __user *uattr,
>> +					       bool do_delete)
>> +{
> 
> [ ... ]
> 
>> +	rcu_read_lock();
>> +
>> +	/*
>> +	 * Cursor stores the key of the next-to-process element (stashed by
>> +	 * the previous batch). Look it up directly so the element is included
>> +	 * here rather than skipped by next_key(). If the cursor was deleted
>> +	 * concurrently (or by the previous do_delete batch), lookup returns
>> +	 * NULL and userspace must restart from a NULL cursor.
>> +	 */
>> +	if (ubatch)
>> +		elem = rhtab_lookup_elem(map, cursor);
>> +	else
>> +		elem = rhashtable_next_key(&rhtab->ht, NULL, rhtab_params);
>> +
>> +	while (elem && !IS_ERR(elem) && total < max_count) {
> 
> [Severity: High]
> Will this prematurely terminate the batch iteration if a concurrent deletion
> occurs? 
> 
> If the cursor element was concurrently deleted, rhashtable_next_key() returns
> ERR_PTR(-ENOENT). This loop checks !IS_ERR(elem) and will break out early.
> 
> This results in the function returning -ENOENT to userspace. Under BPF UAPI
> semantics, userspace interprets -ENOENT as the end of the map, which might
> cause silent data omission instead of safely recovering or continuing.

Maybe return -EAGAIN in case of cursor deletion, so that userspace will retry.

> 
>> +		memcpy(dst_key, elem->data, key_size);
>> +		rhtab_read_elem_value(map, dst_val, elem, elem_map_flags);
>> +		check_and_init_map_value(map, dst_val);
> 
> [ ... ]
> 
>> +static void *bpf_rhash_map_seq_next(struct seq_file *seq, void *v, loff_t *pos)
>> +{
>> +	struct bpf_iter_seq_rhash_map_info *info = seq->private;
>> +	struct rhtab_elem *elem = v;
>> +	void *next;
>> +
>> +	memcpy(info->last_key, elem->data, info->map->key_size);
>> +	info->last_key_valid = true;
>> +	++*pos;
>> +
>> +	next = rhashtable_next_key(&info->rhtab->ht, info->last_key,
>> +				   rhtab_params);
>> +	if (IS_ERR(next))
>> +		return NULL;
> 
> [Severity: High]
> Does this also prematurely terminate the seq_file iteration on concurrent
> deletions? 
> 
> Similar to the batch logic above, returning NULL when next is
> ERR_PTR(-ENOENT) signals the end of the sequence to the iterator, which could
> silently truncate the iteration results.

Yes, in case cursor is deleted, the iteration finishes early.

> 
>> +	return next;
>> +}
> 

