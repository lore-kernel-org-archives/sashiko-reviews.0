Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.160.179
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1792703607;
	b=tDhy8nI1JRBebEBSUQJ6o6MyFfq+3U/LEAOIcJjQrZFbnXNYopR+K1uruUDVq1YfADgt
	 klQlNRSsEh2/gJ5svsdjp0EZMRXczwZvXsD0O3io9XM4mnZE3KcQN1rqAXPGStnuxBU3/
	 YgNRFw4ub9Xirlh+8GJwwN0QqIRdHQYREKkuOS4JBF+21hJ8S+nzDcwAqdfQAxf4ohTLT
	 Vye46U+zWziZ1M8Re2xLpBMafXyNkZfX1ratj9rC5yf1TT5CYi41Qz2Nbin5NMAEQ5QGG
	 1wrkzotbm52/w8V4pn5AtXhwowzv2aE+n4NiJfu+oUJrYLMUmjD60X9IoUSLZMOp3nw==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792703607;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:MIME-Version:References:
	 In-Reply-To:From:Date:X-Gm-Features:Message-ID:Subject:To:Cc:
	 Content-Type:Content-Transfer-Encoding;
	bh=zu39K4rqHyOdUSQLpBVtVU0mWc6KejOhZ/J0gKovzv8=;
	b=mAvqCZ7db32+SdiKVMTK3ZdZJ30Ag1x0OQfUqUVwRcXcSOiesQ3hHQ0ffzlrLeWdOBjM
	 IQhbjfygPlo4RgkMYigJUgWoZeio/0d8bR5PUdZzfsfW+b6HuyHuJC8BPs3p+ApOjICdv
	 y8V3ph8O/nLfrDvzA2tgwGHqO+20Z1NZwaZgXj6M+HVy17+Vb7JU/CEZB5QZPeGmcrtYk
	 KYPGnJf4cIyp/KzKDtxzU/ANZjXhsVNc7wZdwyPDwcA3Q0PyrI1I+RzyJVgrnggyuT+/r
	 H7/SjDYVDghqOUPXZ2q5us73AuQj3mqt4lfKhPhxSnTxaezCWGK8418qr/LKdBcgEEw==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=google.com;
	spf=pass smtp.mailfrom=google.com;
	dkim=pass header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20251104 header.b=I4zKEnVh;
	arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.160.179
Received: from mail-qt1-f179.google.com (mail-qt1-f179.google.com [209.85.160.179])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 33456606A31F
	for <sashiko-reviews@lists.linux.dev>; Thu, 22 Oct 2026 21:13:26 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 33456606A31F
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20251104 header.b=I4zKEnVh
Received: by mail-qt1-f179.google.com with SMTP id d75a77b69052e-533202fe429so93711cf.0
        for <sashiko-reviews@lists.linux.dev>; Thu, 22 Oct 2026 14:13:25 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1792703605; cv=none;
        d=google.com; s=arc-20260327;
        b=HeMQXOtNNhpfG98oIPriJN3YMI27CFM/CYP0vxn9qJzmQcSx8uymAj5B9nRTfUAs9b
         7Lv0uZapXch+kNOCcgCR9XmJcMPzaH1+AquaFxGKt71CKcXBlXCx/+HenuGpVt362JRz
         z4GWSSVIege4/6kjgq86NQFFHdDtJ+CAs6vZwZHrqEs4lpidBDVucaudqiBluuYkXur/
         6lt9yIQYQsQgNdjySBEICKhfVtrMhBrubheZR25KnB0UqDGfyiTJ9KmzK5YBx3oEBjzj
         TxtTipsvUF9uW4q/iOi3J4loEeMvCvIIHvIzlNo58wrxkJMjqpk1WJlfWNIj4Ybf33Qj
         3j4A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=zu39K4rqHyOdUSQLpBVtVU0mWc6KejOhZ/J0gKovzv8=;
        fh=0zVHGC//SC94CWFKHtFt4lnskmkXkJNNy7lE0FDd3Ck=;
        b=D/lF4lxh0qYSI+XAFAL9ExthRD6O113MIqob2xRHqNp5o14Tui4nnThtU3G764O79I
         GzM8Dt4FWyyYwEN7zDhFl7DZ2MNj5JXPTts3uNMRczN3rwQunm4qQAlRMXnMm61yuuhS
         8e/g6PC92aowx6PM1PVMiFvOJ345zliF2T1G8gCmH105I3tb6hGVG9d9vTHrtYblzJFW
         HJcjklI82k6f16fWZzM5TZv7zO98mQRUWdbNFVmW+cl5/eSORTAyF+u0pirh3+WqmS3b
         fccZWzL+hKnjJ/T03Pi8+AhRoTbJZ3hqFB9kIYNOGsRyAl45lGizSUv/d62FL6KjXtAj
         bp8Q==;
        darn=lists.linux.dev
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20251104; t=1792703605; x=1793308405; darn=lists.linux.dev;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=zu39K4rqHyOdUSQLpBVtVU0mWc6KejOhZ/J0gKovzv8=;
        b=I4zKEnVhxXzIB30Ty75oCPvKP6CIz3ZUtrtaQh0yT5t3anLwPfjb8rOu28VciA+qmT
         3HxOSZChcpvELJtaYPgRwB1Jrwi1kXJG+RcTdRCHIygxEQQTsnvW0XNknCHzPjkBlk6E
         KaUMTs5G+bcEpCH+YQC7nzczHJE2H8B6FZEc49WAPMGKa30KpqF7ODO25ebLn6V6T//Z
         WOhZSflf/l64bYgjN/8GxLecIRoFhGWKSksTkElr2+NnSa/PaDb6zJSuwjFSX80IXeRD
         nkZiATT9CcYxnX5SYx0Q1+sGbXTFRX9wXIEM0Y9oC/sC7DYtsEsncNKsH6cUQLdp5vCe
         Jwfg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792703605; x=1793308405;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=zu39K4rqHyOdUSQLpBVtVU0mWc6KejOhZ/J0gKovzv8=;
        b=BxPSl2cG25/m+uazIWvOvb+gWp5s4KnXPJCSsxcHj6jVHc5COEA3naMAY/UJUC/dpi
         ZVZyOMiKyKJ3zvwJtBoIz6UgsvQc+ypap1ynvfC4egxNqD/VqYtnDjovt7nUyrNfdXOc
         mqh+DhvcKi9WPVBANo9VTZLZGSY23413KMQ8a9jHHTnMe/2TQdxiSuVNfG7338w7584m
         GBJ4Pkw5Zq6SrFOADqPukuzZuYCXNOkKuMDJZuDpdeJJUbGR77YUMqfzXIoi5utsr81e
         M2ahAnv+kZc7u9LasA3EZeTa3jHHNWx5TBiHoVoz47COi2oyxs5ugoLCNqmfIoDAKsU3
         2nHg==
X-Gm-Message-State: AFq9FYLUwDemQinFtT9K48FZPsOSFS8eDvKMJlCViu+Gel6YiqvOXoYn
	RLj13EMUPKy2gHplnORZMun3Kpg6F+id+RwAwj5JD7moFirj5bUKeQ0ZVp2hih4BwZQ0KXHz9Qg
	sp3Ky4KS3inJoAR8P0NCVwck1/mbtmc5nBVKlIJH4tv1s98xFtQPGVOVVCck=
X-Gm-Gg: AYBFou0EstCTE1X3EaxQsArNh0s1zFKVFF4bYKNc7G17pDIHgREhNuN+1yeEBOSgdg0
	L3BTDCtwfelH+M1uj4c5gHeKN8xUT3f7G+6fxT92R7Uh5/gA/Hnm5mN37A/mTQCocgErOLl2G7H
	ruvafqE4TEq/tS1/kJtPnsN5CrF12CQBIuWxxYa6fH6fPgrrVKIKUniTG06cg/B3jt6iLYR2Pr+
	9bgt9Nhup2DIMzuQ22VQ4bsDsmRUA2ZdPAkyYvKwvy0Qd6EXiFogOAE87bxuFqseYWuO4UMZdMy
	eRYspwR4OCSJwqTzgAZPoaXNORVavnBGM7seH1nvek/7KYjrZDGv3MOx2Wt5ednKLZS8nrfFrWy
	d/pKsYaLfnXf30w5pQiTdr5pgTcJIW0qcr8rjbwp1+7a/yeVCRS2jekMgqxjJ8fmcAw==
X-Received: by 2002:a05:622a:a0c:b0:532:eff8:3491 with SMTP id
 d75a77b69052e-536c1cf9c51mr1694561cf.14.1792703604321; Thu, 22 Oct 2026
 14:13:24 -0700 (PDT)
X-Mailing-List: sashiko-reviews@lists.linux.dev
List-Id: <sashiko-reviews.lists.linux.dev>
List-Post: <mailto:sashiko-reviews@lists.linux.dev>
List-Help: <mailto:sashiko-reviews+help@lists.linux.dev>
List-Subscribe: <mailto:sashiko-reviews+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:sashiko-reviews+unsubscribe@lists.linux.dev>
List-Owner: <mailto:sashiko-reviews+owner@lists.linux.dev>
Precedence: list
MIME-Version: 1.0
References: <20261021223905.715051-1-irogers@google.com> <20261022201453.1717523-1-irogers@google.com>
 <20261022201453.1717523-7-irogers@google.com> <sashiko-outbox-182008@kernel.org>
In-Reply-To: <sashiko-outbox-182008@kernel.org>
From: Ian Rogers <irogers@google.com>
Date: Thu, 22 Oct 2026 14:13:11 -0700
X-Gm-Features: AclHuK8_6jlQfZ8Ya1VQB1vC7VCbf2a5AGSMLdrz-LmFZTthd1zlfoA7b6te61k
Message-ID: <CAP-5=fVNh8X-zpHBf1PELH0KD_JudKsfADP2WQB7ScuzCK=ONA@mail.gmail.com>
Subject: Re: [PATCH v8 06/19] perf comm: Add __guarded_by annotations to
 struct comm_strs
To: sashiko-reviews@lists.linux.dev
Cc: linux-perf-users@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Thu, Oct 22, 2026 at 1:31=E2=80=AFPM <sashiko-bot@kernel.org> wrote:
>
> Thank you for your contribution! Sashiko AI review found 1 potential issu=
e(s) to consider:
> - [Medium] perf comm: struct comm_strs __guarded_by(&lock) breaks build o=
n Clang < 22
> --
>
> commit 5b99280fd6ec287f3ff5bbe3100d016159c309e9
> Author: Ian Rogers <irogers@google.com>
>
> perf comm: Add __guarded_by annotations to struct comm_strs
>
> This commit annotates the strs, num_strs, and capacity fields of struct
> comm_strs with __guarded_by(&lock) and __pt_guarded_by(&lock) for Clang
> thread-safety analysis.
>
> > diff --git a/tools/perf/util/comm.c b/tools/perf/util/comm.c
> > index 6343a3c9debed..9fc4e91a36e9f 100644
> > --- a/tools/perf/util/comm.c
> > +++ b/tools/perf/util/comm.c
> > @@ -16,9 +16,9 @@ DECLARE_RC_STRUCT(comm_str) {
> >
> >  static struct comm_strs {
> >       struct rw_semaphore lock;
> > -     struct comm_str **strs;
> > -     int num_strs;
> > -     int capacity;
> > +     struct comm_str **strs __pt_guarded_by(&lock) __guarded_by(&lock)=
;
> > +     int num_strs __guarded_by(&lock);
> > +     int capacity __guarded_by(&lock);
> >  } _comm_strs;
> >
> >  static void comm_strs__remove_if_last(struct comm_str *cs);
>
> [Severity: Medium]
> Does referencing the struct member lock inside __guarded_by(&lock) and
> __pt_guarded_by(&lock) on struct comm_strs fields in tools/perf/util/comm=
.c
> break the build on Clang versions older than Clang 22?
>
> In C mode (-std=3Dgnu11), referencing a sibling struct member inside an
> attribute on a struct field requires -fexperimental-late-parse-attributes=
,
> which was introduced in Clang 22. Without that flag, Clang looks up lock =
in
> file scope and fails compilation with an undeclared identifier error.

Thanks for the review, but I don't believe this is the case.
-fexperimental-late-parse-attributes is only needed when the attribute
names a member that is declared *after* the annotated field (a forward
reference). Members declared earlier in the struct are already in scope
when the attribute is parsed, and Clang has resolved those for
guarded_by/pt_guarded_by in C for a long time. In struct comm_strs, lock
is the first member, ahead of strs, num_strs and capacity.

I checked this with Debian clang 19.1.7 and 21.1.8, both older than
Clang 22:

  struct foo1 {
    struct mutex lock;
    int val __guarded_by(&lock); /* compiles without the flag */
  };

  struct foo2 {
    int val __guarded_by(&lock); /* error: use of undeclared */
    struct mutex lock; /* identifier 'lock' */
  };

I also did a full perf build of the series with clang-19 and WERROR=3D1,
removing -fexperimental-late-parse-attributes and passing
-fno-experimental-late-parse-attributes to force late parsing off. It
builds cleanly, so none of the annotations in the series rely on a
forward reference.

Also, -fexperimental-late-parse-attributes is already accepted by
clang 19, and Makefile.config only adds it when the compiler supports
it. With an older Clang, the probe fails and the backward references
still work. So I'd prefer to keep -DWARN_CONTEXT_ANALYSIS enabled for
all Clang builds rather than gate it on the flag.

Thanks,
Ian

> In tools/perf/Makefile.config, -DWARN_CONTEXT_ANALYSIS is enabled for all
> Clang builds even when -fexperimental-late-parse-attributes is not suppor=
ted
> by the compiler:
>
>   CFLAGS +=3D -DWARN_CONTEXT_ANALYSIS -Wthread-safety
>   ifeq ($(shell $(CC) -Werror -Wthread-safety-pointer -Wthread-safety-bet=
a -c -x c /dev/null -o /dev/null >/dev/null 2>&1 && echo 1), 1)
>     CFLAGS +=3D -Wthread-safety-pointer -Wthread-safety-beta
>   endif
>   ifeq ($(shell $(CC) -Werror -fexperimental-late-parse-attributes -c -x =
c /dev/null -o /dev/null >/dev/null 2>&1 && echo 1), 1)
>     CFLAGS +=3D -fexperimental-late-parse-attributes
>   endif
>
> When WARN_CONTEXT_ANALYSIS is defined,
> tools/include/linux/compiler-context-analysis.h expands __guarded_by and
> __pt_guarded_by to the underlying attributes:
>
>   # define __guarded_by(...)            __attribute__((guarded_by(__VA_AR=
GS__)))
>   ...
>   # define __pt_guarded_by(...)         __attribute__((pt_guarded_by(__VA=
_ARGS__)))
>
> Should -DWARN_CONTEXT_ANALYSIS in tools/perf/Makefile.config only be enab=
led
> when the compiler supports -fexperimental-late-parse-attributes, or shoul=
d
> struct member annotations be guarded accordingly?
>
> --
> Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20261022201453.17=
17523-1-irogers@google.com?part=3D6
