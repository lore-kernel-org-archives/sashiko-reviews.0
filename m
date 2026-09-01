Received: from mail-pg1-f199.google.com (mail-pg1-f199.google.com [209.85.215.199])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8B4DF37E5CC
	for <sashiko-reviews@lists.linux.dev>; Tue,  1 Sep 2026 19:33:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.215.199
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788291240; cv=none; b=FFpD86FPx/DQwj/vcxv2/WSqBwa7dRy9l3tckD62QJ2CBsuRrHmWCS5MO1FFnb6QUGZa4UsbGtO/m+648lCh3/BdYIxRtp5LejgUiCg9fssAXQXBe5D+zPMYD2n7hQ9NEgTM9Jf1sD6HecOfA4IxivOceKcOqLU5pZuIlqZa5Jg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788291240; c=relaxed/simple;
	bh=QZCoj1cVP7Hqv2C3oAs0XizEvyiKlG+bPfHrCm4CO/E=;
	h=Date:In-Reply-To:Mime-Version:References:Message-ID:Subject:From:
	 To:Cc:Content-Type; b=LlZKhsDWgnId8FXXoQi64WPLs+D6+neH0ANpF8/duZxF70NVp24LqwqS+r359r0cPYbZQO40ngY8hw992gmNCqTmbZKz5VAlr4l6GkrZ0qtychJaPC1VB6w7xU6zO4sxHz+zuJHRPEaQJFZfmUvY/mo5HKWETDrQGJzjVgvwQLU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=flex--seanjc.bounces.google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=mPER/lUa; arc=none smtp.client-ip=209.85.215.199
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flex--seanjc.bounces.google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="mPER/lUa"
Received: by mail-pg1-f199.google.com with SMTP id 41be03b00d2f7-cc1c5810451so344177a12.1
        for <sashiko-reviews@lists.linux.dev>; Tue, 01 Sep 2026 12:33:58 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20251104; t=1788291238; x=1788896038; darn=lists.linux.dev;
        h=content-type:cc:to:from:subject:message-id:references:mime-version
         :in-reply-to:date:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=vcp2HqC1PIYDI/BW2a9G/QFQNxe/OVU+goHiKCv6lBU=;
        b=mPER/lUan0EvOi6nFFTnN0aTRGdgPs5ERuOi/jXwhNmK0+v+dFTK8I7GNeuy6ArAAt
         WeNb90B80Lchx93rs3QfXpuuhTA2DtO+/TaCKc/BF5kDFaI2BggbJFE9LnJ7tn5t0S1D
         AATTXlEhgGeHy0ZKQHs7oI5RMhxCKbbx0BpPeQv+tzT6CfCFd143tXReadX74waBv5L3
         Aduw9fIq0pXAyokrzN+RtEHM+noS3gIX75wCd35PBCbMtbqFp3zJ3YEyfcEOpHWcARc2
         LojzwHKURqCXsJR/mkZ5txLxcViHY8k/MMnqUlPmcOxxvl0sRtrES6g4tj9LaVd2LYPp
         hSWA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788291238; x=1788896038;
        h=content-type:cc:to:from:subject:message-id:references:mime-version
         :in-reply-to:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=vcp2HqC1PIYDI/BW2a9G/QFQNxe/OVU+goHiKCv6lBU=;
        b=aTxNLrN3fpRWRFZVAdBSzKXQ1WqjmRIKW0G6YsAH5sV5oHJF2cEmbIPNLH6lGKFFnO
         O3+bLi2zdKQB4NWEcY0fGCAyfXjNLKD1JFuH8knsF/y+6g4Tfe2v91h4bQYtiIOsq0VN
         FUFnLgnUl8OA5xBKBEpmcZ4yqpPtx+g5mSFuCwwlqYR/JjapuDY3TrzVYQ9PvQYLW90M
         uYNJucTyGVKyu+R/z4f+4RgjVD1rP1cm0o/C9C6tleiZasEQADT99G6+zjw6b7x7oVH/
         ri+SOsrA6Wy1nNHOTEESxsgFSm2n/hXogivvtvpTC790uZoHGQ4QIcnSpqdhER2zMBT5
         Z/Uw==
X-Forwarded-Encrypted: i=1; AKwUvBwJzRjEgMy8F18OIIvjGy2Ou/oo28bO93HL+KZpQUBszc5ZDtOBhjkrAcj0PeWyjZKnD7IhdXxPZtQpGollRlo=@lists.linux.dev
X-Gm-Message-State: AFuF++l+3X00h7eK847dDtzruDR/2WDj4KFRUuu3oM7IozHcCQNVBO6J
	BrpHWlPDwvegicaIwM5OMSpyAnXcOXjE0gMGVoDfjVkQVxDQh3NjnbkzP6BJN55WBirdy07jHF3
	cQIYMjQ==
X-Received: from pjff15.prod.google.com ([2002:a17:90b:562f:b0:38e:77e2:3e70])
 (user=seanjc job=prod-delivery.src-stubby-dispatcher) by 2002:a17:90b:17cd:b0:398:ba9e:75ff
 with SMTP id 98e67ed59e1d1-398ba9e7753mr31253638a91.21.1788291237665; Tue, 01
 Sep 2026 12:33:57 -0700 (PDT)
Date: Tue, 1 Sep 2026 12:33:50 -0700
In-Reply-To: <7eedeed241687f3b5f5953bf6717afd2bf5a58d2.camel@infradead.org>
Precedence: bulk
X-Mailing-List: sashiko-reviews@lists.linux.dev
List-Id: <sashiko-reviews.lists.linux.dev>
List-Subscribe: <mailto:sashiko-reviews+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:sashiko-reviews+unsubscribe@lists.linux.dev>
Mime-Version: 1.0
References: <20260826214952.129BB1F000E9@smtp.kernel.org> <7eedeed241687f3b5f5953bf6717afd2bf5a58d2.camel@infradead.org>
Message-ID: <apconttxYicjmZSd@google.com>
Subject: Re: [PATCH v10 21/21] KVM: x86: Use kernel timekeeping snapshot to
 get walltime+TSC
From: Sean Christopherson <seanjc@google.com>
To: David Woodhouse <dwmw2@infradead.org>
Cc: pbonzini@redhat.com, Thomas Gleixner <tglx@linutronix.de>, kvm@vger.kernel.org, 
	linux-kernel@vger.kernel.org, paul@xen.org, dongli.zhang@oracle.com, 
	sashiko-reviews@lists.linux.dev
Content-Type: text/plain; charset="us-ascii"

On Fri, Aug 28, 2026, David Woodhouse wrote:
> On Wed, 2026-08-26 at 21:49 +0000, sashiko-bot@kernel.org wrote:
> > [Severity: High]
> > Does removing KVM's local TSC clamping expose guests to mismatched time pairs?
> > 
> > When establishing the guest's PV clock, KVM provides a master clock
> > snapshot pairing a host TSC with a system time. The previous read_tsc()
> > logic explicitly clamped the TSC to cycle_last to maintain mathematical
> > consistency.
> 
> I think this is basically the same class of issue I brought up in
> https://lore.kernel.org/all/87v7beb7s3.ffs@fw13/ and Thomas said the
> right thing is just to ignore it?
>
> If the discrepancy was more than a few cycles, we shouldn't be in
> masterclock mode anyway, should we?

Agreed.  If a host CPU really has a TSC that is observably behind others, KVM
will mark the TSC unstable when loading a vCPU on that pCPU.

		s64 tsc_delta = !vcpu->arch.last_host_tsc ? 0 :
				rdtsc() - vcpu->arch.last_host_tsc;
		if (tsc_delta < 0)
			mark_tsc_unstable("KVM discovered backwards TSC");

And as Thomas pointed out, the discrepancy will show up at some point.  E.g. even
if the kernel provided a perfect pair, RDTSC from the guest would read a too-low
value since KVM has historically required identical offsets to use masterclock,
i.e. the guest would still be able to observe time going backwards if a vCPU did
__pvclock_clocksource_read() with a TSC that is behind the masterclock reference.
