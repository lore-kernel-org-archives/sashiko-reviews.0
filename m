Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=95.215.58.181
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794648740;
	b=Se0qM5xkYNWIxJadN4f7vK+1mnPP1GPSYSjK8dG+Wctv71faRRHwpYhIh9WYuAzEXWlM
	 rApfFveHbc2sOrPbNYK/xaBEUP+m6XPy9u9L4s2Okoq+2Mg31wk8VgHOCu2vFzRZgivRq
	 buRlmIEVHFED+nR1gQW34tH28KalztzaieL0crNO+YqOOKDGJg4zLzRYgCOk9PetPAAdi
	 jPqjYL5QejQlc68xQAZzlt/tMAlCGQnVYL7Fi0xBELTC5y2HDXpcQ4o/LuEgmA5f6o0jK
	 jFpryRm4qJBa64FJjlmEjO5IkGPjq4KQirVoUiR9d5amrrYDdHYt1Jjw1ght6IkW48w==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794648740;
	h=DMARC-Filter:X-Envelope-To:DKIM-Signature:X-Envelope-To:Received:
	 X-Mizu-Trace-ID:X-Migadu-Flow:Message-ID:Date:MIME-Version:User-Agent:
	 Subject:To:Cc:References:From:In-Reply-To:Content-Type:
	 Content-Transfer-Encoding;
	bh=IU2YbUr8hBpxE7TxOq7Nci6EHrUHfnOag7uSPTOV3ug=;
	b=F+g7UPhnXyQz757p++fg73gfh2ow1Gt6rkbiut9SobbNTSjTFSAx0g8AlfLBBWhkDIQ0
	 IiIMqpu0iBnx/hXuOU+jPFTxPok86XYvNdaHs5IpWw1tcFLH6jbU+xOsfW0uH5xleBJKz
	 c9hXGLmEQ8d8vsOrNm0R/0AVTqITlrLLv3fkl02sZlP0ZDpgthrmVzYJEQCJqto9XvsVb
	 KdVv03fbJsgqjr2Swb0IK4Bu7sGdc0C9YvsCSmCm3A7Niw6dINNdkvKGKrdCuDIYmez9h
	 yTirUqOD86vfGI0vVKg0FLhb/UEiQcmfAyB6nXmdDjA7qIUUqZgBkI67V0ioBrx6lKg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=linux.dev;
	spf=pass smtp.mailfrom=linux.dev;
	dkim=pass header.d=linux.dev header.i=@linux.dev header.a=rsa-sha256 header.s=key1 header.b=xX6rwXBo;
	arc=none smtp.remote-ip=95.215.58.181
Received: from mta1.migadu.com (out-181.mta1.migadu.com [95.215.58.181])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1A467606A327
	for <sashiko-reviews@lists.linux.dev>; Sat, 14 Nov 2026 09:32:17 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 1A467606A327
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.dev
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.dev
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key, unprotected) header.d=linux.dev header.i=@linux.dev header.a=rsa-sha256 header.s=key1 header.b=xX6rwXBo
X-Envelope-To: sashiko-reviews@lists.linux.dev
DKIM-Signature: a=rsa-sha256; bh=dCHObLxu4JaPEX7Ng1P0wASJoEF8m1J8VLFWzh2ERKU=;
 c=simple/simple; d=linux.dev;
 h=from:to:subject:date:message-id:mime-version:content-type; s=key1;
 t=1794648735; v=1; x=1795253535;
 b=xX6rwXBo4+gMwIxPhIbY3ISBnbmqbL2wM1+ybV6Zpzwr5mk7P08H+FO44lKcZsAdlehmyzUM
 4O7De3GfquJv4oKXzIl0b/h/IZHeOpegPTl8V1VWgocTCd+CphyoWdosddVc65vbBVBmfRmVWMR
 N4b8i9zIpCaQXYa/eg9zHKPg=
X-Envelope-To: sashiko-reviews@lists.linux.dev
Received: by smtp.migadu.com with ESMTPS id eb70f859989b91ed;
	Sat, 14 Nov 2026 09:32:15 +0000
X-Mizu-Trace-ID: eb70f859989b91ed
X-Migadu-Flow: FLOW_OUT
Message-ID: <4317abaa-2de4-4b80-8379-54c0717a84d6@linux.dev>
Date: Sat, 14 Nov 2026 17:32:12 +0800
X-Mailing-List: sashiko-reviews@lists.linux.dev
List-Id: <sashiko-reviews.lists.linux.dev>
List-Post: <mailto:sashiko-reviews@lists.linux.dev>
List-Help: <mailto:sashiko-reviews+help@lists.linux.dev>
List-Subscribe: <mailto:sashiko-reviews+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:sashiko-reviews+unsubscribe@lists.linux.dev>
List-Owner: <mailto:sashiko-reviews+owner@lists.linux.dev>
Precedence: list
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v5 06/12] cpuset: use partition_update() for remote
 partition update
To: sashiko-reviews@lists.linux.dev
Cc: tj@kernel.org, hannes@cmpxchg.org, mkoutny@suse.com,
 Waiman Long <longman@redhat.com>
References: <20261114083124.1340140-1-ridong.chen@linux.dev>
 <20261114083124.1340140-7-ridong.chen@linux.dev>
 <sashiko-outbox-214286@kernel.org>
From: Ridong Chen <ridong.chen@linux.dev>
In-Reply-To: <sashiko-outbox-214286@kernel.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit



On 11/14/2026 4:39 PM, sashiko-bot@kernel.org wrote:
> Thank you for your contribution! Sashiko AI review found no new issues
> in this patch, but noticed 1 related pre-existing issue it does not
> introduce:
> - [Medium] cgroup/cpuset: user-triggerable WARN_ON_ONCE in
>    remote_cpus_update() [1]
> --
> 
> commit b7b7e4dde426cec483acd8938d31b8a6a7ea5ee0
> Author: Ridong Chen <chenridong@xiaomi.com>
> 
> cpuset: use partition_update() for remote partition update
> 
> This commit replaces the open-coded remote partition update logic in
> remote_cpus_update() with a call to the partition_update() helper.
> 
>> diff --git a/kernel/cgroup/cpuset.c b/kernel/cgroup/cpuset.c
>> index 681adcde10e89..7a3e797aee521 100644
>> --- a/kernel/cgroup/cpuset.c
>> +++ b/kernel/cgroup/cpuset.c
> [ ... ]
>> @@ -1948,15 +1947,15 @@ static void remote_cpus_update(struct cpuset *cs, struct cpumask *xcpus,
>>   		goto invalidate;
>>   	}
>>   
>> -	adding   = cpumask_andnot(tmp->addmask, excpus, cs->effective_xcpus);
>> -	deleting = cpumask_andnot(tmp->delmask, cs->effective_xcpus, excpus);
>> +	cpumask_andnot(tmp->addmask, excpus, cs->effective_xcpus);
>> +	cpumask_andnot(tmp->delmask, cs->effective_xcpus, excpus);
>>   
>>   	/*
>>   	 * Additions of remote CPUs is only allowed if those CPUs are
>>   	 * not allocated to other partitions and there are effective_cpus
>>   	 * left in the top cpuset.
>>   	 */
>> -	if (adding) {
>> +	if (!cpumask_empty(tmp->addmask)) {
>>   		WARN_ON_ONCE(cpumask_intersects(tmp->addmask, subpartitions_cpus));
>>   		if (!capable(CAP_SYS_ADMIN))
>>   			WRITE_ONCE(cs->prs_err, PERR_ACCESS);
> 
> [Severity: Medium]
> This problem wasn't introduced by this patch, but can a user trigger this
> WARN_ON_ONCE() [1] by writing a conflicting mask to
> cpuset.cpus.exclusive on a remote partition?
> 
> When a sibling has an empty effective mask, an update that intersects
> with subpartitions_cpus can reach remote_cpus_update() and hit the
> warning before the subsequent CAP_SYS_ADMIN check and PERR_NOCPUS error
> handling reject the configuration, crashing systems with panic_on_warn
> enabled:
> 
> kernel/cgroup/cpuset.c:remote_cpus_update() {
> 	...
> 	if (!cpumask_empty(tmp->addmask)) {
> 		WARN_ON_ONCE(cpumask_intersects(tmp->addmask, subpartitions_cpus));
> 		if (!capable(CAP_SYS_ADMIN))
> 			WRITE_ONCE(cs->prs_err, PERR_ACCESS);
> 		else if (cpumask_intersects(tmp->addmask, subpartitions_cpus) ||
> 			 cpumask_subset(top_cpuset.effective_cpus, tmp->addmask))
> 			WRITE_ONCE(cs->prs_err, PERR_NOCPUS);
> 	...
> }
> 
> [1] https://sashiko.dev/#/bug/linux-1f03cc87-c209-4735-803d-eba1442e5698
> 

Thanks for the report.

This is a pre-existing issue introduced by commit 86888c7bd117
("cgroup/cpuset: Add warnings to catch inconsistency in exclusive
CPUs"), and it is not related to this series. The patch only moves
this code around and does not change the check.

The WARN_ON_ONCE() is redundant, as the very same condition is checked
right below and handled by setting PERR_NOCPUS, the same as what
commit 31c88350b7dd did for remote_partition_enable(). I will send a
separate patch to cgroup/for-7.4-fixes to remove it.

-- 
Best regards
Ridong

