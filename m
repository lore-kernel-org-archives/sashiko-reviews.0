Received: from mail-qk2-f12.google.com (mail-qk2-f12.google.com [74.125.230.204])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1876A566C6D
	for <sashiko-reviews@lists.linux.dev>; Tue,  8 Sep 2026 22:37:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=74.125.230.204
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788907060; cv=pass; b=eAQlatzmGrvurYHV/nIo+Z6kaSVlAhU2VnjsMjpvfCSN8Wh4OEb1hElZErJkrOqslhvDm6cD4dHhN7XHAd/rQipiZKpgF8YiE6qzmXkvt/DsEX5OwlzJJqq67r3UkJEizdEOSiabtIhLa0YK4DuIIVAfctcgNycmMaouD+UrYxs=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788907060; c=relaxed/simple;
	bh=avfAmNq50TjCdzdERK1ZxzNqg1PNH53ghjGpjf87958=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=MAvapsArNJ7HjPjpOXzzf2dcB23weO2Y20Qyej1Y/3JCqlKDxFyHkGeZsf/7Fw1PeM7kbw6AvZV95XgSPj2OkTp7pXdSW17JGEz3DpHU9mwb2OfYO/rwxTLWLeVh8KW+AqLr0F3wA4AmCUhGVxreqhWYbgsY393wh9GaTkcoE74=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=ZGwhtFPv; arc=pass smtp.client-ip=74.125.230.204
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="ZGwhtFPv"
Received: by mail-qk2-f12.google.com with SMTP id d75a77b69052e-53012819c04so28511cf.0
        for <sashiko-reviews@lists.linux.dev>; Tue, 08 Sep 2026 15:37:35 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1788907053; cv=none;
        d=google.com; s=arc-20260327;
        b=PtDhh7JQHh9HMaPG7WpkqrDLhntSNwBERSn1aRJiKPmjm+lSluM49ZjqpWjsxCLnzb
         maXWN7JshUsXMwJVjjksp1n5LPDNLyGGA0zsAqCqgE4CSzWM3pSDFrkNyDdzG+tuD553
         r+6/XD20m9XaHQWmSP7THjwrNOfBstKYYT24Tlv2zKao4FBsS/UHwGtkg9HBwIr3xP+b
         u8gCgPGI5HzgnUoLDkP/aCYpIADStuIzEGWxb5TIhSsDW4gvP1zn09ac1V1o1XcYAB6Q
         rL1s++7nJj6t2cD7ltg25oIk9ajf57R7OTM7he4J6i8uJ6awROgF6maSIsKGFG1TJH8d
         TZRw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=6GlBVIXnHx2dtgSFGVRz0lOWrV/ts1nALJe741lEtcc=;
        fh=0zVHGC//SC94CWFKHtFt4lnskmkXkJNNy7lE0FDd3Ck=;
        b=bjeAdqEusAU/99cYqbHZFc3e8vayrtw878O15+2lh1LD6QdRVWkzfnKlzhQu2aupDk
         kH/Oyoq0TOBYztEiqo3MOLg264ZaJhzAoBzeO4UGsI397QhUwSHqQJah/uOmyjvUAzrY
         3loHBQARq/21kCP+McWSpp+H9VJdlmRCNOiUMdvkdIeGTDIXyNrGbX081YjDXQBjLLYH
         1TBKnjyjey7W6OXoWr8oREaUIBsmrBsa3aO4Vm56iBE9/BukVwBrlyr9mEEec1ZaaD5I
         CBxVzqJVIgCyaG0uIkY3MHGdvvWvp/Vh+7yqFJIpG9GXiAZceVFQwqd5UHp8pfO9wzsj
         O1aA==;
        darn=lists.linux.dev
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20251104; t=1788907053; x=1789511853; darn=lists.linux.dev;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=6GlBVIXnHx2dtgSFGVRz0lOWrV/ts1nALJe741lEtcc=;
        b=ZGwhtFPvkCQnQN4bH7UFIPE4QXNzbQKzEv7F9GB6Mn3Gi/t0A1ZfCmLxURMsP5Ew76
         rdSVyuKZfP/CcsDqaz33RzPTpefn2wdFA7/hJYBcA92gWonB7AMf9dFOcAmr7FBzKSGC
         b4QmxEGC4Ex6o2HGPzKeqCR1wWjs9eDqOWwBUNuFqjKyj1kwT+tKA0eRYAR67ZMMaogw
         v3IzI6KZDuWadc/ZcTkLMIcn2gSZ9MFWHUTqUoX2gIZyeBGQqU7A7YXoR9S/0iYQtbYX
         JAPKXXCrQ4pMolWn/vdo3g/aVbpE4zKJ1Jb1rDXwl321IXbJn7GVegDHOj1nBBjphj/A
         kfLQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788907053; x=1789511853;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=6GlBVIXnHx2dtgSFGVRz0lOWrV/ts1nALJe741lEtcc=;
        b=Jd/6JuDSqDFeKLgu6NERIwCCU63DefcS8eATUZxrwO3wz9+H2wCvhfIiNsT6xyUcc1
         euryUdJYTWfHQl1zNK2GoKbbMP1a5aNA6odU+AWEY9m0xCt79QdIC4TL78S75pY44o+k
         vmrL9tiHMtbWYQ+uw2OB9F8ezCwWorvsg+XHeYc6R+jvGgW3xZH80/uYX9FTUgTSAvj4
         ncOGaK2nvfeqmzspzRSUWmfrlfKZvsOsD7N/9Cfk2Yce60K7keixs4SkUjq7aVWIZawX
         i8obJTegOXalt9RpjoPkAeroefjDr1vU2mZous2OZPf9lAldr8qsqij7IHt9XJw3NNME
         pnIQ==
X-Gm-Message-State: AFuF++l1+Cui+jE/Ayn+SkTjfiaBjvZv//dwdMC20dTBhG1OrOHhmQpg
	UqH1SEaqSdlba6aMM1GBTqd/LqJ6CAIgubHNtOKkoGhSBRFDoc71xdMJ8T7Aa1/GEYZ/2kzX0/u
	Z9/qvBekyaJp2JEnW+IeYAQcEpz3M80FV3l2vyC3mHLgxutd6FMhypA4PZio=
X-Gm-Gg: AYBFou2oyRb43NM3rW+lsQsqRPax0IgHu98yqXJNOsbc3+a3WccOekBQBJ8m3xy5QKM
	ATYVIz8fCmmsBouPEhe7QxSoETLUwwefLgerUX33IOehBjWOjz5rbnOjtQcudiRhbyAZWMGyPk/
	MxVpOn7zlwp8Cd4OSftoSORA1Mp8p0Ap2eDdosnwmRfSSDRgMMKvmStJamjjkF5nVOZ10XrTVyB
	qVCQozWWM5g+zBHiq+n0TvOKi0uvyNh4d48FLEN6g/uAyfzFwKj9rcyRZWl+6czgg7sOQr/Uzbu
	Qi0PK1+ofbDffQR1kE3koxFz4zarYHoO1S1Nw000L/qV3rc05RfqpT3EiifW7wsDH5Gjyt2icJ0
	z0RKxnjq2YQs=
X-Received: by 2002:ac8:5904:0:b0:517:5e32:2d14 with SMTP id
 d75a77b69052e-530a498e209mr3106141cf.10.1788907052860; Tue, 08 Sep 2026
 15:37:32 -0700 (PDT)
Precedence: bulk
X-Mailing-List: sashiko-reviews@lists.linux.dev
List-Id: <sashiko-reviews.lists.linux.dev>
List-Subscribe: <mailto:sashiko-reviews+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:sashiko-reviews+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20260908220720.564614-1-irogers@google.com> <20260908222333.DC4B51F00A3A@smtp.kernel.org>
In-Reply-To: <20260908222333.DC4B51F00A3A@smtp.kernel.org>
From: Ian Rogers <irogers@google.com>
Date: Tue, 8 Sep 2026 15:37:21 -0700
X-Gm-Features: AcwNN1XV-UR6xHf26kqDMbQzIvJ6pQfNsD06hMzMYv-UCUokbLpKwr3viBl5McY
Message-ID: <CAP-5=fWQzkhwWpeXYUr+1VfgryBoVB+1NOuJn5j6guCkyYvykA@mail.gmail.com>
Subject: Re: [PATCH v1] perf stat: Avoid uninitialized memory read on error
To: sashiko-reviews@lists.linux.dev
Cc: linux-perf-users@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Tue, Sep 8, 2026 at 3:23=E2=80=AFPM <sashiko-bot@kernel.org> wrote:
>
> Thank you for your contribution! Sashiko AI review found 1 potential issu=
e(s) to consider:
>
> Pre-existing issues:
> - [High] Atomic Conclusion: Unchecked ERR_PTR from hashmap__new() causes =
predictable application crashes. The return value is incorrectly checked ag=
ainst NULL instead of IS_ERR().

Yep, libbpf's hashmap is a thorn in the side of correctness and
ERR_PTRs are the devil's work. The hashmap code also intentionally has
undefined behavior. I sent this series:
https://lore.kernel.org/linux-perf-users/20260322005823.981079-1-irogers@go=
ogle.com/
to address this. Since the BPF folks are happy with the current state,
I think we should fork the code to avoid issues in perf - we'll still
suffer with the hashmaps in libbpf. I was investigating whether we can
add some form of generics to hashmaps too. Anyway, the issues reported
here are correct and genuine bugs, but they aren't relevant to this
patch.

Thanks,
Ian

> --
>
> commit 525c560536a62c39331ec585b1ce897decf7179c
> Author: Ian Rogers <irogers@google.com>
>
> perf stat: Avoid uninitialized memory read on error
>
> If has_supported_counters fails then msg was passed to ui__error
> regardless of whether an error was written into msg leading to reading
> uninitialized memory. Avoid this by always terminating msg at
> initialization.
>
> > diff --git a/tools/perf/builtin-stat.c b/tools/perf/builtin-stat.c
> > index c50cf230f16ed..37752d6bfef45 100644
> > --- a/tools/perf/builtin-stat.c
> > +++ b/tools/perf/builtin-stat.c
>
> [ ... ]
>
> [Severity: High]
> This isn't a bug introduced by this patch, but I noticed that the return
> value of hashmap__new() is incorrectly checked against NULL instead of
> IS_ERR().
>
> Since hashmap__new() returns an ERR_PTR on failure, this will
> cause predictable crashes under memory pressure instead of graceful error
> handling.
>
> For example, in tools/perf/util/pmu.c:perf_pmu__init():
>
>         pmu->aliases =3D hashmap__new(aliases__hash, aliases__equal, /*ct=
x=3D*/ NULL);
>         if (!pmu->aliases)
>                 return -ENOMEM;
>
> And similarly in tools/perf/util/pmu.c:perf_pmu__create_placeholder_core_=
pmu():
>
>         pmu->aliases =3D hashmap__new(aliases__hash, aliases__equal, /*ct=
x=3D*/ NULL);
>         INIT_LIST_HEAD(&pmu->caps);
>
> Also in tools/perf/util/fncache.c:fncache__init():
>
>         fncache =3D hashmap__new(fncache__hash, fncache__equal, /*ctx=3D*=
/NULL);
>
> Should these locations be updated to use IS_ERR() when validating the res=
ult
> of hashmap__new()?
>
> --
> Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260908220720.56=
4614-1-irogers@google.com?part=3D1
