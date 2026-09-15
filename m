Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2FCE641442B
	for <sashiko-reviews@lists.linux.dev>; Tue, 15 Sep 2026 18:26:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789496817; cv=none; b=NYMkQOrVmu3VVob1d80MhKm63eijg8AER8q2NwRZaBpvKlwl88+LT11KYnHNyYTAftKqwsytyxM9SAzLMbEte9sgQ6cCiJS5A7lmBhPt/KXkhxRPKzNshaNpfJJu7nLx+RTHne9vX01PKNhKBljzWasBaFe9QTTxaHOuGhNqQ9I=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789496817; c=relaxed/simple;
	bh=GlOI8VSaJQWZoGhGHnMTHqTfZQB3/9xaQ6/3CQeLPZQ=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=aqdjbybGBST0ZlLISBHcLR7+ciNV/WbwGxAMZzNKWjoRnVF/5cRYr3HsIwIBVWx4MVDi4f8MDLqzai9IT2T88u8N70B4wK6GaM4C2Q4JWaT9hIAG0Pacojm5bd2KzP8E2zgaDKwoMOCfiSooTOszNQVI7L3TB9q0pFLPa2nx/qQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=gT9LXJSD; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="gT9LXJSD"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id C750D1F0089E
	for <sashiko-reviews@lists.linux.dev>; Tue, 15 Sep 2026 18:26:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1789496815;
	bh=i/Fw/KrVj5c7VjYydQvIgzUzmOtSdovDTPZhvTTTnNM=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc;
	b=gT9LXJSD3xEVG8s+NEq16/QczIO29Z6M55ZZbeC0T51NPKy6ySewImRU1US6b5CA9
	 PSyqMzQ6ePX4v3rDy2geCRxwVjlBELMpnVkeepptxWOMggUbQOC1GD0gPMEE+5UQA2
	 /IYTN76sP7i2aNIhg5MrYuBZq/g7IWSdU+vaGMnZOni2F1ELK5O6ttQOspdkNNxU9a
	 nsx0eshiKU80rGhklgQ0FQWFMFXa2H0AOHpwY9mrHGEQlFuXqNozN+g+66hSWavx9Y
	 9mXWEWvwMGp5p1Xi8dgpsAf1tqZHRrCqmhlUahLlcxnnT+blItfH4/1fa8P2Goguaw
	 PnOXXkD/nzdEg==
Received: by mail-qk2-f12.google.com with SMTP id af79cd13be357-93910ca5aa8so9085785a.3
        for <sashiko-reviews@lists.linux.dev>; Tue, 15 Sep 2026 11:26:55 -0700 (PDT)
X-Gm-Message-State: AFuF++kf5YR9rDV5AXL7iQJij13AARaFTCI8drClipovUqnTjBUY8gr9
	rfv7vTcYIX7GXnLiiUsaFJD1Pt2/kkTgld+qhGbiFXZCwyGRSFCkc1AQuJHvSCOKZibPoeq3a8k
	AtoksvwG50y0vlylQJ79jcYQEKTew1qI=
X-Received: by 2002:a05:620a:31a6:b0:939:e6de:f0f6 with SMTP id
 af79cd13be357-93a29966d87mr1429661985a.27.1789496815005; Tue, 15 Sep 2026
 11:26:55 -0700 (PDT)
Precedence: bulk
X-Mailing-List: sashiko-reviews@lists.linux.dev
List-Id: <sashiko-reviews.lists.linux.dev>
List-Subscribe: <mailto:sashiko-reviews+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:sashiko-reviews+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20260914230355.3422996-1-song@kernel.org> <20260914230355.3422996-2-song@kernel.org>
 <20260914232853.6A9DC1F00898@smtp.kernel.org>
In-Reply-To: <20260914232853.6A9DC1F00898@smtp.kernel.org>
From: Song Liu <song@kernel.org>
Date: Tue, 15 Sep 2026 11:26:43 -0700
X-Gmail-Original-Message-ID: <CAPhsuW56ph_2FhrPQr4WTxQo2xa8578Ued+LLkKyt=+ZC+=Tww@mail.gmail.com>
X-Gm-Features: AcwNN1VvI9s_QhKdp7MW4D03uFNPh83Thw0pNQNNhJO27Ngu9YoTGEdGTBpvf7c
Message-ID: <CAPhsuW56ph_2FhrPQr4WTxQo2xa8578Ued+LLkKyt=+ZC+=Tww@mail.gmail.com>
Subject: Re: [PATCH v3 01/58] objtool: Add test harness for the klp subcommands
To: sashiko-reviews@lists.linux.dev
Cc: live-patching@vger.kernel.org, joe.lawrence@redhat.com, 
	puranjay@kernel.org, jpoimboe@kernel.org, kernel-team@meta.com, 
	peterz@infradead.org, jikos@kernel.org, pmladek@suse.com, mbenes@suse.cz
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Mon, Sep 14, 2026 at 4:28=E2=80=AFPM <sashiko-bot@kernel.org> wrote:
>
> Thank you for your contribution! Sashiko AI review found 1 potential issu=
e(s) to consider:
> - [Low] objtool: test harness fails if OBJTOOL is a relative path
> --
>
> commit a0117b0a0e9e827479f6a5d87a6aea205470f1e3
> Author: Puranjay Mohan <puranjay@kernel.org>
> objtool: Add test harness for the klp subcommands
>
> This commit introduces a test harness for the "objtool klp checksum"
> and "objtool klp diff" subcommands. The tests compile fixtures into
> objects and assert on the properties of the objtool output.
>
> > diff --git a/tools/objtool/tests/lib.sh b/tools/objtool/tests/lib.sh
> > new file mode 100644
> > --- /dev/null
> > +++ b/tools/objtool/tests/lib.sh
> [ ... ]
> > +run_diff()
> > +{
> > +     local expect=3D"${1:-0}" rc=3D0
> [ ... ]
> > +     # klp diff looks for Module.symvers relative to the working direc=
tory.
> > +     ( cd "$workdir" && "$OBJTOOL" klp diff orig.o patched.o out.o ) \
> > +             > "$workdir/diff.log" 2>&1 || rc=3D$?
>
> [Severity: Low]
> If a relative path is provided for OBJTOOL (such as OBJTOOL=3D./objtool),
> the check in setup() allows it to remain a relative path:
>
>     [ -x "$OBJTOOL" ] || [ ! -x "$TESTS_DIR/../$OBJTOOL" ] ||
>         OBJTOOL=3D"$TESTS_DIR/../$OBJTOOL"
>
> When run_diff() subsequently changes the directory to the temporary
> $workdir, will the relative "$OBJTOOL" path fail to resolve and break
> the test execution with a "No such file or directory" error?
>
> Would it be safer to convert OBJTOOL to an absolute path (perhaps using
> realpath or readlink -f) during setup() to prevent this?

A good catch indeed. Fixed in v4.

Song
