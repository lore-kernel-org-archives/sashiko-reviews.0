Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EDF493E95B2
	for <sashiko-reviews@lists.linux.dev>; Mon, 14 Sep 2026 20:55:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789419321; cv=none; b=ZelPPTCmur19hoQ7F38KBO+t4FBch05oLSWDzRz2lyU7D2vH4pRcMOMn1rJE50EKP2DST/Fh9p3R7lqiWbvnyKNNYrqDso7lYt6+ZsTDdPjoZlgABIhWIXFpmPLdj2VqNfArhmMylp2z2euRAaQvj2X4G+fwyYlL25NbP07TcFA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789419321; c=relaxed/simple;
	bh=8E7atf4YfYzQLMasJoiWHOnQRlBrufJewgMVbTUtEHE=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=WDdPd+nrtQVTzxngNATQ6k658EjlWWTJeStDeDcgGeIOl9aFuEUNpeyPVkDfHYgnN1LWBdaPj4NS+HOAraYQvW3IsE1fI4Ovd3Ya/uNd0h3awjjGp0FzWF5gN/RpMPmrMeYdWVFwH4GjjhjLbloHLA54Y4n6KJfQ4p2l7hC0xoU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=B2Ho2Nn7; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="B2Ho2Nn7"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id D61321F00898
	for <sashiko-reviews@lists.linux.dev>; Mon, 14 Sep 2026 20:55:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1789419319;
	bh=4ebf7YRHG/0h2NTh+FNZdL9/q1jcOd1htKo5h1HP4c0=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc;
	b=B2Ho2Nn7nqVYPJxJec4DNaL7ppehTnkkQyWBhB79PISh0XmZXoI9isqyXDpP+RsaR
	 EE4M8AGWyIo8OqXX/8XJy0AGFA/xGRW2ChnCv3dJKOsFun2SGU8kcZLHYjRoNC1pTG
	 iD3dfBGEPKsHlZo2Ka9yGlBh9yfn6eqvbzYc5ei+CeKle1af5KHfeFYHkwm+BJ2Y58
	 qPXVU9zIwS1FrVl2kIvT4HSfKjHQzUtmcvSqGTZ/wB5CpCwIwE4votziV9jJaBJ/qY
	 UhngO1XofzVk8G01Qdb6fLAzoJcJcRpbnTDZ1MG+sfQw9TNtLPkDwKdJ92K2gFVQuA
	 6Aoh1amDcQuBg==
Received: by mail-qk2-f13.google.com with SMTP id af79cd13be357-939109fafd6so272253285a.3
        for <sashiko-reviews@lists.linux.dev>; Mon, 14 Sep 2026 13:55:19 -0700 (PDT)
X-Gm-Message-State: AFuF++lHJxGuaOGGLvcQfGqewUy11C/ITvAOdFeJ0cz0RPIlj2O4Sc46
	R9n0HcIxRagRwR56rWy+JExEwWClpo8un7oftk8RzDPGxGhuSxVjMb47pc3+3ZcaeiU4ryKwceK
	xDO5ZoUr2rNkkaQ2xEw6hj8UCBRvrQ+Q=
X-Received: by 2002:a05:620a:2a08:b0:939:5ae7:2dad with SMTP id
 af79cd13be357-93a29b94250mr643123885a.38.1789419313952; Mon, 14 Sep 2026
 13:55:13 -0700 (PDT)
Precedence: bulk
X-Mailing-List: sashiko-reviews@lists.linux.dev
List-Id: <sashiko-reviews.lists.linux.dev>
List-Subscribe: <mailto:sashiko-reviews+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:sashiko-reviews+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20260914062514.926997-1-song@kernel.org> <20260914062514.926997-17-song@kernel.org>
 <20260914063833.0F9951F000FF@smtp.kernel.org>
In-Reply-To: <20260914063833.0F9951F000FF@smtp.kernel.org>
From: Song Liu <song@kernel.org>
Date: Mon, 14 Sep 2026 13:55:01 -0700
X-Gmail-Original-Message-ID: <CAPhsuW75MKDc93c=Ufi-Y3jcJj15Ox-yCUTjGGA9aU7sWO=Dmw@mail.gmail.com>
X-Gm-Features: AcwNN1WYAIJvb5G2MV2Veg9DIhsYGx0W0pvPyHkucKe4B44qmQQ3RQhiUlu68XY
Message-ID: <CAPhsuW75MKDc93c=Ufi-Y3jcJj15Ox-yCUTjGGA9aU7sWO=Dmw@mail.gmail.com>
Subject: Re: [PATCH v2 16/58] objtool/klp: Add test for cold function halves
To: sashiko-reviews@lists.linux.dev
Cc: live-patching@vger.kernel.org, puranjay@kernel.org, peterz@infradead.org, 
	joe.lawrence@redhat.com, pmladek@suse.com, mbenes@suse.cz, jikos@kernel.org, 
	kernel-team@meta.com, jpoimboe@kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Sun, Sep 13, 2026 at 11:38=E2=80=AFPM <sashiko-bot@kernel.org> wrote:
>
> Thank you for your contribution! Sashiko AI review found 1 potential issu=
e(s) to consider:
> - [Medium] The test assertion for the carried cold function incorrectly p=
asses with `llvm-readelf` when the cold half is left behind.
> --
>
> commit a04e65cdf7036d7ab3a10a22fc0efb8a0c3873bd
> Author: Puranjay Mohan <puranjay@kernel.org>
>
> objtool/klp: Add test for cold function halves
>
> The compiler splits unlikely code into a separate foo.cold symbol. Both
> halves are the same function and both belong in the livepatch. This adds
> a test to ensure cold paths branching into unpatched code are handled.
>
> > diff --git a/tools/objtool/tests/generic/test-cold-function.sh b/tools/=
objtool/tests/generic/test-cold-function.sh
> > new file mode 100755
> > index 0000000000000..dd4a7297af044
> > --- /dev/null
> > +++ b/tools/objtool/tests/generic/test-cold-function.sh
>
> [ ... ]
>
> > +assert_patched target
> > +# Not a bare name match: had the cold half been left behind, the branc=
h to
> > +# it would appear as an undefined .klp.sym.vmlinux.target.cold, whose =
name
> > +# contains the one being looked for.  Require a defined symbol.
> > +out_symbols | awk '$7 !=3D "UND" && $8 ~ /target\.cold/ { found =3D 1 =
}
> > +     END { exit !found }' ||
> > +     fail "cold half was not carried into the patch"
>
> [Severity: Medium]
> Will this awk script correctly detect missing cold halves when the test i=
s
> run with llvm-readelf?
>
> When the cold half is left behind, klp diff converts unresolved reference=
s
> into SHN_LIVEPATCH symbols. llvm-readelf formats these as:
>
> OS[0xff20] .klp.sym.vmlinux.target.cold,0
>
> Because there is no space between the section name and the symbol name in
> this output format, $7 evaluates to "OS[0xff20]" (which is not "UND") and=
 $8
> matches the /target\.cold/ regex.
>
> Does this condition evaluate to true and cause the test to falsely pass w=
hen
> the cold half is actually left behind?

Seems to be an issue introduced in v2. Fixing it in v3.

Thanks,
Song
