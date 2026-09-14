Received: from galois.linutronix.de (Galois.linutronix.de [193.142.43.55])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 57BE7412BEF
	for <sashiko-reviews@lists.linux.dev>; Mon, 14 Sep 2026 08:43:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=193.142.43.55
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789375400; cv=none; b=a4milkZMYSAyWZtuPx6ICVqlAUDoXSAYsAKZ+hgXqYABmRMA1Dlboe9XQ5MQkSbmC7KBhmWNXV9pknq+scSzaouQ1xJ+QiTCGPu4oV4t9enS8B2hxGXVOx5XJf6VRYJSxN9KNMMtIWzizps/ekil2bXUHzc6scI5GyZ2FUpUOMo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789375400; c=relaxed/simple;
	bh=gd+qqjAMIqUJHMXe/UiAHncDTJYLgPQAMR6AsYzuoBA=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=Se+ALuYM9GJrhQ5/QuBwk+Xywk0Z7AKhcuIBgBfo8P2LjOxr0Ly02nBziVdIogaanoTgQyswOgvk0dZJzbOggShnOxZA84DOx1u7BCGs7unbgK0LV6BtzTX+RtXPtQbg0P4rjbCpZjk3Do1dfLyoGaJj1LKCs2dUes0bN2jHMUI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linutronix.de; spf=pass smtp.mailfrom=linutronix.de; dkim=pass (2048-bit key) header.d=linutronix.de header.i=@linutronix.de header.b=ODdIDkbu; dkim=permerror (0-bit key) header.d=linutronix.de header.i=@linutronix.de header.b=rDOTwdKQ; arc=none smtp.client-ip=193.142.43.55
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linutronix.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linutronix.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linutronix.de header.i=@linutronix.de header.b="ODdIDkbu";
	dkim=permerror (0-bit key) header.d=linutronix.de header.i=@linutronix.de header.b="rDOTwdKQ"
Date: Mon, 14 Sep 2026 10:43:09 +0200
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020; t=1789375391;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=ctiLvc9YkV+cVDeINxTojItvigNoXWATmW0CCJq6NUQ=;
	b=ODdIDkbumMAcCWwMLx5PyrO8NixoHAI0XTWcxQzToORqpgoy2UJW5z4IBNGtFXeQJs9J5w
	0fPvNz8GuF8vZB2k3L9qYF9888M4BnQBauCizml42HreKueCvVsrGqamAS4Od4TY3hMuIv
	XL2lv9ldPYDIhRr3MtYjM2Qh1k3qhYhdEX4wGNt/SOp37hqjqfBcSQIfgre9Bq11UFyVQt
	bA39jtqmPT62Qa7MOPH0H58BzaJWbZZxRpFs0apz6DRcO+FUekHhHq0e5kNKJxTpWgSAWO
	rpFd7P4TCIXxuziknVF3eDVzG1n7BKKcQ0GicNPL4XEzApX98BaUFKFWw1cISA==
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020e; t=1789375391;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=ctiLvc9YkV+cVDeINxTojItvigNoXWATmW0CCJq6NUQ=;
	b=rDOTwdKQDXAdYXTZI3N6NzGapyRKZineqcl2dG5w9Yu1l8vbgZGPLoZxXQy4PKs191Tgyl
	+FKR8ZzinIX8/ACA==
From: Sebastian Andrzej Siewior <bigeasy@linutronix.de>
To: sashiko-reviews@lists.linux.dev
Cc: bpf@vger.kernel.org
Subject: Re: [PATCH bpf-next] selftests/bpf: Replace %pK output with 0
Message-ID: <20260914084309.f4ivXcU5@linutronix.de>
References: <20260911145011.kErTVDkS@linutronix.de>
 <20260911150338.91D3E1F000FF@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: sashiko-reviews@lists.linux.dev
List-Id: <sashiko-reviews.lists.linux.dev>
List-Subscribe: <mailto:sashiko-reviews+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:sashiko-reviews+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable
In-Reply-To: <20260911150338.91D3E1F000FF@smtp.kernel.org>

On 2026-09-11 15:03:37 [+0000], sashiko-bot@kernel.org wrote:
> > diff --git a/tools/testing/selftests/bpf/progs/bpf_iter_udp4.c b/tools/=
testing/selftests/bpf/progs/bpf_iter_udp4.c
> > index 23b2aa2604de2..9b789f09f1462 100644
> > --- a/tools/testing/selftests/bpf/progs/bpf_iter_udp4.c
> > +++ b/tools/testing/selftests/bpf/progs/bpf_iter_udp4.c
> > @@ -57,13 +57,13 @@ int dump_udp4(struct bpf_iter__udp *ctx)
> >  	BPF_SEQ_PRINTF(seq, "%5d: %08X:%04X %08X:%04X ",
> >  		       ctx->bucket, src, srcp, dest, destp);
> > =20
> > -	BPF_SEQ_PRINTF(seq, "%02X %08X:%08X %02X:%08lX %08X %5u %8d %lu %d %p=
K %u\n",
> > +	BPF_SEQ_PRINTF(seq, "%02X %08X:%08X %02X:%08lX %08X %5u %8d %lu %d %8=
d %u\n",
>=20
> [Severity: Low]
> Does this %8d format incorrectly pad the 0 with spaces?
>=20
> The networking subsystem replaced %pK with a literal 0, but replacing it =
with
> %8d here in dump_udp4() causes a mismatch with the native /proc/net/ outp=
ut.
> Since BPF iterators are designed as exact drop-in replacements, could this
> mismatch break parsers that rely on strict spacing?

Indeed. I tried to match the pointer spacing for some reason. The
formatting in net does not align with the columns starting with the
inode which is %lu instead having 5 width same goes for ref. So I just
ignored and moved on with a plain 0. I could update if this is
considered important.

> [ ... ]
>=20
> > diff --git a/tools/testing/selftests/bpf/progs/bpf_iter_udp6.c b/tools/=
testing/selftests/bpf/progs/bpf_iter_udp6.c
> > index c48b05aa2a4b2..9766eff7069ff 100644
> > --- a/tools/testing/selftests/bpf/progs/bpf_iter_udp6.c
> > +++ b/tools/testing/selftests/bpf/progs/bpf_iter_udp6.c
> > @@ -65,13 +65,13 @@ int dump_udp6(struct bpf_iter__udp *ctx)
> >  		       dest->s6_addr32[0], dest->s6_addr32[1],
> >  		       dest->s6_addr32[2], dest->s6_addr32[3], destp);
> > =20
> > -	BPF_SEQ_PRINTF(seq, "%02X %08X:%08X %02X:%08lX %08X %5u %8d %lu %d %p=
K %u\n",
> > +	BPF_SEQ_PRINTF(seq, "%02X %08X:%08X %02X:%08lX %08X %5u %8d %lu %d %8=
d %u\n",
>=20
> [Severity: Low]
> Is the use of %8d here in dump_udp6() introducing the same formatting
> mismatch as in dump_udp4()?
>=20
> It seems it should use a literal 0 instead of %8d to exactly match the
> networking subsystem's native output format.

Yes it does but the extra spacing intends to align with the columns=E2=80=A6

Sebastian
