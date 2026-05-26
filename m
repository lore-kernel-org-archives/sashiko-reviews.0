Received: from mail-pl1-f177.google.com (mail-pl1-f177.google.com [209.85.214.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 399783AEF2A
	for <sashiko-reviews@lists.linux.dev>; Tue, 26 May 2026 03:28:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.214.177
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779766110; cv=pass; b=PHQyvfNVJGdxXn7qJ2CMW43Cbdddi6sX8IrvsLa3OJSRudYkRThVliUcOJfqHqYsnabmO/UTIimnCgL0oZMZnIUS4uG/86F+HHAijD40tl5Jry4ROV5kaLEuqHFPEeuzfgdbNVCW5uy1T9WxNW+5UmuJJaTDh9Mt3kirsx2cky4=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779766110; c=relaxed/simple;
	bh=rRu/0iaWsJif1xb7hh/aBKf9EfrFCNCKKgFYn26sXOk=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=iLCxs/HGO5/ed8q02L2E2n7c2Ko5hOoNyazB3cLxEY88WtQzavFY4eEHHWR/Z2eYY0xc72goYZZcQ/E2oZTL87g/d/dqh1493bX69n9kSfTz9zyp9MWRQmHuKEFamAN2Leox7XFrHoEZXJgF9N/8cWQjhdsTs6r5GsFgqpWsGw4=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=DXCC5zfQ; arc=pass smtp.client-ip=209.85.214.177
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="DXCC5zfQ"
Received: by mail-pl1-f177.google.com with SMTP id d9443c01a7336-2ba3b9bcf69so275ad.0
        for <sashiko-reviews@lists.linux.dev>; Mon, 25 May 2026 20:28:29 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1779766108; cv=none;
        d=google.com; s=arc-20240605;
        b=DxZKDgzTWLCZkHc+k93th/oncy/yFn4XCGhXnC37nhjyhrmVEo8yXbnpk7pQxZOPKM
         FE7DkLaMsLn3B1BzwS25muCzcn3gV2pLRKRoopEb4XdZ+6XfTRAHDBokJOYdg6dt9Tbv
         kUqzftDp5FP5nUT6A6fJN2XV9hbGdbZee62H96trQN2N0d3+p9EwReGgH7t/2Z6IPyQ2
         hliHh+YmaEA1eLO1//ZXeiWTeudMFe9+74t/LyMR3gI7yME2xNuWyZX6GhUjphW354fk
         hz1HOkAn1mKTbnPo3QY8aj8el9DlEq+qZJVGvjPSVE44pMI49zYpuLsW7xp0C4xkuNTn
         6WXg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=bCIgfrQN2ixgyY5Hi0sknw40cEjtfKKbdudOPWJQGso=;
        fh=5WRQmWey/eNyRfI5g/sWfeAyOoN5rwo1UMEZgJHZ3hQ=;
        b=U4dLlZwpYW2DWSNgjd1NuuFGIp4BYL3TB/l7O4FASOuRkIkhgswOorxdmf60OsD7Mk
         PhzR2rMIlpKNkYJLeqLVPliG/yxmmj4DqX9Ac3y49yHLuCn3oYxMp1BmXF7irRinjaop
         JxLgnx6r2FIXj8g17gOqfz1zU/3JwEgZdVyIT73bqRZuGe5L+/PFuFh2+g7kdNCmiKds
         rBGGmpvs/XGdD30JtvVefq4soN8N3YBmR1xu21N4VSDGCs1TGHUbnn8wy0cSOLNb3Dtk
         kduJ62xXLMhm1oMQ1H1gezI+C1A01bz2PzNhIM+RrJzW5HpVhU36hSq51kIIrg9YLqvJ
         GQJA==;
        darn=lists.linux.dev
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20251104; t=1779766108; x=1780370908; darn=lists.linux.dev;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=bCIgfrQN2ixgyY5Hi0sknw40cEjtfKKbdudOPWJQGso=;
        b=DXCC5zfQVO5osjx2nyZBvstcnhFfdsM9wrWC/9uudw7QlPi9jsOqrExmVZWkYk7ubN
         POZfZdDC7vcctUO+wYqQcgXOf6hjXmQE2VgJUG5ORTahMtXfLNe/ADanGHfjl4QYRZbQ
         R+eAbBcZ7laxGWIzIAFGyiCoeY08Fo6fcLZ1ScxuCQvatzEU6kl4lVRChAWX3fO+fm2w
         XYUJ+heYpwew5tuavYwFdGHkzUWeAP+MmILcdT4lj5Jqyo0GXR/grib1y1AEYM3fI18t
         YTTBTIwFzJW6mzOxJnfPa8IfFpDd66zD+YXSzyGYPk3DPelZQkvyiYkbZjIJz/kPU739
         +jPg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1779766108; x=1780370908;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=bCIgfrQN2ixgyY5Hi0sknw40cEjtfKKbdudOPWJQGso=;
        b=lkTvnLU9bTEugeXoowrDslxqjjvv3WSIFYY21Cm7CGAvZjEVR+ucnTsbIH/HCTxCOo
         U3rNBSKew0ApQLjntRFx8EVdwPrhiX/7lQZiuVmP+CCyJy5eSHBfTxc2QJLLRCsd9Nvt
         +EM53gZXO1q/7Hxk8LSIy2+U0OAJWSMuUu4ckvaliKyhb0am/yiNiiA7DtL0I7qF5VMV
         xuLMT+DXYZplTWYHzyD21kaPAXjtf2lo59WS10AmMwMrqow0g/xcTuFWCQEByKIdwviR
         33+drE7/TwoQpJDSUPkimSWuuSDiFaqpMSuv1o/cOJLKkBfu6zfLW0+vhXFP5hX2DjxZ
         vKaQ==
X-Gm-Message-State: AOJu0YyDV1MxYUI0bejOyDoO8z/ikrWzuHBxFBXzxZA+xg8iZ9SW3jIb
	fkMbeh9aHGpeEYphwmOS0/6UC7O3bkdrh8pI1/+qTCKRlRqeA8mGknto17smd5iljzQ4bBiJvo7
	AB7B7j5n448vT+B6ujIumMPespjbwfJRGzDuuRw8o6p+P9sXAtLoJkQIg
X-Gm-Gg: Acq92OEMNuMxgZu9ubTTGRcT+9ToL/tECXufFln8FjfH10y886AVhiTUgdssTIcI09J
	ReM2S00CP9tBNLqAN0S7J9EdcC7NXf/Fvsv6O/G43gk591vmzsusM3AZmIYjsLVn4XA8QFGrncw
	YE4vHc/r4/Etmy8GRHNA/NVOYa5rJxM63AwTG7yqZ+1mcB/z48RQ+/HZ0XNjbgn7JmTnF6nBsTu
	LhTek9hl0Iq3zCLVQQXHLkDnJbIqONbNge5dM0wh9Yy2a2dx5R3vEXQTguJ/gnhuxvdL4UVZDiF
	rgweQAX2dflT/hBmDDg=
X-Received: by 2002:a17:903:41c2:b0:2bd:6dad:3df8 with SMTP id
 d9443c01a7336-2bebf442ccbmr4086065ad.22.1779766107809; Mon, 25 May 2026
 20:28:27 -0700 (PDT)
Precedence: bulk
X-Mailing-List: sashiko-reviews@lists.linux.dev
List-Id: <sashiko-reviews.lists.linux.dev>
List-Subscribe: <mailto:sashiko-reviews+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:sashiko-reviews+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20260522220435.2378363-7-irogers@google.com> <20260522221338.039751F000E9@smtp.kernel.org>
 <ahTraRGMGowOJ4II@google.com>
In-Reply-To: <ahTraRGMGowOJ4II@google.com>
From: Ian Rogers <irogers@google.com>
Date: Mon, 25 May 2026 20:28:16 -0700
X-Gm-Features: AVHnY4KuArnCnt7mY6XU0OGJU2WK8KdEGLopxP7iwwk64vnlxEPfo1VFnUdES1k
Message-ID: <CAP-5=fUFKEdLQEjfW7aiwpO0fEeumcJ-djDuibsd4sr5NLW9Ug@mail.gmail.com>
Subject: Re: [PATCH v9 06/23] perf python: Add missed explicit dependencies
To: Namhyung Kim <namhyung@kernel.org>
Cc: sashiko-reviews@lists.linux.dev, linux-perf-users@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Mon, May 25, 2026 at 5:38=E2=80=AFPM Namhyung Kim <namhyung@kernel.org> =
wrote:
>
> On Fri, May 22, 2026 at 10:13:37PM +0000, sashiko-bot@kernel.org wrote:
> > Thank you for your contribution! Sashiko AI review found 1 potential is=
sue(s) to consider:
> > - [Medium] Including `<Python.h>` after standard system headers violate=
s the Python C-API contract and can lead to macro redefinition warnings, bu=
ild failures, or ABI mismatches.
> > --
> >
> > commit 37ded89f453597ef269f0bcb73c5907738b8e5d9
> > Author: Ian Rogers <irogers@google.com>
> >
> > perf python: Add missed explicit dependencies
> >
> > This commit fixes a missing include of pmus.h that was discovered
> > while cleaning up the evsel and evlist header files. It also sorts
> > the include directives alphabetically.
> >
> > > diff --git a/tools/perf/util/python.c b/tools/perf/util/python.c
> > > index cc1019d29a5d0..dd937d714e991 100644
> > > --- a/tools/perf/util/python.c
> > > +++ b/tools/perf/util/python.c
> > > @@ -1,30 +1,35 @@
> > >  // SPDX-License-Identifier: GPL-2.0
> > > -#include <Python.h>
> > > -#include <structmember.h>
> > >  #include <inttypes.h>
> > > -#include <poll.h>
> > > +
> > >  #include <linux/err.h>
> > > +#include <poll.h>
> > > +
> > > +#include <Python.h>
> >
> > [Severity: Medium]
> > Could moving Python.h here cause build warnings or ABI mismatches?
> >
> > The Python C API requires that Python.h must be included before any
> > standard system headers. Python.h defines preprocessor macros that
> > alter the behavior of standard headers. Because this alphabetizes the
> > list, standard headers like inttypes.h and poll.h are now included
> > before Python.h.
>
> I think it's worth following the suggestion.  I'm not sure if it's
> possible to add an exception for the python headers to clang format.

I believe we can set Python.h as having the highest priority and
always including it first. I want to make sure the Sashiko is advice
is accurate first :-)

Thanks,
Ian

> Thanks,
> Namhyung
>
