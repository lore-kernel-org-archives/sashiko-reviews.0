Received: from mail-qk2-f12.google.com (mail-qk2-f12.google.com [74.125.230.204])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5F230370ADF
	for <sashiko-reviews@lists.linux.dev>; Wed, 16 Sep 2026 15:54:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=74.125.230.204
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789574073; cv=pass; b=q8KGEchvOK5YKzqKTJXlcFRzmki3xv9trMa4AlwCb+Ok2IkVlBp3ohIcZ3f2FXFtGXzW5RZZbKTBYaGgGJ+ISuh7HvDo8VXvkzvsOb69zjoXobdJdpmfABq3jF1f4sd15zjuCSc9ou8bD43xbi5u+/EYweaS9f63sz0VVC8Yejc=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789574073; c=relaxed/simple;
	bh=7TPfKC0S+AyjVWxEL3kMuQSa0P4aYfLH4X9y6XPnkiM=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=drXh6pn7YkW6zeacT9lHt+WKWWBXJJXPyf3bwhyQGTTYZ6LXVdT0P7AZ970al7I9DOV4NKnFdKyt5z9vPaQO/2q36yAnxNjt2WSX9XwxZVCwx0ZSkuv7XKBQIyr2jhZktXtt2NExnzxKx+OrWcrML64f5bVK1SHp7LsC1nhnGS0=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=ZDQM3/kN; arc=pass smtp.client-ip=74.125.230.204
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="ZDQM3/kN"
Received: by mail-qk2-f12.google.com with SMTP id d75a77b69052e-530411c7ee1so306681cf.0
        for <sashiko-reviews@lists.linux.dev>; Wed, 16 Sep 2026 08:54:30 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1789574069; cv=none;
        d=google.com; s=arc-20260327;
        b=sdt223IPcnAw3V+ajLHGyBF8aisDWQY+EGHnD/pXnpFO4R+/gLyaylDIQgXu+sPezy
         Ip5EXi0MFiRPNH4TO9fTWpAFjEh/OQysx3tq0K/A0uNJeJdTnMRWkYbuSkBzThy94Pkt
         LeMewTDiEvy1LS76tZXjikJJEYlN/Nou2EsflLokJBRXbTYDdycipwwJdAyMxR3G920S
         nywOnghHVDbum1QrncXvXz9Al1jXewJmDgiiMMkzYulHUaH4R0kcZ4dYTk6DNNX4QDVV
         NhKND4t797W7VauTN9IEjyXcXASDh6th8g37bdmGxsX4Dz0pkfli91P5xyPC6UJwqRKp
         l7uw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=LakOb0bCO9P4LHmMzGLPHsI3voGyQnWQGSKhp2smfTU=;
        fh=0zVHGC//SC94CWFKHtFt4lnskmkXkJNNy7lE0FDd3Ck=;
        b=HFnq5PFznsWCgJggUuCrApGUEbscPiI0nnPHX+Iz4KzCOKO5Eh6rEjtxUlOicwbXnn
         AHA3k275PgAJgwxKE1ozRUZIs7R8xc8w6iQhIATK8cZP4EDSY1bgWavjz9r+aL4LNQT2
         j/h+xN3vLiEh10SlTTP5KKYMB62I2FLMq28XYZjxO9TmyklqZ4nSbN1agZJmoOiT5+qT
         L2DgJpXsBhK+xeLjAqxWbBsr2imQ+cqI+GxCgjqfXYCdCia8erszOReTri5tOhw/VwS2
         UH3PnRhri2GOgCgnRGZiDzjSTWqer39uN5VSYs0JuTUe+Su6cUb22xPlIzmXr0ompad3
         zHFw==;
        darn=lists.linux.dev
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20251104; t=1789574069; x=1790178869; darn=lists.linux.dev;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=LakOb0bCO9P4LHmMzGLPHsI3voGyQnWQGSKhp2smfTU=;
        b=ZDQM3/kNyRrE5oQ/53bMHRhIS2hyne5DgRSseZtzmB6/ml7ARQsx4M40vBRDRdxbIx
         2oHztcfZtFCdu0aMJjuGBmLmNjO1ZqAjI/Rc6TwGT0MaGuhDrJW8ZrIaMlX8YhMmcwAE
         AmjeuGRaHo8Tx/4fctgNrRHEJE6o1jFS/9k3jrq1AcyI2nyNDqRXnpL6ypqdPGjt4T0D
         xqETlbaYshqo3nQUJgt9+HXrgoUbGNZihrvTjwsDoU4UEHyceEtQCOlCx/PMq6aq9JtL
         xq4GvO60t2LYUfz0D7YibA/ryPOuY+KXXywyJ8Bn1CnbKHt0nNLJNMudAsRlhLy3rv2g
         nanw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1789574069; x=1790178869;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=LakOb0bCO9P4LHmMzGLPHsI3voGyQnWQGSKhp2smfTU=;
        b=sUDRLYw7jg4LpWb0ncWVboBpz7IWEUMq0sU6Riqn/aFxoTLD8gN33DYlFrHQgAY/4J
         aQ9dOVJhKM5GLBV7USA8SzCNzkp1V4SQtn4rUUl51MG4KCsCkCQR7joK3k5PObgJkBwM
         sM/9gpOrQC3bLAp4vHmsnqYNMMUcgDMbScboZZnKHsh33XwCM/iA/bbho+dC7uGc/PwT
         kv1hdYGrf1C/qxiZqQjBnGVxGXag1Cm1sr46a5EXDX4jBkpXaRC2VVtuQDLzioJ/QFXm
         BwnGWhY/TM3tR6MunbaLaM4Jyr9IzaGFF7FjZr5qy7s56dkwJRM91o/crDnnoW/5ccBt
         OlrQ==
X-Gm-Message-State: AFuF++k6czok470V7btjCrUODjyyYgcqxZF2/YlWPyw+BQFAmfUXf6D3
	Rh5F/wkKsq8BoeRTBeu2HLlyed52NB6Ipd0teeqNEhR+nymdIisCN+/IjyfKoIB0oCjRgYzSi+U
	3qINGePtZ8PU6OPyg41vPu3zXSFKgRb/ypmZRLlB6CZpoRlrawkp0Ok22Yn/k+Q==
X-Gm-Gg: AYBFou0qpW0HXAzGfQtDrn6A+kntGv6toJlI5iPWW0NfozIVwzQBfPGapvka2zxCzs1
	lTLDy71Ux9IhIPAKph65kFhzUwy2m7bnM6ufXPW/XX0QCDh7Xvx0grkvJFK722A7cslR2jIRDY2
	ZXFxzGwl7+ntQC1BmtF/6G+raFHyJ0P9fr43iavM1Bzu9m9x8fVunIXhJILsvAhytoYraCeVSCl
	V4twKD89OTMj8r74bK3A0xGGB2uB0yvVZzrS3AHdfMzfeF4jQ8oDY2U3uK5vvq51zSQi8jq6BTe
	LgUZ3OwSlErce3Oq1UP8yg+Ex7kVumwJDgAy2GpLSkdJrPIqaAFgUpp4BlPgJE5EByvFnIUAArZ
	69FGlWEGb
X-Received: by 2002:ac8:7f09:0:b0:531:282:6560 with SMTP id
 d75a77b69052e-5327e6f2a86mr15289401cf.15.1789574067947; Wed, 16 Sep 2026
 08:54:27 -0700 (PDT)
Precedence: bulk
X-Mailing-List: sashiko-reviews@lists.linux.dev
List-Id: <sashiko-reviews.lists.linux.dev>
List-Subscribe: <mailto:sashiko-reviews+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:sashiko-reviews+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20260916061218.3061216-1-irogers@google.com> <20260916061218.3061216-4-irogers@google.com>
 <20260916062233.192271F000FF@smtp.kernel.org>
In-Reply-To: <20260916062233.192271F000FF@smtp.kernel.org>
From: Ian Rogers <irogers@google.com>
Date: Wed, 16 Sep 2026 08:54:16 -0700
X-Gm-Features: AcwNN1V-7vNOQhejVrikEYGwQUihp15qdbep1GsDRqgE0RceZn_9nikCmJynvoE
Message-ID: <CAP-5=fWNMrnB9KNjCGOc0A+kwvWWsxYc092x=q6CLK+-g3nwFw@mail.gmail.com>
Subject: Re: [PATCH 3/9] perf libbfd: Include the headers that are used
To: sashiko-reviews@lists.linux.dev
Cc: linux-perf-users@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Tue, Sep 15, 2026 at 11:22=E2=80=AFPM <sashiko-bot@kernel.org> wrote:
>
> Thank you for your contribution! Sashiko AI review found 1 potential issu=
e(s) to consider:
> - [Low] perf libbfd: build failure on musl due to missing <stdarg.h>
> --
>
> commit b4b64b7fbd73cf480fc5aaa2ad17802e8f46fbcc
> Author: Ian Rogers <irogers@google.com>
>
> perf libbfd: Include the headers that are used
>
> This patch explicitly includes several POSIX headers directly into libbfd=
.c
> instead of relying on indirect inclusions. It also reorders the includes =
to
> group system headers before perf's own headers.
>
> > diff --git a/tools/perf/util/libbfd.c b/tools/perf/util/libbfd.c
> > index 131bfedf48cdf..1b23a261a9ced 100644
> > --- a/tools/perf/util/libbfd.c
> > +++ b/tools/perf/util/libbfd.c
> > @@ -1,5 +1,19 @@
> >  // SPDX-License-Identifier: GPL-2.0
> >  #include "libbfd.h"
> > +
> > +#include <errno.h>
> > +#include <inttypes.h>
> > +#include <limits.h>
> > +#include <stdint.h>
> > +#include <stdio.h>
> > +#include <stdlib.h>
> > +#include <string.h>
> > +
> > +#include <fcntl.h>
> > +#include <pthread.h>
> > +
> > +#include <tools/dis-asm-compat.h>
>
> [Severity: Low]
> Does this inclusion order break the build on musl libc?
>
> Because <tools/dis-asm-compat.h> uses va_start and va_end in an inline
> function, it strictly requires <stdarg.h>. Previously, this requirement
> was satisfied implicitly because it was included later in the file, after
> other headers provided the necessary declarations.
>
> Moving <tools/dis-asm-compat.h> higher up in the file exposes this missin=
g
> dependency, which will cause va_start and va_end to be undeclared in stri=
ct
> environments like musl.
>
> [ ... ]

I don't plan to fix this as the issue is minor and relates to an
include, not the code itself. The series has no other Sashiko
feedback.
https://sashiko.dev/#/patchset/20260916061218.3061216-1-irogers%40google.co=
m

Thanks,
Ian

> --
> Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260916061218.30=
61216-1-irogers@google.com?part=3D3
