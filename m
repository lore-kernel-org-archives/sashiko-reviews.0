Received: from mail-ej1-f44.google.com (mail-ej1-f44.google.com [209.85.218.44])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 619792FF65F
	for <sashiko-reviews@lists.linux.dev>; Fri, 24 Jul 2026 04:28:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.218.44
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784867307; cv=pass; b=d2KKKVaJMxqUmptqvKCIR9Y89HEOisfd+22/iWVb6227QGi/EIN2hynQGBdWq1ATD2hdFI5ZrtrrAwBY6VwpJOSIlsldQmQqSzMBym8yV4ltepYOwAXRpRJ2I0uKArd6O17nM1DHMqEuVh0bCSdRrLsp4r626KmOQX1oLMri25w=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784867307; c=relaxed/simple;
	bh=MyPDn4eooePolahvWlF1muKvZlIemQXxt01XJY8Q680=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=afzg8HYhqitSTW9RkoHEOzKZlAnlqgd4JMIjHxt1MbqjdOnSOxF6XqwkouhFc5hvyKJ7ngzXssq/A0nKfuS4q3kGDOaJWH9aAx0YmQJWYHilF5uiiGc2Lbx110hxX25rh+TVUmm9TqSpk3obrtb16G3Kd5T/zCuz78bmGExTwfI=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=apwxq++L; arc=pass smtp.client-ip=209.85.218.44
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="apwxq++L"
Received: by mail-ej1-f44.google.com with SMTP id a640c23a62f3a-c15e03c2763so2744966b.0
        for <sashiko-reviews@lists.linux.dev>; Thu, 23 Jul 2026 21:28:26 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1784867305; cv=none;
        d=google.com; s=arc-20260327;
        b=i4GDh7lpm73qD+EZ/CN6wME1I7WhPEN6xGqvqZUtKHaePB8x0HGomHf8c/wROYiNUz
         qUGSKuzpFK+woOALmUcWU6oRA++pm8EXK0F6llK60IbiPNJM1wogI3P0dAnD4oKBDYRy
         4RDror0TrScs9WEP2Arvi0nGGBSK9H0G7EhKbSl0pKNzK6B8QuaNWuB3QiPJB3MqADER
         Nz/P+l0wTFOY71hZVHXoZeZaq2bl8RC8OBxOb9j3aPjBGNlTTQvNk7CRZJf4VcX5cDGR
         sNnczYYr3G9c6/URLg7QvpaGmsgd1OzIItCvljSHu1fSbERjAPEnaeyjYxsvmcgz+aDs
         388A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=bsCAxnqusFzsOq/kKmF0UBtYjQK+mfSaqLYWf8TgnT8=;
        fh=uA360uvxR9S0K/Y4Lovo7aIaGlBwzVBnnb2BKWupr/4=;
        b=OJKKyefmK7Ur10HcF0F+gI/vDWYL1uCZri7Vd6kkTGu8BFv6nf+HUL2BO1WbeYoJrg
         WB4Ts3//wda3utE+M2PfDWORwsZNPPTjyrvpdnEcC7HMv370UimoZvNc93UhryHcAueY
         /a1DXJ6ih8yEjgH3ejnY/Zr4FtFmwmtF9YJ1e4AwxYSh6MOYZn298YXkYX1/9vFsQ2Ha
         INvoSv+5eA+CoLVfOLAr1PzhIgpBmyvNe1aly0d2N3QjWkb8acpFlQNfBEXlX3zKSE6U
         bb7ejvtpCrLxeyoA+dE/MZkuoBmWZM8pe1yMickO8YNiVzPrtSRIQ8ZtJ4grt1LZCHeZ
         mInQ==;
        darn=lists.linux.dev
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1784867305; x=1785472105; darn=lists.linux.dev;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=bsCAxnqusFzsOq/kKmF0UBtYjQK+mfSaqLYWf8TgnT8=;
        b=apwxq++LqHzPUTwiY+Nutcr6MZaeYRcIpVEH3Rwb7Aj5GVuddC2nde1zzuXgcmcsqw
         Z4zzbtW6tzUblzbgSXnXzlge/a2tdus7RXhZJveprE3POK2I6j6NVK07tN6MGmtVAjPA
         WZ3+IU672JiYPhV4vShAOcV5JxBbmAPQnO+IdlW8iQ95a2c9+VBMDbUQvJiyR7OSar0z
         2VRlis+tlso3YVeA3wb4gGc48FEv8e7rxlNdkStOGioc8eBfUOCJW71Z9jDzy4zKfmjb
         I0nF2P4Wh1cQOg1cVQJ2tRcdKbP12fQukAUpuwbnaAffeDNRwsxFTkukwgGUmzEUyLyh
         74sA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1784867305; x=1785472105;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=bsCAxnqusFzsOq/kKmF0UBtYjQK+mfSaqLYWf8TgnT8=;
        b=q322UMLcN/zPRtqqLQoeshRWGuN76kbFWOnYgxXHr5x17FHT43HdAR1+EkRB8HrAVc
         jF1Hm93ztGynK6TDVVlMDEeU525NrUKktYM3dEyo9yNCuURs6zndPauRnkw1GjeSBAUQ
         A+QOYox/zJ89MDuW6FTCmDSSDGX2GEu/i9WEQXj3kFZxl46iQA5Jfb1zdKfFdHFTgUVJ
         Xv2a7zrcw+J107LCmesRk1mE7aNzm/EMVXzXbr1C8dqYxbdObhKX7EX8j2a4TI3GJw5m
         xDyoxFDlgn3foEFCzM1tgU04IJRmNsjjuNFhAC+ZIPFXFtwK6kCQGtE92FJabBYCD/eD
         /mlQ==
X-Gm-Message-State: AOJu0Yzcr5IladtvYPtdXn80AKGPR7lB/t//nEbv2sAQuXFMHsFZJixr
	j8ae67cLcZnUwov+FHEnmoGiFqD9qW5RooIM00bsnRp7Udx617jDMFxq4SprrIE+bkjIOh+t/kG
	tRdIFwferMd2nz5wSOMydepMmcaIkXzb1YRYvRX4=
X-Gm-Gg: AR+sD12/TkZd+x8GN6721jzPdUqc227pZD8ZXgPndLqQFLOH2AyYDsy6Hx+S/WAgk5m
	GHyxC8PWWE6bs8AE9qFipxkQJc0tKuG1grtG5TfwdvKcFuYMdEygLiIxFaP1k2ZZF04+uc/nBRr
	7rgGc6f+fixqfixy2vnqB0oTHsUQGxOFlpSEKysNLTmPkg+t7InDOkzWiwwgIuzPmgbxhxKZlFY
	/RBLIqxsRdgZXoi+JjBqHkqpcfWVkwYtOFDJxZjAT5cs2m1k1ev02+NZZqbnC747SRc+v4P+fzS
	kSVj2sj8gvhWpb8TBjw=
X-Received: by 2002:a17:907:7246:b0:c15:ee17:47a with SMTP id
 a640c23a62f3a-c1c537e0bd6mr227777066b.15.1784867304541; Thu, 23 Jul 2026
 21:28:24 -0700 (PDT)
Precedence: bulk
X-Mailing-List: sashiko-reviews@lists.linux.dev
List-Id: <sashiko-reviews.lists.linux.dev>
List-Subscribe: <mailto:sashiko-reviews+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:sashiko-reviews+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20260721194111.334795-1-nickolay.lysenko@gmail.com>
 <20260721194111.334795-4-nickolay.lysenko@gmail.com> <20260721195155.B78721F00A3A@smtp.kernel.org>
In-Reply-To: <20260721195155.B78721F00A3A@smtp.kernel.org>
From: Mykola Lysenko <nickolay.lysenko@gmail.com>
Date: Thu, 23 Jul 2026 21:28:13 -0700
X-Gm-Features: AUfX_mz1ry_NYVT2qajIRIsr5RtNG0YgQuCj-21T2ekm8QsXLd2o0xSsYZTZuzg
Message-ID: <CAMtxOX3S0VGWwVV7RGQ8nr+S8ByxsEMSkzGNCYCa05tE_q98VQ@mail.gmail.com>
Subject: Re: [RFC PATCH bpf-next v2 3/3] selftests/bpf: build each test runner
 instance in its own sub-make
To: sashiko-reviews@lists.linux.dev
Cc: bpf@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

addressed in https://lore.kernel.org/bpf/20260724042600.175440-1-nickolay.l=
ysenko@gmail.com/

On Tue, Jul 21, 2026 at 12:51=E2=80=AFPM <sashiko-bot@kernel.org> wrote:
>
> Thank you for your contribution! Sashiko AI review found 1 potential issu=
e(s) to consider:
> - [Medium] In permissive mode, test objects are treated exclusively as or=
der-only prerequisites, which completely breaks incremental test developmen=
t by never relinking the test runner when test sources are modified.
> --
>
> --- Patch [3]: [RFC PATCH bpf-next v2 3/3] selftests/bpf: build each test=
 runner instance in its own sub-make ---
> commit f7cbf6f3b146270d8f7ba71d9ea0557ab2070208
> Author: Mykola Lysenko <nickolay.lysenko@gmail.com>
>
> selftests/bpf: build each test runner instance in its own sub-make
>
> This commit refactors the bpf selftests build system to use a dedicated
> Makefile.runner for each test runner instance, running them in separate
> sub-makes. It aims to eliminate double-expansion complexity while fixing
> parallel build races.
>
> > diff --git a/tools/testing/selftests/bpf/Makefile.runner b/tools/testin=
g/selftests/bpf/Makefile.runner
> > new file mode 100644
> > --- /dev/null
> > +++ b/tools/testing/selftests/bpf/Makefile.runner
>
> [ ... ]
>
> > +# In permissive mode, link whatever test objects were successfully bui=
lt
> > +# (their compilation may have been skipped); the wildcard in the recip=
e
> > +# picks up the survivors at link time.
> > +# Prerequisite order is also link order (test objects, extra objects,
> > +# libbpf, lib objects).
> > +$(OUTPUT)/$(BINARY): $(if $(PERMISSIVE_TESTS),,$(TEST_OBJS))         \
> > +                  $(EXTRA_OBJS) $(BPFOBJ) $(LIB_OBJS)                \
> > +                  $(TRUNNER_BPFTOOL) $(OUTPUT)/veristat              \
> > +                  | extras $(BPF_OBJS)                               \
> > +                  $(if $(PERMISSIVE_TESTS),$(TEST_OBJS))
>
> [Severity: Medium]
> Will this break incremental test development in permissive mode?
>
> By placing TEST_OBJS exclusively after the order-only prerequisite pipe (=
|)
> when PERMISSIVE_TESTS is active, make is instructed to not rebuild the ta=
rget
> when the test objects are updated.
>
> If a developer modifies an existing test file while using BPF_STRICT_BUIL=
D=3D0,
> the test object will successfully recompile, but the test runner binary
> (like test_progs) will not relink to include the new object. Does this ca=
use
> stale tests to be executed unknowingly?
>
> > +     $(call msg,BINARY,,$@)
> > +     $(Q)$(CC) $(CFLAGS)                                             \
> > +             $(if $(PERMISSIVE_TESTS),$(wildcard $(TEST_OBJS)))      \
> > +             $(filter %.a %.o,$^)                                    \
> > +             $(LDLIBS) $(LLVM_LDLIBS) $(LDFLAGS) $(LLVM_LDFLAGS) -o $@
> > +     $(Q)ln -sf $(if $(FLAVOR),..,.)/tools/build/bpftool/$(USE_BOOTSTR=
AP)bpftool \
> > +                $(RDIR)/bpftool
>
> --
> Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260721194111.33=
4795-1-nickolay.lysenko@gmail.com?part=3D3
