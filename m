Received: from mail-pj1-f44.google.com (mail-pj1-f44.google.com [209.85.216.44])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A4F363DCDA1
	for <sashiko-reviews@lists.linux.dev>; Wed, 24 Jun 2026 17:25:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.216.44
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1782321949; cv=pass; b=TfcRn7mk5bXbVw8Bh0JGVLjzYTzxxuN5TSEZHKVT8mqe9UB+M9kEKV+I64Nf42fvtYk+JmUCOVXIJ5cfT2SsJSqD/NtZ/3oAIOAF2d64SrOijQcaSn73bthcQf2TzkwBI+cOXBjcG4ddwpqcpg1e9jbGw6aPOMXkQvM7k8jVIKs=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1782321949; c=relaxed/simple;
	bh=2ulYMFA2kFw/iz4ZhIGgEMFkfQEvvSC3Q2LgFZA+dH8=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=Eb/9bpEkG3l+jwxtTOyg4bLhw9AlqsmZpX4jFGGgexXeCBK+RwCWJK+/ocs4H7YR420O+9bsF+E6mcs/+laJxK3Dwqh+PrtNNejEeLuugqbQC2+BTVhAsFgpfosplZWsrm24hT8X19WnsVidSS6UtN9nELB16/K47BjSxGxQoCA=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=T9A1mAR/; arc=pass smtp.client-ip=209.85.216.44
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="T9A1mAR/"
Received: by mail-pj1-f44.google.com with SMTP id 98e67ed59e1d1-37d4ab2e7c5so1256582a91.2
        for <sashiko-reviews@lists.linux.dev>; Wed, 24 Jun 2026 10:25:48 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1782321948; cv=none;
        d=google.com; s=arc-20240605;
        b=VhLsBTNEaef3KeERBLpjSx8biYp5DBT7MyzkcQS2HihAqyzRBqYdlepR7G1QKjf81h
         4iepmEGgxy5atPOu5AR1RB0NAjYcLFFxNVeFU2n4Eu7KPCMonHptSGcqgwB+s8vUPTYl
         efFUq/6TohM1QLRYYc5NBu1b7nCh6a2QfI+1pWI0vhZX4H4XBizcjS0K+N+9JINnnFTG
         OdJrBlSc0cWOcu1JSOKgUW0It08YSu2EuSFRV9wKsZfsgcwhgc0cmWqcJ6YEVtxLEJn6
         so1N5Che0QzrpL76sVMwRhzwmSlmslZXJqGNBnkoy1MoaA/RXRMCpzE0kRKB7hMoCtwb
         IZvA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=h54lF4cp4pKVbkWYZ0Pc8whGOHAxadfn5MZ75TgQZE8=;
        fh=mTP6TkWV1IhQRgyhsEpYqIpiXvhDlZKdHAfNRdOTDjk=;
        b=lM663E5oajowDltCYOrYVfXwF44OKcXqXUzjFMURtdLHaR/NBqKHMSMMGqW1j6JP+a
         jWKxmpg3DoZtrzBZ4CciiB6ibK164nOI3OimdIVFdQD1Vn1Hbulymx0TvpDjo7L1a03a
         rKjuxu1+CNtsAcCLnyAvh4xQe+qyhxuzK5QY2E94sC1SOVfCsRWjKZnMXJMbxaEiv/r5
         msBQxFUyT2Zvb+1iAeT98+/2xqC2xCpix2sbrVnz4GfCSmsbMaZFrTAb8gbhadetY5ob
         7YpozC5bSrvRf/mF15R/NbC8f0FHmVGWr7CITBbCeN+UwFppFvpQ5mlWWQnJzPLr3wmJ
         L+/w==;
        darn=lists.linux.dev
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1782321948; x=1782926748; darn=lists.linux.dev;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=h54lF4cp4pKVbkWYZ0Pc8whGOHAxadfn5MZ75TgQZE8=;
        b=T9A1mAR/ZsBKaZSP/tLv1pfWwjhzdd1sHIJ6Xky+4kTVJavrAg9876nzKhnzF/Y7x2
         LnFI5XQORqw09bsLJPl9HNgT0Kd/dinSM9mr9oTQ2G1ufbsZESOkQfYb9WAQJC2461Eg
         pTzd2Zms1tHYqileddOwZtNHAFjTGh68LcymMHzcR5ytlIkdcEc+EssxIkd4R4MsXEXl
         ERxWVr75v0ZD+sPyReUKRUJycrywl/Y33qKT3aNw8oOhPtCJ6is87fDC4dWVmsFLQ4r2
         TgzUlf3pWaFpCDinHJs7Zyr7NQUYMbsv3+mYBdOTFISdzKlg/PH/h1N4eIvsTf1GeHTf
         znuQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1782321948; x=1782926748;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=h54lF4cp4pKVbkWYZ0Pc8whGOHAxadfn5MZ75TgQZE8=;
        b=hctEzIL/22M7LdEpQpBuoElQJqJi7aQjASskUlssogXkg+xjTFOFFcfbvakh1ExE94
         1y2U0zM7Gd+yaweP5x+2RmINRMOIqWGzZUWcTxLdEfM32Vl60ZyQBCDxJQnwmPJhb/YL
         g81oeJliO5Sa1YeWbC8l+jxw31VodLPzjAv0FQkWV47dlSGgmm5ZexrawKgBm343tl6Q
         Sa4h+06+JRwYBmHXZp9tRnDUsbLEJQ4OnjzgkrDGbmqX2uJF6xIKjkmX/Y7h1H9Pao+G
         b7hSLHYe3kHwkBxfblmdMi/e4e3ttDG9oLezc3RLqdQI7OWcbVvpkk2Hw3lqW1T7+zIi
         bqvw==
X-Gm-Message-State: AOJu0Yxvcy5aHz46TYxK3BKhpSI96dv8byN17/gh+bCEkFeWPN0kK1aX
	EidL9g9Ub8LpZw/Iipor9TSIy3HQOV6CdfyzQgQ2Tw96uRVfyA3/qzIPiaAifKcDIPtACQZewv3
	r3SIy7frBgHbjO19JyzpzZf7vHoT/ZPIc8JrgO3g=
X-Gm-Gg: AfdE7cnCvZqGtiVquQk/V62y5R0lJL+1aXWFSFrwkrUx3ndgvM/iwJ4RcUUOwrcUbx4
	yUNXQKqbSiDjDG8UcBBMPEywAkS8jmdRk3UifaqIQz34uvTwWcFBvq3Dxq0pkyCcSLTL60dWolG
	mPdmy0kEiY3WDthwIiLJQm3rBpXgigaFUnD8nDW6Ez+l0TTXc2OvBwHfrHYDdEWCmnPEA8SONAE
	KUDrJQF3ZOkpLtfz0MP9Gr1L/ZWYZSAJjtJfCcTUyZ08l7gEpC7IYY2FevZhd4/XuBIJKcsYEZr
	GUE+m0b4DjT7iNcQLg/WHKNKImLBH3g7gTvG3pTrDTmg0BRH58L1Z1JY/M4WbNupDlt383X2sAr
	zE1L+4GaaBtUh
X-Received: by 2002:a17:902:e790:b0:2c1:f262:4962 with SMTP id
 d9443c01a7336-2c7e155dd89mr45922735ad.20.1782321947598; Wed, 24 Jun 2026
 10:25:47 -0700 (PDT)
Precedence: bulk
X-Mailing-List: sashiko-reviews@lists.linux.dev
List-Id: <sashiko-reviews.lists.linux.dev>
List-Subscribe: <mailto:sashiko-reviews+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:sashiko-reviews+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20260624155452.211646-1-nishidafmly@gmail.com>
 <20260624155452.211646-9-nishidafmly@gmail.com> <20260624161245.292821F000E9@smtp.kernel.org>
In-Reply-To: <20260624161245.292821F000E9@smtp.kernel.org>
From: Hiroshi Nishida <nishidafmly@gmail.com>
Date: Wed, 24 Jun 2026 10:25:36 -0700
X-Gm-Features: AVVi8CfykguIgR_hnOKDWjOkdsb_WTfQQoNRVrBjvv9IkmE75YRljQjjyjs-x-c
Message-ID: <CAE1ksKSaLykqdP90aueX-kn0ydjd6bQ7FjuAxnVaFGCvAsi8zQ@mail.gmail.com>
Subject: Re: [PATCH 8/8] md/raid5: reserve stripe cache for user I/O during rebuild
To: sashiko-reviews@lists.linux.dev
Cc: linux-raid@vger.kernel.org, yukuai@fygo.io
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

> [High] Breaking the read-ahead loop doesn't bound the rebuild to 50% -- t=
he
> outer md_do_sync() loop just calls raid5_sync_request() again and the
> unconditional first-stripe allocation keeps filling the cache to 100%.

You're right, and it defeats the patch's purpose.
The 50% check only gates the window batch; the first stripe of each
raid5_sync_request() call is allocated
unconditionally before the loop, so md_do_sync() keeps driving one
stripe per call past 50%
until the cache is full and the existing blocking get throttles at ~100% an=
yway.
The "reserve half the cache for user I/O" claim doesn't hold.

Making it actually bound the rebuild would mean gating the
first-stripe allocation and
having raid5_sync_request() yield without making progress --
effectively reworking the sync throttle, which is more than this
change should take on,
and the user-latency benefit was never something I could measure
cleanly.
So I'll drop this patch from v2.  (It's coupled to the read-ahead
window patch, which I'll keep and fix per the other thread.)

Thanks,

2026=E5=B9=B46=E6=9C=8824=E6=97=A5(=E6=B0=B4) 9:12 <sashiko-bot@kernel.org>=
:

>
> Thank you for your contribution! Sashiko AI review found 1 potential issu=
e(s) to consider:
> - [High] The patch fails to bound the rebuild's share of the stripe cache=
 to 50%. Breaking the read-ahead batch loop just causes the outer md_do_syn=
c() loop to allocate stripes one-by-one, relentlessly filling the cache to =
100% anyway.
> --
>
> commit 29ed9bbd7953c5d6ceeb0158cc53c81fd4d3aaf9
> Author: Hiroshi Nishida <nishidafmly@gmail.com>
>
> md/raid5: reserve stripe cache for user I/O during rebuild
>
> This commit attempts to prevent rebuild operations from monopolizing the
> stripe cache and starving concurrent user I/O. It adds yield points in th=
e
> resync read-ahead loop to stop submitting stripes if there are active
> waiters or if the cache is more than half full.
>
> > diff --git a/drivers/md/raid5.c b/drivers/md/raid5.c
> > --- a/drivers/md/raid5.c
> > +++ b/drivers/md/raid5.c
> > @@ -6656,6 +6656,27 @@ static inline sector_t raid5_sync_request(struct=
 mddev *mddev, sector_t sector_n
> >            submitted < RAID5_SYNC_WINDOW && win_sector < max_sector &&
> >            win_sector < mddev->resync_max;
> >            submitted++, win_sector +=3D RAID5_STRIPE_SECTORS(conf)) {
>
> [ ... ]
>
> > +             /*
> > +              * Reserve cache for user I/O only when it is actually co=
mpeting.
> > +              * preread_active_stripes counts stripes queued for write=
 I/O
> > +              * (including the read phase of RMW); sync stripes never =
set
> > +              * STRIPE_PREREAD_ACTIVE, so during a pure rebuild it sta=
ys zero
> > +              * and the window fills freely.  Competing user reads do =
not bump
> > +              * the counter but are caught by the waitqueue_active() c=
heck
> > +              * above.
> > +              */
> > +             if (atomic_read(&conf->preread_active_stripes) > 0 &&
> > +                 atomic_read(&conf->active_stripes) >=3D
> > +                 conf->max_nr_stripes / RAID5_SYNC_HWMARK)
> > +                     break;
>
> [Severity: High]
> Does breaking out of the read-ahead loop here actually limit the cache
> usage to 50%?
>
> When this breaks, raid5_sync_request() returns control to md_do_sync(),
> which operates in a loop and will immediately call raid5_sync_request()
> again for the next sector.
>
> Because raid5_sync_request() unconditionally allocates its first stripe
> earlier in the function before entering this batch loop, won't the outer
> loop just continue allocating stripes one-by-one until the cache reaches
> 100% capacity and triggers the fallback blocking path anyway?
>
> --
> Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260624155452.21=
1646-1-nishidafmly@gmail.com?part=3D8



--
Hiroshi Nishida
nishidafmly@gmail.com
