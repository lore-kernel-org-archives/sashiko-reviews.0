Received: from mail-pj1-f70.google.com (mail-pj1-f70.google.com [209.85.216.70])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A6B2430C632
	for <sashiko-reviews@lists.linux.dev>; Wed, 29 Jul 2026 13:58:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.216.70
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785333491; cv=none; b=d8Gs7VDnLhiUsQE05y4Dd+BTqpjC/iguQvSp/avB2fRq8Yjv576m/AjSilSh8oNptMNE4M9dWM150vraBsyRhhVF953bDDqJL0D6Qn4W8Z7C2lm/GVabb7c5xFFctZlu7j7E8glPQ/x0JSluCF/PTX6A3ryFjh4uUcTRNc+w2OA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785333491; c=relaxed/simple;
	bh=7Krgk+KtP2kKGDNSULwxeCTj69yvjuzj5U135znDP8k=;
	h=Date:In-Reply-To:Mime-Version:References:Message-ID:Subject:From:
	 To:Cc:Content-Type; b=dkMX6r9gbDfhti1pvaC6XeqbN5oiTohaNukgL914TXMUrSVlRjxj2tu7jzbGbEhvkzZKuceETdstLcjFtcHyFEo129NHXjyus6X7frR5BJoM0l7PjEOg6QDnkaR8DiqetOuaIMj3mnkRyxre0phvnzzbhL05Hn+MaIz6obWIh3s=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=flex--seanjc.bounces.google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=eTcREsg8; arc=none smtp.client-ip=209.85.216.70
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flex--seanjc.bounces.google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="eTcREsg8"
Received: by mail-pj1-f70.google.com with SMTP id 98e67ed59e1d1-38f57e31b6eso1002433a91.1
        for <sashiko-reviews@lists.linux.dev>; Wed, 29 Jul 2026 06:58:03 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20251104; t=1785333480; x=1785938280; darn=lists.linux.dev;
        h=content-type:cc:to:from:subject:message-id:references:mime-version
         :in-reply-to:date:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=+gdyVGuXsSa8NOY4PO6tbgVt/hhgWTBtam/u21E/Axk=;
        b=eTcREsg89kxwPKtiAzXixI8YAYF7o0xBjpmPJVQBjh/V+sxnv511KDjOIvrJ4rbfhR
         EdZqheIs0yBUBv7G7bw7TXnZJkztqYKSKqMXnDNLJaWXrs+JBZSf5Y+beGTAF2EZw25d
         Q77N9RJsJN+Fpa1IceqLkScPAbJh+jmg8s0C6YVXvzhAzXykGtPwXMmw8IjrZTePCQnc
         buWNlI7m9B8/bWOGfTgpkJOlwvTq3ABJxHkyEUhWYtk13pmbfp34PY+8W895IBGPx6gF
         ThvqojKORvSJpu47kmF2M1ofd/DDsJGEjh4LIx6YB35IKq3kCJE7j7LyT/mYKegZPlfx
         PIWg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1785333480; x=1785938280;
        h=content-type:cc:to:from:subject:message-id:references:mime-version
         :in-reply-to:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=+gdyVGuXsSa8NOY4PO6tbgVt/hhgWTBtam/u21E/Axk=;
        b=Pj1nyeBuadRJmX4blM/dvefZ6xJQvCg7d51No5FNKqHb2TWGAqwCElfrq3SiB2JeYX
         h0XcbLmyGP/6i0Fmv7sPlGEbZcmbogvXqtZ05fOIHb93iPnL+bhBBOaATO1OvgCCMexE
         BN0iwPwFPSrjXIGW8skFjB41qnNYXmeQnbXljxWBY9S1+rIde26uEn2D6AnuKgk00T8E
         S8d5aAotu2UlOuVAHYNMAtjjTq+78QgwiGJoG+lMu5r69/absy7nUlPdU3gCKw4NvGnz
         NzS2k5fkHLyUMaA2ZtDejKeC7y1ShEkjQAcy2HEDRi04TBBaKv7OuUsn3eu0ta2NCFoj
         SpwA==
X-Gm-Message-State: AOJu0YyWbcllDeO7qkKDPF/lFE/5AjsrQkxN1P3tDVrdBqQxafR4MPt1
	KstOAlSLlgpMsNy0UmYNZ2C31FtS8HL27vilzHxaLZcrDGSo3Be7P4AIgTzyFLPeLbwSUK5j/Fq
	o3HxP1avu1mP/S5BFq/Z9IOr0PAgGeLE+4Z27bKokdCPlQ4vs2agLSUPxTbkFc8VJFPJl0ypaD8
	yuZ8OINggIkSE9Lft4U7BpEBZ2xNFwnpJErDTqlz5oldNfG/qX
X-Received: from plka3.prod.google.com ([2002:a17:903:f83:b0:2d0:237a:97bf])
 (user=seanjc job=prod-delivery.src-stubby-dispatcher) by 2002:a17:903:78e:b0:2cc:9763:e607
 with SMTP id d9443c01a7336-2d015d23403mr52805965ad.27.1785333479616; Wed, 29
 Jul 2026 06:57:59 -0700 (PDT)
Date: Wed, 29 Jul 2026 06:57:58 -0700
In-Reply-To: <20260729135054.B5CAA1F000E9@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: sashiko-reviews@lists.linux.dev
List-Id: <sashiko-reviews.lists.linux.dev>
List-Subscribe: <mailto:sashiko-reviews+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:sashiko-reviews+unsubscribe@lists.linux.dev>
Mime-Version: 1.0
References: <20260729134203.1377606-1-seanjc@google.com> <20260729134203.1377606-3-seanjc@google.com>
 <20260729135054.B5CAA1F000E9@smtp.kernel.org>
Message-ID: <amoG5v6YWX5FcB-e@google.com>
Subject: Re: [PATCH v6 2/2] KVM: VMX: Cap VMX preemption timer to work around
 Intel erratum
From: Sean Christopherson <seanjc@google.com>
To: sashiko-reviews@lists.linux.dev
Cc: kvm@vger.kernel.org
Content-Type: text/plain; charset="us-ascii"

On Wed, Jul 29, 2026, sashiko-bot@kernel.org wrote:
> Thank you for your contribution! Sashiko AI review found 1 potential issue(s) to consider:
> > diff --git a/arch/x86/kvm/vmx/vmx.c b/arch/x86/kvm/vmx/vmx.c
> > index 7d2cc36a04e51..67c8dc1eb2c4f 100644
> > --- a/arch/x86/kvm/vmx/vmx.c
> > +++ b/arch/x86/kvm/vmx/vmx.c
> 
> [ ... ]
> 
> > @@ -8305,6 +8306,33 @@ static inline int u64_shl_div_u64(u64 a, unsigned int shift,
> >  	return 0;
> >  }
> >  
> > +/*
> > + * Workaround for a widespread Intel erratum (e.g. EMR158) where the
> > + * VMX-preemption timer may expire earlier than expected when programmed
> > + * with large values. The workaround is to cap the timer value to strictly
> > + * less than 2^25 * CPUID.15H:EBX / CPUID.15H:EAX.
> > + */
> > +static __init u64 calc_preemption_timer_max_value(void)
> > +{
> > +	const u64 ARCHITECTURAL_MAX_VALUE = UINT_MAX;
> > +	u32 eax, ebx, ecx, edx;
> 
> [ ... ]
> 
> > +	if (WARN_ON_ONCE(!(((u64)ebx << 25) / eax)))
> > +		return ARCHITECTURAL_MAX_VALUE;
> > +
> > +	return (((u64)ebx << 25) / eax) - 1;
> 
> [Severity: High]
> If a CPU has a high TSC-to-crystal clock ratio (for example, EBX/EAX >= 128),
> could this calculation exceed UINT_MAX? Because the returned u64 is not clamped
> to ARCHITECTURAL_MAX_VALUE, preemption_timer_max_value could end up storing a
> value larger than 32 bits.

/facepalm

I completely misread this:

	return min_t(u64, 1ULL << 32, ((u64)ebx << 25) / eax);

as max_t.  I'll add it back... 
