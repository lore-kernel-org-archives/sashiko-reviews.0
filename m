Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4AD553F65F7
	for <sashiko-reviews@lists.linux.dev>; Mon, 14 Sep 2026 21:08:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789420102; cv=none; b=JmAWnP+aMCbojpNryk4kauiijyAgq9K7mSZ7O590yHRt5DxPQpA/fPhcshPcu4u1CfbiTu6dsUn2gO2m4YRVYC/gg5D92nMMbe79GfQrjV3b0Qk1uBMwpIecv8e3ARS6Pz5wjJ9xqp/0jg74VoKmMPVNPi1usIhfzjiVDhzQqrA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789420102; c=relaxed/simple;
	bh=zMC2LP+jj9gBWcjPsiNV6S9i7Qiz298RJlrzxUxCnGE=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=CL8f3TXp34MOFWklrroSeJ/oojMhtydHM3p7/9YMCqK/MkngYTD0ajktR/1MdkBstIrYqSLRMEGeaKjaptkhfthMZOmYXJ5GvnfIQYvrsj4hxJMFF4Y4eLSGY+N/i2l4zKP26hJt/XBdXfstwCogKVLTnM79ZwgNyrJlEQgTMqE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=D3huGGmi; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="D3huGGmi"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id EDDA51F000FF
	for <sashiko-reviews@lists.linux.dev>; Mon, 14 Sep 2026 21:08:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1789420101;
	bh=/jlu6q4Ro9hNGI/WU9HvCOzE7DGnrPgDXV64iTb7OMw=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc;
	b=D3huGGmi6QCzrQUU/XPRUa0vY5iks3+ugUouJzNsYGsfb/OYTztnKcKu0O5r707Y3
	 Z27uNqJJEEiOi7v6ifYrd37YjA5vmF7VrsIepGyM29bOS81gvYe8wQNpjRZzFACarR
	 VE4s87ucNP50aN/CcvJ6fOUndSHX2qus8IMeHdxbOWHMN3/wjb2/iFRHtuEbzxMyFb
	 iFvlywcSjr/z7neBxuzfdDPZvxy+r0CSoBOcXg4yK0sn1bqKGR+uRn8HN6hz7uq/za
	 dejiU3GebHLq52oFGtgw2SNtCaT2gh3IdnZnfmnbuR+tBNQeDBBF5RkaJ6ymDCFfIj
	 9OmcY/VEsw2gA==
Received: by mail-qk2-f13.google.com with SMTP id af79cd13be357-939109f067fso317080885a.2
        for <sashiko-reviews@lists.linux.dev>; Mon, 14 Sep 2026 14:08:20 -0700 (PDT)
X-Gm-Message-State: AFuF++lUNqYHiRAtjuOmd7v+G0t28XiOqG38aNppyDB73WuD9Ih1ABkP
	y2gd0hlnZmHafjnXANhni7tldiGSIdcq1f1SNZAaVvnNjeZvRA96R/sbgwo+e3SvdGF+bgxp0Rz
	MT0Q0NsJzt4Vgj44D1DrMBz9Tl68ec7k=
X-Received: by 2002:a05:620a:268d:b0:939:6de9:4cf9 with SMTP id
 af79cd13be357-93a29a7486cmr650466985a.44.1789420100098; Mon, 14 Sep 2026
 14:08:20 -0700 (PDT)
Precedence: bulk
X-Mailing-List: sashiko-reviews@lists.linux.dev
List-Id: <sashiko-reviews.lists.linux.dev>
List-Subscribe: <mailto:sashiko-reviews+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:sashiko-reviews+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20260914062514.926997-1-song@kernel.org> <20260914062514.926997-38-song@kernel.org>
 <20260914064918.132B41F00899@smtp.kernel.org>
In-Reply-To: <20260914064918.132B41F00899@smtp.kernel.org>
From: Song Liu <song@kernel.org>
Date: Mon, 14 Sep 2026 14:08:08 -0700
X-Gmail-Original-Message-ID: <CAPhsuW7TEsQHzof+45pux3kBgOG_eNotuwqE5RNrGfkK00vscQ@mail.gmail.com>
X-Gm-Features: AcwNN1WHYzdD_ZG4p-KG5j88cknC4nnUl0JNMsvhyMQLSyMj_yuXlh-svkqQm_U
Message-ID: <CAPhsuW7TEsQHzof+45pux3kBgOG_eNotuwqE5RNrGfkK00vscQ@mail.gmail.com>
Subject: Re: [PATCH v2 37/58] objtool/klp: Add test for sympos in module objects
To: sashiko-reviews@lists.linux.dev
Cc: live-patching@vger.kernel.org, pmladek@suse.com, jpoimboe@kernel.org, 
	mbenes@suse.cz, kernel-team@meta.com, joe.lawrence@redhat.com, 
	peterz@infradead.org, jikos@kernel.org, puranjay@kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Sun, Sep 13, 2026 at 11:49=E2=80=AFPM <sashiko-bot@kernel.org> wrote:
>
> Thank you for your contribution! Sashiko AI review found 1 potential issu=
e(s) to consider:
>
> Pre-existing issues:
> - [High] Objtool's klp_find_sympos() for modules counts symbols in init a=
nd non-alloc sections, causing livepatch resolution to fail if applied afte=
r the target module is initialized.
> --
>
> commit 22d70a31297d85e4712560a5e8b6e9de9ffd35be
> Author: Song Liu <song@kernel.org>
> Subject: objtool/klp: Add test for sympos in module objects
>
> This commit introduces test coverage for the klp-sympos logic in objtool.
> It adds a new fixture and bash script to verify that duplicate symbols ar=
e
> correctly numbered by sympos in module objects.
>
> > diff --git a/tools/objtool/tests/generic/test-sympos.sh b/tools/objtool=
/tests/generic/test-sympos.sh
> > new file mode 100755
> > index 0000000000000..b71d4930a22af
> > --- /dev/null
> > +++ b/tools/objtool/tests/generic/test-sympos.sh
> [ ... ]
> > +run_diff
> > +
> > +assert_klp_sympos dup_counter 1
> > +assert_klp_sympos dup_counter 2
>
> [Severity: High]
> This is a pre-existing issue, but since this test checks the output of
> klp_find_sympos(), I wanted to ask about its symbol counting logic.
>
> Currently, klp_find_sympos() counts all identically-named symbols in the
> module's ELF symtab:
>
> tools/objtool/klp-sympos.c:klp_find_sympos() {
> ...
>         for_each_sym(elf, s) {
>                 if (!strcmp(s->name, sym->name)) {
>                         nr_matches++;
>                         if (s =3D=3D sym)
>                                 sympos =3D nr_matches;
>                         else
>                                 has_dup =3D true;
>                 }
>         }
> ...
> }
>
> Does blindly counting symbols in .init or non-alloc sections cause
> livepatch resolution to fail?
>
> When a livepatch is loaded after the target module is initialized, the
> kernel's module_kallsyms_on_each_symbol() uses mod->core_kallsyms, which
> strips init and non-alloc symbols via is_core_symbol().
>
> If a livepatch targets a module symbol that shares its name with another
> symbol located in an .init or non-alloc section, it seems klp_find_sympos=
()
> assigns an inflated sympos (e.g., 2). However, the kernel would only find=
 1
> matching symbol, see a mismatch with sympos=3D2, and reject the patch wit=
h
> -EINVAL.
>
> Should klp_find_sympos() be skipping init and non-alloc sections?

Let's address this separately.

Song
