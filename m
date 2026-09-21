Received: from mta1.migadu.com (out-236.mta1.migadu.com [95.215.58.236])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A62A94ACC74
	for <sashiko-reviews@lists.linux.dev>; Mon, 21 Sep 2026 15:26:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=95.215.58.236
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790004372; cv=none; b=dDA5DOxRHG/7Rc7DmOnIhIClhFjG+6ToR79rRnMHnG0+xM1sFu9UuyYEqZ+C2c1d5cIyey+qOxdzZuQnn1oWHilANA7p9Z6/RJxC31rAaaZYJxlG6XIJTkA1bL31mV1Df4sfwEnDBpi3VNdjCjJ1g5PhexPKry/s9Y0wpn/0+U0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790004372; c=relaxed/simple;
	bh=/8RGZVQWUyzs19cUu3Y//9Vj+1op9fq9/ZosbH4mY4I=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=U0q5IBTD1dszAZdcZFZTMPJLPW/1rUWj3HiT/J3/NRc5vxo9lVSZryEiv25d4oqz27Byunl9zIzPudzLycjZYs069BSIzZUuqaZHbVCi6G/Qqwq5PruhZsAYJVnfstT3J4DVpbIf4soYxJz4b86dL+Zxp26AmHvE99QHyRVBB9I=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.dev; spf=pass smtp.mailfrom=linux.dev; dkim=pass (1024-bit key) header.d=linux.dev header.i=@linux.dev header.b=mB5AIyBo; arc=none smtp.client-ip=95.215.58.236
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.dev
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.dev
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linux.dev header.i=@linux.dev header.b="mB5AIyBo"
X-Envelope-To: sashiko-reviews@lists.linux.dev
DKIM-Signature: a=rsa-sha256; bh=/8RGZVQWUyzs19cUu3Y//9Vj+1op9fq9/ZosbH4mY4I=;
 c=simple/simple; d=linux.dev;
 h=from:to:subject:date:message-id:mime-version:content-type; s=key1;
 t=1790004368; v=1; x=1790609168;
 b=mB5AIyBoHdl8O95uCsQ/9MJwakI8UzRx9H+x+TrMIpR55qu8U9BbdhD/v2GxKdkeI8yc/gYi
 rxvzkSTl13R/g8MeRoI/smP+HCn0YRv9lm4zITAuLqTI18KtLbr0wqn7NcoEHUHjgjmQjRour/l
 g5e/Y4O6+7+iwiuagJJVoZco=
X-Envelope-To: sashiko-reviews@lists.linux.dev
Received: by smtp.migadu.com with ESMTPS id 0c49572bddde8dcf;
	Mon, 21 Sep 2026 15:26:08 +0000
X-Mizu-Trace-ID: 0c49572bddde8dcf
X-Migadu-Flow: FLOW_OUT
Received: by mail-lf1-f53.google.com with SMTP id 2adb3069b0e04-5b8c42da963so11608e87.0
        for <sashiko-reviews@lists.linux.dev>; Mon, 21 Sep 2026 08:26:08 -0700 (PDT)
X-Gm-Message-State: AFuF++nIKgteroBHJR9UJmf0C3XgJogYuWUfe3xF4nfp1mow9fYvL1xu
	37v1DUT7MXngIMaMumXhboE8Vaj4guBdWwOzxHLWm/ot1xYRZji+3jpBqdQcv3ClrSKlyM7zO/8
	LGEsODu9l6J90ccOS96E6MeMT39VzXSHiCIFV7AfG
X-Received: by 2002:a05:6512:3c86:b0:5b1:5141:9156 with SMTP id
 2adb3069b0e04-5b8c7eaa535mr194108e87.9.1790004367252; Mon, 21 Sep 2026
 08:26:07 -0700 (PDT)
Precedence: bulk
X-Mailing-List: sashiko-reviews@lists.linux.dev
List-Id: <sashiko-reviews.lists.linux.dev>
List-Subscribe: <mailto:sashiko-reviews+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:sashiko-reviews+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20260921140427.2211373-1-fuad.tabba@linux.dev>
 <20260921140427.2211373-4-fuad.tabba@linux.dev> <20260921141701.33CFD1F000FF@smtp.kernel.org>
In-Reply-To: <20260921141701.33CFD1F000FF@smtp.kernel.org>
From: Fuad Tabba <fuad.tabba@linux.dev>
Date: Mon, 21 Sep 2026 16:25:31 +0100
X-Gmail-Original-Message-ID: <CA+EHjTweK4XJZNaeKKzizReQrP+25jDT08hDkc9+zQoxWu+iYg@mail.gmail.com>
X-Gm-Features: AcwNN1UdQ0NUVS431o0imISYD8tq6CTjYnZ7u83ldsAQHh0Mec-JjbiaaUqj-84
Message-ID: <CA+EHjTweK4XJZNaeKKzizReQrP+25jDT08hDkc9+zQoxWu+iYg@mail.gmail.com>
Subject: Re: [PATCH 3/3] KVM: arm64: selftests: Test a timer set past the
 counter's wrap
To: sashiko-reviews@lists.linux.dev
Cc: Oliver Upton <oupton@kernel.org>, Marc Zyngier <maz@kernel.org>, kvm@vger.kernel.org, 
	kvmarm@lists.linux.dev
Content-Type: text/plain; charset="UTF-8"

On Mon, 21 Sept 2026 at 15:17, <sashiko-bot@kernel.org> wrote:
[...]
>
> > +/*
> > + * With the counter at wait_ms, a tval of -(wait_ms + long_wait_ms) puts cval
> > + * within long_wait_ms of the counter's wrap: a deadline further away than the
> > + * counter can reach. Unmasked, so an early ISTATUS shows up as an IRQ.
> > + */
> > +static void test_timers_past_counter_wrap(enum arch_timer timer)
> > +{
> > +     s32 tval = -(s32)msec_to_cycles(test_args.wait_ms + test_args.long_wait_ms);
> > +     int i;
> > +
> > +     for (i = 0; i < ARRAY_SIZE(sleep_method); i++) {
> > +             sleep_method_t sm = sleep_method[i];
> > +
> > +             local_irq_disable();
> > +             set_counter(timer, msec_to_cycles(test_args.wait_ms));
> > +             set_tval_irq(timer, tval, CTL_ENABLE);
>
> [Severity: Medium]
> Could this sequence lead to a flaky test on a loaded host system?

Yes, a stall of more than long_wait_ms between the counter write and
the TVAL write leaves cval below the counter. This should sort it out:

-        s32 tval = -(s32)msec_to_cycles(test_args.wait_ms +
test_args.long_wait_ms);
+        u64 cval = -msec_to_cycles(test_args.long_wait_ms);
[...]
-                set_tval_irq(timer, tval, CTL_ENABLE);
+                set_cval_irq(timer, cval, CTL_ENABLE);

Cheers,
/fuad
