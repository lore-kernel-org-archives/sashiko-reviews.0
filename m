Received: from mail-ej1-f45.google.com (mail-ej1-f45.google.com [209.85.218.45])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 351A83403E5
	for <sashiko-reviews@lists.linux.dev>; Wed,  5 Aug 2026 00:13:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.218.45
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785888833; cv=pass; b=saRgOh9tZuDcavNfA3EgzWOPCH4BfbERKP01vJsgZRazUYZbxmdBCJuhTgRq6B+4j91ZVeaIpV1OZTEfE7d2NUi8PksXSMWuAXGIms6dELabq/yUIFB/Dxb1hPcJN0BEE5wNnhGyiQpgegzs383/VjfJGMyK90eXJAo/QIH/0T4=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785888833; c=relaxed/simple;
	bh=Tg1mG369+Od1cS3/QPefmB1hVmVVudUR64WNcifkbvU=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=qER+fSH5zLBfYJVg50uTD/eUGrD5yAhRsh2dh8yHZHjahMEJ2YRD/OqJBWQL8cFK4pcqTJNbHSLfcnkRbTnCoVSBW9EuaEJjr51R9E2j6k2yvRs5iT3otaEudSxzy/URBRNKIkEa2I3952N+etre52s1US0a0M7aXDMABWJbk20=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=bGCwV7K9; arc=pass smtp.client-ip=209.85.218.45
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="bGCwV7K9"
Received: by mail-ej1-f45.google.com with SMTP id a640c23a62f3a-c15e03c2763so93833166b.0
        for <sashiko-reviews@lists.linux.dev>; Tue, 04 Aug 2026 17:13:50 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1785888829; cv=none;
        d=google.com; s=arc-20260327;
        b=bf5FPAxmTzdWwytQsqC0/nrkyiZIHtUo7R8HHNA9GosaBTZHUPPCnDmMu2gGveIn00
         o2LYBancqDueNsrTWoUGjPpJcfj8W5rV9MZemoTB2FjHrV6F56i7X7m4kI1yySXF7Ain
         /03dpSPB+pj+Dz8UNb6vOZuXfg9JumIL9n3deYtrRtihU1ABLGrxU0wP7g1rQcqh1Jqt
         Uq8OhoW1+wkiFHQieieCnXyTfUPsRzIXEDlYmqFby9CP0Hzt21cv6SbRWvZmqAelwLfn
         MtqPhnZyS2iL0OvmeXVFmxp5Wut/+LenOmeX0e6hOpbmjhQRaUP7qOC6+VZL1g2igpgj
         ptBQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=TFpjSAcjCB3drRnuWnc3QoqnOMyx7VYMyKfkRCzH2d8=;
        fh=uA360uvxR9S0K/Y4Lovo7aIaGlBwzVBnnb2BKWupr/4=;
        b=eG1+fpM6lmKluZfNInvFaQeXzWcGlhkQcfQrp1OjDO0Vy8xFuUFZNGTs7u72RDiZ2I
         nGg0dW+Lr1evV7bu1R/8SALEztMMlfDUFiGjC8DaEdZYoxzv/rGrwrnzdbTfBqPLjRTC
         UNyPGoo4NXKcFCKywmrzlLt68IkX8SQPOSB6CVQPpDNVmglo2feP8V4Fp9L1fGdOFkdh
         jjiyt/I1jN7IPTcGeLZvoUH//RXGvBYsDMPE+TWCz5VPlm9+PtF33Rs+mHrxXhdrDQDE
         X1uw9bXamf/j0c6XpVoCPkSYnLdeXr3P7Oun+xAbxceM4arwGTIhKqTQEqd/11EvRFOa
         jeHQ==;
        darn=lists.linux.dev
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1785888829; x=1786493629; darn=lists.linux.dev;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=TFpjSAcjCB3drRnuWnc3QoqnOMyx7VYMyKfkRCzH2d8=;
        b=bGCwV7K9wL+gtyUOIAWNF4ZbS7UICI2AnaGvRTeVb3y3l7vz3LF/8FSKxdyDxqkIg7
         vSO6NJkdn3+4vo+TB6akj0MNkM5amAsdA55/bIhgXzBbGMssD6VX689b2f+dnCG2TMTc
         Ohgq6RssD7/SuSxAFIa/ktHL25yVSuRmow+hIByLi4UStefdHyqj1QwBdyTI8VHaAfA4
         oB/Tw6T3XJI8089HwfdZJ2FoetVJWUegngTorVzhfC534Hdb8rn4+7Ee9zL+usrZyhey
         qn3ph2v0/3SE76La2qYLhi1AfDruF3XmYRFRch3Ede5Io/CfrCjujsWZHCg5BDTevMwM
         klLw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1785888829; x=1786493629;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=TFpjSAcjCB3drRnuWnc3QoqnOMyx7VYMyKfkRCzH2d8=;
        b=kNfz0QG1M6OUPtjapNZ2BtMutQutSm+aDVfxxWEnrGAKwegh2x/IdrhrLOALdoKgqy
         YUZ0ohmJNvQtFYnint27M5aiiO3d7W90YcC6FTfrottfrZWFTwrHX54I8s/XmBcqU1C3
         D1gpuRNFel+efJZ1KMoX6oJtVYtYohuZEaqCGDk0xQPfXubrMSWakpF1H+oT5GrAHGB3
         jUc5/L4xKEiBhk2sQpca6fWMQxkEsDXFql3inEyAHD9s6rToAsROmnfdNuruhbmT8GdZ
         zEJW7/soNoSoTJdXn7di8M5qATgJGHM10oh6jzkO9LEOyWgi/Y572AmyJWCOGyh6q+Wl
         i66A==
X-Gm-Message-State: AOJu0YxYL3tEbjzaYsGiONGZN9oplilj/qYrDvbTsJHIcjUuF4ew8XYY
	WijIQjQdA+Vq9U46RmWdoRuSItwZ6jNJGoSFEMEboNAhGHiiyzFmRKqlBv176nHyokZQRr7Ttjm
	K5V47SOUIdAQ5D4QtN3Wo+JixEe4xFQh9Fo6qgz8tmQ==
X-Gm-Gg: AR+sD10LcZriAZbozZdpgdT5FBOQljgSxTkzcvo4ySDtSTkVHcTJCjsr111DcTiNxdH
	Si1wDoZG3+zRifqrYfgj8ic02fv2d6v+J5L5Xe9ZqjSN+euBjiaXgWdUlOkGPOc1Vfy/dwLvNCa
	lggTmafuRbjZuyURtA8czsS+wJzbNi3OW98D8gyitv4G7PyMbPT9ofGNiyBtXznZByRNQophaCe
	UO1xCTjbNPFrWbTkMj3NrP1uBtBtXeKUAPMJ7dO6n1EBL2+bhsXVEaHGJujim04Y2wQNnlY6d4O
	JmhKSiDg9CEdIcgQnN0dGowrn1KLsAtQZwUzj3z01iM5dXxLEd0U2KhprvKDcqi2nR6SNYvThac
	usf8IGS0zal6L
X-Received: by 2002:a17:907:c23:b0:c15:c323:36e5 with SMTP id
 a640c23a62f3a-c20247ce99dmr701047966b.10.1785888828957; Tue, 04 Aug 2026
 17:13:48 -0700 (PDT)
Precedence: bulk
X-Mailing-List: sashiko-reviews@lists.linux.dev
List-Id: <sashiko-reviews.lists.linux.dev>
List-Subscribe: <mailto:sashiko-reviews+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:sashiko-reviews+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20260804170156.1709916-1-nickolay.lysenko@gmail.com>
 <20260804170156.1709916-4-nickolay.lysenko@gmail.com> <20260804172109.442151F000E9@smtp.kernel.org>
In-Reply-To: <20260804172109.442151F000E9@smtp.kernel.org>
From: Mykola Lysenko <nickolay.lysenko@gmail.com>
Date: Tue, 4 Aug 2026 17:13:37 -0700
X-Gm-Features: AUfX_mxu2pzDdE-b3NdRwEZPqstjPE-uaWoUZB1ZTPpU2wJTrMt5tLLHhpftwuA
Message-ID: <CAMtxOX3f-u0cnDiXuHyxUuiMWwosC9sj3xmTDy-ATaFAKuX4RA@mail.gmail.com>
Subject: Re: [RFC PATCH bpf-next v5 3/8] selftests/bpf: factor the
 permissive-mode skip suffix into a helper
To: sashiko-reviews@lists.linux.dev
Cc: bpf@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Tue, Aug 4, 2026 at 10:21=E2=80=AFAM <sashiko-bot@kernel.org> wrote:
>
> Thank you for your contribution! Sashiko AI review found 1 potential issu=
e(s) to consider:
> - [Low] Missing space in SKIP message output due to GNU Make's function a=
rgument whitespace stripping.
> --
>
> --- Patch [3]: [RFC PATCH bpf-next v5 3/8] selftests/bpf: factor the perm=
issive-mode skip suffix into a helper ---
> commit 5a41b62fa6a5d8d794a18de41a7ff9bb6b7087f6
> Author: Mykola Lysenko <nickolay.lysenko@gmail.com>
>
> selftests/bpf: factor the permissive-mode skip suffix into a helper
>
> This commit factors out the duplicated skip logic used for permissive bui=
lds
> into a common skip_on_fail macro in the Makefile.
>
> > diff --git a/tools/testing/selftests/bpf/Makefile b/tools/testing/selft=
ests/bpf/Makefile
> > --- a/tools/testing/selftests/bpf/Makefile
> > +++ b/tools/testing/selftests/bpf/Makefile
> > @@ -49,6 +49,14 @@ SKIP_CRYPTO        ?=3D
> >  BPF_STRICT_BUILD ?=3D 1
> >  PERMISSIVE :=3D $(filter 0,$(BPF_STRICT_BUILD))
> >
> > +# Permissive-mode recipe suffix: on failure, remove the target, emit a
> > +# SKIP marker and report success so the rest of the build continues.
> > +# $(1) - SKIP tag (BPF, TEST, BENCH, SKEL, LINK, ...)
> > +# $(2) - optional extra files to remove alongside the target
> > +# $(3) - optional note appended to the SKIP message
> > +skip_on_fail =3D $(if $(PERMISSIVE),|| { $(RM) $@ $(2); \
> > +     printf '  %-12s %s\n' 'SKIP-$(1)' '$(notdir $@)$(if $(3), $(3))' =
1>&2; })
>
> [Severity: Low]
> Will GNU Make strip the leading space before $(3) in this if statement?
>
> Since Make strips leading whitespace after commas in function arguments, =
it
> appears the optional note gets appended directly to the target name witho=
ut
> any separation space.
>
> [ ... ]
>
> > @@ -1012,8 +1002,7 @@ $(OUTPUT)/bench: $(OUTPUT)/bench.o \
> >                $(OUTPUT)/usdt_2.o \
> >                #
> >       $(call msg,BINARY,,$@)
> > -     $(Q)$(CC) $(CFLAGS) $(LDFLAGS) $(filter %.a %.o,$^) $(LDLIBS) -o =
$@ $(if $(PERMISSIVE),|| \
> > -             ($(RM) $@; printf '  %-12s %s\n' 'SKIP-LINK' '$(notdir $@=
) (some benchmarks may have been skipped)' 1>&2))
> > +     $(Q)$(CC) $(CFLAGS) $(LDFLAGS) $(filter %.a %.o,$^) $(LDLIBS) -o =
$@ $(call skip_on_fail,LINK,,(some benchmarks may have been skipped))
>
> [Severity: Low]
> Because of the stripped whitespace mentioned above, will the console outp=
ut
> for this rule now print as "bench(some benchmarks may have been skipped)"
> instead of "bench (some benchmarks may have been skipped)"?

does not seems to be the case

prozak@powertower:/tmp/tmp.U6wCzgIl5v$ make --version
GNU Make 4.3
Built for x86_64-pc-linux-gnu
Copyright (C) 1988-2020 Free Software Foundation, Inc.
License GPLv3+: GNU GPL version 3 or later <http://gnu.org/licenses/gpl.htm=
l>
This is free software: you are free to change and redistribute it.
There is NO WARRANTY, to the extent permitted by law.

prozak@powertower:/tmp/tmp.U6wCzgIl5v$ cat Makefile
PERMISSIVE :=3D 1

skip_on_fail =3D $(if $(PERMISSIVE),||  \
{ printf "  %-12s %s\n" "SKIP-$(1)" "$(notdir $@)$(if $(3), $(3))" 1>&2; })

bench:
@false \
$(call skip_on_fail,LINK,,(some benchmarks may have been skipped))

prozak@powertower:/tmp/tmp.U6wCzgIl5v$ make bench
  SKIP-LINK    bench (some benchmarks may have been skipped)

>
> --
> Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260804170156.17=
09916-1-nickolay.lysenko@gmail.com?part=3D3
