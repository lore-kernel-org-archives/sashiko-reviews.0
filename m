Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E4FBC3B19A5
	for <sashiko-reviews@lists.linux.dev>; Mon,  1 Jun 2026 14:13:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.129.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1780323204; cv=none; b=aJZQlx6k71gPxrp7EBFN3oa4RXb74gXjkGPwIqYsERRqO7IZZN1cB4Gw8jR2sPQ0qlBVWqs7oy/4gsqFYJ47CmFfbb+D/6dPaFCTvJjvpx1IHs3Bub5rZrDhm/viPbzAGfo+IzzIO9SjvQxSxystPZOE8TYsqVXa5bVX8MJ0QE8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1780323204; c=relaxed/simple;
	bh=0D2gKz5NN/h3uzcU8jzcKY4VQZ8NwZdxQT8y2GzOgSY=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=OC9OZWH23vEkcQKFhdgt7eZHFabXP7f49ru6gYp1rnhpL1S964YhuUQqg6mjkjeVA1NxgnlMHlECLU3rxzyzmGcQ4J6AmAoPxc18PYTRM4ndWTFn0acWTe4FBO7iCoQ3yMqKrkb6XilMSJGzjr1b16NKeJkiWncg3meJxeuozuA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=L4Am/o/m; arc=none smtp.client-ip=170.10.129.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="L4Am/o/m"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1780323201;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=Nk+ggyDEiiJYMmwm1PLCeopK0/nc7iQoUNzU+ldCw+0=;
	b=L4Am/o/mZ9SYP10HCJhq45ITojzJf72ydSLFJLCppXy452kTAAKGMJulLIRqRwiv1DGWI8
	aSt3/XwiYRV1RuizVOvxwbg4rzbMD9uFoQjhiJQyw3J86gN+Og5tITvhJL0nIs77s1gCQL
	yvCuCQcid1mH7luljK5QPIx8mRLWaRE=
Received: from mx-prod-mc-05.mail-002.prod.us-west-2.aws.redhat.com
 (ec2-54-186-198-63.us-west-2.compute.amazonaws.com [54.186.198.63]) by
 relay.mimecast.com with ESMTP with STARTTLS (version=TLSv1.3,
 cipher=TLS_AES_256_GCM_SHA384) id us-mta-281-4_lbjQhrNLiJBD5djpglqg-1; Mon,
 01 Jun 2026 10:13:14 -0400
X-MC-Unique: 4_lbjQhrNLiJBD5djpglqg-1
X-Mimecast-MFC-AGG-ID: 4_lbjQhrNLiJBD5djpglqg_1780323193
Received: from mx-prod-int-08.mail-002.prod.us-west-2.aws.redhat.com (mx-prod-int-08.mail-002.prod.us-west-2.aws.redhat.com [10.30.177.111])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by mx-prod-mc-05.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTPS id B5DAA1921EEF;
	Mon,  1 Jun 2026 14:09:37 +0000 (UTC)
Received: from [10.22.88.124] (unknown [10.22.88.124])
	by mx-prod-int-08.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTP id C1FF81800465;
	Mon,  1 Jun 2026 14:09:36 +0000 (UTC)
Message-ID: <1506928b-1171-44e3-9770-42226bbb7744@redhat.com>
Date: Mon, 1 Jun 2026 10:09:35 -0400
Precedence: bulk
X-Mailing-List: sashiko-reviews@lists.linux.dev
List-Id: <sashiko-reviews.lists.linux.dev>
List-Subscribe: <mailto:sashiko-reviews+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:sashiko-reviews+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH-next v4 3/6] cgroup/cpuset: Expand the scope of
 cpuset_can_attach_check()
To: sashiko-reviews@lists.linux.dev
Cc: hannes@cmpxchg.org, tj@kernel.org, mkoutny@suse.com
References: <20260529212108.120506-4-longman@redhat.com>
 <20260529223333.7F8F41F00893@smtp.kernel.org>
From: Waiman Long <longman@redhat.com>
In-Reply-To: <20260529223333.7F8F41F00893@smtp.kernel.org>
X-Scanned-By: MIMEDefang 3.4.1 on 10.30.177.111
X-Mimecast-Spam-Score: 0
X-Mimecast-MFC-PROC-ID: lNSg_CyiPTfMCCEwvzJs3arn6vKwvMxgWJBw7XE-fbs_1780323193
X-Mimecast-Originator: redhat.com
Content-Language: en-US
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 5/29/26 6:33 PM, sashiko-bot@kernel.org wrote:
> Thank you for your contribution! Sashiko AI review found 1 potential issue(s) to consider:
> - [High] Caching `attach_cpus_updated` and `attach_mems_updated` globally introduces a TOCTOU race with CPU/memory hotplug.
> --
>
> commit 86181172df4d07555b90ca27dbd4515786dc4970
> Author: Waiman Long <longman@redhat.com>
>
> cgroup/cpuset: Expand the scope of cpuset_can_attach_check()
>
> Expand the scope of cpuset_can_attach_check() by including the setting
> of setsched flag inside cpuset_can_attach_check() with the new @oldcs
> and @psetsched argument.
>
>> diff --git a/kernel/cgroup/cpuset.c b/kernel/cgroup/cpuset.c
>> index c988388eb008a..36784fce285d5 100644
>> --- a/kernel/cgroup/cpuset.c
>> +++ b/kernel/cgroup/cpuset.c
> [ ... ]
>> @@ -3153,7 +3181,6 @@ static void cpuset_attach(struct cgroup_taskset *tset)
>>   	struct cgroup_subsys_state *css;
>>   	struct cpuset *cs;
>>   	struct cpuset *oldcs = cpuset_attach_old_cs;
>> -	bool cpus_updated, mems_updated;
>>   	bool queue_task_work = false;
>>   
>>   	cgroup_taskset_first(tset, &css);
>> @@ -3161,9 +3188,6 @@ static void cpuset_attach(struct cgroup_taskset *tset)
>>   
>>   	lockdep_assert_cpus_held();	/* see cgroup_attach_lock() */
>>   	mutex_lock(&cpuset_mutex);
>> -	cpus_updated = !cpumask_equal(cs->effective_cpus,
>> -				      oldcs->effective_cpus);
>> -	mems_updated = !nodes_equal(cs->effective_mems, oldcs->effective_mems);
>>   
>>   	/*
>>   	 * In the default hierarchy, enabling cpuset in the child cgroups
>> @@ -3173,7 +3197,7 @@ static void cpuset_attach(struct cgroup_taskset *tset)
>>   	 */
>>   	if (cpuset_v2()) {
>>   		cpuset_attach_nodemask_to = cs->effective_mems;
>> -		if (!cpus_updated && !mems_updated)
>> +		if (!attach_cpus_updated && !attach_mems_updated)
>>   			goto out;
> [Severity: High]
> Can caching these flags globally in cpuset_can_attach_check() introduce a
> Time-of-Check to Time-of-Use (TOCTOU) race condition with CPU/memory hotplug?
>
> While cgroup_mutex prevents concurrent userspace cpuset.cpus writes, CPU and
> memory hotplug events (cpuset_handle_hotplug) only require cpuset_mutex,
> which is dropped between cpuset_can_attach() and cpuset_attach().
>
> In cpuset_can_attach(), we increment cs->attach_in_progress, but not
> oldcs->attach_in_progress.
>
> If a hotplug event occurs during the unlocked window and affects oldcs,
> the hotplug handler iterates over all cpusets. For oldcs, it proceeds
> without blocking, updating oldcs's masks and the migrating task's masks
> (since the task is still in oldcs).
>
> When the hotplug handler reaches cs, it sees cs->attach_in_progress > 0,
> drops cpuset_mutex, and blocks.
>
> Then cpuset_attach() resumes, re-acquires cpuset_mutex, and reads the stale
> global attach_cpus_updated flag (which is still false).
>
> Does this cause cpuset_attach() to incorrectly take the goto out path,
> skipping the update of the task's masks to cs's masks?
>
> If cs's configuration wasn't affected by the hotplug event, its masks won't
> change when the hotplug handler resumes. The task would remain in cs but
> retain oldcs's hotplug-updated masks, potentially violating cgroup
> isolation boundaries.
>
> [ ... ]
>> @@ -3743,6 +3767,8 @@ hotplug_update_tasks(struct cpuset *cs,
>>   	cpumask_copy(cs->effective_cpus, new_cpus);
>>   	cs->effective_mems = *new_mems;
>>   	spin_unlock_irq(&callback_lock);
>> +	if (cs->attach_in_progress)
>> +		attach_cpus_updated = attach_mems_updated = true;
> [Severity: High]
> Because oldcs->attach_in_progress is not incremented during migration, this
> check will evaluate to false for oldcs. A concurrent hotplug update to oldcs
> will be missed, leaving the global attach_cpus_updated and attach_mems_updated
> flags incorrectly set to false.

Will add a global attach_in_progress flag to disable optimization (set 
updated flags to true) whenever there is an intervening hotplug events 
or cpuset files update.

Cheers,
Longman

