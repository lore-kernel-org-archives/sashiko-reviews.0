Received: from mail-qt1-f172.google.com (mail-qt1-f172.google.com [209.85.160.172])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5D8E038BF8D
	for <sashiko-reviews@lists.linux.dev>; Wed, 24 Jun 2026 16:11:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.160.172
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1782317512; cv=pass; b=WJ3WHFLNJeh2uKuMtH8O+DAM3CX1ULYL2SGMJqC2wvHcSBF2zo9zerU//+U+zY9e1MjFW+oxhWc+UTXTK3T3DNaNHty1p6vFbDXzVRtifppd0vJq22dJXbAJN6NxI4UTWmEABRg6GbFei7IhooDqxwceUhcTjWh1Xfq0TK87ue8=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1782317512; c=relaxed/simple;
	bh=i4e86Jwp+OIhxo/bQ7S5pnJZz/h6kWIWtcT0Ec4iL3A=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=bvaE5+iJnnx1doYcAcDkIWUmlKPethrZ0gbefdjNuL+zEr1DojZcxftjktvJCgUWQTnjdr93kWuHiV834J/0wF/luThdmoawJTuoI5vKo2etlUpuSnA7voOEAqkP9FY6Bl95tgjaSlLHs7PFl3FyUiK5ziDz7INBdiV6xDRuddE=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=vs6HSUPc; arc=pass smtp.client-ip=209.85.160.172
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="vs6HSUPc"
Received: by mail-qt1-f172.google.com with SMTP id d75a77b69052e-519ed52bcc6so333021cf.0
        for <sashiko-reviews@lists.linux.dev>; Wed, 24 Jun 2026 09:11:51 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1782317510; cv=none;
        d=google.com; s=arc-20260327;
        b=NHeCNx6lQcOS2cjsUgwOqJ+4POei21j2OJq1CZAOWOBRtrbPIQchRdTKDb/5UqIt1N
         WdCKG7WAzsNNp1dLDyh5J59DERV1dak5HD5xod10+dRnQGnlDP1LmlK8d7kKPGbTgqQ7
         wbr2zFcpO6xXHyM/evPvf9jEeDtUNRwO/Q4AB3VWNVV0duiVS8D3smsrooagKw7goBgX
         iPJyQCc3NmorUBVR1fOQJ3iJKKusrhoOL9+x0cDCSUOrBTcz4OJ7zEWieuw0lfXb9UuO
         GG0lYzHR4Zj/fjkqL3KVj8DwMq52Iv9QJqTfcej1V8h+dchxc+nTYSaFqa+EhfaCTy/y
         KsOg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=03HlajHYUVXQega1jc/AIpR2MEQ1MKGT9erwN37eJR4=;
        fh=udba0pH2dL4K77eaNcWQL+PuV/Tx2h93m7qfDF6b09c=;
        b=TlzzSKMlKWU5ji/iqZ9f+EIBgenMPBuGqBT+mlvNmgEJDFx9nsrvWH2Q6/Cksj3hFE
         KP5ir3xgnIO0EZU+0YXFsjukRNLq4EHQvo2darFv2owsbZUL/mI8J5YEoCfBPpY2TVo9
         l7v20v9XM+SB8gkM6VJqSDA6Ma2+obQbxsHmsOgdhTkiADE3GT7uWtIewSsgoRxl5NXr
         lQ/3yUXMq/M+kx2Hg4yvdXjm+Z90swulaco9y7tjuRZ8Ih3JHYdibTWI24sEGV8i13l2
         kZVgyyxx18RIqdr098+uAJVh3J88vFW/K1orqmFOBGKXcIxA6QkA4tGRRKmOcBsS6qiG
         0tFA==;
        darn=lists.linux.dev
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20251104; t=1782317510; x=1782922310; darn=lists.linux.dev;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=03HlajHYUVXQega1jc/AIpR2MEQ1MKGT9erwN37eJR4=;
        b=vs6HSUPcoHPolvag1c+dYrHoayTMdTQfIoDd8aGZUvod0ozPftjxq7Ac+n0YRCAylE
         jz0QWjLIqGmpLuS5MExGmZulGu1fkgFAWMrxERdK9eUOtoQ/G4BDnTGYRw4aS+pbu7zF
         V7SlcnLPN5olHfe0Hm1P6KNW+KCccnfduu8Sp+GytXapYcwnIT2wAaVXhZ0dFUk5/zgo
         OBaUPpC3TRdEGOtBGr5RTgFPUozbWa010HjLRmqhVv+2UCv/znprt0l2NFBMGyCbVj9w
         nJj9aYBYZZM0+nZdc1KE70C2mvAqwr8ENmk3oLKf6Ypt/7avQYmJBLD2Fd32CM0Ep5bO
         qRuA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1782317510; x=1782922310;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=03HlajHYUVXQega1jc/AIpR2MEQ1MKGT9erwN37eJR4=;
        b=ToWgSSwBUQ9be6LyR+/zaqfUp4BK36MC/uect5uKAr9yTZQgS22XLwHXp5V8hzb19a
         UTq/L0uA18ITw2EdYf9hQzvKzPRU1pzY7HaKUUdv+dxTcbeyXqG9QlKxtCyPd0ckhjtl
         1XZEeoEUxnJEql2YSAHYW5GAnXRoXajrYxhrpcYeWwwm6r5GCzSU9iF23Gb470PhUkNl
         diUTF1DozuqdiUg8N5gaj7txfrdDJrWAkRWfRKsQGJFEHTJq36Ai5ztt5kRZiq9LESAT
         c7d0qXEtiSgIv5uZCOB4mXCMDnJtZe5n1EilnOuAAq1KK/Maf3LHxQYBxRuln3pxE3MD
         0uXw==
X-Gm-Message-State: AOJu0Yzm9iDiHZEzzUmsUawNKCX0L/8HA1YbwqNZlSojDCU0KW8IbHSF
	pNq1nflvNtTP5epbhIn74wC+kRpU+UGXZtBjVD3XazqTueC2avTNOTEg6F5Qcgjo4LlZDlE9RFe
	fJ0t3RL9MQXJ9xoiOYe7jqgSeON5M8H1FhcpPZ82u
X-Gm-Gg: AfdE7clpGpcEjG5AjqB2dI7EA3fL/8BHM+Ccw/qDr773n3wXbWVdnE2Ee7AlMWTo6vu
	hO8di3ogWfSWuwfgg/WHRXVz0Njbi6jixDuwN7mHQzLfkV4q5SaxCvgNyWu45WdFevO/koD9/u6
	+6vl4cCdDpEKxrzoDTMfs/vZER4iYug4gPgy5BmldPV4P9TP+RErxhGT4ryyAGTPcM8e/hk2cBq
	hK7zvPRzhYiJhk3p4ogPQSUAtKpKAGx+SY0Jn0zJSnnxFE+YBHnu7l8+EPhhYxHYic5UrRrCmBP
	CsyxusQEqlksvWfn/vtvvJAvijU=
X-Received: by 2002:ac8:5d46:0:b0:516:4f62:85ee with SMTP id
 d75a77b69052e-51a628a18f2mr177831cf.19.1782317508374; Wed, 24 Jun 2026
 09:11:48 -0700 (PDT)
Precedence: bulk
X-Mailing-List: sashiko-reviews@lists.linux.dev
List-Id: <sashiko-reviews.lists.linux.dev>
List-Subscribe: <mailto:sashiko-reviews+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:sashiko-reviews+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20260622-alloc-trylock-v2-0-31f31367d420@google.com>
 <20260622-alloc-trylock-v2-5-31f31367d420@google.com> <20260622101024.B89C21F000E9@smtp.kernel.org>
 <DJFI39RWHV1O.MMMMMZSK8E8C@linux.dev>
In-Reply-To: <DJFI39RWHV1O.MMMMMZSK8E8C@linux.dev>
From: Suren Baghdasaryan <surenb@google.com>
Date: Wed, 24 Jun 2026 09:11:37 -0700
X-Gm-Features: AVVi8Cc2zHvrDuEdKpPHHKmUg2PGDzxosR3pi7Y0Yans9uRd-KXWtfdx2gyhT20
Message-ID: <CAJuCfpG9SS+-3St3jBqku3mJrZ4+OQpiuKkZSAaL7r3r4AbtmA@mail.gmail.com>
Subject: Re: [PATCH v2 05/13] perf/x86/intel: Use higher-level allocator
To: Brendan Jackman <brendan.jackman@linux.dev>
Cc: sashiko-reviews@lists.linux.dev, Brendan Jackman <jackmanb@google.com>, 
	linux-rt-devel@lists.linux.dev, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Mon, Jun 22, 2026 at 3:20=E2=80=AFAM Brendan Jackman
<brendan.jackman@linux.dev> wrote:
>
> On Mon Jun 22, 2026 at 10:10 AM UTC, sashiko-bot wrote:
> > Thank you for your contribution! Sashiko AI review found 1 potential is=
sue(s) to consider:
> > - [Medium] The commit message factually misrepresents the API differenc=
es between `__alloc_pages_node()` and `alloc_pages_node()`.
> > --
> >
> > commit a5667683e56825d97c5814c0349e4de3300e3e14
> > Author: Brendan Jackman <jackmanb@google.com>
> >
> > perf/x86/intel: Use higher-level allocator
> >
> > This commit switches the memory allocation in dsalloc_pages() from
> > __alloc_pages_node() to the higher-level alloc_pages_node() function.
> > It also updates a comment to reflect the API change.
> >
> >> The difference between __alloc_pages_node() and alloc_pages_node() is
> >> that the former allows you to pass NUMA_NO_NODE.
>             ^^^^^^
>     Sashiko is correct, that should say "latter".
> >
> > [Severity: Medium]
>
> Seems like an inflated severity rating, this is basically a typo in the
> commit mesage, and anyone that noticed it would probably have realised
> what happened.

With the fix of that "extremely medium severity issue",

Reviewed-by: Suren Baghdasaryan <surenb@google.com>

>
> > Is this description of the API differences accurate?
> >
> > Looking at include/linux/gfp.h, it appears the capabilities are actuall=
y
> > reversed. alloc_pages_node() is the function that explicitly supports
> > and safely handles NUMA_NO_NODE:
> >
> > include/linux/gfp.h:alloc_pages_node_noprof() {
> >     if (nid =3D=3D NUMA_NO_NODE)
> >         nid =3D numa_mem_id();
> >     ...
> > }
> >
> > Meanwhile, __alloc_pages_node() expects a valid node ID and contains a
> > VM_BUG_ON(nid < 0 || nid >=3D MAX_NUMNODES) check, which will crash if
> > passed NUMA_NO_NODE.
> >
> > Could the commit message be updated to clarify that alloc_pages_node()
> > is the API that safely handles NUMA_NO_NODE?
>
