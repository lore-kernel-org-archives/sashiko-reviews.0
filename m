Received: from mail-wm1-f44.google.com (mail-wm1-f44.google.com [209.85.128.44])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8BB993093B8
	for <sashiko-reviews@lists.linux.dev>; Mon,  1 Jun 2026 16:38:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.44
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1780331916; cv=none; b=lHA7sR0VRS9WJFfzln+czU5krjMMM/8LYi9qTQBpWdenPJA20NdxGbmUUpWydNGM+YT5Iz9jkbRnxaPn+893gYWk+VsdiYIq0SB34Yg7NKBVYoJqasnKkkuNlMvy3U9C0WT8Ij6cXU85gR9kE6kTOOsepOKLKkjN3Pn5r+p/EMA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1780331916; c=relaxed/simple;
	bh=NhMdKMbxd578ve88bY8hzsnoTjxXLQEEBtSn+TrvUDU=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=bFiExqhw0Vt7SnleYYtA39KECNMfKwRu0xErDSSuLKJsgNsyPbcDxPdG1rq62zaUf0mMebeYtcoaBov7IzWBNTPcWxqRfCi6ID1ubiNRXNmcSAfHrmS3g4Era1ctH9m7f5gkdOq+CWprCLkLP2c42YKibvCWply4fZwX5Kut7Bs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=S0fmeCIc; arc=none smtp.client-ip=209.85.128.44
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="S0fmeCIc"
Received: by mail-wm1-f44.google.com with SMTP id 5b1f17b1804b1-49050bfe053so72404635e9.3
        for <sashiko-reviews@lists.linux.dev>; Mon, 01 Jun 2026 09:38:35 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1780331914; x=1780936714; darn=lists.linux.dev;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=O25LddiBm/bSmAHhSH1MOmSMmOhV8d/5eCeC02vFeOI=;
        b=S0fmeCIcCEmA3qY59yL6Zp3LOXFgSX+9CpQJ7nZnJ3Kt9roxwlarkHbuigJdIt8WA0
         dWY5ZWYebmCcovW9GKUdDyOkLN0YrdPG9GEo//aGo+8st3qi1Au4Nxd8HqcqITrBv8l1
         BbOhWWl7uboYb+pbkhlv9s3xfJoucCDl9JslzOk+T+7f8BczQYES3B0AWu9hRPYYuTeZ
         1dehD002u1dXJmvnqYjzsvz0eqPAukUaByJJPAacZanvHhmHRqodmOovrwA/Mt2w3kSx
         vvBkqfehcBeTGMDslWwL49z9nXSxMoOtNJVY5MRQp1AiMM9VI7UKsBu8qLMHANIl5TvQ
         fsjA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1780331914; x=1780936714;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=O25LddiBm/bSmAHhSH1MOmSMmOhV8d/5eCeC02vFeOI=;
        b=dDmK3GbvSGRRt2EGzqyc0IPd5LkcTP2BqliRSBk2pw0dci9F6+p2uS8e7fVgaRGXV5
         QJgabc+H5i+NEuPQxo5F1n2vSqnKs+3Oxj0NsVq47SvhtwDfPJ09/zSj/fgy1eqqk9AC
         Q32cIRpRnQrpVnSGrNwX4+xF7geZZnvI+HQHxpb0/4FXjWojQMMXxBrAnKKp8Bfer2TT
         Go0rBgnm2jp6/yDylgoDVyUp4oPlkR/dwGQOy7GNguTRlJtkm3SqmqTRLoURUt5DtS6N
         hownVPEn/D4TbTTwLquKGh6XBfMvXtUNKyTqWWDBW2Z4kL38qLWQLwkpiWA9DuRGjEzQ
         jLHQ==
X-Gm-Message-State: AOJu0YzzhydBZ47SwnBduOws6trlMSbUuoF564yPtpmOaTCEQXRATicM
	RZe8OuX6p1oyBrXF/g9M/fnGqMe3AeVC1cEqGmpu4kMzYGVH7MDdj6rCaBQXvxER
X-Gm-Gg: Acq92OHxnbLZumTY5iqQ8XU5SZudzDTifJ7JhAaB/VrbFUSoH9ah+eOe9l316OHCh8u
	ZT99Kh70fBNP60BDQMl+IpIh+aTNE1fQhDJL1DGBHWbewLCAWSGDoH0yGfjClw30/Gz2I5qw5Ox
	pEEOSQ3YhTkD9X0B4NTMLuvqJlCNf9OW8L2lncSQzztVO59vwmm4yXj137KRU/0fgZCvwJPxEW1
	0OiMT5WWHJ8g52bm1sJwa5AWbpiztrSUvkTMKqVJgNWADh/wbxarU3wiObv8i29gcTqjtS6ze9B
	4UL6mhP82S6IoNuoF7aSCoH+nL4JPaqxhC2OzteIdzp4L0Cr6SGBDXXUCTezZDwZFIs6ezVAKLQ
	e5Ok9KT8E7Hfv7YZZXhKQ9UrpRxWDtoCJ6ygTnTBfumAcEgVB4pgQppPXPB7pXgt2IMkV2jUdiv
	M5wK8p6lL86WZcCHPRQp/BpT33kep+37QbNy5TfSlJytsPaEejNsf8RJZzJfgOM6u2Sh0TG2xgY
	w71LtOe7WYFQ/97252C7g==
X-Received: by 2002:a05:600c:524c:b0:490:52c0:744c with SMTP id 5b1f17b1804b1-490b0885319mr11135015e9.20.1780331913629;
        Mon, 01 Jun 2026 09:38:33 -0700 (PDT)
Received: from ?IPV6:2a01:4b00:bd1f:f500:f867:fc8a:5174:5755? ([2a01:4b00:bd1f:f500:f867:fc8a:5174:5755])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-45ef3587072sm27051130f8f.34.2026.06.01.09.38.33
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 01 Jun 2026 09:38:33 -0700 (PDT)
Message-ID: <a965cdd8-1515-418f-9bb6-ae7e811e5604@gmail.com>
Date: Mon, 1 Jun 2026 17:38:32 +0100
Precedence: bulk
X-Mailing-List: sashiko-reviews@lists.linux.dev
List-Id: <sashiko-reviews.lists.linux.dev>
List-Subscribe: <mailto:sashiko-reviews+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:sashiko-reviews+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH bpf-next v5 06/11] bpf: Optimize word-sized keys for
 resizable hashtable
To: sashiko-reviews@lists.linux.dev
Cc: bpf@vger.kernel.org
References: <20260528-rhash-v5-6-7205191b6c57@meta.com>
 <20260528182522.23D121F00A3C@smtp.kernel.org>
Content-Language: en-US
From: Mykyta Yatsenko <mykyta.yatsenko5@gmail.com>
In-Reply-To: <20260528182522.23D121F00A3C@smtp.kernel.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit



On 5/28/26 7:25 PM, sashiko-bot@kernel.org wrote:
> Thank you for your contribution! Sashiko AI review found 2 potential issue(s) to consider:
> - [High] Trivial hash collisions in `rhtab_hashfn_long` defeat rhashtable's DoS mitigation, leading to infinite rehashing and 100% CPU livelock.
> - [High] Direct dereferencing of potentially unaligned map key pointers in the optimized hash and compare functions will cause kernel panics on strict-alignment architectures.
> --
> 
> commit 40f8c726140c6268e5f797c092818cebd3cfc282
> Author: Mykyta Yatsenko <yatsenko@meta.com>
> 
> bpf: Optimize word-sized keys for resizable hashtable
> 
> This commit specializes the lookup, update, and delete paths for word-sized
> keys in resizable hashtables. It introduces a custom XOR-fold hash function
> and single-word equality comparison to bypass the indirect jhash dispatch.
> 
>> diff --git a/kernel/bpf/hashtab.c b/kernel/bpf/hashtab.c
>> --- a/kernel/bpf/hashtab.c
>> +++ b/kernel/bpf/hashtab.c
> 
> [ ... ]
> 
>> +/* Specialize hash function and objcmp for long sized key */
>> +static __always_inline int rhtab_key_cmp_long(struct rhashtable_compare_arg *arg,
>> +					      const void *ptr)
>> +{
>> +	const unsigned long key1 = *(const unsigned long *)arg->key;
> 
> [Severity: High]
> Could dereferencing this pointer directly cause alignment faults on
> architectures that require strict alignment? Since BPF programs can pass
> unaligned pointers (such as from packet data in skb->data) directly to map
> helpers, using get_unaligned() might be necessary here to prevent kernel
> panics.
> 

The same problem exists for the htab jhash2. it looks like for the arches that
BPF cares about, this is not an issue.

>> +	const struct rhtab_elem *key2 = ptr;
>> +
>> +	return key1 != *(const unsigned long *)key2->data;
>> +}
>> +
>> +static __always_inline u32 rhtab_hashfn_long(const void *data, u32 len, u32 seed)
>> +{
>> +	u64 k = *(const unsigned long *)data;
>> +
>> +	return (u32)(k ^ (k >> 32)) ^ seed;
> 
> [Severity: High]
> Does applying the seed after folding the key make hash collisions entirely
> independent of the seed?
> 
> If a BPF program or an attacker inserts keys constructed as:
> k = (Y << 32) | (X ^ Y)
> 
> These keys will all fold to exactly X before the XOR with the seed,
> meaning f(key1) ^ seed == f(key2) ^ seed for any random seed.
> 
> If rhashtable detects a long bucket chain and triggers a background rehash
> with a new seed, won't all these colliding keys move together to the same
> new bucket? This might trap the rhashtable worker in an infinite loop of
> rehashing, leading to a 100% CPU livelock.
> 

It looks like the attack is possible in theory: attacker should be in control of
the 8-bytes that rhtab uses as a key. Not sure if we want to fix it or leave
for performance.

>> +}
>> +
> 

