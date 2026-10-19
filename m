Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792428756;
	b=k8nLf3gHB4FotGIVUquKDI7rgKiNZZVX3NHigRuDdPTPzvLZI1YqGFKsOSvE6VOAN6nC
	 newL0Lx/dNddODWMORTj0Cpn47Wymd8Mxtc5kqISiH4XAcWC4HUJVQ9wfyVnodUTOZUvM
	 pLgICgfpzob+VrEFiOowYIOK6bJrAQfkOPJZudIvT21HMin9yHGAoso97IJYgOGaws7J0
	 Nc8ReB/iQ3FesikVnbsFIlTVvfiRW+hUZIvv0GsBWqPt30gRr73MSl62nektrVR7HYUbA
	 GPgSkAPRhZzDvDjfKClqODqZ0U8xehbOP7iY2SNzTiOoAIOji1tnAg58b8qmfhjtbVg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792428756;
	h=Received:DKIM-Signature:Date:From:To:Cc:Subject:Message-ID:
	 References:MIME-Version:Content-Type:Content-Disposition:In-Reply-To;
	bh=5rklvj1zn8XL0xuyXWOQrH4Q0kowOc+zGy6APUeTD3c=;
	b=MZktdIjk1ANOdsO31dNhGegymXCVwGdn2yVqvPe11AdBzAtnwlGJ8pmvQt+o1NrEd2hd
	 abGkWeWah/jOzsqDDJ6YDtBz7WgyKGMV4e+aa5PwuurLaEjPXjFhqeZ2Uf0Vp4qwxDq7Q
	 sBKR3KE6MZPxLpDMhHW029aWzN61EK2TVXnIPVzuWZPC3FqCuJprPZzY0x5uOBuHBSheC
	 ur83PwlWCocZbaqmEO1xlOBPd/SlKRiL9vwYZ4Aa47FWTgNVOZuRLviOahSkq88L0kgpI
	 SDGEMNkB3s2PKE/LlMeZDro82/0vYPvtboFcyMHa8TmhMJZ47GcKXbjbUdepYT1LZMg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b="bf+MGTc/";
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4998A606A323;
	Mon, 19 Oct 2026 16:52:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=bf+MGTc/
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 762231F000C5;
	Mon, 19 Oct 2026 16:52:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1792428755;
	bh=5rklvj1zn8XL0xuyXWOQrH4Q0kowOc+zGy6APUeTD3c=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=bf+MGTc/X9PoWxTMus+rhdRZwqYw+eLmT2ZOvmNKryhhTqNSM8Mi9v0p9OKcQhvpT
	 XYLp2ZiVdZ+saVO3mNDh+Jrz/NF0JHVeFD/V+++wcvs2nBQxVG4G2N2bveUfdk4VkV
	 HahoERqh5eSaGqC2QWZtACVGu5edukqfBU8HmUTJ2DetUdfE4MY2rgKsPFSbGojq3H
	 wT+jJSpBfn2Uv8djAVqOZv5S9XXkJVonpUaAyhZJuVh6jiO8eT3curNsSbIgnFER+h
	 4hcYhxUFT2mKmtAY+DvihFdijSNgxOxvhonTXTSnjll8eTJWWDNQwxZPiTysErYTDi
	 +F6thAX3Ocscg==
Date: Mon, 19 Oct 2026 17:52:31 +0100
From: Lee Jones <lee@kernel.org>
To: Christian Marangi <ansuelsmth@gmail.com>
Cc: sashiko-reviews@lists.linux.dev, mfd@lists.linux.dev,
	conor+dt@kernel.org, devicetree@vger.kernel.org, robh@kernel.org
Subject: Re: [PATCH net-next v25 04/10] mfd: an8855: Add support for Airoha
 AN8855 Switch
Message-ID: <20261019165231.GJ2663669@google.com>
References: <20261009161102.38961-1-ansuelsmth@gmail.com>
 <20261009161102.38961-5-ansuelsmth@gmail.com>
 <sashiko-outbox-166721@kernel.org>
 <6acccc4e.4c22a69b.132624.271f@mx.google.com>
 <20261019164430.GI2663669@google.com>
 <6ad64981.198a47d7.3d6d5a.6d01@mx.google.com>
X-Mailing-List: sashiko-reviews@lists.linux.dev
List-Id: <sashiko-reviews.lists.linux.dev>
List-Post: <mailto:sashiko-reviews@lists.linux.dev>
List-Help: <mailto:sashiko-reviews+help@lists.linux.dev>
List-Subscribe: <mailto:sashiko-reviews+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:sashiko-reviews+unsubscribe@lists.linux.dev>
List-Owner: <mailto:sashiko-reviews+owner@lists.linux.dev>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <6ad64981.198a47d7.3d6d5a.6d01@mx.google.com>

On Mon, 19 Oct 2026, Christian Marangi wrote:

> On Mon, Oct 19, 2026 at 05:44:30PM +0100, Lee Jones wrote:
> > On Mon, 12 Oct 2026, Christian Marangi wrote:
> > 
> > > On Sat, Oct 10, 2026 at 04:11:40PM +0000, sashiko-bot@kernel.org wrote:
> > > > Thank you for your contribution! Sashiko AI review found 2 potential issue(s) to consider:
> > > > - [Medium] mfd: overlapping regmap readable ranges for General Purpose and GPU timers
> > > > - [Low] mfd: structure and variable naming violates MFD API guidelines
> > > > --
> > > > 
> > > > commit 05d4dc95b969f0fcf66d11398aafad3e7eb7c7f1
> > > > Author: Christian Marangi <ansuelsmth@gmail.com>
> > > > 
> > > > mfd: an8855: Add support for Airoha AN8855 Switch
> > > > 
> > > > This commit adds support for the Airoha AN8855 Switch which provides
> > > > a DSA switch and a NVMEM provider. It utilizes the mdio-regmap driver
> > > > and registers a regmap for each internal PHY.
> > > > 
> > > > > diff --git a/drivers/mfd/airoha-an8855.c b/drivers/mfd/airoha-an8855.c
> > > > > new file mode 100644
> > > > > index 0000000000000..a2778511dfefc
> > > > > --- /dev/null
> > > > > +++ b/drivers/mfd/airoha-an8855.c
> > > > [ ... ]
> > > > > +static const struct regmap_range an8855_readable_ranges[] = {
> > > > [ ... ]
> > > > > +	regmap_reg_range(0x10009000, 0x10009fff), /* PDMA */
> > > > > +	regmap_reg_range(0x1000a100, 0x1000a2ff), /* General Purpose Timer */
> > > > > +	regmap_reg_range(0x1000a200, 0x1000a2ff), /* GPU timer */
> > > > 
> > > > [Severity: Medium]
> > > > Is this range definition correct? The General Purpose Timer range
> > > > (0x1000a100 to 0x1000a2ff) fully overlaps with the GPU timer range
> > > > (0x1000a200 to 0x1000a2ff).
> > > > 
> > > > Could this be a typo in the hardware memory map definition? It seems like
> > > > the General Purpose Timer range might have been intended to end at
> > > > 0x1000a1ff to avoid overlapping and potential register access boundary
> > > > issues.
> > > 
> > > I have to double check this from documentation, but if possible I would
> > > like to fix this with a followup patch.
> > >  
> > > > [ ... ]
> > > > > +static int an8855_core_probe(struct mdio_device *mdiodev)
> > > > > +{
> > > > > +	struct an8855_phy_bus phy_bus_infos[AN8855_MAX_PHY_PORT] = { };
> > > > > +	struct device *dev = &mdiodev->dev;
> > > > > +	struct an8855_core *priv;
> > > > > +	struct regmap *regmap;
> > > > > +	int num_phys;
> > > > > +	int i, ret;
> > > > > +
> > > > > +	priv = devm_kzalloc(dev, sizeof(*priv), GFP_KERNEL);
> > > > 
> > > > [Severity: Low]
> > > > This isn't a bug, but does this variable and structure naming align with MFD
> > > > subsystem conventions?
> > > > 
> > > > The MFD guidelines suggest avoiding generic variable names like priv, and
> > > > instead recommend using ddata for the instance variable. Also, should the
> > > > struct name itself avoid hardcoding implementation details like core?
> > > > Naming it something closer to struct an8855 might better adhere to the
> > > > subsystem guidelines.
> > > > 
> > > 
> > > I already updated the struct, is it needed to also update the local
> > > variables?
> > 
> > Ah, I was just about to apply this!
> > 
> > This would be preferred:
> > 
> >   struct an8855 *ddata;
> >
> 
> Ahhhhhh! You got me!
> 
> Do you think there might be a faster method to submit this so I can quickly
> rename the variable and you can pick it? 

Is everything else ready to go?

BTW, there is no rush on this - I'm done for v7.4-rc1.

-- 
Lee Jones
