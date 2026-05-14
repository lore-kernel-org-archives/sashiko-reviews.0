Received: from out-170.mta1.migadu.com (out-170.mta1.migadu.com [95.215.58.170])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5D40B3EDE5B
	for <sashiko-reviews@lists.linux.dev>; Thu, 14 May 2026 14:25:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=95.215.58.170
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778768759; cv=none; b=TgLv+wBuXCE0mXW1ua23gf+extctLzHaIll0TG/r6FkLMcDAR9Pa5U2jreribCUhWCyqLgtb+kGvHi875ryz9cG+L3onHohr5AGrRTnlvFkKrJc0ucM3u0JuccMNv5IUGnO4Q/nDom8rPkk6L4+dfHALJLXsfAIbNe6bU4movP0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778768759; c=relaxed/simple;
	bh=aqUjq4sdfXmZFvOW0/pZHRVp3t1VN3UWBpFzPP3e2vs=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=P4GVlTxDnAAQO9bRVq0dHXBeuwgC6RC6Zcfe+h90QBolOL94v+7U8UKlbO6kh4nqCYn7CIIJ9hZVz//ZbJLvCzGUv3IdkSMx7Uy8NyLWhwZiwkDfD4s4F+xyAp/62NBPjlsTvF5FdLzk1D3rCAJI7/1OYYLeSo6B5P0jNCWDv/o=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.dev; spf=pass smtp.mailfrom=linux.dev; dkim=pass (1024-bit key) header.d=linux.dev header.i=@linux.dev header.b=YLpSdgJI; arc=none smtp.client-ip=95.215.58.170
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.dev
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.dev
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linux.dev header.i=@linux.dev header.b="YLpSdgJI"
Message-ID: <a4b844d8-cd37-4bb1-9e19-7b037ee91723@linux.dev>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linux.dev; s=key1;
	t=1778768756;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=hzk+OsRFc/25MhxadfcCJk2P+tziSYp2bEBFg7gzPF4=;
	b=YLpSdgJI5bXRR2EguhmjlZUhmMdq3OC9nXVlgMvlOwIMQbmsHS7WjLbCnzrnL7DqHCuZkU
	xE8FnTDQhFAfEraBSF3kgq64AqLR05PBLqxN6swmgcEmz4E8rX2iXH9FkQZk4ZvYH0iUZ+
	gOiUlvYZz3RFxDIXuEs3JYQRpHDZNqc=
Date: Thu, 14 May 2026 22:25:39 +0800
Precedence: bulk
X-Mailing-List: sashiko-reviews@lists.linux.dev
List-Id: <sashiko-reviews.lists.linux.dev>
List-Subscribe: <mailto:sashiko-reviews+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:sashiko-reviews+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Subject: Re: [PATCH bpf-next v14 7/8] libbpf: Add syscall common attributes
 support for map_create
To: sashiko-reviews@lists.linux.dev
Cc: bpf@vger.kernel.org
References: <20260512153157.28382-8-leon.hwang@linux.dev>
 <20260514010850.0F569C19425@smtp.kernel.org>
Content-Language: en-US
X-Report-Abuse: Please report any abuse attempt to abuse@migadu.com and include these headers.
From: Leon Hwang <leon.hwang@linux.dev>
In-Reply-To: <20260514010850.0F569C19425@smtp.kernel.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Migadu-Flow: FLOW_OUT

On 2026/5/14 09:08, sashiko-bot@kernel.org wrote:
[...]
> 
>> @@ -242,7 +245,18 @@ int bpf_map_create(enum bpf_map_type map_type,
>>  	attr.excl_prog_hash = ptr_to_u64(OPTS_GET(opts, excl_prog_hash, NULL));
>>  	attr.excl_prog_hash_size = OPTS_GET(opts, excl_prog_hash_size, 0);
>>  
>> -	fd = sys_bpf_fd(BPF_MAP_CREATE, &attr, attr_sz);
>> +	log_opts = OPTS_GET(opts, log_opts, NULL);
> 
> Does this code need to validate log_opts with OPTS_VALID(log_opts, bpf_log_opts)?
> 
> Libbpf relies on the OPTS_VALID() macro to enforce ABI forward compatibility
> by verifying that any unrecognized trailing fields in extended option structs
> are explicitly zeroed. While bpf_map_create() correctly validates the outer
> bpf_map_create_opts structure, it seems the nested log_opts structure is
> accessed without similar validation.
> 
> If a newer application populates unsupported fields in struct bpf_log_opts
> with non-zero values, could an older libbpf silently ignore them instead of
> safely rejecting the request with -EINVAL?
> 
Replied in v13
https://lore.kernel.org/bpf/624b092f-e1fe-4a24-9bf6-c505e202b3ef@linux.dev/.

Thanks,
Leon

[...]

