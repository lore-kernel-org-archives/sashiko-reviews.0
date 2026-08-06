Received: from mail-qt1-f173.google.com (mail-qt1-f173.google.com [209.85.160.173])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 59CC834250E
	for <sashiko-reviews@lists.linux.dev>; Thu,  6 Aug 2026 00:16:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.160.173
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785975370; cv=pass; b=t/rbr7AtFqdBgBi7AgPnvRYJKJQBkGH74lxxfUyhvuchcDGRP0Bwr4g084QJvfms7Srjw1e/tU6H3VK3eSikUEtFrWujA22815LCY44r9r1BEW2zrcH6QPkeKLJQMEKGGGHHeBXcGJRpEL7sK9xhFDxbAwE2/5/efs5GGwL0eLs=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785975370; c=relaxed/simple;
	bh=1d1lwssoXt/w5UuPQU/V3n6PBSQN2l8ZbVnAVXA8kxI=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=ORUt8nRGc0/VQO+dEcVmVYKk+/0dQ1ZksB9bj/azJ2iKz5u8ORRPW9ReZhoOdX5EKW97fG5zZ3cSgKem+BDZpigNbD+wF9jOa0g2TaCWOqTTxH+HLz5pJar9IP60HxIzNbPJ00V0v0MHyd5K8+iOMiJY+WAeNyS5pNhjYP/Vtp8=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=uVAkRCLh; arc=pass smtp.client-ip=209.85.160.173
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="uVAkRCLh"
Received: by mail-qt1-f173.google.com with SMTP id d75a77b69052e-51c10e86e52so60011cf.1
        for <sashiko-reviews@lists.linux.dev>; Wed, 05 Aug 2026 17:16:08 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1785975367; cv=none;
        d=google.com; s=arc-20260327;
        b=lGjb8IxNg4UBu2ikh7Nds34JjeC7VaUCCIh0KcUHqDqpxXYQLOHA2x6k36sH0xf3VE
         jA5X/3g5k04xv7UljhxpJE2ZtwUPmqYbNRPLpVnlRqPxr2zjevYLRll+ODZMtgrJ0HKa
         bYJODGX9MdEUzmEHgKtKiXs+Mj7Tj5UWkZCUCCkESEX9Od0uZwNki7ldueyMWjP6dMZj
         YIIqlFv7wOuUUPext/yrG/DizEx9NfKVWvYjQRG4M19T3daKPn3igIGj5kF3iC6u447u
         maXY+ZyPMSQHtQ8OMHhLNSDOkvjHziN8FCvfmLiCIxHjreUTjuG2g6I8Ga+pS1+Ila9j
         lV9w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=bnWyP7WVZZFVkw6ro1iq5X3/hgo721ZOiHIybOUHuO8=;
        fh=aSGKGwKuRzas8hcZVakVjyK6tWYji3jKo3GL2NaCNCg=;
        b=SghUVzCubz+GZyzs7ev/MG2GJXByec7YyrGonPEbb2nrAPkcZsrxlP+h36V740xVAr
         n6FEOcNQlwlBxlmP2myg97bDZBIVv6aoNAkCnLLS8u8J4jh1pCi7uRKRgf07MzBQzSbU
         ETr39ThRzal4J828m2cIH41PLC6kvhY5s/qfNc23GqwKEzTrhuIeKhdkEEDIYHa/66Ek
         S857ZCFG6hr4t2FZ+rsiXqjO8yd2Wvbyo5X0VR+OcN3DXrp78rJk6qKA2fux8M1UcnkC
         Lx1L3VkTEGw3qYen0RjkQrLVedzw7jCrlNqZ3Pr9DGBG1NPNFvBRmKAz6tECBk54zirZ
         zgmQ==;
        darn=lists.linux.dev
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20251104; t=1785975367; x=1786580167; darn=lists.linux.dev;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=bnWyP7WVZZFVkw6ro1iq5X3/hgo721ZOiHIybOUHuO8=;
        b=uVAkRCLhYS2f8SeQZKDcDtDwt1Xmyd3ggg5cZM3XdrcAe7eLUpkJdGw0dGrjQfuTQy
         EuDpFR8AY7lQ/euwBV7uHhtlpAyc1TQgVgZ2wkXaHWbds7Qo4auOE6WsBSxrO184lCpt
         hd34g17tR+3mhkn17bl1yTGigz4KPqcLHn3npEOpLQHGvaDoMxGZEvIpxcsOlpsU4c3u
         7oTi5vxyz3KniyWjhIuHn87cIAEQhv2VTW9yZev2EEbe5yC7hMRTolibYf/r3O4hN1+d
         UttuEbp+yHDeLMd/0Fe74ZvzeWKjRUwafLajgEM9Vc2ixmRRIHUiTF53XAej6j0rqm+U
         ZeVg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1785975367; x=1786580167;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=bnWyP7WVZZFVkw6ro1iq5X3/hgo721ZOiHIybOUHuO8=;
        b=ExT+RkC6Bgmii3e7ZmU6ByJW9bCP55NHRxiBTp81S+hgy3IoxiBh/HjMFGu4yBbzu4
         CPyBX2DQCpN29uHSRXk2DmdLixU6dk2VwCAZ1fhhSjImnnER0o6R4nwwshUEV8ZRChOA
         7N5M4kwFxJkY7C0sYcC57anj2ov3Re8GPNDSTO/7fuXJluVSDdak7OY8FEKjDkB4EKZ6
         Cv9jSpAwQ42V07Tm1NGMEbBAdoWdc7wlL5KXZgMD7Y0WjjsSveMwgk3HG8mEPADx6PUZ
         0nxHcx+k6iOP3HwMLzv3bvRu6r84uM7A4k8ylulW7kwv07mqLk4uUipcEockQLYZx2kd
         UDZw==
X-Gm-Message-State: AOJu0YytRAc6IjqfdmJXOGo83zReqhjzloZtdOt3Fs6aZuoDMdtJlc7D
	tgsITyMzqk8Bqk860THTtGIK88rqWz54WqkzjlpnnGsPkuaKYx+GIAV3GKi6ZpzPrug1BCM9OZ6
	UHXhIWfpduEDBWVLyIKFY/Dn3lp4/Sm1tbvc39e+aK5GYkRctCFhhexJNAr8=
X-Gm-Gg: AR+sD10Z+aYbDXR7p7XRdOJKEGdhBgsm8SoHSZVy6ZrFA9hiK3IKnYXrac/0YWsbAIP
	Lv3VNLUsUwZP+BtAYEXfHwFDLgsLe4YfCuwQlV/iAGPuCFtoJ9rnXgNSCNlZ00OizjHOhxOAYuG
	UpPLLM24VhNAhX7+WYa1Fp7OrPpUmTeZvwMvIFPr7UEfsVWNsoAnP9yeVu1mRqqbN/9SE6URMIi
	4Hv9a4furtFCqLopNvpDFELbVaiPm8MZXiDrG5kpZWjs4AClV3vaJ6ahGyPTe2ugeNOWlljLezv
	OZd3oM6aQjk/QT1DGvUOUhniRkHKcQpJFgUOzNO5kIpOZ3hpmNNH9RT4bA==
X-Received: by 2002:ac8:5a8e:0:b0:51c:ca9:3d17 with SMTP id
 d75a77b69052e-52cfbf93393mr7508971cf.12.1785975366564; Wed, 05 Aug 2026
 17:16:06 -0700 (PDT)
Precedence: bulk
X-Mailing-List: sashiko-reviews@lists.linux.dev
List-Id: <sashiko-reviews.lists.linux.dev>
List-Subscribe: <mailto:sashiko-reviews+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:sashiko-reviews+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20260803145958.299956-1-tshah@linux.ibm.com> <20260803145958.299956-6-tshah@linux.ibm.com>
 <20260803151949.4AE511F000E9@smtp.kernel.org>
In-Reply-To: <20260803151949.4AE511F000E9@smtp.kernel.org>
From: Ian Rogers <irogers@google.com>
Date: Wed, 5 Aug 2026 17:15:55 -0700
X-Gm-Features: AUfX_mzeNGmPjxUntgQr96gtXyWAyCXdz3ohPUmClKstehdq3XsFqbp4I_lbXmU
Message-ID: <CAP-5=fXdA1YvAoqp61DddxsW4VwjJdmULYOqxk_2e-UAA=E_sA@mail.gmail.com>
Subject: Re: [RFC PATCH v3 5/5] perf test: Add test validating trace.dat
 generated by 'perf data convert --to-trace-dat'
To: sashiko-reviews@lists.linux.dev
Cc: Tanushree Shah <tshah@linux.ibm.com>, linux-perf-users@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Mon, Aug 3, 2026 at 9:50=E2=80=AFAM <sashiko-bot@kernel.org> wrote:
>
> Thank you for your contribution! Sashiko AI review found 5 potential issu=
e(s) to consider:
> - [High] Deleting a securely created temporary file and reusing its path =
creates a race condition vulnerable to symlink attacks.
> - [Medium] The exit trap incorrectly overrides intentional test skips (ex=
it code 2), converting them into test failures (exit code 1).
> - [Medium] Hardcoding the 'cycles' hardware PMU event leads to brittle, s=
purious test failures on environments without hardware performance counters=
.
> - [Low] Stale output file verification due to incorrect cleanup ordering =
on error paths.
> - [Low] A temporary file may be leaked if a subsequent initialization ste=
p fails before the cleanup trap is registered.
> --
>
> --- Patch [5]: [RFC PATCH v3 5/5] perf test: Add test validating trace.da=
t generated by 'perf data convert --to-trace-dat' ---
> commit d717cd6622789cb3b2cd038490f59972dc4015dd
> Author: Tanushree Shah <tshah@linux.ibm.com>
>
> perf test: Add test validating trace.dat generated by 'perf data convert =
--to-trace-dat'
>
> Add a shell test covering perf data convert --to-trace-dat,
> alongside the existing --to-json and --to-ctf tests.
>
> > diff --git a/tools/perf/tests/shell/test_perf_data_converter_tracepoint=
s_trace_dat.sh b/tools/perf/tests/shell/test_perf_data_converter_tracepoint=
s_trace_dat.sh
> > new file mode 100755
> > index 0000000000000..9ca6432618cb2
> > --- /dev/null
> > +++ b/tools/perf/tests/shell/test_perf_data_converter_tracepoints_trace=
_dat.sh
> > @@ -0,0 +1,169 @@
> > +#!/bin/bash
>
> [ ... ]
>
> > +perfdata=3D$(mktemp /tmp/__perf_test.perf.data.XXXXX)
> > +result=3D$(mktemp /tmp/__perf_test.output.trace.dat.XXXXX)
>
> [Severity: Low]
> Could a temporary file be leaked if an early initialization step fails?
>
> If the second mktemp fails, the script will exit immediately due to 'set =
-e'.
> Since the trap is not yet registered, the first temporary file allocated =
for
> $perfdata wouldn't be cleaned up.
>
> [ ... ]
>
> > +trap_cleanup()
> > +{
> > +     echo "Unexpected signal in ${FUNCNAME[1]}"
> > +     cleanup
> > +     exit 1
> > +}
> > +trap trap_cleanup exit term int
>
> [Severity: Medium]
> Does this trap handler unintentionally override test skips?
>
> When the script explicitly executes 'exit 2' for a skip condition (like
> missing libtraceevent), the EXIT trap is still active. This handler then
> executes 'exit 1', which converts the skip into a spurious test failure.
>
> [ ... ]
>
> > +test_trace_converter_command()
> > +{
> > +     echo "Testing Perf Data Conversion Command to trace.dat"
> > +
> > +     if ! perf record -e sched:sched_switch -o "$perfdata" -- sleep 0.=
1
> > +     then
> > +             echo "Failed to record perf data"
> > +             err=3D1
> > +             return
> > +     fi
> > +
> > +     rm -f "$result"
>
> [Severity: High]
> Does removing the securely created file path here open a symlink race
> condition?
>
> The script uses mktemp to securely allocate the path for $result, but del=
etes
> it before passing it to the converter with the --force flag. This leaves
> a time window where a predictably named path is free. If run as root, thi=
s
> could potentially be replaced with a symlink, allowing an arbitrary file
> overwrite.
>
> [ ... ]
>
> > +test_trace_converter_pipe()
> > +{
> > +     echo "Testing Perf Data Conversion Command to trace.dat (Pipe mod=
e)"
> > +
> > +     rm -f "$result"
>
> [Severity: High]
> This test mode appears to have the same symlink race condition as above,
> since the securely allocated temporary file is removed prior to use.
>
> [ ... ]
>
> > +test_trace_converter_mixed_events()
> > +{
> > +     echo "Testing Perf Data Conversion with tracepoint and non-tracep=
oint events"
> > +
> > +     # Record both tracepoint and non-tracepoint events
> > +     if ! perf record -e sched:sched_switch,cycles -o "$perfdata" -- s=
leep 0.1
>
> [Severity: Medium]
> Could hardcoding the 'cycles' hardware PMU event cause spurious test fail=
ures
> on restricted environments?
>
> If the hardware 'cycles' event fails to open on virtual machines or
> unprivileged containers, perf record will return an error and fail the te=
st
> step instead of skipping it or falling back to a software event.

As the `perf record` lacks the `-a` flag this will just record events
for the sleep command and the number of cycles there will be limited.
I'd suggest making this:
perf record -e sched:sched_switch,cpu-clock -a -o "$perfdata" -- sleep 0.1
The cpu-clock is a perf event based on a timer interrupt and should
always exist whether the system be an S390 or a limited system such as
running in a hypervisor.

Thanks,
Ian

> > +     then
> > +             echo "Failed to record perf data (mixed events)"
> > +             err=3D1
> > +             return
> > +     fi
> > +
> > +     rm -f "$result"
>
> [Severity: Low]
> Does this cleanup ordering leave stale data available for validation on e=
rror
> paths?
>
> If the 'perf record' command above fails, it returns early before this fi=
le
> is removed. When validate_trace_format() is later called in the global fl=
ow,
> it will check the $result file left over from the preceding
> test_trace_converter_pipe() execution, which might erroneously report suc=
cess
> for a failed command.
>
> --
> Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260803145958.29=
9956-1-tshah@linux.ibm.com?part=3D5
>
