Received: from mail-qt1-f178.google.com (mail-qt1-f178.google.com [209.85.160.178])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F25334E4C3C
	for <sashiko-reviews@lists.linux.dev>; Mon, 28 Sep 2026 19:26:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.160.178
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790623614; cv=pass; b=JGbv1Z+IAu1qJqcPDpykSF7PgdTfndpim+QNRDoeDjOHpzos4tubS0tW4fOP8XB9h5OeaMsloot0PLh62DeCcRJ1eM4Wv2LRkAwyyP3PbbKLqXPH8xYQN8EYRDgOwSOeV6S1XXyvDK52hL1oKhqaX6/8zvypzAewMYOikBot1pw=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790623614; c=relaxed/simple;
	bh=CCtsovL76mQGnwUnadWeKBo/Yn5xN9tJZzTsPA2bd9U=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=c45kyRFshIDooIRk0vNeYp7xkoaiUoeG/NYk7pQIR+KUvteEqeDkcOcoqr5wvuaG5eEbHHhRE2XV7N+msGtLrk94MYqgAKX91oFxB7GkdLdrxfzyU6EcCP+hCfsQfrdZ39bBrWlCY7IjahUAXErjgNN9icbnRBxpwOPFY4q6Ul4=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=cCjCKYy/; arc=pass smtp.client-ip=209.85.160.178
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="cCjCKYy/"
Received: by mail-qt1-f178.google.com with SMTP id d75a77b69052e-5333401e359so10431cf.1
        for <sashiko-reviews@lists.linux.dev>; Mon, 28 Sep 2026 12:26:46 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1790623606; cv=none;
        d=google.com; s=arc-20260327;
        b=PuiF0MrlF9xxK1fTgYw2wC0jvAqlA/MAOIrrY0/Ye1lGdN8vBz6hNRZVGSe21+Q7BB
         6jcgWz29M22urH5ApRE5SOvQgx/AADykkIFOoaTRvP2sqiqTJaPTuhxPATX33F32TtwL
         G4pfcivrPpfTf+MOWSFUm2YIAppmiHRi5ue20Wu2ngj81VCDYuaik4yIImSNCyAhkgYB
         o6RCbS1aGzl8UX8uhOHIwZ6F3LZGimoNRt5cVavHbZrleL32/5YeAuGUwiy+mfg8rvFg
         +Xocrrkp5j3RmvjWeEkAedXHO6KtQCAHucvvrSWlEcCl9eQ9t+OvtpnvgorV4ceU0tdK
         re6Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=O1YVRuatRiCyBlEcIy8P0JVw+6nR39Uq0eyj7XmStx0=;
        fh=0zVHGC//SC94CWFKHtFt4lnskmkXkJNNy7lE0FDd3Ck=;
        b=MTzE9PaUmZ+EX9loSuMSDPB0Q4IMQHlrY3MJ3kRyudQUCt8czMwQw8Hmyk83XzA+/L
         GFcaHFq0GVSBf6/nBLFY9tugvtd9JlpViXXJLit2FxXZ3L+ScxtbhsYKVe6AoWzs2XYU
         UAtcgw899QDtXCwFbmVwbNtKGRk9SCO5tzhp1OkWohpBveM+/X3eRY+Z9YsyaLCyfdgo
         yhHdN+2MjDfrmBDeiAmqfMp53g6xjfkuxT64Tox8/JQ/yhDXuX6M221BtlrK4CXIRWSz
         MVCTqkuntJRqKvy+1m93xkNOX5Z1R4stiuhm45+p0UbgsSHmcLg/2dIMv1Qde4ahwFby
         H0LA==;
        darn=lists.linux.dev
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20251104; t=1790623606; x=1791228406; darn=lists.linux.dev;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=O1YVRuatRiCyBlEcIy8P0JVw+6nR39Uq0eyj7XmStx0=;
        b=cCjCKYy/Rbxj2fNgQWMjYpYkV8SBofvLy5u5laFxEzw8BNQEMzb0Sr2T9CuEzQ3ndu
         IofvV3YI1Lj692vtLCU6ER1uKGWJQ1N6mXfBT0xFcQxkOGMPg0FdlywP6kqfjpY/rZFm
         mpAtrNOZmb/LZE0+uD1RNXxu9KgOxo70w3JDSCd7oOVeaEOSKwUA/O9FrWBCpnV2rG+1
         E0AK1fSzQ0jKB1I7Mzh10O11GngP/5sgmVlAqH7B0is27tnTn4B7mn7VLdfg7XZTOFl+
         UdTY1vkvpUSmD0VHZWXTnXKSgvUXuUmomAP/KE+IGiLVRZXrO6ecyyDB/LWMgj94vnOi
         uwcg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790623606; x=1791228406;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=O1YVRuatRiCyBlEcIy8P0JVw+6nR39Uq0eyj7XmStx0=;
        b=daRf1gT5np4I0OTPRxKMkU0p6BDVqb1U/8wGA1fCNKvthvZd5/fpYb09eyGxXrzTY7
         Be6RtxCF9MSQYdc3PR+lVrmZbvGVguwOdSGxd2y8+1oI0n3N4srl4LQ2ijCROgAJEzof
         WoWn8Vm58XLNJL51oxbVfJp3VUwxsFmWJewaVJ3Mj7WqpguN6D1qkUUrMDbGs+wwD/9I
         pFHT6/x53k3eYToA+eEdaSHWZbwxsKgseIe8u/I2WXtQKou32zXZjatmRoqNwx8/usRB
         NLwoFCw9yM5kUOAQtmCv+ePdrIk/wGrUIT6eCBKjqqYiaP+Q+MLNVQ+qE7aohTRzeEyz
         Af4Q==
X-Gm-Message-State: AFuF++lMprP5jAudhrFNFaeSIsecd3u+wx1qZ10gKBdVpbfnAN9OFc6Y
	4w/DnaVk+D2R//iwdImaUzqV25wManQEjtRC4QZbqeHr/pCdU/MBiXUmoBljpk1viuHtQcS/aZx
	/h1wVChUcXqaG4ZYYzKhmkuEE2cMiWi/8L3y4QaGv3mJKfMDNnqmb7vx/hmM=
X-Gm-Gg: AYBFou0n6R8wQULTzlFsI+sMfRjDmAnwi0TKiwSD/uDALXQMJbzqDyHMBID8GHGy/Kg
	iqeRQzEaZpNbLtLI77ZYBaFEGuMAPe9XmI567d7diruV12i4YKwFDT1+7ClewC0yD6EmJB+VrW9
	GgvkLA22TDGH108wWaJDxZoruUO80spT3m+G6cr2z0w/QSIQFZF71popwf8Peb2Nj/VgRVLMLNp
	PeUueTXcDdEgGC6IR7jaGCn1Y2+xaT4VFIu8XyITV1WMQCXT7tr0xQlNS/7gbTUKl/OunIWtk37
	JvLTevmCs2ZE3GQBb5BCBNUZK7PcWSUxLblxIUoHyzRbJtKp7wHKxPEUZqiVMJvxb2Rl3R2lu3a
	UKRGuMYVc
X-Received: by 2002:a05:622a:152:b0:532:a17b:9581 with SMTP id
 d75a77b69052e-533589a1f9fmr1095181cf.3.1790623604931; Mon, 28 Sep 2026
 12:26:44 -0700 (PDT)
Precedence: bulk
X-Mailing-List: sashiko-reviews@lists.linux.dev
List-Id: <sashiko-reviews.lists.linux.dev>
List-Subscribe: <mailto:sashiko-reviews+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:sashiko-reviews+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <cover.1790145937.git.irogers@google.com> <20260928182605.3649015-1-irogers@google.com>
 <20260928182605.3649015-18-irogers@google.com> <20260928184640.E53151F000FF@smtp.kernel.org>
In-Reply-To: <20260928184640.E53151F000FF@smtp.kernel.org>
From: Ian Rogers <irogers@google.com>
Date: Mon, 28 Sep 2026 12:26:31 -0700
X-Gm-Features: AclHuK9vZf6ldAAIZ0qh_-pa8BEHDUt81WPZTx-PT06jSAGJTHiMtcW2Ir2uvsg
Message-ID: <CAP-5=fXkC4A4J-Acz2+bbfUup6YyHSZ6H3w8TvHkiJAErOBZcg@mail.gmail.com>
Subject: Re: [PATCH v6 17/26] perf trace: Do not return 0 from syscall
 tracepoint BPF
To: sashiko-reviews@lists.linux.dev
Cc: linux-perf-users@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Mon, Sep 28, 2026 at 11:46=E2=80=AFAM <sashiko-bot@kernel.org> wrote:
>
> Thank you for your contribution! Sashiko AI review found 2 potential issu=
e(s) to consider:
> - [High] bpf: perf trace silently loses syscall events on BPF augmenter f=
ailure paths
> - [Medium] perf: out-of-bounds read in trace__bpf_output due to missing b=
ounds check
> --
>
> commit 662e5192e10694c169bbb2fe60bc8a7182517dbe
> Author: Namhyung Kim <namhyung@kernel.org>
> Subject: perf trace: Do not return 0 from syscall tracepoint BPF
>
> This commit transitions perf trace to exclusively use the bpf-output even=
t
> for both augmented and normal syscall arguments, omitting the standard
> raw_syscalls:sys_{enter,exit} tracepoints. It identifies whether the
> bpf-output data belongs to an enter or exit event by repurposing the
> common_type field.
>
> Link: https://lore.kernel.org/r/20250814071754.193265-4-namhyung@kernel.o=
rg
>
> > diff --git a/tools/perf/builtin-trace.c b/tools/perf/builtin-trace.c
> > index d327603ae4540..3dd40f3c3cbb7 100644
> > --- a/tools/perf/builtin-trace.c
> > +++ b/tools/perf/builtin-trace.c
> [ ... ]
> > +/* The BPF output event carries both entry and exit, tagged in common_=
type. */
> > +static int trace__bpf_output(struct trace *trace, union perf_event *ev=
ent,
> > +                          struct perf_sample *sample)
> > +{
> > +     u16 type =3D *(u16 *)sample->raw_data;
>
> [Severity: Medium]
> Does this code safely dereference sample->raw_data?
>
> If the bpf-output event is missing the PERF_SAMPLE_RAW flag,
> sample->raw_data could be NULL. Alternatively, if sample->raw_size is les=
s
> than sizeof(u16), could this lead to an out-of-bounds read when processin=
g
> corrupted or malicious perf.data files?

Neither can happen. trace__bpf_output() is only the handler for perf
trace's own __augmented_syscalls__ event when tracing live;
trace__replay() doesn't set a handler for bpf-output events, so a
perf.data file never reaches it. evsel__new_idx() gives bpf-output
events PERF_SAMPLE_RAW, and the only writers are perf trace's BPF
programs, which output at least a struct syscall_exit_args (24 bytes).
The handlers it calls already read the syscall id at offset 8 of the
same raw_data, as trace__sys_enter() did for this event before the
patch.

> > +
> > +     if (type =3D=3D SYSCALL_TRACE_ENTER)
> > +             return trace__sys_enter(trace, event, sample);
> > +
> > +     return trace__sys_exit(trace, event, sample);
> > +}
> [ ... ]
> > diff --git a/tools/perf/util/bpf_skel/augmented_raw_syscalls.bpf.c b/to=
ols/perf/util/bpf_skel/augmented_raw_syscalls.bpf.c
> > index 3bc9e28a9b8a3..d16e55706335b 100644
> > --- a/tools/perf/util/bpf_skel/augmented_raw_syscalls.bpf.c
> > +++ b/tools/perf/util/bpf_skel/augmented_raw_syscalls.bpf.c
> [ ... ]
> > @@ -408,7 +424,9 @@ int sys_enter_perf_event_open(struct syscall_enter_=
args *args)
> >
> >       return augmented__output(args, augmented_args, len + size);
> >  failure:
> > -     return 1; /* Failure: don't filter */
> > +     if (augmented_args)
> > +             augmented__output(args, augmented_args, sizeof(augmented_=
args->args));
> > +     return 1;
> >  }
> >
> >  SEC("tp/syscalls/sys_enter_clock_nanosleep")
> >  int sys_enter_clock_nanosleep(struct syscall_enter_args *args)
> >  {
> [ ... ]
> > -     bpf_probe_read_user(&augmented_args->arg.value, size, rqtp_arg);
> > +     err =3D bpf_probe_read_user(&augmented_args->arg.value, size, rqt=
p_arg);
> > +     if (err)
> > +             size =3D 0;
> > +     augmented_args->arg.size =3D size;
> > +     augmented_args->arg.err =3D err;
> >
> >       return augmented__output(args, augmented_args, len + size);
> >  failure:
> >       return 1; /* Failure: don't filter */
> >  }
>
> [Severity: High]
> Does returning 1 here without explicitly calling augmented__output() resu=
lt
> in silently dropping the syscall event?
>
> Since this patch drops the raw_syscalls:sys_{enter,exit} tracepoints and
> now relies entirely on bpf-output, returning 1 on BPF augmenter failure p=
aths
> (like in sys_enter_clock_nanosleep and sys_enter_nanosleep) appears to
> completely lose the trace record.
>
> Should these failure paths be updated to emit the unaugmented payload,
> similar to the fix applied above for sys_enter_perf_event_open?

No, those branches are there for the verifier and are never taken.
augmented_args_tmp is a 1-entry per-CPU array, so looking up key 0
can't return NULL, and sys_enter() makes the same lookup and check
before the tail call. The size check compares two constants,
sizeof(struct timespec64) and sizeof(arg.value) (PATH_MAX), so it's
always false. A failed read of the timespec doesn't take that path, it
is output with arg.err set. The other augmenters' early returns are
unreachable too; rename's arg.size is at most PATH_MAX after
augmented_arg__read_str(). perf_event_open's failures are reachable, a
bad attr pointer or an attr->size over PATH_MAX, so only it needed to
output the unaugmented args on failure.

Thanks,
Ian

> --
> Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260928182605.36=
49015-1-irogers@google.com?part=3D17
