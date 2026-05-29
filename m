Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1B2DB376A1C
	for <sashiko-reviews@lists.linux.dev>; Fri, 29 May 2026 17:12:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.133.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1780074762; cv=none; b=aNBjV1nJGfqJVqN5twyUX/mQ68RA9AgnlHcGGvv4MWcC2VdwKgT57UfJMrqhKRnkFkiCItahHVR0GZ5CklVr8yBhmWo6yV4QXQhDI4jeYYhPZEDeMFjNStd3nIh/nzHUvJVGJaYseAwnkdud3PRXgq2ZzXUCoa3WpvegtK+xdek=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1780074762; c=relaxed/simple;
	bh=hu9rilpODm2vGdWT5kVDFY41+4vjGePuCD0jV/yOP8M=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=a6LtJ09XevDCjyvuNpXi3KMi44EWk/0jqOiOSLo/Ur9r8Zzp5+63jtUj5YP3+1yvdrgGvxnJwUYzQBxnfo2Dq4FHUhp+JUBSkb2ILcDzGVIISEt6xaJC2e+zlt3v8GX1Zp8vb8M4SivumjW818gzodYW+XX3VH4FegMrP/UD5OU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=P6vQW3yy; arc=none smtp.client-ip=170.10.133.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="P6vQW3yy"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1780074758;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=eFGZUTKCaxqUxCNiXhfCwE9bkdgHU3OUo33m1t7fF0Q=;
	b=P6vQW3yyavACQF6ts/MwRMq7tliL3r39KxPfQ09ETT1Ll3yT+o4iny8xgBrYg3KGz4Wcke
	9ttMbYvtWNsoyX0vR3nkMJb4qnqzeWqOmCE7ziimmTvFbdUkYdg4rEYM/MPiODF7WJnBG6
	J5fQ06DSurvuVreMe31NvGNSm08M8oc=
Received: from mx-prod-mc-06.mail-002.prod.us-west-2.aws.redhat.com
 (ec2-35-165-154-97.us-west-2.compute.amazonaws.com [35.165.154.97]) by
 relay.mimecast.com with ESMTP with STARTTLS (version=TLSv1.3,
 cipher=TLS_AES_256_GCM_SHA384) id us-mta-568-l4ZsQDICO-iCGLBvN3oYcQ-1; Fri,
 29 May 2026 13:12:27 -0400
X-MC-Unique: l4ZsQDICO-iCGLBvN3oYcQ-1
X-Mimecast-MFC-AGG-ID: l4ZsQDICO-iCGLBvN3oYcQ_1780074744
Received: from mx-prod-int-10.mail-002.prod.us-west-2.aws.redhat.com (mx-prod-int-10.mail-002.prod.us-west-2.aws.redhat.com [10.30.177.95])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by mx-prod-mc-06.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTPS id A95FC18005BE;
	Fri, 29 May 2026 17:12:23 +0000 (UTC)
Received: from [10.22.64.54] (unknown [10.22.64.54])
	by mx-prod-int-10.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTP id C96541686;
	Fri, 29 May 2026 17:12:22 +0000 (UTC)
Message-ID: <25952b7c-4c9d-4a01-ad27-2dbe6243dad9@redhat.com>
Date: Fri, 29 May 2026 13:12:22 -0400
Precedence: bulk
X-Mailing-List: sashiko-reviews@lists.linux.dev
List-Id: <sashiko-reviews.lists.linux.dev>
List-Subscribe: <mailto:sashiko-reviews+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:sashiko-reviews+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH-next v3 4/5] cgroup/cpuset: Move
 mpol_rebind_mm/cpuset_migrate_mm() calls inside cpuset_attach_task()
To: sashiko-reviews@lists.linux.dev
Cc: mkoutny@suse.com, hannes@cmpxchg.org, tj@kernel.org
References: <20260527153800.1557449-5-longman@redhat.com>
 <20260527175454.161D51F000E9@smtp.kernel.org>
From: Waiman Long <longman@redhat.com>
In-Reply-To: <20260527175454.161D51F000E9@smtp.kernel.org>
X-Scanned-By: MIMEDefang 3.6 on 10.30.177.95
X-Mimecast-Spam-Score: 0
X-Mimecast-MFC-PROC-ID: OVHwygN3KyQtOjTGBXn2iI9vOChsTKt6DePkiAT4ygQ_1780074744
X-Mimecast-Originator: redhat.com
Content-Language: en-US
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 5/27/26 1:54 PM, sashiko-bot@kernel.org wrote:
> Thank you for your contribution! Sashiko AI review found 2 potential issue(s) to consider:
> - [Medium] `cpuset_fork()` misses the required task work flush for memory migration and leaks the static `queue_task_work` flag.
> - [Low] `cpuset_fork()` improperly mutates the parent cpuset's internal state (`old_mems_allowed`) to satisfy the migration API.
> --
>
> commit f676d612fb8888338177a57d117e451242f1ee60
> Author: Waiman Long <longman@redhat.com>
>
> cgroup/cpuset: Move mpol_rebind_mm/cpuset_migrate_mm() calls inside cpuset_attach_task()
>
> This commit moves the mpol_rebind_mm() and cpuset_migrate_mm() calls for
> the group leader into cpuset_attach_task(). This makes the CLONE_INTO_CGROUP
> flag of clone(2) behave more like moving a task from one cpuset into another
> when used without CLONE_THREAD.
>
>> diff --git a/kernel/cgroup/cpuset.c b/kernel/cgroup/cpuset.c
>> index b233a71f9b7c2..7100575927f6a 100644
>> --- a/kernel/cgroup/cpuset.c
>> +++ b/kernel/cgroup/cpuset.c
> [ ... ]
>> @@ -3149,9 +3149,12 @@ static void cpuset_cancel_attach(struct cgroup_taskset *tset)
>>    */
>>   static cpumask_var_t cpus_attach;
>>   static nodemask_t cpuset_attach_nodemask_to;
>> +static bool queue_task_work;
>>   
>>   static void cpuset_attach_task(struct cpuset *cs, struct task_struct *task)
>>   {
> [ ... ]
>> +		if (is_memory_migrate(cs)) {
>> +			cpuset_migrate_mm(mm, &oldcs->old_mems_allowed,
>> +					  &cs->effective_mems);
>> +			queue_task_work = true;
>> +		} else {
>> +			mmput(mm);
>> +		}
>> +	}
>>   }
> [ ... ]
>> @@ -3686,7 +3685,12 @@ static void cpuset_fork(struct task_struct *task)
>>   	/* CLONE_INTO_CGROUP */
>>   	mutex_lock(&cpuset_mutex);
>>   	guarantee_online_mems(cs, &cpuset_attach_nodemask_to);
>> +	/* Assume CPUs and memory nodes are updated */
>> +	attach_cpus_updated = attach_mems_updated = true;
>> +	cpuset_attach_old_cs = oldcs;
>> +	oldcs->old_mems_allowed = oldcs->effective_mems;
> [Severity: Low]
> Does this code improperly mutate the parent cpuset's internal state?
>
> By setting oldcs->old_mems_allowed to oldcs->effective_mems, we are modifying
> a shared cpuset's configuration state simply to accommodate the migration API
> parameters for the child's fork operation. Could this pollute the cpuset
> abstraction by manipulating the parent's state instead of keeping it isolated?
On second thought, we don't really need to touch old_mems_allowed which 
should be change in the last node mask modification operation. So I will 
remove it from the next version.
>>   	cpuset_attach_task(cs, task);
> [Severity: Medium]
> Is it possible that we miss the task work flush for memory migration here?
>
> Since cpuset_attach_task() can set the global static flag queue_task_work to
> true, does cpuset_fork() need to check queue_task_work and call
> schedule_flush_migrate_mm() before returning?
>
> If this is missed, it seems the static flag could be leaked as true, and
> memory migration might execute asynchronously in the background instead of
> completing synchronously before returning to userspace.

Yes, cpuset_fork() should check should check queue_task_work and call 
schedule_flush_migrate_mm() before returning if set.

Cheers,
Longman

