Received: from mail-pj1-f51.google.com (mail-pj1-f51.google.com [209.85.216.51])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C8F0165192
	for <sashiko-reviews@lists.linux.dev>; Sun,  5 Jul 2026 01:59:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.216.51
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783216779; cv=none; b=qG50M0AcEkvwNy0zKhkg6YNkQxhgBGSyfcH974Fwea8iEXf1MySOLk8yeqnz69tin5CPgVbJQIE6hUSrBJsHRkV92W40X9VdqovWgNxGtXe8hWLPE563WdXfiOe/u5qT7kbCLdqkkBAxkFbbXLjbUkvLUm8yYNvdJS0Hd6uiQ5o=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783216779; c=relaxed/simple;
	bh=RyPz/W4S+LCDerhVSe7fYyGIUfWMUnQTAZdvf9wpZ2Y=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=Jp/N+AibEPLEwQDxYHN+3Y9Ar2vIoQM7ZVUkwC7tblWUwJF9cyp2TRxgI1Bfokj4TuO6DCAWTeP2xBJS22yF42MlOWqCpuwUTJfTghE6ZpAVR44ouTpajEZqtxuVy/O6a2qvWSiIl7TfkSs1Uq1kUnDdawxcB/If1nR+sXaTZKo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=TcHHNZYe; arc=none smtp.client-ip=209.85.216.51
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="TcHHNZYe"
Received: by mail-pj1-f51.google.com with SMTP id 98e67ed59e1d1-38511175ad3so145375a91.2
        for <sashiko-reviews@lists.linux.dev>; Sat, 04 Jul 2026 18:59:37 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1783216777; x=1783821577; darn=lists.linux.dev;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date:from:to
         :cc:subject:date:message-id:reply-to;
        bh=Acu2tx9xjRD3YeEyFpnpJ7uZlmuH+RrGw+/Yhe826DM=;
        b=TcHHNZYevAKhTgCUfhlaJ39e/73rjCbk2KcTFiXgSrYusNKgI+KR/gHpZ/8Q44RvIC
         Kq+wifL1rHK62Ym/KaCXa1aFwRaz06TTa5LEI4CgadtwEed6PwDKDJnkF2TVcyEmaZlo
         1vh7uTJvxw/wYLskVM8zU/vPxpZ2PfLlAb4A8Oe/oDYYQfc9YGbTwO+C+IClGJEoCONY
         +PPm2VSBrjUJQJJ6tvi3fmXsgr/K8RBjcL8QFPZN8ObNxDr3kEU/L0GOJqj50wrUMO1P
         3lu0E0fp9vBNGYndEtKKTdyO39WMPALQfm/sc1maGNthTIKUIh5XQtInQFX+lob1mCtO
         QIxw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1783216777; x=1783821577;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=Acu2tx9xjRD3YeEyFpnpJ7uZlmuH+RrGw+/Yhe826DM=;
        b=lFhlfWgbEob17N3IMc4plv1mhOl32r8wPML/eDnyyXe5zktuZWs8D11QBib3ITmG4i
         JtZXqW1NbzRmcmxel5pQ3vi3pBDv1ef2WJC8ZpyWvmTB2l2HRveS7c0FNsSMyeQL2Nu4
         Wht5301jNPaX8l4WHCXaxh0uvfdfkCkR95OIQVH7R+Weomq+4QyQ5W3mMfAiWvzcf5SG
         exuRl9zK9B+h4quXOw7rf4q9z1YisEx8clCKweOY6KRIdNE6D00Mx4MuLd4dWKai3UEz
         1fR29P2o4bo/jlK/HoYUkSuNXuQfk0Oc/wzsQXwddatbfLqIrctXh6ZXvrc7CR61ru+k
         MzYg==
X-Gm-Message-State: AOJu0YyGi8tmaNsOjbi3S8u52a/Ttki3jbmvjRHYEzLq5Wd7pWoQKJzj
	CmIYM8rtZVzCBG5guAQu7m+lNX4pmN9DIbMP/GuVpE4vPi8sRcwtxzgQUEVD631a
X-Gm-Gg: AfdE7ckLbUkJkatEGqdC3by9Rju/Cmnb3GwmyawMOMCafkUrzPa6i8E543UYQdOxXS3
	9+kJLBT0ekBMlBrzcYpV8uNmikL9EVoZp/WxjfUtYR9H/90td8/JakZ063RoN0vZOck8mW/1LnY
	Xx4xm3dZyweYWk5j1CixRYZCgsITlPzwRDWwqaZnrPG6UF/PZibY90Ihf9mUji+Jw6oY3jnoYgg
	xGg4NZik5ICtzwHxPZybZgKnAjL6j76z0LLANzYgYNXsicfrPTcBb/myOLaqvMMdRiLB2++v6nO
	ItfopmafM2luJwvFyfjHy9+AXiroXEGRMo6WIop4CJ30PgLYHVUk/27RVX4W3aMHrgLrcvpJQ9D
	a7a8AYp4psUMjD4ESC9hykLfg0cSm12Ctxo/1bYvolXYjKszrEFXb//N0B0Yn9OYF
X-Received: by 2002:a17:90b:1f8a:b0:381:41e9:32aa with SMTP id 98e67ed59e1d1-382812808d5mr4797300a91.15.1783216777198;
        Sat, 04 Jul 2026 18:59:37 -0700 (PDT)
Received: from localhost ([2001:da8:7001:11::cb])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3809c8c0915sm3074901a91.0.2026.07.04.18.59.36
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 04 Jul 2026 18:59:36 -0700 (PDT)
Date: Sun, 5 Jul 2026 09:59:03 +0800
From: Inochi Amaoto <inochiama@gmail.com>
To: sashiko-reviews@lists.linux.dev, Inochi Amaoto <inochiama@gmail.com>
Cc: linux-phy@lists.infradead.org, vkoul@kernel.org, 
	neil.armstrong@linaro.org, olteanv@gmail.com, robh@kernel.org, conor+dt@kernel.org, 
	devicetree@vger.kernel.org
Subject: Re: [PATCH v2 2/2] phy: spacemit: Add USB3/PCIe comb PHY driver for
 Spacemit K3
Message-ID: <akm5-xLZgFPLKeE4@inochi.infowork>
References: <20260703021024.495433-1-inochiama@gmail.com>
 <20260703021024.495433-3-inochiama@gmail.com>
 <20260703021929.15FDE1F000E9@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: sashiko-reviews@lists.linux.dev
List-Id: <sashiko-reviews.lists.linux.dev>
List-Subscribe: <mailto:sashiko-reviews+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:sashiko-reviews+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20260703021929.15FDE1F000E9@smtp.kernel.org>

On Fri, Jul 03, 2026 at 02:19:28AM +0000, sashiko-bot@kernel.org wrote:
> Thank you for your contribution! Sashiko AI review found 1 potential issue(s) to consider:
> - [High] Hardware register clobbering due to missing read-modify-write operations in PHY initialization.
> --
> 
> commit c71cb5c4ebfcb4fc5aff5c18a7769949e15dae55
> Author: Inochi Amaoto <inochiama@gmail.com>
> 
> phy: spacemit: Add USB3/PCIe comb PHY driver for Spacemit K3
> 
> Adds a USB3/PCIe comb PHY driver for Spacemit K3. The comb PHY requires
> configuring a syscon device for the correct mux configuration and needs
> calibration before usage.
> 
> > diff --git a/drivers/phy/spacemit/phy-k3-common.c b/drivers/phy/spacemit/phy-k3-common.c
> > new file mode 100644
> > index 0000000000000..0b289e63db999
> > --- /dev/null
> > +++ b/drivers/phy/spacemit/phy-k3-common.c
> 
> [ ... ]
> 
> > +	/* Power down 100MHz refclk buffer */
> > +	val = readl(base + PHY_PU_CK_REG);
> > +	val = u32_replace_bits(val, 0, PHY_PU_REFCLK_100);
> > +	writel(val, base + PHY_PU_CK_REG);
> > +
> > +	/* Program PLL REG1 configure the SSC */
> > +	val = FIELD_PREP(PHY_PLL_SSC_MODE, PHY_PLL_SSC_MODE_DOWN_SPREAD1) |
> > +	      FIELD_PREP(PHY_PLL_SSC_DEP_SEL, PHY_PLL_SSC_5000PPM) |
> > +	      FIELD_PREP(PHY_PLL_FREF_SEL, PHY_PLL_FREF_24M);
> > +	writel(val, base + PHY_PLL_REG1);
> 
> [Severity: High]
> Does this completely overwrite PHY_PLL_REG1 and zero out unspecified bits?
> 

No, All the field are filled, so no data is lost.

> Unlike the PCIe initialization path which uses a read-modify-write for this
> register, this direct writel() in k3_usb3phy_init_single() clobbers the
> entire register. Could this cause important default settings or calibration
> values to be lost?
> 
> [ ... ]
> 
> > +	for (i = 0; i < lg->data->lanes; i++) {
> > +		void __iomem *lane_base = lg->base + lg->data->offsets[i];
> > +
> > +		val = readl(lane_base + PCIE_RX_REG1);
> > +		val = u32_replace_bits(val, 0, 0x3);
> > +		writel(val, lane_base + PCIE_RX_REG1);
> > +	}
> > +
> > +	val = readl(phy_base + PHY_PLL_REG2);
> > +	val |= BIT(20);
> > +	writel(val, phy_base + PHY_PLL_REG2);
> > +
> > +	/* The write is needed as clock requires renegotiation */
> > +	val = FIELD_PREP(PCIE_RX_REFCLK_MODE, PCIE_RX_REFCLK_MODE_DRIVER) |
> > +	      PCIE_RX_SEL_TRI_CODE |
> > +	      FIELD_PREP(PCIE_RX_LEGACY, PCIE_RX_LEGACY_DEFAULT);
> > +	writel(val, phy_base + PCIE_RX_REG1);
> 
> [Severity: High]
> Does this clobber the entire PCIE_RX_REG1 register for lane 0?
> 

This also serves as the whole clock. If the phy has two lanes, they share some
data and the data is store at lane 0.

> The preceding loop performs a read-modify-write on PCIE_RX_REG1 for all lanes,
> but this direct writel() on phy_base (which points to lane 0) invalidates
> that previous work and zeroes out any bits not explicitly set here.
> 
> Should this also use a read-modify-write operation to preserve the register
> state?
> 

No, it is not needed, as all the field are filled or it should be zero.

> -- 
> Sashiko AI review · https://sashiko.dev/#/patchset/20260703021024.495433-1-inochiama@gmail.com?part=2
