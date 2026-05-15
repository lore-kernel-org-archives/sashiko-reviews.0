Received: from mout-y-111.mailbox.org (mout-y-111.mailbox.org [91.198.250.236])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E4E2030B50F
	for <sashiko-reviews@lists.linux.dev>; Fri, 15 May 2026 13:12:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=91.198.250.236
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778850773; cv=none; b=QymjJ4ZgjRxY+s1CGWMuJeBnJKXzYv9JMsNS/7psr3zTWMLXVodBjsFQsWTjNMjAAcnS7u5LZ1jWG977JpTM6qQOqTrxiFQ9pN8e8/0EJi0mgBbpSe4d+ayCLLGm+RdNL0Zg7i1DPsfg2zA9DyZ8oJyRjnV72rGQ50o2qAoFBlY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778850773; c=relaxed/simple;
	bh=woKa/z5tR3VSNXhWG5wN26/BLRodpzbqh0NC8VnTJos=;
	h=Date:From:To:Message-ID:In-Reply-To:References:Subject:
	 MIME-Version:Content-Type; b=XxOs7Wl6niRhA9ZF9UHE3ggHD1PLl/gHjsS66PPYi8DBflsfYhZh5/LyOB938K0OMO8k7HrNb58HL1zWikjEi494GfR37lYZPKBw5Z4SsodXfxG2s9Z9EbXrV8hF7zV+dQFeVE9J6sG1FnHYDXIQ0NqfY6Hj5V8JnwgDtOO5x9M=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=mailbox.org; spf=pass smtp.mailfrom=mailbox.org; dkim=pass (2048-bit key) header.d=mailbox.org header.i=@mailbox.org header.b=Gx8aCw/a; arc=none smtp.client-ip=91.198.250.236
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=mailbox.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=mailbox.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=mailbox.org header.i=@mailbox.org header.b="Gx8aCw/a"
Received: from smtp2.mailbox.org (smtp2.mailbox.org [IPv6:2001:67c:2050:b231:465::2])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by mout-y-111.mailbox.org (Postfix) with ESMTPS id 4gH6rn3p6Mz9ygk
	for <sashiko-reviews@lists.linux.dev>; Fri, 15 May 2026 15:06:01 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=mailbox.org; s=mail20150812;
	t=1778850361;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=xoTfyT/uGT71dbeAF6gJOp2mqEkjD8iKlr75jcg2G68=;
	b=Gx8aCw/aIVeTuYaeKOyBWj4wpPRphqwZgxwTDdzaRo6OIZ2xhfQltcMYsi9h9CoAEabG4p
	lAFlecRSaa+SVV91iLtbQuDVo+V/IiM9zpISpze4k3wHaa/d+IYKODadfEmM9t9xFNKMS9
	AmI/IaE1dPe3m2n8lPPQ6lm/YrKrHWArWqpSN+NtVVB++7aT7Spld+v2qhAbIAXTEx1oPF
	2ehq4LXIiHq5RAejPf9DBTE8GQJK+fYkcOei2kgiuDYyNhFvk9kSzSobA10KqmAe25ZksI
	Pj46Zzx8F/ikTqQZU3xlR0cj2qtAiEzzkzVSVlHF4Bz0qwsYklahv3OXfG3TqQ==
Date: Fri, 15 May 2026 21:06:00 +0800 (CST)
From: Ming Qing <a0yami@mailbox.org>
To: sashiko-reviews@lists.linux.dev
Message-ID: <1845890461.615194.1778850360629@app.mailbox.org>
In-Reply-To: <20260515125231.BD66FC2BCB0@smtp.kernel.org>
References: <20260515122952.59209-1-a0yami@mailbox.org>
 <20260515125231.BD66FC2BCB0@smtp.kernel.org>
Subject: Re: [PATCH] cgroup/rstat: validate cpu before css_rstat_cpu()
 access
Precedence: bulk
X-Mailing-List: sashiko-reviews@lists.linux.dev
List-Id: <sashiko-reviews.lists.linux.dev>
List-Subscribe: <mailto:sashiko-reviews+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:sashiko-reviews+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable
X-Priority: 3
Importance: Normal
X-MBO-RS-META: bj7zn7qu9qmg19mptxypz46znx4p1rq8
X-MBO-RS-ID: b0e87f435c694be56c8

Thanks for taking a look.

I think this is separate from the bug fixed by this patch. The reproducer p=
asses the self css obtained from the cgroup iterator, i.e. a live cgroup ob=
ject. For cgroup::self, css_rstat_init(&cgrp->self) is called during cgroup=
 creation before the cgroup is committed and made visible. For subsystem cs=
ses, css_create() calls css_rstat_init(css) before linking the css into the=
 hierarchy/id and before online_css().

So BPF-visible live css objects which use rstat should already have css->rs=
tat_cpu initialized. Also, on current kernels, kfunc pointer arguments are =
trusted by default; the absence of an explicit KF_TRUSTED_ARGS flag does no=
t mean that an arbitrary css pointer can be passed to the kfunc.

The issue fixed here is the missing validation of the caller-provided cpu a=
rgument before css_rstat_cpu(css, cpu). If there is a concrete tracing path=
 which can pass a partially initialized css to this kfunc, that would be a =
separate bug and should be handled separately.

> =E5=9C=A8 2026/05/15 20:52 CST sashiko-bot@kernel.org =E5=86=99=E9=81=93:
>=20
> =20
> Thank you for your contribution! Sashiko AI review found 1 potential issu=
e(s) to consider:
> - [High] The `css_rstat_updated` kfunc is vulnerable to a kernel panic if=
 a BPF tracing program passes a `css` pointer where `css->rstat_cpu` is uni=
nitialized (NULL).
> --
>=20
> commit e8d546639085dcc3eee578c0dace07ba513cb482
> Author: Qing Ming <a0yami@mailbox.org>
>=20
> cgroup/rstat: validate cpu before css_rstat_cpu() access
>=20
> This commit adds a bounds and validity check for the cpu parameter in
> css_rstat_updated() to prevent an out-of-bounds array access when called
> from a BPF program.
>=20
> > diff --git a/kernel/cgroup/rstat.c b/kernel/cgroup/rstat.c
> > --- a/kernel/cgroup/rstat.c
> > +++ b/kernel/cgroup/rstat.c
> [ ... ]
> > @@ -90,6 +91,9 @@ __bpf_kfunc void css_rstat_updated(struct cgroup_subs=
ys_state *css, int cpu)
> >  =09     !IS_ENABLED(CONFIG_ARCH_HAS_NMI_SAFE_THIS_CPU_OPS)) && in_nmi(=
))
> >  =09=09return;
> > =20
> > +=09if (unlikely(cpu < 0 || cpu >=3D nr_cpu_ids || !cpu_possible(cpu)))
> > +=09=09return;
> > +
> >  =09rstatc =3D css_rstat_cpu(css, cpu);
>=20
> Could this still lead to a panic if css->rstat_cpu is uninitialized?
>=20
> The existing check at the top of this function:
>=20
>     if (!css_uses_rstat(css))
>         return;
>=20
> only verifies that css->ss->css_rstat_flush is defined. It doesn't appear
> to check if the per-cpu memory css->rstat_cpu has actually been allocated=
.
>=20
> If a BPF program intercepts a css object during allocation (for example, =
by
> tracing init_and_link_css before css_rstat_init completes), or if an
> untrusted pointer is passed because the kfunc lacks KF_TRUSTED_ARGS,
> css->rstat_cpu could be NULL.
>=20
> In that scenario, css_rstat_cpu() would compute per_cpu_ptr(NULL, cpu),
> which returns an offset from NULL rather than a valid memory address. The
> subsequent call to llist_on_list() would then dereference this invalid
> address.
>=20
> Should there be an explicit check for !css->rstat_cpu to safely handle
> uninitialized rstat state from BPF callers?
>=20
> --=20
> Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260515122952.59=
209-1-a0yami@mailbox.org?part=3D1
