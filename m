Received: from mta0.migadu.com (out-213.mta0.migadu.com [91.218.175.213])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BF0B148F85C
	for <sashiko-reviews@lists.linux.dev>; Tue, 22 Sep 2026 05:49:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=91.218.175.213
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790056152; cv=none; b=fM+q6bjrrirvh7ELwn9bNkUjAcZhvIPyJiKwpEYrmLoXho1luJ4yHkbQ9Qge1a0YVY/tTOmOIDPpypPTvYtqf4TUZ9ZpqNUgKlE22qCiiDJb+1nEmijZBzClmnakrFpqM9ZhyNVSYZhbrU8ornYklVL+7/MRcnsKWE2wNQm6K38=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790056152; c=relaxed/simple;
	bh=hOlosnGu2RMmvjNSASjGB3jx8rkNqvyS+dSMnzhifkk=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=D695LmgW6NuzpyIyXnMLlc64KNacJzB0fFEoCUh7s7CDEQFiCt9jfG7A71yF5+103MUk26batCG3q0Wwa3MaJQtunrOhJDQ7Uc2w3xb5AXP8h3JxDiN8TMWhoWuuMwRPnVm6osuFZhEx7d0P0AvYy1KP2PUW9uIuSVN6FqruwZ8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.dev; spf=pass smtp.mailfrom=linux.dev; dkim=pass (1024-bit key) header.d=linux.dev header.i=@linux.dev header.b=syURb0Lu; arc=none smtp.client-ip=91.218.175.213
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.dev
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.dev
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linux.dev header.i=@linux.dev header.b="syURb0Lu"
X-Envelope-To: sashiko-reviews@lists.linux.dev
DKIM-Signature: a=rsa-sha256; bh=hOlosnGu2RMmvjNSASjGB3jx8rkNqvyS+dSMnzhifkk=;
 c=simple/simple; d=linux.dev;
 h=from:to:subject:date:message-id:mime-version:content-type; s=key1;
 t=1790056145; v=1; x=1790660945;
 b=syURb0LuXqas1CpKHpZQNj0/K/GqCnuUcpOi7BxO3l80YeqiODoBxigfMhHUeL2JK2agyatV
 58ycjtzIFeHVmEoN6uMSQBMIT69SmAlP9cFp3hoWPJpDe6unxHXj5wSronNbEcibm0RJdOl3avC
 7+Zp2Nppi+mhvCmC/WNvzw1I=
X-Envelope-To: sashiko-reviews@lists.linux.dev
Received: by smtp.migadu.com with ESMTPS id 2527447438042083;
	Tue, 22 Sep 2026 05:49:05 +0000
X-Mizu-Trace-ID: 2527447438042083
X-Migadu-Flow: FLOW_OUT
Message-ID: <a139c5c9-9d52-408b-9a91-a2b3ad928691@linux.dev>
Date: Tue, 22 Sep 2026 13:49:01 +0800
Precedence: bulk
X-Mailing-List: sashiko-reviews@lists.linux.dev
List-Id: <sashiko-reviews.lists.linux.dev>
List-Subscribe: <mailto:sashiko-reviews+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:sashiko-reviews+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 1/2] docs: cgroup-v2: Describe boot-isolated CPUs in
 cpuset.cpus.isolated
To: sashiko-reviews@lists.linux.dev
Cc: tj@kernel.org, hannes@cmpxchg.org, mkoutny@suse.com
References: <20260922032130.33777-1-guopeng.zhang@linux.dev>
 <20260922032130.33777-2-guopeng.zhang@linux.dev>
 <20260922033022.E32741F000FF@smtp.kernel.org>
Content-Language: en-US
From: Guopeng Zhang <guopeng.zhang@linux.dev>
In-Reply-To: <20260922033022.E32741F000FF@smtp.kernel.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit



在 2026/9/22 11:30, sashiko-bot@kernel.org 写道:
> Thank you for your contribution! Sashiko AI review found 1 potential issue(s) to consider:
> - [Medium] cgroup: false claim in docs about boot-isolated CPUs after partition release
> --
> 
> commit 90dfc3bfef47bea738ec73e5d266a04ea1942e6d
> Author: Guopeng Zhang <zhangguopeng@kylinos.cn>
> 
> docs: cgroup-v2: Describe boot-isolated CPUs in cpuset.cpus.isolated
> 
> This commit updates the documentation for cpuset.cpus.isolated to mention
> that boot-isolated CPUs are also listed. It claims these CPUs remain listed
> even after a partition using them is released.
> 
>> diff --git a/Documentation/admin-guide/cgroup-v2.rst b/Documentation/admin-guide/cgroup-v2.rst
>> index ebc683070521c..3e94fc88e7db9 100644
>> --- a/Documentation/admin-guide/cgroup-v2.rst
>> +++ b/Documentation/admin-guide/cgroup-v2.rst
>> @@ -2651,8 +2651,9 @@ Cpuset Interface Files
>>  	A read-only and root cgroup only multiple values file.
>>  
>>  	This file shows the set of all isolated CPUs used in existing
>> -	isolated partitions. It will be empty if no isolated partition
>> -	is created.
>> +	isolated partitions or isolated at boot time via the "domain"
>> +	flag of "isolcpus". The latter remain listed even after any
>> +	partition using them is released.
> 
> [Severity: Medium]
> Is this description accurate regarding what happens when a partition is
> released?
> 
> Looking at isolated_cpus_update() in kernel/cgroup/cpuset.c, when an isolated
> partition using these CPUs is released and changes state, the code executes
> this branch:
> 
> kernel/cgroup/cpuset.c:isolated_cpus_update() {
>     ...
> 	} else {
> 		if (!cpumask_intersects(xcpus, isolated_cpus))
> 			return;
> 		cpumask_andnot(isolated_cpus, isolated_cpus, xcpus);
> 	}
>     ...
> }
> 
> Does this permanently clear the boot-isolated CPUs from the isolated_cpus
> mask, meaning they will no longer be listed when reading
> cpuset.cpus.isolated?
> 

This is the old code. I already addressed this in the v1 discussion:

https://lore.kernel.org/all/ac00f803-bc13-40f7-8493-1d7b24010c75@linux.dev/

Thanks,
Guopeng

