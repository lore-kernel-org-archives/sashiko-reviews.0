Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 87FB43EEAE1
	for <sashiko-reviews@lists.linux.dev>; Wed, 16 Sep 2026 07:00:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789542042; cv=none; b=crikOBNgRwN+RimkCO0p40covpySp6NMsJwIKb9ly1FU7xH2hzyh8DNYJiLIIR0VsSsQqIsb3m7bmoTXWGEcdcT0Kcl98iacE03UpVH8hkBoubyxFzl4aiVhiQ387Ld0Gn2F3pNgsHYASIHAPwC03sXisXHplznYyiIS2WiL3as=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789542042; c=relaxed/simple;
	bh=1ofUehavKl0hOQLrWhcpRsR+aJ40CkCDThWgRTyuTYo=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=lhXW242qSaMeLODpkjrmDvAjn7Amn2/lQX4yW6zJQiyPKk7PU89DyJ2cH9wIw1V1kicQaGEe46uGBCImZG5ZW3l2Km+Ry/3UWeL+JOQ8p/SckSsDhXyierpJnZPqHrck4KyYoK6mrUrdrWVdVMVoq45U9dCdblYy4ZoUlarEhxM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=LkgenM2g; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="LkgenM2g"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 6BAA91F0089E
	for <sashiko-reviews@lists.linux.dev>; Wed, 16 Sep 2026 07:00:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1789542033;
	bh=mRcpvS8VpZbdgZ3nCcPMHxrJq7UGL/WWhx7lQiem5cQ=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc;
	b=LkgenM2gd8GVkBGC0j4HztLRp56lcr5PP4Br5ONTGPv6bNesjOohhJ2ADrzVxw5AS
	 7qaPD5nhCRo9wt1qdh6xm2iFZNI0VeTDUCgoib8YY8SlKy5ITH7djf03rGXvUQxTMq
	 7TH8LPQuD9NHPUUp2LKVMo3K3QQzIQ2dMbz7j846K5SkPswnkCcM+lJoA1TYG3E0ii
	 zUM53ujQ5hhdsGNTww3X4jxrhoBdvAeTtnSkemrXEaJxlUbb7NKVhwa/vkVRIZok3e
	 e5BMq6mKvtrem43jVXR0WAnGCsQvgkNMeqa7tT+aQtpt+UPcdZ1sObs8CnA1HcQ+2b
	 C8mrNFCovRFQw==
Received: by mail-qk2-f22.google.com with SMTP id af79cd13be357-93910cadeb4so71456985a.1
        for <sashiko-reviews@lists.linux.dev>; Wed, 16 Sep 2026 00:00:33 -0700 (PDT)
X-Gm-Message-State: AFuF++mtCCepqouXMjplTZpqBAwmG9eHJh+yIv3tHasOpb0JlxECHSti
	9ycTKXVptkVebjxLdDCC30cwQDn7MImTJTnTGn+QEY6H6yL5fIr+ukq6fR/fy9DVexzTxi3xqoc
	4qxjx+Aq4TaOsNbG5jwk4lzwe6dvIxzk=
X-Received: by 2002:a05:620a:489b:b0:93a:3aba:a0d4 with SMTP id
 af79cd13be357-93bb789bea9mr195801485a.27.1789542032529; Wed, 16 Sep 2026
 00:00:32 -0700 (PDT)
Precedence: bulk
X-Mailing-List: sashiko-reviews@lists.linux.dev
List-Id: <sashiko-reviews.lists.linux.dev>
List-Subscribe: <mailto:sashiko-reviews+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:sashiko-reviews+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20260915233454.2405019-1-song@kernel.org> <20260915233454.2405019-47-song@kernel.org>
 <20260915235341.3E13A1F000FF@smtp.kernel.org>
In-Reply-To: <20260915235341.3E13A1F000FF@smtp.kernel.org>
From: Song Liu <song@kernel.org>
Date: Wed, 16 Sep 2026 00:00:20 -0700
X-Gmail-Original-Message-ID: <CAPhsuW5vwjD4-iqtso_nUPxnAwLHESXyWVz+2Zy9z2wk-GMtxA@mail.gmail.com>
X-Gm-Features: AcwNN1UC0vnmwkY_VC9QghVZ086qywyAz_xzll8md-9uObvYKnOWr3loMuZzlK8
Message-ID: <CAPhsuW5vwjD4-iqtso_nUPxnAwLHESXyWVz+2Zy9z2wk-GMtxA@mail.gmail.com>
Subject: Re: [PATCH v4 46/58] objtool/klp: Add test for data object checksums
To: sashiko-reviews@lists.linux.dev
Cc: live-patching@vger.kernel.org, peterz@infradead.org, jikos@kernel.org, 
	puranjay@kernel.org, joe.lawrence@redhat.com, pmladek@suse.com, 
	mbenes@suse.cz, jpoimboe@kernel.org, kernel-team@meta.com
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Tue, Sep 15, 2026 at 4:53=E2=80=AFPM <sashiko-bot@kernel.org> wrote:
>
> Thank you for your contribution! Sashiko AI review found 1 potential issu=
e(s) to consider:
> - [Low] objtool/klp: test-checksum-data fails on GCC < 10 due to missing =
-fno-common
> --
>
> commit 1954bfc131a001b6d52e72e9ea82e16372d49e2b
> Author: Song Liu <song@kernel.org>
>
> objtool/klp: Add test for data object checksums
>
> This commit adds a test suite for data object checksum calculations in
> objtool's klp functionality. It verifies that various changes to data
> objects, such as length, bytes, reloc targets, and string contents, corre=
ctly
> update the objtool klp checksum.
>
> > diff --git a/tools/objtool/tests/generic/fixtures/checksum_data.c b/too=
ls/objtool/tests/generic/fixtures/checksum_data.c
> > new file mode 100644
> > index 0000000000000..6310af5c02d34
> > --- /dev/null
> > +++ b/tools/objtool/tests/generic/fixtures/checksum_data.c
>
> [ ... ]
>
> > +/*
> > + * A .bss object, where length is the only thing there is to hash: the=
 section
> > + * has no data, so the bytes are skipped and only sym->len distinguish=
es this
> > + * from an object of another size.  An initialised array would not iso=
late it
> > + * -- growing one changes the hashed bytes as well.
> > + */
> > +#if defined(PATCHED) && defined(LONGER)
> > +char sized[4];
> > +#else
> > +char sized[2];
> > +#endif
>
> [Severity: Low]
> Will this test fail on older toolchains (like GCC < 10 or Clang < 11) whe=
re
> -fcommon is the default?
>
> Because sized is an uninitialized array, these older compilers emit it as
> a SHN_COMMON symbol. objtool klp checksum skips SHN_COMMON symbols becaus=
e
> they lack a data section pointer (!sym->sec->data), meaning no checksum i=
s
> calculated for sized. This would cause the test script to abort.
>
> Could we add -fno-common to the test's FIXTURE_CFLAGS, or initialize this
> array to ensure it lands in .bss instead of COMMON?
>
> > +
> > +/*
>
> [ ... ]
>
> > diff --git a/tools/objtool/tests/generic/test-checksum-data.sh b/tools/=
objtool/tests/generic/test-checksum-data.sh
> > new file mode 100755
> > index 0000000000000..e915026b79a73
> > --- /dev/null
> > +++ b/tools/objtool/tests/generic/test-checksum-data.sh
>
> [ ... ]
>
> > +# The object's own bytes.
> > +check PLAIN_VALUE plain
> > +# Its length, for a .bss object whose bytes are not hashed at all.
> > +check LONGER sized
>
> [Severity: Low]
> Could this check fail with "no checksum recorded for 'sized'" on compiler=
s
> defaulting to -fcommon due to the SHN_COMMON behavior mentioned above?

Added -fno-commont to 05/58 of v5.

Thanks,
Song
