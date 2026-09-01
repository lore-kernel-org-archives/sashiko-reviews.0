Received: from mail-wr1-f53.google.com (mail-wr1-f53.google.com [209.85.221.53])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8D3C5432E60
	for <sashiko-reviews@lists.linux.dev>; Tue,  1 Sep 2026 13:24:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.53
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788269092; cv=none; b=RyqQphWyuZb4cHVxwgCXb/4szXZwmUclS0LHZ2SN05tORltpLQLOLM6PwILfiEukgR0pkLtmiBbx193SfNbsw0Lzm/0F2RFQqtNFnRhcc2ibvz547LAh9vSf927eR7ITBk4C40RkRp/cAKMCOZ3o99EVX1XHLxEbd7kAFmn45Js=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788269092; c=relaxed/simple;
	bh=7RowtOhKqbexAjOEL02LIVeK+vQijmd6QcKwhHcMxm8=;
	h=Message-ID:Date:From:To:Cc:Subject:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=BJMIDSPBG0BklH6qmu7AAWfSXiKWD+tSCsdDHZqsqpTWP9mJSHA1zUI3HVkuOKgPLjsKhnxdLBMSUEFfcrtgoIFm22beZRT2UqRqTNOaOEa4Y8qIkrolp74ixblfS9Jzh5Hfl5dZrlUDIt6vMkX+SH40PebPE3LWQP+aW3s97fU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=bxGMRKgZ; arc=none smtp.client-ip=209.85.221.53
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="bxGMRKgZ"
Received: by mail-wr1-f53.google.com with SMTP id ffacd0b85a97d-4843e397f74so975480f8f.1
        for <sashiko-reviews@lists.linux.dev>; Tue, 01 Sep 2026 06:24:50 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1788269089; x=1788873889; darn=lists.linux.dev;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:subject:cc:to:from:date:message-id:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=m9s+pEoGrG4HFANGtdOnl/hc5uhb6frTfUBLBjF9eG0=;
        b=bxGMRKgZg1no1bUVzZiRsF5rn22DMuYeCzXHXbhB8RuifjC2B4L7XxRgKxHF5ctgRk
         Yw7Q9aAPNcGTTsMjltZhMRg9bE9bZ1gnUKyROtiszL3m5Edjdq1pjOi/ay1jq5DFOJtZ
         G9AVB+nI2meDUSLBi4BfNsjgZmPQs/RDq6jEaLphi8H2LBrNVMfW0fOPPYSuQpOZPAS8
         2YD2OVBkzxRa6UfQKGBC3NW/rpV92FV4Edi+xFFce2mxphTNPK8YRluFJaZ63axkgY5g
         7dPX/7vZpL0j31MVzI/tyozmLz/NdemOIFNGGQ07945VJyquu44AkwHQ4Zn/8ZcL3qbF
         eEXA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788269089; x=1788873889;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:subject:cc:to:from:date:message-id:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=m9s+pEoGrG4HFANGtdOnl/hc5uhb6frTfUBLBjF9eG0=;
        b=PHu4jaqvON0BKhxBhnGk5SOzBN1/aE8rVDw6QzrJtqlTHOw6igUUSfVQ/PqhoqHxVs
         j3wBGdrSt8IWIXcUgT1Zp7Ut5DspNmwVSkycwBBBzpwUO5PvVUF9Znu/xCNxmiFugHb3
         QZvc514uW5jBHUI7g3ZNhF2zqjFcm6UI4vRqkjA4xJLzOwAPGF4qRkWa7bWxDAiltdon
         OtilFRBZHuKkLl/PhQAYkDeVAv2CywMPRnOZteqRYMRmX7hUS+4IdLftyDdJDEKiNCAV
         dCKbl/3gaSbMg2YIgbNRMiC+5HSReqLgOJaU8IPQmFaIgmETc+t3DUAjrM22l8QZlrna
         WEMw==
X-Gm-Message-State: AFuF++krdDZydOn7y00tCpGbLUrwpp4G2PxlehZkqvr9ne3QQaVB1plm
	k2lnz7LpNZ/H72GCmluBmGozFuWxsGjWU/LTGXm9oIQE8IzIfDWwcSVX/5pADdIV
X-Gm-Gg: AYBFou0H5rTi4M/e2CxwGHJTv8wqDDJYDE14O/AGP1qZtQV6tHBJoKpIhgetEu6JAty
	mrEUTyedb7uCTDl2CgXLp3CLQIVeGzKb1UDpZywpFvYCoeCuyEFZBt/daGqDwauShtPvxgWrj0D
	uCeJknisB9sE+htRdkYeBLFvUOJ24vq6QHlSq+nyfsvYVG7bR9sq3LOpDbgUDI7u/eSmgxNwUBJ
	odOMDJFFfY9NsNRvTNocooUIna1velcLO653ExnVrx6ZLz+QyDtI8Xm1gncLYY0eqNbFcubKyMz
	skGGTdjpTCTJl2heo/QPS5jrGF21+UAsANbmpEENED8jVZMcwyNqTrFge2grJlR7BUu/U6sjdnd
	alnVs5+R+3l/Upp8tmIxhYuYCen2gtwhCojDWUxCAhXBMqI5scClKALblAChE8CzVsoVp5gbcey
	RvUdFmkt1dwv0/xNX2Xhkt6qzMZ0n6Xlp/PCWENxZKFWW8IfwmxGYzBYNQXNRUP19AjLqAbIQeu
	zI81LLjldC8Dvehu8TRHlAmnYx/BYphSQw=
X-Received: by 2002:a05:6000:4549:b0:475:da0e:744d with SMTP id ffacd0b85a97d-48441fcbc51mr7324639f8f.8.1788269088492;
        Tue, 01 Sep 2026 06:24:48 -0700 (PDT)
Received: from Ansuel-XPS. (host-79-26-252-140.retail.telecomitalia.it. [79.26.252.140])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-48442d7e452sm4638242f8f.35.2026.09.01.06.24.47
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 01 Sep 2026 06:24:48 -0700 (PDT)
Message-ID: <6a96d220.5fb1dcdd.280708.47d5@mx.google.com>
X-Google-Original-Message-ID: <apbSGVNOYn15F6Cr@Ansuel-XPS.>
Date: Tue, 1 Sep 2026 15:24:41 +0200
From: Christian Marangi <ansuelsmth@gmail.com>
To: sashiko-reviews@lists.linux.dev
Cc: robh@kernel.org, linux-phy@lists.infradead.org,
	neil.armstrong@linaro.org, devicetree@vger.kernel.org,
	conor+dt@kernel.org, vkoul@kernel.org, olteanv@gmail.com
Subject: Re: [PATCH v4 3/3] phy: airoha: Add support for Airoha AN7583 USB PHY
References: <20260901123933.15388-1-ansuelsmth@gmail.com>
 <20260901123933.15388-4-ansuelsmth@gmail.com>
 <20260901125344.46F841F000E9@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: sashiko-reviews@lists.linux.dev
List-Id: <sashiko-reviews.lists.linux.dev>
List-Subscribe: <mailto:sashiko-reviews+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:sashiko-reviews+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260901125344.46F841F000E9@smtp.kernel.org>

On Tue, Sep 01, 2026 at 12:53:43PM +0000, sashiko-bot@kernel.org wrote:
> Thank you for your contribution! Sashiko AI review found 6 potential issue(s) to consider:
> - [High] Failure to propagate PHY lifecycle calls to the underlying SerDes PHY
> - [High] USB PHY instances are inaccessible due to incorrect PHY provider registration
> - [Medium] Use of uninitialized stack variable due to missing regmap_read return check
> - [Medium] Lockdep warning due to recursive locking of phy->mutex in set_mode callbacks
> - [Low] Missing select REGMAP_MMIO in Kconfig leading to link-time errors
> - [Low] Missing explicit inclusion of <linux/delay.h>
> --
> 
> commit 78bb8c49d95aeffce30cf8303d7ac8de16f47e67
> Author: Christian Marangi <ansuelsmth@gmail.com>
> 
>     phy: airoha: Add support for Airoha AN7583 USB PHY
>     
>     Add support for USB PHY for Airoha AN7583 SoC, this share some U2 init
>     from AN7581 but use a totally different init phase for PLL and
>     calibration for U3. Also on AN7583 there is a single USB PHY that init 2
>     U2 port and one U3 port. (the USB controller expose 2 hub, one with 2
>     usb 2.0 port and one with one 3.0 port)
>     
>     A second USB PHY is used for PCIe Gen2 controller and follow the same
>     calibration and setup logic of USB.
> 
> > diff --git a/drivers/phy/airoha/Kconfig b/drivers/phy/airoha/Kconfig
> > new file mode 100644
> > index 0000000000000..13e49ff947e3e
> > --- /dev/null
> > +++ b/drivers/phy/airoha/Kconfig
> > @@ -0,0 +1,11 @@
> > +# SPDX-License-Identifier: GPL-2.0-only
> > +
> > +config PHY_AIROHA_AN7583_USB
> > +	tristate "Airoha AN7583 USB PHY Driver"
> > +	depends on ARCH_AIROHA || COMPILE_TEST
> > +	depends on OF
> > +	select GENERIC_PHY
> 
> [Severity: Low]
> Is a select for REGMAP_MMIO missing here? If COMPILE_TEST is enabled and no
> other driver implicitly selects REGMAP_MMIO, couldn't this cause a link-time
> error due to an undefined reference to __devm_regmap_init_mmio_clk?
> 
> > +	help
> > +	  Say 'Y' here to add support for Airoha AN7583 USB PHY driver.
> 
> > diff --git a/drivers/phy/airoha/phy-an7583-usb.c b/drivers/phy/airoha/phy-an7583-usb.c
> > new file mode 100644
> > index 0000000000000..46b5f09582cfd
> > --- /dev/null
> > +++ b/drivers/phy/airoha/phy-an7583-usb.c
> > @@ -0,0 +1,2023 @@
> > +// SPDX-License-Identifier: GPL-2.0
> > +/*
> > + * Author: Christian Marangi <ansuelsmth@gmail.com>
> > + */
> > +
> > +#include <dt-bindings/phy/phy.h>
> > +#include <linux/bitfield.h>
> > +#include <linux/math.h>
> > +#include <linux/module.h>
> > +#include <linux/phy.h>
> > +#include <linux/phy/phy.h>
> > +#include <linux/platform_device.h>
> > +#include <linux/regmap.h>
> > +#include <linux/mfd/syscon.h>
> 
> [Severity: Low]
> Does this code rely on linux/delay.h for mdelay() and usleep_range() without
> including it? This could lead to compilation failures on architectures or
> configurations where it isn't implicitly included by other headers.
> 
> [ ... ]
> 
> > +static bool an7583_usb_phy_u3_kband_is_calibrated(struct an7583_usb_phy_priv *priv)
> > +{
> > +	u32 val, res;
> 
> [ ... ]
> 
> > +	regmap_read(priv->regs[AIROHA_USB_PHY_PMA],
> > +		    AIROHA_USB_PMA_INTF_STS_9, &val);
> > +	res = FIELD_GET(AIROHA_USB_PMA_ADDR_INTF_STS_PLL_VCOCAL, val) << 4;
> 
> [Severity: Medium]
> If the regmap_read() fails, wouldn't the uninitialized stack variable val be
> accessed here? Could this result in undefined behavior and potentially bypass
> the KBand calibration loop?
> 
> [ ... ]
> 
> > +static int an7583_usb_phy_init(struct phy *phy)
> > +{
> > +	struct an7583_usb_phy_instance *instance = phy_get_drvdata(phy);
> 
> [Severity: High]
> Does this initialization omit a call to phy_init(instance->serdes_phy)? Since
> the wrapper PHY intercepts the init call, failing to forward it might leave
> the physical SerDes lines uninitialized and the PCIe and USB 3.0 interfaces
> non-functional.
> 
> > +
> > +	switch (instance->type) {
> > +	case PHY_TYPE_USB2:
> 
> [ ... ]
> 
> > +static int an7583_usb_phy_power_on(struct phy *phy)
> > +{
> > +	struct an7583_usb_phy_instance *instance = phy_get_drvdata(phy);
> 
> [Severity: High]
> Similarly, does this fail to call phy_power_on(instance->serdes_phy)? This
> seems to leave the physical SerDes disabled when a consumer attempts to power
> on the PHY.
> 
> > +
> > +	switch (instance->type) {
> > +	case PHY_TYPE_USB2:
> 
> [ ... ]
> 
> > +static int an7583_usb_phy_u3_set_mode(struct phy *phy, enum phy_mode mode,
> > +				      int submode)
> > +{
> > +	struct an7583_usb_phy_instance *instance = phy_get_drvdata(phy);
> > +	int ret;
> > +
> > +	switch (mode) {
> 
> [ ... ]
> 
> > +	}
> > +
> > +	ret = phy_set_mode_ext(instance->serdes_phy, mode, submode);
> 
> [Severity: Medium]
> Can this nested call to phy_set_mode_ext() on the child SerDes PHY cause a
> lockdep warning?
> 
> Since the parent PHY's mutex is already held by the framework, and all PHY
> mutexes are initialized with the same lockdep key, this might trigger a
> possible recursive locking deadlock warning. This pattern also appears in
> an7583_usb_phy_pcie_set_mode().
> 
> [ ... ]
> 
> > +static struct phy *an7583_usb_phy_xlate(struct device *dev,
> > +					const struct of_phandle_args *args)
> > +{
> > +	struct an7583_usb_phy_priv *priv = dev_get_drvdata(dev);
> > +	const struct an7583_usb_phy_match_data *data;
> > +	struct device_node *phy_np = args->np;
> > +	struct phy *phy = NULL;
> > +	int type, index;
> > +
> > +	data = of_device_get_match_data(dev);
> > +
> > +	if (args->args_count != 1) {
> > +		dev_err(dev, "invalid number of cells in 'phy' property\n");
> > +		return ERR_PTR(-EINVAL);
> > +	}
> > +
> > +	for (index = 0; index < data->max_instance; index++) {
> > +		if (!priv->phys[index])
> > +			continue;
> > +
> > +		if (phy_np == priv->phys[index]->dev.of_node) {
> > +			phy = priv->phys[index];
> > +			break;
> > +		}
> > +	}
> 
> [ ... ]
> 
> > +static int an7583_usb_phy_probe(struct platform_device *pdev)
> > +{
> 
> [ ... ]
> 
> > +	phy_provider = devm_of_phy_provider_register(dev, an7583_usb_phy_xlate);
> 
> [Severity: High]
> Does this incorrectly isolate the subnodes from the PHY core?
> 
> By registering the provider with devm_of_phy_provider_register(dev, ...)
> instead of using a variant that checks the children tree, the PHY core might
> fail to traverse to the child nodes when looking up the PHY.
> 
> Furthermore, in an7583_usb_phy_xlate(), comparing the parent node (args->np)
> against the child node stored in priv->phys[index]->dev.of_node would
> guarantee a mismatch. Would this make the USB PHY instances completely
> inaccessible to any consumer?
> 

Is AI getting drunk? Aside from the mostly unreadable message, this is
totally non-sense and out of complete speculation.

The scenario pointed out by AI is in the case where a consumer reference
the provider node in DT but this was never suggested and actually an
implementation error of the user writing the device tree.

The Documentation example instruct for USB nodes to put the phy cell in the
child node, NEVER in the provider node. Any kind of phandle will fail as
the correct cell property won't be found. So I'm not really understanding
the error pointed out here.

-- 
	Ansuel
