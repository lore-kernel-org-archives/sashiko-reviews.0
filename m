Received: from mail-wm1-f44.google.com (mail-wm1-f44.google.com [209.85.128.44])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7D4BF3FF1A9
	for <sashiko-reviews@lists.linux.dev>; Fri, 25 Sep 2026 12:25:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.128.44
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790339102; cv=pass; b=SflBT7wukWoQwPHLqIdi7fr2BnJwo7zL60mzH6/1aihxNRL7z+Y3WUFEjT+kPOYvW3kp4cczsJmw2dBvPx3xlP2dMjZJvJET4z+RLr3GnKXJZiTCduG2BsUKa2AmgbqkU360OD3hKwbwCu06Iqy8QS4TBIOfR86HGOUhA4jTb2M=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790339102; c=relaxed/simple;
	bh=AjeandOvc4np+YUUmfYR3Inl8IjDw8io05TOIC8sG0g=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=qRTon08jLpYxam+qJmjAZBxXCXtaYxsLc9fjwHbTL7oU6zAZCqyeIJLvizyCyEUHdj8p+h+q0XcZVfAAYjPiZ3DftMynWoRCNna8AfgOFPweCiKb4fUqtsu0cDEffk/h4fIDZ+9B7FKIq8Dh0wifiRtYPTEhLUDrBqhU2a+BSZM=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=SX0axtxW; arc=pass smtp.client-ip=209.85.128.44
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="SX0axtxW"
Received: by mail-wm1-f44.google.com with SMTP id 5b1f17b1804b1-495437bb891so2756465e9.1
        for <sashiko-reviews@lists.linux.dev>; Fri, 25 Sep 2026 05:25:00 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1790339099; cv=none;
        d=google.com; s=arc-20260327;
        b=YLuYWnjkQD73qW/oh6x/NCcQTngUKQh59FtnN0bkMVY4bY1UHtZQkmw1Nbwn7m/SPy
         0aiSQ2+PjYIlXr2POCbfOr7BIMupiHz2JdSZ7xIC06TkX9qmm2dTC0e3dcr1btyw/lXx
         +7xZOMywrHeljZil2E52rv2bF70UO/NXUERdQIjh4L2cvD0LeEEN+C5FuL1kfGQsAmqP
         yZdkipu3sgQBke+cF/f97IzB5hmk9AUu0cBVuFWVGW63pVhERE0vhH+njecBT0ycQS87
         YHmbnlXczzccXnGw/TfD8jnMCOZSysK3zcP+4t8KVADqSZkMIJDN65NrtkN3VnL1LeEL
         dyOg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=swBF8L3fZZq9/Ax0EVf4imGGqPnHNGl2yhucKb9Vv1Q=;
        fh=jXROvxK18W3Pyoj0M8Paln0DuyvTHILlqTinodcez0s=;
        b=JXnltuIx5FEZLeamMoHnEzMN9/LyWxlSl5IlwGrFeYUZkIahLhMBHCEjho7a6Cc8q3
         CCibY66UqS0cy05zaox9hbHYfdRmcB/yiH+Gy7o2lY2bqrpjTwuYYaw7vnhT2Ix8Aneh
         ezDlbg3SIX6SeHH82fg+hM11m6rgAQJX0Frr4v/BLiy3QAgdBrZf/x7IIrfOS/EmoCJi
         bQMfI75zjaE+HPYprD8hC2nsf+66gboRXoXlD8kRAYNjm+/rM5/tM663ScNoz14lOqJ6
         Zq5/9vwTUPWTymARJxTfKD12J2Td92q1J3+o+UQ3nhfYWl3UtPmgM0HzIOgv7pEeemVD
         Oo+g==;
        darn=lists.linux.dev
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1790339099; x=1790943899; darn=lists.linux.dev;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=swBF8L3fZZq9/Ax0EVf4imGGqPnHNGl2yhucKb9Vv1Q=;
        b=SX0axtxWfNAKD5GCoMIadCXjuGUmveBMjLU7y0xUjRGaPmGQaTZGLlq4CqZpnTj3b6
         L686dIrpl7U1BQbu/460RgzlARYIPPT0lk2O3f//q7RGcHgoAzl61EinAug4A5BOhd5Q
         +En6ISX02DBoutYRak/9becjkEc0d3VBdl7EX4dTRX5l73naZddMmLDn0H7I24PLB+Ct
         FQPDdAaY+97xGjYBwghnCfbUg0GR48gh/pv8OTD07TCAvzvMYlZvHr+ssbjBVJotxpvj
         mlaEdJh9+PuGLNmC8k0D6btHxfnMF8gg2KdoXMrivgWhXfRy3Wyx+sfQTIk1rJ+dYKlW
         eMvQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790339099; x=1790943899;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=swBF8L3fZZq9/Ax0EVf4imGGqPnHNGl2yhucKb9Vv1Q=;
        b=g+m0GymyvjGnsbEq8I1XFIjD0wdACVCJ1ekwWid70Cn1huh1uQFU9D6kNkU9Lk8Zo5
         jm2r9/L/1CadVe9gQSKaNFViwnj9/uqy5sPgW3Eqx+SlJ5KH4t+zZ0+66kqZC0+iHQOR
         eLYFuMBjXokrrnbJ4lY2K6QP+mRxO/Ox+nH53V//nJc587hOs5iPmfFMBdjq94+Bnwp+
         Ve22o/RLmq/Pq+NRZBeqaDDhjiqNqwPYdMTfQI8PKS2rbGVl6pEj3S4IC9ENmTCOf4Vb
         o6f2ve2DTm+z00k2TZkUDqlS/wzzFXpCTqgWkaRK7ct9AOY+JgG0FVa3d309Sr1+ScJx
         ylEw==
X-Forwarded-Encrypted: i=1; AKwUvByivqBBstuL+fZ/X0cFR9Lu8yzw1gfMq3RQY73VRqNVvCn352K56tdbJPQxiG9QlnuUpK4qptuvlvN0Ismkz5c=@lists.linux.dev
X-Gm-Message-State: AFuF++mjYBqXmJBeYFNhAB+teXstmlFeRf2A79NUyzUIxayEqIJqcIEi
	P+29Z1ZsV1DDdpLbz++eNbgjMoaKNZNl/IaZUSiZzB1krXB6122TV+SLhXB16pK6+c0mMFUJEQe
	caq9rYikwKxAYllcSMtS72snkEt3Cwdo=
X-Gm-Gg: AYBFou1PJRVPE8YMcAokQZjz+HpGV3ORC8oLSrfzoAGTvFtkG7RyH7croQR1mqGYZUp
	kGC7bfKjbkh8n9CBMk06crVUAenQwekObrFsepcDWef/O6/JlcYH9E5xjKdiitnRuRtFrlHvKzw
	ONqWwSLsVqx480bZPqUcYY4hcnJM/sFB4blwogLYTLvRjWDUkG1a0U1VJ/zp5BBCuH/I9AmCOI8
	y5JHYeQd12SEwdCJ77mu27BJTYC4Pz5yKDeVEI70aP0MeieBtp6+NrNaPhT7mCLR96LRFDjobLT
	Tro88962TrNx8dX7lUOiV9uwO9fPc5+JIt5k1X8dWjG5qYjAPRmK2IppdsLeG9jd0YrspUbe7HA
	OHZh2o/LDjWyssUdABOgdkGfvebg5ECILClz/q3XkML5pKwtskYJ0TUvkYeB0gTIJukRBi74f
X-Received: by 2002:a05:600d:6503:20b0:49d:265e:eda6 with SMTP id
 5b1f17b1804b1-49fe66c8092mr78827095e9.2.1790339098331; Fri, 25 Sep 2026
 05:24:58 -0700 (PDT)
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
 <CAMuHMdXZwnRtp=f0iOiDqoLVjBTGVYNbbLeP9E3qjTn3RUEkUg@mail.gmail.com> <CA+V-a8tzLEScwpJ1Va-vpEHdJeOjo4v6K8_xTH=aAGZoxFHHbA@mail.gmail.com>
In-Reply-To: <CA+V-a8tzLEScwpJ1Va-vpEHdJeOjo4v6K8_xTH=aAGZoxFHHbA@mail.gmail.com>
From: "Lad, Prabhakar" <prabhakar.csengg@gmail.com>
Date: Fri, 25 Sep 2026 13:24:32 +0100
X-Gm-Features: AclHuK9Ao4CN3NpnEGUv9dSS7SJ85FqyguLfAAFth-uEV2_HwHzdX_13d_QZUpA
Message-ID: <CA+V-a8uoYZ80rpmJ4RhOA45FwouJKtFtLznjrXDyiFp6Wne=Kw@mail.gmail.com>
Subject: Re: [PATCH v6 6/8] watchdog: rzv2h: Add syscon support for WDTDCR
To: Geert Uytterhoeven <geert@linux-m68k.org>
Cc: Biju Das <biju.das.jz@bp.renesas.com>, Guenter Roeck <linux@roeck-us.net>, 
	"linux-watchdog@vger.kernel.org" <linux-watchdog@vger.kernel.org>, 
	"sashiko-reviews@lists.linux.dev" <sashiko-reviews@lists.linux.dev>, 
	"devicetree@vger.kernel.org" <devicetree@vger.kernel.org>, "conor+dt@kernel.org" <conor+dt@kernel.org>, 
	"wsa+renesas" <wsa+renesas@sang-engineering.com>, "robh@kernel.org" <robh@kernel.org>, 
	Fabrizio Castro <fabrizio.castro.jz@renesas.com>, 
	Linux-Renesas <linux-renesas-soc@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi Geert,

On Fri, Sep 25, 2026 at 10:20=E2=80=AFAM Lad, Prabhakar
<prabhakar.csengg@gmail.com> wrote:
>
> Hi Geert,
>
> On Fri, Sep 25, 2026 at 10:09=E2=80=AFAM Geert Uytterhoeven
> <geert@linux-m68k.org> wrote:
> >
> > Hi Prabhakar,
> >
> > On Fri, 25 Sept 2026 at 11:06, Lad, Prabhakar
> > <prabhakar.csengg@gmail.com> wrote:
> > > On Fri, Sep 25, 2026 at 6:11=E2=80=AFAM Biju Das <biju.das.jz@bp.rene=
sas.com> wrote:
> > > > > From: Guenter Roeck <groeck7@gmail.com> On Behalf Of Guenter Roec=
k
> > > > > On Fri, Sep 25, 2026 at 04:13:24AM +0000, Biju Das wrote:
> > > > > > Just a question,
> > > > > > For automatic software upgrade, if the reboot using PSCI fails,=
 what
> > > > > > is the fallback for reboot, reset the board?
> > > > >
> > > > > That seems to be a bit theoretic. The reason for having the abili=
ty to register multiple restart handlers
> > > > > is not to have failure fallbacks, but to have fallbacks if prefer=
red restart handlers are not available.
> > > > > If the PSCI restart handler is present, it is expected to work.
> > > > > That is why it has higher priority. The idea is to use the highes=
t priority restart handler, not to try
> > > > > one after another.
> > > > >
> > > > > Sure, the failure fallback works as well, but that doesn't mean t=
hat fallbacks should be provided just to
> > > > > provide fallbacks.
> > > > >
> > > > > If you claim that the PSCI restart handler does not work on this =
system, provide evicence, and we can
> > > > > discuss this further.
> > > >
> > > > I agree normal cases there won't be any failures
> > > >
> > > > I never heard about PSCI restart fails. But have seen a case due to=
 a bug in
> >
> > Oh yes, if PSCI is not really implemented ;-)
> >
> > > > serial driver that made the PSCI restart to fail as it hangs the sy=
stems.
> > > >
> > > > So, if this is the case, a memory corruption can cause the same.
> > > >
> > > > Long back I worked on femto based product(single core), where we ha=
ve normal restart
> > > > and a fallback watchdog restart. But it does not have PSCI system h=
andlers.
> > > > On some cases, we have seen automatic upgrade failed because of fai=
lure in
> > > > normal restart.
> > > >
> > > If you think the PSCI might fail and not restart the machine the othe=
r
> > > alternative would be to export functions to configure WDTDCR using
> > > readl/writel.
> >
> > Well, if PSCI resets fails: that's exactly why you have a watchdog
> > (or two) in the system, right?
> >
> Agreed, To avoid taking the syscon lock from restart context, how
> about exporting helpers from the CPG/MSSR driver to start/stop the
> WDTDCR count using plain readl/writel? Each WDTDCR register belongs to
> a single watchdog instance, so no locking is needed.
>
>   /* include/linux/soc/renesas/renesas.h */
>   int rzt2h_cpg_wdtdcr_count_start(unsigned int wdt_index);
>   int rzt2h_cpg_wdtdcr_count_stop(unsigned int wdt_index);
>
The DT binding patch that adds the renesas,sysc property has now been
merged [0].

While keeping syscon support, I propose adding
rzt2h_cpg_wdtdcr_count_start(), which can be used safely in atomic
contexts. For non-atomic cases, we can continue using syscon.

What do you think?

[0] https://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next.git/tre=
e/Documentation/devicetree/bindings/watchdog/renesas,r9a09g057-wdt.yaml?h=
=3Dnext-20260924#n51

Cheers,
Prabhakar
