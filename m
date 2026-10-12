Received: from mail-dl1-f44.google.com (mail-dl1-f44.google.com [74.125.82.44])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7033E3F5BDC
	for <sashiko-reviews@lists.linux.dev>; Mon, 12 Oct 2026 13:58:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=74.125.82.44
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791813542; cv=pass; b=sxASXNLcXQCGGbkzneT4ifGWWYcD1v3gWORSNjjnaJRm8O7/pIVLYx9XVccLmNK9QdDylKwAWhIRz94pXsN3Aln/TgFSsAZa9CGlRDnTqSb0aWywOlCo22DS7iGq0hEtobVpY5zQy7ystppxoTeDAwk2TnVmODeAhh/PXVfxSqI=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791813542; c=relaxed/simple;
	bh=LMmir0HmZ23Puyo2gqH/t9MEo+O+DOZlRlLJwQiQ8RI=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=DDYlzLa8VqIH5uU/tdICuHTu3eolmTnEyO5vng7itT0eqlvZl6z6nixZN5ws4hj7z21dIdarWN4vuAyZ7oarKRoW0hTUrHeHhMRwCcg3hs4jiRf+u0Zm6IMjmHj6VQXJ+gWcmoQObakI/oVMSCRDKtrWJcG9e0UNZVvWqN71Nec=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=rkQ3bFzE; arc=pass smtp.client-ip=74.125.82.44
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="rkQ3bFzE"
Received: by mail-dl1-f44.google.com with SMTP id a92af1059eb24-16079d54c17so2223700c88.0
        for <sashiko-reviews@lists.linux.dev>; Mon, 12 Oct 2026 06:58:59 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1791813538; cv=none;
        d=google.com; s=arc-20260327;
        b=VoLq24H5a0PpsUaAnDfQ4qvV+VhRhlu4yVTyVOwTHXCG0H6C2/504Wcdsuuohm3Tke
         ONlYZeOxDsped58fenwRuxba5nI/DLa+OrJlS3XtvclEu4o3qEf+uwkOlOrqmH+9ZaiE
         xBlxo2UupexwsqcLnHnzPAK3oU7dzQc4FG9sCOSW0TZSpmt/uDaqf9T+aTSqTDYY/wr8
         Tz22HnsA5+ZuozQvq1Tpj0NsbhoUnNCbHnE8bvysyv+MhyEhIBw2ucreADhme8HQb/oO
         ILKaU02is0ryyKUYt/KOgUZd2tLTm8gvNotsmOJyUvQozouzYN4Sn8/ih19YHao9Kb2E
         xnSQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:dkim-signature;
        bh=sHYRw+qOWt0iWlP6HZhTVJV9uI77ylRKv2kaKbdnTFE=;
        fh=WIM7ERB0BbB/ChriDigA69b8uZCFpAzJm3H53mgmAFw=;
        b=SBvqfyLDwbxMwVYTw6THfjmRTJCCzJvtIT4v4luNzLj3TldEvXzQb+qsTxZ3/au/gQ
         l6+ChsPgk9byiSCz89pi61xqR/qzXM+PeftrmIO7Fe0AcPxQ3ui58+loxiAI7IKDOIbf
         offxYngoYB7pPLuy0oh4ZIe+z5kZ7NJtykK3hEKx518Wa7dI9D/iO3ZkeXoahF/OVyLO
         rTRDOaQFhYarKmZMAs2utlH6z86w92SrLBFwtdyMC7dNy0bJC/zDzVLjRPKxrIhdPCBl
         uHcOYtFo3hJMgrHHtIBpwXF3sryyShPpvsKihvXnd76TIds3pA1P+fO6tfvxPhp+TuYb
         I9ZA==;
        darn=lists.linux.dev
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20251104; t=1791813538; x=1792418338; darn=lists.linux.dev;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=sHYRw+qOWt0iWlP6HZhTVJV9uI77ylRKv2kaKbdnTFE=;
        b=rkQ3bFzEoUoh2JONJ3oqNwaGyv6sg++EiYtLdWqd2/c2Ke5goVKptFEBbk/LR59TCf
         ZdIRqfPuahQsIDFd31AwIyon85xZ0u/KyqlhVAGcJ/Pzo/I4tPdOLG3nwHnllTQ7SLzD
         UW178GO8NScNLbo210MMW06YygSu70lpwZLo8kiTiMjhwX2/hOpcLnCFj3sYoGDKN8fh
         YmbKRAp++N0fjpohiNl8RUD/Ceuk0HWNyHTf7ebhDMglWpuldOWvcUK2foTGCD8r29+m
         Saejr6fEXWdvseaQPMyY03kQytmZTWytyNDqBvd/bok1D+6vRZ7VbZyU4UAQbVkDewsI
         D07Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791813538; x=1792418338;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=sHYRw+qOWt0iWlP6HZhTVJV9uI77ylRKv2kaKbdnTFE=;
        b=sE55NJ1Hz8g3sIYjAA4sCex8oNS+DHjbIaSovFOk57GOiPqK9nHqS1ptHxwm2AbmzP
         camZPKmYUdlMI86Sx6pEf28O2NldYcfdkVzJUBmW2rtYtqDuRnFoiheh3cEwkjkLPwxB
         O3QLl0bSWMC8c28ny53wgxaCf0Seos9/jOPcH8YlHHPUyf8v/x0LHEh2F992Tsrbxtkh
         TVk0BGSIFu5+g7w0+94wKVfuIhNjGsFth4KUP011XibSeYVbHgqKVD0fzfoRGB3ObBch
         mcO7Z3WxOFa3ofT2hyQMHkSLIjf0lhWpLpd2ttoNIop4k5tAowvBh1kJ+GB47UdIu4s7
         sLwQ==
X-Gm-Message-State: AFq9FYJI4wwe2JD93gnAKJJY0Azp/5xOKhLAUOKw7RqBX5VUrMFFwhIY
	gD6lq9qKV2B2fv+bU2gIjkoLyVefwBBrc7KASWWGdXHyfIjiC39YxmTmj8jptcu3quiJxTI/8Q/
	97c5VvE7OS+zX2PsZQk+3vILuHznXAfewc31LqMNPO53tdb3+2pQOYVOn
X-Gm-Gg: AYBFou0bJvnpPnPBt6xvjDKWZNJ1S3ygZPWTngboIGHcP5eiisNJXLnCgNayB4akaeV
	/6zHuf0Jt71UOJQ68qvrkvhfe65Iroho1KZ1IUMFCT+KYXHqi4yb9kdMEvbcqtMl7T7pFcgLTTk
	jpPsdv4fr5Obd6C6hItq/RiluIHzen6UW3pIiVp7GAnBtaz3+B+Wsw2G93tvC1Os6cr85EZz+Ve
	jI6XXN8hdN33LbSMm9dAZOy79jGJwnwm4hRzv6P3i5g3ktjX9g9MJrVVH8XOLJrrMhDLdD6TouH
	eJoktXI9meHLLZmo9ZVl/ApaNgm1JG9u6yvkDGbnd9mVIEPAE6yY7A7jxpe9Wgpajhv1WRb2teh
	Wt60hbp1c/x7RJV8YmDfnpA==
X-Received: by 2002:a05:701b:2707:b0:144:c127:dd1b with SMTP id
 a92af1059eb24-16a5fe7c188mr14567084c88.39.1791813537404; Mon, 12 Oct 2026
 06:58:57 -0700 (PDT)
Precedence: bulk
X-Mailing-List: sashiko-reviews@lists.linux.dev
List-Id: <sashiko-reviews.lists.linux.dev>
List-Subscribe: <mailto:sashiko-reviews+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:sashiko-reviews+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20261012134159.912183-1-elver@google.com> <20261012134159.912183-2-elver@google.com>
 <sashiko-outbox-168220@kernel.org>
In-Reply-To: <sashiko-outbox-168220@kernel.org>
From: Marco Elver <elver@google.com>
Date: Mon, 12 Oct 2026 15:58:19 +0200
X-Gm-Features: AclHuK8e8JhbZ24FOiq4rpedvqYHhg1NUZ4g_NHA7tPWQ0dLtjatTIdFonOjJcI
Message-ID: <CANpmjNPDKZKCWc0ubCGATLE05gwefwpR=n4D6E0FKAvsi9DCVw@mail.gmail.com>
Subject: Re: [PATCH 2/2] rust: kcsan: add KUnit test for data race detection
To: sashiko-reviews@lists.linux.dev
Cc: gary@garyguo.net, ojeda@kernel.org
Content-Type: text/plain; charset="UTF-8"

On Mon, 12 Oct 2026 at 15:53, <sashiko-bot@kernel.org> wrote:
>
> Thank you for your contribution! Sashiko AI review found 1 potential issue(s) to consider:
> - [Medium] kcsan: tight spin loops cause soft lockups and test failure on UP
> --
>
> commit 8ac72d90aef2333ef5245e04889d3d20386d5d6c
> Author: Marco Elver <elver@google.com>
>
>     rust: kcsan: add KUnit test for data race detection
>
>     Add a minimal KUnit test that checks that KCSAN detects data races in
>     Rust code: two threads concurrently increment a shared counter without
>     synchronization, and a probe on the console tracepoint waits for the
>     KCSAN report.
>
> > diff --git a/rust/kernel/kcsan_test.rs b/rust/kernel/kcsan_test.rs
> > new file mode 100644
> > index 0000000000000..5ddc9090cd6ef
> > --- /dev/null
> > +++ b/rust/kernel/kcsan_test.rs
> [ ... ]
> > +        let worker = ctx.clone();
> > +        workqueue::system_unbound().try_spawn(GFP_KERNEL, move || {
> > +            while !worker.stop.load(Relaxed) {
> > +                racy_inc();
> > +            }
> > +            worker.done.complete_all();
> > +        })?;
> > +
> > +        let start = Instant::<Monotonic>::now();
> > +        while !OBSERVED.load(Relaxed) && start.elapsed() < Delta::from_secs(10) {
> > +            racy_inc();
> > +        }
>
> [Severity: Medium]
> Will these tight loops monopolize the CPU for up to 10 seconds on kernels
> configured with CONFIG_PREEMPT_NONE=y?
>
> Neither the worker thread's loop nor the main thread's loop invokes
> cond_resched(), cpu_relax(), or any other CPU yielding mechanism. This could
> trigger soft lockup panics and RCU stall warnings.
>
> Furthermore, on single-CPU systems, could the main thread completely starve
> the worker thread and prevent the data race from ever occurring?

If CONFIG_KCSAN_INTERRUPT_WATCHER=n. But if CONFIG_KCSAN_STRICT=y
that's not a problem. It's the same as with the C kunit test, and I'd
rather be able to run the test and get a test failure because the
system was misconfigured, than no indication that something is wrong.

> The Kconfig notes that 2 CPUs are required to reliably observe a data race,
> but there does not seem to be a runtime check (such as verifying if online
> CPUs are >= 2) to skip the test on uniprocessor systems, which would cause
> the test to unconditionally time out and fail.

The race is expected to happen very quickly, unless something is wrong
with the instrumentation. So in the common case, there's no risk of
soft lockup or stall warning.
