Received: from mail-pl1-f200.google.com (mail-pl1-f200.google.com [209.85.214.200])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 14DCA3FF1D5
	for <sashiko-reviews@lists.linux.dev>; Mon, 10 Aug 2026 14:22:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.200
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1786371754; cv=none; b=oanYGkPpH/QLNjbEoowJny9EsfXAhGg/v5axaJid//iXPtf+lDbR3uKjwBXBRxHgs/z6Z9DvHSwam8M8rbjecmWc00kMwmIawT3+SCmGLj+AhK8J+7/aq1AUSU4moBQS9pW2MuS0N2AsJfWfP5F1qvo9sOL5A7KFLK3kZkGaWTs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1786371754; c=relaxed/simple;
	bh=8g8km/C3yIxQynwOX3yaXcIqjAlktfsOY5bFp2UYV6Q=;
	h=Date:In-Reply-To:Mime-Version:References:Message-ID:Subject:From:
	 To:Cc:Content-Type; b=TlrH22ti9toUQYdLNvTX2exJGPVIq61OnINB8IMWfRIjHSrlci0pxwSxMIbSH8544dsnLW5cQl4FTA8Bbe1YHNn6P0QMqOFY0TOZ4AzTSnEfHXkxHhNGZrRXdNYZOmJdM+GGi15tJCv2UsRtNlXmrwIB/j7yPI/qqOqVF3TVrzE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=flex--seanjc.bounces.google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=sSHsN3vH; arc=none smtp.client-ip=209.85.214.200
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flex--seanjc.bounces.google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="sSHsN3vH"
Received: by mail-pl1-f200.google.com with SMTP id d9443c01a7336-2cceabd70f5so60953795ad.1
        for <sashiko-reviews@lists.linux.dev>; Mon, 10 Aug 2026 07:22:24 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20251104; t=1786371743; x=1786976543; darn=lists.linux.dev;
        h=content-type:cc:to:from:subject:message-id:references:mime-version
         :in-reply-to:date:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=Vyov84/MoszmkbZl8iei5CYtyOkdDWiwki2+Rn3v4lc=;
        b=sSHsN3vHoy4cUawo9KAiJg0kluY6ZfaeqNeRZtBXPahgw02UvwII7h9BwDwBe6WJ3p
         YXV8QyEtuEchdNj2geUEAQrrrKu3S5G0xt3P5SdjtCzUS/d78fuxbq/pgeO3P1nBUQH9
         3SW+0ezdyULQZcurHXsjTwx2QsAdYdrLOzleKOr0AucDwc/0v9jW9+OM67aGvFzzSImY
         N+IL/H4W/mcdlNP/NNt8ZjptnOLvATj4rMEaN9VgtnuOOqPBgeRgy4nLKF25GsnDJaHK
         jYAHWvZm+uegwDtojqVvyNhiNY2TtTnYj5QTQu41C53p370nZkxBUqL4g1/JEn5Hm/fD
         Lkfg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1786371743; x=1786976543;
        h=content-type:cc:to:from:subject:message-id:references:mime-version
         :in-reply-to:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=Vyov84/MoszmkbZl8iei5CYtyOkdDWiwki2+Rn3v4lc=;
        b=dgnyQccgJz2nGx1I9ywzwbCxFiguBPrW/2Zc9GWM/VYJKa8gTZdHZLcxYA6M92vi+8
         6LrfkWRCIYu2ya3KG6xUPbrzemanFs6isXdjm6qdIu6rfvgCQ/YYFqZ9//WoiRlQc/Li
         3gN1ZgYVypUE4zuJoHKSbIuQbVMh57L85R5SoEzuX67CO8e6H//K1SseFcGoVSrylx4C
         H9VNvTp5s9t4MEWtQQCObxL0t+0hZS+Y683vKZt9Fx6m+Hmmsw7+0UQ3tfGFELblA2ph
         vnAMkB9RhpkMoHrZ/vFsHeJftgpzKBGXs+sEGPFcKcuQfp801HCZjBKjyxbyqSz9Om9h
         vZ+Q==
X-Gm-Message-State: AOJu0Yy8HA9YrgyPESdCDV1W6gNCDnEiWISmC3pe2Lp9Cwz8TR9y2Bxb
	ntfBMuT46PKnoRTn+lL8lla9DcLZgtoAy0aGoWySgxVB377PVgUeiHJ8+rvRcHr3eoNUJuPOM0G
	TTRX2uw==
X-Received: from plbb11.prod.google.com ([2002:a17:903:c0b:b0:2d2:f257:ff6b])
 (user=seanjc job=prod-delivery.src-stubby-dispatcher) by 2002:a17:903:1847:b0:2ca:d91d:d3a7
 with SMTP id d9443c01a7336-2d294b46248mr294491635ad.10.1786371743067; Mon, 10
 Aug 2026 07:22:23 -0700 (PDT)
Date: Mon, 10 Aug 2026 07:22:22 -0700
In-Reply-To: <7c34aa00b566822c257c52c4b398809354f88bf8.camel@infradead.org>
Precedence: bulk
X-Mailing-List: sashiko-reviews@lists.linux.dev
List-Id: <sashiko-reviews.lists.linux.dev>
List-Subscribe: <mailto:sashiko-reviews+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:sashiko-reviews+unsubscribe@lists.linux.dev>
Mime-Version: 1.0
References: <20260804233923.3504629-1-seanjc@google.com> <20260804233923.3504629-6-seanjc@google.com>
 <20260805000221.B63F61F00A3A@smtp.kernel.org> <anN_J_KZhVJ1zIeI@google.com>
 <anUmdhx0Dh-yd89z@google.com> <anYBYu4rx-jCv8gr@google.com>
 <9D3BEB2D-1FC8-4607-BB92-8C26F138985A@infradead.org> <7c34aa00b566822c257c52c4b398809354f88bf8.camel@infradead.org>
Message-ID: <annenh5tqKQ0xWel@google.com>
Subject: Re: [PATCH v8 05/17] KVM: x86: Avoid NTP frequency skew for KVM clock
 on 32-bit host
From: Sean Christopherson <seanjc@google.com>
To: David Woodhouse <dwmw2@infradead.org>
Cc: sashiko-reviews@lists.linux.dev, kvm@vger.kernel.org
Content-Type: text/plain; charset="us-ascii"

On Sat, Aug 08, 2026, David Woodhouse wrote:
> On Fri, 2026-08-07 at 18:26 +0100, David Woodhouse wrote:
> > (Home and on the phone after an insane week; full attention span
> > might be limited until Monday).
> 
> Hi, my name is Dave and I'm an addict...
> 
> > The only reason the ktime snapshot stuff is last in the series is
> > because I did that work on the kernel's core timekeeping two years
> > after the rest of the series, and it was still sitting at the tip
> > branch at the time so I didn't want to make it a hard dependency for
> > the kvmclock series. Now the timekeeping stuff is merged we can fold
> > it all into the kvmclock series however we like.
> 
> I think that goes for "Compute kvmclock base without pvclock_gtod_data"
> too. It *isn't* at the end of the series, but I'm fairly sure (from
> memory) that it's one of the newer commits, and I just shuffled it
> earlier in the series for very similar reasons to the ones you're
> looking at now.

That's good, because I came to same conclusion last week :-)

This is what I now have locally as "part 1", which I'm planning on posting today.
It'll be too late for 7.3, but if part 1 looks good to you, I'll throw them in an
unstable topic branch for 7.4 so that we can consider them "done" and work on the
remaining patches.

  KVM: x86: Update "last guest TSC" snapshot prior to enabling IRQs/preemption
  KVM: x86: Improve accuracy of KVM clock when TSC scaling is in force
  KVM: x86: Explicitly disable TSC scaling without CONSTANT_TSC
  KVM: x86: Activate master clock immediately on vCPU creation
  KVM: x86: Compute kvmclock base without pvclock_gtod_data
  KVM: x86: Avoid NTP frequency skew for KVM clock on 32-bit host
  KVM: x86: Drop unnecessary CPU pinning when computing/getting kvmclock
  KVM: x86: Move "no master clock" fallback from __get_kvmclock() to get_kvmclock()
  KVM: x86: Wrap all of __get_kvmclock_master_clock() with CONFIG_X86_64=y
  KVM: x86: Fall back to non-master-clock if clockread fails in get_kvmclock()
  KVM: x86: Fix KVM clock precision in get_kvmclock() with TSC scaling
  KVM: x86: Use get_kvmclock() in kvm_get_wall_clock_epoch()
  KVM: x86: Fix compute_guest_tsc() to handle negative time deltas
  KVM: x86: Disable preemption, not IRQs, when getting TSC+freq pair
  KVM: x86: Make master clock logic in guest PV clock updates 64-bit only
  KVM: x86: Upscale TSC to "now", not master clock when updating PV clocks
  KVM: x86: Simplify and comment kvm_get_time_scale()
  KVM: x86: Remove implicit rdtsc() from kvm_compute_l1_tsc_offset()
  KVM: x86: Use kernel timekeeping snapshots for getting kvmclock time since boot
  KVM: x86: Use kernel timekeeping snapshot for monotonic clock
  KVM: x86: Use kernel timekeeping snapshot to get walltime+TSC
