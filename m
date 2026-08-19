Received: from mail-wm1-f54.google.com (mail-wm1-f54.google.com [209.85.128.54])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D34D82773CA
	for <sashiko-reviews@lists.linux.dev>; Wed, 19 Aug 2026 22:32:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.54
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787178746; cv=none; b=FS08HQ2zbLEsoTwhwXpwS5MBWe5tg4e6d4K+/mfmorz/w590J6XbT1iHV7YRqrk49NgqdK+2f0EN6XWgWYdUiXe4nWIOGbHGxhVHwOQNENJJc1nJd60AIUsOU5q2fSG04+2ExEXHIoJ7nt68+wnt+lvyV7XiYFNnEcHLy87yExg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787178746; c=relaxed/simple;
	bh=LokY7ZV5PcRkI+aeUAzFv5UxuFJO74rA/6mazHkhdcc=;
	h=Message-ID:Date:From:To:Cc:Subject:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=C1/ixQDih4ZOr7iGM2qvnHT0x7F7O63kmL9ZjaYG6gBC73ksAG8OEJw/8B/PGXYyc/q3QO6ySAe2L+IAlU+dmqK/OxmzsPhncxHVqpkqOf+pS6BRZj/QhEqrhZu+f/rhraKqZf5D0WOPwa5heM5vbkuJVmunDadHTAOriUlrICw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=qBgnyBVS; arc=none smtp.client-ip=209.85.128.54
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="qBgnyBVS"
Received: by mail-wm1-f54.google.com with SMTP id 5b1f17b1804b1-4995b0343c1so14461055e9.3
        for <sashiko-reviews@lists.linux.dev>; Wed, 19 Aug 2026 15:32:22 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1787178740; x=1787783540; darn=lists.linux.dev;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :content-type:mime-version:references:subject:cc:to:from:date
         :message-id:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=WzNQMJ+ws1+nniHlWi5ZWmVgaLJuM4kR6WvKxeZk5HU=;
        b=qBgnyBVSiBwYMikna0KqELjdcUSNcHWQIm+jHOGL/KXos3M/nAdDCAs0ABCQTz7vwJ
         YQdddMfpi/b4ccDgYXCUmuFvu9BEU/4JqQKMCG4B7pCML2tpYvLT3dbrZ4uvZERfTu4B
         Rj81CnnhqvCnN44j961d8cVCeEuSCblYv4Vd8+2x4QXFGydz3smfTwBXU/2ycdNRJhAY
         9fb/tB0X7bnVbdw/XpFu6BoCe/NMQH1xUFwolpg0C9JscUcg8ijaliNS0OZtNQVSnkEW
         z9o1hQ5udhKIN3u/m3M55ubJ1P0DXdyESmqXHkZeAltKy3oWYPSb2T0cJWfHpYemyl4Y
         AVKA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1787178740; x=1787783540;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :content-type:mime-version:references:subject:cc:to:from:date
         :message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=WzNQMJ+ws1+nniHlWi5ZWmVgaLJuM4kR6WvKxeZk5HU=;
        b=h40/OXZi3QwDOYfcpV41wxwiemP7a1gQXtqBrxe43ZWiXt5Sy4KH+eHggOmnTF8umV
         empj/o9K9kqtUu4L/UqF+Hkz9TGoifNtU+bQw6LFI45vzLkwfArKd3nrcAQcpsAGxO7W
         l3IIQIjuYnpE+2XCM/kVzBJwH4e5fBLIB/dba7KRYuLp8xyxxEyYdQXE4jEpeW6MpvQn
         Gx95GxVRSiurjQPg4IEEMd40wMplXYw5LhjcYZkopoFZPIVNlGrb8L5CkIoFBBbHp/XK
         6iZ7Hrqed9dJKWb5GyJjreHBjjQmIXze0iDb5Iln7yWXhrWy1bJxh/r5QH4VYdLVNrJV
         7kQQ==
X-Gm-Message-State: AOJu0Yyx+5f0HnpHuQvJdxRBqP07oHg0slaR3+9RspXp+jLrFJyl2CXP
	ftdiOAozbWXcuiCroFft+1hfT6nWMT9XBzy/2sjn+MEvOCBmSad2O4fJKICnvgl3
X-Gm-Gg: AR+sD10YjC3+7Iz0P7e+8p3jla7IyabUxvg1YuRwA/zHUOTqJCKcNYwOnxuvzpUDJRB
	YZ6Gmv24QIf5HwBy2KnIMdu1ADpYUn2Hn+/BVOWvYk0OwsRvIwJ1AGM3Zu6XjEPb2HsziCOqZMS
	mf9Qoxf3Y5uXCx46acpkygIyCKg8yI5d2gjGjs9b1Hv9BbkfCapdYnqOJFvlT9iZAOCUZmkwlD9
	3HIOSyU4SAiduEsY8ZzXR+tVjyGDoycCOxy3FAGdKP7mx/7R1FnszdeauL8dv8VZnxHiWSVZwdY
	GVuvSGJhDfOOPsNyx4oCwu5bf2cfyjiPdiTbTJpUiP1He1EF0NPzju5L+EkI/mybzXFUnqkf94F
	IXZcGoEbkTnjzw1mndcxmpfu4E4xWtRKctDkzj9IDweIRxgifCLG5LstvofJlsjVj8y2VeKxeU2
	ZKUpeK0j9bOjquXAHwOt308U9u9Zg3SjW4RHzbkybR+ZxVMDru08w2L0edEnqxjNuZPhavBYTo9
	+kN0HTynN2Xsua3VwSQ/SOlKj1jEbt8Y3VwhQ==
X-Received: by 2002:a05:600c:4f87:b0:499:7219:122f with SMTP id 5b1f17b1804b1-499aa199590mr123654125e9.4.1787178740502;
        Wed, 19 Aug 2026 15:32:20 -0700 (PDT)
Received: from Ansuel-XPS. (host-213-45-7-219.pool21345.interbusiness.it. [213.45.7.219])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-482b144173csm8416265f8f.6.2026.08.19.15.32.19
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 19 Aug 2026 15:32:20 -0700 (PDT)
Message-ID: <6a862ef4.35b91a9e.11438f.69a9@mx.google.com>
X-Google-Original-Message-ID: <aoYu8QrMTxiI6pct@Ansuel-XPS.>
Date: Thu, 20 Aug 2026 00:32:17 +0200
From: Christian Marangi <ansuelsmth@gmail.com>
To: sashiko-reviews@lists.linux.dev
Cc: linux-clk@vger.kernel.org, robh@kernel.org, conor+dt@kernel.org,
	devicetree@vger.kernel.org
Subject: Re: [PATCH v6 3/3] clk: en7523: add support for Airoha AN7583 clock
References: <20260819221458.30040-1-ansuelsmth@gmail.com>
 <20260819221458.30040-4-ansuelsmth@gmail.com>
 <20260819222743.5044F1F000E9@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: sashiko-reviews@lists.linux.dev
List-Id: <sashiko-reviews.lists.linux.dev>
List-Subscribe: <mailto:sashiko-reviews+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:sashiko-reviews+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20260819222743.5044F1F000E9@smtp.kernel.org>

On Wed, Aug 19, 2026 at 10:27:42PM +0000, sashiko-bot@kernel.org wrote:
> Thank you for your contribution! Sashiko AI review found 5 potential issue(s) to consider:
> 
> New issues:
> - [Critical] The macro `REG_PCIE_HB_RST` is used but never defined, causing a build failure.
> - [High] Requesting PCIC resets on AN7583 causes an out-of-bounds read on the `en7581_rst_ofs` array, leading to undefined hardware behavior or memory corruption.
>

For reference, it seems the bot applied the patch to the wrong branch.
The reported problems from the bot are not valid as those changes were
introduced by the last 2 patch present in linux-next and clk-next.

Code was compiled and tested with those 2 changes included.
 
> Pre-existing issues:
> - [High] Probe error paths cause a use-after-free by mixing `devm_kzalloc` with non-devres `clk_hw_register()` for the PCIe clock.
> - [High] Read-modify-write operations on shared registers in the reset and clock controllers lack spinlocks, causing data races and lost writes.
> - [High] The clock `.disable` callback calls `usleep_range()`, which sleeps while holding an IRQ-disabled spinlock.
> --
> 
> --- Patch [3]: [PATCH v6 3/3] clk: en7523: add support for Airoha AN7583 clock ---
> commit e4983d60cb386b35f51bc20a5f0912039bf92780
> Author: Christian Marangi <ansuelsmth@gmail.com>
> 
> clk: en7523: add support for Airoha AN7583 clock
> 
> Add support for Airoha AN7583 clock and reset.
> 
> Airoha AN7583 SoC have the same register address of EN7581 but implement
> different bits and additional base clocks. Also reset are different with
> the introduction of 2 dedicated MDIO line and drop of some reset lines.
> 
> > diff --git a/drivers/clk/clk-en7523.c b/drivers/clk/clk-en7523.c
> > index 087ff4568124f..493812c683f53 100644
> > --- a/drivers/clk/clk-en7523.c
> > +++ b/drivers/clk/clk-en7523.c
> > @@ -505,6 +646,64 @@ static const u16 en751221_rst_map[] = {
> >  	[EN751221_USB_PHY_P1_RST]	= 3 * RST_NR_PER_BANK + 7,
> >  };
> >  
> > +static const u16 an7583_rst_map[] = {
> > +	/* RST_CTRL2 */
> > +	[AN7583_XPON_PHY_RST]		= 0,
> > +	[AN7583_GPON_OLT_RST]		= 1,
> [ ... ]
> > +	/* RST_PCIC */
> > +	[AN7583_PCIC_PERSTOUT0_RST]	= 2 * RST_NR_PER_BANK + 29,
> > +	[AN7583_PCIC_PERSTOUT1_RST]	= 2 * RST_NR_PER_BANK + 26,
> > +};
> 
> [Severity: High]
> Does this out-of-bounds array access corrupt memory when requesting PCIC resets?
> 
> The an7583_rst_map defines these PCIC resets in bank index 2. 
> 
> When en7581_reset_register() is called later in this patch, it is passed
> the en7581_rst_ofs array:
> 
> 	static const u16 en7581_rst_ofs[] = {
> 		REG_RST_CTRL2,
> 		REG_RST_CTRL1,
> 	};
> 
> Since en7581_rst_ofs only has 2 elements, when en7523_reset_update()
> dynamically calculates the bank index via id / RST_NR_PER_BANK, it evaluates
> to 2. Accessing bank_ofs[2] will read out of bounds.
> 
> [ ... ]
> > +static int an7583_clk_hw_init(struct platform_device *pdev,
> > +			      struct clk_hw_onecell_data *clk_data)
> > +{
> > +	struct device *dev = &pdev->dev;
> > +	struct regmap *map;
> > +	void __iomem *base;
> > +	u32 val;
> > +
> > +	map = syscon_regmap_lookup_by_phandle(dev->of_node, "airoha,chip-scu");
> > +	if (IS_ERR(map))
> > +		return PTR_ERR(map);
> > +
> > +	base = devm_platform_ioremap_resource(pdev, 0);
> > +	if (IS_ERR(base))
> > +		return PTR_ERR(base);
> > +
> > +	en7581_register_clocks(dev, clk_data, map, base);
> 
> [Severity: High]
> This isn't a bug introduced by this patch, but does the probe error path leave
> us with a use-after-free for the PCIe clock?
> 
> In en7523_register_pcie_clk() which is called by en7581_register_clocks(),
> the clk_hw structure is allocated via devm_kzalloc(), but registered with the
> non-devres clk_hw_register():
> 
> 	cg = devm_kzalloc(dev, sizeof(*cg), GFP_KERNEL);
> 	...
> 	if (clk_hw_register(dev, &cg->hw))
> 
> If a subsequent initialization step fails in en7523_clk_probe() (like hw_init 
> returning an error), the driver core automatically frees the memory via devres,
> but the clock framework retains dangling pointers to the freed clk_hw.
> 
> > +
> > +	val = readl(base + REG_RST_CTRL1);
> > +	val |= REG_PCIE_HB_RST;
> 
> [Severity: Critical]
> Will this break the build due to an undefined macro?
> 
> The REG_PCIE_HB_RST macro is not defined anywhere. The existing code seems
> to use REG_RESET_CONTROL_PCIEHB for this bit instead.
> 
> [Severity: High]
> This is a pre-existing issue, but could this unlocked read-modify-write race
> with the reset framework?
> 
> en7523_pci_prepare() modifies REG_RESET_CONTROL1 (0x834) without any locks:
> 
> 	val = readl(np_base + REG_RESET_CONTROL1);
> 	mask = REG_RESET_CONTROL_PCIE1 | REG_RESET_CONTROL_PCIE2 |
> 	       REG_RESET_CONTROL_PCIEHB;
> 	writel(val & ~mask, np_base + REG_RESET_CONTROL1);
> 
> Concurrently, en7523_reset_update() performs an unlocked read-modify-write
> on the same register (REG_RST_CTRL1 is also 0x834):
> 
> 	val = readl(addr);
> 	if (assert)
> 		val |= BIT(id % RST_NR_PER_BANK);
> 	...
> 	writel(val, addr);
> 
> Since .prepare() runs in process context and resets can be triggered by
> other probing devices concurrently, this seems likely to cause lost writes.
> 
> > +	writel(val, base + REG_RST_CTRL1);
> > +	val &= ~REG_PCIE_HB_RST;
> > +	writel(val, base + REG_RST_CTRL1);
> > +
> > +	return en7581_reset_register(dev, base, an7583_rst_map,
> > +				     ARRAY_SIZE(an7583_rst_map),
> > +				     en7581_rst_ofs);
> > +}
> [ ... ]
> > +static const struct en_clk_soc_data an7583_data = {
> > +	.base_clks = an7583_base_clks,
> > +	/* We increment num_clocks by 1 to account for additional PCIe clock */
> > +	.num_clocks = ARRAY_SIZE(an7583_base_clks) + 1,
> > +	.pcie_ops = {
> > +		.is_enabled = en7581_pci_is_enabled,
> > +		.enable = en7581_pci_enable,
> > +		.disable = en7581_pci_disable,
> > +	},
> 
> [Severity: High]
> This isn't a bug introduced by this patch, but does mapping en7581_pci_disable
> to the .disable callback result in sleeping while in an atomic context?
> 
> The core clock framework invokes .disable callbacks with the enable_lock
> spinlock held and hardware interrupts disabled.
> 
> However, en7581_pci_disable() explicitly yields and sleeps:
> 
> 	writel(val & ~mask, np_base + REG_PCI_CONTROL);
> 	usleep_range(1000, 2000);
> 
> Could this cause a scheduling while atomic panic when the PCIe clock is
> disabled?
> 
> > +	.hw_init = an7583_clk_hw_init,
> > +};
> 
> -- 
> Sashiko AI review · https://sashiko.dev/#/patchset/20260819221458.30040-1-ansuelsmth@gmail.com?part=3

-- 
	Ansuel
