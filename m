Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.160.173
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1794825466;
	b=fhnxD2YtyNCYfpC95tVsuQlCvbMWgQT0nHH9Nc5+h5tX3UU9+0KPDDPDGXLCQ2u0CWoV
	 8xbArOSUeOHwBsaAotVIUM8HS3OIxp70ioLxKboWkJQIsp0yqoNdgXsizy8UBKx4mSg5g
	 Y+J5MTCk8nvaiLAE0pKC8H69R18gS6JIwNwZ8ysDrQ3nve26kypNN+ApORFAADXUBkoX+
	 ovmM/lI9nIkrVcdoZu63N6Da3t3GHAwnEoeo4SyTklGNuSYophoKdlNKznyzwqV4iTfQf
	 tTmv5GIvtMHuAqdcYlvnjMedEVGlL2kQ8UJTWpU/vafNmaC0LvtT+mNshF5w6KSYOqA==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794825466;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:MIME-Version:References:
	 In-Reply-To:From:Date:X-Gm-Features:Message-ID:Subject:To:Cc:
	 Content-Type:Content-Transfer-Encoding;
	bh=vAdNdqMZpHFG+BSJ/Ajx6nPvS2zPMigzyGyeH1ja2j4=;
	b=iseEp9oYeWtVHFIS8J7UvUPot7Wcq+/WO0J1znLaGIJ5R7SDaqUtD7aTEI0JClLw0KCC
	 OR7vBGDS1bpVAdcgijhHE6Kh+RzFGqqGg1eF8/7suAQh0JXKO+ZFVkvtc0XV4Q1RYn903
	 ntn428uoQFma4WjP9CK/THE6paLG3LMhCp4TY5nFGIfvT2oLDYsL3O1DrsM075eAMzh2b
	 06NP8HxoGVsJ1O0MgHUdzFfEW2xBrHFQchBASeOaY+VImPk8H7I+hLdZw1LOYBHF1xEbJ
	 jFzBtj70/+ff5sq7bgH5pL4218UBiY31Hv82BpBx8Yny0S3XKkFxrRsiK6eGQAoGn3g==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b="D/8q5qCc";
	arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.160.173
Received: from mail-qt1-f173.google.com (mail-qt1-f173.google.com [209.85.160.173])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F179F606A33B
	for <sashiko-reviews@lists.linux.dev>; Mon, 16 Nov 2026 10:37:45 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org F179F606A33B
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=D/8q5qCc
Received: by mail-qt1-f173.google.com with SMTP id d75a77b69052e-55d03bfd477so19057701cf.1
        for <sashiko-reviews@lists.linux.dev>; Mon, 16 Nov 2026 02:37:45 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1794825465; cv=none;
        d=google.com; s=arc-20260327;
        b=YdVc8edH9ONS68SOZ7cIv39GIZvNtGTXDA/9Wvc2OySJjkFeNVVB0ZeRmUk187h3t+
         IhViPUOQNiHEy0FGCFR2HwtkwkZ0oUOCvzh+PACHjnl5zEOHQ5gc0xWw/boZgoYt24ls
         2xRny4qdOBXyUa0c/Xy/9oALgz0rXXn00my6SQlNpwxOz2JKaTugwNONXIQJ8uxzSpCM
         U/Jwwjh8bFvX33+Nl+xz5UjpEH/G9Kuq9WoIFDzda/oIXcztadgz1UCvj/LMJMdXxdeA
         oR1+UxKNJQJcZihvfSqhyfyf0oWjwUB2xt6e47rS+w4px9loVI7gfa8wxzxUoPTAUcfU
         /YnQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=vAdNdqMZpHFG+BSJ/Ajx6nPvS2zPMigzyGyeH1ja2j4=;
        fh=5atlI6N4DqhDJ/kROOWZt6Ol/QVkwus/c/CVt4iaZ0I=;
        b=EdM5mpcjZ2s1Ks1TrESsxt1E8fpxEKVPYpVsf4M54kPlSO2fbeVwlv2f4VVccNbhbP
         vP0ErQxmkgJjetG3CU83hBy7bTSmMODBNrrL/8FZ8OnVb7b1Jdqbsym21tPJc32pMNp4
         OWB97pw6HBSFNsIQVTtm+zLCEtW0CS95E2GKNDE5Q4HpD13inkKFORWNkDfPomCiu7PO
         WQCaw/7D/knW1+2b97k/Ael6PdIh1A5xsP7VUd10Bfu0MnVpjQmY7ou6bXszPiPEAoCs
         4owbKdQbZFH86zvjMmI+GiL0N93qTj034aRBLR8xZ+3+fmlRmpzAE6zK8buyVkbplNQr
         2XzA==;
        darn=lists.linux.dev
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794825465; x=1795430265; darn=lists.linux.dev;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=vAdNdqMZpHFG+BSJ/Ajx6nPvS2zPMigzyGyeH1ja2j4=;
        b=D/8q5qCcp5MCpSlgZ4D+dTvsSc0Yb5HD4JIzP3b9R8Sm9eK1TYar8tCvSLvJURwH/N
         hE+C1t5PGINmWLrBNfgUVce/vG2gYHbhDQiVmdTH5vRSwzpa/zPSd20Zsp1UvKDICHA4
         lG2csVDcn0akTUP7RuvCIl69asxIt9rP0nuBIWgy2ZNo3n8jfkeO+NjxDBMFIfjG2JrO
         aLt4UkOgZnJ3hIVbCQGUZdVj2SqvMW2C8GF2ahDypndAXlKz7Ttg/bdMGyyc2P7UrEh6
         y6aOn6dMA4PwL5GAVhM/HMcmJpREODIRjst/1OHi4pc0MKHgWIzBvAKuIXPPcGKHmc48
         FpcA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794825465; x=1795430265;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=vAdNdqMZpHFG+BSJ/Ajx6nPvS2zPMigzyGyeH1ja2j4=;
        b=P/OVrnaOYnAH0CiSmTvk5g1bQZkERwT+CcvbiozHifXBwcqZtpPSyK9drdGgiccyih
         ApmFQMwlJyBtPLjeNVrqL9dTLYgd1LWFTiHvyvs2RK0rlIR+4a9+qBVKPXu3ZUviO0/u
         y38FG7TDNnE+2N7y7BPpkz9dgji5WHSUonldyzhIraJT1SDqDVcjZ5UZ3QpMtnkJWbkj
         HTVoqfXuHW+zWq0jF6Wvp4+NAts/n377uMej5wzGIEvvlyrVEPOvAyUQRbvtVlEP2RtK
         PlWhh65/mAwH3MPV99tQfHpvNb+4YrEwoTwrkafgp0v4J6L26go5UyqYHJi3Xf4FSmFR
         aXKg==
X-Gm-Message-State: APuU4Z9dILJjiYZ8bn/zWS+ZRli7a6db6D5HX5TKf9rcmXEp4/8aqEAT
	+6O1cA+iMjM8Lrsw71AHtQ9zdtNVmDwayS6n8GXEParyqlMpj98OD8I0utlDUzHNnjqP9hxbzJg
	M19kkWI0nHSdnBrP7uGbMP1VnMAC9ni+JLmYl
X-Gm-Gg: AYBFou2J+5+KsHuY94sdRF6KqwfZxqVqBR3cULdEvcu7DwPbAT/tIi0+jHAVPLihAt1
	zztINTh4N3n55dku44UcM/t9GwhfM51tnvkiy/LrgGVagVB0GbQgEgMX7Y95irBYR1yE2DeTzzT
	cxgN+Scdtof6vNZpq8yh0u3dUP1qg/+A1XByT1XslLRDHK3l1U31zeauirrC3pmtdrEWH442iUi
	hhPsPr6EZRseFSQ+a2VQsLzRLpdeOjm95yhVMI7jRJznWDffqmZirQKXMzewNmZ0WT9qwhjzOeO
	Uc+aQfMxUxYkfbBvvsYYDtHZ3sk9osU1E0WKYK6t3DSQn2QLaPcmaKVS7jQLJJBDdYZFmOuNAOW
	9+XtS4aNTqr9U1RsvIvKbqmDPkyIJnS9hgl9oua+ScKbdiU/u5aVwhA4ansy/LT+Kn87+5w==
X-Received: by 2002:a05:622a:e40f:10b0:55c:6d3d:b688 with SMTP id
 d75a77b69052e-55c6d3db7eemr69199391cf.0.1794825464925; Mon, 16 Nov 2026
 02:37:44 -0800 (PST)
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
 <20261112-sdhi_rzg3l-v1-2-ca30b209615d@bp.renesas.com> <sashiko-outbox-211741@kernel.org>
In-Reply-To: <sashiko-outbox-211741@kernel.org>
From: Biju Das <biju.das.au@gmail.com>
Date: Mon, 16 Nov 2026 10:37:34 +0000
X-Gm-Features: AclHuK9Eg4UhaKH1QJpvsKiOfCpTnXZRZ4Twf9MfbxpkNjE3e-ev8l8nHxuYT8M
Message-ID: <CADT+UeApMF1yftK27r9haAr3eU2Vk=H__TMMNzvFVuURuP_XOQ@mail.gmail.com>
Subject: Re: [PATCH 2/3] arm64: dts: renesas: rzg3l-smarc-som: Enable SD/eMMC
 on SDHI0
To: sashiko-reviews@lists.linux.dev
Cc: devicetree@vger.kernel.org, robh@kernel.org, conor+dt@kernel.org, 
	wsa+renesas@sang-engineering.com, linux-renesas-soc@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Thu, Nov 12, 2026 at 7:07=E2=80=AFPM <sashiko-bot@kernel.org> wrote:
>
> Thank you for your contribution! Sashiko AI review found 2 potential
> issues to consider:
> - [High] arm64: dts: renesas: rzg3l-smarc-som: sdhi0 pinctrl fails with
>   -EINVAL
> - [Low] arm64: dts: renesas: rzg3l-smarc-som uses RZG2L_PORT_PINMUX for
>   SD0_CD
> --
>
> commit e86cb26292885aecdb37f14368a14d0f62f6aee6
> Author: Biju Das <biju.das.jz@bp.renesas.com>
>
> arm64: dts: renesas: rzg3l-smarc-som: Enable SD/eMMC on SDHI0
>
> This commit enables SD card or eMMC support on SDHI0 for the RZ/G3L SMARC
> SoM, selected via the SW_SD0_DEV_SEL macro.
>
> > diff --git a/arch/arm64/boot/dts/renesas/rzg3l-smarc-som.dtsi b/arch/ar=
m64/boot/dts/renesas/rzg3l-smarc-som.dtsi
> > index 091a227233cba..f6f4eed9a2ea6 100644
> > --- a/arch/arm64/boot/dts/renesas/rzg3l-smarc-som.dtsi
> > +++ b/arch/arm64/boot/dts/renesas/rzg3l-smarc-som.dtsi
>
> [ ... ]
>
> > @@ -216,7 +234,132 @@ i2c0_pins: i2c0 {
> >               pinmux =3D <RZG3L_PORT_PINMUX(L, 2, 4)>, /* RIIC0_SCL */
> >                        <RZG3L_PORT_PINMUX(L, 3, 4)>; /* RIIC0_SDA */
> >       };
> > +
> > +     sd0-pwr-en-hog {
> > +             gpio-hog;
> > +             gpios =3D <RZG3L_GPIO(5, 1) GPIO_ACTIVE_HIGH>;
> > +             output-high;
> > +             line-name =3D "sd0_pwr_en";
> > +     };
> > +
> > +     sdhi0_emmc_pins: sd0-emmc {
> > +             sd0-clk {
> > +                     pins =3D "SD0_CLK";
> > +                     power-source =3D <1800>;
> > +                     drive-strength-microamp =3D <9000>;
> > +             };
>
> [Severity: High]
> Does configuring power-source on the SD0_* pins cause sdhi0 probe to fail
> with -EINVAL?
>

No. see below

> In drivers/pinctrl/renesas/pinctrl-rzg2l.c, the SD0_* entries in
> rzg3l_dedicated_pins do not set PIN_CFG_IO_VMC_SD0 or PIN_CFG_SOFT_PS:
>
> drivers/pinctrl/renesas/pinctrl-rzg2l.c:rzg3l_dedicated_pins[] {
>     ...
>         { "SD0_CLK", RZG2L_SINGLE_PIN_PACK(0x9, 0, PIN_CFG_IOLH_B) },
>         { "SD0_CMD", RZG2L_SINGLE_PIN_PACK(0x9, 1,
>           (PIN_CFG_IOLH_B | PIN_CFG_IEN | PIN_CFG_PUPD)) },
>     ...
> }

{ "SD0_CLK", RZG2L_SINGLE_PIN_PACK(0x9, 0, PIN_CFG_IOLH_B |
PIN_CFG_IO_VMC_SD0) },
{ "SD0_CMD", RZG2L_SINGLE_PIN_PACK(0x9, 1,
 (PIN_CFG_IOLH_B | PIN_CFG_IEN | PIN_CFG_PUPD | PIN_CFG_IO_VMC_SD0)) },
{ "SD0_RST#", RZG2L_SINGLE_PIN_PACK(0x9, 2, PIN_CFG_IOLH_B |
PIN_CFG_IO_VMC_SD0) },
{ "SD0_DS", RZG2L_SINGLE_PIN_PACK(0x9, 5,
 (PIN_CFG_IOLH_B | PIN_CFG_IEN | PIN_CFG_PUPD | PIN_CFG_IO_VMC_SD0)) },
{ "SD0_DAT0", RZG2L_SINGLE_PIN_PACK(0x0a, 0,
 (PIN_CFG_IOLH_B | PIN_CFG_IEN | PIN_CFG_PUPD | PIN_CFG_IO_VMC_SD0)) },
{ "SD0_DAT1", RZG2L_SINGLE_PIN_PACK(0x0a, 1,
 (PIN_CFG_IOLH_B | PIN_CFG_IEN | PIN_CFG_PUPD | PIN_CFG_IO_VMC_SD0)) },
{ "SD0_DAT2", RZG2L_SINGLE_PIN_PACK(0x0a, 2,
 (PIN_CFG_IOLH_B | PIN_CFG_IEN | PIN_CFG_PUPD | PIN_CFG_IO_VMC_SD0)) },
{ "SD0_DAT3", RZG2L_SINGLE_PIN_PACK(0x0a, 3,
 (PIN_CFG_IOLH_B | PIN_CFG_IEN | PIN_CFG_PUPD | PIN_CFG_IO_VMC_SD0)) },
{ "SD0_DAT4", RZG2L_SINGLE_PIN_PACK(0x0a, 4,
 (PIN_CFG_IOLH_B | PIN_CFG_IEN | PIN_CFG_PUPD | PIN_CFG_IO_VMC_SD0)) },
{ "SD0_DAT5", RZG2L_SINGLE_PIN_PACK(0x0a, 5,
 (PIN_CFG_IOLH_B | PIN_CFG_IEN | PIN_CFG_PUPD | PIN_CFG_IO_VMC_SD0)) },
{ "SD0_DAT6", RZG2L_SINGLE_PIN_PACK(0x0a, 6,
 (PIN_CFG_IOLH_B | PIN_CFG_IEN | PIN_CFG_PUPD | PIN_CFG_IO_VMC_SD0)) },
{ "SD0_DAT7", RZG2L_SINGLE_PIN_PACK(0x0a, 7,
 (PIN_CFG_IOLH_B | PIN_CFG_IEN | PIN_CFG_PUPD | PIN_CFG_IO_VMC_SD0)) },


>
> When sdhi0 binds its pinctrl states (sdhi0_emmc_pins, sdhi0_usd_pins, or
> sdhi0_usd_uhs_pins), rzg2l_pinctrl_pinconf_set() -> rzg2l_set_power_sourc=
e()
> -> rzg2l_caps_to_pwr_reg() returns -EINVAL, preventing SDHI0 from probing=
 in
> both eMMC and uSD modes.  (Dropping power-source from DT while keeping
> drive-strength-microamp would instead leave the cached power_source at 0,
> causing rzg2l_ps_to_iolh_idx(0) to return RZG2L_IOLH_IDX_MAX and read pas=
t
> the end of hwcfg->iolh_groupb_ua[] in rzg2l_ds_is_supported().)

Drive strength it uses reset values.

>
> [ ... ]
>
> > +     sdhi0_usd_pins: sd0-usd {
> > +             sd0-cd {
> > +                     pinmux =3D <RZG2L_PORT_PINMUX(5, 0, 8)>; /* SD0_C=
D */
> > +             };
>
> [Severity: Low]
> This isn't a bug since RZG3L_P5 expands to 5, but sd0-cd in both
> sdhi0_usd_pins and sdhi0_usd_uhs_pins uses RZG2L_PORT_PINMUX(5, 0, 8)
> instead of RZG3L_PORT_PINMUX(5, 0, 8) like the rest of this file.

Will fix this.

Cheers,
Biju
