Received: from out-179.mta1.migadu.com (out-179.mta1.migadu.com [95.215.58.179])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 959B63C9437
	for <sashiko-reviews@lists.linux.dev>; Tue, 16 Jun 2026 04:17:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=95.215.58.179
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1781583477; cv=none; b=Y0ljRxekDp+VDl01paVQz/HINOOrtWQUzEvxnIfq8VAYKbjeg+hMk5qB/GxSNt9CMP05g+oNwqt9wIhCEvpfmzJ4yoCQme0Z2Au2D8+GC90d5UhABjODjdNyCdJ4jhoo7HxHLQFmwFdQYrYGrJbfhR36ZiybqfMU5U5I7OSgdlI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1781583477; c=relaxed/simple;
	bh=USNLKhj3k16JR8oOL4/S1pRPshtH/8Mo3qYhJ+1GfGY=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=jGImcRXLZeIp/GwaVJDmR1b0vUxrLinRii1ZaMxkHrbrou9yIEk/f6kkOIpob4uiJ4vJaMiUvHzZ5vvNtS9B1yrMUdJooBGoX1dclSHET7LVngcp7czaAO3zQgiYFBFnoY6gv6LQjtf/U+6rBxr8MZG2aAU1mhuWzdRSWfgkgnI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.dev; spf=pass smtp.mailfrom=linux.dev; dkim=pass (1024-bit key) header.d=linux.dev header.i=@linux.dev header.b=L3bezZAB; arc=none smtp.client-ip=95.215.58.179
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.dev
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.dev
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linux.dev header.i=@linux.dev header.b="L3bezZAB"
Message-ID: <2d04bd08-564f-4dcb-b00a-f021bc6bea31@linux.dev>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linux.dev; s=key1;
	t=1781583470;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=2nOZ1YMCJAalO06fFQ6AVZtuvkVJPgR3ezYX8se0sNc=;
	b=L3bezZABlMJHRHe/ekazJzQnVDw+ZUZ+dDOru1fvwebe9169WIbkZogXJYiHIaEJ80gNQB
	pJCJB9uFYkLZw/tTVrRXQsvk6yhjkGchijRaqhpIWxJxHtAB/NZtdWDDlPXkqYfjGl490W
	xA5poQAWWcHAyDjdh2V/RLjQnks4NQU=
Date: Tue, 16 Jun 2026 12:17:38 +0800
Precedence: bulk
X-Mailing-List: sashiko-reviews@lists.linux.dev
List-Id: <sashiko-reviews.lists.linux.dev>
List-Subscribe: <mailto:sashiko-reviews+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:sashiko-reviews+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Subject: Re: [PATCH bpf-next v6 06/12] libbpf: Add support for global percpu
 data
Content-Language: en-US
To: sashiko-reviews@lists.linux.dev
Cc: bpf@vger.kernel.org
References: <20260615152646.27639-7-leon.hwang@linux.dev>
 <20260615154158.5CF531F000E9@smtp.kernel.org>
X-Report-Abuse: Please report any abuse attempt to abuse@migadu.com and include these headers.
From: Leon Hwang <leon.hwang@linux.dev>
In-Reply-To: <20260615154158.5CF531F000E9@smtp.kernel.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Migadu-Flow: FLOW_OUT

On 15/6/26 23:41, sashiko-bot@kernel.org wrote:
[...]
> 
>> @@ -1198,6 +1198,7 @@ void bpf_gen__map_update_elem(struct bpf_gen *gen, int map_idx, void *pvalue,
>>  	int zero = 0;
>>  
>>  	memset(&attr, 0, attr_size);
>> +	attr.flags = flags;
> 
> [Severity: High]
> Does this assignment need to use tgt_endian() to support cross-compilation?
> 
> When libbpf generates a skeleton loader for a target architecture with a
> different endianness than the host, fields populated into the union bpf_attr
> blob usually need to be converted to the target byte order.
> 
> For global percpu data maps, this flag will be BPF_F_ALL_CPUS (0x10). If a
> little-endian host generates a skeleton for a big-endian target, a direct
> assignment of the 64-bit value could result in it being interpreted as
> 0x1000000000000000 by the target kernel, which would cause the sys_bpf
> call to fail with -EINVAL.
> 
Will use tgt_endian() in the next revision.

Thanks,
Leon

