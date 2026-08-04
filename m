Received: from mail-pj1-f44.google.com (mail-pj1-f44.google.com [209.85.216.44])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 96DBF44210A
	for <sashiko-reviews@lists.linux.dev>; Tue,  4 Aug 2026 21:09:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.216.44
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785877802; cv=pass; b=dkYA/UrtzJS7g4SAiMItg8bDr05w3WCG0t7yNDQ5clS7XeyNp8kkpfIpfbH1F0cLlQ6uR1iUo3Qys52GvBgux9DF3nVLk37NkarCdQfs1CwWyr17NIIUUR1dB3eMgcg/H5TGThds89RYIUtvdQcH80Cp+MiNTpEQxeQxXYazK0M=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785877802; c=relaxed/simple;
	bh=oM6MWlSz2H9anELO3jNp57msCnTEhD0kLk4MQb1nb3U=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=SRv9jqA1TszXCDN64kf1CjFNBVzxSec+xg+fX3DzZYNeCjv4KKIzfdD4GgnKviBbEb6HxSDxrxzisEntd/GQDwaOL6HlA5hqRmhy/3jyMci1O119ErlUhXHivVLDna9r28HiSHn2r9QuzI/F8hP+qQb/jXR7H+wneT93jSwOXho=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=HfkWE0K/; arc=pass smtp.client-ip=209.85.216.44
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="HfkWE0K/"
Received: by mail-pj1-f44.google.com with SMTP id 98e67ed59e1d1-382ef647e20so287855a91.1
        for <sashiko-reviews@lists.linux.dev>; Tue, 04 Aug 2026 14:09:59 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1785877799; cv=none;
        d=google.com; s=arc-20260327;
        b=riJDbAKlFIid5kls7Rv8Jy1d7+3M6G0ZciOxfxgE6lDejcCDk7sdLs98rHJmhM6ZxB
         43YWX4QyZ2dc5n1A6JxCy3fN1Gue+Hp1bSE1mH+rOiZ9SpZpCeGz/6Jxml6JpD+iHH/a
         OKIfW2LY+dESECVZ/JvIAgpavbaJsKpSetmicb6ODhLYGIWP9QF1KI6GUOi1HZxDFB92
         8FjQ14TTn5KOR7MIOvt06zHjFSFaTVbu/3QtN3V5hLK5pqf9CEMdmT17BqoJ1zqHIcpj
         0ZPpIM6OxXBZczojaSwoyapARWtia8xTTiDo1Dmjc59QEdj5zqb4wvDHcLlYCmhQbx5i
         O+jg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=Fu4LE192jSvU1r4OOL9+TsH68J29zyG+w9TlNIlg5ag=;
        fh=5WRQmWey/eNyRfI5g/sWfeAyOoN5rwo1UMEZgJHZ3hQ=;
        b=YhCs7P8qZGzqtIXhH3FZSBV/dy8bFIpGhrQ9xJlghuwjLzXhvwUiaYNIUfkNTHnZkD
         Q7tQ3jEOoEHao365a1hPEIHJzxKfhoayQSWhrVWzI1EKP6RtkNFkfsvIJalOHd8i9Vhj
         A+Dwq/5t5sEszFvPw3hxkhyQKglGZYtEFMFpSIHTLCdMkinC/1iZYdwdfaUnHN1aVxcA
         VKlXRcKxWEXhfBLnZh1Wh2LXt+eb1n+to/DDHP8UYqcKFXfYcfHSoNYhVZlWIp9O1Bf3
         HJApXCm+if+P/A+BekhqDI5F+Iv3NZ1Zmfp57+NH2JTg8e0PfMV7m/3F1Odqw8ZDpiIk
         WHVg==;
        darn=lists.linux.dev
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20251104; t=1785877799; x=1786482599; darn=lists.linux.dev;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=Fu4LE192jSvU1r4OOL9+TsH68J29zyG+w9TlNIlg5ag=;
        b=HfkWE0K/udmci3ozP54mAt6EzhRXiAw2YitYxkpLP6nrvd87O2ACRQof+Hso9pY82D
         LvFu3KLEgLZgeDnA0hCpFaIm/HCBEqVqoyPSV+XE0pQzLqYI5VraBMrqU4Zh5LXHul0v
         jnhPnznRBJgBBpSYurC82ib1tD4IZM+Voa3XE+EG6Huas0szQC9Z1lYytSIFRBAk6p0p
         0b8kwwbKNMgDUeTnWo7pRJTcpPgfJkJe2i6fpntW6z68N69tDLKHunXmKOyvV2M64vhS
         ml0C9mS2zzQ0nxCzAYJTGDSWlHai60P6+rIsM2nK3WX9CehUKQu76qqhJB2VYdpsJZGR
         N9Xg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1785877799; x=1786482599;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=Fu4LE192jSvU1r4OOL9+TsH68J29zyG+w9TlNIlg5ag=;
        b=q15s0+wKCipiZx2IWVO9CjwplcXk2nhHqGS8ibqNNlf/JyVX+j2GQbZLaDT31JHFQt
         FdKNIWMs+HQi1QOeRrFnTrg0bcBpxtGfVyhDOJJ99I+WLWWEybCfQ5IS5KSlmtVp3JAr
         +jnTZRzwWKxgON2Rn7WyPVWOogtGoFwTFfw621gHwOsrlf8VhA0Ee3ZZJlIF7oFLxxEc
         T4y3GOCwOTM/lp5EKqn9/CTTtZmfF3nPVBT43LEM+o2YxIxW80i5tZsxgpQDlsiQd1E8
         fmAPH53BJH8r3KWZ+fJajNaeUy9aqFQRxP1VA5OFHNgrotGRuuNa1mAnsgNaC6TV0dj8
         Psig==
X-Gm-Message-State: AOJu0Ywbj7nv1fmKrdPEgJYIh9qpL9EmmTeMrjHU7b9OcL1ri8e+4fuh
	XPYI7CszGQG/GD6ZMISRGlZgQZDzbnAboZQ5LRosAL4BbjQYd8xcQF+pwThd/wsQF/laUmNOLOE
	htWM5vdR+YIk5+09ZcWVNxM5ptV9nGgLIJwh09pgC
X-Gm-Gg: AR+sD13JIok2PhWnaDg0E+0uHdk5JjfYt2c/eFp1tzCZodMknBptciB5L0VK9S2AWUY
	VOx9eQEAHjl5ma1De+x1g066cLSVpeRUuNGuSBAcgZpyM3pF+02TlEAWTTOH8opJA0oV7JtYf53
	mvf6boCjOmwcltTFyXxbxfzuZG6qOBaB+R7WIOPPEAfmH6hsYljc8LvYaZ9+/4/zRZEYtfrQRiX
	/OQrktStYQaRqgn/fQXZdtuvoS0AhDwfvO86FpEMYE8VH61+KhBaCvetwshgRdbyCmkBaWBB0o4
	oEG41hY/9/yQCUxTVZDoNyF7XNX+2FuKLyZM31UOGs3lKn/u9Qk3srZ3hURzIDEhPfelKSTMwLk
	=
X-Received: by 2002:a17:90b:5484:b0:37f:c69d:ce69 with SMTP id
 98e67ed59e1d1-3903c581f08mr1946363a91.10.1785877797913; Tue, 04 Aug 2026
 14:09:57 -0700 (PDT)
Precedence: bulk
X-Mailing-List: sashiko-reviews@lists.linux.dev
List-Id: <sashiko-reviews.lists.linux.dev>
List-Subscribe: <mailto:sashiko-reviews+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:sashiko-reviews+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20260729170416.41904-1-ctshao@google.com> <20260729171742.24ABB1F000E9@smtp.kernel.org>
 <am0sWLrB5tNyTJQK@google.com>
In-Reply-To: <am0sWLrB5tNyTJQK@google.com>
From: Chun-Tse Shao <ctshao@google.com>
Date: Tue, 4 Aug 2026 14:09:21 -0700
X-Gm-Features: AUfX_myhTeJ4ugAZtdx6HhCnO8mpaOcT2gGkqaQGqvM0OuHHLxd9R4TEhUTlwQg
Message-ID: <CAJpZYjW3L-E6rhxLg8etDJYbg2XbZ--aH8pP131Gv4WECaDxLg@mail.gmail.com>
Subject: Re: [PATCH v3] perf stat: Include PMU name and split uncore events
 per PMU in metric-only JSON output
To: Namhyung Kim <namhyung@kernel.org>
Cc: sashiko-reviews@lists.linux.dev, linux-perf-users@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Fri, Jul 31, 2026 at 4:14=E2=80=AFPM Namhyung Kim <namhyung@kernel.org> =
wrote:
>
> On Wed, Jul 29, 2026 at 05:17:41PM +0000, sashiko-bot@kernel.org wrote:
> > Thank you for your contribution! Sashiko AI review found 1 potential is=
sue(s) to consider:
> > - [Medium] Flawed line-split transition logic causes spurious empty JSO=
N objects and incorrect PMU attribution for tool events.
> > --
> >
> > --- Patch [1]: [PATCH v3] perf stat: Include PMU name and split uncore =
events per PMU in metric-only JSON output ---
> > commit 20e3cd08fd5e415b458343262ee76bc1f5f6ce85
> > Author: Chun-Tse Shao <ctshao@google.com>
> >
> > perf stat: Include PMU name and split uncore events per PMU in metric-o=
nly JSON output
> >
> > This commit modifies perf stat JSON output in --metric-only and -A mode=
 to
> > group metrics by PMU. It achieves this by adding a "pmu" key to the JSO=
N
> > output and starting a new JSON line when the underlying PMU instance ch=
anges.
> >
> > > diff --git a/tools/perf/util/stat-display.c b/tools/perf/util/stat-di=
splay.c
> > > index b337cc23f4131..6785e2c442bd7 100644
> > > --- a/tools/perf/util/stat-display.c
> > > +++ b/tools/perf/util/stat-display.c
> >
> > [ ... ]
> >
> > > @@ -1146,13 +1149,34 @@ static void print_no_aggr_metric(struct perf_=
stat_config *config,
> > >                             if (config->aggr_map->map[aggr_idx].cpu.c=
pu =3D=3D cpu.cpu)
> > >                                     break;
> > >                     }
> > > +                   if (aggr_idx >=3D config->aggr_map->nr)
> > > +                           continue;
> > >
> > >                     os->evsel =3D counter;
> > >                     os->id =3D aggr_cpu_id__cpu(cpu, /*data=3D*/NULL)=
;
> > > -                   if (first) {
> > > -                           print_metric_begin(config, evlist, os, ag=
gr_idx);
> > > -                           first =3D false;
> > > +
> > > +                   if (config->metric_only) {
> > > +                           struct perf_pmu *pmu =3D counter->pmu;
> > > +
> > > +                           if (!evsel__is_tool(counter)) {
> > > +                                   if (config->json_output && line_o=
pen &&
> > > +                                       (!last_pmu || pmu !=3D last_p=
mu)) {
> >
> > [Severity: Medium]
> > Does this line-split transition logic handle tool events correctly depe=
nding
> > on their order in the event list?
> >
> > If a tool event is processed first, line_open becomes true, but last_pm=
u
> > remains NULL. When the next event (a PMU event) is processed, the condi=
tion
> > (!last_pmu || pmu !=3D last_pmu) evaluates to true. This prematurely cl=
oses
> > the line and creates a spurious empty JSON object for the tool event.
>
> Something like this?
>
>   $ sudo ./perf stat -aA -e user_time -M insn_per_cycle -j --metric-only =
true
>   {"cpu" : "0", "pmu" : "tool"}
>   {"cpu" : "0", "pmu" : "cpu_core", "instructions  insn_per_cycle" : "0.8=
"}
>   {"cpu" : "1", "pmu" : "tool"}
>   {"cpu" : "1", "pmu" : "cpu_core", "instructions  insn_per_cycle" : "0.1=
"}
>   {"cpu" : "2", "pmu" : "tool"}
>   {"cpu" : "2", "pmu" : "cpu_core", "instructions  insn_per_cycle" : "0.5=
"}
>   {"cpu" : "3", "pmu" : "tool"}
>   {"cpu" : "3", "pmu" : "cpu_core", "instructions  insn_per_cycle" : "0.3=
"}
>   ...
>
> Thanks,
> Namhyung

Thanks for the test, I sent the v4 patch for fixing this problem:
lore.kernel.org/20260804210659.112192-1-ctshao@google.com

Test:
  $ perf stat -aA -e user_time -M insn_per_cycle -j --metric-only true
  {"cpu" : "0", "instructions  insn_per_cycle" : "0.9"}
  {"cpu" : "1", "instructions  insn_per_cycle" : "0.6"}
  {"cpu" : "2", "instructions  insn_per_cycle" : "0.2"}
  {"cpu" : "3", "instructions  insn_per_cycle" : "0.1"}
  {"cpu" : "4", "instructions  insn_per_cycle" : "0.2"}
  {"cpu" : "5", "instructions  insn_per_cycle" : "0.1"}
  {"cpu" : "6", "instructions  insn_per_cycle" : "0.1"}
  {"cpu" : "7", "instructions  insn_per_cycle" : "0.1"}
  {"cpu" : "8", "instructions  insn_per_cycle" : "0.1"}
  {"cpu" : "9", "instructions  insn_per_cycle" : "0.1"}
  ...

-CT
>
> >
> > Conversely, if a tool event comes after a PMU event, the else-if block =
below
> > is taken because !evsel__is_tool(counter) evaluates to false. This bypa=
sses
> > the line-splitting check entirely, causing the tool event to silently m=
erge
> > into the preceding PMU's JSON object and incorrectly inherit its PMU
> > attribution.
> >
> > > +                                           print_metric_end(config, =
os);
> > > +                                           line_open =3D false;
> > > +                                   }
> > > +                                   if (!line_open) {
> > > +                                           print_metric_begin(config=
, evlist, os,
> > > +                                                              aggr_i=
dx, counter);
> > > +                                           line_open =3D true;
> > > +                                   }
> > > +                                   last_pmu =3D pmu;
> > > +                           } else if (!line_open) {
> > > +                                   print_metric_begin(config, evlist=
, os,
> > > +                                                      aggr_idx, coun=
ter);
> > > +                                   line_open =3D true;
> > > +                           }
> > >                     }
> >
> > --
> > Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260729170416.=
41904-1-ctshao@google.com?part=3D1
