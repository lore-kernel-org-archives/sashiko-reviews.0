Received: from mail-dl1-f43.google.com (mail-dl1-f43.google.com [74.125.82.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E2520233939
	for <sashiko-reviews@lists.linux.dev>; Thu, 21 May 2026 22:01:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=74.125.82.43
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779400890; cv=pass; b=OAQ3l4B7nlE62ovmlqT0RGTKWvPC+3Mj0ufzLynbEvr60cjNGoEUyab4HDunPV9D5WCuvHlBFUVSgvTQl+4hyELPpYIih29hliwhLDMddsY+Zn9KKKBuS5jtM7TBWyVfWS+0Nupgl1LILL9CJ4cckTW0fagrfs8Tb2nLHL/FW/c=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779400890; c=relaxed/simple;
	bh=N4Fjx9tROeMbPDKksh21KcpQq4T9sIggDrL6n+lYp5Q=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=g3p3R2TbKEChUjV0X/UdA3QR2l69I/kDc/Gmd0XJE6JStX0oS5JlvD96Qx2z8zcLByypnI2GfSZ7+KfkJoh8TpdX6h3JpTFUO4yHdnlrN4ns1ePbSOAgQktanxxm6Xs79YmKSk7y38bTkm676MTIkmFX9TM57LGl39MFN4Yq/+c=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=AiH+AndP; arc=pass smtp.client-ip=74.125.82.43
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="AiH+AndP"
Received: by mail-dl1-f43.google.com with SMTP id a92af1059eb24-132830d8281so241159c88.1
        for <sashiko-reviews@lists.linux.dev>; Thu, 21 May 2026 15:01:28 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1779400888; cv=none;
        d=google.com; s=arc-20240605;
        b=QBb7aFwtwraY+dlZnyC4nj8s4Gx7PCeWRyIGXDMUcqJ1TgUaaVDwVjUJJeDiMLcW7j
         6w9Cj+hew/86h0fryKuf+OKUF5ow+6SM3ADZSidgGAjTih3j0XjM01QYauEgybRTdpBJ
         Gq6YQ1p83QAJLoQD2Cy0FLl4Y5boynRGXlS9CagVrY+CiDkJlLVg2Sk8tN5B+brj00zk
         MxAevuGhsGbB8eVIMMZWwqBB9Kab5LiWQUxTpEH5++YxXBJBrQlQMLCKU/JOOHWpsNOE
         J5Cm3p3VeFDh7UpIkJkNNi6Oyhp18JvshF29RctgsfWhD+iZHh0BrF3PqTOFgmbQLptZ
         /rrQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=9y4H2uszFxZcCkY9wTX2g9+u7oXwsEvHiSVj7q7N+5k=;
        fh=0zVHGC//SC94CWFKHtFt4lnskmkXkJNNy7lE0FDd3Ck=;
        b=eJFQXagciXEpcXqKRIaWqmWR9T+E6711W8leQciVDwsBOJM2D2E4ZXvLP1x4bYrrIa
         jWJe2v0lKtmxsLATsIJZbdosAmX1YWQB9y3XSVl2YL3AurnGFZ4qWMicTG6DtGyRFVTm
         hNRKeDBPiz0BvKEDZlurFlFOULUGgdcI6/WacMRvclsibfskS04ofr3glRMcbKrCs9Q7
         Bp2vYldUBFQeT/vwpIL0RJAoHj+h8lH+YRmCmaDsqe2p+TLzdUpmq9NrNUSFBxhe2UKE
         h9CpqOfX1RgVr75pSzH6YXTB1KVCuFwq26X/wSMbOB4CNFAy/whkIux6Q6Xen5Es+d5j
         fjWA==;
        darn=lists.linux.dev
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20251104; t=1779400888; x=1780005688; darn=lists.linux.dev;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=9y4H2uszFxZcCkY9wTX2g9+u7oXwsEvHiSVj7q7N+5k=;
        b=AiH+AndP3xr9GxNcw79NH0J6tuq42xYzP1qOuFNmagFTmqgXXCJVl/PFKyhoUyW4Qd
         YOqP7ZZEE36pS9ZaS3FtqTAdjE6o6eH0v/GAyYb12mY4rxV278Hf7dbT5Rvn+uMIeIVD
         wDos+2W0ILntobwHwiupTUNaXqu64hAScaJW6DToL270sJef5IHq+m7iAh6xLWMbqfRy
         tL7CSH30SkygV1gtG/HLmkIOpnkq5LZQAKjh8snjEtczOLpfBelNfEox7IOwNpizshua
         QBG8XwIBCoWPf9RdDYCRQHrys2eIltZe3j5BAULCRuz/jTm6FINSpeTbYderrcuQoTw6
         7N+Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1779400888; x=1780005688;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=9y4H2uszFxZcCkY9wTX2g9+u7oXwsEvHiSVj7q7N+5k=;
        b=iZ7aKpcqIe1t2tuggL3kxnupmshs1mtxxPrItND7ix39UZMj2ryP5qoAvv+aw8LzB2
         UBXMRimXzqGAMM8kSiatYABK16gNTMKGPhF7ZXAiUpZJTzz9TEKFSPjXcCPXwixAlGwU
         tGIDFG12yZjNDRbY3Rnd6PIArfTPx1bIUKqnpvpypuNXnHfnOogX14oL7y5vd6Efblhw
         Xced11/1lZhr/UhXYFuagKYrZOxWwXZ2ZL/bPqHbyyEd1sJIiDcJVDIHMQscQIpd5RTG
         fAKq+9GbFLZMiebJ3ttbaV7Q3PjVnA4/k/ElKGmsLCj0dF5AsfRmcLzyQ/ZsmdVQ7Fcc
         Vs6w==
X-Gm-Message-State: AOJu0YxKGBHepQcLPtYC5LWNyDqnk5MP7yIIHUsi677ehkBMFG6Ie5/e
	F3BC9+mSVeA6BXpBErS/RJ5UMmQztVouBfEP+mevMNfPcA7KfQRDfmnd5pmiawcXFpLdBZsNHPC
	tDnhh3Ciq2fsznpRpIdkmabZgdm1B3T7t+cDmqS63SMi50huGaAbkBUBv
X-Gm-Gg: Acq92OEAaKTMNKtwKsfa+P9QEYELvEFcZYkvzGwjeV3WRZIN5y8whvCrS8EgXkBFvU2
	sXTrWOJUN9p0Mix9V5jwAZQU228tzXjxNMYMkYMfBxhsU+GHlLit2Nh7pYylD9ReVJxpou0PdT8
	AnTKimLOfB5AlWCLXQ7zceaxRXzUhXuUAIVfyTs3jHRvnoVtcBXWMUpLAA6k8j5Pa7AJMwbSlgP
	h7pFa1PpUQaCQXcy0FBXDzFNgphwQ2Z2BFKj52jpV6FuDU/A8jrNz5hex8RMr5KiUg5iD/rJQQm
	8FYK16QrSjTxUN59jwbujWrUwyU=
X-Received: by 2002:a05:7022:699f:b0:12b:fb81:d69b with SMTP id
 a92af1059eb24-1365fb3f9e1mr444923c88.19.1779400887229; Thu, 21 May 2026
 15:01:27 -0700 (PDT)
Precedence: bulk
X-Mailing-List: sashiko-reviews@lists.linux.dev
List-Id: <sashiko-reviews.lists.linux.dev>
List-Subscribe: <mailto:sashiko-reviews+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:sashiko-reviews+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20260521201505.124690-3-ctshao@google.com> <20260521210856.4751E1F000E9@smtp.kernel.org>
In-Reply-To: <20260521210856.4751E1F000E9@smtp.kernel.org>
From: Chun-Tse Shao <ctshao@google.com>
Date: Thu, 21 May 2026 15:01:15 -0700
X-Gm-Features: AVHnY4KTFuuRNrnFj3sBK9etQBeO9LKQmbYilyAosOf0LBBoJ4GM_Bj2P9HHT1U
Message-ID: <CAJpZYjUAi-CjyXW1ZLfLN9f9HFwfmpkzkR8w3o_RDMbVnYOqrg@mail.gmail.com>
Subject: Re: [PATCH v3 2/2] perf stat: Use aggr_nr scaling for Intel uncore
 miss latency metrics
To: sashiko-reviews@lists.linux.dev
Cc: linux-perf-users@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Thu, May 21, 2026 at 2:08=E2=80=AFPM <sashiko-bot@kernel.org> wrote:
>
> Thank you for your contribution! Sashiko AI review found 1 potential issu=
e(s) to consider:
> - [Medium] Replacing `source_count` with `aggr_nr` for uncore events yiel=
ds mathematically incorrect metrics.
> --
>
> commit 25ed3f24e52414351780a2cc517f2d6534c79d03
> Author: Chun-Tse Shao <ctshao@google.com>
>
> perf stat: Use aggr_nr scaling for Intel uncore miss latency metrics
>
> Update metric.py to support the new aggr_nr keyword in the python metric
> generator. Replace the usage of source_count with aggr_nr in IntelMissLat
> inside intel_metrics.py so that uncore latency metrics scale correctly on
> multi-socket and SNC systems when aggregated globally.
>
> > diff --git a/tools/perf/pmu-events/intel_metrics.py b/tools/perf/pmu-ev=
ents/intel_metrics.py
> > index 52035433b5054..d99c7dd43797c 100755
> > --- a/tools/perf/pmu-events/intel_metrics.py
> > +++ b/tools/perf/pmu-events/intel_metrics.py
> [ ... ]
> > @@ -674,10 +674,10 @@ def IntelMissLat() -> Optional[MetricGroup]:
> >      else:
> >          assert data_rd_loc_occ.name =3D=3D "UNC_CHA_TOR_OCCUPANCY.IA_M=
ISS_DRD_LOCAL", data_rd_loc_occ
> >
> > -    ticks_per_cha =3D ticks / source_count(data_rd_loc_ins)
> > +    ticks_per_cha =3D ticks / aggr_nr(data_rd_loc_ins)
>
> [Severity: Medium]
> Does replacing source_count with aggr_nr here yield a mathematically inco=
rrect
> metric?
>
> aggr_nr evaluates to the number of CPUs in the aggregation unit for a spe=
cific
> evsel, while source_count correctly tracks the number of PMU event source=
s
> (e.g., total CHAs).
>
> For system-wide uncore events in global aggregation mode (AGGR_GLOBAL), e=
ach
> PMU's evsel typically monitors a single CPU mask, so its aggr->nr evaluat=
es
> to 1.
>
> Could dividing ticks by 1 instead of the total number of CHAs result in
> metrics being off by a factor of the system's CHA count?
>

A false alarm, source_count is always a static number of evsel, which
should be replaced by aggr_nr when calculating per-socket metrics.


> >      loc_lat =3D interval_sec * 1e9 * data_rd_loc_occ / \
> >          (ticks_per_cha * data_rd_loc_ins)
> > -    ticks_per_cha =3D ticks / source_count(data_rd_rem_ins)
> > +    ticks_per_cha =3D ticks / aggr_nr(data_rd_rem_ins)
> >      rem_lat =3D interval_sec * 1e9 * data_rd_rem_occ / \
> >          (ticks_per_cha * data_rd_rem_ins)
> >      return MetricGroup("lpm_miss_lat", [
>
> --
> Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260521201505.12=
4690-1-ctshao@google.com?part=3D2
