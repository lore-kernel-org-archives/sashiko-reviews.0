Received: from mail-wr1-f46.google.com (mail-wr1-f46.google.com [209.85.221.46])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A8CE12DF128
	for <sashiko-reviews@lists.linux.dev>; Mon,  1 Jun 2026 16:41:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.46
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1780332073; cv=none; b=TUvR/iZWykk1saGIuxeyyjglEWqEHZBafmA6FDYdBjDhgj9MPq96bpHRbYt5qn19e2FqlxM+mrKQ5ePei60xrGd5lVl67IoNMyT+/D8Li294qtvRTT4nvqpUa4X3ymtUQolVLCZrt2X0L3Hi2MgJGXjsorX8QElJu6Xwn3+3yKU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1780332073; c=relaxed/simple;
	bh=9t5Zd58/mYelk9nkWFiE6OxH8Zzt1xWHLjUQOKWlSdA=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=AIRINlPL2BzVbF6KmPeWeT2mNRYbLBA7PxpBqzBiD3dZ2NvnhbXJTomnn2heIXDqQzufPN9492jpDLbrxjhzaTaF7rbZKD/Z00X+t7VzhSOO5TCJjub5cTfuQ0HUO01PNkeCMe5RVxLNLhOmz2+5vPcFkmlnUm8XQ9xVp/o/3QA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=GvwHKq14; arc=none smtp.client-ip=209.85.221.46
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="GvwHKq14"
Received: by mail-wr1-f46.google.com with SMTP id ffacd0b85a97d-45ef1198766so1812071f8f.0
        for <sashiko-reviews@lists.linux.dev>; Mon, 01 Jun 2026 09:41:11 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1780332070; x=1780936870; darn=lists.linux.dev;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=9ev8L0thi6+rD5Jd4KVXxfdxSrwuvhN7/Epr+Jso/B0=;
        b=GvwHKq14ewyS7MhQOYSj0D4Qj0cm1pYfpSRt0CccUASdhxsftwv9Wp9pfysnhhTDS/
         4iXoB88sxP1Q0/+YNFWqVa7c0hASS5/6lgWl/MDbZwjfCSWV4TWPGYwZKCfLH6Ir3R/5
         nrbJpLzkDZ8qDuRDofu7JH1vBW4bXCcVBqoF2w+BpuWhBwQZEz1WkBNovFU0oWJOMSDM
         wHxtcRUaL4IoJ/OUBTyUTfbYu81cPZ/KSQQqRo5p4+fWCPoU5gaywG5UxOPUfF4TcRwL
         AxOZO22bEOOWWRx3lOAjNiPF7yz4J66t1BaNrBs1rJRKnt+XZNt3Dz94oEIrrw6WHlHC
         YihQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1780332070; x=1780936870;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=9ev8L0thi6+rD5Jd4KVXxfdxSrwuvhN7/Epr+Jso/B0=;
        b=WzzZL56nPWQv+AfFdvUX0mO83u24FEDYcyBkvj3w/i7zGIVQvAKPASum+keyA1++zu
         cKwFESBGJzqmV4Nlom6w/mbjf96NcY41wx2N4TWgysKkTaKH2/lsdiKrBlDaQw1BZRW/
         8CfW7A8ZmVSPh5cetdEmwDH95vqOG9aWHOfI+y+2ZUMHS+RqDhPCMn4AYe2dn9Fz6XMO
         LbP0f61cSgjMALAnOQmh4c4SMviy9vhKZql6jpI/5hD5VdIF2XfFOSFQ/B3dpWjALU1F
         qhbAJyAQw5XqdmhXCJ+yv/aTgSmilnU2Je0OQsdZ75gVs4a80xvD6EtkH5qQ4Jub+bPb
         n1Sw==
X-Gm-Message-State: AOJu0YwIGV7RssQU1r9jb1tCL046pUpS4RvThmipWKkzPghFpTsfVdo5
	5bNIv8XulMtGTxwgjQcJz4jAwsGXhDNVvrPa6E7kuqnNTzbjTw2gq/vib2UBX17P
X-Gm-Gg: Acq92OEdkIA0gaOp5e7Wwf05Qhok5XBi84oNQdO4EY8k04pdEhwRTUYEJRbUvbxU2tH
	q8kF/1AODURhxZUim6fThXonw43GQKOs568+b+2v8ssDcW3siupzBXHkXFMVkn2zulPdu/2UKs4
	dddvCFeC5t7/1DcYfdPBt/b0iexp5dT81NsSAdADoEcB0AAoK9V2BMpSiuGIHtreG2sXppdcGf7
	rR6F9sYd3myg2Vob1+jcWadY+tjIwaIbo8owfPMGE2/BD7uFpLoINilulSqbJ48GgtNUaVFSucV
	MkFVuS2kvEkQqoejuuFZhqBnKCOl76b7PDsL2FI2dFl+AltuioRqkXPS6itkibK8AdCL8kCJidY
	B+RVEhUoIv7qjBJ5EDAm4ab+9O+l6Qyk7AxOlbBjC9fwcPELq12BXfw0/CbUN89ySPkgMgSAXKx
	7DZgNIORkZ4UTjzBhBpyGO0gJDS5uY6mxerBUYF2SJ6cIO210plDp50YvBo1ZC8exUa6pPqlJzK
	xgpELzRgydRz/ailaR7iA==
X-Received: by 2002:adf:e104:0:b0:45d:4c30:81a6 with SMTP id ffacd0b85a97d-46018cdd153mr361359f8f.5.1780332069651;
        Mon, 01 Jun 2026 09:41:09 -0700 (PDT)
Received: from ?IPV6:2a01:4b00:bd1f:f500:f867:fc8a:5174:5755? ([2a01:4b00:bd1f:f500:f867:fc8a:5174:5755])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-45ef354cd7csm26190647f8f.18.2026.06.01.09.41.08
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 01 Jun 2026 09:41:09 -0700 (PDT)
Message-ID: <84f0160c-24eb-42b5-8692-549415c80c52@gmail.com>
Date: Mon, 1 Jun 2026 17:41:08 +0100
Precedence: bulk
X-Mailing-List: sashiko-reviews@lists.linux.dev
List-Id: <sashiko-reviews.lists.linux.dev>
List-Subscribe: <mailto:sashiko-reviews+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:sashiko-reviews+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH bpf-next v5 08/11] selftests/bpf: Add basic tests for
 resizable hash map
To: sashiko-reviews@lists.linux.dev
Cc: bpf@vger.kernel.org
References: <20260528-rhash-v5-8-7205191b6c57@meta.com>
 <20260528184115.AC1441F000E9@smtp.kernel.org>
Content-Language: en-US
From: Mykyta Yatsenko <mykyta.yatsenko5@gmail.com>
In-Reply-To: <20260528184115.AC1441F000E9@smtp.kernel.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit



On 5/28/26 7:41 PM, sashiko-bot@kernel.org wrote:
> Thank you for your contribution! Sashiko AI review found 1 potential issue(s) to consider:
> - [Low] Missing file descriptor validation for `bpf_program__fd(prog)` after retrieving the program via `bpf_object__find_program_by_name()`.
> --
> 
> commit 85c8ece43292fc1ae20a51c42265be508a83ec61
> Author: Mykyta Yatsenko <yatsenko@meta.com>
> 
> selftests/bpf: Add basic tests for resizable hash map
>     
> Test basic map operations (lookup, update, delete) for
> BPF_MAP_TYPE_RHASH including boundary conditions like duplicate
> key insertion and deletion of nonexistent keys.
> 
>> diff --git a/tools/testing/selftests/bpf/prog_tests/rhash.c b/tools/testing/selftests/bpf/prog_tests/rhash.c
>> new file mode 100644
>> index 0000000000000..69686bf69ba57
>> --- /dev/null
>> +++ b/tools/testing/selftests/bpf/prog_tests/rhash.c
> [ ... ]
>> +static void rhash_run(const char *prog_name)
>> +{
>> +	struct rhash *skel;
>> +	struct bpf_program *prog;
>> +	LIBBPF_OPTS(bpf_test_run_opts, opts);
>> +	int err;
>> +
>> +	skel = rhash__open();
>> +	if (!ASSERT_OK_PTR(skel, "rhash__open"))
>> +		return;
>> +
>> +	prog = bpf_object__find_program_by_name(skel->obj, prog_name);
>> +	if (!ASSERT_OK_PTR(prog, "bpf_object__find_program_by_name"))
>> +		goto cleanup;
>> +	bpf_program__set_autoload(prog, true);
>> +
>> +	err = rhash__load(skel);
>> +	if (!ASSERT_OK(err, "skel_load"))
>> +		goto cleanup;
>> +
>> +	err = bpf_prog_test_run_opts(bpf_program__fd(prog), &opts);
> 
> [Severity: Low]
> Does the file descriptor returned by bpf_program__fd(prog) need to be
> validated here? 
> 

fd should be valid after rhash__load()

> Since prog was obtained via the manual lookup API
> bpf_object__find_program_by_name(), should we verify the fd is valid (>= 0)
> using ASSERT_GE before passing it to bpf_prog_test_run_opts()?
> 
>> +	if (!ASSERT_OK(err, "prog run"))
>> +		goto cleanup;
>> +
>> +	if (!ASSERT_OK(opts.retval, "prog retval"))
>> +		goto cleanup;
> 

