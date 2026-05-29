Received: from mail-pl1-f180.google.com (mail-pl1-f180.google.com [209.85.214.180])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 776AE332EC1
	for <sashiko-reviews@lists.linux.dev>; Fri, 29 May 2026 17:45:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.214.180
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1780076739; cv=pass; b=YII/5HMwNK6D0QqRL/9u2SiIa5A8YByEKoaL9BsJJ4lWtgXV/8iRnwTRmIMnnXRKSWL/VamXTGgh13IcxJUIFL2R3Ijkt+42bZUg/f4ZSZ17iXJtCUKtjgWwlMGDfMV1Qes37JLHaBMaKCzGrQIQCbZsQ9eAjOUUv7hAgoGXbrc=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1780076739; c=relaxed/simple;
	bh=fQswMPrU/Rn/WAapiKJ6CbEylbnL8bQEKzUreQSEJog=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=TiZAXf4lt/b+02Iw3xjH8ru9qft8CL8oEkBRO48Uy5vfrBnAN0n8QTr5ugMHZtkKd0+nBDiV+cX/7CUZIIC9enLMzAmZPh3gKPAc4cHz3DlYTTNTPop+9R3jHdF5s4ZED3gwulgUStU//SaGN/EMhmFXOAq2xkENcVWDuJlCIA0=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=csYJwumy; arc=pass smtp.client-ip=209.85.214.180
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="csYJwumy"
Received: by mail-pl1-f180.google.com with SMTP id d9443c01a7336-2bf22c18ad3so165ad.0
        for <sashiko-reviews@lists.linux.dev>; Fri, 29 May 2026 10:45:38 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1780076738; cv=none;
        d=google.com; s=arc-20240605;
        b=DGkq6BHFxsfa58kmJlCg0DFpSoero/Q+Mzq7rywFPh0iMaQPf5VJvwg0CEmEWfp4Iv
         389F793Z9+fG1xeREW1nl2OvFyaARIuxtMFJGn1PLPnc8UTgD2pBlOB0h3+EFaV9+dcJ
         9EwY7fb+l0jxAm6KorNDDklwfct0iGiDNI0BcBLtLqwv9L9ztw4EJ0BEYBsLXCrRV5W3
         zqK0pqEhXe+b3Xr7NOE/NkR1qOoGrF6P9FqKdvybfG4N8td1g/9z29v9p213tAuPVDQi
         a2UCIqA9TLv3//hh/Wu/Ckh7Wot3kX4jIkOVa/NjeCyYDuU5bwwYGPRuNOhM9bbgHFG8
         e4pw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=r+MpgGplHrYx6awYXebTwFhUJcPlo+AhzCegKXoq6tg=;
        fh=6K1Zilol94e47/JGg4U6QaVXTQrpxPQTuLBo9pfKiHc=;
        b=T5vDm8irNwEwGY3QZ3OrQ2uRFCX56p5bpGdbELftvHcVUXEhqH7iI7eyzKlGI9i4wI
         teuewntXJwRVrapgz9Q8XcO15p06wp+qfSZLPGEBmwANAN1Co/3vXqTb2arpP4uYHVv7
         VQqYORDGi4GR5x4ZSI7XRgfswg4myqmmRcRVSNe25/xH9ENW8VnE6ljxTVsxL66AJHqd
         MntQV2ej4T37VQ16xnae90Gpe2QNUX5buWkSE+UhvKgWwHGEG9ETsno7MVnKtfL+MP92
         PPZNEWsY5e45K8Ss8GflARX1GODZ4FEb91aSwJb0H0XdtU735T3Y9Kv6xlZuPi1nEkHJ
         Zn6w==;
        darn=lists.linux.dev
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20251104; t=1780076738; x=1780681538; darn=lists.linux.dev;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=r+MpgGplHrYx6awYXebTwFhUJcPlo+AhzCegKXoq6tg=;
        b=csYJwumyAgMLDZxXjno0rWVw4F+5QWgHqpNnxf4ZrEWMKvunDlKgqR0Sc1NXzYpCc8
         j2zrvj5DCgCuLb3j0QlaDRZXlZL6fvjsLtnX4+Q7CT3hW1ONxMUm0d8zg29eU1EmRmBJ
         ysyU9IqMQVs+3r//wwDYLyOPR0lDebXP6k1V3KoPE4xErHbS6gJ8FJ7AMm5ixIfVwAc4
         eILPXd94YMl0xQwD0x8mZPFJizp1MnusHytoOYuc2vJiBvFBG8afdM7sv7N2clwbtVmR
         1HWd1fPhMyKJ5dlQ1/lD7Me6p1pQj8pYXIErh9cMk13U/XIUVjd0KWNXl3edz76Y7NHT
         13ow==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1780076738; x=1780681538;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=r+MpgGplHrYx6awYXebTwFhUJcPlo+AhzCegKXoq6tg=;
        b=HnGr5EY9G4cgV9WWqIP4Xl0A691C1GyoxCO2pJ4F/SMBteLNLWMta6FUjtfz9SN8pT
         9Tsj2IVzgPlserQEzXhqadie/ah66cdCerx7rsQzyave442pNDdMxjbYcdrJ3aCav/lw
         2Gtr6EzCavJtdWNpJI/K2w5/gU39jnihoGXKnVwHV7KhXK7LUIElNIhLujgltWxOjd5r
         RDWMGx/Y5+FriyV5TINGsU5yoQmXeaWPwwHbnobp3E6+Xs+ok9KBrbe7ZxQePcm0jLph
         tnHNoPsbkbLS+y7GtSsjs8gpqm4RiKJvPBNrpc0nhbq0NmptgMVHatkubPkyGC6hN/z6
         OQcg==
X-Gm-Message-State: AOJu0Yz5sSQxGGqh7HrphQ5eQJ8u66DIAnC15Td4KEa8Sc1H9rkuc58Q
	NvPyelpExEO9g+liW8LLeGIJijdhSXPeshweMuqVGIp9xDGZ9DPBglk1vFZehEqcS4vkmYyaiN4
	2tZboo8E8CXYSUek9r0MIWrupx7ENsvOz1LQJS8h1jVeJ5BRLDd3yZ0bSIak=
X-Gm-Gg: Acq92OFO3p6pf/wxTvHADKg/7BFE/O+SWYHMFudQOeziHwsntrDIltaHD4EsjNAwffC
	ysYN91AbFYUKF0qhE2mzk235zQfbewVYkqjZIGHk/66k9q6HDFXFJv3rPfxqJPe1WFPTMRsmT+Y
	HyklAPRo5Mjzs3LxpX3wHlwjA3xl/TUcrEiRZa56QGlwNKnV5Jl9eo+67GTfY2MvQMcvbxO+Iif
	c0/4XkHb9ujKGfMWuyxnzi+L4uLEFo9c2/whKLsgTh2Z6fCwMzZIVeqLxT7cBJV5hkXrjrDyneU
	OKRN9fubVx2HPSWNE0Z7yF5fSWRfhCpZ/cgSPs+uZmVQxDNK9GWIOZQurKY=
X-Received: by 2002:a17:902:ebcd:b0:2bd:6dad:3dfb with SMTP id
 d9443c01a7336-2bfa9f0da37mr148655ad.25.1780076737154; Fri, 29 May 2026
 10:45:37 -0700 (PDT)
Precedence: bulk
X-Mailing-List: sashiko-reviews@lists.linux.dev
List-Id: <sashiko-reviews.lists.linux.dev>
List-Subscribe: <mailto:sashiko-reviews+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:sashiko-reviews+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20260529082451.591783-5-dapeng1.mi@linux.intel.com> <20260529112332.140E61F00893@smtp.kernel.org>
In-Reply-To: <20260529112332.140E61F00893@smtp.kernel.org>
From: Ian Rogers <irogers@google.com>
Date: Fri, 29 May 2026 10:45:25 -0700
X-Gm-Features: AVHnY4IvKd19TeYoJtgBEdRWldpmFvC1WDoPSHx7TM7k5DWVNsGaY7u2fT2RBuE
Message-ID: <CAP-5=fXrjHohqOkq+gnxT2DwKMZ=aiEh0rT4FH6bnXFP5hrnhw@mail.gmail.com>
Subject: Re: [Patch v8 4/5] perf regs: Enable dumping of SIMD registers
To: sashiko-reviews@lists.linux.dev
Cc: Dapeng Mi <dapeng1.mi@linux.intel.com>, linux-perf-users@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Fri, May 29, 2026 at 4:23=E2=80=AFAM <sashiko-bot@kernel.org> wrote:
>
> Thank you for your contribution! Sashiko AI review found 2 potential issu=
e(s) to consider:
>
> New issues:
> - [Low] Misleading post-increment of `idx` in `simd_regs_dump__printf` in=
ner loop.
>
> Pre-existing issues:
> - [High] Integer underflow in manual `sample_size` calculation in `perf_e=
vent__convert_sample_callchain` corrupts the event stream if registers are =
missing.
> --
>
> commit 7e4b22be95dca28326d1271ce91f25c99e231f74
> Author: Dapeng Mi <dapeng1.mi@linux.intel.com>
>
> perf regs: Enable dumping of SIMD registers
>
> This patch adds support for dumping SIMD registers using the new
> PERF_SAMPLE_REGS_ABI_SIMD ABI.
>
> > diff --git a/tools/perf/builtin-inject.c b/tools/perf/builtin-inject.c
> > --- a/tools/perf/builtin-inject.c
> > +++ b/tools/perf/builtin-inject.c
> > @@ -457,8 +457,13 @@ static int perf_event__convert_sample_callchain(co=
nst struct perf_tool *tool,
> >       /* adjust sample size for stack and regs */
> >       sample_size -=3D sample->user_stack.size;
> >       sample_size -=3D (hweight64(evsel->core.attr.sample_regs_user) + =
1) * sizeof(u64);
>
> [Severity: High]
> This is a pre-existing issue, but does unconditionally subtracting the fu=
ll
> expected size of the register mask cause an integer underflow if the perf
> sample didn't capture user registers?
>
> If the sample didn't capture user registers (e.g., when sampling a kernel
> thread), the ABI is PERF_SAMPLE_REGS_ABI_NONE (0). It seems subtracting t=
he
> full mask size would underflow sample_size (a u32), resulting in a massiv=
e
> size being written to event_copy->header.size.
>
> Could this corrupt the event stream or cause out-of-bounds reads when
> perf_event__repipe_synth writes to the pipe?

So this should never happen, because if we don't sample the stack
pointer how are we going to unwind through memory? It may be worth
adding an assert with a comment to capture this though.

> > -     if (sample->user_regs && sample->user_regs->abi & PERF_SAMPLE_REG=
S_ABI_SIMD)
> > -             sample_size -=3D 4 * sizeof(u64); /* Reduce SIMD regs hea=
der size */
> > +     if (sample->user_regs && sample->user_regs->abi & PERF_SAMPLE_REG=
S_ABI_SIMD) {
> > +             sample_size -=3D 4 * sizeof(u64);
> > +             sample_size -=3D (sample->user_regs->nr_vectors *
> > +                             sample->user_regs->vector_qwords +
> > +                             sample->user_regs->nr_pred *
> > +                             sample->user_regs->pred_qwords) * sizeof(=
u64);
> > +     }
> >       sample_size +=3D (sample->callchain->nr + 1) * sizeof(u64);
>
> [ ... ]
>
> > diff --git a/tools/perf/util/session.c b/tools/perf/util/session.c
> > --- a/tools/perf/util/session.c
> > +++ b/tools/perf/util/session.c
>
> [ ... ]
>
> > +     for (i =3D 0; i < regs->nr_vectors; i++) {
> > +             for (j =3D 0; j < regs->vector_qwords; j++) {
> > +                     idx =3D i * regs->vector_qwords + j;
> > +                     if (regs->vector_qwords > 1) {
> > +                             printf(".... %3s[%d][%d] 0x%016" PRIx64 "=
\n",
> > +                                    name, i, j, regs->simd_data[idx++]=
);
>
> [Severity: Low]
> Is the post-increment of idx necessary here?
>
> Since idx is re-initialized at the start of each inner loop iteration
> (idx =3D i * regs->vector_qwords + j), the incremented value seems to be
> discarded on the next iteration.

Yeah, we can drop the dead "++" I think.

Thanks,
Ian

> > +                     } else {
> > +                             printf(".... %3s[%d] 0x%016" PRIx64 "\n",
> > +                                    name, i, regs->simd_data[idx++]);
> > +                     }
> > +             }
> > +     }
>
> --
> Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260529082451.59=
1783-1-dapeng1.mi@linux.intel.com?part=3D4
>
