Received: from mail-pl1-f170.google.com (mail-pl1-f170.google.com [209.85.214.170])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C8DBF402B87
	for <sashiko-reviews@lists.linux.dev>; Tue, 26 May 2026 16:59:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.214.170
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779814797; cv=pass; b=onjVw4Dr4NwH4fn1MXhix5X81lIfNhdOsjMA9S3hn67RIeXOV63AuoUVaa7nWmtJYYIj3UNbZrQ8cJBvIRvwKFb0AsTjjyRYFq2JFUSLnJnd08jwvbgA5aFIDYCoXWFn+dQ2oTToVFzSsykY50qRIKHcH31a+T4NaXa2B4vmn/4=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779814797; c=relaxed/simple;
	bh=WZkvs3bev0qC/nipB5HxUTgW5bQClI/7XG/939lcsKg=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=hiETw0i9dp7xAbMNBFb2kHpuGpI7tDaFqkQcmtaIfZe1GTn7sXG3/ZuI1eXf0YA/4t61ETZaP+F9FrwsUNfUSPfPfoU+6sqP/XWqj0D6VkBvRSYmplS/yCMEqUy1uf6PEFwjwfJj8kDLMukcJE6UpdbKnL/kqB94uBHobnFFZ5E=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=O/Yk3lY+; arc=pass smtp.client-ip=209.85.214.170
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="O/Yk3lY+"
Received: by mail-pl1-f170.google.com with SMTP id d9443c01a7336-2ba180a022dso1605ad.1
        for <sashiko-reviews@lists.linux.dev>; Tue, 26 May 2026 09:59:53 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1779814793; cv=none;
        d=google.com; s=arc-20240605;
        b=hBaydQU5slBizSkhx6rIKTuwhzFK+kJcqTFKoT4FdL0bsWlYean3F3XF6Quu8xxINP
         GwTsZQvtYBNSatYGCzVgSvRhEN8RIqPwLoBNH4Wcq6zq/oCuYJZE+FuJxRfQ0BpHn8RK
         yFkalTgnN+69VP3akG3sxv9a5Ge8XcG0oWNry31G+SthxAmDP3eOMgkNebg0JATEMBMO
         20ysdiFBtK3uFnreHX7P/zbr2c6hySqz2uML3ohJXn5WdBKJXasvTEkfRmusQjI/Fq3V
         B/OFaMnBuc0haShLebNqBj4gyw1GAnx/yFR3mUK2t5X8+QV7eEEsY1LBAmpKV/cOVKQr
         2D4g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=vWiWq0NulcgqvDrKIIYI7AeTVlxrlXpp7vc3dk6gWPs=;
        fh=3UIqcPI3A5QYlO3aG+yc52giqhQtxqkLWSuxcF+0bF8=;
        b=jYRaHlTXaou2DyVzQvpwVcXemdhdu3oziN6yljLntLwJ+prUO5mtmsRLfMJWiTRAYw
         Pu18afL95s6mCaE1W0cl6am6wX2Zup0GI81mn0MrBaq1Q1YbaPJ1uP52if4EKZBK3Ut3
         v1vykSSHrl6Rx5DjEr62iJyGhJoNRdGatAh2EmuhV3WgcsPokYGPVJz+vfHCE4VP7BeS
         Yqnj46qbQkinqBFJ1r00Dw3M67UIgKiaY5cBV1VCQXz0Rrzk7iBYUUa1RfMGM2/ugS1l
         DAPuDcnLDXGFavYYGMNEcsoJn7p5VtjhkapaxBddEI/uB/PuXzqL4Mx9jWu+S/27HLBZ
         ayHw==;
        darn=lists.linux.dev
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20251104; t=1779814793; x=1780419593; darn=lists.linux.dev;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=vWiWq0NulcgqvDrKIIYI7AeTVlxrlXpp7vc3dk6gWPs=;
        b=O/Yk3lY+ipqdqDJF0+TkZzx2nD/8b1t4nwLyzz1seZiydQymwB6ll9dt9G5wYGVAu9
         +BUmcSInd3OkOWlCjqzzsIsxMSWZi830r6fF9cbGZ+nY+JHNnWLjSaUmQQiPyjIO63Tg
         LEeVN5orPCO+N1E7g0A/dNwYBD4nZpWWVRCum/iL02ko8oT9ZD0S8f6kZdCQfJuLktnQ
         ISCiGwU9M2kmz8eFXHjpUptloDhYf47eT2wixOLhToYLN/sDGo+SOJGJJLA+G6F5CBHi
         69ID2H7lg9T8YvqLPWYh0kq13qTmmKyztALWN2mZzNSRLJuGF+wU6KMC4qRpDqbkC1wY
         AK0Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1779814793; x=1780419593;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=vWiWq0NulcgqvDrKIIYI7AeTVlxrlXpp7vc3dk6gWPs=;
        b=jSevAXAS8zgioM/Xv8bq8P0xKsU8owWGPfAGDOv3Ppib4KN1fqFMmYNeKFqWE637Yx
         i65lbrN3JadO7fyn/7teudiNhE6wnc6OPoU0vIUe92VQ1nMnFLJnysvcK3KaS7gyxm8G
         EnxOZtiHsJ/SqC1945zZu3hteCGG2oNG9iq4TF1t6cNyz4kFOLlB/pgHk5057HII2ftT
         Q8SmTpDjhgyOIO2k+giR5nCakZUKjeuID5X0kI1zyH68gYTVs1fBdtZk4WZ2s8d43B+e
         maD4gBqi3yvgTN+wV5Ssc+lWB/aob/aXNWWmf6SdUTSZtl0wwMlguPeyGfgwVHDIVIhh
         d6oA==
X-Forwarded-Encrypted: i=1; AFNElJ8A2801fIHEdAJHxDezdDqsQyV4lW+sNdvTkGxOo88rl7XKeD02WVHkgkqOJpZLA6CTsXV4IwzCGoVqCODbSWM=@lists.linux.dev
X-Gm-Message-State: AOJu0Yw1DUQNAgkP/RSX9IUq7fcR1q1dWfMhQD411BnMF1WYq584Htig
	zVegLvbKCZ1C8pxs/KqD99zrQXkb19GtfbJD+yU9LgeB/+5nbMGMsFOT4oBxl+CWlMxc5THEWpI
	6gLA9EUnJx136C9OH4D+xJhNaFVF0lUWws1Q+/o4H
X-Gm-Gg: Acq92OHinoOIII+sdyH/FoFzaV+YkvF8gxG6qqN8O+abE5FOd215VYwm/qlZMXEEMyP
	B9qGnv2exV6zFhg/MkelXpkUm/r6+eKN2hwELhVVMgvYf3Y8NMboG3RhVvKrb0YTJlqpFXlAF5G
	r3Z8x3DvV/fvbLVLTos4/qQk4s0JII6SsspGkj0zpQ2XfrklwNJcv/hBmZ/aumunwmTWeOmIQeM
	cyYLxsnbBMUbsLy3tvVMafIHK1W3oUtZGH7+70VzQKBWhCRlaR6N0xL6y1HDG8Y/2MnkVYV+7h8
	tPOvu/OjdOmesb94/y7ibR3r0ItSW2IaGb+WZeUTgnompziF
X-Received: by 2002:a17:902:f706:b0:2bd:a61:8536 with SMTP id
 d9443c01a7336-2bebe9e94d5mr6474175ad.6.1779814792610; Tue, 26 May 2026
 09:59:52 -0700 (PDT)
Precedence: bulk
X-Mailing-List: sashiko-reviews@lists.linux.dev
List-Id: <sashiko-reviews.lists.linux.dev>
List-Subscribe: <mailto:sashiko-reviews+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:sashiko-reviews+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20260520125637.105681-1-japo@linux.ibm.com> <20260520130905.9C85D1F000E9@smtp.kernel.org>
 <ahJnMnOr4i9urrRk@x1> <ahV2XGx_6h7upuc3@li-276bd24c-2dcc-11b2-a85c-945b6f05615c.ibm.com>
 <CAP-5=fXGG5PR8neTkozvOUOH83m8_EyZXZ_A7Zyrsock5EqAiQ@mail.gmail.com> <ahXITNt0Z-n4NCaj@li-276bd24c-2dcc-11b2-a85c-945b6f05615c.ibm.com>
In-Reply-To: <ahXITNt0Z-n4NCaj@li-276bd24c-2dcc-11b2-a85c-945b6f05615c.ibm.com>
From: Ian Rogers <irogers@google.com>
Date: Tue, 26 May 2026 09:59:41 -0700
X-Gm-Features: AVHnY4LmLJBzV1k9Go06SgxSrWFmnXJjBWXm4pXUs6_yao5GukFZwF_YTa1b5iI
Message-ID: <CAP-5=fXcpoXMsezy1FNBX7mhKmRgw+97QmKTg5Fr6G-cY+wGpg@mail.gmail.com>
Subject: Re: [PATCH 1/1] perf build: Fix Python extension build with GCC 16 hardening
To: Jan Polensky <japo@linux.ibm.com>
Cc: Arnaldo Carvalho de Melo <acme@kernel.org>, Jens Remus <jremus@linux.ibm.com>, 
	sashiko-reviews@lists.linux.dev, linux-perf-users@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Tue, May 26, 2026 at 9:20=E2=80=AFAM Jan Polensky <japo@linux.ibm.com> w=
rote:
>
> On Tue, May 26, 2026 at 08:23:28AM -0700, Ian Rogers wrote:
> > On Tue, May 26, 2026 at 3:35=E2=80=AFAM Jan Polensky <japo@linux.ibm.co=
m> wrote:
> > >
> > > On Sat, May 23, 2026 at 11:49:22PM -0300, Arnaldo Carvalho de Melo wr=
ote:
> > > > On Wed, May 20, 2026 at 01:09:05PM +0000, sashiko-bot@kernel.org wr=
ote:
> > > > > Thank you for your contribution! Sashiko AI review found 1 potent=
ial issue(s) to consider:
> > > > > - [Medium] The patch explicitly allows text relocations in the Py=
thon extension shared object (`perf.so`) by adding `-Wl,-z,notext`, masking=
 the root cause of missing `-fPIC` flags and breaking W^X (Write XOR Execut=
e) security protections.
> > > > > --
> > > > >
> > > > > commit f3832fb0ad0d1f9c2e69039b2a5110f77d220d5e
> > > > > Author: Jan Polensky <japo@linux.ibm.com>
> > > > >
> > > > > perf build: Fix Python extension build with GCC 16 hardening
> > > > >
> > > > > This commit addresses a build failure in the Python extension cau=
sed by GCC 16
> > > > > stricter security policies regarding dynamic relocations in read-=
only segments.
> > > > > It adds the -Wl,-z,notext flag to the linker to explicitly allow =
text
> > > > > relocations in the Python extension shared object.
> > > > >
> > > > > > diff --git a/tools/perf/Makefile.perf b/tools/perf/Makefile.per=
f
> > > > > > index 76b35ac19acbf..eea170d6576db 100644
> > > > > > --- a/tools/perf/Makefile.perf
> > > > > > +++ b/tools/perf/Makefile.perf
> > > > > > @@ -749,7 +749,7 @@ all: shell_compatibility_test $(ALL_PROGRAM=
S) $(LANG_BINDINGS) $(OTHER_PROGRAMS)
> > > > > >  $(shell [ -d '$(OUTPUT)python' ] || mkdir -p '$(OUTPUT)python'=
)
> > > > > >
> > > > > >  $(OUTPUT)python/perf$(PYTHON_EXTENSION_SUFFIX): util/python.c =
util/setup.py $(PERFLIBS_PY)
> > > > > > - $(QUIET_GEN)LDSHARED=3D"$(CC) -pthread -shared" \
> > > > > > + $(QUIET_GEN)LDSHARED=3D"$(CC) -pthread -shared -Wl,-z,notext"=
 \
> > > > >
> > > > > [Severity: Medium]
> > > > > Does adding -Wl,-z,notext mask the root cause of the GCC 16 linke=
r error?
> > > > >
> > > > > The error regarding dynamic relocations in a read-only segment us=
ually
> > > > > indicates that non-position-independent code from the static libr=
aries
> > > > > is being linked into the shared library.
> > > > >
> > > > > Using -Wl,-z,notext suppresses this error by allowing text reloca=
tions, which
> > > > > forces the dynamic linker to map the executable text segment as w=
ritable at
> > > > > load time. This breaks W^X security protections and weakens the s=
ecurity of
> > > > > any Python process loading the extension.
> > > > >
> > > > > Should the required object files be compiled with -fPIC instead t=
o properly
> > > > > resolve the linker error without compromising security?
> > > >
> > > > So I asked Claude about this and he suggests doing like other parts=
 of
> > > > perf and using -fPIC, can you try to do that?
> > > >
> > > > ---------------------------------------
> > > >
> > > > =E2=97=8F Sashiko is right. -Wl,-z,notext is a band-aid that weaken=
s security =E2=80=94
> > > >   it makes the text segment writable at load time, defeating W^X.
> > > >
> > > >   The root cause is that PERFLIBS_PY (the static libraries linked i=
nto
> > > >   the Python .so) are compiled without -fPIC. When you link non-PIC=
 .a
> > > >   archives into a shared library, the linker needs text relocations=
. GCC
> > > >   16 correctly rejects this by default.
> > > >
> > > >   The proper fix is to build the static libraries that go into the
> > > >   Python extension with -fPIC. The perf build system already has
> > > >   precedent for this =E2=80=94 look for how libperf and libsubcmd h=
andle PIC
> > > >   builds. The Python extension's dependencies need a parallel -fPIC
> > > >   build, or the existing objects need to be compiled with -fPIC whe=
n the
> > > >   Python binding is enabled.
> > > >
> > > >   The -Wl,-z,notext approach would also cause issues on distros tha=
t
> > > >   enforce RELRO + BIND_NOW hardening, and some package builders wou=
ld
> > > >   reject the resulting .so outright.
> > > >
> > > > - Arnaldo
> > >
> > > Hi Arnaldo,
> > >
> > > thanks for the pointer. I double-checked this on s390x and did some r=
educed-link
> > > testing for the ET_DYN / Python-extension case.
> > >
> > > The failure is not triggered by the perf Python binding object alone.
> > >
> > > A reduced reproducer succeeds when linking:
> > >   python.o
> > >   + libapi.a
> > >   + libperf.a
> > >   + libsubcmd.a
> > >   + libsymbol.a
> > >   + libbpf.a
> > >   + libperf-ui.a
> > >
> > > The link starts to fail with:
> > >   /usr/bin/ld.bfd: error: read-only segment has dynamic relocations
> > >
> > > as soon as libperf-util.a is added.
> > >
> > > In my tree, libperf-util.a currently contains only perf-util-in.o, an=
d replacing
> > > the archive with that single object still reproduces the same failure=
.
> > >
> > > Reduced reproducer:
> > >
> > >   gcc -pthread -shared \
> > >     -Wl,-z,noexecstack \
> > >     -o /tmp/try-perf-util-only.so \
> > >     /root/linux/tools/perf/python_ext_build/tmp/root/linux/tools/perf=
/util/python.o \
> > >     -Wl,--whole-archive \
> > >       /root/linux/tools/perf/libapi/libapi.a \
> > >       /root/linux/tools/perf/libperf/libperf.a \
> > >       /root/linux/tools/perf/libsubcmd/libsubcmd.a \
> > >       /root/linux/tools/perf/libsymbol/libsymbol.a \
> > >       /root/linux/tools/perf/libbpf/libbpf.a \
> > >       /root/linux/tools/perf/libperf-ui.a \
> > >     -Wl,--no-whole-archive \
> > >     /root/perf-util-one/perf-util-in.o \
> > >     -lpython3.14 -lpthread -ldl -lm -lutil
> > >
> > > Inspection of perf-util-in.o on s390x shows many direct R_390_PC32DBL
> > > relocations from .text against .data.rel.ro, .data.rel.ro.local,
> > > .data.rel.local, .bss, and .rodata.
> > >
> > > Representative examples include:
> > >
> > >   arm64__associate_instruction_ops:
> > >     larl %r6  -> R_390_PC32DBL .data.rel.ro+0x2
> > >
> > >   loongarch__associate_ins_ops:
> > >     larl %r9  -> R_390_PC32DBL .data.rel.ro+0x22
> > >     larl %r9  -> R_390_PC32DBL .data.rel.ro+0x42
> > >
> > >   check_ppc_insn:
> > >     larl %r4  -> R_390_PC32DBL .data.rel.local+0x4c2
> > >     larl %r2  -> R_390_PC32DBL .data.rel.ro.local+0x22
> > >     larl %r1  -> R_390_PC32DBL .data.rel.local+0x2
> > >     larl %r2  -> R_390_PC32DBL .data.rel.ro.local+0x2
> > >
> > >   s390__associate_ins_ops:
> > >     larl %r10 -> R_390_PC32DBL .data.rel.ro+0x732
> > >     larl %r10 -> R_390_PC32DBL .data.rel.ro+0x752
> > >
> > > So from my reproducer, I don't think we can describe this simply as
> > > "all Python-extension dependency archives are missing -fPIC".
> > >
> > > The issue narrows down much more specifically to perf-util-in.o in th=
e ET_DYN
> > > link of the Python extension, and the direct text-to-data section rel=
ocations
> > > above look like the most relevant candidates.
> > >
> > > So I agree that -Wl,-z,notext is only a workaround. I'd prefer to und=
erstand
> > > and fix the underlying relocation pattern in perf-util-in.o rather th=
an merge
> > > that as-is.
> > >
> > > If useful, I can send the relevant readelf/objdump snippets in a foll=
ow-up.
> >
> > Hi Jan,
> >
> > I wonder about two tests:
> > 1) adding V=3D1 JOBS=3D1 to your make command to switch on single
> > threading and build verbosity. This may make it possible to identify
> > the gcc command that is missing -fPIC. For example, I see -fPIC on
> > x86:
> >   gcc -Wp,-MD,/tmp/perf4/util/annotate-arch/.annotate-arm64.o.d
> > -Wp,-MT,/tmp/perf4/util/annotate-arch/annotate -arm64.o
> > -Wbad-function-cast -Wdeclaration-after-statement -Wformat-security
> > -Wformat-y2k -Winit-self -Wmissin g-declarations -Wmissing-prototypes
> > -Wno-system-headers -Wold-style-definition -Wpacked -Wredundant-decls
> > -Wst rict-prototypes -Wswitch-default -Wswitch-enum -Wundef
> > -Wwrite-strings -Wformat -Wno-type-limits -Wstrict-alia sing=3D3
> > -Wshadow -fno-strict-aliasing -I/tmp/perf4/arch/x86/include/generated
> > -DHAVE_ARCH_X86_64_SUPPORT -Werro r -g -fno-omit-frame-pointer -Wall
> > -Wextra -std=3Dgnu11 -funsigned-char -fstack-protector-all
> > -D_LARGEFILE64_SOU RCE -D_FILE_OFFSET_BITS=3D64 -D_GNU_SOURCE
> > -I~/linux/tools/perf/util/include
> > -I~/linux/tools/perf/arch/x86/include
> > -I/usr/local/google/home/irogers/re pos/linux4/tools/include/
> > -I~/linux/tools/arch/x86/include/uapi -I/usr/loc
> > al/google/home/irogers/repos/linux4/tools/include/uapi
> > -I~/linux/tools/arc h/x86/include/ -I~/linux/tools/arch/x86/
> > -I/tmp/perf4//util -I/tmp/perf4/ -I~/linux/tools/perf/util
> > -I~/linux/to ols/perf -DHAVE_PTHREAD_ATTR_SETAFFINITY_NP
> > -DHAVE_PTHREAD_BARRIER -DHAVE_EVENTFD_SUPPORT -DHAVE_GETTID -DHAVE
> > _FILE_HANDLE -DHAVE_AIO_SUPPORT -DHAVE_SCANDIRAT_SUPPORT
> > -DHAVE_SCHED_GETCPU_SUPPORT -DHAVE_SETNS_SUPPORT -DHA VE_ZLIB_SUPPORT
> > -DHAVE_LIBELF_SUPPORT -DHAVE_ELF_GETPHDRNUM_SUPPORT
> > -DHAVE_GELF_GETNOTE_SUPPORT -DHAVE_ELF_GET SHDRSTRNDX_SUPPORT
> > -DHAVE_DEBUGINFOD_SUPPORT -DHAVE_LIBDW_SUPPORT -DHAVE_LIBBPF_SUPPORT
> > -DHAVE_SDT_EVENT -DHAV E_JITDUMP -DHAVE_LIBOPENSSL_SUPPORT
> > -DHAVE_BPF_SKEL -DHAVE_DWARF_UNWIND_SUPPORT -DHAVE_SLANG_SUPPORT
> > -DHAVE_TI MERFD_SUPPORT -fPIC -DHAVE_LIBLLVM_SUPPORT
> > -I/usr/lib/llvm-19/include -D_GNU_SOURCE -D__STDC_CONSTANT_MACROS
> > -D__STDC_FORMAT_MACROS -D__STDC_LIMIT_MACROS
> > -DHAVE_CXA_DEMANGLE_SUPPORT -DHAVE_LZMA_SUPPORT -DHAVE_ZSTD_SUPPORT
> > -DHAVE_BACKTRACE_SUPPORT -DHAVE_LIBNUMA_SUPPORT
> > -DHAVE_PERF_READ_VDSO32 -DHAVE_LIBBABELTRACE_SUPPORT -DHAVE_
> > LIBCAPSTONE_SUPPORT -DHAVE_JVMTI_CMLR -DHAVE_LIBPFM
> > -DHAVE_LIBTRACEEVENT -I/usr/include/traceevent -DLIBTRACEE
> > VENT_VERSION=3D67072 -DHAVE_RUST_SUPPORT -I/tmp/perf4/libapi/include
> > -I/tmp/perf4/libbpf/include -I/tmp/perf4/li bsubcmd/include
> > -I/tmp/perf4/libsymbol/include -I/tmp/perf4/libperf/include
> > -I/tmp/perf4/ -D"BUILD_STR(s)=3D#s" -c -o
> > /tmp/perf4/util/annotate-arch/annotate-arm64.o
> > util/annotate-arch/annotate-arm64.c
> >
> > 2) adding EXTRA_CFLAGS=3D"-fPIC" to your make command. This should forc=
e
> > this option wherever it might be missing.
> >
> > Thanks,
> > Ian
> >
> > > Best regards,
> > > Jan
> > >
> Hi Ian,
>
> I tested both suggestions the second in the beginning of my research:
>
> EXTRA_CFLAGS=3D"-fPIC" - Does NOT work. Same error:
>
> /usr/bin/ld.bfd: error: read-only segment has dynamic relocations
> collect2: error: ld returned 1 exit status
>
> The issue is s390x-specific R_390_PC32DBL relocations in perf-util-in.o
> (from `larl` instructions) that persist even with -fPIC.
>
> Current options:
> 1. Use -Wl,-z,notext (security issue)
> 2. Refactor code to avoid these relocations
> 3. Disable Python extension on s390x (not an option)
>
> Thoughts?

So it appears that part of the problem is declaring arrays and structs
to be const. Making things non-const I think is also not an option.
Would  EXTRA_CFLAGS=3D"-fvisibility=3Dhidden" help?

It would we interesting to build with -Wl,-z,notext and then look for
the symbol the linker is fighting with:
  eu-findtextrel perf.cpython....so
or
  readelf -d perf.so | grep TEXTREL
  readelf -r perf.so

Thanks,
Ian

> Best regards,
> Jan
