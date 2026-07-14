Received: from out-185.mta0.migadu.com (out-185.mta0.migadu.com [91.218.175.185])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8AB182EBB8C
	for <sashiko-reviews@lists.linux.dev>; Tue, 14 Jul 2026 05:45:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=91.218.175.185
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784007961; cv=none; b=QQNevyPBksZ2K9YreAUruvdS0RTSTjRDTNY6nGIhP9CT90S3ZUPQ/lLdz7ZZVincbd/wbQp94UCwpQTIjizhexOh6Baz8u5Ez4N/9YrjXwLIlpBwXx3T7dCYSK/TasoTsxckw8bMP5BkOOrVoBoNekvF0x0PUVuUocumPud6hiw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784007961; c=relaxed/simple;
	bh=EcrvypcgfB6svpY8rm/3nkYGWSyZUZ99YmlZsFVnpxA=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=ZhrhoadVlgTI/HzqL5JjKwPiMe6w1+MO+wVkJ4Zq5RfJz1YNmUizXJDZTaXxjhKRUo2Jo2FMu02mG7etFD8Or4yUvhqjGNuPNsxXbg1z9oMoOopPSO4DwDoiGS/z90IlFEXYjV9yVjRVoTrXd1kxKzhnuKFcI+otFY5E1WS49hE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.dev; spf=pass smtp.mailfrom=linux.dev; dkim=pass (1024-bit key) header.d=linux.dev header.i=@linux.dev header.b=LMPycfj9; arc=none smtp.client-ip=91.218.175.185
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.dev
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.dev
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linux.dev header.i=@linux.dev header.b="LMPycfj9"
Message-ID: <ea6d7a5e-c4f1-46de-9b8b-37a76b17b74a@linux.dev>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linux.dev; s=key1;
	t=1784007956;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=guuvEhHaIBFxPQPJ5Yngg6bGOgfH8Gk5niG8LRyqVgY=;
	b=LMPycfj9zQ+eAcw50IGs9ZTIua0P+DcQX9k/MgMYA/0TFlfjcOw3U/5fym6iy/+XLnBnZ9
	+nzJaVfUjmQWvqxY/Gndg2KLGcLTTRKsF1ASoAYB0o41adc0DDRwZlnbCDAeFcHuArcpj3
	/uA0lmZTmex9mjBuaqTekI2XHdBGfA4=
Date: Tue, 14 Jul 2026 13:45:50 +0800
Precedence: bulk
X-Mailing-List: sashiko-reviews@lists.linux.dev
List-Id: <sashiko-reviews.lists.linux.dev>
List-Subscribe: <mailto:sashiko-reviews+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:sashiko-reviews+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Subject: Re: [PATCH bpf-next v9 5/9] bpftool: Generate skeleton for global
 percpu data
To: sashiko-reviews@lists.linux.dev
Cc: bpf@vger.kernel.org
References: <20260713154024.30851-1-leon.hwang@linux.dev>
 <20260713154024.30851-6-leon.hwang@linux.dev>
 <20260713164824.46FA71F000E9@smtp.kernel.org>
X-Report-Abuse: Please report any abuse attempt to abuse@migadu.com and include these headers.
From: Leon Hwang <leon.hwang@linux.dev>
Content-Language: en-US
In-Reply-To: <20260713164824.46FA71F000E9@smtp.kernel.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Migadu-Flow: FLOW_OUT

On 14/7/26 00:48, sashiko-bot@kernel.org wrote:
> Thank you for your contribution! Sashiko AI review found 1 potential issue(s) to consider:
> 
> Pre-existing issues:
> - [High] In light skeletons, `BPF_MAP_TYPE_ARENA` maps with initial values are permanently leaked because `__destroy()` skips them, failing to unmap their memory.
> --
> 
> --- Patch [5]: [PATCH bpf-next v9 5/9] bpftool: Generate skeleton for global percpu data ---
> commit b822b756947c191db53a46cfd85674008d72587c
> Author: Leon Hwang <leon.hwang@linux.dev>
> 
> bpftool: Generate skeleton for global percpu data
> 
> Enhance bpftool to generate skeletons that properly handle global percpu
> variables. The generated skeleton now includes a dedicated structure for
> percpu data, allowing users to initialize and access percpu variables more
> efficiently.
> 
>> diff --git a/tools/bpf/bpftool/gen.c b/tools/bpf/bpftool/gen.c
>> index a01d06d22d1a3..b60db11081497 100644
>> --- a/tools/bpf/bpftool/gen.c
>> +++ b/tools/bpf/bpftool/gen.c
> 
> [ ... ]
> 
>> @@ -669,7 +693,8 @@ static void codegen_destroy(struct bpf_object *obj, const char *obj_name)
>>  		if (!get_map_ident(map, ident, sizeof(ident)))
>>  			continue;
>>  		if (bpf_map__is_internal(map) &&
>> -		    (bpf_map__map_flags(map) & BPF_F_MMAPABLE))
>> +		    ((bpf_map__map_flags(map) & BPF_F_MMAPABLE) ||
>> +		     bpf_map__type(map) == BPF_MAP_TYPE_PERCPU_ARRAY))
>>  			printf("\tskel_free_map_data(skel->%1$s, skel->maps.%1$s.initial_value, %2$zu);\n",
>>  			       ident, bpf_map_mmap_sz(map));
> 
> [Severity: High]
> This is a pre-existing issue, but does this manual internal map check cause
> BPF_MAP_TYPE_ARENA maps to be permanently leaked in light skeletons?
> 


No, this is not a pre-existing issue.

When tried to generate light skeleton for internal arena map, got:

  GEN-SKEL     [test_progs] arena.lskel.h
Bus error

Instead of such implicit error, I'd like to send a separate patch to
reject generating light skeleton for internal arena map explicitly.

Thanks,
Leon

> ARENA maps with initial values appear to be skipped here because
> bpf_map__is_internal() evaluates to false for them. This skips the generation
> of the skel_free_map_data() call.
> 
> Since ARENA maps can be very large, skipping them during skeleton destruction
> leaks both the userspace virtual memory (VMA) and the underlying kernel
> bpf_map object, as the VMA holds a file reference to it. This can lead to
> resource exhaustion if a daemon repeatedly reloads BPF policies.
> 
> Could this code be updated to use is_skel_data() instead of get_map_ident()
> and bpf_map__is_internal() so that ARENA map memory is correctly unmapped and
> freed?
> 
>>  		codegen("\
> 

