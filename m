Received: from mail-pl1-f199.google.com (mail-pl1-f199.google.com [209.85.214.199])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 64EAE3A9DB1
	for <sashiko-reviews@lists.linux.dev>; Wed, 26 Aug 2026 18:38:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.199
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787769518; cv=none; b=Wj7YDEN+fJ4LR9nKRUtRbhYnnpGlP3zuhb12bhkJ1RgebCDzfd0ivckGXR2MLt4KZafkrsQYQfkTazjU+cop71gVUAng6zVxNbe+hGIwVTGdd+eFMkaXmyaqTqgVrh6p6wrS3lgHxQIBpU0Gb6ZRS/9Fguc8iAz506DCnggAg3U=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787769518; c=relaxed/simple;
	bh=vLfznco5gDgs29HBkuk6g4sKUBP9AD9WYgLJyybzCXk=;
	h=Date:In-Reply-To:Mime-Version:References:Message-ID:Subject:From:
	 To:Cc:Content-Type; b=LcnrS5U4mqGz0omR9bprUiltvYAwMqhzbYsNH/Mi7DDrZ3JIOpwng38BV9pOzXwVbE1cO01DEx+LHG6uJKue3OjVCMPlnE/trd/JYMlGRgiVxojshYG6E6V1VpSkNH0iUNdi9o7B8GK7l4hudAk3ND5YbkI5eloly9qhmN+RwCg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=flex--seanjc.bounces.google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=hSvvfjxp; arc=none smtp.client-ip=209.85.214.199
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flex--seanjc.bounces.google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="hSvvfjxp"
Received: by mail-pl1-f199.google.com with SMTP id d9443c01a7336-2d7293f13c6so1421715ad.2
        for <sashiko-reviews@lists.linux.dev>; Wed, 26 Aug 2026 11:38:27 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20251104; t=1787769503; x=1788374303; darn=lists.linux.dev;
        h=content-type:cc:to:from:subject:message-id:references:mime-version
         :in-reply-to:date:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=C1t+srGUYqUnv7fl4EGsK1emSikJui6QHHfx1hD3meA=;
        b=hSvvfjxpzVrPdXdJKz5bVOkC8JUR79Lp4giLGN81wLG3MCGDfMmVcszve9/9eaFsyK
         Auo5RlaKcUrW+2/q/vpvdiXZUqO4tlZ+SEXVjDTdvXw7sRN+1lf6cXsWYjRt9qWEsExX
         kaIobqQ0znulXQcyABWQFdT+VNUB31QrNHDgd5WpjdW4c5RzlkubuLbQvee7VpySYDGz
         /HhDGbRshnJYdlv8o0Ori5/l76/ca3o5y98Esy8kT1Rsl6uc4+stYwYM4wl5Gml0ETig
         u2/1r+FAo/wA2aGoH2q/EZlxTTdTUZFnX+CXXv1wXjfQ4yvg7I1SYvEyd4pOOPPqX3sj
         0D4Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1787769503; x=1788374303;
        h=content-type:cc:to:from:subject:message-id:references:mime-version
         :in-reply-to:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=C1t+srGUYqUnv7fl4EGsK1emSikJui6QHHfx1hD3meA=;
        b=QuWmRF1xM5KUD9HXtNNgl6qR64LSsZ+0/2LQ1xqguPrZIbCuWeImpuJJ+zCnU8aw4k
         ugh4gHyqIsHdKget4PTQi4wEIdSfRJGfOU5VRxWSJ7dLoczHO++mozI0VQRQvPsOMkbO
         JdrFMeXGkZRZvruk+7qynA/papb33EMLAPDzXsjmb0cKahwMkuc5mgsBzffFi/YrhlhD
         gKQ8aKZw602Rq8LBU6Y0q2B3a2oLUJm2ud5PNlDnPwU7yGeKbALtVdIJXqAW9EKFV8OW
         t8e9Er/3AjOClaZWYrrbTHxQCXyNyT1l1Ejga5GuGF87QUG1yGbetY8JNhs0EhbH9m35
         6fTA==
X-Gm-Message-State: AFuF++l02QjUxUwAQuSX2DP5wJIjbWIaxRlHq1lnm2KjPBTgzlRW9xdS
	i6eFJYZs+W6HJ8rut/V3eySSw49XVTH6PqB6E1cdD7/NshklG+VH5tuoeckldmgzm64ZK5g/4e7
	KcuFP0E0MJwmIVwPnXMe4rG2dPeBRZUFcQgolvRfg8gaQkKNuNFrKhN6CytykQU2Dacuqa66qOs
	XcVBQQ3GC0dMDJBv3SKif3QF/Meys0PVTr2+q8MZlewk9nPia6
X-Received: from pghp22.prod.google.com ([2002:a63:fe16:0:b0:c8a:3e7c:1e5d])
 (user=seanjc job=prod-delivery.src-stubby-dispatcher) by 2002:a05:6a20:3d8d:b0:3cd:9f0b:f7a2
 with SMTP id adf61e73a8af0-3cf84444964mr16293253637.11.1787769502521; Wed, 26
 Aug 2026 11:38:22 -0700 (PDT)
Date: Wed, 26 Aug 2026 11:38:21 -0700
In-Reply-To: <20260826172227.7246A1F000E9@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: sashiko-reviews@lists.linux.dev
List-Id: <sashiko-reviews.lists.linux.dev>
List-Subscribe: <mailto:sashiko-reviews+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:sashiko-reviews+unsubscribe@lists.linux.dev>
Mime-Version: 1.0
References: <20260826171246.777729-1-seanjc@google.com> <20260826171246.777729-5-seanjc@google.com>
 <20260826172227.7246A1F000E9@smtp.kernel.org>
Message-ID: <ao8ynQ8OfJFhF-sR@google.com>
Subject: Re: [PATCH v2 4/8] KVM: VMX: Rename posted interrupt prefixes from
 "vmx" to "vt"
From: Sean Christopherson <seanjc@google.com>
To: sashiko-reviews@lists.linux.dev
Cc: kvm@vger.kernel.org
Content-Type: text/plain; charset="us-ascii"

On Wed, Aug 26, 2026, sashiko-bot@kernel.org wrote:
> Thank you for your contribution! Sashiko AI review found 1 potential issue(s) to consider:
> - [Low] Incomplete refactoring: The common helper function `vmx_needs_pi_wakeup` was not renamed to `vt_needs_pi_wakeup`.
> --
> 
> commit 3f6ac2d22873c9d6eb23bb3aab8ab0ad05bd4863
> Author: Sean Christopherson <seanjc@google.com>
> 
> KVM: VMX: Rename posted interrupt prefixes from "vmx" to "vt"
> 
> This commit renames posted interrupt APIs that are shared between VMX and TDX
> to use the "vt" prefix instead of "vmx". This is a non-functional change.
> 
> > diff --git a/arch/x86/kvm/vmx/posted_intr.c b/arch/x86/kvm/vmx/posted_intr.c
> > index 24221ba553be1..359ef3e6ebbe4 100644
> > --- a/arch/x86/kvm/vmx/posted_intr.c
> > +++ b/arch/x86/kvm/vmx/posted_intr.c
> [ ... ]
> > @@ -219,10 +219,10 @@ static bool vmx_needs_pi_wakeup(struct kvm_vcpu *vcpu)
> >  	 * back to the pi_wakeup_handler() function.
> >  	 */
> >  	return (vmx_can_use_ipiv(vcpu) && !is_td_vcpu(vcpu)) ||
> > -		vmx_can_use_vtd_pi(vcpu->kvm);
> > +		vt_can_use_vtd_pi(vcpu->kvm);
> >  }
> 
> [Severity: Low]
> This isn't a bug, but does vmx_needs_pi_wakeup() also need to be renamed to
> vt_needs_pi_wakeup()?

Doh, yes.  I meant to change it, but got distracted by vmx_can_use_ipiv(), which
_is_ VMX specific, and forgot to revisit vmx_needs_pi_wakeup().

If there are no other issues in the series, I'll just fix this one up when
applying.
