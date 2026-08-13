Received: from mail11.truemail.it (mail11.truemail.it [217.194.8.81])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 58DB2344DAA
	for <sashiko-reviews@lists.linux.dev>; Thu, 13 Aug 2026 15:47:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=217.194.8.81
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1786636045; cv=none; b=b550SajqYxyO9NizBqiWHlcOoMuLeijPR0sAbidpLrSFzFs/HqiC7sTEcSOoZ8bPYvnm6M+LxKxyfgvL7UiHvGP3xs+b3TsoQKG56O380dTo9/jxsfOis4zhr1gl/7ZiZbju7YQnPYlQzG6KHrRrc5ROppKHWWFEJvx7sDgwBTk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1786636045; c=relaxed/simple;
	bh=1OcuYkzWegJEHdYTQn8BobUolPgE4GIFvcIRNEAu6a0=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=ae4WmM/nMQ3veqHi1UrruFe1/hagraoIlTq+NfH16Eug5MDd6Tq92wlvzCjK8pN4/izlZ2nbZzPIJ1MaBhUX94MM69g6godtUKpKxnGKUVCj2V+2Xa6QstD89ap71PC595tvbcvhAYG8eqtxKWvuJpknRQdGsCPQq3o5GNqKdbc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=dolcini.it; spf=pass smtp.mailfrom=dolcini.it; dkim=pass (2048-bit key) header.d=dolcini.it header.i=@dolcini.it header.b=p/+so57v; arc=none smtp.client-ip=217.194.8.81
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=dolcini.it
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=dolcini.it
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=dolcini.it header.i=@dolcini.it header.b="p/+so57v"
Received: from francesco-nb (2-224-16-253.ip168.fastwebnet.it [2.224.16.253])
	by mail11.truemail.it (Postfix) with ESMTPA id B8C2820B50;
	Thu, 13 Aug 2026 17:47:18 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=dolcini.it;
	s=default; t=1786636039;
	bh=Gbp7L3xqBcmaQDTGtRX5py77lTLzSUpL6PhQHDh/bkU=; h=From:To:Subject;
	b=p/+so57vHZzpzQHH+FvzkPcvMWzJV0IscXQAeiOJ/KMMsqnrcAzqFmSUdyHIPY9bT
	 pyBO2ruo5SFSPE3KAgQIkTgvHYsClrQSOY12/3KWHtQt+Gmud5BkFSNH4db/m4Qlc0
	 HBCR6VNeFCGsE05UyWermmnHiZJfcHCVwHgKO/0I8Tn9QOdm5FwtyN4UiNy0361Ny6
	 6s2OtdG640SkYOQeZWq0msh6iCeMwh9HN3GYouNmYdiSM+p5xyjoFlg2Nqmk5y17ke
	 e6Pj000GGvnyxJHGE4Lnyfx6GxHoZtbqLQA999SaryCZoSNW6ZiO35mukZh9OwPmCA
	 6KLuqyOEKJM/Q==
Date: Thu, 13 Aug 2026 17:47:14 +0200
From: Francesco Dolcini <francesco@dolcini.it>
To: "Mendez, Judith" <jm@ti.com>
Cc: Francesco Dolcini <francesco@dolcini.it>,
	sashiko-reviews@lists.linux.dev, devicetree@vger.kernel.org,
	robh@kernel.org, conor+dt@kernel.org
Subject: Re: [PATCH v1] arm64: dts: ti: k3-am62-verdin: Set MMC clock pins as
 OUTPUT
Message-ID: <20260813154714.GA89702@francesco-nb>
References: <20260813111238.56892-1-francesco@dolcini.it>
 <20260813112458.BA9481F000E9@smtp.kernel.org>
 <20260813132230.GA63265@francesco-nb>
 <278014b0-cc23-407b-ad13-6e6860d8564e@ti.com>
Precedence: bulk
X-Mailing-List: sashiko-reviews@lists.linux.dev
List-Id: <sashiko-reviews.lists.linux.dev>
List-Subscribe: <mailto:sashiko-reviews+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:sashiko-reviews+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <278014b0-cc23-407b-ad13-6e6860d8564e@ti.com>

On Thu, Aug 13, 2026 at 10:45:35AM -0500, Mendez, Judith wrote:
> Hi Francesco,
> 
> On 8/13/2026 8:22 AM, Francesco Dolcini wrote:
> > +Judith
> > 
> > On Thu, Aug 13, 2026 at 11:24:58AM +0000, sashiko-bot@kernel.org wrote:
> > > Thank you for your contribution! Sashiko AI review found 1 potential issue(s) to consider:
> > > - [High] Setting MMC clock pins to PIN_OUTPUT disables the receiver (RXACTIVE=0), which breaks the internal clock loopback required by the MMC controller for read operations.
> > > --
> > > 
> > > --- Patch [1]: [PATCH v1] arm64: dts: ti: k3-am62-verdin: Set MMC clock pins as OUTPUT ---
> > > commit b7e315f9edd8f485234748a2f8e267539b5b0f30
> > > Author: Francesco Dolcini <francesco.dolcini@toradex.com>
> > > 
> > > arm64: dts: ti: k3-am62-verdin: Set MMC clock pins as OUTPUT
> > > 
> > > This commit changes the MMC clock pins for the K3 AM62x Verdin module
> > > from PIN_INPUT to PIN_OUTPUT to match the TRM documentation, effectively
> > > disabling the receiver (RXACTIVE = 0).
> > > 
> > > Link: https://www.ti.com/lit/pdf/spruiv7 Rev. C: Table 12-246. MMCSDi I/O Signals [0]
> > > 
> > > > diff --git a/arch/arm64/boot/dts/ti/k3-am62-verdin.dtsi b/arch/arm64/boot/dts/ti/k3-am62-verdin.dtsi
> > > > index e97b2b047d104..895b1b7dcac71 100644
> > > > --- a/arch/arm64/boot/dts/ti/k3-am62-verdin.dtsi
> > > > +++ b/arch/arm64/boot/dts/ti/k3-am62-verdin.dtsi
> > > > @@ -573,7 +573,7 @@ AM62X_IOPAD(0x15c, PIN_INPUT, 0)  /* (AB22) MDIO0_MDIO */ /* ETH_1_MDIO, SODIMM
> > > >   	pinctrl_sdhci0: main-mmc0-default-pins {
> > > >   		pinctrl-single,pins = <
> > > >   			AM62X_IOPAD(0x220, PIN_INPUT,        0) /*  (Y3) MMC0_CMD  */
> > > > -			AM62X_IOPAD(0x218, PIN_INPUT,        0) /* (AB1) MMC0_CLK  */
> > > > +			AM62X_IOPAD(0x218, PIN_OUTPUT,       0) /* (AB1) MMC0_CLK  */
> > > 
> > > [Severity: High]
> > > Does configuring this pin as PIN_OUTPUT disable the receiver (RXACTIVE=0) and
> > > break the internal clock loopback?
> > > 
> > > TI MMC controllers generally rely on this internal clock loopback path to
> > > synchronize incoming data for read operations. While the TRM documents the
> > > logical direction of the signal to the external card, disabling the input
> > > receiver might lead to eMMC read failures and timeouts.
> > 
> > Judith: is sashiko right on this?
> Changing to PIN_OUTPUT should not break anything for you on AM62x based
> board. By default the input buffer for CLK pin is not used, CLKLB input
> buffer is used instead. CLKLB input is already configured for you by
> default, you should not be modifying CLKLB for MMC0 nor MMC1.
> 
> This logic does not apply for MMC2.

What do you mean? that MMC2_CLK should stay as input? 
