Received: from mail-qt1-f175.google.com (mail-qt1-f175.google.com [209.85.160.175])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3433E38C438
	for <sashiko-reviews@lists.linux.dev>; Thu, 24 Sep 2026 14:15:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.160.175
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790259312; cv=pass; b=FNHPQPnZCwkx2xU5bN/UzwI2JTsUgbAVIuE0S6O5suPyZF56nMW7fZCjBZHx8Ee1iNZn/h2zkPn36fbet3BR65qLUAkMXz5G1/QIE7D7DTKKrK86eN6CWILnl8Uf1mWBxFfDWEwNuC2Xx6KLMvw1svhiKQm5XldGJha/tzx9nqE=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790259312; c=relaxed/simple;
	bh=cjkcJje3D43GI36ThNxlKNXb2AapwbD/qOFz41XnyWw=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=ZhRdQHDUUZXjcQLvf8aSyTDOADYQCrLFBonYCR0HoJ/obzgXn3FvbUQKLaOAwUKVmNLeAIyDxo03f07Z7Fz//v8XXM6PYkHqWIcjHgi0zmU+Xif8H/VAlfUj6ohIYPnBSNWfWxntpqCQcSIDKu0x0VlWUiFspFvWm9js6NeNrxI=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=tHm1I0uO; arc=pass smtp.client-ip=209.85.160.175
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="tHm1I0uO"
Received: by mail-qt1-f175.google.com with SMTP id d75a77b69052e-52faa58bff5so274951cf.0
        for <sashiko-reviews@lists.linux.dev>; Thu, 24 Sep 2026 07:15:08 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1790259307; cv=none;
        d=google.com; s=arc-20260327;
        b=OnCyfMyEvzZ7YVAaBT6rW2uBQJSdE8G6vUkUm32CorYtR8WRYJvoJMVU9xQMmkwx7Z
         kGO6pDvBlmllOtLdbLlpZLAl1h6TJ4rpIQ9KJgSonhuTbNlRRG0NwiJ9XgT2RlldYMYP
         Q+B7JcmJ5OWr57w1gtAS1SWvXed4NKn1U8MWp7yZqzY8AMO+iFN0HV1G7gmO0cxnh8VZ
         W80verTpLoDOgVzPQSa96M9RRHL6cs7H50q2hPbh/I9gMkEoxW/vWCxIF1Y+c8ApbbYB
         wIZQt0+VJo5SwO1s9hEqmtAaa24RywvyA8MZ/bsD1ztSEgFxSI+JIIRD83eQh8/esxxr
         yIpg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=C7QwgFIDJPeVD+m+9h/VZ8uU/5iMIuRsG3J/mrcbQTA=;
        fh=WwZD1EB6Tjgd87mh/04sazSNljN3VCeXXd+1MHPWLKM=;
        b=Cocs2V7F/acwjhQ6C9fOCH8Um6E/DQmhRpKGR6yNzrxbbFyt7zl+dW5EgHPdOb1Bre
         9CfkiO5mBmRcIJJvY9rbmmY9v0WmSnUWqj/lZxsj6lSpkVqdeUxEilkm366NrAwns05H
         IvUmPdXAvGQAXSSsgljZUzAV7leG4jKG1T9oGs4tWgN5HtblUgAvbTdfXbAM82KOukID
         1xpsCFsCrWvIwPbthiMyKO0gMGEcViqi6mU0xr/p556egoCu2jpOg35SmvOYPev38c7+
         b1kX2MJy3gsj1izOcvQHv4oil5n1IHi4R7cIWKySN1eNmqvbDyp5XIdOf+I3TfXcwX78
         VN4Q==;
        darn=lists.linux.dev
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20251104; t=1790259307; x=1790864107; darn=lists.linux.dev;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=C7QwgFIDJPeVD+m+9h/VZ8uU/5iMIuRsG3J/mrcbQTA=;
        b=tHm1I0uO4U4BPDSsyIACljvyp9Wxa9TRnA0ieOk4Dzt/gZVW/XrZvbWuOzZUPRkvIy
         EnNCYk3Nui7XFyRCvBmUOfFJzKfcwJxXdEjT2L3HGA94O0+lvLri4/LWDido3PD/HKAo
         YbVChmwTWgrtQRZFumVtnnha5Pzq1v12Dzg8DaPsXOebE4HoJhwjpmNVDhEtSEwMZFhB
         iIYVclqH5HiB0Bpy9GXW84NEAxAyoGQgJm5R7x0v0O+oFvpzhD69M5RFCiKFTkyBBsZ4
         +dGe+mFhZrAJ5DH4UTH8U5AB7XHMno+TYxua2sI5Zv2ylB2F3lh8m8tR+IJUU88ZEFIx
         t4Vw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790259307; x=1790864107;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=C7QwgFIDJPeVD+m+9h/VZ8uU/5iMIuRsG3J/mrcbQTA=;
        b=aFCFtrqCMr4rSlymrsOGMJPEH/ce+g71txRs+6veklEYzuBdUgIKEuxPf2I6q6fUz7
         sBWQZjAWw+U/v9M1SFcogl5Ed85Y14KK/hW5u4JThO7UwVtMJ2Ns+M6VEjuiuy2VsWG2
         erEudOeWD7pqBe5iAmI6cruWlIrN7ZhPsgcbbXtmVTZkKGod24yGCN0i6Z+sBDGEyNcF
         21sjK3jWDNLSOgGNvzVHgYAvPbiIdETrQiFi3WZcPzKi4myZ3uVrneyED7pz3+af9sJR
         vfcvYuKcUNXhpbYERq2DM6s2PdOpNRyqnVJL8iVx3QS8EMHl4jN18WKNUtJ0zR5cwf3E
         ME9A==
X-Gm-Message-State: AFuF++mKc50IkgluDPCyQovKSnfkFm1r6HIE2V/o5eseyzten/9A6w2+
	AUqe5rxKk/VYFYm1HrpNLO+NKnwVdjzMkyfFnsXX5B5iSgTHBkWynzLsugVYqCsqzbIPDGLptog
	e1+zsjQS9V2viDQYFgxxqTP/Rt2dv1agPcAC+hb76XUXkSMF0LR5DPc0lLKQ=
X-Gm-Gg: AYBFou1HK+BilNjNh6ygNOAr4oo8gJy6jJiphXvZRcf68+W49z32txLn594R9zn0/RO
	wO0cIADWD6NAn60mfdBN5EHYpBYv6moofkQ3PZyefPrvycbbAmNhKQnNhdrYrnlZcp1RwWp8jbY
	86jdtrK1nYUM1Il9y38eGLlQSwODqkkU84HQF3Hr111OtgaqvSypzk4lU40WhlvLTGhMA2q8Y8f
	GYFSj9ADPfhuKasMdYzpF3BE4R+X3kl3M9hIlADMVel5+n4oAPRYyVRohOYUSt9P7aMc8NaFeFQ
	hIgfp7zohlOybjerNHoH1U77HMUIuomHguDBwWf0rK1mPsgVVncgtpg=
X-Received: by 2002:a05:622a:107:b0:532:84d3:abb with SMTP id
 d75a77b69052e-532fea4a126mr10270761cf.7.1790259305798; Thu, 24 Sep 2026
 07:15:05 -0700 (PDT)
Precedence: bulk
X-Mailing-List: sashiko-reviews@lists.linux.dev
List-Id: <sashiko-reviews.lists.linux.dev>
List-Subscribe: <mailto:sashiko-reviews+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:sashiko-reviews+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20260924053645.3555041-1-irogers@google.com> <20260924053645.3555041-16-irogers@google.com>
 <20260924054906.404961F000FF@smtp.kernel.org>
In-Reply-To: <20260924054906.404961F000FF@smtp.kernel.org>
From: Ian Rogers <irogers@google.com>
Date: Thu, 24 Sep 2026 07:14:53 -0700
X-Gm-Features: AclHuK8ZVOo9UPJOqQO5EI7ej6eUSk_Nl-O97AH2fqwChdW9BPzVRoYbGo57ahU
Message-ID: <CAP-5=fXwk8TT-aQYUz+q7RYAcEiEez4MZwGEe5j7rfsTtvq2bA@mail.gmail.com>
Subject: Re: [PATCH v1 15/21] perf vendor events intel: Update novalake events
 from 1.00 to 1.04
To: sashiko-reviews@lists.linux.dev, Edward <edward.baker@intel.com>, 
	"Taylor, Perry" <perry.taylor@intel.com>, Stephane Eranian <eranian@google.com>, 
	Dapeng Mi <dapeng1.mi@linux.intel.com>
Cc: linux-perf-users@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Wed, Sep 23, 2026 at 10:49=E2=80=AFPM <sashiko-bot@kernel.org> wrote:
>
> Thank you for your contribution! Sashiko AI review found 1 potential issu=
e(s) to consider:
> - [Medium] perf: UMask omission in novalake events causes EventCode alias=
ing
> --
>
> commit 1470a977cdc98c6d093466522a50ce1b48974108
> Author: Ian Rogers <irogers@google.com>
>
> perf vendor events intel: Update novalake events from 1.00 to 1.04
>
> This commit updates the novalake PMU events from version 1.00 to 1.04.
> It synchronizes the event lists with the latest intel perfmon updates
> and updates the format encoding for the off module response MSRs.
>
> Link: https://github.com/intel/perfmon/commit/50afd00f84fb8c7bfa26a993a96=
8982c1573e6d1
> Link: https://github.com/intel/perfmon/commit/b576c542b68d377fa00ef467471=
5ea87a37c309c
> Link: https://lore.kernel.org/linux-perf-users/20260923015517.2665398-1-d=
apeng1.mi@linux.intel.com/
>
> > diff --git a/tools/perf/pmu-events/arch/x86/novalake/floating-point.jso=
n b/tools/perf/pmu-events/arch/x86/novalake/floating-point.json
> > index 471a90f3670c4..2dda2225d0043 100644
> > --- a/tools/perf/pmu-events/arch/x86/novalake/floating-point.json
> > +++ b/tools/perf/pmu-events/arch/x86/novalake/floating-point.json
>
> [ ... ]
>
> > @@ -181,6 +181,22 @@
> >          "UMask": "0x1",
> >          "Unit": "cpu_core"
> >      },
> > +    {
> > +        "BriefDescription": "FP_ARITH_INST_RETIRED.SCALAR_HALF",
> > +        "Counter": "0,1,2,3,4,5,6,7",
> > +        "EventCode": "0xc8",
> > +        "EventName": "FP_ARITH_INST_RETIRED.SCALAR_HALF",
> > +        "SampleAfterValue": "100003",
> > +        "Unit": "cpu_core"
> > +    },
> > +    {
> > +        "BriefDescription": "Number of all Scalar Half-Precision FP ar=
ithmetic instructions(1) retired - regular and complex.",
> > +        "Counter": "0,1,2,3,4,5,6,7",
> > +        "EventCode": "0xc8",
> > +        "EventName": "FP_ARITH_INST_RETIRED.SCALAR_HALF_WCOMPLEX",
> > +        "SampleAfterValue": "100003",
> > +        "Unit": "cpu_core"
> > +    },
>
> [Severity: Medium]
> Is the UMask intentionally omitted for FP_ARITH_INST_RETIRED.SCALAR_HALF_=
WCOMPLEX?
>
> When the UMask is omitted, the perf tool JSON converter defaults to UMask=
 0x00.
> Because FP_ARITH_INST_RETIRED.SCALAR_HALF also shares EventCode 0xc8 and
> lacks a UMask, these become indistinguishable aliases for mutually exclus=
ive
> events.
>
> Could this cause incorrect PMU programming and inaccurate measurements?

This finding is correct and I need to do a fix. When there is a umask
of 0 and and a umask_ext the umask_ext wasn't getting combined with
the umask:
https://github.com/intel/perfmon/blob/main/scripts/create_perf_json.py#L350
It is the scalar_ext that differentiates these events:
https://github.com/intel/perfmon/blob/main/NVL/events/novalake_coyotecove_c=
ore.json#L8626
I'll fix this in v2. This impacts more than just Novalake, here is a diffst=
at:

 arrowlake/cache.json                      |    1
 arrowlake/pipeline.json                   |    2 +
 cascadelakex/uncore-interconnect.json     |    6 +++
 clearwaterforest/pipeline.json            |    3 +
 clearwaterforest/uncore-cache.json        |    5 +++
 clearwaterforest/uncore-interconnect.json |    2 +
 emeraldrapids/uncore-cache.json           |   42 +++++++++++++++++++++++++=
+
 emeraldrapids/uncore-interconnect.json    |   12 +++++++
 emeraldrapids/uncore-io.json              |    1
 emeraldrapids/uncore-memory.json          |   10 ++++++
 graniterapids/uncore-cache.json           |    5 +++
 graniterapids/uncore-interconnect.json    |    2 +
 icelakex/uncore-cache.json                |   79
++++++++++++++++++++++++++++++++++++++++++++++++++
 icelakex/uncore-interconnect.json         |   22 +++++++++++++
 lunarlake/cache.json                      |    3 +
 lunarlake/pipeline.json                   |    2 +
 novalake/cache.json                       |    2 +
 novalake/floating-point.json              |   18 +++++++++++
 novalake/pipeline.json                    |    4 ++
 pantherlake/cache.json                    |    3 +
 pantherlake/pipeline.json                 |    4 ++
 sapphirerapids/uncore-cache.json          |   42 +++++++++++++++++++++++++=
+
 sapphirerapids/uncore-interconnect.json   |   12 +++++++
 sapphirerapids/uncore-io.json             |    1
 sapphirerapids/uncore-memory.json         |   10 ++++++
 sierraforest/uncore-cache.json            |    5 +++
 sierraforest/uncore-interconnect.json     |    2 +
 skylakex/uncore-interconnect.json         |    6 +++
 snowridgex/uncore-cache.json              |   68
+++++++++++++++++++++++++++++++++++++++++++
 snowridgex/uncore-interconnect.json       |   10 ++++++
 30 files changed, 383 insertions(+), 1 deletion(-)

Thanks,
Ian

> [ ... ]
>
> > +    {
> > +        "BriefDescription": "Counts the number of retired packed 128 b=
it or 256 bit double precision floating point arithmetic operations.",
> > +        "Counter": "0,1,2,3,4,5,6,7",
> > +        "EventCode": "0xc8",
> > +        "EventName": "FP_ARITH_RETIRED.PACKED_DP",
> > +        "SampleAfterValue": "1000003",
> > +        "Unit": "cpu_atom"
> > +    },
>
> [Severity: Medium]
> Similarly, FP_ARITH_RETIRED.PACKED_DP shares EventCode 0xc8 without a UMa=
sk.
>
> This defaults to UMask 0x00, which will alias with PACKED_SP and other ev=
ents
> that share this EventCode.
>
> Does this need a distinct UMask to prevent profiling collisions?
>
> > diff --git a/tools/perf/pmu-events/arch/x86/novalake/pipeline.json b/to=
ols/perf/pmu-events/arch/x86/novalake/pipeline.json
> > index 998dd4cbc66a7..65a8a3058f81d 100644
> > --- a/tools/perf/pmu-events/arch/x86/novalake/pipeline.json
> > +++ b/tools/perf/pmu-events/arch/x86/novalake/pipeline.json
>
> [ ... ]
>
> > @@ -146,6 +196,15 @@
> >          "UMask": "0x2",
> >          "Unit": "cpu_core"
> >      },
> > +    {
> > +        "BriefDescription": "Counts the number of far branch instructi=
ons retired, includes far jump, far call and return, and interrupt call and=
 return.",
> > +        "Counter": "0,1,2,3,4,5,6,7",
> > +        "EventCode": "0xc4",
> > +        "EventName": "BR_INST_RETIRED.FAR_BRANCH",
> > +        "PublicDescription": "Counts the number of far branch instruct=
ions retired, includes far jump, far call and return, and interrupt call an=
d return. Available PDIST counters: 0,1",
> > +        "SampleAfterValue": "1000003",
> > +        "Unit": "cpu_atom"
> > +    },
>
> [Severity: Medium]
> Does BR_INST_RETIRED.FAR_BRANCH require a specific UMask?
>
> It currently lacks one, defaulting to UMask 0x00 for cpu_atom. This will
> collide with the preexisting ALL_BRANCHES event that also defaults to
> UMask 0x00, leading to inaccurate performance measurements.
>
> --
> Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260924053645.35=
55041-1-irogers@google.com?part=3D15
