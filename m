Received: from mail-pl1-f182.google.com (mail-pl1-f182.google.com [209.85.214.182])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8AFF43537F6
	for <sashiko-reviews@lists.linux.dev>; Mon,  8 Jun 2026 22:04:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.214.182
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1780956295; cv=pass; b=eqRfpr9+MotEm0AdUFUqGDUOs0tV86FoB9bRH/dO33IQaYGiVOuNhwBrJVNUxkQNqO1OLw8yt1NzV1oKj36KNwXVi4E1mRNngOJRh9/2/Dc5TSWCxlcek+b3sqcesiW+e9JzCHyXtiA0NeiAeknYPRFfqjtAy+tWWRk89jDbTNQ=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1780956295; c=relaxed/simple;
	bh=96Bl2Le2SrDLYs7lwbXp5ggsEebB71g/kJ2r9eR2AWg=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=ODY9zGtB5GzRx4OXl9ikiw0ZnSlo1oZ2HXmDpcbJRHC70vJj5prCJBojjgJCpNmvFlCRefVKswGYjOWuCdgJvJ5gNypOavBiCndeHCFJELQdFYsYZEAh826R5ugNzq5Rh3W+kfrzuKavKEgoL84Ow8J57X5qFbnJgjGd2gYhWiU=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=G2JNfAP5; arc=pass smtp.client-ip=209.85.214.182
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="G2JNfAP5"
Received: by mail-pl1-f182.google.com with SMTP id d9443c01a7336-2bf2d865383so371555ad.1
        for <sashiko-reviews@lists.linux.dev>; Mon, 08 Jun 2026 15:04:53 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1780956293; cv=none;
        d=google.com; s=arc-20240605;
        b=FmHdTMFkgshozQjm9ybygvDSw6GfAAIPkxmDB0OOfXTLvHGBCMDtbmaY/Aj9Ogs20e
         YOPaHvlMjmzQUNiv9iSExyKDLfiC6m+A2kXMIO5kleIPk5T+ogbvNtb4fPesNVjMaCVS
         B8ZWfNQ2OiBI0gDDqxulntuuN+I69BOutVQUoxwTCTjgiMgStgcDFIxCilKU4R4SLVTw
         iDFJyEsZKWyJ4XelCklgVFlsKNqEMY4HsduCSyW1cuEEzi9659cJ2vnztY1fiysC/jUC
         Xj/FtreNUQaFzpCjagQHPOk7EaWCUJ9dFPHXz1+ffoHeA8UvlyL21uoiFzm36Kv4MOvs
         Aqow==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=dknO3aOZ4qOTvh6ubTcjTOWHYovHPuYZpoxCCZ0yRgw=;
        fh=t8A9dPfrPNT5ibK7Ec6z8jBEDhCNM+VF+O+EufSncJU=;
        b=RXR0Xe3+LvUKDonD0ZFA+qmC5v6h5vnpKU4Wg745MY8NrMEGlosPiP9P48HfHDIniY
         TiGJZDtfCLWNQz0yrs1aQ4fHlYrP7SrYyNU7TQvtNAM/Jvwgqk7FtseurFtIvw6JeUXy
         KXvhMnr+mdeepLaeyfFvqAzy1Epca53U+hCFDEldSKfGtGQPCoJvw6pvGBSYNtagweUP
         R4kb5zQWxmd8rMDzUYVR6nY6MrVn9kDnGYCv4+j8gcz73Bdqnpp5YUqchYfuo/BZfktT
         aY6+ezHDAU1Kf3hqydzH4OoGRBk2f86WCF9DRrL7OjEdy7IWaFwvntxqdw7xdTsO7jyo
         3rFQ==;
        darn=lists.linux.dev
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20251104; t=1780956293; x=1781561093; darn=lists.linux.dev;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=dknO3aOZ4qOTvh6ubTcjTOWHYovHPuYZpoxCCZ0yRgw=;
        b=G2JNfAP5b+vh0yL5nC+2jPtVrCvKGksyTrpFjOmUA+hgZVioFSmT0oPd+UicO75r0m
         rwzO3m81J7o/TWi4Jo5V42oZRpABnGJBVOV4NZxDN5tmqKMaqKjh+iweo1gVbh5mkOR6
         U55m4cUptOIUxpqgLQSN6MwqOX4idZjd33LYD4uRtDIdg329rBpL9ntDnyiJgJrHSGHe
         lYKJTOIyaQuAFcRYKRnrssED/4XymWFiVf+Rccs9GgKZ5mgg5w8Jt5VHE7BXsUjnvbfA
         a+tcYQYMzmEWGgmR8WoHzuV8nx4E4jxhgOwP8X//ksHOMZjTB9ndhyYrifECRJgawt8d
         IIOw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1780956293; x=1781561093;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=dknO3aOZ4qOTvh6ubTcjTOWHYovHPuYZpoxCCZ0yRgw=;
        b=DxVfpe7ayRBUSr93+MatUR1boLSs2p2GREAGVurSqTGqiMtwdjUHRTsTg1fYnlDFhG
         LD66b4WBcRR8479zll03IOpnc3TsNguh+JWjYmE++0e5zshfrueyci4YmhQhqZVC/dDY
         4+3XcW9AeFKq1oOhIfnVc9pdJZSGSWV7ajtAl9sgMvQrIweyTpfzF9JLoh+TR/SGXocm
         N1EOOin43rDg6maR65VbNEnMNCFiNpGaBdM3M+otInGFPIrIFxew5okD+H+r47dGyb5I
         sxfUmLuJKkCDRryNYLePR5mQtG/iomUPpLGB3UjAcmLyWQ+kWDpgR5h9xT8at77U/gCt
         FGPA==
X-Gm-Message-State: AOJu0Yw4c7W7ifCF2kHpa8x0LCmAgqFr/LrC3OjLS5TlTL5i+Sr7MzLT
	2iPH5p3uZoAALHErikhOnhrHJ2HNSniNxeQtw72yGfgZUlPwr7MprGFa2xlmNOAYo5cynagwRfb
	Et2EF+e3paWpLduVOT+B6aR63azljqY1/itTjUIT7A6VVv4JQr5yhGUWU
X-Gm-Gg: Acq92OGHSZfy8zIbe/n4yafxEP4WR+vQ30KFyxxMZ3FoU6t7fss1aD3k5AYbltghrFO
	nx9HoACWk1yuu4vVkcCwaQQDSg4gHLbDhccGMdpVMK0FUv9b7V8w5PZPCHnhWskRHDsTGApXv1a
	YSo9ULt88A1VjhTn1iWMohmkxOL2z+MgKFpHAKLSmKPEdzNSGQOQMU7bWuDs5ZuRrw6qfuomrRr
	grVONo8hxdEZnBKbrlmuCAYQtLwFg82TL9WwgjwsTy9P6AaNcF5rw7YX+Uvhvm+J/hQNqfeyFtp
	VSmLIjIRo3gyrVty7EkGIwro42zFvajgtU/aqL3nuIrl67Fi
X-Received: by 2002:a17:903:1aed:b0:2b9:e831:5e5c with SMTP id
 d9443c01a7336-2c1eb72a130mr5883515ad.4.1780956292384; Mon, 08 Jun 2026
 15:04:52 -0700 (PDT)
Precedence: bulk
X-Mailing-List: sashiko-reviews@lists.linux.dev
List-Id: <sashiko-reviews.lists.linux.dev>
List-Subscribe: <mailto:sashiko-reviews+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:sashiko-reviews+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20260608201753.1979464-12-acme@kernel.org> <20260608204539.0E0C91F00893@smtp.kernel.org>
In-Reply-To: <20260608204539.0E0C91F00893@smtp.kernel.org>
From: Ian Rogers <irogers@google.com>
Date: Mon, 8 Jun 2026 15:04:40 -0700
X-Gm-Features: AVVi8CcVd-nogTnr5Rt3DF724JTHentVjWsxZLchea7M2K-aDoqhaR-7Mh_XVyo
Message-ID: <CAP-5=fV+trJGAEKhS2YTea0A39VgoYUxbcp=E0csPepD751N3A@mail.gmail.com>
Subject: Re: [PATCH 11/11] libperf: Document code simplification case for
 widening struct perf_cpu
To: sashiko-reviews@lists.linux.dev
Cc: Arnaldo Carvalho de Melo <acme@kernel.org>, linux-perf-users@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Mon, Jun 8, 2026 at 1:50=E2=80=AFPM <sashiko-bot@kernel.org> wrote:
>
> Thank you for your contribution! Sashiko AI review found 1 potential issu=
e(s) to consider:
> - [Low] The documentation added to `tools/lib/perf/TODO` incorrectly stat=
es that narrowing values > 32767 to `int16_t` wraps them to 'small positive=
 numbers'. In two's complement arithmetic, values from 32768 to 65535 wrap =
to negative numbers (-32768 to -1) when truncated to a signed 16-bit intege=
r.
> --
>
> commit e8f5b26d672396c3173a77e6aaeee613f6d309bd
> Author: Arnaldo Carvalho de Melo <acme@redhat.com>
>
> libperf: Document code simplification case for widening struct perf_cpu
>
> Add a bullet point to the libperf ABI TODO explaining the code
> simplification benefit of widening struct perf_cpu.cpu from int16_t
> to int.
>
> > diff --git a/tools/lib/perf/TODO b/tools/lib/perf/TODO
> > index 486dd95dc5720..1a3644aa1f38d 100644
> > --- a/tools/lib/perf/TODO
> > +++ b/tools/lib/perf/TODO
> > @@ -11,6 +11,13 @@ together.
> >       (x86_64 max is 8192, arm64 is 4096), but NR_CPUS limits keep
> >       growing.  perf clamps to INT16_MAX in set_max_cpu_num() as a
> >       safety net.
> > +   - Code simplification: the int16_t forces defensive truncation

I think Sashiko just wants this to be uint16_t :-)

Thanks,
Ian

> > +     checks at every boundary where a wider CPU index (int from
> > +     sample->cpu, al->cpu, etc.) is narrowed into struct perf_cpu.
> > +     Without these checks, values > 32767 silently wrap to small
> > +     positive numbers, bypassing bounds validation.  Widening to int
>        ^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^
>
> [Severity: Low]
> This isn't a bug, but is the arithmetic description accurate here?
>
> In two's complement arithmetic, truncating values between 32768 and 65535
> into a signed 16-bit integer (int16_t) wraps them to negative numbers
> (-32768 to -1), rather than small positive numbers.
>
> The overall conclusion remains correct since negative values trivially
> bypass bounds checks, but the description of the wrapping behavior appear=
s
> mathematically inaccurate.
>
> > +     eliminates this entire class of silent truncation bugs and
> > +     removes the need for the INT16_MAX clamp in set_max_cpu_num().
> >     - Scope: struct perf_cpu is embedded everywhere =E2=80=94 perf_cpu_=
map__cpu(),
>
> --
> Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260608201753.19=
79464-1-acme@kernel.org?part=3D11
>
