Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1F7523A4524
	for <sashiko-reviews@lists.linux.dev>; Fri, 22 May 2026 13:26:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779456372; cv=none; b=Xzn6PNeDYpXv7wXdLFeDhtcBjK1P1MzGzG3yew5VHyvPLwSOayelE2rGsNDSC1+M84232PeF3TpdPzzxg4PxqWt9JVog7foTgZ7Iyiqdkp6L0gusfl/B7tVQlQ9qz+iw5O01iR2axl/GtOqHZEzC32X4RVnHNk+71mBDztjLi0g=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779456372; c=relaxed/simple;
	bh=FoPjOgdeLJRQWn7cNqY8f4gwEd4zWawMMEZJTmJsgd8=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=UtGbGpBMO5kVLje8Pe6qMV3x3pOFhSKvXBlxLAEq8wCUZ/4OdHTRcKt6oWo7gH6FqOuy2sCsQlSr5yrH9b/h/2yOdm7Muxkl+M7k8fASHPgYrk2pGUgUGpAplAfoBls0dT7pRudfhzEmlH4YmgaQZXR2Xxjep+/EK+TRMEloaVs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=FpI1Xg3P; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="FpI1Xg3P"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id B51151F00A3E
	for <sashiko-reviews@lists.linux.dev>; Fri, 22 May 2026 13:26:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1779456370;
	bh=Dl5aYYO+MEICvDDgZswbF89e5xJkomgQFY8vl/ls3oE=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc;
	b=FpI1Xg3PTbBmgnHu+Mmix28sxAq78H6XriCsOFhNglUacQk2SgAFQJbj1O+/gOs7y
	 QN4IL1/tlOiGD+61wdtdBAuQX5C22LEcxJMlo9pyNlzQWWkGjKcAkczgozyPOELEhP
	 7oIoXgGgExitlX1Qb/0J6g/75UfZv0IOVkrlY2gGkXBB8HAq9Sj+ke7biN248OJtPZ
	 3qgxaNc3hMmVWYsX2jO1jLnlmWsZZLr9oP8Ohd2TFfr5cu/Ivo7V54CBCK5ApEoTQO
	 f0I+LR+u78XzL9zUXywxVXPUB89ySlU3Kocdd7CU2Vk121nFyrLJ/YGzdqTbuFmjVI
	 a5b6bSVbQjVhA==
Received: by mail-wr1-f54.google.com with SMTP id ffacd0b85a97d-43d734223e4so4864316f8f.0
        for <sashiko-reviews@lists.linux.dev>; Fri, 22 May 2026 06:26:10 -0700 (PDT)
X-Gm-Message-State: AOJu0YxlHns50G4Sznd+G1pHcTLg42nkqeowWd7rqR9qY1b7i9qcTwnq
	iO1tbJfdHYXDvibsSdgPTp5ARfrpJY66VuxLa6v5mhtq/F0SyQv4KHjpFh6TIalrcnG9WMcCgwc
	QGXa7HXNvuvuLxYuCCR1ZOu3HLSxuPs4xGJGvlp5R
X-Received: by 2002:a05:6000:4028:b0:450:ad00:86aa with SMTP id
 ffacd0b85a97d-45ea319685fmr11923877f8f.15.1779456369334; Fri, 22 May 2026
 06:26:09 -0700 (PDT)
Precedence: bulk
X-Mailing-List: sashiko-reviews@lists.linux.dev
List-Id: <sashiko-reviews.lists.linux.dev>
List-Subscribe: <mailto:sashiko-reviews+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:sashiko-reviews+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20260521152217.2345235-3-kpsingh@kernel.org> <20260521165240.D95EA1F000E9@smtp.kernel.org>
 <CACYkzJ47rASFZLZPz2VU9FE7J2-hGdw2f-5LQYmXoB9urVwRqQ@mail.gmail.com>
 <CAADnVQLJw=Dk=VjWmot4O1WLm2TxLH+-mX3G8AuPd9f_5rAJCA@mail.gmail.com> <CACYkzJ4LO2tAdarpKAO3Nz-XjCiJ3+tNkBp_kXEr-2YqOnCwMQ@mail.gmail.com>
In-Reply-To: <CACYkzJ4LO2tAdarpKAO3Nz-XjCiJ3+tNkBp_kXEr-2YqOnCwMQ@mail.gmail.com>
From: KP Singh <kpsingh@kernel.org>
Date: Fri, 22 May 2026 15:25:57 +0200
X-Gmail-Original-Message-ID: <CACYkzJ62qYAqtjHjFqpCGRZJLQfLYQ2VWbetmZua6zWWMoxyMQ@mail.gmail.com>
X-Gm-Features: AVHnY4KfzdxAObtxhvZXEDntDLm2CtNEQAl8ZMuHvDipwaK_7riABKD_ugxHUCk
Message-ID: <CACYkzJ62qYAqtjHjFqpCGRZJLQfLYQ2VWbetmZua6zWWMoxyMQ@mail.gmail.com>
Subject: Re: [PATCH v2 2/2] bpf, libbpf: reject non-exclusive metadata maps in
 the signed loader
To: Alexei Starovoitov <alexei.starovoitov@gmail.com>
Cc: sashiko-reviews@lists.linux.dev, bpf <bpf@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Fri, May 22, 2026 at 5:47=E2=80=AFAM KP Singh <kpsingh@kernel.org> wrote=
:
>
> On Thu, May 21, 2026 at 11:30=E2=80=AFPM Alexei Starovoitov
> <alexei.starovoitov@gmail.com> wrote:
> >
> > On Thu, May 21, 2026 at 9:09=E2=80=AFPM KP Singh <kpsingh@kernel.org> w=
rote:
> > >
> > > On Thu, May 21, 2026 at 6:52=E2=80=AFPM <sashiko-bot@kernel.org> wrot=
e:
> > > >
> > > > Thank you for your contribution! Sashiko AI review found 2 potentia=
l issue(s) to consider:
> > > > - [High] The BPF verifier will reject the `gen_loader` program on 3=
2-bit architectures because it accesses a 4-byte pointer using an 8-byte re=
ad.
> > > > - [Low] Multi-line comments do not follow the mandatory BPF subsyst=
em standard.
> > > > --
> > > >
> > > > commit 878a81f0d9571d5734eccfbe01c3dfe58050f954
> > > > Author: KP Singh <kpsingh@kernel.org>
> > > >
> > > > bpf, libbpf: reject non-exclusive metadata maps in the signed loade=
r
> > >
> > > [...]
> > >
> > > > > +     /* Reject if the metadata map is not exclusive. Without exc=
lusivity
> > > > > +      * the cached map->sha[] verified above can be stale: anoth=
er BPF
> > > > > +      * program with map access could have mutated the contents =
between
> > > > > +      * BPF_OBJ_GET_INFO_BY_FD and loader execution.
> > > > > +      */
> > > >
> > > > [Severity: Low]
> > > > This isn't a bug, but does this multi-line comment follow the BPF
> > > > subsystem style guidelines? It looks like the opening /* should be =
on its
> > > > own line.
> > >
> > > Sashiko, this is how we comment in BPF.
> >
> > No. Sashiko is correct. bpf doesn't use the old networking style anymor=
e.

Okay. TIL, I will fix it.

> >
[...]
> 2 peak_states 2 mark_read 0
