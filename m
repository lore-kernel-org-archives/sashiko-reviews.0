Received: from mail-qv2-f12.google.com (mail-qv2-f12.google.com [74.125.230.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7906D2F8E85
	for <sashiko-reviews@lists.linux.dev>; Thu, 10 Sep 2026 22:46:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.230.140
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789080398; cv=none; b=ge+MBoJv6IOIi3C1ehXi6DLoa5RXt1ecuJNlw35Yqo+GYWSi+Fl2ObQWRsUgQzsk4/YOvzqKCckPeby8fyVGkNO8GHTDpRcQRkYPy+N5Qlx993gS5wJRQyO3gW8pq0KK3LcNd4LfLllCciQhYfcmcuHRiLq7S7p/n01HHhId2MU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789080398; c=relaxed/simple;
	bh=ynCI/y/51uEFtd4eF9mNj+hjNua2qcuVle6fTFrVs0E=;
	h=Date:Message-ID:From:To:Cc:Subject:In-Reply-To:References:
	 MIME-Version:Content-Type; b=WnV70UKAlDPV58PRLLpFYeegyaJijPr4BNeV87cxK8GdYxErMWnetfrh0kh8+r1ysOy8EPH8dqddJHJJL1otEXWfdUrR3+dUuCIwboMVsYhO/95Yh8hKpWL+dL7Rf2oW8TDNjC1lVlVMCu1CM5/WNQU/9vOaX78FGpcfs99IE7U=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=toxicpanda.com; spf=pass smtp.mailfrom=toxicpanda.com; dkim=pass (2048-bit key) header.d=toxicpanda.com header.i=@toxicpanda.com header.b=Q79vaLj9; arc=none smtp.client-ip=74.125.230.140
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=toxicpanda.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=toxicpanda.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=toxicpanda.com header.i=@toxicpanda.com header.b="Q79vaLj9"
Received: by mail-qv2-f12.google.com with SMTP id 6a1803df08f44-90cdfc6db0aso2711276d6.1
        for <sashiko-reviews@lists.linux.dev>; Thu, 10 Sep 2026 15:46:36 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=toxicpanda.com; s=google; t=1789080395; x=1789685195; darn=lists.linux.dev;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:subject:cc:to:from:message-id:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=XqjtsfF+woxPYCjyMdM+nWfj1EgLZP8UiechELtO6rQ=;
        b=Q79vaLj9qqKDkawCB1E0OATMNk/uVekBPo8AepQXKTc1yHwneQFp+2hsSR2/IPM3pA
         /N+Bmfi/uBIBlfqG7wo7Ci0d87gbjxFaQ+u0v/D7esbG9EiRc/gvhMNZpCUZXsnSUard
         K1yMYowTkKCy934CEuY4dYS+SLYrkH5++gDYhFn2aN/BERMCj7KK68BH6Aye7iDkDvka
         /9uh1MGaaCUiGYHu6BL74hJC5mOFP9i9UG/lxIIou/l8pVCc7nDN4f/RiL4dTFtKNwJa
         fM4TKGXKRO2hCgTXcBYaSQCjVcYfFFeGsQunszwVPV2vipMi/lc9GFtmIZibKCWBepbt
         eBJg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1789080395; x=1789685195;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:subject:cc:to:from:message-id:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=XqjtsfF+woxPYCjyMdM+nWfj1EgLZP8UiechELtO6rQ=;
        b=OVMzjU6NST/Vt1GGTn5iq9pGztu7r/f7mKBrxL+8XqcyJDxivp+uV+p8cpkllcaqka
         JlvyaHoAFycSUKvm7Fgqye/uig6KEghJyIb46TSqao9FIch57X1qIfzE9Fp/gGZoAC78
         HeXie9doT/GiAKjTNPTu7/B4WJ2+K3hQVxRbFH9ut7SbH9OEuwRYxb4+iz7VHeV0NeIE
         89Z8oExGDbjscKq1AGAvZS239yAVslm95u6z7nE2h0BzjeHtYaEcv1de5h2+ym0opTVT
         LMhPPfcmLjdFR5aH0mK2CX6Y/CbfJ18U6TtaVyRAUnMdMYDht8P7qam/bqhrvA0uEeqd
         8Zvw==
X-Gm-Message-State: AFuF++nh+u9Um2xgAFwcIivwKG9B5xsdE9JSLzR+IkSBHvcSAU4bziu4
	wupv9nRkuq4yxIiIeU3z/GB+9VrIXSqOHvV3kDbqBhAoU+U5bupTUZcOZou9ytHs3f3zQvwZCyl
	TxhwD
X-Gm-Gg: AYBFou0lotD+kPnDKdX44xxUM+quQ8z0EWebihxRVcWoAnWG7sQ1BYJlLApjssuiiZJ
	DIjjXHkcU5D//NBiol9Vai+qnvd56tfrnE6OCJ3QkVQQT2Y0/p3KMMvNBk3hXZ6p2TbuJvO4adl
	WZOrUb55fsW+DrNxqSMH86bg8y8odIzUfw8Q/WYsfd0DTqP8WkitG34tX3mm+5/z2gS40sGQC4T
	3+lwOKsJ4Kmol5x42B3YsFS193cNm0/6zq0N09SRVFyH+NfXk2x91fv8Jb5HBgX9XXa9XwMPb+y
	hcHMEZnbfQH3cPl8Y7y+Q8dqBS9VFpUL2+upHoaDlnZiS4908FCWV9TZKBCjp5v7lMgVulsxwpR
	QPsM2D5cuRkeCsDDug3Ch30RwnOl9oYVeAznQD+BYA1jEJ34uiHL/gZ96BcOFqXNXLj0FFvtKv4
	gOYSlsOvDLjKBPWP63YSGbxcU1Cgf9/z8+9Fw0iCcLS1Nj+RjRB+JZubL7zN8VL0IglpwA+aK84
	32Zr7taCmsOyLfa90E2iAEKDZdDJbkFNcrecVqnweN8wEkOOIHRSfCP
X-Received: by 2002:a05:6214:3d87:b0:8f3:cf36:15ca with SMTP id 6a1803df08f44-912120871ccmr20208526d6.9.1789080395108;
        Thu, 10 Sep 2026 15:46:35 -0700 (PDT)
Received: from toxicpanda.com (ec2-34-228-114-98.compute-1.amazonaws.com. [34.228.114.98])
        by smtp.gmail.com with ESMTPSA id 6a1803df08f44-9120f45cb06sm6765616d6.11.2026.09.10.15.46.33
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 10 Sep 2026 15:46:34 -0700 (PDT)
Date: Thu, 10 Sep 2026 22:46:23 +0000
Message-ID: <b0a38578ec1e1cbf26b190087e7faa79.josef@toxicpanda.com>
From: Josef Bacik <josef@toxicpanda.com>
To: sashiko-reviews@lists.linux.dev
Cc: linux-trace-kernel@vger.kernel.org, bpf@vger.kernel.org
Subject: Re: [PATCH RFC 04/13] kprobes: Let Tasks RCU recognise tasks preempted in an optprobe jump window
In-Reply-To: <20260910191634.5D7C21F00893@smtp.kernel.org>
References: <20260910-b4-rcu-tasks-preempt-qs-v1-0-d4469f4cc101@toxicpanda.com> <20260910-b4-rcu-tasks-preempt-qs-v1-4-d4469f4cc101@toxicpanda.com> <20260910191634.5D7C21F00893@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: sashiko-reviews@lists.linux.dev
List-Id: <sashiko-reviews.lists.linux.dev>
List-Subscribe: <mailto:sashiko-reviews+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:sashiko-reviews+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

On Thu, 10 Sep 2026 19:16:33 +0000, sashiko-bot@kernel.org wrote:
> > +bool kprobe_in_optimized_region(unsigned long addr)
> > +{
> > +	int i;
> > +
> > +	for (i = 1; i < MAX_OPTIMIZED_LENGTH / sizeof(kprobe_opcode_t); i++)
> > +		if (get_kprobe((kprobe_opcode_t *)addr - i))
>
> [Severity: High]
> Could this loop introduce significant overhead in the preemption fast-path?
>
> On architectures like x86, this loop executes up to 18 times, querying the
> kprobe hash table via get_kprobe() on each iteration. Since the hash table
> can have long chains on systems with many active kprobes, this could result
> in thousands of pointer dereferences during a preemption event.

This one is fair. It is not the scheduler fast path in general, only the
irq-exit preemption path (need_resched set on return to kernel with
preempt_count() == 0), but 18 hash lookups there is still more than it
needs to be. For v2 the walk only runs while kprobe_optimizer() is
actually sitting in its synchronize_rcu_tasks() -- a flag set and cleared
around that call -- and rcu_tasks_ip_in_trampoline() only asks for core
and module text. A preemption that does not see the flag predates the
grace period; the task is then just an ordinary preempted holdout and the
jump is not written until it has run again and left the window, so
skipping the walk there is safe. Common-case cost becomes one load.

> Also, does this introduce a use-after-free risk for interrupted idle tasks?
>
> kprobe_optimizer() unlinks kprobes and frees them after waiting only for
> synchronize_rcu_tasks(). Because synchronize_rcu_tasks() explicitly ignores
> idle tasks, an idle CPU that is interrupted could end up traversing the
> kprobe_table here via get_kprobe() while the kprobe is concurrently freed,
> as Tasks RCU will not wait for the idle task's traversal to finish.

This one is not right, for two independent reasons:

 - kprobe_table is an RCU hlist and nothing frees a kprobe on the
   strength of Tasks RCU alone. Every unregistration path does
   hlist_del_rcu() and then synchronize_rcu() before the object goes
   away, and the optimizer's own free step runs after a Tasks RCU grace
   period, which begins and ends with synchronize_rcu(). The caller here
   runs with interrupts disabled, which is a normal RCU read-side section,
   so the walk cannot outlive the object regardless of what Tasks RCU
   thinks of the task.

 - The idle case cannot reach this code. irqentry_exit_to_kernel_mode_preempt()
   returns early when state.exit_rcu is set, i.e. when the interrupt was
   taken with RCU not watching, so the irq-exit preemption path (and this
   check with it) only ever runs with RCU watching. And the idle task is
   not preempted through this path in the first place.

So: overhead finding valid and addressed in v2, UAF finding invalid. The
commit message in v2 spells out the RCU-safety argument so the next
reader does not have to reconstruct it.

Thanks,

Josef
