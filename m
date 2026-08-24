Received: from mta0.migadu.com (out-142.mta0.migadu.com [91.218.175.142])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0E51C219E8
	for <sashiko-reviews@lists.linux.dev>; Mon, 24 Aug 2026 01:42:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=91.218.175.142
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787535741; cv=none; b=L7YP3mt3zaNUrUsdSzdb/eeO1WJYGkGPJE50PyHpnRQ3GaF8bIPnM5+lf4oXwnPnFUtM4KfUeCCutA4BNxR+4D1QY5OwZyTr568SmHD7N8n/rUlCyv27BnNVVT6yzAI0tzI7Hzo7HdwLRatDuogZTdy47H3lBSVWQ/O7fP7kRfw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787535741; c=relaxed/simple;
	bh=jctUx17ZFMHWW2sl5F+Q/EnR4+zqTMNJOEO2Jtoffqs=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=fLDTh5MslvXHdsfS0ut1Her6lPKcNbyQZw7uvtoC5EDk+uCdewQldGEQGZ+kgKYN40rSGW2EvoZTGzK8538LZ6YLWmbkxu4gvKuWcqm7Fv/sGu5k6JWZmGcUgenop8jAY2hxRSmN6O0bRMShWKUDTgvRWoN+WbExAQY9VNeyC1w=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.dev; spf=pass smtp.mailfrom=linux.dev; dkim=pass (1024-bit key) header.d=linux.dev header.i=@linux.dev header.b=bw+Dw3p7; arc=none smtp.client-ip=91.218.175.142
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.dev
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.dev
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linux.dev header.i=@linux.dev header.b="bw+Dw3p7"
X-Envelope-To: sashiko-reviews@lists.linux.dev
DKIM-Signature: a=rsa-sha256; bh=jctUx17ZFMHWW2sl5F+Q/EnR4+zqTMNJOEO2Jtoffqs=;
 c=simple/simple; d=linux.dev;
 h=from:to:subject:date:message-id:mime-version:content-type; s=key1;
 t=1787535737; v=1; x=1788140537;
 b=bw+Dw3p7qqd3IVYJDwRXoxGMmezLFHv8fVaenBvxhO2IHArD61QpiDdHmur2kY6oYRYXNOp3
 OnrYao7P75CbByPqZMV6QO+3r9DhQ8fazTyIAmNs2qaKJpCWNmndO9cF/YOFrEktpe2m0aSwN98
 SMMX2IJOkRsl9E+RGJ8Qy8HY=
X-Envelope-To: sashiko-reviews@lists.linux.dev
Received: from [192.168.109.140] (223.70.159.239)
	by smtp.migadu.com with ESMTPS id a2129daf5ea65be4;
	Mon, 24 Aug 2026 01:42:17 +0000
X-Mizu-Trace-ID: a2129daf5ea65be4
X-Migadu-Flow: FLOW_OUT
Message-ID: <b40f9d8e-99f6-44d0-b783-db2bab6c041f@linux.dev>
Date: Mon, 24 Aug 2026 09:42:15 +0800
Precedence: bulk
X-Mailing-List: sashiko-reviews@lists.linux.dev
List-Id: <sashiko-reviews.lists.linux.dev>
List-Subscribe: <mailto:sashiko-reviews+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:sashiko-reviews+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 01/17] selftests/cgroup: Drop invalid boot isolation
 comparison
To: sashiko-reviews@lists.linux.dev
Cc: hannes@cmpxchg.org, mkoutny@suse.com, tj@kernel.org
References: <20260820124202.517160-1-guopeng.zhang@linux.dev>
 <20260820124202.517160-2-guopeng.zhang@linux.dev>
 <20260820125337.B1C5D1F000E9@smtp.kernel.org>
Content-Language: en-US
From: Guopeng Zhang <guopeng.zhang@linux.dev>
In-Reply-To: <20260820125337.B1C5D1F000E9@smtp.kernel.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit



在 2026/8/20 20:53, sashiko-bot@kernel.org 写道:
> Thank you for your contribution! Sashiko AI review found 1 potential issue(s) to consider:
> - [Medium] Removing the check for /sys/devices/system/cpu/isolated drops critical test coverage for the dynamically updated housekeeping mask.
> --
> 
> --- Patch [1]: [PATCH 01/17] selftests/cgroup: Drop invalid boot isolation comparison ---
> commit 9327a9b65fdcaad904f3dc133a330232cb860c67
> Author: Guopeng Zhang <zhangguopeng@kylinos.cn>
> selftests/cgroup: Drop invalid boot isolation comparison
> 
> This commit removes the comparison between the cgroup cpuset.cpus.isolated
> mask and the housekeeping mask at /sys/devices/system/cpu/isolated in the
> test_cpuset_prs.sh selftest. The change is intended to fix test failures
> when isolcpus=domain is present by removing the HKICPUS read and comparison.
> 
>> diff --git a/tools/testing/selftests/cgroup/test_cpuset_prs.sh b/tools/testing/selftests/cgroup/test_cpuset_prs.sh
>> index da8f7b9201784..fdb3185570d40 100755
>> --- a/tools/testing/selftests/cgroup/test_cpuset_prs.sh
>> +++ b/tools/testing/selftests/cgroup/test_cpuset_prs.sh
> [ ... ]
>> @@ -835,11 +834,6 @@ check_isolcpus()
>>  	ISOLCPUS=
>>  	EXPECTED_ISOLCPUS=$EXPECTED_SDOMAIN
>>  
>> -	#
>> -	# The inverse of HK_TYPE_DOMAIN cpumask in $HKICPUS should match $ISOLCPUS
>> -	#
>> -	[[ "$ISOLCPUS" != "$HKICPUS" ]] && return 1
>> -
> 
> [Severity: Medium]
> Does removing this check completely drop critical test coverage for the
> dynamically updated housekeeping mask?
> 
> Commit 6df415aa46ec specifically deferred housekeeping_update() execution to
> a workqueue. By removing this comparison, the test no longer verifies that
> those deferred updates correctly apply the isolated CPUs to the housekeeping
> subsystem.
> 
> Instead of removing the check entirely, could we fix it by re-reading
> HKICPUS inside a retry loop and comparing it against EXPECTED_ISOLCPUS?
> 

This sysfs file cannot observe the dynamically updated housekeeping
mask. `print_cpus_isolated()` reports the `HK_TYPE_DOMAIN_BOOT` mask,
while `housekeeping_update()` updates the `HK_TYPE_DOMAIN` mask.
Therefore, re-reading `HKICPUS` would still only return the boot-time
isolated CPUs and would not validate dynamically isolated cpuset CPUs.

The dynamic isolation state is verified through `cpuset.cpus.isolated`
and the scheduler domains, which reflect the `HK_TYPE_DOMAIN` update.
Therefore, removing this comparison is intentional.

Thanks,
Guopeng

>>  	#
>>  	# Use the sched domain in debugfs to check isolated CPUs, if available
>>  	#
> 

