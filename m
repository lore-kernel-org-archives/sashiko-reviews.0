Received: from mail-pj1-f70.google.com (mail-pj1-f70.google.com [209.85.216.70])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CF4974BC01A
	for <sashiko-reviews@lists.linux.dev>; Fri,  2 Oct 2026 13:54:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.216.70
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790949283; cv=none; b=ftTojJNNzokE/FhXndH1FbggvPJwvXKLqTXJfPSZLB4DEyt4by0AQPGcQmRXKEgTonQdZBTX1pQtv658tj68roDNcG0bpcmY5N9jO3y3W6QGDa2ZYtTeJoL5JHUpGTZfeH9m64JrnNnPC0HZRH4mZYnI2/QrApQEXrUpBUxrc8g=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790949283; c=relaxed/simple;
	bh=KTUwSAw2KqK3Jo3fjMAfYHRYu+1UTZXFA0vNXcwmGJk=;
	h=Date:In-Reply-To:Mime-Version:References:Message-ID:Subject:From:
	 To:Cc:Content-Type; b=CiwGMOl2tpZ87Y6Dm7BQsVoFZ86Pnn7lFdAf/hHRvjwZ6JE4ja8ARpKyocxGqSYB/kL5nj83WfwT9lvn8InjUQ9rsZG3bYAy5gSeXpbiCgpZbgA8THZh43OUc1j6YvtdrBmuQ1fr0A4W50b1YMB/0WoD6WfZjqJvY8mVxtmKRGU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=flex--seanjc.bounces.google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=FFLllhvw; arc=none smtp.client-ip=209.85.216.70
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flex--seanjc.bounces.google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="FFLllhvw"
Received: by mail-pj1-f70.google.com with SMTP id 98e67ed59e1d1-3965ba1ba3eso6696042a91.2
        for <sashiko-reviews@lists.linux.dev>; Fri, 02 Oct 2026 06:54:41 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20251104; t=1790949281; x=1791554081; darn=lists.linux.dev;
        h=content-type:cc:to:from:subject:message-id:references:mime-version
         :in-reply-to:date:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=+1lBW1x3XmBH5mOfd18Qg+ztVcEBJ153cF5DJ7M24HI=;
        b=FFLllhvwngBq6NRls5gngAJdFHfSE1RRtbn/pde9+ll7XUCAYToJAUS4ks+JPI3Wzf
         wVG26b89JZxv65c7jegG/sivpyROOg4J2qzvlRdmlSbm4rlPWckairz5vR+lUk+6WITy
         v/lfcWW1Ka/3kCUwr3FRthbiHTq5mKe/IwhA4GlCzk2VFsAvqhf126zqSfkIVfrPxXFz
         O9Mqw/mZuUY+5DABooOIHucth3GhcN1w8yATBeo58/fZ5dJ35IVW9osVXg4eASsmvXnA
         GTIHtwLFIqSOU117Rdrj5G84mDGQJVYfMlPBtgUXdlsCQoGuIrn7B6nc2rssKle9t6/c
         xCLw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790949281; x=1791554081;
        h=content-type:cc:to:from:subject:message-id:references:mime-version
         :in-reply-to:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=+1lBW1x3XmBH5mOfd18Qg+ztVcEBJ153cF5DJ7M24HI=;
        b=KKS3DV7oMrgro9zRvrh01gidNcipZO2iKKTiWAooWdeNsc8irtUJdi2a/9GXZdhImN
         r0XhaaUuvuxb/I798EktKLpbdA+7e+vfKFz3nC2stp12kBq1hCb2PF7tXSsmyGydcuTn
         dRZoVg6dXuEP9gzTe1Nd4XbzPBY6bhFbz1fcfqA143O67VuOBoftDvbot4jLC9NKU1rn
         G45VZfDwtj3mGLdEpBl4bI5aA5gpKNJZ0L1ScEH0fl3GmRsqiBfa9e1iexmSsYwqp+W8
         StJV8Kqxzru/jTsvAcjw68lBfNEYbkAUG9/kgTJZX1WNRYunman7Y3LGEaTkCqBqXcru
         eMFQ==
X-Gm-Message-State: AFq9FYJFhhJ54J/GzBXtyDWUW9LM9PGZe7JW2BOjANsmBPmiXmCCdqzK
	+/9MwOlLCi0r9w4duL1dxz521/GZujkEqVA1v0hbGi8eTIZdCwBh79H2aqmImtMNtV/MUi8txSV
	rNXT8oBP4q+BJuDStiNbXsgsAnjmXEKCtGaQFU77K+1pEBcHHMYHp+N5Hd7LBx2erk5FiPQyYEm
	+droFUfzT9tcTAOZE4rkq286E7AKrdyUE14c46Yza4YVlI+Do4
X-Received: from pjbng11.prod.google.com ([2002:a17:90b:1a8b:b0:3a4:788f:51c6])
 (user=seanjc job=prod-delivery.src-stubby-dispatcher) by 2002:a17:90a:38c6:b0:3a5:147a:3b60
 with SMTP id 98e67ed59e1d1-3a6ce853a89mr790042a91.52.1790949280652; Fri, 02
 Oct 2026 06:54:40 -0700 (PDT)
Date: Fri, 2 Oct 2026 06:54:39 -0700
In-Reply-To: <20261002091343.02E3B1F00899@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: sashiko-reviews@lists.linux.dev
List-Id: <sashiko-reviews.lists.linux.dev>
List-Subscribe: <mailto:sashiko-reviews+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:sashiko-reviews+unsubscribe@lists.linux.dev>
Mime-Version: 1.0
References: <20261001202234.3794060-1-seanjc@google.com> <20261001202234.3794060-11-seanjc@google.com>
 <20261002091343.02E3B1F00899@smtp.kernel.org>
Message-ID: <ar-3nx-8eS9UwVNx@google.com>
Subject: Re: [PATCH v2 10/10] KVM: Pre-check uaccesses in KVM's APIs to
 read/write guest memory
From: Sean Christopherson <seanjc@google.com>
To: sashiko-reviews@lists.linux.dev
Cc: kvm@vger.kernel.org
Content-Type: text/plain; charset="us-ascii"

On Fri, Oct 02, 2026, sashiko-bot@kernel.org wrote:
> > diff --git a/virt/kvm/kvm_main.c b/virt/kvm/kvm_main.c
> > index 770a2c3bd4458..80b19d47840b2 100644
> > --- a/virt/kvm/kvm_main.c
> > +++ b/virt/kvm/kvm_main.c
> [ ... ]
> > @@ -3211,6 +3211,11 @@ static int next_segment(unsigned long len, int offset)
> >  		return len;
> >  }
> >  
> > +static bool kvm_is_guest_access_ok(struct kvm *kvm, int offset, int len, int size)
> > +{
> > +	return kvm_can_do_uaccess(kvm) && !WARN_ON_ONCE(offset + len > PAGE_SIZE);
> > +}
> 
> [Severity: Medium]
> Does this helper ignore the provided size parameter? 

/facepalm

Copy+paste fail.  I distinctly remember fixing this locally, once, but apparently
I clobbered that change.
