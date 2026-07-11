Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 42B1F272816
	for <sashiko-reviews@lists.linux.dev>; Sat, 11 Jul 2026 03:58:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.129.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783742333; cv=none; b=EMEKcMda1Q+8Da2qI20X+Gs5jqSuJkCbFPnrwGFVWuwfBmg3bm0XnPtPZq3yavanYRpEE9FyWuF6EopKS0EzeRQ9WQPVfpHN+gCwt0FdCjcEDAIsx0jiWpcePnPVAtr1eBP6CZ+ZO+ezCgYQXj0VN6VNkjN6KrGA4ipq2jX3NH8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783742333; c=relaxed/simple;
	bh=fAf7I6lqFaVpuWeRqaPdQFyIP7d28tpgludZTRQ5qew=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=TcpGNXq66KuD5ypRYQh/kdBFziCwt7vLz9ObdhCHyl4nIqKt98i77XmecU8udr4EUeEB2s4eDQaX2+0RHJHB77R+BV4Adb96sCA4Ua7HaWKOpwk4/oNtBeGviZiNh+ZGOSFLjy1rRSWBCgrTjFuoh+6LIK0JOH6o51SG4Fz5eAc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=cG56o+bk; arc=none smtp.client-ip=170.10.129.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="cG56o+bk"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1783742331;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=Bu9iIuKVOZLRSdpkv0gbYyP0sbfmWVKkCaBA/CM036U=;
	b=cG56o+bkapkUSLQU/qG55K6TtWKUe/emo7k+tuXuK9+jDjgPC3PgTvT7Z6xzxJAjqzcYv5
	+XWSp6EjpAtIm3xxdpFPBD2FJR32fSxAbJwIX37iw3cTh43n0sT1nOMjAHFU2/rVI84ZAj
	ArnCjxvOFfcFsToAFiQbt976uJl26Ms=
Received: from mx-prod-mc-06.mail-002.prod.us-west-2.aws.redhat.com
 (ec2-35-165-154-97.us-west-2.compute.amazonaws.com [35.165.154.97]) by
 relay.mimecast.com with ESMTP with STARTTLS (version=TLSv1.3,
 cipher=TLS_AES_256_GCM_SHA384) id us-mta-495-p9a1J4o0MD2chhujpEaZ5A-1; Fri,
 10 Jul 2026 23:58:47 -0400
X-MC-Unique: p9a1J4o0MD2chhujpEaZ5A-1
X-Mimecast-MFC-AGG-ID: p9a1J4o0MD2chhujpEaZ5A_1783742326
Received: from mx-prod-int-08.mail-002.prod.us-west-2.aws.redhat.com (mx-prod-int-08.mail-002.prod.us-west-2.aws.redhat.com [10.30.177.111])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by mx-prod-mc-06.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTPS id 64607180025F;
	Sat, 11 Jul 2026 03:58:46 +0000 (UTC)
Received: from [10.22.88.253] (unknown [10.22.88.253])
	by mx-prod-int-08.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTP id 637C51800661;
	Sat, 11 Jul 2026 03:58:45 +0000 (UTC)
Message-ID: <f4aa00b6-5c02-43aa-8cd1-2f5150b5e651@redhat.com>
Date: Fri, 10 Jul 2026 23:58:44 -0400
Precedence: bulk
X-Mailing-List: sashiko-reviews@lists.linux.dev
List-Id: <sashiko-reviews.lists.linux.dev>
List-Subscribe: <mailto:sashiko-reviews+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:sashiko-reviews+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH-next 1/3] cgroup/cpuset: Handle the special case of
 non-moving tasks in cpuset_can_attach()
To: sashiko-reviews@lists.linux.dev
Cc: tj@kernel.org, mkoutny@suse.com, hannes@cmpxchg.org
References: <20260711020540.176740-1-longman@redhat.com>
 <20260711020540.176740-2-longman@redhat.com>
 <20260711022601.044211F000E9@smtp.kernel.org>
From: Waiman Long <longman@redhat.com>
In-Reply-To: <20260711022601.044211F000E9@smtp.kernel.org>
X-Scanned-By: MIMEDefang 3.4.1 on 10.30.177.111
X-Mimecast-Spam-Score: 0
X-Mimecast-MFC-PROC-ID: O2sLezvm32hxopkOe9Wy19MiN1rmWlpxdRKRUc3R2dI_1783742326
X-Mimecast-Originator: redhat.com
Content-Language: en-US
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 7/10/26 10:26 PM, sashiko-bot@kernel.org wrote:
> Thank you for your contribution! Sashiko AI review found 2 potential issue(s) to consider:
> - [High] The destination cpuset `cs` is evaluated only once before the loop, causing tasks genuinely migrating to different cpusets to be incorrectly skipped in cgroup v2.
> - [Medium] Skipping tasks with `oldcs == cs` prevents `attach_ctx.old_cs` from explicitly tracking the group leader, causing nondeterministic source mask selection for memory migration.
> --
>
> --- Patch [1]: [PATCH-next 1/3] cgroup/cpuset: Handle the special case of non-moving tasks in cpuset_can_attach() ---
> commit e7450b35936f6b09242716e8444ef02f2f6332cb
> Author: Waiman Long <longman@redhat.com>
>
> cgroup/cpuset: Handle the special case of non-moving tasks in cpuset_can_attach()
>
> This commit handles cases in cgroup v2 threaded subtrees where tasks do not
> migrate with respect to cpusets because the cpuset controller isn't enabled
> in some subtree cgroups. It skips these non-moving tasks to prevent list
> tracking issues.
>
> Link: https://lore.kernel.org/lkml/e254af713b5345aec3d086771ecf1e71@kernel.org
>
>> diff --git a/kernel/cgroup/cpuset.c b/kernel/cgroup/cpuset.c
>> index cf0d005d2b784..d99184ec60b5a 100644
>> --- a/kernel/cgroup/cpuset.c
>> +++ b/kernel/cgroup/cpuset.c
> [ ... ]
>> @@ -3164,17 +3159,27 @@ static int cpuset_can_attach(struct cgroup_taskset *tset)
>>   	 * of child cpusets must always be a subset of the parent. So no real
>>   	 * page migration will be necessary no matter which child cpuset is
>>   	 * selected as attach_ctx.old_cs.
>> +	 *
>> +	 * For a v2 threaded subtree where cpuset isn't enabled in some of the
>> +	 * cgroups, it is possible that oldcs == cs for some of the tasks.
>> +	 * In this case, we can skip checking on those tasks as there is no
>> +	 * actual migration wrt cpuset.
>>   	 */
>>   	cgroup_taskset_for_each(task, css, tset) {
>>   		struct cpuset *new_oldcs = task_cs(task);
>>   
>>   		if (new_oldcs != oldcs) {
>>   			oldcs = new_oldcs;
>> +			if (oldcs == cs)
>> +				continue;
> [Severity: High]
> Does this skip check handle multiple destination cpusets correctly in
> cgroup v2?
>
> The destination cpuset cs is evaluated only once before the loop:
>
>      cs = css_cs(css);
>      ...
>      cgroup_taskset_for_each(task, css, tset) {
>
> If a threaded subtree migration involves multiple destination cgroups, could
> oldcs == cs evaluate to true for a task whose source cpuset just happens to
> match the first task's destination?
>
> If so, this might skip genuine migrations, bypassing task_can_attach(),
> security_task_setscheduler(), and DL task accounting.
This is to be done in the next patch.
>>   			ret = cpuset_can_attach_check(cs, oldcs, &setsched_check);
>>   			if (ret)
>>   				goto out_unlock;
>>   		}
>>   
>> +		if (oldcs == cs)
>> +			continue;
>> +
> [Severity: Medium]
> If we continue here, do we miss updating the group leader's old cpuset?
>
> Later in this loop, there is logic to update the group leader:
>
>      if (task == task->group_leader)
>          attach_ctx.old_cs = task_cs(task);
>
> By skipping the rest of the loop for tasks with oldcs == cs, if the group
> leader is skipped, does attach_ctx.old_cs end up tracking a random thread's
> cpuset instead of the group leader?
>
> Since cpuset_migrate_mm() relies on attach_ctx.old_cs to determine the
> source node mask, could this lead to non-deterministic memory migration
> behavior?

I had thought of that, but I forgot to make the change. Will fix that in 
the next version.

Cheers,
Longman

>
>>   		ret = task_can_attach(task);
>>   		if (ret)
>>   			goto out_unlock;

