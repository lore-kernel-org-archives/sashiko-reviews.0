Received: from mail-pl1-f170.google.com (mail-pl1-f170.google.com [209.85.214.170])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A5D8837FF79
	for <sashiko-reviews@lists.linux.dev>; Wed,  3 Jun 2026 15:22:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.214.170
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1780500161; cv=pass; b=WP4QLU67zjEhm8Jgz7kgj98YZCwI5BVIEJgKW62viWlaGRcxno4mbqggdJdS2WqN0QMaTSN1PlaEhpv+tANTmh3zN/+1i7O/rrkrdTdqlIn/tWLRMdlfCuOYw9DMjEb+GvmEThmqtyqXf8OBxBYXk68CoaXBwyLbcNbt7vdWVyU=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1780500161; c=relaxed/simple;
	bh=ZjY6fQ+OkNX+QIentfTAZom0dvP2zmSMpC0L4vEq+8w=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=j91bgdSpi8IIr2fUtMV2xQjPyglFbx1vIq6xLpHDbxIQXLZxmFHUemBxM0gj1ZkTRWxHWo0uMsbJ1TZDCf4GxDY3IAplbCpiARJqZO1hN59S9G6CmBIp0T6SrkTdAZ407EdS3WVoF3n7s7z8CMH04uoddKbx0ySk1yYfAwOorv4=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=lAzqs7Nq; arc=pass smtp.client-ip=209.85.214.170
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="lAzqs7Nq"
Received: by mail-pl1-f170.google.com with SMTP id d9443c01a7336-2c0b1a48855so99165ad.0
        for <sashiko-reviews@lists.linux.dev>; Wed, 03 Jun 2026 08:22:39 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1780500159; cv=none;
        d=google.com; s=arc-20240605;
        b=fmvpZr29iSqIuNju64fxvXQmc928Xa+DfOrKSZqVoMSw0amakSyiyA6/ObnqbanS/T
         AmID9OB/kFVX3UgfTTcmDkalUrcdbwyHAxuXxtTkQindEJ9kIgrTJleT6b9xbg7g+z6Q
         Jt1NSh79D0v7jMP9nlgm8OBs97kvkqMYP6/uDUjPgLAydb9e6tSl7sNh57z6nGvk7ph6
         5CEZU4xgBb8xzgg78XC3nLgIKkfOll7ZJHdnEOaGEyoUKjPkuNALP5147dfTWnyE1QIv
         LQ4/yPTFuzfNWNylmDFKAXP7a8rt2/pkmgLE4EWRY7T8Ax/v6Sc4o9YJVaL6wcKFp6Bv
         8HTQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=IXS7+Fhu66wBwMI3PFTaspq6nORkh9aykIM9GFqLrSU=;
        fh=bY97AVgRX8PJu2Y0SVpepGoj8oIDK1bJYhWLAKj245M=;
        b=aAKgOdESLf6j8EqGHunydLt7GKZx2QAnMWTI78+WsvAd7igxbSY44KI2bHzoXdl+mo
         YGNF0FtqzGpl/Tu8ITSkiUAAGCRYihZD00mwhR9H22J9B7EdSCMePSdhhEZhkli4Muyb
         G9b4jBuMjQN50mQC0j+tBBfQ8izJGFERWawTygeeyKsE+0VAfCTuXEIZ1DBAwJivhmSQ
         eevCKhpEyVV10JSk+PVpX4OK1dPj2zGics6NyMbgcIljhvPuS8MyZVbnCPqngBTHbsqB
         4bQh04nqdk4gDf4zm9Za0RWyTcigm/Ii79IK4JaJpgOJ5gqDN+gXTVyDl+nVdw161OM8
         SoZA==;
        darn=lists.linux.dev
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20251104; t=1780500159; x=1781104959; darn=lists.linux.dev;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=IXS7+Fhu66wBwMI3PFTaspq6nORkh9aykIM9GFqLrSU=;
        b=lAzqs7Nqc8YYzze9uUszztkXbRilQUQOP1d35zdzPoEXy73RNoMX/GlVt3W7vifNh0
         Gdphkb35O6jhZ3bLcx+0403uIy3TcO/8DGjY6ivkU8eAxoe4Ngdrd3B+5mqSeo8V8o1i
         voaknDdlBOgKSghwPg2oP7Gpaa3wNIWllE/7pzlrtLb3JQiILEUn5Hjs7S1+JZJvfN7a
         YbDlaBxMEzyjYHXxg8vvRHzCuW29mn8ZH2vGB/r/1dIQTICJMhF9ax41tiK/9gn4vtBL
         HMAOnl5oobQsGyijIwzIu7iEDUg8wTWJCgHESaL+B+BvRyg9RgxbOYhyGCBuXpHQxAL9
         O+2w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1780500159; x=1781104959;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=IXS7+Fhu66wBwMI3PFTaspq6nORkh9aykIM9GFqLrSU=;
        b=Gk8rwrgRtI4ulrC51IgFf5CkNoheuDcmCx1iAVxFo4O9EWA3t83jA8dsN1j9+JZpYe
         fFHdi4vxgx8EGLuqhnjOuPZ/0R6dyj7aHpbmHboRKQQ2Z3Lx3qwVw2WfGZZ3d/SxHD5k
         D7b2oMl7bbB1U06jWBQ6/3YINpAebiDFcFlN557LBPW8PN1RiKx0/uul0BlnVneNWtzX
         vJ2hWA7z5S6Oy19nzTIfJNUsXfcmZAoDBoo+uax63r4/SQVEfqDvCyeDoEGEUa7Z1uJN
         gQSI95O3C/wrFzEXLWntDkGKw1gB77n6gLURpzxpzVjRzJDn4asZcZWhzX9c3yZFj6eI
         xITA==
X-Forwarded-Encrypted: i=1; AFNElJ/d75KlFrDSy3e0eYJmC2iHhtjhSDFOOgLpyseN9VfjVSwFJoEjHnUVvZYAibnYQ/8vFzvLgfL0hY0p4gKLNgo=@lists.linux.dev
X-Gm-Message-State: AOJu0YxIWe+QLsPdl55VQzZL5jr+FrJoccuKv553lyMoqcdg7/mlPEh8
	E2uHj4sUY5M7ikgy+G/qlcFXrQsIWM1sTg7c74sIRAzmdsvLFRYDUBa5NDzSxK/iK75mW+58ccL
	98abJG5s2rRC0FDgDpW0SJd+1kzbSos5Qvlduft/+QMyzii32h+ngSPyU1aw=
X-Gm-Gg: Acq92OGOyHO4ZGqM+KSbvNNqyP0Kz0fWc8c87a6duRL3kog+e29uV09YK1cXmVVEGP0
	s+sKjtTe3O03XTETWmkT7/KlTaCgN4dJ1dwCqOUNJ1fQuvSOUTD2D/b8f+HwEkZarRvRnXPFz1/
	gMnvV2WLricoqzz6Xe8hce3Z7iwfiUeM13EgmNP76bAXVM5EQ74gUUdWI4U+6jXQVrVwCUqk8X3
	km7EKybHMh5YmBAHaeLpZcqwQoGaKHYJRJaKrLdvMj/l5RaVKxWMMi5evJGSZc7ORx3ySnWYTPc
	yVXusT718sSSC7oXouRDtcF0tMCzDztwFJpL4yC+1+fd/i9v
X-Received: by 2002:a17:902:cec7:b0:2bf:1153:54a0 with SMTP id
 d9443c01a7336-2c16fb3ed38mr1992775ad.23.1780500158452; Wed, 03 Jun 2026
 08:22:38 -0700 (PDT)
Precedence: bulk
X-Mailing-List: sashiko-reviews@lists.linux.dev
List-Id: <sashiko-reviews.lists.linux.dev>
List-Subscribe: <mailto:sashiko-reviews+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:sashiko-reviews+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20260520125637.105681-1-japo@linux.ibm.com> <20260520130905.9C85D1F000E9@smtp.kernel.org>
 <ahJnMnOr4i9urrRk@x1> <ahV2XGx_6h7upuc3@li-276bd24c-2dcc-11b2-a85c-945b6f05615c.ibm.com>
 <CAP-5=fXGG5PR8neTkozvOUOH83m8_EyZXZ_A7Zyrsock5EqAiQ@mail.gmail.com>
 <ahXITNt0Z-n4NCaj@li-276bd24c-2dcc-11b2-a85c-945b6f05615c.ibm.com>
 <CAP-5=fXcpoXMsezy1FNBX7mhKmRgw+97QmKTg5Fr6G-cY+wGpg@mail.gmail.com>
 <ahddRWPBk46HiR6x@google.com> <CAP-5=fU8HLj73_FJJfzAF2pVnu8KentCWe4cLWbrjJa5ihRGfg@mail.gmail.com>
In-Reply-To: <CAP-5=fU8HLj73_FJJfzAF2pVnu8KentCWe4cLWbrjJa5ihRGfg@mail.gmail.com>
From: Ian Rogers <irogers@google.com>
Date: Wed, 3 Jun 2026 08:22:27 -0700
X-Gm-Features: AVHnY4IDwd410SWcTTt8MXyZnDLhkzJUmRu62LLuYKbnF91nRhMxlwjLWIAbCuw
Message-ID: <CAP-5=fVLPp2BF4gp5yM4Nwf1mK6Lp34bHxqKvEBf9B5orVu3dA@mail.gmail.com>
Subject: Re: [PATCH 1/1] perf build: Fix Python extension build with GCC 16 hardening
To: Namhyung Kim <namhyung@kernel.org>, Jan Polensky <japo@linux.ibm.com>
Cc: Arnaldo Carvalho de Melo <acme@kernel.org>, Jens Remus <jremus@linux.ibm.com>, 
	sashiko-reviews@lists.linux.dev, linux-perf-users@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Thu, May 28, 2026 at 2:55=E2=80=AFPM Ian Rogers <irogers@google.com> wro=
te:
> So what I think the problem is that:
>
>   arm64__associate_instruction_ops:
>     larl %r6  -> R_390_PC32DBL .data.rel.ro+0x2
>
> points at the arm64__associate_instruction_ops code:
> https://web.git.kernel.org/pub/scm/linux/kernel/git/perf/perf-tools-next.=
git/tree/tools/perf/util/annotate-arch/annotate-arm64.c?h=3Dperf-tools-next=
#n79
> ```c
> static const struct ins_ops *arm64__associate_instruction_ops(struct
> arch *arch, const char *name)
> {
> struct arch_arm64 *arm =3D container_of(arch, struct arch_arm64, arch);
> const struct ins_ops *ops;
> regmatch_t match[2];
>
> if (!regexec(&arm->jump_insn, name, 2, match, 0))
> ops =3D &jump_ops;
> ```
>
> jump_ops is declared extern in disasm.h:
> https://web.git.kernel.org/pub/scm/linux/kernel/git/perf/perf-tools-next.=
git/tree/tools/perf/util/disasm.h?h=3Dperf-tools-next#n117
> ```c
> tools/perf/util/disasm.h:extern const struct ins_ops jump_ops;
> ```
>
> Since `jump_ops` is declared `extern` and would be patchable in a
> shared DSO (i.e., the Python module), GCC is creating relocations
> within .text that fails W^X checking in the linker. To prevent
> jump_ops from being patchable in this situation we can change its
> declaration to:
> ```c
> __attribute__((visibility("hidden"))) extern const struct ins_ops jump_op=
s;
> ```
>
> but it is probably easier and more generic to add -fvisibility=3Dhidden
> to the CFLAGS in Makefile.config. I asked about this behavior as an
> EXTRA_CFLAGS option, but I'm not sure if Jan has tested it yet?

Hi Jan,

Did you get a chance to see if the hidden visibility would resolve
this issue? I can propose a patch (or someone else can) to add
-fvisibility=3Dhidden to the CFLAGS in tools/perf/Makefile.config.

Thanks,
Ian
