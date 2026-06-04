Received: from mail-pg1-f201.google.com (mail-pg1-f201.google.com [209.85.215.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6565D4C6F14
	for <sashiko-reviews@lists.linux.dev>; Thu,  4 Jun 2026 17:29:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.215.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1780594145; cv=none; b=ToKCcGdpN4EfOcbTB7Mg9lkXXgHzXLntzuB3+pc/B2n+L4iYInSljVTSoj8cePpzCOX5Au43Cr0UyqgUEt8lsK3aIxQiYkoUnfopm4QBxpRojXM/FiNRPAoTXG5cZcvg2qHJSbiU9sSdObPYQB+D1Saf9Y+dEpdOQt4PvKvCVpk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1780594145; c=relaxed/simple;
	bh=K9ZYKq0YNoYW3fcWvfSnKRK/FCvwVzIOx+OfBeDdh6c=;
	h=Date:In-Reply-To:Mime-Version:References:Message-ID:Subject:From:
	 To:Cc:Content-Type; b=qqZPzPpl323rBsJIycObdciE5lFY2Wz8q7L0rISzAnhefJS2oLLDP5U5q/qt2a2GUcwHo9mZFLuUugFjYWAbeO9/MYg992nr5jNuXvkOaF/HlFdyn6Mg12RRGzFtq2segLq7lr8HMCzN4j8bcqhIthGBhpbo6gnpcZ4cBByBcgA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=flex--seanjc.bounces.google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=eO3zDnJP; arc=none smtp.client-ip=209.85.215.201
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flex--seanjc.bounces.google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="eO3zDnJP"
Received: by mail-pg1-f201.google.com with SMTP id 41be03b00d2f7-c85a2bf5388so627120a12.1
        for <sashiko-reviews@lists.linux.dev>; Thu, 04 Jun 2026 10:29:04 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20251104; t=1780594144; x=1781198944; darn=lists.linux.dev;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:from:to:cc:subject:date:message-id:reply-to;
        bh=O7SNp5SHBgpgOhELDHiwpBP7AwlGI1faTtmzfFHorQs=;
        b=eO3zDnJP68sEnMAsvOy8/CAIK2Wv/4lAC0NH8ztbieCHlAHtvWgShmYtLkChzVgn/R
         Ei7C2bel+7ozymvfcUMxJ0XnusqAcpr/GqZEDoVJsvfdGVgCQCjX/qeI+RNRNm0/Ish2
         8Uv2PijNYza0yY02Om76Q7m7bU39tTn/TYdXq1DeC8iY5ShWcOlkj9LtvnaPN7qxH3xf
         eAQyq0HxFOGOEzmF5jT10s49i4iaFeGWlpuUQWYk0qzz7ZhUH3S7A7pXZShBjyvULDW5
         9DvLaDHOT6bkpLYU9gkkVDHZyZxYClYKPBaBw9Sz4BknZeDkU0n6y1LFAQ5gSEV5LnHq
         biww==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1780594144; x=1781198944;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=O7SNp5SHBgpgOhELDHiwpBP7AwlGI1faTtmzfFHorQs=;
        b=IPGPFbvaadJ2Q2a3TJhdHGkUNvc4BM3kjG6q2YPH3RcdFdi1b74B40UV5xehH9CFaw
         dFMd1D+lFM+a2KlJOZ2RhkocFXFtMePRE4yjFATsoCMSSVY0V0E9OzElJXYXO+joRk0w
         qMEvZLsCx2Xpqg0X0AKJqU8uA8br+yE0qyYx5avffIiJFaD2Yb3bSzuRHfym9SxGWrwP
         Nt4uLWYVmoOu9a8eotDQNo2Hz5ToRQhEEF3HpNPMh39EqrJALLKbw5R7CcEE0Jkf3AMC
         gpk9EKCjs+4K4w61TLNyvd1FuOe9qWe/1jVmlcUOpFCKEKnWN4aTdI10guLKmSAlQeCW
         /wKg==
X-Gm-Message-State: AOJu0YymtIYhwk7wZjkgi/xHPkTLDYiTiRje6FYvTpNZaYXoxpjcsv+s
	GfpnLMZp1PtgfsfDl9ROQClag5+YJRhCncWUBtHUhL7iMn7JbihUa9cjt/PPoGdHtRjppq0Qnd8
	HDqurxOQMk+ge+lz+kP7IUqsUc1CeFuxVnYXsdV9kgiP4nihiT931RdV83FHqfHqyqR2OJC99G7
	QkB8vm/h1ejd/UnGdKGq/57cNf+V2Y1vpyDeE+4jN88F0omUSL
X-Received: from pfad23.prod.google.com ([2002:a05:6a00:297:b0:842:37d7:2fef])
 (user=seanjc job=prod-delivery.src-stubby-dispatcher) by 2002:a05:6a00:9094:b0:842:54c1:8e15
 with SMTP id d2e1a72fcca58-84284ecf490mr9177090b3a.29.1780594143231; Thu, 04
 Jun 2026 10:29:03 -0700 (PDT)
Date: Thu, 4 Jun 2026 10:29:02 -0700
In-Reply-To: <20260604022049.A44EB1F00893@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: sashiko-reviews@lists.linux.dev
List-Id: <sashiko-reviews.lists.linux.dev>
List-Subscribe: <mailto:sashiko-reviews+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:sashiko-reviews+unsubscribe@lists.linux.dev>
Mime-Version: 1.0
References: <20260604020143.748245-21-jrhilke@google.com> <20260604022049.A44EB1F00893@smtp.kernel.org>
Message-ID: <aiG13utvmTJeHbnV@google.com>
Subject: Re: [PATCH v5 20/21] KVM: selftests: Make number of vCPUs
 configurable in IRQ test
From: Sean Christopherson <seanjc@google.com>
To: sashiko-reviews@lists.linux.dev
Cc: Josh Hilke <jrhilke@google.com>, kvm@vger.kernel.org
Content-Type: text/plain; charset="us-ascii"

On Thu, Jun 04, 2026, sashiko-bot@kernel.org wrote:
> Thank you for your contribution! Sashiko AI review found 1 potential issue(s) to consider:
> - [Medium] Missing bounds check on user-supplied `nr_vcpus` allows stack buffer overflows and out-of-bounds global array accesses.
> --
> 
> commit 115e22303a8d11509c805d6bfdcdbd39b670c16d
> Author: David Matlack <dmatlack@google.com>
> 
> KVM: selftests: Make number of vCPUs configurable in IRQ test
> 
> This commit adds a '-v' flag to tools/testing/selftests/kvm/irq_test.c,
> allowing users to configure the number of vCPUs to run in the test.
> 
> > diff --git a/tools/testing/selftests/kvm/irq_test.c b/tools/testing/selftests/kvm/irq_test.c
> > index 1d66293b6d0b8..41c50caa928e2 100644
> > --- a/tools/testing/selftests/kvm/irq_test.c
> > +++ b/tools/testing/selftests/kvm/irq_test.c
> [ ... ]
> > @@ -213,6 +214,9 @@ int main(int argc, char **argv)
> >  		case 'n':
> >  			use_nmi = true;
> >  			break;
> > +		case 'v':
> > +			nr_vcpus = atoi_positive("Number of vCPUS", optarg);
> 
> [Severity: Medium]
> Does this code need a bounds check for nr_vcpus against KVM_MAX_VCPUS?

Yep.  It also needs to configure the test to enable x2APIC format and disable
KVM's broadcast quirk, otherwise running with 255+ vCPUs will fail due to KVM
blasting an IRQ to all vCPUs when trying to target vCPU 255.
