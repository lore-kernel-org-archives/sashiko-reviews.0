Received: from mail-pj1-f73.google.com (mail-pj1-f73.google.com [209.85.216.73])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 70448343893
	for <sashiko-reviews@lists.linux.dev>; Fri, 29 May 2026 18:57:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.216.73
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1780081057; cv=none; b=EFz1wi9Wr6/BSgLW1ZBTzpkQaIjXR/TRXgOPaHnv5RahRo40xogpyzvnvh92AjpZ1CKwPAVeCsNm9me8Gwlo0Zyxqq0iecmX5mUjHjPvENCfXQkd11YN+c3mXARX7z19AQDkUZLJ+0g651ijKv4h33q7kJGGFK3UmP/ZblZvT6c=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1780081057; c=relaxed/simple;
	bh=0Ac6Y0XbIulsI8e3BoESoWqp4Ms/oUKG/jhOEdJSmhA=;
	h=Date:In-Reply-To:Mime-Version:References:Message-ID:Subject:From:
	 To:Cc:Content-Type; b=eqhxkz7+H5nS9qp1FFUwoB0iWdW5q92+sh/cHo2uGzJpeiXlT/j6HYYn3c4+D6dE0atmNtn/MjQeK7p0QyajEjnYZwLxhDkUHYKTS1fIdMQ8qgy6Wf1XELYxI7J7zTa9QRzd0yXG+2kLz9n5zNuzZYuv9fBzgBq4c71Vn5o1XuM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=flex--seanjc.bounces.google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=D2gapskp; arc=none smtp.client-ip=209.85.216.73
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flex--seanjc.bounces.google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="D2gapskp"
Received: by mail-pj1-f73.google.com with SMTP id 98e67ed59e1d1-36bba9b849dso1202772a91.1
        for <sashiko-reviews@lists.linux.dev>; Fri, 29 May 2026 11:57:36 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20251104; t=1780081056; x=1780685856; darn=lists.linux.dev;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:from:to:cc:subject:date:message-id:reply-to;
        bh=trcaqpaPheQ9pegSLrZ7Icm7wT70eldJiw4H2do/7sU=;
        b=D2gapskpEovhWXC6fo1A1c5mXB+U1vJHqjiR/aSbY3NOhTFxY5BblnYnQPmhiiIhv3
         LZTGBqcM0l1PaWnWa+heK0f/YNE0wV4EMfwhtBmsDn2yXLuAPm6AGSA/K2CSI3lF/XSL
         mqUXxSLyNtxXYEdGmHfX++jitzpagdLnHP97tbbCOI+rGcziTdfkvHqQuf4ZLlaXoXs5
         r5KS+6AD2h8gE/3vLKR3+3gm3iemT6pgubsukUVlSFEykm83RlOSpwl43x1dJkFx8Vy8
         9Bgstzp8h72jbXTPfNKF2sDW8FtAlWQD2U09cbA3ixOIikvYMBaqp53p5TYX1PHIY0cM
         4u8g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1780081056; x=1780685856;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=trcaqpaPheQ9pegSLrZ7Icm7wT70eldJiw4H2do/7sU=;
        b=syg7ThuVb7b6dXUm3u7ZaiVKlvIQgvIwDE5c/dvE+zR/Ss7m9xnZFujo94gvJmXScK
         X2423AJ9NRZhScnpzlPZpbqfSCN4dno5hEruHDClhGwkOeokTx0S+y8I61rsYu5lMIp4
         aw9KUeiw+Zls1eQgHHY9JhSPx3Bktjt5wfoc1+ZNS5jT0Y2XtIoWH14CBOund08cg4+I
         EPHCH7Rig8C89uZ6Wxyowzj+KhFV92rojYl2QCMjlVTvcPEyIuMOWANKGjmunSbE8RQp
         jbI8Q1mYHuSFFrxMDNav1reWrhyGfcq8nKZec4fT1eLlrX0CpvRC2UpQqgkCNHEZbJ3G
         ToOw==
X-Gm-Message-State: AOJu0Yy07LF8ZApsbERCpveg5BDLp1EfpPvnYg5aHWaYLBUde8i9s/ss
	IeItZ2QfuW73MHIWZPlkdXNkZjH8RD9MkF8EcPWLSLta/C+G3mPgJzhFpXFI3SprgvrhTVUZQl0
	sC+EklusWzjT4Q/bwyaq+OVl5xsPshZfwrqVstFPD8IQKtPdKr/2qnTZutvo9lNHN6qm+ldsND0
	S1pWoq1K50451QpVg5OnsnxOduJr0/z4k4kCn7jAg8E2mFNjyr
X-Received: from pgc24.prod.google.com ([2002:a05:6a02:2f98:b0:c80:192c:51ff])
 (user=seanjc job=prod-delivery.src-stubby-dispatcher) by 2002:a17:902:ce85:b0:2bd:4d4b:9143
 with SMTP id d9443c01a7336-2bf36795110mr12953405ad.8.1780081055498; Fri, 29
 May 2026 11:57:35 -0700 (PDT)
Date: Fri, 29 May 2026 11:57:34 -0700
In-Reply-To: <20260529181213.0B27A1F00893@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: sashiko-reviews@lists.linux.dev
List-Id: <sashiko-reviews.lists.linux.dev>
List-Subscribe: <mailto:sashiko-reviews+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:sashiko-reviews+unsubscribe@lists.linux.dev>
Mime-Version: 1.0
References: <20260529144435.704127-18-seanjc@google.com> <20260529181213.0B27A1F00893@smtp.kernel.org>
Message-ID: <ahnhnjvfIblFxTFX@google.com>
Subject: Re: [PATCH v4 17/47] x86/kvm: Mark TSC as reliable when it's constant
 and nonstop
From: Sean Christopherson <seanjc@google.com>
To: sashiko-reviews@lists.linux.dev
Cc: linux-hyperv@vger.kernel.org, kvm@vger.kernel.org
Content-Type: text/plain; charset="us-ascii"

On Fri, May 29, 2026, sashiko-bot@kernel.org wrote:
> > diff --git a/arch/x86/kernel/kvm.c b/arch/x86/kernel/kvm.c
> > index 909d3e5e5bcd5..4fe9c69bf40b3 100644
> > --- a/arch/x86/kernel/kvm.c
> > +++ b/arch/x86/kernel/kvm.c
> [ ... ]
> > @@ -1040,7 +1041,20 @@ static void __init kvm_init_platform(void)
> [ ... ]
> > -	kvmclock_init();
> > +        /*
> > +         * If the TSC counts at a constant frequency across P/T states, counts
> > +         * in deep C-states, and the TSC hasn't been marked unstable, treat the
> > +         * TSC reliable, as guaranteed by KVM.  Note, the TSC unstable check
> > +         * exists purely to honor the TSC being marked unstable via command
> > +         * line, any runtime detection of an unstable will happen after this.
> > +         */
> > +	tsc_is_reliable = boot_cpu_has(X86_FEATURE_CONSTANT_TSC) &&
> > +			  boot_cpu_has(X86_FEATURE_NONSTOP_TSC) &&
> > +			  !check_tsc_unstable();
> 
> [Severity: High]
> Does this evaluate check_tsc_unstable() too early to catch the command line
> parameter?

Huh, it does indeed.

> It looks like kvm_init_platform() is called from setup_arch(), but the
> tsc=unstable kernel parameter is parsed via __setup() later during
> parse_args() in start_kernel().
> 
> If check_tsc_unstable() evaluates to 0 here because the parameter hasn't
> been parsed yet, wouldn't it incorrectly force X86_FEATURE_TSC_RELIABLE
> and set prefer_tsc to true?

Yep, but this is a pre-existing problem that goes all the way back to the original
commit 7539b174aef4 ("x86: kvmguest: use TSC clocksource if invariant TSC is exposed").

We could try to fix that, but I'm _very_ strongly inclined to add (yet another)
patch to simply drop the check_tsc_unstable() since it has always been dead code.
