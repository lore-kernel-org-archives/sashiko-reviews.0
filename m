Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A75043BCD36
	for <sashiko-reviews@lists.linux.dev>; Tue, 23 Jun 2026 23:43:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.133.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1782258211; cv=none; b=pJBGxT+4Dm4N3qT0rMSFYuCrKlbWkEmZX1YC3du3j9X0iz0tbb6p+/dpgIvmaTHuqIGXKhQRBS+Xmj7a2zLFZz9VON2oF50yXLYHR9UFtyE5qJCPSDyTl8yMjQqkJuSkJV+VehZIbBswjpla15jfGWVqOX9wK4oqOYncqvcpNlU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1782258211; c=relaxed/simple;
	bh=Bh2IG2IVT+r3ROoM8zga6mGsLhYmWbYuXAM6FdKoxCI=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=q3FzePFdhq2YCtLr/rkw9ry10r45YU8h9/i/LKJRNjLvd2BDWuY1GEPT6hCekVyeMvsMQpCe5qHwitJCr1ZPOffb99hPfKdZQqzVRam4C8u1jj1l7OyevkxBS86fboABxLXgLNHZ33siiSMpej6T5qGYzx0ZlPwNfN3sGQ/8zpM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=I4hDG8q6; arc=none smtp.client-ip=170.10.133.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="I4hDG8q6"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1782258208;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=sQHGcRnfak381LTSUC32A/jCb4hCk/gntlFQkJTC0zo=;
	b=I4hDG8q6glocsKVMSFh/Yg56qBYpNm1ttt9gHYSCB0WMQ9dLy5toTW6gMh7hpALUFGACWc
	7Y3SVVohhvd3ZrGX9GyxLuUzw6Ss35TlyIqmzJoRj+65pr0YtO8RocAzW1INFeDUsWeIB4
	nwyeP2ivDpQ+49qRxAVFw4oDXaJiDyA=
Received: from mx-prod-mc-05.mail-002.prod.us-west-2.aws.redhat.com
 (ec2-54-186-198-63.us-west-2.compute.amazonaws.com [54.186.198.63]) by
 relay.mimecast.com with ESMTP with STARTTLS (version=TLSv1.3,
 cipher=TLS_AES_256_GCM_SHA384) id us-mta-320-vSk_Kad5PsuLwjMGjo8gkQ-1; Tue,
 23 Jun 2026 19:43:23 -0400
X-MC-Unique: vSk_Kad5PsuLwjMGjo8gkQ-1
X-Mimecast-MFC-AGG-ID: vSk_Kad5PsuLwjMGjo8gkQ_1782258202
Received: from mx-prod-int-06.mail-002.prod.us-west-2.aws.redhat.com (mx-prod-int-06.mail-002.prod.us-west-2.aws.redhat.com [10.30.177.93])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by mx-prod-mc-05.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTPS id 2376119560A6;
	Tue, 23 Jun 2026 23:43:22 +0000 (UTC)
Received: from [10.2.17.30] (unknown [10.2.17.30])
	by mx-prod-int-06.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTP id 7B17E180057F;
	Tue, 23 Jun 2026 23:43:19 +0000 (UTC)
Message-ID: <95bf4cd3-f726-4fe4-92a3-ff3ae1a0401d@redhat.com>
Date: Tue, 23 Jun 2026 19:43:18 -0400
Precedence: bulk
X-Mailing-List: sashiko-reviews@lists.linux.dev
List-Id: <sashiko-reviews.lists.linux.dev>
List-Subscribe: <mailto:sashiko-reviews+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:sashiko-reviews+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 2/2] cgroup/cpuset: Rebind/migrate mm only for
 threadgroup leader in cpuset_update_tasks_nodemask()
To: sashiko-reviews@lists.linux.dev
Cc: tj@kernel.org, hannes@cmpxchg.org, mkoutny@suse.com
References: <20260623230413.1984188-1-longman@redhat.com>
 <20260623230413.1984188-3-longman@redhat.com>
 <20260623231837.A795A1F000E9@smtp.kernel.org>
From: Waiman Long <longman@redhat.com>
In-Reply-To: <20260623231837.A795A1F000E9@smtp.kernel.org>
X-Scanned-By: MIMEDefang 3.4.1 on 10.30.177.93
X-Mimecast-Spam-Score: 0
X-Mimecast-MFC-PROC-ID: CZLRQ4l_p50NnCdMUTBEQKoUJmpCzNrTcuONDCrQoYU_1782258202
X-Mimecast-Originator: redhat.com
Content-Language: en-US
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit


On 6/23/26 7:18 PM, sashiko-bot@kernel.org wrote:
> Thank you for your contribution! Sashiko AI review found 2 potential issue(s) to consider:
>
> New issues:
> - [High] cpuset_update_tasks_nodemask() silently fails to migrate pages or rebind memory policies for multithreaded processes if the thread group leader has exited.
>
> Pre-existing issues:
> - [High] cpuset_attach() fails to migrate or rebind memory if the thread group leader has exited.
> --
>
> commit 3c37b1f067b61f1adb460635452e2f060088cb23
> Author: Waiman Long <longman@redhat.com>
>
> cgroup/cpuset: Rebind/migrate mm only for threadgroup leader in cpuset_update_tasks_nodemask()
>
> This patch limits memory policy rebinding and migration in
> cpuset_update_tasks_nodemask() to only the threadgroup leader of a
> multithreaded process. It aims to reduce performance overhead by avoiding
> duplicate work for every thread.
>
> Link: https://sashiko.dev/#/patchset/20260621032816.1806773-1-longman%40redhat.com
>
> [ ... ]
>
>> diff --git a/kernel/cgroup/cpuset.c b/kernel/cgroup/cpuset.c
>> index 75e25c2791c26..45a9a98114f1b 100644
>> --- a/kernel/cgroup/cpuset.c
>> +++ b/kernel/cgroup/cpuset.c
>> @@ -2661,6 +2661,10 @@ void cpuset_update_tasks_nodemask(struct cpuset *cs)
>>   
>>   		cpuset_change_task_nodemask(task, &newmems);
>>   
>> +		/* Rebind and migrate mm only for thread group leader */
>> +		if (!thread_group_leader(task))
>> +			continue;
>> +
>>   		mm = get_task_mm(task);
>>   		if (!mm)
>>   			continue;
> [Severity: High]
> Does this change silently fail to migrate pages or rebind memory policies if
> the thread group leader has exited?
>
> If a user creates a multithreaded process, forces its main thread to exit
> (e.g., via pthread_exit()), and continues executing work in the surviving
> worker threads, the main thread becomes a zombie.
>
> When cpuset.mems is updated, this new check will explicitly skip worker
> threads because !thread_group_leader(task) is true. It will also skip the
> zombie leader because get_task_mm(task) returns NULL for exited tasks.
>
> Could this allow a process to permanently bypass cpuset memory limits?
>
> [Severity: High]
> This isn't a bug introduced by this patch, but does cpuset_attach() also
> fail to migrate or rebind memory if the thread group leader has exited?
>
> Looking at cpuset_attach() in kernel/cgroup/cpuset.c:
>
> 	cgroup_taskset_for_each_leader(leader, css, tset) {
> 		struct mm_struct *mm = get_task_mm(leader);
>
> If the main thread exits and the process is migrated to a new cgroup via
> cgroup.procs, the migration core explicitly skips tasks with PF_EXITING,
> omitting the zombie leader from the migration taskset.
>
> Because cgroup_taskset_for_each_leader executes only for tasks where
> task == task->group_leader, this condition is false for all surviving
> worker threads, bypassing the memory migration entirely.
>
> Can this be triggered by an unprivileged user to escape cpuset memory policy
> enforcement?
>
If a threadgroup without  a leader is moved to another cpuset whose 
cpuset.mems are missing nodes in the original cpuset, it is possible 
that some of the process memory will stay in memory nodes that are not 
allowed by  the new cpuset. This is an exceptional case that should 
rarely happen. It can be argued the amount of effort we should spend on 
handling this rare case. I will leave it unresolved for now unless there 
is a consensus that this should not be allowed.

Cheers,
Longman

