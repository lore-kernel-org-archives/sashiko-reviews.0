Received: from mail-yx2-f12.google.com (mail-yx2-f12.google.com [74.125.224.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 884F0390C8C
	for <sashiko-reviews@lists.linux.dev>; Wed, 23 Sep 2026 06:01:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=74.125.224.140
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790143270; cv=pass; b=iGyOycrBmCISCcuvDv4PcaxFMq/wVVxOLZ73BQ8h4jEUNql9q8ZglJ+wGf0bC5xedVcJRlnehH+RZGYLDH/WQXJe9XvJlSyDGvFq9RuAZ7Sdp0TOpQXhQAVjUASFvGmUR2/7UD78NtgFan1RF8VDgfDtvNeomvRR4/ubsYZW278=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790143270; c=relaxed/simple;
	bh=HgLSZl8XxyK20T4gh3lI0f3nK0YB9PmdSCSKHAKyLFM=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=IvJ825objhDYDtSyWBnRH4HcknB5oYqB2Y8SVbL4KNkOwxtfiPl7nLnpYPTFgEiqiwrMzRCn54Q3WJt/Ol0HcVc/dMVPOTMXQ5nqxdk/syXcCTWJNDH4cFpB7jsLaLFOWR64ZRGP7K7MAGbZPhNOGFJxazOeJIzaHypPPsl5lUs=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=bytedance.com; spf=pass smtp.mailfrom=bytedance.com; dkim=pass (2048-bit key) header.d=bytedance.com header.i=@bytedance.com header.b=jUsZaQRn; arc=pass smtp.client-ip=74.125.224.140
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=bytedance.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=bytedance.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bytedance.com header.i=@bytedance.com header.b="jUsZaQRn"
Received: by mail-yx2-f12.google.com with SMTP id 956f58d0204a3-66e4ab20f4bso626866d50.0
        for <sashiko-reviews@lists.linux.dev>; Tue, 22 Sep 2026 23:01:07 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1790143266; cv=none;
        d=google.com; s=arc-20260327;
        b=sAsLWsKHSqtkPDB5gbtVizIobfZzMEZ9oE3SeNnqnYKn5eGnSf0sfu+bkFCan3OMyC
         2cb56R6wLyMuE1KwwsGW03w+uL/uskCeKTgc8B3lexxvTpAsLLeSOQMcyT6ZzPsYy6nb
         odNPIkTvOEs7b+ir2XYXUzFtg2C7RQznhp5nIz9hyKLF5kYDhAnSm2mCTd3z3RwVmRQx
         Hjkxu4U7bo1JgnXcXe2q5XNedA3JA9OIyozACKxO3OpVYPdV7FbnHhGr7Cbb++K53i6K
         VFMlL4GWbCzgn9fXCLL/VihVbHokW85ioR5FfIikR9+B0AFr4Er2T9WNBSr/wF2CP/3M
         LcNw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=BI7bwcNjzQv13pRkfjbMflvweeVEe6lYqf3+ijkmu54=;
        fh=XV7sKTyah1K7aipQhcnsXSXP1qrM3RCNndYxUeBi5Vg=;
        b=RwjyFUV/AjDFG2LdDVE+J+vKkJoUbZfX8NV5CiiVJsduzaBP1gFywKXrAEy/+D2khV
         y/9K2qYjTY8o0+t/L25CcSn2lUwm+Posiwqu1YUTFdZCqHg5lF8OpQCFT9mV7Ykr/V+7
         Qxzyg3lDRty8inYt6IQwWY6hEHCNf19T2HWsnKUQPxFBLZQAVH6Cj/uSzIVxKNc/it3C
         EjyfB3OP7ibhjBkxxjBNil4swTrcvUv4/GSajJ8+4zr9BHxYL/LSMuvMCKdraMWKKIH8
         QMJ5SffziFfG9FykdlNDDPAcBxZ6I86gAyBSlsHn+TRf3gBugSLhEs48XViznBZomtrN
         A2YQ==;
        darn=lists.linux.dev
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bytedance.com; s=google; t=1790143266; x=1790748066; darn=lists.linux.dev;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=BI7bwcNjzQv13pRkfjbMflvweeVEe6lYqf3+ijkmu54=;
        b=jUsZaQRnGtLu97Sq1odJ+i2Cs/8cbQWrGwOldKN+Si5FH+ptN89aSKiF/cbSUbvV77
         jlruprcgMhwxUBWGeixof15JVWUDxf4+9I57RajU/JU7vGpgeoQgra3MDzV/VJmc7nWC
         vMPdraH2Dv3crwfBh3gwzOCuEChYfm285tmMThy7lr38GiIvkA4yV+Xf/dB42lKhQRR2
         sq+Tzp4PY6KsZG98Fq/fnDqgeQwWhPLP055gfgAQKaeuHX2igTtOqGo5pCgtu0kSg1CJ
         Gd0JTtVQbw5h0jcp8/bND8cWEM0jCrS5UWNNNW9/u48OG3m6xi7ogsBOUrsLrZOL3Z3V
         ZjaA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790143266; x=1790748066;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=BI7bwcNjzQv13pRkfjbMflvweeVEe6lYqf3+ijkmu54=;
        b=CunOFe4fYrNt0XUYw4Dc1P1fporYb6tEwnIPr6T6Sqh5BwIl6f1dhPRMzlaugcP5KZ
         +tZQfxLtjFUBmPVU1P+pVHEv4Ejq5On9M3ftbe8ca2rNJvTlRkIqEJLFgV8BncykRi/r
         oetXwVAtad+tB3dFmLdyvdlJ9Q7Ro5zfat8ZDJUa20BAIs68VT7uywg4YuzOBqiCs3T5
         DhZ7yAbVdeW9VLQUkx+WUZfiSkkHYdglBqQfz3xCQWM8XaGwFcdHs0h0E2UTSiaflf5A
         Xnl/tkd2Ace2K1jFnVHvhvWzC9yDh0+yM+kgv4sxGEA+Nwo2qt0QOKsqrllvhuhedKJi
         2LVA==
X-Gm-Message-State: AFuF++k2veSjYCps4ZA27vsmApjDa/t5kWt2eV+EbcLz5JUCgmnhlO6h
	/gVQ+aXnD56BJ70Of/NmSAqmHtAgxP27+ZyzFnJrVJ3fH+ESI3N71U97hxD9doYQEwYXK8IVwWN
	gatyYNDT4JCFjL0F0pGbW6LJX01jqfb04bkwu43z+68T2AS4xGRbtY48rHQ==
X-Gm-Gg: AYBFou1tsHyc8ahVELgz7DjFmmejGzSXS7xqZaynzO26ooM25LtHuNwLhsfO+QJ9WbQ
	jpy1rkcIOOmC/+0WyaxeNYQBaOCtv0rOLpQ9igJ9J7nRQanvEZCP6JgT1b9WpwXfCwjyA7Jre08
	cZxLi9mxrSsTnu1c9+gDTEw1FLBC2hzGUSzh4ML1ErsSFe1tzDHlyaBnY3YJsSfbGXZORGA0RC0
	kAIUiN37vLtAcET3WrH24yHa5jClX27BeFlRLXl5AU5OQR8J4SXDZxQ4/J3rilknfrV/wCIBAWG
	7j6uGPJRNRJOO4Z+pc9GLyUhFPm/OYgenr1Y1VW6P4DrcU7OljPPOMs=
X-Received: by 2002:a53:ad50:0:b0:66f:c1bc:40a0 with SMTP id
 956f58d0204a3-672d58abf06mr470879d50.99.1790143266221; Tue, 22 Sep 2026
 23:01:06 -0700 (PDT)
Precedence: bulk
X-Mailing-List: sashiko-reviews@lists.linux.dev
List-Id: <sashiko-reviews.lists.linux.dev>
List-Subscribe: <mailto:sashiko-reviews+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:sashiko-reviews+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20260922082551.874901-1-songmuchun@bytedance.com>
 <20260922082551.874901-3-songmuchun@bytedance.com> <20260922083712.A89111F00893@smtp.kernel.org>
In-Reply-To: <20260922083712.A89111F00893@smtp.kernel.org>
From: Muchun Song <songmuchun@bytedance.com>
Date: Wed, 23 Sep 2026 14:00:29 +0800
X-Gm-Features: AcwNN1U14lhaEIPXhrx92Llhfbcm9mObr2diD8G4hu8c12kamR6vjUggv5v3RCQ
Message-ID: <CAMZfGtURkCQo4DCbdj+KcG0zbZHzECfY2c0aqnDeLWYt_uo9Eg@mail.gmail.com>
Subject: Re: Re: [PATCH v2 2/2] dax/bus: fix Device DAX range alignment validation
To: sashiko-reviews@lists.linux.dev
Cc: linux-cxl@vger.kernel.org, Linux NVDIMM <nvdimm@lists.linux.dev>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Tue, Sep 22, 2026 at 4:37=E2=80=AFPM <sashiko-bot@kernel.org> wrote:
>
> Thank you for your contribution! Sashiko AI review found 1 potential issu=
e(s) to consider:
> - [Medium] dax: TOCTOU race in size_store causes partial shrink failure
> --
>
> commit 519db297333e73581e0bbd5524e7d6959d7610a7
> Author: Muchun Song <muchun.song@linux.dev>
>
>     dax/bus: fix Device DAX range alignment validation
>
>     dev_dax->align describes the page size used by a Device DAX mapping.
>     Both the start and size of every range must therefore be aligned to i=
t;
>     otherwise the starting PFN cannot represent a naturally aligned page =
of
>     that size.
>
> > diff --git a/drivers/dax/bus.c b/drivers/dax/bus.c
> > index e40c25401cf06..277c3ce23b831 100644
> > --- a/drivers/dax/bus.c
> > +++ b/drivers/dax/bus.c
> [ ... ]
> > @@ -923,6 +964,9 @@ static int adjust_dev_dax_range(struct dev_dax *dev=
_dax, struct resource *res, r
> >       if (dev_WARN_ONCE(dev, !size, "deletion is handled by dev_dax_shr=
ink\n"))
> >               return -EINVAL;
> >
> > +     if (!range_is_aligned(dev_dax, range->start, size))
> > +             return -EINVAL;
> > +
>
> [Severity: Medium]
> Does this new strict alignment check introduce a regression where partial
> shrink fails if the device alignment changes concurrently?

Thanks for pointing this out. The underlying TOCTOU race is not
introduced by this
patch. It was introduced by commit 6d82120f4156 (=E2=80=9Cdevice-dax: add a=
n =E2=80=98align=E2=80=99
attribute=E2=80=9D), which made dev_dax->align writable while leaving the
size-alignment check
outside the locking scope.

That is also the commit this patch is intended to fix, as indicated by
its Fixes: tag.
The stricter check added by this patch merely makes the existing race
visible as a
partial-shrink failure. I will therefore fold a fix into this patch by
moving the size-
alignment validation under dax_region_rwsem and dax_dev_rwsem, before any
ranges are modified.

>
> In the sysfs interface, size_store validates the size alignment before
> acquiring dax_region_rwsem. If a root user concurrently writes to align_s=
tore
> and changes the alignment requirement under lock, the shrink path proceed=
s
> with an outdated alignment assumption.
>
> During a shrink, dev_dax_shrink irreversibly deletes fully trailing range=
s by
> calling trim_dev_dax_range. When it reaches the final range to be partial=
ly
> shrunk, it calls adjust_dev_dax_range.
>
> If the concurrently updated alignment causes this new range_is_aligned ch=
eck
> to fail, it returns an error mid-operation after trailing ranges have alr=
eady
> been deleted.
>
> Since sysfs writes require root privileges, can this time-of-check to
> time-of-use race leave the local resource state corrupted, with the devic=
e
> configuration permanently broken due to missing ranges and an inconsisten=
t
> size?
>
> >       rc =3D adjust_resource(res, range->start, size);
> >       if (rc)
> >               return rc;
>
> --
> Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260922082551.87=
4901-1-songmuchun@bytedance.com?part=3D2
