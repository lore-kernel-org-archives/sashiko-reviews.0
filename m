Received: from smtp6-g21.free.fr (smtp6-g21.free.fr [212.27.42.6])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 12B0148F855;
	Mon,  7 Sep 2026 18:20:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=212.27.42.6
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788805212; cv=none; b=BBwwQeccz1cOXiOy3J21cC0soF19Z04fZdWmx9PD/Y/g75Y2EfSgn7uKM2DTdeOn8i/jrlnUaVlo8x66F/dH14kNqY3Ly7WjnHQpTzUroQLW+BTqdheKflbfLZlHh2Yf/a5l/p/K6cK6vjhkxGn6vUm2XSMzwf0GVHzo/ilk9io=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788805212; c=relaxed/simple;
	bh=lWWVxHlMVQqMvYK/lm+Q29GhKlehfh7yw4SSYMvALm4=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=p5he5ghG3IkAIAuuzirzxGcIlHjhNC6XXArutHVpw8QKlwalGAPmGi2ZI5xxboGNAb3qq1LNxJYzh9J4zc+u0ULtYMFAU8/+OSOPWMS5fOulrl2UKUeNx1F1ADVhwtqsOET7TtjDRCqO18Qqk766X/orqZ5nlA4/z7ETz5uNGOI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=free.fr; spf=pass smtp.mailfrom=free.fr; dkim=pass (2048-bit key) header.d=free.fr header.i=@free.fr header.b=KPRVAslj; arc=none smtp.client-ip=212.27.42.6
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=free.fr
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=free.fr
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=free.fr header.i=@free.fr header.b="KPRVAslj"
Received: from L30177.local (unknown [213.36.7.12])
	(Authenticated sender: vjardin@free.fr)
	by smtp6-g21.free.fr (Postfix) with ESMTPSA id BF28778035B;
	Mon,  7 Sep 2026 20:19:58 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=free.fr;
	s=smtp-20201208; t=1788805204;
	bh=lWWVxHlMVQqMvYK/lm+Q29GhKlehfh7yw4SSYMvALm4=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=KPRVAsljlmmqzX+kezsgDnonBWoCg+n1WTi39dvd83Dowgus1dpSF06iAt5NGXHaY
	 LuA0wBkd3hhjiCkODihzFTX6Xeio9bfuLd9KMhEe6NYTm0lHlXA6mkYdmLsUm1ImqZ
	 s7F1vJt2l1q2rZNoTr0BNLVTZkdL4bh1P9DRbDmBqG1vqtKePp64X59+v1u4mX6YwB
	 ODvCRcr8ZvmXbBbVNyWfyXLQejKkadrf2vIyC85WthK0CRo925Vru81HZyw+Cz+ga7
	 dMpDzgegYXZI1W31vBG343eQKKXLOdk3IKn01eO0Q+BmImQI0vtgjSBms9R5gQp3af
	 7Nl0GlL7q/tSQ==
Date: Mon, 7 Sep 2026 20:19:57 +0200
From: Vincent Jardin <vjardin@free.fr>
To: sashiko-reviews@lists.linux.dev
Cc: imx@lists.linux.dev, robh@kernel.org, conor+dt@kernel.org,
	devicetree@vger.kernel.org, Frank.Li@kernel.org
Subject: Re: [PATCH v2 3/3] arm64: dts: freescale: add Nodebox v3 CPU Module
Message-ID: <ap8ATXP7euKUDkPM@L30177.local>
References: <20260907-for-upstream-nbxv3-dts-v2-0-6b4afd36180b@free.fr>
 <20260907-for-upstream-nbxv3-dts-v2-3-6b4afd36180b@free.fr>
 <20260907172657.D72AE1F00A3A@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: sashiko-reviews@lists.linux.dev
List-Id: <sashiko-reviews.lists.linux.dev>
List-Subscribe: <mailto:sashiko-reviews+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:sashiko-reviews+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20260907172657.D72AE1F00A3A@smtp.kernel.org>

Hi M. Bot,

I'll submit a v3 update tomorrow.

See below for the few other topics,

> > +&fspi {
> > +	pinctrl-names = "default";
> > +	pinctrl-0 = <&fspi_dqs_sck_cs10_pins>, <&fspi_data30_pins>;
> > +};
> 
> [Severity: High]
> Does this pinmux configuration conflict with the thermtrip-hog defined on gpio1
> pin 23?
> 
> During boot, the pin controller configures the RCWPMUXCR0 register (via
> fspi_dqs_sck_cs10_pins) to route pins 20-23 to the FSPI (XSPI1) controller en
> masse. Concurrently, the GPIO driver applies the thermtrip-hog to pin 23 in
> fsl-lx2160a-nbxv3.dtsi, attempting to drive it low as a GPIO.

Correct, it is something I should have cleaned sooner. I'll be removed into the
next update.

> > +&emdio1 {
> > +	status = "okay";
> > +
> > +	/* Microchip LAN8023 dual 10G PCS/retimer, Clause 45 only, one address per slice */
> > +	lan8023_phy_s0: ethernet-phy@2 {
> > +		compatible = "ethernet-phy-ieee802.3-c45";
> > +		reg = <2>;
> > +	};
> 
> [Severity: Medium]
> Will this force the kernel into an inefficient polling mode for the Ethernet
> PHYs?
> 
> The hardware possesses dedicated interrupt lines for the PHYs, as the gpio2
> node explicitly defines the line names 'lan8023-mdint' and
> 'u1300-rtl8211fd-int#'. Without interrupts and interrupt-parent properties in
> the PHY nodes (lan8023_phy_s0, lan8023_phy_s1, and rtl8211fd), the PHY driver
> will fall back to periodically polling the MDIO bus to check for link state
> changes.

The lines do exist and gpio2 is an interrupt-controller, so this can be
added. I'd prefer to keep it for a future update.

> [Severity: Medium]
> Should this node also include a reset-gpios property to ensure the PHY is
> properly initialized?
> 
> The u800 I2C GPIO expander explicitly defines line 15 as 'lan8023-rst'.
> Without claiming this GPIO (e.g., reset-gpios = <&u800 15 GPIO_ACTIVE_LOW>),
> the Ethernet driver will not execute a hardware reset sequence during probing,
> leaving the hardware dependent on the state the bootloader left it in and
> potentially failing to recover from a suspended state.

It is a single reset shared by both slices of the one LAN8023, so it cannot be
claimed by both.
The reset is owned by the bring-up userland application of the lan8023.

> > +&fspi {
> > +	status = "okay";
> > +
> > +	/* GigaDevice GD55LB02GF, 256 MiB boot NOR */
> > +	flash@0 {
> > +		compatible = "jedec,spi-nor";
> > +		reg = <0>;
> > +		#address-cells = <1>;
> > +		#size-cells = <1>;
> > +		spi-max-frequency = <150000000>;
> > +		spi-rx-bus-width = <1>;
> > +		spi-tx-bus-width = <1>;
> > +	};
> > +};
> 
> [Severity: Medium]
> Does this artificially restrict the FSPI flash to a 1-bit bus width despite the
> hardware being wired for 4-bit Quad SPI?
> 
> The pinctrl-0 property in the .dts file includes <&fspi_data30_pins>, which
> configures four data lines (DATA[3:0]) for the FSPI controller. However, this
> flash@0 node sets the spi-rx-bus-width and spi-tx-bus-width to 1. This mismatch
> forces the SPI NOR flash driver to operate in single-bit mode rather than
> quad mode, needlessly degrading I/O performance.

Deliberately on purpose for this board ! for the time being.

Thanks,
  Vincent
 
> -- 
> Sashiko AI review · https://sashiko.dev/#/patchset/20260907-for-upstream-nbxv3-dts-v2-0-6b4afd36180b@free.fr?part=3
