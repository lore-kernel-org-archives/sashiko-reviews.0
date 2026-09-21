Received: from mail-pl1-f169.google.com (mail-pl1-f169.google.com [209.85.214.169])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0AD834E0213
	for <sashiko-reviews@lists.linux.dev>; Mon, 21 Sep 2026 18:12:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.214.169
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790014360; cv=pass; b=RjqP2lUyiGAEsyzSwRyh/9ZSRUSjkvCYTSjJeiUy8EK/xuGxrvPqa2hL/1ePb+If8SfObBIvnKpMdHP/7BgUcMc8m2VscXZSwbrgOpDUZByhi82ufwHh3up+RahmliWJBSUCwn5nWATQwxsVM/yVWgJ7gCBkTAYQfZVyhOdQZ/U=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790014360; c=relaxed/simple;
	bh=pxCditSPn667R8GM21+T7lWhaHVejNe/8zp9gD2W2Ic=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=WrTvWzKUrP84RVPW35sNtWegiTSERM/tUIsK/qsMeMIKxMOInyrnpTDNESvY8b3cYowOwkfm2VYV4BPlBoIhQPREfNqDK7A+GBXaThsSokaZSeNbtqoYDUPKYC7mMMFITpsYT6qBYOZ+SlA4PRPxiIC1z/6XgQ7ImxDxzb3RZDQ=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=ZAt0EmdS; arc=pass smtp.client-ip=209.85.214.169
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="ZAt0EmdS"
Received: by mail-pl1-f169.google.com with SMTP id d9443c01a7336-2d3b445a84fso19965ad.1
        for <sashiko-reviews@lists.linux.dev>; Mon, 21 Sep 2026 11:12:38 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1790014358; cv=none;
        d=google.com; s=arc-20260327;
        b=FnA3N9U6yZ0ALCMS0SpOlbZZasu1X4j1nWGNoqVHPctu7cPRyRlk0iHK4fkQ6U2xDl
         iV/xlEU5gnGWJ0b/Nd9LO3s+MNaHOYl6cOUFrYGQPW27Y4o4bp1X4xtQ0FoA3f7pypOu
         /ciyIOtIrxCviz7b8ovko2PbkFcchSE0c2xzu/S/aJVyVXSNt0op6LTLffCZYegDkctH
         iGOyea02gOCiD2wzafjvWQBfYK2B/Mvv+LvbY2H/SNxlwK52P2hElK2+h5Zy87CId98D
         kA0nVLI++thTDMUMOaMVFgOerc/FDSBRGpXWDqh9XtbSlTxRSdFvz1DyqquqpC6y+/Q8
         fsqw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=QHAP+ThF7TxWgEqj8k74itg4E2H+sNPwvnziw5xjhM4=;
        fh=g8YDxQwYTYAfiJG2IptUQfeN1ox7i2Ws92eJGxIDHYQ=;
        b=RiCPnevgI+RmA5SIb8LXkekPGGN00nw13L5wnJb0W9MvTsifCE5ZKl6199L7c4ireD
         UX1TrjZsTpzQSamQYAnn3HSoEwVtQFSZ+ujAoacEwdug9M0LBaT46w/XPfhUSfTmwF+n
         DNQRhBjC56yUat41jMzPC0V/SzKTbYfDXP9qxRorGWd2JIGWXlG52oz05zLwhfrDk21k
         x6dB0Dc7mK4ilt1oibEkN9Ne9rmMUnjfptQi4SaOHexzvsRyaDNU8wfdIg9E7TFmG9qP
         bvXzTV3cqMH/UJtvHUeR9YeZ0vsSHLpHSaPo1Bgqaln419Xox0bKSSIAN8arsmTCb//Y
         XUIA==;
        darn=lists.linux.dev
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20251104; t=1790014358; x=1790619158; darn=lists.linux.dev;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=QHAP+ThF7TxWgEqj8k74itg4E2H+sNPwvnziw5xjhM4=;
        b=ZAt0EmdSBuA5gGYxv0jWBHErO2tyneVs4ZKbsKo5G5LekcdDgfzyWn9xkjUhQ27kAu
         coFhdjnbTq8Cksf09ydGZS18pKRsZiDYW2BYgXYNNFqakzcBq9IJ1+NwQzWlbZ4c/DuA
         +nhIJH+80tuHZYT7RXwY6YfAfYWiXkzlmaMfUeKEO8liiNc4IaxqmHKgFlIhyC7FJBG0
         Yw2Si3DPpVMOfDdpIJRLZDFPkrrmKD8Dmew1q0bT3HN5y8ZE6/6EoF3L8UsrPVy3yu10
         jB1u5EHhE+X7SIR28smv9725r49t45Jbq+TpoVEPqQ0lYbgzV0QsWwwh8PNxIM8n5d9E
         8Hpg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790014358; x=1790619158;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=QHAP+ThF7TxWgEqj8k74itg4E2H+sNPwvnziw5xjhM4=;
        b=YHxTQGe9BGtlIQZvBjq1J0VzyXaVMAWzdHQVxL3bXsW0cUA9r7unShH/FZUSWDLAs+
         va1KaWhH+QbGaPfJz6lhtkDFQjKsKbc5DBbhWF5JDsx4Tqe1C0u0TnAS+LR4HRj9RdSp
         rJKlvE2lKIxz4aBoV6f9T1pvGwR8POTWccMqztV11AnR9vSQvFCyR0M3cMimD0cKbRGr
         b4KQYEXgVxHsR6rQZB6wSK6sVAyHvO10gwaZJi0klFEEaDfzpvo0Ibe6YW84Dj199sdQ
         zy8Pg0dPJvQCKbupp4XCogCY8+18ITRACS7VjYLIZ4Ihpsu7VoszVL0SSKogl2DgomyG
         4RiQ==
X-Gm-Message-State: AFuF++n/YafRr7dd3JUhpBZCTGQ54jwufibHVA9ekvmWpgGChvw7sk4I
	DxBTP7pu5MmT2MUmdis6imq/dg6YYNlf0DPIBSmx8TxsxNygQYkXKjEZmmJwKSh4lmbh/TrC2ot
	BPBBsxTyFknlMLyX/db/CP61LbeWOfMMm21FZVOPrM7m9kt6DIuwgZ/Cb
X-Gm-Gg: AYBFou2k/qnSzq9XjR7og2j1nWjkfk6jJVBEEaR8RC4P1y5xvZZpX2DeN1IO0QT7ro6
	k8l8WCoXKg+8nRSU77+poj74kXLLXzE4nsJwydTT8fnQjJzW0N0swXueYzbrG5uPqoi4q32Q1R5
	mZEY7MHj+i50rvCumsbL19Nok5F+eNG8MBqrPWgDbvjuDBXBD3TJzBhZjgoCRn/8OYms9zDLYx2
	SgQUxvRJb/TMQDCb1zz2pg+K+Ag8O47EhwDm9FlY/lJoy+627QrI+br9AGOLA3w4q5eVCXBRFpc
	/c6Wl30upTUT7NG42kJsY9C2dTSKDy8kWRYfZ5sgdwKi2F8ZGYAWSIzcGD14OUQzM9iqzjefuvV
	IcsqA1GQb
X-Received: by 2002:a17:902:ce12:b0:2cf:4353:f117 with SMTP id
 d9443c01a7336-2df5aae1b6dmr518255ad.0.1790014357595; Mon, 21 Sep 2026
 11:12:37 -0700 (PDT)
Precedence: bulk
X-Mailing-List: sashiko-reviews@lists.linux.dev
List-Id: <sashiko-reviews.lists.linux.dev>
List-Subscribe: <mailto:sashiko-reviews+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:sashiko-reviews+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <ag8X7gcDw6jpJsLq@decadent.org.uk> <20260921175719.846883-1-irogers@google.com>
 <20260921175719.846883-2-irogers@google.com> <20260921180544.064DB1F00893@smtp.kernel.org>
In-Reply-To: <20260921180544.064DB1F00893@smtp.kernel.org>
From: Ian Rogers <irogers@google.com>
Date: Mon, 21 Sep 2026 11:12:25 -0700
X-Gm-Features: AcwNN1WtQRPw4NjyM-aaF9lzmK2cNFGQrwApgnAZh98Wf0nWalcexW5EAz7_hpk
Message-ID: <CAP-5=fVQui77+75dHLMgddUM2P3GhZqV2wbdVUkcG_6jwWqECQ@mail.gmail.com>
Subject: Re: [PATCH v2 2/2] perf tools: Put Python bytecode in output directory
To: sashiko-reviews@lists.linux.dev
Cc: linux-perf-users@vger.kernel.org, linux-trace-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Mon, Sep 21, 2026 at 11:05=E2=80=AFAM <sashiko-bot@kernel.org> wrote:
>
> Thank you for your contribution! Sashiko AI review found 1 potential issu=
e(s) to consider:
> - [Medium] perf: root filesystem pollution or build failure due to stray =
slash in PYTHONPYCACHEPREFIX
> --
>
> commit 3de8bc01d44a9b11e10c327ec26bbff8605926df
> Author: Ben Hutchings <benh@debian.org>
>
> perf tools: Put Python bytecode in output directory
>
> This commit sets the PYTHONPYCACHEPREFIX environment variable to relocate
> the Python bytecode cache directory to the output directory during out-of=
-tree
> builds. It also updates the python-clean rule to remove the new cache dir=
ectory
> and perf.pyi.
>
> > diff --git a/tools/perf/Makefile.perf b/tools/perf/Makefile.perf
> > index a0b23d20d005c..50bde95c78a54 100644
> > --- a/tools/perf/Makefile.perf
> > +++ b/tools/perf/Makefile.perf
> > @@ -397,7 +397,8 @@ PYTHON_EXTBUILD_LIB :=3D $(PYTHON_EXTBUILD)lib/
> >  PYTHON_EXTBUILD_TMP :=3D $(PYTHON_EXTBUILD)tmp/
> >  export PYTHON_EXTBUILD_LIB PYTHON_EXTBUILD_TMP
> >
> > -python-clean :=3D $(call QUIET_CLEAN, python) $(RM) -r $(PYTHON_EXTBUI=
LD) $(OUTPUT)python/perf*.so
> > +# Put Python bytecode in output directory
> > +export PYTHONPYCACHEPREFIX :=3D $(OUTPUT)/__pycache__
>
> [Severity: Medium]
> For in-tree builds where $(OUTPUT) is empty, does the unconditional inclu=
sion
> of the slash cause this to evaluate to the absolute path /__pycache__?
>
> When Python 3.8+ runs during the build, it appears it would attempt to wr=
ite
> bytecode files to the root of the filesystem. Could this cause a regressi=
on
> by breaking the build with permission errors for unprivileged users, or
> silently pollute the root filesystem if executed as root?

This is already the behavior. The difference now is that instead of
multiple __pycache__ directories for the directory the python script
is within, there is a single top-level __pycache__ directory that is
handled by the clean step.

> [ ... ]
>
> > @@ -919,7 +920,12 @@ $(INSTALL_DOC_TARGETS):
> >  ### Cleaning rules
> >
> >  python-clean:
> > -     $(python-clean)
> > +     $(call QUIET_CLEAN, python) $(RM) -r $(PYTHON_EXTBUILD) $(OUTPUT)=
__pycache__ \
>
> [Severity: Medium]
> Since $(OUTPUT)__pycache__ would evaluate to __pycache__ in the current
> directory during in-tree builds, would this fail to clean the incorrectly
> placed bytecode directory at the root of the filesystem?

Same issue; yes, the build would fail but the build would already be
failing if this were a problem.

Thanks,
Ian

> > +             $(OUTPUT)python/perf*.so
> > +     @if [ "$(abspath python/perf.pyi)" !=3D "$(abspath $(OUTPUT)pytho=
n/perf.pyi)" ]; \
> > +     then \
> > +             $(RM) $(OUTPUT)python/perf.pyi; \
> > +     fi
>
> --
> Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260921175719.84=
6883-1-irogers@google.com?part=3D2
