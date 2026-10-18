Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BB3A335F19D
	for <sashiko-reviews@lists.linux.dev>; Sun, 18 Oct 2026 17:24:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.133.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1792344251; cv=none; b=JpNeOQy5Q+jwtpSQ5xJif6aSeg9IMQu728blhfCQZ7e46wMPMEuDWyM67sMmoURWYPXVqCy2rJ4SLk3STKnd2I7ywxGSmbovWIv+GfU8cnYd1EoLdACVyYpfuD+0uuy/qGmjIDHw9tLZ46/6RBKOeUhEzYQ0MG4cuktULMVoG5I=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1792344251; c=relaxed/simple;
	bh=jPhhaWgkGhQmIqcArC/mv4lAwHC0rsjaVx4S3MLCvW4=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=PqCycX/8WT2+o2O7a9i1a9/0dzb2kKpxFBfg/X6bjIShHXGrdsrgVQDuyb+5DvOWJrA7I6awyXgp0fW7HokjDgq990dBAKXsODNgGkDYwB11VPHVgYUeIXSnsYf/IhzueyqOplZZO0lgSDXgAokOaIhRHS4MWhT9kvrt7OZ/pGA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=gEGHJbDp; arc=none smtp.client-ip=170.10.133.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="gEGHJbDp"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1792344248;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=OubwlsLQAPyr9CVZ2r71r9IpAgVZ9Mz4Fo2cQf0VrI8=;
	b=gEGHJbDp/akEZsd6obNBjXDJDwSJjc71lziGRQ1LRhzqY7aO0CURfNOBLf6OIwp6sry5ci
	xBM3u2C963VGZQt9lUK5jt76aUCSGY6rqEqNeTEftCT+7l3HFOvgqqlrSMw/SnmhYwS+Kp
	b7Qkbn6KAb3dVDMEB0lQioiwavG70ZA=
Received: from mx-prod-mc-05.mail-002.prod.us-west-2.aws.redhat.com
 (ec2-54-186-198-63.us-west-2.compute.amazonaws.com [54.186.198.63]) by
 relay.mimecast.com with ESMTP with STARTTLS (version=TLSv1.3,
 cipher=TLS_AES_256_GCM_SHA384) id us-mta-84-sIvX-ugbP0uHDC-vumpWjQ-1; Sun,
 18 Oct 2026 17:24:05 +0000
X-MC-Unique: sIvX-ugbP0uHDC-vumpWjQ-1
X-Mimecast-MFC-AGG-ID: sIvX-ugbP0uHDC-vumpWjQ_1792344244
Received: from mx-prod-int-10.mail-002.prod.us-west-2.aws.redhat.com (mx-prod-int-10.mail-002.prod.us-west-2.aws.redhat.com [10.30.177.95])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by mx-prod-mc-05.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTPS id 9F14E1955DDA;
	Sun, 18 Oct 2026 17:24:03 +0000 (UTC)
Received: from [100.91.18.181] (headnet04.pony-001.prod.iad2.dc.redhat.com [10.2.32.116])
	by mx-prod-int-10.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTP id BE0D5418;
	Sun, 18 Oct 2026 17:24:02 +0000 (UTC)
Message-ID: <5ce7995a-1f6a-4aa9-9dfa-7c67b952e462@redhat.com>
Date: Sun, 18 Oct 2026 13:24:01 -0400
Precedence: bulk
X-Mailing-List: sashiko-reviews@lists.linux.dev
List-Id: <sashiko-reviews.lists.linux.dev>
List-Subscribe: <mailto:sashiko-reviews+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:sashiko-reviews+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH-next v3 4/9] cgroup/cpuset: Do housekeeping check before
 converting invalid partition to valid
To: sashiko-reviews@lists.linux.dev
Cc: tj@kernel.org, hannes@cmpxchg.org, mkoutny@suse.com
References: <20261014140548.575122-1-longman@redhat.com>
 <20261014140548.575122-5-longman@redhat.com>
 <sashiko-outbox-171409@kernel.org>
From: Waiman Long <longman@redhat.com>
In-Reply-To: <sashiko-outbox-171409@kernel.org>
X-Scanned-By: MIMEDefang 3.6 on 10.30.177.95
X-Mimecast-Spam-Score: 0
X-Mimecast-MFC-PROC-ID: LiCv3RjKvlbRYOJOOVrMqMjfq1Nsn4H3P4ElpNIsWVU_1792344244
X-Mimecast-Originator: redhat.com
Content-Language: en-US
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 10/14/26 10:18 AM, sashiko-bot@kernel.org wrote:
> Thank you for your contribution! Sashiko AI review found 1 potential issue(s) to consider:
> - [High] rcu: UAF in prstate_housekeeping_conflict() due to missing rcu_read_lock()
> --
>
> commit d31e8f03e0e5d616850715cc05487df6df41188b
> Author: Waiman Long <longman@redhat.com>
>
> cgroup/cpuset: Do housekeeping check before converting invalid partition to valid
>
> When a hotplug event happens or when update_cpumasks_hier() is called, an
> invalid partition may be converted back to valid. This patch updates the
> code to allow reviving an invalid partition only if it can pass the
> housekeeping check.
>
>> diff --git a/kernel/cgroup/cpuset.c b/kernel/cgroup/cpuset.c
>> index b2684c98d8c0f..51723c299ca5b 100644
>> --- a/kernel/cgroup/cpuset.c
>> +++ b/kernel/cgroup/cpuset.c
>> @@ -1959,9 +1959,14 @@ static int update_parent_effective_cpumask(struct cpuset *cs, int cmd,
>>   			bool exclusive = true;
>>   
>>   			/*
>> -			 * Convert invalid partition to valid has to
>> -			 * pass the cpu exclusivity test.
>> +			 * Convert invalid partition to valid has to pass the
>> +			 * cpu exclusivity test as well as the housekeeping
>> +			 * check.
>>   			 */
>> +			if (prstate_housekeeping_conflict(cs->partition_root_state, xcpus)) {
> [Severity: High]
> Does this new call to prstate_housekeeping_conflict() read an RCU-protected
> cpumask without holding rcu_read_lock()?

All the cpuset's cpumasks are protected by cpuset_mutex or 
callback_lock, rcu_read_lock isn't need for protection. rcu_read_lock() 
is used here only to protect the iteration of child cgroups which may be 
deleted and freed concurrently. So there is no problem here.

Cheers,
Longman

>
> If an administrator modifies a cpuset partition configuration, it can trigger
> an update to the housekeeping setup. The configuration thread drops
> cpus_read_lock and cpuset_mutex in cpuset_update_sd_hk_unlock() before calling
> housekeeping_update():
>
> kernel/cgroup/cpuset.c:cpuset_update_sd_hk_unlock() {
>      ...
>      mutex_unlock(&cpuset_mutex);
>      cpus_read_unlock();
>      WARN_ON_ONCE(housekeeping_update(isolated_hk_cpus));
> }
>
> If a CPU hotplug event occurs concurrently, the hotplug thread can acquire
> cpus_write_lock and cpuset_mutex, and enter update_parent_effective_cpumask(),
> calling this new prstate_housekeeping_conflict() check.
>
> Meanwhile, housekeeping_update() replaces the RCU-protected
> housekeeping.cpumasks[HK_TYPE_DOMAIN] and frees the old mask after
> synchronize_rcu():
>
> kernel/sched/isolation.c:housekeeping_update() {
>      ...
>      rcu_assign_pointer(housekeeping.cpumasks[HK_TYPE_DOMAIN], trial);
>      synchronize_rcu();
>      ...
>      kfree(old);
> }
>
> Since the hotplug thread does not hold rcu_read_lock() here, synchronize_rcu()
> will not wait for it. This allows the updater thread to free the old mask
> while the hotplug thread is actively reading it via housekeeping_cpumask()
> inside prstate_housekeeping_conflict(). Can this cause a use-after-free
> regression?
>
>> +				part_error = PERR_HKEEPING;
>> +				goto write_error;
>> +			}
>>   			rcu_read_lock();
>>   			cpuset_for_each_child(child, css, parent) {
>>   				if (child == cs)

