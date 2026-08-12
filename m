Received: from out-186.mta0.migadu.com (out-186.mta0.migadu.com [91.218.175.186])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 49FF6242D72
	for <sashiko-reviews@lists.linux.dev>; Wed, 12 Aug 2026 04:03:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=91.218.175.186
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1786507423; cv=none; b=aaojfOUT65+qCZbphvQMhmLwlRkyNOTTzR24Dol9jY38c30xwY0jfcBfM5KgJhbA7/iStYsEU9nFKELOBFdHZZ6TFAd2TkAGXuMx0+yOSv3AGeXA5XDHNMQBO1q2tAnH2PZayHaFvFxhSKV3Q6y72rkpL4c1Gie7LZlcXSy/5YI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1786507423; c=relaxed/simple;
	bh=9nB8m9mA3i5WZeahQAYRKX2mWd1kfqTJDBokaIgrmm0=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=IBB3hYriDNBUE+SmN8mNr6fLXoD97wbYx7ehxs6lVDP8AbwDXvavVvCdpRDegz0/x/5ZtG4V3u4Ja4MSQq4oLp6KIerHPpX2ff+D1PCYJmMBOLK3qtIQIwAuvvWN3oZMIDOz8c1Z6DjxYKVA6gxSWNEQCNJPbiiuuPcdfTbJK+E=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.dev; spf=pass smtp.mailfrom=linux.dev; dkim=pass (1024-bit key) header.d=linux.dev header.i=@linux.dev header.b=ohEfkZaf; arc=none smtp.client-ip=91.218.175.186
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.dev
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.dev
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linux.dev header.i=@linux.dev header.b="ohEfkZaf"
Message-ID: <65d6c144-4054-45d2-8dd6-3384741e9a02@linux.dev>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linux.dev; s=key1;
	t=1786507420;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=7yXNNhbTCPR25hWfOjX8mMbC18aq2XESBeQBd6mMEMQ=;
	b=ohEfkZafJku2kyNyjXpXOT8uJn8OzZU4Sjy+0N9HFCdSHg2lc5tg9OYuS2Juiopa4X1t7z
	f2i2waIALntUFOWlrGSUpepNo8q8p+5mx7JdhbbAtc9wlYoMLgF2Pph+cJw8LZQUZYnWFX
	Lv9Wv8seMBl45sFX6jPEpe3DT9szjmc=
Date: Wed, 12 Aug 2026 12:03:34 +0800
Precedence: bulk
X-Mailing-List: sashiko-reviews@lists.linux.dev
List-Id: <sashiko-reviews.lists.linux.dev>
List-Subscribe: <mailto:sashiko-reviews+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:sashiko-reviews+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Subject: Re: [PATCH bpf-next 04/13] bpf: Add tracing_multi link support for
 bpf progs
To: sashiko-reviews@lists.linux.dev
Cc: bpf@vger.kernel.org
References: <20260809150111.45000-1-leon.hwang@linux.dev>
 <20260809150111.45000-5-leon.hwang@linux.dev>
 <20260809153308.5331D1F000E9@smtp.kernel.org>
Content-Language: en-US
X-Report-Abuse: Please report any abuse attempt to abuse@migadu.com and include these headers.
From: Leon Hwang <leon.hwang@linux.dev>
In-Reply-To: <20260809153308.5331D1F000E9@smtp.kernel.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Migadu-Flow: FLOW_OUT

On 9/8/26 23:33, sashiko-bot@kernel.org wrote:
> Thank you for your contribution! Sashiko AI review found 2 potential issue(s) to consider:
> - [High] A text poke failure during the detachment of a `tracing_multi` link from BPF programs causes a Use-After-Free of the trampoline executable image and a double free.
> - [Medium] Trampoline flags are not rolled back when `__bpf_trampoline_link_prog` fails during `bpf_trampoline_multi_attach`, permanently corrupting the state of the shared trampoline.
> --
> 
> --- Patch [4]: [PATCH bpf-next 04/13] bpf: Add tracing_multi link support for bpf progs ---
> commit b93dc01dd11e0331789988b67d9503ac3b565c51
> Author: Leon Hwang <leon.hwang@linux.dev>
> 
>     bpf: Add tracing_multi link support for bpf progs
>     
>     Similar to the tracing_multi link support for kernel functions, add
>     support for bpf progs by reusing the 'ids' fields as BTF ids, and adding
>     fds array to indicate the target bpf prog. Then, for each pair of fd+id,
>     they will be the attach targets of tracing_multi link.
> 
>> diff --git a/kernel/bpf/trampoline.c b/kernel/bpf/trampoline.c
>> index eddd259d37760..fc51ea2428bee 100644
>> --- a/kernel/bpf/trampoline.c
>> +++ b/kernel/bpf/trampoline.c
>> @@ -1572,12 +1572,23 @@ static int update_fentry_multi(struct bpf_trampoline *tr, u32 orig_flags,
>>  			       struct bpf_tramp_image *im, struct ftrace_hash *hash,
>>  			       struct bpf_tracing_multi_data *data)
>>  {
>> -	unsigned long addr = (unsigned long)(im ? im->image : tr->cur_image->image);
>> +	if (tr->func.ftrace_managed) {
>> +		unsigned long addr = (unsigned long)(im ? im->image : tr->cur_image->image);
>>  
>> -	if (bpf_trampoline_use_jmp(tr->flags))
>> -		addr = ftrace_jmp_set(addr);
>> +		if (bpf_trampoline_use_jmp(tr->flags))
>> +			addr = ftrace_jmp_set(addr);
>> +
>> +		ftrace_hash_add(hash, data->entry, tr->ip, addr);
>> +	} else {
>> +		void *old_addr = tr->cur_image ? tr->cur_image->image : NULL;
>> +		void *new_addr = im ? im->image : NULL;
>> +		int ret;
>> +
>> +		ret = bpf_trampoline_update_fentry(tr, orig_flags, old_addr, new_addr);
>> +		if (ret)
>> +			return ret;
> 
> [Severity: High]
> If bpf_trampoline_update_fentry() fails here, we return the error and bypass
> updating tr->cur_image. In bpf_trampoline_multi_detach(), if
> __bpf_trampoline_unlink_prog() fails, it logs a warning but continues and
> unconditionally calls bpf_trampoline_multi_attach_free(). 
> 
> Since tr->cur_image wasn't updated, does bpf_trampoline_multi_attach_free()
> end up freeing the currently active executable image, leading to a
> use-after-free and a double free on the next attach/detach?
> 

The potential UAF issue will be fixed by Hui's patch [1].

[1]
https://lore.kernel.org/bpf/aaa3829e11e2e26bcd3bda9ee6df7a0101a718ac.1786412280.git.zhuhui@kylinos.cn/

>> +	}
>>  
>> -	ftrace_hash_add(hash, data->entry, tr->ip, addr);
>>  	tr->cur_image = im;
>>  	return 0;
>>  }
> 
> [ ... ]
> 
>> @@ -1691,6 +1715,9 @@ int bpf_trampoline_multi_attach(struct bpf_prog *prog, u32 *ids,
>>  	for_each_mnode(mnode, link) {
>>  		bpf_trampoline_multi_attach_init(mnode->trampoline);
>>  
>> +		if (progs && progs[i]->aux->tail_call_reachable)
>> +			mnode->trampoline->flags |= BPF_TRAMP_F_TAIL_CALL_CTX;
>> +
> 
> [Severity: Medium]
> If __bpf_trampoline_link_prog() fails below, the error handler sets
> rollback_cnt = i and skips rolling back the current node i.
> 
> Does this leave the BPF_TRAMP_F_TAIL_CALL_CTX flag permanently set on the
> trampoline?
> 

False positive. If the target bpf prog is tail_call_reachable, the
tr->flags must keep BPF_TRAMP_F_TAIL_CALL_CTX always.

Thanks,
Leon

>>  		data->entry = &mnode->entry;
>>  		err = __bpf_trampoline_link_prog(&mnode->node, mnode->trampoline, NULL,
>>  						 &trampoline_multi_ops, data);
> 

