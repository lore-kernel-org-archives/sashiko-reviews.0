Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 97DF223394C
	for <sashiko-reviews@lists.linux.dev>; Wed, 20 May 2026 06:03:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779256998; cv=none; b=OFStRTw/GbROVhzkmZ6sTNyHftM+CBtx9UjRsGwBFAUshMick9b9ILkoiDr7Q7EIz+zWuJv2WJvK8RJXBXDh+Q77mLhLHcxXIK5W0wmgnCCKR8J3u02+gPH/VsDofn/4/w3SzbI7fXpWdpArlto0XQochx0HEf9XdZ9b4C7zCNk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779256998; c=relaxed/simple;
	bh=0rcnCSQDvApHAI6JF/SlP8a8Rh9hz1sOsLqDP/UsSOM=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=RWEQElgZsOe3t3TRUvDnEqFm5x604dbGg1yDv9FG1gxBEKglMfV4VBw39UTc/uh2ZT0xERnINI0opsS7x3+A2dVhafm9dkWQaV7fIUf8Nr9Nx+9ywVyZKnw3ZEw0yGmbRykecTh3izDHTzPriq52tePMib8M4gI9fv2K7agsn6s=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=Mg4kDDvS; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="Mg4kDDvS"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 69B871F000E9;
	Wed, 20 May 2026 06:03:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1779256997;
	bh=6S6hrCruss5LC8K1fgWmaZed670Mf6Bj94w1WWc5rfE=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=Mg4kDDvS8QOvPpc6VWaRHj5BUqX4QE3GXJdlTfrWcxppkjychjo8Ucz7IrowwvDuw
	 ClIWg6bP4t6WaE7iFhPt8KAt1mEhvhKe6CcItEI3i9ySSTvagvZyOSasn8uqnBRRUk
	 a7FIhO9zHih9wUNKwMD0PnKxwvtpmxLAnt8diYv/+cBFAVXQHGn7Yj+WoEELIbdKmx
	 UULsidvs0Xg+ghoQUX6qvEnHf1WUZGuX8gJeNj6dSfBRjMFAid1feOyCLgBtuKF6Wb
	 Q7dVnmhJJFuHiQA9NlnaunjQM9Tl7Wan4kZ0w9rcapEkAkcKElMQPzhHIwNMJwJwMQ
	 jVFwusOJY97tg==
Date: Wed, 20 May 2026 11:33:12 +0530
From: Vinod Koul <vkoul@kernel.org>
To: sashiko-reviews@lists.linux.dev
Cc: neil.armstrong@linaro.org, olteanv@gmail.com,
	linux-phy@lists.infradead.org
Subject: Re: [PATCH] phy: rockchip: inno-usb2: fix missing kernel-doc
Message-ID: <ag1OoAl3ZceAW1Rq@vaman>
References: <20260519110134.282428-1-vkoul@kernel.org>
 <20260519111949.CD491C2BCB3@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: sashiko-reviews@lists.linux.dev
List-Id: <sashiko-reviews.lists.linux.dev>
List-Subscribe: <mailto:sashiko-reviews+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:sashiko-reviews+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20260519111949.CD491C2BCB3@smtp.kernel.org>

On 19-05-26, 11:19, sashiko-bot@kernel.org wrote:
> Thank you for your contribution! Sashiko AI review found 2 potential issue(s) to consider:
> - [Low] The commit adds a kernel-doc description for a struct member `clkout_ctl_phy` that does not exist in `struct rockchip_usb2phy_cfg`.
> - [Low] The `Fixes:` tag in the commit message is malformed due to an extraneous trailing double quote.

Thanks for reporting this. fixed.
> --
> 
> commit 532f790b604de504c1843006c2bda7a4bcb6937e
> Author: Vinod Koul <vkoul@kernel.org>
> 
> phy: rockchip: inno-usb2: fix missing kernel-doc
> 
> This commit documents the clkout_ctl_phy variable in the kernel-doc block
> to resolve a missing description warning.
> 
> > Fixes: 2775541de058 ("phy: rockchip: inno-usb2: Add clkout_ctl_phy support")"
> 
> This isn't a bug, but there is an extraneous trailing double quote at the end
> of the Fixes tag.
> 
> > diff --git a/drivers/phy/rockchip/phy-rockchip-inno-usb2.c b/drivers/phy/rockchip/phy-rockchip-inno-usb2.c
> > index 8f4c08e599aa2..a69e7dbe18195 100644
> > --- a/drivers/phy/rockchip/phy-rockchip-inno-usb2.c
> > +++ b/drivers/phy/rockchip/phy-rockchip-inno-usb2.c
> > @@ -171,6 +171,7 @@ struct rockchip_usb2phy_port_cfg {
> >   * @num_ports: specify how many ports that the phy has.
> >   * @phy_tuning: phy default parameters tuning.
> >   * @clkout_ctl: keep on/turn off output clk of phy.
> > + * @clkout_ctl_phy: output clk phy registers
> 
> Is the clkout_ctl_phy field present in the structure definition here?
> 
> If the structure is missing this member, adding the description will
> trigger an excess struct member warning instead.

Ideally right but in this case it add the missing one which should have
been clear from the change log

> 
> >   * @port_cfgs: usb-phy port configurations.
> >   * @chg_det: charger detection registers.
> >   */
> 
> -- 
> Sashiko AI review · https://sashiko.dev/#/patchset/20260519110134.282428-1-vkoul@kernel.org?part=1

-- 
~Vinod
