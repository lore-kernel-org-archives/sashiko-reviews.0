Received: from mta1.migadu.com (out-183.mta1.migadu.com [95.215.58.183])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B14813C4168
	for <sashiko-reviews@lists.linux.dev>; Sun, 20 Sep 2026 03:09:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=95.215.58.183
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789873755; cv=none; b=Y4Dg4aPCgs0AOmcjluwS+dTqin/q4xOptwGv1LJRRPofLXonlto2S93UA9KC2xi5Nuwt6dICbVNKEs+9syBQkU/EUXZUWyb0+RULPBpz4vQELOkzx/mYiNc6P0wIznCpf6+IVFyqdiStkJDao6mUK6UN5jQy8b0j1ptP9wq5bM8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789873755; c=relaxed/simple;
	bh=Z1NUSGFe+rOrfPsK7KriuBpOdZ3sxhpc5TTsyNkXk0k=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=qV6Pkl167lPgHIVn8mjJr23lqKz4Xgd2XFM6Yiil3p/Iy7PAUa8ug4XYv2VjHrN9gnsJC/nNK65OLJeKnT69MZTlnGbjK9vEbHUioQTtJCfsmSF2Ql2285m6wIoI2IPipF+rXPcNJHUMoykkoWeQZffgL/lSNvA3lMt3h8gaVA8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.dev; spf=pass smtp.mailfrom=linux.dev; dkim=pass (1024-bit key) header.d=linux.dev header.i=@linux.dev header.b=QXIrsnX0; arc=none smtp.client-ip=95.215.58.183
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.dev
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.dev
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linux.dev header.i=@linux.dev header.b="QXIrsnX0"
X-Envelope-To: sashiko-reviews@lists.linux.dev
DKIM-Signature: a=rsa-sha256; bh=Z1NUSGFe+rOrfPsK7KriuBpOdZ3sxhpc5TTsyNkXk0k=;
 c=simple/simple; d=linux.dev;
 h=from:to:subject:date:message-id:mime-version:content-type; s=key1;
 t=1789873750; v=1; x=1790478550;
 b=QXIrsnX0MCo/hM0dq+FMMMbkpoAz2Q5QEkdUgdknQJMpoM3KFopXzQTY1EJX5Zr2f4c5J0vy
 OUchITbjBVSwlxKuMnyp4It3y3Uz/zBV5c2f+6KOWfZc3OB+NLoVhCDt4XNm0gqddvGFrrgaexw
 x+8xiB17XHIZpgsimPbxXSZk=
X-Envelope-To: sashiko-reviews@lists.linux.dev
Received: by smtp.migadu.com with ESMTPS id 8484f6b53dd9d7aa;
	Sun, 20 Sep 2026 03:09:10 +0000
X-Mizu-Trace-ID: 8484f6b53dd9d7aa
X-Migadu-Flow: FLOW_OUT
Message-ID: <ac00f803-bc13-40f7-8493-1d7b24010c75@linux.dev>
Date: Sun, 20 Sep 2026 11:09:03 +0800
Precedence: bulk
X-Mailing-List: sashiko-reviews@lists.linux.dev
List-Id: <sashiko-reviews.lists.linux.dev>
List-Subscribe: <mailto:sashiko-reviews+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:sashiko-reviews+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 1/2] docs: cgroup-v2: Describe boot-isolated CPUs in
 cpuset.cpus.isolated
To: sashiko-reviews@lists.linux.dev
Cc: tj@kernel.org, hannes@cmpxchg.org, mkoutny@suse.com
References: <20260918102359.71826-1-guopeng.zhang@linux.dev>
 <20260918102359.71826-2-guopeng.zhang@linux.dev>
 <20260918105023.646B71F000FF@smtp.kernel.org>
Content-Language: en-US
From: Guopeng Zhang <guopeng.zhang@linux.dev>
In-Reply-To: <20260918105023.646B71F000FF@smtp.kernel.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit



在 2026/9/18 18:50, sashiko-bot@kernel.org 写道:
> Thank you for your contribution! Sashiko AI review found 1 potential issue(s) to consider:
> - [Medium] cgroup/cpuset: boot-isolated CPUs lost from cpuset.cpus.isolated on partition release
> --
> 
> commit e1e9b698bdf04aebf82c92a40588b3e308527a2f
> Author: Guopeng Zhang <zhangguopeng@kylinos.cn>
> 
> docs: cgroup-v2: Describe boot-isolated CPUs in cpuset.cpus.isolated
> 
> cpuset.cpus.isolated is documented as empty when no isolated partition
> exists. This is not true when CPUs are isolated at boot with
> isolcpus=domain. cpuset_init() adds those CPUs to the isolated mask,
> and isolcpus=<cpu-list> uses domain isolation by default. They remain
> listed after a partition using them is released.
> 
> Document the boot-isolated CPUs as well.
> 
>> diff --git a/Documentation/admin-guide/cgroup-v2.rst b/Documentation/admin-guide/cgroup-v2.rst
>> index ebc683070521c..e666b9e15e1c1 100644
>> --- a/Documentation/admin-guide/cgroup-v2.rst
>> +++ b/Documentation/admin-guide/cgroup-v2.rst
>> @@ -2650,9 +2650,11 @@ Cpuset Interface Files
>>    cpuset.cpus.isolated
>>  	A read-only and root cgroup only multiple values file.
>>  
>> -	This file shows the set of all isolated CPUs used in existing
>> -	isolated partitions. It will be empty if no isolated partition
>> -	is created.
>> +	This file shows CPUs isolated from scheduler domains by
>> +	isolated cpuset partitions or at boot with "isolcpus=domain"
>> +	(including the default "isolcpus=<cpu-list>" form).  CPUs
>> +	isolated at boot remain listed after any partition using them
>> +	is released.
> 
> [Severity: Medium]
> Does the code actually behave as described here?
> 
> Looking at isolated_cpus_update() in kernel/cgroup/cpuset.c, when a
> partition is deactivated, it appears to unconditionally remove the released
> CPUs from the isolated_cpus mask:
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
> Because there is no logic to check if those CPUs were originally part of
> the boot-isolated set (i.e., outside HK_TYPE_DOMAIN_BOOT), they seem to be
> permanently purged from the isolated_cpus mask and thus disappear from
> cpuset.cpus.isolated.
> 
> If a user boots with isolcpus=domain for CPU 2, creates an isolated cpuset
> partition containing CPU 2, and then deactivates the partition, wouldn't
> CPU 2 be lost from cpuset.cpus.isolated? This appears to contradict the
> behavior explicitly promised by this documentation update.
> 

The code quoted here is the old implementation. This was fixed by commit
6c37d7e074a4 ("cgroup/cpuset: Preserve boot-isolated CPUs on partition release") [1].

The current code checks HK_TYPE_DOMAIN_BOOT before clearing a CPU from
isolated_cpus, so boot-isolated CPUs remain in cpuset.cpus.isolated after
the partition is released.

[1] https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git/commit/?id=6c37d7e074a4be1ba8da59f4ed5df8977b3daa43

Thanks,
Guopeng


