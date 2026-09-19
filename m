Received: from mail-24430.protonmail.ch (mail-24430.protonmail.ch [109.224.244.30])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5C79A3F5BE3
	for <sashiko-reviews@lists.linux.dev>; Sat, 19 Sep 2026 11:12:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=109.224.244.30
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789816346; cv=none; b=nRxd5DWaCTOgWt7l1uj3Sn2hX4x/DOp3oPPuFeZop3u+n3rYRTOa16OtS+7twwSq9tdSn7WDu5hpURmgOkuzoQBH0CwKjlKqeI+PubA+XJLEGnVkZWTy2TK8O31cR7Npwo/uxfnazg4fP53k4oaStQ8qqd6v/qN/l+FnGlpZUQo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789816346; c=relaxed/simple;
	bh=i3xVMxWyB/JSXXPTkUwQx0reZOtQuy3afJVOp1vI68U=;
	h=Date:To:From:Subject:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=Pd2sKV/iVNMMmMdOBNaSgJICfAdDydg0SVi7P7XVESzfmsGfkBAa1RqznXS6Mk07Fk06oSSzDh0TM+/DiwZ5B4dlvJVa+gapzCkbv2z9C1NUE5awMc9Bml126z+OSTshGLbgmcH23OS7+kLWoHpIFHG6oKK1aOGX5e16mS8acoA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=proton.me; spf=pass smtp.mailfrom=proton.me; dkim=pass (2048-bit key) header.d=proton.me header.i=@proton.me header.b=IRChKcRO; arc=none smtp.client-ip=109.224.244.30
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=proton.me
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=proton.me
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=proton.me header.i=@proton.me header.b="IRChKcRO"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=proton.me;
	s=uafqjtnu75hqtnbyybjhq6zr7a.protonmail; t=1789816323; x=1790075523;
	bh=OupkCXI+i+c/SIn0RgYOZeNwtNF1rm1X6C0RHgZqaaI=;
	h=Date:To:From:Subject:Message-ID:In-Reply-To:References:
	 Feedback-ID:From:To:Cc:Date:Subject:Reply-To:Feedback-ID:
	 Message-ID:BIMI-Selector;
	b=IRChKcRO+w+X8jHOhSmXfSUVqNYyYvXYQRNMlX6N2RJAYuvjFSMntqxXSzootSEde
	 LsS5Z7U8slEB9L4t69n/pAIQpoYZVI/pWENl3yqSJF+RO9NtMATzebMnlU+uVO1TiT
	 9HNHvFIbv9iE9zzolneame4gquKlg/14pAcH5nIF9f79Ib3zu8JzCJsqP8I9fgIVeA
	 m3NATgFfhsjm8lNyfedH1Ev5/PBA6Lq/k45jnpAqUk4CdCjWzOQSzomlIU2yPLs3rh
	 P8TDIvWYhlF8m0WrCTpfrZNWC1aNfYso1b+MdTmOCa0d1jbq828cFpOj5leIi6Fva6
	 q3GKxC6UBEFdQ==
Date: Sat, 19 Sep 2026 11:12:00 +0000
To: sashiko-reviews@lists.linux.dev
From: =?utf-8?B?5a6J5a65?= <HystericalDragons@proton.me>
Subject: Re: [PATCH v7 3/3] arm64: dts: rockchip: Add devicetree for the FriendlyElec NanoPi R28S
Message-ID: <xdOa_u4x7ARXZaHLYCC6xLXrXlIzJOs8m6NhGIMGyg016PeQOBJ1y9-gl_9S-Q05GhALsVMGtqor-gM9ikh9pLjJWbp9FHGBIP3EJDCNIqs=@proton.me>
In-Reply-To: <20260919103602.E84DA1F000FF@smtp.kernel.org>
References: <20260919-r28s-upstream-v7-0-e80a6f8ef521@proton.me> <20260919-r28s-upstream-v7-3-e80a6f8ef521@proton.me> <20260919103602.E84DA1F000FF@smtp.kernel.org>
Feedback-ID: 91982645:user:proton
X-Pm-Message-ID: 6631b7ebac044e6070e1ee009d6731b9419fac0e
Precedence: bulk
X-Mailing-List: sashiko-reviews@lists.linux.dev
List-Id: <sashiko-reviews.lists.linux.dev>
List-Subscribe: <mailto:sashiko-reviews+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:sashiko-reviews+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable

These four pins are the WiFi/BT wake lines of the onboard AIC8800D80, which=
 has no upstream driver yet, so nothing references them today. They were ad=
ded on review request, since the connections are known from the schematics;=
 once a driver lands, the WiFi and Bluetooth nodes will reference them with=
 their own pinctrl-0. Making them hogs would be wrong: that would claim the=
 pins permanently and keep a future driver from using them as interrupt and=
 reset lines.

On Saturday, September 19th, 2026 at 6:36 PM, sashiko-bot@kernel.org <sashi=
ko-bot@kernel.org> wrote:

> Thank you for your contribution! Sashiko AI review found 1 potential issu=
e(s) to consider:
> - [Low] dts: unused pinctrl definitions for wifi and bluetooth pins
> --
>=20
> commit 745cf672aded254ac32cf444a084e38df95384e1
> Author: =E5=AE=89=E5=AE=B9 <HystericalDragons@proton.me>
>=20
> arm64: dts: rockchip: Add devicetree for the FriendlyElec NanoPi R28S
>=20
> This commit adds devicetree support for the NanoPi R28S router board base=
d on
> the RK3528 SoC. It shares most of its design with the NanoPi Zero2 and en=
ables
> various peripherals including SDIO, UART, and networking interfaces.
>=20
> > diff --git a/arch/arm64/boot/dts/rockchip/rk3528-nanopi-r28s.dts b/arch=
/arm64/boot/dts/rockchip/rk3528-nanopi-r28s.dts
> > new file mode 100644
> > index 0000000000000..294b66f60e47b
> > --- /dev/null
> > +++ b/arch/arm64/boot/dts/rockchip/rk3528-nanopi-r28s.dts
> [ ... ]
> > +&pinctrl {
> > +=09bluetooth {
> > +=09=09bt_wake_host: bt-wake-host {
> > +=09=09=09rockchip,pins =3D <1 RK_PB5 RK_FUNC_GPIO &pcfg_pull_down>;
> > +=09=09};
> > +
> > +=09=09host_wake_bt: host-wake-bt {
> > +=09=09=09rockchip,pins =3D <1 RK_PB4 RK_FUNC_GPIO &pcfg_pull_none>;
> > +=09=09};
> > +=09};
>=20
> [Severity: Low]
> Are these bluetooth pinctrl nodes intended to be used or configured as ho=
gs?
> They are defined here but appear to never be referenced by any device nod=
e.
> Without an explicit reference, such as a pinctrl-0 property on a device o=
r
> a hog definition, the configured pull states will not be applied.
>=20
> [ ... ]
> > +=09wifi {
> > +=09=09host_wake_wl: host-wake-wl {
> > +=09=09=09rockchip,pins =3D <1 RK_PA6 RK_FUNC_GPIO &pcfg_pull_none>;
> > +=09=09};
> > +
> > +=09=09pwr_wf: pwr-wf {
> > +=09=09=09rockchip,pins =3D <1 RK_PC2 RK_FUNC_GPIO &pcfg_pull_none>;
> > +=09=09};
> > +
> > +=09=09wl_wake_host: wl-wake-host {
> > +=09=09=09rockchip,pins =3D <1 RK_PA7 RK_FUNC_GPIO &pcfg_pull_down>;
> > +=09=09};
> > +=09};
> > +};
>=20
> [Severity: Low]
> Similarly, are the host_wake_wl and wl_wake_host nodes meant to be refere=
nced
> somewhere? Like the bluetooth pins, they are defined but do not seem to b=
e
> used by any device or set up as a hog, meaning their pull states will not=
 take
> effect.
>=20
> --
> Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260919-r28s-ups=
tream-v7-0-e80a6f8ef521@proton.me?part=3D3
> 
