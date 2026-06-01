Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 124D33ACEF3
	for <sashiko-reviews@lists.linux.dev>; Mon,  1 Jun 2026 14:07:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.129.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1780322835; cv=none; b=H+lM45sdeBUaE7cUQkEWHpVcs9D0sjkEvA3JxC8Ya4PBMA2GUqJ6RWjOWazKsjVw+WLJ0/2K+yWGvnIgmB38xqF1t4cvUu9ix2GMBXgpefe3XmbNQLO4s1QFZRS0D4V7liSu/yaAktk1WHDQSbnrWIU4dmeJUYnlBvRDWv+B6F8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1780322835; c=relaxed/simple;
	bh=WyIhjqDOQvxTvaNG+q3X54WuuenV7U0RhqAfrZcmREM=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=two/2VXOnILicQhy2P4DrMpUmQg2uNTuwGVYZ0WKPjDKCcxX/Fipl7tkfGxQc2MePBAaYUMAoIaiadpRYIelIzDibEHtRdeaXEOMdElCKsWiA3yXqrXd3i2rEJ0+WB4LDgC4gRl4e4sb+3vLVU/pmWsiRXVC+iEJgAt1PTC+uXY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=HVtLJzW7; arc=none smtp.client-ip=170.10.129.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="HVtLJzW7"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1780322831;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=TSlPPiVtgHOchnZLyFqF9zM60VjhnFugIydnEddlp50=;
	b=HVtLJzW72GJQFA0/E4OTFmLUwldOqaOgBu57tXFHnX5zXNYo0/ATqrcSvnwAH+qM1tFqPP
	/yf4TAnYzrPKbGF8njN8tK0lsoWbYKIBuV9IMwiRB0QAkC9oAU9ZjGyi1ScLSwxAR8k2jT
	8Hxsau++r50F0X5mOvAkQrkCvwxK/P8=
Received: from mx-prod-mc-01.mail-002.prod.us-west-2.aws.redhat.com
 (ec2-54-186-198-63.us-west-2.compute.amazonaws.com [54.186.198.63]) by
 relay.mimecast.com with ESMTP with STARTTLS (version=TLSv1.3,
 cipher=TLS_AES_256_GCM_SHA384) id us-mta-61-AUGmSKbJOG6J-WMkNk0Hvw-1; Mon,
 01 Jun 2026 10:07:01 -0400
X-MC-Unique: AUGmSKbJOG6J-WMkNk0Hvw-1
X-Mimecast-MFC-AGG-ID: AUGmSKbJOG6J-WMkNk0Hvw_1780322816
Received: from mx-prod-int-10.mail-002.prod.us-west-2.aws.redhat.com (mx-prod-int-10.mail-002.prod.us-west-2.aws.redhat.com [10.30.177.95])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by mx-prod-mc-01.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTPS id 514D7196C435;
	Mon,  1 Jun 2026 14:04:21 +0000 (UTC)
Received: from [10.22.88.124] (unknown [10.22.88.124])
	by mx-prod-int-10.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTP id 618921681;
	Mon,  1 Jun 2026 14:04:20 +0000 (UTC)
Message-ID: <6ca6597e-6ca0-4d10-99a9-cca6ca2b2e1a@redhat.com>
Date: Mon, 1 Jun 2026 10:04:19 -0400
Precedence: bulk
X-Mailing-List: sashiko-reviews@lists.linux.dev
List-Id: <sashiko-reviews.lists.linux.dev>
List-Subscribe: <mailto:sashiko-reviews+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:sashiko-reviews+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH-next v4 1/6] cgroup/cpuset: Fix node inconsistencies
 between cpuset_update_tasks_nodemask() and cpuset_attach()
To: sashiko-reviews@lists.linux.dev
Cc: tj@kernel.org, mkoutny@suse.com, hannes@cmpxchg.org
References: <20260529212108.120506-2-longman@redhat.com>
 <20260529215622.7E3CF1F00893@smtp.kernel.org>
From: Waiman Long <longman@redhat.com>
In-Reply-To: <20260529215622.7E3CF1F00893@smtp.kernel.org>
X-Scanned-By: MIMEDefang 3.6 on 10.30.177.95
X-Mimecast-Spam-Score: 0
X-Mimecast-MFC-PROC-ID: iEXSvK9rsoZmMq716ZGeH1-BfV-EFftD18W5wRCPHwI_1780322816
X-Mimecast-Originator: redhat.com
Content-Language: en-US
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 5/29/26 5:56 PM, sashiko-bot@kernel.org wrote:
> Thank you for your contribution! Sashiko AI review found 1 potential issue(s) to consider:
> - [Medium] Spurious WARN_ON during memory hot-unplug racing with cpuset updates.
> --
>
> commit 050c4ab3304f0ad9eb91a3e6654d7a2dbb7cd92f
> Author: Waiman Long <longman@redhat.com>
>
> cgroup/cpuset: Fix node inconsistencies between cpuset_update_tasks_nodemask() and cpuset_attach()
>
> This commit standardizes memory node mask usage in cpuset updates and attach
> operations to use effective_mems for cgroups v2. It also adds warning checks
> to ensure effective_mems remains a subset of online memory nodes.
>
>> diff --git a/kernel/cgroup/cpuset.c b/kernel/cgroup/cpuset.c
>> index 6bdb68689c245..46c3f3327ac47 100644
>> --- a/kernel/cgroup/cpuset.c
>> +++ b/kernel/cgroup/cpuset.c
> [ ... ]
>
>> @@ -2714,6 +2724,8 @@ static void update_nodemasks_hier(struct cpuset *cs, nodemask_t *new_mems)
>>   
>>   		WARN_ON(!is_in_v2_mode() &&
>>   			!nodes_equal(cp->mems_allowed, cp->effective_mems));
>> +		WARN_ON(cpuset_v2() &&
>> +			!nodes_subset(cp->effective_mems, node_states[N_MEMORY]));
> [Severity: Medium]
> Can this WARN_ON trigger spuriously during a memory hot-unplug event?
>
> When a node is hot-unplugged, the memory hotplug subsystem removes the node
> from node_states[N_MEMORY] before invoking the notifier chain.
>
> If cpuset_track_online_nodes() calls cpuset_handle_hotplug() but is delayed
> waiting for cpuset_mutex, and a concurrent write to cpuset.mems acquires the
> mutex first, wouldn't cp->effective_mems still contain the offlined node
> while node_states[N_MEMORY] does not?
>
> This race condition might cause unexpected panics on systems where
> panic_on_warn is enabled.
>
OK, will remove the WARN_ON() test to avoid problem.

Cheers,
Longman

