Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A06A244D00A
	for <sashiko-reviews@lists.linux.dev>; Wed, 27 May 2026 18:25:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.133.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779906313; cv=none; b=V06FJFUbAjjlGWwflRGCf3b0n1EO0S6CzbLHv5bHbU754kDaid3MIhbrFu+ZbCSD9LnOw2S1/1tUuFDlAx8RCRhKSQk3tOn8j4BiVvEVI0ytkL5nOIMKYQ8t/4vJn4bimnzJojiMu86s0UN8EU25HYC8gUHhzQTteLz3Pcz9HWc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779906313; c=relaxed/simple;
	bh=nACNAZKzHWKdP/C3xkJ7DdamEthRGsN1LTn3EZODD6o=;
	h=Message-ID:Date:MIME-Version:Subject:From:To:Cc:References:
	 In-Reply-To:Content-Type; b=goLnb931l0PELOe6nMjhZKKRrP56/w2IZvF8ZThgAiDVt+Ae5Ykj9RWxdifIxMsxNm+w58oT0kNsXrS3P6/fnWtJDqYSkj+6ZmPx0cs1pAcrONtbyGISbtmQZmN8wuDPwrRmQ3DKMvkMS4m3rczFqMWX87Gf5pkXT5mDvwjwYUI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=K6BRa/PV; arc=none smtp.client-ip=170.10.133.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="K6BRa/PV"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1779906311;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=+Aun16JxIR8+VKsF0vWTk7Fe8pfkgQFZ8erSvTIQYTs=;
	b=K6BRa/PVSq/uUij/7tuZxWuY8JwT9ythmTEh6P1uS0m141qMA2AewEvWEBTtUCei3tpkeu
	t8A49wLn8F3zcNK/H0mtCUd3n5V6b+TWr5nGfi1MnjXZUZk4sQ8rKDL0jeNXrIxwaz4LJT
	b3LG2+8m0Va2jLvC7TqNnMH9CwRrd3Y=
Received: from mx-prod-mc-06.mail-002.prod.us-west-2.aws.redhat.com
 (ec2-35-165-154-97.us-west-2.compute.amazonaws.com [35.165.154.97]) by
 relay.mimecast.com with ESMTP with STARTTLS (version=TLSv1.3,
 cipher=TLS_AES_256_GCM_SHA384) id us-mta-272-5yRMEfr5Ng6zIQhryIyS8A-1; Wed,
 27 May 2026 14:25:07 -0400
X-MC-Unique: 5yRMEfr5Ng6zIQhryIyS8A-1
X-Mimecast-MFC-AGG-ID: 5yRMEfr5Ng6zIQhryIyS8A_1779906306
Received: from mx-prod-int-10.mail-002.prod.us-west-2.aws.redhat.com (mx-prod-int-10.mail-002.prod.us-west-2.aws.redhat.com [10.30.177.95])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by mx-prod-mc-06.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTPS id DC98518005B3;
	Wed, 27 May 2026 18:25:05 +0000 (UTC)
Received: from [10.22.81.53] (unknown [10.22.81.53])
	by mx-prod-int-10.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTP id 097BB1688;
	Wed, 27 May 2026 18:25:04 +0000 (UTC)
Message-ID: <253f9efa-6d1f-47c0-bdb7-850a0e9aba4e@redhat.com>
Date: Wed, 27 May 2026 14:25:04 -0400
Precedence: bulk
X-Mailing-List: sashiko-reviews@lists.linux.dev
List-Id: <sashiko-reviews.lists.linux.dev>
List-Subscribe: <mailto:sashiko-reviews+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:sashiko-reviews+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH-next v3 2/5] cgroup/cpuset: Expand the scope of
 cpuset_can_attach_check()
From: Waiman Long <longman@redhat.com>
To: sashiko-reviews@lists.linux.dev
Cc: mkoutny@suse.com, tj@kernel.org, hannes@cmpxchg.org
References: <20260527153800.1557449-3-longman@redhat.com>
 <20260527163318.3B1741F000E9@smtp.kernel.org>
 <3a5cc723-2ce0-4416-a405-a6d159beb7d4@redhat.com>
In-Reply-To: <3a5cc723-2ce0-4416-a405-a6d159beb7d4@redhat.com>
X-Scanned-By: MIMEDefang 3.6 on 10.30.177.95
X-Mimecast-Spam-Score: 0
X-Mimecast-MFC-PROC-ID: quhwt4TErGtEKKqfxEgVrhJ17MqlKK1Q6jgbpoOybZw_1779906306
X-Mimecast-Originator: redhat.com
Content-Language: en-US
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit


On 5/27/26 2:22 PM, Waiman Long wrote:
>> Severity: High]
>> Does caching the attach_cpus_updated and attach_mems_updated flags 
>> during
>> cpuset_can_attach() introduce a Time-Of-Check to Time-Of-Use race 
>> condition?
>>
>> The cgroup migration process separates the can_attach and attach phases,
>> dropping locks like cpuset_mutex between them. If a concurrent update to
>> the destination cpuset's masks (e.g., via a CPU hotplug event or 
>> writing to
>> cpuset.cpus) occurs while the lock is dropped:
>>
>> 1. The destination's effective_cpus are modified, updating tasks already
>> in the cpuset.
>>
>> 2. The migrating task is not yet in the new cpuset's task list, so it 
>> isn't
>> updated.
>>
>> 3. When cpuset_attach() re-acquires cpuset_mutex, it evaluates the stale
>> cached flags instead of rechecking the masks.
>>
>> If the masks were identical during can_attach, the flags remain false,
>> causing cpuset_attach() to take the fast path and entirely skip
>> cpuset_attach_task(). Could this leave the migrating task with its old,
>> incorrect masks, allowing it to escape its designated isolation 
>> boundary?
>
> Yes, it can be a valid concern. One workaround is to check the 
> attach_in_progress flag in the cpuset. If it is set, we just have to 
> clear the corresponding global flag when either the memory nodes or 
> CPUs are changed.

Sorry, I mean to set the flag to indicate there are changes instead of 
clearing it.

-Longman

