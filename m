Received: from mail-dy1-f170.google.com (mail-dy1-f170.google.com [74.125.82.170])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B6B3E4D956C
	for <sashiko-reviews@lists.linux.dev>; Fri, 16 Oct 2026 15:42:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=74.125.82.170
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1792165347; cv=pass; b=i+HRKaD0GCMqWhHvAdIGvjBMJqRKL9LfRK4hjDWZMx9bikYpYQVdJTlETFE6oxdZlUER7mYQb13eNmh7MnA3W6HqOix5Mr4d9YxM3ynsJKBjSrO8U12b3a+LooxYfN+5sUlZ9+J3hWorYaMWeQAgVc49FIg+yuE993Xz6JemCmM=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1792165347; c=relaxed/simple;
	bh=wEx/7wCNfeHOSauzGB1wU8Hea+BIBDPfoLRDPVD74RA=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=huDHbKlttWY7MmWlgtstfsGy3vXnvnpA5seBxEyhX1816TFh2WOMtUeLJOseU2lI7iwSP9gJNoS1MPyPTf+qLBawTlQ5f5ml0zEbAI77XpPQe10cN7nSqnW6rxuTOASNO4DuztfoWS9M/1Ko6dUaPc9LD7qRAiccweTahjsScbQ=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=qTPVuX1V; arc=pass smtp.client-ip=74.125.82.170
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="qTPVuX1V"
Received: by mail-dy1-f170.google.com with SMTP id 5a478bee46e88-30b6dad2382so45956eec.0
        for <sashiko-reviews@lists.linux.dev>; Fri, 16 Oct 2026 08:42:25 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1792165345; cv=none;
        d=google.com; s=arc-20260327;
        b=An+pzmzJcCHg8YSMYUaGMKO9PClmREi5GI2nCjOemKOBKFfeKzk32cQIDw5zQ4/qiV
         9s8LYiPKirPCAcOIWQNqDvSa87lFbvk1wv/hXrDu6GQz36NWDzb9yriC9lWCYLuVDWD+
         zTZrqe0z+NYbZG+BmqmcFumAiAew8Q0a8aoQh28tMnWJgbnzYRn8ahg98PyZEPnPwusD
         gsdoiIQm0a/ERJtLL14pIzIY1ZUDnrGrhAwaknf/ZMXgAnKRxGvDtEOTde4oavuJcf+j
         0otHZd469Bpnd/db0tKL9Qq35baKfzpeQ6GxgM0ywQyFZVH8AQ+ZkGqwQfEUu3FY78ZP
         Bbxw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:dkim-signature;
        bh=/nYhRj4X6c1IBw/Jup8hasTqp4A+rlYmbM569hgNCOk=;
        fh=5mf8YdY4GVeb38de+wxxesTeQeQTEBcQCgP1LhGM7j4=;
        b=XxSB5nm/kNFiybkOVdMIQu/IO8hOlEnKAq6GFuY9etSPhXfE5J8mhRWDD+T3LTyDjl
         x3xFbs88BYpuuoaNYH6gmIRSGw+/HIMKAfy2w/+Z7JxZ0jjm8WGYpQ5sznGuRaKeDQzl
         oWjwjwYZtYZg7PDTTF50figfpuJ8Q/CGTIDzAatgUljV7zvFfvCySgADvPWTVxin2Pu1
         Ms47uJ8OkCuriAT1pK9SeqT6y7ENf2R3BoevBls85dEXPpwZE23xldNnL3BIDg/VolQt
         qItRBlEqiAVgIgqhiImNg28hNIH3u0NdvJIvR0MpXhEjfkulW01w/nCfIj1GC+PTlnH+
         XM6A==;
        darn=lists.linux.dev
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20251104; t=1792165345; x=1792770145; darn=lists.linux.dev;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=/nYhRj4X6c1IBw/Jup8hasTqp4A+rlYmbM569hgNCOk=;
        b=qTPVuX1VrInCLcHbXDf6PegFB4rsgplLhj935vALy3FN83eQJgA4KHCHj9BMjgMTHu
         tCUF1oJ7yyhPYVE8svyFVSpKg+o8n4Uum8AaE5JAdLIBffN9yHQT3xXZPlE57Ots5R6G
         K1GhkD9tPEglh64eWFfrwtwy22eCs108oppxENGDEgIAX45B+jRQ3wNI8XEXvwyDfjdF
         qCX95V9hIyRu0zFjDV5CJAi8Dl1umuDvN51KiWz5CMM8Mfyb+EY+wqMfT3vqnzel2HA3
         aa3OdtdBRTr3fnvqWp99bHsdd0Z80906zf25BV9X5R80rso9gHUHVmJIUdnU1zAe8Gsi
         Lutw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792165345; x=1792770145;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=/nYhRj4X6c1IBw/Jup8hasTqp4A+rlYmbM569hgNCOk=;
        b=ZA4yDagDGy4/X5IKuZaG5LK8TVJCMs+mQr8o3v8NrRp9grtIWj3r8g0dfRodEvhpjE
         Yzwo53Qx5hSRMpy/wIS/vRvDtK0APEdCS1A+BSMvF+PE+wCjvrcYdol8I83aNuKwXeLs
         xQNmKhD3L21/QHPAVaqq0VEG++00VfxgtxNb8v6BrI/enZKFs7r8YavdKJzr23im1Dts
         Fr7ujtwvyMV4gFFOF40O5cIHm2UvXrNRnG1bSSf5QC47ghEUFCSzCwrDdgcErWQuYl0W
         yEydG3wzIqEog8OF3gIxRsnMR+0j4S7ChEJtr2b/g4fpHmbMRhKh3TdZQwzrXS3CPhHe
         gDUw==
X-Gm-Message-State: AFq9FYJkEcRuOY8qqmJexLJtRMnprSqcuvHghdITIwAsLdnKOJVMLrJR
	2THhokujVwUN4yoEnXhMYrM5POPLwUcz0d0MfKcp0XaZg54WhCd3YwonFIgSNfowdopjzU3J1Q6
	RDlM+/cLLU+HqY/QSE1s8Ddx7dvRkZ/ipoARjoKkx8ZIigSMVwrbLm5fmELM=
X-Gm-Gg: AYBFou15i8oPNRkiyQTU1KeYZUaGJRjFtd/eKN8P6vul03/cRA0+ZI7+Devrr5tDd68
	JZOVkCB+4qzfQ7PFhnir4fr6+G9/wPYA/v+8PPU9Tw8k9oa0Rywn9IgU3M2jfpMbv8TLJitfH1x
	w35mw2cpNx02xkzIZUNA43eYYzKYInG6POHvoWHo87DADZ7pGVCCPbHvDR13FoaYTaXDquwmNK/
	PS8Nde29A7maje68/2gQpqGXMvzupIfLpbV32eeC+oHMGwl8l3+1+2ZwO4BEA7hTRYYpZzky5WA
	vnMCNf9UJYKzP3BYpV1xjXh+SNtxE5M2GBBItpMetQM/yu8bu4WY4sE3cUynGUaYh85ZQMmtDQf
	nWINldBibFLc=
X-Received: by 2002:a05:701b:2610:b0:143:3da5:cada with SMTP id
 a92af1059eb24-185152b6b6bmr306225c88.37.1792165343661; Fri, 16 Oct 2026
 08:42:23 -0700 (PDT)
Precedence: bulk
X-Mailing-List: sashiko-reviews@lists.linux.dev
List-Id: <sashiko-reviews.lists.linux.dev>
List-Subscribe: <mailto:sashiko-reviews+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:sashiko-reviews+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20261015145714.3327543-1-elver@google.com> <20261015145714.3327543-2-elver@google.com>
 <sashiko-outbox-174506@kernel.org>
In-Reply-To: <sashiko-outbox-174506@kernel.org>
From: Marco Elver <elver@google.com>
Date: Fri, 16 Oct 2026 17:41:46 +0200
X-Gm-Features: AclHuK8ATsc8VKpMtjbzGvE2xXlZuEy39NIy8wK_ev4B7i6RuKhKEu9q8cC6eGc
Message-ID: <CANpmjNMfEXXz+PBd4rquzkNapFs3CGygdz_e_OmjJOtOnZZ5Jg@mail.gmail.com>
Subject: Re: [PATCH v2 2/2] rust: kcsan: add KUnit test for data race detection
To: sashiko-reviews@lists.linux.dev
Cc: Alexander Potapenko <glider@google.com>, Boqun Feng <boqun.feng@gmail.com>, kasan-dev@googlegroups.com, 
	Dmitry Vyukov <dvyukov@google.com>, Jonathan Corbet <corbet@lwn.net>, 
	Shuah Khan <skhan@linuxfoundation.org>, Randy Dunlap <rdunlap@infradead.org>, 
	Andrew Morton <akpm@linux-foundation.org>, Miguel Ojeda <ojeda@kernel.org>, 
	Boqun Feng <boqun@kernel.org>, Gary Guo <gary@garyguo.net>, 
	=?UTF-8?Q?Bj=C3=B6rn_Roy_Baron?= <bjorn3_gh@protonmail.com>, 
	Benno Lossin <lossin@kernel.org>, Andreas Hindborg <a.hindborg@kernel.org>, 
	Alice Ryhl <aliceryhl@google.com>, Trevor Gross <tmgross@umich.edu>, 
	Danilo Krummrich <dakr@kernel.org>, Daniel Almeida <daniel.almeida@collabora.com>, 
	Tamir Duberstein <tamird@kernel.org>, Alexandre Courbot <acourbot@nvidia.com>, 
	=?UTF-8?Q?Onur_=C3=96zkan?= <work@onurozkan.dev>, 
	Nathan Chancellor <nathan@kernel.org>, Nicolas Schier <nsc@kernel.org>, 
	Nick Desaulniers <ndesaulniers@google.com>, Bill Wendling <morbo@google.com>, 
	Justin Stitt <justinstitt@google.com>, Asahi Lina <lina+kernel@asahilina.net>, 
	Lorenzo Stoakes <ljs@kernel.org>, Yury Norov <ynorov@nvidia.com>, David Gow <david@davidgow.net>, 
	Joel Fernandes <joelagnelf@nvidia.com>, Alvin Sun <alvin.sun@linux.dev>, 
	Josh Poimboeuf <jpoimboe@kernel.org>, Petr Mladek <pmladek@suse.com>, linux-kbuild@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"

Sigh, I'm repeating myself against a bot:
https://lore.kernel.org/all/CANpmjNPDKZKCWc0ubCGATLE05gwefwpR=n4D6E0FKAvsi9DCVw@mail.gmail.com/

On Fri, 16 Oct 2026 at 16:57, sashiko-bot via kasan-dev
<kasan-dev@googlegroups.com> wrote:
>
> Thank you for your contribution! Sashiko AI review found 1 potential issue(s) to consider:
> - [High] kunit: rust: KCSAN test stalls and spuriously fails on UP/PREEMPT_NONE
> --
>
> commit 8335c11e7a640669968685ad30c1312fe11f4a68
> Author: Marco Elver <elver@google.com>
>
> rust: kcsan: add KUnit test for data race detection
>
> Add a minimal KUnit test that checks that KCSAN detects data races in
> Rust code: two threads concurrently increment a shared counter without
> synchronization, and a probe on the console tracepoint waits for the
> KCSAN report.
>
> > diff --git a/rust/kernel/Kconfig.test b/rust/kernel/Kconfig.test
> > index 3bf4194f28c7c..26bcd91a48211 100644
> > --- a/rust/kernel/Kconfig.test
> > +++ b/rust/kernel/Kconfig.test
> > @@ -104,4 +104,15 @@ config RUST_TIME_KUNIT_TEST
> >
> >         If unsure, say N.
> >
> > +config RUST_KCSAN_KUNIT_TEST
> > +     bool "KUnit test for KCSAN instrumentation of Rust code" if !KUNIT_ALL_TESTS
> > +     depends on KCSAN && HAVE_KCSAN_RUSTC && TRACEPOINTS
>
> [Severity: High]
> Should the RUST_KCSAN_KUNIT_TEST configuration in rust/kernel/Kconfig.test
> include a depends on SMP requirement?
>
> The help text notes that the test requires at least 2 CPUs to reliably
> observe a data race. Without an SMP dependency, the test can be built
> and may spuriously fail on UP configurations.

That's the point - if someone configures KCSAN and runs it on a system
where we won't detect any data races, this test is the canary in the
coalmine. The test will fail loudly and whoever configured their
system (or VM) will know something is off. That's a good thing.

> > +     default KUNIT_ALL_TESTS
> > +     help
> > +       This option enables a KUnit test checking that KCSAN detects data
> > +       races in Rust code. The test needs at least 2 CPUs to reliably
> > +       observe a data race.
> > +
> > +       If unsure, say N.
> > +
> >  endif
>
> > diff --git a/rust/kernel/kcsan_test.rs b/rust/kernel/kcsan_test.rs
> > new file mode 100644
> > index 0000000000000..24810cf2970a0
> > --- /dev/null
> > +++ b/rust/kernel/kcsan_test.rs
> [ ... ]
> > +    #[test]
> > +    fn data_race() -> Result {
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
> [Severity: High]
> Could this loop in data_race() lead to a CPU stall or spurious test failure
> on uniprocessor systems or when PREEMPT_NONE is set?
>
> The main thread spins tightly in kernel mode for up to 10 seconds without
> yielding. If the worker thread is scheduled on the same CPU, it is prevented
> from executing.
>
> After 10 seconds, the main thread exits the spin loop, sets the stop flag,
> and waits for completion. The worker finally runs, sees the stop flag
> immediately, and exits without performing any concurrent increments. The
> assert!(OBSERVED.load(Relaxed)) assertion will then spuriously fail.
>
> Would it make sense to yield the CPU during this loop, for example, using
> cond_resched()?

Where KCSAN works correctly, the data race is detected within
milliseconds. Adding cond_resched() may in fact lead to the data race
being detected much slower in the common case. If the worker is
scheduled on the same CPU, the system is misconfigured (likely UP) and
I want to see a test failure.
