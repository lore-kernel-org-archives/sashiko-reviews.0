Received: from mail-pl1-f202.google.com (mail-pl1-f202.google.com [209.85.214.202])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 55B5026C39E
	for <sashiko-reviews@lists.linux.dev>; Wed, 10 Jun 2026 19:35:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.202
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1781120134; cv=none; b=tf+DT7t5by2/HfiYAqeOkqsCjQiGS7wI0jt5x4icRy1JjklaXYivMT01vfb6IABief/l6YOpRFYZ8F4gWTeC3DJASiKUWRPOkke8tXOcNUvoqFKyIp+A1SBCdzDo+7njipc6LA9iOVlPHpAurv51Dtl59sLjlMQzrDB9ZZpHA7w=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1781120134; c=relaxed/simple;
	bh=LK7uQDvrcQgh523UutGordIYjAMZa9A3xyiaK41syLY=;
	h=Date:In-Reply-To:Mime-Version:References:Message-ID:Subject:From:
	 To:Cc:Content-Type; b=fIO1pnj9L5e+x3geXsXlKZR7FxeOziDye+jJN6R8nKBt/C29/abx+FUvUCUBb2A/GEBvmc3grSfwvuRM+irE3U7x5UqQ9d5Yryj0L3a+Kux41EWnSjnXLxDbNeBowQljdOIhdlE4QJO5WntD+70Evlr0b74A5Gswag4D1ONayFk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=flex--seanjc.bounces.google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=I59oyXGy; arc=none smtp.client-ip=209.85.214.202
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flex--seanjc.bounces.google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="I59oyXGy"
Received: by mail-pl1-f202.google.com with SMTP id d9443c01a7336-2c0bf6904a6so105135465ad.1
        for <sashiko-reviews@lists.linux.dev>; Wed, 10 Jun 2026 12:35:32 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20251104; t=1781120132; x=1781724932; darn=lists.linux.dev;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:from:to:cc:subject:date:message-id:reply-to;
        bh=EEoSZc/Ri3Fj9efC7RN3D4uVzworhU8OsOiH614JgHk=;
        b=I59oyXGyaCdYwGNZwUTXrAGP66z1h51wfMRXLVTeE3TyjjXX2h7zfp3br9UrHXC8q+
         EvamsWyKoTZyLqcRVgHGVESMhhZCq827ZsZomaYERuYQDaDELJCjD9cXBKRXT53xPKSL
         jdzkZuU6TySCJQRDNNu97F3cGO81bWgZiWiLlPxiKe4Ep6WHC3QDLm+ll9H9DZlcEUnv
         YNDt5rbN9VD1L0DzSSdoU1rMEb2GnkMEYdyiSYqfu+KQ68NJDvxV3MbfiM3c4fHqqhMw
         3ypL+0gkca89aTWGx8ANvM8zJ2TuDnzwGbKJNSjx51r64jRwxHNX0akfavyK3rK8gzVL
         ahug==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1781120132; x=1781724932;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=EEoSZc/Ri3Fj9efC7RN3D4uVzworhU8OsOiH614JgHk=;
        b=QvKaDM3hoH/mizEom0Inyz1MBkW89FIZW+JbExpLu0szvWQpvNJ00JpsCarKTmpOBj
         h5UinswuSyvlJnYMGTwDxAdlvogsUCCUCjq6mz98fgtulrMqLllUhDXZDUZt9CXxk0kY
         lF1fY2gu0rQfiQCduOcLPMnXy6uskHlRaFhG4ZspN9fEFf9Za7/QF3y3yZCZmXPuf50Z
         9LXoX8O2m5FQMdP5mpCgiFVKCdGSeSKmnsUa/WmfKHW63HI0himYG72KYARAXY620G5e
         2hklJoGb3WZyXXwK4fFnvrP0iil0fqNmbjucr4c4CzuFmNLDupet3bXOfwVmVcoing/G
         wL+Q==
X-Gm-Message-State: AOJu0YzBwk4fhqO5/nU2KTScD7dOemGP6FF1A0JXwPzx+NOdrNbIMN3+
	ESD6Ek2rjkeuMlTolY8b0CWygE/hH8cM7X8u0Ry5uy7IQZoK+qZApt8AvwPPupGiodQJwrhpkSx
	6Vl6igrkXcP4NTK+mWS8XXonWYaEPgT6IwQ4RnEYXE0RJmuyf/Wno8LoAmyeaT/moEXOHl6Ygaj
	Eyf/lcUdKohqIItF8EM9Ht/JsSlw29iFPKJv9JpoHIEDDiZzqr
X-Received: from plbiy23.prod.google.com ([2002:a17:903:1317:b0:2ba:1011:efb7])
 (user=seanjc job=prod-delivery.src-stubby-dispatcher) by 2002:a17:903:3847:b0:2c0:c262:b917
 with SMTP id d9443c01a7336-2c1e80e429amr312731605ad.5.1781120131430; Wed, 10
 Jun 2026 12:35:31 -0700 (PDT)
Date: Wed, 10 Jun 2026 12:35:30 -0700
In-Reply-To: <20260610010824.47A0D1F00893@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: sashiko-reviews@lists.linux.dev
List-Id: <sashiko-reviews.lists.linux.dev>
List-Subscribe: <mailto:sashiko-reviews+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:sashiko-reviews+unsubscribe@lists.linux.dev>
Mime-Version: 1.0
References: <20260610005338.2967132-6-seanjc@google.com> <20260610010824.47A0D1F00893@smtp.kernel.org>
Message-ID: <aim8giv0brgyIuv-@google.com>
Subject: Re: [PATCH v6 05/18] KVM: selftests: Add an irqfd send+receive (and
 later IRQ bypass) test
From: Sean Christopherson <seanjc@google.com>
To: sashiko-reviews@lists.linux.dev
Cc: kvm@vger.kernel.org
Content-Type: text/plain; charset="us-ascii"

On Wed, Jun 10, 2026, sashiko-bot@kernel.org wrote:
> > diff --git a/tools/testing/selftests/kvm/irq_test.c b/tools/testing/selftests/kvm/irq_test.c
> > new file mode 100644
> > index 0000000000000..9f8895b898214
> > --- /dev/null
> > +++ b/tools/testing/selftests/kvm/irq_test.c
> 
> [ ... ]
> 
> > +int main(int argc, char **argv)
> > +{
> > +	/*
> > +	 * Pick a random vector and a random GSI to use for device IRQ.
> > +	 *
> > +	 * Pick an IRQ vector in range [32, UINT8_MAX]. Min value is 32 because
> > +	 * Linux/x86 reserves vectors 0-31 for exceptions and architecture
> > +	 * defined NMIs and interrupts.
> > +	 *
> > +	 * Pick a GSI in range [24, KVM_MAX_IRQ_ROUTES - 1]. The min value is 24
> > +	 * because KVM reserves GSIs 0-15 for legacy ISA IRQs and 16-23 only go
> > +	 * to the IOAPIC. The max is KVM_MAX_IRQ_ROUTES - 1, because
> > +	 * KVM_MAX_IRQ_ROUTES is exclusive.
> > +	 */
> > +	u32 gsi = kvm_random_u64_in_range(&kvm_rng, 24, KVM_MAX_IRQ_ROUTES - 1);
> > +	u8 vector = kvm_random_u64_in_range(&kvm_rng, 32, UINT8_MAX);
> 
> [Severity: Medium]
> Is kvm_rng initialized before it is used here?
> 
> It appears that kvm_random_u64_in_range() is being called before
> vm_create_with_vcpus() executes later in this function, which is where
> kvm_rng normally gets initialized.
> 
> Because kvm_rng is a global variable and zero-initialized, the RNG algorithm
> will consistently yield 0. This causes the variables to always evaluate to
> their minimum bounds (24 for gsi and 32 for vector).
> 
> Does this defeat the intended randomization for this test?

Yeah, I'll add a patch to properly initialize kvm_rng.  I'll also add a patch to
seed libc's RNG before calling random(), because as-is, every x86 test uses
0x6b8b4567 to seed KVM's pRNG (and I assume the same holds true for all other
architectures).
