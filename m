Received: from vps0.lunn.ch (vps0.lunn.ch [156.67.10.101])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 32B1E515970;
	Tue, 13 Oct 2026 18:08:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=156.67.10.101
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791914938; cv=none; b=qXgP6bbnHCQEh5h18JxgMrCrsL6BnmL1n3aKdyofdFDYTAVQApiE+QcPmqCd4IZkQMQZ8wrZRb38+z0kDSi4EPTzeD4ItT0gUcxSNcmASHEqhRojKc+uSdwhuAfar89RHCi5e1eKlA8guYRT/EzvEpgK56cWgDxUOKMgRu3WREs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791914938; c=relaxed/simple;
	bh=ajqVS35To9kSmN1YMYuT3ceYlljDNzroG3lNSh4VqlY=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=smrZ5BOMQB7azPX4+dSF7JNbMbkr+5ZF54eBCeavWf2fHHJbfOuDs5bfTJYeO5xjXoAobkZ5RTlIYXGNZnA+oE7cEuNs+qXYcqVv2aq1bRZ1bf0EBSQJjlOOQGNqstFSxABocgcIwl3yHsrSoQM3sWaMgXdNjcZ+g/zNZwsgX3s=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=lunn.ch; spf=pass smtp.mailfrom=lunn.ch; dkim=pass (1024-bit key) header.d=lunn.ch header.i=@lunn.ch header.b=aaMgl3Ax; arc=none smtp.client-ip=156.67.10.101
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=lunn.ch
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=lunn.ch
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=lunn.ch header.i=@lunn.ch header.b="aaMgl3Ax"
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=lunn.ch;
	s=20171124; h=In-Reply-To:Content-Disposition:Content-Type:MIME-Version:
	References:Message-ID:Subject:Cc:To:From:Date:From:Sender:Reply-To:Subject:
	Date:Message-ID:To:Cc:MIME-Version:Content-Type:Content-Transfer-Encoding:
	Content-ID:Content-Description:Content-Disposition:In-Reply-To:References;
	bh=IU1T78eCbWyZUQW7m8vr5TOKdpnyuWUre19SSGbiODo=; b=aaMgl3Ax+rJVPTzlpCS+CX2ZDN
	GECWVBcD57zs+f25xxpXb7DmLVeG/J3xp1CoHpTrrWeKqUikMrZoK2T2BOGfpLloCbuItwLU44Q97
	JMtvzW0mjiGTJ2uUa7PUpZ+5OEocnbBu8tfPSPk/qHsTmIuuBG+xEw0fj5jsH10XM6qw=;
Received: from andrew by vps0.lunn.ch with local (Exim 4.94.2)
	(envelope-from <andrew@lunn.ch>)
	id 1xGgvl-00AZbL-BR; Tue, 13 Oct 2026 20:08:53 +0200
Date: Tue, 13 Oct 2026 20:08:53 +0200
From: Andrew Lunn <andrew@lunn.ch>
To: Conor Dooley <conor@kernel.org>
Cc: sashiko-reviews@lists.linux.dev, Xincheng Ji <jixincheng@ultrarisc.com>,
	devicetree@vger.kernel.org, robh@kernel.org, conor+dt@kernel.org
Subject: Re: [PATCH v3 7/7] riscv: dts: ultrarisc: Add Milk-V Titan board
 device tree
Message-ID: <d184f986-7bdd-465b-9ec6-31fe1975aec1@lunn.ch>
References: <20261013-ultrarisc-dts-v3-0-5ff3ebb2a90d@ultrarisc.com>
 <20261013-ultrarisc-dts-v3-7-5ff3ebb2a90d@ultrarisc.com>
 <sashiko-outbox-169511@kernel.org>
 <20261013-siesta-starship-f078a51d2389@spud>
Precedence: bulk
X-Mailing-List: sashiko-reviews@lists.linux.dev
List-Id: <sashiko-reviews.lists.linux.dev>
List-Subscribe: <mailto:sashiko-reviews+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:sashiko-reviews+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20261013-siesta-starship-f078a51d2389@spud>

On Tue, Oct 13, 2026 at 06:34:28PM +0100, Conor Dooley wrote:
> +CC Andrew Lunn <andrew@lunn.ch>
> 
> On Tue, Oct 13, 2026 at 10:31:35AM +0000, sashiko-bot@kernel.org wrote:
> > Thank you for your contribution! Sashiko AI review found 1 potential issue(s) to consider:
> > - [Medium] dts: incorrect RGMII phy-mode causes double clock delay
> > --
> > 
> > commit 471320732fb47362c8b5d5e16472052117a95204
> > Author: Jia Wang <wangjia@ultrarisc.com>
> > 
> > riscv: dts: ultrarisc: Add Milk-V Titan board device tree
> > 
> > This commit introduces the device tree for the Milk-V Titan board, an ITX
> > motherboard based on the UltraRISC DP1000 SoC.
> > 
> > Link: https://milkv.io/docs/titan/overview
> > 
> > > diff --git a/arch/riscv/boot/dts/ultrarisc/dp1000-milkv-titan.dts b/arch/riscv/boot/dts/ultrarisc/dp1000-milkv-titan.dts
> > > new file mode 100644
> > > index 0000000000000..59edd8157221a
> > > --- /dev/null
> > > +++ b/arch/riscv/boot/dts/ultrarisc/dp1000-milkv-titan.dts
> > 
> > [ ... ]
> > 
> > > +&ethernet {
> > > +	phy-handle = <&phy0>;
> > > +	/*
> > > +	 * The PCB does not add RGMII TX or RX clock delays. The DP1000
> > > +	 * integration adds fixed delays in both directions.
> > > +	 */
> > > +	phy-mode = "rgmii-id";

If the PCB does not add delays, rgmii-id is correct. What is important
is how the MAC driver handles this, it needs to mask the value passed
to the PHY. Assuming this has been tested on real hardware, it
probably does.

	 Andrew
