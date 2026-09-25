Received: from mail-vs2-f42.google.com (mail-vs2-f42.google.com [74.125.227.42])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 70CE047126F
	for <sashiko-reviews@lists.linux.dev>; Fri, 25 Sep 2026 09:09:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.227.42
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790327384; cv=none; b=Ecl0EhY5HFznIG48/JwltmrAYzYUJuJi/a+qa3J1qxF/hCvJrKhqmGF9m5QiPJtN080Uw1f1oH6OEkJPORQOa1UWsQTWTShDxSiWeeen9+qumpvY8Hk9r1ii5KdjAInMDt4Rwip6CojPkbfhkMl3IGECr0BZiH8kbywjpBPWU/U=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790327384; c=relaxed/simple;
	bh=JSD+TgIxUmEnVVwDb4pGLRv6GJ5iCZmtvwC1TTcFDd8=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=VO1tpKQd4c23+9rcITgwvvHTygvVA09c38zdRdFdqI79XSZMef4uc1Pq1tTh5812fyJd6O7QSU4uNqGK5mD2HAb1PkfyVDsohrdTxVQeq2wKq30W7DCmCjPXTcbUzTZCuBNU+dJ/vZticCnEgr0Cl0D0I3CnVaUZ1g0/xQlI+mY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org; spf=pass smtp.mailfrom=gmail.com; arc=none smtp.client-ip=74.125.227.42
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-vs2-f42.google.com with SMTP id 71dfb90a1353d-5c67e512ee6so209255e0c.1
        for <sashiko-reviews@lists.linux.dev>; Fri, 25 Sep 2026 02:09:43 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790327382; x=1790932182;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=m2mULua+FE1sFuKc/3gIaxuYjcdlUYIe/5IDBg6nt8Q=;
        b=rJBHamFpDC/PGwl/HtiP6oUXVBFswNd/2p1ALGVTmo7muoJNia0Iw0JB2FL5Mt5lre
         YHciX1q3ZCcS1NM4fhHreRSewvv1rAIpSSVy+QWwa7sSR/WwZfzfkjOkbTGpIplKV/8R
         zOUJoYge6XsuMI9zYjnwOcW2cgXQZCLFiQsCOCbGbNrnHAxQGDoT4OfC6VWWXxMAaVL8
         mFGvviXj03glLi5kzgHkskpDpu4rN7waBZgeD/5SrndNkmOiUHh24prgDKI/5oATJcDn
         TZQwxQYx1hKDzKfVPZRriHF4a0KlhoYEBd/5oTgI46DZEQGuQ0wQomOMtnojy37GOr/C
         5MYg==
X-Forwarded-Encrypted: i=1; AKwUvBziYkT40LdNVT6G0kaPT0QKU5lFx/RG7svMQ7z6UaveNN4PmFPDSKcKUYHo7KAbg8q0OIJfDz/SHk1idodSvHY=@lists.linux.dev
X-Gm-Message-State: AFuF++nys1jHq9Exkfgiyb9icsFW/TDGtmIeDVVAHdtbwlxFs4o00yZ9
	u9/cSX2QyczMv7hcTMXh0bSOPh8KWtelZeyttS+e3i+RRv4/fdRlBmD6jvO8OkEo
X-Gm-Gg: AYBFou2yN2AmirpkE+rEZIkUbc0crJ97nt4kObwn9ZYPLcWUqIonwvQ/83ZQAH+Zl7F
	YqsPipOtU4kn1seDliZx7BiK7VViCpeq8iJo26cmqYEFe6dvWihjakK2CBYzlh1zaKobCZZh2D1
	8D/rkQrRdPvNaKETy7YRPLMDxqL8PyshUePHsSUdIEqqZHqJO/EGuh61f/aGShYjvMGhCYf0GiC
	jMidbItkoy4yor/f+oXCVm2BLAWG+bQePjBndcmi5ClqkGOYIr4h1RT+Kndht03jUMxNeJNGdYP
	tuudcbCc8QCPBQG4PX7BP7PekgDhHQsD8C7RkILdUF4Fn1FPd481wRpIzSSm5EPQDVdvFAGdH4g
	4vJ4AUhch9DNtUOGR2GDpuuNU5vCcPagfHw4Egx0QiBpCgQh6oQXkijoUvrucFVO7R8CMP3KbOd
	/NDKvpzDtczZbCq/P8+/7QZSdp5RPy3m4DCqLGoYwyjHveIbWSpRIFcsB4rmdAtZlT683Fkzs1Y
	/9DBoWRhdDbgaJi4RdesRSeTXpIAxRMIgox9Q==
X-Received: by 2002:a05:6122:d19:b0:5c9:c60a:e9b3 with SMTP id 71dfb90a1353d-5cc979503d8mr750502e0c.19.1790327382187;
        Fri, 25 Sep 2026 02:09:42 -0700 (PDT)
Received: from mail-ua2-f12.google.com (mail-ua2-f12.google.com. [74.125.226.204])
        by smtp.gmail.com with ESMTPSA id 71dfb90a1353d-5cc647ba875sm2005303e0c.9.2026.09.25.02.09.41
        for <sashiko-reviews@lists.linux.dev>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 25 Sep 2026 02:09:41 -0700 (PDT)
Received: by mail-ua2-f12.google.com with SMTP id a1e0cc1a2514c-97e7c72bfe7so216251241.0
        for <sashiko-reviews@lists.linux.dev>; Fri, 25 Sep 2026 02:09:41 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AKwUvBzLy6HDViTRtZoA2lbi74UnwcWVByRLFZU+Xy0TyTnat55M9KBr7p4Sm6OnZ6Prbu15WjDMEWATlhCnWil6cRU=@lists.linux.dev
X-Received: by 2002:a05:6102:3972:b0:7b2:508e:3d57 with SMTP id
 ada2fe7eead31-7b2508e43dcmr267969137.4.1790327381172; Fri, 25 Sep 2026
 02:09:41 -0700 (PDT)
Precedence: bulk
X-Mailing-List: sashiko-reviews@lists.linux.dev
List-Id: <sashiko-reviews.lists.linux.dev>
List-Subscribe: <mailto:sashiko-reviews+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:sashiko-reviews+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20260923104054.3324830-1-prabhakar.mahadev-lad.rj@bp.renesas.com>
 <20260923104054.3324830-7-prabhakar.mahadev-lad.rj@bp.renesas.com>
 <20260923105237.7B87D1F00893@smtp.kernel.org> <CA+V-a8uD16uG8cc9m7NHVZXT5bU64TYfu+_1POuXeioRAy6Z+A@mail.gmail.com>
 <4f5aadf0-8f23-4871-918f-430a0c99900d@roeck-us.net> <TY3PR01MB11346CC8B3C7374C293E0F3EB86802@TY3PR01MB11346.jpnprd01.prod.outlook.com>
 <2d32d7f1-f87b-45b3-9ccd-95e9773ca658@roeck-us.net> <TY3PR01MB113461EFFC2B9B39A53ED1D3386802@TY3PR01MB11346.jpnprd01.prod.outlook.com>
 <CA+V-a8t3HKQ6D8jb_y-XM64BHkWm3vRw6JiTydSp3rqVr9nhdg@mail.gmail.com>
In-Reply-To: <CA+V-a8t3HKQ6D8jb_y-XM64BHkWm3vRw6JiTydSp3rqVr9nhdg@mail.gmail.com>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Fri, 25 Sep 2026 11:09:29 +0200
X-Gmail-Original-Message-ID: <CAMuHMdXZwnRtp=f0iOiDqoLVjBTGVYNbbLeP9E3qjTn3RUEkUg@mail.gmail.com>
X-Gm-Features: AclHuK-nFf1UvHjbP4pR_ScRMT7oB1x_81A0GYs9PIzd7j0I7JJQ2mhJ3JMjGP4
Message-ID: <CAMuHMdXZwnRtp=f0iOiDqoLVjBTGVYNbbLeP9E3qjTn3RUEkUg@mail.gmail.com>
Subject: Re: [PATCH v6 6/8] watchdog: rzv2h: Add syscon support for WDTDCR
To: "Lad, Prabhakar" <prabhakar.csengg@gmail.com>
Cc: Biju Das <biju.das.jz@bp.renesas.com>, Guenter Roeck <linux@roeck-us.net>, 
	"linux-watchdog@vger.kernel.org" <linux-watchdog@vger.kernel.org>, 
	"sashiko-reviews@lists.linux.dev" <sashiko-reviews@lists.linux.dev>, 
	"devicetree@vger.kernel.org" <devicetree@vger.kernel.org>, "conor+dt@kernel.org" <conor+dt@kernel.org>, 
	"wsa+renesas" <wsa+renesas@sang-engineering.com>, "robh@kernel.org" <robh@kernel.org>, 
	Fabrizio Castro <fabrizio.castro.jz@renesas.com>, 
	Linux-Renesas <linux-renesas-soc@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi Prabhakar,

On Fri, 25 Sept 2026 at 11:06, Lad, Prabhakar
<prabhakar.csengg@gmail.com> wrote:
> On Fri, Sep 25, 2026 at 6:11=E2=80=AFAM Biju Das <biju.das.jz@bp.renesas.=
com> wrote:
> > > From: Guenter Roeck <groeck7@gmail.com> On Behalf Of Guenter Roeck
> > > On Fri, Sep 25, 2026 at 04:13:24AM +0000, Biju Das wrote:
> > > > Just a question,
> > > > For automatic software upgrade, if the reboot using PSCI fails, wha=
t
> > > > is the fallback for reboot, reset the board?
> > >
> > > That seems to be a bit theoretic. The reason for having the ability t=
o register multiple restart handlers
> > > is not to have failure fallbacks, but to have fallbacks if preferred =
restart handlers are not available.
> > > If the PSCI restart handler is present, it is expected to work.
> > > That is why it has higher priority. The idea is to use the highest pr=
iority restart handler, not to try
> > > one after another.
> > >
> > > Sure, the failure fallback works as well, but that doesn't mean that =
fallbacks should be provided just to
> > > provide fallbacks.
> > >
> > > If you claim that the PSCI restart handler does not work on this syst=
em, provide evicence, and we can
> > > discuss this further.
> >
> > I agree normal cases there won't be any failures
> >
> > I never heard about PSCI restart fails. But have seen a case due to a b=
ug in

Oh yes, if PSCI is not really implemented ;-)

> > serial driver that made the PSCI restart to fail as it hangs the system=
s.
> >
> > So, if this is the case, a memory corruption can cause the same.
> >
> > Long back I worked on femto based product(single core), where we have n=
ormal restart
> > and a fallback watchdog restart. But it does not have PSCI system handl=
ers.
> > On some cases, we have seen automatic upgrade failed because of failure=
 in
> > normal restart.
> >
> If you think the PSCI might fail and not restart the machine the other
> alternative would be to export functions to configure WDTDCR using
> readl/writel.

Well, if PSCI resets fails: that's exactly why you have a watchdog
(or two) in the system, right?

Gr{oetje,eeting}s,

                        Geert

--=20
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k=
.org

In personal conversations with technical people, I call myself a hacker. Bu=
t
when I'm talking to journalists I just say "programmer" or something like t=
hat.
                                -- Linus Torvalds
