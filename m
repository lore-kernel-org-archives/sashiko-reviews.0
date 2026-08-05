Received: from mail-pl1-f198.google.com (mail-pl1-f198.google.com [209.85.214.198])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6473A344DBB
	for <sashiko-reviews@lists.linux.dev>; Wed,  5 Aug 2026 18:21:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.198
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785954090; cv=none; b=lMq/d1sjCDVLwfvzC1ER3IvNhGsnu23m8ILKdZIMNdsDS5f1juVjuux+uNTJu5q5OZAaHayiHv26eEwwVM+keL+KxvBSb0Vn9E+hnE3GWxtHVoTuc67JcK8PSWrazjiFePmNIqWIk/zYWdOQze0l3Bh5Ifyr0IvwCpgyI1V3dy4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785954090; c=relaxed/simple;
	bh=9fJb0wZH0z6hck2CBnOdzStPQcFWMfBsTsB4QHGunjI=;
	h=Date:In-Reply-To:Mime-Version:References:Message-ID:Subject:From:
	 To:Cc:Content-Type; b=MoaY6AbUAA5EzwtF6vuNeEOVNQH927oVMvGFhcfPWHnPHgtFESY3K1rYeVhAgtPD+CzWG+xYqTl1MyhaZYOW4RYFNp7wwKfhbpCX9Y8Qts7I85Y+WprbPLNn0uEEpJxLGanTeuhr1tx9bhP325HVKw5LCNRh9Op2YOHd36vldvY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=flex--seanjc.bounces.google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=iDb6dadJ; arc=none smtp.client-ip=209.85.214.198
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flex--seanjc.bounces.google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="iDb6dadJ"
Received: by mail-pl1-f198.google.com with SMTP id d9443c01a7336-2cacf17c7e0so18337295ad.0
        for <sashiko-reviews@lists.linux.dev>; Wed, 05 Aug 2026 11:21:29 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20251104; t=1785954089; x=1786558889; darn=lists.linux.dev;
        h=content-type:cc:to:from:subject:message-id:references:mime-version
         :in-reply-to:date:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=1GZGO1JysfmZWx0l+jqEVxaqyv+fx5r7+USUPbwQyoI=;
        b=iDb6dadJb6uETQMwGqAOz+iIBu4fNJzMH1xxH2129deJz+5MkIyzraTxwYrFWxPk2I
         SDmvXK2IapduoRqG72tArHz7WISPdJt7qRLoNmtTQVhfXE0HKy+eT4lPnG/Z6mnw1cs0
         LpAutJeFZUCWPcnZjOv/iD3ewABK9nzq4xbK/NQQJbW78hBvjMrd0bVA5LKMbtEvaTz+
         yvVE3bPkY2IADujaLht/zf4YhYbL7K5AsN7MvY5bPqnaIvfs6wnr+M6HYLM6JueN1Rmy
         vYWv7+XBTdud+mRGruYpJKGZJjNJGKDZxBeV9luSVZyQFgvjF+xo7gnMMQSRoTPBPa9w
         OaFw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1785954089; x=1786558889;
        h=content-type:cc:to:from:subject:message-id:references:mime-version
         :in-reply-to:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=1GZGO1JysfmZWx0l+jqEVxaqyv+fx5r7+USUPbwQyoI=;
        b=VXfQkm2nHa38P2jx1GAxFk3ruAOSpMsHZW//culy8HElc6l9PPECZQxmXowf0Q8Twy
         G1n7WPidw+4BjHK/NQ2Q7eobmD2gNi/MGWLbvQ9sFNfGCCoHnrAhKwemESEGNsly4V4C
         yywhdMDCnwBNlxZMGY8witRSbeGheZ6D9u1DDJtPobfvrZ5sBGrGZen09XObVA8n7wgc
         tqqilDDrMG0nucmAIfJcjtwKWALMdIdUjVvo5JlX+5a+os2llMk1ho6dYt6ylaN0AUgL
         XC5HQNPgLCJab8TGO8l0YTg6EELA/dyd9cRHhJz8Z320yCBlrF7j6peUB9RtI0VFwkB4
         S26A==
X-Gm-Message-State: AOJu0Yz7pptcqZ7lJqfcNMLgTCadoHP3/vSSiS1g6ODK0KyW2b7r5qAu
	VBWaoGYYmVwZxm/wu1sRLoxdyg7upsF0RKp2UU9S8HJ8g+8n/W+kxtK1l5GW68NDhUPhbeolBed
	8BV+8uAz9nHFEN/ZFYX8PeQPXXY+snAH1fGFGpbbU40HkmEoLUrLNak1CojhB6JB5YyLHHNIuFK
	4CQuCYyBw1kTLI76KsOtPFt2J1vwpLuJqqaIvOjfEC9TQn8Oa1
X-Received: from pjji3.prod.google.com ([2002:a17:90a:6503:b0:381:224:393a])
 (user=seanjc job=prod-delivery.src-stubby-dispatcher) by 2002:a17:90b:5112:b0:381:28e0:6259
 with SMTP id 98e67ed59e1d1-3903c592115mr9552727a91.9.1785954088215; Wed, 05
 Aug 2026 11:21:28 -0700 (PDT)
Date: Wed, 5 Aug 2026 11:21:27 -0700
In-Reply-To: <20260805000221.B63F61F00A3A@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: sashiko-reviews@lists.linux.dev
List-Id: <sashiko-reviews.lists.linux.dev>
List-Subscribe: <mailto:sashiko-reviews+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:sashiko-reviews+unsubscribe@lists.linux.dev>
Mime-Version: 1.0
References: <20260804233923.3504629-1-seanjc@google.com> <20260804233923.3504629-6-seanjc@google.com>
 <20260805000221.B63F61F00A3A@smtp.kernel.org>
Message-ID: <anN_J_KZhVJ1zIeI@google.com>
Subject: Re: [PATCH v8 05/17] KVM: x86: Avoid NTP frequency skew for KVM clock
 on 32-bit host
From: Sean Christopherson <seanjc@google.com>
To: sashiko-reviews@lists.linux.dev
Cc: kvm@vger.kernel.org
Content-Type: text/plain; charset="us-ascii"

On Wed, Aug 05, 2026, sashiko-bot@kernel.org wrote:
> > diff --git a/arch/x86/kvm/x86.c b/arch/x86/kvm/x86.c
> > index 3107878a6fe5d..8f469fd9863f9 100644
> > --- a/arch/x86/kvm/x86.c
> > +++ b/arch/x86/kvm/x86.c
> 
> [ ... ]
> 
> > @@ -915,13 +914,6 @@ static s64 get_kvmclock_base_ns(void)
> >  	/* Count up from boot time, but with the frequency of the raw clock.  */
> >  	return ktime_to_ns(ktime_add(ktime_get_raw(), pvclock_gtod_data.offs_boot));
> 
> [Severity: Low]
> Will reading the 64-bit pvclock_gtod_data.offs_boot without seqcount
> protection or data_race() annotations trigger KCSAN data race warnings on
> 32-bit systems?
> 
> By removing the ktime_get_boottime_ns() fallback, this read now executes on
> 32-bit architectures where it compiles to two non-atomic 32-bit accesses.
> If a KVM vCPU thread calls get_kvmclock_base_ns() while a timer interrupt
> runs timekeeping_update(), it overwrites offs_boot.
> 
> Even though the value only actually changes during suspend when the freezer
> subsystem guarantees vCPU threads are frozen (preventing functional tearing),
> overwriting the identical value concurrently with an unprotected read still
> introduces a formal C11 data race.

Huh.  And strictly speaking, 64-bit could tear the store/load.  Stealing heavily
from ktime_mono_to_any(), this as a prep patch plus fixup (not yet tested)?

diff --git a/arch/x86/kvm/x86.c b/arch/x86/kvm/x86.c
index b6e1dfd6db6a..57679d871581 100644
--- a/arch/x86/kvm/x86.c
+++ b/arch/x86/kvm/x86.c
@@ -921,7 +921,8 @@ static void update_pvclock_gtod(struct timekeeper *tk)
 
        vdata->wall_time_sec            = tk->xtime_sec;
 
-       vdata->offs_boot                = tk->offs_boot;
+       /* Pairs with the READ_ONCE() in get_kvmclock_base_ns(). */
+       WRITE_ONCE(vdata->offs_boot, tk->offs_boot);
 
        write_seqcount_end(&vdata->seq);
 }
@@ -929,7 +930,26 @@ static void update_pvclock_gtod(struct timekeeper *tk)
 static s64 get_kvmclock_base_ns(void)
 {
        /* Count up from boot time, but with the frequency of the raw clock.  */
-       return ktime_to_ns(ktime_add(ktime_get_raw(), pvclock_gtod_data.offs_boot));
+       struct pvclock_gtod_data *gtod = &pvclock_gtod_data;
+       ktime_t raw = ktime_get_raw();
+       ktime_t now;
+
+       /*
+        * Synchronization with clock updates isn't required on 64-bit as only
+        * one field is being consume
+        * */
+#ifdef CONFIG_X86_64
+       now = ktime_add(raw, READ_ONCE(gtod->offs_boot));
+#else
+       unsigned int seq;
+
+       do {
+               seq = read_seqcount_begin(&gtod->seq);
+               now = ktime_add(raw, *offset);
+       } while (read_seqcount_retry(gtod->seq, seq));
+#endif
+
+       return ktime_to_ns(now);
 }
 
 static uint32_t div_frac(uint32_t dividend, uint32_t divisor)
