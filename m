Received: from metis.whiteo.stw.pengutronix.de (metis.whiteo.stw.pengutronix.de [185.203.201.7])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 105533F8234
	for <sashiko-reviews@lists.linux.dev>; Mon, 27 Jul 2026 10:24:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=185.203.201.7
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785147891; cv=none; b=G72duJCT5kiOwQlvfw9wB4SLHVeKYQnu7Z3GFgdTvjWedKAVUlKTe5Ag+4AHeKt2FNiov41X+O07lKoKCAgH8f8vXlRy5553WREB9VoBOQUJ1yiLC5cYXROtyZUvOP4r93PPAylAgj0Uj+eYCzcxuNFO/inYEWB0LcQONHJGtuA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785147891; c=relaxed/simple;
	bh=QHZkYOCLI3MmD2TcDsqKhL+BwwiIv9+8j8ch+TNHBEo=;
	h=From:To:Cc:Subject:In-Reply-To:References:Date:Message-ID:
	 MIME-Version:Content-Type; b=X1F92LwL6iW5L6xu4VC+kdmaeRnC0Mgw4vdCgWJysH1pNF2Hfc96XoBlQAIUqeRWDjEfZ/K7eC/h02EG3xUovnVmqtrUPfEN2+nDZWIWIMeFaQhmctqAqMpralac5fbo9U4afALnxpWtLz1GaqpjTx2bPNxzPFn64ZZXf6clYn0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=pengutronix.de; spf=pass smtp.mailfrom=pengutronix.de; arc=none smtp.client-ip=185.203.201.7
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=pengutronix.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=pengutronix.de
Received: from ptz.office.stw.pengutronix.de ([2a0a:edc0:0:900:1d::77] helo=ratatoskr.pengutronix.de)
	by metis.whiteo.stw.pengutronix.de with esmtp (Exim 4.92)
	(envelope-from <s.trumtrar@pengutronix.de>)
	id 1woIVV-0001va-3k; Mon, 27 Jul 2026 12:24:25 +0200
From: Steffen Trumtrar <s.trumtrar@pengutronix.de>
To: sashiko-bot@kernel.org
Cc: sashiko-reviews@lists.linux.dev,  Frank.Li@kernel.org,
  devicetree@vger.kernel.org,  imx@lists.linux.dev,  conor+dt@kernel.org,
  robh@kernel.org
Subject: Re: [PATCH v6 5/5] arm64: dts: imx8mp-skov: support new 7inch panel
 board
In-Reply-To: <20260727101553.8867E1F00A3A@smtp.kernel.org>
	(sashiko-bot@kernel.org's message of "Mon, 27 Jul 2026 10:15:53
	+0000")
References: <20260727-v7-0-topic-imx8mp-skov-dts-jutouch-7inch-v6-0-fa8f71dfc56f@pengutronix.de>
	<20260727-v7-0-topic-imx8mp-skov-dts-jutouch-7inch-v6-5-fa8f71dfc56f@pengutronix.de>
	<20260727101553.8867E1F00A3A@smtp.kernel.org>
User-Agent: mu4e 1.14.2; emacs 30.2
Date: Mon, 27 Jul 2026 12:24:24 +0200
Message-ID: <874ihkenmv.fsf@pengutronix.de>
Precedence: bulk
X-Mailing-List: sashiko-reviews@lists.linux.dev
List-Id: <sashiko-reviews.lists.linux.dev>
List-Subscribe: <mailto:sashiko-reviews+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:sashiko-reviews+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; format=flowed
X-SA-Exim-Connect-IP: 2a0a:edc0:0:900:1d::77
X-SA-Exim-Mail-From: s.trumtrar@pengutronix.de
X-SA-Exim-Scanned: No (on metis.whiteo.stw.pengutronix.de); SAEximRunCond expanded to false
X-PTX-Original-Recipient: sashiko-reviews@lists.linux.dev

On 2026-07-27 at 10:15 GMT, sashiko-bot@kernel.org wrote:

> Thank you for your contribution! Sashiko AI review found 1 potential issue(s) to consider:
> - [Medium] Missing touch controller node in the device tree overlay.

Meh, missed this while converting. I'll wait before sending the next version before I start spamming.

> --
> 
> --- Patch [5]: [PATCH v6 5/5] arm64: dts: imx8mp-skov: support new 7inch panel board ---
> commit bd24f58ff22bbd1df246534579e3ab608027e17c
> Author: Steffen Trumtrar <s.trumtrar@pengutronix.de>
> 
> arm64: dts: imx8mp-skov: support new 7inch panel board
> 
> This commit adds a device tree overlay for the SKOV IMX8MP CPU revC board
> paired with a 7-inch JuTouch JT070TM041 panel. It also updates the Makefile
> to compile the new overlay and device tree binaries.
> 
> [ ... ]
> 
> > diff --git
> > a/arch/arm64/boot/dts/freescale/imx8mp-skov-revc-jutouch-jt070tm041.dtso
> > b/arch/arm64/boot/dts/freescale/imx8mp-skov-revc-jutouch-jt070tm041.dtso
> > new file mode 100644
> > index 0000000000000..20e987b36c53a
> > --- /dev/null
> > +++ b/arch/arm64/boot/dts/freescale/imx8mp-skov-revc-jutouch-jt070tm041.dtso
> > @@ -0,0 +1,39 @@
> > +// SPDX-License-Identifier: (GPL-2.0 OR MIT)
> > +
> > +/dts-v1/;
> > +/plugin/;
> > +
> > +&{/} {
> > +	model = "SKOV IMX8MP CPU revC - JuTouch JT070TM041";
> > +	compatible = "skov,imx8mp-skov-revc-jutouch-jt070tm041", "fsl,imx8mp";
> > +
> > +	panel {
> > +		compatible = "jutouch,jt070tm041";
> > +		backlight = <&backlight>;
> > +		power-supply = <&reg_tft_vcom>;
> > +
> > +		port {
> > +			in_lvds0: endpoint {
> > +				remote-endpoint = <&ldb_lvds_ch0>;
> > +			};
> > +		};
> > +	};
> > +};
> 
> [Severity: Medium]
> The commit message mentions that this board uses a different 7-inch panel
> with a different touch controller. However, there doesn't appear to be a node
> configuring the touch controller itself in this overlay. 
> 
> Is the touch controller hardware configuration missing from this file, or is
> the touchscreen initialization handled outside of this device tree overlay?
> 
> [ ... ]

-- 
Pengutronix e.K.                | Dipl.-Inform. Steffen Trumtrar |
Steuerwalder Str. 21            | https://www.pengutronix.de/    |
31137 Hildesheim, Germany       | Phone: +49-5121-206917-0       |
Amtsgericht Hildesheim, HRA 2686| Fax:   +49-5121-206917-5555    |
