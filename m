Received: from mail-wm1-f45.google.com (mail-wm1-f45.google.com [209.85.128.45])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C132138D3F3
	for <sashiko-reviews@lists.linux.dev>; Fri, 29 May 2026 16:53:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.45
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1780073589; cv=none; b=jkKkQd80VDcjPs4wqTwWzs249+CXFI2BH8lPRQ9fDWCNLCjR98UX15U68I+3KKfKVEDBDGQS7VseoJFP4xFpf62glKA0liP52G/RnkfKwI2HcAHRXfHS9pPHugZhSZP0p/lxMl39ICQWUqHhDHQMBeysk7rFJQWl6jW6h3P/HQU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1780073589; c=relaxed/simple;
	bh=sspcNoQ4slwPQOE12+2gA17gg16W0Ejp0+11LhUUDyU=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=UYT836i67lSySmavSu98D3agz+x7dktr+72/wmS3WLoxDKDyYI355jhdYEO9GJcLd14v5MXT2kD5/O1JpmN6L/oeR8DcSnjMkPlUhA+YHePylAXsBifGqG+LZx75FDtUX4zbCaUwYuM5f5gnF0Ke6SoM8fVjN/AkQlesdGd8m2U=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=NwCQIBNz; arc=none smtp.client-ip=209.85.128.45
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="NwCQIBNz"
Received: by mail-wm1-f45.google.com with SMTP id 5b1f17b1804b1-49042aeeb75so96004055e9.1
        for <sashiko-reviews@lists.linux.dev>; Fri, 29 May 2026 09:53:03 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1780073582; x=1780678382; darn=lists.linux.dev;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=m9P6U8xei01KOGYPg5RnY31Pkhxfrb/1e+oUXDe3FXk=;
        b=NwCQIBNzMSRvdrQZeLGuz6bNHAHyxHKvsJvH8AdXvTLTdKMrQvrUb69MK59hsTaXYl
         28YMf6LoY5Y7a2tQTlYTVu6/r0GI3Aj0tSUbtn+1QgJOLBPwbYZ5KznFGNFNBA1QAP/p
         YaAhb3m57UdfxEbQYHe2RdXoLDwi5xnbWOA+wWcIel/sjsNKvQnlt9QRhw3zdLpfv7ZW
         YyCGMgHbcHrkN80FLpygdHkgwWh+i5XoGJiGAZxndWOSyfHYGTkZ7GIC09nq5VpoxB7K
         wELIZ4t5po2NyQyeEuAdGJUvS2PqDJ2RAF6jH6pQFyF1BvZwVFkI0r/KmG4iALkWQc1S
         dmtA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1780073582; x=1780678382;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=m9P6U8xei01KOGYPg5RnY31Pkhxfrb/1e+oUXDe3FXk=;
        b=h4uAcCtIMeXA3iksM4OX8Fs6GCqf/oiSw9l+nP9QauoV2uEFNkEtlVV+3XPN3X6TjA
         n1XKwSPdBP0FJik+BrIeBpMnS8qReLp2I58QkRMQ3P6k6gTJqvNlhLKHqEkEqYSX4r+O
         922QUWlSrZrWl1I5OuX+wWmXOd7Jk61bp55YhYIDQR6QtSnEfvsKrl9B9yH41+ge9raE
         rvg9N4PmGFywtkNgOVZwpGdyS22CAr9JNYwtGx7J8DmctAdPfAkC1CaQwUqQLiCK9NvG
         d0uAHHtz0HWO0FqEs0r+b0l21GsC1/BhonG/S83k6FnHSxW9ZIExskGePB0z0EI2CX7x
         Jtpg==
X-Gm-Message-State: AOJu0YzluQPV2nFHKkcvBrOcoYo1evJ2l48OeUxr2fGma1vHoaDEfSFJ
	jNNLK9Mrpsk6ZuZCwPGxfZSQdjIOGrdo9BJ4oH+EdtHpffvRzhNi+fQUknPkiQlV
X-Gm-Gg: Acq92OGWdOc1Wd86dv0xwFdsMJZgbl8NJ83TwQ6RnoYlt4YDYs4IX8QKrb1/wTODUj4
	D7ZuXNX6EKfeMzhFvHDPYDtAybQH9Gr84eIcwXdCK6VlVRDIPV8ndxCVyQzdJ6JgK3SjgfWASj/
	dF94+yDUU82iuxE4VXzjD6QSV0Y/phFsM2UUO1p9d/bdw5eLoDdOS2PcJv4+ZDIXlVLNGGhBYg6
	X8sfAryCagzY06jNlbfXAiSpirdAXjyNtVAJ3C/Vw0ZyuvbTk73MvwwW9FeBNGnevjvfynYsOTF
	BVB3WUNAWNUK2vvPf9MXiImcBMbg+7LHNMbMCokSYcwPWHUKkqgdTb3W0kliiizCc5m6G7Nneij
	3AVyEEzdwgWrkTLwhLtwcPABNQ7Mcr3zxzxlrDDCwpdWjUC14TRsg14J90NB6tDoe2QLKTkUUXN
	EEdRdSrSiJ8fQSEW420uQX4Kml7qXGgZ+4gMRv6l7J8xfY5b+TD1gp/cc3OrcDZXR7k0yW5HNAH
	TAqdQ7hbQcNz6Koh/Belg==
X-Received: by 2002:a7b:cd92:0:b0:490:3c15:7146 with SMTP id 5b1f17b1804b1-490a293dec6mr4323945e9.19.1780073581897;
        Fri, 29 May 2026 09:53:01 -0700 (PDT)
Received: from ?IPV6:2a01:4b00:bd1f:f500:f867:fc8a:5174:5755? ([2a01:4b00:bd1f:f500:f867:fc8a:5174:5755])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4909d6eb470sm44531285e9.10.2026.05.29.09.53.01
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 29 May 2026 09:53:01 -0700 (PDT)
Message-ID: <2d558b5a-aef1-4207-9f58-49aab3e891db@gmail.com>
Date: Fri, 29 May 2026 17:53:01 +0100
Precedence: bulk
X-Mailing-List: sashiko-reviews@lists.linux.dev
List-Id: <sashiko-reviews.lists.linux.dev>
List-Subscribe: <mailto:sashiko-reviews+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:sashiko-reviews+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH bpf-next v5 02/11] rhashtable: Add selftest for
 rhashtable_next_key()
To: sashiko-reviews@lists.linux.dev
Cc: bpf@vger.kernel.org
References: <20260528-rhash-v5-2-7205191b6c57@meta.com>
 <20260528182616.65DED1F000E9@smtp.kernel.org>
Content-Language: en-US
From: Mykyta Yatsenko <mykyta.yatsenko5@gmail.com>
In-Reply-To: <20260528182616.65DED1F000E9@smtp.kernel.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit



On 5/28/26 7:26 PM, sashiko-bot@kernel.org wrote:
> Thank you for your contribution! Sashiko AI review found 1 potential issue(s) to consider:
> - [Medium] The selftest strictly enforces that exactly 'n' elements are visited, which violates the rhashtable_next_key() API contract and leads to spurious test failures if concurrent rehashing occurs.
> --
> 
> commit 764349a8abc231043942a78a0c94a8a3422ff178
> Author: Mykyta Yatsenko <yatsenko@meta.com>
> 
> rhashtable: Add selftest for rhashtable_next_key()
> 
> This commit adds a selftest for rhashtable_next_key() to verify that walking
> with a NULL prev_key visits all elements, and that providing a non-existing
> prev_key returns ERR_PTR(-ENOENT).
> 
>> diff --git a/lib/test_rhashtable.c b/lib/test_rhashtable.c
>> index 0b33559a910b0..c7a0817b0be59 100644
>> --- a/lib/test_rhashtable.c
>> +++ b/lib/test_rhashtable.c
> [ ... ]
>> @@ -679,6 +679,76 @@ static int threadfunc(void *data)
>>  	return err;
>>  }
>>  
>> +static int __init test_rhashtable_next_key(void)
>> +{
>> +	struct rhashtable_params params = test_rht_params;
>> +	struct test_obj_val key_missing = { .id = 99999, .tid = 0 };
>> +	struct test_obj_val *prev_key = NULL;
>> +	struct rhashtable ht;
>> +	struct test_obj *objs, *cur;
>> +	int i, count = 0, err;
>> +	int visited_keys[8] = { 0 };
>> +	const int n = ARRAY_SIZE(visited_keys);
>> +
>> +	err = rhashtable_init(&ht, &params);
>> +	if (err)
>> +		return err;
>> +
>> +	objs = kcalloc(n, sizeof(*objs), GFP_KERNEL);
>> +	if (!objs) {
>> +		rhashtable_destroy(&ht);
>> +		return -ENOMEM;
>> +	}
>> +
>> +	for (i = 0; i < n; i++) {
>> +		objs[i].value.id = i;
>> +		err = rhashtable_insert_fast(&ht, &objs[i].node, params);
>> +		if (err)
>> +			goto out;
>> +	}
>> +
>> +	rcu_read_lock();
>> +
>> +	/* NULL prev_key: walk from the beginning, expect all n elements. */
>> +	while ((cur = rhashtable_next_key(&ht, prev_key, params))) {
>> +		if (IS_ERR(cur)) {
>> +			err = -EINVAL;
>> +			goto unlock;
>> +		}
>> +		count++;
>> +		prev_key = &cur->value;
>> +		visited_keys[cur->value.id] = 1;
>> +		if (count > n)
>> +			break;
>> +	}
>> +
>> +	if (count != n) {
>> +		err = -EINVAL;
>> +		goto unlock;
>> +	}
>> +
>> +	for (i = 0; i < n; i++) {
>> +		if (!visited_keys[i]) {
>> +			err = -EINVAL;
>> +			goto unlock;
>> +		}
>> +	}
> 
> [Severity: Medium]
> Will this strict check cause spurious test failures during concurrent rehashing?
> 
> The rhashtable_next_key() API documentation explicitly warns that its walk is
> highly unstable during concurrent rehashing, stating that callers must
> tolerate skipped and duplicated elements.
> 
> This test uses test_rht_params, which inherits its nelem_hint from the
> user-provided size module parameter. If the test is executed with a small
> initial size (e.g., size=4), inserting 8 elements will cross the 75%
> threshold and trigger a background rehash by scheduling ht->run_work.
> 
> Because the test iterates over the keys immediately without waiting for this
> background work to finish (e.g., via flush_work(&ht.run_work) or by locally
> overriding nelem_hint to avoid resizing), the traversal can run concurrently
> with the rehash. This could cause rhashtable_next_key() to legitimately
> return duplicates or skip elements, causing the test to spuriously fail.
> 

the simplest solution should be to provide nelem_hint for the rhashtable.
Also the number of the elements is small, so rehash is not really expected.

> [ ... ]
> 

