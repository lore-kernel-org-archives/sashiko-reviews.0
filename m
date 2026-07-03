Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E2D6035677C
	for <sashiko-reviews@lists.linux.dev>; Fri,  3 Jul 2026 06:04:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.133.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783058686; cv=none; b=s6ZoA9VygctzSX22hhKHeIcA2HZ8IEJ24UELtYH4PJX1Slz8gJImDEw/PkxBZs9UsMHS2oswwnhVMA5uRCX+sL43G/+p+xqM1JvuwT4zS/IYQVJOYZ47MY8tNYDT7lxIZ+Uyannt96fYDf7TnrY8F7TzTTWvkhwUyzyDJhnRla0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783058686; c=relaxed/simple;
	bh=hI18hC0UwSAypcvL9VyuFkm6qpjqA75tmCly55HM5Mk=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=LZ4pM1cHgXvAVXw4cqfE5T/twAfTklppNCb0HAu4sjMxe4Wa2MQAgOg4ie3Hih1NXsyb6zVaHXVMtd290OSzCKg28KFpiU1sRB0LOHISsdboBU2cs5r/GCIZ2x8HSUQ4cf2OvQocxGAPP6NJsEc8K0JyFIYYS5IqwuKC56M/dQY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=X7RQ76WV; arc=none smtp.client-ip=170.10.133.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="X7RQ76WV"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1783058683;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=foimsWHRKb0iIpREmdZ9R+ChVT/sfsRhZkHKfNjCwTo=;
	b=X7RQ76WVxommw7fOzvZstaaQKYBAxt+ypSsbRXanTn3KIks1x9HQhrjhkl/cJdz4LpxGqZ
	JTPysjyZT9i6uZm4DhyaRPF7IeYqZ/dPx3HAZZOESTQlG+U+wgr0RQLV/WN+gYaqqR3vvX
	bD/uoP5nly9L5wcVzrqnbe+8w2rcbGA=
Received: from mx-prod-mc-03.mail-002.prod.us-west-2.aws.redhat.com
 (ec2-54-186-198-63.us-west-2.compute.amazonaws.com [54.186.198.63]) by
 relay.mimecast.com with ESMTP with STARTTLS (version=TLSv1.3,
 cipher=TLS_AES_256_GCM_SHA384) id us-mta-100-eBTFNwcoObK15MtIBm7H0w-1; Fri,
 03 Jul 2026 02:04:40 -0400
X-MC-Unique: eBTFNwcoObK15MtIBm7H0w-1
X-Mimecast-MFC-AGG-ID: eBTFNwcoObK15MtIBm7H0w_1783058679
Received: from mx-prod-int-01.mail-002.prod.us-west-2.aws.redhat.com (mx-prod-int-01.mail-002.prod.us-west-2.aws.redhat.com [10.30.177.4])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by mx-prod-mc-03.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTPS id 72336193E8B5;
	Fri,  3 Jul 2026 06:04:39 +0000 (UTC)
Received: from [10.2.16.58] (unknown [10.2.16.58])
	by mx-prod-int-01.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTP id 1832D30030D1;
	Fri,  3 Jul 2026 06:04:37 +0000 (UTC)
Message-ID: <f897e15b-6738-400a-b5e2-229408b31222@redhat.com>
Date: Fri, 3 Jul 2026 02:04:36 -0400
Precedence: bulk
X-Mailing-List: sashiko-reviews@lists.linux.dev
List-Id: <sashiko-reviews.lists.linux.dev>
List-Subscribe: <mailto:sashiko-reviews+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:sashiko-reviews+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH-next v10 10/11] cgroup/cpuset: Support multiple
 destination cpusets for cpuset_*attach()
To: sashiko-reviews@lists.linux.dev
Cc: mkoutny@suse.com, hannes@cmpxchg.org, tj@kernel.org
References: <20260702214757.579012-1-longman@redhat.com>
 <20260702214757.579012-11-longman@redhat.com>
 <20260702220322.9F9DF1F000E9@smtp.kernel.org>
From: Waiman Long <longman@redhat.com>
In-Reply-To: <20260702220322.9F9DF1F000E9@smtp.kernel.org>
X-Scanned-By: MIMEDefang 3.4.1 on 10.30.177.4
X-Mimecast-Spam-Score: 0
X-Mimecast-MFC-PROC-ID: zLC1I3idvLASA5aiDwH9oI3VGmXx6fsqpFIRtdJbr4E_1783058679
X-Mimecast-Originator: redhat.com
Content-Language: en-US
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit


On 7/2/26 6:03 PM, sashiko-bot@kernel.org wrote:
> Thank you for your contribution! Sashiko AI review found 1 potential issue(s) to consider:
> - [High] Migrating a multithreaded process with threads in different cgroups fails with a warning and `-EINVAL` if some threads change their cpuset and others do not.
> --
>
> commit b5923423c1aaea18954e18ecdfabb8c2bad4298c
> Author: Waiman Long <longman@redhat.com>
>
> cgroup/cpuset: Support multiple destination cpusets for cpuset_*attach()
>
> This commit adds support for migrating tasks to multiple destination cpusets.
> It introduces a new list to track destination cpusets and integrates the reset
> logic into clear_attach_data(). It also adds a warning and fails the attach
> operation if a cpuset is used as both a source and destination.
>
>> diff --git a/kernel/cgroup/cpuset.c b/kernel/cgroup/cpuset.c
>> index 38d48b66a32cf..8716b2e339606 100644
>> --- a/kernel/cgroup/cpuset.c
>> +++ b/kernel/cgroup/cpuset.c
> [ ... ]
>> @@ -3044,8 +3046,23 @@ static int cpuset_can_attach_check(struct cpuset *cs, struct cpuset *oldcs,
>>   	if (!oldcs)
>>   		return 0;
>>   
>> -	if (!llist_on_list(&oldcs->attach_node))
>> +	/*
>> +	 * The same cpuset cannot be both a source and a destination.
>> +	 * The current code does not support that, print a warning and
>> +	 * fail the attach if so.
>> +	 */
>> +	if (WARN_ON_ONCE((!oldcs->attach_source &&
>> +			  llist_on_list(&oldcs->attach_node)) ||
>> +			  cs->attach_source))
>> +		return -EINVAL;
> [Severity: High]
> Does this WARN_ON_ONCE trigger incorrectly during multithreaded process migrations?
>
> When a multithreaded process is migrated, some threads may already be in the
> target cgroup (where oldcs == cs) while other threads are moved from a different
> cgroup. For the threads that do not move, cpuset_can_attach_check() will process
> them as a source and set cs->attach_source = true.

I had done some tests on the latest kernel using a multi-threaded 
process with threads distributed in different cpusets that threads 
already in the destination cpuset will not show up in the task iteration 
process. So the situation that (cs == oldcs) should not happen. The 
WARN_ON_ONCE() is put there to ensure that if any future changes that 
accidentally breaks the rule will cause this warning to appear.

Cheers,
Longman

>
> When the iteration in cpuset_can_attach() reaches a thread that does change
> its cpuset, it calls cpuset_can_attach_check() again for the same destination
> cpuset:
>
> 	cgroup_taskset_for_each(task, css, tset) {
> 		...
> 		if ((new_oldcs != oldcs) || (new_cs != cs)) {
> 			...
> 			ret = cpuset_can_attach_check(cs, oldcs, &setsched_check);
>
> Since cs->attach_source was previously set to true, this check will fail,
> triggering the warning and returning -EINVAL.
>
> This prevents migrating multithreaded processes across cgroups under these
> conditions and could potentially panic systems configured with panic_on_warn.
>

