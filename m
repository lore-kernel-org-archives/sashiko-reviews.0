Received: from mail-ej1-f48.google.com (mail-ej1-f48.google.com [209.85.218.48])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 16B53386C39
	for <sashiko-reviews@lists.linux.dev>; Tue, 21 Jul 2026 19:44:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.218.48
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784663050; cv=pass; b=oleiowMjKa0rcLhHDZmz7TuuisdaMmNW4Q4Hzhx2kzTtOT15sjWqrhCTl0rlGs76HU+XKyaRepVx6n9Idh/VyWWRl4bB9gQC7DwkGVYMObys3B8cS2n8gLglzgsVluVrDPiirtKWlZXy+sXKMeAIQzlK9wn0gbNE5tmz5bACkg8=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784663050; c=relaxed/simple;
	bh=kIubguAQSDgw2AnUTnOlALbwEwbyMs5+HMA//ZuZ9iE=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=P8LVjdJkBdgKOXWKD3mWbTIGKlDDLh1ZbmaQHenjoqo/azaLxGWstcwbvmUNxHpUdIpBjlA0Vv6isPmTG7eVDkRS45vvdvXotB7hFskNK+Y1P8s5IByuWI3+/xIF1P+rXbAqp3jDmqhiH3GhEIiZVTzFCABP9ueTCQDC0ng99Rg=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=W9MaC+/V; arc=pass smtp.client-ip=209.85.218.48
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="W9MaC+/V"
Received: by mail-ej1-f48.google.com with SMTP id a640c23a62f3a-c1712a04ddaso922202766b.2
        for <sashiko-reviews@lists.linux.dev>; Tue, 21 Jul 2026 12:44:08 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1784663047; cv=none;
        d=google.com; s=arc-20260327;
        b=KeNolReXV3z+pIVUp9WkJEg4paYRX3G3+RBxc7KYcAW318u0n1tYHJ5eNpcSg5TGyX
         c2bvr1x5L9NETQTMNc8VeET6n7jqqP45BDUf/wFqDFSKE/hIn/lxBQrGB7aGRfRsVuQf
         8HU6jctpWFrpTNHCG0WTvG4AK7XHkBvlt00Rp83tx90Q9sjyGC/U/pVo5Itly75e4Z3j
         Rq+0ohzugUqXJ2c/XVzb7vj3FXzylBOZ9ESDXIQUq/AGZJ4mRZLkGrcl1cBY/nyZOFt9
         rxqOACPswIWQAy0AhZtgDPg2j0ZE5smZje9MSSYyHPA2Cu2yCxKRfft3GGyyWIDuBAJU
         8qiQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=IkY7/xBgEHYioSp3TmlKCifGguVh3qDEL8r4no2V/24=;
        fh=uA360uvxR9S0K/Y4Lovo7aIaGlBwzVBnnb2BKWupr/4=;
        b=AEiFqoeLG5worpL2cED3FCWX2NADo/suoeoYJnQyBoJJe7SHXyigSDeRZw1+oGsRzk
         ZJWvUIUhnQlhnPNMSGbxIoTwDZvbwQmDL3IN7SgcgCme6QYT/0JFOuListQ5pwE2zxnh
         sy4vBb0YH+v77/35uGCJ6McwcM6G2oY11JB167b7FjCXF12tX2kTex2sMlzk9f1VjoCo
         v+iXXOfGA42rFCpNO5vXDzrY0VC+aUb8fEj6X/yXV/iI6qXG/1AFmep+5DiNEzhAajgx
         BBiKNZBCqKz1uykqJgaFWRtJX+aou8CGC/AwWgDDnakRG5BMnmLMEMx/YPIYt1b4FIl5
         Up7Q==;
        darn=lists.linux.dev
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1784663047; x=1785267847; darn=lists.linux.dev;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=IkY7/xBgEHYioSp3TmlKCifGguVh3qDEL8r4no2V/24=;
        b=W9MaC+/V2T0ZVHviFa52NAHmRgH/3gssWsupRAQ5PBF9T6zW30EXkU+OSTBOzudnfZ
         DscGEbARdzt9Gtlm55o/seB5B77ClAUh2jsmakASpaMcdz+Rb1ougRBfIEPxa+Q/TAh9
         1pPzUa6/tl/r1M4RzDbb6r5yqcYlXmAIleGdDNh0irI4xrDqBF1X/LMUlqnIBNTRY7VG
         qSaxx8T5NsTNNEZpGBZCtm5l+WMx41zymOccmerCsthKnOI0aHPUBSMuNmvX4yhsUBE9
         5bW10ZEiOMWD6/hvq4LQPb9GzqTn14Hu7GpUcYgs/1jHk/6ZYguYWydCwueDCBG5QoBp
         Abmw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1784663047; x=1785267847;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=IkY7/xBgEHYioSp3TmlKCifGguVh3qDEL8r4no2V/24=;
        b=WIfvMxNjkaEoDJpzDDMr7XlnSWeMqhYXfztiQeP6nTg8jIO3JgvY9wU1SAOuupK3yV
         g1d7/MihHwNwfrZUzL+cPXS70m7CvuDUuWdA94hWzO7rWLy9HNbvOpV7IuwtevvJOU4W
         P5EzXjxAhVaxvLQ4joHmwkVF6dUnE6z+a8mnhJcbUTzxIQBvntK+iEb1ADOVFA7dZRjy
         1glQSDHq4UVDIHfpvUL9kW3jHR3ZDXpsC+lwxsOmE7GweSd/8vrycek2P81n/aA/A2dP
         qg0PPyd0oHiE5obXLQl+g1n0L5k7QB7DpMg/lL1sG9Ug6yfQctvOlViuQvCdxmrteq9V
         6lHg==
X-Gm-Message-State: AOJu0YykOEhwESdHSiFX1SUCDzsCmK5LPVRlUDyRemzixpvfagpVKgCH
	3jO+s3LqTWyHJH4zdXO+4ps2mC6icvSlFHX02LNrYlHfl9YeSRe1KymMClH9xplTB6lp8K/8YWD
	1lQI7ZBngKe7CJUpQGQNvFIfwDSc9K10VvsZyF/w=
X-Gm-Gg: AR+sD11Y76MXOHI8cbMO3yFvHSxezDKELBHQN1qudieq/FhtbY/TFdjNqImhMZXtz5r
	3nid+qeMknd0p2ezNsq4GUcnwgep3jP+aA6IAx0dOrQioeOKgd/YnKVLp2/n53/TzeP8jFXOpJX
	k9dGtHdNfe2TxFAiD/cwkz69vv9yuvJ/G2e9hvLTdP3AubFe5/vpzruF2dQ13SCNVHs9iDcubtN
	8I8v2MD5rLtwlJ6Pl5iP6jElasSaJKxKOi1oFjnZgJ/z200BmAjH2AYhTKDQYxMyoPoxyL7pJ7L
	POO0QWYyOxygpcyrCA==
X-Received: by 2002:a17:907:9803:b0:c16:6a91:38ca with SMTP id
 a640c23a62f3a-c16b483e17cmr958014866b.50.1784663047135; Tue, 21 Jul 2026
 12:44:07 -0700 (PDT)
Precedence: bulk
X-Mailing-List: sashiko-reviews@lists.linux.dev
List-Id: <sashiko-reviews.lists.linux.dev>
List-Subscribe: <mailto:sashiko-reviews+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:sashiko-reviews+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20260721174909.8044-1-nickolay.lysenko@gmail.com>
 <20260721174909.8044-2-nickolay.lysenko@gmail.com> <20260721175745.228B91F000E9@smtp.kernel.org>
In-Reply-To: <20260721175745.228B91F000E9@smtp.kernel.org>
From: Mykola Lysenko <nickolay.lysenko@gmail.com>
Date: Tue, 21 Jul 2026 12:43:55 -0700
X-Gm-Features: AUfX_mx158iEIjFEJNV1RK8eG6qPWR-SWVxiEe-hb_LIPy2AM2g6J5BFVriJT9M
Message-ID: <CAMtxOX1wD5G8va8yDdevbd759=zGByVO4oNSeb8nyQcEF4wimw@mail.gmail.com>
Subject: Re: [RFC PATCH bpf-next 1/3] selftests/bpf: extract BPF skeleton
 generation into a helper script
To: sashiko-reviews@lists.linux.dev
Cc: bpf@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Tue, Jul 21, 2026 at 10:57=E2=80=AFAM <sashiko-bot@kernel.org> wrote:
>
> Thank you for your contribution! Sashiko AI review found 1 potential issu=
e(s) to consider:
> - [Low] The newly extracted `gen_bpf_skel.sh` script is not listed as a p=
rerequisite for the skeleton header targets.
> --

addressed in v2:
https://lore.kernel.org/bpf/20260721194111.334795-1-nickolay.lysenko@gmail.=
com/T/#u

>
> --- Patch [1]: [RFC PATCH bpf-next 1/3] selftests/bpf: extract BPF skelet=
on generation into a helper script ---
> commit 4513e1c5bea1eb3326128c6ae08f7e1f230247fb
> Author: Mykola Lysenko <nickolay.lysenko@gmail.com>
>
> selftests/bpf: extract BPF skeleton generation into a helper script
>
> This commit extracts the duplicate skeleton generation pipeline from the
> Makefile into a standalone shell script. This simplifies the rules by
> replacing them with calls to gen_bpf_skel.sh using different flags.
>
> > diff --git a/tools/testing/selftests/bpf/Makefile b/tools/testing/selft=
ests/bpf/Makefile
> > index b642ee489ea64..e3a27403cd481 100644
> > --- a/tools/testing/selftests/bpf/Makefile
> > +++ b/tools/testing/selftests/bpf/Makefile
> [ ... ]
> > @@ -631,81 +631,38 @@ $(TRUNNER_BPF_OBJS): $(TRUNNER_OUTPUT)/%.bpf.o:  =
                       \
> >                                         $$($$<-$2-CFLAGS),$(TRUNNER_BIN=
ARY))
> >
> >  $(TRUNNER_BPF_SKELS): %.skel.h: %.bpf.o $(BPFTOOL) | $(TRUNNER_OUTPUT)
> [ ... ]
> > +     $(Q)BPFTOOL=3D$$(BPFTOOL) ./gen_bpf_skel.sh --tag '$(TRUNNER_BINA=
RY)'     \
>
> [Severity: Low]
> Should gen_bpf_skel.sh be added as a prerequisite for $(TRUNNER_BPF_SKELS=
)
> and the other skeleton targets?
>
> Without the script in the dependencies list, modifying the script itself
> won't trigger a rebuild of the existing .skel.h and .lskel.h files.
> This could lead to stale builds during development if the script's logic
> is updated.
>
> > +             --name $$(notdir $$(<:.bpf.o=3D)) --infix linked         =
         \
> > +             --skel $$@ --subskel $$(@:.skel.h=3D.subskel.h) $$< $(if =
$(PERMISSIVE),|| { \
> > +             $$(RM) $$@ $$(@:.skel.h=3D.subskel.h);                   =
         \
> > +             printf '  %-12s %s\n' 'SKIP-SKEL' '$$(notdir $$@)' 1>&2; =
})
> [ ... ]
>
> --
> Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260721174909.80=
44-1-nickolay.lysenko@gmail.com?part=3D1
