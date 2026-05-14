Received: from mail-wm1-f49.google.com (mail-wm1-f49.google.com [209.85.128.49])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6EC413E0221
	for <sashiko-reviews@lists.linux.dev>; Thu, 14 May 2026 13:38:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.49
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778765887; cv=none; b=ElH6dO96so31YAR4DYKtMg+X5XU0jK/e8K5lqC8qfzRqKrs5Ay1CgdOdK957LnjwNayCk/XmBEFxrqsiHnkzWbVn2MT2TDsiQCh3HRMpmxTlo3ioGS55GyROV1QbnYOntmafvS9D2epGumwn02ETpG/6A0V1PGqU1Qv/Vy1fP+E=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778765887; c=relaxed/simple;
	bh=EYe5i7U06obZaSKsx3nkMPXmoLndtc7LHXjPjq9kkxg=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=NRo6U50uUAtmliCVTek/VBwh1AbH5A2UVFwKvCx/0UR596M7O9Z+foCznt7eNQZzvrPqLcrVgCNkEcVOmXiwqeX13wlZfXa/4N6Yfzx+GZnknKhQS3xT4t0hchWLUDsPNrorRHV0j+0CDmYpp5UkU6uVTPvt7kb1jxfCxG+YM3M=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=m+JKeBuc; arc=none smtp.client-ip=209.85.128.49
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="m+JKeBuc"
Received: by mail-wm1-f49.google.com with SMTP id 5b1f17b1804b1-48fde648a71so4262245e9.0
        for <sashiko-reviews@lists.linux.dev>; Thu, 14 May 2026 06:38:06 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1778765885; x=1779370685; darn=lists.linux.dev;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=7FQneXHJVgZUqsoqN0Zr1+A0P9r+lfB5u3ZpVDacsh4=;
        b=m+JKeBucOiPm6aOGXkqPNOJaTyFjrLVBtSBg+qOkariFt/I0Uix5WWOiZpE4LkdeXw
         +JGHNTCh70ns8ToqGMAMhuBLg2qK3yB0FGRbn++4XI5WI7t9FQEYeS0KG33l9DyZKzKW
         g3qmrogoMZKc0sjyl7gz/VWGIeokRZcWdh/w0EjtMho1jbAynaveSyIsDTKr+GGaqJH7
         bLRAFMdkS75nl8j9fEDkx7ctWZj+M5GV6Ol/21cp0R0ESyTiBWJiToxiQZO3JsdnYHQJ
         8kuUdXgaDHdXNL49DmvAJ44QzNxZSDUGGyrKUuvf6gK3cQdXEHTcU5U5+G+ffo+pnJOk
         EEIA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1778765885; x=1779370685;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=7FQneXHJVgZUqsoqN0Zr1+A0P9r+lfB5u3ZpVDacsh4=;
        b=hbTPjZVbQF6qBkea9CUpbdSSErZAI4j2tTfmolYqrNuPIPRpRp05Ypz7Zl28qmH8k0
         vgm9suP/U1xmyHJvhcFo4nYU0n1indWbAC+3+hJyvIz+jmr32z16FUk+FFjCk8C5z3Qc
         b+n6YmpOCEEouDR3aGIFtMMf/AvXcNb3ngfuVo0NbjvLBdnnAqCc/5orOvG+4MPCXjXF
         J8j4vfVX/YuWD1NUKssC2fvkNAUmZWW61l+MiNYEoVKBOS+A/f2OgDeYTwqS6GFWAzVr
         d9QFzxcD9yB2sJOAKJJsL5UDpb2Pt+d4OXXWjloOxm+hgRW2+W/Dgbi3+6yalreVJV0R
         ozMw==
X-Gm-Message-State: AOJu0Yxh1woI1dMVxSzjGez8e12npLNu8tRHhMF96YWBn0lMwu/tltTO
	YZntulIkDbVZ2m4fiU6U/3ibBmRUujRz6y2cg1XbQobDXO3vB8HPgZ7R7qfPUyaf
X-Gm-Gg: Acq92OETDf9nE5YI6U+1L5v2L1PQ3Egd6NH+38iR/i6BrKam+JWA0uFxLakxiSZxVX8
	C+uBs7pxECIt0anGCvgj3DHPGwwCfJNpBr4vdSVcjW4la274gq4J5JLSzmDUBgW7jMBQBW+BNlY
	abveyIOdRC3L6MH+HFrOD2csJzyRW8xxW6WirslTNJRZ6uoDabZ5dkqqo6CG7M9C4ZwHqChdgL1
	BuycXreebmcFY9jppNrKOeueiYJ6YrrvyG//9coTiRJtP5HAZbiHTv1Zjr1Q1k2xjEg7SgHy+rx
	OU2+kz1d3SvMK/Pl4leJ1SzC/uRuo2njAWB39OaFMH3vXVQQVgh8HKEb3oGBGCe+yePJKgpOwqL
	vE670D7+cikR28atC82c+olBGmXd3+9doaKf1iw7+hsJ9svp9bp40hZSRW8NJj2Tl4uwbxA2Xan
	dOOzgL+YlKny2OBklqL2bOjJaR+PuKH8qkII6djwdgxSr5CF26329jnixWiWUT
X-Received: by 2002:a05:600c:1503:b0:48d:50a:6ef4 with SMTP id 5b1f17b1804b1-48fe24883f7mr8110055e9.11.1778765884710;
        Thu, 14 May 2026 06:38:04 -0700 (PDT)
Received: from ?IPV6:2a03:83e0:1126:4:5c5e:8180:a47c:53d9? ([2620:10d:c092:500::4:7c71])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-48fe45dd180sm153305e9.2.2026.05.14.06.38.02
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 14 May 2026 06:38:04 -0700 (PDT)
Message-ID: <89d34016-cf82-4beb-989c-e4fc2e3cd29e@gmail.com>
Date: Thu, 14 May 2026 14:38:01 +0100
Precedence: bulk
X-Mailing-List: sashiko-reviews@lists.linux.dev
List-Id: <sashiko-reviews.lists.linux.dev>
List-Subscribe: <mailto:sashiko-reviews+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:sashiko-reviews+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] libbpf: fix UAF in strset__add_str()
To: sashiko-reviews@lists.linux.dev, Carlos Llamas <cmllamas@google.com>
Cc: bpf@vger.kernel.org
References: <20260513232055.1681859-1-cmllamas@google.com>
 <20260514115711.133F4C2BCB3@smtp.kernel.org>
Content-Language: en-US
From: Mykyta Yatsenko <mykyta.yatsenko5@gmail.com>
In-Reply-To: <20260514115711.133F4C2BCB3@smtp.kernel.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit



On 5/14/26 12:57 PM, sashiko-bot@kernel.org wrote:
> Thank you for your contribution! Sashiko AI review found 3 potential issue(s) to consider:
> - [High] Unpatched Use-After-Free in strset__find_str()
> - [High] Use-After-Free in BTF add APIs due to btf_ensure_modifiable() freeing raw_data
> - [Medium] Early return in strset__add_str() breaks hash map deduplication invariants
> --
> 
> commit 2a7bfcb093726b849608e340f9bda7c5e3f56ac2
> Author: Carlos Llamas <cmllamas@google.com>
> 
> libbpf: fix UAF in strset__add_str()
> 
> This commit addresses a heap-use-after-free in strset__add_str() that occurs
> when the provided string points into the internal strset data buffer.
> It adds a boundary check to return the offset directly if the string is
> already within the buffer, avoiding a dangling pointer during reallocation.
> 
> [ ... ]
>>  |     #0 0x55d25155a2a7 in memcpy (tools/bpf/resolve_btfids/resolve_btfids+0xcf2a7)
>>  |     #1 0x55d2515d708e in strset__add_str tools/lib/bpf/strset.c:162:2
>>  |     #2 0x55d2515c730b in btf__add_str tools/lib/bpf/btf.c:2109:8
>>  |     #3 0x55d2515c9020 in btf__add_func_param tools/lib/bpf/btf.c:3108:14
> [ ... ]
> 
> Does btf__add_str() have another use-after-free when operating on a
> non-modifiable BTF object?
> 
> If a user calls btf__add_str(btf, s) where s is a pointer returned by
> btf__name_by_offset() (which points into btf->raw_data),
> btf_ensure_modifiable(btf) is called.
> 
> btf_ensure_modifiable() allocates new buffers and calls
> btf_invalidate_raw_data(btf), which frees btf->raw_data.
> 
> At this point, the argument s becomes a dangling pointer before
> strset__add_str() is even called, making the boundary check added by this
> patch evaluate against the freed raw_data.
> 
>> diff --git a/tools/lib/bpf/strset.c b/tools/lib/bpf/strset.c
>> index 2464bcbd04e03..7d2b2784172e5 100644
>> --- a/tools/lib/bpf/strset.c
>> +++ b/tools/lib/bpf/strset.c
>> @@ -141,10 +141,15 @@ int strset__find_str(struct strset *set, const char *s)
> 
> Does strset__find_str() suffer from the same vulnerability being fixed here?
> 
> It follows the exact same pattern as strset__add_str(): it temporarily
> appends s by calling strset_add_str_mem(set, len), which may realloc() the
> internal buffer.
> 
> If s points into the internal buffer, the realloc() frees the old memory,
> leaving s dangling before the memcpy() occurs.
> 
>>   */
>>  int strset__add_str(struct strset *set, const char *s)
>>  {
>> +	const char *strs = strset__data(set);
>>  	long old_off, new_off, len;
>>  	void *p;
>>  	int err;
>>  
>> +	/* Check whether 's' is already in the strset data buffer */
>> +	if (strs && s >= strs && s < strs + set->strs_data_len)
>> +		return s - strs;
> 
> Can this early return break hash map deduplication invariants if s is a
> substring?
> 
> If a caller passes a pointer to a substring of an existing string, the
> function returns the substring's offset but skips inserting it into
> set->strs_hash.
> 
> Because the substring is never added to the hash map, subsequent lookups for
> it via strset__find_str() will fail, and future additions from an external
> pointer will duplicate the string.
> 
> Would it be safer to calculate the offset, perform the realloc(), and then
> re-calculate the s pointer instead of returning early?
> 

It looks like sashiko is right, addressing the same issue in strset__find_str()
and handling substring case could be useful.
maybe adding a helper like this:

/* 
 * Returns the offset of the string in set and length which set needs to
 * grow by to include the string.
 */
int strset__offset(struct strset *set, const char *s, long *off, long *grow)
{
	long len;
	const char *strs = strset__data(set);
	void *p;

	if (s >= strs && s < strs + set->strs_data_len) {
		*off = s - strs;
		*grow = 0;
		return 0;
	}

	len = strlen(s) + 1;
	p = strset_add_str_mem(set, len);
	if (!p)
		return -ENOMEM;
	memcpy(p, s, len);
	*off = set->strs_data_len;
	*grow = len;
	return 0;
} 

> [ ... ]
> 

