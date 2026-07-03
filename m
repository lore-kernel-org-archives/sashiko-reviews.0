Received: from mail-wr1-f53.google.com (mail-wr1-f53.google.com [209.85.221.53])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 986282EEE85
	for <sashiko-reviews@lists.linux.dev>; Fri,  3 Jul 2026 16:05:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.53
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783094742; cv=none; b=ioHxx98tK/4GcSNz/Vb8ui8lf+MndsKfmQMT77BgNf232/PdQ6+AP/Uey0uwewLTBi55EIK2750eZyK+o5PDLrtC7q5ezGCwNOnLRQynC1o8oFdJUWM1/38qEltnpsxyummnbUwaxPAEzxpdClJobD7pGIMZRmGf/XHSzI4rSsE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783094742; c=relaxed/simple;
	bh=nxkcFikcEeVEtozP6ZBj6n7TjnOotZnihpA5wQ6V/A4=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=egYnm3gbm8vwiP9p/69FcSATwlKhLL3OMA2DnfKrhAR+bllZZCGPOGDNinXXHo6B88u10kdA9dk0Dgbh2Bi4eGwUA0GJlzV5RH/7yNaxVfyQXGeEMrFQEpyndyXp0srp3TaHxnub3kWnUacsobkcwLHL4R5AqstBe4WRredZRco=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=KZDGzCbu; arc=none smtp.client-ip=209.85.221.53
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="KZDGzCbu"
Received: by mail-wr1-f53.google.com with SMTP id ffacd0b85a97d-47122683cf3so519993f8f.0
        for <sashiko-reviews@lists.linux.dev>; Fri, 03 Jul 2026 09:05:37 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1783094736; x=1783699536; darn=lists.linux.dev;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date:from:to
         :cc:subject:date:message-id:reply-to;
        bh=uoqOq6Ohkp4UDA6vDyVnbIPla9jVgl3DiZga84x8Hms=;
        b=KZDGzCbu+nxB2/7eeVLv9x0E6G5RBHuwHzFZHPu6h7qeQcvaEiu3sP0oP1I+CTElut
         96qk758gQPWw5L448rSFb7JAUVyxswJcy0eXW9MRcsA/7OHXsiJwbnZNPVAtQT0Ri7Xn
         n15kn7PVKXSlV/bp02BJOw90TcGm5BMG69BuHCmE7wZdr3pdJDAqfFjhDGcJGHckmtCf
         9dabqRrAEWEa1boAEY3g9gYm/LxNjlaboF3ZgqBLzv9Lj7mksB3cbWGJeD1Gt4TnOCcs
         b6juGhJVBYNqsL6wtWyn4FRJX0iRVAumEjBExFTmgd7vqI/Sxk9imTRv88bUWharnUB+
         xlcg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1783094736; x=1783699536;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=uoqOq6Ohkp4UDA6vDyVnbIPla9jVgl3DiZga84x8Hms=;
        b=ZEON50846j5qa2b7+rYCqGPOa14M7H1i9rLK35fPbYPs5DUFrikPamYZ7ti9dKAl/r
         r99cymLz1tmnuTStOY51ZaObNV+f0qqJj0v4kkhWgWuR+TOm9YtiycqBVRVy4sDxIElI
         7Ar2Sr8WsxVEQFRQrWmUVhgD+yNj/ALlMffcKQ8moLYfMMUOYOE2n23UgaYT266XReqE
         aS5zaznZJ2aTsFLTA/kcOinwNODzmlBZ/VMxdTrTBLQznRgoUk1Bh7BoK6eFKHjmuNWf
         UFCmBu+CgNpF5gYaa7n1VxeAc2MSiw+N13ipLGD+p9CMhvZD7HXDb7grtVZOuxerFXWM
         zxTw==
X-Gm-Message-State: AOJu0YzkrJ7g+tXlKVyJJFd1l7RfZnii1zVsGf1smWZBiSvYKqqwbV+U
	o0MSpBVdk6u6MCWh2mygdIAg2KLeGEHExG53uykVT/k/Ziy6r9Ck4qwsTefQqA==
X-Gm-Gg: AfdE7cnqMille5kwZR/pZrS1eVgkXGMRpnxq0V6Mi3ioRc3X6hf09LpXq0xD9YTJUuf
	YIPepfX6/oIXC0JKYposxDjIts9dmEbuuK0HrXEOMJM6WphciCAU7vrwJSylvlIXj7BucOrSveo
	mY7vMbObVH1SrMvo9sq7BYRInIZaga3aFf+2HiiYSCTc+CXt7LWccNVVIk9jTVErOTGKxMBpeby
	1/L9IfYREi8ZpHm4AP8wQb9z6UtczjbP5VmxlSpalBAlnSxqef4NspLcp5v96dFVFw9t+LHAiFC
	PEJQzSYBMCbJRFp4bcFGh4qHV56PXDCLAqpoHGhL0/kk8USYEUKewhzQa49GlbdKbiUlppGf/5q
	aSOdCczRM31u7T0fgwncfZpo7BBPSnMQ+rhwXxs2woer14VFqe933dNG8L7W7L1gpHTz5vO5fR/
	RpWFec56sEdgbu6mO3Di/6iVCabrlnbS1o4mggAMLkaYiclsnopfarqgMz1tfU7BVZMwq0CTWIX
	Tr4sju9quZi149YVdrizvXFhXrgUO8fumOTiGb03R2P
X-Received: by 2002:adf:e00b:0:20b0:477:47c6:36e5 with SMTP id ffacd0b85a97d-47758cbf3c6mr11636302f8f.25.1783094735669;
        Fri, 03 Jul 2026 09:05:35 -0700 (PDT)
Received: from Lord-Beerus.station (net-93-144-65-248.cust.vodafonedsl.it. [93.144.65.248])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-47aa0f21328sm316945f8f.32.2026.07.03.09.05.34
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 03 Jul 2026 09:05:35 -0700 (PDT)
Date: Fri, 3 Jul 2026 18:05:32 +0200
From: Stefano Radaelli <stefano.radaelli21@gmail.com>
To: sashiko-reviews@lists.linux.dev
Cc: devicetree@vger.kernel.org, Frank.Li@kernel.org, conor+dt@kernel.org,
	robh@kernel.org, imx@lists.linux.dev
Subject: Re: [PATCH v1 1/1] arm64: dts: freescale: imx9-var-dart-sonata: fix
 Ethernet PHY configuration
Message-ID: <akfdzMdw56G0A3UU@Lord-Beerus.station>
References: <20260703152731.236793-1-stefano.r@variscite.com>
 <20260703154139.8AF511F000E9@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: sashiko-reviews@lists.linux.dev
List-Id: <sashiko-reviews.lists.linux.dev>
List-Subscribe: <mailto:sashiko-reviews+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:sashiko-reviews+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20260703154139.8AF511F000E9@smtp.kernel.org>

Hi,

On Fri, Jul 03, 2026 at 03:41:38PM +0000, sashiko-bot@kernel.org wrote:

> > +		regulator-always-on;
> > +	};
> [ ... ]
> > @@ -139,9 +150,6 @@ mdio {
> >  		ethphy1: ethernet-phy@1 {
> >  			compatible = "ethernet-phy-ieee802.3-c22";
> >  			reg = <1>;
> 
> [Severity: High]
> Since the explicitly linked reset-gpios property was removed below, shouldn't
> there be a corresponding phy-supply = <&reg_phy1_supply>; link here to maintain
> the device link dependency?
> 
> Without this link, fw_devlink no longer sees any dependency between the
> Ethernet subsystem and the GPIO expander. Could the MAC driver probe and scan
> the MDIO bus before the I2C GPIO expander (pca6408_2) and the new always-on
> regulator are initialized, resulting in get_phy_device() failing with -ENODEV?

I did try modelling this GPIO as a PHY supply using phy-supply, but
that configuration does not work correctly on these boards.
The PHY is still not detected reliably during boot.

> [Severity: Medium]
> Does this same reduction to a 10ms startup delay also risk initialization
> failure here?
> 

the startup-delay-us value is intentionally set to 10 ms.
This delay reflects the enable timing of the board-level signal and is
not intended to match the previous reset-deassert-us delay, as the
signal is no longer being used as a reset.

> > +		regulator-always-on;
> > +	};
> [ ... ]
> > @@ -180,9 +191,6 @@ mdio {
> >  		ethphy1: ethernet-phy@1 {
> >  			compatible = "ethernet-phy-ieee802.3-c22";
> >  			reg = <1>;
> 
> [Severity: High]
> Does this node also need a phy-supply = <&reg_phy1_supply>; property to prevent
> the probe race condition described above?

I did try modelling this GPIO as a PHY supply using phy-supply, but
that configuration does not work correctly on these boards.
The PHY is still not detected reliably during boot.

> 
> > -			reset-assert-us = <15000>;
> > -			reset-deassert-us = <100000>;
> > -			reset-gpios = <&pca6408_2 0 GPIO_ACTIVE_LOW>;
> >  
> >  			leds {
> >  				#address-cells = <1>;
> [ ... ]
> > diff --git a/arch/arm64/boot/dts/freescale/imx95-var-dart-sonata.dts b/arch/arm64/boot/dts/freescale/imx95-var-dart-sonata.dts
> > index 7a58ad38ffb46..ccf7e77016e48 100644
> > --- a/arch/arm64/boot/dts/freescale/imx95-var-dart-sonata.dts
> > +++ b/arch/arm64/boot/dts/freescale/imx95-var-dart-sonata.dts
> [ ... ]
> > @@ -346,9 +346,6 @@ &netc_emdio {
> >  	ethphy1: ethernet-phy@1 {
> >  		compatible = "ethernet-phy-ieee802.3-c22";
> >  		reg = <1>;
> 
> [Severity: High]
> Does this PHY node also require a phy-supply property to maintain its
> dependency ordering after the reset-gpios removal?
> 

I did try modelling this GPIO as a PHY supply using phy-supply, but
that configuration does not work correctly on these boards.
The PHY is still not detected reliably during boot.

> > -		reset-gpios = <&pca6408_2 0 GPIO_ACTIVE_LOW>;
> > -		reset-assert-us = <10000>;
> > -		reset-deassert-us = <100000>;
> >  
> >  		leds {
> >  			#address-cells = <1>;
> 
> -- 
> Sashiko AI review · https://sashiko.dev/#/patchset/20260703152731.236793-1-stefano.r@variscite.com?part=1
