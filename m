Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AAED237D124
	for <sashiko-reviews@lists.linux.dev>; Fri, 26 Jun 2026 21:09:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.133.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1782508176; cv=none; b=oHsTFm1wiCb1JOL0VcjpRIqMhgEgH+N4CAvNU4UWK7DdD4QM4eRsdT2sU2B3n/k1pU+Q9E6S+WhiBSmuJicc/QzwAsxaOT2abYtghMT+WJ91GR/owcHy4UAMaAP0c8QtihhB1zbc/dRNFrg5Ad0QTYvJHtpZBUGgJZdG86cY474=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1782508176; c=relaxed/simple;
	bh=p5NuRXWxHZL7HSMOlW8j1c7ZG7a/X+DBRZOzL+Au79I=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=R9gHe2GA2tEEI1H0shYeLG+fjvoGyPUTLsO6qSGwjiw0zfGoBKnsVNK/x9Zh0+llSuP70pylYdrfdR3hKOTdzt8iu3rib9vETQpKus/JLPdYVK2nlZ7nI455vQEal6LiF2Ed3nlHAhMuPHigw5mmBgdPdfULpL/pYm7u/+3ckQw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=ALpWqzxF; arc=none smtp.client-ip=170.10.133.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="ALpWqzxF"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1782508174;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=fwmtT1GjJzm138Am5YJs6eEInH1pAcSg3KNmpY7mNK0=;
	b=ALpWqzxFz7ZhvV7axxZv4jsF79bLA3K7bzVb6Cdz3hEmXXxQQ26OxaTd3hVDERlqX1ijEX
	cn9ChfnLKqUjxKlMeI2kHmTXuB4jG5c6qUO77vJw7jPa6+DA1FAaAlHVaQSJpZKB0gseXb
	GcXoOF7JjMgz9BDEu4g8ZWCaA5Notdo=
Received: from mx-prod-mc-01.mail-002.prod.us-west-2.aws.redhat.com
 (ec2-54-186-198-63.us-west-2.compute.amazonaws.com [54.186.198.63]) by
 relay.mimecast.com with ESMTP with STARTTLS (version=TLSv1.3,
 cipher=TLS_AES_256_GCM_SHA384) id us-mta-646--hCPccckPFWuDWTRCAEopw-1; Fri,
 26 Jun 2026 17:09:31 -0400
X-MC-Unique: -hCPccckPFWuDWTRCAEopw-1
X-Mimecast-MFC-AGG-ID: -hCPccckPFWuDWTRCAEopw_1782508170
Received: from mx-prod-int-05.mail-002.prod.us-west-2.aws.redhat.com (mx-prod-int-05.mail-002.prod.us-west-2.aws.redhat.com [10.30.177.17])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by mx-prod-mc-01.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTPS id 1F39A1955EAF;
	Fri, 26 Jun 2026 21:09:30 +0000 (UTC)
Received: from [10.2.16.156] (unknown [10.2.16.156])
	by mx-prod-int-05.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTP id C95B71956095;
	Fri, 26 Jun 2026 21:09:28 +0000 (UTC)
Message-ID: <5e28abd4-51cf-4bd2-9cde-a9d12b710ecc@redhat.com>
Date: Fri, 26 Jun 2026 17:09:27 -0400
Precedence: bulk
X-Mailing-List: sashiko-reviews@lists.linux.dev
List-Id: <sashiko-reviews.lists.linux.dev>
List-Subscribe: <mailto:sashiko-reviews+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:sashiko-reviews+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v8 09/11] cgroup/cpuset: Support multiple source cpusets
 for cpuset_*attach()
To: sashiko-reviews@lists.linux.dev
Cc: hannes@cmpxchg.org, mkoutny@suse.com, tj@kernel.org
References: <20260626181923.133658-1-longman@redhat.com>
 <20260626181923.133658-10-longman@redhat.com>
 <20260626190419.0DDA21F000E9@smtp.kernel.org>
From: Waiman Long <longman@redhat.com>
In-Reply-To: <20260626190419.0DDA21F000E9@smtp.kernel.org>
X-Scanned-By: MIMEDefang 3.0 on 10.30.177.17
X-Mimecast-Spam-Score: 0
X-Mimecast-MFC-PROC-ID: V3hx48B5ijIfxGGfbICTxNsxjGuSweB1UfJtIx2Uz4o_1782508170
X-Mimecast-Originator: redhat.com
Content-Language: en-US
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 6/26/26 3:04 PM, sashiko-bot@kernel.org wrote:
> Thank you for your contribution! Sashiko AI review found 1 potential issue(s) to consider:
>
> Pre-existing issues:
> - [High] This problem wasn't introduced by this patch, but there is a data race on `cpuset->nr_deadline_tasks` between process context (using `cpuset_mutex`) and scheduler context (using `rq->lock`).
> --
>
> commit 359aed8e7e754859ff7cfcc47cab539b93c181d8
> Author: Waiman Long <longman@redhat.com>
>
> cgroup/cpuset: Support multiple source cpusets for cpuset_*attach()
>
> This commit updates cpuset migration to handle multiple source cpusets by
> tracking them in a singly linked list. It correctly updates task migration
> states for deadline tasks and shifts attach context tracking.
>
>> diff --git a/kernel/cgroup/cpuset.c b/kernel/cgroup/cpuset.c
>> index 39bccb131181a..792b474de237c 100644
>> --- a/kernel/cgroup/cpuset.c
>> +++ b/kernel/cgroup/cpuset.c
> [ ... ]
>> @@ -3057,6 +3071,25 @@ static void reset_migrate_dl_data(struct cpuset *cs)
>>   	cs->dl_bw_cpu = -1;
>>   }
>>   
>> +/*
>> + * Clear and optionally apply (@cancel is false) the attach related data in the
>> + * source cpusets.
>> + */
>> +static void clear_attach_data(struct llist_head *head, bool cancel)
>> +{
>> +	struct cpuset *cs, *next;
>> +	struct llist_node *lnode = __llist_del_all(head);
>> +
>> +	llist_for_each_entry_safe(cs, next, lnode, attach_node) {
>> +		init_llist_node(&cs->attach_node);
>> +		if (cs->nr_migrate_dl_tasks) {
>> +			if (!cancel)
>> +				cs->nr_deadline_tasks += cs->nr_migrate_dl_tasks;
> [Severity: High]
> This isn't a bug introduced by this patch, but does this non-atomic
> modification of cs->nr_deadline_tasks introduce a data race with scheduler
> context?
>
> Looking at inc_dl_tasks_cs(), the same field is modified under rq->lock:
>
> kernel/cgroup/cpuset.c:inc_dl_tasks_cs() {
>      ...
>      cs->nr_deadline_tasks++;
>      ...
> }
>
> If one thread modifies this in process context via clear_attach_data() under
> cpuset_mutex, and concurrently another thread changes a task to SCHED_DEADLINE
> (via switched_to_dl() -> inc_dl_tasks_cs()) under rq->lock, can the updates be
> lost due to the race?
>
> If the count corrupts and drops to zero prematurely, could
> dl_update_tasks_root_domain() skip tracking DL bandwidth, violating deadline
> scheduling bandwidth invariants and potentially leading to CPU overcommit?

Yes, it looks like we should make nr_deadline_tasks an atomic_t to avoid 
data corruption.

Cheers,
Longman

>> +			cs->nr_migrate_dl_tasks = 0;
>> +		}
>> +	}
>> +}
>> +

