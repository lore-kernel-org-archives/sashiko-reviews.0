Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7DBF49463;
	Tue,  2 Jun 2026 16:02:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1780416131; cv=none; b=Xor4ftuB0ycGzDEpQ3HRzai4SlGN8nmct//feynfVJHpn3TUBEpbmAGAu+niQzucqkjm/TmCHQmIwK/b0pcG8WySAGxQmt99Ck0/lZat0iDJwUyv/evupsePK0S5dViiz+OCMeifc8VVxYXa39VS3u07Vd2b7vo7kbWN/557cEs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1780416131; c=relaxed/simple;
	bh=u+X+ukLitCCv8u4oRP+OOK+HEy3USdFiwUYPI63KqNY=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=l14ZdI6DoPwGKA81w0HDSfmKRidcafFFtVYtwbjIie8UzMCqIP4ieunOcuK5TR0E9vTQRuWpDLY9ISi/B8+yx+WQ7DCoimrgSVmkJPzD8MlvRls7caDb7ERlOqW8KLMXsMGcaqTB++wbSn6XI0jQpKG8sMFqbeZ+oMoe7Q5Gc/g=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=VGhscnmZ; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="VGhscnmZ"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 3EB9E1F00893;
	Tue,  2 Jun 2026 16:02:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1780416130;
	bh=Zvuxqt8EQAyLjRjKOeZfynJoxMTq7BZkratyX8ZCO88=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=VGhscnmZrVS40m2ApsDm26tVMSp9X1RychA3k7eAZHP4mPN7fm3knQfeDhPDYSEYG
	 CE61MnCwp2NrgbTZpj4cFPMKT2qwzke+KHeWXcQy4ORCOj3lgzoU1oSLKZ94h+Dq32
	 Qb3+15aNnQ0yYrkTvWFWC4b7NnJff42MjKW4bOlsGSKZ6X66o1yZ7LbGZG4w811uVN
	 f/LuL6sznJQhDs+trAGfFuEk2e10PeoIEIWT8PLXxryVAHfjK7w52BDZoGX74BZv1N
	 SC/QpSHjFjsXNHsl+0jHkItzwZOgn4hByTAtrG/Et/hWdObNkTj96GrfRhAUfErNxE
	 Joui8G22dlHnA==
Date: Tue, 2 Jun 2026 11:02:09 -0500
From: Rob Herring <robh@kernel.org>
To: sashiko-reviews@lists.linux.dev
Cc: Dimitri Fedrau via B4 Relay <devnull+dimitri.fedrau.liebherr.com@kernel.org>,
	olteanv@gmail.com, vkoul@kernel.org, neil.armstrong@linaro.org,
	linux-phy@lists.infradead.org, devicetree@vger.kernel.org,
	conor+dt@kernel.org
Subject: Incorrect reply address with b4 relay [was Re: [PATCH v6 2/2] phy:
 add basic support for NXPs TJA1145 CAN transceiver]
Message-ID: <20260602160209.GA410207-robh@kernel.org>
References: <20260602-tja1145-support-v6-2-0e0ffc8ee63d@liebherr.com>
 <20260602083856.E92081F00898@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: sashiko-reviews@lists.linux.dev
List-Id: <sashiko-reviews.lists.linux.dev>
List-Subscribe: <mailto:sashiko-reviews+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:sashiko-reviews+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20260602083856.E92081F00898@smtp.kernel.org>

Sashiko devs,

It looks like sashiko replies to b4 relay submissions don't get sent to 
the author's email and instead go to the relay's email (devnull). Here's 
the header of the reply:

> Date: Tue, 02 Jun 2026 08:38:56 +0000                                                                                                                                                                                  
> From: sashiko-bot@kernel.org                                                                                                                                                                                           
> To: Dimitri Fedrau via B4 Relay <devnull+dimitri.fedrau.liebherr.com@kernel.org>                                                                                                                                       
> Cc: olteanv@gmail.com, vkoul@kernel.org, neil.armstrong@linaro.org, linux-phy@lists.infradead.org, devicetree@vger.kernel.org, conor+dt@kernel.org, robh@kernel.org                                                    
> Subject: Re: [PATCH v6 2/2] phy: add basic support for NXPs TJA1145 CAN transceiver                                                                                                                                    
> Message-Id: <20260602083856.E92081F00898@smtp.kernel.org>                                                                                                                                                              


On Tue, Jun 02, 2026 at 08:38:56AM +0000, sashiko-bot@kernel.org wrote:
> Thank you for your contribution! Sashiko AI review found 1 potential issue(s) to consider:
> - [Medium] If setting the CAN operating mode fails during `tja1145_phy_power_on`, the PHY hardware is left in normal operating mode without rolling back to standby mode.
> --
> 
> commit 4b999361552fc4af356fbf9fbd3b1ca5f2dd59bf
> Author: Dimitri Fedrau <dimitri.fedrau@liebherr.com>
> 
> phy: add basic support for NXPs TJA1145 CAN transceiver
> 
> This commit adds basic driver support for the NXP TJA1145 CAN transceiver.
> It enables bringing the PHY up or down by switching between normal and
> standby modes using SPI commands.
> 
> > diff --git a/drivers/phy/phy-nxp-tja1145.c b/drivers/phy/phy-nxp-tja1145.c
> > new file mode 100644
> > index 0000000000000..1e8bd169743ab
> > --- /dev/null
> > +++ b/drivers/phy/phy-nxp-tja1145.c
> 
> [ ... ]
> 
> > +static int tja1145_phy_power_on(struct phy *phy)
> > +{
> > +	struct regmap *map = phy_get_drvdata(phy);
> > +	int ret;
> > +
> > +	/*
> > +	 * Switch operating mode to normal which is the active operating mode.
> > +	 * In this mode, the device is fully operational.
> > +	 */
> > +	ret = regmap_update_bits(map, TJA1145_MODE_CTRL, TJA1145_MODE_CTRL_MC,
> > +				 TJA1145_MODE_CTRL_NORMAL);
> > +	if (ret)
> > +		return ret;
> > +
> > +	/*
> > +	 * Switch to CAN operating mode active where the PHY can transmit and
> > +	 * receive data.
> > +	 */
> > +	return regmap_update_bits(map, TJA1145_CAN_CTRL, TJA1145_CAN_CTRL_CMC,
> > +				  TJA1145_CAN_CTRL_ACTIVE);
> > +}
> 
> [Severity: Medium]
> If the second regmap_update_bits call fails to set TJA1145_CAN_CTRL, does
> this leave the hardware in normal mode without reverting to standby?
> 
> Because tja1145_phy_power_on would return an error here, the PHY framework
> will not consider the PHY powered on and will not invoke
> tja1145_phy_power_off later. Could this result in the hardware being
> permanently left in a higher-power state?
> 
> Should the driver intercept this error and attempt to roll back
> TJA1145_MODE_CTRL to TJA1145_MODE_CTRL_STBY before returning?
> 
> -- 
> Sashiko AI review · https://sashiko.dev/#/patchset/20260602-tja1145-support-v6-0-0e0ffc8ee63d@liebherr.com?part=2
> 
