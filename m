Received: from www537.your-server.de (www537.your-server.de [188.40.3.216])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9CB28404BFF;
	Thu, 13 Aug 2026 14:27:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=188.40.3.216
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1786631265; cv=none; b=fudzMHu+dKu5PCG1Yubmsl5jo2gXFylZvf9MrqArKYeXN4Ts0D9Hk6r/l5CWa611g40vudWbtKzbK8YoUrI5JYEXqKwqhxin9JmxvIyyxoUmbsISl7puEDWVlDic/aXpfM8wRguh+D2F5Ar3GkEAKPeZv5iqEa082GHK34mjbSg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1786631265; c=relaxed/simple;
	bh=hd+L0mYZvzPs4cKVM/7p2DIgqwhiCw0qUdr4O3xl84g=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=WUgsFIQ4LAxyyVQHGqrjfcIBM5i2fBaBjPP+u+dLZL8avQ/9jM2pYeIMxUH8ZUzhgQQ2zI/cCfLw3cZZ1ru2IZ5r234kefSYRXogYGkg5NgFBHjD4iL4yStDI2Ybmo88sv3URVDz7YstjLvGAFDIUA95tjndDtMJHwxIl+loIX0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=ew.tq-group.com; spf=pass smtp.mailfrom=ew.tq-group.com; dkim=pass (2048-bit key) header.d=ew.tq-group.com header.i=@ew.tq-group.com header.b=YvRM9zTV; arc=none smtp.client-ip=188.40.3.216
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=ew.tq-group.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ew.tq-group.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=ew.tq-group.com header.i=@ew.tq-group.com header.b="YvRM9zTV"
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=ew.tq-group.com; s=default2602; h=Content-Type:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:Sender
	:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID;
	bh=iNGDZlCrHiFTCzdw+CSSzOiqmmvzD8ML9pvOKdh9/cM=; b=YvRM9zTV9ZcscWwXiCO9YxPFxd
	BH7j0VYB0gT+hWK7jTWLnjoE8b1DsVx2U+u5XwwqircyYE/dTqetAJI1LM8ugsK/mmyB29OBre4Pw
	1G0Sa/BiRHHvZZ3ytN+GDSu/QLycVHNO46V4XwmWUlwssqTBCzCsKVQuyLZaf7tk84qBlHauQQlNU
	Lf4RGTUHxkoVMyeN5y4o1TUYbVsqVLS6iCYMbpLSvqesMdCmFIZo3f2FAgp5VSK49L18tgDxPzDM0
	wmjx2PmBIWOCx0j6ArRrEwnWkbsNd9XC+n+JPDXYRskR151p6+CepnNFfLOvqXxxWopns2BjeuxJv
	ovlHqiWw==;
Received: from sslproxy02.your-server.de ([78.47.166.47])
	by www537.your-server.de with esmtpsa  (TLS1.3) tls TLS_AES_256_GCM_SHA384
	(Exim 4.96.2)
	(envelope-from <alexander.stein@ew.tq-group.com>)
	id 1wuVys-000GMn-2p;
	Thu, 13 Aug 2026 16:00:27 +0200
Received: from localhost ([127.0.0.1])
	by sslproxy02.your-server.de with esmtpsa  (TLS1.3) tls TLS_AES_256_GCM_SHA384
	(Exim 4.96)
	(envelope-from <alexander.stein@ew.tq-group.com>)
	id 1wuVyt-0006wh-22;
	Thu, 13 Aug 2026 16:00:26 +0200
From: Alexander Stein <alexander.stein@ew.tq-group.com>
To: sashiko-reviews@lists.linux.dev
Cc: robh@kernel.org, conor+dt@kernel.org, devicetree@vger.kernel.org,
 Frank.Li@kernel.org, imx@lists.linux.dev
Subject: Re: [PATCH 2/2] ARM: dts: mba6ulx: Add USB hub node
Date: Thu, 13 Aug 2026 16:00:26 +0200
Message-ID: <5266525.iZASKD2KPV@steina-w>
Organization: TQ-Systems GmbH
In-Reply-To: <20260813125222.BDA121F000E9@smtp.kernel.org>
References:
 <20260813121250.3993187-1-alexander.stein@ew.tq-group.com>
 <20260813121250.3993187-3-alexander.stein@ew.tq-group.com>
 <20260813125222.BDA121F000E9@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: sashiko-reviews@lists.linux.dev
List-Id: <sashiko-reviews.lists.linux.dev>
List-Subscribe: <mailto:sashiko-reviews+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:sashiko-reviews+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset="iso-8859-1"
X-Virus-Scanned: Clear (ClamAV 1.4.3/28091/Thu Aug 13 08:25:54 2026)

Am Donnerstag, 13. August 2026, 14:52:22 CEST schrieb sashiko-bot@kernel.or=
g:
> Thank you for your contribution! Sashiko AI review found 1 potential issu=
e(s) to consider:
> - [High] I2C GPIO expander used as reset-gpios for onboard_usb_dev causes=
 PM phase mismatch, breaking reset timing during resume.
> --
>=20
> --- Patch [2]: [PATCH 2/2] ARM: dts: mba6ulx: Add USB hub node ---
> commit 52d9db850f98165215d9ab4ba1bee0bd2993c73e
> Author: Alexander Stein <alexander.stein@ew.tq-group.com>
>=20
> ARM: dts: mba6ulx: Add USB hub node
>=20
> This commit replaces a fixed regulator previously used for USB hub reset =
with
> a proper onboard USB hub device node that utilizes reset-gpios.
>=20
> > diff --git a/arch/arm/boot/dts/nxp/imx/mba6ulx.dtsi b/arch/arm/boot/dts=
/nxp/imx/mba6ulx.dtsi
> > index 244376b38835a..322fbd82531e6 100644
> > --- a/arch/arm/boot/dts/nxp/imx/mba6ulx.dtsi
> > +++ b/arch/arm/boot/dts/nxp/imx/mba6ulx.dtsi
>=20
> [ ... ]
>=20
> > @@ -379,10 +369,18 @@ &usbotg1 {
> >  /* 7-port usb hub */
> >  /* id, pwr, oc pins not connected */
> >  &usbotg2 {
> > +	#address-cells =3D <1>;
> > +	#size-cells =3D <0>;
> >  	disable-over-current;
> > -	vbus-supply =3D <&reg_otg2vbus_5v0>;
> >  	dr_mode =3D "host";
> >  	status =3D "okay";
> > +
> > +	hub_2_0: hub@1 {
> > +		compatible =3D "usb424,2517";
> > +		reg =3D <1>;
> > +		reset-gpios =3D <&expander_out1 0 GPIO_ACTIVE_LOW>;
>                 ^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^
>=20
> [Severity: High]
> Does using an I2C GPIO expander for the onboard USB hub reset cause a PM =
phase
> mismatch during system suspend and resume?
>=20
> The onboard_usb_dev driver uses suspend_late() and resume_early() power
> management operations, while standard I2C GPIO expanders typically use no=
rmal
> suspend() and resume() operations.
>=20
> During system suspend, the expander suspends first (in the suspend phase)=
 and
> puts its regmap into cache_only mode. When the hub driver suspends later =
in
> suspend_late(), its reset GPIO assertion is merely cached.
>=20
> During system resume, the hub driver attempts to deassert the reset in
> resume_early() and waits for power_on_delay_us. Because the expander is
> still in cache_only mode, the physical pin remains unchanged.=20
>=20
> Later, during the normal resume phase, the expander finally syncs its cac=
he
> to hardware and physically deasserts the reset pin. This entirely bypasse=
s the
> hub driver's power_on_delay_us wait and causes a race with the USB host
> controller, which could result in enumeration failures upon wake.

Mh, my platform doesn't support system suspend/wakeup (yet?).
So there is nothing I could test here.
On the other hand this sounds like a generic problem other if not all
platforms affected as well if the reset is attached to a GPIO expander.

Any suggestion?

Best regards,
Alexander

> > +		vdd-supply =3D <&reg_mba6ul_3v3>;
> > +	};
> >  };
>=20
>=20


=2D-=20
TQ-Systems GmbH | M=FChlstra=DFe 2, Gut Delling | 82229 Seefeld, Germany
Amtsgericht M=FCnchen, HRB 105018
Gesch=E4ftsf=FChrer: Detlef Schneider, R=FCdiger Stahl, Stefan Schneider
http://www.tq-group.com/


