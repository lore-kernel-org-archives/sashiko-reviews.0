Received: from mail-ed1-f47.google.com (mail-ed1-f47.google.com [209.85.208.47])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 97FB134CFC7
	for <sashiko-reviews@lists.linux.dev>; Wed,  5 Aug 2026 01:40:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.208.47
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785894058; cv=pass; b=acPc+AG12qMX0agcndgmxe6GolUfdZUJm2uABpEtJu4noYCr2Tguz/7hN0Vgtj04Dnt2dbdJYyr161tyu3KTAsr0hzvPkU1JfTH/8/3NOsVdXa1Ge/YzzzRKlSoGQjAJ4pLSvENOz5YyRBlGSfNX/s7M5dBqiEdRsYKXVHe7pVI=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785894058; c=relaxed/simple;
	bh=pPyg7K2vslrzk0vHWbu4dVkgZmi+23mzJxE0mTnTsA4=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=RsursjdHz5hJFB3S6JvkGEQuUXPcgubGNV730nGlFDN/l/trBrAdyJwjtAiXJKVvBa+Heh37X2P7y9e0skgF61H8BMcROi4FAF9YmPO4I6aHlccoi4wKl4Cu/T2Va7UDZGzw7ORurJgQNWUeaF/yIT+S1k+Xu3+nNCW/KrFsezM=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=gk8zxUyJ; arc=pass smtp.client-ip=209.85.208.47
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="gk8zxUyJ"
Received: by mail-ed1-f47.google.com with SMTP id 4fb4d7f45d1cf-6a0794669a6so319648a12.2
        for <sashiko-reviews@lists.linux.dev>; Tue, 04 Aug 2026 18:40:56 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1785894055; cv=none;
        d=google.com; s=arc-20260327;
        b=AoXUwwhG5qzzSX1qXxGXhoyZ3DMeD8Bt0nWV200LWPQkXn0akKScDUXA1I06GvEKkB
         QJCj7p01hNg5h6BEZ6hySRmxuh3POB/WyDyBLor7j2XHd+jDkidn+v76IgHpOMXSzIrr
         zPRm+h/FuZ5veXwyHhVtwYyc6U4vN0Bv2haAJU/JUqkK0v4H6e2aaereQRBOBPudj4xm
         K7+V+gWVcRHJJ75jzm/Fm7AtF1CTBjcT4t88cX9QJhTiZUJ1l+rBzdKMWQnWTOUzCU6f
         CnY1EmKElyVAWsdi9MU18qxH3Advff0/9XX6Oeu1NAlFeZPLTaARWuUE0IsaKpWrrXsJ
         A5ow==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=tCe1PHBV2z5lmY55d+MmZeq9ngGC4whGPN9INfCQUbw=;
        fh=uA360uvxR9S0K/Y4Lovo7aIaGlBwzVBnnb2BKWupr/4=;
        b=rJvHKwhtylCpr8aLTwX1RSYbPqa++RKa32Jv0YWESS4lQPgZ/mNyvo7xZ9/a8A9cwR
         9uqfv89Ll3dLRyfzmUsA3hNex+GGvGyRPPueBNjFnGw3hNfNNTUM4phvwArIOfHqBXv0
         nrY7PGFF7FsUK5S7/C7F+X3xFYswvpcQM4dtw0Pn2PUfOyL8bD6tPbS+giGbEFyJxxxb
         8f6RzzgJXM3NHZt4Ua1RRPfOIoudAST3vmpAmF00akdOG9UusWrKJ2neM/lLRt5M5r9p
         XcTYFuCrp69tKEkfj5G8nsz/IQ8rdVRaCvrFSMeWwx/OCYx7FpohMZIbv1dcsZFpPl6D
         m7HQ==;
        darn=lists.linux.dev
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1785894055; x=1786498855; darn=lists.linux.dev;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=tCe1PHBV2z5lmY55d+MmZeq9ngGC4whGPN9INfCQUbw=;
        b=gk8zxUyJcRL6Gr35w8BVUj4cI4XDntcQrq5qxX7PtaMzs8gTG703uaHaHuFiEc3Iw1
         Bctty0HfDGk3AsW+YfESNkeSX1BpxvoRfUOW4vkPahsvk8G5yua/tz5LLoa3+O3bxP1Y
         2ux0obOf9JnpxGI/qTtKhUmZp+aFkY811bzEVZDLkWLPP5XQqUaqXW6kzpnD1PWKkL49
         y6uLD5hDjkNWYEyLqjeM+1C/Mr5VpxeILLBWDq02S91CW1BjBW+N3Lx8j9lOj3r+B9lf
         D9FLprPfyMzXSNOuROQW82+QmFXPJmvvo5TG3BM4Yw5+CEbPTL6LL7Yw2DJHGMOVFoFM
         BAqg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1785894055; x=1786498855;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=tCe1PHBV2z5lmY55d+MmZeq9ngGC4whGPN9INfCQUbw=;
        b=UO2uZTaI0NPjhYoVUIyu6qWxVe7aRO0laZ7mBkkdKp6iUbDAnJ46WuLH+0zwMmMQDj
         gHwykn2CT350KAEzW/NhItuA5UtAGSpWk/FvKNm0aCl+sdypCZg53NZog4UKsaXuuDq/
         FF02Fn4CwzpmSCH8uClTROhWWDL8QlEfka1zWFQ/PIFtdGhcnxw1JPnAHFVXJDkMprKK
         KxaYEBvKJCoNKrEBrfpiTU/+uqL5MtbPZd46TwnaeKho/CyM8RcJrNdLVKHNhMb/aLpj
         HTnxVmkiDGgv3v6wpHc3rwRkOMLPu7R3oko77ndEadTBslJaqMUVKg+bcfL+v8rkIpSt
         1IJg==
X-Gm-Message-State: AOJu0YyWLO8hQ6HU7zW9clPnCgoeDJXtncLbxLbUpIOg0A5OeUX3kw7f
	3VyqXftG+nxqd3gL098U73iILHtqyF3N4hvxKgzI/Q1MIFB/JWY690s/hFLlbIvyUt7Am9ayHad
	bWKF5exvH6RWaD0Ap5cR/Ke465k9iMtgccO8l3pXN3A==
X-Gm-Gg: AR+sD10olPdRDbUBiv2I2lJEfOM4tae3vurjk7N1c9SsGJAf2XAuMXSxF/N4b0WM9oe
	8AU7XqwaoWiEwsF9XemcszAqeFLgeY5U38mZ1IhKnlM8Kz/++h3JJDrVIKs4ySLpEwXFZXL7mL9
	0LoxDzIbtWRjWeCrUiVueJO/5XxmjP3D9AqJmQFkx8YoJtC/xnmfGGKMZM2QKcxE57uxePtZIx9
	JtUmY+pfa8233Ln7nOuozznwcKgiwI65If9FDD+LRIHqzJYMA1HzToAZlaaNOfnvjur9O4kX4Ip
	WhWRZSHOHLObfdCuWqda2GCBbImZHSZqz5orKlHyt+UZ6dPg29hFugJnv8NIR/vXhTPNk2hdl09
	Sc8TvaIpAjwpb
X-Received: by 2002:a17:907:3e8d:b0:c20:2d38:e518 with SMTP id
 a640c23a62f3a-c2039ce5eafmr131391866b.2.1785894054463; Tue, 04 Aug 2026
 18:40:54 -0700 (PDT)
Precedence: bulk
X-Mailing-List: sashiko-reviews@lists.linux.dev
List-Id: <sashiko-reviews.lists.linux.dev>
List-Subscribe: <mailto:sashiko-reviews+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:sashiko-reviews+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20260804170156.1709916-1-nickolay.lysenko@gmail.com>
 <20260804170156.1709916-7-nickolay.lysenko@gmail.com> <20260804175948.3AFF11F000E9@smtp.kernel.org>
In-Reply-To: <20260804175948.3AFF11F000E9@smtp.kernel.org>
From: Mykola Lysenko <nickolay.lysenko@gmail.com>
Date: Tue, 4 Aug 2026 18:40:42 -0700
X-Gm-Features: AUfX_mwNkS3kz9QKXZvh_atQ8kHPSx-Jv81lPBEPMvjZcwdqAHj7BQQjJ6y2lVc
Message-ID: <CAMtxOX2Kpzom-r7rEBJ4AWsBf67XdCfavR2GaOyXqo7Pe+ZDiA@mail.gmail.com>
Subject: Re: [RFC PATCH bpf-next v5 6/8] selftests/bpf: extract BPF skeleton
 generation into a helper script
To: sashiko-reviews@lists.linux.dev
Cc: bpf@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Tue, Aug 4, 2026 at 10:59=E2=80=AFAM <sashiko-bot@kernel.org> wrote:
>
> Thank you for your contribution! Sashiko AI review found 1 potential issu=
e(s) to consider:
> - [Medium] The patch introduces a behavior change in permissive mode that=
 results in noisy build logs and redundant error messages, contradicting th=
e commit message claim that 'behavior is unchanged'. Additionally, a script=
 comment references a non-existent file.
> --
>
> --- Patch [6]: [RFC PATCH bpf-next v5 6/8] selftests/bpf: extract BPF ske=
leton generation into a helper script ---
> commit e4a593d3d0bfe3675d723364cb65f81a2812b866
> Author: Mykola Lysenko <nickolay.lysenko@gmail.com>
>
> selftests/bpf: extract BPF skeleton generation into a helper script
>
> This commit extracts the BPF skeleton generation steps into a dedicated s=
hell
> script (gen_bpf_skel.sh) to reduce Makefile complexity and escaping issue=
s. It
> handles regular, light, signed light, and linked skeletons through script
> flags.
>
> > diff --git a/tools/testing/selftests/bpf/Makefile b/tools/testing/selft=
ests/bpf/Makefile
> > index 0ee02eeac6bca..dbde2f6bd044d 100644
> > --- a/tools/testing/selftests/bpf/Makefile
> > +++ b/tools/testing/selftests/bpf/Makefile
>
> [ ... ]
>
> > -$(TRUNNER_BPF_SKELS): %.skel.h: %.bpf.o $(BPFTOOL) | $(TRUNNER_OUTPUT)
> > -     $(Q)$(if $(PERMISSIVE),if [ ! -f $$< ]; then                    \
> > -             $$(RM) $$@ $$(@:.skel.h=3D.subskel.h);                   =
 \
> > -             printf '  %-12s %s\n' 'SKIP-SKEL' '$$(notdir $$@)' 1>&2; =
\
> > -             exit 0;                                                 \
> > -     fi;)                                                            \
> > -     printf '  %-12s %s\n' 'GEN-SKEL' '[$(TRUNNER_BINARY)] $$(notdir $=
$@)' 1>&2; \
> > -     $$(BPFTOOL) gen object $$(<:.o=3D.linked1.o) $$< &&              =
 \
>
> [ ... ]
>
> > +$(TRUNNER_BPF_SKELS): %.skel.h: %.bpf.o $(BPFTOOL) gen_bpf_skel.sh | $=
(TRUNNER_OUTPUT)
> > +     $$(call msg,GEN-SKEL,$(TRUNNER_BINARY),$$@)
> > +     $(Q)BPFTOOL=3D$$(BPFTOOL) ./gen_bpf_skel.sh                      =
         \
> > +             --name $$(notdir $$(<:.bpf.o=3D))                        =
         \
> > +             --skel $$@ --subskel $$(@:.skel.h=3D.subskel.h) $$< $$(ca=
ll skip_on_fail,SKEL,$$(@:.skel.h=3D.subskel.h))
>
> [Severity: Medium]
> Does this change in permissive mode behavior contradict the commit messag=
e
> which states "behavior is unchanged"?
>
> Previously, if a .bpf.o file failed to compile in permissive mode, the
> skeleton generation recipe would quietly check for the missing file, prin=
t
> SKIP-SKEL, and exit early without executing bpftool.
>
> With the missing-file guard removed, the recipe now unconditionally print=
s
> GEN-SKEL and calls gen_bpf_skel.sh. This invokes bpftool on a missing fil=
e,
> causing it to fail loudly to stderr before the skip_on_fail suffix catche=
s
> the exit code. This results in noisy build logs and redundant error messa=
ges.

It does - good catch. Reproduced:

prozak@powertower$ touch progs/fentry_test.c && $MK LLVM=3D BPF_STRICT_BUIL=
D=3D0 \
 "progs/fentry_test.c-CFLAGS=3D--definitely-bogus-flag" \
 $PWD/fentry_test.bpf.o $PWD/fentry_test.lskel.h 2>&1 | tail -15
...
  CLNG-BPF [test_progs] fentry_test.bpf.o
clang: error: unknown argument: '--definitely-bogus-flag'
  SKIP-BPF     fentry_test.bpf.o
  GEN-SKEL [test_progs (signed)] fentry_test.lskel.h
libbpf: failed to open file '.../fentry_test.bpf.o': -ENOENT
Error: failed to link '.../fentry_test.bpf.o': No such file or directory (2=
)
  SKIP-SKEL    fentry_test.lskel.h

The GEN-SKEL line and the two error lines are new - the old recipe's
missing-input guard skipped silently before bpftool ever ran. The
final state is identical (outputs removed, build reports success and
continues):

prozak@powertower$ touch progs/fentry_test.c && $MK LLVM=3D
BPF_STRICT_BUILD=3D0 2>&1
...
  CLNG-BPF [test_progs] fentry_test.bpf.o
  GEN-SKEL [test_progs (signed)] fentry_test.lskel.h
...
  CLNG-BPF [test_progs-no_alu32] fentry_test.bpf.o
  GEN-SKEL [test_progs-no_alu32 (signed)] fentry_test.lskel.h
...
  CLNG-BPF [test_progs-cpuv4] fentry_test.bpf.o
  GEN-SKEL [test_progs-cpuv4 (signed)] fentry_test.lskel.h
...

While the output differs, on reflection the extra printing is
derivative - the compile failure is
already reported in full where it happens - so the next revision will
restore the quiet skip
(and with it, the 'behavior is unchanged' claim becomes accurate).

>
> > diff --git a/tools/testing/selftests/bpf/gen_bpf_skel.sh b/tools/testin=
g/selftests/bpf/gen_bpf_skel.sh
> > new file mode 100755
> > index 0000000000000..e234f3a57d46b
> > --- /dev/null
> > +++ b/tools/testing/selftests/bpf/gen_bpf_skel.sh
> > @@ -0,0 +1,93 @@
> > +#!/bin/bash
> > +# SPDX-License-Identifier: GPL-2.0
>
> [ ... ]
>
> > +# The bpftool binary is taken from $BPFTOOL (default: bpftool from PAT=
H).
> > +# On failure all outputs and intermediates are removed and the script
> > +# exits non-zero; permissive-mode skipping is the caller's business
> > +# (see skip_on_fail in Makefile.buildvars).
>
> [Severity: Medium]
> Is the reference to Makefile.buildvars correct here?
>
> The file Makefile.buildvars does not exist. It looks like skip_on_fail is
> actually defined directly in tools/testing/selftests/bpf/Makefile.

Fair, will fix before re-spin.

>
> > +
> > +set -u
>
> --
> Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260804170156.17=
09916-1-nickolay.lysenko@gmail.com?part=3D6
