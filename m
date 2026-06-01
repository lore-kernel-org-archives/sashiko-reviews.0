Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CB1DF3D9DAD
	for <sashiko-reviews@lists.linux.dev>; Mon,  1 Jun 2026 15:15:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.133.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1780326908; cv=none; b=qRrfsL8WN1qnZmcazPYbuKPdO6EaEx3cR8ZCO3FWr2YUXOKTCByZndbYfvkLDhIUZsyQSCgols8bUT4IZmR8ZJEjm2nRv/5yJpg3eh9r6c2usByf3yOPTHe5e0kChkcE+0bSokV0lhnwfFT2KZCH5acJVS+gIuS85N4PqSonN2I=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1780326908; c=relaxed/simple;
	bh=0JyPodciH5M2HxJKiYabqrXIlZN+comeGRfjPiSYr7I=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=F/pO9cSpmqcQzHQYxm+0SDCGbdm0sOxlNiqtePrHhPRW+F225yIW14buiiXxp3QX/SQYjZAFRArVWe167+OOc2JAeWJuDiVYHamC7UFsHFxZxMzdFVyDEt+WywchZh8GAZRnNw7YHiVaWgJ2YzG3WIQ+zy9IFaV/F2KYSZT193w=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=JBaD1DZw; arc=none smtp.client-ip=170.10.133.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="JBaD1DZw"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1780326901;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=bjZcoIFPN0+Dn/35pfdRPXHMh/yA/R1Rl6r83lk15Ak=;
	b=JBaD1DZwiM8JhQgzT5JFUMysknR42DZyIYsDq3D1v8URK3I+vKlfTuzD5vTTj3vBT74N1B
	Qk9h+xGg50sm8YzOvqwHhnrlqwPqF+5pNQeHvs9QfywB7B0/N63qksgmlnVnp+guIa0ysT
	VyJF3lSsu3bWDOc3WzGJjiZn3dnjHpg=
Received: from mx-prod-mc-05.mail-002.prod.us-west-2.aws.redhat.com
 (ec2-54-186-198-63.us-west-2.compute.amazonaws.com [54.186.198.63]) by
 relay.mimecast.com with ESMTP with STARTTLS (version=TLSv1.3,
 cipher=TLS_AES_256_GCM_SHA384) id us-mta-112-rm_rKPqCOMKBicbS_e6W5g-1; Mon,
 01 Jun 2026 11:13:45 -0400
X-MC-Unique: rm_rKPqCOMKBicbS_e6W5g-1
X-Mimecast-MFC-AGG-ID: rm_rKPqCOMKBicbS_e6W5g_1780326824
Received: from mx-prod-int-06.mail-002.prod.us-west-2.aws.redhat.com (mx-prod-int-06.mail-002.prod.us-west-2.aws.redhat.com [10.30.177.93])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by mx-prod-mc-05.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTPS id B858F195608F;
	Mon,  1 Jun 2026 15:13:43 +0000 (UTC)
Received: from [10.22.88.124] (unknown [10.22.88.124])
	by mx-prod-int-06.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTP id A114B18004A3;
	Mon,  1 Jun 2026 15:13:42 +0000 (UTC)
Message-ID: <61dbdb09-1ac3-469a-8e69-4f373368b09a@redhat.com>
Date: Mon, 1 Jun 2026 11:13:41 -0400
Precedence: bulk
X-Mailing-List: sashiko-reviews@lists.linux.dev
List-Id: <sashiko-reviews.lists.linux.dev>
List-Subscribe: <mailto:sashiko-reviews+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:sashiko-reviews+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH-next v4 1/6] cgroup/cpuset: Fix node inconsistencies
 between cpuset_update_tasks_nodemask() and cpuset_attach()
To: =?UTF-8?Q?Michal_Koutn=C3=BD?= <mkoutny@suse.com>
Cc: sashiko-reviews@lists.linux.dev, tj@kernel.org, hannes@cmpxchg.org
References: <20260529212108.120506-2-longman@redhat.com>
 <20260529215622.7E3CF1F00893@smtp.kernel.org>
 <6ca6597e-6ca0-4d10-99a9-cca6ca2b2e1a@redhat.com>
 <ah2b4mpnSLNV0j05@localhost.localdomain>
From: Waiman Long <longman@redhat.com>
In-Reply-To: <ah2b4mpnSLNV0j05@localhost.localdomain>
X-Scanned-By: MIMEDefang 3.4.1 on 10.30.177.93
X-Mimecast-Spam-Score: 0
X-Mimecast-MFC-PROC-ID: TuNjSOzaP-BPmpbIyy7MDgDdVal5o9RRjSbaRh7cnIU_1780326824
X-Mimecast-Originator: redhat.com
Content-Language: en-US
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit

On 6/1/26 11:05 AM, Michal Koutný wrote:
> Hi.
>
> On Mon, Jun 01, 2026 at 10:04:19AM -0400, Waiman Long <longman@redhat.com> wrote:
>>> When a node is hot-unplugged, the memory hotplug subsystem removes the node
>>> from node_states[N_MEMORY] before invoking the notifier chain.
> O.K.
>
>>> If cpuset_track_online_nodes() calls cpuset_handle_hotplug() but is delayed
>>> waiting for cpuset_mutex, and a concurrent write to cpuset.mems acquires the
>>> mutex first, wouldn't cp->effective_mems still contain the offlined node
>>> while node_states[N_MEMORY] does not?
> Not sure this condition could happen -- rewriting cpuset's
> effective_mems to a value containing an offlined node.
>
>>> This race condition might cause unexpected panics on systems where
>>> panic_on_warn is enabled.
> That AI reasoning is disputable -- with panic_on_warn=1 one kind of
> _expects_ panics.
> The warning upon a privileged action (memory hotplug) is IMO justified
> (and helpful for potential troubleshooting).
>
> The question is whether the warning bears any information and what could
> go wrong when the predicate is violated.
> Here I see the warning is right before cpuset_update_tasks_nodemask() so
> the invalid value may write through to tasks (only assuming the race is
> real) -- the warning may be useful.
>
>
>> OK, will remove the WARN_ON() test to avoid problem.
> IOW, if you thought the warning was useful (IMO it's not clear cut),
> question that reasoning.

The warning is added so as to confirm that that all the nodes specified 
in effective_mems in v2 are online and effective_mems should be 
equivalent to the values returned by guarantee_online_mems(). As Sashiko 
has described, there is a corner case where the warning may get 
triggered even though the use of effective_mems in v2 should still be 
OK. I think it will be easier to just remove the WARN_ON() call instead 
of adding code to check if a hotplug operation has just happened.

Cheers,
Longman

