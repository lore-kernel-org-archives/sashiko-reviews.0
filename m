Received: from mail-pl1-f173.google.com (mail-pl1-f173.google.com [209.85.214.173])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 54A253C1404
	for <sashiko-reviews@lists.linux.dev>; Sun, 17 May 2026 17:21:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.214.173
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779038507; cv=pass; b=b1+gqGn4QDZvlfjbQ3QlL++GaY6sVFLKBsoPVL5+YoDCMBQF2vxLQHZ2uwupnHVnpNGVizbjUGvXB56KnRPebWebWvyOq5U4vSD3zZ4uwzPTuwOkfzTwU5Jff5NjrUfDz7Mv9kPVdYK3uQo54ehlG6hB4LegqoV0tlHUvJX9CYw=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779038507; c=relaxed/simple;
	bh=aPJ6l4K5VDLP8O6wMFzmNPEZXhlE2m0bYZNICDB9cRg=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=LtFQzN4okmb9MSGZQdbRbepYrtFh1GXvrv6XqqNHXMysZTy2fM9z+bkrFJTnAciR5Yif49mogPxZQQoJsIeFpcevY5+bT7LmTH2tAheSygzX9vUj3Onma60oF499uVnqMbtDe2BoBZq2RDSvpQKwHZNq+oKUAkwp7zCMGE6s3Js=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=tUaWbw/4; arc=pass smtp.client-ip=209.85.214.173
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="tUaWbw/4"
Received: by mail-pl1-f173.google.com with SMTP id d9443c01a7336-2ba180a022dso15ad.1
        for <sashiko-reviews@lists.linux.dev>; Sun, 17 May 2026 10:21:44 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1779038502; cv=none;
        d=google.com; s=arc-20240605;
        b=g2m5AnSzRTJqYyAKslhVPEBycsEdK57y+bajG/47KdkUYsmilhn9zvN9s8MTK0Bp2l
         W8VH9lMFPxmj5B0LQFiXT7Jutc3gCrgObQiGiF32yGP1+VIIHF7RgGXeDM93Nspzx4Jo
         IRQqKoczkNXO7DDZk8JnXCA0ViduRiEnaJ/ifZTCFMBjg09xsj8kk3hb5Pb5ynNSjKCP
         GPLUMYLGVFPdq4LjRdN1tswwvBR+j4RElrcZQtN9mczk7M5Ltoy0EScdWfIlEVasADFN
         cm8FfHUfBeTozvnvq056F2otVdnLqHbQ/TwYzEPWcKTSfNsZutmmpK+0XeuM53Y7j4Tk
         tJ0w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=aPJ6l4K5VDLP8O6wMFzmNPEZXhlE2m0bYZNICDB9cRg=;
        fh=6/+p72sCy7cAFRjOIdttegdodMuDLgxAAg/Wgl3twWY=;
        b=CQrnDbxl6nCioNQOB9ez3afv/H+Fpl24k27tI2ly/RSpBzgJN+dV7PPSvNfYf6SyMw
         lozmoDP7oHqpHyL/FNPRcCSWa1B4FxbzGhVU3HkGEwtDOQYfQ76MJCT4oBX/wlIx8iDF
         i3YLI+jnz47DiBKZ0ZbkKw/dURaqIyBnS0L0LPXPRQf00YFoQ7bDdWcI0EqXKDLOkh64
         qvT8QWo/ZvHZ7ePp0lRR/1GktqSg7jXCuZnijduZleTQGiYwvWX7CMSxMMoT8tE0A5BF
         1CXKsjJdKz/cL3jvGtHOjPGyeCmBysmDvcyJXOKFKc0r8UhRH9n6DVkkapitiPVE+DLb
         cd1w==;
        darn=lists.linux.dev
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20251104; t=1779038502; x=1779643302; darn=lists.linux.dev;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=aPJ6l4K5VDLP8O6wMFzmNPEZXhlE2m0bYZNICDB9cRg=;
        b=tUaWbw/4IQO7RV7iO5/sm51G6A2TLExV78N80QVlYKUfVNrn1o9UYv+ayWeFYAfXWN
         1xL6OeSAnv4/Ci7lr1wudBFVtGHlkl7r6Ks2bQJqosp2BhAjzFOewdR5wTmzAREfZgkA
         ZPbNssG/ERnI8pCjRP2ndJXSi1TeeBiG0iG4TVkY4bRw+mLCM42RCxSIzKPxn30rkPxS
         0zC7ziUhdkJB2A7VtjOgl8qHnFCraCrYSnDmpFF0z5cmumm1/372iOrUZTYshMcai6Lf
         bJjVKCIm/CI8imNQwrUI2JcAOp2jh4pNP09FLdi+gIFY/jBFPem22/AKwrOlKuuIDqz5
         mCXQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1779038502; x=1779643302;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=aPJ6l4K5VDLP8O6wMFzmNPEZXhlE2m0bYZNICDB9cRg=;
        b=ZYHw0PfAUWk3i+tdeyLDH8vIuGVqF2Oi1svTzfTB/MPS+wZlLiEsRiP844fVvcajct
         3Ehrhvz77Xo0o8qerQQsDWKBryC+QBQs7r/+iLmL+eCw39ymgJdzWZS+4vVVkFm9AF12
         HhgbfMghkRD4o87FiQwxd0uQi6A+m+EePIhydwcwyLu/3b8hGgmGTuBHZHVOUTH14laE
         Xx2J6PWd6rGt92hhLiL3He1VWYcGsUSQtjcKZBqjYzLyZD7bOtoirK8ZQEuFPvlwFBxC
         jJkPexXeSVStQAebcD5RP1rNwMO4vpbVkXkAaNV4rGdX1jZb29J+jmWdHBZZmzfHCW9p
         4MbQ==
X-Gm-Message-State: AOJu0YxqjBrBIUDZgu4iHTVcYPm/7YgZroUDdslO/Q9Jl80OU8rOYAhq
	cxxYWCAZ4TqWl+yUIvlFVabGNnGwDQ5lVw7V27c1TsLW52dEMHkVGuKmO80ZNgibC/H//KK1O07
	SuZUMCDDnVRIJjweclF0eCqDHdOYznQkyrgmGGbiEdB09jX6eBMRTBQOx62s=
X-Gm-Gg: Acq92OFjxtP49hKhvNLyGRZdz9c04Y07mD20bn9csPgtW3u0cLPOGmFgFK9Dxva4BqH
	6gNmPEaQGydGQfWCfZwbXtF06E8B89xjvAT99Xk4l8N1BjCejhFGLqSEG02uUaVzj8g8tiXt68m
	hx2lvZ/c5bzsFNOcrplJVbPEPdRg9GJIRS0EqIpfcMAUFVfKBeWYJPIBD11oOg8HaTDeq2v/ttr
	gNrRsH0tytcKpyD6+3BnrGwK3rmuX1shuQU7S2QhkVnFA8vEctoV44DpBJwXs1pgkPto8lhLvQD
	9UZPl+5PvQbZDIRsmwY=
X-Received: by 2002:a17:902:ef52:b0:2bd:6dad:7ccb with SMTP id
 d9443c01a7336-2bdb32bb6damr1621875ad.23.1779038501863; Sun, 17 May 2026
 10:21:41 -0700 (PDT)
Precedence: bulk
X-Mailing-List: sashiko-reviews@lists.linux.dev
List-Id: <sashiko-reviews.lists.linux.dev>
List-Subscribe: <mailto:sashiko-reviews+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:sashiko-reviews+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20260515180806.246914-1-sigmatwojastara@gmail.com>
 <20260515181547.99D82C2BCB0@smtp.kernel.org> <CAP-5=fUV6W=TBXbCHARMJwm1Pjb4uJCO82EZ3fjU7jsiR51t0w@mail.gmail.com>
In-Reply-To: <CAP-5=fUV6W=TBXbCHARMJwm1Pjb4uJCO82EZ3fjU7jsiR51t0w@mail.gmail.com>
From: Ian Rogers <irogers@google.com>
Date: Sun, 17 May 2026 10:21:29 -0700
X-Gm-Features: AVHnY4KdT5rjjwznCh38hIDbeBmXMvzC1f47yJU-7v-Yd1spQDbtuPjNa7IT6DU
Message-ID: <CAP-5=fXt50fNw3=CCJ97VHGAb-8gzjEz1fPfnVK4kLQbWXSJvw@mail.gmail.com>
Subject: Re: [PATCH] treewide: replace /usr/bin/python3 shebangs with env python3
To: sashiko-reviews@lists.linux.dev
Cc: Oli R <sigmatwojastara@gmail.com>, linux-perf-users@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Fri, May 15, 2026 at 12:40=E2=80=AFPM Ian Rogers <irogers@google.com> wr=
ote:
>
> On Fri, May 15, 2026 at 11:35=E2=80=AFAM <sashiko-bot@kernel.org> wrote:
> >
> > Thank you for your contribution! Sashiko AI review found 1 potential is=
sue(s) to consider:
> > - [Medium] Commit message states it replaces `#!/usr/bin/python3` sheba=
ngs and causes no functional changes, but actually changes `#!/usr/bin/pyth=
on` to `#!/usr/bin/env python3` in `tools/perf/tests/shell/lib/perf_json_ou=
tput_lint.py`.
> > --
> >
> > commit 7d3e9689ede53be80434b3ba8cd07c27777d11ad
> > Author: Oli R <sigmatwojastara@gmail.com>
> >
> > treewide: replace /usr/bin/python3 shebangs with env python3
> >
> > This commit replaces hardcoded /usr/bin/python3 interpreter paths with
> > /usr/bin/env python3 to improve portability.
> >
> > > treewide: replace /usr/bin/python3 shebangs with env python3
> > [ ... ]
> > > No functional changes intended.
> >
> > Is this description accurate?
> >
> > [ ... ]
> >
> > > diff --git a/tools/perf/tests/shell/lib/perf_json_output_lint.py b/to=
ols/perf/tests/shell/lib/perf_json_output_lint.py
> > > index dafbde56cc76f..dccafd507bb79 100644
> > > --- a/tools/perf/tests/shell/lib/perf_json_output_lint.py
> > > +++ b/tools/perf/tests/shell/lib/perf_json_output_lint.py
> > > @@ -1,4 +1,4 @@
> > > -#!/usr/bin/python
> > > +#!/usr/bin/env python3
> >
> > Could this affect functionality on systems where python defaults to Pyt=
hon 2
> > or is managed differently?
>
> The change looks good to me, but I wonder it should be split into
> separate patches for the different subsystems. We do not care about
> Python 2, so I think some review prompt improvements are necessary.
>
> Thanks!
> Ian

For the review prompts I sent out:
https://github.com/masoncl/review-prompts/pull/62
https://lore.kernel.org/linux-perf-users/CAP-5=3DfW5Wozj=3DF2dnXoLTWmUjudNW=
Lyjjg95CuP3Jk9bLcYwww@mail.gmail.com/

In case you are interested, I'm trying to clean up perf's python code
in this series (v1 sent Oct. 2025):
https://lore.kernel.org/linux-perf-users/20260428071903.1886173-1-irogers@g=
oogle.com/
Testing and reviewing is always appreciated!

Thanks,
Ian

> > --
> > Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260515180806.=
246914-1-sigmatwojastara@gmail.com?part=3D1
> >
