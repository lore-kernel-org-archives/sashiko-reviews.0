Received: from mail-pg1-f202.google.com (mail-pg1-f202.google.com [209.85.215.202])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 492FD36CE14
	for <sashiko-reviews@lists.linux.dev>; Fri, 29 May 2026 17:01:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.215.202
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1780074064; cv=none; b=DZr0O+y8w3A2qQTCCl6Xtj1vPZhnWzlQDNO/3iZHN790VuDGFHtIaP4jokW2R6Dm9ryX/iuz+BXpa93BCb/+bb511l14sjhSsCW/TFwJhqBWjs6rPGdtuHtp2g5uN4BIGo8+zTVQXvCDOOKafoMVl0snezoQHE02e+C+N4FZO+0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1780074064; c=relaxed/simple;
	bh=7H128GGtnqbG/RSkM/gC5mRXamm7xUEcaHyboBL1r7g=;
	h=Date:In-Reply-To:Mime-Version:References:Message-ID:Subject:From:
	 To:Cc:Content-Type; b=ds0yNy7Ojq3KrllWMyDMyWaN0uJrpPj2WDNffb1u1dAjrl72ZzNVjBF7H/qjbpAIQMtIGc4JdGFJZOo0CJz5PABUWnWQCoHRmeCKX4bysfRFL1NmblH5C6Iwfs7zatCNcTDgLseYP7T1veRnB33F9GkIVGiSRw991qR6hifs8gs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=flex--seanjc.bounces.google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=YEB+Klth; arc=none smtp.client-ip=209.85.215.202
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flex--seanjc.bounces.google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="YEB+Klth"
Received: by mail-pg1-f202.google.com with SMTP id 41be03b00d2f7-c85798977dcso478434a12.0
        for <sashiko-reviews@lists.linux.dev>; Fri, 29 May 2026 10:01:02 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20251104; t=1780074062; x=1780678862; darn=lists.linux.dev;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:from:to:cc:subject:date:message-id:reply-to;
        bh=Z8OtpbJnY1tjWi0GBlc3JoUE3xbaP0GTQHvl5kMixoc=;
        b=YEB+KlthKriHRlHeEPyyQjlp43MEGSEi8FmgkWZI46Js+OURMpxCyPmOvXEgV+G/0M
         1MwOihi87su22pGuzBd1Fuzdg03ZVrTcmUklNYq8f2Gt2Q5ZjzyV8pJIJy5dXYEaGuyl
         hrQMSfB87noByhN5r5CueNcz9fZ+LKkcDk6zNGfq01zI1M80XphwqbVh+v+hOW/ttcqy
         2L3rbOvXG/J2vqNscn4J3aoAwuUhSiAcg4ot4LI1F3jyI5eLmJETHjIH4FdUk9i64Ubf
         u7t3xG9ZqZBg4AGhbdPN7C+TvJYUtIsvvtG/uKQ8TlV3hS+nPkAweB+Yw2/aURgJnXWW
         AR5A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1780074062; x=1780678862;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=Z8OtpbJnY1tjWi0GBlc3JoUE3xbaP0GTQHvl5kMixoc=;
        b=tKAOPb8rwKrIceUi8PTirzPbOJPdjSPfcDQbBXekuiEl5h4eH36eK4VHhR0uuf5mSG
         YUYr8ZhNAFKMoTzOzJPR/H9Yt9UYveCObFsto3UWQYIuGOmgu8Ak6ybB8HkptXH09KJH
         E4wvqlruJXJ1TtE7bMdCo3KCd+yAiooEOTyB1P7F9lC2wGlPn/PHSi3gwN47RiLHFTOC
         2bGQ8x7yNGarXqjNDuoSX9uqV5xjJUKC++RjOKXWoD8O4X5kD2DDTsS3N3Tz2eRP8BTB
         cq9oTRn8HX+k1U3Q0wl9EV4r7nztcH4F1l6QF+A1HQg0AhzVqGOSXqeCDPucUlXC3XlY
         x6SA==
X-Gm-Message-State: AOJu0Ywvu01eVcVeuq8Dr3/K+ulKCtklNC6Mn0EesQBtCeD46GefiHdc
	LsTBcWGpMtD2tOQsbW+1YsqqY0DMzlnLcTgSfYWClfhaO3lOkaxnT3mkaHGlbCF+bjhfmcIM5OI
	s0izt8HJVGLD7oK5CGPzTd+gK24kK/2U+o4c/tUO5V4aARZ2z+sGaTlvt1IAHdXJC0fyINUnch8
	o5ToE+cqlF9nKbp/Vu/64roGUB0tISRUpnkBTZiDGXQNvTYQoG
X-Received: from pglr17.prod.google.com ([2002:a63:5151:0:b0:c80:2656:4e70])
 (user=seanjc job=prod-delivery.src-stubby-dispatcher) by 2002:a05:6300:14c:b0:3aa:f9cb:d435
 with SMTP id adf61e73a8af0-3b4280140a1mr64540637.11.1780074061246; Fri, 29
 May 2026 10:01:01 -0700 (PDT)
Date: Fri, 29 May 2026 10:01:00 -0700
In-Reply-To: <20260529164019.519101F00899@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: sashiko-reviews@lists.linux.dev
List-Id: <sashiko-reviews.lists.linux.dev>
List-Subscribe: <mailto:sashiko-reviews+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:sashiko-reviews+unsubscribe@lists.linux.dev>
Mime-Version: 1.0
References: <20260529144435.704127-10-seanjc@google.com> <20260529164019.519101F00899@smtp.kernel.org>
Message-ID: <ahnGTF5uoihLfk1p@google.com>
Subject: Re: [PATCH v4 09/47] x86/acrn: Mark TSC frequency as known when using
 ACRN for calibration
From: Sean Christopherson <seanjc@google.com>
To: sashiko-reviews@lists.linux.dev
Cc: kvm@vger.kernel.org, linux-hyperv@vger.kernel.org
Content-Type: text/plain; charset="us-ascii"

On Fri, May 29, 2026, sashiko-bot@kernel.org wrote:
> > diff --git a/arch/x86/kernel/cpu/acrn.c b/arch/x86/kernel/cpu/acrn.c
> > index ad8f2da8003b3..0303fe6a2efa7 100644
> > --- a/arch/x86/kernel/cpu/acrn.c
> > +++ b/arch/x86/kernel/cpu/acrn.c
> > @@ -33,6 +33,8 @@ static void __init acrn_init_platform(void)
> >  {
> >  	/* Install system interrupt handler for ACRN hypervisor callback */
> >  	sysvec_install(HYPERVISOR_CALLBACK_VECTOR, sysvec_acrn_hv_callback);
> > +
> > +	setup_force_cpu_cap(X86_FEATURE_TSC_KNOWN_FREQ);
> 
> [Severity: Medium]
> Does this unconditionally skip TSC refinement even if the hypervisor fails
> to provide a valid TSC frequency?

Gotta love Sashiko's passive aggressive "questions".

> ACRN TSC frequency is obtained via acrn_get_tsc_khz(), which queries
> cpuid_eax(ACRN_CPUID_TIMING_INFO). If the hypervisor does not support this
> leaf or returns 0, the kernel falls back to early hardware calibration
> (e.g., PIT/HPET via x86_platform.calibrate_tsc()).
> 
> Because X86_FEATURE_TSC_KNOWN_FREQ is unconditionally forced here,
> init_tsc_clocksource() will assume the frequency is known and skip the
> refined calibration phase. This regression locks in the imprecise early
> calibration and could cause time drift.
> 
> I see this regression was addressed in a later commit b0e7d8e1edd52
> ("x86/tsc: Consolidate forcing of X86_FEATURE_TSC_KNOWN_FREQ for PV code")
> which correctly gates the capability setting on known_tsc_khz != 0.

Blech, so many twists and turns.  I'll fix this by adding a prep patch to cache
the CPUID result locally and only register the hooks if it's non-zero, e.g. as
is done by VMware and KVM (later in the series).
