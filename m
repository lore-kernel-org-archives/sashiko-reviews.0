Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.215.199
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794353660;
	b=t/4XpHjoTZn6jA32etyzHDgytthYagwle0uZT+qC+Y1BTsR6LAtLpBtrCVRAnEegSlA1
	 l7RMRl8Ruc/XmgFKD1+X0JiUw1wONQ+16DQmLYQAFgc5gFmPrGDL0ElVrdASoTnTB6R/u
	 L/q/5VUIsqALouNeNFysmEPY4gGWy+m6O3aKW3NKhRYbjpJWYOpLLzspf7DMaRIRegu/r
	 B+eR7c9yLUNFxEWliJlyDbgbTmz5jFWBfAoQk9IE0y0PQHI+M9BZGYeyPL2hk+dqOha3l
	 QQHa3zxLxiMHU3yrXK7OjMZXex2ITYK4pkN1FsOSpdMHDWrph4wCTlQYEKCSAxL/jgw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794353660;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Gm-Message-State:X-Received:Date:In-Reply-To:Mime-Version:
	 References:Message-ID:Subject:From:To:Cc:Content-Type;
	bh=maMMv4jIWhT/WuiiquFkWwtVqzwmWNG01HiS3weib7s=;
	b=p9aCxqZr6NMNkDKNUvdd2r2Fc8/wtx4MJeu0zi8Q8U/gk/pA2zGtzpN/CthpA/v+wZts
	 RYOzqpKSK+rUuGmRzOZuyLoSZ6KwyGVQePECCzIsKbpjTEYXqo3N2t5P33mIP6fX7Rdn7
	 rZN6G8JrJ9zSN8oMQGIF6osdwErDaUjph14GjyeJmFKHmSAF1up45iUoDYprBAfmaNeWw
	 8UW0Sgsh0jKET1GV2to9yg8wPGr0W0cmLBnxPet71eNA/EyqF9kJd+jqhGYpsOI28IWd/
	 juoNpvZTCzTlG0lU6tYgD7G/QPKxTeX8q9IASDxdK/xYAQPGhzYQzyC+scXlafImQKA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=google.com;
	spf=pass smtp.mailfrom=flex--seanjc.bounces.google.com;
	dkim=pass header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20260707 header.b=Ho8f39ff;
	arc=none smtp.remote-ip=209.85.215.199
Received: from mail-pg1-f199.google.com (mail-pg1-f199.google.com [209.85.215.199])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2270C606A320
	for <sashiko-reviews@lists.linux.dev>; Tue, 10 Nov 2026 23:34:20 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 2270C606A320
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flex--seanjc.bounces.google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20260707 header.b=Ho8f39ff
Received: by mail-pg1-f199.google.com with SMTP id 41be03b00d2f7-cdd48746a49so1457139a12.0
        for <sashiko-reviews@lists.linux.dev>; Tue, 10 Nov 2026 15:34:20 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20260707; t=1794353659; x=1794958459; darn=lists.linux.dev;
        h=content-type:cc:to:from:subject:message-id:references:mime-version
         :in-reply-to:date:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=maMMv4jIWhT/WuiiquFkWwtVqzwmWNG01HiS3weib7s=;
        b=Ho8f39fftUm6Lj8X/ZmIXxOcNlMUsk5o8FXEoHjbH7BS3AQd2Kd5GTCEA+ATcUpMb0
         FOrh8noWdUmg7yPkuHvhPGT9SbAmVUwRU5EO5yP3Fxu1/JlpezHpDezDUFxx/7OB+RvX
         AiI0HrDxeXrxI+4s/RmOCMYpvk13ns6ZfRA/9kWSg2xi9UkT5GPd6NTbBY8dnhrYCJqO
         grMuQnOO0BGP9/1oCvwPC5mceIjMBnTqZtrC79W7dKsX1llEahy/qwT89COQyDCF8E/Q
         2x7PImmeV721u4N1nsVVGctoni1lO3JjaHIioiJBE9/hRksoMf+83hOPOpmfbAv7SoCx
         wKmA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794353659; x=1794958459;
        h=content-type:cc:to:from:subject:message-id:references:mime-version
         :in-reply-to:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=maMMv4jIWhT/WuiiquFkWwtVqzwmWNG01HiS3weib7s=;
        b=g8c9N5XSDOkh8bcjSwvW+OEHeE9LcyEA/yQsLGqCzQkqQRdq3+JtjGmfnOtPufCsxn
         hfaZE44+UjVF5hBoP12yp2KBNQoZtrLcFNlMv9yZj78KD9tSbgbTjv0FjwOqSmtWUHmf
         SH8jK53CP8YitAlr+ywFGmYhhMlZ0yWATH0pWheA86VveVO6hy7zZZC5dmrYrsZCpezp
         0ntfkFdV/JyTk9yub/CfBfIQ7WthTkqzGUgPsC14IV+k1fUJV5rrM61Optxh/f5f7wXy
         +N75Je0u06RFdpk1x7kWDAK38ly9hFOwMAbevOeizkzvIrcs3BJeCWNk3FYeah+yhdBP
         jHzA==
X-Gm-Message-State: APuU4Z+oNNCyQfx0DpwjE/ihnTDfpdK4IU3CMV0GkKl//AIjIngWhm36
	KV9BJKmTxHGAr40pjCX8L/pCFecB7L+nghOIswowgr8HaEWNO+e4tZTK1vx+WIehbM3zT1dXNN3
	sq3Y81fLzDOXDRIV8eqDNr29j5Re4Khydlb6E7RL9DRL1El2jBtc5bPSg0GHb64cAniS0i0HyoD
	+zM4mgJtRxHdoBgybtqJeQhlhK8tbzaLoWDcAGJJWT4aD7DY3a
X-Received: from pgbbo3.prod.google.com ([2002:a05:6a02:383:b0:cd8:ba74:813f])
 (user=seanjc job=prod-delivery.src-stubby-dispatcher) by 2002:a17:90b:224c:b0:3a2:b16d:928b
 with SMTP id 98e67ed59e1d1-3b182f86a71mr580515a91.46.1794353659122; Tue, 10
 Nov 2026 15:34:19 -0800 (PST)
Date: Tue, 10 Nov 2026 15:34:18 -0800
In-Reply-To: <sashiko-outbox-199646@kernel.org>
X-Mailing-List: sashiko-reviews@lists.linux.dev
List-Id: <sashiko-reviews.lists.linux.dev>
List-Post: <mailto:sashiko-reviews@lists.linux.dev>
List-Help: <mailto:sashiko-reviews+help@lists.linux.dev>
List-Subscribe: <mailto:sashiko-reviews+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:sashiko-reviews+unsubscribe@lists.linux.dev>
List-Owner: <mailto:sashiko-reviews+owner@lists.linux.dev>
Precedence: list
Mime-Version: 1.0
References: <20261105164531.313849-1-pbonzini@redhat.com> <20261105164531.313849-6-pbonzini@redhat.com>
 <sashiko-outbox-199646@kernel.org>
Message-ID: <avOp-gc3nU35Z7H-@seanjc-mac.roam.internal>
Subject: Re: [PATCH 5/5] KVM: x86: move asynchronous page fault handling to vcpu_enter_guest()
From: Sean Christopherson <seanjc@google.com>
To: sashiko-reviews@lists.linux.dev
Cc: Paolo Bonzini <pbonzini@redhat.com>, kvm@vger.kernel.org
Content-Type: text/plain; charset="us-ascii"

On Thu, Nov 05, 2026, sashiko-bot@kernel.org wrote:
> [Severity: High]
> Can this leave the stack-allocated host_apf_node linked in async_pf_sleepers
> after vcpu_enter_guest() returns when token is 0?
> 
> In kvm_handle_host_apf_irqoff(), kvm_async_pf_queue_task(token,
> host_apf_node) is called without checking whether token is 0 or recording the
> boolean return value:
> 
> arch/x86/kernel/kvm.c:kvm_async_pf_queue_task() {
> 	...
> 	n->token = token;
> 	n->cpu = smp_processor_id();
> 	init_swait_queue_head(&n->wq);
> 	hlist_add_head(&n->link, &b->list);
> 	raw_spin_unlock(&b->lock);
> 	return true;
> }
> 
> If token is 0, kvm_async_pf_queue_task() still inserts &host_apf_node.link
> into async_pf_sleepers with host_apf_node.token == 0 and returns true.
> 
> Then in vcpu_enter_guest(), the condition:
> 
> 	if (exit_fastpath == EXIT_FASTPATH_APF && host_apf_node.token)
> 		kvm_handle_pv_async_pf(&host_apf_node);
> 
> evaluates to false because host_apf_node.token is 0, skipping
> kvm_handle_pv_async_pf() and returning from vcpu_enter_guest() while
> host_apf_node.link remains queued in async_pf_sleepers.
> 
> A zero token with KVM_PV_REASON_PAGE_NOT_PRESENT set can occur if L0 is buggy
> or untrusted, or if L0 KVM sets KVM_PV_REASON_PAGE_NOT_PRESENT in L1's
> apf_reason.flags via kvm_arch_async_page_not_present() and queues
> vcpu->arch.exception_vmexit, but exception_vmexit is subsequently cleared
> before injection into L1 (for example, when preempted by KVM_APIC_INIT in
> vmx_check_nested_events() or svm_check_nested_events() calling
> kvm_clear_exception_queue(), or across KVM_GET_VCPU_EVENTS and
> KVM_SET_VCPU_EVENTS), leaving KVM_PV_REASON_PAGE_NOT_PRESENT stale in L1's
> apf_reason.flags until L2 triggers a regular #PF VM-exit whose faulting
> address has lower 32 bits equal to 0.
> 
> Previously, kvm_handle_host_apf_irqoff() checked the boolean return value of
> kvm_async_pf_queue_task() directly instead of testing host_apf_node.token != 0.

And on a related topic, can't exit_fastpath be set to HANDLED at this point?
I.e. why is it not this?  I feel like I'm missing something.

	if (exit_fastpath == EXIT_FASTPATH_APF) {
		kvm_handle_pv_async_pf(&host_apf_node);
		exit_fastpath = EXIT_FASTPATH_EXIT_HANDLED;
	}
