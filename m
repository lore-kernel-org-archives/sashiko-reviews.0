Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.221.72
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793791911;
	b=VaXeIMb8BwWiqyha8vXIfMGgNtPflDgeKylO38DVGKuMQKA4Tlqa7jVgc9aD6nRuHFoc
	 f2B4TEzIC0ejx7etL2dppepEUWtCJNjkB/7uARMBEEuO0KG/UqPOoHnsEa1v/oqtYVs9f
	 yQMWLaz8eqgHHxKitJrwZi0W29ZlOMWOyHRtmxvaO1Yagw/lIaJbbxp01LSLKdiyBxHNq
	 yDbKRlBEIqqZzMyjTH0OaAt2laF9UA7ENBQ9Z23mRMJeG5QIjKqEuCuxzP5/GE0/12Dh2
	 Q/JU2NMpE+l/0g90Gj/8iLwhbrtcq2z50KzXRxQ1pbWYQf0SUYN2oX/z0pG2bAqBmkA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793791911;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Gm-Message-State:X-Received:Date:In-Reply-To:Mime-Version:
	 References:X-Mailer:Message-ID:Subject:From:To:Cc:Content-Type;
	bh=EDullTK0A0ojCa1/qPo0kHUFNMNAZsYWgwEQhoyO/jY=;
	b=SXlsHrg5Yj0yKBNNbr6cTral3bvrjNg3kttg1bIdTRXqN+EfJ1mexnb4V0qFR966cDNH
	 Cqk6mExCQjQn2noBKu4gUioV4nHw4Ax9ZjXHJjZJOwXDPu5KIMaTr85S/cjTDYO+w8tPC
	 CRitWA8zqJJZp8K3IHc9+oWpm/TZn5oUtsgy1G2uvxpUfxQb53vBGafazOWhhijow8SFT
	 jEI5+WbyLRNB5PP+DVfCopHf0J+xXTybXRVWqAr6jlMgYhl0hyTdSynL+Aih8hPeUF/z5
	 qDcEdDG/bjeReXlK+XWNqpsn3bCCGo8xD+C2jWR0MP8jV+ko+bns/VbtB87p4lRUKSA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=google.com;
	spf=pass smtp.mailfrom=flex--jpiecuch.bounces.google.com;
	dkim=pass header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20260707 header.b=bgyoKbqE;
	arc=none smtp.remote-ip=209.85.221.72
Received: from mail-wr1-f72.google.com (mail-wr1-f72.google.com [209.85.221.72])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7EFF8606A328
	for <sashiko-reviews@lists.linux.dev>; Wed,  4 Nov 2026 11:31:51 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 7EFF8606A328
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flex--jpiecuch.bounces.google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20260707 header.b=bgyoKbqE
Received: by mail-wr1-f72.google.com with SMTP id ffacd0b85a97d-49034831bb3so353019f8f.1
        for <sashiko-reviews@lists.linux.dev>; Wed, 04 Nov 2026 03:31:51 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20260707; t=1793791910; x=1794396710; darn=lists.linux.dev;
        h=content-type:cc:to:from:subject:message-id:references:mime-version
         :in-reply-to:date:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=EDullTK0A0ojCa1/qPo0kHUFNMNAZsYWgwEQhoyO/jY=;
        b=bgyoKbqE70Dk3brjyBlhv6EFU+W80+In4guteLBGX9QVUjLCbjmltKcRFCsa6ZQN6w
         j0uTpZud8zndDM7QtBkcfjyM/cJ5lASiRjg79d+AKMLbgyzM4UMNrjAo92CGun/vMJJX
         QYi8ydv1dQ5l4POgH61V3m/rzLazrysLrjSEODCOSUDsXi1Dmk/hv5b6bfDab1Icez4B
         d4XdgUMaHCFFPhdqrohVwFUhZxkzX9+vrWw7qC+xXIPi5yxZlygtoy8KaM+Bo88N6KZj
         1l3DeLRFlArIunurbHl78bC+1rQsfpo+XG6rNkXFzqHy3tcdtCR0ISan0X1bslVjND2Y
         Ee8Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793791910; x=1794396710;
        h=content-type:cc:to:from:subject:message-id:references:mime-version
         :in-reply-to:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=EDullTK0A0ojCa1/qPo0kHUFNMNAZsYWgwEQhoyO/jY=;
        b=GWRU5kLeeEf2ciTvJ86PEDgjrq7DU+pvONjzThmFAYc2ZxHRe/Ajr0KZ6xedoLO0xh
         XYtaeviADqvw5ZlEtCsTsx75EOSSvLBFSw8CswRzRkHw0bxMbDxt6YT3aT6D/m0VX8JM
         gIDETtg9U1/Sv6Dz96jY1Vju48VLMVPAE7l+AB+tMGjU2hXl++FDYFEKkWLpxZGWwyLZ
         f77+dMtQ4vZaJbp7TC35uS2TX/+pRMB1qPSWWbScPEmH+DnLrQ4KWyaXjpA3xsavEVdz
         hTkC4oQ73EGa7dV4IRlwDPlEkaY9uM8DpCv3sv8XS3+mgXzBAHEU92rOycEBw9K/J/bX
         m0OA==
X-Gm-Message-State: APuU4Z/+5amJPJUc7w/7s91v4BEKX7q5pBU7XY1OukjmVBgcjpLLybE1
	4ROJ5i7lEPUsr9aBgcO1pV+PNguaaoJ6+O6Z7lREjaGo25viHHk27jUAy6WBqEjjlQVwKgTDm7M
	6pjuDxeDrLIsBjalrH6zHX+L8/MiCUzWLQ7V0IQ0WtPChpZlb4FeFNGPhg9KnJEm1CK6br4dUF1
	eeHa36nfSha7wEVRuFI+Ezn7NI1r6AouSL/+4pM5vVYWEldwDVs0g3eDiinvg=
X-Received: from wmjv14.prod.google.com ([2002:a7b:cb4e:0:b0:4a1:e780:89af])
 (user=jpiecuch job=prod-delivery.src-stubby-dispatcher) by
 2002:a05:600c:870f:b0:4a2:1612:6367 with SMTP id 5b1f17b1804b1-4ac185bcf74mr348235945e9.15.1793791909664;
 Wed, 04 Nov 2026 03:31:49 -0800 (PST)
Date: Wed, 04 Nov 2026 11:31:49 +0000
In-Reply-To: <sashiko-outbox-195908@kernel.org>
X-Mailing-List: sashiko-reviews@lists.linux.dev
List-Id: <sashiko-reviews.lists.linux.dev>
List-Post: <mailto:sashiko-reviews@lists.linux.dev>
List-Help: <mailto:sashiko-reviews+help@lists.linux.dev>
List-Subscribe: <mailto:sashiko-reviews+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:sashiko-reviews+unsubscribe@lists.linux.dev>
List-Owner: <mailto:sashiko-reviews+owner@lists.linux.dev>
Precedence: list
Mime-Version: 1.0
References: <20261103190805.3487350-1-jpiecuch@google.com> <20261103190805.3487350-3-jpiecuch@google.com>
 <sashiko-outbox-195908@kernel.org>
X-Mailer: aerc 0.21.0-0-g5549850facc2
Message-ID: <DMME0YKQQQ4D.PNR5XMBJHUV7@google.com>
Subject: Re: [PATCH 6.18.y 2/2] sched_ext: Fix scx_flush_disable_work() UAF race
From: Kuba Piecuch <jpiecuch@google.com>
To: <sashiko-reviews@lists.linux.dev>, Kuba Piecuch <jpiecuch@google.com>
Cc: <sched-ext@lists.linux.dev>
Content-Type: text/plain; charset="UTF-8"

On Tue Nov 3, 2026 at 7:15 PM UTC, sashiko-bot wrote:
> Thank you for your contribution! Sashiko AI review found 1 potential issue(s) to consider:
> - [Critical] sched_ext: premature return in scx_flush_disable_work() on SCX_EXIT_DONE
> --
>
> commit fe0315a0808b95d01cd45741655ca111deb8afc1
> Author: Cheng-Yang Chou <yphbchou0911@gmail.com>
>
> sched_ext: Fix scx_flush_disable_work() UAF race
>
> This commit updates scx_flush_disable_work() to loop while syncing
> sch->error_irq_work and flushing sch->disable_work until sch->exit_kind
> reaches SCX_EXIT_NONE or SCX_EXIT_DONE. This aims to close a race window
> where bpf_scx_unreg() frees the scheduler before a concurrent scx_vexit()
> queues the disable work.
>
>> diff --git a/kernel/sched/ext.c b/kernel/sched/ext.c
>> index d2460a88fba35..78f15ddc0aa5a 100644
>> --- a/kernel/sched/ext.c
>> +++ b/kernel/sched/ext.c
>> @@ -4217,8 +4217,13 @@ static void scx_disable(struct scx_sched *sch, enum scx_exit_kind kind)
>>   */
>>  static void scx_flush_disable_work(struct scx_sched *sch)
>>  {
>> -	irq_work_sync(&sch->error_irq_work);
>> -	kthread_flush_work(&sch->disable_work);
>> +	int kind;
>> +
>> +	do {
>> +		irq_work_sync(&sch->error_irq_work);
>> +		kthread_flush_work(&sch->disable_work);
>> +		kind = atomic_read(&sch->exit_kind);
>> +	} while (kind != SCX_EXIT_NONE && kind != SCX_EXIT_DONE);
>
> [Severity: Critical]
> Can scx_flush_disable_work() return while sch->disable_work is still
> running if sch->exit_kind transitions to SCX_EXIT_DONE between
> kthread_flush_work() and atomic_read(&sch->exit_kind)?
>
> In scx_disable_workfn(), sch->exit_kind is set to SCX_EXIT_DONE at the
> start of the work function before running scx_root_disable(sch):
>
> kernel/sched/ext.c:scx_disable_workfn() {
> 	...
> 	while (true) {
> 		if (kind == SCX_EXIT_DONE)	/* already disabled? */
> 			return;
> 		WARN_ON_ONCE(kind == SCX_EXIT_NONE);
> 		if (atomic_try_cmpxchg(&sch->exit_kind, &kind, SCX_EXIT_DONE))
> 			break;
> 	}
> 	ei->kind = kind;
> 	ei->reason = scx_exit_reason(ei->kind);
>
> 	scx_root_disable(sch);
> }
>
> If CPU A is in scx_vexit() (or scx_disable()) between scx_claim_exit() and
> queuing the work while CPU B enters bpf_scx_unreg() ->
> scx_flush_disable_work():
>
> 1. On CPU B's first pass, irq_work_sync(&sch->error_irq_work) and
>    kthread_flush_work(&sch->disable_work) return as no-ops because neither
>    work item has been queued yet.
> 2. CPU A then queues sch->error_irq_work (or sch->disable_work), and
>    scx_disable_workfn() starts running on sch->helper, sets sch->exit_kind
>    to SCX_EXIT_DONE, and enters scx_root_disable(sch).
> 3. CPU B executes kind = atomic_read(&sch->exit_kind), observes
>    SCX_EXIT_DONE, and breaks out of the loop without ever having flushed
>    the running sch->disable_work.
>
> Could that allow bpf_scx_unreg() to call kobject_put(&sch->kobj) and return
> to free the BPF struct_ops map while scx_root_disable(sch) and ops.exit()
> are still executing? Would reading sch->exit_kind before syncing and
> flushing (or performing a final kthread_flush_work(&sch->disable_work)
> after the loop) avoid returning before scx_disable_workfn() finishes?

This is an upstream bug, sent a fix for review:
https://lore.kernel.org/all/20261104111449.3984318-1-jpiecuch@google.com/

I will send the fix for 6.18 once it is merged.

I don't think it should block this series. This series reduces the race
window from potentially multi-ms, very easy to reproduce with the right
BPF progs, to a few instructions between the flush and the exit_kind read,
which I failed to reproduce without adding artificial delays in the kernel.

