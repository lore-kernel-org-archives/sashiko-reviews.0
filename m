Received: from mail-pj2-f12.google.com (mail-pj2-f12.google.com [74.125.227.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DC8493876A1
	for <sashiko-reviews@lists.linux.dev>; Wed,  9 Sep 2026 17:39:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=74.125.227.140
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788975550; cv=pass; b=Rn2/8/je1LlbPTkr79SzP9vYIlSwqtk5R7Ff7F2GtvN/ZT13oXFMSN71wPRqbqBHzZn1CHVxD2iENfW/fEu7J9MPDqu5sAR8hmz5Uf9xRrFHwrBDhXWgLqkH7RcJBsBMfvpaNrlWyf9ZHqCUl9fV+ky8RAV3QHB9gzpxtMHjy3M=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788975550; c=relaxed/simple;
	bh=A+l2uOZiE885Clf82D9m4D6h5QCktWdZ0NdknyEO3+0=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Content-Type; b=MRxUz0fzsP0q6ixpfbqo36hoUx6EaWr3yCO4E7LwLdS2HvjVlV5cmvJMvkUHtRXONtu4z1xUxFri3zTDqOYpgPYd4QqX9hLMD+2iyJ90qPeLyOK99hyTvutW8NEj+7XAAplp1FthFIQWvSbqAlgSgwesJYpj2ZkGr4Ei+rvIvzw=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=qkhzlQzp; arc=pass smtp.client-ip=74.125.227.140
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="qkhzlQzp"
Received: by mail-pj2-f12.google.com with SMTP id d9443c01a7336-2db425c9050so173355ad.0
        for <sashiko-reviews@lists.linux.dev>; Wed, 09 Sep 2026 10:39:08 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1788975548; cv=none;
        d=google.com; s=arc-20260327;
        b=nLft+2vNS0Q5YHL/k9opkLvRP9Xr6dq3/a7vm7sNQvpMB246bsRbE9M0GbzsOkF6pr
         ZLmoCtttpPviygrftKcli2qh6WcWsQgL9dFWMv9MEReTMJ0U45OxN5VBx/JWlNNFw3xK
         GeJZLCpW7A2/P0ljfF2lQeylBzr0vL+svd2HavBpY5QjA2l49Rzw+J1X7vK1O//58ZEP
         LNo4eFbdKBVYMKCzE4TmDvrPeor1G76Pfvf4xo2zQ+nJfHp3a8rG+/SCqcX4THuVjfyY
         cZot3wCE+gWfipuyFRicSrB/wroNRSbwRRmJJ/AKn0FXzAmve9gCWaAjUcSlG7l8xb5H
         Q/Kg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=xqefN0TJHS4Mu2A0Sq3q9XaWe1ustzTMoTSehI/18YQ=;
        fh=P1Wteq84dTttNuKjmsOBuSleXWFl3xfz2JiEH5ZaCxk=;
        b=GGq1NyRbQ8qRSkxia7tTVFKm0zgZk3kwMIk1Kudb7D28nqSD/O07VQmFvX2owfgnMh
         JYoDHWbK8He+bXIEwQzicNgfZuRKNb+HtX8WGAz96K1ibdhcfnlNr+mP/i1MEoWxv++a
         5y++lbROy7tw2xBufPN8/A1n5gQcfLc0jS6ozj8iAPdspx+tHg1sINLFg9Ab9UZAUG3y
         ytaEcKATUdJyrUlsT8hjmWVtiyt3sx7uAJ/Jhr96U6uk+QckfbsW+T1H83HmEnEqNfWW
         uJmRkAYPIZMf68TEVfYOdsVgZQk9PWeDuBUyKz0sMmSs7DJyxq5Pc1Mr16H/TIgjRDP5
         rhig==;
        darn=lists.linux.dev
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20251104; t=1788975548; x=1789580348; darn=lists.linux.dev;
        h=content-transfer-encoding:content-type:to:subject:message-id:date
         :from:in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=xqefN0TJHS4Mu2A0Sq3q9XaWe1ustzTMoTSehI/18YQ=;
        b=qkhzlQzpf+ecnbTTGJSng7UlZQlfIc2Mk/dt/gsTnxDm/Bn033Zbx16OyUeG4BF1Ak
         goOI1uEFrsHx+sKkwqfs/4OFDlfb/gCIHfSQjlqmf42E7H7/RbsZHX76a2W7MwUuTLhC
         agSQ7O1l0cBjtr8N4eWJx2C7zGaAnvZyeYb8zHwx0/8K885zfs2fJn7VnKg2FoESBOeb
         UGZHLhOW6MJUzoTauNljvJs+IdtomLbW12hjO5CyHkzr7QmWW4zAmmDeawXRr/lhzfVe
         7aP1P/o0rZtOrys9BzEaGL2k3ZXNYKQbw8e2JWdkXR95ywznxVeB2FTmQLVN7xTqsg5l
         cBSw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788975548; x=1789580348;
        h=content-transfer-encoding:content-type:to:subject:message-id:date
         :from:in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=xqefN0TJHS4Mu2A0Sq3q9XaWe1ustzTMoTSehI/18YQ=;
        b=VqzImjRfu3Ww273dteSdxmi9D1MK3bRJKyy4OadO61r8/KvQU2whZF6z5Z98pl7OvM
         ClkOuv7Z4rJoCk1OCeVj0hbwnIRoSBQO82xuZlwMTivhsmt/X4/2nQQD76E/MXMthcTj
         5MsWEYQOv0KVYSeH/+4xmB+t6MRZqmxFRrfblEZLiTjnB6bcS9hm081ikh2o9I7193X+
         motBEYh2D13Q2i+y3NNsPkmduKdN4opQ1QCHrTGAb8mcz3tmv0GoJ15f1JBYtVfewK/Q
         ey7qdihdxnD2j8uSGRlw0xjGEXqFnLUxseiJiXFWZv9lBLtERZULxYm4+uJMHmU+N3BO
         By3Q==
X-Gm-Message-State: AFuF++lHw3deeyip3eW0nrJcDwxN+5mB6wnKCjG3o1U51QnbeE8baIvt
	KpQ1xPbH9OKLZheX0teHn16VMXVyRKty2/IoSYExlCqBW7njVJQe+ngtFmKb/VXmWoFpIVbHM/b
	Gp+N4d7bOULoz/Coqca1fA/pOG2ZlsjFeFUXGejqxwWwavlwrrKnBXiY1dYY=
X-Gm-Gg: AYBFou3Dp3f03zi8OWVYIeILRIIrsk7D+/0mB1GJwHA99VjPfVIvcAVyjcjIVefkzOh
	en7/7dsmsUOxPHPElE94tqva/XZquXlhHgxAyYq5o5Ck+9kLlPRNpD30QRNIddwR4i/0Go/6/c1
	W/hmKISZljZMpX4v1zVMGJ5rIe2a7+ZHWuc5PtycbdwzokpMtGV9lksNgXqLTz6DvuQx75D7OoW
	rqZxaHNpnzBa6TmswFymsbdQEYeWrp/Pnrj+zh7Ofso87MSwaP0Qk1rUW85waJOpaFuqG/66Rkr
	BJeKD6jQIOwcLZJmEJhxpq9vXcIuHFE0kAhU3CLMPQCRkW/sc8pBDAjqyf5lvXQcjY5bcVqp+H1
	D/dmusc4sGA==
X-Received: by 2002:a17:903:1b70:b0:2c6:99be:9dd with SMTP id
 d9443c01a7336-2dbddbd688amr10170995ad.12.1788975547398; Wed, 09 Sep 2026
 10:39:07 -0700 (PDT)
Precedence: bulk
X-Mailing-List: sashiko-reviews@lists.linux.dev
List-Id: <sashiko-reviews.lists.linux.dev>
List-Subscribe: <mailto:sashiko-reviews+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:sashiko-reviews+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20260903045603.3611902-1-irogers@google.com> <20260909161041.1745638-1-irogers@google.com>
 <20260909162119.3C3B51F000FF@smtp.kernel.org>
In-Reply-To: <20260909162119.3C3B51F000FF@smtp.kernel.org>
From: Ian Rogers <irogers@google.com>
Date: Wed, 9 Sep 2026 10:38:54 -0700
X-Gm-Features: AcwNN1VtpUq2iwGbfwZhfTfb7fEQ3-fUN2GBSLGLAPrq-5DAFa1B67Ny4mHwpMU
Message-ID: <CAP-5=fXUU266PHEhYJDXRJZv_XkGiRvGTR94fR+QEzFVKs=neg@mail.gmail.com>
Subject: Re: [PATCH v3] perf tests: Improvements to build-test performance
To: sashiko-reviews@lists.linux.dev, linux-perf-users@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Wed, Sep 9, 2026 at 9:21=E2=80=AFAM <sashiko-bot@kernel.org> wrote:
>
> Thank you for your contribution! Sashiko AI review found 1 potential issu=
e(s) to consider:
> - [Medium] The parallelization of the `out` target causes destructive rac=
es between `FEATURES_DUMP_FILE` and `FEATURES_DUMP_FILE_STATIC` within the =
shared source tree.
> --
>
> commit 8a5611d5732e412e746570eca199bea2894c319b
> Author: Ian Rogers <irogers@google.com>
>
> perf tests: Improvements to build-test performance
>
> This patch replaces hardcoded 'make' calls with '$(MAKE)' in the perf tes=
ts
> Makefile to ensure proper GNU Make jobserver file descriptor inheritance.=
 It
> also removes 'unexport MAKEFLAGS' in favor of native GNU Make conditional=
s
> for parallelism. Finally, it optimizes the 'out' target by wrapping the t=
arget
> list in a parallel sub-make call.
>
> > diff --git a/tools/perf/tests/make b/tools/perf/tests/make
> > index d2c2f526e1db0..4a865e58f2bea 100644
> > --- a/tools/perf/tests/make
> > +++ b/tools/perf/tests/make
> [ ... ]
> > @@ -383,20 +391,22 @@ all: $(run) $(run_O) tarpkg make_kernelsrc make_k=
ernelsrc_tools
> >       @echo OK
> >       @rm -f $(FEATURES_DUMP_FILE) $(FEATURES_DUMP_FILE_STATIC)
> >
> > -out: $(run_O)
> > +out:
> > +     $(call clean)
> > +     @$(MAKE) -f tests/make $(run_O) PARALLEL_OPT=3D O_CLEAN=3D0 $(if =
$(findstring jobserver,$(MAKEFLAGS))$(findstring -j,$(MAKEFLAGS)),,$(if $(c=
ores),-j$(cores)))
>
> [Severity: Medium]
> When the out target invokes this parallel sub-make for all run_O targets,=
 does
> this expose the feature dump dependencies to concurrent evaluation?
>
> >       @echo OK
> >       @rm -f $(FEATURES_DUMP_FILE) $(FEATURES_DUMP_FILE_STATIC)
> >
> >  ifeq ($(REUSE_FEATURES_DUMP),1)
> >  $(FEATURES_DUMP_FILE):
> >       $(call clean)
> > -     @cmd=3D"cd $(PERF) && make FEATURE_DUMP_COPY=3D$@ $(O_OPT) featur=
e-dump"; \
> > +     @cmd=3D"cd $(PERF) && $(MAKE) FEATURE_DUMP_COPY=3D$@ $(O_OPT) fea=
ture-dump"; \
> >       echo "- $@: $$cmd" && echo $$cmd && \
> >       ( eval $$cmd ) > /dev/null 2>&1
> >
> >  $(FEATURES_DUMP_FILE_STATIC):
> >       $(call clean)
> > -     @cmd=3D"cd $(PERF) && make FEATURE_DUMP_COPY=3D$@ $(O_OPT) LDFLAG=
S=3D'-static' feature-dump"; \
> > +     @cmd=3D"cd $(PERF) && $(MAKE) FEATURE_DUMP_COPY=3D$@ $(O_OPT) LDF=
LAGS=3D'-static' feature-dump"; \
>
> [Severity: Medium]
> Will these feature dump recipes race destructively?
>
> Since some run_O targets like make_static_O depend on
> FEATURES_DUMP_FILE_STATIC while others depend on FEATURES_DUMP_FILE,
> evaluating them concurrently means both unconditionally invoke make clean=
 and
> make feature-dump inside the shared source tree.
>
> Could this cause them to wipe out each other's intermediate artifacts dur=
ing
> make build-test out-of-tree builds?

As make_static isn't part of the "run" variable set of tests it won't
be part of run_O created by the foreach loop. make_static is only ever
run sequentially and so there can't be concurrent evaluation of
FEATURES_DUMP_FILE_STATIC.

Thanks,
Ian
