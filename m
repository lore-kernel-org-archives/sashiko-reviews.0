Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=165.173.180.11
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1795707830;
	b=HrGO71gQF7+sCLyLRBVlnFdRvMjqhZl7QuIX/P0wYzt20Gcv/1Oy682zK5U0qPxsCNv+
	 bwLR8P3a6GI9shAw61GT3lNxOAKhc2AtO7didoUdGLP2f3YV5jbo6v3whNVR70IKUK/RU
	 0h3fEko0xfojNOw+AlQHnvE+SOdwKJ/uUvhE6F9psYaN0i1GiNuXpbKMuba7yHRuCYZvm
	 kQCXnXmzFB/gxONN/Alirg5z1RRii/qxM2S3xcpqVxFvNYkzLlYQ5MwTfoqjueY8w1WhI
	 nCeTb3fPx3EDY1E3LYbUJ4qSrvmwthHPrH3GU4+xaH2bsSxDgaUK5TJ5MH3oisPJ5kQ==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795707830;
	h=DMARC-Filter:DKIM-Signature:Received:Received:Date:From:To:Cc:
	 Subject:Message-ID:References:MIME-Version:Content-Type:
	 Content-Disposition:In-Reply-To:X-Zoho-Virus-Status:X-Zoho-AV-Stamp:
	 X-ZohoMailClient;
	bh=OM1CR4VZ1XRCf4Mb1JBeSkMUVIqv4QjfpnGFdkXKa8Q=;
	b=2w7+fMpPOHeYiWrcEkDig5apl2IX2GoD6MKjCzJUg0r+hUMITcimBTDkdpZYxk+vOXFr
	 9l/84UmE0H2oAJ21nvqz3hi901lGIqRVERb7taHdq2IwPkYB+R7z8/b2MFU3zG6xT9uf5
	 sovU4qp/V86OJH4fJ9QT1xHeDM/XbGkWFhzelH7C7e8QRbowKx5jYIOkUGyF095xIaps1
	 i2ZbBA2wXzYsrX7CC+q+IULGnsfo1rV21vPyW89Ldp/X32N8RGZut82b0ms3RKzPUkFt9
	 TOWGpQ71ym521bHpdJ+bT19iNzYipz5juzOsQ0wR7wYkvRh9fSSVeMw5OaMhscL8b+g==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=collabora.com;
	spf=pass smtp.mailfrom=collabora.com;
	dkim=pass header.d=collabora.com header.i=@collabora.com header.a=rsa-sha256 header.s=zohomail header.b=hkfMt+f0;
	arc=pass header.oldest-pass=0 smtp.remote-ip=165.173.180.11
Received: from sender6-op-o11.zoho.com (sender6-op-o11.zoho.com [165.173.180.11])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B130A606A31E
	for <sashiko-reviews@lists.linux.dev>; Thu, 26 Nov 2026 15:43:49 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org B130A606A31E
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=collabora.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=collabora.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key, unprotected) header.d=collabora.com header.i=@collabora.com header.a=rsa-sha256 header.s=zohomail header.b=hkfMt+f0
ARC-Seal: i=1; a=rsa-sha256; t=1795707813; cv=none; 
	d=zohomail.com; s=zohoarc; 
	b=jOrsV/EdgIHFpYnQu9qAN/y/+fkunJ0aK2dkgBvSwZlb97IX9uiOEX2oLfKPpe5VANYPPt07jMyVysA9mKldtmWot06i1A6ZxHM2SBfNbkdC86Z8jdaufrAa+Ppb2D9dRmKgfviNWW6OguFOv2Y6WlOiyXBoSMEPxbzo5OAbR5k=
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=zohomail.com; s=zohoarc; 
	t=1795707813; h=Content-Type:Cc:Cc:Date:Date:From:From:In-Reply-To:MIME-Version:Message-ID:Subject:Subject:To:To:Message-Id:Reply-To; 
	bh=OM1CR4VZ1XRCf4Mb1JBeSkMUVIqv4QjfpnGFdkXKa8Q=; 
	b=UZc7pslD1B3jXtk2IpNK1bLzSza2YVFdwLmo2DXlOe6J8fpbnsqpO7mYJ+CFStHiqiWs95/90yc/8g3eolbbbM3k/auJIR1u70EAJNyVYGvgRAqpIG54ecHJcnyxUU/kxWz+WQK+kzuUYOYztlMZxJDTuUP85YFPM4GZJ96LSJ8=
ARC-Authentication-Results: i=1; mx.zohomail.com;
	dkim=pass  header.i=collabora.com;
	spf=pass  smtp.mailfrom=sebastian.reichel@collabora.com;
	dmarc=pass header.from=<sebastian.reichel@collabora.com>
DKIM-Signature: a=rsa-sha256; b=hkfMt+f0WZjr9Vz4C6sAA0F5d05Gb2/exmfkRem+8Ub1X0TBmbP3nQDpt1xG7y4ItEsi9oqW/1DdEKrY2v9b/xwiFNmYayyiQCnWRJ5O8+vv/T0SLV2Jae5X8466nPg8SeJf9xQU8uvGWAl22X/Nby/Mu8tntzwTY5zpkMvh0ck=; c=relaxed/relaxed; s=zohomail; d=collabora.com; v=1; bh=OM1CR4VZ1XRCf4Mb1JBeSkMUVIqv4QjfpnGFdkXKa8Q=; h=Content-Description:Content-ID:Content-Type:Content-Transfer-Encoding:Cc:Date:From:In-Reply-To:List-Subscribe:List-Post:List-Owner:List-Id:List-Archive:List-Help:List-Unsubscribe:MIME-Version:Message-ID:Resent-Sender:Resent-Cc:Resent-Date:Resent-To:Reply-To:Resent-Message-ID:Resent-From:Sender:Subject:To:Date:From:Message-Id:Reply-To:Subject:To:Cc;
Received: by smtp.zohomail.com with SMTPS id 1795707762336858.7605108291161;
	Thu, 26 Nov 2026 07:42:42 -0800 (PST)
Received: by venus (Postfix, from userid 1000)
	id C8EE31804FF; Thu, 26 Nov 2026 16:41:54 +0100 (CET)
Date: Thu, 26 Nov 2026 16:41:54 +0100
From: Sebastian Reichel <sebastian.reichel@collabora.com>
To: sashiko-reviews@lists.linux.dev
Cc: linux-clk@vger.kernel.org, devicetree@vger.kernel.org, robh@kernel.org, 
	conor+dt@kernel.org
Subject: Re: [PATCH v3 5/6] arm64: dts: rockchip: add dfi clocks on RK3588
Message-ID: <awhS3yryw6H-qaug@venus>
References: <20261126-dfi-clocks-and-rk3576-support-v3-0-0f33c1b8df48@collabora.com>
 <20261126-dfi-clocks-and-rk3576-support-v3-5-0f33c1b8df48@collabora.com>
 <sashiko-outbox-235767@kernel.org>
X-Mailing-List: sashiko-reviews@lists.linux.dev
List-Id: <sashiko-reviews.lists.linux.dev>
List-Post: <mailto:sashiko-reviews@lists.linux.dev>
List-Help: <mailto:sashiko-reviews+help@lists.linux.dev>
List-Subscribe: <mailto:sashiko-reviews+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:sashiko-reviews+unsubscribe@lists.linux.dev>
List-Owner: <mailto:sashiko-reviews+owner@lists.linux.dev>
Precedence: list
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="a2jkuf37hasnfdu7"
Content-Disposition: inline
In-Reply-To: <sashiko-outbox-235767@kernel.org>
X-Zoho-Virus-Status: 1
X-Zoho-AV-Stamp: zmail-av-0.2.13.1.5.4/295.700.99
X-ZohoMailClient: External


--a2jkuf37hasnfdu7
Content-Type: text/plain; protected-headers=v1; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable
Subject: Re: [PATCH v3 5/6] arm64: dts: rockchip: add dfi clocks on RK3588
MIME-Version: 1.0

Hi,

On Thu, Nov 26, 2026 at 03:01:57PM +0000, sashiko-bot@kernel.org wrote:
> Thank you for your contribution! Sashiko AI review found 1 potential
> issue to consider:
> - [Medium] arm64: dts: rockchip: rk3588 dfi clocks violate
>   rockchip,dfi.yaml binding
> --
>=20
> commit 01f5bc0587cdc7770b7d81ff68f46ba8e1c4c5c1
> Author: Nicolas Frattaroli <nicolas.frattaroli@collabora.com>
>=20
> arm64: dts: rockchip: add dfi clocks on RK3588
>=20
> This commit adds four per-channel DFI monitor clocks to the dfi@fe060000
> node in rk3588-base.dtsi.
>=20
> > diff --git a/arch/arm64/boot/dts/rockchip/rk3588-base.dtsi b/arch/arm64=
/boot/dts/rockchip/rk3588-base.dtsi
> > index d0f364547ae55..ef0ff6555fba3 100644
> > --- a/arch/arm64/boot/dts/rockchip/rk3588-base.dtsi
> > +++ b/arch/arm64/boot/dts/rockchip/rk3588-base.dtsi
> > @@ -2190,6 +2190,10 @@ qos_vop_m1: qos@fdf82200 {
> >  	dfi: dfi@fe060000 {
> >  		reg =3D <0x00 0xfe060000 0x00 0x10000>;
> >  		compatible =3D "rockchip,rk3588-dfi";
> > +		clocks =3D <&cru PCLK_DDR_MON_CH0>, <&cru PCLK_DDR_MON_CH1>,
> > +			 <&cru PCLK_DDR_MON_CH2>, <&cru PCLK_DDR_MON_CH3>;
> > +		clock-names =3D "pclk_ddr_mon_ch0", "pclk_ddr_mon_ch1",
> > +			      "pclk_ddr_mon_ch2", "pclk_ddr_mon_ch3";
>=20
> [Severity: Medium]
> Does this violate Documentation/devicetree/bindings/devfreq/event/rockchi=
p,dfi.yaml?
>=20
> The schema currently allows only a single clock named pclk_ddr_mon:
>=20
> Documentation/devicetree/bindings/devfreq/event/rockchip,dfi.yaml {
>     ...
>   clocks:
>     maxItems: 1
>=20
>   clock-names:
>     items:
>       - const: pclk_ddr_mon
>     ...
> }
>=20
> Without the corresponding binding update, dtbs_check fails for all RK3588
> device trees that include rk3588-base.dtsi.

This is a false positive. Sashiko is missing the DFI patch series,
which just got merged today as mentioned in the cover letter.

Greetings,

-- Sebastian

--a2jkuf37hasnfdu7
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCgAdFiEE72YNB0Y/i3JqeVQT2O7X88g7+poFAmsIUz4ACgkQ2O7X88g7
+pqEeA//VfiLt/n+iz1i7f3gbyfJ4sUg6srVA53WVfa2j+iKkg68qpcOuJjksyMX
ecaQd0bSJjV+vwsTcoRKMrVPuBkbqOZIL0Mn7QtLKmy9cxhTRhRPep8rzgrtZGSI
eW9BUoFnii1pm5URwAdak6V/VUd8nrfeeivsOCrQ+tn3ZQHmCkWkVeh8sAGWjGcg
tv9ABySWpZgeGPO4f023L1qs6MY3xHtQKUJmowavqfPaXz3xxVkXwGYrYi0wVQ+D
9l3l1UFDIBrs6sCns8ppf2diLjuRSwMv0m6lriK6do/Jfn5I2haigGos/wl94hsc
R+haq4DBJpjYYPCbOjMdB7zPO95pd9rbKf4pVZUci8BWfwbjxjNWrL97S7vg6RvJ
u21QZkXZE1cq6YufEArk8IvlUb31t+ri+yud8FxU6kP3Pqz3qrOgxp0i/e8maEtQ
bfDqF1Vj7JQQ9phj8xxsikfRBdkx2Hi2mQ6gyW+4eXXWsYbU2SKg0Me075zj2mqu
T396j7XI6zw91krsRCg7AFENJFA536ffqZ1c8EHHBDw2SNLvVzJ1bfsh/XG8KQ2s
zfx7+o+o81vXrbj6Li7ij1D77G0J4LjRE9FSS8mz/fWAtrFTbEP9p4QVNS6lFFGv
ZjEB5LH9BnOsBPOyMVs4hBa8mD7xaSili21aSzZkTrmdfEUFh2U=
=CXjp
-----END PGP SIGNATURE-----

--a2jkuf37hasnfdu7--
