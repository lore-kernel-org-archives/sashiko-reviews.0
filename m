Received: from mail-dl1-f54.google.com (mail-dl1-f54.google.com [74.125.82.54])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 165694F93A4
	for <sashiko-reviews@lists.linux.dev>; Wed, 23 Sep 2026 16:10:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=74.125.82.54
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790179827; cv=pass; b=bPWa1oGCz1Vz+I1zecjcYPFqGTGePnm4105I4G3653uZsrYF9Gy8vW/1HmsG1t6K1yFZLlgdRyo4Okx63ya3HIvXODqE3QoO6ypikoGordOgn2KZnRb8D5/ZF64iD9RFWKFHjdTyAXII4WJUVmbtWZF6wdXai7wCfLfnAclijWM=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790179827; c=relaxed/simple;
	bh=kiPGaBDcl8hreXDZx5sIXbbCgjocPulRbpU3pmIrr8Y=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=ZQYu4407oNnE/DZXv/SKFB3Lfsh1wiKpwT0pnJMa7kx7urPY+rUA+F0H7LrfZJNl55qA/2TDVpKFItS1UBUwxXDVudy2Bt7lXPxuivla9BaDehtqUb6xgJ0yvVS7JIHHXuA7h62iVtMtDuRORzyERqGMLIrUyOuby9xjOqF7Dgo=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=m24tR/xT; arc=pass smtp.client-ip=74.125.82.54
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="m24tR/xT"
Received: by mail-dl1-f54.google.com with SMTP id a92af1059eb24-144e1b6d52cso7117c88.1
        for <sashiko-reviews@lists.linux.dev>; Wed, 23 Sep 2026 09:10:24 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1790179824; cv=none;
        d=google.com; s=arc-20260327;
        b=rbDHvt1oRqZ9wgK3AVcXbbcYIV/04UkeJpVx3Kd5x3OXbrvLm10fpTVh1/n7NX39/W
         HZjyKkjIZShY9Dp0lSQ9WvJ0M2NJ/MPqTGgwB/1xw/C/tDo2Bzw62C0QUEWPDTlGx9yY
         iLwCps334HiXNSmmFWJ32dGNcvOhy0Ko8XOw5cVyOJ72Mi9FiXDp++EnDh46p2/HHTPe
         nH2TWpWDKWP4f4isqkOROR3BLYGxxlZyfGRPDwgsewBIZB2RQahOopam/RN5GuImxs/W
         kK1pV1JOWzjlyfG19DE+Vw9GyE9dnWA75LrRyVpLTvR1/QNGM8h/rZQcpwxppMNSyosf
         Ba4g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=1lgxg5mOOsgs40jnIeWBbdhia7xPrn/6V29iVBWpK6w=;
        fh=0zVHGC//SC94CWFKHtFt4lnskmkXkJNNy7lE0FDd3Ck=;
        b=DHGyBgHhmAMF7Scs5vwv4oKFWwa6TkloJc+pHDbYo4+D5ZoYoqY9x46cQD8FJa2sRu
         V23Pb+dHmvYAeClEeiGq91NWe1xbHKzCtDT4M14YIFOcpigLUG6oeWkgGi80uHnI2v/j
         g6OsP4EAg84aZJcG9z797Ehdi7mGP5AXaIq3H0ITfkUnxVWeztqoRWxUN3IJFJNIUc0A
         89f6JDimsIFwzU/fpyg4H3Ej9Sc1t/96lTVDTOYBPuIgjHNoZlyGA+rba9c5hnq7rQjE
         Ho3nirGnlo0sbF462powUW3SH2YLI3hf98Q1ecsm/AiDuyVMPCc6HK0SR5EISdJbW5vs
         /gUQ==;
        darn=lists.linux.dev
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20251104; t=1790179824; x=1790784624; darn=lists.linux.dev;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=1lgxg5mOOsgs40jnIeWBbdhia7xPrn/6V29iVBWpK6w=;
        b=m24tR/xTsp6aKBgRTVgKD8WrwQQChdR45SBIvu+hLlPhGHBi46ITyLTsIo3y3Xih40
         Wms1XXOSO1CfIKVvH38yjQuCijH+Hqu7M9fQG6zHIfHAB51ZG4tMNokrE/+PcOVaQ3Wd
         4ayNQjX7skRFXZatJ90xjjMdzGminzByjii47V/DtkvFlZTTiLH9D20pdH+evTfR7hJM
         OuVDB2BHrZXVaWJJV8NqVD7VAqZUkCwSrboDkJm+M3TJaTjCBZe2tJV0V9E/VVI/XNio
         92EynyhHJ8nenJ1sC0WqwSWeGtikWMk8xdlA55Gi1NLoEQe5pmanF7oAiyunvRpfmTTX
         Irjw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790179824; x=1790784624;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=1lgxg5mOOsgs40jnIeWBbdhia7xPrn/6V29iVBWpK6w=;
        b=pKVbTLUcYDSezzHMHtzpNR3C8ZTB4hB+PTuzDJzAnEElfxM4STmjpmGtm8nRO4IGMK
         OIf3KJyHPDqJJDXnix0OcntVqVnaxtVzzYkGmAHeiIsxgv5su9VVMc1HLVjQ7Pk/CwB7
         juu3T1QynMWe0RhLV3m2DKbtdsIF3UQPhGybdjhTn7HQDtYfHs/nYbSjX8Z3ZcqgJUuB
         2b1EFkuA7TvdiII6W8NIPLLQqK1AuJz97AWFqPAHL9c5jKQNvDXLKzUG/xGGQFDAp9g1
         koaglV8iTyJcx5nHUAEWdHwLgXcwaa5j8FU63Q4b6WjNgIhBEAzQ3zyzwDAwku2wb815
         HgJQ==
X-Gm-Message-State: AFuF++mtZanbKJHJWiRRjvrh3kH5d1jiEShRtUo1zoGlc5QNuCjj56Fr
	xKjkSZhh14ZgpJp+6dKPPAvphxGupDz+zwn206s3Qzj7qRD/EXjpgo3pRC7zfwoNID3bhEZ6BAu
	jjYz4aqAnAnJpmN9kNXQi/R8CLIiN+bd1ifbc22SsuQwouZNQX2TQcw56
X-Gm-Gg: AYBFou3FxiS9+og8ooJWlUL4fMspORQYQ82onYFXp8O4mqZpzTmneQOn/87wz6wU4IJ
	Z4Nqlm5RM6TesXF8btZjfMWP9cz5Gkr5d8xoo9fDgXTlLh5fQJBtwmDKsYCZ/QT+kpIUIDwgHX7
	3erTeVhhIvAspsPSWcnnOkUqUO9EEHzbqSAYKQv6gKgRzPgloA9YTSJaWANxULDpA++qnrsi5dB
	dgA+LiWWwbRMIwcRh9S1x+ykeMpW352WH7hx31+FSya7cDH2zoTEFWZu/5KLhTI5Yk+ZFWCs8Y4
	jx6sDkhe46D+hjeQxosPtoGKWPganFqX4paMEcnDHOEYBNgYjkaVetwWA86wFK8M7tSpxK5hptX
	M0hxxUz0dQGzd8pPR+on6
X-Received: by 2002:a05:7023:88b:b0:144:cad0:b470 with SMTP id
 a92af1059eb24-14502f73758mr49806c88.6.1790179822479; Wed, 23 Sep 2026
 09:10:22 -0700 (PDT)
Precedence: bulk
X-Mailing-List: sashiko-reviews@lists.linux.dev
List-Id: <sashiko-reviews.lists.linux.dev>
List-Subscribe: <mailto:sashiko-reviews+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:sashiko-reviews+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <cover.1790145937.git.irogers@google.com> <f022c34f984e5037f4f4bb0daa75963ff8912e4e.1790145937.git.irogers@google.com>
 <20260923072549.DF9921F00893@smtp.kernel.org>
In-Reply-To: <20260923072549.DF9921F00893@smtp.kernel.org>
From: Ian Rogers <irogers@google.com>
Date: Wed, 23 Sep 2026 09:10:10 -0700
X-Gm-Features: AclHuK_tTcX4yQRPKVniDHNvuKbSOQVLrDerNyRp97HRo5GX_hyE6oEQHiXfNJE
Message-ID: <CAP-5=fWvd_j84D=MHNQ_vJXrtbeT_GsH2LiVa_JOYbO9mh2h1Q@mail.gmail.com>
Subject: Re: [PATCH v5 02/23] perf trace: Include the augmented arg header in
 nanosleep's payload length
To: sashiko-reviews@lists.linux.dev
Cc: linux-perf-users@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Wed, Sep 23, 2026 at 12:25=E2=80=AFAM <sashiko-bot@kernel.org> wrote:
>
> Thank you for your contribution! Sashiko AI review found 1 potential issu=
e(s) to consider:
> - [Low] bpf: use of C99-style // comment violates BPF comment style guide=
lines
> --
>
> commit fdd001e20d7e2bd912d88ce8d78d5f254e09e3cd
> Author: Ian Rogers <irogers@google.com>
>
> perf trace: Include the augmented arg header in nanosleep's payload lengt=
h
>
> This commit fixes how sys_enter_nanosleep() sizes its output record. It
> includes the size of the augmented_arg header in the length calculation,
> matching the behavior of other augmenters. This ensures the entire timesp=
ec
> payload is correctly output to the ring buffer.
>
> > diff --git a/tools/perf/util/bpf_skel/augmented_raw_syscalls.bpf.c b/to=
ols/perf/util/bpf_skel/augmented_raw_syscalls.bpf.c
> > --- a/tools/perf/util/bpf_skel/augmented_raw_syscalls.bpf.c
> > +++ b/tools/perf/util/bpf_skel/augmented_raw_syscalls.bpf.c
> > @@ -426,7 +426,8 @@ int sys_enter_nanosleep(struct syscall_enter_args *=
args)
> >  {
> >       struct augmented_args_payload *augmented_args =3D augmented_args_=
payload();
> >       const void *req_arg =3D (const void *)args->args[0];
> > -     unsigned int len =3D sizeof(augmented_args->args);
> > +     // the size + err in all 'augmented_arg' structs
>
> [Severity: Low]
> This isn't a bug, but does this violate the BPF comment style guidelines?
> The BPF subsystem requires comments to use the standard /* */ format rath=
er
> than C99-style // comments, even for single lines.

Ack. The code already uses // for the same comment elsewhere, so using
// is more consistent. There should likely be a global clean up of BPF
code to use /* */ comments. I'll not spin a new version for this
change.

Thanks,
Ian

> > +     unsigned int len =3D sizeof(u64) + sizeof(augmented_args->args);
> >       __u32 size =3D sizeof(struct timespec64);
> >       int err;
>
> --
> Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/cover.1790145937.=
git.irogers@google.com?part=3D2
