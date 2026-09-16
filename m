Received: from mail-qk2-f12.google.com (mail-qk2-f12.google.com [74.125.230.204])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4AB184A4EEC
	for <sashiko-reviews@lists.linux.dev>; Wed, 16 Sep 2026 23:00:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=74.125.230.204
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789599635; cv=pass; b=m9v2TFhOUyvMDHTYj9N2g4PNNEDMcAcQfUEesKyNTuk7lz3JKMaVg9SsiMEtRdtVLuI6bVf/wlaPMfZpbYv7EeacSq04tzy/+byXyKfTrm6uIFmCXZ0XMGSH6TZt328FcD1rWAltWwdeEMwLirLZsGiiA5gdoh2hhDkf1jCp1ss=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789599635; c=relaxed/simple;
	bh=QuBrajklj/vua4yJO0R7ldnuXGl8ewqZ+7dlM+710+k=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=DFX3TaHYmfI3BSMTq9HxDM9xHKg3SFaByohao9m+W+26NW2EkNmSmq4EYnxhsdElgYLroknf0gX9BeKROPOR+eGjxK8N+GANk9eZkw5JIBP2ccyW8JXHcFQh+/2DZj2jm15aktc3KKQQ/YNmf/KDJFXb0E7BWuRm2diH6F9KsTM=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=TDTiQBsH; arc=pass smtp.client-ip=74.125.230.204
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="TDTiQBsH"
Received: by mail-qk2-f12.google.com with SMTP id d75a77b69052e-53012819c04so81971cf.0
        for <sashiko-reviews@lists.linux.dev>; Wed, 16 Sep 2026 16:00:29 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1789599628; cv=none;
        d=google.com; s=arc-20260327;
        b=Ilf1mffJV6NuFXi59Vg2niN1ruiCkerD5AX32t8M47qSGvx0kU0kiXzOCJEWPmiMf2
         PC3bdhlEU4sJnPxPNzNXo2OlZwhZR5eocSqBKsP4NO5cNBKr3KQqBclqQU+18K1/a4mg
         4exmesN72nYAnR7aRSxpEQZCpIBskKQzyn5cuVJyeXIjwZeaV+UnOKb6ZptIYvkAfvDz
         hGaJY1K6xox5jDg6n7NLSafc82yJUx41LRMJUcfta6D0WKcoeTO9vb3/vMv/YeR62as6
         UujNrkLtQRbTsffnk08b+nbNsmTPDmABLfEwOpJvicTMSPxN0XFXMsWFZa40PYKFQdVe
         C+2w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=GWnq9EURCR66rglg3KayqZD0lrmT7EnLwwqURS0Xwm0=;
        fh=Jd43VwPdIFEwUDxRuH5pQJ9K12wYyeNTJk5tB9b6ieQ=;
        b=Z58nKAw+H5uKZF82KUZPLid6dSK7Gv1DOyBlpyZyJsEI/kjpbnsz27xkgE8Apw+lrf
         NMzxNIRKCWJcFCTeIx6vn0eVni6n5n6csrjAk3xQf9rB/eUdIDs4UWBoaKM5fzm6LTkP
         +GhhPGU04sZL0I5KMrFpQQJROPc993NCNqNjSSFkFVSZAg0UDPFf4p0gBTYNBdt+n7Mi
         tQAcnb08TnGVJ6lmLazMF5/q13p5ElKTHuXsC2QcF9kJO5l79kL2D2xNOPllnsjq9exI
         1XJGSi8uJPWNmr+BcAGPdQF1Nt5NnQ3Dtf3EnzuRHCknoKh4HESjt7YKVpRxvKJYbONs
         rkWQ==;
        darn=lists.linux.dev
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20251104; t=1789599628; x=1790204428; darn=lists.linux.dev;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=GWnq9EURCR66rglg3KayqZD0lrmT7EnLwwqURS0Xwm0=;
        b=TDTiQBsHPYdTenajSHUMY+M5VDA1f2KCE8zwHxfOau9BIxhHBwi0IYi0LekF23w6W6
         wgBg3tXs4qDKFDQxmPK09dAtDYi8L8k7V6efbA0XYMQMGdlmY0mqyZ4sQZNYtql7RIs2
         +MSH97YYpCc2iQ1jgUE3sseaO9H6DljLOVbl7NN8+xkXFCXLXDAfDEgHFRjvK7lJ3y3A
         UyGRdIMjKwZBiAsSVbXbo+dMthmxhRBfUhWT9TkbCvEe28REn3nqR99pTGjeJueMvPGh
         FBZtc5zVVC/kKVejBUCTRWEIICT4cTB3Wrv1UbYFmiSdigVuXpMlmpomEsgTuUKIjJ+u
         cUmg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1789599628; x=1790204428;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=GWnq9EURCR66rglg3KayqZD0lrmT7EnLwwqURS0Xwm0=;
        b=PcMHasVqQtBQjQ1TN9/RH1Y3ZqrzYtiGMYW5W6bBnKUUlzUP2u0Fs/t+QVEjrvGPXd
         wuw7z8tZiV3nHm17fefDYygABsGr/G96VDAYVWjfIoYJ4RfxqNDTgajv37/rly+EDarU
         oUJa81oulRwxaeguYnSC8wsS4hYjjttH508gbVjBhwZp26iJEJEbrWqPfF8VKQ8+qxIP
         0HulbHiC4qBpHbdzNTS8HWkV5SNpVXZSHqBmVk4rYkmrTJriIfbcM9dds+vL9BZopqO6
         d1sVaF7or9EpPLfS8r23M/DtbX29bojtF6l0WVQEjxjrDSDCIch0Z1EJH4/SY1uLLuMD
         zJTA==
X-Gm-Message-State: AFuF++n8C+Ha18t/ns8gUYPaAs5veAMdMovUIQljjo2amax72t4JJjqj
	6bnDD2wZHzadUj7odL+0JqzojRo43LXgLvA4+ljZrCLssnoyCybvMp5ANX8JmDpDxPNklfWXdoH
	nKM4L/BpAiH0BhCnYShlM53haabdPWS6I/uUdayK+
X-Gm-Gg: AYBFou2g4X+5Vj7+R2NN/QIjuGsEwgBODqEpkJNkio7j3FsmA0/WzLviuhrUtziAn/8
	e760eQOf/XowUiwLGNpqBFSDHlGYae1qNgYOfEC2vNkypvN5kZX7s7Y4kCjMc36Ztsl/xNENdgm
	rSlE3hUei3WzGzFcreqSNWOR6qYYngiFb4cXZgXElNsZu+bQl9wC6anLSNnUGlH6gfP/MjKrHRB
	SwsdgHObBlDVQPFhuRgDNcYs21/ANWgoymsI/gwKzSSQBd9WWsGjbmQ0NMYuqVYOY+ya0XIb1v8
	uCxJfQHEi8Rm7WJCsUotY8si+SDDlXS0yqayiOyJJk329Y8lzINjoMMP7vNVt9MRGJDUY3RPUvL
	hR+BXgcok9w==
X-Received: by 2002:a05:622a:2294:b0:52f:9ed4:8d74 with SMTP id
 d75a77b69052e-5328dc332cdmr6577051cf.14.1789599627288; Wed, 16 Sep 2026
 16:00:27 -0700 (PDT)
Precedence: bulk
X-Mailing-List: sashiko-reviews@lists.linux.dev
List-Id: <sashiko-reviews.lists.linux.dev>
List-Subscribe: <mailto:sashiko-reviews+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:sashiko-reviews+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20260916202740.257376-1-zide.chen@intel.com> <20260916204416.80E761F000FF@smtp.kernel.org>
 <9e86d9e4-7aee-4c1b-8812-94aecb2a2cea@intel.com>
In-Reply-To: <9e86d9e4-7aee-4c1b-8812-94aecb2a2cea@intel.com>
From: Ian Rogers <irogers@google.com>
Date: Wed, 16 Sep 2026 16:00:15 -0700
X-Gm-Features: AcwNN1U_2KEbv3R9fl85zKM5PShXqTETnXpkgaliTf0CHIl7ssx15QBLDxbxPLE
Message-ID: <CAP-5=fVkubfWSoQbZRmC7Xg-4SHM-=ickZub7zi4SDuFAhZuCg@mail.gmail.com>
Subject: Re: [PATCH] perf topdown: Don't require config1==0 for a slots event
To: "Chen, Zide" <zide.chen@intel.com>
Cc: sashiko-reviews@lists.linux.dev, linux-perf-users@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Wed, Sep 16, 2026 at 2:52=E2=80=AFPM Chen, Zide <zide.chen@intel.com> wr=
ote:
>
> On 9/16/2026 3:44 PM, sashiko-bot@kernel.org wrote:
> > Thank you for your contribution! Sashiko AI review found 1 potential is=
sue(s) to consider:
> > - [Low] perf: missing explicit <stdio.h> and <string.h> inclusions
> > --
> >
> > commit 197eea3115a0d065dc53e6f96ad2fd38fdb9bc99
> > Author: Zide Chen <zide.chen@intel.com>
> >
> > perf topdown: Don't require config1=3D=3D0 for a slots event
> >
> > This commit modifies the topdown slots architecture check to no longer =
require
> > config1 =3D=3D 0, fixing an issue where explicit slots events were dupl=
icated in
> > scheduling. It also adds a new test to verify that an explicit metrics_=
clear
> > slots event doesn't trigger extra injections.
> >
> >> diff --git a/tools/perf/arch/x86/tests/topdown.c b/tools/perf/arch/x86=
/tests/topdown.c
> >> index 2b6f47ce49324..b1ce9f83db00e 100644
> >> --- a/tools/perf/arch/x86/tests/topdown.c
> >> +++ b/tools/perf/arch/x86/tests/topdown.c
> > [ ... ]
> >> @@ -229,10 +229,38 @@ static int test__x86_topdown_slots_injection(str=
uct test_suite *test __maybe_unu
> >>      return TEST_OK;
> >>  }
> >>
> >> +/*
> >> + * An explicit "slots,metrics_clear=3D1" event is still the slots eve=
nt and
> >> + * must not cause an extra slots event to be injected into the group.
> >> + */
> >> +static int test__x86_topdown_metrics_clear(struct test_suite *test __=
maybe_unused,
> >> +                                       int subtest __maybe_unused)
> >> +{
> >> +    struct perf_pmu *pmu;
> >> +    char event_str[128];
> >> +    int ret;
> >> +
> >> +    if (!topdown_sys_has_perf_metrics())
> >> +            return TEST_OK;
> >> +
> >> +    pmu =3D perf_pmus__find_by_type(PERF_TYPE_RAW);
> >> +    if (!pmu || !perf_pmu__has_format(pmu, "metrics_clear"))
> >> +            return TEST_OK;
> >> +
> >> +    snprintf(event_str, sizeof(event_str),
> >> +             "{%s/slots,metrics_clear=3D1/,%s/topdown-retiring/}",
> >> +             pmu->name, pmu->name);
> >
> > [Severity: Low]
> > Does this new function test__x86_topdown_metrics_clear() need explicit =
header
> > inclusions for musl compatibility?
> >
> > This code relies on an implicit declaration of <stdio.h> for snprintf()=
.
> > Missing POSIX headers can cause build failures when compiling the perf =
tool
> > with strict libc implementations like musl instead of glibc.
> >
> > Should <stdio.h> (and potentially <string.h>) be explicitly included at=
 the top
> > of this file to prevent musl compilation failures?
>
> Not needed. tools/perf/util/pmu.h, along with debug.h (which is also
> included), explicitly pulls in <stdio.h>.
>
> Additionally, this file already contains other calls to snprintf(). If
> the required header dependency were missing, those existing uses would
> already fail to build.

In general we want to avoid transitive includes as they are brittle.
For example, if pmu.h and/or debug.h were changed, it might break
musl.

Thanks,
Ian
