Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794987631;
	b=ZWwfuxWCTZB7ZwulKF+1ZvRP9QUjj7j8CL1hwpNi9XvbLa28YfiZQp96/V+aIUhGqZ8I
	 datTkIMssazEaQhPDDF9rgoZJYAvjvRj3FRllbbZ/pXjbtzFJwFD6dntMBUQ5PA5NdAMD
	 pEHEQzBrc7fkDC9gNalpzMsvxNq8gZMzAgAzsDbkABC4kYitsuxZbCKbFRIA+Ii5NgQ4i
	 borwpAX6TZkheMLXMeYAho24lkg98uHy+l/VkArD/0Dlv03Nj7wAqYW7I1ochSlZorgLz
	 22VidROkVGw6FW3ZtB4b8aG7rT7HAF+xtbgHXcnW27WP3W77BF+XqP5nn87yCN+BMtw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794987631;
	h=Received:DKIM-Signature:Received:X-Gm-Message-State:X-Received:
	 MIME-Version:References:In-Reply-To:From:Date:
	 X-Gmail-Original-Message-ID:X-Gm-Features:Message-ID:Subject:To:Cc:
	 Content-Type:Content-Transfer-Encoding;
	bh=+NO7BDo+P4bguxhOf8l6doBU3I12qHv10RKKucCA1O0=;
	b=qv2H9lqivTONe28UdwPUd5eyC+Cdl8wccljyWe+QAXE20B1Wr1R76sqH/+QQcOOk0S4g
	 n5xJeCjda1cLdxvlOCuggUABbgGbOwcjcaAogqppmlWYOoH9U4dBzIreV5qIRwHgebzNB
	 PRGTa9f8kpmWztfL1vS0R92Gq0VThtM6OJ67EQeLWH0KU2vI5hId9FFZt4Vywj4G8WLuJ
	 x8Cxltdmzk52O7KghUeS+b76vkW0qdSAsxZXYJ1h4PPeqL+SYqtx7Z9fKi6F2YT70CTof
	 nb72Rx0KRDBOCd2lF77oAO3nVr3wdItoK2y1yt/4O30Bt5zeJbcanrhzQpZElFlVkdQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b="BVsQQo/B";
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 920F9606A31C
	for <sashiko-reviews@lists.linux.dev>; Wed, 18 Nov 2026 07:40:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=BVsQQo/B
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 2C2A81F00926
	for <sashiko-reviews@lists.linux.dev>; Wed, 18 Nov 2026 07:40:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1794987631;
	bh=+NO7BDo+P4bguxhOf8l6doBU3I12qHv10RKKucCA1O0=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc;
	b=BVsQQo/BOpYlS5nuNpobghJdfS2nQvqJanM8P/SdMM8px83LV194QwEVyng2Rfjsf
	 vSs2PB2CO/umYB8ekgGnyqsYFy9mERoY7pZ6tqAU8IYR0RV5WJCxcWL6RUysGb0Shq
	 mJj0fc/JnKGTqTWihY5oQdwo36yck7J99Eumom8LBSa4O3B5DTAFjtWAZkvv5nzXys
	 nimpCc9wzS1QHpTRUiARxy13Trb6E+GFcDjJlkN00mPU9/PbrAudsyprHfIe+o2I4q
	 cW25PzbqNIkXmjvQEodQybim/XotsvSmA4AT/Sn8xeG13oA2SCearvXgvKB7ued+uG
	 Je4HJPMmH/ojA==
Received: by mail-ed1-f53.google.com with SMTP id 4fb4d7f45d1cf-6b87a240de3so927258a12.1
        for <sashiko-reviews@lists.linux.dev>; Tue, 17 Nov 2026 23:40:31 -0800 (PST)
X-Gm-Message-State: APuU4Z9PxMj7NE+/XUGEvURk9k9Qelw7ztQEUvkm2nFuWHXA6JA0Lcfz
	N76fL94Et5cjfNMJpfarI5puYpxURHaRgq4ygn5T5rCGssIZmNU0kdTv/1pDtDF6YarPbVRNgZz
	cJ11Hxnrbc7v++mkEqCpM9k4K6TjwNf0=
X-Received: by 2002:a05:6402:2707:b0:6b7:ce4a:7d0b with SMTP id
 4fb4d7f45d1cf-6b887e9855amr1039376a12.20.1794987629740; Tue, 17 Nov 2026
 23:40:29 -0800 (PST)
X-Mailing-List: sashiko-reviews@lists.linux.dev
List-Id: <sashiko-reviews.lists.linux.dev>
List-Post: <mailto:sashiko-reviews@lists.linux.dev>
List-Help: <mailto:sashiko-reviews+help@lists.linux.dev>
List-Subscribe: <mailto:sashiko-reviews+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:sashiko-reviews+unsubscribe@lists.linux.dev>
List-Owner: <mailto:sashiko-reviews+owner@lists.linux.dev>
Precedence: list
MIME-Version: 1.0
References: <20261115095503.2922598-1-chenhuacai@loongson.cn> <sashiko-outbox-216668@kernel.org>
In-Reply-To: <sashiko-outbox-216668@kernel.org>
From: Huacai Chen <chenhuacai@kernel.org>
Date: Wed, 18 Nov 2026 15:40:20 +0800
X-Gmail-Original-Message-ID: <CAAhV-H75pFts2FxZTzrJP+T+M3m3AFzF6pqc5WK_fR0=u-PCeg@mail.gmail.com>
X-Gm-Features: AclHuK8Di8CaNXtvY2DxNQUZd0T7YfZm_H-Rw4Q8hcNhOtGVQFiP0BTeRQ8jeuU
Message-ID: <CAAhV-H75pFts2FxZTzrJP+T+M3m3AFzF6pqc5WK_fR0=u-PCeg@mail.gmail.com>
Subject: Re: [PATCH V2] lib/smp_processor_id: Don't warn if there is only one CPU
To: sashiko-reviews@lists.linux.dev
Cc: Huacai Chen <chenhuacai@loongson.cn>, Ingo Molnar <mingo@redhat.com>, 
	Peter Zijlstra <peterz@infradead.org>, Juri Lelli <juri.lelli@redhat.com>, 
	Vincent Guittot <vincent.guittot@linaro.org>, Dietmar Eggemann <dietmar.eggemann@arm.com>, 
	Steven Rostedt <rostedt@goodmis.org>, Ben Segall <bsegall@google.com>, Mel Gorman <mgorman@suse.de>, 
	Andrew Morton <akpm@linux-foundation.org>, linux-mm@kvack.org, 
	Tiezhu Yang <yangtiezhu@loongson.cn>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi, Sashiko,

On Mon, Nov 16, 2026 at 5:55=E2=80=AFPM <sashiko-bot@kernel.org> wrote:
>
> Thank you for your contribution! Sashiko AI review found 2 potential
> issues to consider:
> - [Medium] lib/smp_processor_id: check_preemption_disabled() skips
>   checks on !CONFIG_SMP
> - [Low] lib/smp_processor_id: missing Fixes trailer on stable bug-fix
>   commit
> --
>
> commit 62cd1e08e5d017184a1415887d93a1188fd3f001
> Author: Huacai Chen <chenhuacai@kernel.org>
>
> > lib/smp_processor_id: Don't warn if there is only one CPU
> >
> > When CONFIG_DEBUG_PREEMPT is enabled on a Non-SMP (single-core) kernel,
> > calls to smp_processor_id() in preemptible contexts trigger some false
> > positive "BUG: using smp_processor_id() in preemptible" warnings, which
> > are harmless noise because the process always executes on CPU 0 and CPU
> > migration is impossible.
> >
> > Here are some of the trimmed log messages:
> >
> >   Call Trace:
> >   [<9000000000d33e28>] show_stack+0xf8/0x1c0
> >   [<9000000000d2fdac>] dump_stack_lvl+0x4c/0x78
> >   [<9000000002456fc0>] check_preemption_disabled.isra.0+0x100/0x110
> >   [<9000000002456ff8>] debug_smp_processor_id+0x18/0x40
> >   [<9000000000d31118>] init_cache_level+0x18/0x90
> >   [<9000000001adbe2c>] detect_cache_attributes+0x4c/0x640
> >   [<9000000001adc44c>] cacheinfo_cpu_online+0x1c/0x310
> >   [<9000000000d5ae04>] cpuhp_issue_call.constprop.0+0x94/0xd0
> >   [<9000000000d5b278>] __cpuhp_setup_state_cpuslocked+0x208/0x320
> >   [<9000000000d30148>] do_one_initcall+0x68/0x200
> >   [<90000000024711b8>] kernel_init_freeable+0x1fc/0x294
> >   [<900000000245824c>] kernel_init+0x20/0x134
> >   [<9000000002455b54>] ret_from_kernel_thread+0x24/0x1d0
> >   [<9000000000d31650>] ret_from_kernel_thread_asm+0xc/0x9c
> >
> > This warning only exists for the !CONFIG_SMP build. This is because for
> > CONFIG_SMP cpuhp_issue_call() invokes callbacks in cpuhp_thread_fun()
> > which is a percpu thread, but for !CONFIG_SMP build it invoke callbacks
> > in the init process which is not a percpu thread. And there is such a
> > skip condition in check_preemption_disabled():
> >
> >     if (is_percpu_thread())
> >             goto out;
> >
> > Since there is only one CPU for the !CONFIG_SMP, we can simply skip the
> > warning if (!IS_ENABLED(CONFIG_SMP)) in check_preemption_disabled(). Th=
e
> > effect is partially reverting 570a752b7a9bd03b50 ("lib/smp_processor_id=
:
> > Use is_percpu_thread() instead of nr_cpus_allowed"), because now in the
> > UP case nr_cpus_allowed is 1 but PF_NO_SETAFFINITY is unset.
> >
> > Cc: stable@vger.kernel.org
> > Reported-by: Tiezhu Yang <yangtiezhu@loongson.cn>
> > Signed-off-by: Huacai Chen <chenhuacai@loongson.cn>
>
> [Severity: Low]
> Since this commit is tagged for stable and addresses the !CONFIG_SMP
> behavior changed when is_percpu_thread() stopped unconditionally returnin=
g
> true on UP builds, should it include a Fixes: tag such as:
>
>   Fixes: cac5cefbade9 ("sched/smp: Make SMP unconditional")
>   Fixes: 06ddd17521bf ("sched/smp: Always define is_percpu_thread() and s=
cheduler_ipi()")
>
> > diff --git a/lib/smp_processor_id.c b/lib/smp_processor_id.c
> > index 94b3f6b195388..be079b9085045 100644
> > --- a/lib/smp_processor_id.c
> > +++ b/lib/smp_processor_id.c
> > @@ -22,6 +22,9 @@ unsigned int check_preemption_disabled(const char *wh=
at1, const char *what2)
> >       if (is_percpu_thread())
> >               goto out;
> >
> > +     if (!IS_ENABLED(CONFIG_SMP))
> > +             goto out;
> > +
> >       if (current->migration_disabled)
> >               goto out;
>
> [Severity: Medium]
> As reported by Peter Zijlstra on v1 [1], does returning early on
> !IS_ENABLED(CONFIG_SMP) disable all CONFIG_DEBUG_PREEMPT checks in
> check_preemption_disabled() on UP builds?
As I said, the effect of this patch is partially reverting
570a752b7a9bd03b50 ("lib/smp_processor_id:
Use is_percpu_thread() instead of nr_cpus_allowed").

I think 570a752b7a9bd03b50 is mostly optimising the checking of
CONFIG_SMP, so partially reverting is acceptable?

>
> check_preemption_disabled() also backs __this_cpu_preempt_check(), which
> guards non-atomic __this_cpu_*() read-modify-write operations that can
> still race across same-CPU preemption on a preemptible UP kernel, and
> suppresses warnings for smp_processor_id() callers that would be broken o=
n
> SMP.  Because !IS_ENABLED(CONFIG_SMP) is a compile-time constant, this
> also turns the remainder of check_preemption_disabled(), including the
> current->migration_disabled check made unconditional of CONFIG_SMP by
> 2885daf47081 ("lib/smp_processor_id: Make migration check unconditional o=
f
> SMP"), into dead code on !CONFIG_SMP.
>
> In the reported trace, init_cache_level(unsigned int cpu) in
> arch/loongarch/kernel/cacheinfo.c already receives cpu as an argument but
> reads current_cpu_data via smp_processor_id() instead of cpu_data[cpu],
> while cpuhp_issue_call() invokes the callback directly in preemptible tas=
k
> context on !CONFIG_SMP.
Yes, cacheinfo.c is just an example and can be fixed in other ways,
but that doesn't mean this patch is unnecessary.

Huacai

>
> [1] https://lore.kernel.org/r/20261111170600.GS1779021@noisy.programming.=
kicks-ass.net
>
> --
> Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20261115095503.29=
22598-1-chenhuacai@loongson.cn?part=3D1
