Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=185.203.200.13
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1795514289;
	b=F+6R9Pg2AxIkwyAPjFYrebhxnACP5Z1L9ptFn6FyaMXhgke59MYVeBa0nqIN/FieHR6F
	 TrVRZY0nvjxuXNd4qOviBpIHyUmCjVfEzN3QrzyGOwd7yV2WC0UKm/tiIvu04lnlliTUI
	 cQ5CHocJyKNlUfBJdeSzHiRyi8DsHIlFySIwxUQOrHF/4eoCPYeFKdaABDA/z5qR375z8
	 WS5yJDURLdBtUsrbbUsx1JVIUDBjloDFsWgLPWVSkBB2Is739ZdZTyAwp5wLWwSGnjGRJ
	 Pd1qslWYLuDk44WUcK7joue0p/iDLBqNSD9lJaOeObPHl9MSqcla6482078dipxQwXg==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795514289;
	h=DMARC-Filter:Received:DKIM-Signature:From:To:Cc:Subject:In-Reply-To:
	 References:Date:Message-ID:MIME-Version:Content-Type;
	bh=GREhSGUQtC0PX1E2njt5jFgmaOss9pV5WXnxNri1B20=;
	b=VgIEFd3ZEpeZKfiii4tEgDTwqXYV/yqeZpuvd1PuBT5MpBy+ezKUsp2+zsZvdhEQwnXY
	 f+7cuPTa29fRTn7l83ozTyUP+PfON4TDxi99Yo0xjvX+3taDvVGsfOH5LWfsqVeo9xG1Y
	 2UQUGzOrFApafEQYQTN+iEBjzu/t60u2mTKuQtWrLmF2rVma2Z3bZ8WlpANFuTQB800pe
	 EcIfAfpzdgfDWTXC5ztcoe25+1BA0Ch9V2xG9dqEf0A6tN9gCfHEqWAwDPOUHHzLvcAVl
	 qHAa05LPGvI6Xeu//B74O7+ZA0WadCCUSI5bJkiUnPCjUFSGjQchkn7FjvxR9ouawNg==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=none header.from=pengutronix.de;
	spf=pass smtp.mailfrom=pengutronix.de;
	dkim=pass header.d=pengutronix.de header.i=@pengutronix.de header.a=rsa-sha256 header.s=20260414 header.b=ghQhe1Fy;
	arc=pass header.oldest-pass=0 smtp.remote-ip=185.203.200.13
Received: from mx1.white.stw.pengutronix.de (mx1.white.stw.pengutronix.de [185.203.200.13])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5A22A606A33C;
	Tue, 24 Nov 2026 09:58:08 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 5A22A606A33C
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=pengutronix.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=pengutronix.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=pengutronix.de header.i=@pengutronix.de header.a=rsa-sha256 header.s=20260414 header.b=ghQhe1Fy
Received: from localhost (unknown [IPv6:2a0a:edc0:0:701:64eb:cd28:15f0:fe7b])
	(Authenticated sender: fdi@pengutronix.de)
	by mx1.white.stw.pengutronix.de (Postfix) with ESMTPSA id 057F8201D27;
	Tue, 24 Nov 2026 10:58:06 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=pengutronix.de;
	s=20260414; t=1795514286;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=GREhSGUQtC0PX1E2njt5jFgmaOss9pV5WXnxNri1B20=;
	b=ghQhe1FyRht4fL83/c0m6PtumIAjv+8UJg9/UlC7Vi95eyttHKMGSYroQK4vXx04Rh2O/I
	SupD6fWikyCrWON/wU8A//xH6Hd/Nd6uNd1rxKR9Wg4il+cSgKaHrfZxJQ6SaE69j+SVP2
	+zG2O7legrI3p/NQ2LGKy8jIguwOUcdPnXK3c9CqIPfhJEDBJuIep5OYV+EdeqNhBLuHLy
	BZZKfYeY2e3+EB8PhXK+Ptid2ITkZIQkPZ8zSxjoUojVATgRaH4B6UFyoiNl2H5j+Q6wja
	5madN61bG7E4RC7QjZj3y0dwvrl/zO/2+ZgoqHDSMQrjYE9prrN4ISGVwWh5Ww==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=pengutronix.de;
	s=20260414; t=1795514286;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=GREhSGUQtC0PX1E2njt5jFgmaOss9pV5WXnxNri1B20=;
	b=Ql8IGsCac3BTycRTjQ9oEn0IPGu7BgpjvAVdAIChU32q9ya8i1nzqJyAKcC1Hgasg9jGS2
	Iqz+wWboX0khDoY4VJ2fdmTALbAjoFJe42cmZJ/hi5ZIuUfk+PskVpzyaKoo+4xUksy6Ry
	sJhvHnW8J1dSJSmLNJl8c0MylFuQZUX7nXBg8S0ma8xHU/sQHmtR3dogQoK5vLVUHvu4I2
	F5moon1ohUG4HdbNhZbn+g+UqadyBHDGTYDm3+0B7NvlOQhlXkZWWpOMpZxIYMZgdlBX4M
	m1JmwRXSa6zvD3iWZQvhB7jwGbun0VhB00EWR2isMh0y6ai8XLUCovqhnVJm2Q==
ARC-Authentication-Results: i=1;
	ORIGINATING;
	auth=pass smtp.auth=fdi@pengutronix.de smtp.mailfrom=f.diener@pengutronix.de
ARC-Seal: i=1; s=20260414; d=pengutronix.de; t=1795514286; a=rsa-sha256;
	cv=none;
	b=fFihxgeQQOHq6iNTfu0dQZ5X+NqdsWKXc+TI/hg0QWdJC2RBl9fG4ARm52QwMqJ/gM3A0i
	wOh0vMHZfHuS2NIkvDnQ1V0fw54Q+r9GvFfQklyTpr4IUF9YHxN2kchCuNdcbns2jDC01w
	J7mdrDpj9b/OtXY0hbqAteWjkjIWzIGItiWQVQaQ/BP5cVKCpZFf1KRl8Q0bIbx73y8bc4
	MSr7rr9J7GhxJTTUCptFaVxeD1Jwq10a7sl1Owllimok+S2y84+uJfCOfrdYHdYlBLi95y
	fmvZAcgKB8qPfTmUIhuNQOYcHb8NSyMNAHX7WpVXJdIGC9fHPL7ugNLb4ULajw==
From: Freimut Diener <f.diener@pengutronix.de>
To: Frank Li <Frank.li@oss.nxp.com>, sashiko-reviews@lists.linux.dev
Cc: devicetree@vger.kernel.org, imx@lists.linux.dev, robh@kernel.org,
 conor+dt@kernel.org, Frank.Li@kernel.org
Subject: Re: [PATCH v2 2/5] arm64: dts: freescale: imx93-11x11-frdm-common:
 Describe PCAL6524 supply
In-Reply-To: <awRmrCk8tOd_F8MG@SMW015318>
References: <20261123-imx93-frdm-fixes-v2-0-dd97c7fca4b1@pengutronix.de>
 <20261123-imx93-frdm-fixes-v2-2-dd97c7fca4b1@pengutronix.de>
 <sashiko-outbox-229145@kernel.org> <awRmrCk8tOd_F8MG@SMW015318>
Date: Tue, 24 Nov 2026 10:58:05 +0100
Message-ID: <87jym2mtzm.fsf@theta.mail-host-address-is-not-set>
X-Mailing-List: sashiko-reviews@lists.linux.dev
List-Id: <sashiko-reviews.lists.linux.dev>
List-Post: <mailto:sashiko-reviews@lists.linux.dev>
List-Help: <mailto:sashiko-reviews+help@lists.linux.dev>
List-Subscribe: <mailto:sashiko-reviews+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:sashiko-reviews+unsubscribe@lists.linux.dev>
List-Owner: <mailto:sashiko-reviews+owner@lists.linux.dev>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain

Frank Li <Frank.li@oss.nxp.com> writes:

>> arm64: dts: freescale: imx93-11x11-frdm-common: Describe PCAL6524 supply
>>
>> This commit adds a fixed 3.3 V regulator node as a proxy for PMIC BUCK4
>> and wires it to the PCAL6524 GPIO expander's vcc-supply to avoid a circular
>> probe dependency between the PMIC and its interrupt parent.
>>
>> > diff --git a/arch/arm64/boot/dts/freescale/imx93-11x11-frdm-common.dtsi b/arch/arm64/boot/dts/freescale/imx93-11x11-frdm-common.dtsi
>> > index b3dfe516b1d55..e81b2342c50dc 100644
>> > --- a/arch/arm64/boot/dts/freescale/imx93-11x11-frdm-common.dtsi
>> > +++ b/arch/arm64/boot/dts/freescale/imx93-11x11-frdm-common.dtsi
>> > @@ -49,6 +49,19 @@ button-k3 {
>> >  		};
>> >  	};
>> >
>> > +	/*
>> > +	 * PCAL6524 is powered by PMIC BUCK4, but the PMIC uses PCAL6524
>> > +	 * as its interrupt controller. Model the supply with a fixed
>> > +	 * regulator to avoid a circular device dependency.
>> > +	 */
>> > +	reg_pcal6524_vcc: regulator-pcal6524-vcc {
>> > +		compatible = "regulator-fixed";
>> > +		regulator-name = "VDD_3V3_PCAL6524";
>> > +		regulator-min-microvolt = <3300000>;
>> > +		regulator-max-microvolt = <3300000>;
>> > +		regulator-always-on;
>> > +	};
>> > +
>> >  	reg_usdhc2_vmmc: regulator-usdhc2 {
>> >  		compatible = "regulator-fixed";
>> >  		off-on-delay-us = <12000>;
>> > @@ -207,8 +220,7 @@ pcal6524: gpio@22 {
>> >  		gpio-controller;
>> >  		pinctrl-0 = <&pinctrl_pcal6524>;
>> >  		pinctrl-names = "default";
>> > -		/* does not boot with supplier set, because it is the bucks interrupt parent */
>> > -		/* vcc-supply = <&buck4>; */
>> > +		vcc-supply = <&reg_pcal6524_vcc>;
>> >  	};
>>
>> [Severity: Medium]
>> Should reg_pcal6524_vcc be added to the Devicetree when no separate
>> fixed regulator exists on the board?
>>
>> Devicetree describes the physical hardware topology rather than encoding
>> workarounds for Linux driver probe ordering or dummy-regulator log
>> messages.  Modeling BUCK4 as a standalone always-on regulator-fixed node
>> misrepresents the board's power tree in the DT ABI and instantiates a
>> redundant platform device duplicating the regulator core's dummy
>> regulator.
>>
>> In Documentation/devicetree/bindings/gpio/gpio-pca95xx.yaml, vcc-supply
>> is optional, and other i.MX91/i.MX93 boards with the same PCA9451A and
>> PCAL6524 topology (such as imx93-11x11-evk-common.dtsi and
>> imx91-11x11-frdm.dts) omit vcc-supply on pcal6524 until the cyclic
>> dependency between PMIC IRQ resolution and expander supply lookup is
>> handled in the kernel drivers.
>
> Look like you just need remove vcc-supply property.

This would mean dropping the entire patch and keeping the warning about
the dummy regulator:

    pca953x 1-0022: supply vcc not found, using dummy regulator

Is that preferable?

Best,
Freimut
