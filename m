Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 35E73283C83
	for <sashiko-reviews@lists.linux.dev>; Wed, 27 May 2026 18:22:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.133.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779906151; cv=none; b=Mmi4g3kXwvnxy3xQ7Que8QuMTAOKK0JPiKElkqp3jPdqi61XBTloU+GpbeDY9uPvyMPqc3BQcRk2gs93oW/vJ7el2QV5foj47qLevI475fMM/Jle7kn4Oos4kwkW7o8cjyfhj8xZ7oHjTMs+xjEHXvDifcfr8GbKAscLYpYHU0g=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779906151; c=relaxed/simple;
	bh=2lF6x5aGSA/zyYnPnnfiGqWHtad080oa2myoaKcWEuo=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=XE84pyJiingq0Hd45Ve2FZVjtqQJ2+pXszPJpJh2nGUryVNSu5Se5fuzFESxCooTsRvsWP4J3AMPzmlPuPj4y8kg+hzF/x7dhrarCMBBQ3RGgi+bdJyLwVr/5ADAAiqKj/7H01AuJCJYr52t11rzNTltg4+VikiqeGGRIGuo/G8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=fPrjxr7f; arc=none smtp.client-ip=170.10.133.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="fPrjxr7f"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1779906149;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=5Z5H3i0ekKZ4zygLGsN1LrIQlP8mW9wGpW1Z8yoNTvA=;
	b=fPrjxr7fgnobReu1zZcFvWTiMcFn9p/DslZ3LsLt4TwILqkns0v8HXzrPEvQv0UbRQ5FhS
	0Y4NPQSyJiZd8qYMcOHBiEYNUD2VO4z6b1njll94lIKjEfOQjNbxVjSfqZoSA5nM9uP7gn
	IHZiOL4+LdTCpGhY8x4AmvX2MVlZFHg=
Received: from mx-prod-mc-06.mail-002.prod.us-west-2.aws.redhat.com
 (ec2-35-165-154-97.us-west-2.compute.amazonaws.com [35.165.154.97]) by
 relay.mimecast.com with ESMTP with STARTTLS (version=TLSv1.3,
 cipher=TLS_AES_256_GCM_SHA384) id us-mta-558-rIsPxvpPMgylYJ0EdzaWtg-1; Wed,
 27 May 2026 14:22:24 -0400
X-MC-Unique: rIsPxvpPMgylYJ0EdzaWtg-1
X-Mimecast-MFC-AGG-ID: rIsPxvpPMgylYJ0EdzaWtg_1779906143
Received: from mx-prod-int-05.mail-002.prod.us-west-2.aws.redhat.com (mx-prod-int-05.mail-002.prod.us-west-2.aws.redhat.com [10.30.177.17])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by mx-prod-mc-06.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTPS id 3FAD718005B6;
	Wed, 27 May 2026 18:22:23 +0000 (UTC)
Received: from [10.22.81.53] (unknown [10.22.81.53])
	by mx-prod-int-05.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTP id 5074519560AB;
	Wed, 27 May 2026 18:22:22 +0000 (UTC)
Message-ID: <3a5cc723-2ce0-4416-a405-a6d159beb7d4@redhat.com>
Date: Wed, 27 May 2026 14:22:21 -0400
Precedence: bulk
X-Mailing-List: sashiko-reviews@lists.linux.dev
List-Id: <sashiko-reviews.lists.linux.dev>
List-Subscribe: <mailto:sashiko-reviews+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:sashiko-reviews+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH-next v3 2/5] cgroup/cpuset: Expand the scope of
 cpuset_can_attach_check()
To: sashiko-reviews@lists.linux.dev
Cc: mkoutny@suse.com, tj@kernel.org, hannes@cmpxchg.org
References: <20260527153800.1557449-3-longman@redhat.com>
 <20260527163318.3B1741F000E9@smtp.kernel.org>
From: Waiman Long <longman@redhat.com>
In-Reply-To: <20260527163318.3B1741F000E9@smtp.kernel.org>
X-Scanned-By: MIMEDefang 3.0 on 10.30.177.17
X-Mimecast-Spam-Score: 0
X-Mimecast-MFC-PROC-ID: DDqhyNws10cSRO2I8yqN1PjNZtU9-GzwURhr6Bh1XyY_1779906143
X-Mimecast-Originator: redhat.com
Content-Language: en-US
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 5/27/26 12:33 PM, sashiko-bot@kernel.org wrote:
> Thank you for your contribution! Sashiko AI review found 1 potential issue(s) to consider:
> - [High] Caching `attach_cpus_updated` and `attach_mems_updated` in global variables during `can_attach` introduces a Time-Of-Check to Time-Of-Use (TOCTOU) race condition that can allow tasks to escape CPU/memory isolation boundaries.
> --
>
> commit 3fc8c4e50c216b4d34d25e7c56636a5ec10e50a6
> Author: Waiman Long <longman@redhat.com>
>
> cgroup/cpuset: Expand the scope of cpuset_can_attach_check()
>
> This commit expands cpuset_can_attach_check() to include setsched flag calculations. It also caches the source and destination mask update results in static variables to avoid recomputing them in cpuset_attach().
>
>> diff --git a/kernel/cgroup/cpuset.c b/kernel/cgroup/cpuset.c
>> index d720bcc7ef83c..4457c4f11fcea 100644
>> --- a/kernel/cgroup/cpuset.c
>> +++ b/kernel/cgroup/cpuset.c
>> @@ -2964,19 +2964,56 @@ static int update_prstate(struct cpuset *cs, int new_prs)
>>   	return 0;
>>   }
>>   
>> +/*
>> + * cpuset_can_attach() and cpuset_attach() specific internal data
>> + * Protected by cpuset_mutex
>> + */
>>   static struct cpuset *cpuset_attach_old_cs;
>> +static bool attach_cpus_updated;
>> +static bool attach_mems_updated;
> [ ... ]
>
>> @@ -3140,7 +3158,6 @@ static void cpuset_attach(struct cgroup_taskset *tset)
>>   	struct cgroup_subsys_state *css;
>>   	struct cpuset *cs;
>>   	struct cpuset *oldcs = cpuset_attach_old_cs;
>> -	bool cpus_updated, mems_updated;
>>   	bool queue_task_work = false;
>>   
>>   	cgroup_taskset_first(tset, &css);
>> @@ -3148,9 +3165,6 @@ static void cpuset_attach(struct cgroup_taskset *tset)
>>   
>>   	lockdep_assert_cpus_held();	/* see cgroup_attach_lock() */
>>   	mutex_lock(&cpuset_mutex);
>> -	cpus_updated = !cpumask_equal(cs->effective_cpus,
>> -				      oldcs->effective_cpus);
>> -	mems_updated = !nodes_equal(cs->effective_mems, oldcs->effective_mems);
>>   
>>   	/*
>>   	 * In the default hierarchy, enabling cpuset in the child cgroups
>> @@ -3158,7 +3172,7 @@ static void cpuset_attach(struct cgroup_taskset *tset)
>>   	 * in effective cpus and mems. In that case, we can optimize out
>>   	 * by skipping the task iteration and update.
>>   	 */
>> -	if (cpuset_v2() && !cpus_updated && !mems_updated) {
>> +	if (cpuset_v2() && !attach_cpus_updated && !attach_mems_updated) {
> [Severity: High]
> Does caching the attach_cpus_updated and attach_mems_updated flags during
> cpuset_can_attach() introduce a Time-Of-Check to Time-Of-Use race condition?
>
> The cgroup migration process separates the can_attach and attach phases,
> dropping locks like cpuset_mutex between them. If a concurrent update to
> the destination cpuset's masks (e.g., via a CPU hotplug event or writing to
> cpuset.cpus) occurs while the lock is dropped:
>
> 1. The destination's effective_cpus are modified, updating tasks already
> in the cpuset.
>
> 2. The migrating task is not yet in the new cpuset's task list, so it isn't
> updated.
>
> 3. When cpuset_attach() re-acquires cpuset_mutex, it evaluates the stale
> cached flags instead of rechecking the masks.
>
> If the masks were identical during can_attach, the flags remain false,
> causing cpuset_attach() to take the fast path and entirely skip
> cpuset_attach_task(). Could this leave the migrating task with its old,
> incorrect masks, allowing it to escape its designated isolation boundary?

Yes, it can be a valid concern. One workaround is to check the 
attach_in_progress flag in the cpuset. If it is set, we just have to 
clear the corresponding global flag when either the memory nodes or CPUs 
are changed.

Cheers,
Longman

>
>>   		cpuset_attach_nodemask_to = cs->effective_mems;
>>   		goto out;
>>   	}

