Received: from out-182.mta1.migadu.com (mta1.migadu.com [37.59.57.117])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2D9313191D0
	for <sashiko-reviews@lists.linux.dev>; Wed, 12 Aug 2026 04:03:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=37.59.57.117
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1786507399; cv=none; b=U0bEVjCtlv2GLQlu8GAgbi5e2dcnU+0BfjuH/2toC8E9NAmNtcAGnr38qI1M9DuGlOUF/b4hUb129Hx1tY5GyUz21tbGNof1O/LbP4Zo2lqZfiqhKYI0QSPeD7TvmW6+yeRzB/mETdgzwxFet6RmUngXSq5DQxEcmH5vxKHUaXE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1786507399; c=relaxed/simple;
	bh=eqQL7PzRmYFlQnSqgkhleoEEpCE3AJFyzddDt9bakaI=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=HQFv6TqWuhqB5y4exiPPo81fy5/Io+7lQ71tK1jF9iGNMUQWRdMWGZHtyxopgQX+m8Im8RI4ys+pcFojbj0yvlyrG3lmgiFnw0QaYgYKLb/zl1zEzOxMH7++w0Ulo6pX34Df3zRFIRWn0ZQxJwUqD30qm7Njl5su47lL5VtbDXk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.dev; spf=pass smtp.mailfrom=linux.dev; dkim=pass (1024-bit key) header.d=linux.dev header.i=@linux.dev header.b=PzvQ2jUE; arc=none smtp.client-ip=37.59.57.117
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.dev
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.dev
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linux.dev header.i=@linux.dev header.b="PzvQ2jUE"
Message-ID: <4cbf31a2-c3ec-459a-a0b7-5a5f6e9c5fce@linux.dev>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linux.dev; s=key1;
	t=1786507385;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=jl8RugOlQzZny737vIz0A+aYF7ZRm3VJqbI6xEREGvU=;
	b=PzvQ2jUEXIP36fnXPTRT2aMBS4G8s3DkKt27WR+uCRNSg7AakYK5npSQrewGapFTEbml93
	sg9c9oJywf8HvX6ZyyNBBEBwPvIbyG10MyTmu2OdZbrpQrFx2nwQ5FWSLH2SFdPT3P2Oar
	TB+ITubdNHIyz3tD+1lTJSX0NUJ9/Tk=
Date: Wed, 12 Aug 2026 12:02:35 +0800
Precedence: bulk
X-Mailing-List: sashiko-reviews@lists.linux.dev
List-Id: <sashiko-reviews.lists.linux.dev>
List-Subscribe: <mailto:sashiko-reviews+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:sashiko-reviews+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Subject: Re: [PATCH bpf-next 02/13] bpf: Factor out update_fentry_multi helper
To: sashiko-reviews@lists.linux.dev
Cc: bpf@vger.kernel.org
References: <20260809150111.45000-1-leon.hwang@linux.dev>
 <20260809150111.45000-3-leon.hwang@linux.dev>
 <20260809151433.627C21F000E9@smtp.kernel.org>
Content-Language: en-US
X-Report-Abuse: Please report any abuse attempt to abuse@migadu.com and include these headers.
From: Leon Hwang <leon.hwang@linux.dev>
In-Reply-To: <20260809151433.627C21F000E9@smtp.kernel.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Migadu-Flow: FLOW_OUT

On 9/8/26 23:14, sashiko-bot@kernel.org wrote:
> Thank you for your contribution! Sashiko AI review found 1 potential issue(s) to consider:
> - [Low] The `orig_flags` parameter in the new `update_fentry_multi` helper function is unused.
> --
> 
> --- Patch [2]: [PATCH bpf-next 02/13] bpf: Factor out update_fentry_multi helper ---
> commit c90e2dad924e48bb1043b67addb36ec916a663d1
> Author: Leon Hwang <leon.hwang@linux.dev>
> 
> bpf: Factor out update_fentry_multi helper
> 
> This commit factors out common functionality from the register, unregister,
> and modify multi fentry callbacks into a new update_fentry_multi helper.
> 
>> diff --git a/kernel/bpf/trampoline.c b/kernel/bpf/trampoline.c
>> index 8c2c1d1b90941..6e1898e1b200f 100644
>> --- a/kernel/bpf/trampoline.c
>> +++ b/kernel/bpf/trampoline.c
>> @@ -1568,47 +1568,41 @@ static void ftrace_hash_add(struct ftrace_hash *hash, struct ftrace_func_entry *
>>  	add_ftrace_hash_entry(hash, entry);
>>  }
>>  
>> -static int register_fentry_multi(struct bpf_trampoline *tr, struct bpf_tramp_image *im, void *ptr)
>> +static int update_fentry_multi(struct bpf_trampoline *tr, u32 orig_flags,
>> +			       struct bpf_tramp_image *im, struct ftrace_hash *hash,
>> +			       struct bpf_tracing_multi_data *data)
>>  {
> 
> [Severity: Low]
> Is it intended to keep the orig_flags parameter here? It appears to be
> completely unused in the body of this new helper function.
> 

Yes, it was intended.

However, will drop orig_flags when re-implementing tracing_multi link
support for bpf progs with another code path.

Thanks,
Leon

