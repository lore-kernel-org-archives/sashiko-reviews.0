Received: from mail-pf1-f179.google.com (mail-pf1-f179.google.com [209.85.210.179])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 096641E5207
	for <sashiko-reviews@lists.linux.dev>; Fri, 22 May 2026 17:17:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.210.179
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779470276; cv=pass; b=UYOG/03el/gPDPWgAkRezS8h3/y1YAzvh9dgcvLCyPpVJnOzgDQm8QKcCMo33s8Dd8oucMqEvmWJlC3ilq0sJpc1RkQg5fYrmnqW0EaT8+m7QsnwRG3eks7lYuj4sDavbTvKkNzSdHDJMzzDMpXnbY0QDjnNi+FqsM9Vt9ulsf8=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779470276; c=relaxed/simple;
	bh=Np5IA5KDeH2lFuW1e5XC526o0Q+R7kgdyXZD6YFJ8xA=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=JzFsBcuX8213DMP27su5M9BnLAYJfjy9XDZ/aptp+6FcWp6ndjyENXpWQEEjh4jpvTQ0xn9c+XBSxiXPWyLydgmhbbGSdkWZYmBHkD449CcqYesk0jUzSZRmIvwnm38cBCI4FikWVKHUmXGntDQtzgZaEvAuhbxLar1hue1g+cA=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=lv338B/8; arc=pass smtp.client-ip=209.85.210.179
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="lv338B/8"
Received: by mail-pf1-f179.google.com with SMTP id d2e1a72fcca58-82fa8d6425bso3524031b3a.0
        for <sashiko-reviews@lists.linux.dev>; Fri, 22 May 2026 10:17:54 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1779470274; cv=none;
        d=google.com; s=arc-20240605;
        b=M4wJNrqEdVUwglepfWColAjgGMdTl08xe3CWTNtafU/rRp3hJLj4Ngp5zW/CX6r2uW
         IJdtx8ZxbWsAdfYaKg72/urmVEVct3aSJf+Ju44A+n/yfxF0nkHmfk2Fh4ePe5mLWz0l
         qiuDeQSif0njFvZk5scKzFyvgr6v7t121oTbChoHncCjlau2deCUAK8v7tF/LIbApdh3
         tzeh4HNHoZOyjEBCvRviJNCT4lnyC44UT/GNpYVDEeR+kFuucoJLC/9ocImf7WPDDJW/
         ph41Czn2GzUR206VI22fOmHbybaIg4IsPV9HIoS9gCxCfmkHhWmYget8GlsQgwmouhcS
         ekJw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=/5I6FIDi7VE5vcduNY8wcjk0wGTtEt3rDyHZgwG+GZ8=;
        fh=tT4qUtpmy0txLYxoaqSspfq/ubaRZ/srzuGYuzWMKb0=;
        b=e+b2befJ1Qv4tOckHYLUNkP17pe2UhqsYJyq1EfzRlfG3JZKpkkL1kmg8rnHbiwRju
         gSVvdnwpu0qTLq7CKoeJXT4tVWprI3mVQ+BfDd4dlDZF9ZREVxHI8RTAo1vv3eR6BNJd
         tMkNafLYn9F5Pmm5E31MzT/H3VaeLyxd6v2jhbd7xJIaO5SiJ4B0KZXePc/eaEwTVV/P
         VTqa1QXkbNKzLfbnJ1bnC6nj9JibBzxIeAFibuEiM25Jp3QzGpYlERUrOkWLHYcjaL7l
         8pXmP6wKBjR32s6Vx+N0H9/ZujZQrB2W0GXFxYsUm+pxldBEYKVqaxX2hD9W/15Bf5PI
         rDYw==;
        darn=lists.linux.dev
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1779470274; x=1780075074; darn=lists.linux.dev;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=/5I6FIDi7VE5vcduNY8wcjk0wGTtEt3rDyHZgwG+GZ8=;
        b=lv338B/85Nt0Kidgl2uswIG0xyFlW5IpNCpMheXkD1P3KNUt66GDvmeCnXw1Lmz4CJ
         mASk6vzvH3N9lK63jr18ZZLPpV1Hi0Ijqcv0LcfKI8L0ApVp5PFkdV1p9g2E8nF3BNt4
         Mt1T0FdD0QO3KKKp/WdQ++P+OtygCtZlFY0thITMHhM+tr1Q0xo5r3wsFERhzVwnMaX+
         wKzveqYD8spBxJsoaTzS5jLWatD00T8rq9Oz0d2Uu5Tq4TZ4phGRbcRg6g7rDKT8FunJ
         dkopKV61a30r0N3+Ebr9uLV/G1H4CftyGUWqMxEQFRz+Vde4M+RF2tG9nXO7kLNj3m6G
         xWWg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1779470274; x=1780075074;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=/5I6FIDi7VE5vcduNY8wcjk0wGTtEt3rDyHZgwG+GZ8=;
        b=Wm/cj8pIuSir0wKDxv0F6YUM96lLnEe9u/jXwr5xikGJwCwa6geCjmJbwFTy/Y5AB+
         Z8PDIJx8/SAIOcwJG00RHQklM8ja2kbTYlYiR7ciBFBAtrmM3GF8XAkIR4OucTH9sByD
         PlZy3/67wIbpJjs7lZL5WkUZovgFGAoBg2Vqw+bKKCfqVyKafaA07Zyr3C4NkBxN6k2C
         5FCTQw3Bs84yp5opTu8msQvHC+4swmVgKqhJUE70wUVsoNKqXXloh8EnhgDWewHyqNdS
         YoyoJger1YRQL/TDAwwaT84YwyHPzDm9nYTw7s5rQZP7PDtLTQMvlsjEdVgu1+ksNBc9
         hFQQ==
X-Gm-Message-State: AOJu0YwYOgHcendiL7RkHqR0nDqelW4U7chkYSKktZXdE89/ZtgAMIdl
	nvcLxFY+coVVOiGug5A9HPFJjpjyCehSd5tKiFF9HaButqLxFgDa3xy9M7wLTQfTQlpi11/LFWD
	7b+TDGK8Ls/nuCz8AeiXg2zPbddeMEjU=
X-Gm-Gg: Acq92OFycsHh6D+t/F1RvPocY+NyRBFXhP9j//DXHBjMt2mkiCH7uuc5HVmDB8uls4a
	8wZxXLsZPViCG4B29pCKjYW8ob2r3pR3lODrDkROReaVNHjibAvobHEp2LtVUxkYy4RCmqs6up1
	/weSeCiwMOt91LAAnX4PvdnfL0PfJPmEh+siqMJ78ioMryMZiJaNhP3qBA1X2qcubR0ntOLYBXL
	hmgUmOWSmjYzmUq1MflFRcD2CdB9y+ZgacIe+Ry+bdBHjDySStrimnYE68BruK1RmiNJrs76vkq
	Z+njeX3ocpknW+Kc9RgKdDA=
X-Received: by 2002:a05:6a00:908b:b0:83d:446c:2a8c with SMTP id
 d2e1a72fcca58-8415f406c9amr4569522b3a.25.1779470274180; Fri, 22 May 2026
 10:17:54 -0700 (PDT)
Precedence: bulk
X-Mailing-List: sashiko-reviews@lists.linux.dev
List-Id: <sashiko-reviews.lists.linux.dev>
List-Subscribe: <mailto:sashiko-reviews+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:sashiko-reviews+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20260521225022.2695755-2-ihor.solodrai@linux.dev>
 <20260521231600.E14FD1F000E9@smtp.kernel.org> <8818c106-1e8e-488e-8da4-98c6b079f8b9@linux.dev>
In-Reply-To: <8818c106-1e8e-488e-8da4-98c6b079f8b9@linux.dev>
From: Andrii Nakryiko <andrii.nakryiko@gmail.com>
Date: Fri, 22 May 2026 10:17:39 -0700
X-Gm-Features: AVHnY4J0Pqsv-bFnIsqJvEAa7VmXyLd62vpDQYDKfSDNypd5i5bA5EI3wU1FMA4
Message-ID: <CAEf4BzbdxNG4ST4sv6BLT5BuE108ziYhNj58m0O8UTtsKTjRtg@mail.gmail.com>
Subject: Re: [PATCH bpf-next v6 1/3] bpf: Factor out stack_map build ID helpers
To: Ihor Solodrai <ihor.solodrai@linux.dev>
Cc: sashiko-reviews@lists.linux.dev, bpf@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Thu, May 21, 2026 at 4:33=E2=80=AFPM Ihor Solodrai <ihor.solodrai@linux.=
dev> wrote:
>
> On 2026-05-21 4:16 p.m., sashiko-bot@kernel.org wrote:
> > Thank you for your contribution! Sashiko AI review found 1 potential is=
sue(s) to consider:
> > - [Medium] Data race and incorrect ordering in stack_map_build_id_set_v=
alid causing stale reads
> > --
> >
> > commit 4eb2cc8713ca7f31dcbc75f5166e94dd60761e7c
> > Author: Ihor Solodrai <ihor.solodrai@linux.dev>
> >
> > bpf: Factor out stack_map build ID helpers
> >
> > This commit factors out helpers from stack_map_get_build_id_offset() to
> > prepare for adding a sleepable build ID resolution path. The commit
> > message states there are no functional changes.
> >
> >> diff --git a/kernel/bpf/stackmap.c b/kernel/bpf/stackmap.c
> >> index da3d328f5c15a..4c753e02c4159 100644
> >> --- a/kernel/bpf/stackmap.c
> >> +++ b/kernel/bpf/stackmap.c
> > [ ... ]
> >> @@ -152,6 +152,28 @@ static int fetch_build_id(struct vm_area_struct *=
vma, unsigned char *build_id, b
> > [ ... ]
> >> +static inline void stack_map_build_id_set_valid(struct bpf_stack_buil=
d_id *id,
> >> +                                            u64 offset,
> >> +                                            const unsigned char *buil=
d_id)
> >> +{
> >> +    id->status =3D BPF_STACK_BUILD_ID_VALID;
> >
> > [Severity: Medium]
> > In bpf_get_stack(), the destination buffer can be a BPF map value that =
is
> > concurrently readable locklessly by user-space. Since the buffer initia=
lly
> > contains the raw instruction pointer (ip), does setting status to VALID
> > before writing the offset create a data race?
>
> This is a good point. Will fix in the next version.

I honestly wouldn't bother, this is a misuse of the API to
concurrently write to the same buffer from two independent
bpf_get_stack() calls. We shouldn't guarantee any sane behavior in
this case anyways.

>
> >
> > A concurrent lockless reader polling the status field might observe the
> > VALID status while the union still holds the raw ip instead of the corr=
ect
> > file offset, and before the build_id string is fully copied.
> >
> > Prior to this patch, the offset was written before the status. Could th=
is
> > reordering of assignments cause concurrent readers to observe stale dat=
a?
> >
> >> +    id->offset =3D offset;
> >> +    if (id->build_id !=3D build_id)
> >> +            memcpy(id->build_id, build_id, BUILD_ID_SIZE_MAX);
> >> +}
> >
>
>
