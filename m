Received: from mail-pf1-f197.google.com (mail-pf1-f197.google.com [209.85.210.197])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D8EA0446BFC
	for <sashiko-reviews@lists.linux.dev>; Tue, 21 Jul 2026 14:42:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.197
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784644968; cv=none; b=Ci8FrrZP/JQFJd4HTPQWEQF3CgG997nNLlP3D+d9lgmhzA+F/A/Jwf1sQRNUFFMsSU7yrsChZUZ5UOREjktJvYXLKorvl4gir8oDpE6y2QwMpdV9Ntfi9IdPM1jeY/Xk0pLDe2XJfGqHNYOTaPmRoldbu+pDmg0H4mOqY4KbS5Q=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784644968; c=relaxed/simple;
	bh=6gnOLqcKaT1b14yHGtbHzIkRInXXkAxSyjq/G02Jdqs=;
	h=Date:In-Reply-To:Mime-Version:References:Message-ID:Subject:From:
	 To:Cc:Content-Type; b=qWBVi8rL3I9cNkiZ3bQn9C7i8N2J1otcRasrNzs03sDvXbFjP6z2Ex+4dM9i6dOfSxNH+KkPZwr86cVew0+Qh7KAR3WP9vZX8bFS3oY1Iykti+KMcAQtzpe6flOfUQrR2iO8kemmy5mu6CArGlhqThH8TUK41r6bdG2LMW+cktk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=flex--seanjc.bounces.google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=BVsQGVNS; arc=none smtp.client-ip=209.85.210.197
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flex--seanjc.bounces.google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="BVsQGVNS"
Received: by mail-pf1-f197.google.com with SMTP id d2e1a72fcca58-84870e7f498so11915393b3a.3
        for <sashiko-reviews@lists.linux.dev>; Tue, 21 Jul 2026 07:42:46 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20251104; t=1784644966; x=1785249766; darn=lists.linux.dev;
        h=content-type:cc:to:from:subject:message-id:references:mime-version
         :in-reply-to:date:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=LNFqq4/9miHE+hyKXsNlebDayPW56SZCH4SA/Bf1Nq4=;
        b=BVsQGVNS2eO3ilEMmZfdk5oESea9j5E/AV/tmhQ6CICs093R3+lULy4/OSYqN5oO2o
         BHIrOFxqIH70OkAo8opswW+grLbrvRolKonuW7nPpSODxHZIr1ZFXgaUcfwltxRvUkGa
         J5okw128U4rQ+QJtR5yd3h/+y72mDBcvs2FQ6KdssAzulbLBfZQnqKe6LpPjAvW1IMcb
         rodIfIV2mmtMrUbSkmLcRIGAUcNo/iaGkPbQG9rct8aXMnOgSc90LZUoba7dxgoACbNP
         aiH7x7TDAfXOi7qpTr+RVVj52LVarkJobovmDeL2qpZrS1fJRwbSufjPX5xIynSMe64J
         o/pw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1784644966; x=1785249766;
        h=content-type:cc:to:from:subject:message-id:references:mime-version
         :in-reply-to:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=LNFqq4/9miHE+hyKXsNlebDayPW56SZCH4SA/Bf1Nq4=;
        b=NTctz+HLcZ7fHV6s2jf3MCX0XQzwrybZZ4OYcP9QobhZlj/d18yH3u/3HdA0Nx8qPb
         5qsqdOfEzyDl7qlaNFRYQsK1e4YKFiCPH1Qvaw7jSaCK0An71rApwQDrIHH5x/vVM7Hk
         K0rLPIG6bcfjpXtgpx+PKDMBkQb1AFRsEjzm9Z9/EZl9crk7Z11TzRUpprtoWD0G/6LN
         olNOkRbSah/3gGI2OqginJC2xrhTP7IFU0BdSIpdjKcck0nn23H1njFjnr9LayZ8XgWf
         D4wG4GMyLYQAQZ7J/G5k1g5S+MqD5p5SFdxTi/Y70h9Wv9wrEsEEuS/SYBxtK14AL5Us
         8dRg==
X-Gm-Message-State: AOJu0Yy8wksNdc5HzqkniuCv3q1bpR7j2pQUb0IUnVZMFNi8JO5lmupA
	i/Z6NNBiJfAgE+w3SpMNYkZOeIlNeZYV30MfbgBELNhvpjKK03h8WqAW+SiL7vHeOvg+P537SwM
	K46GXJcBryEtwdbUo480vTrXrCBrrCdxm/beNT9zNTqb9lCWFfEfKblCkzV61Awjr+jOBo7KL0V
	bovdYiCQXC/QTtsnd4PKYyQervscYC0MjHBVeW6d0lXTICPkdD
X-Received: from pfwp3.prod.google.com ([2002:a05:6a00:26c3:b0:848:478d:6efb])
 (user=seanjc job=prod-delivery.src-stubby-dispatcher) by 2002:aa7:8490:0:b0:84e:23a:14ba
 with SMTP id d2e1a72fcca58-84e023a1807mr3186376b3a.55.1784644965816; Tue, 21
 Jul 2026 07:42:45 -0700 (PDT)
Date: Tue, 21 Jul 2026 07:42:45 -0700
In-Reply-To: <20260721062426.C4EB81F000E9@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: sashiko-reviews@lists.linux.dev
List-Id: <sashiko-reviews.lists.linux.dev>
List-Subscribe: <mailto:sashiko-reviews+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:sashiko-reviews+unsubscribe@lists.linux.dev>
Mime-Version: 1.0
References: <al8M4gCwsWXS_jMs@192.168.1.215> <20260721062426.C4EB81F000E9@smtp.kernel.org>
Message-ID: <al-E7uwCqS6na41W@google.com>
Subject: Re: [PATCH v2] KVM: x86: Mark nested RSM-created VM-Enter as untrusted
From: Sean Christopherson <seanjc@google.com>
To: sashiko-reviews@lists.linux.dev
Cc: Hao Zhang <hao_zhang_kdev@163.com>, kvm@vger.kernel.org
Content-Type: text/plain; charset="us-ascii"

On Tue, Jul 21, 2026, sashiko-bot@kernel.org wrote:
> > diff --git a/arch/x86/kvm/svm/svm.c b/arch/x86/kvm/svm/svm.c
> > index 4d2bacd00ec4f..f54757bd83821 100644
> > --- a/arch/x86/kvm/svm/svm.c
> > +++ b/arch/x86/kvm/svm/svm.c
> 
> [ ... ]
> 
> > diff --git a/arch/x86/kvm/vmx/vmx.c b/arch/x86/kvm/vmx/vmx.c
> > index cc75feec05daa..333072cc9bce4 100644
> > --- a/arch/x86/kvm/vmx/vmx.c
> > +++ b/arch/x86/kvm/vmx/vmx.c
> > @@ -6720,7 +6720,8 @@ static int __vmx_handle_exit(struct kvm_vcpu *vcpu, fastpath_t exit_fastpath)
> >  	 * invalid guest state should never happen as that means KVM knowingly
> >  	 * allowed a nested VM-Enter with an invalid vmcs12.  More below.
> >  	 */
> > -	if (KVM_BUG_ON(vcpu->arch.nested_run_pending, vcpu->kvm))
> > +	if (KVM_BUG_ON(vcpu->arch.nested_run_pending == KVM_NESTED_RUN_PENDING,
> > +		       vcpu->kvm))
> >  		return -EIO;
> 
> [Severity: High]
> Does this allow the KVM_NESTED_RUN_PENDING_UNTRUSTED flag to leak and lock up
> the vCPU?
> 
> If a malicious L2 guest modifies SMRAM to create an invalid nested state, then
> executes RSM, vmx_leave_smm() restores this state and sets nested_run_pending
> to KVM_NESTED_RUN_PENDING_UNTRUSTED.

LOL, that is an impressively convoluted hallucination from Sashiko.  SMI is an
unconditional VM-Exit on Intel, and KVM doesn't support emulating parallel SMM,
i.e. it's impossible for L2 to have access to "live" SMRAM.

That said, leaving nested_run_pending set isn't good, and I missed that my
suggested "fix" would require tweaking the above KVM_BUG_ON().  I'll respond to
v3 with an alternative solution.
