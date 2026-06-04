Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 77E7B1F1534
	for <sashiko-reviews@lists.linux.dev>; Thu,  4 Jun 2026 14:34:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.133.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1780583691; cv=none; b=FaWWz/CI8n0ml4KfrUKebMXX/jaaLvImOYaXsaXUnDaVMtVnez5qY5RpV1MuCuHKw6CTD7b9CgzrBSzI6nLp7WHkwWCphErm/6wrJXQqfvybFVVoNNBBQMapTG+YKKCvh6iKnizFXsLdOVpxBB8PYzqEPB26x8NIjZqB2BBSo04=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1780583691; c=relaxed/simple;
	bh=9xEH7aplTt6e7CFJF3pq+ulJ2VLipK+EcttUBdeSGFs=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=dtEZEvS8L5o3ZuQ9yqW4e29yP2QJ5p+tOfU2bvk3Q3OqXGi3CXOm+GtdVqiK2UvlQXwZ7A1wOPjnfL4uyyIzGprAXjvbBb3i8cLUVNGEtMVxz01pY2MntWj7rZ/EBp3BTHyiZxpzDbIyDbDWc9VFuScehs7qKXVwkfbS3WRT2Es=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=BdpL2Bmo; arc=none smtp.client-ip=170.10.133.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="BdpL2Bmo"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1780583689;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=ek8k8MN/W+Lw2KrfkVX8W34nQ6n6n6bVTBNOqxYcdIw=;
	b=BdpL2BmoXVsVMhZPA9ULYP6IDc8mpI8DzOec+jK41mhmz1PMidIrdoZvteOc5cwUAEVycS
	3Qv3X0XD9QoR3zn6/9YPlwUxlN1Z2zCmKke6Rndkvm7pzuX0U5IcAqCuFKvLwofRVWBdRj
	Sok991P0Vo9vMR7TURbVBI10uKyT++o=
Received: from mx-prod-mc-01.mail-002.prod.us-west-2.aws.redhat.com
 (ec2-54-186-198-63.us-west-2.compute.amazonaws.com [54.186.198.63]) by
 relay.mimecast.com with ESMTP with STARTTLS (version=TLSv1.3,
 cipher=TLS_AES_256_GCM_SHA384) id us-mta-166-aov5BgoFNu6HEo1i5yc6pQ-1; Thu,
 04 Jun 2026 10:34:45 -0400
X-MC-Unique: aov5BgoFNu6HEo1i5yc6pQ-1
X-Mimecast-MFC-AGG-ID: aov5BgoFNu6HEo1i5yc6pQ_1780583684
Received: from mx-prod-int-10.mail-002.prod.us-west-2.aws.redhat.com (mx-prod-int-10.mail-002.prod.us-west-2.aws.redhat.com [10.30.177.95])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by mx-prod-mc-01.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTPS id 186EB19560A7;
	Thu,  4 Jun 2026 14:34:44 +0000 (UTC)
Received: from [10.22.88.175] (unknown [10.22.88.175])
	by mx-prod-int-10.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTP id 41FE6763;
	Thu,  4 Jun 2026 14:34:42 +0000 (UTC)
Message-ID: <0468014e-4d56-4214-8622-126da85ae7d9@redhat.com>
Date: Thu, 4 Jun 2026 10:34:42 -0400
Precedence: bulk
X-Mailing-List: sashiko-reviews@lists.linux.dev
List-Id: <sashiko-reviews.lists.linux.dev>
List-Subscribe: <mailto:sashiko-reviews+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:sashiko-reviews+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH-next v5 6/6] cgroup/cpuset: Support multiple
 source/destination cpusets for cpuset_*attach()
To: sashiko-reviews@lists.linux.dev
Cc: mkoutny@suse.com, tj@kernel.org, hannes@cmpxchg.org
References: <20260602023203.248077-7-longman@redhat.com>
 <20260602033921.9A3311F00893@smtp.kernel.org>
From: Waiman Long <longman@redhat.com>
In-Reply-To: <20260602033921.9A3311F00893@smtp.kernel.org>
X-Scanned-By: MIMEDefang 3.6 on 10.30.177.95
X-Mimecast-Spam-Score: 0
X-Mimecast-MFC-PROC-ID: KGpE1WBr_eg8GOyTS8naATk_sbxMYsCeQyKQ8RJ2P_s_1780583684
X-Mimecast-Originator: redhat.com
Content-Language: en-US
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 6/1/26 11:39 PM, sashiko-bot@kernel.org wrote:
> Thank you for your contribution! Sashiko AI review found 1 potential issue(s) to consider:
> - [High] Cpuset CPU and memory mask updates are silently skipped for tasks when migrating a process with threads in multiple cpusets.
> --
>
> commit a6d20cd30ffff4c71ea67a488e69d137c1a06525
> Author: Waiman Long <longman@redhat.com>
>
> cgroup/cpuset: Support multiple source/destination cpusets for cpuset_*attach()
>
> This commit updates cpuset_can_attach() and cpuset_attach() to support
> task migration data with multiple destination or source cpusets. It uses
> singly linked lists to track the source and destination cpusets.
>
>> diff --git a/kernel/cgroup/cpuset.c b/kernel/cgroup/cpuset.c
>> index a085765a11c65..b0e8e5819af3d 100644
>> --- a/kernel/cgroup/cpuset.c
>> +++ b/kernel/cgroup/cpuset.c
>> @@ -3227,48 +3307,76 @@ static void cpuset_attach(struct cgroup_taskset *tset)
>>   	struct task_struct *task;
>>   	struct cgroup_subsys_state *css;
>>   	struct cpuset *cs;
>> -	struct cpuset *oldcs = cpuset_attach_old_cs;
>> +	bool many_cs_to_one = !!src_cs_head.first->next;
> [Severity: High]
> Does this logic correctly handle migrating a process that spans multiple
> cpusets (e.g., A and C) into one of those existing cpusets (e.g., C)?
>
> If cpuset_can_attach_check() processes a task migrating from A to C, it adds
> C to dst_cs_head and sets its attach_node_in_llist flag to true.
>
> When it subsequently processes a task migrating from C to C, C is the oldcs.
> Since C's attach_node_in_llist flag is already true, it is not added to
> src_cs_head.
>
> If src_cs_head only ends up containing A, src_cs_head.first->next is NULL,
> and many_cs_to_one incorrectly evaluates to false.
>
> [ ... ]

My own testing indicates that the cgroup core will only put tasks that 
need migration into the cgroup_taskset passed to cpuset_can_attach(). 
IOW, existing tasks in C won't show up in the task iteration process. To 
be safe, safeguard will be added to guard against this situation.

Cheers,
Longman

>
>>   	cs = css_cs(css);
>>   	/*
>>   	 * In the default hierarchy, enabling cpuset in the child cgroups
>>   	 * will trigger a cpuset_attach() call with no change in effective cpus
>>   	 * and mems. In that case, we can optimize out by skipping the task
>> -	 * iteration and update.
>> +	 * iteration and update, but the destination cpuset list is iterated to
>> +	 * set old_mems_sllowed.
>>   	 */
>>   	if (cpuset_v2()) {
>>   		cpuset_attach_nodemask_to = cs->effective_mems;
>> -		if (!attach_cpus_updated && !attach_mems_updated)
>> +		if (!attach_cpus_updated && !attach_mems_updated) {
>> +			llist_for_each_entry(cs, dst_cs_head.first, attach_node)
>> +				cs->old_mems_allowed = cs->effective_mems;
>>   			goto out;
>> +		}
> [Severity: High]
> If many_cs_to_one evaluated to false in the scenario above, could this cause
> threads migrating from A to incorrectly hit this early exit?
>
> If the destination (C) matches the group leader's origin (C),
> attach_cpus_updated and attach_mems_updated would be false.
>
> This would skip cpuset_attach_task() for the thread migrating from A,
> causing it to retain A's affinity parameters while logically residing in C.
>

