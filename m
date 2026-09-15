Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B94EF38D3F0
	for <sashiko-reviews@lists.linux.dev>; Tue, 15 Sep 2026 21:04:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789506294; cv=none; b=m4avFfwVi83tW/JYyv9vvJEpGULO6+OaTvPKro63dSEg8AWtYtyF1d+D8NlcjmrU79Bvj80zHqSmC0OiVNvURR3ZgkMQXl5F8rFcLCKUezct462beCE7kneZg1VsuCdv1oeX3xxughxLayIB8LTlqoJ+Gf6UgUgbbiNB3L2GiXI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789506294; c=relaxed/simple;
	bh=yyIXuptmJwAPr4wTO/4PZiWiLUtiZfesBE2cNGieonk=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=WBsNgxPQOPKLzVCGCygskwVd0Hy7hgFyeWbhSWj9eKKTkq3uqNltZIdFEdYBdmW+ic1KRkWtMS1IkZbQnLm/skBYB57QnRgfvmj2gM3grXa8N5aSpRnRjpYI+QQ5LKI+jwn/LkjNaDXKOCFYp3fbDukpPzrm7lOHs0pICwFOvwc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=IT+KGwvy; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="IT+KGwvy"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 688721F000FF
	for <sashiko-reviews@lists.linux.dev>; Tue, 15 Sep 2026 21:04:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1789506293;
	bh=78QAKCGz5gzQ8zvkiIKxAHRqaOVV/ffw/xD9brOGPSA=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc;
	b=IT+KGwvyocqaH5F784M21dsxWeI9Sl5CFq2jIE377mGJaZf4mNprU85cVqfGclzEW
	 NvTVw43synjNWLkEZABu04OPDPJqHQxCtnolfNh+h8at692WPmn2Yz7BJV6IT1LpfX
	 pJnl/pSL+OhRaMhIPSK4iE9slK3wt4lONKHXCoPuw43V2APGzTmvF3/4EKPaDMd2n6
	 0YxuD2kkHgqtDOGTIpvQE5c82MIrFkfQ8RW7DXfFbva/9PZO9+DvSZ5zw2ncgs+lZ6
	 mlOnWWLfWXmnwsGqx8bWbSgxnvF9S/ZU0eu/oebIIEpCV6j71FRO7HigQvt3u3jnKp
	 dkk4DmhP4QZEA==
Received: by mail-qk2-f43.google.com with SMTP id af79cd13be357-93910cadea2so19243285a.2
        for <sashiko-reviews@lists.linux.dev>; Tue, 15 Sep 2026 14:04:53 -0700 (PDT)
X-Gm-Message-State: AFuF++nb2PGEgQIkYKATA19Zi7Ftze9g7u2KZ1WXZlU5ccbQ80DmHOOq
	Ug+e4lUaivnjtWKTSutIJTGfUI7qoHpGlD808MK1LpOWC9abSEg992RJiXdy5LyWTzVNjdxZ3vZ
	2LiW7lC9nI0iEuxI4ZDxTPArKhvSmp7U=
X-Received: by 2002:a05:620a:2b81:b0:93a:3e13:15f1 with SMTP id
 af79cd13be357-93a40797723mr439712485a.23.1789506287667; Tue, 15 Sep 2026
 14:04:47 -0700 (PDT)
Precedence: bulk
X-Mailing-List: sashiko-reviews@lists.linux.dev
List-Id: <sashiko-reviews.lists.linux.dev>
List-Subscribe: <mailto:sashiko-reviews+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:sashiko-reviews+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20260914230355.3422996-1-song@kernel.org> <20260914230355.3422996-12-song@kernel.org>
 <20260914234533.D81AF1F00893@smtp.kernel.org>
In-Reply-To: <20260914234533.D81AF1F00893@smtp.kernel.org>
From: Song Liu <song@kernel.org>
Date: Tue, 15 Sep 2026 14:04:35 -0700
X-Gmail-Original-Message-ID: <CAPhsuW7zOkVVZ=f_XGd17LaGdRWt2dW=U+Jhd7Cd-svn5e8hRg@mail.gmail.com>
X-Gm-Features: AcwNN1X5OAyyRNduQJ-wDa9hV0u-e8IxGNWyYe4miL6RC61_voBMbwUtWN8HW2c
Message-ID: <CAPhsuW7zOkVVZ=f_XGd17LaGdRWt2dW=U+Jhd7Cd-svn5e8hRg@mail.gmail.com>
Subject: Re: [PATCH v3 11/58] objtool: Forward toolchain variables to the klp
 test runner
To: sashiko-reviews@lists.linux.dev
Cc: live-patching@vger.kernel.org, joe.lawrence@redhat.com, 
	jpoimboe@kernel.org, mbenes@suse.cz, peterz@infradead.org, pmladek@suse.com, 
	jikos@kernel.org, puranjay@kernel.org, kernel-team@meta.com
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Mon, Sep 14, 2026 at 4:45=E2=80=AFPM <sashiko-bot@kernel.org> wrote:
>
> Thank you for your contribution! Sashiko AI review found 1 potential issu=
e(s) to consider:
> - [Medium] objtool: tests target silently falls back to GNU objcopy under=
 LLVM=3D1
> --
>
> commit 11c79ea0e223d9512f0e164886cfdec6a0e5e3b2
> Author: Joe Lawrence <joe.lawrence@redhat.com>
>
> objtool: Forward toolchain variables to the klp test runner
>
> The tests target passes toolchain variables like CC, LD, READELF, and OBJ=
COPY
> into the test scripts so that fixtures are built and inspected with the
> selected toolchain.
>
> [ ... ]
>
> > diff --git a/tools/objtool/Makefile b/tools/objtool/Makefile
> > index ed5cf146ef2e2..a3d09a5af7a20 100644
> > --- a/tools/objtool/Makefile
> > +++ b/tools/objtool/Makefile
> > @@ -153,6 +153,8 @@ mrproper: clean
> >
> >  tests: $(OBJTOOL)
> >       $(Q)OBJTOOL=3D$(abspath $(OBJTOOL)) ARCH=3D$(ARCH) CROSS_COMPILE=
=3D$(CROSS_COMPILE) \
> > +             CC=3D'$(CC) $(CLANG_CROSS_FLAGS)' LD=3D'$(LD)' \
> > +             READELF=3D'$(READELF)' OBJCOPY=3D'$(OBJCOPY)' \
>
> [Severity: Medium]
> Will the tests target silently fall back to GNU objcopy when building wit=
h
> LLVM=3D1?
>
> It appears that tools/scripts/Makefile.include defines LLVM_OBJCOPY but l=
eaves
> OBJCOPY unset for LLVM builds. As a result, $(OBJCOPY) evaluates to an em=
pty
> string here in the tests recipe.
>
> When this empty variable is passed to tools/objtool/tests/lib.sh, the fal=
lback
> logic:
>
> OBJCOPY=3D"${OBJCOPY:-${CROSS_COMPILE}objcopy}"
>
> treats the empty OBJCOPY as null due to the :- operator. This substitutes=
 the
> default GNU objcopy instead of the intended llvm-objcopy, which defeats t=
he
> goal of using the selected LLVM toolchain.
>
OK, added the following to v4:

OBJCOPY ?=3D $(if $(LLVM),$(LLVM_OBJCOPY),$(CROSS_COMPILE)objcopy)

Thanks,
Song
