Received: from mail-qt1-f170.google.com (mail-qt1-f170.google.com [209.85.160.170])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5078A4A206A
	for <sashiko-reviews@lists.linux.dev>; Fri, 11 Sep 2026 17:27:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.160.170
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789147669; cv=none; b=Cgmu5PVHZOd8RP4WBjZZiSS+MYSIIQi9JQwlNhloRZMhC1boH7h7i/JHcezlQE0DRPgHb9FlyElVR0WFTxrfPOogrwmoaDzFPOho+ie5BV8qpmRTW5fxx+Y6N4dmqeY97I2jNcl/utxBQYhBWkGkVHu2D6+FeQq2Zv1o3TNgp+w=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789147669; c=relaxed/simple;
	bh=rnZThFAGnmGU0UQlPMjaym4BCAvWP6M7XNsFuKOmtjA=;
	h=Date:Message-ID:From:To:Cc:Subject:In-Reply-To:References:
	 MIME-Version:Content-Type; b=N+UWproX9bym2U7akq895fNW7LVSXOsAe69nesMGedQjXUUam2hsAFF5XrdvTevaTXjBw0nHp2It15DGWd99sklgAiYclNZFzUwA+jtir6Wz5sBck87XjcphwwWeXedzpDJE0YRG9WQf0IVUj0E1kQBERhnZb74pwoDiyqm3jKo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=toxicpanda.com; spf=pass smtp.mailfrom=toxicpanda.com; dkim=pass (2048-bit key) header.d=toxicpanda.com header.i=@toxicpanda.com header.b=fZ43cCHW; arc=none smtp.client-ip=209.85.160.170
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=toxicpanda.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=toxicpanda.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=toxicpanda.com header.i=@toxicpanda.com header.b="fZ43cCHW"
Received: by mail-qt1-f170.google.com with SMTP id d75a77b69052e-517dc520840so14491571cf.3
        for <sashiko-reviews@lists.linux.dev>; Fri, 11 Sep 2026 10:27:48 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=toxicpanda.com; s=google; t=1789147667; x=1789752467; darn=lists.linux.dev;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:subject:cc:to:from:message-id:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=wpUPEQIS9yTOB1sr1PlCn6Mv7jz37PgyvzgihSoDlVQ=;
        b=fZ43cCHWtl/kEGsWhvPfUf78obsndINr7Ar9RCX3SfzbqA9KOHELnNwG6e25E+3zOu
         hObuax9qXkXPAP4sDsVxfIga4oxnsTJMhF6IZe4w6GMV3P248jnegSU38ZV7kMXZ0sBo
         GzzP1uYPsPMw1UOFIkYHKsH3r2OnFtrKl7snueeAFOu6F1qFfNQy19XwekHLBccIIo2/
         hwnmKZy6FpTBCAndPWloNYIsUnaDPVOvoi/2OfC08liN/RvCsuyN/JWHbU8/iz6MdtIC
         2GflZNLLBubfWZJX+56zkfWRZ2DlVogaJaa4xqzU5A0vpD6kIGK6lqD8twNIxG930OvZ
         Zbsw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1789147667; x=1789752467;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:subject:cc:to:from:message-id:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=wpUPEQIS9yTOB1sr1PlCn6Mv7jz37PgyvzgihSoDlVQ=;
        b=jZXO+jqXBx4GyZUr+pnS9bSvRlakozs8Cdk+h5cMlXUbxp7qFfeDNPaqkdVX3vRUHq
         qj5dXbD5YK9Wwrdpl4tvrhnEUGTbvuRItkh74tE5TKS2QZV2c3iPkYYB1nyZFey2zQ2p
         P7GQXozySH/e8FaHZrocGejV+lMKPlWZr5IjUvfco7hfUK+1IOScGOAtLR725lMAdSiq
         vlUb34GyMvZSkKZXtZibCf7T992hUe2KowR57O+e8rHr4UI1WYaIvn9iWEXNmZVX7pwU
         qD/57kjI0MOi8L5HaYA7E5oq6jmXqxOjUgQBoOQACc+WTN4kiJgPyceHsJBAKWati69Y
         dsqA==
X-Gm-Message-State: AFuF++nBlbiqPupgP7k/8KTYMRN3yLVCOpFwS9v7+uFw/IVsEmE1J5F0
	R/+0VAFzp4u69E7iKOT35beaIeUkaf4nbyj/EM+T9cA4HzksAbWjiYYg3iLsR2FGYx6GjdY00vM
	SJdh0
X-Gm-Gg: AYBFou3bli/RBduIO2sJ9wSSmHvdbrkbmeeCV0viBTSwdPgqIzNZddD1P9h/Jmwi+SL
	mG08YR03jHikw6V8O4hmRFRNn0AWuuZ4GPNy/BF8n+/RumDb4Ep7OnJO+ooau4f7r8YxCgQAXFy
	xx2AnXxh3Dvxn1ANVSYwkR1buFIiQjAJQf2fYaZiCkbdDPVvZowIziDmtx8EcPkLDULxR22DW3m
	tFwnwIUBiAsqeV5lhm+GRRkAVtSGO5K4I/sPJ1DgQZXkER9S4fqRrh+fVfqjSZvXPZ8BQBwRJ2J
	FVBJ+5U1h1p1bLwBbqDIcczefQNbIlkP+64Nv92enTcoCi9aIe8hqc13Ei/dlao+1FxsDx5oC+r
	gguKveKqSf3j6XPaOguQ6PPi8lqxiezjOPXYF8mrQmTiwNHFw/QMQCUjg7Gry+AI4PBqCd8ihST
	n32dkTA54z32FeuTz8RkwzP88IrD7T7Q7zQyGhV4hhuPBq0c0jBPrcIzzF/bsW+EkMk9JrusoZu
	g/L2YTpPAR1d6Zhoezliag9QAnJoqStJS2KylhsobwKFyojg6XDz23i
X-Received: by 2002:a05:622a:1309:b0:530:42e4:effc with SMTP id d75a77b69052e-530c87566f0mr75877761cf.41.1789147666875;
        Fri, 11 Sep 2026 10:27:46 -0700 (PDT)
Received: from toxicpanda.com (ec2-34-228-114-98.compute-1.amazonaws.com. [34.228.114.98])
        by smtp.gmail.com with ESMTPSA id d75a77b69052e-530ca30855csm24883061cf.1.2026.09.11.10.27.39
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 11 Sep 2026 10:27:42 -0700 (PDT)
Date: Fri, 11 Sep 2026 17:27:24 +0000
Message-ID: <59aed05db0d993f69088fba21576792d.josef@toxicpanda.com>
From: Josef Bacik <josef@toxicpanda.com>
To: sashiko-reviews@lists.linux.dev
Cc: linux-trace-kernel@vger.kernel.org, bpf@vger.kernel.org
Subject: Re: [PATCH RFC v2 04/15] kprobes: Let Tasks RCU recognise tasks preempted in an optprobe jump window
In-Reply-To: <20260911142626.ACAED1F000FF@smtp.kernel.org>
References: <20260911-b4-rcu-tasks-preempt-qs-v2-0-eaaa61ed2da4@toxicpanda.com> <20260911-b4-rcu-tasks-preempt-qs-v2-4-eaaa61ed2da4@toxicpanda.com> <20260911142626.ACAED1F000FF@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: sashiko-reviews@lists.linux.dev
List-Id: <sashiko-reviews.lists.linux.dev>
List-Subscribe: <mailto:sashiko-reviews+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:sashiko-reviews+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

On Fri, 11 Sep 2026 14:26:26 +0000, sashiko-bot@kernel.org wrote:
> > +	for (i = 1; i < MAX_OPTIMIZED_LENGTH / sizeof(kprobe_opcode_t); i++)
> > +		if (get_kprobe((kprobe_opcode_t *)addr - i))
>
> [Severity: Medium]
> When kprobe_in_optimized_region() calls get_kprobe(), neither rcu_read_lock()
> nor kprobe_mutex is held (for example, when called from the Tasks RCU GP
> kthread).
>
> get_kprobe() iterates the hash list using:
>
>     hlist_for_each_entry_rcu(p, head, hlist,
>                              lockdep_is_held(&kprobe_mutex)) {
>
> Without explicitly acquiring rcu_read_lock() around get_kprobe(), lockdep
> will complain about suspicious RCU usage, because preempt_disable() (or
> running from a kthread) does not satisfy rcu_read_lock_held() on
> CONFIG_PREEMPT_RCU.

This is not right. The list iterator's check is not rcu_read_lock_held(),
it is

	RCU_LOCKDEP_WARN(!(cond) && !rcu_read_lock_any_held(), ...)

and rcu_read_lock_any_held() ends in "return !preemptible();", so any
caller with preemption or interrupts disabled satisfies it regardless of
PREEMPT_RCU. That is also the actual RCU guarantee since the flavor
consolidation: synchronize_rcu() waits for preempt/irq-disabled regions
on PREEMPT_RCU kernels too, which is what the kprobe free paths rely on
here.

Every caller is in such a region. rcu_tasks_preempt_is_qs() runs from
rcu_note_context_switch() inside __schedule() after local_irq_disable();
the grace-period kthread only evaluates it from the task_call_func()
callback in 14/15, which runs under p->pi_lock taken with irqsave; and
the preempt == false callers (cond_resched_tasks_rcu_qs(),
rcu_softirq_qs()) short-circuit before rcu_tasks_preempt_is_qs() is
evaluated at all. Nothing calls this bare from kthread context.

I also checked it the boring way: PREEMPT_DYNAMIC=y (so PREEMPT_RCU=y),
PROVE_RCU, PROVE_LOCKING, booted preempt=lazy, registering and
unregistering optimized kprobes in a loop while a kthread spins and gets
irq-preempted, which is exactly the path that reaches get_kprobe() with
kprobe_optimizer_waiting set. No lockdep output.

For the tool: when flagging hlist_for_each_entry_rcu() callers, check
against rcu_read_lock_any_held() (the condition __list_check_rcu()
actually uses), not rcu_read_lock_held().

Thanks,

Josef
