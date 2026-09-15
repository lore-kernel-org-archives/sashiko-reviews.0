Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 89E684D09E7
	for <sashiko-reviews@lists.linux.dev>; Tue, 15 Sep 2026 20:31:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789504273; cv=none; b=g3RQd6jWzicxjsi668vocN2ps9A1Vpf4zTLFRLdqw3s6Z2C2XG14u7xK4YLjgPFaHQOm1eFxiWrWip4Ebf2ldUDpfsjJy2pRcw3JlDSF9iPh9oVvd7dur9RFXlqQ8hnHQtvSdRBcmOiyWRDhX+PJkXATQaIOsYvGcWLfXJbOwEI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789504273; c=relaxed/simple;
	bh=D17fcssPPHgntO6sYGtC953/eS33YpklLTz3YG/tHHE=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=R+UMA9vIyApYHEwOe+VLPhlkZe5EPk67dTzRcbfXhjsw7eegnXqNhSlRKDVTsMSvx0K2SjRm8Wpb6820JoHC66yx0r4YUSIklBWrQwM13FgL4TpqawHk4VF9eU8ED+CM4AmlMzu5rN9uPf1XYstm2j5C455WLGPxzibZuNlc0I8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=NOXsrFiY; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="NOXsrFiY"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 01F751F00898
	for <sashiko-reviews@lists.linux.dev>; Tue, 15 Sep 2026 20:31:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1789504270;
	bh=FBWXluVx1jaJMNxKKm1HopUNeOzvfDXiWVLOj3is80c=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc;
	b=NOXsrFiYXO1U/JElBUHiqRgMiMRidi8JBsvS9gN8Slw3a6QifO9u9y78A8wtZTZ+1
	 HK4Vc1Bb7hSyruFdZonM9kkioNXgwgwAjYju9osN3mQd6oiT/WWoWY7vj6+Fq1w+uO
	 zvfz93doNhehJpJIdYmWcq40FPudaJQ50rS6BpbEbkq+n5RAQQywiGoasJBX005heX
	 b1kVe5uJMXfvpYdirbcF/vWFY6v8ZLvi4Uk1URJQmWf2Bj3kruvChimx346EW8o+XF
	 udTIKxBL1oEt9YDT1djd/WzAyAkBuYV2FOCwTVTvmmxFAGx4JlE29UndCly47tW0tg
	 lcs9drkCn9aFw==
Received: by mail-qv1-f54.google.com with SMTP id 6a1803df08f44-9120eda2195so14325016d6.1
        for <sashiko-reviews@lists.linux.dev>; Tue, 15 Sep 2026 13:31:09 -0700 (PDT)
X-Gm-Message-State: AFuF++ngy/CL2PiOrBr5cfH+5HhA9sJi25z9Cms3M1wg7L+5rv9FMUP/
	fIRqPzqrwu4B+xLBIo3VRvw0jQNNVtwqm9ASjc5ugC8A1LTVTB4ZAtpd7fG+XFhlwFJI3pUYlTp
	CRRkLcQinuP2ZxpuImQGEJbqlDbCpCjg=
X-Received: by 2002:a05:620a:6f0e:b0:939:72cb:baeb with SMTP id
 af79cd13be357-93a347253d5mr745846985a.34.1789504269142; Tue, 15 Sep 2026
 13:31:09 -0700 (PDT)
Precedence: bulk
X-Mailing-List: sashiko-reviews@lists.linux.dev
List-Id: <sashiko-reviews.lists.linux.dev>
List-Subscribe: <mailto:sashiko-reviews+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:sashiko-reviews+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20260914230355.3422996-1-song@kernel.org> <20260914230355.3422996-7-song@kernel.org>
 <20260914233559.2C05F1F000FF@smtp.kernel.org>
In-Reply-To: <20260914233559.2C05F1F000FF@smtp.kernel.org>
From: Song Liu <song@kernel.org>
Date: Tue, 15 Sep 2026 13:30:57 -0700
X-Gmail-Original-Message-ID: <CAPhsuW7YG9=dK=QvKuadpzMvLemE0Han1tLV9+_CM+nTo6y2CQ@mail.gmail.com>
X-Gm-Features: AcwNN1Unt1XARvt-Hw6vtay5AL7lyW8dSkDsaN1M-Hxjcq1U3Tk3n0CrAEb_Xjc
Message-ID: <CAPhsuW7YG9=dK=QvKuadpzMvLemE0Han1tLV9+_CM+nTo6y2CQ@mail.gmail.com>
Subject: Re: [PATCH v3 06/58] objtool/klp: Grow the klp test harness vocabulary
To: sashiko-reviews@lists.linux.dev
Cc: live-patching@vger.kernel.org, pmladek@suse.com, mbenes@suse.cz, 
	jikos@kernel.org, puranjay@kernel.org, jpoimboe@kernel.org, 
	peterz@infradead.org, joe.lawrence@redhat.com, kernel-team@meta.com
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Mon, Sep 14, 2026 at 4:36=E2=80=AFPM <sashiko-bot@kernel.org> wrote:
>
> Thank you for your contribution! Sashiko AI review found 1 potential issu=
e(s) to consider:
> - [Medium] objtool/klp: run_checksum failures swallowed in subshells mask=
 test failures
> --
>
> commit 3b088080b3fc17cb3c6bcdacd83b5a2febf34918
> Author: Song Liu <song@kernel.org>
>
> objtool/klp: Grow the klp test harness vocabulary
>
> Adds assertions for the output produced by klp diff, as well as for the
> input objects. Includes helpers to extract and verify checksums recorded
> for livepatch symbols.
>
> > diff --git a/tools/objtool/tests/lib.sh b/tools/objtool/tests/lib.sh
> > index 35be42758ece8..1b1baff80a712 100644
> > --- a/tools/objtool/tests/lib.sh
> > +++ b/tools/objtool/tests/lib.sh
> [ ... ]
> > +checksum_of()
> > +{
> > +     local obj=3D"$workdir/$1" sym=3D"$2" off
> > +
> > +     run_checksum
> > +
> > +     off=3D"$($READELF -rW "$obj" 2>/dev/null |
> > +            awk -v s=3D"$sym" '/rela\.discard\.sym_checksum/,/^$/ {
> > +                     if ($5 =3D=3D s) { print $1; exit }
> > +            }')"
> > +
> > +     [ -n "$off" ] || return 1
> > +
> > +     $OBJCOPY -O binary --only-section=3D.discard.sym_checksum \
> > +             "$obj" "$workdir/checksums.bin" 2>/dev/null || return 1
> > +
> > +     dd if=3D"$workdir/checksums.bin" bs=3D1 skip=3D$((16#$off + 8)) c=
ount=3D8 \
> > +             status=3Dnone | od -An -tx1 | tr -d ' \n'
> > +}
> > +
> > +# assert_checksum_differs <symbol> / assert_checksum_matches <symbol>
> > +#
> > +# Compare what klp checksum recorded for a symbol in the original agai=
nst the
> > +# patched object.  This is what decides whether klp diff treats a func=
tion as
> > +# changed, so a test asserting only that the right functions were clon=
ed cannot
> > +# tell a correct checksum from one which happens to differ.
> > +checksum_pair()
> > +{
> > +     orig_checksum=3D"$(checksum_of "$orig_obj" "$1")"
> > +     patched_checksum=3D"$(checksum_of "$patched_obj" "$1")"
>
> [Severity: Medium]
> Will run_checksum failures be swallowed by these subshells, potentially
> masking test failures?
>
> If objtool klp checksum fails for orig_obj, it triggers the call chain
> checksum_pair() -> checksum_of() -> run_checksum() -> fail() in
> tools/objtool/tests/lib.sh. Since this occurs within a subshell, fail()
> exits only the subshell and its stdout (the "not ok..." string) is
> captured into orig_checksum instead of terminating the test. No
> .checksummed marker is created.
>
> When checksum_of() runs for patched_obj, run_checksum() attempts to proce=
ss
> orig_obj again and fails identically, capturing the exact same failure
> string into patched_checksum.
>
> Both variables will contain the identical "not ok..." error string.
>
> > +
> > +     [ -n "$orig_checksum" ] ||
> > +             fail "no checksum recorded for '$1' in $orig_obj"
> > +     [ -n "$patched_checksum" ] ||
> > +             fail "no checksum recorded for '$1' in $patched_obj"
> > +}
> > +
> > +assert_checksum_differs()
> > +{
> > +     checksum_pair "$1"
> > +
> > +     [ "$orig_checksum" !=3D "$patched_checksum" ] ||
> > +             fail "checksum for '$1' unchanged at $orig_checksum, expe=
cted it to differ"
> > +}
> > +
> > +assert_checksum_matches()
> > +{
> > +     checksum_pair "$1"
> > +
> > +     [ "$orig_checksum" =3D "$patched_checksum" ] ||
>
> As a result, assert_checksum_matches() evaluates to true here, and the te=
st
> silently passes despite a toolchain failure.

Fixed this by moving run_checksum call to checksum_pair().

Thanks,
Song
