Received: from mail-ej1-f46.google.com (mail-ej1-f46.google.com [209.85.218.46])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F0129471257
	for <sashiko-reviews@lists.linux.dev>; Tue, 21 Jul 2026 19:43:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.218.46
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784663020; cv=pass; b=IiVtCyKyJq2jFs2ThCqNQFGB9k1zPaZv5TOraaQZR7JK7LfD015m4O3ch/iKSLE9+nE8GypxJ8v5j2m+iuHNKYSKMvu5YNqYOsahR4bkqTaQKRiU19n2Tf5zUYKZstYQp+Xj+6JCXaqIn4RWCS8U/bZAySVKuqdfyLQtjWG/mac=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784663020; c=relaxed/simple;
	bh=UWyB1slbr//2W4KTDkAmTzxAdMd8fmYMI4/ROQtFYbY=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=dpShZXilRr3N+LrNfRWVNczFBNbEQTWZvWdyQJG4QpUDYjVQtarZMKjQr78CFE/H7cK0UxPbFKRo5WtdmHV6hI0gxrZ7Z832yLjvLCNCRqhhlFP2wOspJk6nOdswDq8Id1mm8HMbtTAKodqUU1eS4QaUNrC9Ywz8WOSHtuLYTa8=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=SHglTSzN; arc=pass smtp.client-ip=209.85.218.46
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="SHglTSzN"
Received: by mail-ej1-f46.google.com with SMTP id a640c23a62f3a-c1740c36c5cso634994966b.2
        for <sashiko-reviews@lists.linux.dev>; Tue, 21 Jul 2026 12:43:38 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1784663017; cv=none;
        d=google.com; s=arc-20260327;
        b=B+5ZGaDiKXIx3Mw0RAMsTvuIEJNtjb0Ysm5Wpyl1MBGrOUXDSlXs9BDDj+I9JcwbFc
         /irPOXR7uVnkKvl1Gonlk5Ew0OTVoSOL70Yauv1fBSS5P+MrQBV0U+BEU/xsvQEW9BD+
         7MzDoi5ZmMcumS+MQ4hkmUo6aOZoZ4nYG8D+9isQOwGm2srn3FQ0RNRBwEJ4cO/QUyTn
         JHWDYEGbkFAtKfh1dIMjwQZm0LJESttz6EtC2VWk0K5EDSEcdvILcBTvHV2MCh4ksw83
         Fjuw3F1mnOvaNYF3Rgl0t+kDszL1r8d1J5s6BPhy08EpC+mG5jNwVLWPthsXW7PMsGdR
         ig8g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=lkVJzKo6e4lzm7YdG6O+XIlFAoy5nL8becDKZSEK67I=;
        fh=uA360uvxR9S0K/Y4Lovo7aIaGlBwzVBnnb2BKWupr/4=;
        b=C7C1u5ezxMUJ621KTVS7z2r5Obd3nIhHnfFuNBCiSUhVKngjCgaVs8WrGf3KhExPvK
         w7WKst+OBHDB7ShPAULAJm9c3CQvDxaNz1TqD/Kk2qIFGtSx4f1qNmGpGotve8gjk22q
         OrruDcLVPUCg1q6Fm6K0rUurq5wH91fz7RqxAG3tywgendnSEoXOmMPK0CI6eKnjMf20
         pf/Qac5MtVShp26v/B3he5nd8NmlcZNTsBGWhCMx4CQLVlfCFE6c+XjaiX8p63ArOPgf
         /M4vSz6ZcZenK2/li5S1M/Sc2EZ7JoKQfLqR9Sql7xrVc69QKwNmSRIw9hL3fGWYNtKG
         UAnA==;
        darn=lists.linux.dev
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1784663017; x=1785267817; darn=lists.linux.dev;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=lkVJzKo6e4lzm7YdG6O+XIlFAoy5nL8becDKZSEK67I=;
        b=SHglTSzNBjG4VfQYxpZIc6OURFEbWBH3Nb+UfJrxewrZdp1y+fLi1NAMJ9fkId6nrd
         XvuTFUnlDbC6nHLrz2CMMDgdbOcyPDGBpKpjCi/njdfuHsRksQG0W09tK3bXEAiv2WyM
         HBQq7EdVn/VGIuh6uF2LYQE1NAPnks65dVvWSjp8WGlbibFGoknaQ/49bvb7Ri2zlMvM
         yeo+pcT9kmeDXrWnLxkEwSUue9HpZMuwv2p6mCfJPUwz3eBp5peF8DJvGXBurCkCSJpQ
         PEC0gSl90UOmBislcFeso/wB58YPb3ZFsjgOiiZhNXPcNI4teskrKN80BF7ljayfE2D6
         5a0Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1784663017; x=1785267817;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=lkVJzKo6e4lzm7YdG6O+XIlFAoy5nL8becDKZSEK67I=;
        b=coJyThZziPKcPgHQS/GHtjHvQ3GytndFxCkiWODAzeOgCqt5OawvZKz/WCDkT6VMMj
         6dnoWnb+9GLP+nm71nBD/RP9MGAveeKPb/7qm4zJED/h6iEFmR7D4AfsIqdSxaovzuSW
         vV/Fo3QCMnwAAEoc3BH2W5K6Gfa2CK6wRLM13Kt90d7Xo2a5v4rcltzikaG4RTtgtju+
         fUx+OFwOJQHxYBYNNTREpue18kmKBDW74UY3CYKAO0Mf+fyK5ZIE0xJg04OPZ6DGrld2
         QwVwmdJ6XHAaAcZ+0cenk20yVMRUJ64992D3piq69/UYUP/8D2z9VWy0TJa7lqxu3ONZ
         lVVw==
X-Gm-Message-State: AOJu0YxDez9Ip/UO6t9P/Ontmm0zjbq2swWQBIeC0rvLh0ntJwsdKJUn
	TTiEa4x27iXBOOCG6q6+hfvbFW+ylQPMPVhIWKBp9l5pmX8UfsJ+agfzy/AKR+PfKn3fOP1zuEo
	MKAt3kFRXhQhTklZtHKi8i90mR6DLdxDoC38hkOk=
X-Gm-Gg: AR+sD13ZwC2CNKgq+x9yPOd4S69RchIWwSviuRdsg+g9SyDdThncc4P0KFLWAPRoW6k
	g6BBK4pesrW2SVVI5svOC9LGlbMwub+8xufdF8oibZF7kK+U8zBEF8WLRtlBjnB5Gn8J8PlPjiT
	fOLutWTfITsqeOReEg8eOKEvqXTI43jJDrUuLiI7J2CHEwomCzPmIwkiIMMrL/0aBAuF0+16yFB
	JSJerH7L/BAlZKNC21rX559UGkGjseDe4axiHggAUbtohndRxJ1+j/AO/XIwFbINwI0XX56lB/f
	poqpFwmxQ9WLvtQDBQ==
X-Received: by 2002:a17:907:1c2a:b0:bff:738c:7a64 with SMTP id
 a640c23a62f3a-c16b487dce6mr752859066b.49.1784663016824; Tue, 21 Jul 2026
 12:43:36 -0700 (PDT)
Precedence: bulk
X-Mailing-List: sashiko-reviews@lists.linux.dev
List-Id: <sashiko-reviews.lists.linux.dev>
List-Subscribe: <mailto:sashiko-reviews+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:sashiko-reviews+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20260721174909.8044-1-nickolay.lysenko@gmail.com>
 <20260721174909.8044-4-nickolay.lysenko@gmail.com> <20260721175857.DCF371F00A3A@smtp.kernel.org>
In-Reply-To: <20260721175857.DCF371F00A3A@smtp.kernel.org>
From: Mykola Lysenko <nickolay.lysenko@gmail.com>
Date: Tue, 21 Jul 2026 12:43:25 -0700
X-Gm-Features: AUfX_mxhuEeA4v_KINJ9pbWdnV-urNiDaBK_p0OmJd5Inr2XGNjBXpCpig2uaug
Message-ID: <CAMtxOX2Rw2PK6v+E07eE7n==CTJ_fn6iF+EyUOkyrJ=rUZPR5Q@mail.gmail.com>
Subject: Re: [RFC PATCH bpf-next 3/3] selftests/bpf: build each test runner
 instance in its own sub-make
To: sashiko-reviews@lists.linux.dev
Cc: bpf@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Tue, Jul 21, 2026 at 10:58=E2=80=AFAM <sashiko-bot@kernel.org> wrote:
>
> Thank you for your contribution! Sashiko AI review found 1 potential issu=
e(s) to consider:
> - [Medium] Parallel build race on shared helper objects (`testing_helpers=
.o`, `cgroup_helpers.o`) due to overlapping rules between the parent Makefi=
le and `Makefile.runner` sub-makes.
> --
>
addressed in v2:
https://lore.kernel.org/bpf/20260721194111.334795-1-nickolay.lysenko@gmail.=
com/T/#u

> --- Patch [3]: [RFC PATCH bpf-next 3/3] selftests/bpf: build each test ru=
nner instance in its own sub-make ---
> commit e06c43ef78e32188e09532ae20788ac48fd20702
> Author: Mykola Lysenko <nickolay.lysenko@gmail.com>
> selftests/bpf: build each test runner instance in its own sub-make
>
> This patch refactors the BPF selftests build system by moving the
> double-expansion DEFINE_TEST_RUNNER logic into independent sub-makes via =
a
> new Makefile.runner. Shared configurations and prebuilt toolchain element=
s
> are kept in the top-level Makefile.
>
> > diff --git a/tools/testing/selftests/bpf/Makefile b/tools/testing/selft=
ests/bpf/Makefile
> > index f5c0f81f61db7..a3ab525f7dfab 100644
> > --- a/tools/testing/selftests/bpf/Makefile
> > +++ b/tools/testing/selftests/bpf/Makefile
>
> [ ... ]
>
> > +HELPER_OBJS :=3D $(addprefix $(OUTPUT)/,testing_helpers.o cgroup_helpe=
rs.o \
> > +            trace_helpers.o network_helpers.o json_writer.o          \
> > +            cap_helpers.o unpriv_helpers.o usdt_1.o usdt_2.o xsk.o)
> > +
> > +# $(BPFTOOL) is a prerequisite because its sub-make is what installs
> > +# libbpf's internal headers (bpf/hashmap.h, bpf/libbpf_internal.h) int=
o
> > +# $(INCLUDE_DIR); without it, helpers including those headers race the
> > +# install and can silently pick up the source-tree copies instead.
> > +$(HELPER_OBJS): flow_dissector_load.h ip_check_defrag_frags.h         =
       \
> > +             $(VERIFY_SIG_HDR) prog_tests/tests.h $(BPFOBJ) $(BPFTOOL)
>
> [ ... ]
>
> > diff --git a/tools/testing/selftests/bpf/Makefile.runner b/tools/testin=
g/selftests/bpf/Makefile.runner
> > new file mode 100644
> > index 0000000000000..4c58cc51f2514
> > --- /dev/null
> > +++ b/tools/testing/selftests/bpf/Makefile.runner
>
> [ ... ]
>
> > +ifeq ($(RUNNER),test_progs)
> > +EXTRA_SOURCES :=3D test_progs.c cgroup_helpers.c trace_helpers.c      =
         \
> > +              network_helpers.c testing_helpers.c btf_helpers.c      \
> > +              cap_helpers.c unpriv_helpers.c sysctl_helpers.c        \
> > +              netlink_helpers.c jit_disasm_helpers.c io_helpers.c    \
> > +              test_loader.c xsk.c disasm.c disasm_helpers.c          \
> > +              json_writer.c bpftool_helpers.c usdt_1.c usdt_2.c
>
> [ ... ]
>
> > +EXTRA_OBJS :=3D $(patsubst %.c,$(RDIR)/%.o,$(filter %.c,$(EXTRA_SOURCE=
S)))
> > +LIB_OBJS   :=3D $(patsubst %.c,$(RDIR)/%.o,$(LIB_SOURCES))
>
> [ ... ]
>
> > +$(EXTRA_OBJS): $(RDIR)/%.o: %.c $(EXTRA_HDRS) $(TESTS_HDR) $(BPFOBJ) |=
 $(RDIR)
>
> [Severity: Medium]
> Could this cause a parallel build race on the shared helper objects?
>
> The top-level Makefile builds shared helpers like testing_helpers.o and
> cgroup_helpers.o with a limited set of dependencies (shown above). Howeve=
r,
> this EXTRA_OBJS rule inside the sub-makes encompasses those same helpers =
and
> declares broader dependencies, such as $(LIBARENA_SKEL) for test_progs an=
d
> map_tests/tests.h for test_maps.
>
> Because these broader dependencies are built in parallel by the top-level
> make, they can end up with newer timestamps than the pre-built helpers. I=
f
> that happens, both the test_progs and test_maps sub-makes might evaluate
> the helpers as out-of-date and concurrently recompile them.
>
> Can this lead to intermittent "file truncated" or "file format not recogn=
ized"
> link errors when building with -j?
>
> > +     $(call msg,EXT-OBJ,$(BINARY),$@)
> > +     $(Q)$(CC) $(CFLAGS) -c $< -o $@
>
> --
> Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260721174909.80=
44-1-nickolay.lysenko@gmail.com?part=3D3
