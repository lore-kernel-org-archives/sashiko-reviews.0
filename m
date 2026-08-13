Received: from mail-pf1-f197.google.com (mail-pf1-f197.google.com [209.85.210.197])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1E5EB5FDA7
	for <sashiko-reviews@lists.linux.dev>; Thu, 13 Aug 2026 00:14:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.197
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1786580088; cv=none; b=Oe0SWss5cNrLs8cg/86kgSKaM935cKgLEzmvZKoqNbuyfloC0g5OeXsdQxw3grOdmNxCgD/4nTmmkKgTjOzWdWjXqddfkHbq2MOFLavj12wP5IOJhXuxWOB+TR68RBdBjl7tEcx/82YVlHHDH7cnZeScutvAiS/aE6/AvO/qjII=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1786580088; c=relaxed/simple;
	bh=OZjj7SWGU1Ekx4pavCx66iB/CiMgJpABLIy0OyPCF1g=;
	h=Date:In-Reply-To:Mime-Version:References:Message-ID:Subject:From:
	 To:Cc:Content-Type; b=GR4jf2k2/K7YFYdvs67myRBcyghw6yYdxZ/xWf6Q3hhWLER7oeQfhY0wilQWlzKAFR7pNcqs8FichUkM1VpcCcOiU4vuhV2iZsfcNr0BoFlyFh+Ik6axlB1S+b8R7GhddymZoOEZ+Ogy3DhuD2KUtAu9LUKe2s+kFDlVEo4OKFU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=flex--seanjc.bounces.google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=uQTGH9NJ; arc=none smtp.client-ip=209.85.210.197
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flex--seanjc.bounces.google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="uQTGH9NJ"
Received: by mail-pf1-f197.google.com with SMTP id d2e1a72fcca58-84a67b16217so292406b3a.3
        for <sashiko-reviews@lists.linux.dev>; Wed, 12 Aug 2026 17:14:46 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20251104; t=1786580086; x=1787184886; darn=lists.linux.dev;
        h=content-type:cc:to:from:subject:message-id:references:mime-version
         :in-reply-to:date:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=GAm9CE86Y5LnZb71GqWeHyDQ4XOCTPq/X6e2OTsWPAs=;
        b=uQTGH9NJno4UjMMMJkut4yyZTRYLvTwbUvRmxxX0mdNRQKxcI3s6Yo6wstIYbinf+E
         jAdgroqL8IsG/+NDi2oS4lnGcpwUYPmzLZb9gkgxntdqH8PzmGJvAUym8YacbzhvZ/Nt
         xDbNQohCg2LlFQaU234LzK6uc3bDiss/jyruv8VS1b95EHhbuZcRwC4AG/0TOSk4L0Wx
         vFY04PSgEtLyBqnWO0PTpwO2JXQ3d6io5O/H5DbTTELeDUJmGVV4RHxDdAfcPF+jKRd/
         +lqbK9/nUYVHrosHGc9m4LT2im2QNRRTtANNor/C3ns8PPn/2ZQKzP/FyTWhS7sN4PCV
         AFSg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1786580086; x=1787184886;
        h=content-type:cc:to:from:subject:message-id:references:mime-version
         :in-reply-to:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=GAm9CE86Y5LnZb71GqWeHyDQ4XOCTPq/X6e2OTsWPAs=;
        b=jF0Q6FDze2wtRgOzhRpHm//Ma/hdzLu7pnrIXGVrhc6S21WD19eYAzz6jYM37MxxUv
         Rr0H3gjyta/AqWbHlL4LKYmty3kmPkqsGtCcKBzWE+X2+BEbdoes7gi72gZ8Y+GJtCxQ
         l30owUYIBp+LcS0vGLl26LlUSAx3vljsHXjMDAl3moeemRmznKPMQHew+ScFY6IJS0G1
         7q33ZkVthpT6VHq8zvk8D4YewEEfOCE0p5Rn5uhch2guTcLRMbQXeiHFVFu5+it0vOB8
         93E5ePLeJh7eKXVy8M4amgxy6Qnyf3hoJ+szmAqAU/mKd6ynLu4hm6fBORMV7KsuAfCm
         HEag==
X-Gm-Message-State: AOJu0YzZeLX+7aq6TtOjfe7UfRUT8NgXsecEe5m86CvfAl0RK8KE7WQ+
	lDjb3J5cshTCCYDt9goeN3t59gGLfuFYx+mpwECUCm5GS6lfIrr1otaD92RriHiHncPt4bUp4jo
	8ab1m0g==
X-Received: from pfnv20.prod.google.com ([2002:aa7:8514:0:b0:84b:57b7:60c5])
 (user=seanjc job=prod-delivery.src-stubby-dispatcher) by 2002:a05:6a00:6017:b0:848:30c3:45d6
 with SMTP id d2e1a72fcca58-84fc74f9107mr1811925b3a.14.1786580086327; Wed, 12
 Aug 2026 17:14:46 -0700 (PDT)
Date: Wed, 12 Aug 2026 17:14:45 -0700
In-Reply-To: <8b05ead1-ef2c-472f-a613-bcd1a65b64e1@intel.com>
Precedence: bulk
X-Mailing-List: sashiko-reviews@lists.linux.dev
List-Id: <sashiko-reviews.lists.linux.dev>
List-Subscribe: <mailto:sashiko-reviews+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:sashiko-reviews+unsubscribe@lists.linux.dev>
Mime-Version: 1.0
References: <20260812080229.2481439-1-xiaoyao.li@intel.com>
 <20260812080229.2481439-4-xiaoyao.li@intel.com> <20260812082306.11E8B1F000E9@smtp.kernel.org>
 <8b05ead1-ef2c-472f-a613-bcd1a65b64e1@intel.com>
Message-ID: <an0MdQKMHclUjW9r@google.com>
Subject: Re: [PATCH v3 3/4] KVM: TDX: Don't assume exit_reason[31:16] as all-0
 in tdx_to_vmx_exit_reason()
From: Sean Christopherson <seanjc@google.com>
To: Xiaoyao Li <xiaoyao.li@intel.com>
Cc: sashiko-reviews@lists.linux.dev, Paolo Bonzini <pbonzini@redhat.com>, 
	kvm@vger.kernel.org
Content-Type: text/plain; charset="us-ascii"

On Wed, Aug 12, 2026, Xiaoyao Li wrote:
> On 8/12/2026 4:23 PM, sashiko-bot@kernel.org wrote:
> > > diff --git a/arch/x86/kvm/vmx/tdx.c b/arch/x86/kvm/vmx/tdx.c
> > When the basic exit reason is set to TDX_INVALID_EXIT_REASON here, but upper
> > bits like Bus Lock are preserved in exit_reason.full, does this break
> > tdx_get_exit_info()?
> > 
> > In tdx_get_exit_info(), it evaluates against the full 32-bit exit reason:
> > 
> >      *reason = tdx->vt.exit_reason.full;
> >      if (*reason != TDX_INVALID_EXIT_REASON) {
> >          *info1 = vmx_get_exit_qual(vcpu);
> >          ...
> > 
> > Since TDX_INVALID_EXIT_REASON is the 16-bit 0xFFFF, this check will pass if
> > any upper bits are set, even if the basic reason was marked invalid,
> > incorrectly exposing meaningless hardware state.
> 
> Oh, I should have called it out it's intentional to check the full 32 bits
> Exit Reason instead of checking the lower 16 bits .basic field as what it
> did in the v2.

Please wait for discussion to die down before sending new versions.  You sent
this version literally the same day you responded to some of my comments on v2.
Now the discussion is spread across different mail threads and I'm having to
piece the converation together.

In short, spamming versions makes it harder to review, and thus slows the process
down; it doesn't speed things up.
