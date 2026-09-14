Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1F1EF385D7E
	for <sashiko-reviews@lists.linux.dev>; Mon, 14 Sep 2026 22:02:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789423344; cv=none; b=ZXa64b0o91rXpP72A+k3EoUzP8hzLjQmcw2VTsPYZY6upL2ty7kXwQ3kCK8hhZoS6Ni1REiAEsRWPPBQr719wk+Af2zfZVSZL9KrzwREA099cAL/b24uPHpLRncYF5EOwMQf5jNVEUUH3ccMUQRljBR3Jy/PIIIzw0NkfHcMBmc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789423344; c=relaxed/simple;
	bh=Lfp6A/eUhKb/0PlA4U0RxOHqR0KewGDnib5ptOReQzQ=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Content-Type; b=AKJDy9sxdj88qN2V98Zk1HQouRIXtQjQjiqItDvvFLpDCYMawioOnDmkjbZhxF/96xnZLVmM/W21OptVac49CgXCYCNjV6EERBIVp7bOhiB/9b0G0XGV5BFYlUlN6iLYj6fFA+eI89tm2rNxyuKJby9qI6n4OOxtlZpi722GDTM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=hV5u81s9; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="hV5u81s9"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id BBAA11F000FF
	for <sashiko-reviews@lists.linux.dev>; Mon, 14 Sep 2026 22:02:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1789423342;
	bh=paPGqbFCl+Vi4/MNBZTTC+vuLe87pc4KlYycya+jAY8=;
	h=References:In-Reply-To:From:Date:Subject:To;
	b=hV5u81s9wWikaG0UVSa6FC6fqF0upUGEUGj4F5N4+CgVqKHuq66UXD+wcSLzexTe3
	 MZfw6RkfxTgQp+lPx6qse78B90jwg8OQSP285MhtnIwRUW+A9YGdKFFfIxQnKM/MQ1
	 7J1LWN0xTPqQEAO5G3sp70DyZuj/PoTIpFoVV0KDc+eIWQtwT61zLNc3xWlu1wCb3p
	 EwOKxEZ/Gpx8rC5BSx7aD27ZAmyD3Dg8qUo70ocJR4OIAC6v1k6g6uR5bLw00Y+jUb
	 wT/jNZsVeLkk66O/gxcMwkzN3x3SbbyXs37jg7/327fifzGQbqgbfw6PqaA6imoSiP
	 /xh/+qVhTsqwQ==
Received: by mail-qk2-f12.google.com with SMTP id af79cd13be357-939ca12ab70so334569985a.1
        for <sashiko-reviews@lists.linux.dev>; Mon, 14 Sep 2026 15:02:22 -0700 (PDT)
X-Gm-Message-State: AFuF++mDPoKXCmCah9yXvsajHLkgY3hblsh8izsI9mFAPf2CGzKRCFE0
	WpnSTJgYPQ8ExJ9+OvNEEl2LSIHQCjsxA22oRYzW7sGEOhxWl7znLD0SL1T4ky+/lf7OZ+mZH2x
	auOy2lP2371JSdvEEI36i9JBbiaAW4+A=
X-Received: by 2002:a05:620a:254b:b0:93a:2e8:5af5 with SMTP id
 af79cd13be357-93a297eee1bmr665897385a.6.1789423341867; Mon, 14 Sep 2026
 15:02:21 -0700 (PDT)
Precedence: bulk
X-Mailing-List: sashiko-reviews@lists.linux.dev
List-Id: <sashiko-reviews.lists.linux.dev>
List-Subscribe: <mailto:sashiko-reviews+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:sashiko-reviews+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20260914062514.926997-1-song@kernel.org> <20260914062514.926997-43-song@kernel.org>
 <20260914064704.77F4B1F000FF@smtp.kernel.org>
In-Reply-To: <20260914064704.77F4B1F000FF@smtp.kernel.org>
From: Song Liu <song@kernel.org>
Date: Mon, 14 Sep 2026 15:02:10 -0700
X-Gmail-Original-Message-ID: <CAPhsuW7xM0OtkB6t_2bfLOK1NQzQJ_UXvABPk1kW1A5di_sqaA@mail.gmail.com>
X-Gm-Features: AcwNN1U-OVx_1r769sjn6USNY_19RFpn6pfrBclKJ7N7sTdve09FIw3cZu7-kng
Message-ID: <CAPhsuW7xM0OtkB6t_2bfLOK1NQzQJ_UXvABPk1kW1A5di_sqaA@mail.gmail.com>
Subject: Re: [PATCH v2 42/58] objtool/klp: Add test for symbols whose linkage
 the patch changes
To: sashiko-reviews@lists.linux.dev
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Sun, Sep 13, 2026 at 11:47=E2=80=AFPM <sashiko-bot@kernel.org> wrote:
>
> Thank you for your contribution! Sashiko AI review found 1 potential issu=
e(s) to consider:
> - [Medium] Test fixture sanity checks for LOCAL symbol binding will produ=
ce false positives on newer binutils.
> --
>
> commit e2b339e9e0066c89f1967f8ca7015610df269518
> Author: Song Liu <song@kernel.org>
>
> objtool/klp: Add test for symbols whose linkage the patch changes
>
> A patch can move a symbol between static and global without renaming it:
> dropping "static" from a helper so something else can call it, or adding =
it
> to one that is no longer shared.  Correlation keys off more than the name=
,
> so a symbol whose binding moved has to still pair with itself.
>
> > diff --git a/tools/objtool/tests/generic/test-local-to-global-flip.sh b=
/tools/objtool/tests/generic/test-local-to-global-flip.sh
> > new file mode 100755
> > index 0000000000000..b4dca6cff0f2d
> > --- /dev/null
> > +++ b/tools/objtool/tests/generic/test-local-to-global-flip.sh
> [ ... ]
> > +setup
> > +build_pair local_to_global.c
> > +
> > +# Confirm the fixture really moved the bindings, in both directions.
> > +in_symbols orig.o    | grep -qE 'LOCAL.*flipped_up' ||
> > +     fail "flipped_up is not local in the original"
>
> [Severity: Medium]
> Since this test fixture is compiled with -ffunction-sections and
> -fdata-sections (as enforced by FIXTURE_CFLAGS), dedicated sections like
> .text.flipped_up are created.
>
> On newer binutils, readelf -s includes the section name for section symbo=
ls,
> which always have LOCAL binding.
>
> Does grep -qE 'LOCAL.*flipped_up' inadvertently match the section symbol
> instead of verifying the actual function symbol's binding? Could this res=
ult
> in a false positive that masks potential test fixture breakages if the sy=
mbol
> is actually GLOBAL?
>
> > +in_symbols patched.o | grep -qE 'GLOBAL.*flipped_up' ||
> > +     fail "flipped_up is not global in the patched object"
> > +in_symbols orig.o    | grep -qE 'GLOBAL.*flipped_down' ||
> > +     fail "flipped_down is not global in the original"
> > +in_symbols patched.o | grep -qE 'LOCAL.*flipped_down' ||
> > +     fail "flipped_down is not local in the patched object"
>
> [Severity: Medium]
> Similarly here, could 'LOCAL.*flipped_down' accidentally match the sectio=
n
> symbol for .data.flipped_down instead of verifying the variable's binding=
?

Fix this with a new has_binding() helper:

has_binding()   # $1 object, $2 binding, $3 symbol
{
       in_symbols "$1" | awk -v b=3D"$2" -v n=3D"$3" '$5 =3D=3D b && $NF =
=3D=3D n'
| grep -q .
}

Thanks,
Song
