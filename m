Received: from mail-pl1-f201.google.com (mail-pl1-f201.google.com [209.85.214.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 44FA24C9008
	for <sashiko-reviews@lists.linux.dev>; Thu,  4 Jun 2026 17:34:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1780594454; cv=none; b=FFGE83ywPyonBq2Z0GxXCEvgQrr54Wam5SvlOz5W56Zgj4abE5RA1AnLjX7Cahpoz6hS/HvAd1B+57ghoIJAkmu4GlUzXbfgdxLmBksUeFkvbPUeKSC4kBQDlJDDE961kftpywJrh2ykf1Mot1RUcSbYuDMtmDoOexnn4ySXN+c=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1780594454; c=relaxed/simple;
	bh=aCcdCngiQXJFZOtWdicopve/zATAi7XQT7CIIQpmm4M=;
	h=Date:In-Reply-To:Mime-Version:References:Message-ID:Subject:From:
	 To:Cc:Content-Type; b=CEbmR8eN8b2PgxhSWwl385ajgA3DN34bOd0ICZf4Ob228IcjvjbqjPTbQ5mSFM0tWIkQYUbLS4hFZm8fzMSSmFHFNEdRcg9LRjuAy0mIcxwI2iU2of/7oghL9DBDmNHNqCi/TxqNkolFBOvuXWRfKDUiZHAdgqJWlFa4cK30K+Q=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=flex--seanjc.bounces.google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=VoVCPkTu; arc=none smtp.client-ip=209.85.214.201
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flex--seanjc.bounces.google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="VoVCPkTu"
Received: by mail-pl1-f201.google.com with SMTP id d9443c01a7336-2c0c1e08848so14512485ad.0
        for <sashiko-reviews@lists.linux.dev>; Thu, 04 Jun 2026 10:34:13 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20251104; t=1780594452; x=1781199252; darn=lists.linux.dev;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:from:to:cc:subject:date:message-id:reply-to;
        bh=TDWsyQXu27Nqo39JjFp9cYOggBh6VemTZn9SCRN13K0=;
        b=VoVCPkTu9RLe7gP5tRaWgZxgKOZRaW9P4Y8uGxYmXFnhpNTIgE+2GH5te0FOK/Vo+h
         ayuIuGKsbxROYQ95ErKZJn4ovrOIX5p/GO09cgEKCzPNYixhMncmr9+R7XE6xIENROhC
         R5um3MgXoE+OB+bJduB0PaX5Yo6P9luVd59NDh87qHfdJEJXYq12wq7T2dBUMXi5tH7z
         AcoEx0/hTWAl4vIcbB81c77hO8GRmxWumhTprw6YbPikC2eIzZujSYeLRvKS/fYWwQ53
         LpGmDo+cSPZKd6wUZ+Cn+EFrR98IHzMCOK0ji6p3KX/PZ1pdQBoQJRJAdHr3xltgAZKd
         Tddg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1780594452; x=1781199252;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=TDWsyQXu27Nqo39JjFp9cYOggBh6VemTZn9SCRN13K0=;
        b=DDsMk6uMKqMI6OyX6cf/Zxiicrc7CRQmNmkPfrnIBVWMzn97jJ9a0cp4zPzSvEwte3
         zNweLJcYlDRsag4xMr+MBFjoVgGGeYiHJbx6Xcef2K0Y+Mrd0DVxk0L3msfoH/tsB7MA
         kVmS0ZO6LdOQks9e0sd99eJCrqUHG5p+EjRQCqmQhmAXvV0aorDra8e+faV+BDTmrr4h
         EOg6q+mRfBPcvobfbHTjG0h221Ewps0JBhHDW8QZKHL+df7rOYVCyT+AoPmNtgWxm7ZX
         bQkKZGL7QUERQq8OMPw1iLw9EOquoo/5OiGg2Zh/sBvGdw9b6HHNOFyt3IRVMJZ11XuT
         hX2w==
X-Gm-Message-State: AOJu0YxZ3y/EjW8nhBQB0zQIGcULhqPuwCQA9A/WKw9dAW6091RvG1uN
	o+zyGKv6Cn+Utn3QSh0tCl62qOiKHV8bT117GM0eac1eamhPAByyt3Ll7wktyKGOfqTblkGhTbP
	+9XlVrq7BeDR2LOxovYUJx8LyJ56KLJci8474V83LeHnRimE++JFxe+BN+rJK0WgvIUsbNoCUrB
	KW95o0NYe8QW5HjB+kjaOxnrkD6GrqmhtrJopGgx9OkquQONsy
X-Received: from plbjz7.prod.google.com ([2002:a17:903:4307:b0:2b0:b410:3605])
 (user=seanjc job=prod-delivery.src-stubby-dispatcher) by 2002:a17:902:e5cf:b0:2bf:1e37:a2ff
 with SMTP id d9443c01a7336-2c163606818mr93101205ad.0.1780594452275; Thu, 04
 Jun 2026 10:34:12 -0700 (PDT)
Date: Thu, 4 Jun 2026 10:34:11 -0700
In-Reply-To: <20260604022202.0B8F11F00893@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: sashiko-reviews@lists.linux.dev
List-Id: <sashiko-reviews.lists.linux.dev>
List-Subscribe: <mailto:sashiko-reviews+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:sashiko-reviews+unsubscribe@lists.linux.dev>
Mime-Version: 1.0
References: <20260604020143.748245-22-jrhilke@google.com> <20260604022202.0B8F11F00893@smtp.kernel.org>
Message-ID: <aiG3E7ggqVuqDhzU@google.com>
Subject: Re: [PATCH v5 21/21] KVM: selftests: Add xAPIC support in IRQ test
From: Sean Christopherson <seanjc@google.com>
To: sashiko-reviews@lists.linux.dev
Cc: Josh Hilke <jrhilke@google.com>, kvm@vger.kernel.org
Content-Type: text/plain; charset="us-ascii"

On Thu, Jun 04, 2026, sashiko-bot@kernel.org wrote:
> > diff --git a/tools/testing/selftests/kvm/irq_test.c b/tools/testing/selftests/kvm/irq_test.c
> > index 41c50caa928e2..7e421cb7bc69b 100644
> > --- a/tools/testing/selftests/kvm/irq_test.c
> > +++ b/tools/testing/selftests/kvm/irq_test.c
> [ ... ]
> > @@ -31,14 +32,20 @@ static bool done;
> >  
> >  static u32 guest_get_vcpu_id(void)
> >  {
> > -	return x2apic_read_reg(APIC_ID);
> > +	if (x2apic)
> > +		return x2apic_read_reg(APIC_ID);
> > +	else
> > +		return xapic_read_reg(APIC_ID) >> 24;
> >  }
> 
> [Severity: Medium]
> Does this truncation to 8 bits cause the test to silently hang if run with
> 256 or more vCPUs in xAPIC mode?

Yep.

> For vCPU IDs 256 and above, the 8-bit xAPIC ID will wrap around.

But not because of wraparound (it's amusing how bad AI is at basic math, when
it's so good with advanced stuff).  The test will use IDs [0-255], not [1-256].
The limit with xAPIC is specifically 255 vCPUs, not 256, because 0xff (i.e. ID
255) is a special broadcast value.
