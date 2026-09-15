Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 40B3D42F712
	for <sashiko-reviews@lists.linux.dev>; Tue, 15 Sep 2026 19:27:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789500436; cv=none; b=OiJzmMFoJmFA3ApCJrkd7wVH4yqaUdfmAmdCFbvAVPKdXv89yzaYjzHh365Wc4I856SAuOiZhfWk7Y2ff2JDimZUEiuN3WWc7xeodhKCRZ5ZpTBy35QDdLoOIFx31wcuFdyenw12PgyF0oKFo1uv+P6rtpUujxYltM8xh13T1Pw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789500436; c=relaxed/simple;
	bh=6vZzByWooelztu0aVp1ZLBmgN3h7FAk3Frk3TpIOl9g=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=b/VJrYrcTjMiQlsCmLtTtY4lcxt1Pu86Kd5O2V1/Q84m5fseyW5qzhtIZSTqFHVRSSqCzMxJX80px+hGQ6/mLFyw+tnOPNEvtkrei1EfjptqJObPbOAWtKz63SBq80O4Kda9kKfKnEyGbchOXPlrtyD5tV521mybHjbMhNn+lyU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=NcJtKGti; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="NcJtKGti"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id E13451F000FF
	for <sashiko-reviews@lists.linux.dev>; Tue, 15 Sep 2026 19:27:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1789500434;
	bh=rLDYLEgq12fxXE7+M4r63hCHWM72Qf52B0aKmQ4FbLI=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc;
	b=NcJtKGtiPdpWAJ2BdUNJmvIPQ8tsmmHxOSQyBuhLdOLeF6+f1wNtsW/Glpy8xhWBX
	 dVbggJZuGxr7ts5YOGnVLCuTpoF+LhT6CeBr5Po+UX4WB0Ix9JLFtv/JhkcjUHwja6
	 X8yM26JXcnwkSUSZT+68duo0XvNpRDKEkk4lGkeNK3SCBf9mMXCbX4CWJJgN8criLG
	 p0Rj8tnwFcvi39N7aNCkl7BEOw75V76pe8aJ0qf0DpIynezvw3Aly4LsP2aRxg3t/J
	 r58wZe2Aeef1REuJ7cmU2SbhL3QyMd8tFBtG/g1j+ylGdU/sWrJpxkfBRwJEftyRZA
	 NC9YqOckBVndg==
Received: by mail-qk2-f12.google.com with SMTP id af79cd13be357-93910cc46c8so15554585a.0
        for <sashiko-reviews@lists.linux.dev>; Tue, 15 Sep 2026 12:27:14 -0700 (PDT)
X-Gm-Message-State: AFuF++l1FMhpIjEv8y+llDjRopMwxraebxtiMWmAABRXPvRyqUA70Pgg
	TKqxROcbi21GqGpYHR2PyVGyEgTg377HqT+IMnJy4uEjY9RQehUEEAlNHx51RD+xEqPRtVRsRV0
	ZuTegidV2Jj2wdI22/ctpBc9Uo9DqpzE=
X-Received: by 2002:a05:620a:4889:b0:934:ab73:ac53 with SMTP id
 af79cd13be357-93a294bf61cmr1354747585a.0.1789500429254; Tue, 15 Sep 2026
 12:27:09 -0700 (PDT)
Precedence: bulk
X-Mailing-List: sashiko-reviews@lists.linux.dev
List-Id: <sashiko-reviews.lists.linux.dev>
List-Subscribe: <mailto:sashiko-reviews+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:sashiko-reviews+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20260914230355.3422996-1-song@kernel.org> <20260914230355.3422996-6-song@kernel.org>
 <20260914233426.D96CE1F000FF@smtp.kernel.org>
In-Reply-To: <20260914233426.D96CE1F000FF@smtp.kernel.org>
From: Song Liu <song@kernel.org>
Date: Tue, 15 Sep 2026 12:26:57 -0700
X-Gmail-Original-Message-ID: <CAPhsuW7V1uZHbZ9Qykh65xAVbLBuzkYzYF4-yN6OAL0NfzuDXA@mail.gmail.com>
X-Gm-Features: AcwNN1UxhkJWbx35k_pBQxChuAFdBspNgPY0YgfDkHAOzIgCKFTB8ou_3OwwylI
Message-ID: <CAPhsuW7V1uZHbZ9Qykh65xAVbLBuzkYzYF4-yN6OAL0NfzuDXA@mail.gmail.com>
Subject: Re: [PATCH v3 05/58] objtool/klp: Build klp test fixtures through the harness
To: sashiko-reviews@lists.linux.dev
Cc: live-patching@vger.kernel.org, mbenes@suse.cz, jpoimboe@kernel.org, 
	puranjay@kernel.org, kernel-team@meta.com, pmladek@suse.com, 
	peterz@infradead.org, joe.lawrence@redhat.com, jikos@kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Mon, Sep 14, 2026 at 4:34=E2=80=AFPM <sashiko-bot@kernel.org> wrote:
>
> Thank you for your contribution! Sashiko AI review found 1 potential issu=
e(s) to consider:
> - [Medium] objtool: test harness leaks vmlinux.o state across build_pair(=
) calls
> --
>
> commit 87b920426dfa2a217d6f9104d0f701cab5d67f5e
> Author: Song Liu <song@kernel.org>
>
> objtool/klp: Build klp test fixtures through the harness
>
> This patch standardizes how klp test fixtures are built by shifting the
> compile steps into harness helpers like build_one() and build_pair(). It
> also establishes make_vmlinux_pair() to correctly build and diff vmlinux
> images for tests.
>
> > diff --git a/tools/objtool/tests/lib.sh b/tools/objtool/tests/lib.sh
> > index efe0a71326799..35be42758ece8 100644
> > --- a/tools/objtool/tests/lib.sh
> > +++ b/tools/objtool/tests/lib.sh
> [ ... ]
> > @@ -179,6 +192,13 @@ setup()
> >       workdir=3D"$(mktemp -d)" || fail "mktemp failed"
> >       trap cleanup EXIT
> >
> > +     # A test may run several segments, and make_vmlinux_pair() repoin=
ts
> > +     # orig_obj at the image it builds.  Start each segment from the
> > +     # defaults, or the next build_pair() diffs the previous segment's
> > +     # object against the new one.
> > +     orig_obj=3Dorig.o
> > +     patched_obj=3Dpatched.o
> > +
> >       export_syms "$@"
> >  }
>
> [Severity: Medium]
> Since setup() only executes once during script initialization, doesn't th=
is
> fail to reset the state between test segments?
>
> If a test calls make_vmlinux_pair() (which repoints orig_obj to vmlinux.o=
)
> and subsequently calls build_pair() for a new segment, orig_obj will stil=
l
> point to the stale vmlinux.o from the previous segment instead of orig.o.
> This appears to cause run_diff() to evaluate the wrong file.
>
> [ ... ]
> >  # build_pair <fixture.c> [cflags...]
> >  build_pair()
> >  {
> > -     local fixture=3D"$FIXTURES_DIR/$1"; shift
> > +     local fixture=3D"$1"; shift
> >
> > -     [ -f "$fixture" ] || fail "missing fixture $fixture"
> > +     build_one "$fixture" orig.o "$@"
> > +     build_one "$fixture" patched.o "$@" -DPATCHED
> > +}
>
> [Severity: Medium]
> Should the state reset logic for orig_obj and patched_obj be placed here =
in
> build_pair() instead of setup(), to ensure run_diff() evaluates the corre=
ct
> objects when multiple segments are executed?

This doesn't appear to be a real issue yet, but we will move these two
line to build_pair() in v4.

Thanks,
Song
