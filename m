Received: from smtp3-g21.free.fr (smtp3-g21.free.fr [212.27.42.3])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1B9EE3E5A0E;
	Mon, 14 Sep 2026 20:59:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=212.27.42.3
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789419594; cv=none; b=DiaVxydL1AZ2E54xqhGAGoo+yKXK82azDQa8Qg2V5bhSGLe77CGXypU1xdxMgZbPJFV4Iz18C8LgeXMZSQG4Px5tpzvcKx6VZd9RF7cUzsZ7oZ9N426sF5h8tLH+SvxIolztd6u2AbnbN+NjA3QSDozocBbRspSnrQxB18d6oqw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789419594; c=relaxed/simple;
	bh=5kxlidUFCpU0ULPnNoqi4Oj2SDugDDeRksisx15L+fs=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=ckcCRnUq4nkwK2SX4oTQYZS+ymzxm5escgLYJKatGPgf2eWwdlrgPEZEsF7ws217wmplAH/5wKxbnQBuXZFWmgzzL8s5jVJJRKLvpXLBNnIV13qSOPtaBzwuIVAUFxeAkFgVO2TqzIcpTrwWu92AH8Km+bLAeC2ENr5aot0bVu8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=free.fr; spf=pass smtp.mailfrom=free.fr; dkim=pass (2048-bit key) header.d=free.fr header.i=@free.fr header.b=NIQHoxlk; arc=none smtp.client-ip=212.27.42.3
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=free.fr
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=free.fr
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=free.fr header.i=@free.fr header.b="NIQHoxlk"
Received: from l301776.home (unknown [IPv6:2a01:e0a:ac2:22b0:3514:9134:2ea8:d094])
	(Authenticated sender: vjardin@free.fr)
	by smtp3-g21.free.fr (Postfix) with ESMTPSA id 200EF13F879;
	Mon, 14 Sep 2026 22:59:44 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=free.fr;
	s=smtp-20201208; t=1789419590;
	bh=5kxlidUFCpU0ULPnNoqi4Oj2SDugDDeRksisx15L+fs=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=NIQHoxlkAdE05We4kmWYV8nraIak2Ff5y29nmaPQHdG8t6hZOxyV17pu7r8mL8DYl
	 jKyP/RFBfBXhsrkiZYKzyLDseGCr5jpgItMvarlPmmrroy1A57uGjliRxkLUgaSCZ/
	 IDCXJMgHaR39Wh1hDMgG8xrFP0ZoA+zLaei8j8SdwLtm48ztXnoOMudBEUbmtx0Eqz
	 rp+UD9XvBdRMJaX1S9ieCovwY9QoXC9q6iUM8AezqUaihaF2s5POQO0X7ip2teXNIP
	 ptVu5Ki6McgRnW5n8uBJtidRdcAklShpzR1RcpjElapeR82UDQtD30fGc0PGi3QdhC
	 ohxATrfoOHPzw==
Date: Mon, 14 Sep 2026 22:59:43 +0200
From: Vincent Jardin <vjardin@free.fr>
To: Frank Li <Frank.li@oss.nxp.com>
Cc: sashiko-reviews@lists.linux.dev, imx@lists.linux.dev,
	devicetree@vger.kernel.org, robh@kernel.org, conor+dt@kernel.org,
	Frank.Li@kernel.org
Subject: Re: [PATCH v6 3/3] arm64: dts: freescale: add Nodebox v3 CPU Module
Message-ID: <aqhgP3Yy6uGB9RIC@l301776.home>
References: <20260913-for-upstream-nbxv3-dts-v6-0-058566b93ba1@free.fr>
 <20260913-for-upstream-nbxv3-dts-v6-3-058566b93ba1@free.fr>
 <20260913124548.EBB021F000FF@smtp.kernel.org>
 <aqf91XlM-aiX2MXe@SMW015318>
Precedence: bulk
X-Mailing-List: sashiko-reviews@lists.linux.dev
List-Id: <sashiko-reviews.lists.linux.dev>
List-Subscribe: <mailto:sashiko-reviews+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:sashiko-reviews+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <aqf91XlM-aiX2MXe@SMW015318>

Hi Frank,

Le 14/09/26 08:59, Frank Li a écrit :
> > However, the board's strict naming convention uses a '#' or '-b' suffix for
> > active-low signals (e.g., ethsw-reset#, usb01-oc#). The absence of this
> > suffix on ethsw-mdio-en strongly implies it is an active-high signal. If it
> > is active-high, driving it low will erroneously disable the MDIO bus to the
> > Ethernet switch.
> 
> Is it true?

Yes, the polarity is right: the SoC enables the carrier's MDIO level
shifter through an inverting stage, so the shifter is on when the pad is
low.

> > > +&gpio3 {
> > > +	gpio-line-names =
> > > +		"altfn:ec1-txd3", "altfn:ec1-txd2",
> > > +		"altfn:ec1-txd1", "altfn:ec1-txd0",
> > > +		"altfn:ec1-tx-en", "altfn:ec1-gtx-clk",
> > > +		"altfn:ec1-rxd3", "altfn:ec1-rxd2",
> > > +		"altfn:ec1-rxd1", "altfn:ec1-rxd0",
> > > +		"altfn:ec1-rx-clk", "altfn:ec1-rx-dv",
> > > +		"", "",
> > > +		"ptp-refclk-in",
> > > +		"", "", "", "", "", "", "", "",
> > > +		"u1700-zl30733-pps-out",
> > > +		"",
> > > +		"ethsw-mdio-en",
> > > +		"usb01-oc#",	/* USB1_PWRFAULT and USB2_PWRFAULT share one net */
> > > +		"",
> > > +		"usb01-oc#",
> >
> > [Severity: Low]
> > Are these duplicate line names intentional?
> 
> Please fix this small problem.

OK, I'll do it in a v7

Thanks,
  Vincent

> > Sashiko AI review · https://sashiko.dev/#/patchset/20260913-for-upstream-nbxv3-dts-v6-0-058566b93ba1@free.fr?part=3
