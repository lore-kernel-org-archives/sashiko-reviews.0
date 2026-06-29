Received: from mail-wm1-f47.google.com (mail-wm1-f47.google.com [209.85.128.47])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 69F4140F8D6
	for <sashiko-reviews@lists.linux.dev>; Mon, 29 Jun 2026 15:27:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.47
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1782746827; cv=none; b=T0kiVbsrGNOUUvfGWIk8Qa9f7E9EjLmG3nJGLVUUI5soyghGpmDqfi9yYNFXQUuEfN1xauKchSdA7ZFV8LZCkAXrifVceXXVMadZ9HB9BhK05cBoGFeVUA+yRzw/F9x+0lvEALt+k2LiGT2g3K5JlvhEmhpanocJm/6EIsFgnsw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1782746827; c=relaxed/simple;
	bh=EO+7GPbDoMK9HijQwsoHg6dPkxSpORWwxrjuDEiCwXA=;
	h=From:To:Cc:Subject:In-Reply-To:References:Date:Message-ID:
	 MIME-Version:Content-Type; b=qHz3nTiCFcnVVpZ7awi89lJZKgOVnrASlxD7NPI6yPJAe83gNkrhXGvHhMG5TqJXP9OLGhRqDpQUipUVKUZuE92GbCOKdl/+dHo7G8teF8+GmjLvA8CEfHTPRqMoIFa8ycZGvZyCEwWHNg5a4F33Ge2yc5ahtSe9agaKHFUR9bA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com; spf=pass smtp.mailfrom=baylibre.com; dkim=pass (2048-bit key) header.d=baylibre.com header.i=@baylibre.com header.b=AOrS/zS6; arc=none smtp.client-ip=209.85.128.47
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=baylibre.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=baylibre.com header.i=@baylibre.com header.b="AOrS/zS6"
Received: by mail-wm1-f47.google.com with SMTP id 5b1f17b1804b1-493a7bd27c2so13234745e9.3
        for <sashiko-reviews@lists.linux.dev>; Mon, 29 Jun 2026 08:27:05 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre.com; s=google; t=1782746824; x=1783351624; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:message-id:date:user-agent
         :references:in-reply-to:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=4WTgdgx74eKSECK/LqviDIf77Rxva4Ev5PA6PkXPXgw=;
        b=AOrS/zS6A3Bu1ZfMv/mM9KsBneoOyaONKS2w0Iz86LtJEslHo3sQra269i5nk7OrUO
         fpAHdT+lYBzDMwpuj1D88liKmCx+aLNPuW3pkOsG4W1lyhJmrTBUwdSstRDkf4wrA8ZX
         Zn/YW/21oHX7/14ysW3nKqEdsE52R+si6lFg3VM8wZhgY8voZ6v95imaVqO++npdf7uH
         d+qNwUxYPh1gf0iJWIAd9lGsRnU2Rg3qfXE1hYE/fxzNQ5+mqm1/QMVcERCfsF8vbCww
         weBCwbbfYLmxotlyrEcJZFYnSsVdCpZNPiW0MwbvSEYWjQbSWp9fAUNs2YL2UaoHdzAw
         VKGQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1782746824; x=1783351624;
        h=content-transfer-encoding:mime-version:message-id:date:user-agent
         :references:in-reply-to:subject:cc:to:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=4WTgdgx74eKSECK/LqviDIf77Rxva4Ev5PA6PkXPXgw=;
        b=cBwujQvR3FTURIfW+8115gfZ4vXyGDu+5GrkHnY5u80zuHZIzpLn72P0dfVbkUbRjw
         FVFpXl9dfU1iAlkZn9uvySuCdkXdzKfXNXC2RAqLvgEVEvBorefJ/0Hxl2yQeRDstVIX
         rVK15Rw6TPR7k7WSwC/ouhd26w8jeop+RT2lfCqFA2tETbHz7q3U3MVR/XMvEa4yBvKQ
         cyLTWGf1abC7lmF3ATTQEj5dks2bjPAq9hJsiH5rEsKv7z8gQLoC+Uf27JHbWbh+KD3W
         cClLUPveNNPrcUYtdBr3T91iMmFBPl0Q1s31srBSEcs+46EaRPfTMjtppVD40ddKgMsf
         6tdg==
X-Forwarded-Encrypted: i=1; AFNElJ9uNkDzg1O3e2Fscsvbt9MtSBRrt/Kn9AanMoL5CWou5bfSzmCgyIVW6/rHr/UE/IQTXan22/xXlPeKrvsYREU=@lists.linux.dev
X-Gm-Message-State: AOJu0YyUw88+AKD2S+r24jhlh/GlOHVTBHjeSf1fHrEJHH7kPAGx7G8J
	Aj1l3aNGoCZ3NFBKaMXDeYR8ZLwDmmrSPSUNDCvlAsV8M+7GfUIS414uEVBjJFWMRDo=
X-Gm-Gg: AfdE7ckaQN8eDCp8MgniSocBCDJvwJZu9cysxOauo1B2nlv/AwutRY/EVhKJn++0hpk
	0olD1Y4xKXBOJZS7Gruj1yF8R5RgH1DSmURR3SY0bHApekRwHSQW/nnqMyPRCmw4WVgbArwdqAD
	obqm9x2Uoe5EnNgqJmxT7oy3OV1PL2GBGryQpLB6kR2Tc4vdHdZ3NZ2CJnPGD4Op1DpckvygH9h
	VXogxHYZV/aJ55kxLUd/QaDCBBfchNXNw7mW2J2e/FUWewPoom1x+wH0zQ7YYvJD0H/o4ABrghU
	Zjk8NWHWggIXK2OZO70NL1v2tAFIcaa5dUSqUB1BcZlAMURBJU+dgQ+qUPvEQpZS8kT/2Zg9K5z
	P7IpLebqwWVr5ifhAuxku0AwLfGRnbe7TqHZ1KXxKy2i0xUCTaueENBSrQYAvWUePrzn1ZqK9uH
	MQi0kGHOkS7fE=
X-Received: by 2002:a05:600c:3b24:b0:493:a88d:28d2 with SMTP id 5b1f17b1804b1-493b82aeaffmr2405445e9.24.1782746823793;
        Mon, 29 Jun 2026 08:27:03 -0700 (PDT)
Received: from localhost ([2a01:e0a:3c5:5fb1:1d21:f5d5:2d3c:23a7])
        by smtp.gmail.com with UTF8SMTPSA id 5b1f17b1804b1-4932f100e4asm221440355e9.1.2026.06.29.08.27.02
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 29 Jun 2026 08:27:02 -0700 (PDT)
From: Jerome Brunet <jbrunet@baylibre.com>
To: Chen-Yu Tsai <wens@kernel.org>
Cc: Conor Dooley <conor@kernel.org>,  sashiko-bot@kernel.org,
  sashiko-reviews@lists.linux.dev,  linux-sunxi@lists.linux.dev,
  robh@kernel.org,  devicetree@vger.kernel.org,  conor+dt@kernel.org
Subject: Re: [PATCH v2 1/6] dt-bindings: rtc: sun6i: add sun60i-a733 support
In-Reply-To: <CAGb2v67QV4gt=iXvaWeRCAxcasvzSpgTPodHhspd2ka19Hgdtg@mail.gmail.com>
	(Chen-Yu Tsai's message of "Mon, 29 Jun 2026 23:20:40 +0800")
References: <20260629-a733-rtc-v2-0-7b72112784f8@baylibre.com>
	<20260629-a733-rtc-v2-1-7b72112784f8@baylibre.com>
	<20260629125305.0DF981F000E9@smtp.kernel.org>
	<1jpl198jzk.fsf@starbuckisacylon.baylibre.com>
	<20260629-aliens-busload-ef9178973b4f@spud>
	<CAGb2v67QV4gt=iXvaWeRCAxcasvzSpgTPodHhspd2ka19Hgdtg@mail.gmail.com>
User-Agent: mu4e 1.12.9; emacs 30.1
Date: Mon, 29 Jun 2026 17:27:01 +0200
Message-ID: <1jechp8j0a.fsf@starbuckisacylon.baylibre.com>
Precedence: bulk
X-Mailing-List: sashiko-reviews@lists.linux.dev
List-Id: <sashiko-reviews.lists.linux.dev>
List-Subscribe: <mailto:sashiko-reviews+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:sashiko-reviews+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable

On lun. 29 juin 2026 at 23:20, Chen-Yu Tsai <wens@kernel.org> wrote:

> On Mon, Jun 29, 2026 at 11:16=E2=80=AFPM Conor Dooley <conor@kernel.org> =
wrote:
>>
>> On Mon, Jun 29, 2026 at 05:05:51PM +0200, Jerome Brunet wrote:
>> > On lun. 29 juin 2026 at 12:53, sashiko-bot@kernel.org wrote:
>> >
>> > > Thank you for your contribution! Sashiko AI review found 1 potential=
 issue(s) to consider:
>> > > - [Low] The `clock-output-names` property has a global `maxItems: 3`
>> > > constraint and a description limiting it to three clocks, which cont=
radicts
>> > > the new clock outputs (IDs up to 11) added for the sun60i-a733-rtc.
>> > > --
>> > >
>> > > commit a1565b632e372c724867216463a453c9d1600ad2
>> > > Author: Jerome Brunet <jbrunet@baylibre.com>
>> > >
>> > > dt-bindings: rtc: sun6i: add sun60i-a733 support
>> > >
>> > > Adds a new rtc compatible for the sun60i-a733 SoC and new IDs for the
>> > > peripheral oscillator clock gates of this SoC.
>> > >
>> > >> diff --git a/Documentation/devicetree/bindings/rtc/allwinner,sun6i-=
a31-rtc.yaml b/Documentation/devicetree/bindings/rtc/allwinner,sun6i-a31-rt=
c.yaml
>> > >> index 9df5cdb6f63f2..197a6f67b180a 100644
>> > >> --- a/Documentation/devicetree/bindings/rtc/allwinner,sun6i-a31-rtc=
.yaml
>> > >> +++ b/Documentation/devicetree/bindings/rtc/allwinner,sun6i-a31-rtc=
.yaml
>> > >> @@ -33,6 +33,7 @@ properties:
>> > >>            - enum:
>> > >>                - allwinner,sun20i-d1-rtc
>> > >>                - allwinner,sun55i-a523-rtc
>> > >> +              - allwinner,sun60i-a733-rtc
>> > >>            - const: allwinner,sun50i-r329-rtc
>> > >
>> > > [ ... ]
>> > >
>> > >> diff --git a/include/dt-bindings/clock/sun6i-rtc.h b/include/dt-bin=
dings/clock/sun6i-rtc.h
>> > >> index 3bd3aa3d57ce1..5132a393ca4b6 100644
>> > >> --- a/include/dt-bindings/clock/sun6i-rtc.h
>> > >> +++ b/include/dt-bindings/clock/sun6i-rtc.h
>> > >> @@ -6,5 +6,9 @@
>> > >>  #define CLK_OSC32K                0
>> > >>  #define CLK_OSC32K_FANOUT 1
>> > >>  #define CLK_IOSC          2
>> > >> +#define CLK_HOSC_UFS              8
>> > >> +#define CLK_HOSC_HDMI             9
>> > >> +#define CLK_HOSC_SERDES0  10
>> > >> +#define CLK_HOSC_SERDES1  11
>> > >
>> > > [Severity: Low]
>> > > Will adding clock IDs up to 11 conflict with the existing clock-outp=
ut-names
>> > > constraint in allwinner,sun6i-a31-rtc.yaml?
>> > >
>> > > The clock-output-names property currently has a global maxItems cons=
traint
>> > > alongside its description:
>> > >
>> > >   clock-output-names:
>> > >     minItems: 1
>> > >     maxItems: 3
>> > >     description:
>> > >       The RTC provides up to three clocks
>> > >
>> > > If a device tree author attempts to define an array of clock-output-=
names
>> > > to document all outputs for the allwinner,sun60i-a733-rtc node, won'=
t it fail
>> > > dt_binding_check validation because it exceeds the maximum allowed i=
tems?
>> >
>> > Not quite sure what to do with that one.
>> >
>> > The h616 compatible devices all exposed more than 3 clock through the
>> > provider, even if the higher IDs did not have define.
>> >
>> > The clock output names for the h616 compatible device are not really
>> > supposed to be defined through DT ... at least AFAIU ??
>>
>> The output names aren't even defined anyway, so the property is not
>> really all that helpful. It's worth increasing the max to whatever is
>> permitted now and look into the conditional sections to see if any
>> constraints need updating.
>
> Or just not allow it for the newer RTC compatible? On the kernel side,

I was edging toward this. Would this be acceptable to you Conor ?
I'm thinking about disallowing it for all the h616 compatible ones, not
just the a733.

> the sunxi-ng clk library doesn't even use the property, presumably because
> the library mainly targets the main clock controller that has at least
> tens of clocks. Writing clock-output-names for them isn't really scalable,
> and sort of useless as the name can be inferred by the clock ID and
> compatible.
>
>
> ChenYu

--=20
Jerome
