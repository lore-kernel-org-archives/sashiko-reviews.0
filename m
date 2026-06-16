Received: from mail-ed1-f53.google.com (mail-ed1-f53.google.com [209.85.208.53])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9AA9543E490
	for <sashiko-reviews@lists.linux.dev>; Tue, 16 Jun 2026 16:12:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.208.53
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1781626373; cv=pass; b=rv+YYZ7NmDj7oHsZ1g0cCDj8KgC73b6lpirQ442Uq8cUDQkG6QtM+zors0WkoMErEuNQjLUDZWnvm6lhHolTUGs255ws90KLu1s8X0aUFeiVQ0ZtDf3Ge0sMheK/MIUb2QG1p5JDrZZi1/PHEBy+ooMgTG/XOgm3T4Lc39EFDEc=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1781626373; c=relaxed/simple;
	bh=8uDoBxR5qf+5tNtsgyPNdMc2uf8NWiIUFAqpGNdUaNU=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=VclMk26UWZ7Kd27sb35SV8ZtVq9GdrmeVePo8g/2at08bY4IIJJ1X8w1Sm+NnusDEUpr+E/zIeX4HDXZgytvRcBC6JEZnYMe00yDvTIfWfzgemJEaGHjKjYU8O61UNRxtaAo4DOJ0VwY+XZuG6gwuyr3Wsj3MB21FUhBnDqweEE=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=NCQidOXm; arc=pass smtp.client-ip=209.85.208.53
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="NCQidOXm"
Received: by mail-ed1-f53.google.com with SMTP id 4fb4d7f45d1cf-68d232ed3f9so7391207a12.0
        for <sashiko-reviews@lists.linux.dev>; Tue, 16 Jun 2026 09:12:51 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1781626370; cv=none;
        d=google.com; s=arc-20240605;
        b=D3q2Crle97DWTz3Ciakqw+UOm3lUjsjgjYGvqrye7lyv7sbI9GcbaxaTComL89K7gJ
         PTu4eGjLiBATnSi5LpbBWrwQtohHfnR8f623p/6pl5txOjVq3/AEL9pyGQDQ5YhzDSTu
         Cr6k09g5dPowLYIXA+7kndbgVcD4a8wI3r+dYqe3yYJFNoWuFuBaXb/mcrnkXj+pUzPy
         H/Jh0y0X4UWQGafaRvtnyAfBlwLaxbINTjQx5iB532GfLVkxbLZuymOlp43nU63UxyLE
         5/4wTGKVvppfLVSQHfs872+tKyyW10rkTda+/5h4917K7kxAFHNL1Ygvx0xN+6puS1fO
         3qDQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=GKs2jxsRv9+LlDfAIsR7Q+9I5QhaQR7XKzFdmi7DHcA=;
        fh=LQLdSW01h2ROUwNK2N5+UwHQ+4lE93qNu55uGrsD190=;
        b=ea3A9DZe9m41FkuTTLbqYyy5qOS+Ii6CfYG0a0OaZHQmYUOaOZung56Y8SyNmZYdq/
         CupMnmHi1wEZVgLjqukhbMN/Vx+prA3VgRZJp5q1AvJZDa28SKa38WF5roig0WCm/Ken
         cCTuaJjaTdCC5+rax1T4uhdNXqC59r3FTzv4IykzNRoh1kOOq1gX85YK4mlqlzsOp3pn
         W0Gu/vLZ/nKdP1Cjn6dWHVHD3yd6p9iNnrWYHTBIivvPClUJ5jVuizo0jAOr7Qjn88Pp
         v2i6gjvnOMZY98ydUSpsKkFxCq4c0NLt3j+WU/btp9vxgFJqMN8lk3wpA891PMNsj97H
         gVWA==;
        darn=lists.linux.dev
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1781626370; x=1782231170; darn=lists.linux.dev;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=GKs2jxsRv9+LlDfAIsR7Q+9I5QhaQR7XKzFdmi7DHcA=;
        b=NCQidOXmC3TtRU8L/H4c4/+k4DTH3rb372HoMwvbRRhSmYaaMfKP8BgjBx8peY/7jh
         CYh02QO3ruUmPZBkXNqEC/QqvgUBRIlJSGiJfzn0t2SHm7mWEp2m6TaB72raUQPRBxEg
         2b1b4tOoEY/wRytf3X5xY8m8lT6Mwj8eHSPmLOtLkeTmPXKQ9kSSxcjXugDPycdid9HW
         KudGl4AG6INqKdW6Edsvx/3Y9KKhe3ixjREEHxgYY0uvN/WGtmFYAGGGzkeJrvy74rqr
         w8+X+RH9VLFOsyUxtQU8cFakqJq9GmUGoefFW6BlIz2Njw9Zq+Ru4a+M1UD+vlWxSkWD
         4WOg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1781626370; x=1782231170;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=GKs2jxsRv9+LlDfAIsR7Q+9I5QhaQR7XKzFdmi7DHcA=;
        b=OtWiVkLkpcMCiazX0GrjYELpJudP0n+ox1p6aAn52+iDuaG7+t6XroedKhaAllTqgK
         IAMS9z92ViPxQBvhKom9FLTXFUSsE1UnO5oOkMq1/9ejWR/4ieShjpQ5rZvbisUl7JSn
         OpIzE8wHKzaMmn0iS8RgfKZn0CoOMMeYUZFB2BJ5B6QwoDARrjpc4xpeKvJIFlQl9DK4
         gIGbp7OCK0+5aMurPqv8T7/hmIzv3MTaAd+pwBnKQiO/S8RHvLX/zJ9FnI47a3BVE87C
         9nf7XzLmPJGXpGJT3HFDAxVdZSXPHQQ4txqhZzHtlCJOxuK2aZcbinpuVweQgSJTDmwI
         yE3w==
X-Gm-Message-State: AOJu0YwBRWxDFhdyd0m3zarpaLcJIERBoO6e6diqjDpvLRsDhp9Z41i0
	wqNCIhG+ScTCmDoAshUOHaNExS17xuxdDK4pHz9nnG2oZcVR7fO1cl8Zm+bgXcuJvZEiEia01xQ
	wNrBC6iwVdK2Ri+Ad0fiLO7drVxA4k7dn+2h0
X-Gm-Gg: Acq92OH+5wKICv1zOblBgLz/B+2ZVf29Pw7N/xH+8UuNVXRe1toao45utyO7IDtLVs9
	Q+08rnLwRaPQHhdJHzSuGgvTbLG1b/ULZFQCTXSfhtFpzMnh3aLuEN5eJdYJPxFNiBlagGHeffV
	faZ/55MEsOStOWYzg4x7he16wBVyZbM+8jsVWu1ZwXmBCSD9dXN9GZim7ps9ljdq48Eh2VJe2/5
	m67Ckuq8geCOyBriuCiR6OEHgeRxD59kW7LaXdMZgTYkaB/0LIsQeNHJQY06wVvTz408cno9zLU
	JGD0h8oRqFXOrGhppj1Mif0=
X-Received: by 2002:a17:907:b03:b0:bee:875d:af12 with SMTP id
 a640c23a62f3a-c05a09bc11dmr25587266b.0.1781626369768; Tue, 16 Jun 2026
 09:12:49 -0700 (PDT)
Precedence: bulk
X-Mailing-List: sashiko-reviews@lists.linux.dev
List-Id: <sashiko-reviews.lists.linux.dev>
List-Subscribe: <mailto:sashiko-reviews+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:sashiko-reviews+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20260616155716.2631508-5-puranjay@kernel.org> <20260616160409.F321B1F000E9@smtp.kernel.org>
In-Reply-To: <20260616160409.F321B1F000E9@smtp.kernel.org>
From: Puranjay Mohan <puranjay12@gmail.com>
Date: Tue, 16 Jun 2026 17:12:35 +0100
X-Gm-Features: AVVi8CdKaboq2XwNC4hu_WdVZt4UvvXDyGLLztXHu06VCQ07VL0tsmlmXy4Rvtk
Message-ID: <CANk7y0jV89r++T_nN21FTCiuA6Twx+LB3jv+BzEN3+rzyjypJw@mail.gmail.com>
Subject: Re: [PATCH v5 4/4] selftests/bpf: Adjust wasted entries threshold for
 ARM64 BRBE
To: sashiko-reviews@lists.linux.dev
Cc: linux-perf-users@vger.kernel.org, bpf@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Tue, Jun 16, 2026 at 5:04=E2=80=AFPM <sashiko-bot@kernel.org> wrote:
>
> Thank you for your contribution! Sashiko AI review found 2 potential issu=
e(s) to consider:
> - [Medium] The test skip threshold for `total_entries` was not adjusted f=
or the increased ARM64 overhead, leading to guaranteed test failures on har=
dware with 16 branch entries.
> - [Medium] The ARM64 threshold for `wasted_entries` provides zero margin =
for environmental variations, making the test extremely brittle.
> --
>
> commit 08ff160f53fde2f401cb063e6cbc84b6bc9a9970
> Author: Puranjay Mohan <puranjay@kernel.org>
>
> selftests/bpf: Adjust wasted entries threshold for ARM64 BRBE
>
> The commit adjusts the wasted entries threshold in the get_branch_snapsho=
t test
> for ARM64. It raises the threshold to accommodate the ~13 wasted entries
> generated by the ARM64 BPF trampoline compared to ~7 on x86.
>
> > diff --git a/tools/testing/selftests/bpf/prog_tests/get_branch_snapshot=
.c b/tools/testing/selftests/bpf/prog_tests/get_branch_snapshot.c
> > index 0394a1156d99d..8d1a3480767fe 100644
> > --- a/tools/testing/selftests/bpf/prog_tests/get_branch_snapshot.c
> > +++ b/tools/testing/selftests/bpf/prog_tests/get_branch_snapshot.c
> > @@ -116,13 +116,18 @@ void serial_test_get_branch_snapshot(void)
> >
> >       ASSERT_GT(skel->bss->test1_hits, 6, "find_looptest_in_lbr");
>
> [Severity: Medium]
> Since this patch increases the expected wasted entries to ~13 on ARM64, d=
oes the
> skip threshold also need to be updated?
>
> Right above this line, the test skips if total_entries is too small:
>
>     if (skel->bss->total_entries < 16) {
>         /* too few entries for the hit/waste test */
>         test__skip();
>         goto cleanup;
>     }
>
> On an ARM64 system with a 16-entry BRBE buffer, the skip condition evalua=
tes
> to false, but with 13 wasted entries, only 3 remain for hits. This would =
cause
> the ASSERT_GT check to deterministically fail rather than gracefully skip=
ping.
>
> Could the threshold be adjusted to account for the additional ARM64 overh=
ead
> (e.g., needing at least 13 + 7 =3D 20 entries)?
>
> > -     /* Given we stop LBR in software, we will waste a few entries.
> > +     /* Given we stop LBR/BRBE in software, we will waste a few entrie=
s.
> >        * But we should try to waste as few as possible entries. We are =
at
> > -      * about 7 on x86_64 systems.
> > -      * Add a check for < 10 so that we get heads-up when something
> > -      * changes and wastes too many entries.
> > +      * about 7 on x86_64 and about 13 on arm64 systems (the arm64 BPF
> > +      * trampoline generates more branches than x86_64).
> > +      * Add a check so that we get heads-up when something changes and
> > +      * wastes too many entries.
> >        */
> > +#if defined(__aarch64__)
> > +     ASSERT_LT(skel->bss->wasted_entries, 14, "check_wasted_entries");
>
> [Severity: Medium]
> Does this threshold provide enough margin for variations in kernel config=
uration?
>
> The commit message notes there are about 13 wasted entries. Using < 14 me=
ans
> the test will fail if exactly 14 entries are wasted, leaving no margin fo=
r
> error.
>
> Minor variations like KASAN, PREEMPT_RCU, or different compiler code
> generation could add a single branch to __bpf_prog_enter_recur and cause =
this
> test to become flaky.
>
> For comparison, the x86 threshold is < 10 for an expected 7 entries, givi=
ng
> a 2-3 branch margin. Could the ARM64 threshold be relaxed slightly to pre=
vent
> spurious failures?
>
> > +#else
> >       ASSERT_LT(skel->bss->wasted_entries, 10, "check_wasted_entries");
> > +#endif
> >
> >  cleanup:
> >       get_branch_snapshot__destroy(skel);


This selftest is supposed to work with the standard BPF CI config and
setup which it does currently, it doesn't need to support all
different configurations and setups.
