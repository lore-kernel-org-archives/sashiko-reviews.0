Received: from mail11.truemail.it (mail11.truemail.it [217.194.8.81])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AF66427466A;
	Tue,  2 Jun 2026 05:08:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=217.194.8.81
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1780376891; cv=none; b=q+1YC3T3BJVx2Hou42Wu7c0FvFPUYfNHhpiQ9DWwJHz38+t5aQmmHzuDx6InhSCWdkihav3qpgYcP4Dqlg7N6XMEmrZfBSuAFM+Cmf2wTYYPaCtPjI8pFkacjy0WDT4Ms4ra9fYZij76n5f3rBRUrTPu63S45iO9OAk7+Kxzhzs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1780376891; c=relaxed/simple;
	bh=83QphIv7dy/BKMGWee202X7zhREyExn6VZgZWV6tp3A=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=JAVFT+6AyKuLbU7roSQn5x0OMAPta8JCa8g2RAhK/pFHXhhPp6jLcZ5W/imOgsEg2yq/melBFIx2jgpIDNd+VKoP2FXpF7hEuFFhsdyceO3VBW3f9Y6j6gZtxqpyje3qvi3MQiexe49oIJx57cyGO/NVUSdcIF7aBDBA0q4YZ9w=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=dolcini.it; spf=pass smtp.mailfrom=dolcini.it; dkim=pass (2048-bit key) header.d=dolcini.it header.i=@dolcini.it header.b=xbP5KvT3; arc=none smtp.client-ip=217.194.8.81
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=dolcini.it
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=dolcini.it
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=dolcini.it header.i=@dolcini.it header.b="xbP5KvT3"
Received: from francesco-nb (93-35-44-150.ip53.fastwebnet.it [93.35.44.150])
	by mail11.truemail.it (Postfix) with ESMTPA id 5CE411F944;
	Tue,  2 Jun 2026 07:08:04 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=dolcini.it;
	s=default; t=1780376885;
	bh=c+5u1Yt7s4Cg95FTtZjWyQ0rHXvVRxYSon9dVPyidmk=; h=From:To:Subject;
	b=xbP5KvT3o0o6G36PYgw2R/TxfHT7OHjd5XQlF5ZqCG0z7UDrkbm4FTcGs9ZH1XDqw
	 DUDVD/rvRqX9yY1aclC3QhFRKcsvolVQX9PAq6WLx8FdBzXwb27a1xNLjIrCeiX/Lj
	 BWh91alk11NroXaNGscV4nExhy+00ZVVQhY03S0sAkOKD2SBpl+4z74VqS+N+FgU/M
	 KM7SOnK4iTcUQF+W6wvMJfxwkpvQr+9/MtITQYOGML22ecIRjZLS7F92ZM4dGa5aF6
	 42zqn4Xp5vPOTYds1rZ6JO8LFmgN4sOcrIjavX+5IBEkqPQUx007rgM5h2MQ8tfc++
	 k8MU2mnAtTzSA==
Date: Tue, 2 Jun 2026 07:07:58 +0200
From: Francesco Dolcini <francesco@dolcini.it>
To: Frank Li <Frank.li@nxp.com>
Cc: sashiko-reviews@lists.linux.dev,
	Franz Schnyder <fra.schnyder@gmail.com>, devicetree@vger.kernel.org,
	Frank.Li@kernel.org, robh@kernel.org, conor+dt@kernel.org,
	imx@lists.linux.dev
Subject: Re: [PATCH v4 2/3] arm64: dts: freescale: add Aquila iMX95 support
Message-ID: <20260602050758.GA4108@francesco-nb>
References: <20260521-add-aquila-imx95-v4-2-5a7f86c824f5@toradex.com>
 <20260521173020.0A03E1F000E9@smtp.kernel.org>
 <ah3gl2imBTPoEpHm@lizhi-Precision-Tower-5810>
Precedence: bulk
X-Mailing-List: sashiko-reviews@lists.linux.dev
List-Id: <sashiko-reviews.lists.linux.dev>
List-Subscribe: <mailto:sashiko-reviews+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:sashiko-reviews+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <ah3gl2imBTPoEpHm@lizhi-Precision-Tower-5810>

On Mon, Jun 01, 2026 at 03:42:15PM -0400, Frank Li wrote:
> On Thu, May 21, 2026 at 05:30:19PM +0000, sashiko-bot@kernel.org wrote:
> > > diff --git a/arch/arm64/boot/dts/freescale/imx95-aquila.dtsi b/arch/arm64/boot/dts/freescale/imx95-aquila.dtsi
> > > new file mode 100644
> > > index 0000000000000..69dc962a24a1d
> > > --- /dev/null
> > > +++ b/arch/arm64/boot/dts/freescale/imx95-aquila.dtsi
> > > @@ -0,0 +1,1160 @@
> > [ ... ]
> > > +	reg_dp_1p2v: regulator-dp-1p2v {
> > > +		compatible = "regulator-fixed";
> > > +		/* CTRL_DP_BRIDGE_EN */
> > > +		gpios = <&som_gpio_expander_0 7 GPIO_ACTIVE_HIGH>;
> > > +		enable-active-high;
> > > +		regulator-always-on;
> > > +		regulator-max-microvolt = <1200000>;
> > > +		regulator-min-microvolt = <1200000>;
> > > +		regulator-name = "On-module +V1.2_DP";
> > > +		vin-supply = <&reg_1p8v>;
> > > +	};
> >
> > [Severity: Medium]
> > Since this regulator is a dedicated power supply for som_dsi2dp_bridge which
> > is marked as status = "disabled" below, is it necessary to have the
> > regulator-always-on property here?
> 
> This one make sense. Does this regulator-dp-1p2v really need always on.

Yes, it is wanted to be like that.

Keeping it as always-on is a HW decision from the vendor, Toradex.

If this is disabled at run-time, for example in some stand-by use case,
it does not work properly afterward.

Francesco


