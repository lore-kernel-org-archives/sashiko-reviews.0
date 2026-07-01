Received: from mail-pf1-f201.google.com (mail-pf1-f201.google.com [209.85.210.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6E020399D08
	for <sashiko-reviews@lists.linux.dev>; Wed,  1 Jul 2026 20:05:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1782936329; cv=none; b=eSvCq9S0HKrYOjiCkTF/Bt8go9ONRY+b4u3vbdjiCSdNlTT2hMbxH7H3Dr5Wqa0e9VGO1YHVsIA3gI34TOiQ5UNFmVnTzj3Y8yayTy1TN6hoNYOmaeVG6o4a1Y/AKes93BS93ExbZXv9b/9/NqZGBK2sHbgBIeWNmYRcmrev0CI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1782936329; c=relaxed/simple;
	bh=PcSEF2MK/cHXB+Kv/gJgOEiv9hBkttCriZtxCNKAB2Q=;
	h=Date:In-Reply-To:Mime-Version:References:Message-ID:Subject:From:
	 To:Cc:Content-Type; b=MoVokAgkyVXLyo+ubunW1tzaaWJnbCtxriLZLWzBTHUqrjFMnThgqibAZIqTQyopcvfjSab6jkNpQlofl8XvC8jS72EkXU8sVDWCckVhC+5BRyPa5FvBYk+dUFV0g/C/z+cSyYgAw/OaY4vxkeHAEmK9Ub0mXmTGTZqES1abx4w=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=flex--seanjc.bounces.google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=XuIkUt5I; arc=none smtp.client-ip=209.85.210.201
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flex--seanjc.bounces.google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="XuIkUt5I"
Received: by mail-pf1-f201.google.com with SMTP id d2e1a72fcca58-845317fa7e6so1400810b3a.3
        for <sashiko-reviews@lists.linux.dev>; Wed, 01 Jul 2026 13:05:28 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20251104; t=1782936328; x=1783541128; darn=lists.linux.dev;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:from:to:cc:subject:date:message-id:reply-to;
        bh=1ULfZXJnLyQ1iTfhcSHKWEGPX6blmvdMahynjzwdjn4=;
        b=XuIkUt5IL/tXVoDfHfTU82bIdsF6TmkHfQW+UMCKpmYHMgYTe/gG1tep1AIAYrUUqC
         ywZTv72Pv986th5kkeJD7MVRU/1E32WNBi+xcNkEZd46rWZr4Iguy7MOrsR4pDw+nzPO
         /IJojBAiVLKbi+jRT5b/xCzX7VTuILPu1abfpEP9SFL0Y8qMIVukGCmBkYFkpNiAiFJy
         7QhoqZG9KWPrlYo5c3qpRAuc5grMyA1MkbIxvkSv+4stDT2UwpOvJBCQ//2hw6l8uTar
         169b3V5dsDS0cRLTvyINxIT0T31h4+iYqN9pnjPFBRvudgTA+4RWo5XT+iQreH77w8PV
         Wdzw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1782936328; x=1783541128;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=1ULfZXJnLyQ1iTfhcSHKWEGPX6blmvdMahynjzwdjn4=;
        b=jo8IGj400jV/x7fOfk9RmcNW+yyfd95aQRay92j88ubQSXUuXA+oX6M9yELaZsUolc
         avnpNtbcWCE5yKfiLGmZU7xPSQc8RVfxEc/yOELPgCfN6kO5Fu+UHoZN3YCZi0FX5EE8
         40wUuzypvICRf3naCEEO+odaQ1GAjo6I+QjAyPdd5aIw5Cn9S972hJy6l/j6I6Y5mli8
         YUmH3H0YInQbrxtp1hL8S5z0esyLtKDLtqP8HhLdiF543kC2vhOHvDg7gfFtUizrbX30
         92luclMeupfCwaC4rrXQXtRTRCkEJPauF2LC+c+1dcwYUMd28IGR+XhCBQSoVrCJyGiD
         zKYQ==
X-Gm-Message-State: AOJu0YwrKMgSDXDptewVuUqMPV96oEj5NJnJ9rkTVAow/MSQtLGdlQPG
	0LuwMwPSuj+KCoQh17atpsqKBFUzQKuTQbk5iE5Z8dF/mRj/w4LlGNq6MiV80BUjnUD2ebXswMh
	ypcYN9mW0d4qt5dOIyjb5gIhyZXF8vgD84NQY/NVq/hlz2+Up2FaagjLXxKflMbcbkWNXajnnV5
	uQ11PkGQZY17/VLTXvsNj6cGukNBO2fvCTJQu608kd7X1hsJ5Y
X-Received: from pfbfv4.prod.google.com ([2002:a05:6a00:6184:b0:847:9651:d996])
 (user=seanjc job=prod-delivery.src-stubby-dispatcher) by 2002:a05:6a00:4516:b0:842:5a8d:303a
 with SMTP id d2e1a72fcca58-847c0950567mr3079095b3a.37.1782936327311; Wed, 01
 Jul 2026 13:05:27 -0700 (PDT)
Date: Wed, 1 Jul 2026 13:05:26 -0700
In-Reply-To: <20260701194621.4BD691F000E9@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: sashiko-reviews@lists.linux.dev
List-Id: <sashiko-reviews.lists.linux.dev>
List-Subscribe: <mailto:sashiko-reviews+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:sashiko-reviews+unsubscribe@lists.linux.dev>
Mime-Version: 1.0
References: <20260701193212.749551-1-seanjc@google.com> <20260701193212.749551-2-seanjc@google.com>
 <20260701194621.4BD691F000E9@smtp.kernel.org>
Message-ID: <akVzBqcJt-H8XCZQ@google.com>
Subject: Re: [PATCH v5 01/51] x86/apic: Provide helpers to set local APIC
 timer period in hz and khz
From: Sean Christopherson <seanjc@google.com>
To: sashiko-reviews@lists.linux.dev
Cc: kvm@vger.kernel.org, linux-hyperv@vger.kernel.org
Content-Type: text/plain; charset="us-ascii"

On Wed, Jul 01, 2026, sashiko-bot@kernel.org wrote:
> Thank you for your contribution! Sashiko AI review found 1 potential issue(s) to consider:
> > diff --git a/arch/x86/kernel/apic/apic.c b/arch/x86/kernel/apic/apic.c
> > index aa1e19979aa8e..8d3d930576fd7 100644
> > --- a/arch/x86/kernel/apic/apic.c
> > +++ b/arch/x86/kernel/apic/apic.c
> 
> [ ... ]
> 
> > @@ -796,6 +796,16 @@ bool __init apic_needs_pit(void)
> >  	return lapic_timer_period == 0;
> >  }
> >  
> > +void apic_set_timer_period_khz(u64 period_khz, const char *source)
> > +{
> > +	lapic_timer_period = mul_u64_u32_div(period_khz, 1000, HZ);
> > +}
> > +
> > +void apic_set_timer_period_hz(u64 period_hz, const char *source)
> > +{
> > +	lapic_timer_period = div_u64(period_hz, HZ);
> > +}
> 
> [Severity: Medium]
> It looks like the source parameter is accepted by apic_set_timer_period_khz()
> and apic_set_timer_period_hz() in arch/x86/kernel/apic/apic.c but is never
> used. Was it intended to log the frequency using this source string?

/facepalm, yes.
