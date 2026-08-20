Received: from mail-wm1-f43.google.com (mail-wm1-f43.google.com [209.85.128.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 840764772A1
	for <sashiko-reviews@lists.linux.dev>; Thu, 20 Aug 2026 14:24:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.128.43
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787235893; cv=pass; b=S7RYQlD+wYO+u/uMgEKLYNknNmQKPU2xOgaIYv3/o8rMXFX8rGT9C2wYDyoMmVqIxL5tTIXN9piXONBUwGb/MkbFBXF8JhnsBzhCkri3wKOtk8zy5LeiUH0x80/BuIAee/5tiOiOzBfOh9xwRqlVGz89ycICraCTXgwd6lusqQ4=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787235893; c=relaxed/simple;
	bh=4ua3cxV8dhkHOIff05LR1Y3qFBHcVH6d6nazxugRB7I=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=i5bbdduSQYfLU756ksnoD0/zwVkN9xElpjhNW+Qu78BgfswjgglSrbwfF2bEyAbBfG3nXnIl8qn/xKojS9i31q2CBErIfM+wuycCeqsjHUzgeCiKxX0LkdpR0W+AZg7/I7z5jTIFI3mve7bgLrCLZHRpmVQ2UD8X8t3YUMkKiBU=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=UzHMY9LC; arc=pass smtp.client-ip=209.85.128.43
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="UzHMY9LC"
Received: by mail-wm1-f43.google.com with SMTP id 5b1f17b1804b1-490cf322ed0so21883105e9.1
        for <sashiko-reviews@lists.linux.dev>; Thu, 20 Aug 2026 07:24:51 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1787235890; cv=none;
        d=google.com; s=arc-20260327;
        b=LSlvyocmaUTa56VugDYfGJcB6ogYrEIOmawfW2/HnlipO5Cox6ueHYiaDEsr1UkXXI
         q0wrT+z/PtWo0Yprs8+QPXTwbExdcXAnnRygRX4uJxit2yFhdbFC4HTjlw5uz+GQXVGZ
         pH+GHkSmcs5wNcSRo6U/gZI5mEdS+H6MGjW16ROHEw6TrFWT7UGEPrThT6IrocBU//YX
         hMzP7VO+NdVKGHmGwrqKLvRMekX+O/Mo5/7aZec4GLSaUf40L8iM1nBP8+kWsNMtgPjp
         /TYE4oPLpbIBLVyJRZt+deJtwt7P+o/MbeVhh2h2mDVKek1MsE5G7ZM9BoDDC/rwH7An
         PVQg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=vGtwPp5SElePleI/4XLp2bHhqRVpPgOhFZ40qM1IKko=;
        fh=en6g1YjRevizPr9Fe8PH0phWaT1FK8ZA2vuA3bAxWnU=;
        b=iwLay59BE0NLiWC6FZ1pnWU81QH7EI7CHXkLf23wTxZqaDALdsGJcmnG7cQZ2XEX8o
         jJSOEJRz7Y1gt2aKUGd5jKMbuT9oVV8jOsBAp8Ti+X252AHy5x8bqNWFaQZQ7Rn+NZKj
         U2rIdE/K2w7ECpi2O6doRSoKJLkymWeoLyBM3mNFnQWYwdv7piR3Kkw9tkc61G95oBr5
         FdJrTutMSe6b5rkHnCSA6cvRRLm5KIeokZf2cNC6LgEFAtwgOzq/bqxwrW7potspjohE
         GvuqjMMEK9Xw6cZbbeyPP2G8CjaAJ3y4ns43siiIyFh4HoXCLumicF/W9ZjN3PqJ13p4
         7rPQ==;
        darn=lists.linux.dev
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1787235890; x=1787840690; darn=lists.linux.dev;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=vGtwPp5SElePleI/4XLp2bHhqRVpPgOhFZ40qM1IKko=;
        b=UzHMY9LCVuLZFMgDLrY9L90LoMQbquNq7ZoWlgYyU43R6jE0u+haqDF0AYGL9Vqf1u
         eoFIwE2n2r2bnuY4JgUjh52jrmQaM43Ml0MmdXcNGqTO0MzcOkh1dl2SmTPKxdd2sd9U
         dmdg9S/in9zOmlMeUn6D6CsNnHXNJC8Rx/wW13Wql9oeqrA8PtehNoN+9Ca1xITUufJG
         O1tWE0VlNbMAdX8B33gmM7I0siY8G2ww8XojGbjt/Jlb4yKqhQUNanwTzXDD6OZrNLnj
         npoo87XynucoZ6zQ6hs9Pk7jssWXC0uqOlGDstLqXwNorhs8zLmB3YRP3S1AliX8DPqA
         xO1A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1787235890; x=1787840690;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=vGtwPp5SElePleI/4XLp2bHhqRVpPgOhFZ40qM1IKko=;
        b=fmmjhUV3Kll6/gDdyGfWQOloW31u2N4Pk5bHh5x8afBRTV2kKWRFg1P+pzDMinBpre
         8X2DhkqE5vOHh+2Nqk6LjXMtoF3hBMPq98t7dkpATyRmNczwGO/rNFlvM/KEPcHC32N+
         Dh3SZVDxwgG6NZgsWjOF4KAQqHtJ0fBS+puTrlgXQOjR2eKwsnSCGRxRorGOekG551Rw
         ndhNsY73/nLFEnpV9PdEAfB1dcm9mcQpHXi0YI/OJrncx9Dne75CZWQGivhWtOCqqxJA
         uVzUClojTvvPYDGsCbmEDHF5khn3efGc2f5bTUXIOwk6e7ih91PSOYLHFmLzqc3ODBR3
         LbkQ==
X-Gm-Message-State: AOJu0Yzc9/Ao4Fuv1FuAelZtmqnoqJ3+z9BG+CCl2OB/Y5OZaUbI94v6
	XLE8E5fpXBtjtSRMyZ6T3KyZDXzZ2xnvuy145Ks5hMmvn1QWWKxVcKeFQ56UE64zvsnnX99MIna
	PAqj0qOS+ljo6WrDC6VT6wv5689N6CUs=
X-Gm-Gg: AR+sD11g8va1Qad2GkAbA7GGrMqwLsYW9bSGFnYvl7ydwRrw7vafeFmSNXp4wiWkND0
	5Iwvjem3rwYd4dava6jjtQOiq7HdXdTc+Ih2chUxpVhXVxEThNxpI/soIoKRuSTci45wDY2ffL0
	eUFXH2846IQ22L1OEJRM3sfZUPzhEXlOSn1yvbcCBHvO9YFmx2n04ziDyaCYwcfBguxcFXVHalP
	aaPPxVSiwuwUMtEtCPNg2fNW13q87Nx25iLRkUHj/nWicCHgpVjmihl7fpbv7M7XzNxOePuAdx8
	PGlvenP0Q/iVqm61LrFni8ZTTjW8VfQw7/O1hppzwrqkHpC5xxPxhot5EgRpsHA4WIg5lv1e9nO
	zUp8w9BV/pMvmVYIMngypdxeulMWnZi5D9807/BO3
X-Received: by 2002:a05:600c:3590:b0:493:a966:d5b5 with SMTP id
 5b1f17b1804b1-499aa14a75bmr231032105e9.2.1787235889336; Thu, 20 Aug 2026
 07:24:49 -0700 (PDT)
Precedence: bulk
X-Mailing-List: sashiko-reviews@lists.linux.dev
List-Id: <sashiko-reviews.lists.linux.dev>
List-Subscribe: <mailto:sashiko-reviews+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:sashiko-reviews+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20260819103926.2136712-1-prabhakar.mahadev-lad.rj@bp.renesas.com>
 <20260819103926.2136712-4-prabhakar.mahadev-lad.rj@bp.renesas.com>
 <20260819105356.BD7731F000E9@smtp.kernel.org> <aoWpLvrNGHBPvFY5@shikoro>
In-Reply-To: <aoWpLvrNGHBPvFY5@shikoro>
From: "Lad, Prabhakar" <prabhakar.csengg@gmail.com>
Date: Thu, 20 Aug 2026 15:24:23 +0100
X-Gm-Features: AcwNN1XjPbCVWInvwnEJK7fURmifV1Jum9U6XzA0i7unkeraDGkwFi5MdsHj34Y
Message-ID: <CA+V-a8v23+zevx_xRS-GeHG2yk2k-M2UkPxoC76t-0JewRk9Dw@mail.gmail.com>
Subject: Re: [PATCH v4 03/15] rtc: rzn1: Fix weekday underflow when alarm
 crosses month boundary
To: Wolfram Sang <wsa+renesas@sang-engineering.com>
Cc: sashiko-reviews@lists.linux.dev, conor+dt@kernel.org, 
	linux-rtc@vger.kernel.org, robh@kernel.org, devicetree@vger.kernel.org, 
	Alexandre Belloni <alexandre.belloni@bootlin.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Wed, Aug 19, 2026 at 2:01=E2=80=AFPM Wolfram Sang
<wsa+renesas@sang-engineering.com> wrote:
>
>
> > [Severity: High]
> > This is a pre-existing issue, but does this time_after() comparison
> > allow bypassing the 1-week hardware limit on 32-bit systems?
>
> This is fixed later.
>
> > [Severity: Medium]
> > This is a pre-existing issue, but what happens if the RZN1_RTC_ALW regi=
ster
> > is uninitialized and wday is 0?
> >
> > Calling fls(0) - 1 would evaluate to -1. If the current time is a Satur=
day
> > (tm_now.tm_wday =3D=3D 6), delta_days evaluates to 0, which bypasses
> > the if (delta_days) block and leaves tm->tm_wday =3D -1.
> >
> > Since the core function rtc_valid_tm() does not check tm_wday, would th=
is
> > propagate a bogus alarm date to the caller?
>
> This looks worth investigating to me. On RZN1, ALW is default 0.
>
On T2H/N2H too.

I'll create a below patch for it:
diff --git a/drivers/rtc/rtc-rzn1.c b/drivers/rtc/rtc-rzn1.c
index 8c70dbf8c7ec..e0fdb591ba91 100644
--- a/drivers/rtc/rtc-rzn1.c
+++ b/drivers/rtc/rtc-rzn1.c
@@ -234,13 +234,24 @@ static int rzn1_rtc_read_alarm(struct device
*dev, struct rtc_wkalrm *alrm)
        if (ret)
                return ret;

+       ctl1 =3D readl(rtc->base + RZN1_RTC_CTL1);
+       alrm->enabled =3D !!(ctl1 & (RZN1_RTC_CTL1_ALME | RZN1_RTC_CTL1_1SE=
));
+
        min =3D readl(rtc->base + RZN1_RTC_ALM);
        hour =3D readl(rtc->base + RZN1_RTC_ALH);
-       wday =3D readl(rtc->base + RZN1_RTC_ALW);

        tm->tm_sec =3D 0;
        tm->tm_min =3D bcd2bin(min);
        tm->tm_hour =3D bcd2bin(hour);
+
+       /*
+        * If wday is zero, no bit is set in RZN1_RTC_ALW. This is the
+        * register's power-on reset value.
+        */
+       wday =3D readl(rtc->base + RZN1_RTC_ALW);
+       if (!wday)
+               return 0;
+
        delta_days =3D ((fls(wday) - 1) - tm->tm_wday + 7) % 7;
        tm->tm_wday =3D fls(wday) - 1;

@@ -249,9 +260,6 @@ static int rzn1_rtc_read_alarm(struct device *dev,
struct rtc_wkalrm *alrm)
                rtc_time64_to_tm(alarm, tm);
        }

-       ctl1 =3D readl(rtc->base + RZN1_RTC_CTL1);
-       alrm->enabled =3D !!(ctl1 & (RZN1_RTC_CTL1_ALME | RZN1_RTC_CTL1_1SE=
));
-
        return 0;
 }

Logs:
    On a cold-booted board with no alarm configured, the following was
    observed before the fix:

        root@rzn2h-evk:~# cat /proc/driver/rtc
        rtc_time        : 00:00:19
        rtc_date        : 2000-01-01
        alrm_time       : 00:00:00
        alrm_date       : 2000-01-07
        alarm_IRQ       : no
        alrm_pending    : no
        update IRQ enabled      : no
        periodic IRQ enabled    : no
        periodic IRQ frequency  : 1
        max user IRQ frequency  : 64
        24hr            : yes

    After the fix:

        root@rzn2h-evk:~# cat /proc/driver/rtc
        rtc_time        : 00:00:25
        rtc_date        : 2000-01-01
        alrm_time       : 00:00:00
        alrm_date       : 2000-01-01
        alarm_IRQ       : no
        alrm_pending    : no
        update IRQ enabled      : no
        periodic IRQ enabled    : no
        periodic IRQ frequency  : 1
        max user IRQ frequency  : 64
        24hr            : yes


Cheers,
Prabhakar
