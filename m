Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D0414386C3E
	for <sashiko-reviews@lists.linux.dev>; Fri, 29 May 2026 17:40:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.133.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1780076456; cv=none; b=o7afrmYYpoOtNnoFU9GSygbHoEeFs22Za96U03EDcuvC6MvUdcq6b2yEzl5hYKv/AGD7qFyUFTOFENyi9Q+iw3qtsbj4e8OfsVyjgnZl7iBF5dvfhxWKc5iqUU0UXnsHXULmAancNZTDiAuj6q9uDxYcR65MCNV0B4uYIYNjdoQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1780076456; c=relaxed/simple;
	bh=rKUM4JtxEFwU1urOTLd4PLbLuWI4d3bdDhRgvtQ7B2A=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=rTaWQ6VabyNhSiKf2yJoctQLQ8IuwpqxZI9xFBekB8e5cwRKcEfTNt43cspVJcz5cw1UK8Q13R0qFDlk16v5pZkA6AwCISGg8dRlNhq7HMBtYCjWSWeRW90q6f9t+/3+k5y7jYHXMn4/4IXaWRdOGy3GOmSH53wjfY1VISIUaXE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=JkRA+kWL; arc=none smtp.client-ip=170.10.133.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="JkRA+kWL"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1780076453;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=iai6e5LPgtH9inWfvMP4JK5gOZ/HUJ+aF0ebBIcfts8=;
	b=JkRA+kWL70yMizpYEqkoZEglTZhlYSmnSJ/NBrRyCB0PQ02IdJRcdYiuZ0PNQlIev108pb
	jfV6WtYOuwnhJVFiHxZKEdRDCoRdnrg6NyfNN7vQYB8KG9nyNERMbBKLZOrj2Vpe6NvddM
	ywQQD8ZLyFY7QjaqWgQbvnF1ZdgoBnk=
Received: from mx-prod-mc-03.mail-002.prod.us-west-2.aws.redhat.com
 (ec2-54-186-198-63.us-west-2.compute.amazonaws.com [54.186.198.63]) by
 relay.mimecast.com with ESMTP with STARTTLS (version=TLSv1.3,
 cipher=TLS_AES_256_GCM_SHA384) id us-mta-128-VOZA3netNhWA5_q190LE6Q-1; Fri,
 29 May 2026 13:40:52 -0400
X-MC-Unique: VOZA3netNhWA5_q190LE6Q-1
X-Mimecast-MFC-AGG-ID: VOZA3netNhWA5_q190LE6Q_1780076451
Received: from mx-prod-int-06.mail-002.prod.us-west-2.aws.redhat.com (mx-prod-int-06.mail-002.prod.us-west-2.aws.redhat.com [10.30.177.93])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by mx-prod-mc-03.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTPS id 2865019560B4;
	Fri, 29 May 2026 17:40:51 +0000 (UTC)
Received: from [10.22.64.54] (unknown [10.22.64.54])
	by mx-prod-int-06.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTP id 437A51800357;
	Fri, 29 May 2026 17:40:50 +0000 (UTC)
Message-ID: <f46e2680-0e26-44e2-acaf-26051ac3143c@redhat.com>
Date: Fri, 29 May 2026 13:40:49 -0400
Precedence: bulk
X-Mailing-List: sashiko-reviews@lists.linux.dev
List-Id: <sashiko-reviews.lists.linux.dev>
List-Subscribe: <mailto:sashiko-reviews+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:sashiko-reviews+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH-next v3 5/5] cgroup/cpuset: Support multiple
 source/destination cpusets for cpuset_*attach()
To: sashiko-reviews@lists.linux.dev
Cc: mkoutny@suse.com, hannes@cmpxchg.org, tj@kernel.org
References: <20260527153800.1557449-6-longman@redhat.com>
 <20260527183034.A81381F000E9@smtp.kernel.org>
From: Waiman Long <longman@redhat.com>
In-Reply-To: <20260527183034.A81381F000E9@smtp.kernel.org>
X-Scanned-By: MIMEDefang 3.4.1 on 10.30.177.93
X-Mimecast-Spam-Score: 0
X-Mimecast-MFC-PROC-ID: prq7nAk1zP2AQVPccNx8v8ZnA9fmilFsuYuhdcmCccs_1780076451
X-Mimecast-Originator: redhat.com
Content-Language: en-US
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit


On 5/27/26 2:30 PM, sashiko-bot@kernel.org wrote:
> Thank you for your contribution! Sashiko AI review found 1 potential issue(s) to consider:
>
> Pre-existing issues:
> - [High] Incorrect memory migration due to global `cpuset_attach_old_cs` tracking only a single source cpuset for multi-source tasksets.
> --
>
> commit e9778f4a1eb98851e3298f795f8a88874b0e43c1
> Author: Waiman Long <longman@redhat.com>
>
> cgroup/cpuset: Support multiple source/destination cpusets for cpuset_*attach()
>
> This commit updates the cpuset attach functions to handle multiple source
> and destination cpusets during task migration, maintaining singly linked
> lists to track them. It also updates deadline task accounting to reflect
> the possibility of many-to-one migrations.
>
>> diff --git a/kernel/cgroup/cpuset.c b/kernel/cgroup/cpuset.c
>> index 7100575927f6a..98ee001ef950a 100644
>> --- a/kernel/cgroup/cpuset.c
>> +++ b/kernel/cgroup/cpuset.c
> [ ... ]
>> @@ -3210,42 +3303,45 @@ static void cpuset_attach(struct cgroup_taskset *tset)
>>   	struct task_struct *task;
>>   	struct cgroup_subsys_state *css;
>>   	struct cpuset *cs;
>> -	struct cpuset *oldcs = cpuset_attach_old_cs;
>>   
>>   	cgroup_taskset_first(tset, &css);
>>   	cs = css_cs(css);
> [Severity: High]
> This is a pre-existing issue, but does this multi-source migration logic
> miss the memory migration path?
>
> During cpuset_can_attach(), the global variable cpuset_attach_old_cs is
> overwritten with the task_cs(task) of each group leader:
>
> cpuset_can_attach() {
>      ...
>      cgroup_taskset_for_each(task, css, tset) {
>          ...
>          /* Update cpuset_attach_old_cs to the latest group leader */
>          if (task == task->group_leader)
>              cpuset_attach_old_cs = task_cs(task);
>
> For a taskset containing tasks from multiple different source cpusets,
> cpuset_attach_old_cs ends up pointing only to the old cpuset of the last
> group leader.
>
> Later, cpuset_attach_task() relies on this global variable to determine
> the source memory node mask for cpuset_migrate_mm():
>
> cpuset_attach_task() {
>      ...
>      if (mm) {
>          struct cpuset *oldcs = cpuset_attach_old_cs;
>          ...
>          if (is_memory_migrate(cs)) {
>              cpuset_migrate_mm(mm, &oldcs->old_mems_allowed,
>                                &cs->effective_mems);
>
> Will this result in all tasks in a heterogeneous migration batch using
> the old_mems_allowed of the last processed task's old cpuset?
>
> If so, could this use the wrong source mask for tasks originating from other
> cpusets, potentially leaving pages stranded on incorrect NUMA nodes and
> violating cpuset memory isolation boundaries?

The reason why that is not a problem is documented in patch 3. So this 
shouldn't be a problem.

Cheers,
Longman

>

