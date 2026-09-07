Received: from smtp6-g21.free.fr (smtp6-g21.free.fr [212.27.42.6])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7A7D548B38F;
	Mon,  7 Sep 2026 17:25:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=212.27.42.6
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788801934; cv=none; b=DlEnK1QVQZofs1t9I+R7qat9KbLq+64t5Igv4X4/uGvffYplqnesBzzQ3Ce+LuIJI3bClNyoyjtTQksAp4rlh9oM1Njw9Qdj/0hH/Ayx2o47z+pasvOqnkrPlUErh2hggDTysZ8p7wMt/87EH/nBpSz8DrgHTMOdkFCK9g/UDnk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788801934; c=relaxed/simple;
	bh=/TLJKIItMlTjALtLWIEg9pF6gOn+Sc3rV4Hz+/eULl4=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=mbUqv9BYYASxNQulyhLqMfyLu5lXqKyRPGOQ4qS0+aQ5lQDVRqeBpzTQ5tunfvMybVhxC/fS0+CTBdUUPYhnySV030XCUpiskTk4HieHvLlTmMvNH4ggf8omSQwCcWtGAtMRUeKlNYAAN5yJPzi3UEAN7KSoxpnJVfmv57seZLQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=free.fr; spf=pass smtp.mailfrom=free.fr; dkim=pass (2048-bit key) header.d=free.fr header.i=@free.fr header.b=OFKkVi2d; arc=none smtp.client-ip=212.27.42.6
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=free.fr
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=free.fr
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=free.fr header.i=@free.fr header.b="OFKkVi2d"
Received: from L30177.local (unknown [213.36.7.12])
	(Authenticated sender: vjardin@free.fr)
	by smtp6-g21.free.fr (Postfix) with ESMTPSA id C9259780504;
	Mon,  7 Sep 2026 19:25:23 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=free.fr;
	s=smtp-20201208; t=1788801929;
	bh=/TLJKIItMlTjALtLWIEg9pF6gOn+Sc3rV4Hz+/eULl4=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=OFKkVi2dZ82FfEB1KdofrdON2/mwosPY+qmA2JmgkLLiWETiLQYtlXrJBHzD7iD8Z
	 +6ABlaC6twJp5KS2CZhX35VmXENeFf5xsZKomvOkxdxo5NTg4FRXp57x0SR70skbQ6
	 wRbAy7BtUqSUv6kgOKoaw7Y0DrxWqETMYS2AvYQ+avQaLlNcC6hOiSxpiXSRbDnfwU
	 RSky9uDJ9uldHUZ/LNi3JX2Q3h/QJZpbDh3p5o9d8fc+N9U+zQj5WemLZQlL5+NEQa
	 Yc0XTvXerkIiVjOlwwel5SWi1BZix3v5Ec8tCIhn+oWbivUSxhwCgb+O2oBlvyPtt9
	 dNlJnUJpkRXBg==
Date: Mon, 7 Sep 2026 19:25:22 +0200
From: Vincent Jardin <vjardin@free.fr>
To: sashiko-reviews@lists.linux.dev
Cc: robh@kernel.org, conor+dt@kernel.org, Frank.Li@kernel.org,
	imx@lists.linux.dev, devicetree@vger.kernel.org
Subject: Re: [PATCH 3/3] arm64: dts: freescale: add Nodebox v3 CPU Module
Message-ID: <ap7zgs0MlbIod15q@L30177.local>
References: <20260907-for-upstream-nbxv3-dts-v1-0-f43fd0028b78@free.fr>
 <20260907-for-upstream-nbxv3-dts-v1-3-f43fd0028b78@free.fr>
 <20260907144050.C20251F00A3A@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: sashiko-reviews@lists.linux.dev
List-Id: <sashiko-reviews.lists.linux.dev>
List-Subscribe: <mailto:sashiko-reviews+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:sashiko-reviews+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260907144050.C20251F00A3A@smtp.kernel.org>

Hi M. Bot,

Thanks for the review. Addressed in v2:
  https://lore.kernel.org/all/20260907-for-upstream-nbxv3-dts-v2-0-6b4afd36180b@free.fr/

> > +DTC_FLAGS_fsl-lx2160a-nbxv3 := -Wno-interrupt_map
> > +dtb-$(CONFIG_ARCH_LAYERSCAPE) += fsl-lx2160a-nbxv3.dtb
> >  DTC_FLAGS_fsl-lx2162a-clearfog := -Wno-interrupt_map
>
> [Severity: Low]
> Does this break the alphabetical ordering of the dtbs? It looks like
> fsl-lx2160a-nbxv3.dtb is being inserted after fsl-lx2160a-rdb.dtb instead of
> before fsl-lx2160a-qds.dtb.

Yes. Fixed in v2: fsl-lx2160a-nbxv3.dtb before fsl-lx2160a-qds.dtb.

> > +/ {
> > +    model = "Free Mobile Nodebox v3 CPU Module (LX2160A)";
> > +    compatible = "freemobile,nbxv3", "fsl,lx2160a";
> > +};
>
> [Severity: Low]
> Is the "freemobile,nbxv3" compatible string documented in the device tree
> bindings? Missing documentation here might trigger warnings during a
> make dtbs_check run.

It is.

patch 2 of this series, "dt-bindings: arm: fsl: add freemobile,nbxv3 board", 
and patch 1 adds the vendor prefix.

Both precede the DTS, so dtbs_check should be ok.

> > +&fspi {
> > +    pinctrl-names = "default";
> > +    pinctrl-0 = <&fspi_dqs_sck_cs10_pins>, <&fspi_data30_pins>,
> > +            <&gpio1_31_28_pins>;
> > +};
>
> [Severity: Medium]
> Does assigning the pinctrl group for GPIOs 28-31 to the fspi device create
> a conflict with the gpio-hogs defined in the gpio1 controller?
>
> If the pinmux controller enforces strict muxing, the gpio-hog nodes for
> the ethernet switch and flash resets will fail to claim the pins because
> they have already been claimed by fspi's pinctrl here. Furthermore, tying
> unrelated system resets to the fspi peripheral's pinctrl lifecycle means
> that if the fspi driver fails to probe, or is unbound, these components
> will lose their configuration.

In v2 the group is applied by &gpio1 itself:
the controller that owns those lines and their hogs, and fspi's pinctrl-0
lists only its own pins.

> > +    /* Ethernet switch reset, released: electrical high */
> > +    ethsw-reset-hog {
> > +        gpio-hog;
> > +        gpios = <31 GPIO_ACTIVE_HIGH>;
> > +        output-high;
> > +        line-name = "ethsw-reset#";
> > +    };
> > +};
>
> [Severity: Low]
> Is this active-low hardware reset signal defined with the correct semantic
> polarity? Defining an active-low reset as GPIO_ACTIVE_HIGH and manually
> forcing the electrical state with output-high bypasses the device tree
> coding standards, which expect the hardware's active state to be accurately
> reflected in the bindings.

Agreed. done with v2

> > +    /* Low enables the carrier-side EMDIO2 level translator */
> > +    ethsw-mdio-en-hog {
> > +        gpio-hog;
> > +        gpios = <25 GPIO_ACTIVE_HIGH>;
> > +        output-low;
> > +        line-name = "ethsw-mdio-en";
> > +    };
> > +};
>
> [Severity: Low]
> Similarly, this active-low enable signal is defined as GPIO_ACTIVE_HIGH
> while using output-low to force the electrical low. Should this be defined
> as GPIO_ACTIVE_LOW instead to reflect its true semantic polarity?

Agreed, see v2.

Thanks,
  Vincent
