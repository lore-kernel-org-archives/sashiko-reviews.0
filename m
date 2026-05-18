Received: from mail-pl1-f172.google.com (mail-pl1-f172.google.com [209.85.214.172])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2A95537BE7A
	for <sashiko-reviews@lists.linux.dev>; Mon, 18 May 2026 02:50:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.214.172
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779072652; cv=pass; b=SvhxOH2TBAGNAK7xEmeicl7sPD0un2so1ZvhvHP9Z/qwkHchyTqFrSBrr6KHe8ewxbF+B6LzjfYz5qHiZ89HvMs9DspOg9Xh01rJ3NKj2LRrWCv84iDfydzyf7oa8NNqXOzxu3A1dd9TiZKSzb8ON490GH8dp51IHuLwa8j4hqg=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779072652; c=relaxed/simple;
	bh=Ooa7cW2D1IYd9NZSoSPSMtct3nfjHy2qVBuFonf3asI=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=VrJSY7Cpo0IZIyYd4Dxm8VkI0/6NhQ0ICsUMtbQrLXFnFC9yOwyHL8EHpy3NaJZQG+lAvCy6P2JXyyyNIQF/YMxy1AxKQ4JMhVKdWrih0bjYBpCPUtlR1V8NsEk2v/MM6Fg0lXcWWVuWehiGh10mWuvpmSe/ac8mbhBf6aZ6mF8=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=c1EiadDz; arc=pass smtp.client-ip=209.85.214.172
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="c1EiadDz"
Received: by mail-pl1-f172.google.com with SMTP id d9443c01a7336-2b46da8c48eso475ad.1
        for <sashiko-reviews@lists.linux.dev>; Sun, 17 May 2026 19:50:50 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1779072650; cv=none;
        d=google.com; s=arc-20240605;
        b=OpwE8yVRZ7KwvsTdIewkxQ3SztU2wEW93hwBHWh+Kwvep6dcMrj+J4aKwYNEMdJCsn
         5CYttXW4ECpEDFn8Rm8DcukH2jdFvDvvI7hVSxZyUAHedrjJpldY2wdP1BKbAXT1+vy7
         ++upwH891upTZODqvwGUq5Dcsx8oA6lXkniTf2FXmQW/6QI0e0ciF0Z0zuRnCvH06eUl
         RozYLgMkBxFxComwSsnPYmP0sVWy+1Bf8bvaIjjc3F6GXKHS1b7CUAbo3DnOGWHvWodn
         urqjOPz2Euqj48529QXzdqqDTO5dUb6baogt4cLzQ+1NZFemlq517xBNSrXoDYhjq9Ac
         nzdA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=GlQ9sX2+ndV8BDI+ZX/9maNZGwPG1ORF3D1rWw5qgqs=;
        fh=BxU8RlEWmYNqNZFKfXpOiBPx5nJANX7WtqYlMNvtC1Y=;
        b=FDHf5EMc1OiucDQCWSSU1uabG8FVTQb2q1EuxndJ7v0qmjDGITfvLogcjeukN1JP5r
         AibFD7ovabqMyYDn3cYwfwNFFwY7c4M50nUl1lgkKpaxGpM+CUzvphLKmRVyOtHSxIeM
         iOa03bFrjG6EQMQb4aszivaMmzPDcu0AMQy7PR6aV5iXhuQLuoQu4RgizO/lXAGF9+th
         D7VrLWqw461U3bwqbwkrdUO4o3Zdzk4DUPBdNZ5zsV+LhYLlVwXkLwKy2FXjD2RJfNtl
         OcDU3Vva3otdEBMkZNx4K8UbERK3K7WmJnolLbQ2+Vn/b0L2YHNT1kzMrGhtcc/6DLja
         BR3A==;
        darn=lists.linux.dev
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20251104; t=1779072650; x=1779677450; darn=lists.linux.dev;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=GlQ9sX2+ndV8BDI+ZX/9maNZGwPG1ORF3D1rWw5qgqs=;
        b=c1EiadDzAcGtFMftuykmsraFEXPu+9AjnnHnIe+NlOJOYGsIL+ummsjeU+e7KpRuBU
         Xy/EFs3wivpahKw+/pXOcPme4b0bTyXu7IP7muwjKmU1uoyryhTYJ0IfYftMrOatW5O6
         WobwGJRU/DsKGtz83dGH5iExwYm9Tcq++uGQZOJuMMsyrQ2gTChRScUxZHV+2lnZPYjB
         giGPV4gKOmkSrz3S8IyJcceRRSpway6j4y0EyiC6PuSL0LKiMf6dTBLVtx1ARFJkxL2A
         wqOxWP4NBkpfQZDf8qMCvh1nhpKRkmFpeN8dTLdwqzamadPyeKwocukdiYROrMiocTPB
         cqCg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1779072650; x=1779677450;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=GlQ9sX2+ndV8BDI+ZX/9maNZGwPG1ORF3D1rWw5qgqs=;
        b=mahVTuG/mh/LLS+2rOj10Do1yk5PvulxIlQIuW34BFtRPw79W6NylwrK2QquoY1ncO
         eBv2BB7w6dx16iOzyYTyASRi3iOYvOvvXjLUnPFwruvyblnitxE4T5XQXPhys1WeaLyS
         4J8Njg3e4dQ3RCwqP7+YoJUPRvSOzhu5Qr/czDDZrRNR693JYcxgRu2qaxitNa92Kvm+
         vkLBi75RqCn14uD9kltzo/8iJ7qf0YqsKK+Omqr/WUZdLqj7ZsG9LT+/DeFol74OrEpX
         Ch8pQ9R7W/LbSybXWx+MAN54/7fWJ8J4NgiJ3qz8OMzEKw71yocgVLglechEJ9O11iAa
         RpZw==
X-Gm-Message-State: AOJu0Yxyunk/3XtwSKDtPAeZYLPKKuVfyzkhWYRmAYkmwC/0eWmPewhL
	bTxuhObEWyUsDqWowLFp/GPOL9Cnzjap9MxjlLiechJvoi1IpK/H6Ih2CdvJ06lUMxZgXq8Nvqq
	5rNRco141kR8PmE9nxGw1JNt8WPDDI984k3VHUzcq
X-Gm-Gg: Acq92OHKPpv6gWnkUPFdWMXke0MfkzzGpVgyQK98IjXQB0l/+Lp+/whKB6mMIdDTug0
	O2A8DlO3/bPqsZeZQV2IopbBrze+4GWIOECpKnYa8xyxygr63OSIi9iIVmjEz73m3Ba/cnGh8QW
	CtGO1z5EE/YcGiAW3IH/Lumw6A6Bgd1FRidlfZF4YpvdbX42JfPEOdp7RSI55g3MBPyZrK8z+9w
	11jHQ7/4YzZBNB8zDRiRAYMc95IW47au3UFqA04pYxjcHnxhbj0hKI+Zdl4fLeZARJbRAo13rKr
	Ui4fMcw6uEH4SBTA3YY=
X-Received: by 2002:a17:902:ebc2:b0:2ba:73c3:49b0 with SMTP id
 d9443c01a7336-2bdb03acb3dmr1784335ad.14.1779072649647; Sun, 17 May 2026
 19:50:49 -0700 (PDT)
Precedence: bulk
X-Mailing-List: sashiko-reviews@lists.linux.dev
List-Id: <sashiko-reviews.lists.linux.dev>
List-Subscribe: <mailto:sashiko-reviews+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:sashiko-reviews+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20260515193314.1593560-11-irogers@google.com> <20260515195854.1A3C0C2BCB0@smtp.kernel.org>
 <CAP-5=fXM_bGY8uiVa-U9SiFrwY+Dxkrt=s66dfoL9YR7=14Edg@mail.gmail.com> <agpuOvZvo_HNnYsr@z2>
In-Reply-To: <agpuOvZvo_HNnYsr@z2>
From: Ian Rogers <irogers@google.com>
Date: Sun, 17 May 2026 19:50:37 -0700
X-Gm-Features: AVHnY4Jksalie_5MKvIzN7MMZ2hXiEY_ggE5_dwHwA_XCUpwR3bvH9_CRgzrGBs
Message-ID: <CAP-5=fUfUzKVsrOLUZ7d0FsMcWc=vp5hfmL7Yymnj7Zd9L2tWw@mail.gmail.com>
Subject: Re: [PATCH v5 10/14] perf pmu-events: Split big_c_string storage into
 standalone compilation unit
To: Namhyung Kim <namhyung@kernel.org>
Cc: sashiko-reviews@lists.linux.dev, linux-perf-users@vger.kernel.org, 
	bpf@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Sun, May 17, 2026 at 6:41=E2=80=AFPM Namhyung Kim <namhyung@kernel.org> =
wrote:
>
> On Fri, May 15, 2026 at 04:25:29PM -0700, Ian Rogers wrote:
> > On Fri, May 15, 2026 at 12:58=E2=80=AFPM <sashiko-bot@kernel.org> wrote=
:
> > >
> > > Thank you for your contribution! Sashiko AI review found 1 potential =
issue(s) to consider:
> > > - [Medium] Incremental build breakage and partial clean failure due t=
o Makefile dependency chaining and Python file closing order.
> > > --
> > >
> > > commit 6c014984ddc9092cbb7ef975a3904baefa427ed5
> > > Author: Ian Rogers <irogers@google.com>
> > >
> > > perf pmu-events: Split big_c_string storage into standalone compilati=
on unit
> > >
> > > This commit splits the large big_c_string literal into a dedicated
> > > pmu-events-string.c file to allow parallel compilation during Kbuild.
> > > It updates jevents.py to output both files and adjusts the Makefile
> > > dependencies to ensure jevents.py is only executed once.
> > >
> > > > In jevents.py, defer closing output_string_file until
> > > > the absolute tail of main() to guarantee identical modification tim=
estamps
> > > > with output_file, preventing redundant rebuilds during incremental =
runs.
> > >
> > > Is this guarantee accurate? Since output_file is never explicitly clo=
sed
> > > in main(), it gets flushed and closed automatically during Python
> > > interpreter shutdown, strictly after main() returns.
> > >
> > > Will this result in pmu-events.c having a slightly newer modification
> > > timestamp than pmu-events-string.c on filesystems with nanosecond
> > > resolution?
> >
> > So previously we were worried about the opposite scenario. Using &:
> > for a group of generated files solves the problem but Linux builds
> > only require GNU make 4.0 not 4.3, which added this group construct.
> > We may need to drop this change as I don't see a way to satisfy
> > Sashiko.
>
> Isn't the message at the end a proposed solution by Sashiko to satisfy
> the problem?  See below ...
>
>
> > > > diff --git a/tools/perf/pmu-events/Build b/tools/perf/pmu-events/Bu=
ild
> > > > --- a/tools/perf/pmu-events/Build
> > > > +++ b/tools/perf/pmu-events/Build
> > >
> > > [ ... ]
> > >
> > > > @@ -224,6 +234,10 @@ endif
> > > >  # and inputs are dependencies.
> > > >  $(PMU_EVENTS_C): $(JEVENTS_DEPS)
> > > >       $(call rule_mkdir)
> > > > -     $(Q)$(call echo-cmd,gen)$(PYTHON) $(JEVENTS_PY) $(JEVENTS_ARC=
H) $(JEVENTS_MODEL) $(OUT_DIR) $@
> > > > +     $(Q)$(call echo-cmd,gen)$(PYTHON) $(JEVENTS_PY) $(JEVENTS_ARC=
H) $(JEVENTS_MODEL) \
> > > > +            $(OUT_DIR) $(PMU_EVENTS_C) $(PMU_EVENTS_STRING_C)
> > > > +
> > > > +$(PMU_EVENTS_STRING_C): $(PMU_EVENTS_C)
> > > > +     @:
> > >
> > > If pmu-events.c consistently ends up newer than pmu-events-string.c
> > > due to the Python teardown order, won't Make permanently see
> > > pmu-events-string.c as out-of-date?
> > >
> > > Could this silently trigger redundant recompilations of pmu-events-st=
ring.o
> > > and relinking of perf on every incremental build?
> > >
> > > Additionally, if pmu-events-string.c is deleted while pmu-events.c
> > > remains up-to-date, Make will execute this dummy recipe and then atte=
mpt
> > > to compile a missing file. Does this pattern handle partial cleanups
> > > gracefully without creating a build regression?
> > >
> > > > diff --git a/tools/perf/pmu-events/jevents.py b/tools/perf/pmu-even=
ts/jevents.py
> > > > --- a/tools/perf/pmu-events/jevents.py
> > > > +++ b/tools/perf/pmu-events/jevents.py
> > >
> > > [ ... ]
> > >
> > > > @@ -1476,6 +1488,8 @@ struct pmu_table_entry {
> > > >    print_mapping_table(archs)
> > > >    print_system_mapping_table()
> > > >    print_metricgroups()
> > > > +  if _args.output_string_file:
> > > > +    _args.output_string_file.close()
> > > >
> > > >  if __name__ =3D=3D '__main__':
> > > >    main()
> > >
> > > Should _args.output_file.close() be added here alongside
> > > output_string_file.close() to ensure their final filesystem writes ha=
ppen
> > > simultaneously before interpreter shutdown?
>
> ... here.  Or, maybe you can call os.utime().

Let's give it a try.

Thanks,
Ian

> Thanks,
> Namhyung
>
