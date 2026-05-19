Received: from mail-dl1-f42.google.com (mail-dl1-f42.google.com [74.125.82.42])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 62B38314D15
	for <sashiko-reviews@lists.linux.dev>; Tue, 19 May 2026 18:06:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=74.125.82.42
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779214015; cv=pass; b=lAcHafYOKxR5PrcgrRiIfSE06oL34Kvcqpnmb/jF8SND3XP6IZ7xqxHIc/mOr/AfVtbEGntUIyKlB5e2+oqA77FfwdfIhzi1VVl+9oVbJBBNUgyvP+LWuLOBtoUPcx9yd6OSlmSCDo5/Ynzn1ZPDiaNuxwm+7CgKXI0RABWFue4=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779214015; c=relaxed/simple;
	bh=4thNVZ0mHB2sYEYeFvMvXVOlUMWi1njYgCSLRkweRH8=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=kVJ8pX9J3H68IjKkc+xsNgMSDGMOPAHsS6KJKCR2G0lJc5gfw0klgz7mzf6eDx6B5/HUkWjd48A38HCFOUWhM7gUkpj5PUG6NY+be6PSf3HyZeNuY2lDTQ5FXo+lFs+GllVQiSi5m4V4p+/m5zOx/28pBnfPCRGK9/+Ncz2PDMo=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=wNA4sqnR; arc=pass smtp.client-ip=74.125.82.42
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="wNA4sqnR"
Received: by mail-dl1-f42.google.com with SMTP id a92af1059eb24-12c19d23b19so5352660c88.0
        for <sashiko-reviews@lists.linux.dev>; Tue, 19 May 2026 11:06:53 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1779214012; cv=none;
        d=google.com; s=arc-20240605;
        b=ViSTMj8GRElkUROHTeUa5HcsyoDT6xVOyBuIXKP69qvQ53gM+D4wYxFsVDclcgT3Vq
         T+vi337/GJoQI9nYYDVvzo+E+jBdnPkJHJ0CP80k7LwRna1pTxutFSQZ+NKrKel6Ei89
         PR6rC6xW7FX0/ewdc5uAkZBXoy1HQYop7VG8diQCzjI4eDLZgyGtmoKUM8hmMhf4wcTp
         X1xuJs/3qEiBDsfAahxZftGhDdTEzbavZdA9M56MLEFVZRD+evlK25KgZWC7WQSWje4c
         Y4Ybrphp5HUxiHg1/Bqw7V7uZiU3gSSAwOtfB7jWXGja63KxkX5ETkso3WeLJsKEte4G
         wJyA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=pXEsiVi0J6CWJzQCcHF6I004hQIxqj2VlxwwG4G9tMQ=;
        fh=0zVHGC//SC94CWFKHtFt4lnskmkXkJNNy7lE0FDd3Ck=;
        b=BdgVYgFH8bogtMKJr9BPJVOcdBd288aXRdCrKwfNdqvqDzrnDztKq+nkrTmLe4hu2+
         /onJBY97sxw4LlWRKZRIQ/LkLucpYEkvMwcKZsdZ1tgfpJ+TbI/khDMFzvG8r6aKGUvx
         z9H8Xjj3lPAYGf4rlPOMe26QSHfJUyWKhHc9YJ3T8owJGUNUwQSt1hs1PSUejYPuP0FK
         Clp2YtWsJbUXjaJ6Q2sH5DaEthkfsyLOUsx3efynq0oeYVL/tbmj1ZuB2Jlc+cHvG1L9
         ETOiOfGHVpk1gyaVLahFr5ftb1/KufaMWzmdMR5OV37zd917Qlxr+rNHvz+rNKSrAUCZ
         ATBg==;
        darn=lists.linux.dev
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20251104; t=1779214012; x=1779818812; darn=lists.linux.dev;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=pXEsiVi0J6CWJzQCcHF6I004hQIxqj2VlxwwG4G9tMQ=;
        b=wNA4sqnRUwGPR08ZbI6g5kPcGMw/HJL8ZY0OdIhSGkFBrtppWC3E+/Gl/aZkLh2pg9
         GmWnArVXUweCmUZBcO/JVaWfYtdwVNo6R3GWdJMc/+fAZpaDOtiVdZeBp3WoOOfJEwns
         Z9Odn5SCX6ni4BCtPtkTwkcNxgiY3zbA7A3eM1CpSuixITg0Bjs/BVVOLB65KhghAnjL
         EwTd7vs444eezEW8e2t+Sh41gaqhhUPGua5f4jwm+TnOuJSpms/ikEWOvkQk5WkJFEpn
         lcS8d8bBYtvWi0NljfexGTqT3id43qtOXzzuUcV8vUR6FuwMjQPPpsUF2GwBBAihrtPu
         rprg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1779214012; x=1779818812;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=pXEsiVi0J6CWJzQCcHF6I004hQIxqj2VlxwwG4G9tMQ=;
        b=TfB4JoqJuMuuwLHjS2quI8hcmZ445LcaO1tqB0L3ElVPJvZtyNp4vlSggJVTJHi650
         XFmZqTmFsG3wEQ/ls++EdOaK7oZ2D3Z4Jg/wW8gDfVUIT3LvG4Nr4Jruc7jhELlULY24
         sFM1ttyDon5fFWnn7XLqQl+qbTR4dNY48BBadNOSLMwZEvWKZTud2TpJ1ew90JUZt1ny
         2YNv3PirvsbrMFgzjq78zTk8QcbMJoSgKqQIgnT3zaxt9ILjHNLL9HYmlHYPB5flmKRR
         R7EO/r4EEZD9i3gRVyAV3TYZ/Mu3+BqT9UfDkFNccCRzbYWguKRnZZoYu8VnkBcy5/Fh
         RCXw==
X-Gm-Message-State: AOJu0YyQSIBhJxHMspuVt1pi/8ejMVeysIxPomRihBPxTE9FPIjRz5gl
	rIXChYqYOLywgGicp/FgbvqQ0XfJ/M6S9yqnFMvbGgOe3SZdIsM0u0feHH2GuQhFxk1H/2GmC2N
	LTpHM82h/js7I48wE4Xqcn4ob5o2uwe0kgGT9WbbI2FIx5MfmwAKjTamS
X-Gm-Gg: Acq92OGN7q2YtLy6SKDbT1GLqbCu0CT8oGMeqo+qQhhG7D54lW3Ptdt7CeeX1Q5zHUF
	5Xl3kPAZs4VHfjUnsKFDvtK1zzMgy3HpAS/Af/sZwqRUdg2iwFY17HlYvzagIer54eYZrcl0uQ4
	KF44TPsA7lJzYFKMHUyn9WSpGLmMzRY7CidzTIXnb2oDaxsKCy1wngZaAqs4ObHnJYa9z4KhkvL
	sO6iJm43Nj+1LohkowmeCmLtr5QO1VQjHrUsU/AT6nsWm7M3K+wrljTgFp9rup8ip49kI5owhF5
	xtYO5XdAvDdK+Wa2rVIi+I34KGaRGeORU9Id8eqYAF4rqIkp
X-Received: by 2002:a05:701b:271b:b0:135:da70:c2d4 with SMTP id
 a92af1059eb24-135da70c454mr932737c88.25.1779214011829; Tue, 19 May 2026
 11:06:51 -0700 (PDT)
Precedence: bulk
X-Mailing-List: sashiko-reviews@lists.linux.dev
List-Id: <sashiko-reviews.lists.linux.dev>
List-Subscribe: <mailto:sashiko-reviews+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:sashiko-reviews+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20260518231150.1252420-1-ctshao@google.com> <20260518234452.DEAEFC2BCB7@smtp.kernel.org>
In-Reply-To: <20260518234452.DEAEFC2BCB7@smtp.kernel.org>
From: Chun-Tse Shao <ctshao@google.com>
Date: Tue, 19 May 2026 11:06:40 -0700
X-Gm-Features: AVHnY4IKM7KqTw7rimaea7u0hqsWqLvd1iRJlnijVTEklupSIQWf90acL9kc8ZU
Message-ID: <CAJpZYjXh2DFpnS3+_cKhJ==6n31qBU8Cnks9VXZB_qH5i7S-eQ@mail.gmail.com>
Subject: Re: [PATCH] perf stat: Fix uncore metric scaling bug across sockets
 and nodes
To: sashiko-reviews@lists.linux.dev
Cc: linux-perf-users@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Based on the AI review, instead of changing `source_count` behavior, I
will expose `aggr->nr` in perf python metrics and fix per-aggregation
metrics accordingly.

Thanks,
CT

On Mon, May 18, 2026 at 4:44=E2=80=AFPM <sashiko-bot@kernel.org> wrote:
>
> Thank you for your contribution! Sashiko AI review found 1 potential issu=
e(s) to consider:
> - [Medium] The patch codifies a mathematical scaling error across all agg=
regation modes for uncore metrics by changing `source_count` to `aggr->nr` =
without removing `#num_packages` from the JSON formulas.
> --
>
> commit 1c2296ec7fca6ef588c3a63c6bd68377de82335f
> Author: Chun-Tse Shao <ctshao@google.com>
>
> perf stat: Fix uncore metric scaling bug across sockets and nodes
>
> This commit changes how source_count is determined for uncore metrics.
> Instead of using the static PMU count via evsel__source_count(), it
> dynamically assigns aggr->nr from the metric's leader event to handle
> various aggregation modes.
>
> > Before the fix:
> >   perf stat -M lpm_miss_lat --per-socket --metric-only -a -j -- sleep 1
> >   {"socket" : "S0", "counters" : 28, "ns  lpm_miss_lat_rem" : "163.4", =
"ns  lpm_miss_lat_loc" : "27.5"}
> >   {"socket" : "S1", "counters" : 28, "ns  lpm_miss_lat_rem" : "170.5", =
"ns  lpm_miss_lat_loc" : "25.5"}
> >   perf stat -M lpm_miss_lat --metric-only -a -j -- sleep 1
> >   {"ns  lpm_miss_lat_rem" : "90.4", "ns  lpm_miss_lat_loc" : "12.6"}
> > `lpm_miss_lat` on global aggr is 0.5x the actual value.
>
> Does this misdiagnose the correct baseline? Existing uncore metrics like
> lpm_miss_lat are defined in JSON formulas as dividing by
> (source_count(TICKS) * #num_packages).
>
> Before this patch, evsel__source_count() returned the static PMU count pe=
r
> package (e.g., 28 CHAs). In global aggregation, dividing the global sum o=
f 56
> CHAs by (28 * 2) =3D 56 yields the correct average of ~90.4ns.
>
> The --per-socket mode yielded an incorrectly scaled value because it divi=
ded
> the sum of 28 CHAs by (28 * 2) =3D 56 instead of 28.
>
> > diff --git a/tools/perf/util/stat-shadow.c b/tools/perf/util/stat-shado=
w.c
> > --- a/tools/perf/util/stat-shadow.c
> > +++ b/tools/perf/util/stat-shadow.c
>
> [ ... ]
>
> > @@ -103,7 +103,7 @@ static int prepare_metric(struct perf_stat_config *=
config,
> >                                       val *=3D 1e-9;
> >                               }
> >                               if (!source_count)
> > -                                     source_count =3D evsel__source_co=
unt(metric_events[i]);
> > +                                     source_count =3D aggr->nr;
> >                       }
> >               }
>
> Does changing source_count to aggr->nr break global mode calculations wit=
hout
> updating the JSON metric formulas?
>
> In global mode, aggr->nr dynamically evaluates to 56 instead of 28. Becau=
se the
> JSON formula still multiplies by #num_packages, the metric divides the gl=
obal
> sum of 56 CHAs by (56 * 2) =3D 112. This scales the true average incorrec=
tly,
> causing the global mode to output the doubled latency value of ~174.5ns.
>
> Similarly, in --per-socket mode, aggr->nr evaluates to 28, and the formul=
a
> still divides the sum of 28 CHAs by (28 * 2) =3D 56, retaining the origin=
al
> scaling error in per-socket mode.
>
> Should the #num_packages multiplier be removed from the JSON formulas whe=
n
> making source_count dynamically scale with the aggregation mode?
>
> --
> Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260518231150.12=
52420-1-ctshao@google.com?part=3D1
