Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3938C4218B6
	for <sashiko-reviews@lists.linux.dev>; Thu,  4 Jun 2026 16:20:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.133.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1780590048; cv=none; b=slbn4FiOh82kV/Mpr8k3smVfx+Gz/su/V/st41DkdHHK+8D1GQ17+2voLOJZgTLR0sxiAcwW/0LvSVQvHLr9+rMAy4FhcoXG17CfU08jmzPujJ/tQbo6qh13w4Psr1Byj2uKO1SCLve6TD+fQx8hcAx2Ni/og4/CLi0y7qNxzZE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1780590048; c=relaxed/simple;
	bh=3uKYiMW82q/2JyTIcUnnWtVO/dGVxZXgaW/O/fXe1Jc=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=AfrGacnkyxTrALjTHRUIlicJF6ZS8KMC2rY/Ya3x3JQinXYU0tz8rdO2QDmhnnnWm5ULUNaxD2A9a+dGLVtpm/6N7owlDB7VlfpYcWLA4IRswX4aMzoK3qDVMOTzjCR8BPoJeNYMSw0+6AJAIl+op9KhEbd+P2X5JNOBB27V1z0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=TiYCdMNF; arc=none smtp.client-ip=170.10.133.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="TiYCdMNF"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1780590046;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=PGJscH6CFrhh7QA1wgB+N9HKXzFhlDu3w0J6ZZA1/XU=;
	b=TiYCdMNFqx3icKRIGkCHF7Jb1upWI1giAMmXqAJGuTJBj9KBmuFRdC7Gyunj1YnKGVboiE
	S3tAoR5fKAhWI5QVXmR7GaVmAY5HruyTaUWyH8AlarJOdX7iH8sTkEDVyttTSKYodM5dCx
	qIGq5iF9BG5npog/h5LDyZuayZhILfw=
Received: from mx-prod-mc-08.mail-002.prod.us-west-2.aws.redhat.com
 (ec2-35-165-154-97.us-west-2.compute.amazonaws.com [35.165.154.97]) by
 relay.mimecast.com with ESMTP with STARTTLS (version=TLSv1.3,
 cipher=TLS_AES_256_GCM_SHA384) id us-mta-682-wXqud4VzNPSDPCNhex8_vw-1; Thu,
 04 Jun 2026 12:20:43 -0400
X-MC-Unique: wXqud4VzNPSDPCNhex8_vw-1
X-Mimecast-MFC-AGG-ID: wXqud4VzNPSDPCNhex8_vw_1780590042
Received: from mx-prod-int-05.mail-002.prod.us-west-2.aws.redhat.com (mx-prod-int-05.mail-002.prod.us-west-2.aws.redhat.com [10.30.177.17])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by mx-prod-mc-08.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTPS id 0E4521800370;
	Thu,  4 Jun 2026 16:20:42 +0000 (UTC)
Received: from [10.22.88.175] (unknown [10.22.88.175])
	by mx-prod-int-05.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTP id 283FC195608E;
	Thu,  4 Jun 2026 16:20:40 +0000 (UTC)
Message-ID: <5774d3ca-0065-4666-abef-958b62e0fdf8@redhat.com>
Date: Thu, 4 Jun 2026 12:20:39 -0400
Precedence: bulk
X-Mailing-List: sashiko-reviews@lists.linux.dev
List-Id: <sashiko-reviews.lists.linux.dev>
List-Subscribe: <mailto:sashiko-reviews+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:sashiko-reviews+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH-next v6 6/6] cgroup/cpuset: Support multiple
 source/destination cpusets for cpuset_*attach()
To: sashiko-reviews@lists.linux.dev
Cc: hannes@cmpxchg.org, mkoutny@suse.com, tj@kernel.org
References: <20260604150229.414135-7-longman@redhat.com>
 <20260604152715.99C421F00893@smtp.kernel.org>
From: Waiman Long <longman@redhat.com>
In-Reply-To: <20260604152715.99C421F00893@smtp.kernel.org>
X-Scanned-By: MIMEDefang 3.0 on 10.30.177.17
X-Mimecast-Spam-Score: 0
X-Mimecast-MFC-PROC-ID: ePLvyB3L5tb4zllY6RUn-WJP_lYXRTyBFf49jV5uCzQ_1780590042
X-Mimecast-Originator: redhat.com
Content-Language: en-US
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit


On 6/4/26 11:27 AM, sashiko-bot@kernel.org wrote:
> Thank you for your contribution! Sashiko AI review found 1 potential issue(s) to consider:
> - [High] Unprivileged users can trigger a kernel WARN_ON_ONCE (local DoS) during a valid cgroup migration.
> --
>
> commit 5ed00e2c5b52acfe513b327768730d3015a032f0
> Author: Waiman Long <longman@redhat.com>
> cgroup/cpuset: Support multiple source/destination cpusets for cpuset_*attach()
>
> This commit updates cpuset migration to track multiple source and destination
> cpusets using singly linked lists. It handles many-to-many migrations that can
> occur when moving multithreaded processes across threaded cgroups. Proper
> accounting for deadline tasks is also ensured across multiple cpusets.
>
>> diff --git a/kernel/cgroup/cpuset.c b/kernel/cgroup/cpuset.c
>> --- a/kernel/cgroup/cpuset.c
>> +++ b/kernel/cgroup/cpuset.c
> [ ... ]
>> @@ -3011,6 +3015,23 @@ static int cpuset_can_attach_check(struct cpuset *cs, struct cpuset *oldcs,
>>   	if (!oldcs)
>>   		return 0;
>>   
>> +	/*
>> +	 * The cgroup core shouldn't migrate a task to its original cpuset.
>> +	 * In the unlikely event that it happens, it will be treated as a
>> +	 * destination cpuset only and the attach_conflict flag will be set.
>> +	 */
>> +	if (WARN_ON_ONCE(cs == oldcs))
> [Severity: High]
> Can this WARN_ON_ONCE be triggered by unprivileged users during a valid
> multithreaded process migration?
>
> In cgroup v2, a multithreaded process can be spread across multiple threaded
> cgroups. If the entire process is migrated via cgroup.procs, the migration
> taskset will contain all threads.
>
> If a thread moves between two cgroups that share the same cpuset css (for
> example, if neither explicitly enables the cpuset controller and they share
> an ancestor's cpuset css), its oldcs and newcs will be identical. When
> cpuset_can_attach_check() evaluates this thread, cs will equal oldcs.
>
> If an unprivileged user with cgroup delegation triggers this, wouldn't it
> cause a local DoS on systems with panic_on_warn enabled?

panic_on_warn is for debugging purpose only. It shouldn't be enabled in 
a production system. AFAICS, no further change will be needed.

Cheers,
Longman

>
>> +		attach_conflict = true;
>> +
>> +	if (!cs->attach_node_in_llist) {
>> +		llist_add(&cs->attach_node, &dst_cs_head);
>> +		cs->attach_node_in_llist = true;
>> +	}

