Received: from mail-pj1-f49.google.com (mail-pj1-f49.google.com [209.85.216.49])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6F8443537FE
	for <sashiko-reviews@lists.linux.dev>; Thu, 13 Aug 2026 15:48:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.216.49
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1786636083; cv=none; b=Syd6AcUY9sS+yK1BX4rxZ3cf980nwuhwOuOrq50UOjj4KjjgXHPVgN6t+L67kz5sca2m0nYu6nrs9QBiAep9q83/rx/0ndvQhVSSuV6mbIKBaaCArfXHpXPY76iR0JD1JB0mspEPYdl6uI7WEWRWcvXo7cDFKKWdvkbTEqT4Oj4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1786636083; c=relaxed/simple;
	bh=/E0SubGOI81IPyIwUykkQsP6Ke0hxLpTzwIAs4x/vNU=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=jt+wUzQ8cIH9FMoxdH8OG5QIsgioZdRriOdlEewLc6S2ssq/wtCRl1eS9S2OHMlsRUe/lgBPtmPZRXwAamCnsV1OfEuelikWQc6fW0QyiAH9o8PkoGu5gBCwT/yQ276apzdklSM9mco3xYHvmvKsSpwpurtyqgiDop0W42n/8Aw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=fPNie1fB; arc=none smtp.client-ip=209.85.216.49
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="fPNie1fB"
Received: by mail-pj1-f49.google.com with SMTP id 98e67ed59e1d1-384930ca5e2so1148981a91.3
        for <sashiko-reviews@lists.linux.dev>; Thu, 13 Aug 2026 08:48:00 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1786636079; x=1787240879; darn=lists.linux.dev;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :content-type:mime-version:references:message-id:subject:cc:to:from
         :date:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=Nns/NScm0vqMpTyGameGuxqrFfJTWu3YR2M4cTpXgEc=;
        b=fPNie1fBulvDNcn1UEeKjOcSn7sqU+Z/tVCV/VlDD8Qj+gZLSEj45XSTK8nQu9vfdm
         NTbMM912mgT1Yj7DXryHj1Uoy6d4viwVM2+RGoMRDGiyoewcwNvj5gx/hQXv3Ji4V4L4
         uUuWV6Id6FCZqtTc+XRLUWreWFmyAsB4iqq7Y79KweOenLg2emDiPQG2XqIrV72jUVv9
         XdxWOmF7DRmqeBjc1UwxqoFbr2wR/lI+OfbGeWHgmTm0OQtdLPYMxy6SEyCcL3qWpzpl
         lSGdQ5m/WQNpX3uOb/4EiWzUCm4kOYVxwtM2gR4/W7iYSmVrlJX3gE8fUW+puWMPYWDQ
         ugEQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1786636079; x=1787240879;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :content-type:mime-version:references:message-id:subject:cc:to:from
         :date:x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=Nns/NScm0vqMpTyGameGuxqrFfJTWu3YR2M4cTpXgEc=;
        b=eV7X7iPlnGW7onQzm0MvJcN2kFUA8mgMVMzLRNLdBM3f2VJ1e44aYSHVS2mmWnCX9i
         TdVOnXxDibFaXtx1UMgJQdXPyNTCXKv6uaptNXdr4EGooOxa8VZ+RD/zbNeJm4Bo54nN
         5huuTP6Hmiqeiy72oB4lPkxQmcZZDG46zUwCn4biFD/Rui/bH4VVE2uPKNUdnzZCqLcL
         CnH4ykxU8vnLYcfiJSD8m03xkloyjvGJ62JTrM4Tv9EI+O4AHeZDMg1BrurAw0DIWle/
         Uk2SlHNDKakfxYf5n8czXCmP1ashLyc2n5Tlo0rjrBhO2MR3Q8hsKF9bL9C2dUz8kqdv
         omxA==
X-Gm-Message-State: AOJu0YxWGoOF+X2JGBAlA/1yOJ11zO8oc+CCajoRQ9GCjAkFONVLBeER
	65JR3C5NVP7h0Rz/7Q7+T0ZQXugy5ahGNokl7/MObEMGkHP1tUYV9NTvUb/I9gxDlto=
X-Gm-Gg: AR+sD10wceAPHh2Kmc0s47tILJT/SMdGROnpB0Q1V9y4ceNEQ7vg/4He5XYnBixKJbm
	MYXw44pXxrf9Lo4aN/H5oiv7lzlVTmxrRWsd171AT/F04VxCJ+62ZsukYsMWvlQdD+4Y0M7H7CH
	Ix66875lHGkuTHc55kVhmmzE6iO+oMbUVS8pQPD04sAw27TbrI8Q0e0yfWUM/+rjmiTookgJuDq
	leH1s6wW36Nf6IQ0ZwGr7pmf277cwK9Ci70tnDva1RnMsp8+qh+XSJGfzFEIr+0L7HmwT7BBIpD
	o4jgPUFXfZcGMTxs/e9djItwUsxDXFY2bkb7rYflGjjaKPE2OUvj/ZPjeLQAT3q0QRXVC/xdAX1
	uajXkxRZXt7HGsYuT7wnbzs+u+mJkhC5rWRV57KSpUhW3GngU8G7SwdOsqbqj2dkqJT3aErPuCl
	eHesAb4N7BQJPCh/KQwtSVVAA31Bne/5ADTdmKbktXa4Vy4ZAEOQrs6f2XDk8piihOZFc=
X-Received: by 2002:a17:90b:48c7:b0:381:9028:5945 with SMTP id 98e67ed59e1d1-3931e298447mr8642971a91.14.1786636079339;
        Thu, 13 Aug 2026 08:47:59 -0700 (PDT)
Received: from leonardoc-nb ([179.160.38.252])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3931f2a7d9bsm3441973a91.8.2026.08.13.08.47.56
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 13 Aug 2026 08:47:58 -0700 (PDT)
Date: Thu, 13 Aug 2026 12:47:54 -0300
From: Leonardo Costa <leoreis.costa@gmail.com>
To: sashiko-reviews@lists.linux.dev
Cc: robh@kernel.org, conor+dt@kernel.org, Frank.Li@kernel.org, 
	imx@lists.linux.dev, devicetree@vger.kernel.org
Subject: Re: [PATCH 4/6] arm64: dts: freescale: imx8mp-verdin: Add Toradex
 Capacitive Touch Display 10.1" LVDS V2
Message-ID: <tfw352zb7gtx7mjg4nqcgjojsesppbwhl76s4hc44gjexgkrdu@sw5tbvwanyan>
References: <20260813133335.1941580-1-leoreis.costa@gmail.com>
 <20260813133335.1941580-5-leoreis.costa@gmail.com>
 <20260813141916.103531F000E9@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: sashiko-reviews@lists.linux.dev
List-Id: <sashiko-reviews.lists.linux.dev>
List-Subscribe: <mailto:sashiko-reviews+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:sashiko-reviews+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20260813141916.103531F000E9@smtp.kernel.org>

On Thu, Aug 13, 2026 at 02:19:15PM +0000, sashiko-bot@kernel.org wrote:
> Thank you for your contribution! Sashiko AI review found 1 potential issue(s) to consider:
> - [Low] The device tree overlay uses an undocumented vendor prefix `optologic` and compatible string `optologic,scx1001511ggc49`.
> --
> 
> --- Patch [4]: [PATCH 4/6] arm64: dts: freescale: imx8mp-verdin: Add Toradex Capacitive Touch Display 10.1" LVDS V2 ---
> commit ae998202e5daf5ce215671d831b6ffc33e8604ec
> Author: Leonardo Costa <leonardo.costa@toradex.com>
> 
> arm64: dts: freescale: imx8mp-verdin: Add Toradex Capacitive Touch Display 10.1" LVDS V2
>     
> This commit adds a device tree overlay for the Toradex Capacitive Touch
> Display 10.1" LVDS V2. The display is connected via Verdin iMX8M Plus LCDIF
> and features an Opto Logic TFT LCD with an ILITEK capacitive touch controller.
> 
> Link: https://developer.toradex.com/hardware/accessories/displays/capacitive-touch-display-101inch-lvds
> 
> > diff --git a/arch/arm64/boot/dts/freescale/imx8mp-verdin-panel-cap-touch-10inch-lvds-v2.dtso b/arch/arm64/boot/dts/freescale/imx8mp-verdin-panel-cap-touch-10inch-lvds-v2.dtso
> > new file mode 100644
> > index 0000000000000..6b0c1a10ae2a9
> > --- /dev/null
> > +++ b/arch/arm64/boot/dts/freescale/imx8mp-verdin-panel-cap-touch-10inch-lvds-v2.dtso
> 
> [ ... ]
> 
> > +&{/} {
> > +	panel-lvds-native {
> > +		compatible = "optologic,scx1001511ggc49", "panel-lvds";
> 
> [Severity: Low]
> Does this code introduce an undocumented vendor prefix and compatible string?
> The prefix `optologic` and compatible string `optologic,scx1001511ggc49`
> appear to be completely missing from `Documentation/devicetree/bindings/`,
> which will cause the Device Tree binding checker to emit warnings when
> validating the DT with `make dtbs_check`.
> 
> > +		backlight = <&backlight>;
> > +		data-mapping = "vesa-24";
> > +		power-supply = <&reg_3p3v>;
> 
> -- 
> Sashiko AI review · https://sashiko.dev/#/patchset/20260813133335.1941580-1-leoreis.costa@gmail.com?part=4

As specified in the cover letter, these patches should be applied after
another series:

- https://lore.kernel.org/linux-arm-kernel/20260623195741.495734-1-leoreis.costa@gmail.com/T/#t

This series adds the compatible binding strings, and is currently in
linux-next.
