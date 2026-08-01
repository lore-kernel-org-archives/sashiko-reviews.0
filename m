Received: from mail-10625.protonmail.ch (mail-10625.protonmail.ch [79.135.106.25])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A48E1329C7B
	for <sashiko-reviews@lists.linux.dev>; Sat,  1 Aug 2026 18:50:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=79.135.106.25
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785610204; cv=none; b=TJPTx1yf3xd1N+NhJKbS3uMJj3dgi7ycLuJbLHjjVAtg2Ky9SQ3soYWSfJDoFUIRhQje5/8ayZAqajkIN5brZn/X1AwYtiV5Sp7YyUcIHqnFf6Lf0EFzGZJxWv7/0gNDUAyMD0gKA9k2/m4YI4BtX3qF2KnQy2GEHz9J18bQnIk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785610204; c=relaxed/simple;
	bh=jH8X8AfrJ4LKAkb70maz2owwgm/QpTY5iPLXuWxTnho=;
	h=Date:To:From:Cc:Subject:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=VwIgObO9WuJQ89aR5jFJqRpk9oe3R6SKk1BAvu7SjgigthxV+YfZMa0rwIstb0ziKXqfCknnBat6v/VUyS9IbF+Ak1QHZrPL8ZXuCe4MKATUwr/Ge+AI3TTuZ5Y2U0n0+MBPvXXswRb+2a57T38DbI3KgOjc5tQ8kOV7wsHIXxg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=vinarskis.com; spf=pass smtp.mailfrom=vinarskis.com; dkim=pass (2048-bit key) header.d=vinarskis.com header.i=@vinarskis.com header.b=LnU0uh+p; arc=none smtp.client-ip=79.135.106.25
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=vinarskis.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=vinarskis.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=vinarskis.com header.i=@vinarskis.com header.b="LnU0uh+p"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=vinarskis.com;
	s=protonmail2; t=1785610191; x=1785869391;
	bh=2Y1KLFYqjnUT2qk5cekpN+23lgyaBB2emc8RW9zPAgk=;
	h=Date:To:From:Cc:Subject:Message-ID:In-Reply-To:References:
	 Feedback-ID:From:To:Cc:Date:Subject:Reply-To:Feedback-ID:
	 Message-ID:BIMI-Selector;
	b=LnU0uh+pyKDeKuYR0usEi42NK/f2MU7c59A2KQV3mEgRtDwmYzHI1cHBi+7I8g//B
	 zBY2B5RH10tYalgNFbI8DjOjcm3dibZnZ81O9D//tMewRyuQ2rMXNw38gwdHooUZOd
	 WycFZ5oTvQj8eBrgGUXhuKZzrbgk9xhqgcx7rX21IGLMdGAydDEn7UtmSvU99RQ3iu
	 eMP//7IOmM+fZ4eLXTYPF1qmLWAQJdaafh0KiyAhEs9eH4zmW8ieYYgjqkpFIOSgcj
	 JGCmfRJRMPuCI5cvTpIlK630oILHtYxCJjNSmr+zBrpWuA+N9h+TytgIbzFueWN/+I
	 59J+5WZMnSbpg==
Date: Sat, 01 Aug 2026 18:49:47 +0000
To: sashiko-reviews@lists.linux.dev
From: Aleksandrs Vinarskis <alex@vinarskis.com>
Cc: conor+dt@kernel.org, devicetree@vger.kernel.org, robh@kernel.org
Subject: Re: [PATCH v3 3/3] arm64: dts: qcom: x1e80100-dell-xps13-9345: introduce EC
Message-ID: <Gep_E1gqgIfwFNRtsETsSS4Wzwm4HtYTS0S7_DcxoyTwrQmZey2YBgKJToIUqNwT28W2xJqneE2MP6HmL-N74kaSSuxbdfFLY8fQ_St52G0=@vinarskis.com>
In-Reply-To: <20260801184308.1A6001F00ADB@smtp.kernel.org>
References: <20260801-dell-xps-9345-ec-v3-0-9f4bdb5a5dad@vinarskis.com> <20260801-dell-xps-9345-ec-v3-3-9f4bdb5a5dad@vinarskis.com> <20260801184308.1A6001F00ADB@smtp.kernel.org>
Feedback-ID: 158356072:user:proton
X-Pm-Message-ID: d3aa0f4e7f3cdf1cd4fb04e607e542f1d2c2378f
Precedence: bulk
X-Mailing-List: sashiko-reviews@lists.linux.dev
List-Id: <sashiko-reviews.lists.linux.dev>
List-Subscribe: <mailto:sashiko-reviews+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:sashiko-reviews+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable





On Saturday, August 1st, 2026 at 20:43, sashiko-bot@kernel.org <sashiko-bot=
@kernel.org> wrote:

> Thank you for your contribution! Sashiko AI review found 2 potential issu=
e(s) to consider:
> - [Low] The device tree patch extends and references a non-existent label=
 `pmk8550_vadc`, which will cause a fatal `dtc` compilation error.
> - [Low] The patch uses undefined function-like macros (e.g., `ADC5_GEN3_A=
MUX3_GPIO_100K_PU(1)`), which will cause a syntax error during device tree =
compilation.
> --
>=20
> --- Patch [3]: [PATCH v3 3/3] arm64: dts: qcom: x1e80100-dell-xps13-9345:=
 introduce EC ---
> commit e7703c5dfab63d67ae0d89c48a05547baa5abd7f
> Author: Aleksandrs Vinarskis <alex@vinarskis.com>
>=20
> arm64: dts: qcom: x1e80100-dell-xps13-9345: introduce EC
>=20
> Describe embedded controller, its interrupt and required thermal zones.
> Add EC's reset GPIO to reserved range, as triggering it during device
> operation leads to unrecoverable and unusable state.
>=20
> > diff --git a/arch/arm64/boot/dts/qcom/x1e80100-dell-xps13-9345.dts b/ar=
ch/arm64/boot/dts/qcom/x1e80100-dell-xps13-9345.dts
> > index ce7b10ea89b6d..8d8d8014049bb 100644
> > --- a/arch/arm64/boot/dts/qcom/x1e80100-dell-xps13-9345.dts
> > +++ b/arch/arm64/boot/dts/qcom/x1e80100-dell-xps13-9345.dts
> [ ... ]
> > @@ -759,8 +759,32 @@ retimer_ss0_con_sbu_out: endpoint {
> [ ... ]
> > +=09embedded-controller@3b {
> > +=09=09compatible =3D "dell,xps13-9345-ec";
> > +=09=09reg =3D <0x3b>;
> > +
> > +=09=09interrupts-extended =3D <&tlmm 66 IRQ_TYPE_LEVEL_LOW>;
> > +
> > +=09=09pinctrl-0 =3D <&ec_int_n_default>;
> > +=09=09pinctrl-names =3D "default";
> > +
> > +=09=09io-channels =3D <&pmk8550_vadc ADC5_GEN3_AMUX3_GPIO_100K_PU(1)>,
> [Severity: Low]
> Does this file include the node definitions and bindings for pmk8550_vadc=
?
>=20
> The pmk8550_vadc phandle does not appear to be defined in this file or it=
s
> typical includes, which will cause a dtc compilation error when the devic=
e
> tree is built.
>=20
> Additionally, is ADC5_GEN3_AMUX3_GPIO_100K_PU intended to be used as a
> function-like macro taking an argument here?
>=20
> The dt-bindings headers usually define this as a parameterless macro.
> Supplying an argument like (1) will cause a preprocessor error during the
> device tree compilation.

..

>=20
> > +=09=09=09      <&pmk8550_vadc ADC5_GEN3_AMUX4_GPIO_100K_PU(1)>,
> [ ... ]
> > @@ -1025,6 +1049,57 @@ rtmr0_1p8_reg_en: rtmr0-1p8-reg-en-state {
> >  =09};
> >  };
> >
> > +&pmk8550_vadc {
> > +=09sys_therm0: channel@14c {
> > +=09=09reg =3D <ADC5_GEN3_AMUX3_GPIO_100K_PU(1)>;
> [Severity: Low]
> Will appending to pmk8550_vadc work if the base node does not exist?
>=20
> Similar to the io-channels property in the embedded-controller block,
> attempting to append properties to an undefined pmk8550_vadc node will
> result in a path not found error from the device tree compiler.
>=20
> The reg assignment also uses the same function-like macro syntax which
> will trigger a preprocessor failure.

Seems bot is not using latest linux-next as base. Nodes exist in
next-20260731, this series builds and works.

Alex

>=20
> > +=09=09qcom,hw-settle-time =3D <200>;
> > +=09=09qcom,ratiometric;
> > +=09=09label =3D "lpddr5_therm";
> > +=09};
> [ ... ]
>=20
> --
> Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260801-dell-xps=
-9345-ec-v3-0-9f4bdb5a5dad@vinarskis.com?part=3D3
> 
