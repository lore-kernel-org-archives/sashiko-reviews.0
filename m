Received: from gloria.sntech.de (gloria.sntech.de [185.11.138.130])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B018F305673;
	Thu, 16 Jul 2026 18:31:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=185.11.138.130
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784226705; cv=none; b=T7foVz9rWbpS5TTF/AyrtgvXJ1aab53IJiiaz+JIF4VgajXYbt5HYX8F25IVz67KvaGaNf/ODL7SDYAGYJfEnq03yliaesXIM8C9Xp4p21Pd5fabXJaG/ZGraTX+xdUS2s1B3yXumamVYe4gACUb+WElc5LxUt7mUZKSEQO9IW0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784226705; c=relaxed/simple;
	bh=u8ir4JtwzD2lv/9BTFxfHgEQiLyjLOeSAAWYC0y3cRk=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=SNTqi7oou0x/LSDFuqVtWWyyvYPlIxdq0EPgAwQpagh2MMEJsvRsAD81/LHWozZuYpq+pQsIwlMzt5ZUxH9CXaWmvympKETAljz4rmaURiSSQPQJ8r6f6+2KGHu/YXklQnQkvtBGLw4sgo+NePrO0yG0LscAd0nnGKj86irYc54=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=sntech.de; spf=pass smtp.mailfrom=sntech.de; dkim=pass (2048-bit key) header.d=sntech.de header.i=@sntech.de header.b=HDq4JOfU; arc=none smtp.client-ip=185.11.138.130
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=sntech.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=sntech.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=sntech.de header.i=@sntech.de header.b="HDq4JOfU"
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sntech.de;
	s=gloria202408; h=Content-Type:Content-Transfer-Encoding:MIME-Version:
	References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:Reply-To;
	bh=Dw3v8YNqvr+JafReR5Z5Q1bvgBUca6l2zWI8zP4bBuI=; b=HDq4JOfUdqiH4joBS0lJcZlMYa
	VABto7cXTjoKVWfwsWbgMymrXvMVXLi7ZVdcBZyp1EryW6hyaDTYuvDV1p4hhLNvXkMIxDsFXXD/6
	xHBPeDOkVNqZ/fmjcnb94YDg7O5K50IXaqXS8oS4pVbIWw8TJZF2x7BesSwnIY24mPagQQ2EApzkZ
	cf5q/WVDrB54xvMi+jCBAoq8qEpz2cXYI3v8/6JRfcrHfF0Nx31SX3rK3MIKah2vh0XrOiObKh+Q3
	QpAMP+RWPl+6PIoqaeShlMffHVv/yxbNN68VgtKAunk6k8wXM1VIiFPeix91nUihaPsbHurO7ysFt
	qM7tl9jA==;
From: Heiko Stuebner <heiko@sntech.de>
To: sashiko-reviews@lists.linux.dev,
 Joachim Eastwood <joachim.eastwood@gmail.com>
Cc: conor+dt@kernel.org, devicetree@vger.kernel.org, robh@kernel.org,
 linux-rockchip@lists.infradead.org, linux-arm-kernel@lists.infradead.org,
 Diederik de Haas <diederik@cknow-tech.com>, Jonas Karlman <jonas@kwiboo.se>
Subject:
 Re: [PATCH v3 11/12] arm64: dts: rockchip: rk3588s-nanopi-r6: refactor to
 support M6 boards
Date: Thu, 16 Jul 2026 20:31:38 +0200
Message-ID: <3413772.oiGErgHkdL@phil>
In-Reply-To:
 <CAPSPb=v=ZDGJ41auxGgSOpKo69MycE=FtMyHf9sG9a3ju9PAaQ@mail.gmail.com>
References:
 <20260713-nanopi-m6-v3-0-227567ffc5dc@gmail.com>
 <20260713204131.C58091F000E9@smtp.kernel.org>
 <CAPSPb=v=ZDGJ41auxGgSOpKo69MycE=FtMyHf9sG9a3ju9PAaQ@mail.gmail.com>
Precedence: bulk
X-Mailing-List: sashiko-reviews@lists.linux.dev
List-Id: <sashiko-reviews.lists.linux.dev>
List-Subscribe: <mailto:sashiko-reviews+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:sashiko-reviews+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset="utf-8"

Hi Joachim,

Am Donnerstag, 16. Juli 2026, 11:24:20 Mitteleurop=C3=A4ische Sommerzeit sc=
hrieb Joachim Eastwood:
> On Mon, 13 Jul 2026 at 22:41, <sashiko-bot@kernel.org> wrote:
> >
> > Thank you for your contribution! Sashiko AI review found 2 potential is=
sue(s) to consider:
> > - [Medium] Unintentional restoration of `regulator-boot-on` for `vdd_np=
u_s0` during refactoring.
> > - [Low] Dangling phandle reference `&vcc5v0_usb_otg0` in the common `.d=
tsi` file.
> > --
> >
> > --- Patch [11]: [PATCH v3 11/12] arm64: dts: rockchip: rk3588s-nanopi-r=
6: refactor to support M6 boards ---
> > commit 056adff75ec08989b96f09adc0efff6c3a5d662f
> > Author: Joachim Eastwood <joachim.eastwood@gmail.com>
> >
> > arm64: dts: rockchip: rk3588s-nanopi-r6: refactor to support M6 boards
> >
> > FriendlyElec NanoPi6 series consists of four distinct boards; R6S, R6C,
> > M6 and M6V2. Refactor FriendlyElec NanoPi R6 base dtsi in preparation
> > for adding NanoPi M6 support.
> >
> > > diff --git a/arch/arm64/boot/dts/rockchip/rk3588s-nanopi.dtsi b/arch/=
arm64/boot/dts/rockchip/rk3588s-nanopi.dtsi
> > > new file mode 100644
> > > index 0000000000000..a8e532ad8b7a8
> > > --- /dev/null
> > > +++ b/arch/arm64/boot/dts/rockchip/rk3588s-nanopi.dtsi
> >
> > [ ... ]
> >
> > > +&i2c2 {
> > > +     status =3D "okay";
> > > +
> > > +     vdd_npu_s0: regulator@42 {
> > > +             compatible =3D "rockchip,rk8602";
> > > +             reg =3D <0x42>;
> > > +             fcs,suspend-voltage-selector =3D <1>;
> > > +             regulator-name =3D "vdd_npu_s0";
> > > +             regulator-min-microvolt =3D <550000>;
> > > +             regulator-max-microvolt =3D <950000>;
> > > +             regulator-ramp-delay =3D <2300>;
> > > +             regulator-boot-on;
> >
> > [Severity: Medium]
> > Is the addition of regulator-boot-on here intentional?
>=20
> Seems like I screwed up the refactoring of the code, and Sashiko caught m=
e.
> I will fix it and send out a new patch set later.
>=20
> > This appears to accidentally revert a prior fix that removed the boot-on
> > property for vdd_npu_s0 to save power during early boot.
> >
> > > +             vin-supply =3D <&vcc5v0_sys>;
> > > +
> > > +             regulator-state-mem {
> > > +                     regulator-off-in-suspend;
> > > +             };
> > > +     };
> > > +};
> >
> > [ ... ]
> >
> > > +&u2phy0_otg {
> > > +     phy-supply =3D <&vcc5v0_usb_otg0>;
> >
> > [Severity: Low]
> > Does this create a dangling phandle reference in the common dtsi file?
> >
> > Since the vcc5v0_usb_otg0 regulator was left in the board-specific
> > rk3588s-nanopi-r6.dtsi file, it looks like compiling a new board (like =
the M6)
> > that includes this common dtsi will fail to build if it doesn't also de=
fine a
> > regulator with this exact label.
>=20
> I don't think this is really an issue. Both nanopi-r6.dtsi and nanopi-m6.=
dtsi
> will have those regulators defined.
>=20
> Unless someone tells me this is bad practice I will keep this as it is.

I think this is ok. Like as you said, the regulator will be defined by
boards - just with a different gpio I guess.
And nobody expects to build the core dtsi and if another new board
materializes that does not have the otg port (and thus regulator), we'll
need to move more stuff anyway :-)


Heiko


