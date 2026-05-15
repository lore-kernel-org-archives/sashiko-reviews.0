Received: from mail-pl1-f179.google.com (mail-pl1-f179.google.com [209.85.214.179])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 897D12F7EF7
	for <sashiko-reviews@lists.linux.dev>; Fri, 15 May 2026 23:27:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.214.179
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778887676; cv=pass; b=P+Uc0HvXocP8xwji81zQ49I6XyCJQp+ROnkqcoeUvfOWHt0Y0lof2e0OGu+AUdx7b4iXEdIVP73FIXfTSdhf/Q9QZ4Y/ziYHhuuF1GhY7zBz+X0LPbPp77Mvx6F8dLIjGKWkZ6giNkns/3tKcAcyFA75GJCaVEkN+yczkdDHtNM=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778887676; c=relaxed/simple;
	bh=YwWC4WFrkmp2ONYjnJoQn8j2jErDcE/QFo/5x5YPLwM=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=HLrnQrwdI66RoBFtIpo1Jul8d4sxkPeoUAvpzXVwsB7HIuyw/20NPNItTrd+kUos9vjzpHPzhe0dDo9kbxfxXPVMyNmxP6fxDEXEdEs11UGiSFWlQQIbbY2AHMldVzyN3SoKnSu/qFYevfUXGat/6H2UlpGw67KsgkWzLJ97h/Y=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=QRgCbjs1; arc=pass smtp.client-ip=209.85.214.179
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="QRgCbjs1"
Received: by mail-pl1-f179.google.com with SMTP id d9443c01a7336-2ba3b9bcf69so465ad.0
        for <sashiko-reviews@lists.linux.dev>; Fri, 15 May 2026 16:27:55 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1778887675; cv=none;
        d=google.com; s=arc-20240605;
        b=OoINV9Vl1Q47gjwqyEebHFjAePfF3oEm4saufnKxPEVGgAhKm6DcX9hmmEWbAzfJrY
         CzRsGIs0Nlm1B0lwGwTasuoV5OWpQCr5LWRBlt3kOV0zRttt/wHwcKlsg/o1SPdmj3Dn
         jWFMyRU2d9xzYPf1mgnmGiHgcgjBfcBE/fBr814tmy8Ozb2D7kdX+U2+JoI6MTQsIdSs
         5xgKmJ3e71DHkPMDJK/brX2P7hC+hQi+I8eq0TPxSqdXWa5PxigG1lEyiHqDxqeJ8nU0
         Vz1ITKCDyUU4LbrTEHIykhnGprRZzukEfEpZPj2ehsT5SzGNecEAEChTaDLWnrXZG2Oa
         yUTQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=XU6/qLMq0pTyP8x21lr53W/CjJX1qRINA5YR5iUfpIY=;
        fh=fAUcOLMJrL6/gSlJAi6JxZuXRW8JDI9oXae6bn18h+k=;
        b=EL3WOT3dFjXVitn6ANYA6jt4ttaPFuyB0ltx3OujPevDa6XWt319Wrx3eVNLNMcGJg
         +bOWx2ydHO8bV3KG16jIjvjSqcZWBOhkPfcyeKpbLABNTbq3iDXFlQKbfMHDDbO6vdqQ
         Yi4cv4F8XL3X7SejRk0SURTEbxPGO8eLKZk5cSnCRl6O4uBpdf7V6xmFLFeaBh2Eopfo
         tahHISx0m75icZo/mUB1OdpsjLviDR/iMUrDXpZ9y4sSs+hxqnr3CivpO8OOwlCnHNex
         tjlsAdfGMGY4vtD013Go2whFL1yhkZuvX4ri2vOi6/SXg4JBPV6fpbrXTnK5Jno306+x
         AZcw==;
        darn=lists.linux.dev
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20251104; t=1778887675; x=1779492475; darn=lists.linux.dev;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=XU6/qLMq0pTyP8x21lr53W/CjJX1qRINA5YR5iUfpIY=;
        b=QRgCbjs1hk7HLYusFAB1st1UvkX+U6tfudxFwy2/91C0sEDEkOfx29QIvgX6EMykMn
         Pay214CDLBBnpeziGZ7TLAh5hDJYkbGf7gOJxBlSj+tunckDRDuXpUjlTb9y17qhLHsS
         F01aSZ0/4Y4/vLooUKM3AyWSg/giLxCWIqcFMO0LiolOAk0JE9w2DBikGdS3GgL6gV1T
         Q8acCWbMWPtcDpbO0DZ+dcjVZaQ+M1UMs4G/3AT0q6UWI5kyRiBy4LgVTWb2CwJWioHb
         K9d99C6MUV7pSE/5tcqjCnt57lYdQ1k/exmu+IlrgSQP8Y5XMKrv3d8qzjeMalBGKM0r
         Rlmw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1778887675; x=1779492475;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=XU6/qLMq0pTyP8x21lr53W/CjJX1qRINA5YR5iUfpIY=;
        b=iD1PXw5MyKbBDoRig+Ycfm/YlOE7wzf4Tk8dXHur7njfg1ZsQmEPJlvcH4MNsBAuTS
         VglkCYSAFQBbZ5Cwf1Bfmhz61Ny8sQau03D9HP1ln8I9ozw+Aa0nL3GHi1AmP7jtUi25
         Wb3h4EW0NQJcRCUQ32adw48a/uJ0bBPa0r89BISDyLlJ7klhUIu/V38LH+0pVbhdxTAK
         oqi1XtW+LOr5A34wYDwiDuih1ergdX3KXQvXQQYgp9nbc761TjUU7OGJRu5LYwyqQKbt
         BBoa8PBrP1LEcp1Qbh+hwYXDJnIkimGBGtW0g258ytK6c34mgVhKfRqxV51YRQMk7L7f
         +CCQ==
X-Gm-Message-State: AOJu0YwBtqajzXZHEHgESDq+UcKkx7JifcU3xtInowrwGfyCte2Ts+iI
	YfPa4HfNy1m1Ijt3ptAgHYG1Wo7PY7gxg6Gv6NzX3h6W2dCF/1g5+rSE++ix1THEqs4A95YqE6A
	tU1pwG4vQQ2cEKuFs7a83/MRl99U5T1q4NX758VjdeKTyW2JRNT2KhpaY
X-Gm-Gg: Acq92OEF6/saUydMX6DGHFIzGQZyv7oOMyvxBwH4xzoPKtSnB5x3jKTzFkeXxABMYxC
	O4bY1RAQV3sLXd5vvNqNXINfocWUu6vRElKI2hzeSEKcLB83ZaFjCbAUIu4j1TgDdc9TKhBmcVG
	vKJAxpXLZOnRYdS1R+CE5dL8AL5ELWGK+unUO0vPPAfNSQ6Rq0UUWyqvzN5Dh6sTNrRDh9icBJw
	pR4nk38jFbbjGo1w67j6NzQ10wAOisvHMWH8QDAEDRSBTt0Ij/yhKt2DU1EK74gWqqK7z3ly6Eu
	1tiopDj4lp+7pZrCpIg=
X-Received: by 2002:a17:903:2312:b0:2bd:3bfd:74f1 with SMTP id
 d9443c01a7336-2bda0deeaffmr1117315ad.2.1778887674217; Fri, 15 May 2026
 16:27:54 -0700 (PDT)
Precedence: bulk
X-Mailing-List: sashiko-reviews@lists.linux.dev
List-Id: <sashiko-reviews.lists.linux.dev>
List-Subscribe: <mailto:sashiko-reviews+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:sashiko-reviews+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20260515193314.1593560-9-irogers@google.com> <20260515195302.B0AD5C2BCB0@smtp.kernel.org>
In-Reply-To: <20260515195302.B0AD5C2BCB0@smtp.kernel.org>
From: Ian Rogers <irogers@google.com>
Date: Fri, 15 May 2026 16:27:42 -0700
X-Gm-Features: AVHnY4JgeNjpXX7_zw_F_IFv0Az7NoDc8QDwKILAiMbLPJlzNoJdyG58uLM06zg
Message-ID: <CAP-5=fVnZXqsoeh_4+uxHyyVeOer-zMiSTh-nbbihDR1HgEZig@mail.gmail.com>
Subject: Re: [PATCH v5 08/14] perf build: Move libsymbol dependency out of
 prepare step
To: sashiko-reviews@lists.linux.dev
Cc: bpf@vger.kernel.org, linux-perf-users@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Fri, May 15, 2026 at 12:53=E2=80=AFPM <sashiko-bot@kernel.org> wrote:
>
> Thank you for your contribution! Sashiko AI review found 1 potential issu=
e(s) to consider:
> - [Low] Removing `$(LIBSYMBOL)` from the `prepare` step breaks the `make =
check` target and manual object file compilation (e.g., `make util/symbol.o=
`).
> --
>
> commit 6df47358116c567d6b28b1ca848835d2f69dc679
> Author: Ian Rogers <irogers@google.com>
>
> perf build: Move libsymbol dependency out of prepare step
>
> This commit moves the libsymbol dependency out of the prepare step and in=
to
> the dependencies for the bench and util libraries to reduce serialization
> during the build.
>
> > diff --git a/tools/perf/Makefile.perf b/tools/perf/Makefile.perf
> > index 876065a02de6f..96a68723109fc 100644
> > --- a/tools/perf/Makefile.perf
> > +++ b/tools/perf/Makefile.perf
>
> [ ... ]
>
> > @@ -637,8 +637,7 @@ prepare: $(OUTPUT)PERF-VERSION-FILE \
> >       bpf-skel-prepare \
> >       $(LIBAPI) \
> >       $(LIBPERF) \
> > -     $(LIBSUBCMD) \
> > -     $(LIBSYMBOL)
> > +     $(LIBSUBCMD)
>
> Could removing $(LIBSYMBOL) from the prepare step introduce a regression =
for
> the make check target and manual object file compilation?
>
> Both the make check target and the generic object fallback rules, such as
> make util/symbol.o, depend exclusively on the prepare target:
>
> check: prepare
>         if sparse; \
> ...
>
> $(OUTPUT)%.o: %.c prepare FORCE
>         $(Q)$(MAKE) -f $(srctree)/tools/build/Makefile.build dir=3D$(buil=
d-dir) $@
>
> Previously, prepare triggered the $(LIBSYMBOL) target, which installed
> required libsymbol headers like <symbol/kallsyms.h>.
>
> By removing this dependency, are we no longer guaranteed to have the
> necessary headers installed when running make check or manually building
> object files from a clean tree?
>
> It appears this could cause them to fail with a 'No such file or director=
y'
> error when processing files that include libsymbol headers.

It would, so the user shouldn't do this, they should just use regular
targets like "all" or build these targets incrementally after running
an "all" build. Putting the target on these rules would be equivalent
to putting it back in the prepare step.

Thanks,
Ian

> --
> Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260515193314.15=
93560-1-irogers@google.com?part=3D8
