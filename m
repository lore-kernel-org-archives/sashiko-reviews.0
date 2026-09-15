Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CDAAF3A1A27
	for <sashiko-reviews@lists.linux.dev>; Tue, 15 Sep 2026 23:12:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789513932; cv=none; b=Wz5jhK0+3MH4h3yAY1MjFDdyVli5x7YZr6KtKsf/TQX7nbSvzKg8tTKuRrS0PEewVSv58kLfT2JXYkiucyn9yprB5qDSO5JePVT6utZ+3lWJyEG8Uz1cMGEEsBA2nMutakYP6PVUg+/kr0uhkPHFxkNRkon+I7+dkJquL+IvTOs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789513932; c=relaxed/simple;
	bh=5y89yViajF6E5sFOGF9VRWfKH3F2v8hmhVSzIiCTHd8=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=UJeWfPRZH01leQiXW8o9DAVrPkrvoMPcPUVWeMIhZWc6UYMe/9P5+M0cFqlA2JKjzXKK/NDSOS4Wo2jaxGUi08akuteKsTrEPNzEMMUO/62TRpZKNyLhy+8o66IoSTYUIzrEC8+mJtJSvTV6KE8WjHXWPrZofP9plpSSBwOTO+I=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=VSLJSuE6; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="VSLJSuE6"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 796201F0089C
	for <sashiko-reviews@lists.linux.dev>; Tue, 15 Sep 2026 23:12:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1789513928;
	bh=HdE+Ntll/c2YhvON/Aio6I+tStN72YxB0IDBbOZNqsw=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc;
	b=VSLJSuE6RTG/zhqxwjqZWle4odnErOwZcjB0EP0sO2do+KEAv66pcLOyXffQzY2zn
	 UJjf8YFtz/BSxQcdeLMct4UC9lO1w9zcLUYeT2N67VcmFZ9pAjaGKnkD85uabMyHEz
	 gau3LEjuHvOrQ84JsI2gCbtdDhT0FXPkgM1pR5TaD3+gdtFCRzdrsiq8vCUh9InCTG
	 NIzm8LgIvQsff2aYWaZH4UxPKKSDv5UDi5O4lnOv9M/OVstKfCSb257BTHhd9jrb/x
	 TAWkilkaw7+psxni3KD72mFrP3+cFOB+K7+Xe1j2WiYEavFNIqGANQZrnYQ3WleGpw
	 LuQhPTWIMRs1w==
Received: by mail-qk2-f43.google.com with SMTP id af79cd13be357-939109f067fso31999285a.2
        for <sashiko-reviews@lists.linux.dev>; Tue, 15 Sep 2026 16:12:08 -0700 (PDT)
X-Gm-Message-State: AFuF++mtQdUYgzC50LSz3bSaezASe5JHkioJQmG5xyFINShXn1ng4zBr
	MaBYLVuDG8xm97bjTpYt564MRLaSfU547+oiqG31/vXGfNWOVm+DZ98BHrqIeZZLo+i7QKqLksB
	YhGwF8TF8O11mE1JQOgohvcKqD6qfVbQ=
X-Received: by 2002:a05:620a:4542:b0:92e:5d44:73fc with SMTP id
 af79cd13be357-93bb7668b19mr54909885a.12.1789513927735; Tue, 15 Sep 2026
 16:12:07 -0700 (PDT)
Precedence: bulk
X-Mailing-List: sashiko-reviews@lists.linux.dev
List-Id: <sashiko-reviews.lists.linux.dev>
List-Subscribe: <mailto:sashiko-reviews+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:sashiko-reviews+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20260914230355.3422996-1-song@kernel.org> <20260914230355.3422996-24-song@kernel.org>
 <20260915000712.120901F000FF@smtp.kernel.org>
In-Reply-To: <20260915000712.120901F000FF@smtp.kernel.org>
From: Song Liu <song@kernel.org>
Date: Tue, 15 Sep 2026 16:11:55 -0700
X-Gmail-Original-Message-ID: <CAPhsuW5xdsKWuXRmAUgVDLgg8Zdx6LQoO6SrNA27w720ZLN7iw@mail.gmail.com>
X-Gm-Features: AcwNN1WziJh66MCop_MAQk08v99qEwXeSvsKmI0G-Em0C0Rg-OWCQZcLJ0snBzw
Message-ID: <CAPhsuW5xdsKWuXRmAUgVDLgg8Zdx6LQoO6SrNA27w720ZLN7iw@mail.gmail.com>
Subject: Re: [PATCH v3 23/58] objtool/klp: Add test for rejecting references
 to init code/data
To: sashiko-reviews@lists.linux.dev
Cc: live-patching@vger.kernel.org, kernel-team@meta.com, puranjay@kernel.org, 
	peterz@infradead.org, pmladek@suse.com, joe.lawrence@redhat.com, 
	jpoimboe@kernel.org, mbenes@suse.cz, jikos@kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Mon, Sep 14, 2026 at 5:07=E2=80=AFPM <sashiko-bot@kernel.org> wrote:
>
> Thank you for your contribution! Sashiko AI review found 1 potential issu=
e(s) to consider:
> - [Low] objtool: test suite aborts due to fragile compiler assumptions
> --
>
> commit fa8e7a87126e5978150272fd5c3b8728c0d8f68a
> Author: Puranjay Mohan <puranjay@kernel.org>
>
> objtool/klp: Add test for rejecting references to init code/data
>
> Init code and data are freed once boot finishes, so a klp relocation
> against them can never resolve.
>
> > diff --git a/tools/objtool/tests/generic/fixtures/init_reference.c b/to=
ols/objtool/tests/generic/fixtures/init_reference.c
> > new file mode 100644
> > index 0000000000000..51b2a57dde14f
> > --- /dev/null
> > +++ b/tools/objtool/tests/generic/fixtures/init_reference.c
> > @@ -0,0 +1,16 @@
> > +// SPDX-License-Identifier: GPL-2.0
> > +/* Patched function referencing data in an .init section. */
> > +
> > +static const char __modinfo[]
> > +     __attribute__((section(".modinfo"), used, aligned(1))) =3D "\0nam=
e=3Dvmlinux";
> > +
> > +static int init_only __attribute__((section(".init.data"), used)) =3D =
5;
>
> [Severity: Low]
> Can this static variable be constant-folded by the compiler since it lack=
s the
> volatile qualifier and is never modified?
>
> Modern compilers compiling at -O2 may constant-fold non-volatile static
> variables or use symbol-relative relocations.

Added "volatile" here in v4.

Thanks,
Song
