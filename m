Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2E9C54266BA
	for <sashiko-reviews@lists.linux.dev>; Mon, 29 Jun 2026 15:20:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1782746456; cv=none; b=QergHSEPcLvY/ulgI+aqf9jM/Y5yZhefpzrhxjyAEax4LAJP+nW0tM5UniTiQ5rM1aFZKrGHi7+adXZctm5RuuvmzellJ4U5NbPtMjl58kkh5cp0xMi3577lQ7mJxSK8rejcAdSkaQWAdIrLaQc3jSqcTIQTXXClP+4Ofzc+OoA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1782746456; c=relaxed/simple;
	bh=nc86Jp8o62Q5nme3DvzGnKx5D+U2qvXr0jn+wTpod4M=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=sKmSbmZvfNzjquC7hxqsculSVjH0i/V4iKCoALyW6GD5LX7PnJCwJA+uqQLT1wLYr5juRBKd980YC9nLs0o2XFit4MWe5ZKiakqCORn3ve3LC3JSlCvHr/By5eJSin/ymSQJEPZRvjTp+lj/FPnVqSz/Yubqq+PdiHUfXDJ9BAk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=X/gUcjv/; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="X/gUcjv/"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id F36BC1F00A3E
	for <sashiko-reviews@lists.linux.dev>; Mon, 29 Jun 2026 15:20:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1782746454;
	bh=wX2jSosalBCXeov1KAZFnmkZLC/jlFNjqnL7xit1Tpo=;
	h=References:In-Reply-To:Reply-To:From:Date:Subject:To:Cc;
	b=X/gUcjv/e1O4kU1vRPhXCj8Nw9/Ff4OtxldD7mpprASv2Qx0LEHcdxKR0FvwQ8pTm
	 QeBM6smK1MSKxoE6H3YciAnGoCIG4eMMv/gCoO/XCMeyp5F9KrV2kv7ZTWxX5fr6BX
	 nWJIY/d4So/2pGol4U/S7no1oQpqvp99qFL9sR3YahuXcI7qVVpfIkHgdG2XCwi+6K
	 MLHupZaWeecFLSHl4c2kiRwaAUcdxGgNEFdKr7fKJssw+S1KbrldgGcWnM6RGVRGL9
	 Kff61la0CCqKI4DzBV4+qA8y+8tiIXOJpYRmN5lXg4cf23CG/hMG5Cht1H02f1Scxf
	 F4RBDA1kCLWnQ==
Received: by mail-lj1-f172.google.com with SMTP id 38308e7fff4ca-39664fe2dd8so21587291fa.3
        for <sashiko-reviews@lists.linux.dev>; Mon, 29 Jun 2026 08:20:53 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AHgh+RpDM2Aumgol8mlNkpBpFjp+ln5c2hynL3artveCPpMe+vj/vnJVsaCe1furt2Q8mB3cXFsyuQ0l6CRSKdTljmU=@lists.linux.dev
X-Gm-Message-State: AOJu0YxLJu6CKB4ybkHmZozSr6v8MtBSmYysf3FeHQMnpsACOpu60hFn
	W7LqZr0mtZh7Q3kDjZmNI846+SYlx9xm6mSFMKAMpDNcyD8Uw1sGeQoZMl23GUDgkIAI2BGxFKs
	pfVUm+v5AgDSWqHnpEz88NkJ5G2PQOKA=
X-Received: by 2002:a2e:bd03:0:b0:39a:da70:2c77 with SMTP id
 38308e7fff4ca-39ada702fc0mr25197121fa.3.1782746452424; Mon, 29 Jun 2026
 08:20:52 -0700 (PDT)
Precedence: bulk
X-Mailing-List: sashiko-reviews@lists.linux.dev
List-Id: <sashiko-reviews.lists.linux.dev>
List-Subscribe: <mailto:sashiko-reviews+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:sashiko-reviews+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20260629-a733-rtc-v2-0-7b72112784f8@baylibre.com>
 <20260629-a733-rtc-v2-1-7b72112784f8@baylibre.com> <20260629125305.0DF981F000E9@smtp.kernel.org>
 <1jpl198jzk.fsf@starbuckisacylon.baylibre.com> <20260629-aliens-busload-ef9178973b4f@spud>
In-Reply-To: <20260629-aliens-busload-ef9178973b4f@spud>
Reply-To: wens@kernel.org
From: Chen-Yu Tsai <wens@kernel.org>
Date: Mon, 29 Jun 2026 23:20:40 +0800
X-Gmail-Original-Message-ID: <CAGb2v67QV4gt=iXvaWeRCAxcasvzSpgTPodHhspd2ka19Hgdtg@mail.gmail.com>
X-Gm-Features: AVVi8CdsTodw99fmrCaHKTshq-RBAGtmS8kU99BDukgcJtbj15UOd7IbhDxIdwE
Message-ID: <CAGb2v67QV4gt=iXvaWeRCAxcasvzSpgTPodHhspd2ka19Hgdtg@mail.gmail.com>
Subject: Re: [PATCH v2 1/6] dt-bindings: rtc: sun6i: add sun60i-a733 support
To: Conor Dooley <conor@kernel.org>
Cc: Jerome Brunet <jbrunet@baylibre.com>, sashiko-bot@kernel.org, 
	sashiko-reviews@lists.linux.dev, linux-sunxi@lists.linux.dev, robh@kernel.org, 
	devicetree@vger.kernel.org, conor+dt@kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Mon, Jun 29, 2026 at 11:16=E2=80=AFPM Conor Dooley <conor@kernel.org> wr=
ote:
>
> On Mon, Jun 29, 2026 at 05:05:51PM +0200, Jerome Brunet wrote:
> > On lun. 29 juin 2026 at 12:53, sashiko-bot@kernel.org wrote:
> >
> > > Thank you for your contribution! Sashiko AI review found 1 potential =
issue(s) to consider:
> > > - [Low] The `clock-output-names` property has a global `maxItems: 3`
> > > constraint and a description limiting it to three clocks, which contr=
adicts
> > > the new clock outputs (IDs up to 11) added for the sun60i-a733-rtc.
> > > --
> > >
> > > commit a1565b632e372c724867216463a453c9d1600ad2
> > > Author: Jerome Brunet <jbrunet@baylibre.com>
> > >
> > > dt-bindings: rtc: sun6i: add sun60i-a733 support
> > >
> > > Adds a new rtc compatible for the sun60i-a733 SoC and new IDs for the
> > > peripheral oscillator clock gates of this SoC.
> > >
> > >> diff --git a/Documentation/devicetree/bindings/rtc/allwinner,sun6i-a=
31-rtc.yaml b/Documentation/devicetree/bindings/rtc/allwinner,sun6i-a31-rtc=
.yaml
> > >> index 9df5cdb6f63f2..197a6f67b180a 100644
> > >> --- a/Documentation/devicetree/bindings/rtc/allwinner,sun6i-a31-rtc.=
yaml
> > >> +++ b/Documentation/devicetree/bindings/rtc/allwinner,sun6i-a31-rtc.=
yaml
> > >> @@ -33,6 +33,7 @@ properties:
> > >>            - enum:
> > >>                - allwinner,sun20i-d1-rtc
> > >>                - allwinner,sun55i-a523-rtc
> > >> +              - allwinner,sun60i-a733-rtc
> > >>            - const: allwinner,sun50i-r329-rtc
> > >
> > > [ ... ]
> > >
> > >> diff --git a/include/dt-bindings/clock/sun6i-rtc.h b/include/dt-bind=
ings/clock/sun6i-rtc.h
> > >> index 3bd3aa3d57ce1..5132a393ca4b6 100644
> > >> --- a/include/dt-bindings/clock/sun6i-rtc.h
> > >> +++ b/include/dt-bindings/clock/sun6i-rtc.h
> > >> @@ -6,5 +6,9 @@
> > >>  #define CLK_OSC32K                0
> > >>  #define CLK_OSC32K_FANOUT 1
> > >>  #define CLK_IOSC          2
> > >> +#define CLK_HOSC_UFS              8
> > >> +#define CLK_HOSC_HDMI             9
> > >> +#define CLK_HOSC_SERDES0  10
> > >> +#define CLK_HOSC_SERDES1  11
> > >
> > > [Severity: Low]
> > > Will adding clock IDs up to 11 conflict with the existing clock-outpu=
t-names
> > > constraint in allwinner,sun6i-a31-rtc.yaml?
> > >
> > > The clock-output-names property currently has a global maxItems const=
raint
> > > alongside its description:
> > >
> > >   clock-output-names:
> > >     minItems: 1
> > >     maxItems: 3
> > >     description:
> > >       The RTC provides up to three clocks
> > >
> > > If a device tree author attempts to define an array of clock-output-n=
ames
> > > to document all outputs for the allwinner,sun60i-a733-rtc node, won't=
 it fail
> > > dt_binding_check validation because it exceeds the maximum allowed it=
ems?
> >
> > Not quite sure what to do with that one.
> >
> > The h616 compatible devices all exposed more than 3 clock through the
> > provider, even if the higher IDs did not have define.
> >
> > The clock output names for the h616 compatible device are not really
> > supposed to be defined through DT ... at least AFAIU ??
>
> The output names aren't even defined anyway, so the property is not
> really all that helpful. It's worth increasing the max to whatever is
> permitted now and look into the conditional sections to see if any
> constraints need updating.

Or just not allow it for the newer RTC compatible? On the kernel side,
the sunxi-ng clk library doesn't even use the property, presumably because
the library mainly targets the main clock controller that has at least
tens of clocks. Writing clock-output-names for them isn't really scalable,
and sort of useless as the name can be inferred by the clock ID and
compatible.


ChenYu
