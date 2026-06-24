Received: from mail-pl1-f176.google.com (mail-pl1-f176.google.com [209.85.214.176])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4BF5633F5A9
	for <sashiko-reviews@lists.linux.dev>; Wed, 24 Jun 2026 17:13:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.214.176
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1782321199; cv=pass; b=UpbyJmxHUv53/QlKO4QY7Lge1B5JyI/QmwYS7Ndi653pmD31Ql7DtbzVvvQDeAicTd46y9cagJfRDMivcf+ynqQbMe7Jj8mhKRn+BvRdnuoJBCJtwRs8MllutDQHMhLQRyf9SdXNUt4G7eSTWox4K46+601wGgGGpCUeCmls+Jo=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1782321199; c=relaxed/simple;
	bh=M+qWvplBCfNcYUYxb18e9U3vILZNPA0XupfsmVtyyio=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=LgsQ6LjrMjbYNnKHgmj0CBYvAqg8OVIo8r/hpiaSM9qIXpdssk8HcjWyKmnZWr6nV+s5/dV5D/pSkC0ozm0Cf/lErOr8EQ5xGWUkyCxA2aU75aDBwI4ddKEA5wxYfW/35enAvMUtPE1iMnkKm/cK5TDWVkzD7+G0i+0oTZugIbQ=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=IiFGG4be; arc=pass smtp.client-ip=209.85.214.176
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="IiFGG4be"
Received: by mail-pl1-f176.google.com with SMTP id d9443c01a7336-2c6afcc99a5so420785ad.0
        for <sashiko-reviews@lists.linux.dev>; Wed, 24 Jun 2026 10:13:18 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1782321197; cv=none;
        d=google.com; s=arc-20260327;
        b=mgfJoIIJLhA6QyrMTHz/2tcGoagXKB6KFvLHh8wYxUIPRZj0erSmDtavk2nCYMSk7t
         8h7RDYJH3Q/QU5ZqB57OPiLcrQhpdxLfToAjIeRYu0wWLGvcmkRhlNix4g602Vyjd373
         tHiErmE1rcKdhH49bIw5UsBNBCB5gcx0OQAgzGq7Vuyui2swQ+eNt6LGtAIT7yLx2UZD
         k/ahlAvnqOCB0HRz23rcLlG89+AYDWMv9OHTuFOSdwmwJOTI1i+VhEdCXC9rs8G4zBxj
         YGJlziiv2mnvhHNeJAbNDqaNhnpKygrAI2TSR/FwXMrx4tYddNC+zh5Oe+TTF1aNGx+g
         UvkQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=gPujeRuuTxJJkg1/xr5Q6pxPlOf/lNNbV1Cb9sjSGUw=;
        fh=mTP6TkWV1IhQRgyhsEpYqIpiXvhDlZKdHAfNRdOTDjk=;
        b=WMHg31moq8zzW+qEmIu7y80QpTfsD6rInE0un3oJA+ko6PWin2XH25UPG4KAAu8gf5
         74NnTFbGfs+50WTrO0KykXLWwtGRayHku7PhymHgN19DX/jLkvXuxdwe+F8XZhDNS/1g
         Cdr/P9nSAHuOnFKC2y1E1sW1yS4o8YkpVBUEOhqjWMSQXE9+SBSkWmBmh8Mmc7xfTiA2
         gEeZvEDMLs0j2SqrrqJ2MjZe8K1W5QxQNhGvuWrhImM8S60JFL969cba11IOVXveCjIm
         0DJ7Tyi2YfWunWGO1dNt7VvDVSTcg4s8w4fCc6ElGmKE6n4JYtfu27yXwYGiMVAybP0Q
         A5+w==;
        darn=lists.linux.dev
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1782321197; x=1782925997; darn=lists.linux.dev;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=gPujeRuuTxJJkg1/xr5Q6pxPlOf/lNNbV1Cb9sjSGUw=;
        b=IiFGG4beyYppayuhsZ0H4Vt4bGVhBp3HQBsymeTmNCih4st9uJX2gheL+yBKebx0LB
         lUS82EQbf0l6xENvQ8mre01n1ljjYyzD2R/mOWnOyJqA7F/8uFOr0x69PzCqqZmGu3QQ
         6YygR1ncVKNHxsQNu1h8l2N9UxJ4DJNmYyQ2hTZoviwyEUHzy9t2SoHANH7i248WPXAt
         Q60lse8yBQ7ilOTVjTyl02jZkM5myA1Na18nodi4Ac4rfpEQXZIY4ZPOtnruygT60Yfx
         dGtyKhx9c7Xi6pERSRZPdMEHKKsQMMltjE2xzDmf5VlWo6T63styAl7wtOZLkN0mQfW6
         8Ibw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1782321197; x=1782925997;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=gPujeRuuTxJJkg1/xr5Q6pxPlOf/lNNbV1Cb9sjSGUw=;
        b=cXi1Kx8JkGHoUPi2X7hhN8CD1ehfNv6JcUbjqA9r/o3xr39tqE9z4aU776lL2St1um
         ScJVSRGeaOn0Xmecwx2/Db0yQQsGr3IqRujdpk0y7DLnaVCLHLl0Kej4hDdsPZMs32KC
         lSi6KjTf7EkL9gAXMGSqTlGzXiaf/44G5iJ840H5FDzaakNZ9iC221VGi/6h6kCciqr4
         nXTaxOrh/JLbKMwXdooJEtec8mY+RHz/f+osPtTQEgm7VnEmAnnuQRUFLNSh1C1jYNlP
         9qia+NhC90G/IU4m1oqGJtZhULsar3okF2m4Mfvd+rgphCbB2NzCSXVuVSaMN6tB1A1g
         swRQ==
X-Gm-Message-State: AOJu0YzA5BIPMc6UBGJMsOl4A25CM2EXUHVGw7ZkA5VyZgUmRTJPMLOG
	5irD2B3NkIvmGoj7p6yY09CJ346mZj9bXqzwYjbYOLem3C7+7F8+1nLffe+/N2CE9THr1RxSEu3
	lVXpyctiwxJE5ZqsuAiRLPnNjkGpHtOxzYOhynjq55w==
X-Gm-Gg: AfdE7clE+YdBpfKwj8bhCWq76TTWdoWWV6DT0NiOseV3EMszT/Tv543LljCXL1IeGw4
	1sc5ABv6blAfBPuEWFK21hULwKNtQwYAjy6juZ/vRK2LTe3I6ZL2RUMXSHwmuRhQ8FyHYtKAk97
	svscGVmSWQJXFsAnGi/qL2cvJzwsn1R5tDScxVZQabf0ltplqpFEIMwystP3NxBmASo2pLE9ghY
	ozdx2qDHp5YS6afVBCLH63PA2DnvX7VdfqHlbN5SPIwCQErInNchbisoyOQeJbav3/vdY5tYeQ8
	5iXSK3VjVWl5yLzaiZag/jZYxpBk3Ph31osZRVYY3OJXhoXFx6yVRy002mhr76wHLSR+C+QoDCy
	eHtUsMq8r0tA+
X-Received: by 2002:a17:903:8c5:b0:2bd:3c21:a053 with SMTP id
 d9443c01a7336-2c7c3ff8e32mr74153345ad.24.1782321197437; Wed, 24 Jun 2026
 10:13:17 -0700 (PDT)
Precedence: bulk
X-Mailing-List: sashiko-reviews@lists.linux.dev
List-Id: <sashiko-reviews.lists.linux.dev>
List-Subscribe: <mailto:sashiko-reviews+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:sashiko-reviews+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20260624155452.211646-1-nishidafmly@gmail.com>
 <20260624155452.211646-6-nishidafmly@gmail.com> <20260624161238.6813B1F000E9@smtp.kernel.org>
In-Reply-To: <20260624161238.6813B1F000E9@smtp.kernel.org>
From: Hiroshi Nishida <nishidafmly@gmail.com>
Date: Wed, 24 Jun 2026 10:13:06 -0700
X-Gm-Features: AVVi8Cd-I-K9Emy_--RjqAi-F2e80vtRrtAAnC_s1NYaq--6GifSG0NkgPsXSuk
Message-ID: <CAE1ksKQi2WibOMxR1wwceqJXw4CLd1FHvuAuKTbqMBWHnuf0Pg@mail.gmail.com>
Subject: Re: [PATCH 5/8] md/raid5: submit a window of stripes during resync/recovery
To: sashiko-reviews@lists.linux.dev
Cc: linux-raid@vger.kernel.org, yukuai@fygo.io
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

> [High] TOCTOU on still_degraded: the degraded check was moved before the
> blocking stripe get + schedule_timeout, so a drive failing during the sle=
ep
> leaves a stale still_degraded that can wrongly clear the NEEDED bit.

Agreed -- this is a real regression I introduced.
I hoisted the still_degraded computation so the window could reuse it,
but that placed it before the blocking get and the
schedule_timeout_uninterruptible(1),
whereas stock computes it after.
In v2 I'll move the still_degraded computation back below the blocking
get of the first stripe (restoring stock's ordering).
The remaining window stripes are fetched with R5_GAS_NOBLOCK and don't
sleep, so they can reuse that
value without reopening the race across a sleep.

  > [High] The batch loop ignores md_bitmap_start_sync()'s return and
force-syncs
  > clean stripes in the window.

Also correct.
Stock makes the skip decision once at the top
(!md_bitmap_start_sync(..., true) && sync_blocks >=3D ...),
but the window loop doesn't, so a clean bitmap region the window
crosses gets synced unnecessarily.
In v2 I'll have the window honor the bitmap and stop at the boundary of the
dirty region being resynced, rather than extending into already-in-sync str=
ipes.

Both are correctness details the per-stripe path got right and my
batching dropped;
I'll fold the fixes into v2 and re-test the bitmap resync path.

Thanks,

2026=E5=B9=B46=E6=9C=8824=E6=97=A5(=E6=B0=B4) 9:12 <sashiko-bot@kernel.org>=
:
>
> Thank you for your contribution! Sashiko AI review found 2 potential issu=
e(s) to consider:
> - [High] The batch loop ignores the return value of md_bitmap_start_sync(=
), forcing clean stripes to be unnecessarily synchronized.
> - [High] Time-of-check to time-of-use race on the array's degraded state,=
 leading to silent data corruption via incorrect bitmap updates.
> --
>
> commit 01d1e80ee6aa253c48c233e7fc218fbdac9522fa
> Author: Hiroshi Nishida <nishidafmly@gmail.com>
>
> md/raid5: submit a window of stripes during resync/recovery
>
> This commit alters raid5_sync_request() to dispatch up to 32 stripes per
> call instead of one. It attempts to submit the remaining stripes in the
> window with a non-blocking flag to avoid the per-stripe throttle sleep.
>
> diff --git a/drivers/md/raid5.c b/drivers/md/raid5.c
> index 9cb4ed3bd85c5..8e9edaaca667b 100644
> --- a/drivers/md/raid5.c
> +++ b/drivers/md/raid5.c
> @@ -6620,16 +6621,7 @@ static inline sector_t raid5_sync_request(...)
> [ ... ]
> > -     sh =3D raid5_get_active_stripe(conf, NULL, sector_nr,
> > -                                  R5_GAS_NOBLOCK);
> > -     if (sh =3D=3D NULL) {
> > -             sh =3D raid5_get_active_stripe(conf, NULL, sector_nr, 0);
> > -             /* make sure we don't swamp the stripe cache if someone e=
lse
> > -              * is trying to get access
> > -              */
> > -             schedule_timeout_uninterruptible(1);
> > -     }
> > -     /* Need to check if array will still be degraded after recovery/r=
esync
> > +     /* Check once whether array will still be degraded after recovery=
/resync.
> >        * Note in case of > 1 drive failures it's possible we're rebuild=
ing
> >        * one drive while leaving another faulty drive in array.
> >        */
> > @@ -6640,13 +6632,42 @@ static inline sector_t raid5_sync_request(...)
> >                       still_degraded =3D true;
> >       }
> >
> > +     /* First stripe: block if stripe cache is full, then throttle. */
> > +     sh =3D raid5_get_active_stripe(conf, NULL, sector_nr, R5_GAS_NOBL=
OCK);
> > +     if (sh =3D=3D NULL) {
> > +             sh =3D raid5_get_active_stripe(conf, NULL, sector_nr, 0);
> > +             /* make sure we don't swamp the stripe cache if someone e=
lse
> > +              * is trying to get access
> > +              */
> > +             schedule_timeout_uninterruptible(1);
> > +     }
>
> [Severity: High]
> Does moving the degraded check before the stripe allocation introduce a
> time-of-check to time-of-use race?
>
> If a drive fails during the potential sleep in raid5_get_active_stripe() =
or
> schedule_timeout_uninterruptible(), the stale still_degraded value is use=
d
> below to update the bitmap. This could incorrectly clear the NEEDED bit,
> potentially leaving parity inconsistent if the system crashes before the =
sync
> completes.
>
> >       md_bitmap_start_sync(mddev, sector_nr, &sync_blocks, still_degrad=
ed);
> >       set_bit(STRIPE_SYNC_REQUESTED, &sh->state);
> >       set_bit(STRIPE_HANDLE, &sh->state);
>
> [ ... ]
>
> > +     win_sector =3D sector_nr + RAID5_STRIPE_SECTORS(conf);
> > +     for (submitted =3D 1;
> > +          submitted < RAID5_SYNC_WINDOW && win_sector < max_sector &&
> > +          win_sector < mddev->resync_max;
> > +          submitted++, win_sector +=3D RAID5_STRIPE_SECTORS(conf)) {
> > +             sh =3D raid5_get_active_stripe(conf, NULL, win_sector,
> > +                                          R5_GAS_NOBLOCK);
> > +             if (!sh)
> > +                     break;
> > +             md_bitmap_start_sync(mddev, win_sector, &sync_blocks,
> > +                                  still_degraded);
> > +             set_bit(STRIPE_SYNC_REQUESTED, &sh->state);
> > +             set_bit(STRIPE_HANDLE, &sh->state);
>
> [Severity: High]
> Does this batch loop unnecessarily synchronize clean stripes?
>
> The boolean return value of md_bitmap_start_sync() is ignored here. If th=
e
> first stripe needs sync but subsequent stripes in the window are clean, t=
his
> loop unconditionally queues every stripe for synchronization regardless o=
f
> its clean/dirty state, forcing read-rebuild-write cycles on clean stripes=
.
>
> > +             raid5_release_stripe(sh);
> > +     }
> > +
> > +     return submitted * RAID5_STRIPE_SECTORS(conf);
> >  }
>
> --
> Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260624155452.21=
1646-1-nishidafmly@gmail.com?part=3D5



--=20
Hiroshi Nishida
nishidafmly@gmail.com
