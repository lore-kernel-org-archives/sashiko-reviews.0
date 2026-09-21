Received: from mail-pl1-f197.google.com (mail-pl1-f197.google.com [209.85.214.197])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D07D1349CFF
	for <sashiko-reviews@lists.linux.dev>; Mon, 21 Sep 2026 16:15:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.197
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790007328; cv=none; b=ns1+GpCyv2sWyT8PMRoL2Ezbat/8K5xfJck6woasuTZpYO2gYcHuk7ZM36vAjTBwTz/T0Hi1uWjH4WEAkv5MsmWo8jfw6/hcoynfrktZg3obuz/d91MJIeCC6B0HnUrpCnU0jB8WWiPaP89XS6wk8owG/dAcGbWTuUG4YU/gPko=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790007328; c=relaxed/simple;
	bh=NPytKttvhSWP9wC8ljBqJsACnF7U5YbZT2SHg4KiTeE=;
	h=Date:In-Reply-To:Mime-Version:References:Message-ID:Subject:From:
	 To:Cc:Content-Type; b=ojJOhhC8lkJ+poQA8b2YkqcT03CilGnayWCP4sYXGOrkKMbHQxgC83ZcvMugKOR0H38G3jHok4bJnHzIjDM4dChvhFKKfBdzVJ0MnILUDIg+NeSnbzoa4EmLLNPA2Vtp6UZZTYZ0imn05ky7UadCH0haluVkM4JeicGDdGu9lXE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=flex--seanjc.bounces.google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=QcwCd5nd; arc=none smtp.client-ip=209.85.214.197
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flex--seanjc.bounces.google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="QcwCd5nd"
Received: by mail-pl1-f197.google.com with SMTP id d9443c01a7336-2df375fb9b2so22676055ad.2
        for <sashiko-reviews@lists.linux.dev>; Mon, 21 Sep 2026 09:15:26 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20251104; t=1790007326; x=1790612126; darn=lists.linux.dev;
        h=content-type:cc:to:from:subject:message-id:references:mime-version
         :in-reply-to:date:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=qE+olzcN6zjo+GKIPM25wup16iAGlGxkabmAr9kueF4=;
        b=QcwCd5nd1AIunELpLOtdcrS2Sg4n+JR3t1pFba5sUBxJjRyoXdo1B93fhzTov1PPGt
         PZ37NLVMAVETKdnTXcWvwFq6k31jWnojBQ0LIlSP2Q1y2DsstbMgqfb7hWrbeFA9JRE7
         Zug28FiVO7N9Jp72PmeM8jsWqJptfvDjFwNo2M4Pw9kLK9JuD4Lxl9pRTrELGdaLihO2
         PdZ7WGSSPUNSKqdOMuxVBAv7Zh6Y94xRII1e8BpefL3P4noXBXUydvO//yOFkyl0odWn
         KMuRlJTjOSKz+CumbZ3xQQA1VJHSL5qTgQJqVdzu/2zYFr5nLEcSTnUIRGr4Hu1FjFjf
         995w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790007326; x=1790612126;
        h=content-type:cc:to:from:subject:message-id:references:mime-version
         :in-reply-to:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=qE+olzcN6zjo+GKIPM25wup16iAGlGxkabmAr9kueF4=;
        b=uHr6TnLKmzKdCpnUiVxZgB5q/PfIFNsaZPPMNXFWwQOKRzTy+n2EdXZBd641Q0PsPl
         fGUD+reYwS0i+pwZJvUAi9w6e8TnksRgby7PTHN3zfF3YgI2A6+rOY0N5DTmrt9jgGWf
         0LSMoeaiM9u1nzrnwtA7Hn2wyTcgV+mvMvWjIQBBYSaTOGkSDvxF7dNO+aTYzWty6Kyi
         /XBT9N0DuKcf0jVkXVf9KlzRkBySIrTQ87Tlxbp9Rmqj9QNVLaV9W7yaJJaERRin2N7J
         p23ZauHIgwynQX4FFvPZX6dP1/r7DfIDZ7h0KDv99LeGEbZoM1KkEluuKAUZgQhhp+23
         sc9w==
X-Gm-Message-State: AFuF++nEXs+XEDAYqPShIGxW8DgVxJ5P5a7Sslt5sheGkbuGhtA44gKK
	ElEDP2QE1kXCDiHEf2CuH9kcmlH+L/A9zHUqCivO4ML2C1cq/TvqbRHu4B1gnlqMHVqaQBu+uoU
	aKtqqRw==
X-Received: from pgbfu21.prod.google.com ([2002:a05:6a02:4a95:b0:cc7:4c6e:3e90])
 (user=seanjc job=prod-delivery.src-stubby-dispatcher) by 2002:a05:6a20:7d8b:b0:3d3:b02a:61a5
 with SMTP id adf61e73a8af0-3dd8c41a021mr19357702637.28.1790007325870; Mon, 21
 Sep 2026 09:15:25 -0700 (PDT)
Date: Mon, 21 Sep 2026 09:15:25 -0700
In-Reply-To: <ecbb6fb8-fe61-4028-880b-245f94db0f9f@amd.com>
Precedence: bulk
X-Mailing-List: sashiko-reviews@lists.linux.dev
List-Id: <sashiko-reviews.lists.linux.dev>
List-Subscribe: <mailto:sashiko-reviews+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:sashiko-reviews+unsubscribe@lists.linux.dev>
Mime-Version: 1.0
References: <cover.1789399214.git.prsampat@amd.com> <d946de080e3dd34844a665c167179e4910fdc9d4.1789399214.git.prsampat@amd.com>
 <20260914171628.8A4631F00893@smtp.kernel.org> <ecbb6fb8-fe61-4028-880b-245f94db0f9f@amd.com>
Message-ID: <arFYHRzNFT886BME@google.com>
Subject: Re: [PATCH 1/3] KVM: SVM: Re-queue events that were never injected
From: Sean Christopherson <seanjc@google.com>
To: "Pratik R. Sampat" <prsampat@amd.com>
Cc: sashiko-reviews@lists.linux.dev, kvm@vger.kernel.org
Content-Type: text/plain; charset="us-ascii"

On Thu, Sep 17, 2026, Pratik R. Sampat wrote:
> 
> 
> On 9/14/26 1:16 PM, sashiko-bot@kernel.org wrote:
> > [You don't often get email from sashiko-bot@kernel.org. Learn why this is important at https://aka.ms/LearnAboutSenderIdentification ]
> > 
> > Thank you for your contribution! Sashiko AI review found 1 potential issue(s) to consider:
> > - [High] svm_complete_interrupts() incorrectly checks if (control->event_inj) instead of the SVM_EVTINJ_VALID bit, which can silently drop valid hardware-reported events (like guest page faults) by clobbering EXITINTINFO.
> > --
> > 
> > commit 50716e3ba11eb9d000a0186ffad984ac08df1dcb
> > Author: Pratik R. Sampat <prsampat@amd.com>
> > 
> > KVM: SVM: Re-queue events that were never injected
> > 
> > When injecting an event into the guest via the event_inj field, a non-zero
> > event_inj value on #VMEXIT means the hardware was unable to inject it.
> > This commit adds a check to recover potentially lost interrupts by detecting
> > an undelivered injected event and re-queuing it.
> > 
> >> diff --git a/arch/x86/kvm/svm/svm.c b/arch/x86/kvm/svm/svm.c
> >> index d0971685034b9..e2be2cd86c320 100644
> >> --- a/arch/x86/kvm/svm/svm.c
> >> +++ b/arch/x86/kvm/svm/svm.c
> > [ ... ]
> >> @@ -4323,6 +4324,27 @@ static void svm_complete_interrupts(struct kvm_vcpu *vcpu)
> >>       svm->nmi_l1_to_l2 = false;
> >>       svm->soft_int_injected = false;
> >>
> >> +     /*
> >> +      * Hardware clears EVENTINJ field when it injects an event.
> >> +      * A non-empty EVENTINJ on #VMEXIT means the vCPU never entered guest
> >> +      * mode, and thus that the event was never delivered.  Migrate the event
> >> +      * to EXITINTINFO so that it's requeued instead of being dropped.
> >> +      *
> >> +      * An undelivered event doesn't imply a fatal VMEXIT_INVALID. With
> >> +      * Enhanced SMT Protection, VMRUN may exit with an ordinary #VMEXIT
> >> +      * without having injected that event into the guest.
> >> +      *
> >> +      * Clobbering EXITINTINFO is safe precisely because the vCPU never
> >> +      * entered guest mode.
> >> +      */
> >> +     if (control->event_inj) {
> > [Severity: High]
> > Does this code silently drop valid hardware-reported events?
> > 
> > If an L1 hypervisor sets event_inj to a non-zero value but leaves the
> > SVM_EVTINJ_VALID bit clear, hardware will ignore the injection and won't
> > clear EVENTINJ.
> 
> 
> The first half is right, nested_svm_check_event_inj() intentionally returns
> true when V is clear, so vmcb02->control.event_inj can be non-zero with V=0.
> 
> The second half isn't. Clearing EVENTINJ is not part of injection, it's part of
> #VMEXIT, and it's unconditional. 

So that doesn't mesh with the above comment, which says:

  Hardware clears EVENTINJ field when it injects an event.

And it begs the question of how this patch is at all useful.  Because all this
fancy new paranoia is clearly generating #VMEXITs, and if #VMEXIT unconditionally
clears control->event_inj, I don't see how control->event_inj can be non-zero if
KVM attempted VMRUN.

I.e. either this is all broken, or the APM is buggy.
