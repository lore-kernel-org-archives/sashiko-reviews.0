Received: from out-182.mta1.migadu.com (out-182.mta1.migadu.com [95.215.58.182])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AD5C625B0A9
	for <sashiko-reviews@lists.linux.dev>; Thu, 11 Jun 2026 01:48:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=95.215.58.182
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1781142490; cv=none; b=API2snB50l6hc/PVfG/wvFWxEX5pxpT6S76AG7JTS8Yf6Gg4Z3CaqizGIKcZ0uaTYwRgd+0mP8vcI6M/ZSCFeU1jiZEcIqM9cj9ubhHueaf0ZLzJLGUnfMVZcFjKxuig2KxQ18zFLipiDXki/WUAphlVa6NDc3W/mipFadfyzaM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1781142490; c=relaxed/simple;
	bh=ZtUhtXaWp3nlh4NfgZdvT+fiZ7rLaE5Hxy8HLTWD2Oo=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=MKWMVvqwFfV8kJNWWi6ZlWVogx8NCqROq8N8+1Iuwt4PihplWwhFkzJQT4EAMAJzf3wP7BQtof1QRnXJV222OGL8Dkxm2rCRPT5a1In4xncV9uK3oSXfD810C0+zHbRp9/rKvdPoCwXZ0/n3RyoA4ETEsCsEYSVw6Xvn+o3ovY0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.dev; spf=pass smtp.mailfrom=linux.dev; dkim=pass (1024-bit key) header.d=linux.dev header.i=@linux.dev header.b=d5NhJQVD; arc=none smtp.client-ip=95.215.58.182
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.dev
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.dev
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linux.dev header.i=@linux.dev header.b="d5NhJQVD"
Message-ID: <0c6d0fb2-c36b-4617-bfb8-d800fd0934d6@linux.dev>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linux.dev; s=key1;
	t=1781142476;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=bkhePRal5Pidl/fTMbHF5XpbS+bZtBw8nmxhCBAkzH4=;
	b=d5NhJQVDg+lXZaRjbtKyExzR4TXj2SFDCQk9sir/x194nEscyCzybcdliixs/zFTYBiAaM
	Q6wCJ2ZDqx0YM1lV09tv8lxO7Gidzqaixe4E/d8f8DEZlFhMKcX7Mp8qKveiWlzCt7AMFf
	A1Cm/pNhbAJnlE3/08CN1yj8tPiyrL8=
Date: Thu, 11 Jun 2026 09:47:44 +0800
Precedence: bulk
X-Mailing-List: sashiko-reviews@lists.linux.dev
List-Id: <sashiko-reviews.lists.linux.dev>
List-Subscribe: <mailto:sashiko-reviews+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:sashiko-reviews+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Subject: Re: [PATCH bpf 3/4] bpf, sockmap: zero-initialize pages allocated in
 bpf_msg_push_data
To: sashiko-reviews@lists.linux.dev
Cc: bpf@vger.kernel.org
References: <20260611013547.247039-4-jiayuan.chen@linux.dev>
 <20260611014512.9B7281F00893@smtp.kernel.org>
X-Report-Abuse: Please report any abuse attempt to abuse@migadu.com and include these headers.
From: Jiayuan Chen <jiayuan.chen@linux.dev>
In-Reply-To: <20260611014512.9B7281F00893@smtp.kernel.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Migadu-Flow: FLOW_OUT


On 6/11/26 9:45 AM, sashiko-bot@kernel.org wrote:
> Thank you for your contribution! Sashiko AI review found 1 potential issue(s) to consider:
>
> Pre-existing issues:
> - [High] The patch intended to fix a heap information leak in `bpf_msg_push_data()` but mistakenly modified `bpf_msg_pull_data()` instead. The uninitialized memory exposure in `bpf_msg_push_data()` remains active.
> --
>
> commit 6cfebe959c2ffe911ff763388e942ea998f90682
> Author: Weiming Shi <bestswngs@gmail.com>
>
> bpf, sockmap: zero-initialize pages allocated in bpf_msg_push_data
>
> The commit intends to fix a kernel heap information leak in bpf_msg_push_data
> by zero-initializing the allocated page before adding it to the scatterlist.
> It adds the __GFP_ZERO flag to the alloc_pages call to prevent stale kernel
> pointers from leaking to userspace.
>
> Link: https://lore.kernel.org/all/20260424155913.A19FDC19425@smtp.kernel.org
>
>> diff --git a/net/core/filter.c b/net/core/filter.c
>> index 3e555f276ba80..982d59cf659f5 100644
>> --- a/net/core/filter.c
>> +++ b/net/core/filter.c
>> @@ -2716,7 +2716,7 @@ BPF_CALL_4(bpf_msg_pull_data, struct sk_msg *, msg, u32, start,
>>   	if (unlikely(bytes_sg_total > copy))
>>   		return -EINVAL;
>>   
>> -	page = alloc_pages(__GFP_NOWARN | GFP_ATOMIC | __GFP_COMP,
>> +	page = alloc_pages(__GFP_NOWARN | GFP_ATOMIC | __GFP_COMP | __GFP_ZERO,
>>   			   get_order(copy));
> [Severity: High]
> This isn't a bug introduced by this patch, but this patch completely fails to
> fix the issue described in the commit message.


You are right.

When resolving the conflict, something went wrong.


>
> The commit message states the fix is for bpf_msg_push_data, but the diff
> applies the __GFP_ZERO flag to bpf_msg_pull_data instead.
>
> In bpf_msg_pull_data, the bytes exposed to the scatterlist are already fully
> initialized via memcpy, making the __GFP_ZERO flag unnecessary overhead.
>
> Meanwhile, the alloc_pages call in bpf_msg_push_data still lacks the __GFP_ZERO
> flag, leaving the original information leak fully exploitable:
>
> net/core/filter.c:bpf_msg_push_data() {
>          ...
>          page = alloc_pages(__GFP_NOWARN | GFP_ATOMIC | __GFP_COMP,
>                             get_order(copy + len));
>          ...
> }
>
> Could the __GFP_ZERO flag be moved to the correct alloc_pages call in
> bpf_msg_push_data?
>
>>   	if (unlikely(!page))
>>   		return -ENOMEM;
