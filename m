Received: from mail-wr2-f12.google.com (mail-wr2-f12.google.com [74.125.225.76])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1AB804848A5
	for <sashiko-reviews@lists.linux.dev>; Tue, 22 Sep 2026 18:10:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.225.76
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790100655; cv=none; b=fHIuWHMenM093+JEZis4mgkQEeZevBivPCr7oa+OaUtLan24WmbK11V4Zmky14QmOyQA0qEdiJQKHTXXZFWTilOgDyTSAz1k904lWt4TjJmWfAGNW+haRAiboKFvkM6CRyLBQyEIAasv4Y/Ox+fUPdlGgCChOBD29mOidAZK9pQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790100655; c=relaxed/simple;
	bh=Aiwi/57ro32i8S+PbUKG7AiN5OxGDUL9agMO9A0gG+o=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=Si0gMcLuMWLAiViMDRisTjxxZEJcS7ff8pFfAymj4jNRZbq08EaVah565DqR5s2Wolleb5PLCzHN7ekY1sb40IUOSb4pd1T4IfKlX/b1hJ04UB4CtWj1+5iLicWHbndPe88qRJi7cxBblJK1NSXacrzFdofl8CQs9uxQ6iZx99I=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=P56BFdsf; arc=none smtp.client-ip=74.125.225.76
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="P56BFdsf"
Received: by mail-wr2-f12.google.com with SMTP id ffacd0b85a97d-486e1a044c5so168184f8f.3
        for <sashiko-reviews@lists.linux.dev>; Tue, 22 Sep 2026 11:10:53 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1790100652; x=1790705452; darn=lists.linux.dev;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=xTJGDgnrwX0goSYWUxKDiz39i158qeQbDfyk43iX700=;
        b=P56BFdsff8Ab6AKQztTSlkZESLAiAx/rMoVo/0JRQKZaFB7lswfXJmeOgLhch2Abie
         Fbxfv7JRmwSYgFvC9kU3jTsnLpGb8Uemtu+4gausLbgDMfdZzmKmRXUYdve2W5mYzUAs
         8eDacP3yy2570f7bD0CK9PrYE1ArRyWkwMVlXrDXaxI15D/pRN+d2ljlveFjLcT9Pgis
         7GgD+Txbmbzpn5l1medBeSVBgWL217DJCHPHJMpu4X5oee0L6RFr3qnJIr//6AJKqlsr
         BrEDxjoA4h9bj/8E+B6zjKFKvzsThy8H5CsmUIAUCmZkGIsi4CpTL/894KFeo05TE2Bv
         lA+A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790100652; x=1790705452;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=xTJGDgnrwX0goSYWUxKDiz39i158qeQbDfyk43iX700=;
        b=hFBo8fFReu4QtA+BOEO8ezm+q2uwe38TaTSuyFSgVbp0xVmllMn0Mk5phIDuS3D2m7
         6k6kBtDqMcO22it1JFGfR8LKW6CfPZN6EL/QNgnmOQuc3AV0ytT36kb0domj1DJTtfao
         SGkyb80qlfQaifopRBcBZdSTRsw6S+UJxc1IqC4tbXKH9e8jocGOTY+hA3+0/43iSXe4
         2Y+9cQfcKt2H7g5xBGRNY+0y9QuLjT8aBlNZCBNueMT563qM0+MPmSW9JSIH9ctvhfLN
         26PObh7gifrFlGgxDT/E4mjSS1pCot1HGkyMiy5yGvGrVSIumkZM6riIh65TbsL5GzAx
         xXDA==
X-Gm-Message-State: AFuF++kTrnH1PF7rZ7PPwAG4ozNe9PBeysslo1MSN/RAP5lIHglEKxkC
	LJWHSCfusbnNw93+Kl+cWXJFiGd9OSyZ8dN0jOPEP+aXpA53DV5SICgsoBMU6cMkFzE=
X-Gm-Gg: AYBFou0L9Uug1PbFo+dP57c/u7zpBzJgVsr2ye4dV2Rh6se96iuXfMV86j0TqZ1ZL0s
	fHDPhj/5HwEr+aqxja7NfbRZYFxTtZPPAO04SQ3RENZ+qWRGgzIogpiv6DN52tMI9lRHyeF/oo3
	39gDGXb4nJC6A43+4yoSvse6hl/SbPJvY03kHeSPfacOGm6YMqvBPFl2FIF+YF97q94xG/9TlZU
	kZaZh1XPIBRiM83dS6+qpiHe9ulkugEfJQ1eSCFSVd9ZmyN9tXvhRYoAtEPSJ2IJfmhnsoG4dQA
	nbZyJZBvEl1nwml1rSJjGn4Y0lzd2Z4Of85ZZ3eE/ggE9d3kcyXCcIRSEiu4jL8+u9h26dw0JGI
	8aippNlhEfbLh9fCJnqq3800YYEKb+aSFE2MchPDwrDhaezJvJ2jsIpSV/jXrIKj4Frbo6I7C12
	8Md7ibtH37+YnNOluGqjCc4QoY3reiTMjqYapU7Of8svfpy5LXutMJo0pWVn5xyQq0AtwfinhMK
	6Vs/yUJHwCF++1TH3EpVzOhX1jh6HvHVMg=
X-Received: by 2002:a05:6000:430d:b0:486:ecc3:2d1a with SMTP id ffacd0b85a97d-488670a04b4mr601845f8f.31.1790100652027;
        Tue, 22 Sep 2026 11:10:52 -0700 (PDT)
Received: from ?IPV6:2a03:83e0:1126:4:1715:59a3:7aab:2955? ([2620:10d:c092:500::7:c6a4])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-4886876c1fdsm190681f8f.14.2026.09.22.11.10.51
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 22 Sep 2026 11:10:51 -0700 (PDT)
Message-ID: <be18926e-124c-40b1-9846-b99277c800ad@gmail.com>
Date: Tue, 22 Sep 2026 19:10:50 +0100
Precedence: bulk
X-Mailing-List: sashiko-reviews@lists.linux.dev
List-Id: <sashiko-reviews.lists.linux.dev>
List-Subscribe: <mailto:sashiko-reviews+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:sashiko-reviews+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH bpf-next v3] bpf: Speed up htab lookups for u32/u64 keys
To: sashiko-reviews@lists.linux.dev
Cc: bpf@vger.kernel.org
References: <20260922-hashtab_fast_hashfn-v3-1-b7b0e9bc33ac@meta.com>
 <20260922180843.CB7721F000FF@smtp.kernel.org>
Content-Language: en-US
From: Mykyta Yatsenko <mykyta.yatsenko5@gmail.com>
In-Reply-To: <20260922180843.CB7721F000FF@smtp.kernel.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit



On 9/22/26 7:08 PM, sashiko-bot@kernel.org wrote:
> Thank you for your contribution! Sashiko AI review found 1 potential issue(s) to consider:
> - [Medium] bpf: missed u32/u64 lookup optimization for LRU/per-CPU/of_map variants
> --
> 
> commit 88a648ce718a5816a7cc1175a104d2f26afc58c0
> Author: Mykyta Yatsenko <yatsenko@meta.com>
> 
> bpf: Speed up htab lookups for u32/u64 keys
> 
> This commit introduces specialized hashing and specific lookup entry points
> for 4-byte and 8-byte keys in BPF hash maps. It achieves significant
> throughput improvements for standard BPF_MAP_TYPE_HASH lookups.
> 
>> diff --git a/kernel/bpf/hashtab.c b/kernel/bpf/hashtab.c
>> index 6f331c80130d7..f744a42bb8139 100644
>> --- a/kernel/bpf/hashtab.c
>> +++ b/kernel/bpf/hashtab.c
> 
> [ ... ]
> 
>> @@ -783,7 +805,16 @@ static int htab_map_gen_lookup(struct bpf_map *map, struct bpf_insn *insn_buf)
>>  
>>  	BUILD_BUG_ON(!__same_type(&__htab_map_lookup_elem,
>>  		     (void *(*)(struct bpf_map *map, void *key))NULL));
>> -	*insn++ = BPF_EMIT_CALL(__htab_map_lookup_elem);
>> +	BUILD_BUG_ON(!__same_type(&__htab_map_lookup_elem_u32,
>> +				  (void *(*)(struct bpf_map *map, void *key))NULL));
>> +	BUILD_BUG_ON(!__same_type(&__htab_map_lookup_elem_u64,
>> +				  (void *(*)(struct bpf_map *map, void *key))NULL));
>> +	if (map->key_size == sizeof(u32))
>> +		*insn++ = BPF_EMIT_CALL(__htab_map_lookup_elem_u32);
>> +	else if (map->key_size == sizeof(u64))
>> +		*insn++ = BPF_EMIT_CALL(__htab_map_lookup_elem_u64);
>> +	else
>> +		*insn++ = BPF_EMIT_CALL(__htab_map_lookup_elem);
> 
> [Severity: Medium]
> Does this miss an opportunity to apply the identical u32/u64 lookup
> optimization to the LRU, per-CPU, and hash-of-maps variants?
> 
> It looks like specialized JIT lookup generators were added here for
> standard hash maps in htab_map_gen_lookup(), but identically structured
> functions in the same file such as htab_lru_map_gen_lookup(),
> htab_percpu_map_gen_lookup(), and htab_of_map_gen_lookup() still
> unconditionally emit a call to the unspecialized __htab_map_lookup_elem.
> 
> Would it make sense to update those generators as well, so these heavily
> utilized map variants do not miss out on the same performance gains?

yes, I think this is a good idea.> 
>>  	*insn++ = BPF_JMP_IMM(BPF_JEQ, ret, 0, 1);
>>  	*insn++ = BPF_ALU64_IMM(BPF_ADD, ret,
>>  				offsetof(struct htab_elem, key) +
> 

