Received: from mail-pl1-f181.google.com (mail-pl1-f181.google.com [209.85.214.181])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 396E847AF6A
	for <sashiko-reviews@lists.linux.dev>; Tue, 16 Jun 2026 17:03:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.214.181
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1781629402; cv=pass; b=ZUDr8d+ycfJ2sSkET+0VYzH/is+syg3bWefJL+JM6P1LbSEk36PSa8J1u0JlMor144owr2r7w6IvZLNh+VedPQsZFHvXbs+hvksgkGCRO5Vk5zHnfUhK5pPTPyauOaqKawpZMig2jvKKsVkeoKhBr7WW6Easo+whs17NxS8DV/k=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1781629402; c=relaxed/simple;
	bh=UKHtzCX9zrsrbBj3viJPtVo0ZvDB5f7CP+lqyu1VAEQ=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=LuR1bVYcJm4HZtsjXvAfpeA1QcfIPwDn6QHgP11Iquwx0VvZkT/liQ263fixu5P19RKazyEjNXevz1wh2QjfGcoBGj4LakP+uQl1oTNqzFOdx5t/QdrZ75nkZPsjkd0lJcrVe6bVYQ7UeMpK4Zm8u3rGN4TLrpYIvnD5dZgC8ck=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=XBOt7OBH; arc=pass smtp.client-ip=209.85.214.181
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="XBOt7OBH"
Received: by mail-pl1-f181.google.com with SMTP id d9443c01a7336-2bf2d865383so2105ad.1
        for <sashiko-reviews@lists.linux.dev>; Tue, 16 Jun 2026 10:03:21 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1781629400; cv=none;
        d=google.com; s=arc-20240605;
        b=eV6nM/fbwmXRwZfM/7408X22ep4jG85CsYSm3NFUuELqQZBTogZAusxzpxZ1gCRfUJ
         58cO6KGvvex+lnBrf9W9+AWgDVrE60LgndOC3QMmjkuoUqd3IIMlgdVAP1wuO4pf4lAq
         EWtp+gAn4XtqQJ7TlicJni6GE13795P9zz1XUc3qf68GIWd49rFZXUo9p264rwdK6+/o
         84HIbeiM4NQTAptHffQvdUzQAPiExi8iOpnFgv8XnGKUT64B8VPuKbmxHZAA76CW37YY
         iAo7/yo4fOOTdA/sS2f45+ocI76Qy2Y/1a80c5oEOgb1BvwcnKKv7ujxYejvBSgw55h1
         4AIw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=z9Vx4QTw3Fz4ksQLoNqFI9G//LGznFBcPtouXygFC5g=;
        fh=mlKhGgs6Q0KoMqLu1EoXyG7ga6LY7JCr+0kHwoPgzxk=;
        b=X+ikBA3K/XJ6oqq/MInYx7SFjMlCn2UL6h4P2p6S2TPiUajmBzywM7dxKZoVLB3Bmu
         nuANgrcC9yC7eaieKFGy0dATwZ7g6dZ/U3cOIEqCEfugxue0A/wa+gUDPyXTkw6kjpJI
         ggpHLJGpSBE01Vq8R1FKnQ1z74JMBqgU9i5qNiyBdN5Pxyi1VP7a0/RlwfunmGkFCMth
         XdfosS0JmWAUivfytEtdBBufk3J5hDK+Neg7osltUynTD6GYSymDKp4tiR8t098Kf4h8
         vz/6B9uUn/CJB6glmpOEhn344X4ESvxiF8Cg7LG5h32MLb91XrEdNpIxWQUkRwtA/Zzq
         7W8A==;
        darn=lists.linux.dev
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20251104; t=1781629400; x=1782234200; darn=lists.linux.dev;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=z9Vx4QTw3Fz4ksQLoNqFI9G//LGznFBcPtouXygFC5g=;
        b=XBOt7OBHtkazEZiNcAqSB2j7eUoZJBXwcICCmj+UyUhjSaEvqCRVtQjdKB12ZM4GzF
         Z/wX9UJJNQUMnGsypj+HOs7ykYfjvQNmnB3N/+U2dpPbFCbXIV8ZrOQAbzaAluSQq9E6
         cncGcynCUhAOVqqhBQTLNMjm+vYT9LXD3ry8XYPPw6xDc+jafzxNhdtnM5RXBfxtpZ1B
         lCR1HMAaQXDXCJBi79MLHrKPZMY49b9rD6C8O8CwuPc3U5msQQEGTvlHCnjTRPs4qtOO
         KAJFTesxaUnjacSI9IXgQfkA3MctOquh347uUra59Q1K6WDKmXgENAIChdNIaN2VJfWN
         2NCw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1781629400; x=1782234200;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=z9Vx4QTw3Fz4ksQLoNqFI9G//LGznFBcPtouXygFC5g=;
        b=hqr6wo+Qhp7oggBbGOPP30a2np9zvoBMUXr33qdGTrMrmE3m52LknNB0ADZ6MmnQPK
         oCtzhgh1czWwzftLJtkdWFVTIyTztADApi/QRLUaKRyCwO8Tt+dVwcD4gQDYwRywpddA
         GuZgdB1NhaCfGaFedxkOPVpua6iwUO3tl6m8xai2tfLy1tlfYLULHjYNOCjCcyBRDHjh
         BpCQznLZyEp/SbUf41rlL5P2sRMeWnzO+8bBaIMn2IH7mRp0H6wxFgwJJOBlQRucqzCD
         6rf2/hOCLDerWEVdgSmiVTNeYZLiw2j69pnoAvzEDp5UGDAxG+9O9Wa5n7ZwtX2DpQ+h
         i8Qw==
X-Gm-Message-State: AOJu0YxkUxM5e9rxCBToEGfxtTRXPPz+RDYzMpAn0Gs3ZrT497bfZqkb
	MgimkFbJL6w+77zkCabjDIgLqAX2dicMV/VBy7+MidGns1dL9qTHa0u2HfmBBg2iERZOeFnuZ03
	+uTbWwqE6OE8Du2x4mtw8eo4KDSoDAsIpoxWAI9Lk
X-Gm-Gg: Acq92OGZnuhFhjbJVQXBHJbp6rZH5tuwY5rZC0AUP78+K/XgLWGie5Yj9aROCYacOW8
	lsZoRZWM9KpwpXwSYUeU+acOQ8ifpJDHJCeqN7pFc182JwVH8kc+nFf9i1w4BAw3py2CEGMEnyM
	7b8Y9zjwqOpEzb7v1prTfe4SL0JeeKYr1p6b63apgmsPGRy5Db+qWY1Pe+moAo3N8Gkl6x6rphu
	UkLUMjawt3LEcYdqaSGyg8Xo11qt87ZmN4p7ic8qsW1qOWkHNf/xdeb9vOYoDXDHJs/4Sfp5sYh
	lijOn0gsoDzsY43HFM4b3FEoWk6IwTduomtb
X-Received: by 2002:a17:903:38d0:b0:2b9:a39a:e5db with SMTP id
 d9443c01a7336-2c69c1f531emr2538605ad.7.1781629399919; Tue, 16 Jun 2026
 10:03:19 -0700 (PDT)
Precedence: bulk
X-Mailing-List: sashiko-reviews@lists.linux.dev
List-Id: <sashiko-reviews.lists.linux.dev>
List-Subscribe: <mailto:sashiko-reviews+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:sashiko-reviews+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20260616011543.4037138-9-irogers@google.com> <20260616015219.0BCC51F000E9@smtp.kernel.org>
 <ajFztSaBdZgJ6sJF@x1>
In-Reply-To: <ajFztSaBdZgJ6sJF@x1>
From: Ian Rogers <irogers@google.com>
Date: Tue, 16 Jun 2026 10:03:08 -0700
X-Gm-Features: AVVi8CcrKgqyKYTSLRL-Qf7WH4CDDNdX69rDzD0zkJQiDDkb1y_THfHoH47RqgE
Message-ID: <CAP-5=fXYGpO1T2zj0Gyr-FaOObiAA8G4Oraj44xPsmX0+Wj6QA@mail.gmail.com>
Subject: Re: [PATCH v21 08/21] perf python: Use evsel in sample in pyrf_event
To: Arnaldo Carvalho de Melo <acme@kernel.org>
Cc: sashiko-reviews@lists.linux.dev, linux-perf-users@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Tue, Jun 16, 2026 at 9:03=E2=80=AFAM Arnaldo Carvalho de Melo
<acme@kernel.org> wrote:
>
> On Tue, Jun 16, 2026 at 01:52:16AM +0000, sashiko-bot@kernel.org wrote:
> > Thank you for your contribution! Sashiko AI review found 3 potential is=
sue(s) to consider:
> > - [High] Missing NULL check before calling evsel__get() on the result o=
f evlist__id2evsel() leads to a potential crash.
> > - [Medium] Missing perf_sample__exit() on the error path of guest_sessi=
on__fetch() leaks the evsel reference.
> > - [Medium] Missing perf_sample__exit() on the error path out of perf_mm=
ap__read_event() loop in test__perf_time_to_tsc leaks the evsel reference.
> > --
> >
> > commit c23db56d8fc8d40b59596916ce6b0537514263aa
> > Author: Ian Rogers <irogers@google.com>
> >
> > perf python: Use evsel in sample in pyrf_event
> >
> > Avoid a duplicated evsel by using the one in sample. Add
> > evsel__get/put to the evsel in perf_sample.
> >
> > > diff --git a/tools/perf/util/evsel.c b/tools/perf/util/evsel.c
> > > index ec759a11f7588..d79112cebb716 100644
> > > --- a/tools/perf/util/evsel.c
> > > +++ b/tools/perf/util/evsel.c
> > > @@ -3365,7 +3365,7 @@ int __evsel__parse_sample(struct evsel *evsel, =
union perf_event *event,
> > >     union u64_swap u;
> > >
> > >     perf_sample__init(data, /*all=3D*/true);
> > > -   data->evsel =3D evsel;
> > > +   data->evsel =3D evsel__get(evsel);
> >
> > [Severity: Medium]
> > Does this new reference acquisition cause memory leaks in existing call=
ers
> > that do not expect sample.evsel to hold a reference on early errors?
>
> So this was something I wasn't expecting: patches for tools/perf/util/
> inside a python binding series :-\

So this was the point of sending the RFC early:
https://lore.kernel.org/linux-perf-users/20251029053413.355154-1-irogers@go=
ogle.com/
When working with the session API, copying evsels and evlists becomes
painful; it's easier to hand references to the parts of the system
that need them instead of copying and ensuring the copying is correct.

> > For example, in tools/perf/builtin-inject.c:guest_session__inject_event=
s(),
> > if guest_session__fetch() fails, it returns an error but the cleanup bl=
ock
> > checking if (ret && gs->fetched) prevents perf_sample__exit() from runn=
ing,
> > leaking the evsel reference.
>
> this looks valid, no?
>
> And while looking at it, there is another bug in that function, but now
> I'm looking like sashiko ;-)
>
> Namely:
>
>  tools/perf/builtin-inject.c
> =E2=95=8C=E2=95=8C=E2=95=8C=E2=95=8C=E2=95=8C=E2=95=8C=E2=95=8C=E2=95=8C=
=E2=95=8C=E2=95=8C=E2=95=8C=E2=95=8C=E2=95=8C=E2=95=8C=E2=95=8C=E2=95=8C=E2=
=95=8C=E2=95=8C=E2=95=8C=E2=95=8C=E2=95=8C=E2=95=8C=E2=95=8C=E2=95=8C=E2=95=
=8C=E2=95=8C=E2=95=8C=E2=95=8C=E2=95=8C=E2=95=8C=E2=95=8C=E2=95=8C=E2=95=8C=
=E2=95=8C=E2=95=8C=E2=95=8C=E2=95=8C=E2=95=8C=E2=95=8C=E2=95=8C=E2=95=8C=E2=
=95=8C=E2=95=8C=E2=95=8C=E2=95=8C=E2=95=8C=E2=95=8C=E2=95=8C=E2=95=8C=E2=95=
=8C=E2=95=8C=E2=95=8C=E2=95=8C=E2=95=8C=E2=95=8C=E2=95=8C=E2=95=8C=E2=95=8C=
=E2=95=8C=E2=95=8C=E2=95=8C=E2=95=8C=E2=95=8C=E2=95=8C=E2=95=8C=E2=95=8C=E2=
=95=8C
>  1970        if (sample->cpu >=3D gs->vcpu_cnt) {
>  1971          pr_err("Guest event with unknown VCPU %u\n",
>  1972                 sample->cpu);
>  1973 -        return -EINVAL;
>  1973 +        ret =3D -EINVAL;
>  1974 +        break;
>  1975        }
>  1976        /* Change to host CPU instead of guest VCPU */
>  1977        sample->cpu =3D gs->vcpu[sample->cpu].cpu;
>
> But the comment for your patch seems actionable, i.e. it is an issue
> introduced by your series, by calling that evsel__get(), no?

Hmm.. I checked that the tests were clean using leak sanitizer and
reference count checking. There's no reference count checking on
evsels as the scope of the fix is so large for that. I'll try to find
other issues, and make a v22, but much of the Sashiko feedback has
proven to cover things that are either pre-existing, or addressed
later in this series. In this case the missing perf_sample__exit was
pre-existing and we could have been leaking other values like sampled
registers.

Thanks,
Ian

> > Similarly, in tools/perf/tests/perf-time-to-tsc.c:test__perf_time_to_ts=
c(),
> > the CHECK__(evsel__parse_sample(...)) macro jumps to out_err on failure=
,
> > bypassing perf_sample__exit(&sample) and permanently leaking the newly
> > acquired evsel.
> >
> > >     data->cpu =3D data->pid =3D data->tid =3D -1;
> > >     data->stream_id =3D data->id =3D data->time =3D -1ULL;
> > >     data->period =3D evsel->core.attr.sample_period;
> >
> > [ ... ]
> >
> > > diff --git a/tools/perf/util/session.c b/tools/perf/util/session.c
> > > index 89d0f4cec6c7f..18af70488e07a 100644
> > > --- a/tools/perf/util/session.c
> > > +++ b/tools/perf/util/session.c
> > > @@ -1874,7 +1875,11 @@ static int evlist__deliver_deferred_callchain(=
struct evlist *evlist,
> > >             else
> > >                     orig_sample.deferred_callchain =3D false;
> > >
> > > -           orig_sample.evsel =3D evlist__id2evsel(evlist, orig_sampl=
e.id);
> > > +           new_evsel =3D evlist__id2evsel(evlist, orig_sample.id);
> > > +           if (new_evsel !=3D orig_sample.evsel) {
> > > +                   evsel__put(orig_sample.evsel);
> > > +                   orig_sample.evsel =3D evsel__get(new_evsel);
> > > +           }
> >
> > [Severity: High]
> > Can this cause a segmentation fault if the sample ID is unknown or corr=
upted?
> >
> > The evlist__id2evsel() function can return NULL for malformed perf.data=
 files.
> > If new_evsel is NULL, passing it directly to evsel__get(new_evsel) will
> > dereference the NULL pointer when trying to increment its reference cou=
nt.
> >
> > Could we add a NULL check here before calling evsel__get()?
> >
> > >             ret =3D evlist__deliver_sample(evlist, tool, de->event,
> > >                                          &orig_sample, machine);
> > >
> > > @@ -1913,7 +1919,11 @@ static int session__flush_deferred_samples(str=
uct perf_session *session,
> > >             }
> > >             sample.file_offset =3D de->file_offset;
> > >
> > > -           sample.evsel =3D evlist__id2evsel(evlist, sample.id);
> > > +           new_evsel =3D evlist__id2evsel(evlist, sample.id);
> > > +           if (new_evsel !=3D sample.evsel) {
> > > +                   evsel__put(sample.evsel);
> > > +                   sample.evsel =3D evsel__get(new_evsel);
> > > +           }
> >
> > [Severity: High]
> > Similarly, could evlist__id2evsel() return NULL here and cause a crash =
when
> > passed to evsel__get()?
> >
> > >             ret =3D evlist__deliver_sample(evlist, tool, de->event,
> > >                                          &sample, machine);
> > >
> >
> > --
> > Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260616011543.=
4037138-1-irogers@google.com?part=3D8
