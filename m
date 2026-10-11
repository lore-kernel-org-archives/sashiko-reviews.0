Received: from mail-wm1-f46.google.com (mail-wm1-f46.google.com [209.85.128.46])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C73713A6EE6
	for <sashiko-reviews@lists.linux.dev>; Sun, 11 Oct 2026 21:42:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.46
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791754937; cv=none; b=U4XMCmZ6kIH1rJjnJQFs4rLkCB+ZSJizBCCLfAlmfNhjYzcT8MAyzPeobiXN3pQR7dIPrfP8TVyHqKpcKgA8SucwzdDXxB8JmZTwNLPIigGt/ro792uxXbnYa979z2dCQKVbowiwtUR3nCibgVJ8J1x5iziwsxMs6Tt5GHs2+hs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791754937; c=relaxed/simple;
	bh=k43IbaF6TdU+8O/x/tfa/3tzN+/gA6OynfUGsXVIY2E=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=UPN8HcnJ8evK0SZ715TaDdH8oiRdOC8tftzTqEPeKcdy1OToPjzeDq2cp0LGJ1uhsno65wwxwU1rLueysT7xew7N9/fbfd/Nm/6APr4QIDCRcuatQA2jdEuDTjfcVbgWy6XAvM0MLQgQiX66h2ay4KF2VzWoJSFLcIkR82mVW74=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=EyIKFx3a; arc=none smtp.client-ip=209.85.128.46
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="EyIKFx3a"
Received: by mail-wm1-f46.google.com with SMTP id 5b1f17b1804b1-4a018792ab3so10858945e9.0
        for <sashiko-reviews@lists.linux.dev>; Sun, 11 Oct 2026 14:42:14 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1791754933; x=1792359733; darn=lists.linux.dev;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=+5CIZCQrM8vHqdGBQkpWsSJmLyDFs444j3c0Qt3YBk8=;
        b=EyIKFx3aFfREhkHi7yfaoAPG4v4UbgNiTKl8NrKH+vHdxk3OgmP+xNllNNmrmukUsB
         HoL/FWgVKVcexXRSAHzeROYxQGB+Tb0R7ia77pwb256MqOwT1kJSNHzaLWakh9oKFd3E
         KWr0BFKjRkeIy2LcNHmb7M02tYPgfvfC15yqNo5xhAmRYmgg22sLJGrl/UjT98+Vrlw+
         sCNqMK6MXAs3UipL+USsH2lHHMr4AXijnHa4eUL2VDXVO+s+HBWIjY0hgnu2UNQNGaRH
         SDWOZwVfVxg8k7JbvzewUq9lND8JnmSldHBJLMJGURjhumguGkhCsnBg0Cete9mnbTEm
         SFog==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791754933; x=1792359733;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=+5CIZCQrM8vHqdGBQkpWsSJmLyDFs444j3c0Qt3YBk8=;
        b=bue0/BSd2MsgpNv8f2RkgdF67oxHFGDAJ2X7ywq/5+qKXULp4acBE1pNyUd54nRSvr
         cv6yYmPhdgUc+LMLL/xgAxkv6SD+nvwdvzyMnuba0Ks8L123Pkvjn5RQ7wWPcR7xB+hP
         lTiCz7ZQBrIx6P94VjTFIccxd1Q19xzm+rEY7vM6AKHaPwVM+faYs2e2Tptbuh8SADn/
         88N1Ija1lcSRiDA+Vply3TtEErNOgIucfSs/L7GSVJiJ8KxDi5DhqQG0Z9go4rA2dSBt
         AUyk9csUtH29Jg0G7IEPsQycXfOYS95cfSKhW9ytt8X00xwrgr33kyeyZxDd68DVto/H
         6juA==
X-Gm-Message-State: AFq9FYJ/ViJyva//GfcNMTJP7FSlIZMPowj99iqGa+EmNKrfbIxwBgIr
	rqpPk5O00whH9eZswVHggnoCa7A/EylWoM3eD3Gf+H4wNmQBRoS1yzpuJ3YGvw==
X-Gm-Gg: AYBFou0SvkM2G0/mec+7+d2kU4Dd3OelKfmn9O5tJ6Zz608YsGE8dxoREIYaKxJiAL7
	TkshKy5xWl7AGGrQfA/0cRsTXO1pkhIeJ2EcDQUEVKDmQdeDqjN6J7PbGH8EYEWc/mCMsBiog/l
	SkSUCxzhCTycNO6thy+PDjV4TXTE9MSQNbYFv5byhoczy6QeffUHAUikQ2QuMmlkESCJWQPiO0B
	Vyc5NvjkUNAss/gjvjJnLK8LOIAPd1+rOLIYjRkbekXPhUwD8mHZuycA5j3E71uhoL8+tDvGdz9
	DJg3xL1MYgqrDXiri05l7hcERtQ3DlImcTvb2bRHDG3+MrrYMY1zUxoApXo+VXTbIuzXKltivT0
	u73j1jBn6eZU2r7CKKB/PhGQ++Wi+USbllQuLbRoLnwzwvQq5yyLkR+3hYKaGlgb6jz75mypWAV
	hD0k6m0pe2YHuGwnZzjLDCEAzrHOe54RZLxanYswjpriD1lAQwaf+JuHVf9QJQV80W4YeE8TsV5
	uveeFz8cUmKqfkJRdcB6s+HPa9Ev9VsM8s5ehC9kJ0xAPwm7/x1bpg5YKp+Y/J/Y0mmsAn3lI/5
	sp/d20e5+566m1NjOOprchRj1t6j
X-Received: by 2002:a05:600c:8184:b0:4a0:1c17:4fb2 with SMTP id 5b1f17b1804b1-4a18e4d854cmr109941355e9.31.1791754932570;
        Sun, 11 Oct 2026 14:42:12 -0700 (PDT)
Received: from Lord-Beerus.station ([31.27.155.43])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4a18bf2343asm451871005e9.9.2026.10.11.14.42.08
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 11 Oct 2026 14:42:09 -0700 (PDT)
Date: Sun, 11 Oct 2026 23:42:06 +0200
From: Stefano Radaelli <stefano.radaelli21@gmail.com>
To: sashiko-reviews@lists.linux.dev
Cc: devicetree@vger.kernel.org, robh@kernel.org, Frank.Li@kernel.org,
	imx@lists.linux.dev, conor+dt@kernel.org
Subject: Re: [PATCH v5 06/13] ARM: dts: imx6ul: Extend VAR-SOM-6UL and add
 DART-6UL files
Message-ID: <aswCrsVs4Z7n864c@Lord-Beerus.station>
References: <cover.1791487179.git.stefano.r@variscite.com>
 <e11cdc950e41b502e5449830d5f6a82568fc043a.1791487179.git.stefano.r@variscite.com>
 <sashiko-outbox-166012@kernel.org>
Precedence: bulk
X-Mailing-List: sashiko-reviews@lists.linux.dev
List-Id: <sashiko-reviews.lists.linux.dev>
List-Subscribe: <mailto:sashiko-reviews+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:sashiko-reviews+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <sashiko-outbox-166012@kernel.org>

On Fri, Oct 09, 2026 at 07:49:24PM +0000, sashiko-bot@kernel.org wrote:
> Thank you for your contribution! Sashiko AI review found 1 potential issue(s) to consider:
> - [Low] dt-bindings: net: micrel: boolean property assigned integer value <1>
> --
> 
> commit 7e70ac71fa47849af4ee0ecb85b6da2be68dfac5
> Author: Stefano Radaelli <stefano.r@variscite.com>
> 
> ARM: dts: imx6ul: Extend VAR-SOM-6UL and add DART-6UL files
> 
> Add the DART-6UL module description and wrappers for i.MX6UL,
> i.MX6ULL and i.MX6ULZ, plus an i.MX6ULZ wrapper for VAR-SOM-6UL.
> 
> > diff --git a/arch/arm/boot/dts/nxp/imx/imx6ul-imx6ull-var-dart.dtsi b/arch/arm/boot/dts/nxp/imx/imx6ul-imx6ull-var-dart.dtsi
> > new file mode 100644
> > index 0000000000000..f7190f6d50b59
> > --- /dev/null
> > +++ b/arch/arm/boot/dts/nxp/imx/imx6ul-imx6ull-var-dart.dtsi
> 
> [ ... ]
> 
> > +&fec1 {
> > +	pinctrl-names = "default";
> > +	pinctrl-0 = <&pinctrl_enet1>, <&pinctrl_enet1_gpio>, <&pinctrl_enet1_mdio>;
> > +	phy-mode = "rmii";
> > +	phy-handle = <&ethphy0>;
> > +	status = "okay";
> > +
> > +	mdio {
> > +		#address-cells = <1>;
> > +		#size-cells = <0>;
> > +
> > +		ethphy0: ethernet-phy@1 {
> > +			compatible = "ethernet-phy-ieee802.3-c22";
> > +			reg = <1>;
> > +			clocks = <&rmii_ref_clk>;
> > +			clock-names = "rmii-ref";
> > +			reset-gpios = <&gpio5 0 GPIO_ACTIVE_LOW>;
> > +			reset-assert-us = <10000>;
> > +			reset-deassert-us = <100000>;
> > +			micrel,rmii-reference-clock-select-25-mhz = <1>;
> 
> [Severity: Low]
> Does this assignment cause a dtbs_check schema violation?
> 
> The micrel,rmii-reference-clock-select-25-mhz property is defined as a boolean
> in the dt-binding schema. Assigning it an integer value like <1> will trigger
> a warning during Device Tree compile validation.
> 
> Could this be specified simply by its presence without an assigned value,
> such as: micrel,rmii-reference-clock-select-25-mhz; ?

This is addressed by the preceding patches in this series.
Patch 05/13 changes this property from a boolean to enum: [1]
to satisfy the dt-schema unit checks for the -mhz suffix.
Patch 04/13 updates the driver to use of_property_present(),
accepting both the existing empty form and the numeric form
without changing the clock selection.

The <1> assignment here is intentional and matches the updated
binding.

Stefano
