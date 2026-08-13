Received: from mail11.truemail.it (mail11.truemail.it [217.194.8.81])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 412004756CA
	for <sashiko-reviews@lists.linux.dev>; Thu, 13 Aug 2026 13:22:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=217.194.8.81
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1786627372; cv=none; b=R4GZ2zi0u/DFYkln7T1rHn+FdgRt4rOyAWpGxhrcUyqmbUmGbyN2ALlldss8sbxGZLfQ3DHqXB2ikwwn+UOOX9+VJ0KKkemxLL+l2S+Qbot5UWHec8xgz3pLM13TmrIeaMOYje/jUzYqOmmizPZKd4U1YqI+Om+Q5dzwHEgl/oI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1786627372; c=relaxed/simple;
	bh=sHmHF6GbWgWoMdkIS5ue/VHmBVPWLG7jf/TesiuQQBo=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=cxliYodVBodc6kAwoQDkhZJ/2TzxcX4A+0M8RYIAs7Va8GR7pn/WJ9HzzH3dXtfaNI9oHS0BBw/COsZjYdGbSjfEU610IC7K7yHJ+NrknFbNuMu6LlUMoMncJzFAT9p9RBxsLOcfJKP7OaE+dbD5HfONQL3azMXjNlX/EYmwDlw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=dolcini.it; spf=pass smtp.mailfrom=dolcini.it; dkim=pass (2048-bit key) header.d=dolcini.it header.i=@dolcini.it header.b=zHVwczGd; arc=none smtp.client-ip=217.194.8.81
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=dolcini.it
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=dolcini.it
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=dolcini.it header.i=@dolcini.it header.b="zHVwczGd"
Received: from francesco-nb (2-224-16-253.ip168.fastwebnet.it [2.224.16.253])
	by mail11.truemail.it (Postfix) with ESMTPA id B4F3B1FA74;
	Thu, 13 Aug 2026 15:22:46 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=dolcini.it;
	s=default; t=1786627367;
	bh=pqlxiuaKNJ2AIUI4/6CA9/N/hM27Rxx3Kill+BVP2pk=; h=From:To:Subject;
	b=zHVwczGdvwHsJOM/oKaGEqWOef2VqMpfDj/de79MNl1XxS15/mq2SwbGUIkVHkpGJ
	 NtPS2OEKLC+epd2w4fRhlozUFsS4iHp2e8zEfuil44AHe/eDwl8x6sm1mYQSQLh2mR
	 5H0cmkr1LMoBGpc4yFCgw5vZKYXOW5iuefEJ1jKPTXOlO9SrzZPBvnvzVz/D300Z8l
	 XOU2sJIfIl8gKa7WFRXmL0uKd+XEE5axyeCUEgHVWoi/5jHQON50D6u2WlutuTPma7
	 7/RtngbBqvqTGqKABJeVzZUcdvtVYI5SXFZeCEPQ/uatpPlmIrrAeG82qk4g3x8dg3
	 61nDfqUNKPsOA==
Date: Thu, 13 Aug 2026 15:22:42 +0200
From: Francesco Dolcini <francesco@dolcini.it>
To: sashiko-reviews@lists.linux.dev, Judith Mendez <jm@ti.com>
Cc: Francesco Dolcini <francesco@dolcini.it>, devicetree@vger.kernel.org,
	robh@kernel.org, conor+dt@kernel.org
Subject: Re: [PATCH v1] arm64: dts: ti: k3-am62-verdin: Set MMC clock pins as
 OUTPUT
Message-ID: <20260813132230.GA63265@francesco-nb>
References: <20260813111238.56892-1-francesco@dolcini.it>
 <20260813112458.BA9481F000E9@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: sashiko-reviews@lists.linux.dev
List-Id: <sashiko-reviews.lists.linux.dev>
List-Subscribe: <mailto:sashiko-reviews+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:sashiko-reviews+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260813112458.BA9481F000E9@smtp.kernel.org>

+Judith

On Thu, Aug 13, 2026 at 11:24:58AM +0000, sashiko-bot@kernel.org wrote:
> Thank you for your contribution! Sashiko AI review found 1 potential issue(s) to consider:
> - [High] Setting MMC clock pins to PIN_OUTPUT disables the receiver (RXACTIVE=0), which breaks the internal clock loopback required by the MMC controller for read operations.
> --
> 
> --- Patch [1]: [PATCH v1] arm64: dts: ti: k3-am62-verdin: Set MMC clock pins as OUTPUT ---
> commit b7e315f9edd8f485234748a2f8e267539b5b0f30
> Author: Francesco Dolcini <francesco.dolcini@toradex.com>
> 
> arm64: dts: ti: k3-am62-verdin: Set MMC clock pins as OUTPUT
> 
> This commit changes the MMC clock pins for the K3 AM62x Verdin module
> from PIN_INPUT to PIN_OUTPUT to match the TRM documentation, effectively
> disabling the receiver (RXACTIVE = 0).
> 
> Link: https://www.ti.com/lit/pdf/spruiv7 Rev. C: Table 12-246. MMCSDi I/O Signals [0]
> 
> > diff --git a/arch/arm64/boot/dts/ti/k3-am62-verdin.dtsi b/arch/arm64/boot/dts/ti/k3-am62-verdin.dtsi
> > index e97b2b047d104..895b1b7dcac71 100644
> > --- a/arch/arm64/boot/dts/ti/k3-am62-verdin.dtsi
> > +++ b/arch/arm64/boot/dts/ti/k3-am62-verdin.dtsi
> > @@ -573,7 +573,7 @@ AM62X_IOPAD(0x15c, PIN_INPUT, 0)  /* (AB22) MDIO0_MDIO */ /* ETH_1_MDIO, SODIMM
> >  	pinctrl_sdhci0: main-mmc0-default-pins {
> >  		pinctrl-single,pins = <
> >  			AM62X_IOPAD(0x220, PIN_INPUT,        0) /*  (Y3) MMC0_CMD  */
> > -			AM62X_IOPAD(0x218, PIN_INPUT,        0) /* (AB1) MMC0_CLK  */
> > +			AM62X_IOPAD(0x218, PIN_OUTPUT,       0) /* (AB1) MMC0_CLK  */
> 
> [Severity: High]
> Does configuring this pin as PIN_OUTPUT disable the receiver (RXACTIVE=0) and
> break the internal clock loopback?
> 
> TI MMC controllers generally rely on this internal clock loopback path to
> synchronize incoming data for read operations. While the TRM documents the
> logical direction of the signal to the external card, disabling the input
> receiver might lead to eMMC read failures and timeouts.

Judith: is sashiko right on this?

Thanks,
Francesco
