Received: from mailtransmit05.runbox.com (mailtransmit05.runbox.com [185.226.149.38])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DFCA13769EB
	for <sashiko-reviews@lists.linux.dev>; Sun, 28 Jun 2026 21:58:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=185.226.149.38
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1782683929; cv=none; b=DOBDGT9/1l5PCTA8Y7keefctGUKQakmP1mPc+1cLs9WJyfrSX4WeVflkmMkMXKJ/1d1oCUouamWxsWW+vWKZMD+51zng2g+qitb0oWRayKqBpWXQFGsfP0BVK9Yx+MxsoE2+CAtluKMApXGsZnlJt0zAJsCKc/v2cT9QgD27hgI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1782683929; c=relaxed/simple;
	bh=v+0fXwTmf57pCgSmaKrgKNV5zhlSOtezjQW6isIKjJk=;
	h=Message-ID:Date:MIME-Version:From:Subject:To:Cc:References:
	 In-Reply-To:Content-Type; b=ZB5op5aEMJojM4kRpIm5fGYSi1O4/o1trhsf1CvklGXx6gbULDZqbZ7+WnsrlK7USMsi4c2R4/sVbdZbnA3gndExJfqiRoSiOIUtmX2YCiOMFcqrTFZHakOSWio0FlameeCso+3zl/RBXDRKYYS8222k1hCt+EOzVk+oHZjUldg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=rbox.co; spf=pass smtp.mailfrom=rbox.co; dkim=pass (2048-bit key) header.d=rbox.co header.i=@rbox.co header.b=cuFukVw7; arc=none smtp.client-ip=185.226.149.38
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=rbox.co
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=rbox.co
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=rbox.co header.i=@rbox.co header.b="cuFukVw7"
Received: from mailtransmit03.runbox ([10.9.9.163] helo=aibo.runbox.com)
	by mailtransmit05.runbox.com with esmtps  (TLS1.2) tls TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256
	(Exim 4.93)
	(envelope-from <mhal@rbox.co>)
	id 1wdxWV-001ZHx-Up
	for sashiko-reviews@lists.linux.dev; Sun, 28 Jun 2026 23:58:43 +0200
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=rbox.co;
	s=selector2; h=Content-Transfer-Encoding:Content-Type:In-Reply-To:References:
	Cc:To:Subject:From:MIME-Version:Date:Message-ID;
	bh=sPeb5q0xeXOj/NxsIKYV4/KG4krbezUA/1C6aNF8m8A=; b=cuFukVw7EthGnOm1hvY2JzIvtH
	5+rz2G087q93/uztP80jQy6Dv1KDxX+IAgcY2TuROVyHYL2WM1JJwQzo28PFq/p49T1FcEYP3wQVf
	6SjZI4h0hn+612aZ/5slgn1w7hZjq7d1wB16mmhqWrdFETm3v6rg/WaEnrjFTfAdSwmx/1DHLQE6K
	lZZVCmYMjZL7gWN8IubiF8gNVvL8//8W3YGoPSDxKY2Ci/WNxOW5gnKcbXpWUn/TyeaGVMUyVr+8W
	sGSvqgosBwF03DXPwSGGUMTS94x6+RlLK0SNjdO1TZYKb9dsjTaPWvu0p3jMrS/aAAw7JjjOP0EBF
	YNzqKC5g==;
Received: from [10.9.9.74] (helo=submission03.runbox)
	by mailtransmit03.runbox with esmtp (Exim 4.86_2)
	(envelope-from <mhal@rbox.co>)
	id 1wdxWV-0005xq-Ke; Sun, 28 Jun 2026 23:58:43 +0200
Received: by submission03.runbox with esmtpsa  [Authenticated ID (604044)]  (TLS1.2:ECDHE_SECP256R1__RSA_PSS_RSAE_SHA256__AES_256_GCM:256)
	(Exim 4.95)
	id 1wdxWV-00DOgq-7e;
	Sun, 28 Jun 2026 23:58:43 +0200
Message-ID: <59ca97fc-1534-43c7-a6b1-00268e1352ed@rbox.co>
Date: Sun, 28 Jun 2026 23:58:42 +0200
Precedence: bulk
X-Mailing-List: sashiko-reviews@lists.linux.dev
List-Id: <sashiko-reviews.lists.linux.dev>
List-Subscribe: <mailto:sashiko-reviews+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:sashiko-reviews+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
From: Michal Luczaj <mhal@rbox.co>
Subject: Re: [PATCH bpf v2 3/4] selftests/bpf: Adapt sockmap update error
 handling
To: sashiko-reviews@lists.linux.dev
Cc: bpf@vger.kernel.org
References: <20260626-sockmap-lookup-udp-leak-v2-0-7e7e201c951a@rbox.co>
 <20260626-sockmap-lookup-udp-leak-v2-3-7e7e201c951a@rbox.co>
 <20260626204322.E76D91F000E9@smtp.kernel.org>
Content-Language: pl-PL, en-GB
In-Reply-To: <20260626204322.E76D91F000E9@smtp.kernel.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 6/26/26 22:43, sashiko-bot@kernel.org wrote:
>> diff --git a/tools/testing/selftests/bpf/prog_tests/sockmap_listen.c b/tools/testing/selftests/bpf/prog_tests/sockmap_listen.c
>> index cc0c68bab9079..6ee1bc6b3b235 100644
>> --- a/tools/testing/selftests/bpf/prog_tests/sockmap_listen.c
>> +++ b/tools/testing/selftests/bpf/prog_tests/sockmap_listen.c
>> @@ -63,11 +63,8 @@ static void test_insert_opened(struct test_sockmap_listen *skel __always_unused,
>>  	errno = 0;
>>  	value = s;
>>  	err = bpf_map_update_elem(mapfd, &key, &value, BPF_NOEXIST);
>> -	if (sotype == SOCK_STREAM) {
>> -		if (!err || errno != EOPNOTSUPP)
>> -			FAIL_ERRNO("map_update: expected EOPNOTSUPP");
>> -	} else if (err)
>> -		FAIL_ERRNO("map_update: expected success");
>> +	if (!err || errno != EOPNOTSUPP)
>> +		FAIL_ERRNO("map_update: expected EOPNOTSUPP");
> 
> [Severity: Low]
> This is a pre-existing issue, but since this block in test_insert_opened() is
> being updated, should these deprecated FAIL_ERRNO() macros be migrated to the
> modern ASSERT_*() macros? The BPF selftests subsystem guidelines prefer using
> ASSERT_* macros when updating existing tests.
> 
> [ ... ]
> 
>> @@ -93,8 +90,12 @@ static void test_insert_bound(struct test_sockmap_listen *skel __always_unused,
>>  	errno = 0;
>>  	value = s;
>>  	err = bpf_map_update_elem(mapfd, &key, &value, BPF_NOEXIST);
>> -	if (!err || errno != EOPNOTSUPP)
>> -		FAIL_ERRNO("map_update: expected EOPNOTSUPP");
>> +	if (sotype == SOCK_STREAM) {
>> +		if (!err || errno != EOPNOTSUPP)
>> +			FAIL_ERRNO("map_update: expected EOPNOTSUPP");
>> +	} else if (err) {
>> +		FAIL_ERRNO("map_update: expected success");
>> +	}
> 
> [Severity: Low]
> This isn't a bug introduced by this patch, but would it make sense to replace
> these FAIL_ERRNO() checks in test_insert_bound() with ASSERT_ERR() or similar
> modern macros while refactoring this logic?

All right, will do.

Michal

