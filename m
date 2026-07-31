Received: from mail-pf1-f198.google.com (mail-pf1-f198.google.com [209.85.210.198])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CEDF71DED40
	for <sashiko-reviews@lists.linux.dev>; Fri, 31 Jul 2026 13:00:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.198
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785502831; cv=none; b=HWUU0+DE/91wsFcuHHnNqC+ZPSmbe7Uwp7pd0E309BpL7kzA3cp9kSM5JvQK/eozF1r/wWOLkCsDrqH1+nvJ7K/97rBxBX6dZ7aTlFS6rWHm4pi+LNVS4tkiC3/TlqFKwseHpE2yr/I4wCdvSSG6Vt/Kk2qp5wSlcP84YIUZzvk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785502831; c=relaxed/simple;
	bh=gP0NW1Gj2B2BTBK8qEpzwW+mSr4iWHeoSNmWkG0WWDg=;
	h=Date:In-Reply-To:Mime-Version:References:Message-ID:Subject:From:
	 To:Cc:Content-Type; b=NuAQrcMTkr+kCtjouKyfDSdmf4N+lm88HXC6vbXv05Pu24299G+/1HXC5U/aOBL5XOyvuQWg9f0Uk/wxwiQZFLn94Am7sQ1EWnOzIvmTIPxjsLDyd5WTEoZdC0N0ma3uF958m/7oifMTJ6jzCsM+OkuOUj7qyyR+VBHAHpAW5BM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=flex--seanjc.bounces.google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=fll3LKvQ; arc=none smtp.client-ip=209.85.210.198
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flex--seanjc.bounces.google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="fll3LKvQ"
Received: by mail-pf1-f198.google.com with SMTP id d2e1a72fcca58-84857446424so1926181b3a.1
        for <sashiko-reviews@lists.linux.dev>; Fri, 31 Jul 2026 06:00:29 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20251104; t=1785502829; x=1786107629; darn=lists.linux.dev;
        h=content-type:cc:to:from:subject:message-id:references:mime-version
         :in-reply-to:date:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=XFQU8iH1zNafQF+sd3fwpkuxE9NFiGxCV4Yz8a5shVE=;
        b=fll3LKvQTJ0fodDirLbC1eqz5phoYjrtrX11rppekExK7GXyAyI4F+wN79/GcQZrUT
         dvIMw+Lvfgw/NENzN6WE4rYNAwhXelLmdu/NhgFc6S7QH++c10k5DYjReaJI9UzThP9q
         HS3WYpDCOhpOj7gYJFiaHkv0As+tiegBIDXQhI8vidwGOquNlRj0YUxnocQTTEwMMpCv
         d13if/tK4E+7Ocoy7fX0WG7a+3n4MElJh8wU/OphwhXeDu3tW+OM7Gyb7ZbnORQzEurh
         hVpxDVSY4jYPW3Wo9ChZ+o8q5aJ3iqjv3GWB2b2apNz590Fcc+hAgIGwKMEUzllQnhwJ
         C8eg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1785502829; x=1786107629;
        h=content-type:cc:to:from:subject:message-id:references:mime-version
         :in-reply-to:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=XFQU8iH1zNafQF+sd3fwpkuxE9NFiGxCV4Yz8a5shVE=;
        b=BQ/2dGVv4Ie+E8bZ7ykf9urrQ45rHysHsT41NxAxi2DOKOZe9UjsJHpzhaZOdjmawJ
         GODA2NwV5cPedE6au0lIBzSQzGCBiEyk+v2hZi5HJ7izFFC5dlV7nGP2Ve2UpRMs28SF
         aj0Qeob+EWXwQliKV0qxePccUbTWNDiweG3PpX6ZpPeW9GtK/2RbhJOkOcpcsBMNTk0U
         P4sfeEW5p64Gu5s8ehQB/9qIZO63Payf7IiQ0tfhlQpdDd1MQks3jzTHi+tqk/tvJTE9
         xQCCMyGoPcGcvLNVWcpbrVwbN++6xmPKf4xB9dUUbgM3aX42+O7kQPRvJuvibBfZkuvL
         JTUA==
X-Gm-Message-State: AOJu0Ywc3JrQ0kRRh9zIcfb8MGPhIjv/R2ePAR13JUy2nzOytvF0x+gk
	bxhpX5SaVQaT7l0klMyFGKcIr2WqTnTTE/XGu/w+y7A1PV5A1iXhWR8LSplqqeX524mQAtjfFOD
	a6ldvHHskEtyhWoGdhsfKERDAA0tBvt8SV64e3rQ2RhSA3y4YN0dCsVbyXIGNGT3M8STv1OEYlH
	K4olkoEuw5pFiBOAaX7V2aOgyvAx/wj4dJjegTEfrw++YLX+sy
X-Received: from pgbfq12.prod.google.com ([2002:a05:6a02:298c:b0:c8b:2706:11a7])
 (user=seanjc job=prod-delivery.src-stubby-dispatcher) by 2002:a05:6a00:301a:b0:847:99bb:b6d8
 with SMTP id d2e1a72fcca58-84ed6ec0944mr1900997b3a.26.1785502827606; Fri, 31
 Jul 2026 06:00:27 -0700 (PDT)
Date: Fri, 31 Jul 2026 06:00:26 -0700
In-Reply-To: <20260730193035.CFEDF1F000E9@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: sashiko-reviews@lists.linux.dev
List-Id: <sashiko-reviews.lists.linux.dev>
List-Subscribe: <mailto:sashiko-reviews+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:sashiko-reviews+unsubscribe@lists.linux.dev>
Mime-Version: 1.0
References: <20260730191908.2084803-1-seanjc@google.com> <20260730191908.2084803-5-seanjc@google.com>
 <20260730193035.CFEDF1F000E9@smtp.kernel.org>
Message-ID: <amycahxKDq0cO0ri@google.com>
Subject: Re: [PATCH 4/9] KVM: selftests: Drop unreachable, dead code from
 hardware disable test
From: Sean Christopherson <seanjc@google.com>
To: sashiko-reviews@lists.linux.dev
Cc: Oliver Upton <oupton@kernel.org>, Marc Zyngier <maz@kernel.org>, kvm@vger.kernel.org, 
	kvmarm@lists.linux.dev
Content-Type: text/plain; charset="us-ascii"

On Thu, Jul 30, 2026, sashiko-bot@kernel.org wrote:
> Thank you for your contribution! Sashiko AI review found 1 potential issue(s) to consider:
> > diff --git a/tools/testing/selftests/kvm/hardware_disable_test.c b/tools/testing/selftests/kvm/hardware_disable_test.c
> > index 1bcbd13e99947..e08aef94382f3 100644
> > --- a/tools/testing/selftests/kvm/hardware_disable_test.c
> > +++ b/tools/testing/selftests/kvm/hardware_disable_test.c
> 
> [ ... ]
> 
> > @@ -96,21 +84,19 @@ static void run_test(u32 run)
> [ ... ]
> >  	pr_debug("%s: [%d] all threads launched\n", __func__, run);
> >  	sem_post(sem);
> > -	for (i = 0; i < VCPU_NUM; ++i)
> > -		check_join(threads[i], &b);
> > -	/* Should not be reached */
> > -	TEST_ASSERT(false, "%s: [%d] child escaped the ninja", __func__, run);
> > +
> > +	/* Wait for the parent to SIGKILL this child. */
> > +	while (1);
> 
> [Severity: Medium]
> Since the child and parent share the same CPU affinity, will this busy spin
> loop cause unnecessary scheduler contention with the parent process when the
> parent's timer fires?

Doesn't seem like it?  Or rather, any contention between the parent and the
immediate child doesn't seem to matter.

> Because the processes are pinned to a single CPU core, spinning in this loop
> burns CPU cycles and forces the parent to contend with the spinning child for
> CPU time.

Yep.

> Would it be better to use a blocking wait like pause() or sleep() here to
> reduce scheduler latency and avoid 100% CPU utilization?

Yeah, it makes sense to throw pause() in here, if only to maintain equivalent
functionality.  Because that's effectively what pthread_join() will do since the
grandchildren never exit.
