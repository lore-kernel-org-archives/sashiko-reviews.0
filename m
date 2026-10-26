Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.214.200
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793038675;
	b=umsR6sA9p8Ls/8OZC4Y5VV4a8FpM4/08cNQOYPQcB1gdGgzXxXYT3USYrjtLkesObcw0
	 UFq/6Psc/cK5c8A3OIk6tumDFt58MtblnPhVm6LXwQYyXBNqdJODQD/+8O+OxfJET5Vsy
	 dmaFzv3Alxzrz0UrZ8nzZ8Meyfw76o6VhihD0rAwIn10x9JcbJaNtLvh/oUPuhM9SqexY
	 waS1vJ7ZGAMl9CWlYht0L8y9X2BzjBESbRo8HZWpi2jmO8WC/G9rXtJ52QV2x2oiWz1As
	 WcPU09lq45ICuCF+jldtZwsB7HJ3e9ltsvUaG+X95+WDJeGvfuVffVih0Z4VKnQnWsQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793038675;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Gm-Message-State:X-Received:Date:In-Reply-To:Mime-Version:
	 References:Message-ID:Subject:From:To:Cc:Content-Type;
	bh=+810WkircImBIe3VU71W9hrmgj4SH7ngZDsWYJv5UyQ=;
	b=jlvOy0NtrmBvTAAoaDR6OvLkB4ZWZZvT3OzRcHuqhFVtRRwm2R1AT3ugkIQDw2BxkG03
	 BUQKBBFFFTjjAbgCI2Zd0KmFNKkmFE7h+JuZFNeFASJgJ4PBZyE8N05aQm6bcWHKTIEDh
	 zSCRpoeQG6z1SYAMsvty7AkTBj+Wxnw/AurHOo6SgLgxKk2HSvwP3S9QY/xqS7tlsY+8b
	 mbgTRisFdeBLcq0y+ghGe8+6af+uQ4uF+wYyWHa5hD93wtqSXmNxW2mFfcFrrBXlWRst4
	 BFQ18ktqRH4hphcdnn1i5X5FHaQ5Xw9zH70maKrDSHg4SumFyX6Mimdpfj/Qge5gamA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=google.com;
	spf=pass smtp.mailfrom=flex--seanjc.bounces.google.com;
	dkim=pass header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20251104 header.b=gb8KgwGC;
	arc=none smtp.remote-ip=209.85.214.200
Received: from mail-pl1-f200.google.com (mail-pl1-f200.google.com [209.85.214.200])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6B1F0606A31A
	for <sashiko-reviews@lists.linux.dev>; Mon, 26 Oct 2026 18:17:54 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 6B1F0606A31A
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flex--seanjc.bounces.google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20251104 header.b=gb8KgwGC
Received: by mail-pl1-f200.google.com with SMTP id d9443c01a7336-2e93e2f72bfso53684485ad.3
        for <sashiko-reviews@lists.linux.dev>; Mon, 26 Oct 2026 11:17:54 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20251104; t=1793038674; x=1793643474; darn=lists.linux.dev;
        h=content-type:cc:to:from:subject:message-id:references:mime-version
         :in-reply-to:date:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=+810WkircImBIe3VU71W9hrmgj4SH7ngZDsWYJv5UyQ=;
        b=gb8KgwGCY96kRSaQbSpmgJHUjHnIcaPTd4JNdKHX9aRW4bDl6smjPKBiuMTZ2h/9hx
         hfaVErSI+ExVKDAdMfeb4uAzQcLVHAp3vZcXKWdr2HJy5zfmLN7PCOENLBJ0FhnJjPfL
         zvg50jnW7QJ+oIotdMGVcXpmaTUqEnxo+986nSQIM6rMghU+mr8IuvzU9c1Gp8RgcULp
         j5noprz1QE+Mbk3qyHUwr6ukXQrSyIfrFgZFKz9u9K6+iw2Gx/8C72Dt1+KwlXukfRoF
         GB8bqP8R3rJOganf5i0JQiktwAWRT3NWpxlNL93xbHcBO0izKXtylEaUKGnca8/2XR4o
         jXmA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793038674; x=1793643474;
        h=content-type:cc:to:from:subject:message-id:references:mime-version
         :in-reply-to:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=+810WkircImBIe3VU71W9hrmgj4SH7ngZDsWYJv5UyQ=;
        b=C8YXSInCb8BL27tBKq3Ai61Cc6j54GYct1huLsA5qeCxPn1DC4Ni7ydj+hW3KbFeMn
         6/fFMrE5Pj/TqbkmwV1l1+w6pvsjRqZ5orSvc6duG2MxcAqZ1zdG2EsroVIpDms6vohc
         fnAFGnCue1Pj8SyIYYO5LeEJhdnuhFouexEyAm8YZxZKN4RxZO5xLIIlVw/KxH8t+5A8
         CjeCEeJG7w+rdUWR7xmFwTO0JdXyNEHCYcMS8to3PS64G/N725h3JVwP089Yh2IKEpS4
         caux4b3cZa96pwUHMm4FOYYXyWXy+fFISErGDnNNNSPTdeVtmZGvOq/jTYdY9e+7Y0rE
         ujcQ==
X-Gm-Message-State: AFq9FYKh/aenr/JkZ1YNaoUrZc0iDw5vQoTPe2NFgZgIyjM54swaJ5y9
	ixURhE3JlkLxeeksKFIrNMEz2K4Z3LJZBT/iqHr1l0ryil+6xJlIuYsjeY1F1DynFcWCj93rA+l
	aeS6+sBT4oXto/h+e9QKd70fdv/2Y8Qkshuq70qYstwKqRLbJC3UcL/TfqlcIwazPSYyKyE6bee
	iyHg4Lm7F4RqfQd/Pxy51Q8cIwDD5zSLF7rN38P7mVpVEtPuPN
X-Received: from plso3.prod.google.com ([2002:a17:902:bcc3:b0:2e9:4eb5:953d])
 (user=seanjc job=prod-delivery.src-stubby-dispatcher) by 2002:a17:902:c40c:b0:2e9:c569:7050
 with SMTP id d9443c01a7336-2ea9c839fcemr62722095ad.47.1793038673423; Mon, 26
 Oct 2026 11:17:53 -0700 (PDT)
Date: Mon, 26 Oct 2026 11:17:52 -0700
In-Reply-To: <sashiko-outbox-182127@kernel.org>
X-Mailing-List: sashiko-reviews@lists.linux.dev
List-Id: <sashiko-reviews.lists.linux.dev>
List-Post: <mailto:sashiko-reviews@lists.linux.dev>
List-Help: <mailto:sashiko-reviews+help@lists.linux.dev>
List-Subscribe: <mailto:sashiko-reviews+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:sashiko-reviews+unsubscribe@lists.linux.dev>
List-Owner: <mailto:sashiko-reviews+owner@lists.linux.dev>
Precedence: list
Mime-Version: 1.0
References: <20261022223052.646891-1-seanjc@google.com> <20261022223052.646891-3-seanjc@google.com>
 <sashiko-outbox-182127@kernel.org>
Message-ID: <at-ZULrPFH0XoCrM@google.com>
Subject: Re: [PATCH 2/4] KVM: nSVM: Synthesize #GP instead of SHUTDOWN if L2
 attempts to clear EFER.SVME
From: Sean Christopherson <seanjc@google.com>
To: sashiko-reviews@lists.linux.dev
Cc: kvm@vger.kernel.org
Content-Type: text/plain; charset="us-ascii"

On Thu, Oct 22, 2026, sashiko-bot@kernel.org wrote:
> > diff --git a/arch/x86/kvm/svm/svm.c b/arch/x86/kvm/svm/svm.c
> > index 487897ef11dd6..a6ff9635677a1 100644
> > --- a/arch/x86/kvm/svm/svm.c
> > +++ b/arch/x86/kvm/svm/svm.c
> > @@ -227,17 +227,12 @@ int svm_set_efer(struct kvm_vcpu *vcpu, u64 efer)
> >  	if ((old_efer & EFER_SVME) != (efer & EFER_SVME)) {
> >  		if (!(efer & EFER_SVME)) {
> >  			/*
> > -			 * Architecturally, clearing EFER.SVME while a guest is
> > -			 * running yields undefined behavior, i.e. KVM can do
> > -			 * literally anything.  Force the vCPU back into L1 as
> > -			 * that is the safest option for KVM, but synthesize a
> > -			 * triple fault (for L1!) so that KVM at least doesn't
> > -			 * run random L2 code in the context of L1.  Do so if
> > -			 * and only if the vCPU is actively running, e.g. to
> > -			 * avoid positives if userspace is stuffing state.
> > +			 * KVM is supposed to synthesize #GP if L2 attempts to
> > +			 * clear SVME.
> >  			 */
> > -			if (is_guest_mode(vcpu) && vcpu->wants_to_run)
> > -				kvm_make_request(KVM_REQ_TRIPLE_FAULT, vcpu);
> > +			if (KVM_BUG_ON(is_guest_mode(vcpu) &&
> > +				       vcpu->wants_to_run, vcpu->kvm))
> > +				return -EIO;
> >  
> >  			svm_leave_nested(vcpu);
> >  			/* #GP intercept is still needed for vmware backdoor */
> 
> [Severity: High]
> Can userspace still reach this KVM_BUG_ON() during KVM_RUN via
> KVM_SYNC_X86_SREGS when a vCPU is in guest mode?
> 
> In virt/kvm/kvm_main.c:kvm_vcpu_ioctl(), vcpu->wants_to_run is set before
> calling kvm_arch_vcpu_ioctl_run():
> 
> 	vcpu->wants_to_run = !READ_ONCE(vcpu->run->immediate_exit__unsafe);
> 	r = kvm_arch_vcpu_ioctl_run(vcpu);
> 	vcpu->wants_to_run = false;
> 
> Then arch/x86/kvm/x86.c:kvm_arch_vcpu_ioctl_run() syncs dirty registers
> from userspace while vcpu->wants_to_run is already true:
> 
> 	if (kvm_run->kvm_dirty_regs) {
> 		r = sync_regs(vcpu);
> 		if (r != 0)
> 			goto out;
> 	}
> 
> When KVM_SYNC_X86_SREGS is set in kvm_dirty_regs, the call chain
> sync_regs() -> kvm_run_sync_regs_from_user() -> __set_sregs() ->
> __set_sregs_common() in arch/x86/kvm/regs.c bypasses set_efer() in
> arch/x86/kvm/msrs.c and calls svm_set_efer() directly:
> 
> 	*mmu_reset_needed |= vcpu->arch.efer != sregs->efer;
> 	kvm_x86_call(set_efer)(vcpu, sregs->efer);
> 
> If userspace clears EFER_SVME in vcpu->run->s.regs.sregs.efer while
> is_guest_mode(vcpu) is true, wouldn't svm_set_efer() trigger the
> KVM_BUG_ON() and return -EIO (which __set_sregs_common() ignores) after
> already updating vcpu->arch.efer = efer and without calling
> svm_leave_nested(vcpu)?

Oof.  I think the right answer is to straight up disallow that?

diff --git a/arch/x86/kvm/regs.c b/arch/x86/kvm/regs.c
index 3621f1a47d37..e53496fdeb82 100644
--- a/arch/x86/kvm/regs.c
+++ b/arch/x86/kvm/regs.c
@@ -738,6 +738,10 @@ int kvm_run_sync_regs_from_user(struct kvm_vcpu *vcpu)
 	if (vcpu->run->kvm_dirty_regs & KVM_SYNC_X86_SREGS) {
 		struct kvm_sregs sregs = vcpu->run->s.regs.sregs;
 
+		if (is_guest_mode(vcpu) &&
+		    (vcpu->arch.efer & EFER_SVME) && !(sregs.efer & EFER_SVME))
+			return -EINVAL;
+
 		if (__set_sregs(vcpu, &sregs))
 			return -EINVAL;

Ideally, kvm_is_valid_sregs() would disallow that, but the risk of breaking
userspace, e.g. on save/restore, is too high.  Whereas I really, really hope no
one is using KVM_SYNC_X86_SREGS to yank the vCPU out of L2 during save/restore.
