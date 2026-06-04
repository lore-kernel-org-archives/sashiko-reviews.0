Received: from mail-pj1-f73.google.com (mail-pj1-f73.google.com [209.85.216.73])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 35BE939EF39
	for <sashiko-reviews@lists.linux.dev>; Thu,  4 Jun 2026 16:12:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.216.73
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1780589577; cv=none; b=h7EkGFTYw/+30zmHtCMM7J9Mz6SiucpwoRApAQpkMh32joiWoF7WWnLWCWCLp8B+bJU5oMTAQq22p8iv0CZfwmebDjvwXvrYYXC/SmWd7eb1H9rV6UKgs6Mgd+MAyFVLomQdKso50m+j+Wa7TpjMQasfROrKsiOYzJdFnJOgTiA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1780589577; c=relaxed/simple;
	bh=r5q17zAJ5FVo6m2eXuZpQdHcUcqOccrbNsR+ygn1HHQ=;
	h=Date:In-Reply-To:Mime-Version:References:Message-ID:Subject:From:
	 To:Cc:Content-Type; b=nyQ2aScLmNH6ots1sWgl3OAHsAwUmi1jaQxBFPhMwU4WqjaaZ6zhDnVlz4LtjGWZXIsr8lr8AKEYmaq/8XdB5dcN1ocOJ4atDNC0qBxff1OoqNh2QDdX8lWvHsrZByUvsMZwhX288gC8sLwnbxnEYiBSKA3kOrHRZhJpzGXiMuw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=flex--seanjc.bounces.google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=c1j9vEln; arc=none smtp.client-ip=209.85.216.73
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flex--seanjc.bounces.google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="c1j9vEln"
Received: by mail-pj1-f73.google.com with SMTP id 98e67ed59e1d1-36b808bedfaso1265755a91.1
        for <sashiko-reviews@lists.linux.dev>; Thu, 04 Jun 2026 09:12:56 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20251104; t=1780589575; x=1781194375; darn=lists.linux.dev;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:from:to:cc:subject:date:message-id:reply-to;
        bh=qHofGI5BidNPmhFV7CbtCFar5wuofTyEezac0pXH5gE=;
        b=c1j9vElnys+hLjMlXpOBygFaNDIDpsIHI3m16xtSDmzAqcw0imdSvNO6+/idDOtua+
         sOBpEr00psVdZYzn/92C8OKt2X9uYomoauwJVXf/HFilMry6FbaMV55lu10vVaIYjpDM
         znlM8BXiupOqC3V/beBSPyar+kpWk80p3b9Bk2rW9OmXemzp9iZSYBxTRMFlUxGj/B7y
         0YniuCh3wHXF/A+1sibhj0sQjKTWc6AMb1pKjZrc8U2wNkGJGTSiW6wi/20FbJrzDr2z
         9EksGQ+bc+vRwhX/Q4a38Qn5sGk6jpWnzzNSTJfNlo1d+3wR1WWyLz2WbZIdRUGM3OzL
         CFtA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1780589575; x=1781194375;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=qHofGI5BidNPmhFV7CbtCFar5wuofTyEezac0pXH5gE=;
        b=Td/AlYWXcmpo9IX66E50OaJM88TVX8O2zX2PsEpOw48Qm/jwvoqVR2Wk7Dio1ngriU
         PLK/zJQTyOB+ZM4sGgNzfk5JcLK++ol1yiSfMoA0IG4aHC/7uhDNrOG/0rjazfcRLHJv
         7gbOdXLBY2KQbViha4Pejpo2TIMg7TCy+ZvQ+e5B0OO4W/6EEYP3UjX+9T63Ac7YTIzx
         0ZNz716tXSbu+9Ehd1gW1u68JQdmHEhRRaz9pl4Kd3vc2uur5//cdrTHt32JNoe9XYV6
         jeEXu2/HY9dd8hEf0fcRIJTbwtztufPlHfE/B9w0AF0GpTpjOQf0wWJEfOcsiSt2vZDu
         1+Xw==
X-Gm-Message-State: AOJu0Yw6wI8G4ZuRZiVlU9ozmPBsFPMrXfHQz4TTBEVySaJcNPSR0LC0
	1m93jU8lmeh9kQ7QacpNh05Vu4Kmziuj4tuTxmkNqpxzrNetDbwMBaY7HxPbjzSjFFGmbTiQRMN
	FFpalp7+kuIQZlFViixpKbl5mNXoAi3cGgmI9hQXOIwCnrOBh0VjS8ghKxe3tm8UmdjejN9wniy
	blId2LUIqPbs3piPPTmcPVZaWmdGL9S+UOz+l5m6nq1Qdk/wCG
X-Received: from pjqx13.prod.google.com ([2002:a17:90a:b00d:b0:36b:a7c4:95be])
 (user=seanjc job=prod-delivery.src-stubby-dispatcher) by 2002:a17:90b:3e8d:b0:36b:afa0:c675
 with SMTP id 98e67ed59e1d1-36e31cacd39mr7915263a91.26.1780589575061; Thu, 04
 Jun 2026 09:12:55 -0700 (PDT)
Date: Thu, 4 Jun 2026 09:12:54 -0700
In-Reply-To: <20260604021233.703BC1F00893@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: sashiko-reviews@lists.linux.dev
List-Id: <sashiko-reviews.lists.linux.dev>
List-Subscribe: <mailto:sashiko-reviews+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:sashiko-reviews+unsubscribe@lists.linux.dev>
Mime-Version: 1.0
References: <20260604020143.748245-5-jrhilke@google.com> <20260604021233.703BC1F00893@smtp.kernel.org>
Message-ID: <aiGkBodadEKK9F-w@google.com>
Subject: Re: [PATCH v5 04/21] KVM: selftests: Add helper to generate random
 u64 in range [min,max]
From: Sean Christopherson <seanjc@google.com>
To: sashiko-reviews@lists.linux.dev
Cc: Josh Hilke <jrhilke@google.com>, kvm@vger.kernel.org
Content-Type: text/plain; charset="us-ascii"

On Thu, Jun 04, 2026, sashiko-bot@kernel.org wrote:
> > @@ -42,6 +42,24 @@ u32 kvm_random_u32(struct kvm_random_state *state)
> >  	return state->seed;
> >  }
> >  
> > +/* Returns a random u64 in the inclusive range [min, max] */
> > +u64 kvm_random_u64_in_range(struct kvm_random_state *state, u64 min,
> > +			    u64 max)
> > +{
> > +	u64 value;
> > +	u64 range;
> > +
> > +	TEST_ASSERT(min <= max, "PEBKAC, min = 0x%lx, max = 0x%lx", min, max);
> > +
> > +	value = kvm_random_u64(state);
> > +
> > +	range = max - min;
> > +	if (range == ULLONG_MAX)
> > +		return value;
> > +
> > +	return min + (value % (range + 1));
> 
> [Severity: Medium]
> Will this return values uniformly across the entire 64-bit range?
> 
> Because kvm_random_u32() uses a Lehmer PRNG with a modulus of 2^31 - 1, its
> maximum return value is 0x7FFFFFFE. When kvm_random_u64() concatenates two
> of these values, the maximum possible output is 0x7FFFFFFE7FFFFFFE, meaning
> bits 31 and 63 are never set.
> 
> Due to this restricted PRNG space, using the modulo operator here means the
> function cannot generate values in the upper half of large ranges (above
> 0x7FFFFFFE7FFFFFFE). It also introduces significant modulo bias for ranges
> that don't evenly divide this artificial maximum, preventing uniform coverage
> of the requested [min, max] range.

Not sure how much I trust AI's ability to reason about math, given past "bug"
reports.  Regardless, this is a problem to solve in the future.
