Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.215.198
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794959438;
	b=1Qb07FkUHHw9BxAXL33wHGMyVQVUVtc76YdAg4dxk2fgS6GXQMGEBB2osfgQO7J/aGd4
	 jvonkLx7Macqay9C2ZGhAczU84V2QHiUN0xYgPUX0y/Kpskfh5NuJTC8ZSecNYBz25MaP
	 it9cM1Nvrjv96lUIi7L60z72rvOwFwrg/WEeZ1Y9r6mJN4Wzq3tvEXwtLcdJudBPJj8VH
	 vuOVg/NNRWgRH/6NTsaCvIf2UA0SeEhBMuLomPRR1SMmvsM4/PqkfDROlTZToqjTTuJ+m
	 69MlwimsstboR781e/HmL+ugL7iPM9+K7xzldM3Hst9uM9WQ7xptUkPZa9TanG/G+6Q==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794959438;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Gm-Message-State:X-Received:Date:In-Reply-To:Mime-Version:
	 References:Message-ID:Subject:From:To:Cc:Content-Type;
	bh=6YCN415HfGSWGfj0hnTG5tobjSWA0w1qx2azX15hpbc=;
	b=za/3cMPRKMR0Ra6SJGc8K7wyhilHZXGLILwDNvcugcxdpMdznWwpxvtHXUDNCs/l3OOz
	 TyBPgywCW8qD5qAlWXTtw6qaCTuRiXtcbwfadMapfN7R3ZqH5eyYHPcK5t0DsQdC0bjYj
	 ExXH129+6SDd9l3lfsvFDa8XQ1pk8Hwp3dH8uiN76wuLbh8uVtqkED0sL+Gh8JdC5YGfc
	 YajNS09XlTArlYS8K5uZkku/EhO+c48NLJjURS9e+ktUES5EZnGD+XaoqXGIWWd3TqYPt
	 Edeovc8oB6ezJCSteZXOdAZSFfT8BRkTfhTlt0viDVYGgZDcs1cQMnSyosb2ij3Bz+Q==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=google.com;
	spf=pass smtp.mailfrom=flex--seanjc.bounces.google.com;
	dkim=pass header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20260707 header.b=kleV4Xm1;
	arc=none smtp.remote-ip=209.85.215.198
Received: from mail-pg1-f198.google.com (mail-pg1-f198.google.com [209.85.215.198])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BFB03606A31C
	for <sashiko-reviews@lists.linux.dev>; Tue, 17 Nov 2026 23:50:37 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org BFB03606A31C
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flex--seanjc.bounces.google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20260707 header.b=kleV4Xm1
Received: by mail-pg1-f198.google.com with SMTP id 41be03b00d2f7-cdd48746a49so246294a12.0
        for <sashiko-reviews@lists.linux.dev>; Tue, 17 Nov 2026 15:50:37 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20260707; t=1794959437; x=1795564237; darn=lists.linux.dev;
        h=content-type:cc:to:from:subject:message-id:references:mime-version
         :in-reply-to:date:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=6YCN415HfGSWGfj0hnTG5tobjSWA0w1qx2azX15hpbc=;
        b=kleV4Xm1ZYvAeTwNzzxUynU1DgQAYagCNlT7o//ivyQaozXv95nHrplu1DbsJ5m7Gu
         6/mippABYTRUjD8qzXwmAtH04RuESD/z5Xa0GbSgkErUNWa3MQ4eYHpFmyeMFNJ2XH6N
         7OQL3i3k9grPOgnMyIY+vJbu+F5/EKbfXM3vMZNRkZnnfrjN5DuYHa0PthLAqg6SLb0o
         bqYESefAWZplgGeosUxCVRvau9DlUmiHoSZ/xQU2oum10KZKZI9pXhzZ9hx8V6hr6ViU
         RJEcO0oegscymqovwQIA+S63iWqfG5E3VlfCxOhKvLMxNo9UPimdoEA78Rd1g07E3Y4C
         16+w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794959437; x=1795564237;
        h=content-type:cc:to:from:subject:message-id:references:mime-version
         :in-reply-to:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=6YCN415HfGSWGfj0hnTG5tobjSWA0w1qx2azX15hpbc=;
        b=g/va2EF4a/SSJnvTWU3MNNQ4EC3jKk0qzd+fTpOUzSxhpkSvktMzg1lgW/ot7uZcGr
         jFKV+wdDwWg0XwygGBCYlai6FNnwQP63fd1z7eM7iycwK1GovS1M7GSRjLZpKsWsGcz5
         JpV347nrZ3AsE5zfOimOuCHoIj50mQAhKsub8xzh4nlDpWisfgbXd5Sl0UBW/yVbFtkL
         AeHnwYdPABLcTJ6NRPZIQOjyV11MPBCzOhCWpgh5VPys0F0AIac5h0R5Q82lljnAz48o
         eJ56sQ5iIsDaOuCkLMvkjSfgalETx+V9Q7v1tq8f3xA/AfGju/9JD83vxMYiyCGYp3nT
         8bOQ==
X-Gm-Message-State: APuU4Z/KZoJHw++PsrPuxmKL2f5iPHcj2rjg+8hTMOlxbFfco/MjR/yA
	uU3Rej3p4mRrJPoFxyMwe6JC5JvFSubHYSBFYnvK+fUC5fuo9hKBNsKGQrlJxgFMU2JlgI1Z9HS
	rsHUdF9L+0xDKHMR/5XmCi0cPT3DIiApBC4TFkhJK8tEN93RefZmpinTw5P+kkuaICpicAiQERK
	vQL0hg//Gte52tT2cwCzZm5WvBS2OK+AY9NNxrBQ8Hq9LlazTW
X-Received: from pgfv11-n1.prod.google.com ([2002:a05:6a02:874b:10b0:cd8:b4f6:1c8f])
 (user=seanjc job=prod-delivery.src-stubby-dispatcher) by 2002:a05:6a21:1493:b0:3e8:b7fd:628f
 with SMTP id adf61e73a8af0-3fe890efb36mr911730637.22.1794959436641; Tue, 17
 Nov 2026 15:50:36 -0800 (PST)
Date: Tue, 17 Nov 2026 15:50:35 -0800
In-Reply-To: <sashiko-outbox-219682@kernel.org>
X-Mailing-List: sashiko-reviews@lists.linux.dev
List-Id: <sashiko-reviews.lists.linux.dev>
List-Post: <mailto:sashiko-reviews@lists.linux.dev>
List-Help: <mailto:sashiko-reviews+help@lists.linux.dev>
List-Subscribe: <mailto:sashiko-reviews+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:sashiko-reviews+unsubscribe@lists.linux.dev>
List-Owner: <mailto:sashiko-reviews+owner@lists.linux.dev>
Precedence: list
Mime-Version: 1.0
References: <20261117205428.3717-1-seanjc@google.com> <sashiko-outbox-219682@kernel.org>
Message-ID: <avzoSx9ukQecCGq-@seanjc-mac.roam.internal>
Subject: Re: [PATCH] KVM: Send reschedule IPIs instead of SMP function calls
 for non-waiting requests
From: Sean Christopherson <seanjc@google.com>
To: sashiko-reviews@lists.linux.dev
Cc: kvm@vger.kernel.org, Oliver Upton <oupton@kernel.org>, Marc Zyngier <maz@kernel.org>
Content-Type: text/plain; charset="us-ascii"

+Oliver and Marc,

FYI on what I think is a pre-existing TLB flush bug (that can affect other
requests as well).

On Tue, Nov 17, 2026, sashiko-bot@kernel.org wrote:
> KVM: Send reschedule IPIs instead of SMP function calls for non-waiting requests
> 
> This commit sends a reschedule IPI to each target vCPU instead of batching
> IPIs via smp_call_function_many() when making non-waiting multi-vCPU
> requests, allowing non-waiting requests to be made with interrupts disabled.

...

> [Severity: High]
> Can a non-waiting request in interrupt context clobber the per-CPU
> cpu_kick_mask of an in-progress waiting request on the same CPU?
> 
> kvm_make_all_cpus_request() and kvm_make_vcpus_request_mask() only disable
> preemption via get_cpu() while building cpu_kick_mask, leaving interrupts
> enabled for waiting requests, and still clear and populate cpu_kick_mask
> even when KVM_REQUEST_WAIT is not set:
> 
> virt/kvm/kvm_main.c:kvm_make_all_cpus_request() {
> 	me = get_cpu();
> 
> 	cpus = this_cpu_cpumask_var_ptr(cpu_kick_mask);
> 	cpumask_clear(cpus);
> 
> 	kvm_for_each_vcpu(i, vcpu, kvm)
> 		kvm_make_vcpu_request(vcpu, req, cpus, me);
> 
> 	called = kvm_kick_many_cpus(cpus, !!(req & KVM_REQUEST_WAIT));
> 	put_cpu();
> ...
> }
> 
> If an interrupt fires mid-loop and makes a non-waiting multi-vCPU request
> (for example on arm64 via irqfd_wakeup() -> kvm_arch_set_irq_inatomic() ->
> ... -> vgic_queue_irq_unlock()):
> 
> kvm_flush_remote_tlbs()
>   kvm_make_all_cpus_request(kvm, KVM_REQ_TLB_FLUSH)
>     cpumask_clear(cpus)
>     kvm_make_vcpu_request(vcpu0, ...)
>       kvm_vcpu_exiting_guest_mode(vcpu0)
>         cmpxchg(&vcpu0->mode, IN_GUEST_MODE, EXITING_GUEST_MODE)
>       __cpumask_set_cpu(vcpu0->cpu, cpus)
>     <hardirq>
>       irqfd_wakeup()
>         ...
>           kvm_make_all_cpus_request(kvm, KVM_REQ_IRQ_PENDING)
>             cpumask_clear(cpus)  <-- wipes vcpu0->cpu from cpu_kick_mask
>             kvm_make_vcpu_request(vcpu0, ...)
>               kvm_request_needs_ipi(vcpu0, ...)  <-- false (EXITING_GUEST_MODE)
>     kvm_kick_many_cpus(cpus, true)  <-- misses vcpu0->cpu
> 
> Because the outer request already transitioned vcpu0->mode from
> IN_GUEST_MODE to EXITING_GUEST_MODE, the nested non-waiting request sees
> mode != IN_GUEST_MODE and neither sends a reschedule IPI nor re-adds
> vcpu0->cpu to cpu_kick_mask.  When the interrupt returns,
> kvm_kick_many_cpus() skips kicking and waiting for vcpu0, so the waiting
> request (such as a remote TLB flush) can complete while vcpu0 is still in
> guest mode or reading shadow page tables.
> 
> Only touching cpu_kick_mask when KVM_REQUEST_WAIT is set (and tracking
> whether any CPU was kicked with a local boolean for the return value)
> would avoid this.

Unless I'm misreading this, clobbering cpu_kick_mask and dropping the kick for
a waiting request is a pre-existing bug.  I'll address this in v2, and make sure
the series is tagged for stable@.
