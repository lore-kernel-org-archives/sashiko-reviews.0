Received: from mail-pl1-f181.google.com (mail-pl1-f181.google.com [209.85.214.181])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0F7F13E9C3C
	for <sashiko-reviews@lists.linux.dev>; Fri, 15 May 2026 23:25:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.214.181
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778887543; cv=pass; b=Frm05T6qbsNE21W8Sc4NaJi37GDKmFKo5rY0DKGwH/i+F+/8WnGZFSRZvWhHgzPi/08UTjY0MBmf0YVU3oWUiWatTmWN4LG9rD+xcYk4AHnAeI8q7DluQ57XQKuwaGS4iHfiXbyzfa/RWv77vCkWCMWwIH5QeiWpzNO5DN1wE7Q=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778887543; c=relaxed/simple;
	bh=wnlZk7FzDive6bt7JQLR7LLWXuLfT7wCIge4lpkCT2k=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=XC27oUI+XmGKpknPhK26TWtAhEhodIb4ugbZRTd8eEDKu45IfJVxNUU3nKVQB9oEFfLrARqJENqIzo3s9pzwPtEJNAG2aLg0EfMlc4NH9OIkbtVTrHMfz2mRT7HREkNP/5uB+AcKnbdO7jp0exolkWSp7DlTUydDWmriKBTrwo0=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=dQ1RjKec; arc=pass smtp.client-ip=209.85.214.181
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="dQ1RjKec"
Received: by mail-pl1-f181.google.com with SMTP id d9443c01a7336-2b46da8c48eso775ad.1
        for <sashiko-reviews@lists.linux.dev>; Fri, 15 May 2026 16:25:41 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1778887541; cv=none;
        d=google.com; s=arc-20240605;
        b=lzGcB9MU8wr3Krdeip4PHRrbOyhQmeWAZPrEUNqrlw9wamMLdDJgsxZvY3pgaIWQZQ
         FT39yeT9ZptPOBlim8UYMwa0tGkWsFwkte2WmaHSCT54KIZA27srsg+3eKL5kuzg33dy
         HrOHQzAlRPC25N0BhGjLR4zK/Skxq8NjT3jk9PxbETOZCIlp9k9bcELuyPXIfZbz/6WF
         wvEqT7yLxQI/MJmlPUNcROmat8zWrtMralLr4LpkD3gYCq1ZSoZjZDbrl1nCZLHhVvds
         XGKAZJQzddA2gPAB2fsRp4MmLW9tKf0mQwfmS72C/JiJ9BAdiNVGeXRpegPKDPtu8mSh
         XuEg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=l4tNCP/wX9oSDuG+qCUOGCypJ+OVnOfWnmlm2c/bfiU=;
        fh=LQLdSW01h2ROUwNK2N5+UwHQ+4lE93qNu55uGrsD190=;
        b=Gdl6o/WZ+/FbCajl37EGu1uUKucP2s60vfk2AkdrESsQ+qTifvqvXA1w1HU3NRT1q/
         unNFXn5/7IpXDoyeCv99ZpTT4nWxQrGuxGt7blmHi5AZIK0epTdhMEFo6yFv9f2puk8A
         Y302raqpO8eGoVUpUJ69BtaMBgttQ5xfivekS2JKlCsTNsOxRbzOlB7AK9f+jMgMTSWH
         Tvd7odLOuAONlC2Mru8FlW5MEv7/g2mVTRQ8akwD7K7DIyV8DgAOYsAz/RU5YePHqxRu
         g7tmv+rbvUgy0wswuDh6WzdBgkOvltVdObRCwgOhpkxAlIJxbgE3q+9kOGxAmf8jw6h6
         dj2w==;
        darn=lists.linux.dev
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20251104; t=1778887541; x=1779492341; darn=lists.linux.dev;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=l4tNCP/wX9oSDuG+qCUOGCypJ+OVnOfWnmlm2c/bfiU=;
        b=dQ1RjKecx/5+AuvrFCGVOPviItXaTTRTgyqq60fr7mofnHyNLwh4tC5WrZ7LNwoFcD
         vrdxX4w9XeTnqaIPuvjmfQWYLRRJ+VZ158wttQ0LO58hfz4f7onBjgG/E/SK1KgHB114
         QJYGCtO7XLvDmRB+3YysSTRPK6nP+D5GHlrrQOSXPLsGnVEpwZxobHYEQQpYTKopRQ5+
         HN9yeyvMUgCZuYcysHNOdbnU2PvfCxINCFgujUAB9ueoCD87BsjUpItkaF3VoHxzRA9C
         RkwvzlekpBnsOYWiwO8tuYGBDM1uJtM3UfPuYj1nhZxXgF/9StdDuwX5wlHgV4vjbZYk
         QVqA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1778887541; x=1779492341;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=l4tNCP/wX9oSDuG+qCUOGCypJ+OVnOfWnmlm2c/bfiU=;
        b=s+QKe6JvcuzYOemhMqK37P8YGziLWb+jWqV97XCsrqGSaa2LP/ivw4Nn+Q1ZpgOkNB
         fwydDUFat6KuVkOQ7kV7rKO11YZJpIShGxTRIj/RZeLhD+XUYTqAexprZbXA0NIQt1pG
         iSQQajdIeXRFc0eEgWpZCZxGU44Sd7THbOUKvBxcC0f0Hg+tQ/Xt5jqYdXDaC1TG+zZ1
         H8ZpOqRM/Lz2W+QaazGR1fmy3zZ+Wl5FiVg5BtbzGjf/XV6KXDdopVV12G0Wdtu1gos8
         YtEG0mzhn2rIHECyTvUCB+JpzJycgCkXc4d+xdpulRC8a+OYMry3Lu7g1oyk565EzBqp
         LxFw==
X-Gm-Message-State: AOJu0YyYi3w4HaN2sWiqNzKMcLVprlbFuKAPr0Mu+fto5umCUSG/JutQ
	UzZemVyxMKt8kCztCdWeL7G0TW38s3owa9fEkFl6DFqRzCyxP6K7gy342jnHAbk2qKeKhNolstE
	u3UcVq3H4x8FgYEggx1CkdOxp6zl5vW20Q+qfDlPR6Qxx+2DEwB6mbplb
X-Gm-Gg: Acq92OEPxrPuUCF29LZYBfCMjnSOPE4bl+G+LRw13WmuR/dRwhrQHAzGyOu1ws5JHYf
	8rCMeYynwYTDhdWMM7XRoPjYg9+zHf71wNK/7qwu0qxlLvxhdrHzcXRFXIRBOK0IRQPpz0aNQm4
	NPxEKM8TLHfgSk7BD0vJ82iusGBUpiPFrcSHeKroTFo1Z09HpRirlMlS1R80ItDLrgpaBBaXKk9
	AOzKT43i5O6D+V4mPupNoOqIlJLA0TSkeUXFsmO01UuYFXaleH7Nej8zy2UTCmu6huWQZQ5hgTZ
	sdpsoh3vo7xyd+M84Yw=
X-Received: by 2002:a17:902:d48e:b0:2bd:508b:f3ab with SMTP id
 d9443c01a7336-2bda52d2e38mr466285ad.15.1778887540605; Fri, 15 May 2026
 16:25:40 -0700 (PDT)
Precedence: bulk
X-Mailing-List: sashiko-reviews@lists.linux.dev
List-Id: <sashiko-reviews.lists.linux.dev>
List-Subscribe: <mailto:sashiko-reviews+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:sashiko-reviews+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20260515193314.1593560-11-irogers@google.com> <20260515195854.1A3C0C2BCB0@smtp.kernel.org>
In-Reply-To: <20260515195854.1A3C0C2BCB0@smtp.kernel.org>
From: Ian Rogers <irogers@google.com>
Date: Fri, 15 May 2026 16:25:29 -0700
X-Gm-Features: AVHnY4IThke5hkHBwB57Ywj1l_hyQsZwmcTJ0Bn2phpSTJbZ-iEudXNVqaXDUhc
Message-ID: <CAP-5=fXM_bGY8uiVa-U9SiFrwY+Dxkrt=s66dfoL9YR7=14Edg@mail.gmail.com>
Subject: Re: [PATCH v5 10/14] perf pmu-events: Split big_c_string storage into
 standalone compilation unit
To: sashiko-reviews@lists.linux.dev
Cc: linux-perf-users@vger.kernel.org, bpf@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Fri, May 15, 2026 at 12:58=E2=80=AFPM <sashiko-bot@kernel.org> wrote:
>
> Thank you for your contribution! Sashiko AI review found 1 potential issu=
e(s) to consider:
> - [Medium] Incremental build breakage and partial clean failure due to Ma=
kefile dependency chaining and Python file closing order.
> --
>
> commit 6c014984ddc9092cbb7ef975a3904baefa427ed5
> Author: Ian Rogers <irogers@google.com>
>
> perf pmu-events: Split big_c_string storage into standalone compilation u=
nit
>
> This commit splits the large big_c_string literal into a dedicated
> pmu-events-string.c file to allow parallel compilation during Kbuild.
> It updates jevents.py to output both files and adjusts the Makefile
> dependencies to ensure jevents.py is only executed once.
>
> > In jevents.py, defer closing output_string_file until
> > the absolute tail of main() to guarantee identical modification timesta=
mps
> > with output_file, preventing redundant rebuilds during incremental runs=
.
>
> Is this guarantee accurate? Since output_file is never explicitly closed
> in main(), it gets flushed and closed automatically during Python
> interpreter shutdown, strictly after main() returns.
>
> Will this result in pmu-events.c having a slightly newer modification
> timestamp than pmu-events-string.c on filesystems with nanosecond
> resolution?

So previously we were worried about the opposite scenario. Using &:
for a group of generated files solves the problem but Linux builds
only require GNU make 4.0 not 4.3, which added this group construct.
We may need to drop this change as I don't see a way to satisfy
Sashiko.

Thanks,
Ian

> > diff --git a/tools/perf/pmu-events/Build b/tools/perf/pmu-events/Build
> > --- a/tools/perf/pmu-events/Build
> > +++ b/tools/perf/pmu-events/Build
>
> [ ... ]
>
> > @@ -224,6 +234,10 @@ endif
> >  # and inputs are dependencies.
> >  $(PMU_EVENTS_C): $(JEVENTS_DEPS)
> >       $(call rule_mkdir)
> > -     $(Q)$(call echo-cmd,gen)$(PYTHON) $(JEVENTS_PY) $(JEVENTS_ARCH) $=
(JEVENTS_MODEL) $(OUT_DIR) $@
> > +     $(Q)$(call echo-cmd,gen)$(PYTHON) $(JEVENTS_PY) $(JEVENTS_ARCH) $=
(JEVENTS_MODEL) \
> > +            $(OUT_DIR) $(PMU_EVENTS_C) $(PMU_EVENTS_STRING_C)
> > +
> > +$(PMU_EVENTS_STRING_C): $(PMU_EVENTS_C)
> > +     @:
>
> If pmu-events.c consistently ends up newer than pmu-events-string.c
> due to the Python teardown order, won't Make permanently see
> pmu-events-string.c as out-of-date?
>
> Could this silently trigger redundant recompilations of pmu-events-string=
.o
> and relinking of perf on every incremental build?
>
> Additionally, if pmu-events-string.c is deleted while pmu-events.c
> remains up-to-date, Make will execute this dummy recipe and then attempt
> to compile a missing file. Does this pattern handle partial cleanups
> gracefully without creating a build regression?
>
> > diff --git a/tools/perf/pmu-events/jevents.py b/tools/perf/pmu-events/j=
events.py
> > --- a/tools/perf/pmu-events/jevents.py
> > +++ b/tools/perf/pmu-events/jevents.py
>
> [ ... ]
>
> > @@ -1476,6 +1488,8 @@ struct pmu_table_entry {
> >    print_mapping_table(archs)
> >    print_system_mapping_table()
> >    print_metricgroups()
> > +  if _args.output_string_file:
> > +    _args.output_string_file.close()
> >
> >  if __name__ =3D=3D '__main__':
> >    main()
>
> Should _args.output_file.close() be added here alongside
> output_string_file.close() to ensure their final filesystem writes happen
> simultaneously before interpreter shutdown?
>
> --
> Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260515193314.15=
93560-1-irogers@google.com?part=3D10
