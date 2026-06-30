Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 063EB3BBFB3
	for <sashiko-reviews@lists.linux.dev>; Tue, 30 Jun 2026 05:29:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.129.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1782797401; cv=none; b=Hleqh2b0P02qSuEFK3i5XnTCpXU8uTuGHqkU0sbkbl/F4xUxR23X9XEZSw3V2w5abfYiSgnAMcE2kL11HspmrmcmufPJP+60CLnSbboFkY9FRXwvoxod5yXX0umOibPD+jsB0J4dcncCfmwv+/bsAeEXy8uPbeBJVFT4UlLBmfw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1782797401; c=relaxed/simple;
	bh=39K2g/hLa016HcG4Ts49MZVPYDIZ4YZvpVtYZ7Ou3wY=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=EaOShzD02OFmkWPj0U1pHXKraggrFkfHwA7tQO4AjFRZvMzC6Y8UxzrNr1p3z7sl8UXKcSM5Hu+ihTH6me4r5KqDH3xkr92Oxg06YlB6fHya3UkdXX0Yk5XZwY8J+BDr6jW8H4RKmhmnkm22k/Ka227ycE62dN0Qkkkdpnzowlg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=CjElncl0; arc=none smtp.client-ip=170.10.129.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="CjElncl0"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1782797399;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=13YsTibgiXbOaXJqNDbq5X4KLf8yOb5KfW9CyUnsA9A=;
	b=CjElncl097Nxo7Yu5qfzESU7M5PHBK6p+0bifz0jaEqy3LMEPy59hMsI1+d6W1I8k40k6m
	/SNfWPAazsICRYtmFzMSxHJWcfbZUtpHEL4Dq18pfpTtGieZzTNHq4DdgZN0XqynQJOCsw
	iPNymbaPYr9M3U77AEx91gI1v8qggDg=
Received: from mx-prod-mc-08.mail-002.prod.us-west-2.aws.redhat.com
 (ec2-35-165-154-97.us-west-2.compute.amazonaws.com [35.165.154.97]) by
 relay.mimecast.com with ESMTP with STARTTLS (version=TLSv1.3,
 cipher=TLS_AES_256_GCM_SHA384) id us-mta-323-HAUB7xxONG-4GFaH8ITOyQ-1; Tue,
 30 Jun 2026 01:29:57 -0400
X-MC-Unique: HAUB7xxONG-4GFaH8ITOyQ-1
X-Mimecast-MFC-AGG-ID: HAUB7xxONG-4GFaH8ITOyQ_1782797396
Received: from mx-prod-int-05.mail-002.prod.us-west-2.aws.redhat.com (mx-prod-int-05.mail-002.prod.us-west-2.aws.redhat.com [10.30.177.17])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by mx-prod-mc-08.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTPS id 2E74D1801BD8;
	Tue, 30 Jun 2026 05:29:56 +0000 (UTC)
Received: from [10.2.16.38] (unknown [10.2.16.38])
	by mx-prod-int-05.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTP id E12711956042;
	Tue, 30 Jun 2026 05:29:54 +0000 (UTC)
Message-ID: <182b1d6e-f1bf-4022-8214-4dd40b8a13db@redhat.com>
Date: Tue, 30 Jun 2026 01:29:52 -0400
Precedence: bulk
X-Mailing-List: sashiko-reviews@lists.linux.dev
List-Id: <sashiko-reviews.lists.linux.dev>
List-Subscribe: <mailto:sashiko-reviews+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:sashiko-reviews+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH-next v9 01/11] cgroup/cpuset: Make nr_deadline_tasks an
 atomic_t
To: sashiko-reviews@lists.linux.dev
Cc: tj@kernel.org, mkoutny@suse.com, hannes@cmpxchg.org
References: <20260630033344.352702-1-longman@redhat.com>
 <20260630033344.352702-2-longman@redhat.com>
 <20260630035409.85D021F000E9@smtp.kernel.org>
From: Waiman Long <longman@redhat.com>
In-Reply-To: <20260630035409.85D021F000E9@smtp.kernel.org>
X-Scanned-By: MIMEDefang 3.0 on 10.30.177.17
X-Mimecast-Spam-Score: 0
X-Mimecast-MFC-PROC-ID: uq1hTHGPBoHj-SOhU5tbo3eR9FAgbiAKdHaKcZWTStg_1782797396
X-Mimecast-Originator: redhat.com
Content-Language: en-US
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 6/29/26 11:54 PM, sashiko-bot@kernel.org wrote:
> Thank you for your contribution! Sashiko AI review found 1 potential issue(s) to consider:
>
> Pre-existing issues:
> - [High] A TOCTOU race between cgroup migration and concurrent `sched_setscheduler()` causes `nr_deadline_tasks` and root domain bandwidth accounting corruption.
> --
>
> commit 9605e0f7c13452bd0349aa356382cb6d7c6c6ce4
> Author: Waiman Long <longman@redhat.com>
>
> cgroup/cpuset: Make nr_deadline_tasks an atomic_t
>
> This commit changes the nr_deadline_tasks variable in the cpuset structure
> to an atomic_t to prevent corruption when updated simultaneously by
> inc_dl_tasks_cs() under rq->lock and cpuset_attach() under cpuset_mutex.
>
> Link: https://sashiko.dev/#/patchset/20260626181923.133658-1-longman%40redhat.comk
>
>> diff --git a/kernel/cgroup/cpuset-internal.h b/kernel/cgroup/cpuset-internal.h
>> index f7aaf01f7cd5e..140700e5e236d 100644
>> --- a/kernel/cgroup/cpuset-internal.h
>> +++ b/kernel/cgroup/cpuset-internal.h
> [ ... ]
>
>> diff --git a/kernel/cgroup/cpuset.c b/kernel/cgroup/cpuset.c
>> index 49d8564d1a486..c22e55d798cf3 100644
>> --- a/kernel/cgroup/cpuset.c
>> +++ b/kernel/cgroup/cpuset.c
> [ ... ]
>
>> @@ -3215,8 +3215,8 @@ static void cpuset_attach(struct cgroup_taskset *tset)
>>   	cs->old_mems_allowed = cpuset_attach_nodemask_to;
>>   
>>   	if (cs->nr_migrate_dl_tasks) {
>> -		cs->nr_deadline_tasks += cs->nr_migrate_dl_tasks;
>> -		oldcs->nr_deadline_tasks -= cs->nr_migrate_dl_tasks;
>> +		atomic_add(cs->nr_migrate_dl_tasks, &cs->nr_deadline_tasks);
>> +		atomic_sub(cs->nr_migrate_dl_tasks, &oldcs->nr_deadline_tasks);
> [Severity: High]
> This is a pre-existing issue, but does making this an atomic_t fully resolve
> the race between cgroup migration and concurrent sched_setscheduler() policy
> changes?
>
> During cgroup migration, cpuset_can_attach() calculates nr_migrate_dl_tasks
> while holding cpuset_mutex:
>
> kernel/cgroup/cpuset.c:cpuset_can_attach() {
>      ...
>      if (dl_task(task)) {
>          cs->nr_migrate_dl_tasks++;
>          oldcs->nr_migrate_dl_tasks--;
>      ...
> }
>
> Then cpuset_mutex is dropped before cgroup_migrate_execute() updates the
> cgroup pointers and calls cpuset_attach().
>
> If a concurrent sched_setscheduler(task, SCHED_DEADLINE) occurs during this
> gap, it takes cpuset_mutex via __sched_setscheduler(), updates the policy, and
> calls switched_to_dl(), which ends up calling inc_dl_tasks_cs(task).
>
> Because the task has not yet been migrated to the new cgroup in
> css_set_move_task(), inc_dl_tasks_cs() will erroneously increment
> oldcs->nr_deadline_tasks.
>
> Later, cpuset_attach() takes cpuset_mutex again and applies the stale
> pre-calculated delta from cpuset_can_attach() using atomic_add() and
> atomic_sub().
>
> Since the task was not originally a DL task during cpuset_can_attach(),
> nr_migrate_dl_tasks is 0. But the task is now a DL task and will migrate,
> leaving oldcs->nr_deadline_tasks artificially inflated by +1 and
> newcs->nr_deadline_tasks missing a +1.
>
> Could the counters and root domain bandwidth still get corrupted due to this
> time-of-check to time-of-use race?
>
>>   		reset_migrate_dl_data(cs);
>>   	}
>>
Yes, that is another race condition that is not addressed by this patch. 
This race condition is much harder to fix. I will have to think about it 
when I have time.

Cheers,
Longman

