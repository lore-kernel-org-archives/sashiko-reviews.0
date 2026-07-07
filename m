Received: from mail-wr1-f54.google.com (mail-wr1-f54.google.com [209.85.221.54])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2B8E13FD159
	for <sashiko-reviews@lists.linux.dev>; Tue,  7 Jul 2026 13:29:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.54
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783430964; cv=none; b=XrWMdofOtPYxggyk3tJ/aVjtRHExQRCneFI6fECDlTDzdy1jnfJoFe+4VVE3GSa4sxMf7jOwf1Lx5x/q+Ut0lzVtbKxHvSm32FDh33RAQwl6Ij28vHwiPPWEb/MUqkaHX+X/jLXvjz3g2s2goBgMfZwXPa+ASGP0Ybym78Yy3vs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783430964; c=relaxed/simple;
	bh=dSWgcEVqn96YNXIDhps5X6Ob0cQ6Yr4ZQ8+nRr7zu7g=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=U25CsyRtP/948Z0ybsAJdTJUPGBk4tWCFzze+QPOoK0QmDo9B8Jb9tY+dtiZ8JHv3iMgpMCfW/SzAfdSOH8PpmLikmFYegPdtSJLkB++LrYaknPP8WkhQ0ig2gpNA4MnLhBO9uG7aUVK8Lug/TuaJq3Y4TAotfjp4pDMxbTPfJM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=drOpDDGI; arc=none smtp.client-ip=209.85.221.54
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="drOpDDGI"
Received: by mail-wr1-f54.google.com with SMTP id ffacd0b85a97d-47de008b020so386689f8f.1
        for <sashiko-reviews@lists.linux.dev>; Tue, 07 Jul 2026 06:29:22 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1783430961; x=1784035761; darn=lists.linux.dev;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=i4adAtmWIIeDRmlqxSvfydtiZtPinCJztXXi755Yp48=;
        b=drOpDDGI/coysr+G+OsreyWuSl93O9a7yXmtCKcH0+IaKomhHVUhM2id8dL9itBx1W
         3ah+iefKbjrveUVxljF16gwqjcEk8H5E24mqgT/Yc8oXB3VW5x1QsoSkm4s2nS1xzuaN
         zJIWrOHQx7RwNeK+Wsp2hXr7YgyRZLVPKZdxwSNT+Il3g6bHG9ipC5BPfH55zOx0kMeg
         5TKK9dlUOh8t3W2VyYvjiqqnIfFE7f9MSCdSCMkUj1aBo7VroVUhmUV/ha4ikM3MHqy8
         sNFm7VlQ1Yf+iR+oExLeVtqd//4bibOfINidH2E3rkq5IfaLrcOJKq50+JtC0YWb7xbS
         D2yA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1783430961; x=1784035761;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=i4adAtmWIIeDRmlqxSvfydtiZtPinCJztXXi755Yp48=;
        b=cR5FDNlMW7bV9NFZyfWsvoQtZoJ5tQZSLdudpJOl7/AHq4SrO0iFsVpqMLD1WPpdg9
         dpnjko+w3ZtMc3C9MH5SDgj2VEc7vufPrfAdre7dBLNdO9j8DQsczmY4TO/yODFio+8h
         pKFzYu0n63ToZU7zsJc+t92wTfG0dYZSB1lG4GuUSCWrXeLw9zTO6I7pFXoBb/aprjAA
         IYKkVWQjILOI5Hc4Kp4C2I2W6OIdX2PqYkBhNTvMya61sZVS12mrU0v42CrZ90XTDrF2
         oX/yWF1s0FuC9hn53mrQDkO/pDAt6szLDneZTv8um1G4J33295dY0p5rL6SXWvJquHyr
         z/Vg==
X-Gm-Message-State: AOJu0Yzcqvgi5dfzz2FSnt8iricU2l/ONcB807MMXtXdSIG9qZO6uo00
	BvIgyO30D4qWIXSW4w52bh3qZpvK8LcczUDJREvW1wTj+9e7jZS5xJs4
X-Gm-Gg: AfdE7cm4f6UMTnHJqHkI/xz/S+6RAqCLfLmyliYpao++Ivu7FVFeK2/tBhGh5DCQcMa
	4I7V0BY6nyL0B3PMnsPAC35wkVyQqdw1h2VeC2K9mI48rizo8a9sWLkXaW5kNCHAS9uCrmbV+Ex
	knTcCu8k3EmVePgcRM6OfiPSrhL4+R3XeZ/Z/2H83GQoINo8FoO9KayOUihK3jfWpLyFnuH+Xdc
	vrCc+f6XpXEM4qpmkLTpKyCacCZy2vPSpACxQH28BEQ1/WfM/7YPW4Q6EfycCEskeQwIuy1NYjT
	nu7wLhnfZMNgV4plxWgU37PruiSMffjgiSWtxUv8JDyjjOH6GQtfEPl8Jdp97/yGInmnqwq25ZH
	whl4eo9FwFWtjrMg7fgFJ1tQ1thciSu6eXe2CiW/q2GBuFse3TxGmM5A45FxHi+RNQzlAYb7U9F
	YU65xHTyPkTBmGHk14o+oqFqu9ngLdM13YL8do6dEQKrBtyfUIilwKxdE1ouuHFpGnlTNG3j/ml
	LGJAajal1WbDXIOBPzL+dHw+o6ClPZieA==
X-Received: by 2002:a05:6000:41ea:b0:475:f0c2:75b3 with SMTP id ffacd0b85a97d-47de9a415e6mr3180060f8f.30.1783430961279;
        Tue, 07 Jul 2026 06:29:21 -0700 (PDT)
Received: from Lord-Beerus.station (net-93-144-65-248.cust.vodafonedsl.it. [93.144.65.248])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-47a9e4d843csm33030923f8f.14.2026.07.07.06.29.20
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 07 Jul 2026 06:29:20 -0700 (PDT)
Date: Tue, 7 Jul 2026 15:29:18 +0200
From: Stefano Radaelli <stefano.radaelli21@gmail.com>
To: Frank Li <Frank.li@oss.nxp.com>
Cc: sashiko-reviews@lists.linux.dev, Frank.Li@kernel.org,
	imx@lists.linux.dev, robh@kernel.org, devicetree@vger.kernel.org,
	conor+dt@kernel.org
Subject: Re: [PATCH v2 05/15] arm64: dts: freescale: imx8mn-var-som: Add
 support for WM8904 audio codec
Message-ID: <akz_Lr1bRSEE5rhC@Lord-Beerus.station>
References: <cover.1783330236.git.stefano.r@variscite.com>
 <4487a350b0e4667816c3fe62e9fd6df2696c18cf.1783330236.git.stefano.r@variscite.com>
 <20260706100948.DDA391F000E9@smtp.kernel.org>
 <akvC8UV5N6Tpk0_h@SMW015318>
Precedence: bulk
X-Mailing-List: sashiko-reviews@lists.linux.dev
List-Id: <sashiko-reviews.lists.linux.dev>
List-Subscribe: <mailto:sashiko-reviews+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:sashiko-reviews+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <akvC8UV5N6Tpk0_h@SMW015318>

Hi Frank,

On Mon, Jul 06, 2026 at 10:00:01AM -0500, Frank Li wrote:
> On Mon, Jul 06, 2026 at 10:09:47AM +0000, sashiko-bot@kernel.org wrote:
> > Thank you for your contribution! Sashiko AI review found 1 potential issue(s) to consider:
> > - [Medium] The `simple-audio-card,routing` property maps `Microphone Jack` to `IN1L` and `IN1R` but omits the connection to the `MICBIAS` supply, which will leave standard electret microphones unpowered.
> > --
> >
> > commit 78e4da0f71f2e53ae4312cbe5ceecb0f6f2345db
> > Author: Stefano Radaelli <stefano.r@variscite.com>
> >
> > arm64: dts: freescale: imx8mn-var-som: Add support for WM8904 audio codec
> >
> > This commit adds support for the WM8904 audio codec on the VAR-SOM-MX8MN board.
> > It configures the device on the I2C bus, enables the SAI peripheral, and adds a
> > simple-audio-card sound node to expose the sound card to the system.
> >
> > > diff --git a/arch/arm64/boot/dts/freescale/imx8mn-var-som.dtsi b/arch/arm64/boot/dts/freescale/imx8mn-var-som.dtsi
> > > index 09146ab763858..e2e04ad2fbb65 100644
> > > --- a/arch/arm64/boot/dts/freescale/imx8mn-var-som.dtsi
> > > +++ b/arch/arm64/boot/dts/freescale/imx8mn-var-som.dtsi
> >
> > [ ... ]
> >
> > > @@ -42,6 +50,34 @@ reg_phy_vddio: regulator-phy-vddio {
> > >  		regulator-min-microvolt = <1800000>;
> > >  		regulator-max-microvolt = <1800000>;
> > >  	};
> > > +
> > > +	sound {
> > > +		compatible = "simple-audio-card";
> > > +		simple-audio-card,bitclock-master = <&codec_dai>;
> > > +		simple-audio-card,format = "i2s";
> > > +		simple-audio-card,frame-master = <&codec_dai>;
> > > +		simple-audio-card,mclk-fs = <256>;
> > > +		simple-audio-card,name = "wm8904-audio";
> > > +		simple-audio-card,routing =
> > > +			"Headphone Jack", "HPOUTL",
> > > +			"Headphone Jack", "HPOUTR",
> > > +			"IN2L", "Line In Jack",
> > > +			"IN2R", "Line In Jack",
> > > +			"IN1L", "Microphone Jack",
> > > +			"IN1R", "Microphone Jack";
> > [Severity: Medium]
> > Will standard electret microphones remain unpowered with this routing?
> >
> > The routing maps "Microphone Jack" to "IN1L" and "IN1R", but omits a link to
> > the "MICBIAS" supply (e.g., "Microphone Jack", "MICBIAS"). Because "MICBIAS"
> > is defined as a DAPM supply widget in the codec driver, DAPM will not enable
> > it unless it has an explicit routing link connecting it to the active audio
> > path. This could leave the microphone without its required bias voltage when
> > recording.
> 
> Is this true?
> 
> Frank
> 

Thanks for pointing this out.

This audio routing is not new for this board. It follows the same WM8904
routing that we have been using on our other platforms for quite some
time, and we are not aware of any reported issues related to the
analogue microphone path.

If adding an explicit route to MICBIAS is indeed required by the
codec driver, then this would not be specific to this board but would
potentially apply to all of our WM8904-based platforms.

I'd prefer not to introduce this functional change as part of this DTS
alignment series without validating it across all affected platforms.
If needed, we can investigate the MICBIAS routing separately and
submit a dedicated fix covering all WM8904-based boards.

Thanks,
Stefano
