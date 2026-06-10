Received: from mail-pf1-f176.google.com (mail-pf1-f176.google.com [209.85.210.176])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DC88B1DE4EF
	for <sashiko-reviews@lists.linux.dev>; Wed, 10 Jun 2026 04:24:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.176
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1781065474; cv=none; b=Gv6SGGMztC5GuyZtU/eVkETzAoNxo1bMZ9ohpekqDTSapfnBC6ienWjK1ZgkX8sbkMgDZnZVHtw4cQmUvqd4C77d88HqFTfZlXiH4yTm3JfX7l5tSA3zhWsQsR+KaR2iuaK7Z5dsgLd7oKVsuu/2l/JXDg4P34ErbdkwDOxcnV0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1781065474; c=relaxed/simple;
	bh=2CqF8p5dw/XxEAz11Zh8DDYuf1c9GnMd4+BGC6W4CqA=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=ufmzzwB5AuTp+ixZI6UbUYk7Z+EuS4smLfQLIjfAwuePrcxFPZ2ej/o5+DnzEVJ3O85Rqwk9v/Yc6Z2lEGy7mM66JocVF8kF8qrlcABrSMyDDG8flqfjvFGCfvsi19ST+vnxeztBW+X+kOH6AEkk2QVo+RRY8Cvpl/BF3rW5lCg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=CDXbVOWI; arc=none smtp.client-ip=209.85.210.176
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="CDXbVOWI"
Received: by mail-pf1-f176.google.com with SMTP id d2e1a72fcca58-842848fd613so5290395b3a.3
        for <sashiko-reviews@lists.linux.dev>; Tue, 09 Jun 2026 21:24:32 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1781065472; x=1781670272; darn=lists.linux.dev;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=wwS2XQIcEgtV0x4G9OnLh7cNs9kyFtmykvsZ/mlbH4Q=;
        b=CDXbVOWIvljj8xxc+gGlUaRjiIKD3hKUj6/68u+yUW8m6cuhEZwvaVtJZxPT2sWJVF
         izrwY+mDa36V1+zmVBVLVFIyt1G9zLw23faQrYa3ytqJ9pb0I5JrFLYfvzlpmWbBpUAH
         TVrRXUA/C+WbSmYV4G/31EqxCg1LpquarkGRHMXaTM8BWO0J1v4KzrnV2XA2dKwk7657
         BM6NOTaPpqYeH/RMi9A9W5WfagOM9A1Z3Xz30eOTq8qhUlryyF7We4fvXl7klXjDHJa/
         OUriTZEtq1EwUlvdwP/0Jmm5MXF0yLdJn0MlEj7zHEVK069jElGBgyJ3QCqARzkNrawe
         9W+g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1781065472; x=1781670272;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=wwS2XQIcEgtV0x4G9OnLh7cNs9kyFtmykvsZ/mlbH4Q=;
        b=Z8Pz3zviZ3VZt2hqpgvJCrzw97IUFLl3jTxncCUZgzjBNtQs5KtFvu0o5AKU0FruWB
         GZ/QNPpNyTurxqC7riA04llhX0deJpAjyAM3qRfCVVC9t32Ke8nxDfk+nWz66/q+n6Lq
         iH0FSgGJLYwxcMBVtb7rSZctwPyJbTjGnK445zDd1GV/JRHHafb+nVRjAxngZon9lkLB
         LWBkbB/W3NLOyyp62Qz7JRgxmZnvXDS8rkutRMqd7Suhy8NqxJcAgpFcquJI2y+Bcinx
         yNxpS/Zli14erT3G/nFLeKWGWqFDPGp71f5APrm7VB4Ie3qWDRi1ZDMGhTWZvZHdfbTD
         4q9w==
X-Gm-Message-State: AOJu0Yw7uHC18QZ57BRZvPo02r7xyBB/UMk92tG1Hhg6IY4vB8MnjQwz
	E9nLxulEyTTX6ZCWJ+H6vXi3VWY+vsWxfiulfduwbJbihXVWnelb2LWW
X-Gm-Gg: Acq92OHvOJoDXwZhVCltvQkqemrpRmtXZGu36V1pXmN2WWKrEEmG80SolRdj1B1i6Qw
	YKI20pnnoQY1qrk4C/HY6PY/OxWRih2LNOvttEYU/vM03WDrJ2gpEpNDrvY4w6KBDzSU+jbvyWF
	MHkvayUoAqZWnNreuDqNiqrGJbZU4mximFcYBeaA4WYYRMvCyZHagWNQBx1jA4WSwnhanmbb/8Z
	gFzbF4pq3xtrMURV6Ve4ONkW9aIM2+UYp3PITF4FR4Wd2xjPD7yaK1FShqLG6YIuTE+hhdkXCmE
	t7ecOQKO0kZ95fNVqzZMDQuPtTp0aAMO+Pa4HQHh5H6HrrdrFerHgitd2kSBNWJoQqtF9DC2Sks
	xSGfaanmwUrN+WPBnwLe53Jo1G65GVEnGRuHZK/JRAe7gaYh0CjS5GXiyNezqNKPIG25M+8ZDYA
	738FJio0pp/9W69opnZ5FV/1f9hSTzpPtq78b1ntuKd2oAqEinNdRaohiI9AP5fboOaFvSMEk+W
	fY0NrS9
X-Received: by 2002:a05:6a20:729b:b0:3b5:28d1:8bb5 with SMTP id adf61e73a8af0-3b53bc5c1f4mr7697024637.11.1781065472043;
        Tue, 09 Jun 2026 21:24:32 -0700 (PDT)
Received: from cps-manycore-1 ([147.46.174.222])
        by smtp.gmail.com with ESMTPSA id 41be03b00d2f7-c85df0bdbe4sm20002858a12.32.2026.06.09.21.24.30
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 09 Jun 2026 21:24:31 -0700 (PDT)
Date: Wed, 10 Jun 2026 04:24:13 +0000
From: Sechang Lim <rhkrqnwk98@gmail.com>
To: Emil Tsalapatis <emil@etsalapatis.com>
Cc: sashiko-reviews@lists.linux.dev, bpf@vger.kernel.org
Subject: Re: [PATCH bpf] bpf, sockmap: fix integer overflow in
 bpf_msg_pop_data() bounds check
Message-ID: <ffogb2v2lpkznolxyxqzpa2semo74gytqgznuqs3zzjirjmjul@eezstkfy65d2>
References: <20260609183927.4021802-1-rhkrqnwk98@gmail.com>
 <20260609185257.A09111F00893@smtp.kernel.org>
 <DJ4UMEV0NQE2.14XTJKL239Z4Y@etsalapatis.com>
Precedence: bulk
X-Mailing-List: sashiko-reviews@lists.linux.dev
List-Id: <sashiko-reviews.lists.linux.dev>
List-Subscribe: <mailto:sashiko-reviews+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:sashiko-reviews+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii; format=flowed
Content-Disposition: inline
In-Reply-To: <DJ4UMEV0NQE2.14XTJKL239Z4Y@etsalapatis.com>

On Tue, Jun 09, 2026 at 05:49:49PM -0400, Emil Tsalapatis wrote:
>On Tue Jun 9, 2026 at 2:52 PM EDT, sashiko-bot wrote:
>> Thank you for your contribution! Sashiko AI review found 2 potential issue(s) to consider:
>>
>> Pre-existing issues:
>> - [High] Unbounded `len` parameter in `bpf_msg_push_data` causes a 32-bit integer overflow when calculating the page allocation size (`copy + len`), resulting in an out-of-bounds heap write.
>> - [High] Incorrect scatterlist element offset calculation when splitting an element in `bpf_msg_push_data` inflates the page offset, leading to out-of-bounds memory accesses.
>> --
>>
>> commit 619f5b1d1aebdbd6457c3ac6e3a92bc45be7278c
>> Author: Sechang Lim <rhkrqnwk98@gmail.com>
>
>The change seems solid, the error is apparent from code inspection
>alone (though a repro wouldn't hurt). Can you also turn pop from an int
>to a u32? It should never be negative AFAICT, and we assign to it from
>a u32 so since we're fixing int types...
>

Will do in v2.

>>
>> bpf, sockmap: fix integer overflow in bpf_msg_pop_data() bounds check
>>
>> start and len are u32, so start + len evaluates in 32-bit and wraps before
>> storing it in last. The bounds check can then be passed with an out-of-range
>> start/len.
>>
>>> diff --git a/net/core/filter.c b/net/core/filter.c
>>> index 9590877b0714f..31467c0b4279e 100644
>>> --- a/net/core/filter.c
>>> +++ b/net/core/filter.c
>>> @@ -2974,7 +2974,7 @@ BPF_CALL_4(bpf_msg_pop_data, struct sk_msg *, msg, u32, start,
>>>  	   u32, len, u64, flags)
>>>  {
>>>  	u32 i = 0, l = 0, space, offset = 0;
>>> -	u64 last = start + len;
>>> +	u64 last = (u64)start + len;
>>
>> [Severity: High]
>> This isn't a bug introduced by this patch, but while fixing the integer
>> overflow in bpf_msg_pop_data(), could a similar overflow occur in
>> bpf_msg_push_data()?
>>
>> Looking at net/core/filter.c:bpf_msg_push_data(), both copy and len are u32:
>>
>> 	page = alloc_pages(__GFP_NOWARN | GFP_ATOMIC | __GFP_COMP,
>> 			   get_order(copy + len));
>>
>
>This seems like a valid concern. Can you add it to the patch? Making
>copy a u64 should do it.
>

Already handled by Weiming Shi:
https://lore.kernel.org/bpf/20260424191602.1522411-3-bestswngs@gmail.com/

>> If the split element is not the first one in the message, wouldn't rsge.offset
>> be inflated by the cumulative length of all previous elements instead of the
>> relative offset (start - offset)?
>
>It does, this seems like a real bug. AFAICT the offset of rsge should be
>
>rsge.offset = start + len.
>
>Can you confirm and add to the next version?
>

Already fixed upstream:
https://lore.kernel.org/bpf/8b129d10566aa3eb43f61a8f9757bcf51707d324.1779636774.git.xuyq21@lenovo.com/

So I'll keep v2 to the bpf_msg_pop_data() fix plus the pop type change.

Thanks,
Sechang
