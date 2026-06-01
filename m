Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 234023E073E
	for <sashiko-reviews@lists.linux.dev>; Mon,  1 Jun 2026 15:31:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.133.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1780327923; cv=none; b=t+HqTXebLxL/8ON7m4n1U2qemZ2oIEWthyk1Ge3UDGZj5Q7tuTTvGr5WOekvF6/9oL4bLzZK9wniNLz1YO9vF3jbFqLZQEi8cXqvXGDaJYBoA6MFWPPjM7PWlQu+UeN/EmuW1QtopmQEc2A0BU9KglAtLztcX4/7V8TDjk+U4XY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1780327923; c=relaxed/simple;
	bh=zu3sWawkZeeBTKJe01/wPEAVgcKJx6/rW+s/hWMRnOk=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=g5yHtZJx5uXX9fs4TYR/UFLS/I82jR38vX8blJb9VhV5LVCqADhJErtGBQeYvZ5rVH4onFkF8tyXvi+LjxO947eiHigjFvIYwT29OEt5tJibOYcfZaxjuvD0BeRD0x4wGSxfd+E89tBhHf4jret4Zz5z0JykoJajt8QdMizEDqc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=geA2cDXI; arc=none smtp.client-ip=170.10.133.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="geA2cDXI"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1780327915;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=5ge/zNpG7MiQQuvvUOiUj3O/GD7tLW/6g/Nt4OF1Fu4=;
	b=geA2cDXIY6uX32O4/RsOtPa4E5Q4M3ObBtOqu8kdA55wu+WR5Aa7OZvI/uEXN9fays0SvT
	0sSU4MIx3oaKUg0yTpgH8/TiFdBJbMuDw5cIbT8xLPnfjm5AlsqsoPPTrk35mXSwWdyVcx
	TfDmhebLLW8ivJOYknvBw71IOin6Li0=
Received: from mx-prod-mc-06.mail-002.prod.us-west-2.aws.redhat.com
 (ec2-35-165-154-97.us-west-2.compute.amazonaws.com [35.165.154.97]) by
 relay.mimecast.com with ESMTP with STARTTLS (version=TLSv1.3,
 cipher=TLS_AES_256_GCM_SHA384) id us-mta-680-46-YZTumOeaKoX4ufb9isQ-1; Mon,
 01 Jun 2026 11:31:50 -0400
X-MC-Unique: 46-YZTumOeaKoX4ufb9isQ-1
X-Mimecast-MFC-AGG-ID: 46-YZTumOeaKoX4ufb9isQ_1780327909
Received: from mx-prod-int-01.mail-002.prod.us-west-2.aws.redhat.com (mx-prod-int-01.mail-002.prod.us-west-2.aws.redhat.com [10.30.177.4])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by mx-prod-mc-06.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTPS id C56A41800614;
	Mon,  1 Jun 2026 15:31:48 +0000 (UTC)
Received: from [10.22.88.124] (unknown [10.22.88.124])
	by mx-prod-int-01.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTP id E6CAF30001A2;
	Mon,  1 Jun 2026 15:31:47 +0000 (UTC)
Message-ID: <ac847ee1-2ff3-4d71-9608-cfcbcee36ccc@redhat.com>
Date: Mon, 1 Jun 2026 11:31:47 -0400
Precedence: bulk
X-Mailing-List: sashiko-reviews@lists.linux.dev
List-Id: <sashiko-reviews.lists.linux.dev>
List-Subscribe: <mailto:sashiko-reviews+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:sashiko-reviews+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH-next v4 4/6] cgroup/cpuset: Made cpuset_attach_old_cs
 track task group leaders
To: sashiko-reviews@lists.linux.dev
Cc: tj@kernel.org, hannes@cmpxchg.org, mkoutny@suse.com
References: <20260529212108.120506-5-longman@redhat.com>
 <20260529231931.7326C1F00893@smtp.kernel.org>
From: Waiman Long <longman@redhat.com>
In-Reply-To: <20260529231931.7326C1F00893@smtp.kernel.org>
X-Scanned-By: MIMEDefang 3.4.1 on 10.30.177.4
X-Mimecast-Spam-Score: 0
X-Mimecast-MFC-PROC-ID: dTs8fZlviTBLFj1FrievMoLQrjmtDUbif6DzdpIqtAI_1780327909
X-Mimecast-Originator: redhat.com
Content-Language: en-US
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit


On 5/29/26 7:19 PM, sashiko-bot@kernel.org wrote:
> Thank you for your contribution! Sashiko AI review found 4 potential issue(s) to consider:
>
> Pre-existing issues:
> - [High] Global boolean flags are evaluated based solely on the first task's source cpuset during multi-cpuset migrations, skipping updates for subsequent tasks.
> - [High] SCHED_DEADLINE task accounting (`nr_deadline_tasks`) underflows and leaks when migrating tasks from multiple source cpusets.
> - [High] When migrating a process whose threads reside in different cpusets, `cpuset_migrate_mm()` only migrates pages from the leader's old nodes, bypassing other threads' nodes.
> - [High] If a migrating process's thread group leader has exited (e.g., is a zombie), page migration and memory policy rebinding are entirely bypassed for surviving threads.
> --
>
> commit 80e6ff469724f377b7de8a5fa03f60d067749c38
> Author: Waiman Long <longman@redhat.com>
>
> cgroup/cpuset: Made cpuset_attach_old_cs track task group leaders
>
> This commit modifies cpuset_can_attach() to update cpuset_attach_old_cs
> to track the old cpuset of the task group leader. This ensures that when a
> multithreaded application spans multiple cpusets, the mm setting of the
> group leader is used during migration.
>
>> diff --git a/kernel/cgroup/cpuset.c b/kernel/cgroup/cpuset.c
>> index 36784fce285d5..dec708edb0e12 100644
>> --- a/kernel/cgroup/cpuset.c
>> +++ b/kernel/cgroup/cpuset.c
>> @@ -3092,6 +3106,10 @@ static int cpuset_can_attach(struct cgroup_taskset *tset)
>>   		if (ret)
>>   			goto out_unlock;
>>   
>> +		/* Update cpuset_attach_old_cs to the latest group leader */
>> +		if (task == task->group_leader)
>> +			cpuset_attach_old_cs = task_cs(task);
>> +
> [Severity: High]
> This isn't a bug introduced by this patch, but does relying on a single
> cpuset_attach_old_cs cause global boolean flags to be evaluated incorrectly
> during multi-cpuset migrations?
>
> In cpuset_can_attach_check(), attach_cpus_updated and attach_mems_updated
> are evaluated by comparing the target cpuset only against the oldcs of the
> first task. If the first task originates from a cpuset with masks matching
> the target, these flags become false.
>
> This optimizes out the v2 task mask updates in cpuset_attach():
>
>      if (!attach_cpus_updated && !attach_mems_updated)
>          goto out;
>
> Does this mean subsequent tasks migrating from different cpusets are skipped
> and left with incorrect affinities?
I am going to remove the global update flags and re-evaluate the local 
update flags in cpuset_attach().
>
> [Severity: High]
> This is a pre-existing issue, but does tracking a single oldcs cause
> SCHED_DEADLINE task accounting to underflow?
>
> In cpuset_can_attach(), the count of migrating SCHED_DEADLINE tasks across
> all source cpusets is aggregated into a single variable:
>
>      cs->nr_migrate_dl_tasks++;
>
> In cpuset_attach(), this total count is subtracted from the
> nr_deadline_tasks of the single selected oldcs:
>
>      oldcs->nr_deadline_tasks -= cs->nr_migrate_dl_tasks;
>
> If tasks are migrating from multiple cpusets, this would cause an underflow
> in the selected oldcs and leak the deadline task count in the other source
> cpusets.
This is a known problem that has been fixed in a later patch  of the 
series.
>
> [Severity: High]
> This isn't a bug introduced by this patch, but since cpuset_migrate_mm()
> uses only the leader's old_mems_allowed, does it bypass page migration for
> pages allocated by other threads?
>
> cpuset_migrate_mm() is invoked with the from mask pointing to
> &oldcs->old_mems_allowed. If the process has threads in other cpusets that
> allocated pages on different memory nodes, those nodes are excluded from the
> from mask, leaving pages on nodes that may be disallowed in the new cpuset.
For best performance, the node mask of all the threads of a 
multithreaded application should be the same, though it is common for 
different threads to be associated with different CPUs. Anyway, this is 
out of scope for this patch series and will not be addressed.
>
> [Severity: High]
> This is a pre-existing issue, but if a migrating process's thread group
> leader has exited (e.g., is a zombie), does this fail to update
> cpuset_attach_old_cs and bypass migration for surviving threads?
>
> Exiting tasks are excluded from the migration taskset. If the leader is
> absent from tset, cpuset_attach() never executes its loop body for surviving
> threads because it iterates using cgroup_taskset_for_each_leader(). This
> leaves surviving threads' memory unmigrated and their memory policies unbound
> to the new cpuset.

It is out of scope for this patch series and will not be addressed here.

Cheers,
Longman

