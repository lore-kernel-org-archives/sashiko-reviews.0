Received: from mail-pl1-f199.google.com (mail-pl1-f199.google.com [209.85.214.199])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8DCBF343D86
	for <sashiko-reviews@lists.linux.dev>; Fri, 28 Aug 2026 17:59:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.199
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787939963; cv=none; b=maErcO8qLRaxmSh2/GMLPeDz8Ze63lpTwFrCsWD78oDt8CT/lxHDtCYFa6zTLLicsMrD1pvyO7mRZjYdnK5MvnF46HwwkNAdq/x2ulNrdMBzz/blB5rVBXktoTx8kPeFHOWgRhC/bu0iONiYgVMXzu3QIjmr0glPft4MWBoTwNU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787939963; c=relaxed/simple;
	bh=MiD6c0HvfbCJVe/1RUwxw7sOo9GqueryzWGWhQHq1Lo=;
	h=Date:In-Reply-To:Mime-Version:References:Message-ID:Subject:From:
	 To:Cc:Content-Type; b=TeJr/TjWLOGlkSeVIbN1Xu6yrMhUMe4UhhMq0fYWbP38aFJm2xP2PmFdHccznjjzc1XVQwmWanOhRx2K6TNE1jUOXlFcpAxMc7lhPBTd/IMQMBmeP3vFgl5U6O/vvYriewxoO6lDRaADBL0g5tqh1WHHjKYcYiPPN8+Z7Q1+Y+o=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=flex--wfelipe.bounces.google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=sFT+li3h; arc=none smtp.client-ip=209.85.214.199
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flex--wfelipe.bounces.google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="sFT+li3h"
Received: by mail-pl1-f199.google.com with SMTP id d9443c01a7336-2cc640dfde3so15221675ad.1
        for <sashiko-reviews@lists.linux.dev>; Fri, 28 Aug 2026 10:59:21 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20251104; t=1787939961; x=1788544761; darn=lists.linux.dev;
        h=content-type:cc:to:from:subject:message-id:user-agent:references
         :mime-version:in-reply-to:date:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=+GTNkvPpsTdVTeHbuACNRGvLcB6DNRMCndYlWzJb5X4=;
        b=sFT+li3hH/XZcQi4hh6pQTccgy/1qQXvtzoyvp7g9UFLZ55OLGaQ+AzNSSMs+jZVct
         9TmORN0MVupmIlNUnqBrrn377JHdDh72mOErj0HTj7fRgVRBCRVk5NQxMDBqSXHkQShw
         vp1HVweF232Of6aJqgOOgmXQTW1jc4iiVH22cFazlzAPwbEfvU+yFLP3aGGsWtdWxw7b
         k3UMw0qwnVZtzvQXwPthsSGFqnKvjiOFgNxSQpGVXblcPImYFdUpXDHN+6XFqkEE7jyT
         C/fBbpCkf4lMIsUzepNbWYyNyEI96A/md4ivjgVdx+vbqPyzyQGmQGQLvrGmMsXaO/LL
         A66A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1787939961; x=1788544761;
        h=content-type:cc:to:from:subject:message-id:user-agent:references
         :mime-version:in-reply-to:date:x-gm-message-state:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=+GTNkvPpsTdVTeHbuACNRGvLcB6DNRMCndYlWzJb5X4=;
        b=Gj3cZ2CsUlGEIleOKtw2iooX2qynOV9dlCYnIsiGuUJ3y2OhfGJKA9znhh593B2nW3
         hmoAe4GEYf5P3UaVn1NEVNS/D6AE45XvqdKOEcN9+GFahVmLpHXK0gBy6R6njPROilfX
         yd+yLJP9c9VNGj60fG+i3HCCfFVnwnP3pbEuQpXPj5dIcez9VMwdpeDcrtUtttOLAZR8
         nqlQkYdRamjJnFydOquNncgei4WnLzymLKaEGjGjsJECWL2uAVgROWssXcByHP2S5EFC
         H2rO6u0sERgK2FL7a5ox3u1j40HA9k6NQjFudyhz94RhTwL0a50wWsneA+pHXg78g87l
         /UNQ==
X-Gm-Message-State: AFuF++mlQIrVgeHY5YDIFZMAnEyS0/9gR8SxX4SNNDYpDYdF0HejA3CG
	eEmOELKEtGD9AOdxVMVK2aVK8iayBEyZd14dZ1/H8ftK/C5pj2in1th119kz1WDcbwSdKS0W1Zx
	cwZE463kSWQ==
X-Received: from plwg11.prod.google.com ([2002:a17:902:f74b:b0:2d6:fc9e:d2c2])
 (user=wfelipe job=prod-delivery.src-stubby-dispatcher) by 2002:a17:903:2d1:b0:2bf:7b62:a038
 with SMTP id d9443c01a7336-2d74e0b118emr186345555ad.9.1787939960585; Fri, 28
 Aug 2026 10:59:20 -0700 (PDT)
Date: Fri, 28 Aug 2026 17:59:20 +0000
In-Reply-To: <20260828034744.6A3581F000E9@smtp.kernel.org> (sashiko-bot@kernel.org's
 message of "Fri, 28 Aug 2026 03:47:43 +0000")
Precedence: bulk
X-Mailing-List: sashiko-reviews@lists.linux.dev
List-Id: <sashiko-reviews.lists.linux.dev>
List-Subscribe: <mailto:sashiko-reviews+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:sashiko-reviews+unsubscribe@lists.linux.dev>
Mime-Version: 1.0
References: <20260828033741.2184560-1-wfelipe@google.com> <20260828033741.2184560-3-wfelipe@google.com>
 <20260828034744.6A3581F000E9@smtp.kernel.org>
User-Agent: mu4e 1.12.15; emacs 30.2
Message-ID: <p973o6emdt3b.fsf@wfelipe-west1.c.googlers.com>
Subject: Re: [PATCH v4 2/2] selftests/cgroup: test_zswap: fix implicit
 unsigned promotion bug in test_no_kmem_bypass
From: Wilson Felipe Pereira <wfelipe@google.com>
To: sashiko-bot@kernel.org
Cc: sashiko-reviews@lists.linux.dev, hannes@cmpxchg.org, tj@kernel.org, 
	mkoutny@suse.com
Content-Type: text/plain; charset="UTF-8"

sashiko-bot@kernel.org writes:

> Thank you for your contribution! Sashiko AI review found 1 potential issue(s) to consider:
> - [Medium] Incomplete implementation of commit intent: `zswapped` is
> declared as `long` instead of `long long`, leading to potential 32-bit
> overflow.
> --
>
> commit bb72171496c7bafc9b60995dea749e0be36ccea5
> Author: Wilson Felipe Pereira <wfelipe@google.com>
>
> selftests/cgroup: test_zswap: fix implicit unsigned promotion bug in test_no_kmem_bypass
>
> This commit fixes an implicit unsigned promotion issue in test_no_kmem_bypass
> by changing the types of variables used in delta calculations. The commit
> message states that zswapped and delta are updated to signed long long to
> prevent false test failures.
>
>> diff --git a/tools/testing/selftests/cgroup/test_zswap.c b/tools/testing/selftests/cgroup/test_zswap.c
>> index a7ff525c1267e..745c125797c59 100644
>> --- a/tools/testing/selftests/cgroup/test_zswap.c
>> +++ b/tools/testing/selftests/cgroup/test_zswap.c
>> @@ -621,11 +621,14 @@ static int test_no_kmem_bypass(const char *root)
>>  			break;
>>  		/* If memory was pushed to zswap, verify it belongs to memcg */
>>  		if (stored_pages > stored_pages_threshold) {
>> -			int zswapped = cg_read_key_long(test_group, "memory.stat", "zswapped ");
>> -			int delta = stored_pages * page_size - zswapped;
>> -			int result_ok = delta < stored_pages * page_size / 4;
>> -
>> -			ret = result_ok ? KSFT_PASS : KSFT_FAIL;
>> +			long zswapped = cg_read_key_long(
>> +				test_group, "memory.stat", "zswapped ");
>
> [Severity: Medium]
> The commit message mentions declaring zswapped and delta as signed long long,
> but here zswapped is declared as long.
>
> Does this introduce a potential overflow on 32-bit platforms with large RAM?
> The test skips if total RAM is greater than 5GB, but for a 4GB system, the
> target allocation is approximately 2.2GB. On 32-bit systems, long is a 32-bit
> signed integer with a maximum of around 2.14GB.
>
> Since cg_read_key_long() uses atol(), which also returns a 32-bit long on
> these architectures, could a cgroup zswapped memory value exceeding 2.14GB
> wrap around? This might make the delta calculation incorrect and cause a
> false test failure.
>
>> +			long long delta =
>> +				(long long)stored_pages * page_size - zswapped;
>> +			long long max_delta =
>> +				(long long)stored_pages * page_size / 4;
>> +
>> +			ret = (delta < max_delta) ? KSFT_PASS : KSFT_FAIL;
>>  			break;
>>  		}
>>  	}

I'll send a new version sorting out both comments from Sashiko.
