Received: from mail-qt1-f175.google.com (mail-qt1-f175.google.com [209.85.160.175])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9D92D306746
	for <sashiko-reviews@lists.linux.dev>; Mon, 10 Aug 2026 05:41:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.160.175
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1786340506; cv=pass; b=oUM0S6rAkxUs3i8Npt02YGiY3OZzx0NqSVF1Ht6GpWVG2E0Kr0MgR6h4wVbXMJ+gmSrCVaWUA+sLgWcASEf0R+zro7/kakNUpmXe5YZx+UW+XOLOQNe/nJiS/O8jbWTG8eh+9L4NUaz688BhkeqkV08UuZ/l8R6BulmmP9H9Ifo=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1786340506; c=relaxed/simple;
	bh=IwTUVX1vwSCi8tBUvA3x0u0h7rk9D3cTbqAFDNJpQhY=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=CTELiLShozGZOLQIHtmrkvOuaLNwxOpWYRRARtPw6teApa77GQsX5BGjKC9+2UyuOKQkYCzCebabDHFP+4HWDoX+pzgh7m6uJha8ANVpSfQ7zbcJy55lpc6p/7kvYq/+B1r9RR7OkP6eKPuqNQR1gCAjm0MvGglR6BmA1NIJEY4=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=QcemKAX3; arc=pass smtp.client-ip=209.85.160.175
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="QcemKAX3"
Received: by mail-qt1-f175.google.com with SMTP id d75a77b69052e-51c01c79467so226761cf.0
        for <sashiko-reviews@lists.linux.dev>; Sun, 09 Aug 2026 22:41:44 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1786340503; cv=none;
        d=google.com; s=arc-20260327;
        b=odfBNQeUBKS5oXVcJR1QT6bhGwQquxrjHC5CC95paXx8Y6u9Z3+vQAtoloSI8/grVB
         3wjCWRcC/r1qstfRrqGVhFGjNr0QyWQtHKOX3lKSAdMaEo6zDuByjM1cIyK0E4dBZ1ZB
         QBxXEq37Hwtdz/oTqjVlxPn1ScZdFtFMP6wWbrhqvy+FAyjIEZFMTm5nf35dXg0TC67p
         8zFWpZNtCWEyFwkSh4jFhQV2a08mTFJynkBOra+dpTbtWFpqYhlzmeCl/B4Aop//2P7g
         n2HwOtUC6wUCG0Zfd85hm4n6HoT3+NBLaaXlRHjpnfTYb8c6bIzIgF8+qL0LdqXT9cxY
         xknA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=oAAuX5vxjg2Pm+bU5mwW67u+Nu2cQ4w35TXJ6q+sUlA=;
        fh=5WRQmWey/eNyRfI5g/sWfeAyOoN5rwo1UMEZgJHZ3hQ=;
        b=Zg9Goop5QgFHrmEUaKHgn5EdHvVLlfpcgnQvLayWYcATCd98iN2zDEpP+JvT9WBaLA
         apFvclsJXJOdvDGIfQZPmDYwTENbRVoH2BEjdNIhsCidKkLHhoX71FfslOHWQqOqIual
         3vMcaGtiqxVC4Op3qpqAMBCx40TYdLtKl0MI44LFNJOscFOQPZ2AKV2MrYWqqE/HfWAN
         80/9JMdCF5WnVXJ06NRWFoGXFFIPVUX8mLNdDYIDEYDGAYS9O5BXfhlG12JX/RL2oP/a
         KLyQ66MgTTVjmvhE3akdXeAMT9PnVOWYKiRY6ANzueiJ4WEbb9Yz+Ho/sDTH+gwqCY76
         KlXA==;
        darn=lists.linux.dev
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20251104; t=1786340503; x=1786945303; darn=lists.linux.dev;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=oAAuX5vxjg2Pm+bU5mwW67u+Nu2cQ4w35TXJ6q+sUlA=;
        b=QcemKAX3wK3lz8NkDdxvhTvKijDjnpSmMRhqskk/RZaqDvoTH/PIZzau8TtaN9sMy+
         p/4woTN8KAf4bkQ/Wd4hKFn2qgt7cGH93TkiJZU7w9i8C3KppYmFL0py6GxPrbqIHF6S
         beU2kVKyRZ+lhXJt2zkZBGy+NJn0wRKxFTCaZOYfrj4anC/Kv9uX60M/tJ+moxU3dnGB
         HX1GifVf8jL8naxLHYYSAjuK2DS7MhRocL9dwJ4osobGfM/KTZxO3wUhYVWvfD09lSnH
         3Ef+B8/eSeLdTzepJpDgMB6bMHi7osM4hu7uoWLsuj2wV0icvL+6AFVhrB2fsaLNP9da
         RMNQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1786340503; x=1786945303;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=oAAuX5vxjg2Pm+bU5mwW67u+Nu2cQ4w35TXJ6q+sUlA=;
        b=WbMvg9HtZrnTF4VmgN3cGUD7uaOtTKQMmmOOoKGQ3z2apvYR26V8ol4YJM6r1l+1/f
         QSBxTyTHxx9DPP5Kw2hgC1R2XkyKvZhn6jw2UR3rE3RVfC5W0wcBxJlX0pF8iF4tkrq7
         qKs/xEIF6M516P/xc3S5C0DJgzpjaYbIXq8JOXLEvyf+RXDInG4EAg1yRmVu21HXCU+L
         iRsZagsB+c/1b4fsdQQHKP3AVoCi8Uj7fRJJ10dFurl+Pn2bdcYX562/u1RRb+gIQjqg
         yoGQyKN6EMPJ90W/+aal3OVPNksSFzQoERfHH0atXojQQ1MGtYxKkh+hFZQoalcAywm6
         xITA==
X-Gm-Message-State: AOJu0YyviVwNZ+v0+UxlFO69C3x3FlwCoSyb0I88P0Xpz8JhLDeGFTIs
	RNjDhpuZ7F2107wX4zTH9rNicR+SP8MOJOv5wRVLVYB5fuubDM4o2hWDY57zjfEUEekExLJ+q7u
	mDfYOjYMbv3Tb8N9Ry+zVXXaAL2OoWVddYeyUIqya
X-Gm-Gg: AR+sD13myn8JXSPb/q1fQMkXJeGiT8+5jbbDFjhd7fsuNSDlYHCaccraq8y+7wPMnj0
	KIDFJklAvr+8BfFt9uYNwEgreCbm6Dh6w7BzlGKU2nICCLdRYTLMr+ay6/5SDEJgW/thDEQhGmk
	O1qLhiFfSeqWh86uwtoJ0uJyWRIKYZXcJJbphHdb+1S9C0W9+wmoykjDieODoW5wANtpR51tDTX
	nobQ/xKUcZRfpmc/Ceq9STCEhQnNEk8SByHWTijILPmMUnhzA6FoQQ9mfBEeTJbeAD/gFCsaGS5
	FDW4HQQdOGYmHLUDDF3WXfsoSrfPgDOqgYMHADPn/Rj+qw==
X-Received: by 2002:ac8:59d0:0:b0:51c:ca9:3d15 with SMTP id
 d75a77b69052e-52d23c8a773mr28134111cf.12.1786340502880; Sun, 09 Aug 2026
 22:41:42 -0700 (PDT)
Precedence: bulk
X-Mailing-List: sashiko-reviews@lists.linux.dev
List-Id: <sashiko-reviews.lists.linux.dev>
List-Subscribe: <mailto:sashiko-reviews+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:sashiko-reviews+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20260624051535.3584977-1-irogers@google.com> <20260809071455.1221514-1-irogers@google.com>
 <20260809071455.1221514-12-irogers@google.com> <20260809072810.3B94F1F00ACF@smtp.kernel.org>
 <anlbZhmuJIj1Wm6E@google.com>
In-Reply-To: <anlbZhmuJIj1Wm6E@google.com>
From: Ian Rogers <irogers@google.com>
Date: Sun, 9 Aug 2026 22:41:29 -0700
X-Gm-Features: AUfX_myu5PDh2hgDPxNeb1_yMfoowhnD-JDOeQjqiPEPd-Z0MddptEnva-1WuKs
Message-ID: <CAP-5=fWbwZWppYLcuFhxJ18BtXJaS1+DDo-U2C1UD5zKF+828w@mail.gmail.com>
Subject: Re: [PATCH v3 11/15] perf python: Add thread and PMU uninitialized checks
To: Namhyung Kim <namhyung@kernel.org>
Cc: sashiko-reviews@lists.linux.dev, linux-perf-users@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Sun, Aug 9, 2026 at 10:02=E2=80=AFPM Namhyung Kim <namhyung@kernel.org> =
wrote:
>
> Hello,
>
> On Sun, Aug 09, 2026 at 07:28:09AM +0000, sashiko-bot@kernel.org wrote:
> > Thank you for your contribution! Sashiko AI review found 1 potential is=
sue(s) to consider:
> > - [Medium] The newly added `CHECK_INITIALIZED(ppmu->pmu, "pmu")` in `py=
rf_pmu__events()` causes a Python object memory leak of `py_list` on the er=
ror path.
> > --
> >
> > --- Patch [11]: [PATCH v3 11/15] perf python: Add thread and PMU uninit=
ialized checks ---
> > commit a381b82bb0eb00b93be525bfa1c265b574c03a5a
> > Author: Ian Rogers <irogers@google.com>
> >
> > perf python: Add thread and PMU uninitialized checks
> >
> > This commit adds CHECK_INITIALIZED guards to thread and PMU getters to
> > prevent crashes when accessed before proper initialization.
> >
> > > diff --git a/tools/perf/util/python.c b/tools/perf/util/python.c
> > > index c70b151428f76..fe5afce173330 100644
> > > --- a/tools/perf/util/python.c
> > > +++ b/tools/perf/util/python.c
> >
> > [ ... ]
> >
> > > @@ -1730,6 +1731,8 @@ static PyObject *pyrf_pmu__events(PyObject *sel=
f)
> > >     PyObject *py_list =3D PyList_New(0);
> > >     int ret;
> > >
> > > +   CHECK_INITIALIZED(ppmu->pmu, "pmu");
> > > +
> > >     if (!py_list)
> > >             return NULL;
> >
> > [Severity: Medium]
> > Does this code leak py_list if CHECK_INITIALIZED fails and returns earl=
y?
> >
> > Since py_list is allocated with PyList_New(0) just before the initializ=
ation
> > check, it appears this Python object is left orphaned if the macro eval=
uates
> > to true and forces an early return.
> >
> > Could the CHECK_INITIALIZED macro be moved to the beginning of
> > pyrf_pmu__events() before the PyList_New(0) allocation to avoid this le=
ak?
>
> It seems this is the only issue introduced in this series.
> As it's trivial, I'll apply the following change for Ian.

Looks good to me. Thanks,
Ian

> Thanks,
> Namhyung
>
>
> diff --git a/tools/perf/util/python.c b/tools/perf/util/python.c
> index fe5afce1733306be..36c5f4b0d0bb15e7 100644
> --- a/tools/perf/util/python.c
> +++ b/tools/perf/util/python.c
> @@ -1728,11 +1728,12 @@ static int pyrf_pmu__events_cb(void *state, struc=
t pmu_event_info *info)
>  static PyObject *pyrf_pmu__events(PyObject *self)
>  {
>         struct pyrf_pmu *ppmu =3D (void *)self;
> -       PyObject *py_list =3D PyList_New(0);
> +       PyObject *py_list;
>         int ret;
>
>         CHECK_INITIALIZED(ppmu->pmu, "pmu");
>
> +       py_list =3D PyList_New(0);
>         if (!py_list)
>                 return NULL;
>
>
