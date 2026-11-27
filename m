Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=216.40.44.11
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795818238;
	b=DARx3SIStO/dIWuM8Hrfq7GOpOrYN2ecRxuefAii4jSIfHcKRd5SSrYNfIHl1nVy9pNy
	 8G5EfHJQVa27A2AA8RgVXIdLmSqDAteByO3crxrsLvOpK+ZSgdMvkc8CFeVNW0TKhiHzI
	 jetFYIEsaajSw6eYychtoVjUjGJjgfAixbTYHVF9OqZoCbdyld7Dfg3b+7AO/jfHuiF6f
	 s/jVBPJhay+8tNljP2mYb+fDnGr5mYtoJDQQN4f7ktXFLoOyVD5Y3M3r/QG63ZVnoY+3n
	 fb1qMQAM9YRl19/tg3WDow87SFnFZHaAN1FAoaxh/WFPlGjWdmOBWx6ryidkAjVH2lA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795818238;
	h=DMARC-Filter:Received:Received:Date:From:To:Cc:Subject:Message-ID:
	 In-Reply-To:References:X-Mailer:MIME-Version:Content-Type:
	 Content-Transfer-Encoding:X-Stat-Signature:X-Spam-Status:
	 X-Rspamd-Server:X-Rspamd-Queue-Id:X-Session-Marker:X-Session-ID:
	 DKIM-Signature:X-HE-Tag:X-HE-Meta;
	bh=LRfx/JcoqFaO5Ppd30ThNt04tsamCjeBJd0+64Rvs0E=;
	b=AAE22D63sM+WW+/SEPTrr2h1BBIzAw4AyS8U2VZAZNil8kNu5xZLEhVWwDZ5R4eC2pZo
	 5n4sqORv/LYr0WJurx+aXE2KZd8C7CmDwJLZwJA28Yi5Zxl+xQ/DZzVXsouf9it5RIKxI
	 Uo/cQVG5MinEO4oXJtoLNJfOzrBfNRqnhtSrVHhVTcafLf/Zy6H6G45g4bIxjfRD3JLsg
	 2FLo38QFSUI1pydUmnoA/Ac7sUVzS66vYYH3ocXu8VYtnQ9LEVj7POAxrrjzmscP8YIWz
	 4XQK+eMKTZhZIIp81DOavAFy8s1o7FQNEB0I+OZ8YwpqUeMQXIvV4atGfTwnioIk7xw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=goodmis.org;
	spf=pass smtp.mailfrom=goodmis.org;
	dkim=pass header.d=goodmis.org header.i=@goodmis.org header.a=rsa-sha256 header.s=dkim1 header.b=h6qA04GR;
	arc=none smtp.remote-ip=216.40.44.11
Received: from relay.hostedemail.com (smtprelay0011.hostedemail.com [216.40.44.11])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1A252606A31C
	for <sashiko-reviews@lists.linux.dev>; Fri, 27 Nov 2026 22:23:56 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 1A252606A31C
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=goodmis.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=goodmis.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=goodmis.org header.i=@goodmis.org header.a=rsa-sha256 header.s=dkim1 header.b=h6qA04GR
Received: from omf16.hostedemail.com (lb01a-stub [10.200.18.249])
	by unirelay07.hostedemail.com (Postfix) with ESMTP id 61E8B160514;
	Fri, 27 Nov 2026 22:23:55 +0000 (UTC)
Received: from [HIDDEN] (Authenticated sender: rostedt@goodmis.org) by omf16.hostedemail.com (Postfix) with ESMTPA id 959642000E;
	Fri, 27 Nov 2026 22:23:53 +0000 (UTC)
Date: Fri, 27 Nov 2026 17:23:52 -0500
From: Steven Rostedt <rostedt@goodmis.org>
To: sashiko-bot@kernel.org
Cc: sashiko-reviews@lists.linux.dev, "Linux Trace Kernel"
 <linux-trace-kernel@vger.kernel.org>, Frederic Weisbecker
 <fweisbec@gmail.com>, Peter Zijlstra <peterz@infradead.org>, Ingo Molnar
 <mingo@kernel.org>, Thomas Gleixner <tglx@linutronix.de>
Subject: Re: [PATCH] sched/isolation: Have housekeeping_any_cpu() use
 raw_smp_processor_id()
Message-ID: <20261127172352.4e3ef0f6@gandalf.local.home>
In-Reply-To: <sashiko-outbox-238322@kernel.org>
References: <20261127171034.60e9de0c@gandalf.local.home>
	<sashiko-outbox-238322@kernel.org>
X-Mailer: Claws Mail 3.20.0git84 (GTK+ 2.24.33; x86_64-pc-linux-gnu)
X-Mailing-List: sashiko-reviews@lists.linux.dev
List-Id: <sashiko-reviews.lists.linux.dev>
List-Post: <mailto:sashiko-reviews@lists.linux.dev>
List-Help: <mailto:sashiko-reviews+help@lists.linux.dev>
List-Subscribe: <mailto:sashiko-reviews+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:sashiko-reviews+unsubscribe@lists.linux.dev>
List-Owner: <mailto:sashiko-reviews+owner@lists.linux.dev>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
X-Stat-Signature: 3gmdinh9zzj9ab4mo6dyz5wjybdx9xqw
X-Rspamd-Server: rspamout01
X-Rspamd-Queue-Id: 959642000E
X-Session-Marker: 726F737465647440676F6F646D69732E6F7267
X-Session-ID: U2FsdGVkX19RPYJBriqYw0KBc1tSXdGknY+f2gOp8JE=
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=goodmis.org; h=date:from:to:cc:subject:message-id:in-reply-to:references:mime-version:content-type:content-transfer-encoding; s=dkim1; bh=LRfx/JcoqFaO5Ppd30ThNt04tsamCjeBJd0+64Rvs0E=; b=h6qA04GRVDfYvLOoZm8a7DYy9Jj0K7lNbTwAuksnpQa99qewl3z6xPa+nxbNhBdE534/JcwXc/bscQgUDNYAf8z0cSVmpfs4LZmLfThn1y4pcD/kAFiC35Indc1t028wyS7AmQbywlNnn5RmmanJ4/LS/paVh1lrYMw0sTfBqz4=
X-HE-Tag: 1795818233-662817
X-HE-Meta: U2FsdGVkX1+hSZf+t+bZxSkmbSYWWLpNedtNfndZcP1G2OrMFHiWu7xjVQL3LXKegdJaPGay59nDtPumZKsbyMXtr30CwPuCNTmRHG+/O0fcUtEIjSxaowkykA5+Jh+iZTG/1udkSihACHKGIr9esP1uNh2q9U1qjIwcORRJ1uIhUbWy3lD3/JMUJQyOdg7hlwKfeNaLEV2b9tnLhaCLE5yEg55dengj8WUwenERXhYWYD1BFw6LIWXnX0SCrduvdk+QcNDylFauRv8AhiR6fcomeEjpXoM57Zu0KIX3NWXcQzUWR4D+FgpzPmVf84C7XONbSPm8k0zVda6HP7Amzs1KEQqOzk3A+ycMsXQ0OvxcXmDmYL17lbGjKKpo/eNIOqdqkUslqj3cjTh/f/KXsw==

On Fri, 27 Nov 2026 22:16:58 +0000
sashiko-bot@kernel.org wrote:

> Thank you for your contribution! Sashiko AI review found 1 potential
> issue to consider:
> - [Medium] sched/isolation: housekeeping_any_cpu() still warns in
>   preemptible context
> --
> 
> commit c1392718dea3b288dab2eb1637739fbba4e0fc9a
> Author: Steven Rostedt <rostedt@goodmis.org>
> 
> sched/isolation: Have housekeeping_any_cpu() use raw_smp_processor_id()
> 
> This commit replaces smp_processor_id() with raw_smp_processor_id() in
>  the housekeeping_any_cpu() fallback returns so that callers in preemptible
> context do not trigger preemption warnings when isolation is not enabled.
> 
> > diff --git a/kernel/sched/isolation.c b/kernel/sched/isolation.c
> > index 156025ef81b75..c1c84d72c7c5b 100644
> > --- a/kernel/sched/isolation.c
> > +++ b/kernel/sched/isolation.c
> > @@ -99,7 +99,7 @@ int housekeeping_any_cpu(enum hk_type type)
> >  				     type != HK_TYPE_TIMER);
> >  		}
> >  	}
> > -	return smp_processor_id();
> > +	return raw_smp_processor_id();
> >  }
> >  EXPORT_SYMBOL_GPL(housekeeping_any_cpu);  
> 
> [Severity: Medium]
> Can housekeeping_any_cpu() still trigger CONFIG_DEBUG_PREEMPT warnings when
> called from a preemptible context with CPU isolation enabled?
> 
> When housekeeping_overridden is active and housekeeping.flags has the
> requested type set, housekeeping_any_cpu() takes the branch above this
> fallback:
> 
> kernel/sched/isolation.c:housekeeping_any_cpu() {
> 	if (static_branch_unlikely(&housekeeping_overridden)) {
> 		if (housekeeping.flags & BIT(type)) {
> 			cpu = sched_numa_find_closest(housekeeping_cpumask(type), smp_processor_id());
> 			if (cpu < nr_cpu_ids)
> 				return cpu;
> 
> 			cpu = cpumask_any_and_distribute(housekeeping_cpumask(type), cpu_online_mask);
> }
> 
> That path still passes smp_processor_id() to sched_numa_find_closest(), and
> both sched_numa_find_closest() (under rcu_read_lock(), which remains
> preemptible on CONFIG_PREEMPT_RCU kernels) and the fallback call
> cpumask_any_and_distribute(), which uses __this_cpu_read() and
> __this_cpu_write() on distribute_cpu_mask_prev.  A preemptible caller such
> as ring_buffer_poll_remote() -> rb_wakeups() -> rb_irq_work_queue() on a
> system booted with nohz_full= will therefore still hit smp_processor_id()
> and __this_cpu_read() preemption splats.
> 

Hmm, I wonder if we should add a preempt_disable() to the above in case
that needs to keep on the same CPU for that logic.

I still do not see the point of having this function in general have to be
called with preemption disabled.

-- Steve


