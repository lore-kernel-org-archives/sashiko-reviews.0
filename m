Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.160.178
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1794825084;
	b=fyyyhDq0X1Y64PPD92jiTtyQrOecQ9LSl9l0tloggqjWvTB9/I6XvY0XHYnp473LqoWF
	 013BlGYpJVV9RNtQU2kqz/reTmoRnoZ2bIRaWj9FLA8e1sWPT8RIWHFOPChZypIGVzje4
	 zu3TIJ3iJe3ny0rPyixGbO7eCEoCVlytuHZZsbB50Dkh8+jOyVgrd6dQdfl69xpt/G0m4
	 vIurrKJtfQx4OXR6r+4UMuUgy/6rzHA3gDa4nAZ0kj7yWZER9IGi6yDQu4hEkSQvA610p
	 Oj2XY84dekRRDZUKCSguVBM5EN3FfuhT+BsdxxJb/znl9stfwY7vwMF1OzbN7OJM7KA==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794825084;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:MIME-Version:References:
	 In-Reply-To:From:Date:X-Gm-Features:Message-ID:Subject:To:Cc:
	 Content-Type:Content-Transfer-Encoding;
	bh=on1qfLbYc0jQwqPKmmXQjUDE4j0AQGRCChaGNO7XJfw=;
	b=kHaX4c5rYBvFAYSiWUGbrDhbF33yUKoBBWVzTWtoyo90BwnMbLRs/21c23dKK9Kh7SRq
	 01bJ6H3zFul6EDhVguVvey5HZ1qH96TrJZnbgE7D43mK+FyoX0t4ODkMbv50WYFBPom4l
	 pb9wtfhdz6+ug3W7disjyHXBjuaNDLgd/Di1chRewvEHsJ+48epcS1d+MRFIc3+tLzu4z
	 rDx04ePkYkHCAnrAjObhXKH5WyA1chCP1tJ6kkNlu1we/pqm2AYKcTSW38hyilHHbHfLj
	 d4n+9YWhHoGFIZtJQcK6JzNSgutObjQcbZmir639Xns2hx4/8lHrFjWfj8HYAOm14WQ==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=VU0ZIw3y;
	arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.160.178
Received: from mail-qt1-f178.google.com (mail-qt1-f178.google.com [209.85.160.178])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5C2E3606A884
	for <sashiko-reviews@lists.linux.dev>; Mon, 16 Nov 2026 10:31:23 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 5C2E3606A884
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=VU0ZIw3y
Received: by mail-qt1-f178.google.com with SMTP id d75a77b69052e-5364d86f7f0so14185811cf.1
        for <sashiko-reviews@lists.linux.dev>; Mon, 16 Nov 2026 02:31:23 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1794825082; cv=none;
        d=google.com; s=arc-20260327;
        b=Uvkp6cbEWLd/Xzay4yFz+W/2cBUEarxkXh5OjcVHgxs/zOB7sw23tGpkmbeBxUlpRJ
         ugkb1q/xJ9OSHiSr2SHq/Lw0NB5eIs59bSKd/wRtur/38S54hZ7bfc61FluT/pDbBn7b
         tFoa2c2pYl/LohJBgEikneBni4XD703WniRYjYcYTrtOthv5vBtxhp+vqFRvkIkeFz65
         kLMvNHzKtmfihpDLiFyvjRxH0DVvNDwt5L2DBbPkwjmVh1Diwix0a4Db5JVKZZ8cLRVI
         j567vz3oi79ujO52LV+KXdl3OLhzyEtLIdtf5T4rxrtw0VHX4rhz3YEv4dj6Wg9gqWVs
         wlTA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=on1qfLbYc0jQwqPKmmXQjUDE4j0AQGRCChaGNO7XJfw=;
        fh=5atlI6N4DqhDJ/kROOWZt6Ol/QVkwus/c/CVt4iaZ0I=;
        b=fkt1y5Wgz9fRbmDzfJanqcWwRf+GfhT1kXAb/pQuxGqovM3h3nNDNKFtSipsU8QcqD
         8kI8/Rw+FVbD8dGYC3SWsgkqDcnZ3N+mJGSS5Yj7pcQ5Rp2QxP0Abvu0pYheYj+ketrX
         wz3r8LA/LlVydRtNc6ujga/C/TgEv2iUB5aVH2US8o+bVUNfLq7F+wBYYib3qlsRqh5I
         6Zl5xTliCVwVNJA0VzbhfmYXJ/Ea6O7TEnt2L8onoJJWEwhWjeXYabR38j8IJdd+LK8J
         eo5NjtsLIc2qwndWHGWTRsAVRvtBE9bfJhsrWAKfiGrWmTQ0K/0449Fs9/karWiGjxD+
         M6cg==;
        darn=lists.linux.dev
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794825082; x=1795429882; darn=lists.linux.dev;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=on1qfLbYc0jQwqPKmmXQjUDE4j0AQGRCChaGNO7XJfw=;
        b=VU0ZIw3y7Wbs73drioG7Epz4j38enYzJ+j1BDTUd6oGPm5JH0D9Vp/2NhxcNf5YtQc
         8U0Gu7nW0ZXSadms/Ei7NxyvV0UnBG9UMoJaGKKm+9QVmrJi4+VyOyez4UvUONJTt1vl
         81SjpK+q1DhyJQna9/KB89Zli9pKh4HRu9jJaTLEP9wSY+okpUf9xDbeKe3LlKFDQMwG
         sV0pemhUIqNEE1GBmKjOUsjzPbawZc8tjXbFcGKG1NVSGqvoGXdVYyVTf5UQpuVTH/mV
         1WaeG6nHDtBmFXasUd4bfGzXzP+9wK+LKI8KrR0PsjCeSvHl84Oug0waVwKoSf/z0abO
         vWYw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794825082; x=1795429882;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=on1qfLbYc0jQwqPKmmXQjUDE4j0AQGRCChaGNO7XJfw=;
        b=E/iQFF96sBinJ8PCRM9lwgb317A6pRWBHlSSYVqigF5mohPIGT7uL8ldWWD1ElV4ub
         4Uf1+JaIkK3dxjmuo5PffTo8m6jtvf4iTegVzaJGlElCQSychN7UQIBPSnOUenFHsg6z
         6eQN1pmdmMhIxPHqtbqUQUKYmVPLJ0BVZfDmu8NieLBQ/NpL+Oh/M4wkzkvN2YhfL0DX
         5Aswlhw7/idl/O8fQBStytsWCfXsBCfIGd86NlxRNtcftHmZVgzCBVGkG/+SnUZxYmjl
         d5EVL96pGufv0XDB/I3ww0I3pqG5ugNWyK1kw0hX7lAEBJUEPIbGzJCgT8Fpb9AcOfMp
         +HDA==
X-Gm-Message-State: APuU4Z8+PfbKC0Y95Ktf4QRGzBC6kwMWzeXmeWLNRMMj1BvdSCEjJh+O
	ClEjeTzxwqeroB8h3M1zf1bKL5la92fuI0jTFGfkZgsFxxpyXnQRQ4d5Ocqw7fuQhNZR2uGtd8l
	rej4/HqHQBwvzrPfhgrwXj8JbH2trUZykkK37
X-Gm-Gg: AYBFou2SdJ1JW5u/yp9JCBJmzZ2DEhH26aGYzUolLitoWx7LkuINZYOoCFgpDO30jMs
	ZKpnfqih7Q+qhT9CPx1SkYYUcZQq/UEUo3zgfZQUR94uP0ern9/RRQsg3FRpTWE77LmIuC5dCPI
	NeryrkJ5F3P2R1c1AaXESCRf21OwuVvOmmzZMzeqrxBzLQAi3RS9VxDCS7oMiR6p2e9JOAsWWoO
	NQ0o/m3tqXx9RjrnBOAYHyFPFHEzK2EHQ0MfYQ3B9wtz0VBhIADXEA7qrqNZ/B2KY5vBuVfZOBq
	tVqc7y3M9xe3z+I9dTf9aiu5PULNF3anRzkyVN3uDlemcvOL6+ZCGbKkhVSQ+uSgeFY1dsDOUZ+
	xnWjj3w8usYpBoPTfpJQI2sdOG2Ebq2/QxIC0vUUnSOPaafv2ZYoFdJX57PSmwKcdqzNIfqE=
X-Received: by 2002:a05:622a:4d99:b0:536:990e:b4c6 with SMTP id
 d75a77b69052e-55ac7b550e6mr150515241cf.35.1794825082365; Mon, 16 Nov 2026
 02:31:22 -0800 (PST)
X-Mailing-List: sashiko-reviews@lists.linux.dev
List-Id: <sashiko-reviews.lists.linux.dev>
List-Post: <mailto:sashiko-reviews@lists.linux.dev>
List-Help: <mailto:sashiko-reviews+help@lists.linux.dev>
List-Subscribe: <mailto:sashiko-reviews+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:sashiko-reviews+unsubscribe@lists.linux.dev>
List-Owner: <mailto:sashiko-reviews+owner@lists.linux.dev>
Precedence: list
MIME-Version: 1.0
References: <20261112-sdhi_rzg3l-v1-0-ca30b209615d@bp.renesas.com>
 <20261112-sdhi_rzg3l-v1-3-ca30b209615d@bp.renesas.com> <sashiko-outbox-211747@kernel.org>
In-Reply-To: <sashiko-outbox-211747@kernel.org>
From: Biju Das <biju.das.au@gmail.com>
Date: Mon, 16 Nov 2026 10:31:11 +0000
X-Gm-Features: AclHuK-69tq2_5BrwcWip5r2r2C2Neh0RQqG5aAWyws3AaOyvcwgj8fZIJcAvcI
Message-ID: <CADT+UeCM2SEvcm8ELcFVDK_rHJuw=H4fC0=ArbJZcwBaeCQjvQ@mail.gmail.com>
Subject: Re: [PATCH 3/3] arm64: dts: renesas: rzg3l-smarc-som: Enable SDHI2
To: sashiko-reviews@lists.linux.dev
Cc: devicetree@vger.kernel.org, robh@kernel.org, conor+dt@kernel.org, 
	wsa+renesas@sang-engineering.com, linux-renesas-soc@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Thu, Nov 12, 2026 at 7:09=E2=80=AFPM <sashiko-bot@kernel.org> wrote:
>
> Thank you for your contribution! Sashiko AI review found 1 potential
> issue to consider:
> - [Medium] arm64: dts: renesas: rzg3l-smarc-som: no-op UHS pinctrl
>   switch on sdhi2
> --
>
> commit fa36790e3b28d4844cd7f51756a420dcdb4538ff
> Author: Biju Das <biju.das.jz@bp.renesas.com>
>
> arm64: dts: renesas: rzg3l-smarc-som: Enable SDHI2
>
> This commit adds pin control and device tree nodes to enable SDHI2 on the
> RZ/G3L SMARC EVK platform when the SW_SD2_EN macro is set.
>
> > diff --git a/arch/arm64/boot/dts/renesas/rzg3l-smarc-som.dtsi b/arch/ar=
m64/boot/dts/renesas/rzg3l-smarc-som.dtsi
> > index f6f4eed9a2ea6..e8fc9cddf288f 100644
> > --- a/arch/arm64/boot/dts/renesas/rzg3l-smarc-som.dtsi
> > +++ b/arch/arm64/boot/dts/renesas/rzg3l-smarc-som.dtsi
>
> [ ... ]
>
> > @@ -330,6 +331,74 @@ sd0-data {
> >                       power-source =3D <1800>;
> >               };
> >       };
> > +
> > +     sdhi2_pins: sd2 {
> > +             sd2-cd {
> > +                     pinmux =3D <RZG3L_PORT_PINMUX(K, 0, 1)>; /* SD2_C=
D */
> > +             };
> > +
> > +             sd2-clk {
> > +                     pinmux =3D <RZG3L_PORT_PINMUX(H, 0, 1)>; /* SD2_C=
LK */
> > +                     power-source =3D <3300>;
> > +             };
> > +
> > +             sd2-cmd {
> > +                     pinmux =3D <RZG3L_PORT_PINMUX(H, 1, 1)>; /* SD2_C=
MD */
> > +                     input-enable;
> > +                     power-source =3D <3300>;
> > +             };
> > +
> > +             sd2-data {
> > +                     pinmux =3D <RZG3L_PORT_PINMUX(H, 2, 1)>, /* SD2_D=
AT0 */
> > +                              <RZG3L_PORT_PINMUX(H, 3, 1)>, /* SD2_DAT=
1 */
> > +                              <RZG3L_PORT_PINMUX(H, 4, 1)>, /* SD2_DAT=
2 */
> > +                              <RZG3L_PORT_PINMUX(H, 5, 1)>; /* SD2_DAT=
3 */
> > +                     input-enable;
> > +                     power-source =3D <3300>;
> > +             };
> > +
> > +             sd2-iovs {
> > +                     pinmux =3D <RZG3L_PORT_PINMUX(K, 1, 1)>; /* SD2_I=
OVS */
> > +             };
> > +
> > +             sd2-pwen {
> > +                     pinmux =3D <RZG3L_PORT_PINMUX(K, 2, 1)>; /* SD2_P=
WEN */
> > +             };
> > +     };
> > +
> > +     sdhi2_pins_uhs: sd2-uhs {
> > +             sd2-cd {
> > +                     pinmux =3D <RZG3L_PORT_PINMUX(K, 0, 1)>; /* SD2_C=
D */
> > +             };
> > +
> > +             sd2-clk {
> > +                     pinmux =3D <RZG3L_PORT_PINMUX(H, 0, 1)>; /* SD2_C=
LK */
> > +                     power-source =3D <1800>;
> > +             };
> > +
> > +             sd2-cmd {
> > +                     pinmux =3D <RZG3L_PORT_PINMUX(H, 1, 1)>; /* SD2_C=
MD */
> > +                     input-enable;
> > +                     power-source =3D <1800>;
> > +             };
> > +
> > +             sd2-data {
> > +                     pinmux =3D <RZG3L_PORT_PINMUX(H, 2, 1)>, /* SD2_D=
AT0 */
> > +                              <RZG3L_PORT_PINMUX(H, 3, 1)>, /* SD2_DAT=
1 */
> > +                              <RZG3L_PORT_PINMUX(H, 4, 1)>, /* SD2_DAT=
2 */
> > +                              <RZG3L_PORT_PINMUX(H, 5, 1)>; /* SD2_DAT=
3 */
> > +                     input-enable;
> > +                     power-source =3D <1800>;
> > +             };
> > +
> > +             sd2-iovs {
> > +                     pinmux =3D <RZG3L_PORT_PINMUX(K, 1, 1)>; /* SD2_I=
OVS */
> > +             };
> > +
> > +             sd2-pwen {
> > +                     pinmux =3D <RZG3L_PORT_PINMUX(K, 2, 1)>; /* SD2_P=
WEN */
> > +             };
> > +     };
> >  };
>
> [Severity: Medium]
> Does switching sdhi2 between sdhi2_pins and sdhi2_pins_uhs write any hard=
ware
> pinctrl registers for the sd2 pins?

yes, it configures POC registers and uses reset values for drive strength.
>
> sdhi2_pins and sdhi2_pins_uhs differ only by power-source (<3300> vs <180=
0>),
> and neither specifies drive-strength-microamp. In r9a08g046_variable_pin_=
cfg,
> those pins use software power-source tracking instead of a hardware
> power-output-control register:
>
> drivers/pinctrl/renesas/pinctrl-rzg2l.c:r9a08g046_variable_pin_cfg[] =3D =
{
>     ...
>         RZG2L_VARIABLE_PIN_CFG_PACK(RZG3L_PH, 0, RZG3L_MPXED_PIN_FUNCS(B)=
),
>         RZG2L_VARIABLE_PIN_CFG_PACK(RZG3L_PH, 1, RZG3L_MPXED_PIN_FUNCS(B)=
 | PIN_CFG_IEN),
>     ...
> };

 RZG2L_VARIABLE_PIN_CFG_PACK(RZG3L_PG, 0, RZG2L_MPXED_COMMON_PIN_FUNCS(B) |
   PIN_CFG_IO_VMC_SD1),
RZG2L_VARIABLE_PIN_CFG_PACK(RZG3L_PG, 1, RZG2L_MPXED_COMMON_PIN_FUNCS(B) |
   PIN_CFG_IEN | PIN_CFG_IO_VMC_SD1),
RZG2L_VARIABLE_PIN_CFG_PACK(RZG3L_PG, 2, RZG2L_MPXED_COMMON_PIN_FUNCS(B) |
   PIN_CFG_IEN | PIN_CFG_IO_VMC_SD1),
RZG2L_VARIABLE_PIN_CFG_PACK(RZG3L_PG, 3,
RZG2L_MPXED_COMMON_PIN_FUNCS(B) | PIN_CFG_IEN |
   PIN_CFG_IO_VMC_SD1),
RZG2L_VARIABLE_PIN_CFG_PACK(RZG3L_PG, 4, RZG2L_MPXED_COMMON_PIN_FUNCS(B) |
   PIN_CFG_IEN | PIN_CFG_IO_VMC_SD1),
RZG2L_VARIABLE_PIN_CFG_PACK(RZG3L_PG, 5, RZG2L_MPXED_COMMON_PIN_FUNCS(B) |
   PIN_CFG_IEN | PIN_CFG_IO_VMC_SD1),

RZG2L_VARIABLE_PIN_CFG_PACK(RZG3L_PH, 0, RZG2L_MPXED_COMMON_PIN_FUNCS(B) |
   PIN_CFG_IO_VMC_SD2),
RZG2L_VARIABLE_PIN_CFG_PACK(RZG3L_PH, 1, RZG2L_MPXED_COMMON_PIN_FUNCS(B) |
   PIN_CFG_IEN | PIN_CFG_IO_VMC_SD2),
RZG2L_VARIABLE_PIN_CFG_PACK(RZG3L_PH, 2, RZG2L_MPXED_COMMON_PIN_FUNCS(B) |
   PIN_CFG_IEN | PIN_CFG_IO_VMC_SD2),
RZG2L_VARIABLE_PIN_CFG_PACK(RZG3L_PH, 3, RZG2L_MPXED_COMMON_PIN_FUNCS(B) |
   PIN_CFG_IEN | PIN_CFG_IO_VMC_SD2),
RZG2L_VARIABLE_PIN_CFG_PACK(RZG3L_PH, 4, RZG2L_MPXED_COMMON_PIN_FUNCS(B) |
   PIN_CFG_IEN | PIN_CFG_IO_VMC_SD2),
RZG2L_VARIABLE_PIN_CFG_PACK(RZG3L_PH, 5, RZG2L_MPXED_COMMON_PIN_FUNCS(B) |
   PIN_CFG_IEN | PIN_CFG_IO_VMC_SD2),

AI reviews can be wrong. see the mismatch.

Cheers,
Biju
