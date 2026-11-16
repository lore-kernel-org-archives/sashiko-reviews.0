Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=170.10.129.124
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794802361;
	b=p0Ha/ryaWEZz0AqmMh6TYcaHNmNgEB9jM4OkOVUWjRu9wziQNlJPU2ZgxHIoM8AfXs/i
	 PdJjan4ypkGLDWdlNs/3zz1X7oLb2t9B/oiNi+OTlTAHcAxqfK2ARjsj+RSoQfP0wbtTZ
	 gWlyQdWuNeEapyUXVsYVsE4auaEshxWopjb5FiMFrfhRS/Lcc4l+KYifiTAgx3yVd36pd
	 jorM+W0fZotxrzRcWFy/z/UMQIW4qjZHIXvvi+k9GUnBDMjNS4JwEBOuqHwPY91SjossR
	 m4lS2P95FNYF6K+Ej4p3NoPsnFPflMQoT+RE9Vv9jnvJkSS36ruJKyFgqJpU9/CM2gQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794802361;
	h=DMARC-Filter:DKIM-Signature:Received:X-MC-Unique:
	 X-Mimecast-MFC-AGG-ID:Received:Received:Message-ID:Date:MIME-Version:
	 User-Agent:Subject:To:Cc:References:From:In-Reply-To:X-Scanned-By:
	 X-Mimecast-Spam-Score:X-Mimecast-MFC-PROC-ID:X-Mimecast-Originator:
	 Content-Language:Content-Type:Content-Transfer-Encoding;
	bh=cIOXJsKkfujK8YqYmSYGtdDO2Zvyg5r7CYxfom7uGLg=;
	b=adpFW2Ftsv5nsEMkYCCDPthYxvRP7idfVJ/28idj0KsEzhxFLhKQ7BgjWUQ8ZVda7OA3
	 KD3A4R1UUKMocNZUCv/Zvf+cMQK16QRQ8t7mQpK6mpoVsn7vK7XCqCqiCpfAZ4DTLlbXQ
	 s0578f1GlLIrAsQl47m5Jjr2BGs1T5RlhZd6xQTAloE+KX/YjaWVVAlXNLpaOcCBXN0xp
	 uIYsrUFOmdBHQeAL7i0HpKvN73jZdFnkbLcSFiUsTICfWrn+GpvXaomIksUmHfPuGnFai
	 KTTA0qvO7RGomprTesZrAir4pOa1crM4qhekiEcqV81tfpf73mOIjUurw3bK61S1kpA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=redhat.com;
	spf=pass smtp.mailfrom=redhat.com;
	dkim=pass header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=mimecast20190719 header.b=HdTmAhTo;
	arc=none smtp.remote-ip=170.10.129.124
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7A695606A88F
	for <sashiko-reviews@lists.linux.dev>; Mon, 16 Nov 2026 04:12:40 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 7A695606A88F
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=mimecast20190719 header.b=HdTmAhTo
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1794802359;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=cIOXJsKkfujK8YqYmSYGtdDO2Zvyg5r7CYxfom7uGLg=;
	b=HdTmAhTo4E4Dfc2no8kW5V3wK56e0GkRD5enTDbF6ARvnJb9Z9oyG6EIcBaeYjb9bVQop1
	AJXLx0bNKvjBW56/1mYf70J9oqchhjAsbkMKot2eCdYx1YXVKlbKeE8hu4bAFgp8Ppz2sY
	tjyBDfy/Cwu7XOjWb/F2/dABklntKHk=
Received: from mx-prod-mc-08.mail-002.prod.us-west-2.aws.redhat.com
 (ec2-35-165-154-97.us-west-2.compute.amazonaws.com [35.165.154.97]) by
 relay.mimecast.com with ESMTP with STARTTLS (version=TLSv1.3,
 cipher=TLS_AES_256_GCM_SHA384) id us-mta-673-vuxP6cZaNCWs9ngZZIjZeQ-1; Sun,
 15 Nov 2026 23:12:37 -0500
X-MC-Unique: vuxP6cZaNCWs9ngZZIjZeQ-1
X-Mimecast-MFC-AGG-ID: vuxP6cZaNCWs9ngZZIjZeQ_1794802356
Received: from mx-prod-int-03.mail-002.prod.us-west-2.aws.redhat.com (mx-prod-int-03.mail-002.prod.us-west-2.aws.redhat.com [10.30.177.12])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by mx-prod-mc-08.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTPS id 213F518004E7;
	Mon, 16 Nov 2026 04:12:36 +0000 (UTC)
Received: from [100.91.18.181] (headnet04.pony-001.prod.iad2.dc.redhat.com [10.2.32.116])
	by mx-prod-int-03.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTP id CF2511956089;
	Mon, 16 Nov 2026 04:12:34 +0000 (UTC)
Message-ID: <18ae65fb-430a-474d-a4d7-016871010488@redhat.com>
Date: Sun, 15 Nov 2026 23:12:33 -0500
X-Mailing-List: sashiko-reviews@lists.linux.dev
List-Id: <sashiko-reviews.lists.linux.dev>
List-Post: <mailto:sashiko-reviews@lists.linux.dev>
List-Help: <mailto:sashiko-reviews+help@lists.linux.dev>
List-Subscribe: <mailto:sashiko-reviews+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:sashiko-reviews+unsubscribe@lists.linux.dev>
List-Owner: <mailto:sashiko-reviews+owner@lists.linux.dev>
Precedence: list
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH-next v4 3/6] cgroup/cpuset: Check remote partition
 underneath before making an invalid partition valid
To: sashiko-reviews@lists.linux.dev
Cc: tj@kernel.org, hannes@cmpxchg.org, mkoutny@suse.com,
 Chen Ridong <chenridong@huaweicloud.com>
References: <20261116012330.2271010-1-longman@redhat.com>
 <20261116012330.2271010-4-longman@redhat.com>
 <sashiko-outbox-216011@kernel.org>
From: Waiman Long <longman@redhat.com>
In-Reply-To: <sashiko-outbox-216011@kernel.org>
X-Scanned-By: MIMEDefang 3.0 on 10.30.177.12
X-Mimecast-Spam-Score: 0
X-Mimecast-MFC-PROC-ID: LCZ_K5p_5Scp084XzeJB3GH4-Sd7PVcJgz07B1MLFpk_1794802356
X-Mimecast-Originator: redhat.com
Content-Language: en-US
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 11/15/26 8:48 PM, sashiko-bot@kernel.org wrote:
> Thank you for your contribution! Sashiko AI review found 1 potential
> issue to consider:
> - [Medium] cgroup/cpuset: newmask check in
>    update_parent_effective_cpumask() misses active remote partition
> --
>
> commit 957838c49c66e004ba9111067a9ab3098b2792cc
> Author: Waiman Long <longman@redhat.com>
>
> cgroup/cpuset: Check remote partition underneath before making an invalid partition valid
>
> This commit checks whether an invalid local partition's effective_xcpus
> overlap subpartitions_cpus before promoting it back to a valid partition
> root, and requires effective_xcpus to be non-empty on transition.
>
> Link: https://sashiko.dev/#/bug/linux-47715b89-d5fb-4731-b7c9-070773c6ff75
>
>> diff --git a/kernel/cgroup/cpuset.c b/kernel/cgroup/cpuset.c
>> index 7e144beae1c8e..8b6dbc8e821e3 100644
>> --- a/kernel/cgroup/cpuset.c
>> +++ b/kernel/cgroup/cpuset.c
>> @@ -2035,11 +2035,7 @@ static int update_parent_effective_cpumask(struct cpuset *cs, int cmd,
>>   		 * tasks_nocpu_error() with this very mask, and a failing
>>   		 * write is routed to partcmd_invalidate instead.
>>   		 */
>> -		if (is_partition_invalid(cs)) {
>> -			adding = false;
>> -			deleting = cpumask_and(tmp->delmask,
>> -					newmask, parent->effective_xcpus);
>> -		} else {
>> +		if (is_partition_valid(cs)) {
>>   			cpumask_andnot(tmp->addmask, cs->effective_xcpus, newmask);
>>   			adding = cpumask_and(tmp->addmask, tmp->addmask,
>>   					     parent->effective_xcpus);
>> @@ -2047,6 +2043,17 @@ static int update_parent_effective_cpumask(struct cpuset *cs, int cmd,
>>   			cpumask_andnot(tmp->delmask, newmask, cs->effective_xcpus);
>>   			deleting = cpumask_and(tmp->delmask, tmp->delmask,
>>   					       parent->effective_xcpus);
>> +		} else {
>> +			deleting = cpumask_and(tmp->delmask,
>> +					newmask, parent->effective_xcpus);
>> +
>> +			/* Check if a remote partition may be underneath */
>> +			if ((parent == &top_cpuset) &&
>> +			    !cpumask_empty(cs->exclusive_cpus) &&
>> +			    cpumask_intersects(tmp->delmask, subpartitions_cpus)) {
>> +				part_error = PERR_REMOTE;
>> +				deleting = false;
>> +			}
>>   		}
> [Severity: Medium]
> Can this check miss an active descendant remote partition when newmask is
> disjoint from cs->effective_xcpus?
>
> In update_exclusive_cpumask(), partition_cpus_change() calls
> update_parent_effective_cpumask() before cs->effective_xcpus is updated and
> before update_cpumasks_hier() updates or invalidates the subtree:
>
> kernel/cgroup/cpuset.c:update_exclusive_cpumask() {
>      ...
> 	partition_cpus_change(cs, trialcs, &tmp);
>
> 	spin_lock_irq(&callback_lock);
> 	cpumask_copy(cs->exclusive_cpus, trialcs->exclusive_cpus);
> 	cpumask_copy(cs->effective_xcpus, trialcs->effective_xcpus);
>      ...
> 	if (is_partition_valid(cs) || force)
> 		update_cpumasks_hier(cs, &tmp, force);
>      ...
> }
>
> At the time of this check, a remote partition underneath cs is still using
> CPUs from cs's old effective_xcpus, not from newmask (tmp->delmask).  For
> example, if child A1 has exclusive_cpus 3-4 and is an invalid partition
> because grandchild A2 is a remote partition using 3-4, writing 1-2 to
> A1/cpuset.cpus.exclusive produces tmp->delmask = 1-2, which does not
> intersect subpartitions_cpus (3-4).
>
> update_parent_effective_cpumask() then promotes A1 to PRS_ROOT while A2 is
> still an active remote partition underneath it.  The subsequent pre-order
> walk in update_cpumasks_hier() visits A1 before A2 and triggers
> WARN_ON_ONCE(is_remote_partition(child)) in
> compute_partition_effective_cpumask() (and if A2's user_xcpus() also
> overlaps 1-2, WARN_ON_ONCE(cpumask_intersects(tmp->addmask,
> subpartitions_cpus)) in remote_cpus_update()).
>
> Checking cpumask_intersects(cs->effective_xcpus, subpartitions_cpus) as
> well when newmask is set would catch a descendant remote partition still
> holding CPUs from cs's old effective_xcpus.

Good point. I will add this additional check in the next version.

Cheers,
Longman

