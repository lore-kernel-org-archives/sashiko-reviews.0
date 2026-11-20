Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.215.177
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795197174;
	b=vJi5AP1QMsVZN2lr90jpPS4on4/pjgNCKas3p/pLLDHdNozz8JZG+WuOr30+gUSI7Vqd
	 zl0zlyt2SyDq1e8ick+rO4KhsaDijt6ikU/JZlACPqXRp2ryBaJT+YiMYLIGziPYz3dNx
	 4voPtFg6WzcmS3qANvTWwXZfRNv+NsBH0XnFwjzPTquT2Xqh2o/OHxw0BeG2uDzLBZCz9
	 Jo3ctvYl/0ugYK9QeQa36tmdaWafhoacW8KCJEVV6o1K1loOOPJeHeF4uA4sRiyxOuizE
	 n9RTI7qW2hJicBGFxiMcvqMxcgbIakvWdrc+8lzDpL8FRh7BSo7+ypBKz5ORN3RIB7Q==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795197174;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:Received:Content-Type:Date:
	 Message-Id:Subject:From:To:In-Reply-To:References:
	 Content-Transfer-Encoding:MIME-Version;
	bh=BH4blVO7lhv7YIvZ5PaNsfMa7mWDwoq/n8pgt0YXvZs=;
	b=S6yOvD20Af0ApGjvthK5uGl7hxKHZQar9bTOmIex2/DAoAe731qlrxaAEMSrBd+Pc+ft
	 RB6IbWeyaBmpW2dxQKTBhxFJvlrv2LjubmlcwfWJnukCELrwsu++Znl4lTm7WWIS2WCbS
	 KJ+mSG2lMjq69HPPdBuhSwVQ5Ec9BP8/0kt2gh/nZVHr3oDrB+CKbNUqJ1hYukxvVjzvQ
	 6hAJuaEfUAVyBQlmAfd+tQ3dWXuAcGQggKM54rXFSSf0rmMgJ7teRaDFrFcwnV2oPZoUf
	 h5G1jqhGtVarmbw8iLz4/hpUmTJ70e4eVk7dZELfhVEOtdPv4ng8bPBi2Vt/7xRq8dQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=XcWMajcn;
	arc=none smtp.remote-ip=209.85.215.177
Received: from mail-pg1-f177.google.com (mail-pg1-f177.google.com [209.85.215.177])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1AC41606A332
	for <sashiko-reviews@lists.linux.dev>; Fri, 20 Nov 2026 17:52:53 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 1AC41606A332
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=XcWMajcn
Received: by mail-pg1-f177.google.com with SMTP id 41be03b00d2f7-cd8ba7c2694so548004a12.1
        for <sashiko-reviews@lists.linux.dev>; Fri, 20 Nov 2026 09:52:53 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1795197173; x=1795801973; darn=lists.linux.dev;
        h=mime-version:content-transfer-encoding:references:in-reply-to:to
         :from:subject:message-id:date:content-type:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=BH4blVO7lhv7YIvZ5PaNsfMa7mWDwoq/n8pgt0YXvZs=;
        b=XcWMajcnhJp1KgtkLZUorGyB4QpL0I8w4fX6N3hsy39Gz6SKGrIKGbhY3hKvQg0d+0
         DBqJhiv1tgTjHERUnvFYVypGSHHrCPciqX3bbalIpBbnqg196F8CXqIzlGzP8dU+pYkq
         6S7s9dd9K/G/Pzb7JZHgSg5aUt42DRbNpYmI1kpwg5QVX5+3AARBJ4aCYujlUO8uoeGM
         3180f4N3yd2kz7SmiWAYVEFU9jecfFI0krnXWHKocLeRcUHOGB8fSLA6R1dodWn+UMcE
         pu7B7GybwsLOnSyvhOj0tVdT1jwAiTqbWCEF5Hzj09y7Ix94bmNltlIZGYL4/RyHv4PH
         jLUQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795197173; x=1795801973;
        h=mime-version:content-transfer-encoding:references:in-reply-to:to
         :from:subject:message-id:date:content-type:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=BH4blVO7lhv7YIvZ5PaNsfMa7mWDwoq/n8pgt0YXvZs=;
        b=FrwzLnO9pN1Ff0/8jZZU3+FIPw5+KBCRAyE0n1xHP+CGqQ5XKw1ocdyFVh9LJcKv07
         wDngupKSYL/lHGAWCyBy7hq2L0aA+25Uq3FT6tG+kyqWkknqm7gQOCyhwnPO4F5taDwi
         18jTx+UZBRacRAhQdgqK/dKnyxajbx/Rc+qtZ2RMm3Ire8b2JBLfPjqmKDyDSsloATzP
         Ohya/lTZ7NeMFoHqN6RFz0oHFRZWOUBOj/xG4fHOD5jd9fLvSGhym/81vMYxeUKh7BZr
         Z6FT0v44pHNihBqf0lmkRH26S3CiKjKkFH5S66VXfCMBoVkRo5lnyazBv5TnGBjBgMb7
         v5CA==
X-Gm-Message-State: APuU4Z8rSJWfsG0zvC8RMFmQwPYIxDYaiFQXhch4xn4bAfEI6UxW7xh4
	8xKYqJK5W3OcnJJ2uHdlHw9rKFb27jxOBuZYX/9H4LRG9ZsYWudaIllYwYGQ8w==
X-Gm-Gg: AZFdTZfGHuA3fdlal/qBAeTTmPrTZWPmZjksGm0mfS9XO4DeRUtKBomQWTokLmnM/aW
	mYv18cVmnNANRBV4fN/oD7VsCCL8lO4LQhmeyWjMnIDkh4GToZoopAu+eMImNQS+u4oCPtwBe9K
	RR/6rUn4JVqtYYv/2VFBf4CGG6SeQOYXV8SALwMSRL8VSRvVpYsNtM8+1ez3S0GVZ4xfpJaqYHS
	q/M8lt9k0V0vodNMBH2GLOJZnE4o0EP2fdrsbuUXZk5G+uGXtfZH3YNX9QsOvs7nemdg8Hyopbb
	zeS/FCvkZH3ggwfIORy855bMxxdWq/AYG8JCvXn0r6upSmXdDxRQqHUCazVyNESOlanto/mpwYk
	mMWH3Kc1MFLQzaGSV9YFr7nHx/XfwVYfWfgD9YEGwDKwg8LBUxVRAKpvriPcKezsa8u/OhtRUZp
	n2Zq0rQa8F437Uq2H2kDcqK156Eph66LzNN4RpWdYkcT9aUf381DQfu+OlEYFaiSTGYo8ImKjCf
	N9s6mizVDCmdpxDLoirNdyOaePXnhV2WDvJjTCrHAuPvoVkph4xSwMPXXADr6uujBTkj4Wozvj5
	9h1TznLtPgb9LWaYyx2pohpx66p138y8Ai+C5y4RKJvDEyCyl9K9iyHWBt59axWswjroOJlM5vi
	ypcFK7losgXZKn/R5V74rjOKmI9hWjvGFmQ==
X-Received: by 2002:a17:90b:4d0a:b0:39e:4c80:f67b with SMTP id 98e67ed59e1d1-3b41c8fe860mr3506076a91.26.1795197173128;
        Fri, 20 Nov 2026 09:52:53 -0800 (PST)
Received: from localhost ([153.61.198.252])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3b41ad47091sm5190333a91.10.2026.11.20.09.52.52
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 20 Nov 2026 09:52:52 -0800 (PST)
Content-Type: text/plain; charset=UTF-8
Date: Fri, 20 Nov 2026 17:52:52 +0000
Message-Id: <DN08ABWGIAWE.3SYT0JSL0HJW9@gmail.com>
Subject: Re: [PATCH bpf-next 21/49] bpf: Compare states by join_key, then by
 value
From: "Alexei Starovoitov" <alexei.starovoitov@gmail.com>
To: <sashiko-reviews@lists.linux.dev>, <bpf@vger.kernel.org>
In-Reply-To: <sashiko-outbox-224719@kernel.org>
References: <20261120074430.2704488-1-alexei.starovoitov@gmail.com> <20261120074430.2704488-22-alexei.starovoitov@gmail.com> <sashiko-outbox-224719@kernel.org>
Content-Transfer-Encoding: 8bit
X-Mailing-List: sashiko-reviews@lists.linux.dev
List-Id: <sashiko-reviews.lists.linux.dev>
List-Post: <mailto:sashiko-reviews@lists.linux.dev>
List-Help: <mailto:sashiko-reviews+help@lists.linux.dev>
List-Subscribe: <mailto:sashiko-reviews+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:sashiko-reviews+unsubscribe@lists.linux.dev>
List-Owner: <mailto:sashiko-reviews+owner@lists.linux.dev>
Precedence: list
MIME-Version: 1.0

On Fri, Nov 20, 2026 at 12:22 AM sashiko-bot@kernel.org <sashiko-bot@kernel.org> wrote:
>> +		/* it can be filled into a register that is unreadable */
>> +		if (old_type == STACK_SPILL && old_slot->spilled_ptr.type == NOT_INIT &&
>
> [Severity: High]
> Can this leak a spilled pointer when !env->allow_ptr_leaks?

No. Patch 25 adds the join that makes such a spill, and it makes
__is_pointer_value() true for NOT_INIT.
So the atomic insn fails with "leaking pointer from stack off".
Patch 47 has this prog as a test: unreadable_atomic().

>> +		    memcmp(&a->refs[i].ptr, &b->refs[i].ptr, sizeof(u64)))
>
> [Severity: Medium]
> On 32-bit architectures, does passing &refs[i].ptr with sizeof(u64) to
> memcmp() in same_refs() and bpf_hash64() in bpf_hash_join_key() overread the
> 4-byte void *ptr union member?

Not a bug. The union has 8 bytes on 32-bit too, and the compare is for
all of it: parent_id and ctx_arg, or ptr.
memcmp() in fortify-string.h checks __struct_size(), not __member_size().
realloc_array() zeroes a new entry, so the 4 bytes after ptr are 0.
