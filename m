Received: from mail-wr1-f48.google.com (mail-wr1-f48.google.com [209.85.221.48])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CC9154477F5
	for <sashiko-reviews@lists.linux.dev>; Thu, 27 Aug 2026 18:14:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.48
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787854470; cv=none; b=Y+F5WSj1WQm0xI2SgKP5VijnobJgojSWF8pQ/6Ulz87J7Uu5d/bfv9zmLmjZD6Smyn9H0n7oIBCvG20ZtE3zlqJDvaAkf5BWEHEJSDWE+0AbwrN6AtmtISWDW4xS6m7tyKqwK8x5S1XOc4VZx2Fbl2Uk1DcsuQYPC0Y6VC+e/zs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787854470; c=relaxed/simple;
	bh=nqFcIRWHO1gbZDISpCn+623PYl+5K+bwxrZWcbI+yHw=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=APw7xtAIFgbW+vqseDxGLcGHfg9IDViPdRfhOJOVdLYwpMn2h6/VOCmnXx2U6ngNoBk/22lga8XED0j+/sGvwv/P0Nm05ekKZP4uitpNUKndPA1NiqNSl/QGCdy6hAHax+beE4kUrw7rzcq3gUfQP7aPpIZX8yJGf87kuHgfRqM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=h5MOZoK1; arc=none smtp.client-ip=209.85.221.48
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="h5MOZoK1"
Received: by mail-wr1-f48.google.com with SMTP id ffacd0b85a97d-47f71156e1aso55241f8f.3
        for <sashiko-reviews@lists.linux.dev>; Thu, 27 Aug 2026 11:14:28 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1787854467; x=1788459267; darn=lists.linux.dev;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=C5ubgqku7GUa3LZMLWFNhgKYbrJvkm44caMPa+3aLQo=;
        b=h5MOZoK14ZWXFVth0/mPi7jLth92N4Kx0S33QWlinjZVVrfaN7wPgRW86WE0NMg1X9
         lr+Hf/NB9lqfZ+EFkF82v58ZbbWbpbsdl/Ii5iIEd1APNoLdxkhpiA1X9Ged5gXwUIzq
         oaqvtWaRTsw85uZbDb9uIwFOuZyKAoWLsHNgzhTXaOHY8hj6rmvhylc1bByyN7WaIXtZ
         eZuSSQQ0l2NxGpE19/UJmfXxdSQFRslMGPmAssWLipPOkLKorqgPGRobWOumXVTxImLj
         AUhALGeXVYxKT+aCAvq01+DLNLarwm84b62rAbie65QxM8cO+oQHL+naxS4Otrt1ER5H
         ejFA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1787854467; x=1788459267;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=C5ubgqku7GUa3LZMLWFNhgKYbrJvkm44caMPa+3aLQo=;
        b=FHt+bU6aQ/1/yUvNAMzM4mZrNpXYvhZv6nkpdN1JyKDkZXe7zhfh5mhOQ3KS6wQSq8
         YVf7TR5iZhVZf42ujJ5oFmm6xBxBBvFNuKUDf4xtvm5chX1TivtdU8OEbo7UnJboT6yX
         JjA6R5xeNtFZ28zJdKtktsEZjI3MnpBDX7Gl/vA/v21TvTgsGGm0jUkEB0qG+/BjUxCd
         nSlhVDKmhjo1QshaM59GqRg3McSREMEsY65jOTyArDlqWXBZyU3zL5w0RGUrg18AiOFv
         UFpgoC6zTx6Bd0F9CeXeKtFH5l0OvkFBPfc9BqPOxpnXHmZWp1LWqN6UpJuo8syvp06s
         frxA==
X-Gm-Message-State: AFuF++nWlRY1QK8EaAO4lHD59V2ahReWv+MDen9YaXFSeSfdLIZ2fq6r
	P35eHgxoEk2mb+LZl/hKU/b9WQxvTtXf5Gv3bEJeU/U/DesEBnbhyTXcdFxTcw==
X-Gm-Gg: AR+sD10Cre4Jl6hEK0zURw9omtreT529VT01Xdbxa4CD45j8B2c+efKVRdC3+wr/Rs8
	vcAXeBQxc39gxmdfaifg/+eILQydsfYtNbbne0sHrGDOb9WOVrrv/HrIujwtFtaFJ40Nt9SLaBZ
	z8C+hrXwOR4d7mBuedRd7CxQmYmTMMfNVQAqgMNjBe3621XJIKOMRJWtxtf1hUtufzyCE3eVRRt
	rOye7UzT10KNEO1sKAW/tKgV+TKAKS9omXkgf03CPjhF26OMq8wNiJwozgFZM/dm/y8KjKA0/pI
	nEwGHxnXg91Vvu+20SpH9DMXK0juHNpwKO4XrDkJlfCxWmLxnRxdpOayP5/G6HarglPNHecLm/H
	KwWjVFbGMvBoQ2UQdt9wiJ5i9Jyo0hh4ZXe2E3gLRN3a3YUc8hRASv7UW9KwqBTo97rbG/yCjv8
	wJZgXlgV6Wbh0Zn8MHIVJv1Kh2181NNYY9iK1f81jHMcDNVebu+3L75pJCPKN/oCMHKEOQmP4CG
	pDsejl7C8sh6whO2RCrGNGtSZiaxtL8L8iIvBYV6vuY4yME7Lk+Uxe6vUxJYNQT69iAMlgh
X-Received: by 2002:a05:6000:4211:b0:482:f530:c45b with SMTP id ffacd0b85a97d-482f798a6c1mr970197f8f.5.1787854466843;
        Thu, 27 Aug 2026 11:14:26 -0700 (PDT)
Received: from GLaDOS.station (net-93-144-65-248.cust.dsl.teletu.it. [93.144.65.248])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-482e28dc13fsm10426102f8f.24.2026.08.27.11.14.25
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 27 Aug 2026 11:14:26 -0700 (PDT)
Date: Thu, 27 Aug 2026 20:14:24 +0200
From: Stefano Radaelli <stefano.radaelli21@gmail.com>
To: sashiko-reviews@lists.linux.dev
Cc: robh@kernel.org, devicetree@vger.kernel.org, conor+dt@kernel.org,
	imx@lists.linux.dev, Frank.Li@kernel.org
Subject: Re: [PATCH v6 2/3] ARM: dts: imx7d: add Variscite VAR-SOM-MX7 support
Message-ID: <apB-gMzH2cQNtv_Z@GLaDOS.station>
References: <cover.1787851637.git.stefano.r@variscite.com>
 <11592f9d727337fedf02fdb107a24e935f3ebce4.1787851637.git.stefano.r@variscite.com>
 <20260827174206.8A4B61F000E9@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: sashiko-reviews@lists.linux.dev
List-Id: <sashiko-reviews.lists.linux.dev>
List-Subscribe: <mailto:sashiko-reviews+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:sashiko-reviews+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260827174206.8A4B61F000E9@smtp.kernel.org>

On Thu, Aug 27, 2026 at 05:42:06PM +0000, sashiko-bot@kernel.org wrote:
> [ ... ]
> 
> > +&i2c2 {
> > +	wm8731: audio-codec@1a {
> > +		compatible = "wlf,wm8731";
> > +		reg = <0x1a>;
> > +		#sound-dai-cells = <0>;
> > +		AVDD-supply = <&vgen6_reg>;
> > +		DBVDD-supply = <&vgen6_reg>;
> > +		DCVDD-supply = <&vgen6_reg>;
> > +		HPVDD-supply = <&vgen6_reg>;
> > +		clocks = <&clks IMX7D_AUDIO_MCLK_ROOT_DIV>;
> > +		clock-names = "mclk";
> 
> [ ... ]
> 
> > +&sai1 {
> > +	assigned-clock-rates = <0>, <36864000>;
> > +	/delete-property/ fsl,sai-mclk-direction-output;
> > +};
> 
> [Severity: High]
> Does removing the 'fsl,sai-mclk-direction-output' property break the master
> clock for the WM8731 codec?
> 
> The wm8731 node configures the codec to expect an internal SoC master clock
> by setting clocks = <&clks IMX7D_AUDIO_MCLK_ROOT_DIV>.
> 
> By deleting the 'fsl,sai-mclk-direction-output' property from the sai1
> node, the SAI1_MCLK pad is configured as an input instead of driving the
> clock out to the codec.
> 
> Will this prevent the WM8731 codec from functioning on this board variant
> because it never receives a clock?
> 

The WM8731 MCLK is provided by the configured audio clock root and this
setup has been validated on hardware.
Removing fsl,sai-mclk-direction-output is intentional for this board
variant.

> > diff --git a/arch/arm/boot/dts/nxp/imx/imx7d-var-som.dtsi b/arch/arm/boot/dts/nxp/imx/imx7d-var-som.dtsi
> > new file mode 100644
> > index 0000000000000..158158afc3391
> > --- /dev/null
> > +++ b/arch/arm/boot/dts/nxp/imx/imx7d-var-som.dtsi
> 
> [ ... ]
> 
> > +&iomuxc {
> > +	/* GPIO Used in User Space init script */
> > +	pinctrl_bt: btgrp {
> > +		fsl,pins = <
> > +			MX7D_PAD_GPIO1_IO14__GPIO1_IO14			0x80000000
> > +		>;
> > +	};
> 
> [Severity: Medium]
> Are these Bluetooth power sequences improperly delegated to user-space
> scripts instead of kernel device drivers?
> 
> The pinctrl_bt node defines the BT_REG_ON (GPIO1_IO14) pin strictly as a
> pinctrl definition with no corresponding power sequencer or regulator
> binding.
> 
> Since the comment explicitly notes it is used in a user space init script,
> will this prevent the kernel from autonomously enumerating the UART Bluetooth
> device during boot?
> 
> [ ... ]
> 
> > +&iomuxc_lpsr {
> 
> [ ... ]
> 
> > +	/* GPIO Used in User Space init script */
> > +	pinctrl_wlan: wlangrp {
> > +		fsl,pins = <
> > +			MX7D_PAD_LPSR_GPIO1_IO04__GPIO1_IO4		0x09
> > +		>;
> > +	};
> 
> [Severity: Medium]
> Is this Wi-Fi power sequence improperly delegated to user-space scripts
> instead of an MMC power sequence?
> 
> The pinctrl_wlan node defines the WL_REG_ON (GPIO1_IO4) pin strictly as a
> pinctrl definition without a corresponding power sequencer or regulator
> binding.
> 
> Will this prevent the kernel from autonomously enumerating the SDIO Wi-Fi
> device during boot?
> 

Both Bluetooth and Wi-Fi are intentionally handled in userspace,
as on our other platforms

Stefano
